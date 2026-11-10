"""Ajudante: aplica substituições exatas (falha se algum trecho não existir)."""
import sys
def port(src, dst, reps, header=None):
    s = open(src, encoding='utf-8').read()
    for a, b in reps:
        if a not in s:
            raise SystemExit('NAO ACHEI em %s:\n%s' % (src, a[:200]))
        s = s.replace(a, b)
    open(dst, 'w', encoding='utf-8').write(s)

import re
def common(s):
    """Transformações genéricas LCL -> VCL."""
    s = re.sub(r':= @([A-Za-z_][\w.]*)\s*;', r':= \1;', s)
    s = s.replace('    property BorderSpacing;\n', '    property AlignWithMargins;\n    property Margins;\n')
    s = s.replace('    property ChildSizing;\n', '    property Padding;\n')
    s = re.sub(r'SetInitialBounds\(0, 0, ', 'SetBounds(0, 0, ', s)
    return s

def port2(src, dst, reps):
    s = open(src, encoding='utf-8').read()
    for a, b in reps:
        if a not in s:
            raise SystemExit('NAO ACHEI em %s:\n%s' % (src, a[:300]))
        s = s.replace(a, b)
    s = common(s); s = common2(s)
    open(dst, 'w', encoding='utf-8').write(s)
    left = [l for l in s.splitlines() if re.search(r'@\w|LCL|LMessages|\{\$mode|TLM|LM_', l)]
    if left:
        print('REVISAR:', *left[:30], sep='\n  ')

def common2(s):
    s = re.sub(r'(?<![\w.])IsEnabled\b', 'EsIsEnabled(Self)', s)
    s = re.sub(r'\(@([A-Za-z_]\w*)\)', r'(\1)', s)
    s = re.sub(r'(?<![\w.])Math\.', 'System.Math.', s)
    s = s.replace('class function GetControlClassDefaultSize: TSize; override;',
                  'class function GetControlClassDefaultSize: TSize;')
    return s

def vclmsg(s):
    """Converte overrides da LCL que na VCL são mensagens (para classes que
    descendem diretamente de controles VCL)."""
    decl = {
        r'procedure MouseEnter; override;': 'procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;',
        r'procedure MouseLeave; override;': 'procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;',
        r'procedure EnabledChanged; override;': 'procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;',
        r'procedure TextChanged; override;': 'procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;',
        r'procedure FontChanged(Sender: TObject); override;': 'procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;',
        r'procedure EraseBackground(DC: HDC); override;': 'procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;',
    }
    for a, b in decl.items():
        s = s.replace(a, b)
    impl = [
        (r'procedure (\w+)\.MouseEnter;\n', r'procedure \1.CMMouseEnter(var Message: TMessage);\n', 'inherited MouseEnter;'),
        (r'procedure (\w+)\.MouseLeave;\n', r'procedure \1.CMMouseLeave(var Message: TMessage);\n', 'inherited MouseLeave;'),
        (r'procedure (\w+)\.EnabledChanged;\n', r'procedure \1.CMEnabledChanged(var Message: TMessage);\n', 'inherited EnabledChanged;'),
        (r'procedure (\w+)\.TextChanged;\n', r'procedure \1.CMTextChanged(var Message: TMessage);\n', 'inherited TextChanged;'),
        (r'procedure (\w+)\.FontChanged\(Sender: TObject\);\n', r'procedure \1.CMFontChanged(var Message: TMessage);\n', 'inherited FontChanged(Sender);'),
    ]
    for pat, rep, inh in impl:
        s = re.sub(pat, rep, s)
        s = s.replace(inh, 'inherited;')
    # EraseBackground: corpo vazio -> Result := 1
    s = re.sub(r'procedure (\w+)\.EraseBackground\(DC: HDC\);\n(\s*)begin\n',
               r'procedure \1.WMEraseBkgnd(var Message: TWMEraseBkgnd);\n\2begin\n  Message.Result := 1;\n', s)
    # Canvas.Line(...) -> EsLine(Canvas, ...)
    s = re.sub(r'(\b[A-Za-z_][\w.]*)\.Line\(', r'EsLine(\1, ', s)
    s = re.sub(r'(\b[A-Za-z_][\w.]*)\.GetRGBColorResolvingParent\b', r'EsParentColor(\1)', s)
    s = re.sub(r'(?<![\w.])SysUtils\.', 'System.SysUtils.', s)
    return s

def dynarrays(s):
    """array of X em campos/variáveis/tipos -> TArray<X> (no Delphi, dois
    'array of X' anônimos não são compatíveis entre si)."""
    s = re.sub(r'^(\s+[A-Za-z_][\w, ]*:\s*)array of (\w+);', r'\1TArray<\2>;', s, flags=re.M)
    s = re.sub(r'^(\s+T\w+\s*=\s*)array of (\w+);', r'\1TArray<\2>;', s, flags=re.M)
    return s
