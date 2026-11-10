{
 *****************************************************************************
  ESKit - esfxshapes.pas
  Formas e layouts no estilo FMX.Objects / FMX.Layouts:
    TEsFxRectangle (container), TEsFxLayout (container invisível),
    TEsFxCircle, TEsFxEllipse, TEsFxLine, TEsFxText

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsFxShapes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Types, Math, Controls, Graphics, EsGraphics, EsTheme,
  EsFxBase;

type
  { preenchimento ligado ao tema (equivale a usar um StyleLookup no FMX) }
  TEsFxThemeFill = (tfNone, tfSurface, tfSurfaceAlt, tfBackground, tfAccent);

  { TEsFxCustomShapeContainer }

  TEsFxCustomShapeContainer = class(TEsFxContainer)
  private
    FFill: TEsFxBrush;
    FStroke: TEsFxStroke;
    FShadow: TEsFxShadow;
    FGlow: TEsFxGlow;
    FBlur: TEsFxBlur;
    FBackgroundBlur: Single;
    FThemeFill: TEsFxThemeFill;
    procedure SetFill(AValue: TEsFxBrush);
    procedure SetStroke(AValue: TEsFxStroke);
    procedure SetShadow(AValue: TEsFxShadow);
    procedure SetGlow(AValue: TEsFxGlow);
    procedure SetBlur(AValue: TEsFxBlur);
    procedure SetBackgroundBlur(AValue: Single);
    procedure SetThemeFill(AValue: TEsFxThemeFill);
  protected
    function ShapeRect(OX, OY: Single): TRectF;
    function EffectiveFill: TEsFxBrush;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Fill: TEsFxBrush read FFill write SetFill;
    property Stroke: TEsFxStroke read FStroke write SetStroke;
    property Shadow: TEsFxShadow read FShadow write SetShadow;
    property Glow: TEsFxGlow read FGlow write SetGlow;
    { desfoque do próprio desenho (TBlurEffect) }
    property Blur: TEsFxBlur read FBlur write SetBlur;
    { desfoca o que está atrás da forma, dentro dela (vidro fosco); 0 = não }
    property BackgroundBlur: Single read FBackgroundBlur write SetBackgroundBlur;
    property ThemeFill: TEsFxThemeFill read FThemeFill write SetThemeFill default tfNone;
  end;

  { TEsFxRectangle - TRectangle do FMX, mas aceita filhos }

  TEsFxRectangle = class(TEsFxCustomShapeContainer)
  private
    FXRadius: Single;
    FYRadius: Single;
    FCorners: TEsCorners;
    procedure SetXRadius(AValue: Single);
    procedure SetYRadius(AValue: Single);
    procedure SetCorners(AValue: TEsCorners);
  public
    constructor Create(AOwner: TComponent); override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  published
    property XRadius: Single read FXRadius write SetXRadius;
    property YRadius: Single read FYRadius write SetYRadius;
    property Corners: TEsCorners read FCorners write SetCorners default EsAllCorners;
    property Align;
    property Anchors;
    property BorderSpacing;
    property ChildSizing;
    property Constraints;
    property Enabled;
    property Font;
    property Hint;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
  end;

  { TEsFxLayout - TLayout do FMX: agrupa controles sem desenhar nada }

  TEsFxLayout = class(TEsFxContainer)
  published
    property Align;
    property Anchors;
    property AutoSize;
    property BorderSpacing;
    property ChildSizing;
    property Constraints;
    property Enabled;
    property Visible;
    property OnClick;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
  end;

  { TEsFxCustomShape }

  TEsFxCustomShape = class(TEsFxGraphicControl)
  private
    FFill: TEsFxBrush;
    FStroke: TEsFxStroke;
    FShadow: TEsFxShadow;
    FGlow: TEsFxGlow;
    FBlur: TEsFxBlur;
    FBackgroundBlur: Single;
    FThemeFill: TEsFxThemeFill;
    procedure SetFill(AValue: TEsFxBrush);
    procedure SetStroke(AValue: TEsFxStroke);
    procedure SetShadow(AValue: TEsFxShadow);
    procedure SetGlow(AValue: TEsFxGlow);
    procedure SetBlur(AValue: TEsFxBlur);
    procedure SetBackgroundBlur(AValue: Single);
    procedure SetThemeFill(AValue: TEsFxThemeFill);
  protected
    function ShapeRect(OX, OY: Single): TRectF;
    function EffectiveFill: TEsFxBrush;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Fill: TEsFxBrush read FFill write SetFill;
    property Stroke: TEsFxStroke read FStroke write SetStroke;
    property Shadow: TEsFxShadow read FShadow write SetShadow;
    property Glow: TEsFxGlow read FGlow write SetGlow;
    { desfoque do próprio desenho (TBlurEffect) }
    property Blur: TEsFxBlur read FBlur write SetBlur;
    { desfoca o que está atrás da forma, dentro dela (vidro fosco); 0 = não }
    property BackgroundBlur: Single read FBackgroundBlur write SetBackgroundBlur;
    property ThemeFill: TEsFxThemeFill read FThemeFill write SetThemeFill default tfNone;
    property Align;
    property Anchors;
    property BorderSpacing;
    property Constraints;
    property Enabled;
    property Hint;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
  end;

  { TEsFxEllipse }

  TEsFxEllipse = class(TEsFxCustomShape)
  protected
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  end;

  { TEsFxCircle - sempre redondo, centralizado }

  TEsFxCircle = class(TEsFxCustomShape)
  protected
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  end;

  TEsFxLineType = (ltDiagonal, ltTop, ltLeft, ltHorizontalCenter, ltVerticalCenter);

  { TEsFxLine }

  TEsFxLine = class(TEsFxCustomShape)
  private
    FLineType: TEsFxLineType;
    procedure SetLineType(AValue: TEsFxLineType);
  protected
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property LineType: TEsFxLineType read FLineType write SetLineType default ltHorizontalCenter;
  end;

  { TEsFxText - TText do FMX }

  TEsFxText = class(TEsFxGraphicControl)
  private
    FTextSettings: TEsFxTextSettings;
    procedure SetTextSettings(AValue: TEsFxTextSettings);
  protected
    procedure RenderContent(ACanvas: TCanvas); override;
    procedure TextChanged; override;
    class function GetControlClassDefaultSize: TSize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Text;
    property TextSettings: TEsFxTextSettings read FTextSettings write SetTextSettings;
    property Align;
    property Anchors;
    property BorderSpacing;
    property Constraints;
    property Enabled;
    property Font;
    property ParentFont;
    property Hint;
    property ShowHint;
    property ParentShowHint;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseUp;
  end;

function EsFxAlignToH(A: TEsFxTextAlign): TEsHAlign;
function EsFxAlignToV(A: TEsFxTextAlign): TEsVAlign;

implementation

function EsFxAlignToH(A: TEsFxTextAlign): TEsHAlign;
begin
  case A of
    txLeading: Result := dhaLeading;
    txTrailing: Result := dhaTrailing;
  else
    Result := dhaCenter;
  end;
end;

function EsFxAlignToV(A: TEsFxTextAlign): TEsVAlign;
begin
  case A of
    txLeading: Result := dvaLeading;
    txTrailing: Result := dvaTrailing;
  else
    Result := dvaCenter;
  end;
end;

var
  GThemeBrush: TEsFxBrush = nil;

function ThemeBrush(AKind: TEsFxThemeFill; AFallback: TEsFxBrush): TEsFxBrush;
var
  T: TEsTheme;
  C: TAlphaColor;
begin
  if AKind = tfNone then Exit(AFallback);
  T := EsCurrentTheme;
  case AKind of
    tfSurface: C := T.Surface;
    tfSurfaceAlt: C := T.SurfaceAlt;
    tfBackground: C := T.Background;
  else
    C := T.Accent;
  end;
  if GThemeBrush = nil then
    GThemeBrush := TEsFxBrush.Create(bkSolid, C);
  GThemeBrush.Kind := bkSolid;
  GThemeBrush.Color := C;
  Result := GThemeBrush;
end;

procedure RenderShadowAndBody(S: TEsSurface; const R: TRectF; Radius: Single;
  Corners: TEsCorners; Fill: TEsFxBrush; Stroke: TEsFxStroke; Shadow: TEsFxShadow;
  Glow: TEsFxGlow; Ellipse: Boolean; Blur: TEsFxBlur; BackgroundBlur: Single);

  procedure Draw(T: TEsSurface);
  var
    SR: TRectF;
    GS, GR, Rad: Single;
  begin
    Rad := Radius;
    if Shadow.Enabled and (Shadow.Opacity > 0) then
    begin
      SR := R;
      SR.Offset(Shadow.OffsetX, Shadow.OffsetY);
      if Ellipse then
        Rad := Min(R.Width, R.Height) / 2;
      T.SoftRoundRect(SR, Rad, Max(Shadow.Softness, 0.5),
        FadeColor(Shadow.ShadowColor, Shadow.Opacity));
      Rad := Radius;
    end;
    if (Glow <> nil) and Glow.Enabled and (Glow.Opacity > 0) and (Glow.Softness > 0) then
    begin
      // halo: opaco na borda da forma e esmaecendo até Softness pixels fora
      GS := Glow.Softness;
      if Ellipse then
        GR := Min(R.Width, R.Height) / 2 + GS / 2
      else
        GR := Rad + GS / 2;
      T.SoftRoundRect(EsInflate(R, GS / 2), GR, GS / 2, FadeColor(Glow.GlowColor, Glow.Opacity));
    end;
    if Fill.IsVisible then
    begin
      if Ellipse then
        T.FillEllipse(R, Fill.ToPaint(R))
      else
        T.FillRoundRect(R, Rad, Fill.ToPaint(R), Corners);
    end;
    if Stroke.IsVisible and (Stroke.Thickness > 0) then
    begin
      if Ellipse then
        T.StrokeEllipse(R, Stroke.Thickness, Stroke.ToPaint(R))
      else
        T.StrokeRoundRect(R, Rad, Stroke.Thickness, Stroke.ToPaint(R), Corners);
    end;
  end;

var
  OnBlack, OnWhite: TEsSurface;
begin
  // vidro fosco: desfoca o fundo dentro da forma antes de pintá-la
  if BackgroundBlur > 0 then
  begin
    if Ellipse then
      S.BlurRoundRect(R, Min(R.Width, R.Height) / 2, BackgroundBlur)
    else
      S.BlurRoundRect(R, Radius, BackgroundBlur);
  end;
  if (Blur = nil) or not Blur.Enabled or (Blur.Softness < 0.5) then
  begin
    Draw(S);
    Exit;
  end;
  // TBlurEffect: a forma é desenhada numa camada (sobre preto e sobre branco
  // para obter a transparência), desfocada e composta sobre o fundo nítido
  OnBlack := TEsSurface.Create(S.Width, S.Height);
  OnWhite := TEsSurface.Create(S.Width, S.Height);
  try
    OnBlack.Clear(TAlphaColor($FF000000));
    OnWhite.Clear(TAlphaColor($FFFFFFFF));
    OnBlack.Opacity := S.Opacity;
    OnWhite.Opacity := S.Opacity;
    Draw(OnBlack);
    Draw(OnWhite);
    S.BlurLayer(OnBlack, OnWhite, Rect(0, 0, S.Width, S.Height), Blur.Softness);
  finally
    OnBlack.Free;
    OnWhite.Free;
  end;
end;

{ TEsFxCustomShapeContainer }

constructor TEsFxCustomShapeContainer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFill := TEsFxBrush.Create(bkSolid, TAlphaColor($FFE0E0E0));
  FFill.OnChange := @PropsChanged;
  FStroke := TEsFxStroke.Create(bkSolid, TAlphaColor($FF000000));
  FStroke.OnChange := @PropsChanged;
  FShadow := TEsFxShadow.Create;
  FShadow.OnChange := @PropsChanged;
  FGlow := TEsFxGlow.Create;
  FGlow.OnChange := @PropsChanged;
  FBlur := TEsFxBlur.Create;
  FBlur.OnChange := @PropsChanged;
  SetInitialBounds(0, 0, 100, 50);
end;

destructor TEsFxCustomShapeContainer.Destroy;
begin
  FFill.Free;
  FStroke.Free;
  FShadow.Free;
  FGlow.Free;
  FBlur.Free;
  inherited Destroy;
end;

procedure TEsFxCustomShapeContainer.SetFill(AValue: TEsFxBrush);
begin
  FFill.Assign(AValue);
end;

procedure TEsFxCustomShapeContainer.SetStroke(AValue: TEsFxStroke);
begin
  FStroke.Assign(AValue);
end;

procedure TEsFxCustomShapeContainer.SetShadow(AValue: TEsFxShadow);
begin
  FShadow.Assign(AValue);
end;

procedure TEsFxCustomShapeContainer.SetGlow(AValue: TEsFxGlow);
begin
  FGlow.Assign(AValue);
end;

procedure TEsFxCustomShapeContainer.SetBlur(AValue: TEsFxBlur);
begin
  FBlur.Assign(AValue);
end;

procedure TEsFxCustomShapeContainer.SetBackgroundBlur(AValue: Single);
begin
  AValue := EnsureRange(AValue, 0, 100);
  if FBackgroundBlur = AValue then Exit;
  FBackgroundBlur := AValue;
  PropsChanged(Self);
end;

procedure TEsFxCustomShapeContainer.SetThemeFill(AValue: TEsFxThemeFill);
begin
  if FThemeFill = AValue then Exit;
  FThemeFill := AValue;
  PropsChanged(Self);
end;

function TEsFxCustomShapeContainer.EffectiveFill: TEsFxBrush;
begin
  Result := ThemeBrush(FThemeFill, FFill);
end;

function TEsFxCustomShapeContainer.ShapeRect(OX, OY: Single): TRectF;
var
  M: Single;
begin
  M := Max(Max(FShadow.Margin, FGlow.Margin), FBlur.Margin);
  Result := EsRectF(OX + M, OY + M, OX + Width - M, OY + Height - M);
end;

{ TEsFxRectangle }

constructor TEsFxRectangle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorners := EsAllCorners;
end;

procedure TEsFxRectangle.SetXRadius(AValue: Single);
begin
  if FXRadius = AValue then Exit;
  FXRadius := Max(0, AValue);
  PropsChanged(Self);
end;

procedure TEsFxRectangle.SetYRadius(AValue: Single);
begin
  if FYRadius = AValue then Exit;
  FYRadius := Max(0, AValue);
  PropsChanged(Self);
end;

procedure TEsFxRectangle.SetCorners(AValue: TEsCorners);
begin
  if FCorners = AValue then Exit;
  FCorners := AValue;
  PropsChanged(Self);
end;

procedure TEsFxRectangle.RenderShape(S: TEsSurface; OX, OY: Single);
begin
  RenderShadowAndBody(S, ShapeRect(OX, OY), Max(FXRadius, FYRadius), FCorners,
    EffectiveFill, Stroke, Shadow, Glow, False, Blur, BackgroundBlur);
end;

{ TEsFxCustomShape }

constructor TEsFxCustomShape.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFill := TEsFxBrush.Create(bkSolid, TAlphaColor($FFE0E0E0));
  FFill.OnChange := @PropsChanged;
  FStroke := TEsFxStroke.Create(bkSolid, TAlphaColor($FF000000));
  FStroke.OnChange := @PropsChanged;
  FShadow := TEsFxShadow.Create;
  FShadow.OnChange := @PropsChanged;
  FGlow := TEsFxGlow.Create;
  FGlow.OnChange := @PropsChanged;
  FBlur := TEsFxBlur.Create;
  FBlur.OnChange := @PropsChanged;
  SetInitialBounds(0, 0, 50, 50);
end;

destructor TEsFxCustomShape.Destroy;
begin
  FFill.Free;
  FStroke.Free;
  FShadow.Free;
  FGlow.Free;
  FBlur.Free;
  inherited Destroy;
end;

procedure TEsFxCustomShape.SetFill(AValue: TEsFxBrush);
begin
  FFill.Assign(AValue);
end;

procedure TEsFxCustomShape.SetStroke(AValue: TEsFxStroke);
begin
  FStroke.Assign(AValue);
end;

procedure TEsFxCustomShape.SetShadow(AValue: TEsFxShadow);
begin
  FShadow.Assign(AValue);
end;

procedure TEsFxCustomShape.SetGlow(AValue: TEsFxGlow);
begin
  FGlow.Assign(AValue);
end;

procedure TEsFxCustomShape.SetBlur(AValue: TEsFxBlur);
begin
  FBlur.Assign(AValue);
end;

procedure TEsFxCustomShape.SetBackgroundBlur(AValue: Single);
begin
  AValue := EnsureRange(AValue, 0, 100);
  if FBackgroundBlur = AValue then Exit;
  FBackgroundBlur := AValue;
  PropsChanged(Self);
end;

procedure TEsFxCustomShape.SetThemeFill(AValue: TEsFxThemeFill);
begin
  if FThemeFill = AValue then Exit;
  FThemeFill := AValue;
  PropsChanged(Self);
end;

function TEsFxCustomShape.EffectiveFill: TEsFxBrush;
begin
  Result := ThemeBrush(FThemeFill, FFill);
end;

function TEsFxCustomShape.ShapeRect(OX, OY: Single): TRectF;
var
  M: Single;
begin
  M := Max(Max(FShadow.Margin, FGlow.Margin), FBlur.Margin);
  Result := EsRectF(OX + M, OY + M, OX + Width - M, OY + Height - M);
end;

{ TEsFxEllipse }

procedure TEsFxEllipse.RenderShape(S: TEsSurface; OX, OY: Single);
begin
  RenderShadowAndBody(S, ShapeRect(OX, OY), 0, EsAllCorners, EffectiveFill, Stroke,
    Shadow, Glow, True, Blur, BackgroundBlur);
end;

{ TEsFxCircle }

procedure TEsFxCircle.RenderShape(S: TEsSurface; OX, OY: Single);
var
  R: TRectF;
  D, CX, CY: Single;
begin
  R := ShapeRect(OX, OY);
  D := Min(R.Width, R.Height);
  CX := (R.Left + R.Right) / 2;
  CY := (R.Top + R.Bottom) / 2;
  R := EsRectF(CX - D / 2, CY - D / 2, CX + D / 2, CY + D / 2);
  RenderShadowAndBody(S, R, 0, EsAllCorners, EffectiveFill, Stroke, Shadow, Glow, True,
    Blur, BackgroundBlur);
end;

{ TEsFxLine }

constructor TEsFxLine.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLineType := ltHorizontalCenter;
  Fill.Kind := bkNone;
  SetInitialBounds(0, 0, 100, 10);
end;

procedure TEsFxLine.SetLineType(AValue: TEsFxLineType);
begin
  if FLineType = AValue then Exit;
  FLineType := AValue;
  Invalidate;
end;

procedure TEsFxLine.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T, H: Single;
  P: TEsPaint;
begin
  if not Stroke.IsVisible then Exit;
  T := Max(Stroke.Thickness, 0.5);
  H := T / 2;
  P := Stroke.ToPaint(EsRectF(OX, OY, OX + Width, OY + Height));
  case FLineType of
    ltDiagonal: S.DrawLine(OX + H, OY + H, OX + Width - H, OY + Height - H, T, P);
    ltTop: S.FillRect(EsRectF(OX, OY, OX + Width, OY + T), P);
    ltLeft: S.FillRect(EsRectF(OX, OY, OX + T, OY + Height), P);
    ltHorizontalCenter:
      S.FillRect(EsRectF(OX, OY + Height / 2 - H, OX + Width, OY + Height / 2 + H), P);
    ltVerticalCenter:
      S.FillRect(EsRectF(OX + Width / 2 - H, OY, OX + Width / 2 + H, OY + Height), P);
  end;
end;

{ TEsFxText }

constructor TEsFxText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTextSettings := TEsFxTextSettings.Create(txCenter, txCenter);
  FTextSettings.OnChange := @PropsChanged;
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;

destructor TEsFxText.Destroy;
begin
  FTextSettings.Free;
  inherited Destroy;
end;

class function TEsFxText.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 120;
  Result.CY := 24;
end;

procedure TEsFxText.SetTextSettings(AValue: TEsFxTextSettings);
begin
  FTextSettings.Assign(AValue);
end;

procedure TEsFxText.TextChanged;
begin
  inherited TextChanged;
  Invalidate;
end;

procedure TEsFxText.RenderContent(ACanvas: TCanvas);
begin
  EsDrawText(ACanvas, Rect(0, 0, Width, Height), Text,
    EsFxAlignToH(FTextSettings.HorzAlign), EsFxAlignToV(FTextSettings.VertAlign),
    FTextSettings.WordWrap,
    TextColorFor(FTextSettings.ResolveColor(ThemeText)), FTextSettings.Trimming);
end;

finalization
  FreeAndNil(GThemeBrush);

end.
