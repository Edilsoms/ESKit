#!/usr/bin/env python3
"""Gera as units de compatibilidade com nomes do Delphi (Vcl.*, System.*,
Winapi.*, Data.DB) para o Lazarus, a partir das units já compiladas da LCL e
do FPC.

Cada unit gerada reexporta tudo o que a unit original declara na interface:
  - tipos            ->  TForm = Forms.TForm;
  - elementos de enumerações e constantes  ->  poDesigned = Forms.poDesigned;
  - variáveis        ->  var Application: TApplication absolute Forms.Application;
  - rotinas          ->  função inline com o mesmo cabeçalho, chamando a original

Assim, um código Delphi com "uses Vcl.Forms, Vcl.StdCtrls, System.SysUtils"
compila sem trocar os uses. Os cabeçalhos são copiados do código-fonte (a
posição de cada símbolo vem do ppudump), então gere as units com a mesma
versão do Lazarus/FPC em que vai compilar:

  python3 tools/genvclcompat.py --lazarus /caminho/lazarus --fpcsrc /caminho/fpc/source \\
      --ppudump /caminho/ppudump --lclunits /caminho/lcl/units/<cpu-os> \\
      --fpcunits /caminho/fpc/units/<cpu-os>

Requer: ppudump (vem com o FPC) e os fontes da LCL e do FPC.
"""
import argparse
import json
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OUT_DEFAULT = os.path.join(HERE, '..', 'lazarus', 'delphicompat')

# unit do Delphi -> units do Lazarus/FPC reexportadas (na ordem; a última vence)
MAP = {
    'Vcl.Forms': ['Forms'],
    'Vcl.Controls': ['Controls'],
    'Vcl.StdCtrls': ['StdCtrls'],
    'Vcl.ExtCtrls': ['ExtCtrls'],
    'Vcl.Graphics': ['Graphics'],
    'Vcl.Dialogs': ['Dialogs'],
    'Vcl.ComCtrls': ['ComCtrls'],
    'Vcl.Menus': ['Menus'],
    'Vcl.Grids': ['Grids'],
    'Vcl.Buttons': ['Buttons'],
    'Vcl.ImgList': ['ImgList'],
    'Vcl.ActnList': ['ActnList'],
    'Vcl.Clipbrd': ['Clipbrd'],
    'Vcl.CheckLst': ['CheckLst'],
    'Vcl.Mask': ['MaskEdit'],
    'Vcl.Samples.Spin': ['Spin'],
    'Vcl.DBGrids': ['DBGrids'],
    'Vcl.DBCtrls': ['DBCtrls'],
    'Vcl.ExtDlgs': ['ExtDlgs'],
    'Vcl.ValEdit': ['ValEdit'],
    'Vcl.FileCtrl': ['FileCtrl'],
    'Winapi.Windows': ['LCLType', 'LCLIntf'],
    'Winapi.Messages': ['LMessages'],
    'System.SysUtils': ['SysUtils'],
    'System.Classes': ['Classes'],
    'System.Math': ['Math'],
    'System.Types': ['Types'],
    'System.Variants': ['Variants'],
    'System.StrUtils': ['StrUtils'],
    'System.DateUtils': ['DateUtils'],
    'System.TypInfo': ['TypInfo'],
    'System.Contnrs': ['Contnrs'],
    'System.IniFiles': ['IniFiles'],
    'System.SyncObjs': ['SyncObjs'],
    'Data.DB': ['DB'],
}

# nomes que não devem ser reexportados (registro na IDE, internos)
SKIP = {'Register'}
DIRECTIVES_KEEP = {'overload', 'platform'}
DIRECTIVES = {'overload', 'inline', 'deprecated', 'platform', 'experimental', 'cdecl',
              'stdcall', 'register', 'pascal', 'safecall', 'varargs', 'unimplemented',
              'external', 'noreturn', 'static', 'assembler', 'winapi', 'hardfloat',
              'local', 'far', 'near', 'export', 'public', 'nostackframe', 'interrupt',
              'compilerproc', 'internproc', 'rtlproc', 'mwpascal', 'vectorcall',
              'ms_abi_default', 'sysv_abi_default'}


def find_ppu(dirs, unit):
    low = unit.lower() + '.ppu'
    for d in dirs:
        for root, _, files in os.walk(d):
            if low in files:
                return os.path.join(root, low)
    return None


def index_sources(roots):
    idx = {}
    for r in roots:
        for root, dirs, files in os.walk(r):
            # evita as cópias de outras plataformas quando houver a do linux/win
            for f in files:
                if f.lower().endswith(('.pp', '.pas', '.inc')):
                    idx.setdefault(f.lower(), []).append(os.path.join(root, f))
    return idx


