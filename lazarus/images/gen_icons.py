#!/usr/bin/env python3
"""Gera os ícones da paleta (24, 36 e 48 px) dos componentes ESKit."""
import os
from PIL import Image, ImageDraw, ImageFont

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'png')
os.makedirs(OUT, exist_ok=True)

FX = (124, 77, 255)      # roxo (FMX)
FX2 = (0, 176, 255)
SX = (232, 120, 20)      # laranja (DevExpress)
SX2 = (43, 87, 154)
INK = (60, 60, 70)
WHITE = (255, 255, 255)
LIGHT = (235, 235, 240)

S = 96  # desenho em 96x96 e reduz (anti-aliasing)


def canvas():
    im = Image.new('RGBA', (S, S), (0, 0, 0, 0))
    return im, ImageDraw.Draw(im)


def field(d, color, btn=None):
    d.rounded_rectangle((6, 28, 90, 68), 8, fill=WHITE, outline=INK, width=4)
    if btn:
        d.rounded_rectangle((58, 32, 86, 64), 4, fill=color)
    d.line((18, 38, 18, 58), fill=INK, width=4)


def icon(name, fn):
    im, d = canvas()
    fn(d)
    for size, suffix in ((24, ''), (36, '_150'), (48, '_200')):
        im.resize((size, size), Image.LANCZOS).save(os.path.join(OUT, f'{name}{suffix}.png'))


