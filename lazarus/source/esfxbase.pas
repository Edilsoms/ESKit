{
 *****************************************************************************
  ESKit - esfxbase.pas
  Classes base dos componentes FX (inspirados no FireMonkey):
    - TEsFxBrush / TEsFxStroke / TEsFxShadow / TEsFxGlow / TEsFxBlur / TEsFxTextSettings
    - TEsFxGraphicControl (folha) e TEsFxContainer (aceita filhos)
    - composição de fundo: controles FX "enxergam" o desenho do pai FX,
      simulando a transparência real do FMX
    - TEsFxTicker: relógio único compartilhado por animações e transições

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsFxBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Types, Math, Controls, Graphics, ExtCtrls, LCLType,
  LCLIntf, LMessages, EsGraphics, EsTheme;

type
  TEsFxBrushKind = (bkNone, bkSolid, bkGradient);
  TEsFxGradientStyle = (gsVertical, gsHorizontal, gsDiagonal);
  TEsFxTextAlign = (txLeading, txCenter, txTrailing);
  TEsFxTrigger = (ftNone, ftMouseOver, ftPressed, ftFocused, ftChecked);

  { TEsFxBrush }

  TEsFxBrush = class(TPersistent)
  private
    FKind: TEsFxBrushKind;
    FColor: TAlphaColor;
    FGradientColor: TAlphaColor;
    FGradientStyle: TEsFxGradientStyle;
    FOnChange: TNotifyEvent;
    procedure SetKind(AValue: TEsFxBrushKind);
    procedure SetColor(AValue: TAlphaColor);
    procedure SetGradientColor(AValue: TAlphaColor);
    procedure SetGradientStyle(AValue: TEsFxGradientStyle);
  protected
    procedure Changed;
  public
    constructor Create(AKind: TEsFxBrushKind; AColor: TAlphaColor);
    procedure Assign(Source: TPersistent); override;
    function ToPaint(const R: TRectF): TEsPaint;
    function IsVisible: Boolean;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property Kind: TEsFxBrushKind read FKind write SetKind default bkSolid;
    property Color: TAlphaColor read FColor write SetColor;
    property GradientColor: TAlphaColor read FGradientColor write SetGradientColor;
    property GradientStyle: TEsFxGradientStyle read FGradientStyle write SetGradientStyle default gsVertical;
  end;

  { TEsFxStroke }

  TEsFxStroke = class(TEsFxBrush)
  private
    FThickness: Single;
    procedure SetThickness(AValue: Single);
  public
    constructor Create(AKind: TEsFxBrushKind; AColor: TAlphaColor);
    procedure Assign(Source: TPersistent); override;
  published
    property Thickness: Single read FThickness write SetThickness;
  end;

  { TEsFxShadow - equivalente ao TShadowEffect do FMX }

  TEsFxShadow = class(TPersistent)
  private
    FEnabled: Boolean;
    FDistance: Single;
    FDirection: Single;
    FSoftness: Single;
    FOpacity: Single;
    FShadowColor: TAlphaColor;
    FOnChange: TNotifyEvent;
    procedure SetEnabled(AValue: Boolean);
    procedure SetDistance(AValue: Single);
    procedure SetDirection(AValue: Single);
    procedure SetSoftness(AValue: Single);
    procedure SetOpacity(AValue: Single);
    procedure SetShadowColor(AValue: TAlphaColor);
    procedure Changed;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    { quanto o desenho principal precisa recuar para caber a sombra }
    function Margin: Single;
    function OffsetX: Single;
    function OffsetY: Single;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property Distance: Single read FDistance write SetDistance;
    property Direction: Single read FDirection write SetDirection;
    property Softness: Single read FSoftness write SetSoftness;
    property Opacity: Single read FOpacity write SetOpacity;
    property ShadowColor: TAlphaColor read FShadowColor write SetShadowColor;
  end;

  { TEsFxGlow - equivalente ao TGlowEffect do FMX: halo colorido em volta
    da forma (sem deslocamento) }

  TEsFxGlow = class(TPersistent)
  private
    FEnabled: Boolean;
    FSoftness: Single;
    FOpacity: Single;
    FGlowColor: TAlphaColor;
    FOnChange: TNotifyEvent;
    procedure SetEnabled(AValue: Boolean);
    procedure SetSoftness(AValue: Single);
    procedure SetOpacity(AValue: Single);
    procedure SetGlowColor(AValue: TAlphaColor);
    procedure Changed;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    function Margin: Single;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property Softness: Single read FSoftness write SetSoftness;
    property Opacity: Single read FOpacity write SetOpacity;
    property GlowColor: TAlphaColor read FGlowColor write SetGlowColor;
  end;

  { TEsFxBlur - equivalente ao TBlurEffect do FMX: desfoca o desenho da forma
    (o fundo atrás dela continua nítido) }

  TEsFxBlur = class(TPersistent)
  private
    FEnabled: Boolean;
    FSoftness: Single;
    FOnChange: TNotifyEvent;
    procedure SetEnabled(AValue: Boolean);
    procedure SetSoftness(AValue: Single);
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    { espaço que o desfoque precisa em volta da forma }
    function Margin: Single;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property Softness: Single read FSoftness write SetSoftness;
  end;

  { TEsFxTextSettings - equivalente ao TTextSettings do FMX }

  TEsFxTextSettings = class(TPersistent)
  private
    FFontColor: TAlphaColor;
    FHorzAlign: TEsFxTextAlign;
    FVertAlign: TEsFxTextAlign;
    FWordWrap: Boolean;
    FTrimming: Boolean;
    FOnChange: TNotifyEvent;
    procedure SetFontColor(AValue: TAlphaColor);
    procedure SetHorzAlign(AValue: TEsFxTextAlign);
    procedure SetVertAlign(AValue: TEsFxTextAlign);
    procedure SetWordWrap(AValue: Boolean);
    procedure SetTrimming(AValue: Boolean);
    procedure Changed;
  public
    constructor Create(AHorz, AVert: TEsFxTextAlign);
    procedure Assign(Source: TPersistent); override;
    function ResolveColor(ThemeColor: TAlphaColor): TAlphaColor;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    { Null ($00000000) = usa a cor do tema ativo }
    property FontColor: TAlphaColor read FFontColor write SetFontColor default 0;
    property HorzAlign: TEsFxTextAlign read FHorzAlign write SetHorzAlign;
    property VertAlign: TEsFxTextAlign read FVertAlign write SetVertAlign;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
    property Trimming: Boolean read FTrimming write SetTrimming default False;
  end;

  { TEsFxTicker - relógio global (~60 fps) }

  TEsFxTickEvent = procedure(DeltaSec: Double) of object;

  TEsFxTicker = class
  private
    FTimer: TTimer;
    FClients: array of TEsFxTickEvent;
    FLastTick: QWord;
    procedure TimerTick(Sender: TObject);
  public
    destructor Destroy; override;
    procedure Add(const AEvent: TEsFxTickEvent);
    procedure Remove(const AEvent: TEsFxTickEvent);
    function Contains(const AEvent: TEsFxTickEvent): Boolean;
  end;

  { TEsFxTransition - valor 0..1 que desliza suavemente até um alvo.
    Usado para hover/press/check sem precisar de componentes extras. }

  TEsFxTransition = class
  private
    FOwner: TControl;
    FValue: Single;
    FTarget: Single;
    FDuration: Single;
    procedure Tick(DeltaSec: Double);
    function GetEased: Single;
  public
    constructor Create(AOwner: TControl; ADuration: Single = 0.15);
    destructor Destroy; override;
    procedure SetTarget(AValue: Single; Instant: Boolean = False);
    property Value: Single read FValue;
    property Eased: Single read GetEased;
    property Target: Single read FTarget;
    property Duration: Single read FDuration write FDuration;
  end;

  TEsFxTriggerHook = procedure(Sender: TControl; Trigger: TEsFxTrigger; Value: Boolean);

  { TEsFxGraphicControl }

  TEsFxGraphicControl = class(TGraphicControl)
  private
    FOpacity: Single;
    FIsMouseOver: Boolean;
    FIsPressed: Boolean;
    FHover: TEsFxTransition;
    FPress: TEsFxTransition;
    procedure SetOpacity(AValue: Single);
  protected
    procedure PropsChanged(Sender: TObject);
    procedure Paint; override;
    { desenha formas na superfície (OX,OY = origem do controle) }
    procedure RenderShape(S: TEsSurface; OX, OY: Single); virtual;
    { desenha texto/imagens no canvas do bitmap já composto }
    procedure RenderContent(ACanvas: TCanvas); virtual;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure EnabledChanged; override;
    function EffectiveOpacity: Single;
    function ThemeText: TAlphaColor;
    function TextColorFor(C: TAlphaColor): TColor;
    property HoverT: TEsFxTransition read FHover;
    property PressT: TEsFxTransition read FPress;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property IsMouseOver: Boolean read FIsMouseOver;
    property IsPressed: Boolean read FIsPressed;
  published
    property Opacity: Single read FOpacity write SetOpacity;
  end;

  { TEsFxContainer }

  TEsFxContainer = class(TCustomControl)
  private
    FOpacity: Single;
    FIsMouseOver: Boolean;
    FIsPressed: Boolean;
    procedure SetOpacity(AValue: Single);
  protected
    procedure PropsChanged(Sender: TObject);
    procedure Paint; override;
    procedure EraseBackground(DC: HDC); override;
    procedure RenderContent(ACanvas: TCanvas); virtual;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure EnabledChanged; override;
    function ThemeText: TAlphaColor;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); virtual;
    function EffectiveOpacity: Single;
    property IsMouseOver: Boolean read FIsMouseOver;
    property IsPressed: Boolean read FIsPressed;
  published
    property Opacity: Single read FOpacity write SetOpacity;
  end;

