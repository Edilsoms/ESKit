#!/usr/bin/env python3
"""Gera os ícones da TEsToolBarGrid a partir do Lucide (https://lucide.dev,
licença ISC - ver LICENSE-lucide.txt) e monta images/toolbargrid_images.res.

Uso:  python3 build_icons.py <pasta lucide/icons> <lazres>
Requer rsvg-convert para rasterizar (16, 24 e 32 px).
"""
import os, re, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
SVG_DIR = os.path.join(HERE, 'svg')
PNG_DIR = os.path.join(HERE, 'png')
RES = os.path.join(HERE, '..', 'toolbargrid_images.res')

# recurso -> (ícone Lucide, cor)
ICONS = {
    'TBG_BESTFIT': ('move-horizontal', '#2563eb'),
    'TBG_SAVELAYOUT': ('save', '#2563eb'),
    'TBG_LOADLAYOUT': ('folder-open', '#d97706'),
    'TBG_DELETELAYOUT': ('folder-x', '#dc2626'),
    'TBG_STATUSLAYOUT': ('circle-check', '#16a34a'),
    'TBG_MULTISELECT': ('list-checks', '#2563eb'),
    'TBG_SELECTALL': ('square-check', '#16a34a'),
    'TBG_UNSELECTALL': ('eraser', '#db2777'),
    'TBG_COUNTCOLUMN': ('hash', '#475569'),
    'TBG_SUMCOLUMN': ('sigma', '#475569'),
    'TBG_SUMGROUP': ('square-sigma', '#ea580c'),
    'TBG_AVGCOLUMN': ('divide', '#2563eb'),
    'TBG_AVGGROUP': ('square-divide', '#16a34a'),
    'TBG_REMOVESUMMARY': ('list-x', '#dc2626'),
    'TBG_EXPANDGROUP': ('unfold-vertical', '#475569'),
    'TBG_COLLAPSEGROUP': ('fold-vertical', '#475569'),
    'TBG_PRINT': ('printer', '#334155'),
    'TBG_PRINTSETUP': ('sliders-horizontal', '#334155'),
}

# exportação: ícone "file" do Lucide + etiqueta colorida com o formato
EXPORTS = {
    'TBG_EXPORTXLSX': ('XLS', '#16a34a'),
    'TBG_EXPORTPDF': ('PDF', '#dc2626'),
    'TBG_EXPORTHTML': ('HTM', '#ea580c'),
    'TBG_EXPORTCSV': ('CSV', '#0284c7'),
    'TBG_EXPORTTXT': ('TXT', '#64748b'),
    'TBG_EXPORTXML': ('XML', '#7c3aed'),
}

HEADER = ('<!-- Ícone baseado no Lucide (https://lucide.dev), licença ISC. '
          'Copyright (c) Lucide Icons and Contributors. -->\n')


def inner(svg_text):
    m = re.search(r'<svg[^>]*>(.*)</svg>', svg_text, re.S)
    return m.group(1).strip()


def colored(lucide_dir, name, color):
    text = open(os.path.join(lucide_dir, name + '.svg'), encoding='utf-8').read()
    return HEADER + text.replace('currentColor', color)


def export_icon(lucide_dir, label, color):
    body = inner(open(os.path.join(lucide_dir, 'file.svg'), encoding='utf-8').read())
    return HEADER + f'''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
  <g fill="none" stroke="#64748b" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    {body}
  </g>
  <rect x="0.5" y="12" width="23" height="10" rx="2" fill="{color}"/>
  <text x="12" y="20" text-anchor="middle" font-family="Arial, Liberation Sans, sans-serif"
        font-size="8" font-weight="bold" fill="#ffffff">{label}</text>
</svg>
'''


def main():
    lucide_dir = sys.argv[1]
    lazres = sys.argv[2] if len(sys.argv) > 2 else 'lazres'
    os.makedirs(SVG_DIR, exist_ok=True)
    os.makedirs(PNG_DIR, exist_ok=True)
    svgs = {}
    for res, (name, color) in ICONS.items():
        svgs[res] = colored(lucide_dir, name, color)
    for res, (label, color) in EXPORTS.items():
        svgs[res] = export_icon(lucide_dir, label, color)
    pngs = []
    for res, text in svgs.items():
        path = os.path.join(SVG_DIR, res + '.svg')
        with open(path, 'w', encoding='utf-8') as fh:
            fh.write(text)
        for size, suffix in ((16, ''), (24, '_24'), (32, '_32')):
            out = os.path.join(PNG_DIR, res + suffix + '.png')
            subprocess.run(['rsvg-convert', '-w', str(size), '-h', str(size), path,
                            '-o', out], check=True)
            pngs.append(os.path.basename(out))
    subprocess.run([lazres, os.path.abspath(RES)] + sorted(pngs), cwd=PNG_DIR, check=True,
                   stdout=subprocess.DEVNULL)
    print(len(svgs), 'ícones;', len(pngs), 'png;', os.path.abspath(RES))


if __name__ == '__main__':
    main()