PLATFORM_DIRS = ('linux', 'unix', 'bsd', 'darwin', 'freebsd', 'netbsd', 'openbsd', 'win',
                 'win32', 'win64', 'wince', 'go32v2', 'watcom', 'os2', 'emx', 'amiga', 'morphos',
                 'aros', 'atari', 'beos', 'haiku', 'nativent', 'netware', 'netwlibc', 'palmos',
                 'solaris', 'symbian', 'wii', 'android', 'embedded', 'msdos', 'macos', 'msxdos',
                 'qnx', 'aix', 'gba', 'nds', 'freertos', 'wasi', 'sinclairql', 'human68k',
                 'gtk', 'gtk2', 'gtk3', 'qt', 'qt5', 'qt6', 'carbon', 'cocoa', 'customdrawn',
                 'fpgui', 'mui', 'nogui')
HOST = ['linux', 'unix']  # preferência na busca; ajustado pelo TargetOS do ppu
HOST_BY_OS = {'linux': ['linux', 'unix'], 'win64': ['win64', 'win'], 'win32': ['win32', 'win'],
              'darwin': ['darwin', 'bsd', 'unix'], 'freebsd': ['freebsd', 'bsd', 'unix'],
              'openbsd': ['openbsd', 'bsd', 'unix'], 'netbsd': ['netbsd', 'bsd', 'unix']}


def is_platform_path(p):
    parts = p.replace('\\', '/').lower().split('/')
    return any(x in PLATFORM_DIRS for x in parts[-4:-1]) or '/lcl/interfaces/' in p.replace('\\', '/')


def pick_source(idx, name, near):
    cands = idx.get(name.lower(), [])
    if not cands:
        return None

    def score(p):
        parts = p.replace('\\', '/').lower().split('/')
        host = any(x in HOST for x in parts[-4:-1])
        return (not (near and p.startswith(near)), not host and is_platform_path(p), len(p))
    return sorted(cands, key=score)[0]


def portable_unit(idx, unit):
    """Unit disponível em todas as plataformas (fonte fora das pastas de SO)."""
    cands = idx.get(unit.lower() + '.pp', []) + idx.get(unit.lower() + '.pas', [])
    if not cands:
        return True  # unit de pacote (ex.: dentro de packages/...), mantém
    return any(not is_platform_path(c) for c in cands)


def read_lines(path, cache={}):
    if path not in cache:
        with open(path, encoding='utf-8', errors='replace') as fh:
            cache[path] = fh.read().split('\n')
    return cache[path]


def strip_comments(text):
    out, i, n = [], 0, len(text)
    while i < n:
        c = text[i]
        if c == "'":
            j = i + 1
            while j < n and not (text[j] == "'" and (j + 1 >= n or text[j + 1] != "'")):
                j += 2 if text[j] == "'" else 1
            out.append(text[i:j + 1])
            i = j + 1
        elif c == '{':
            j = text.find('}', i)
            i = n if j < 0 else j + 1
            out.append(' ')
        elif text.startswith('(*', i):
            j = text.find('*)', i)
            i = n if j < 0 else j + 2
            out.append(' ')
        elif text.startswith('//', i):
            j = text.find('\n', i)
            i = n if j < 0 else j
        else:
            out.append(c)
            i += 1
    return ''.join(out)


# símbolos de compilação condicional com valor conhecido (iguais em todas as
# plataformas do FPC 3.2)
KNOWN_FALSE = {'fpc_unicode_rtl', 'fpc_rtl_unicode'}


def resolve_known_ifdefs(text):
    def repl(m):
        kind, sym, a, b = m.group(1).lower(), m.group(2).lower(), m.group(3), m.group(5) or ''
        if sym not in KNOWN_FALSE:
            return m.group(0)
        return b if kind == 'ifdef' else a
    return re.sub(r'\{\$(ifdef|ifndef)\s+(\w+)\s*\}(.*?)(\{\$else\}(.*?))?\{\$endif\}', repl,
                  text, flags=re.I | re.S)


def has_directive_before_end(text):
    """Há {$...} antes do ';' que fecha o cabeçalho?"""
    i, n, depth = 0, len(text), 0
    while i < n:
        c = text[i]
        if c == "'":
            j = text.find("'", i + 1)
            i = n if j < 0 else j + 1
            continue
        if c == '{':
            if text.startswith('{$', i):
                return True
            j = text.find('}', i)
            i = n if j < 0 else j + 1
            continue
        if text.startswith('//', i):
            j = text.find('\n', i)
            i = n if j < 0 else j
            continue
        if c == '(':
            depth += 1
        elif c == ')':
            depth -= 1
        elif c == ';' and depth == 0:
            return False
        i += 1
    return False