def arrow_down(d, cx, cy, s, color=WHITE):
    d.polygon([(cx - s, cy - s // 2), (cx + s, cy - s // 2), (cx, cy + s // 2 + 2)], fill=color)


ICONS = {
    'tesfxrectangle': lambda d: d.rounded_rectangle((10, 20, 86, 76), 16, fill=FX, outline=INK, width=4),
    'tesfxlayout': lambda d: [d.rectangle((10 + i, 18, 10 + i + 8, 22), fill=INK) for i in range(0, 76, 14)]
        + [d.rectangle((10 + i, 74, 10 + i + 8, 78), fill=INK) for i in range(0, 76, 14)]
        + [d.rectangle((10, 18 + i, 14, 18 + i + 8), fill=INK) for i in range(0, 60, 14)]
        + [d.rectangle((82, 18 + i, 86, 18 + i + 8), fill=INK) for i in range(0, 60, 14)],
    'tesfxcircle': lambda d: d.ellipse((14, 14, 82, 82), fill=FX2, outline=INK, width=4),
    'tesfxellipse': lambda d: d.ellipse((6, 24, 90, 72), fill=FX, outline=INK, width=4),
    'tesfxline': lambda d: d.line((12, 84, 84, 12), fill=FX, width=10),
    'tesfxtext': lambda d: (d.rectangle((18, 14, 78, 26), fill=FX), d.rectangle((42, 14, 54, 84), fill=FX)),
    'tesfxbutton': lambda d: (d.rounded_rectangle((6, 28, 90, 70), 18, fill=FX),
                            d.rounded_rectangle((30, 45, 66, 53), 4, fill=WHITE)),
    'tesfxswitch': lambda d: (d.rounded_rectangle((8, 28, 88, 68), 20, fill=FX),
                            d.ellipse((52, 32, 84, 64), fill=WHITE)),
    'tesfxcheckbox': lambda d: (d.rounded_rectangle((16, 16, 80, 80), 12, fill=FX),
                              d.line((30, 48, 44, 62, 68, 34), fill=WHITE, width=9, joint='curve')),
    'tesfxradiobutton': lambda d: (d.ellipse((14, 14, 82, 82), fill=WHITE, outline=FX, width=7),
                                 d.ellipse((34, 34, 62, 62), fill=FX)),
    'tesfxtrackbar': lambda d: (d.rounded_rectangle((8, 44, 88, 52), 4, fill=LIGHT, outline=INK, width=2),
                              d.rounded_rectangle((8, 44, 54, 52), 4, fill=FX),
                              d.ellipse((40, 32, 72, 64), fill=WHITE, outline=FX, width=6)),
    'tesfxprogressbar': lambda d: (d.rounded_rectangle((6, 38, 90, 58), 10, fill=LIGHT, outline=INK, width=2),
                                 d.rounded_rectangle((6, 38, 60, 58), 10, fill=FX2)),
    'tesfxarcprogress': lambda d: (d.arc((12, 12, 84, 84), 0, 360, fill=LIGHT, width=12),
                                 d.arc((12, 12, 84, 84), -90, 160, fill=FX, width=12)),
    'tesfxaniindicator': lambda d: [d.ellipse((44 + int(30 * __import__('math').cos(a)) - 7,
                                             44 + int(30 * __import__('math').sin(a)) - 7,
                                             44 + int(30 * __import__('math').cos(a)) + 9,
                                             44 + int(30 * __import__('math').sin(a)) + 9),
                                            fill=(FX[0], FX[1], FX[2], 60 + i * 24))
                                  for i, a in enumerate([k * 0.785 for k in range(8)])],
    'tesfxtabcontrol': lambda d: (d.rectangle((8, 30, 88, 86), fill=WHITE, outline=INK, width=4),
                                  d.rectangle((8, 12, 36, 32), fill=FX, outline=INK, width=3),
                                  d.rectangle((38, 16, 64, 32), fill=LIGHT, outline=INK, width=3),
                                  d.rectangle((16, 44, 80, 50), fill=LIGHT),
                                  d.rectangle((16, 58, 64, 64), fill=LIGHT)),
    'tesfxlistbox': lambda d: (d.rounded_rectangle((8, 8, 88, 88), 8, fill=WHITE, outline=INK, width=4),
                               d.rectangle((14, 30, 82, 46), fill=FX),
                               [d.rectangle((20, y, 70, y + 6), fill=c) for y, c in ((18, INK), (35, WHITE),
                                                                                 (54, INK), (70, INK))]),
    'tesfxedit': lambda d: (d.rounded_rectangle((6, 28, 90, 68), 8, fill=WHITE, outline=INK, width=4),
                          d.rectangle((14, 62, 82, 66), fill=FX), d.line((20, 38, 20, 56), fill=INK, width=4)),
    'tesfxstylebook': lambda d: (d.rounded_rectangle((14, 10, 82, 86), 6, fill=FX, outline=INK, width=4),
                               d.ellipse((30, 26, 46, 42), fill=(255, 196, 0)),
                               d.ellipse((50, 26, 66, 42), fill=FX2),
                               d.ellipse((40, 48, 56, 64), fill=WHITE)),
    'tesfxfloatanimation': lambda d: (d.line((10, 84, 86, 84), fill=INK, width=3), d.line((10, 10, 10, 84), fill=INK, width=3),
                                    d.line([(10 + t, 84 - int(74 * (t / 76) ** 2.2)) for t in range(0, 77, 4)], fill=FX, width=8)),
    'tesfxcoloranimation': lambda d: (d.rounded_rectangle((8, 20, 46, 76), 6, fill=FX),
                                    d.rounded_rectangle((50, 20, 88, 76), 6, fill=(255, 140, 0)),
                                    d.polygon([(40, 40), (56, 48), (40, 56)], fill=WHITE)),
    'tesskincontroller': lambda d: (d.ellipse((8, 8, 88, 88), fill=SX2),
                                    d.pieslice((8, 8, 88, 88), 180, 270, fill=SX),
                                    d.pieslice((8, 8, 88, 88), 0, 90, fill=(255, 200, 40)),
                                    d.ellipse((34, 34, 62, 62), fill=WHITE)),
    'tesbuttonedit': lambda d: (field(d, SX, True), [d.ellipse((62 + i * 8, 45, 67 + i * 8, 50), fill=WHITE) for i in range(3)]),
    'tesspinedit': lambda d: (field(d, SX, True),
                              d.polygon([(64, 46), (80, 46), (72, 36)], fill=WHITE),
                              d.polygon([(64, 52), (80, 52), (72, 62)], fill=WHITE)),
    'tescombobox': lambda d: (field(d, SX, True), arrow_down(d, 72, 48, 8)),
    'tesdateedit': lambda d: (field(d, SX, True), d.rectangle((63, 38, 81, 58), outline=WHITE, width=3),
                              d.rectangle((63, 38, 81, 43), fill=WHITE)),
    'tesbutton': lambda d: (d.rounded_rectangle((6, 28, 90, 70), 6, fill=SX2),
                            d.rounded_rectangle((16, 45, 52, 53), 3, fill=WHITE),
                            arrow_down(d, 72, 49, 8), d.line((62, 34, 62, 64), fill=WHITE, width=2)),
    'tesgroupbox': lambda d: (d.rectangle((8, 12, 88, 84), fill=WHITE, outline=INK, width=4),
                              d.rectangle((8, 12, 88, 32), fill=SX2), d.rectangle((16, 19, 50, 25), fill=WHITE)),
    'tesgrid': lambda d: (d.rectangle((6, 10, 90, 86), fill=WHITE, outline=INK, width=4),
                          d.rectangle((6, 10, 90, 28), fill=SX),
                          [d.line((6, y, 90, y), fill=INK, width=2) for y in (44, 58, 72)],
                          [d.line((x, 10, x, 86), fill=INK, width=2) for x in (34, 62)],
                          d.rectangle((8, 46, 88, 56), fill=(204, 228, 247))),
    'testoolbargrid': lambda d: (d.rectangle((4, 14, 92, 36), fill=LIGHT, outline=INK, width=3),
                                 [d.rectangle((10 + i * 16, 19, 20 + i * 16, 31), fill=[SX, SX2, (40, 160, 70), (210, 50, 50), SX][i]) for i in range(5)],
                                 d.rectangle((4, 42, 92, 88), fill=WHITE, outline=INK, width=3),
                                 d.rectangle((4, 42, 92, 54), fill=SX),
                                 [d.line((4, y, 92, y), fill=INK, width=2) for y in (66, 77)]),
    'tesnavbar': lambda d: (d.rectangle((14, 6, 82, 90), fill=WHITE, outline=INK, width=4),
                            d.rectangle((14, 6, 82, 24), fill=SX2), d.rectangle((14, 52, 82, 68), fill=SX2),
                            [d.rectangle((24, y, 66, y + 5), fill=INK) for y in (31, 41)],
                            d.rectangle((24, 75, 60, 80), fill=INK)),
    'tesribbon': lambda d: (d.rectangle((4, 18, 92, 78), fill=WHITE, outline=INK, width=4),
                            d.rectangle((4, 18, 26, 32), fill=SX2),
                            d.rectangle((30, 18, 50, 32), fill=LIGHT),
                            d.rounded_rectangle((12, 40, 34, 62), 3, fill=SX),
                            d.rectangle((42, 42, 52, 50), fill=SX2), d.rectangle((42, 56, 52, 64), fill=SX2),
                            d.rectangle((56, 44, 84, 48), fill=INK), d.rectangle((56, 58, 84, 62), fill=INK)),
}


DB = (0, 137, 123)       # verde-azulado (EsDB / FireDAC)


def cylinder(d, x0, y0, x1, y1, color):
    h = (y1 - y0) // 5
    d.rectangle((x0, y0 + h // 2, x1, y1 - h // 2), fill=color)
    d.ellipse((x0, y1 - h, x1, y1), fill=color, outline=INK, width=3)
    d.line((x0, y0 + h // 2, x0, y1 - h // 2), fill=INK, width=3)
    d.line((x1, y0 + h // 2, x1, y1 - h // 2), fill=INK, width=3)
    d.ellipse((x0, y0, x1, y0 + h), fill=(120, 200, 190), outline=INK, width=3)


def mini_grid(d, x0, y0, x1, y1, head):
    d.rectangle((x0, y0, x1, y1), fill=WHITE, outline=INK, width=3)
    d.rectangle((x0, y0, x1, y0 + 12), fill=head)
    for y in range(y0 + 24, y1, 12):
        d.line((x0, y, x1, y), fill=INK, width=2)
    d.line(((x0 + x1) // 2, y0, (x0 + x1) // 2, y1), fill=INK, width=2)


DB_ICONS = {
    'tesconnection': lambda d: (cylinder(d, 8, 14, 56, 84, DB),
                                d.line((56, 48, 74, 48), fill=INK, width=5),
                                d.rounded_rectangle((70, 34, 90, 62), 4, fill=SX, outline=INK, width=3),
                                d.line((90, 41, 95, 41), fill=INK, width=4),
                                d.line((90, 55, 95, 55), fill=INK, width=4)),
    'testransaction': lambda d: (cylinder(d, 6, 30, 50, 88, DB),
                                 d.arc((40, 6, 92, 58), 200, 520, fill=SX, width=7),
                                 d.polygon([(86, 4), (94, 26), (72, 22)], fill=SX)),
    'tesquery': lambda d: (cylinder(d, 6, 8, 46, 60, DB),
                           d.rounded_rectangle((34, 46, 92, 88), 6, fill=SX2, outline=INK, width=3),
                           d.text((42, 54), 'SQL', fill=WHITE, font=_font(22))),
    'testable': lambda d: (cylinder(d, 4, 6, 40, 52, DB),
                           mini_grid(d, 26, 34, 92, 90, DB)),
    'tescommand': lambda d: (cylinder(d, 6, 8, 50, 70, DB),
                             d.polygon([(52, 44), (92, 66), (52, 88)], fill=SX, outline=INK)),
    'tesmemtable': lambda d: (mini_grid(d, 6, 8, 70, 64, DB),
                              d.rounded_rectangle((44, 52, 92, 90), 4, fill=SX2, outline=INK, width=3),
                              [d.rectangle((50 + i * 10, 46, 54 + i * 10, 52), fill=INK) for i in range(4)],
                              [d.rectangle((50 + i * 10, 90, 54 + i * 10, 95), fill=INK) for i in range(4)]),
}


def _font(size):
    for f in ('/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
              '/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf'):
        if os.path.exists(f):
            return ImageFont.truetype(f, size)
    return ImageFont.load_default()


ICONS.update(DB_ICONS)

for name, fn in ICONS.items():
    icon(name, fn)
print(len(ICONS), 'ícones gerados em', OUT)


def write_res(path, files):
    """Recurso Windows (.res) com cada PNG como RCDATA (nome = arquivo em maiúsculas)."""
    import struct

    def entry(name, data):
        hdr = struct.pack('<HH', 0xFFFF, 10) + (name.upper() + '\0').encode('utf-16-le')
        if len(hdr) % 4:
            hdr += b'\0' * (4 - len(hdr) % 4)
        hdr += struct.pack('<IHHII', 0, 0x1030, 0x0409, 0, 0)
        out = struct.pack('<II', len(data), 8 + len(hdr)) + hdr + data
        if len(out) % 4:
            out += b'\0' * (4 - len(out) % 4)
        return out

    with open(path, 'wb') as fh:
        fh.write(struct.pack('<IIHHHHIHHII', 0, 32, 0xFFFF, 0, 0xFFFF, 0, 0, 0, 0, 0, 0))
        for f in files:
            fh.write(entry(os.path.basename(f)[:-4], open(f, 'rb').read()))


write_res(os.path.join(os.path.dirname(OUT), 'eskit_images.res'),
          sorted(os.path.join(OUT, f) for f in os.listdir(OUT) if f.endswith('.png')))
print('eskit_images.res atualizado')