function EsFxTicker: TEsFxTicker;
{ preenche S com tudo o que está "atrás" de AControl }
procedure EsFxRenderBackground(AControl: TControl; S: TEsSurface);
{ repinta os controles FX que ficam por cima de AControl (o fundo deles mudou) }
procedure EsFxInvalidateAbove(AControl: TControl);
{ desenha AControl completo (fundo + forma + conteúdo) no canvas }
procedure EsFxNotifyTrigger(Sender: TControl; Trigger: TEsFxTrigger; Value: Boolean);

var
  EsFxTriggerHook: TEsFxTriggerHook = nil;

const
  EsFxDisabledOpacity = 0.55;

implementation

var
  GTicker: TEsFxTicker = nil;

function EsFxTicker: TEsFxTicker;
begin
  if GTicker = nil then
    GTicker := TEsFxTicker.Create;
  Result := GTicker;
end;

procedure EsFxNotifyTrigger(Sender: TControl; Trigger: TEsFxTrigger; Value: Boolean);
begin
  if Assigned(EsFxTriggerHook) then
    EsFxTriggerHook(Sender, Trigger, Value);
end;

function ResolvedColor(P: TControl): TColor;
begin
  Result := P.GetRGBColorResolvingParent;
end;

procedure EsFxRenderBackground(AControl: TControl; S: TEsSurface);

  { desenha um controle FX e seus filhos FX (só as formas) }
  procedure RenderTree(C: TControl; OX, OY: Single);
  var
    I: Integer;
    SaveOp: Single;
    W: TWinControl;
    Pass: Boolean;
  begin
    if not C.Visible then Exit;
    SaveOp := S.Opacity;
    if C is TEsFxContainer then
    begin
      S.Opacity := SaveOp * TEsFxContainer(C).EffectiveOpacity;
      TEsFxContainer(C).RenderShape(S, OX, OY);
    end
    else if C is TEsFxGraphicControl then
    begin
      S.Opacity := SaveOp * TEsFxGraphicControl(C).EffectiveOpacity;
      TEsFxGraphicControl(C).RenderShape(S, OX, OY);
    end
    else
      Exit;
    if C is TWinControl then
    begin
      W := TWinControl(C);
      // gráficos por baixo, depois as janelas (ordem de pintura da LCL)
      for Pass := False to True do
        for I := 0 to W.ControlCount - 1 do
          if (W.Controls[I] is TWinControl) = Pass then
            RenderTree(W.Controls[I], OX + W.Controls[I].Left, OY + W.Controls[I].Top);
    end;
    S.Opacity := SaveOp;
  end;

  { irmãos FX que ficam por baixo de Ctl e se sobrepõem a ele }
  procedure RenderSiblingsBelow(Ctl: TControl; P: TWinControl; POX, POY: Single);
  var
    I, Me: Integer;
    C: TControl;
    Below: Boolean;
    R, CR: TRect;
  begin
    Me := -1;
    for I := 0 to P.ControlCount - 1 do
      if P.Controls[I] = Ctl then
      begin
        Me := I;
        Break;
      end;
    if Me < 0 then Exit;
    R := Ctl.BoundsRect;
    for I := 0 to P.ControlCount - 1 do
    begin
      C := P.Controls[I];
      if (C = Ctl) or not C.Visible then Continue;
      if not ((C is TEsFxContainer) or (C is TEsFxGraphicControl)) then Continue;
      if Ctl is TWinControl then
        // janela: todos os gráficos e as janelas anteriores ficam por baixo
        Below := not (C is TWinControl) or (I < Me)
      else
        Below := not (C is TWinControl) and (I < Me);
      if not Below then Continue;
      CR := C.BoundsRect;
      if (CR.Right <= R.Left) or (CR.Left >= R.Right) or (CR.Bottom <= R.Top) or
         (CR.Top >= R.Bottom) then
        Continue;
      RenderTree(C, POX + C.Left, POY + C.Top);
    end;
  end;

  procedure Walk(Ctl: TControl; OX, OY: Single);
  var
    P: TWinControl;
    POX, POY, SaveOp: Single;
  begin
    P := Ctl.Parent;
    if P = nil then
    begin
      S.Clear(EsCurrentTheme.Background);
      Exit;
    end;
    POX := OX - Ctl.Left;
    POY := OY - Ctl.Top;
    if P is TEsFxContainer then
    begin
      Walk(P, POX, POY);
      SaveOp := S.Opacity;
      S.Opacity := TEsFxContainer(P).EffectiveOpacity;
      TEsFxContainer(P).RenderShape(S, POX, POY);
      S.Opacity := SaveOp;
    end
    else
      S.Clear(ColorToAlphaColor(ResolvedColor(P)));
    RenderSiblingsBelow(Ctl, P, POX, POY);
  end;

