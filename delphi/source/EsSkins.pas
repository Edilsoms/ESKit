{
 *****************************************************************************
  ESKit para Delphi (VCL) - EsSkins.pas
  Infraestrutura dos componentes Sx (inspirados no DevExpress VCL):
    TEsSkinController - equivalente ao TdxSkinController
    rotinas de desenho de glifos (setas, reticências, +/-, check, X)

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsSkins;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Math, Vcl.Controls,
  Vcl.Graphics, Vcl.GraphUtil, Vcl.Forms, Vcl.StdCtrls, EsGraphics, EsTheme;

type
  TEsGlyph = (sgArrowDown, sgArrowUp, sgArrowLeft, sgArrowRight, sgEllipsis,
    sgPlus, sgMinus, sgClose, sgCheck, sgCalendar, sgSearch, sgExpand,
    sgCollapse);

  { TEsSkinController }

  TEsSkinController = class(TComponent)
  private
    FSkinName: TEsStyleKind;
    FAccentColor: TAlphaColor;
    FSkinForms: Boolean;
    FSkinFile: string;
    FOnSkinChanged: TNotifyEvent;
    procedure SetSkinName(AValue: TEsStyleKind);
    procedure SetSkinFile(const AValue: string);
    procedure SetAccentColor(AValue: TAlphaColor);
    procedure SetSkinForms(AValue: Boolean);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Apply;
  published
    property SkinName: TEsStyleKind read FSkinName write SetSkinName default dsOffice2019Colorful;
    property AccentColor: TAlphaColor read FAccentColor write SetAccentColor default 0;
    { aplica cor de fundo/fonte do skin ao formulário dono }
    property SkinForms: Boolean read FSkinForms write SetSkinForms default True;
    { arquivo de tema (.estheme, ver EsThemes.SaveToFile) aplicado em tempo de
      execução no lugar de SkinName; caminho relativo = pasta do executável }
    property SkinFile: string read FSkinFile write SetSkinFile;
    property OnSkinChanged: TNotifyEvent read FOnSkinChanged write FOnSkinChanged;
  end;

{ atalhos de cor do tema como TColor }
function EsColor(C: TAlphaColor): TColor; inline;
function EsSkinTheme: TEsTheme; inline;

procedure EsFillGradientV(ACanvas: TCanvas; const R: TRect; C1, C2: TColor);
procedure EsFrame(ACanvas: TCanvas; const R: TRect; C: TColor);
procedure EsDrawGlyph(ACanvas: TCanvas; const R: TRect; AGlyph: TEsGlyph;
  AColor: TColor; ASize: Integer = 0);
{ caixinha de expandir/recolher (estilo grid DevExpress) }
procedure EsDrawExpandButton(ACanvas: TCanvas; const R: TRect; Expanded: Boolean);
procedure EsDrawCheckBox(ACanvas: TCanvas; const R: TRect; Checked: Boolean;
  Enabled: Boolean = True);
procedure EsDrawSortArrow(ACanvas: TCanvas; const R: TRect; Ascending: Boolean;
  AColor: TColor);
{ posição/limites/página de um TScrollBar, na ordem que a VCL aceita }
procedure EsSetScrollParams(SB: TScrollBar; APos, AMin, AMax, APage: Integer);
{ fundo de botão skinado (normal/hot/pressed) }
procedure EsDrawButtonFace(ACanvas: TCanvas; const R: TRect; Hot, Pressed,
  Focused: Boolean; Flat: Boolean = False);

implementation

{ TScrollBar da VCL valida Max >= PageSize a cada atribuição: ordem importa }
procedure EsSetScrollParams(SB: TScrollBar; APos, AMin, AMax, APage: Integer);
begin
  if AMax < AMin then AMax := AMin;
  SB.PageSize := 0;
  SB.SetParams(EnsureRange(APos, AMin, AMax), AMin, AMax);
  SB.PageSize := Min(Max(APage, 0), AMax - AMin + 1);
end;

function EsColor(C: TAlphaColor): TColor;
begin
  Result := AlphaColorToColor(C);
end;

function EsSkinTheme: TEsTheme;
begin
  Result := EsCurrentTheme;
end;

procedure EsFillGradientV(ACanvas: TCanvas; const R: TRect; C1, C2: TColor);
begin
  if (R.Right <= R.Left) or (R.Bottom <= R.Top) then Exit;
  if C1 = C2 then
  begin
    ACanvas.Brush.Style := bsSolid;
    ACanvas.Brush.Color := C1;
    ACanvas.FillRect(R);
  end
  else
    GradientFillCanvas(ACanvas, C1, C2, R, gdVertical);
end;

procedure EsFrame(ACanvas: TCanvas; const R: TRect; C: TColor);
begin
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Color := C;
  ACanvas.Brush.Style := bsClear;
  ACanvas.Rectangle(R);
  ACanvas.Brush.Style := bsSolid;
end;

procedure EsDrawGlyph(ACanvas: TCanvas; const R: TRect; AGlyph: TEsGlyph;
  AColor: TColor; ASize: Integer);
var
  CX, CY, S, I, D: Integer;
  P: array[0..2] of TPoint;
begin
  CX := (R.Left + R.Right) div 2;
  CY := (R.Top + R.Bottom) div 2;
  if ASize <= 0 then
    S := Max(3, Min(R.Right - R.Left, R.Bottom - R.Top) div 4)
  else
    S := ASize;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Color := AColor;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Brush.Color := AColor;
  case AGlyph of
    sgArrowDown, sgExpand:
      begin
        P[0] := Point(CX - S, CY - S div 2);
        P[1] := Point(CX + S, CY - S div 2);
        P[2] := Point(CX, CY + S div 2 + 1);
        ACanvas.Polygon(P);
      end;
    sgArrowUp, sgCollapse:
      begin
        P[0] := Point(CX - S, CY + S div 2);
        P[1] := Point(CX + S, CY + S div 2);
        P[2] := Point(CX, CY - S div 2 - 1);
        ACanvas.Polygon(P);
      end;
    sgArrowLeft:
      begin
        P[0] := Point(CX + S div 2, CY - S);
        P[1] := Point(CX + S div 2, CY + S);
        P[2] := Point(CX - S div 2 - 1, CY);
        ACanvas.Polygon(P);
      end;
    sgArrowRight:
      begin
        P[0] := Point(CX - S div 2, CY - S);
        P[1] := Point(CX - S div 2, CY + S);
        P[2] := Point(CX + S div 2 + 1, CY);
        ACanvas.Polygon(P);
      end;
    sgEllipsis:
      begin
        D := Max(2, S div 2);
        for I := -1 to 1 do
          ACanvas.FillRect(Rect(CX + I * (D + 2) - D div 2, CY - D div 2,
            CX + I * (D + 2) - D div 2 + D, CY - D div 2 + D));
      end;
    sgPlus, sgMinus:
      begin
        ACanvas.FillRect(Rect(CX - S, CY, CX + S + 1, CY + 1));
        if AGlyph = sgPlus then
          ACanvas.FillRect(Rect(CX, CY - S, CX + 1, CY + S + 1));
      end;
    sgClose:
      begin
        ACanvas.Pen.Width := 2;
        EsLine(ACanvas, CX - S, CY - S, CX + S, CY + S);
        EsLine(ACanvas, CX + S, CY - S, CX - S, CY + S);
        ACanvas.Pen.Width := 1;
      end;
    sgCheck:
      begin
        ACanvas.Pen.Width := 2;
        EsLine(ACanvas, CX - S, CY, CX - S div 3, CY + S * 2 div 3);
        EsLine(ACanvas, CX - S div 3, CY + S * 2 div 3, CX + S, CY - S * 2 div 3);
        ACanvas.Pen.Width := 1;
      end;
    sgCalendar:
      begin
        ACanvas.Brush.Style := bsClear;
        ACanvas.Rectangle(CX - S - 1, CY - S, CX + S + 2, CY + S + 1);
        ACanvas.Brush.Style := bsSolid;
        ACanvas.FillRect(Rect(CX - S - 1, CY - S, CX + S + 2, CY - S + 3));
        for I := 0 to 2 do
          ACanvas.FillRect(Rect(CX - S + 1 + I * ((2 * S) div 3), CY + 1,
            CX - S + 3 + I * ((2 * S) div 3), CY + 3));
      end;
    sgSearch:
      begin
        ACanvas.Brush.Style := bsClear;
        ACanvas.Pen.Width := 2;
        ACanvas.Ellipse(CX - S, CY - S, CX + S div 2, CY + S div 2);
        EsLine(ACanvas, CX + S div 4, CY + S div 4, CX + S, CY + S);
        ACanvas.Pen.Width := 1;
        ACanvas.Brush.Style := bsSolid;
      end;
  end;
end;

procedure EsDrawExpandButton(ACanvas: TCanvas; const R: TRect; Expanded: Boolean);
var
  T: TEsTheme;
  B: TRect;
  CX, CY, S: Integer;
begin
  T := EsCurrentTheme;
  CX := (R.Left + R.Right) div 2;
  CY := (R.Top + R.Bottom) div 2;
  S := 5;
  B := Rect(CX - S, CY - S, CX + S + 1, CY + S + 1);
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Brush.Color := EsColor(T.Surface);
  ACanvas.FillRect(B);
  EsFrame(ACanvas, B, EsColor(T.BorderHot));
  if Expanded then
    EsDrawGlyph(ACanvas, B, sgMinus, EsColor(T.Text), 3)
  else
    EsDrawGlyph(ACanvas, B, sgPlus, EsColor(T.Text), 3);
end;

procedure EsDrawCheckBox(ACanvas: TCanvas; const R: TRect; Checked: Boolean;
  Enabled: Boolean);
var
  T: TEsTheme;
  B: TRect;
  CX, CY, S: Integer;
begin
  T := EsCurrentTheme;
  CX := (R.Left + R.Right) div 2;
  CY := (R.Top + R.Bottom) div 2;
  S := 7;
  B := Rect(CX - S, CY - S, CX + S, CY + S);
  ACanvas.Brush.Style := bsSolid;
  if Checked then
    ACanvas.Brush.Color := EsColor(T.Accent)
  else
    ACanvas.Brush.Color := EsColor(T.Surface);
  ACanvas.FillRect(B);
  if Checked then
  begin
    EsFrame(ACanvas, B, EsColor(T.Accent));
    EsDrawGlyph(ACanvas, B, sgCheck, EsColor(T.AccentText), 4);
  end
  else
    EsFrame(ACanvas, B, EsColor(T.BorderHot));
end;

procedure EsDrawSortArrow(ACanvas: TCanvas; const R: TRect; Ascending: Boolean;
  AColor: TColor);
begin
  if Ascending then
    EsDrawGlyph(ACanvas, R, sgArrowUp, AColor, 4)
  else
    EsDrawGlyph(ACanvas, R, sgArrowDown, AColor, 4);
end;

procedure EsDrawButtonFace(ACanvas: TCanvas; const R: TRect; Hot, Pressed,
  Focused: Boolean; Flat: Boolean);
var
  T: TEsTheme;
  C1, C2: TAlphaColor;
begin
  T := EsCurrentTheme;
  C1 := T.ButtonFace;
  C2 := T.ButtonFace2;
  if not T.UseGradients then C2 := C1;
  if Pressed then
  begin
    C1 := BlendOver(T.Accent, FadeColor(T.ButtonFace, 0.55));
    C2 := C1;
  end
  else if Hot then
  begin
    C1 := BlendOver(C1, FadeColor(T.Accent, 0.18));
    C2 := BlendOver(C2, FadeColor(T.Accent, 0.18));
  end
  else if Flat then
    Exit;
  EsFillGradientV(ACanvas, R, EsColor(C1), EsColor(C2));
  if not Flat then
  begin
    if Focused or Pressed then
      EsFrame(ACanvas, R, EsColor(T.Accent))
    else if Hot then
      EsFrame(ACanvas, R, EsColor(T.BorderHot))
    else
      EsFrame(ACanvas, R, EsColor(T.Border));
  end;
end;

{ TEsSkinController }

constructor TEsSkinController.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSkinName := dsOffice2019Colorful;
  FSkinForms := True;
end;

procedure TEsSkinController.SetSkinFile(const AValue: string);
begin
  if FSkinFile = AValue then Exit;
  FSkinFile := AValue;
  if not (csLoading in ComponentState) then Apply;
end;

procedure TEsSkinController.Apply;
var
  F: TCustomForm;
  N: string;
begin
  N := FSkinFile;
  if (N <> '') and (Pos(':', N) = 0) and (N[1] <> '/') and (N[1] <> '\') then
    N := ExtractFilePath(ParamStr(0)) + N;
  if (N <> '') and not (csDesigning in ComponentState) and FileExists(N) then
    EsThemes.LoadFromFile(N)
  else
    EsThemes.ApplyStyle(FSkinName, FAccentColor);
  if FSkinForms and (Owner is TCustomForm) then
  begin
    F := TCustomForm(Owner);
    F.Color := EsColor(EsCurrentTheme.Background);
    F.Font.Color := EsColor(EsCurrentTheme.Text);
  end;
  if Assigned(FOnSkinChanged) then
    FOnSkinChanged(Self);
end;

procedure TEsSkinController.Loaded;
begin
  inherited Loaded;
  Apply;
end;

procedure TEsSkinController.SetSkinName(AValue: TEsStyleKind);
begin
  if FSkinName = AValue then Exit;
  FSkinName := AValue;
  if not (csLoading in ComponentState) then Apply;
end;

procedure TEsSkinController.SetAccentColor(AValue: TAlphaColor);
begin
  if FAccentColor = AValue then Exit;
  FAccentColor := AValue;
  if not (csLoading in ComponentState) then Apply;
end;

procedure TEsSkinController.SetSkinForms(AValue: Boolean);
begin
  if FSkinForms = AValue then Exit;
  FSkinForms := AValue;
  if not (csLoading in ComponentState) then Apply;
end;

end.
