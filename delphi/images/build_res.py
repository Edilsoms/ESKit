#!/usr/bin/env python3
"""Gera os recursos da versão Delphi a partir dos PNG da versão Lazarus:

  ../source/EsToolBarGridIcons.res  ícones da TEsToolBarGrid (RCDATA, PNG)
  ../source/ESKitReg.dcr             ícones da paleta (BITMAP 16/24/32 px)

Uso: python3 build_res.py      (requer Pillow)
"""
import os, struct
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
LAZ = os.path.join(HERE, '..', '..', 'lazarus', 'images')
OUT = os.path.join(HERE, '..', 'source')
RT_BITMAP, RT_RCDATA = 2, 10


def res_entry(rtype, name, data):
    def ident(v):
        if isinstance(v, int):
            return struct.pack('<HH', 0xFFFF, v)
        return (v.upper() + '\0').encode('utf-16-le')
    hdr = ident(rtype) + ident(name)
    if len(hdr) % 4:
        hdr += b'\0' * (4 - len(hdr) % 4)
    hdr += struct.pack('<IHHII', 0, 0x1030, 0x0409, 0, 0)
    out = struct.pack('<II', len(data), 8 + len(hdr)) + hdr + data
    if len(out) % 4:
        out += b'\0' * (4 - len(out) % 4)
    return out


def write_res(path, entries):
    empty = struct.pack('<IIHHHHIHHII', 0, 32, 0xFFFF, 0, 0xFFFF, 0, 0, 0, 0, 0, 0)
    with open(path, 'wb') as fh:
        fh.write(empty)
        for rtype, name, data in entries:
            fh.write(res_entry(rtype, name, data))


def dib24(img, key=(240, 240, 240)):
    """BITMAP 24 bits; o pixel inferior esquerdo (cor-chave) vira transparente."""
    img = img.convert('RGBA')
    bg = Image.new('RGBA', img.size, key + (255,))
    bg.alpha_composite(img)
    px = bg.convert('RGB')
    px.putpixel((0, img.height - 1), key)
    w, h = px.size
    stride = (w * 3 + 3) & ~3
    rows = []
    for y in range(h - 1, -1, -1):
        row = bytearray()
        for x in range(w):
            r, g, b = px.getpixel((x, y))
            row += bytes((b, g, r))
        row += b'\0' * (stride - len(row))
        rows.append(bytes(row))
    info = struct.pack('<IiiHHIIiiII', 40, w, h, 1, 24, 0, stride * h, 2835, 2835, 0, 0)
    return info + b''.join(rows)


def main():
    # ícones da barra (PNG intactos, carregados com TPngImage)
    tb = os.path.join(LAZ, 'toolbargrid', 'png')
    entries = []
    for f in sorted(os.listdir(tb)):
        if f.endswith('.png'):
            entries.append((RT_RCDATA, f[:-4], open(os.path.join(tb, f), 'rb').read()))
    write_res(os.path.join(OUT, 'EsToolBarGridIcons.res'), entries)
    # paleta
    pal = os.path.join(LAZ, 'png')
    entries = []
    for f in sorted(os.listdir(pal)):
        if not f.endswith('_200.png'):
            continue
        cls = f[:-len('_200.png')]
        big = Image.open(os.path.join(pal, f)).convert('RGBA')
        for size, suffix in ((24, ''), (16, '16'), (32, '32')):
            im = big.resize((size, size), Image.LANCZOS)
            entries.append((RT_BITMAP, cls + suffix, dib24(im)))
    write_res(os.path.join(OUT, 'ESKitReg.dcr'), entries)
    print('ok')


if __name__ == '__main__':
    main()
