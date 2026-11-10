{
 *****************************************************************************
  ESKit - esfxstdctrls.pas
  Controles padrão no estilo FMX.StdCtrls:
    TEsFxButton, TEsFxSwitch, TEsFxCheckBox, TEsFxRadioButton, TEsFxTrackBar,
    TEsFxProgressBar, TEsFxArcProgress, TEsFxAniIndicator, TEsFxEdit, TEsFxStyleBook

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsFxStdCtrls;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Types, Math, Controls, Graphics, Forms, StdCtrls,
  ImgList, LCLType, LCLIntf, LMessages, ActnList,
  EsGraphics, EsTheme, EsFxBase, EsFxShapes;

type
  TEsFxOrientation = (orHorizontal, orVertical);

  { TEsFxFocusControl - base para controles que recebem foco/teclado }

  TEsFxFocusControl = class(TEsFxContainer)
  private
    FHover: TEsFxTransition;
    FPress: TEsFxTransition;
    FFocus: TEsFxTransition;
    FShowFocusRing: Boolean;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure TextChanged; override;
    { ação principal (clique/espaço/enter) }
    procedure DoActivate; virtual;
    procedure RenderFocusRing(S: TEsSurface; const R: TRectF; Radius: Single);
    function ThemeRadius: Single;
    property HoverT: TEsFxTransition read FHover;
    property PressT: TEsFxTransition read FPress;
    property FocusT: TEsFxTransition read FFocus;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ShowFocusRing: Boolean read FShowFocusRing write FShowFocusRing default True;
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
    property PopupMenu;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
  end;

  TEsFxButtonStyle = (fbsDefault, fbsPrimary, fbsOutline, fbsText, fbsDanger, fbsSuccess);
  TEsFxImagePosition = (ipLeft, ipRight, ipTop);

  { TEsFxButton }

  TEsFxButton = class(TEsFxFocusControl)
  private
    FButtonStyle: TEsFxButtonStyle;
    FRadius: Single;
    FImages: TCustomImageList;
    FImageIndex: TImageIndex;
    FImagePosition: TEsFxImagePosition;
    FModalResult: TModalResult;
    FTextSettings: TEsFxTextSettings;
    FImageChangeLink: TChangeLink;
    procedure SetButtonStyle(AValue: TEsFxButtonStyle);
    procedure SetRadius(AValue: Single);
    procedure SetImages(AValue: TCustomImageList);
    procedure SetImageIndex(AValue: TImageIndex);
    procedure SetImagePosition(AValue: TEsFxImagePosition);
    procedure SetTextSettings(AValue: TEsFxTextSettings);
    procedure ImageListChange(Sender: TObject);
    function FaceColor: TAlphaColor;
    function ContentColor: TAlphaColor;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure RenderContent(ACanvas: TCanvas); override;
    procedure DoActivate; override;
    class function GetControlClassDefaultSize: TSize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
    procedure Click; override;
  published
    property Action;
    property Text;
    property ButtonStyle: TEsFxButtonStyle read FButtonStyle write SetButtonStyle default fbsDefault;
    { raio dos cantos; -1 = usa o raio do tema }
    property XRadius: Single read FRadius write SetRadius;
    property Images: TCustomImageList read FImages write SetImages;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    property ImagePosition: TEsFxImagePosition read FImagePosition write SetImagePosition default ipLeft;
    property ModalResult: TModalResult read FModalResult write FModalResult default mrNone;
    property TextSettings: TEsFxTextSettings read FTextSettings write SetTextSettings;
    property OnClick;
  end;

  { TEsFxSwitch - TSwitch do FMX }

  TEsFxSwitch = class(TEsFxFocusControl)
  private
    FIsChecked: Boolean;
    FCheck: TEsFxTransition;
    FOnSwitch: TNotifyEvent;
    procedure SetIsChecked(AValue: Boolean);
  protected
    procedure DoActivate; override;
    procedure Loaded; override;
    class function GetControlClassDefaultSize: TSize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  published
    property IsChecked: Boolean read FIsChecked write SetIsChecked default False;
    property OnSwitch: TNotifyEvent read FOnSwitch write FOnSwitch;
    property OnClick;
  end;

  { TEsFxCustomCheck - base de CheckBox e RadioButton }

  TEsFxCustomCheck = class(TEsFxFocusControl)
  private
    FIsChecked: Boolean;
    FCheck: TEsFxTransition;
    FOnChange: TNotifyEvent;
    FTextSettings: TEsFxTextSettings;
    procedure SetTextSettings(AValue: TEsFxTextSettings);
  protected
    procedure SetIsChecked(AValue: Boolean); virtual;
    procedure Loaded; override;
    function BoxRect(OX, OY: Single): TRectF;
    procedure RenderContent(ACanvas: TCanvas); override;
    class function GetControlClassDefaultSize: TSize; override;
    property CheckT: TEsFxTransition read FCheck;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Text;
    property IsChecked: Boolean read FIsChecked write SetIsChecked default False;
    property TextSettings: TEsFxTextSettings read FTextSettings write SetTextSettings;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick;
  end;

  { TEsFxCheckBox }

  TEsFxCheckBox = class(TEsFxCustomCheck)
  protected
    procedure DoActivate; override;
  public
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  end;

  { TEsFxRadioButton }

  TEsFxRadioButton = class(TEsFxCustomCheck)
  private
    FGroupName: string;
  protected
    procedure SetIsChecked(AValue: Boolean); override;
    procedure DoActivate; override;
  public
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  published
    property GroupName: string read FGroupName write FGroupName;
  end;

  { TEsFxTrackBar }

  TEsFxTrackBar = class(TEsFxFocusControl)
  private
    FMin, FMax, FValue, FFrequency: Single;
    FOrientation: TEsFxOrientation;
    FDragging: Boolean;
    FOnChange: TNotifyEvent;
    FOnTracking: TNotifyEvent;
    procedure SetMin(AValue: Single);
    procedure SetMax(AValue: Single);
    procedure SetValue(AValue: Single);
    procedure SetOrientation(AValue: TEsFxOrientation);
    function Ratio: Single;
    procedure TrackGeometry(OX, OY: Single; out A, B: TPointF; out Thumb: Single);
    procedure ValueFromPoint(X, Y: Integer);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
    class function GetControlClassDefaultSize: TSize; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  published
    property Min: Single read FMin write SetMin;
    property Max: Single read FMax write SetMax;
    property Value: Single read FValue write SetValue;
    { passo do "snap" (0 = contínuo) }
    property Frequency: Single read FFrequency write FFrequency;
    property Orientation: TEsFxOrientation read FOrientation write SetOrientation default orHorizontal;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnTracking: TNotifyEvent read FOnTracking write FOnTracking;
  end;

  { TEsFxProgressBar }

  TEsFxProgressBar = class(TEsFxContainer)
  private
    FMin, FMax, FValue: Single;
    FShown: Single;
    FOrientation: TEsFxOrientation;
    FAnimated: Boolean;
    FBarColor: TAlphaColor;
    procedure SetMin(AValue: Single);
    procedure SetMax(AValue: Single);
    procedure SetValue(AValue: Single);
    procedure SetOrientation(AValue: TEsFxOrientation);
    procedure SetBarColor(AValue: TAlphaColor);
    procedure Tick(DeltaSec: Double);
  protected
    class function GetControlClassDefaultSize: TSize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  published
    property Min: Single read FMin write SetMin;
    property Max: Single read FMax write SetMax;
    property Value: Single read FValue write SetValue;
    property Orientation: TEsFxOrientation read FOrientation write SetOrientation default orHorizontal;
    { anima a barra até o novo valor }
    property Animated: Boolean read FAnimated write FAnimated default True;
    { Null = cor de destaque do tema }
    property BarColor: TAlphaColor read FBarColor write SetBarColor default 0;
    property Align;
    property Anchors;
    property BorderSpacing;
    property Constraints;
    property Enabled;
    property Hint;
    property ShowHint;
    property Visible;
  end;

  { TEsFxArcProgress - progresso circular com texto central }

  TEsFxArcProgress = class(TEsFxContainer)
  private
    FMin, FMax, FValue: Single;
    FThickness: Single;
    FStartAngle: Single;
    FShowText: Boolean;
    FBarColor: TAlphaColor;
    FTextFormat: string;
    procedure SetMin(AValue: Single);
    procedure SetMax(AValue: Single);
    procedure SetValue(AValue: Single);
    procedure SetThickness(AValue: Single);
    procedure SetStartAngle(AValue: Single);
    procedure SetShowText(AValue: Boolean);
    procedure SetBarColor(AValue: TAlphaColor);
    procedure SetTextFormat(const AValue: string);
  protected
    procedure RenderContent(ACanvas: TCanvas); override;
    class function GetControlClassDefaultSize: TSize; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
  published
    property Min: Single read FMin write SetMin;
    property Max: Single read FMax write SetMax;
    property Value: Single read FValue write SetValue;
    property Thickness: Single read FThickness write SetThickness;
    property StartAngle: Single read FStartAngle write SetStartAngle;
    property ShowText: Boolean read FShowText write SetShowText default True;
    { formato Format(): recebe a porcentagem (Double) }
    property TextFormat: string read FTextFormat write SetTextFormat;
    property BarColor: TAlphaColor read FBarColor write SetBarColor default 0;
    property Align;
    property Anchors;
    property BorderSpacing;
    property Constraints;
    property Enabled;
    property Font;
    property ParentFont;
    property Visible;
  end;

  { TEsFxAniIndicator - TAniIndicator do FMX }

  TEsFxAniIndicator = class(TEsFxGraphicControl)
  private
    FAngle: Single;
    FPhase: Single;
    FActive: Boolean;
    procedure SetActive(AValue: Boolean);
    procedure Tick(DeltaSec: Double);
  protected
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { no FMX a propriedade é "Enabled"; aqui "Active" para não desabilitar o controle }
    property Active: Boolean read FActive write SetActive default False;
    property Align;
    property Anchors;
    property BorderSpacing;
    property Visible;
  end;

  { TEsFxEdit - TEdit do FMX (borda arredondada, TextPrompt, linha de foco) }

  TEsFxEdit = class(TEsFxContainer)
  private
    FEdit: TEdit;
    FFocus: TEsFxTransition;
    FHover: TEsFxTransition;
    FOnChange: TNotifyEvent;
    function GetText: string;
    procedure SetText(const AValue: string);
    function GetTextPrompt: string;
    procedure SetTextPrompt(const AValue: string);
    function GetPassword: Boolean;
    procedure SetPassword(AValue: Boolean);
    function GetReadOnly: Boolean;
    procedure SetReadOnly(AValue: Boolean);
    function GetMaxLength: Integer;
    procedure SetMaxLength(AValue: Integer);
    function GetNumbersOnly: Boolean;
    procedure SetNumbersOnly(AValue: Boolean);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditKeyPress(Sender: TObject; var Key: char);
    procedure ThemeChanged(Sender: TObject);
    procedure SyncColors;
  protected
    procedure Resize; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure FontChanged(Sender: TObject); override;
    procedure EnabledChanged; override;
    class function GetControlClassDefaultSize: TSize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
    procedure SetFocus; override;
    procedure SelectAll;
    property InnerEdit: TEdit read FEdit;
  published
    property Text: string read GetText write SetText;
    property TextPrompt: string read GetTextPrompt write SetTextPrompt;
    property Password: Boolean read GetPassword write SetPassword default False;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property MaxLength: Integer read GetMaxLength write SetMaxLength default 0;
    property NumbersOnly: Boolean read GetNumbersOnly write SetNumbersOnly default False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property Align;
    property Anchors;
    property BorderSpacing;
    property Constraints;
    property Enabled;
    property Font;
    property ParentFont;
    property Hint;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
  end;

  { TEsFxStyleBook - escolhe o estilo visual de todos os controles ESKit }

  TEsFxStyleBook = class(TComponent)
  private
    FStyle: TEsStyleKind;
    FAccentColor: TAlphaColor;
    FApplyToForm: Boolean;
    FStyleFile: string;
    FCustomStyle: TStrings;
    FOnStyleChanged: TNotifyEvent;
    procedure SetStyle(AValue: TEsStyleKind);
    procedure SetStyleFile(const AValue: string);
    procedure SetCustomStyle(AValue: TStrings);
    procedure CustomStyleChanged(Sender: TObject);
    procedure SetAccentColor(AValue: TAlphaColor);
    procedure SetApplyToForm(AValue: Boolean);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Apply;
    { grava o tema atual (com o destaque aplicado) num arquivo de tema }
    procedure SaveStyleToFile(const AFileName: string);
    { carrega um arquivo de tema para CustomStyle (fica embutido no .lfm) }
    procedure LoadStyleFromFile(const AFileName: string);
  published
    property Style: TEsStyleKind read FStyle write SetStyle default dsLight;
    { arquivo de tema (.estheme) lido em tempo de execução; tem prioridade
      sobre CustomStyle e Style. Caminho relativo = pasta do executável. }
    property StyleFile: string read FStyleFile write SetStyleFile;
    { tema embutido no formulário (equivale ao .style dentro do TStyleBook);
      vazio = usa Style }
    property CustomStyle: TStrings read FCustomStyle write SetCustomStyle;
    { Null = cor de destaque padrão do estilo }
    property AccentColor: TAlphaColor read FAccentColor write SetAccentColor default 0;
    { pinta o fundo/fonte do formulário dono com as cores do estilo }
    property ApplyToForm: Boolean read FApplyToForm write SetApplyToForm default True;
    property OnStyleChanged: TNotifyEvent read FOnStyleChanged write FOnStyleChanged;
  end;

procedure EsFxApplyThemeToForm(AForm: TCustomForm);

implementation

procedure EsFxApplyThemeToForm(AForm: TCustomForm);
var
  T: TEsTheme;
begin
  if AForm = nil then Exit;
  T := EsCurrentTheme;
  AForm.Color := AlphaColorToColor(T.Background);
  AForm.Font.Color := AlphaColorToColor(T.Text);
end;

{ TEsFxFocusControl }

constructor TEsFxFocusControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // sem csClickEvents: o clique é disparado por DoActivate (mouse ou teclado)
  ControlStyle := ControlStyle - [csAcceptsControls, csClickEvents] + [csCaptureMouse];
  TabStop := True;
  FShowFocusRing := True;
  FHover := TEsFxTransition.Create(Self, 0.15);
  FPress := TEsFxTransition.Create(Self, 0.08);
  FFocus := TEsFxTransition.Create(Self, 0.15);
end;

destructor TEsFxFocusControl.Destroy;
begin
  FHover.Free;
  FPress.Free;
  FFocus.Free;
  inherited Destroy;
end;

function TEsFxFocusControl.ThemeRadius: Single;
begin
  Result := EsScale(Self, Round(EsCurrentTheme.Radius * 10)) / 10;
end;

procedure TEsFxFocusControl.DoEnter;
begin
  FFocus.SetTarget(1);
  EsFxNotifyTrigger(Self, ftFocused, True);
  inherited DoEnter;
end;

procedure TEsFxFocusControl.DoExit;
begin
  FFocus.SetTarget(0);
  EsFxNotifyTrigger(Self, ftFocused, False);
  inherited DoExit;
end;

procedure TEsFxFocusControl.MouseEnter;
begin
  FHover.SetTarget(1);
  inherited MouseEnter;
end;

procedure TEsFxFocusControl.MouseLeave;
begin
  FHover.SetTarget(0);
  inherited MouseLeave;
end;

procedure TEsFxFocusControl.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Button = mbLeft) then
  begin
    FPress.SetTarget(1);
    if CanFocus and TabStop then
      SetFocus;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TEsFxFocusControl.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  WasPressed: Boolean;