begin
  S.Opacity := 1;
  Walk(AControl, 0, 0);
end;

procedure EsFxInvalidateAbove(AControl: TControl);
var
  P: TWinControl;
  I, Me: Integer;
  C: TControl;
  R, CR: TRect;
  Above: Boolean;
begin
  P := AControl.Parent;
  if (P = nil) or (csDestroying in P.ComponentState) then Exit;
  Me := -1;
  for I := 0 to P.ControlCount - 1 do
    if P.Controls[I] = AControl then
    begin
      Me := I;
      Break;
    end;
  if Me < 0 then Exit;
  R := AControl.BoundsRect;
  for I := 0 to P.ControlCount - 1 do
  begin
    C := P.Controls[I];
    if (C = AControl) or not C.Visible then Continue;
    if not ((C is TEsFxContainer) or (C is TEsFxGraphicControl)) then Continue;
    if AControl is TWinControl then
      Above := (C is TWinControl) and (I > Me)
    else
      Above := (C is TWinControl) or (I > Me);
    if not Above then Continue;
    CR := C.BoundsRect;
    if (CR.Right <= R.Left) or (CR.Left >= R.Right) or (CR.Bottom <= R.Top) or
       (CR.Top >= R.Bottom) then
      Continue;
    C.Invalidate;
  end;
