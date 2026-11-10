{
 *****************************************************************************
  ESKit para Delphi (VCL)

  EsGraphics.pas
  Motor gráfico compartilhado:
    - TAlphaColor / TAlphaColors (os mesmos de System.UITypes, como no FMX)
    - TEsSurface: buffer de pixels com rasterização anti-aliased por
      "signed distance fields" (retângulos arredondados, elipses, arcos,
      linhas, sombras suaves e gradientes lineares).
  Desenha em memória e depois copia um TBitmap 32 bits opaco para o Canvas.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsGraphics;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Math, System.UITypes,
  Vcl.Graphics;

type
  { Cor no formato FMX: $AARRGGBB (mesmo tipo do FireMonkey) }
  TAlphaColor = System.UITypes.TAlphaColor;
  TAlphaColors = System.UITypes.TAlphaColors;

  TEsCorner = (dcTopLeft, dcTopRight, dcBottomLeft, dcBottomRight);
  TEsCorners = set of TEsCorner;

  TEsPaintKind = (pkSolid, pkLinear);

  { Descrição de "tinta": cor sólida ou gradiente linear (coordenadas da
    superfície). }
  TEsPaint = record
    Kind: TEsPaintKind;
    C1, C2: TAlphaColor;
    X1, Y1, X2, Y2: Single;
  end;

  TEsHAlign = (dhaLeading, dhaCenter, dhaTrailing);
  TEsVAlign = (dvaLeading, dvaCenter, dvaTrailing);

  { TEsSurface }

  TEsSurface = class
  private
    FWidth, FHeight: Integer;
    FData: array of TAlphaColor;
    FOpacity: Single;
    function PaintAt(const P: TEsPaint; X, Y: Single): TAlphaColor; inline;
    procedure Cover(X, Y: Integer; Cov: Single; const P: TEsPaint); inline;
    procedure ClipBounds(const R: TRectF; out X0, Y0, X1, Y1: Integer);
    { pixels XA..XB da linha Y totalmente cobertos (caminho rápido do interior) }
    procedure FillSpan(Y, XA, XB: Integer; const P: TEsPaint);
  public
    constructor Create(AWidth, AHeight: Integer);
    procedure Clear(AColor: TAlphaColor);
    procedure BlendPixel(X, Y: Integer; AColor: TAlphaColor; Coverage: Single);
    function GetPixel(X, Y: Integer): TAlphaColor;

    procedure FillRect(const R: TRectF; const P: TEsPaint);
    procedure FillRoundRect(const R: TRectF; Radius: Single; const P: TEsPaint;
      Corners: TEsCorners = [dcTopLeft, dcTopRight, dcBottomLeft, dcBottomRight]);
    procedure StrokeRoundRect(const R: TRectF; Radius, Thickness: Single;
      const P: TEsPaint;
      Corners: TEsCorners = [dcTopLeft, dcTopRight, dcBottomLeft, dcBottomRight]);
    { sombra / brilho suave: Blur = raio de esfumaçamento }
    procedure SoftRoundRect(const R: TRectF; Radius, Blur: Single;
      AColor: TAlphaColor);
    procedure FillEllipse(const R: TRectF; const P: TEsPaint);
    procedure StrokeEllipse(const R: TRectF; Thickness: Single; const P: TEsPaint);
    { arco: ângulos em graus, 0 = topo, sentido horário (como relógio) }
    procedure StrokeArc(CX, CY, Radius, Thickness, StartAngle, SweepAngle: Single;
      const P: TEsPaint; RoundCaps: Boolean = True);
    procedure DrawLine(X1, Y1, X2, Y2, Thickness: Single; const P: TEsPaint);

    { desfoque (aproximação gaussiana com 3 passadas de caixa; Radius ~ sigma) }
    function Clone: TEsSurface;
    procedure Blur(const R: TRect; Radius: Single);
    { desfoque só dentro do retângulo arredondado (vidro fosco / "acrylic") }
    procedure BlurRoundRect(const R: TRectF; CornerRadius, Radius: Single);
    { compõe sobre esta superfície uma camada desfocada (como o TBlurEffect do
      FMX): a camada foi desenhada duas vezes, sobre preto (AOnBlack) e sobre
      branco (AOnWhite), o que dá a cor e a transparência de cada pixel }
    procedure BlurLayer(AOnBlack, AOnWhite: TEsSurface; const R: TRect; Radius: Single);

    procedure AssignToBitmap(ABitmap: TBitmap);

    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    { opacidade global aplicada a todas as primitivas (0..1) }
    property Opacity: Single read FOpacity write FOpacity;
  end;

{ cores }
function MakeAlphaColor(R, G, B: Byte; A: Byte = 255): TAlphaColor; inline;
function AlphaColorToColor(C: TAlphaColor): TColor;
function ColorToAlphaColor(C: TColor; A: Byte = 255): TAlphaColor;
function AlphaOf(C: TAlphaColor): Byte; inline;
function WithAlpha(C: TAlphaColor; A: Byte): TAlphaColor; inline;
function FadeColor(C: TAlphaColor; Factor: Single): TAlphaColor;
function InterpolateColor(C1, C2: TAlphaColor; T: Single): TAlphaColor;
function LightenColor(C: TAlphaColor; Amount: Single): TAlphaColor;
function DarkenColor(C: TAlphaColor; Amount: Single): TAlphaColor;
{ compõe C (com alfa) sobre um fundo opaco }
function BlendOver(Back, Fore: TAlphaColor): TAlphaColor;
function IsDarkColor(C: TAlphaColor): Boolean;

{ tintas }
function EsSolid(C: TAlphaColor): TEsPaint;
function EsLinear(C1, C2: TAlphaColor; X1, Y1, X2, Y2: Single): TEsPaint;
function EsVertical(C1, C2: TAlphaColor; const R: TRectF): TEsPaint;

{ texto }
procedure EsDrawText(ACanvas: TCanvas; const R: TRect; const AText: string;
  HAlign: TEsHAlign; VAlign: TEsVAlign; WordWrap: Boolean; AColor: TColor;
  EndEllipsis: Boolean = False);

{ conversão texto <-> cor (nomes FMX, #AARRGGBB, $AARRGGBB, xAARRGGBB) }
function AlphaColorToString(C: TAlphaColor): string;
function StringToAlphaColor(const S: string; out C: TAlphaColor): Boolean;
{ streaming no formato do FMX: "claWhite" ou "xFF0067C0" }
function AlphaColorToIdent(Int: Longint; var Ident: string): Boolean;
function IdentToAlphaColor(const Ident: string; var Int: Longint): Boolean;

type
  TEsNamedColor = record
    Name: string;
    Value: TAlphaColor;
  end;

const
  EsNamedColors: array[0..27] of TEsNamedColor = (
    (Name: 'Null'; Value: TAlphaColor($00000000)),
    (Name: 'Black'; Value: TAlphaColor($FF000000)),
    (Name: 'White'; Value: TAlphaColor($FFFFFFFF)),
    (Name: 'Red'; Value: TAlphaColor($FFFF0000)),
    (Name: 'Green'; Value: TAlphaColor($FF008000)),
    (Name: 'Lime'; Value: TAlphaColor($FF00FF00)),
    (Name: 'Blue'; Value: TAlphaColor($FF0000FF)),
    (Name: 'Yellow'; Value: TAlphaColor($FFFFFF00)),
    (Name: 'Orange'; Value: TAlphaColor($FFFFA500)),
    (Name: 'Purple'; Value: TAlphaColor($FF800080)),
    (Name: 'Gray'; Value: TAlphaColor($FF808080)),
    (Name: 'Silver'; Value: TAlphaColor($FFC0C0C0)),
    (Name: 'LightGray'; Value: TAlphaColor($FFD3D3D3)),
    (Name: 'DarkGray'; Value: TAlphaColor($FFA9A9A9)),
    (Name: 'Dodgerblue'; Value: TAlphaColor($FF1E90FF)),
    (Name: 'Steelblue'; Value: TAlphaColor($FF4682B4)),
    (Name: 'Royalblue'; Value: TAlphaColor($FF4169E1)),
    (Name: 'Crimson'; Value: TAlphaColor($FFDC143C)),
    (Name: 'Seagreen'; Value: TAlphaColor($FF2E8B57)),
    (Name: 'Teal'; Value: TAlphaColor($FF008080)),
    (Name: 'Navy'; Value: TAlphaColor($FF000080)),
    (Name: 'Gold'; Value: TAlphaColor($FFFFD700)),
    (Name: 'Tomato'; Value: TAlphaColor($FFFF6347)),
    (Name: 'Whitesmoke'; Value: TAlphaColor($FFF5F5F5)),
    (Name: 'Gainsboro'; Value: TAlphaColor($FFDCDCDC)),
    (Name: 'Slategray'; Value: TAlphaColor($FF708090)),
    (Name: 'Platinum'; Value: TAlphaColor($FFE0E0E0)),
    (Name: 'Aliceblue'; Value: TAlphaColor($FFF0F8FF))
  );

{ canvas de medição (funciona antes de o controle ter janela/handle) }
function EsMeasureCanvas(AFont: TFont): TCanvas;
{ linha de (X1,Y1) até (X2,Y2), sem o último ponto (como TCanvas.Line do Lazarus) }
procedure EsLine(ACanvas: TCanvas; X1, Y1, X2, Y2: Integer);

function EsRectF(L, T, R, B: Single): TRectF; inline;
function EsPointF(X, Y: Single): TPointF; inline;
function EsInflate(const R: TRectF; D: Single): TRectF; inline;

const
  EsAllCorners = [dcTopLeft, dcTopRight, dcBottomLeft, dcBottomRight];

implementation

var
  GMeasureBmp: TBitmap = nil;

function EsMeasureCanvas(AFont: TFont): TCanvas;
begin
  if GMeasureBmp = nil then
  begin
    GMeasureBmp := TBitmap.Create;
    GMeasureBmp.SetSize(4, 4);
  end;
  GMeasureBmp.Canvas.Font.Assign(AFont);
  Result := GMeasureBmp.Canvas;
end;

procedure EsLine(ACanvas: TCanvas; X1, Y1, X2, Y2: Integer);
begin
  ACanvas.MoveTo(X1, Y1);
  ACanvas.LineTo(X2, Y2);
end;

function AlphaColorToString(C: TAlphaColor): string;
var
  I: Integer;
begin
  for I := Low(EsNamedColors) to High(EsNamedColors) do
    if EsNamedColors[I].Value = C then
      Exit(EsNamedColors[I].Name);
  Result := '#' + IntToHex(C, 8);
end;

function StringToAlphaColor(const S: string; out C: TAlphaColor): Boolean;
var
  I: Integer;
  T: string;
  V: Int64;
begin
  C := 0;
  T := Trim(S);
  if (Length(T) > 3) and SameText(Copy(T, 1, 3), 'cla') then
    Delete(T, 1, 3);
  for I := Low(EsNamedColors) to High(EsNamedColors) do
    if SameText(EsNamedColors[I].Name, T) then
    begin
      C := EsNamedColors[I].Value;
      Exit(True);
    end;
  if (T <> '') and CharInSet(T[1], ['#', '$', 'x', 'X']) then
    Delete(T, 1, 1)
  else if (Length(T) > 2) and SameText(Copy(T, 1, 2), '0x') then
    Delete(T, 1, 2);
  if Length(T) = 6 then T := 'FF' + T; // #RRGGBB = opaco
  Result := (Length(T) = 8) and TryStrToInt64('$' + T, V);
  if Result then C := TAlphaColor(V);
end;

function AlphaColorToIdent(Int: Longint; var Ident: string): Boolean;
var
  I: Integer;
  C: TAlphaColor;
begin
  C := TAlphaColor(Cardinal(Int));
  for I := Low(EsNamedColors) to High(EsNamedColors) do
    if EsNamedColors[I].Value = C then
    begin
      Ident := 'cla' + EsNamedColors[I].Name;
      Exit(True);
    end;
  Ident := 'x' + IntToHex(C, 8);
  Result := True;
end;

function IdentToAlphaColor(const Ident: string; var Int: Longint): Boolean;
var
  C: TAlphaColor;
begin
  // só aceita os formatos próprios (não "rouba" identificadores de TColor etc.)
  Result := False;
  if (Length(Ident) > 3) and SameText(Copy(Ident, 1, 3), 'cla') then
    Result := StringToAlphaColor(Ident, C)
  else if (Length(Ident) = 9) and CharInSet(Ident[1], ['x', 'X']) then
    Result := StringToAlphaColor(Ident, C);
  if Result then
    Int := Longint(Cardinal(C));
end;

function MakeAlphaColor(R, G, B: Byte; A: Byte): TAlphaColor;
begin
  Result := TAlphaColor((Cardinal(A) shl 24) or (Cardinal(R) shl 16) or
    (Cardinal(G) shl 8) or B);
end;

function AlphaOf(C: TAlphaColor): Byte;
begin
  Result := (C shr 24) and $FF;
end;

function WithAlpha(C: TAlphaColor; A: Byte): TAlphaColor;
begin
  Result := TAlphaColor((C and $00FFFFFF) or (Cardinal(A) shl 24));
end;

function AlphaColorToColor(C: TAlphaColor): TColor;
begin
  // TColor = $00BBGGRR
  Result := TColor(((C shr 16) and $FF) or (C and $FF00) or ((C and $FF) shl 16));
end;

function ColorToAlphaColor(C: TColor; A: Byte): TAlphaColor;
var
  RGB: Cardinal;
begin
  RGB := Cardinal(ColorToRGB(C));
  Result := MakeAlphaColor(RGB and $FF, (RGB shr 8) and $FF, (RGB shr 16) and $FF, A);
end;

function FadeColor(C: TAlphaColor; Factor: Single): TAlphaColor;
begin
  Result := WithAlpha(C, EnsureRange(Round(AlphaOf(C) * Factor), 0, 255));
end;

function InterpolateColor(C1, C2: TAlphaColor; T: Single): TAlphaColor;

  function Mix(A, B: Integer): Byte;
  begin
    Result := EnsureRange(Round(A + (B - A) * T), 0, 255);
  end;

begin
  if T <= 0 then Exit(C1);
  if T >= 1 then Exit(C2);
  Result := MakeAlphaColor(
    Mix(Integer((C1 shr 16) and $FF), Integer((C2 shr 16) and $FF)),
    Mix(Integer((C1 shr 8) and $FF), Integer((C2 shr 8) and $FF)),
    Mix(Integer(C1 and $FF), Integer(C2 and $FF)),
    Mix(Integer((C1 shr 24) and $FF), Integer((C2 shr 24) and $FF)));
end;

function LightenColor(C: TAlphaColor; Amount: Single): TAlphaColor;
begin
  Result := WithAlpha(InterpolateColor(WithAlpha(C, 255), TAlphaColors.White,
    Amount), AlphaOf(C));
end;

function DarkenColor(C: TAlphaColor; Amount: Single): TAlphaColor;
begin
  Result := WithAlpha(InterpolateColor(WithAlpha(C, 255), TAlphaColors.Black,
    Amount), AlphaOf(C));
end;

function BlendOver(Back, Fore: TAlphaColor): TAlphaColor;
var
  A: Single;
begin
  A := AlphaOf(Fore) / 255;
  Result := WithAlpha(InterpolateColor(WithAlpha(Back, 255),
    WithAlpha(Fore, 255), A), 255);
end;

function IsDarkColor(C: TAlphaColor): Boolean;
var
  L: Single;
begin
  L := 0.299 * ((C shr 16) and $FF) + 0.587 * ((C shr 8) and $FF) +
    0.114 * (C and $FF);
  Result := L < 128;
end;

function EsSolid(C: TAlphaColor): TEsPaint;
begin
  Result.Kind := pkSolid;
  Result.C1 := C;
  Result.C2 := C;
  Result.X1 := 0; Result.Y1 := 0; Result.X2 := 0; Result.Y2 := 0;
end;

function EsLinear(C1, C2: TAlphaColor; X1, Y1, X2, Y2: Single): TEsPaint;
begin
  Result.Kind := pkLinear;
  Result.C1 := C1;
  Result.C2 := C2;
  Result.X1 := X1; Result.Y1 := Y1; Result.X2 := X2; Result.Y2 := Y2;
  if (Abs(X2 - X1) < 0.001) and (Abs(Y2 - Y1) < 0.001) then
    Result.Kind := pkSolid;
end;

function EsVertical(C1, C2: TAlphaColor; const R: TRectF): TEsPaint;
begin
  Result := EsLinear(C1, C2, R.Left, R.Top, R.Left, R.Bottom);
end;

function EsRectF(L, T, R, B: Single): TRectF;
begin
  Result.Left := L; Result.Top := T; Result.Right := R; Result.Bottom := B;
end;

function EsPointF(X, Y: Single): TPointF;
begin
  Result.X := X;
  Result.Y := Y;
end;

function EsInflate(const R: TRectF; D: Single): TRectF;
begin
  Result := EsRectF(R.Left - D, R.Top - D, R.Right + D, R.Bottom + D);
end;

procedure EsDrawText(ACanvas: TCanvas; const R: TRect; const AText: string;
  HAlign: TEsHAlign; VAlign: TEsVAlign; WordWrap: Boolean; AColor: TColor;
  EndEllipsis: Boolean);
var
  Fmt: TTextFormat;
  RR, Calc: TRect;
  S: string;
  H: Integer;
begin
  if AText = '' then Exit;
  Fmt := [tfNoPrefix];
  case HAlign of
    dhaCenter: Include(Fmt, tfCenter);
    dhaTrailing: Include(Fmt, tfRight);
  end;
  if EndEllipsis then Include(Fmt, tfEndEllipsis);
  ACanvas.Brush.Style := bsClear;
  ACanvas.Font.Color := AColor;
  RR := R;
  if WordWrap then
  begin
    Include(Fmt, tfWordBreak);
    // DrawText só centraliza verticalmente uma linha: calcula a altura
    if VAlign <> dvaLeading then
    begin
      Calc := R;
      S := AText;
      ACanvas.TextRect(Calc, S, Fmt + [tfCalcRect]);
      H := Calc.Bottom - Calc.Top;
      if H < R.Bottom - R.Top then
        if VAlign = dvaCenter then
          RR.Top := R.Top + (R.Bottom - R.Top - H) div 2
        else
          RR.Top := R.Bottom - H;
    end;
  end
  else
  begin
    Include(Fmt, tfSingleLine);
    case VAlign of
      dvaCenter: Include(Fmt, tfVerticalCenter);
      dvaTrailing: Include(Fmt, tfBottom);
    end;
  end;
  S := AText;
  ACanvas.TextRect(RR, S, Fmt);
  ACanvas.Brush.Style := bsSolid;
end;

{ TEsSurface }

constructor TEsSurface.Create(AWidth, AHeight: Integer);
begin
  inherited Create;
  FWidth := Max(AWidth, 1);
  FHeight := Max(AHeight, 1);
  SetLength(FData, FWidth * FHeight);
  FOpacity := 1;
end;

procedure TEsSurface.Clear(AColor: TAlphaColor);
var
  I: Integer;
begin
  AColor := WithAlpha(AColor, 255);
  for I := 0 to High(FData) do
    FData[I] := AColor;
end;

function TEsSurface.GetPixel(X, Y: Integer): TAlphaColor;
begin
  if (X < 0) or (Y < 0) or (X >= FWidth) or (Y >= FHeight) then
    Exit(TAlphaColors.Null);
  Result := FData[Y * FWidth + X];
end;

procedure TEsSurface.BlendPixel(X, Y: Integer; AColor: TAlphaColor;
  Coverage: Single);
var
  A: Single;
  Idx: Integer;
  D: TAlphaColor;
  IA, R, G, B, DR, DG, DB: Integer;
begin
  if (X < 0) or (Y < 0) or (X >= FWidth) or (Y >= FHeight) then Exit;
  A := (AlphaOf(AColor) / 255) * Coverage * FOpacity;
  if A <= 0.002 then Exit;
  Idx := Y * FWidth + X;
  if A >= 0.998 then
  begin
    FData[Idx] := AColor or $FF000000;
    Exit;
  end;
  D := FData[Idx];
  IA := Round(A * 256);
  DR := Integer((D shr 16) and $FF);
  DG := Integer((D shr 8) and $FF);
  DB := Integer(D and $FF);
  R := DR + ((Integer((AColor shr 16) and $FF) - DR) * IA) div 256;
  G := DG + ((Integer((AColor shr 8) and $FF) - DG) * IA) div 256;
  B := DB + ((Integer(AColor and $FF) - DB) * IA) div 256;
  FData[Idx] := $FF000000 or (Cardinal(EnsureRange(R, 0, 255)) shl 16) or
    (Cardinal(EnsureRange(G, 0, 255)) shl 8) or Cardinal(EnsureRange(B, 0, 255));
end;

function TEsSurface.PaintAt(const P: TEsPaint; X, Y: Single): TAlphaColor;
var
  DX, DY, L2, T: Single;
begin
  if P.Kind = pkSolid then Exit(P.C1);
  DX := P.X2 - P.X1;
  DY := P.Y2 - P.Y1;
  L2 := DX * DX + DY * DY;
  T := ((X - P.X1) * DX + (Y - P.Y1) * DY) / L2;
  Result := InterpolateColor(P.C1, P.C2, EnsureRange(T, 0, 1));
end;

procedure TEsSurface.Cover(X, Y: Integer; Cov: Single; const P: TEsPaint);
begin
  if Cov <= 0 then Exit;
  if Cov > 1 then Cov := 1;
  BlendPixel(X, Y, PaintAt(P, X + 0.5, Y + 0.5), Cov);
end;

procedure TEsSurface.ClipBounds(const R: TRectF; out X0, Y0, X1, Y1: Integer);
begin
  X0 := Max(0, Floor(R.Left) - 1);
  Y0 := Max(0, Floor(R.Top) - 1);
  X1 := Min(FWidth - 1, Ceil(R.Right) + 1);
  Y1 := Min(FHeight - 1, Ceil(R.Bottom) + 1);
end;

procedure TEsSurface.FillSpan(Y, XA, XB: Integer; const P: TEsPaint);
var
  X, IA, SR, SG, SB, R, G, B: Integer;
  A: Single;
  C, D: TAlphaColor;
  Pix: ^TAlphaColor;
begin
  if (Y < 0) or (Y >= FHeight) then Exit;
  if XA < 0 then XA := 0;
  if XB >= FWidth then XB := FWidth - 1;
  if XB < XA then Exit;
  if P.Kind <> pkSolid then
  begin
    for X := XA to XB do
      BlendPixel(X, Y, PaintAt(P, X + 0.5, Y + 0.5), 1);
    Exit;
  end;
  A := (AlphaOf(P.C1) / 255) * FOpacity;
  if A <= 0.002 then Exit;
  Pix := @FData[Y * FWidth + XA];
  if A >= 0.998 then
  begin
    C := P.C1 or $FF000000;
    for X := XA to XB do
    begin
      Pix^ := C;
      Inc(Pix);
    end;
    Exit;
  end;
  // mistura com alfa constante: inteiros, sem chamadas por pixel
  IA := Round(A * 256);
  SR := (P.C1 shr 16) and $FF;
  SG := (P.C1 shr 8) and $FF;
  SB := P.C1 and $FF;
  for X := XA to XB do
  begin
    D := Pix^;
    R := Integer((D shr 16) and $FF);
    G := Integer((D shr 8) and $FF);
    B := Integer(D and $FF);
    R := R + ((SR - R) * IA) div 256;
    G := G + ((SG - G) * IA) div 256;
    B := B + ((SB - B) * IA) div 256;
    Pix^ := $FF000000 or (Cardinal(R) shl 16) or (Cardinal(G) shl 8) or Cardinal(B);
    Inc(Pix);
  end;
end;

function CovFromDist(D: Single): Single; inline;
begin
  Result := 0.5 - D;
  if Result < 0 then Result := 0
  else if Result > 1 then Result := 1;
end;

{ distância com sinal para retângulo arredondado (negativa = dentro) }
function SdRoundRect(PX, PY: Single; const R: TRectF; Rad: Single;
  Corners: TEsCorners): Single;
var
  CX, CY, HX, HY, QX, QY, RR, MX, MY: Single;
  C: TEsCorner;
begin
  CX := (R.Left + R.Right) / 2;
  CY := (R.Top + R.Bottom) / 2;
  HX := (R.Right - R.Left) / 2;
  HY := (R.Bottom - R.Top) / 2;
  if PX < CX then
  begin
    if PY < CY then C := dcTopLeft else C := dcBottomLeft;
  end
  else
  begin
    if PY < CY then C := dcTopRight else C := dcBottomRight;
  end;
  if C in Corners then RR := Rad else RR := 0;
  RR := Min(RR, Min(HX, HY));
  QX := Abs(PX - CX) - HX + RR;
  QY := Abs(PY - CY) - HY + RR;
  MX := Max(QX, 0);
  MY := Max(QY, 0);
  Result := Sqrt(MX * MX + MY * MY) + Min(Max(QX, QY), 0) - RR;
end;

function SdEllipse(PX, PY: Single; const R: TRectF): Single;
var
  CX, CY, RX, RY, NX, NY, L: Single;
begin
  CX := (R.Left + R.Right) / 2;
  CY := (R.Top + R.Bottom) / 2;
  RX := Max((R.Right - R.Left) / 2, 0.01);
  RY := Max((R.Bottom - R.Top) / 2, 0.01);
  NX := (PX - CX) / RX;
  NY := (PY - CY) / RY;
  L := Sqrt(NX * NX + NY * NY);
  // aproximação: escala pela menor dimensão (boa para AA)
  Result := (L - 1) * Min(RX, RY);
  if (RX <> RY) and (L > 0.0001) then
    // corrige pelo gradiente da função implícita
    Result := (L - 1) / Sqrt(Sqr(NX / RX) + Sqr(NY / RY)) * L;
end;

procedure TEsSurface.FillRect(const R: TRectF; const P: TEsPaint);
var
  X, Y, X0, Y0, X1, Y1, XI0, XI1: Integer;
  CX, CY: Single;
begin
  ClipBounds(R, X0, Y0, X1, Y1);
  // colunas inteiramente dentro do retângulo
  XI0 := Ceil(R.Left);
  XI1 := Floor(R.Right) - 1;
  for Y := Y0 to Y1 do
  begin
    CY := Min(Y + 1, R.Bottom) - Max(Y, R.Top);
    if CY <= 0 then Continue;
    if (CY >= 0.999) and (XI1 >= XI0) then
    begin
      for X := X0 to Min(XI0 - 1, X1) do
      begin
        CX := Min(X + 1, R.Right) - Max(X, R.Left);
        if CX > 0 then Cover(X, Y, Min(CX, 1), P);
      end;
      FillSpan(Y, XI0, XI1, P);
      for X := Max(XI1 + 1, X0) to X1 do
      begin
        CX := Min(X + 1, R.Right) - Max(X, R.Left);
        if CX > 0 then Cover(X, Y, Min(CX, 1), P);
      end;
      Continue;
    end;
    for X := X0 to X1 do
    begin
      CX := Min(X + 1, R.Right) - Max(X, R.Left);
      if CX <= 0 then Continue;
      Cover(X, Y, Min(CX, 1) * Min(CY, 1), P);
    end;
  end;
end;

procedure TEsSurface.FillRoundRect(const R: TRectF; Radius: Single;
  const P: TEsPaint; Corners: TEsCorners);
var
  Y, X0, Y0, X1, Y1, XL, XR: Integer;
  Cv: Single;
begin
  if (R.Right <= R.Left) or (R.Bottom <= R.Top) then Exit;
  if Radius <= 0 then
  begin
    FillRect(R, P);
    Exit;
  end;
  ClipBounds(R, X0, Y0, X1, Y1);
  // forma convexa: em cada linha, só as bordas usam a função de distância;
  // o miolo totalmente coberto vai pelo caminho rápido
  for Y := Y0 to Y1 do
  begin
    XL := X0;
    while XL <= X1 do
    begin
      Cv := CovFromDist(SdRoundRect(XL + 0.5, Y + 0.5, R, Radius, Corners));
      if Cv >= 1 then Break;
      Cover(XL, Y, Cv, P);
      Inc(XL);
    end;
    if XL > X1 then Continue;
    XR := X1;
    while XR > XL do
    begin
      Cv := CovFromDist(SdRoundRect(XR + 0.5, Y + 0.5, R, Radius, Corners));
      if Cv >= 1 then Break;
      Cover(XR, Y, Cv, P);
      Dec(XR);
    end;
    FillSpan(Y, XL, XR, P);
  end;
end;

procedure TEsSurface.StrokeRoundRect(const R: TRectF; Radius, Thickness: Single;
  const P: TEsPaint; Corners: TEsCorners);
var
  X, Y, X0, Y0, X1, Y1, XL: Integer;
  D: Single;
begin
  if (R.Right <= R.Left) or (R.Bottom <= R.Top) or (Thickness <= 0) then Exit;
  ClipBounds(R, X0, Y0, X1, Y1);
  for Y := Y0 to Y1 do
  begin
    // da esquerda até entrar no "buraco" (cobertura zero por dentro do traço)
    XL := X0;
    while XL <= X1 do
    begin
      D := SdRoundRect(XL + 0.5, Y + 0.5, R, Radius, Corners);
      if D + Thickness <= -0.5 then Break;
      // traço por dentro do contorno
      Cover(XL, Y, CovFromDist(D) - CovFromDist(D + Thickness), P);
      Inc(XL);
    end;
    if XL > X1 then Continue;
    X := X1;
    while X > XL do
    begin
      D := SdRoundRect(X + 0.5, Y + 0.5, R, Radius, Corners);
      if D + Thickness <= -0.5 then Break;
      Cover(X, Y, CovFromDist(D) - CovFromDist(D + Thickness), P);
      Dec(X);
    end;
  end;
end;

procedure TEsSurface.SoftRoundRect(const R: TRectF; Radius, Blur: Single;
  AColor: TAlphaColor);
var
  X, Y, X0, Y0, X1, Y1, XL: Integer;
  D, T: Single;
  P: TEsPaint;
begin
  if Blur < 0.5 then Blur := 0.5;
  P := EsSolid(AColor);
  ClipBounds(EsInflate(R, Blur), X0, Y0, X1, Y1);
  for Y := Y0 to Y1 do
  begin
    XL := X0;
    while XL <= X1 do
    begin
      D := SdRoundRect(XL + 0.5, Y + 0.5, R, Radius, EsAllCorners);
      T := EnsureRange(0.5 - D / (2 * Blur), 0, 1);
      if T >= 1 then Break;
      // suavização tipo smoothstep
      T := T * T * (3 - 2 * T);
      Cover(XL, Y, T, P);
      Inc(XL);
    end;
    if XL > X1 then Continue;
    X := X1;
    while X > XL do
    begin
      D := SdRoundRect(X + 0.5, Y + 0.5, R, Radius, EsAllCorners);
      T := EnsureRange(0.5 - D / (2 * Blur), 0, 1);
      if T >= 1 then Break;
      T := T * T * (3 - 2 * T);
      Cover(X, Y, T, P);
      Dec(X);
    end;
    FillSpan(Y, XL, X, P);
  end;
end;

procedure TEsSurface.FillEllipse(const R: TRectF; const P: TEsPaint);
var
  Y, X0, Y0, X1, Y1, XL, XR: Integer;
  Cv: Single;
begin
  if (R.Right <= R.Left) or (R.Bottom <= R.Top) then Exit;
  ClipBounds(R, X0, Y0, X1, Y1);
  for Y := Y0 to Y1 do
  begin
    XL := X0;
    while XL <= X1 do
    begin
      Cv := CovFromDist(SdEllipse(XL + 0.5, Y + 0.5, R));
      if Cv >= 1 then Break;
      Cover(XL, Y, Cv, P);
      Inc(XL);
    end;
    if XL > X1 then Continue;
    XR := X1;
    while XR > XL do
    begin
      Cv := CovFromDist(SdEllipse(XR + 0.5, Y + 0.5, R));
      if Cv >= 1 then Break;
      Cover(XR, Y, Cv, P);
      Dec(XR);
    end;
    FillSpan(Y, XL, XR, P);
  end;
end;

procedure TEsSurface.StrokeEllipse(const R: TRectF; Thickness: Single;
  const P: TEsPaint);
var
  X, Y, X0, Y0, X1, Y1, XL: Integer;
  D: Single;
begin
  if (R.Right <= R.Left) or (R.Bottom <= R.Top) or (Thickness <= 0) then Exit;
  ClipBounds(R, X0, Y0, X1, Y1);
  for Y := Y0 to Y1 do
  begin
    XL := X0;
    while XL <= X1 do
    begin
      D := SdEllipse(XL + 0.5, Y + 0.5, R);
      if D + Thickness <= -0.5 then Break;
      Cover(XL, Y, CovFromDist(D) - CovFromDist(D + Thickness), P);
      Inc(XL);
    end;
    if XL > X1 then Continue;
    X := X1;
    while X > XL do
    begin
      D := SdEllipse(X + 0.5, Y + 0.5, R);
      if D + Thickness <= -0.5 then Break;
      Cover(X, Y, CovFromDist(D) - CovFromDist(D + Thickness), P);
      Dec(X);
    end;
  end;
end;

function NormDeg(V: Single): Single;
begin
  Result := V - 360 * Floor(V / 360);
end;

procedure TEsSurface.StrokeArc(CX, CY, Radius, Thickness, StartAngle,
  SweepAngle: Single; const P: TEsPaint; RoundCaps: Boolean);
var
  X, Y, X0, Y0, X1, Y1: Integer;
  PX, PY, L, A, D, HT, S0, S1, AX, AY, BX, BY, DA, DB: Single;
  InArc, Full: Boolean;

begin
  if (Radius <= 0) or (Thickness <= 0) or (Abs(SweepAngle) < 0.01) then Exit;
  HT := Thickness / 2;
  Full := Abs(SweepAngle) >= 359.99;
  if SweepAngle < 0 then
  begin
    StartAngle := StartAngle + SweepAngle;
    SweepAngle := -SweepAngle;
  end;
  S0 := NormDeg(StartAngle);
  S1 := S0 + SweepAngle;
  // centros das pontas (0 graus = topo, sentido horário)
  AX := CX + Radius * Sin(DegToRad(S0));
  AY := CY - Radius * Cos(DegToRad(S0));
  BX := CX + Radius * Sin(DegToRad(S1));
  BY := CY - Radius * Cos(DegToRad(S1));
  ClipBounds(EsRectF(CX - Radius - HT, CY - Radius - HT, CX + Radius + HT,
    CY + Radius + HT), X0, Y0, X1, Y1);
  for Y := Y0 to Y1 do
    for X := X0 to X1 do
    begin
      PX := X + 0.5;
      PY := Y + 0.5;
      L := Sqrt(Sqr(PX - CX) + Sqr(PY - CY));
      if Full then
        InArc := True
      else
      begin
        A := RadToDeg(ArcTan2(PX - CX, -(PY - CY)));
        A := NormDeg(A);
        if A < S0 then A := A + 360;
        InArc := A <= S1;
      end;
      if InArc then
        D := Abs(L - Radius) - HT
      else if RoundCaps then
      begin
        DA := Sqrt(Sqr(PX - AX) + Sqr(PY - AY));
        DB := Sqrt(Sqr(PX - BX) + Sqr(PY - BY));
        D := Min(DA, DB) - HT;
      end
      else
        Continue;
      Cover(X, Y, CovFromDist(D), P);
    end;
end;

procedure TEsSurface.DrawLine(X1, Y1, X2, Y2, Thickness: Single;
  const P: TEsPaint);
var
  X, Y, BX0, BY0, BX1, BY1: Integer;
  PX, PY, DX, DY, L2, T, QX, QY, HT: Single;
begin
  HT := Thickness / 2;
  DX := X2 - X1;
  DY := Y2 - Y1;
  L2 := DX * DX + DY * DY;
  ClipBounds(EsRectF(Min(X1, X2) - HT, Min(Y1, Y2) - HT, Max(X1, X2) + HT,
    Max(Y1, Y2) + HT), BX0, BY0, BX1, BY1);
  for Y := BY0 to BY1 do
    for X := BX0 to BX1 do
    begin
      PX := X + 0.5;
      PY := Y + 0.5;
      if L2 < 0.0001 then
        T := 0
      else
        T := EnsureRange(((PX - X1) * DX + (PY - Y1) * DY) / L2, 0, 1);
      QX := X1 + T * DX - PX;
      QY := Y1 + T * DY - PY;
      Cover(X, Y, CovFromDist(Sqrt(QX * QX + QY * QY) - HT), P);
    end;
end;

{ ---------- desfoque ---------- }

type
  TEsChannelBuf = array of Integer;

{ uma passada de caixa (horizontal com AStep = 1, vertical com AStep = largura)
  sobre NC canais intercalados }
procedure BoxPass(var Src, Dst: TEsChannelBuf; NC, ALen, ACount, AStep, AStride, R: Integer);
var
  Line, I, Base, Idx, J, W, C: Integer;
  Sum: array[0..3] of Integer;

  function Px(K: Integer): Integer;
  begin
    if K < 0 then K := 0 else if K >= ALen then K := ALen - 1;
    Result := Base + K * AStep;
  end;

begin
  W := 2 * R + 1;
  for Line := 0 to ACount - 1 do
  begin
    Base := Line * AStride;
    for C := 0 to NC - 1 do Sum[C] := 0;
    for J := -R to R do
    begin
      Idx := Px(J) * NC;
      for C := 0 to NC - 1 do Inc(Sum[C], Src[Idx + C]);
    end;
    for I := 0 to ALen - 1 do
    begin
      Idx := (Base + I * AStep) * NC;
      for C := 0 to NC - 1 do Dst[Idx + C] := Sum[C] div W;
      J := Px(I + R + 1) * NC;
      Idx := Px(I - R) * NC;
      for C := 0 to NC - 1 do Inc(Sum[C], Src[J + C] - Src[Idx + C]);
    end;
  end;
end;

procedure BlurChannels(var Buf: TEsChannelBuf; NC, W, H: Integer; Radius: Single);
var
  Tmp: TEsChannelBuf;
  R, Pass: Integer;
begin
  if (W <= 0) or (H <= 0) or (Radius < 0.5) then Exit;
  // 3 caixas de largura w ~ sqrt(4*sigma^2 + 1) somam a variância de uma gaussiana
  R := Max(1, Round((Sqrt(4 * Radius * Radius + 1) - 1) / 2));
  Tmp := nil;
  SetLength(Tmp, Length(Buf));
  for Pass := 1 to 3 do
  begin
    BoxPass(Buf, Tmp, NC, W, H, 1, W, R);   // horizontal
    BoxPass(Tmp, Buf, NC, H, W, W, 1, R);   // vertical
  end;
end;

function TEsSurface.Clone: TEsSurface;
begin
  Result := TEsSurface.Create(FWidth, FHeight);
  if Length(FData) > 0 then
    Move(FData[0], Result.FData[0], Length(FData) * SizeOf(TAlphaColor));
  Result.FOpacity := FOpacity;
end;

{ região com margem para a amostragem, limitada à superfície }
procedure RegionBounds(S: TEsSurface; const R: TRect; Margin: Integer;
  out RX, RY, RW, RH: Integer);
begin
  RX := Max(0, R.Left - Margin);
  RY := Max(0, R.Top - Margin);
  RW := Min(S.Width, R.Right + Margin) - RX;
  RH := Min(S.Height, R.Bottom + Margin) - RY;
end;

procedure ExtractRGB(S: TEsSurface; RX, RY, RW, RH: Integer; out Buf: TEsChannelBuf);
var
  X, Y, K: Integer;
  C: TAlphaColor;
begin
  Buf := nil;
  if (RW <= 0) or (RH <= 0) then Exit;
  SetLength(Buf, RW * RH * 3);
  K := 0;
  for Y := RY to RY + RH - 1 do
    for X := RX to RX + RW - 1 do
    begin
      C := S.GetPixel(X, Y);
      Buf[K] := (C shr 16) and $FF;
      Buf[K + 1] := (C shr 8) and $FF;
      Buf[K + 2] := C and $FF;
      Inc(K, 3);
    end;
end;

function Clamp255(V: Integer): Cardinal; inline;
begin
  if V < 0 then Result := 0 else if V > 255 then Result := 255 else Result := V;
end;

procedure TEsSurface.Blur(const R: TRect; Radius: Single);
var
  Buf: TEsChannelBuf;
  RX, RY, RW, RH, X, Y, K: Integer;
  CR: TRect;
begin
  if Radius < 0.5 then Exit;
  RegionBounds(Self, R, Ceil(Radius * 3), RX, RY, RW, RH);
  ExtractRGB(Self, RX, RY, RW, RH, Buf);
  if Buf = nil then Exit;
  BlurChannels(Buf, 3, RW, RH, Radius);
  CR := Rect(Max(R.Left, 0), Max(R.Top, 0), Min(R.Right, FWidth), Min(R.Bottom, FHeight));
  for Y := CR.Top to CR.Bottom - 1 do
    for X := CR.Left to CR.Right - 1 do
    begin
      K := ((Y - RY) * RW + (X - RX)) * 3;
      FData[Y * FWidth + X] := $FF000000 or (Clamp255(Buf[K]) shl 16) or
        (Clamp255(Buf[K + 1]) shl 8) or Clamp255(Buf[K + 2]);
    end;
end;

procedure TEsSurface.BlurRoundRect(const R: TRectF; CornerRadius, Radius: Single);
var
  Buf: TEsChannelBuf;
  RX, RY, RW, RH, X, Y, X0, Y0, X1, Y1, K, IA: Integer;
  Cv: Single;
  D, C: TAlphaColor;

  function Mix(ShiftBits: Integer): Cardinal;
  var
    A, B: Integer;
  begin
    A := Integer((D shr ShiftBits) and $FF);
    B := Integer((C shr ShiftBits) and $FF);
    Result := Clamp255(A + ((B - A) * IA) div 256) shl ShiftBits;
  end;

begin
  if Radius < 0.5 then Exit;
  ClipBounds(R, X0, Y0, X1, Y1);
  if (X1 < X0) or (Y1 < Y0) then Exit;
  RegionBounds(Self, Rect(X0, Y0, X1 + 1, Y1 + 1), Ceil(Radius * 3), RX, RY, RW, RH);
  ExtractRGB(Self, RX, RY, RW, RH, Buf);
  if Buf = nil then Exit;
  BlurChannels(Buf, 3, RW, RH, Radius);
  for Y := Y0 to Y1 do
    for X := X0 to X1 do
    begin
      Cv := CovFromDist(SdRoundRect(X + 0.5, Y + 0.5, R, CornerRadius, EsAllCorners));
      if Cv <= 0 then Continue;
      K := ((Y - RY) * RW + (X - RX)) * 3;
      C := $FF000000 or (Clamp255(Buf[K]) shl 16) or (Clamp255(Buf[K + 1]) shl 8) or
        Clamp255(Buf[K + 2]);
      if Cv >= 1 then
        FData[Y * FWidth + X] := C
      else
      begin
        // borda suave entre o fundo nítido e o desfocado
        D := FData[Y * FWidth + X];
        IA := Round(Cv * 256);
        FData[Y * FWidth + X] := $FF000000 or Mix(16) or Mix(8) or Mix(0);
      end;
    end;
end;

procedure TEsSurface.BlurLayer(AOnBlack, AOnWhite: TEsSurface; const R: TRect; Radius: Single);
var
  Buf: TEsChannelBuf;
  RX, RY, RW, RH, X, Y, K, M, A, AR, AG, AB: Integer;
  Grow, CR: TRect;
  CB, CW, D: TAlphaColor;
begin
  if (AOnBlack = nil) or (AOnWhite = nil) or (AOnBlack.Width <> FWidth) or
     (AOnBlack.Height <> FHeight) or (AOnWhite.Width <> FWidth) or
     (AOnWhite.Height <> FHeight) then Exit;
  M := Ceil(Max(Radius, 0) * 3);
  // a camada desfocada se espalha até M pixels além do que foi desenhado
  Grow := Rect(R.Left - M, R.Top - M, R.Right + M, R.Bottom + M);
  RegionBounds(Self, Grow, M, RX, RY, RW, RH);
  if (RW <= 0) or (RH <= 0) then Exit;
  // alfa e cor pré-multiplicada (escala 0..255*16 para precisão)
  Buf := nil;
  SetLength(Buf, RW * RH * 4);
  K := 0;
  for Y := RY to RY + RH - 1 do
    for X := RX to RX + RW - 1 do
    begin
      CB := AOnBlack.FData[Y * FWidth + X];
      CW := AOnWhite.FData[Y * FWidth + X];
      // sobre branco: c*a + 255*(1-a); sobre preto: c*a  =>  1-a = (W-B)/255
      A := 255 - (Integer((CW shr 8) and $FF) - Integer((CB shr 8) and $FF));
      A := EnsureRange(A, 0, 255);
      Buf[K] := A * 16;
      Buf[K + 1] := Integer((CB shr 16) and $FF) * 16;
      Buf[K + 2] := Integer((CB shr 8) and $FF) * 16;
      Buf[K + 3] := Integer(CB and $FF) * 16;
      Inc(K, 4);
    end;
  if Radius >= 0.5 then
    BlurChannels(Buf, 4, RW, RH, Radius);
  // fundo nítido * (1 - alfa desfocado) + cor desfocada
  CR := Rect(Max(Grow.Left, 0), Max(Grow.Top, 0), Min(Grow.Right, FWidth), Min(Grow.Bottom, FHeight));
  for Y := CR.Top to CR.Bottom - 1 do
    for X := CR.Left to CR.Right - 1 do
    begin
      K := ((Y - RY) * RW + (X - RX)) * 4;
      A := Buf[K];
      if A <= 0 then Continue;
      D := FData[Y * FWidth + X];
      AR := (Integer((D shr 16) and $FF) * (4080 - A) + Buf[K + 1] * 255) div 4080;
      AG := (Integer((D shr 8) and $FF) * (4080 - A) + Buf[K + 2] * 255) div 4080;
      AB := (Integer(D and $FF) * (4080 - A) + Buf[K + 3] * 255) div 4080;
      FData[Y * FWidth + X] := $FF000000 or (Clamp255(AR) shl 16) or (Clamp255(AG) shl 8) or
        Clamp255(AB);
    end;
end;

procedure TEsSurface.AssignToBitmap(ABitmap: TBitmap);
var
  Y, X: Integer;
  Line: PCardinal;
begin
  ABitmap.PixelFormat := pf32bit;
  ABitmap.AlphaFormat := afIgnored;
  ABitmap.SetSize(FWidth, FHeight);
  // $AARRGGBB em little-endian = B, G, R, A: o mesmo layout do DIB 32 bits
  for Y := 0 to FHeight - 1 do
  begin
    Line := ABitmap.ScanLine[Y];
    for X := 0 to FWidth - 1 do
    begin
      Line^ := FData[Y * FWidth + X] or $FF000000; // sempre opaco
      Inc(Line);
    end;
  end;
  ABitmap.Modified := True;
end;

initialization
  // System.UIConsts (FMX) já registra o streaming "claXxx"; senão, registra aqui
  if not Assigned(FindIntToIdent(TypeInfo(TAlphaColor))) then
    RegisterIntegerConsts(TypeInfo(TAlphaColor), IdentToAlphaColor, AlphaColorToIdent);

finalization
  FreeAndNil(GMeasureBmp);

end.