begin
  WasPressed := IsPressed;
  FPress.SetTarget(0);
  inherited MouseUp(Button, Shift, X, Y);
  if (Button = mbLeft) and WasPressed and PtInRect(ClientRect, Point(X, Y)) then
    DoActivate;
end;

procedure TEsFxFocusControl.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_SPACE) and (Shift = []) then
  begin
    FPress.SetTarget(1);
    Key := 0;
  end;
  inherited KeyDown(Key, Shift);
end;

procedure TEsFxFocusControl.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_SPACE) then
  begin
    FPress.SetTarget(0);
    Key := 0;
    DoActivate;
  end
  else if (Key = VK_RETURN) and (Shift = []) then
  begin
    Key := 0;
    DoActivate;
  end;
  inherited KeyUp(Key, Shift);
end;

procedure TEsFxFocusControl.TextChanged;
begin
  inherited TextChanged;
  Invalidate;
end;

procedure TEsFxFocusControl.DoActivate;
begin
end;

procedure TEsFxFocusControl.RenderFocusRing(S: TEsSurface; const R: TRectF;
  Radius: Single);
var
  T: Single;
begin
  if not FShowFocusRing then Exit;
  T := FFocus.Eased;
  if T <= 0.01 then Exit;
  S.StrokeRoundRect(R, Radius, 2, EsSolid(FadeColor(EsCurrentTheme.Accent, T)));