end;

{ TEsFxBrush }

constructor TEsFxBrush.Create(AKind: TEsFxBrushKind; AColor: TAlphaColor);
begin
  inherited Create;
  FKind := AKind;
  FColor := AColor;
  FGradientColor := DarkenColor(AColor, 0.25);
  FGradientStyle := gsVertical;
end;

procedure TEsFxBrush.Assign(Source: TPersistent);
begin
  if Source is TEsFxBrush then
  begin
    FKind := TEsFxBrush(Source).FKind;
    FColor := TEsFxBrush(Source).FColor;
    FGradientColor := TEsFxBrush(Source).FGradientColor;
    FGradientStyle := TEsFxBrush(Source).FGradientStyle;
    Changed;
  end
  else
    inherited Assign(Source);
end;

procedure TEsFxBrush.Changed;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TEsFxBrush.SetKind(AValue: TEsFxBrushKind);
begin
  if FKind = AValue then Exit;
  FKind := AValue;
  Changed;
end;

procedure TEsFxBrush.SetColor(AValue: TAlphaColor);
begin
  if FColor = AValue then Exit;
  FColor := AValue;
  Changed;
end;

procedure TEsFxBrush.SetGradientColor(AValue: TAlphaColor);
begin
  if FGradientColor = AValue then Exit;
  FGradientColor := AValue;
  Changed;
end;

procedure TEsFxBrush.SetGradientStyle(AValue: TEsFxGradientStyle);
begin
  if FGradientStyle = AValue then Exit;
  FGradientStyle := AValue;
  Changed;
end;

function TEsFxBrush.IsVisible: Boolean;
begin
  Result := (FKind <> bkNone) and ((AlphaOf(FColor) > 0) or
    ((FKind = bkGradient) and (AlphaOf(FGradientColor) > 0)));
end;

function TEsFxBrush.ToPaint(const R: TRectF): TEsPaint;
begin
  if FKind = bkGradient then
    case FGradientStyle of
      gsVertical: Result := EsLinear(FColor, FGradientColor, R.Left, R.Top, R.Left, R.Bottom);
      gsHorizontal: Result := EsLinear(FColor, FGradientColor, R.Left, R.Top, R.Right, R.Top);
      gsDiagonal: Result := EsLinear(FColor, FGradientColor, R.Left, R.Top, R.Right, R.Bottom);
    end
  else
    Result := EsSolid(FColor);
end;

{ TEsFxStroke }