def extract_header(lines, line, col):
    """Cabeçalho da rotina cujo nome está em (line, col), sem diretivas."""
    first = lines[line - 1]
    m = list(re.finditer(r'\b(function|procedure)\b', first[:col - 1], re.I))
    if not m:
        return None
    src = resolve_known_ifdefs(first[m[-1].start():] + '\n' + '\n'.join(lines[line:line + 40]))
    if has_directive_before_end(src):
        return None  # cabeçalho com compilação condicional: não dá para copiar
    body = strip_comments(src)
    depth = 0
    end = None
    for i, ch in enumerate(body):
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
        elif ch == ';' and depth == 0:
            end = i
            break
    if end is None:
        return None
    header = ' '.join(body[:end].split())
    rest = body[end + 1:]
    directives = []
    while True:
        mm = re.match(r'\s*([A-Za-z_]\w*)', rest)
        if not mm or mm.group(1).lower() not in DIRECTIVES:
            break
        d = mm.group(1).lower()
        k = rest.find(';', mm.end())
        if k < 0:
            break
        if d in DIRECTIVES_KEEP:
            directives.append(d)
        rest = rest[k + 1:]
    return header, directives


def var_type(lines, line, col, name):
    """Tipo de uma variável global: texto entre ':' e ';' (ou '=')."""
    body = strip_comments('\n'.join(lines[line - 1:line + 5])[col - 1:])
    m = re.match(r'\s*' + re.escape(name) + r'\s*(?:,\s*\w+\s*)*:\s*(.+?)\s*(?:=[^;]*)?;', body, re.S)
    if not m:
        return None
    t = ' '.join(m.group(1).split())
    if re.search(r'\b(absolute|external|public|cvar)\b', t, re.I):
        t = re.split(r'\b(?:absolute|external|public|cvar)\b', t, flags=re.I)[0].strip()
    return t


def section_of(lines, line):
    """Seção (const, resourcestring, var...) em que está a linha."""
    for i in range(line - 1, -1, -1):
        m = re.match(r'\s{0,2}(const|resourcestring|type|var|threadvar)\b', lines[i], re.I)
        if m:
            return m.group(1).lower()
        if re.match(r'\s*(function|procedure|implementation|interface)\b', lines[i], re.I):
            return None
    return None


def macro_envs(paths):
    """Para cada arquivo incluído com {$i ...}, os macros ({$define X:=Y})
    válidos em cada inclusão, na ordem."""
    envs, env = {}, {}
    for p in paths:
        if not p:
            continue
        for ln in read_lines(p):
            for m in re.finditer(r'\{\$(define|undef|i|include)\s+([^}]*)\}', ln, re.I):
                d, arg = m.group(1).lower(), m.group(2).strip()
                if d == 'define' and ':=' in arg:
                    k, v = arg.split(':=', 1)
                    env[k.strip().lower()] = v.strip()
                elif d == 'undef':
                    env.pop(arg.lower(), None)
                elif d in ('i', 'include'):
                    envs.setdefault(os.path.basename(arg).lower(), []).append(dict(env))
    return envs


def macros_at(lines, line):
    """Macros definidos no próprio arquivo até a linha."""
    env = {}
    for i in range(0, min(line, len(lines))):
        for m in re.finditer(r'\{\$(define|undef)\s+([^}]*)\}', lines[i], re.I):
            d, arg = m.group(1).lower(), m.group(2).strip()
            if d == 'define' and ':=' in arg:
                k, v = arg.split(':=', 1)
                env[k.strip().lower()] = v.strip()
            elif d == 'undef':
                env.pop(arg.lower(), None)
    return env


def apply_macros(header, env):
    for k, v in env.items():
        header = re.sub(r'\b' + re.escape(k) + r'\b', v, header, flags=re.I)
    return header


def scoped_enums_at(lines, line):
    """{$scopedenums on} vale na linha?"""
    state = False
    for i in range(0, min(line, len(lines))):
        for m in re.finditer(r'\{\$scopedenums\s+(on|off)\s*\}', lines[i], re.I):
            state = m.group(1).lower() == 'on'
    return state


PLATFORM_SYMS = re.compile(
    r'\b(windows|mswindows|win32|win64|wince|unix|linux|darwin|macos|bsd|freebsd|netbsd|'
    r'openbsd|dragonfly|android|ios|haiku|solaris|aix|beos|os2|emx|go32v2|msdos|amiga|'
    r'morphos|aros|atari|wasi|embedded|nds|wii|gba|symbian|nativent|netware|netwlibc|'
    r'hasunix|unix98|lcl\w+|'
    # símbolos que o próprio compilador define conforme o alvo
    r'fpc_has_\w+|cpu\w+|endian_\w+|fpc_requires_proper_alignment|fpusoft|fpu\w*|'
    r'fpc_comp_is_int64|fpc_currency_is_int64|fpc_supports_\w+)\b', re.I)