end;

{ TEsFxButton }

constructor TEsFxButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRadius := -1;
  FImageIndex := -1;
  FTextSettings := TEsFxTextSettings.Create(txCenter, txCenter);
  FTextSettings.OnChange := @PropsChanged;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := @ImageListChange;
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;

destructor TEsFxButton.Destroy;
begin
  FImageChangeLink.Free;
  FTextSettings.Free;
  inherited Destroy;
end;

class function TEsFxButton.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 112;
  Result.CY := 34;
end;

procedure TEsFxButton.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then
    FImages := nil;
end;

procedure TEsFxButton.SetButtonStyle(AValue: TEsFxButtonStyle);
begin
  if FButtonStyle = AValue then Exit;
  FButtonStyle := AValue;
  Invalidate;
end;

procedure TEsFxButton.SetRadius(AValue: Single);
begin
  if FRadius = AValue then Exit;
  FRadius := AValue;
  Invalidate;
end;

procedure TEsFxButton.SetImages(AValue: TCustomImageList);
begin
  if FImages = AValue then Exit;
  if FImages <> nil then
  begin
    FImages.UnRegisterChanges(FImageChangeLink);
    FImages.RemoveFreeNotification(Self);
  end;
  FImages := AValue;
  if FImages <> nil then
  begin
    FImages.RegisterChanges(FImageChangeLink);
    FImages.FreeNotification(Self);
  end;
  Invalidate;
end;

procedure TEsFxButton.SetImageIndex(AValue: TImageIndex);
begin
  if FImageIndex = AValue then Exit;
  FImageIndex := AValue;
  Invalidate;
end;

procedure TEsFxButton.SetImagePosition(AValue: TEsFxImagePosition);
begin
  if FImagePosition = AValue then Exit;
  FImagePosition := AValue;
  Invalidate;
end;

procedure TEsFxButton.SetTextSettings(AValue: TEsFxTextSettings);
begin
  FTextSettings.Assign(AValue);
end;

procedure TEsFxButton.ImageListChange(Sender: TObject);
begin
  Invalidate;
end;

function TEsFxButton.FaceColor: TAlphaColor;
var
  T: TEsTheme;
begin
  T := EsCurrentTheme;
  case FButtonStyle of
    fbsPrimary: Result := T.Accent;
    fbsDanger: Result := T.Danger;
    fbsSuccess: Result := T.Success;
    fbsOutline, fbsText: Result := TAlphaColors.Null;
  else
    Result := T.ButtonFace;
  end;
end;

function TEsFxButton.ContentColor: TAlphaColor;
var
  T: TEsTheme;
begin
  T := EsCurrentTheme;
  case FButtonStyle of
    fbsPrimary: Result := T.AccentText;
    fbsDanger, fbsSuccess: Result := TAlphaColors.White;
    fbsOutline, fbsText: Result := T.Accent;
  else
    Result := T.ButtonText;
  end;
  Result := FTextSettings.ResolveColor(Result);
end;

procedure TEsFxButton.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  R: TRectF;
  Rad, H, P: Single;
  Face, Face2, Overlay: TAlphaColor;
begin
  T := EsCurrentTheme;
  R := EsRectF(OX + 1, OY + 1, OX + Width - 1, OY + Height - 1);
  if FRadius < 0 then Rad := ThemeRadius else Rad := FRadius;
  H := HoverT.Eased;
  P := PressT.Eased;
  Face := FaceColor;

  if AlphaOf(Face) > 0 then
  begin
    // leve sombra para botões "cheios"
    if FButtonStyle <> fbsDefault then
      S.SoftRoundRect(EsRectF(R.Left, R.Top + 1.5 - P, R.Right, R.Bottom + 1.5 - P),
        Rad, 2.5, FadeColor(TAlphaColors.Black, 0.18 * (1 - P)));
    Face := InterpolateColor(Face, LightenColor(Face, 0.12), H * (1 - P));
    Face := InterpolateColor(Face, DarkenColor(Face, 0.15), P);
    if T.UseGradients or (FButtonStyle = fbsDefault) then
    begin
      if FButtonStyle = fbsDefault then
        Face2 := InterpolateColor(T.ButtonFace2, DarkenColor(T.ButtonFace2, 0.08), P)
      else
        Face2 := DarkenColor(Face, 0.12);
      S.FillRoundRect(R, Rad, EsVertical(Face, Face2, R));
    end
    else
      S.FillRoundRect(R, Rad, EsSolid(Face));
    if FButtonStyle = fbsDefault then
      S.StrokeRoundRect(R, Rad, 1, EsSolid(InterpolateColor(T.Border, T.BorderHot, H)));
  end
  else
  begin
    // outline / text: só overlay de hover
    Overlay := FadeColor(T.Accent, 0.10 * H + 0.12 * P);
    S.FillRoundRect(R, Rad, EsSolid(Overlay));
    if FButtonStyle = fbsOutline then
      S.StrokeRoundRect(R, Rad, 1.2, EsSolid(T.Accent));
  end;
  RenderFocusRing(S, EsInflate(R, 1), Rad + 1);