constructor TEsFxStroke.Create(AKind: TEsFxBrushKind; AColor: TAlphaColor);
begin
  inherited Create(AKind, AColor);
  FThickness := 1;
end;

procedure TEsFxStroke.Assign(Source: TPersistent);
begin
  if Source is TEsFxStroke then
    FThickness := TEsFxStroke(Source).FThickness;
  inherited Assign(Source);
end;

procedure TEsFxStroke.SetThickness(AValue: Single);
begin
  if AValue < 0 then AValue := 0;
  if FThickness = AValue then Exit;
  FThickness := AValue;
  Changed;
end;

{ TEsFxBlur }

constructor TEsFxBlur.Create;
begin
  inherited Create;
  FSoftness := 4;
end;

procedure TEsFxBlur.Assign(Source: TPersistent);
begin
  if Source is TEsFxBlur then
  begin
    FEnabled := TEsFxBlur(Source).FEnabled;
    FSoftness := TEsFxBlur(Source).FSoftness;
    if Assigned(FOnChange) then FOnChange(Self);
  end
  else
    inherited Assign(Source);
end;

function TEsFxBlur.Margin: Single;
begin
  if FEnabled then Result := FSoftness * 2 else Result := 0;
end;

procedure TEsFxBlur.SetEnabled(AValue: Boolean);
begin
  if FEnabled = AValue then Exit;
  FEnabled := AValue;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TEsFxBlur.SetSoftness(AValue: Single);
begin
  AValue := EnsureRange(AValue, 0, 100);
  if FSoftness = AValue then Exit;
  FSoftness := AValue;
  if Assigned(FOnChange) then FOnChange(Self);
end;

{ TEsFxGlow }

constructor TEsFxGlow.Create;
begin
  inherited Create;
  FSoftness := 8;
  FOpacity := 0.9;
  FGlowColor := TAlphaColor($FFFFD700); // dourado, como no FMX
end;

procedure TEsFxGlow.Assign(Source: TPersistent);
begin
  if Source is TEsFxGlow then
  begin
    FEnabled := TEsFxGlow(Source).FEnabled;
    FSoftness := TEsFxGlow(Source).FSoftness;
    FOpacity := TEsFxGlow(Source).FOpacity;
    FGlowColor := TEsFxGlow(Source).FGlowColor;
    Changed;
  end
  else
    inherited Assign(Source);
end;

procedure TEsFxGlow.Changed;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

function TEsFxGlow.Margin: Single;
begin
  if FEnabled then Result := FSoftness else Result := 0;
end;

procedure TEsFxGlow.SetEnabled(AValue: Boolean);
begin
  if FEnabled = AValue then Exit;
  FEnabled := AValue;
  Changed;
end;

procedure TEsFxGlow.SetSoftness(AValue: Single);
begin
  AValue := Max(0, AValue);
  if FSoftness = AValue then Exit;
  FSoftness := AValue;
  Changed;
end;

procedure TEsFxGlow.SetOpacity(AValue: Single);
begin
  AValue := EnsureRange(AValue, 0, 1);
  if FOpacity = AValue then Exit;
  FOpacity := AValue;
  Changed;
end;

procedure TEsFxGlow.SetGlowColor(AValue: TAlphaColor);
begin
  if FGlowColor = AValue then Exit;
  FGlowColor := AValue;
  Changed;
end;

{ TEsFxShadow }

constructor TEsFxShadow.Create;
begin
  inherited Create;
  FDistance := 3;
  FDirection := 45;
  FSoftness := 6;
  FOpacity := 0.35;
  FShadowColor := TAlphaColors.Black;
end;

procedure TEsFxShadow.Assign(Source: TPersistent);
begin
  if Source is TEsFxShadow then
  begin
    FEnabled := TEsFxShadow(Source).FEnabled;
    FDistance := TEsFxShadow(Source).FDistance;
    FDirection := TEsFxShadow(Source).FDirection;
    FSoftness := TEsFxShadow(Source).FSoftness;
    FOpacity := TEsFxShadow(Source).FOpacity;
    FShadowColor := TEsFxShadow(Source).FShadowColor;
    Changed;
  end
  else
    inherited Assign(Source);
end;

procedure TEsFxShadow.Changed;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

function TEsFxShadow.Margin: Single;
begin
  if FEnabled then
    Result := FSoftness + FDistance
  else
    Result := 0;
end;

function TEsFxShadow.OffsetX: Single;
begin
  // 0 graus = direita, 90 = baixo (como no FMX)
  Result := FDistance * Cos(DegToRad(FDirection));
end;

function TEsFxShadow.OffsetY: Single;
begin
  Result := FDistance * Sin(DegToRad(FDirection));
end;