def platform_cond_at(lines, line, name=None):
    """Condições de plataforma ({$ifdef windows}, {$if defined(unix)}...) que
    envolvem a linha (1-based) no fonte. Devolve as diretivas que abrem a
    condição para o apelido gerado, ou [] se a declaração vale em todas as
    plataformas. Se o nome também é declarado no outro ramo do bloco (por
    exemplo {$ifndef windows} T = record ... {$else} T = Windows.T {$endif}),
    ele existe nos dois casos e a condição é ignorada."""
    full = '\n'.join(lines)
    # comentários viram espaços (mantém as posições)
    def blank(m):
        return re.sub(r'[^\n]', ' ', m.group(0))
    text = re.sub(r'\(\*.*?\*\)', blank, full, flags=re.S)
    text = re.sub(r'\{(?!\$)[^}]*\}', blank, text)
    text = re.sub(r'//[^\n]*', blank, text)
    target = sum(len(l) + 1 for l in lines[:line - 1])
    stack, snapshot = [], None
    for m in re.finditer(r'\{\$(ifdef|ifndef|if|elseif|else|endif|ifend)\b\s*([^}]*)\}', text, re.I):
        if snapshot is None and m.start() > target:
            snapshot = [(fr, len(fr['branches'])) for fr in stack]
        kind, arg = m.group(1).lower(), m.group(2).strip()
        if kind in ('ifdef', 'ifndef', 'if'):
            cond = arg if kind == 'if' else \
                ('' if kind == 'ifdef' else 'not ') + f'defined({arg.split()[0]})'
            stack.append({'cond': cond, 'prev': [], 'in_else': False,
                          'branches': [], 'cur': m.end()})
        elif kind in ('elseif', 'else') and stack:
            fr = stack[-1]
            fr['branches'].append((fr['cur'], m.start()))
            fr['cur'] = m.end()
            if kind == 'elseif':
                fr['prev'].append(fr['cond'])
                fr['cond'] = arg
            else:
                fr['in_else'] = True
        elif kind in ('endif', 'ifend') and stack:
            fr = stack.pop()
            fr['branches'].append((fr['cur'], m.start()))
    if snapshot is None:
        snapshot = [(fr, len(fr['branches'])) for fr in stack]
    res = []
    for fr, my_branch in snapshot:
        conds_order = fr['prev'] + [fr['cond']]  # if, elseif, elseif...
        if not any(PLATFORM_SYMS.search(c) for c in conds_order):
            continue
        if name:
            pat = re.compile(r'(^|[\s;(])' + re.escape(name) + r'\s*(=|:|\(|;)', re.I | re.M)
            if any(pat.search(text[x:y]) for i, (x, y) in enumerate(fr['branches'])
                   if i != my_branch):
                continue  # declarado nos dois ramos: existe sempre
        if my_branch < len(conds_order):
            parts = [f'not ({c})' for c in conds_order[:my_branch]] + [f'({conds_order[my_branch]})']
        else:  # ramo {$else}
            parts = [f'not ({c})' for c in conds_order]
        res.append('{$if ' + ' and '.join(parts) + '}')
    return res


def other_frames_at(lines, line):
    """True se a linha está dentro de algum {$if}/{$ifdef} que não é de
    plataforma (por exemplo um define local da unit)."""
    text = '\n'.join(lines[:line - 1])
    text = re.sub(r'\(\*.*?\*\)', ' ', text, flags=re.S)
    text = re.sub(r'\{(?!\$)[^}]*\}', ' ', text)
    text = re.sub(r'//[^\n]*', ' ', text)
    stack = []
    for m in re.finditer(r'\{\$(ifdef|ifndef|if|elseif|else|endif|ifend)\b\s*([^}]*)\}', text, re.I):
        kind, arg = m.group(1).lower(), m.group(2)
        if kind in ('ifdef', 'ifndef', 'if'):
            stack.append([arg])
        elif kind == 'elseif' and stack:
            stack[-1].append(arg)
        elif kind in ('endif', 'ifend') and stack:
            stack.pop()
    return any(not any(PLATFORM_SYMS.search(c) for c in fr) for fr in stack)


def source_decls(lines, name):
    """Posições (linha, coluna do nome) das declarações de rotina com esse
    nome na interface do arquivo."""
    out = []
    pat = re.compile(r'^\s*(function|procedure)\s+(' + re.escape(name) + r')\b', re.I)
    for i, l in enumerate(lines, 1):
        if re.match(r'\s*implementation\b', l, re.I):
            break
        m = pat.match(l)
        if m:
            out.append((i, m.start(2) + 1))
    return out


def header_params(header):
    """Nomes dos parâmetros a partir do cabeçalho copiado do fonte."""
    a = header.find('(')
    if a < 0:
        return []
    depth, b = 0, None
    for i in range(a, len(header)):
        if header[i] == '(':
            depth += 1
        elif header[i] == ')':
            depth -= 1
            if depth == 0:
                b = i
                break
    names = []
    for grp in header[a + 1:b].split(';'):
        grp = re.sub(r'^\s*(const|var|out|constref)\s+', '', grp.strip(), flags=re.I)
        grp = re.sub(r'^\[ref\]\s*', '', grp)
        names += [n.strip() for n in grp.split(':')[0].split(',') if n.strip()]
    return names