end;

procedure TEsFxButton.RenderContent(ACanvas: TCanvas);
var
  R: TRect;
  IW, IH, TW, Gap, X, Y, TotalW: Integer;
  HasImg: Boolean;
  Col: TColor;
begin
  R := Rect(6, 2, Width - 6, Height - 2);
  Col := AlphaColorToColor(BlendOver(EsCurrentTheme.Background,
    FadeColor(ContentColor, EffectiveOpacity)));
  HasImg := (FImages <> nil) and (FImageIndex >= 0) and (FImageIndex < FImages.Count);
  if not HasImg then
  begin
    EsDrawText(ACanvas, R, Text, EsFxAlignToH(FTextSettings.HorzAlign),
      EsFxAlignToV(FTextSettings.VertAlign), FTextSettings.WordWrap, Col, True);
    Exit;
  end;
  IW := FImages.Width;
  IH := FImages.Height;
  Gap := EsScale(Self, 6);
  if Text = '' then Gap := 0;
  if FImagePosition = ipTop then
  begin
    X := (Width - IW) div 2;
    Y := Max(4, (Height - IH - ACanvas.TextHeight('Ag') - Gap) div 2);
    FImages.Draw(ACanvas, X, Y, FImageIndex, IsEnabled);
    EsDrawText(ACanvas, Rect(4, Y + IH + Gap, Width - 4, Height - 2), Text,
      dhaCenter, dvaLeading, False, Col, True);
  end
  else
  begin
    TW := ACanvas.TextWidth(Text);
    TotalW := IW + Gap + TW;
    X := Math.Max(6, (Width - TotalW) div 2);
    Y := (Height - IH) div 2;
    if FImagePosition = ipLeft then
    begin
      FImages.Draw(ACanvas, X, Y, FImageIndex, IsEnabled);
      EsDrawText(ACanvas, Rect(X + IW + Gap, 0, Width - 4, Height), Text,
        dhaLeading, dvaCenter, False, Col, True);
    end
    else
    begin
      EsDrawText(ACanvas, Rect(X, 0, X + TW + 1, Height), Text,
        dhaLeading, dvaCenter, False, Col, True);
      FImages.Draw(ACanvas, X + TW + Gap, Y, FImageIndex, IsEnabled);
    end;
  end;
end;

procedure TEsFxButton.DoActivate;
begin
  Click;
end;

procedure TEsFxButton.Click;
var
  F: TCustomForm;
begin
  if FModalResult <> mrNone then
  begin
    F := GetParentForm(Self);
    if F <> nil then
      F.ModalResult := FModalResult;
  end;
  inherited Click;
end;

{ TEsFxSwitch }

constructor TEsFxSwitch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCheck := TEsFxTransition.Create(Self, 0.18);
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;

destructor TEsFxSwitch.Destroy;
begin
  FCheck.Free;
  inherited Destroy;
end;

class function TEsFxSwitch.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 52;
  Result.CY := 28;
end;

procedure TEsFxSwitch.Loaded;
begin
  inherited Loaded;
  FCheck.SetTarget(Ord(FIsChecked), True);
end;

procedure TEsFxSwitch.SetIsChecked(AValue: Boolean);
begin
  if FIsChecked = AValue then Exit;
  FIsChecked := AValue;
  FCheck.SetTarget(Ord(AValue), csLoading in ComponentState);
  EsFxNotifyTrigger(Self, ftChecked, AValue);
  if not (csLoading in ComponentState) and Assigned(FOnSwitch) then
    FOnSwitch(Self);
end;

procedure TEsFxSwitch.DoActivate;
begin
  IsChecked := not IsChecked;
  Click;
end;

procedure TEsFxSwitch.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  R, TR: TRectF;
  C, H, Rad, D, TX, Grow: Single;
  TrackOff: TAlphaColor;
begin
  T := EsCurrentTheme;
  C := FCheck.Eased;
  H := HoverT.Eased;
  D := Math.Min(Height - 2, (Width - 2) / 1.8);
  R := EsRectF(OX + 1, OY + (Height - D) / 2, OX + 1 + D * 1.8, OY + (Height + D) / 2);
  Rad := D / 2;
  TrackOff := InterpolateColor(T.Track, T.BorderHot, H * 0.5);
  S.FillRoundRect(R, Rad, EsSolid(InterpolateColor(TrackOff, T.Accent, C)));
  // polegar (thumb)
  Grow := 1.5 * H + 1.5 * PressT.Eased;
  TX := R.Left + Rad + (R.Width - 2 * Rad) * C;
  TR := EsRectF(TX - Rad + 3 - Grow / 2, R.Top + 3 - Grow / 2,
    TX + Rad - 3 + Grow / 2, R.Bottom - 3 + Grow / 2);
  S.SoftRoundRect(EsRectF(TR.Left, TR.Top + 1, TR.Right, TR.Bottom + 1),
    TR.Width / 2, 2, FadeColor(TAlphaColors.Black, 0.25));
  S.FillEllipse(TR, EsSolid(TAlphaColors.White));
  RenderFocusRing(S, EsInflate(R, 1.5), Rad + 1.5);
end;

{ TEsFxCustomCheck }

constructor TEsFxCustomCheck.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCheck := TEsFxTransition.Create(Self, 0.16);
  FTextSettings := TEsFxTextSettings.Create(txLeading, txCenter);
  FTextSettings.OnChange := @PropsChanged;
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;

destructor TEsFxCustomCheck.Destroy;
begin
  FCheck.Free;
  FTextSettings.Free;
  inherited Destroy;
end;

class function TEsFxCustomCheck.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 140;
  Result.CY := 26;
end;

procedure TEsFxCustomCheck.SetTextSettings(AValue: TEsFxTextSettings);
begin
  FTextSettings.Assign(AValue);
end;

procedure TEsFxCustomCheck.Loaded;
begin
  inherited Loaded;
  FCheck.SetTarget(Ord(FIsChecked), True);
end;

procedure TEsFxCustomCheck.SetIsChecked(AValue: Boolean);
begin
  if FIsChecked = AValue then Exit;
  FIsChecked := AValue;
  FCheck.SetTarget(Ord(AValue), csLoading in ComponentState);
  EsFxNotifyTrigger(Self, ftChecked, AValue);
  if not (csLoading in ComponentState) and Assigned(FOnChange) then
    FOnChange(Self);
end;

function TEsFxCustomCheck.BoxRect(OX, OY: Single): TRectF;
var
  B: Single;