procedure TEsFxShadow.SetEnabled(AValue: Boolean);
begin
  if FEnabled = AValue then Exit;
  FEnabled := AValue;
  Changed;
end;

procedure TEsFxShadow.SetDistance(AValue: Single);
begin
  if FDistance = AValue then Exit;
  FDistance := Max(0, AValue);
  Changed;
end;

procedure TEsFxShadow.SetDirection(AValue: Single);
begin
  if FDirection = AValue then Exit;
  FDirection := AValue;
  Changed;
end;

procedure TEsFxShadow.SetSoftness(AValue: Single);
begin
  if FSoftness = AValue then Exit;
  FSoftness := Max(0, AValue);
  Changed;
end;

procedure TEsFxShadow.SetOpacity(AValue: Single);
begin
  AValue := EnsureRange(AValue, 0, 1);
  if FOpacity = AValue then Exit;
  FOpacity := AValue;
  Changed;
end;

procedure TEsFxShadow.SetShadowColor(AValue: TAlphaColor);
begin
  if FShadowColor = AValue then Exit;
  FShadowColor := AValue;
  Changed;
end;

{ TEsFxTextSettings }

constructor TEsFxTextSettings.Create(AHorz, AVert: TEsFxTextAlign);
begin
  inherited Create;
  FFontColor := TAlphaColors.Null;
  FHorzAlign := AHorz;
  FVertAlign := AVert;
end;

procedure TEsFxTextSettings.Assign(Source: TPersistent);
begin
  if Source is TEsFxTextSettings then
  begin
    FFontColor := TEsFxTextSettings(Source).FFontColor;
    FHorzAlign := TEsFxTextSettings(Source).FHorzAlign;
    FVertAlign := TEsFxTextSettings(Source).FVertAlign;
    FWordWrap := TEsFxTextSettings(Source).FWordWrap;
    FTrimming := TEsFxTextSettings(Source).FTrimming;
    Changed;
  end
  else
    inherited Assign(Source);
end;

function TEsFxTextSettings.ResolveColor(ThemeColor: TAlphaColor): TAlphaColor;
begin
  if AlphaOf(FFontColor) = 0 then
    Result := ThemeColor
  else
    Result := FFontColor;
end;

procedure TEsFxTextSettings.Changed;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TEsFxTextSettings.SetFontColor(AValue: TAlphaColor);
begin
  if FFontColor = AValue then Exit;
  FFontColor := AValue;
  Changed;
end;

procedure TEsFxTextSettings.SetHorzAlign(AValue: TEsFxTextAlign);
begin
  if FHorzAlign = AValue then Exit;
  FHorzAlign := AValue;
  Changed;
end;

procedure TEsFxTextSettings.SetVertAlign(AValue: TEsFxTextAlign);
begin
  if FVertAlign = AValue then Exit;
  FVertAlign := AValue;
  Changed;
end;

procedure TEsFxTextSettings.SetWordWrap(AValue: Boolean);
begin
  if FWordWrap = AValue then Exit;
  FWordWrap := AValue;
  Changed;
end;

procedure TEsFxTextSettings.SetTrimming(AValue: Boolean);
begin
  if FTrimming = AValue then Exit;
  FTrimming := AValue;
  Changed;
end;

{ TEsFxTicker }

destructor TEsFxTicker.Destroy;
begin
  FTimer.Free;
  inherited Destroy;
end;

procedure TEsFxTicker.Add(const AEvent: TEsFxTickEvent);
var
  N: Integer;
begin
  if Contains(AEvent) then Exit;
  N := Length(FClients);
  SetLength(FClients, N + 1);
  FClients[N] := AEvent;
  if FTimer = nil then
  begin
    FTimer := TTimer.Create(nil);
    FTimer.Enabled := False;
    FTimer.Interval := 15;
    FTimer.OnTimer := @TimerTick;
  end;
  if not FTimer.Enabled then
  begin
    FLastTick := GetTickCount64;
    FTimer.Enabled := True;
  end;
end;

procedure TEsFxTicker.Remove(const AEvent: TEsFxTickEvent);
var
  I, J: Integer;
begin
  for I := 0 to High(FClients) do
    if (TMethod(FClients[I]).Code = TMethod(AEvent).Code) and
       (TMethod(FClients[I]).Data = TMethod(AEvent).Data) then
    begin
      for J := I to High(FClients) - 1 do
        FClients[J] := FClients[J + 1];
      SetLength(FClients, Length(FClients) - 1);
      Break;
    end;
  if (Length(FClients) = 0) and (FTimer <> nil) then
    FTimer.Enabled := False;
end;

function TEsFxTicker.Contains(const AEvent: TEsFxTickEvent): Boolean;
var
  I: Integer;