def wrap_cond(conds, text):
    if not conds:
        return text
    return '\n'.join(conds) + '\n' + text + '\n' + '\n'.join('{$endif}' for _ in conds)


def interface_uses(src_path):
    text = strip_comments(open(src_path, encoding='utf-8', errors='replace').read())
    m = re.search(r'\binterface\b(.*?)\bimplementation\b', text, re.S | re.I)
    if not m:
        return []
    u = re.search(r'\buses\b(.*?);', m.group(1), re.S | re.I)
    if not u:
        return []
    names = re.sub(r'\{\$[^}]*\}', ' ', u.group(1))
    return [n.strip() for n in names.split(',') if n.strip()]


def ppudump(exe, ppu):
    out = subprocess.run([exe, '-Fj', ppu], capture_output=True, text=True,
                         errors='replace').stdout
    # ppudump grava NaN/Inf sem aspas (JSON inválido)
    out = re.sub(r':\s*([-+]?)(Nan|Inf)\b', r': "\1\2"', out)
    data = json.loads(out)
    return data[0] if isinstance(data, list) else data


IFACE_NAMES = {}

# --- versões antigas do Lazarus (--baseline) --------------------------------
# Uma rotina/variável da LCL que existe numa versão antiga com outra assinatura
# não pode ser reexportada (o {$if declared()} não distingue assinaturas).

BASELINES = []  # [{unit_lower: (decls, vars)}]


def sig_key(header):
    h = re.sub(r'\s+', ' ', header).strip().rstrip(';')
    m = re.match(r'(function|procedure)\s+(\w+)\s*(\((.*)\))?\s*(:\s*([\w.]+))?', h, re.I | re.S)
    if not m:
        return None
    types = []
    if m.group(4):
        for grp in m.group(4).split(';'):
            grp = grp.strip()
            mod = ''
            mm = re.match(r'(const|var|out|constref)\s+', grp, re.I)
            if mm:
                mod = mm.group(1).lower()
                grp = grp[mm.end():]
            names, _, t = grp.partition(':')
            t = t.split('=')[0].strip().lower()
            types += [mod + ' ' + t] * len(names.split(','))
    return (m.group(2).lower(), tuple(types), (m.group(6) or '').lower())


def _read_iface(path, root, depth=0):
    t = open(path, encoding='latin-1').read()
    if depth == 0:
        t = re.split(r'\n\s*implementation\b', t, 1, flags=re.I)[0]

    def inc(m):
        n = m.group(1)
        for d in (os.path.dirname(path), os.path.join(root, 'lcl', 'include')):
            for c in (n, n + '.inc'):
                q = os.path.join(d, c)
                if os.path.exists(q) and depth < 3:
                    return _read_iface(q, root, depth + 1)
        return ''
    return re.sub(r'\{\$(?:i|include)\s+([\w.]+)\s*\}', inc, t, flags=re.I)


def load_baseline(root):
    idx = {}
    for sub in ('lcl', os.path.join('components', 'lazutils')):
        d = os.path.join(root, sub)
        if not os.path.isdir(d):
            continue
        for f in os.listdir(d):
            if f.endswith(('.pas', '.pp')):
                idx[os.path.splitext(f)[0].lower()] = os.path.join(d, f)
    cache = {}

    def unit(name):
        name = name.lower()
        if name not in idx:
            return None
        if name not in cache:
            t = _read_iface(idx[name], root)
            t = re.sub(r'\{(?!\$)[^}]*\}|\(\*.*?\*\)|//[^\n]*', ' ', t, flags=re.S)
            procs = {}
            for m in re.finditer(r'^\s*(function|procedure)\s+\w+\s*(\([^)]*\))?\s*(:\s*[\w.]+)?\s*;',
                                 t, re.M | re.I):
                k = sig_key(m.group(0))
                if k:
                    procs.setdefault(k[0], set()).add(k)
            vars_ = {}
            for m in re.finditer(r'^\s*(\w+)\s*:\s*([^;=]+?)\s*[;=]', t, re.M):
                vars_.setdefault(m.group(1).lower(), set()).add(' '.join(m.group(2).lower().split()))
            cache[name] = (procs, vars_)
        return cache[name]
    return unit


def baseline_ok_proc(src_unit, header):
    k = sig_key(header)
    if not k:
        return True
    for unit in BASELINES:
        u = unit(src_unit)
        if u is None:
            continue
        sigs = u[0].get(k[0])
        if sigs and k not in sigs:
            return False  # mesmo nome, outra assinatura
    return True


def baseline_ok_var(src_unit, name, typ):
    t = ' '.join(typ.lower().split())
    for unit in BASELINES:
        u = unit(src_unit)
        if u is None:
            continue
        types = u[1].get(name.lower())
        if types and t not in types:
            return False
    return True