begin
  B := EsScale(Self, 18);
  Result := EsRectF(OX + 2, OY + (Height - B) / 2, OX + 2 + B, OY + (Height + B) / 2);
end;

procedure TEsFxCustomCheck.RenderContent(ACanvas: TCanvas);
var
  L: Integer;
begin
  L := Round(BoxRect(0, 0).Right) + EsScale(Self, 8);
  EsDrawText(ACanvas, Rect(L, 0, Width, Height), Text,
    EsFxAlignToH(FTextSettings.HorzAlign), EsFxAlignToV(FTextSettings.VertAlign),
    FTextSettings.WordWrap, AlphaColorToColor(BlendOver(EsCurrentTheme.Background,
    FadeColor(FTextSettings.ResolveColor(ThemeText), EffectiveOpacity))), True);
end;

{ TEsFxCheckBox }

procedure TEsFxCheckBox.DoActivate;
begin
  IsChecked := not IsChecked;
  Click;
end;

procedure TEsFxCheckBox.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  R: TRectF;
  C, H, L1, L2, Prog, Rad, W: Single;
  X1, Y1, X2, Y2, X3, Y3: Single;
  Mark: TEsPaint;
begin
  T := EsCurrentTheme;
  R := BoxRect(OX, OY);
  W := R.Width;
  C := CheckT.Eased;
  H := HoverT.Eased;
  Rad := Math.Min(4, T.Radius);
  S.FillRoundRect(R, Rad, EsSolid(InterpolateColor(T.Surface, T.Accent, C)));
  S.StrokeRoundRect(R, Rad, 1.2,
    EsSolid(InterpolateColor(InterpolateColor(T.BorderHot, T.Text, H * 0.4), T.Accent, C)));
  if H > 0 then
    S.FillRoundRect(R, Rad, EsSolid(FadeColor(T.Hover, H)));
  // check mark desenhado progressivamente
  if C > 0.01 then
  begin
    X1 := R.Left + W * 0.24; Y1 := R.Top + W * 0.52;
    X2 := R.Left + W * 0.42; Y2 := R.Top + W * 0.70;
    X3 := R.Left + W * 0.77; Y3 := R.Top + W * 0.32;
    L1 := Hypot(X2 - X1, Y2 - Y1);
    L2 := Hypot(X3 - X2, Y3 - Y2);
    Prog := C * (L1 + L2);
    Mark := EsSolid(T.AccentText);
    if Prog <= L1 then
      S.DrawLine(X1, Y1, X1 + (X2 - X1) * Prog / L1, Y1 + (Y2 - Y1) * Prog / L1, W * 0.12, Mark)
    else
    begin
      S.DrawLine(X1, Y1, X2, Y2, W * 0.12, Mark);
      Prog := (Prog - L1) / L2;
      S.DrawLine(X2, Y2, X2 + (X3 - X2) * Prog, Y2 + (Y3 - Y2) * Prog, W * 0.12, Mark);
    end;
  end;
  RenderFocusRing(S, EsInflate(R, 2), Rad + 2);
end;

{ TEsFxRadioButton }

procedure TEsFxRadioButton.SetIsChecked(AValue: Boolean);
var
  I: Integer;
  C: TControl;
begin
  if AValue and (Parent <> nil) and not (csLoading in ComponentState) then
    for I := 0 to Parent.ControlCount - 1 do
    begin
      C := Parent.Controls[I];
      if (C <> Self) and (C is TEsFxRadioButton) and
         SameText(TEsFxRadioButton(C).GroupName, FGroupName) then
        TEsFxRadioButton(C).IsChecked := False;
    end;
  inherited SetIsChecked(AValue);
end;

procedure TEsFxRadioButton.DoActivate;
begin
  if not IsChecked then
    IsChecked := True;
  Click;
end;

procedure TEsFxRadioButton.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  R, Dot: TRectF;
  C, H, D, CX, CY: Single;
begin
  T := EsCurrentTheme;
  R := BoxRect(OX, OY);
  C := CheckT.Eased;
  H := HoverT.Eased;
  S.FillEllipse(R, EsSolid(InterpolateColor(T.Surface, T.Accent, C)));
  S.StrokeEllipse(R, 1.2, EsSolid(InterpolateColor(T.BorderHot, T.Accent, C)));
  if H > 0 then
    S.FillEllipse(R, EsSolid(FadeColor(T.Hover, H)));
  if C > 0.01 then
  begin
    D := R.Width * 0.42 * C * (1 - 0.15 * PressT.Eased);
    CX := (R.Left + R.Right) / 2;
    CY := (R.Top + R.Bottom) / 2;
    Dot := EsRectF(CX - D / 2, CY - D / 2, CX + D / 2, CY + D / 2);
    S.FillEllipse(Dot, EsSolid(T.AccentText));
  end;
  RenderFocusRing(S, EsInflate(R, 2), R.Width / 2 + 2);
end;

{ TEsFxTrackBar }

constructor TEsFxTrackBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMin := 0;
  FMax := 100;
  FValue := 0;
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;

class function TEsFxTrackBar.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 160;
  Result.CY := 28;
end;

procedure TEsFxTrackBar.SetMin(AValue: Single);
begin
  if FMin = AValue then Exit;
  FMin := AValue;
  if FValue < FMin then FValue := FMin;
  Invalidate;
end;

procedure TEsFxTrackBar.SetMax(AValue: Single);
begin
  if FMax = AValue then Exit;
  FMax := AValue;
  if FValue > FMax then FValue := FMax;
  Invalidate;
end;

procedure TEsFxTrackBar.SetValue(AValue: Single);
begin
  if not (csLoading in ComponentState) then
  begin
    AValue := EnsureRange(AValue, Math.Min(FMin, FMax), Math.Max(FMin, FMax));
    if FFrequency > 0 then
      AValue := FMin + Round((AValue - FMin) / FFrequency) * FFrequency;
  end;
  if FValue = AValue then Exit;
  FValue := AValue;
  Invalidate;
  if not (csLoading in ComponentState) then
  begin
    if Assigned(FOnTracking) then FOnTracking(Self);
    if not FDragging and Assigned(FOnChange) then FOnChange(Self);
  end;
end;

procedure TEsFxTrackBar.SetOrientation(AValue: TEsFxOrientation);
begin
  if FOrientation = AValue then Exit;
  FOrientation := AValue;
  if not (csLoading in ComponentState) then
    SetBounds(Left, Top, Height, Width);
  Invalidate;
end;

function TEsFxTrackBar.Ratio: Single;
begin
  if FMax = FMin then
    Result := 0
  else
    Result := EnsureRange((FValue - FMin) / (FMax - FMin), 0, 1);
end;

procedure TEsFxTrackBar.TrackGeometry(OX, OY: Single; out A, B: TPointF;
  out Thumb: Single);
begin
  Thumb := Math.Min(EsScale(Self, 18), Math.Min(Width, Height) - 4);
  if FOrientation = orHorizontal then
  begin
    A := EsPointF(OX + Thumb / 2 + 2, OY + Height / 2);
    B := EsPointF(OX + Width - Thumb / 2 - 2, OY + Height / 2);
  end
  else
  begin
    // vertical: mínimo em baixo
    A := EsPointF(OX + Width / 2, OY + Height - Thumb / 2 - 2);
    B := EsPointF(OX + Width / 2, OY + Thumb / 2 + 2);
  end;