begin
  for I := 0 to High(FClients) do
    if (TMethod(FClients[I]).Code = TMethod(AEvent).Code) and
       (TMethod(FClients[I]).Data = TMethod(AEvent).Data) then
      Exit(True);
  Result := False;
end;

procedure TEsFxTicker.TimerTick(Sender: TObject);
var
  Now: QWord;
  Delta: Double;
  Snapshot: array of TEsFxTickEvent;
  I: Integer;
begin
  Now := GetTickCount64;
  Delta := (Now - FLastTick) / 1000;
  FLastTick := Now;
  if Delta > 0.1 then Delta := 0.1; // evita saltos após travamentos
  Snapshot := Copy(FClients);
  for I := 0 to High(Snapshot) do
    if Contains(Snapshot[I]) then
      Snapshot[I](Delta);
end;

{ TEsFxTransition }

constructor TEsFxTransition.Create(AOwner: TControl; ADuration: Single);
begin
  inherited Create;
  FOwner := AOwner;
  FDuration := ADuration;
end;

destructor TEsFxTransition.Destroy;
begin
  if GTicker <> nil then
    GTicker.Remove(@Tick);
  inherited Destroy;
end;

procedure TEsFxTransition.SetTarget(AValue: Single; Instant: Boolean);
begin
  FTarget := AValue;
  if Instant or (FDuration <= 0) or (csDesigning in FOwner.ComponentState) then
  begin
    FValue := AValue;
    EsFxTicker.Remove(@Tick);
    FOwner.Invalidate;
  end
  else if FValue <> FTarget then
    EsFxTicker.Add(@Tick);
end;

procedure TEsFxTransition.Tick(DeltaSec: Double);
var
  Step: Single;
begin
  Step := DeltaSec / FDuration;
  if FValue < FTarget then
    FValue := Min(FTarget, FValue + Step)
  else
    FValue := Max(FTarget, FValue - Step);
  if FValue = FTarget then
    EsFxTicker.Remove(@Tick);
  FOwner.Invalidate;
end;

function TEsFxTransition.GetEased: Single;
begin
  Result := FValue * FValue * (3 - 2 * FValue);
end;

{ TEsFxGraphicControl }

constructor TEsFxGraphicControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOpacity := 1;
  FHover := TEsFxTransition.Create(Self, 0.15);
  FPress := TEsFxTransition.Create(Self, 0.08);
  ControlStyle := ControlStyle + [csReplicatable] - [csOpaque];
  EsThemes.RegisterClient(Self);
end;

destructor TEsFxGraphicControl.Destroy;
begin
  EsThemes.UnregisterClient(Self);
  FHover.Free;
  FPress.Free;
  inherited Destroy;
end;

procedure TEsFxGraphicControl.PropsChanged(Sender: TObject);
begin
  Invalidate;
  // controles FX por cima usam este desenho como fundo
  EsFxInvalidateAbove(Self);
end;

procedure TEsFxGraphicControl.SetOpacity(AValue: Single);
begin
  AValue := EnsureRange(AValue, 0, 1);
  if FOpacity = AValue then Exit;
  FOpacity := AValue;
  Invalidate;
end;

function TEsFxGraphicControl.EffectiveOpacity: Single;
begin
  Result := FOpacity;
  if not IsEnabled then
    Result := Result * EsFxDisabledOpacity;
end;

function TEsFxGraphicControl.ThemeText: TAlphaColor;
begin
  Result := EsCurrentTheme.Text;
end;

function TEsFxGraphicControl.TextColorFor(C: TAlphaColor): TColor;
begin
  // texto não passa pelo rasterizador; simula opacidade misturando com o fundo
  Result := AlphaColorToColor(InterpolateColor(EsCurrentTheme.Background,
    WithAlpha(C, 255), EffectiveOpacity * AlphaOf(C) / 255));
end;

procedure TEsFxGraphicControl.RenderShape(S: TEsSurface; OX, OY: Single);
begin
end;

procedure TEsFxGraphicControl.RenderContent(ACanvas: TCanvas);
begin
end;

procedure TEsFxGraphicControl.Paint;
var
  S: TEsSurface;
  B: TBitmap;
begin
  if (Width <= 0) or (Height <= 0) then Exit;
  S := TEsSurface.Create(Width, Height);
  try
    EsFxRenderBackground(Self, S);
    S.Opacity := EffectiveOpacity;
    RenderShape(S, 0, 0);
    B := TBitmap.Create;
    try
      S.AssignToBitmap(B);
      B.Canvas.Font.Assign(Font);
      RenderContent(B.Canvas);
      Canvas.Draw(0, 0, B);
    finally
      B.Free;
    end;
  finally
    S.Free;
  end;
  inherited Paint;