def gen_unit(target, sources, args, srcidx, unitdirs, report):
    decl_types, decl_consts, decl_vars, decl_procs, impls = [], [], [], [], []
    seen = set()
    uses = []
    for src_unit in sources:
        ppu = find_ppu(unitdirs, src_unit)
        if not ppu:
            report.append(f'{target}: {src_unit}.ppu não encontrado')
            continue
        u = ppudump(args.ppudump, ppu)
        HOST[:] = HOST_BY_OS.get(str(u.get('TargetOS', 'linux')).lower(), HOST)
        files = [f['Name'] for f in u['Files']]
        main_src = pick_source(srcidx, files[0], None)
        near = os.path.dirname(main_src) if main_src else None
        names = interface_uses(main_src) if main_src else []
        if not names:
            # fonte "casca" com {$i ...}: usa a lista do ppu (interface + implementação)
            names = [x['Name'] for x in u.get('Uses', [])]
        compiled = {x['Name'].lower() for x in u.get('Uses', [])}
        for n in names:
            low = n.lower()
            # só as units realmente usadas nesta plataforma (o fonte pode ter
            # {$ifdef windows} no uses) e que existam em todas as plataformas
            if low not in ('system', 'objpas') and low not in [x.lower() for x in uses] \
               and low in compiled and portable_unit(srcidx, n) \
               and low not in ('windows', 'unix', 'baseunix', 'unixtype', 'linux', 'macosall',
                               'cocoaall', 'messages', 'unixutil', 'dl', 'termio', 'syscall'):
                uses.append(n)
        ifc = u['Interface']
        # units da LCL/LazUtils mudam entre versões do Lazarus: cada apelido só
        # é criado se o nome existir na versão que está compilando
        lcl_src = bool(main_src) and bool(re.search(r'[\\/](lcl|components)[\\/]', main_src))
        file_paths = [pick_source(srcidx, f, near) for f in files]
        envs = macro_envs(file_paths)
        pos_count = {}
        procs = [x for x in ifc if x['Type'] == 'proc']
        counts = {}
        for p in procs:
            counts[p['Name'].lower()] = counts.get(p['Name'].lower(), 0) + 1
        for sym in ifc:
            name = sym.get('Name')
            kind = sym['Type']
            if not name or '$' in name or name in SKIP or 'Pos' not in sym:
                continue
            key = (kind if kind == 'proc' else 'id', name.lower())
            decl_file = pick_source(srcidx, files[sym['Pos']['File'] - 1], near)
            # declarado dentro de {$ifdef windows}/{$if defined(unix)}...: o
            # apelido leva a mesma condição (o gerador roda numa plataforma só)
            conds = platform_cond_at(read_lines(decl_file), sym['Pos']['Line'], name) if decl_file else []
            if lcl_src:
                conds = conds + ['{$if declared(%s)}' % name]
            # declarado num arquivo específico de um SO: não é portável
            if decl_file and is_platform_path(decl_file) and \
               (not main_src or decl_file != main_src or is_platform_path(main_src)):
                report.append(f'{target}: {name} é específico de plataforma (omitido)')
                continue
            if kind in ('obj', 'rec', 'enum', 'set', 'classref', 'ptr', 'array', 'proctype',
                        'type', 'ord', 'float', 'string', 'variant', 'file'):
                if ('id', name.lower()) in seen:
                    continue
                if sym.get('Options') and 'generic' in sym.get('Options', []):
                    continue
                if kind == 'obj' and sym.get('ObjType') in ('helper', 'classhelper', 'recordhelper'):
                    continue
                if decl_file and re.search(r'\bgeneric\b', read_lines(decl_file)[sym['Pos']['Line'] - 1], re.I):
                    continue
                seen.add(('id', name.lower()))
                decl_types.append(wrap_cond(conds, f'  {name} = {src_unit}.{name};'))
                scoped = decl_file and scoped_enums_at(read_lines(decl_file), sym['Pos']['Line'])
                if kind == 'enum' and not scoped:
                    for el in sym.get('Elements', []):
                        en = el['Name']
                        if ('id', en.lower()) in seen:
                            continue
                        seen.add(('id', en.lower()))
                        econds = conds[:-1] + ['{$if declared(%s)}' % en] if lcl_src else conds
                        decl_consts.append(wrap_cond(econds, f'  {en} = {src_unit}.{en};'))
            elif kind == 'const':
                if ('id', name.lower()) in seen:
                    continue
                seen.add(('id', name.lower()))
                fpath = pick_source(srcidx, files[sym['Pos']['File'] - 1], near)
                if sym.get('ValType') == 'string' and fpath and \
                   section_of(read_lines(fpath), sym['Pos']['Line']) == 'resourcestring':
                    # resourcestring não pode ser apelidada: função que a devolve
                    # (continua traduzível, pois lê a original)
                    decl_procs.append(wrap_cond(conds, f'function {name}: string; inline;'))
                    impls.append(wrap_cond(conds, f'function {name}: string;\nbegin\n  Result := {src_unit}.{name};\nend;\n'))
                else:
                    decl_consts.append(wrap_cond(conds, f'  {name} = {src_unit}.{name};'))
            elif kind == 'var':
                if ('id', name.lower()) in seen:
                    continue
                fpath = pick_source(srcidx, files[sym['Pos']['File'] - 1], near)
                if not fpath:
                    continue
                t = var_type(read_lines(fpath), sym['Pos']['Line'], sym['Pos']['Col'], name)
                if not t or re.search(r'\b(record|class|procedure|function|array|set of|\()', t, re.I):
                    continue
                if lcl_src and not baseline_ok_var(src_unit, name, t):
                    report.append(f'{target}: variável {name} tem outro tipo numa versão antiga (omitida)')
                    continue
                seen.add(('id', name.lower()))
                decl_vars.append(wrap_cond(conds, f'  {name}: {t} absolute {src_unit}.{name};'))
            elif kind == 'proc':
                opts = sym.get('Options', [])
                if any(o in opts for o in ('operator', 'generic', 'constructor', 'destructor')):
                    continue
                fpath = pick_source(srcidx, files[sym['Pos']['File'] - 1], near)
                if not fpath:
                    continue
                flines = read_lines(fpath)
                pkey = ('pos', fpath, sym['Pos']['Line'], sym['Pos']['Col'])
                if pkey in seen:
                    continue
                seen.add(pkey)
                # o ppudump dá a mesma posição para todas as sobrecargas: nesse
                # caso cada declaração do fonte é gerada com o próprio cabeçalho
                same = [x for x in procs if x['Name'].lower() == name.lower()
                        and x.get('Pos') == sym['Pos']]
                if len(same) > 1:
                    positions = [(ln, cl) for ln, cl in source_decls(flines, name)
                                 if not other_frames_at(flines, ln)]
                    from_source = True
                else:
                    positions = [(sym['Pos']['Line'], sym['Pos']['Col'])]
                    from_source = False
                for ln, cl in positions:
                    h = extract_header(flines, ln, cl)
                    if not h:
                        report.append(f'{target}: cabeçalho de {name} não lido')
                        continue
                    header, dirs = h
                    fkey = os.path.basename(fpath).lower()
                    if fkey in envs:
                        # mesmo arquivo incluído várias vezes com macros diferentes
                        pk = (fkey, ln, cl)
                        k = pos_count.get(pk, 0)
                        pos_count[pk] = k + 1
                        header = apply_macros(header, envs[fkey][min(k, len(envs[fkey]) - 1)])
                    header = apply_macros(header, macros_at(flines, ln))
                    if not re.match(r'(function|procedure)\s+' + re.escape(name) + r'\b', header, re.I):
                        report.append(f'{target}: cabeçalho inesperado para {name}: {header[:60]}')
                        continue
                    sig = header.lower().replace(' ', '')
                    if (('sig', sig)) in seen:
                        continue
                    if lcl_src and not baseline_ok_proc(src_unit, header):
                        report.append(f'{target}: {name} tem outra assinatura numa versão '
                                      f'antiga do Lazarus (omitido): {header}')
                        continue
                    seen.add(('sig', sig))
                    pconds = platform_cond_at(flines, ln) if from_source else conds
                    if from_source and lcl_src:
                        pconds = pconds + ['{$if declared(%s)}' % name]
                    if from_source:
                        params = header_params(header)
                    else:
                        params = [p['Name'] for p in sym.get('Params', [])
                                  if p.get('Name') and not p['Name'].startswith('$')
                                  and 'hidden' not in p.get('Spez', '')]
                    call = f'{src_unit}.{name}'
                    if params:
                        call += '(' + ', '.join(params) + ')'
                    is_func = header.lower().startswith('function')
                    ov = ' overload;' if counts.get(name.lower(), 0) > 1 or 'overload' in dirs else ''
                    hint = ' platform;' if 'platform' in dirs else ''  # diretivas de aviso vão por último
                    decl_procs.append(wrap_cond(pconds, f'{header};{ov} inline;{hint}'))
                    impls.append(wrap_cond(pconds, f'{header};\nbegin\n  {"Result := " if is_func else ""}{call};\nend;\n'))
    if target == 'Winapi.Messages':
        # nomes do Delphi para os registros/constantes que a LCL chama de TLM*/LM_*
        def add_alias(new, old, is_type, src_line=''):
            if ('id', new.lower()) in seen:
                return
            seen.add(('id', new.lower()))
            conds = [x for x in src_line.split('\n') if x.startswith('{$if')]
            (decl_types if is_type else decl_consts).append(wrap_cond(conds, f'  {new} = {old};'))
        for line in list(decl_types):
            n = [x for x in line.split('\n') if '=' in x][0].split('=')[0].strip()
            if n == 'TLMessage':
                add_alias('TMessage', n, True, line)
            elif n == 'PLMessage':
                add_alias('PMessage', n, True, line)
            elif n.startswith('TLM') and len(n) > 3:
                add_alias('TWM' + n[3:], n, True, line)
        for line in list(decl_consts):
            n = [x for x in line.split('\n') if '=' in x][0].split('=')[0].strip()
            if n.startswith('LM_'):
                add_alias('WM_' + n[3:], n, False, line)
    # só as units cujos nomes o código gerado cita (tipos dos cabeçalhos e das
    # variáveis): units internas que mudam entre versões do Lazarus ficam de fora
    used_ids = set(w.lower() for w in re.findall(r'[A-Za-z_]\w*',
                                                 '\n'.join(decl_procs + decl_vars)))
    def needed(unit):
        ppu = find_ppu(unitdirs, unit)
        if not ppu:
            return True
        if unit.lower() not in IFACE_NAMES:
            try:
                IFACE_NAMES[unit.lower()] = {x.get('Name', '').lower()
                                             for x in ppudump(args.ppudump, ppu)['Interface']}
            except Exception:
                IFACE_NAMES[unit.lower()] = None
        names = IFACE_NAMES[unit.lower()]
        return names is None or bool(names & used_ids)
    uses = [x for x in uses if needed(x)]
    # a unit original por último: os nomes dela vencem, como no código original
    order = [x for x in uses if x.lower() not in [s.lower() for s in sources]] + sources
    uses_line = ', '.join(order)
    out = [f"""{{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: {target}
  Gerado por tools/genvclcompat.py a partir de {', '.join(sources)}.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}}
unit {target};

{{$mode objfpc}}{{$H+}}
{{$warn 5023 off}}{{$warn 5043 off}}{{$warn 5066 off}}{{$warn 5055 off}}{{$warn 5044 off}}{{$warn 6058 off}}{{$warn 5094 off}}{{$warn 5093 off}}{{$hints off}}{{$notes off}}

interface

uses
  {uses_line};
"""]
    if decl_types:
        out.append('type\n' + '\n'.join(decl_types) + '\n')
    if decl_consts:
        out.append('const\n' + '\n'.join(decl_consts) + '\n')
    if decl_vars:
        out.append('var\n' + '\n'.join(decl_vars) + '\n')
    out.append('\n'.join(decl_procs) + '\n')
    out.append('\nimplementation\n\n' + '\n'.join(impls) + '\nend.\n')
    return ''.join(out), len(decl_types), len(decl_consts), len(decl_vars), len(decl_procs)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--lazarus', required=True)
    ap.add_argument('--fpcsrc', required=True)
    ap.add_argument('--ppudump', default='ppudump')
    ap.add_argument('--lclunits', required=True, help='lcl/units/<cpu>-<os> (com as subpastas)')
    ap.add_argument('--fpcunits', required=True, help='units/<cpu>-<os> do FPC')
    ap.add_argument('--out', default=OUT_DEFAULT)
    ap.add_argument('--only', nargs='*')
    ap.add_argument('--skip', nargs='*', default=[], help='nomes a não reexportar (Unit.Nome)')
    ap.add_argument('--baseline', nargs='*', default=[],
                    help='fontes de versões antigas do Lazarus: rotinas da LCL com outra '
                         'assinatura nelas não são reexportadas')
    args = ap.parse_args()
    BASELINES[:] = [load_baseline(b) for b in args.baseline]
    os.makedirs(args.out, exist_ok=True)
    srcidx = index_sources([os.path.join(args.lazarus, 'lcl'),
                            os.path.join(args.lazarus, 'components', 'lazutils'),
                            os.path.join(args.fpcsrc, 'rtl'),
                            os.path.join(args.fpcsrc, 'packages')])
    # LazUtils compila na pasta do próprio pacote (lib/<cpu>-<os>)
    target_dir = os.path.basename(os.path.normpath(args.lclunits))
    unitdirs = [args.lclunits, args.fpcunits,
                os.path.join(args.lazarus, 'components', 'lazutils', 'lib', target_dir)]
    report = []
    for target, sources in MAP.items():
        if args.only and target not in args.only:
            continue
        text, nt, nc, nv, np = gen_unit(target, sources, args, srcidx, unitdirs, report)
        for s in args.skip:
            if s.split('.')[0] == target:
                pass
        fn = os.path.join(args.out, target.lower() + '.pas')
        with open(fn, 'w', encoding='utf-8') as fh:
            fh.write(text)
        print(f'{target:20s} tipos {nt:4d}  constantes {nc:5d}  variáveis {nv:3d}  rotinas {np:4d}')
    for r in report:
        print('aviso:', r, file=sys.stderr)


if __name__ == '__main__':
    main()