end;

procedure TEsFxTrackBar.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  A, B, P: TPointF;
  Th, R, TW, Inner: Single;
begin
  T := EsCurrentTheme;
  TrackGeometry(OX, OY, A, B, Th);
  R := Ratio;
  TW := EsScale(Self, 4);
  P := EsPointF(A.X + (B.X - A.X) * R, A.Y + (B.Y - A.Y) * R);
  S.DrawLine(A.X, A.Y, B.X, B.Y, TW, EsSolid(T.Track));
  S.DrawLine(A.X, A.Y, P.X, P.Y, TW, EsSolid(T.Accent));
  // thumb estilo Fluent: anel + miolo que cresce no hover
  S.SoftRoundRect(EsRectF(P.X - Th / 2, P.Y - Th / 2 + 1, P.X + Th / 2, P.Y + Th / 2 + 1),
    Th / 2, 2, FadeColor(TAlphaColors.Black, 0.2));
  S.FillEllipse(EsRectF(P.X - Th / 2, P.Y - Th / 2, P.X + Th / 2, P.Y + Th / 2),
    EsSolid(T.Surface));
  Inner := Th * (0.45 + 0.12 * HoverT.Eased - 0.1 * PressT.Eased);
  S.FillEllipse(EsRectF(P.X - Inner / 2, P.Y - Inner / 2, P.X + Inner / 2, P.Y + Inner / 2),
    EsSolid(T.Accent));
  RenderFocusRing(S, EsRectF(P.X - Th / 2 - 2, P.Y - Th / 2 - 2, P.X + Th / 2 + 2,
    P.Y + Th / 2 + 2), Th / 2 + 2);
end;

procedure TEsFxTrackBar.ValueFromPoint(X, Y: Integer);
var
  A, B: TPointF;
  Th, R: Single;
begin
  TrackGeometry(0, 0, A, B, Th);
  if FOrientation = orHorizontal then
  begin
    if B.X = A.X then Exit;
    R := (X - A.X) / (B.X - A.X);
  end
  else
  begin
    if B.Y = A.Y then Exit;
    R := (Y - A.Y) / (B.Y - A.Y);
  end;
  Value := FMin + EnsureRange(R, 0, 1) * (FMax - FMin);
end;

procedure TEsFxTrackBar.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button = mbLeft then
  begin
    FDragging := True;
    ValueFromPoint(X, Y);
  end;
end;

procedure TEsFxTrackBar.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if FDragging then
    ValueFromPoint(X, Y);
end;

procedure TEsFxTrackBar.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if FDragging and (Button = mbLeft) then
  begin
    FDragging := False;
    if Assigned(FOnChange) then FOnChange(Self);
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TEsFxTrackBar.KeyDown(var Key: Word; Shift: TShiftState);
var
  Step: Single;
begin
  if FFrequency > 0 then Step := FFrequency else Step := (FMax - FMin) / 100;
  case Key of
    VK_LEFT, VK_DOWN: begin Value := FValue - Step; Key := 0; end;
    VK_RIGHT, VK_UP: begin Value := FValue + Step; Key := 0; end;
    VK_PRIOR: begin Value := FValue + Step * 10; Key := 0; end;
    VK_NEXT: begin Value := FValue - Step * 10; Key := 0; end;
    VK_HOME: begin Value := FMin; Key := 0; end;
    VK_END: begin Value := FMax; Key := 0; end;
  end;
  inherited KeyDown(Key, Shift);
end;

function TEsFxTrackBar.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint): Boolean;
var
  Step: Single;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if Result then Exit;
  if FFrequency > 0 then Step := FFrequency else Step := (FMax - FMin) / 50;
  if WheelDelta > 0 then Value := FValue + Step else Value := FValue - Step;
  Result := True;
end;

{ TEsFxProgressBar }

constructor TEsFxProgressBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls];
  FMax := 100;
  FAnimated := True;
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;

destructor TEsFxProgressBar.Destroy;
begin
  EsFxTicker.Remove(@Tick);
  inherited Destroy;
end;

class function TEsFxProgressBar.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 160;
  Result.CY := 8;
end;

procedure TEsFxProgressBar.SetMin(AValue: Single);
begin
  if FMin = AValue then Exit;
  FMin := AValue;
  Invalidate;
end;

procedure TEsFxProgressBar.SetMax(AValue: Single);
begin
  if FMax = AValue then Exit;
  FMax := AValue;
  Invalidate;
end;

procedure TEsFxProgressBar.SetValue(AValue: Single);
begin
  if FValue = AValue then Exit;
  FValue := AValue;
  if FAnimated and not (csDesigning in ComponentState) and
     not (csLoading in ComponentState) then
    EsFxTicker.Add(@Tick)
  else
  begin
    FShown := FValue;
    Invalidate;
  end;
end;

procedure TEsFxProgressBar.SetOrientation(AValue: TEsFxOrientation);
begin
  if FOrientation = AValue then Exit;
  FOrientation := AValue;
  Invalidate;
end;

procedure TEsFxProgressBar.SetBarColor(AValue: TAlphaColor);
begin
  if FBarColor = AValue then Exit;
  FBarColor := AValue;
  Invalidate;
end;

procedure TEsFxProgressBar.Tick(DeltaSec: Double);
var
  Diff: Single;
begin
  Diff := FValue - FShown;
  if Abs(Diff) < Abs(FMax - FMin) * 0.002 then
  begin
    FShown := FValue;
    EsFxTicker.Remove(@Tick);
  end
  else
    FShown := FShown + Diff * Math.Min(1, DeltaSec * 10);
  Invalidate;
end;

procedure TEsFxProgressBar.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  R, B: TRectF;
  Rt, Rad: Single;
  Bar: TAlphaColor;
begin
  T := EsCurrentTheme;
  if csLoading in ComponentState then FShown := FValue;
  R := EsRectF(OX, OY, OX + Width, OY + Height);
  if FMax = FMin then Rt := 0
  else Rt := EnsureRange((FShown - FMin) / (FMax - FMin), 0, 1);
  if FOrientation = orHorizontal then
    Rad := Height / 2
  else
    Rad := Width / 2;
  S.FillRoundRect(R, Rad, EsSolid(T.Track));
  if AlphaOf(FBarColor) > 0 then Bar := FBarColor else Bar := T.Accent;
  if Rt <= 0 then Exit;
  if FOrientation = orHorizontal then
    B := EsRectF(R.Left, R.Top, R.Left + R.Width * Rt, R.Bottom)
  else
    B := EsRectF(R.Left, R.Bottom - R.Height * Rt, R.Right, R.Bottom);
  if T.UseGradients then
    S.FillRoundRect(B, Rad, EsVertical(LightenColor(Bar, 0.15), Bar, B))
  else
    S.FillRoundRect(B, Rad, EsSolid(Bar));
end;

{ TEsFxArcProgress }

constructor TEsFxArcProgress.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls];
  FMax := 100;
  FValue := 25;
  FThickness := 8;
  FShowText := True;
  FTextFormat := '%.0f%%';
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;