end;

procedure TEsFxGraphicControl.MouseEnter;
begin
  FIsMouseOver := True;
  FHover.SetTarget(1);
  EsFxNotifyTrigger(Self, ftMouseOver, True);
  inherited MouseEnter;
end;

procedure TEsFxGraphicControl.MouseLeave;
begin
  FIsMouseOver := False;
  FHover.SetTarget(0);
  EsFxNotifyTrigger(Self, ftMouseOver, False);
  inherited MouseLeave;
end;

procedure TEsFxGraphicControl.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FIsPressed := True;
    FPress.SetTarget(1);
    EsFxNotifyTrigger(Self, ftPressed, True);
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TEsFxGraphicControl.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Button = mbLeft) and FIsPressed then
  begin
    FIsPressed := False;
    FPress.SetTarget(0);
    EsFxNotifyTrigger(Self, ftPressed, False);
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TEsFxGraphicControl.EnabledChanged;
begin
  inherited EnabledChanged;
  Invalidate;
end;

{ TEsFxContainer }

constructor TEsFxContainer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOpacity := 1;
  ControlStyle := ControlStyle + [csAcceptsControls, csReplicatable] - [csOpaque];
  EsThemes.RegisterClient(Self);
end;

destructor TEsFxContainer.Destroy;
begin
  EsThemes.UnregisterClient(Self);
  inherited Destroy;
end;

procedure TEsFxContainer.PropsChanged(Sender: TObject);
var
  I: Integer;
begin
  Invalidate;
  // filhos gráficos usam o nosso desenho como fundo
  for I := 0 to ControlCount - 1 do
    Controls[I].Invalidate;
  EsFxInvalidateAbove(Self);
end;

procedure TEsFxContainer.SetOpacity(AValue: Single);
begin
  AValue := EnsureRange(AValue, 0, 1);
  if FOpacity = AValue then Exit;
  FOpacity := AValue;
  PropsChanged(Self);
end;

function TEsFxContainer.EffectiveOpacity: Single;
begin
  Result := FOpacity;
  if not IsEnabled then
    Result := Result * EsFxDisabledOpacity;
end;

function TEsFxContainer.ThemeText: TAlphaColor;
begin
  Result := EsCurrentTheme.Text;
end;

procedure TEsFxContainer.RenderShape(S: TEsSurface; OX, OY: Single);
begin
end;

procedure TEsFxContainer.RenderContent(ACanvas: TCanvas);
begin
end;

procedure TEsFxContainer.EraseBackground(DC: HDC);
begin
  // nada: o Paint cobre toda a área (evita cintilação)
end;

procedure TEsFxContainer.Paint;
var
  S: TEsSurface;
  B: TBitmap;
begin
  if (Width <= 0) or (Height <= 0) then Exit;
  S := TEsSurface.Create(Width, Height);
  try
    EsFxRenderBackground(Self, S);
    S.Opacity := EffectiveOpacity;
    RenderShape(S, 0, 0);
    B := TBitmap.Create;
    try
      S.AssignToBitmap(B);
      B.Canvas.Font.Assign(Font);
      RenderContent(B.Canvas);
      if csDesigning in ComponentState then
      begin
        // contorno tracejado em design-time (como o FMX faz com TLayout)
        B.Canvas.Pen.Style := psDot;
        B.Canvas.Pen.Color := clGray;
        B.Canvas.Brush.Style := bsClear;
        B.Canvas.Rectangle(0, 0, Width, Height);
      end;
      Canvas.Draw(0, 0, B);
    finally
      B.Free;
    end;
  finally
    S.Free;
  end;
  inherited Paint;
end;

procedure TEsFxContainer.MouseEnter;
begin
  FIsMouseOver := True;
  EsFxNotifyTrigger(Self, ftMouseOver, True);
  inherited MouseEnter;
end;

procedure TEsFxContainer.MouseLeave;
begin
  FIsMouseOver := False;
  EsFxNotifyTrigger(Self, ftMouseOver, False);
  inherited MouseLeave;
end;

procedure TEsFxContainer.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FIsPressed := True;
    EsFxNotifyTrigger(Self, ftPressed, True);
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TEsFxContainer.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Button = mbLeft) and FIsPressed then
  begin
    FIsPressed := False;
    EsFxNotifyTrigger(Self, ftPressed, False);
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TEsFxContainer.EnabledChanged;
begin
  inherited EnabledChanged;
  PropsChanged(Self);
end;

finalization
  FreeAndNil(GTicker);

end.