class function TEsFxArcProgress.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 96;
  Result.CY := 96;
end;

procedure TEsFxArcProgress.SetMin(AValue: Single);
begin
  if FMin = AValue then Exit;
  FMin := AValue;
  Invalidate;
end;

procedure TEsFxArcProgress.SetMax(AValue: Single);
begin
  if FMax = AValue then Exit;
  FMax := AValue;
  Invalidate;
end;

procedure TEsFxArcProgress.SetValue(AValue: Single);
begin
  if FValue = AValue then Exit;
  FValue := AValue;
  Invalidate;
end;

procedure TEsFxArcProgress.SetThickness(AValue: Single);
begin
  if FThickness = AValue then Exit;
  FThickness := Math.Max(1, AValue);
  Invalidate;
end;

procedure TEsFxArcProgress.SetStartAngle(AValue: Single);
begin
  if FStartAngle = AValue then Exit;
  FStartAngle := AValue;
  Invalidate;
end;

procedure TEsFxArcProgress.SetShowText(AValue: Boolean);
begin
  if FShowText = AValue then Exit;
  FShowText := AValue;
  Invalidate;
end;

procedure TEsFxArcProgress.SetBarColor(AValue: TAlphaColor);
begin
  if FBarColor = AValue then Exit;
  FBarColor := AValue;
  Invalidate;
end;

procedure TEsFxArcProgress.SetTextFormat(const AValue: string);
begin
  if FTextFormat = AValue then Exit;
  FTextFormat := AValue;
  Invalidate;
end;

procedure TEsFxArcProgress.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  CX, CY, Rad, Rt: Single;
  Bar: TAlphaColor;
begin
  T := EsCurrentTheme;
  CX := OX + Width / 2;
  CY := OY + Height / 2;
  Rad := Math.Min(Width, Height) / 2 - FThickness / 2 - 1;
  S.StrokeArc(CX, CY, Rad, FThickness, 0, 360, EsSolid(T.Track));
  if FMax = FMin then Rt := 0
  else Rt := EnsureRange((FValue - FMin) / (FMax - FMin), 0, 1);
  if AlphaOf(FBarColor) > 0 then Bar := FBarColor else Bar := T.Accent;
  if Rt > 0 then
    S.StrokeArc(CX, CY, Rad, FThickness, FStartAngle, 360 * Rt, EsSolid(Bar), Rt < 1);
end;

procedure TEsFxArcProgress.RenderContent(ACanvas: TCanvas);
var
  Pct: Double;
begin
  if not FShowText then Exit;
  if FMax = FMin then Pct := 0
  else Pct := EnsureRange((FValue - FMin) / (FMax - FMin), 0, 1) * 100;
  EsDrawText(ACanvas, Rect(0, 0, Width, Height), Format(FTextFormat, [Pct]),
    dhaCenter, dvaCenter, False, AlphaColorToColor(EsCurrentTheme.Text));
end;

{ TEsFxAniIndicator }

constructor TEsFxAniIndicator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetInitialBounds(0, 0, 40, 40);
  FPhase := 0;
end;

destructor TEsFxAniIndicator.Destroy;
begin
  EsFxTicker.Remove(@Tick);
  inherited Destroy;
end;

procedure TEsFxAniIndicator.Loaded;
begin
  inherited Loaded;
  if FActive and not (csDesigning in ComponentState) then
    EsFxTicker.Add(@Tick);
end;

procedure TEsFxAniIndicator.SetActive(AValue: Boolean);
begin
  if FActive = AValue then Exit;
  FActive := AValue;
  if [csDesigning, csLoading] * ComponentState = [] then
  begin
    if FActive then EsFxTicker.Add(@Tick) else EsFxTicker.Remove(@Tick);
  end;
  Invalidate;
end;

procedure TEsFxAniIndicator.Tick(DeltaSec: Double);
begin
  FAngle := FAngle + 300 * DeltaSec;
  if FAngle >= 360 then FAngle := FAngle - 360;
  FPhase := FPhase + DeltaSec * 0.9;
  if FPhase >= 1 then FPhase := FPhase - 1;
  Invalidate;
end;

procedure TEsFxAniIndicator.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  CX, CY, Rad, Th, Sweep: Single;
begin
  if not FActive and not (csDesigning in ComponentState) then Exit;
  T := EsCurrentTheme;
  Th := Math.Max(2, Math.Min(Width, Height) / 10);
  CX := OX + Width / 2;
  CY := OY + Height / 2;
  Rad := Math.Min(Width, Height) / 2 - Th / 2 - 1;
  // arco que "respira" (estilo Material/Fluent)
  Sweep := 40 + 230 * (0.5 - 0.5 * Cos(FPhase * 2 * Pi));
  S.StrokeArc(CX, CY, Rad, Th, FAngle + FPhase * 360, Sweep, EsSolid(T.Accent));
end;

{ TEsFxEdit }

constructor TEsFxEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls] + [csCaptureMouse];
  FFocus := TEsFxTransition.Create(Self, 0.15);
  FHover := TEsFxTransition.Create(Self, 0.12);
  FEdit := TEdit.Create(Self);
  FEdit.ControlStyle := FEdit.ControlStyle + [csNoDesignSelectable];
  FEdit.BorderStyle := bsNone;
  FEdit.ParentFont := True;
  FEdit.OnEnter := @EditEnter;
  FEdit.OnExit := @EditExit;
  FEdit.OnChange := @EditChange;
  FEdit.OnKeyDown := @EditKeyDown;
  FEdit.OnKeyPress := @EditKeyPress;
  FEdit.Parent := Self;
  TabStop := True;
  EsThemes.AddChangeHandler(@ThemeChanged);
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
  SyncColors;
end;

destructor TEsFxEdit.Destroy;
begin
  EsThemes.RemoveChangeHandler(@ThemeChanged);
  FFocus.Free;
  FHover.Free;
  inherited Destroy;
end;

class function TEsFxEdit.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 180;
  Result.CY := 34;
end;

procedure TEsFxEdit.SyncColors;
begin
  FEdit.Color := AlphaColorToColor(EsCurrentTheme.Surface);
  FEdit.Font.Color := AlphaColorToColor(EsCurrentTheme.Text);
end;

procedure TEsFxEdit.ThemeChanged(Sender: TObject);
begin
  SyncColors;
end;

procedure TEsFxEdit.Resize;
var
  Pad, EH: Integer;
begin
  inherited Resize;
  if FEdit = nil then Exit;
  Pad := EsScale(Self, 10);
  EH := FEdit.Height;
  FEdit.SetBounds(Pad, Math.Max(2, (Height - EH) div 2), Math.Max(4, Width - 2 * Pad), EH);
end;

procedure TEsFxEdit.FontChanged(Sender: TObject);
begin
  inherited FontChanged(Sender);
  if FEdit <> nil then
  begin
    SyncColors;
    Resize;
  end;
end;

procedure TEsFxEdit.EnabledChanged;
begin
  inherited EnabledChanged;
  if FEdit <> nil then FEdit.Enabled := Enabled;
end;

procedure TEsFxEdit.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  R: TRectF;
  F, H, Rad, LW: Single;
begin
  T := EsCurrentTheme;
  F := FFocus.Eased;
  H := FHover.Eased;
  Rad := Math.Min(T.Radius, Height / 2);
  R := EsRectF(OX + 0.5, OY + 0.5, OX + Width - 0.5, OY + Height - 0.5);
  S.FillRoundRect(R, Rad, EsSolid(T.Surface));
  S.StrokeRoundRect(R, Rad, 1, EsSolid(InterpolateColor(
    InterpolateColor(T.Border, T.BorderHot, H), T.Accent, F * 0.6)));
  // linha de foco inferior (Fluent / FMX Windows 11)
  if F > 0.01 then
  begin
    LW := (R.Width - 2 * Rad) * F;
    S.FillRoundRect(EsRectF(R.Left + R.Width / 2 - LW / 2 - Rad * F, R.Bottom - 2,
      R.Left + R.Width / 2 + LW / 2 + Rad * F, R.Bottom), 1, EsSolid(T.Accent));
  end;
end;

procedure TEsFxEdit.SetFocus;
begin
  if FEdit.CanFocus then
    FEdit.SetFocus
  else
    inherited SetFocus;
end;

procedure TEsFxEdit.SelectAll;
begin
  FEdit.SelectAll;
end;

procedure TEsFxEdit.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if not (csDesigning in ComponentState) and FEdit.CanFocus then
    FEdit.SetFocus;
end;

procedure TEsFxEdit.MouseEnter;
begin
  FHover.SetTarget(1);
  inherited MouseEnter;
end;

procedure TEsFxEdit.MouseLeave;
begin
  FHover.SetTarget(0);
  inherited MouseLeave;
end;

procedure TEsFxEdit.EditEnter(Sender: TObject);
begin
  FFocus.SetTarget(1);
  EsFxNotifyTrigger(Self, ftFocused, True);
end;

procedure TEsFxEdit.EditExit(Sender: TObject);
begin
  FFocus.SetTarget(0);
  EsFxNotifyTrigger(Self, ftFocused, False);
end;

procedure TEsFxEdit.EditChange(Sender: TObject);
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TEsFxEdit.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(OnKeyDown) then OnKeyDown(Self, Key, Shift);
end;

procedure TEsFxEdit.EditKeyPress(Sender: TObject; var Key: char);
begin
  if Assigned(OnKeyPress) then OnKeyPress(Self, Key);
end;

function TEsFxEdit.GetText: string;
begin
  Result := FEdit.Text;
end;

procedure TEsFxEdit.SetText(const AValue: string);
begin
  FEdit.Text := AValue;
end;

function TEsFxEdit.GetTextPrompt: string;
begin
  Result := FEdit.TextHint;
end;

procedure TEsFxEdit.SetTextPrompt(const AValue: string);
begin
  FEdit.TextHint := AValue;
end;

function TEsFxEdit.GetPassword: Boolean;
begin
  Result := FEdit.PasswordChar <> #0;
end;

procedure TEsFxEdit.SetPassword(AValue: Boolean);
begin
  if AValue then FEdit.PasswordChar := '*' else FEdit.PasswordChar := #0;
end;

function TEsFxEdit.GetReadOnly: Boolean;
begin
  Result := FEdit.ReadOnly;
end;

procedure TEsFxEdit.SetReadOnly(AValue: Boolean);
begin
  FEdit.ReadOnly := AValue;
end;

function TEsFxEdit.GetMaxLength: Integer;
begin
  Result := FEdit.MaxLength;
end;

procedure TEsFxEdit.SetMaxLength(AValue: Integer);
begin
  FEdit.MaxLength := AValue;
end;

function TEsFxEdit.GetNumbersOnly: Boolean;
begin
  Result := FEdit.NumbersOnly;
end;

procedure TEsFxEdit.SetNumbersOnly(AValue: Boolean);
begin
  FEdit.NumbersOnly := AValue;
end;

{ TEsFxStyleBook }

constructor TEsFxStyleBook.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FStyle := dsLight;
  FApplyToForm := True;
  FCustomStyle := TStringList.Create;
  TStringList(FCustomStyle).OnChange := @CustomStyleChanged;
end;

destructor TEsFxStyleBook.Destroy;
begin
  FCustomStyle.Free;
  inherited Destroy;
end;

procedure TEsFxStyleBook.SetStyleFile(const AValue: string);
begin
  if FStyleFile = AValue then Exit;
  FStyleFile := AValue;
  if not (csLoading in ComponentState) then Apply;
end;

procedure TEsFxStyleBook.SetCustomStyle(AValue: TStrings);
begin
  FCustomStyle.Assign(AValue);
end;

procedure TEsFxStyleBook.CustomStyleChanged(Sender: TObject);
begin
  if not (csLoading in ComponentState) then Apply;
end;

procedure TEsFxStyleBook.SaveStyleToFile(const AFileName: string);
begin
  EsThemes.SaveToFile(AFileName);
end;

procedure TEsFxStyleBook.LoadStyleFromFile(const AFileName: string);
begin
  FCustomStyle.LoadFromFile(AFileName);
end;

procedure TEsFxStyleBook.Apply;
var
  F: string;
  T: TEsTheme;
  K: TEsStyleKind;
  Done: Boolean;
begin
  Done := False;
  F := FStyleFile;
  if (F <> '') and not (csDesigning in ComponentState) then
  begin
    if (Pos(':', F) = 0) and (F[1] <> '/') and (F[1] <> '\') then
      F := ExtractFilePath(ParamStr(0)) + F;
    if FileExists(F) then
    begin
      EsThemes.LoadFromFile(F);
      Done := True;
    end;
  end;
  if not Done and (Trim(FCustomStyle.Text) <> '') then
  begin
    T := EsThemeFromStrings(FCustomStyle, K);
    if AlphaOf(FAccentColor) > 0 then
    begin
      T.Accent := FAccentColor;
      if IsDarkColor(FAccentColor) then T.AccentText := TAlphaColors.White
      else T.AccentText := TAlphaColors.Black;
    end;
    EsThemes.ApplyTheme(T);
    Done := True;
  end;
  if not Done then
    EsThemes.ApplyStyle(FStyle, FAccentColor);
  if FApplyToForm and (Owner is TCustomForm) then
    EsFxApplyThemeToForm(TCustomForm(Owner));
  if Assigned(FOnStyleChanged) then
    FOnStyleChanged(Self);
end;

procedure TEsFxStyleBook.Loaded;
begin
  inherited Loaded;
  Apply;
end;

procedure TEsFxStyleBook.SetStyle(AValue: TEsStyleKind);
begin
  if FStyle = AValue then Exit;
  FStyle := AValue;
  if not (csLoading in ComponentState) then Apply;
end;

procedure TEsFxStyleBook.SetAccentColor(AValue: TAlphaColor);
begin
  if FAccentColor = AValue then Exit;
  FAccentColor := AValue;
  if not (csLoading in ComponentState) then Apply;
end;

procedure TEsFxStyleBook.SetApplyToForm(AValue: Boolean);
begin
  if FApplyToForm = AValue then Exit;
  FApplyToForm := AValue;
  if not (csLoading in ComponentState) then Apply;
end;

end.
