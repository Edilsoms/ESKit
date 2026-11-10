{
 *****************************************************************************
  ESKit - eseditors.pas
  Editores no estilo DevExpress (cxEdit):
    TEsButtonEdit  - edit com coleção de botões embutidos (cxButtonEdit)
    TEsSpinEdit    - numérico com setas e auto-repetição (cxSpinEdit)
    TEsComboBox    - lista suspensa com auto-completar (cxComboBox)
    TEsDateEdit    - data com calendário suspenso (cxDateEdit)
    TEsButton      - botão skinado com menu suspenso (cxButton)
    TEsGroupBox    - painel com cabeçalho e recolhimento (cxGroupBox)

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsEditors;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Types, Math, Controls, Graphics, Forms, StdCtrls, ExtCtrls,
  Menus, ImgList, Calendar, LCLType, LCLIntf, LMessages,
  EsGraphics, EsTheme, EsSkins;

type
  TEsEditButtonKind = (sbkEllipsis, sbkDown, sbkGlyph, sbkText, sbkClear,
    sbkSearch, sbkCalendar, sbkUp);

  { TEsEditButton }

  TEsEditButton = class(TCollectionItem)
  private
    FKind: TEsEditButtonKind;
    FCaption: string;
    FWidth: Integer;
    FVisible: Boolean;
    FEnabled: Boolean;
    FImageIndex: TImageIndex;
    FHint: string;
    procedure SetKind(AValue: TEsEditButtonKind);
    procedure SetCaption(const AValue: string);
    procedure SetWidth(AValue: Integer);
    procedure SetVisible(AValue: Boolean);
    procedure SetEnabled(AValue: Boolean);
    procedure SetImageIndex(AValue: TImageIndex);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(ACollection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property Kind: TEsEditButtonKind read FKind write SetKind default sbkEllipsis;
    property Caption: string read FCaption write SetCaption;
    { 0 = automático }
    property Width: Integer read FWidth write SetWidth default 0;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    property Hint: string read FHint write FHint;
  end;

  { TEsEditButtons }

  TEsEditButtons = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TEsEditButton;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AOwner: TPersistent);
    function Add: TEsEditButton;
    property Items[Index: Integer]: TEsEditButton read GetItem; default;
  end;

  TEsButtonClickEvent = procedure(Sender: TObject; AButtonIndex: Integer) of object;

  { TEsCustomEdit }

  TEsCustomEdit = class(TCustomControl)
  private
    FEdit: TEdit;
    FButtons: TEsEditButtons;
    FImages: TCustomImageList;
    FHotButton: Integer;
    FPressedButton: Integer;
    FFocused: Boolean;
    FMouseInside: Boolean;
    FOnButtonClick: TEsButtonClickEvent;
    FOnChange: TNotifyEvent;
    FUpdatingText: Boolean;
    procedure SetButtons(AValue: TEsEditButtons);
    procedure SetImages(AValue: TCustomImageList);
    function GetText: string;
    procedure SetText(const AValue: string);
    function GetTextHint: string;
    procedure SetTextHint(const AValue: string);
    function GetReadOnly: Boolean;
    procedure SetReadOnly(AValue: Boolean);
    function GetMaxLength: Integer;
    procedure SetMaxLength(AValue: Integer);
    function GetPasswordChar: Char;
    procedure SetPasswordChar(AValue: Char);
    function GetEditAlignment: TAlignment;
    procedure SetEditAlignment(AValue: TAlignment);
    procedure InnerEnter(Sender: TObject);
    procedure InnerExit(Sender: TObject);
    procedure InnerChange(Sender: TObject);
    procedure InnerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InnerKeyPress(Sender: TObject; var Key: Char);
    procedure InnerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ThemeChanged(Sender: TObject);
  protected
    procedure SyncColors; virtual;
    procedure LayoutEdit; virtual;
    function ButtonWidth(Index: Integer): Integer; virtual;
    function ButtonsTotalWidth: Integer; virtual;
    function ButtonRect(Index: Integer): TRect; virtual;
    function ButtonAt(X, Y: Integer): Integer;
    procedure PaintButton(Index: Integer; const R: TRect); virtual;
    procedure Paint; override;
    procedure EraseBackground(DC: HDC); override;
    procedure Resize; override;
    procedure FontChanged(Sender: TObject); override;
    procedure EnabledChanged; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    { ganchos para descendentes }
    procedure DoButtonDown(Index: Integer); virtual;
    procedure DoButtonClick(Index: Integer); virtual;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); virtual;
    procedure DoEditKeyPress(var Key: Char); virtual;
    procedure DoEditChange; virtual;
    procedure DoEditExit; virtual;
    procedure SetTextSilently(const AValue: string);
    class function GetControlClassDefaultSize: TSize; override;
    property Buttons: TEsEditButtons read FButtons write SetButtons;
    property Images: TCustomImageList read FImages write SetImages;
    property OnButtonClick: TEsButtonClickEvent read FOnButtonClick write FOnButtonClick;
    property EditAlignment: TAlignment read GetEditAlignment write SetEditAlignment default taLeftJustify;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetFocus; override;
    function Focused: Boolean; override;
    procedure SelectAll;
    property InnerEdit: TEdit read FEdit;
  published
    property Text: string read GetText write SetText;
    property TextHint: string read GetTextHint write SetTextHint;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property MaxLength: Integer read GetMaxLength write SetMaxLength default 0;
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
  end;

  { TEsButtonEdit }

  TEsButtonEdit = class(TEsCustomEdit)
  private
    function GetPasswordCharP: Char;
    procedure SetPasswordCharP(AValue: Char);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Buttons;
    property Images;
    property EditAlignment;
    property PasswordChar: Char read GetPasswordCharP write SetPasswordCharP default #0;
    property OnButtonClick;
  end;

  TEsSpinValueType = (svtInteger, svtFloat);

  { TEsSpinEdit }

  TEsSpinEdit = class(TEsCustomEdit)
  private
    FValue: Double;
    FMinValue: Double;
    FMaxValue: Double;
    FIncrement: Double;
    FLargeIncrement: Double;
    FDecimalPlaces: Integer;
    FValueType: TEsSpinValueType;
    FRepeatTimer: TTimer;
    FRepeatDir: Integer;
    FOnValueChange: TNotifyEvent;
    procedure SetValue(AValue: Double);
    procedure SetMinValue(AValue: Double);
    procedure SetMaxValue(AValue: Double);
    procedure SetDecimalPlaces(AValue: Integer);
    procedure SetValueType(AValue: TEsSpinValueType);
    procedure RepeatTimerTick(Sender: TObject);
    function Clamp(V: Double): Double;
    procedure UpdateText;
    procedure CommitText;
    function GetIntValue: Integer;
    procedure SetIntValue(AValue: Integer);
  protected
    function ButtonsTotalWidth: Integer; override;
    function ButtonRect(Index: Integer): TRect; override;
    procedure PaintButton(Index: Integer; const R: TRect); override;
    procedure DoButtonDown(Index: Integer); override;
    procedure DoButtonClick(Index: Integer); override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEditKeyPress(var Key: Char); override;
    procedure DoEditExit; override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure StepBy(ADelta: Double);
    property IntValue: Integer read GetIntValue write SetIntValue;
  published
    property Value: Double read FValue write SetValue;
    property MinValue: Double read FMinValue write SetMinValue;
    property MaxValue: Double read FMaxValue write SetMaxValue;
    property Increment: Double read FIncrement write FIncrement;
    property LargeIncrement: Double read FLargeIncrement write FLargeIncrement;
    property DecimalPlaces: Integer read FDecimalPlaces write SetDecimalPlaces default 2;
    property ValueType: TEsSpinValueType read FValueType write SetValueType default svtInteger;
    property EditAlignment default taRightJustify;
    property OnValueChange: TNotifyEvent read FOnValueChange write FOnValueChange;
  end;

  { TEsPopupForm - janela suspensa genérica }

  TEsPopupForm = class(TForm)
  private
    FOnClosePopup: TNotifyEvent;
    FClosing: Boolean;
    procedure FormDeactivate(Sender: TObject);
  protected
    procedure Paint; override;
  public
    constructor CreatePopup(AOwner: TComponent);
    procedure PopupBelow(AControl: TControl; AWidth, AHeight: Integer);
    procedure ClosePopup;
    property OnClosePopup: TNotifyEvent read FOnClosePopup write FOnClosePopup;
  end;

  TEsDropDownListStyle = (lsEditList, lsFixedList);

  { TEsComboBox }

  TEsComboBox = class(TEsCustomEdit)
  private
    FItems: TStringList;
    FItemIndex: Integer;
    FDropDownRows: Integer;
    FDropDownListStyle: TEsDropDownListStyle;
    FAutoComplete: Boolean;
    FPopup: TEsPopupForm;
    FList: TListBox;
    FOnSelect: TNotifyEvent;
    procedure SetItems(AValue: TStrings);
    function GetItems: TStrings;
    procedure SetItemIndex(AValue: Integer);
    procedure SetDropDownListStyle(AValue: TEsDropDownListStyle);
    procedure ItemsChanged(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure ListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PopupClosed(Sender: TObject);
  protected
    procedure DoButtonClick(Index: Integer); override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEditChange; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DropDown;
    procedure CloseUp;
    function DroppedDown: Boolean;
  published
    property Items: TStrings read GetItems write SetItems;
    property ItemIndex: Integer read FItemIndex write SetItemIndex default -1;
    property DropDownRows: Integer read FDropDownRows write FDropDownRows default 8;
    property DropDownListStyle: TEsDropDownListStyle read FDropDownListStyle write SetDropDownListStyle default lsEditList;
    property AutoComplete: Boolean read FAutoComplete write FAutoComplete default True;
    property OnSelect: TNotifyEvent read FOnSelect write FOnSelect;
  end;

  { TEsDateEdit }

  TEsDateEdit = class(TEsCustomEdit)
  private
    FDate: TDateTime;
    FDisplayFormat: string;
    FPopup: TEsPopupForm;
    FCalendar: TCalendar;
    FOnDateChange: TNotifyEvent;
    procedure SetDate(AValue: TDateTime);
    procedure SetDisplayFormat(const AValue: string);
    procedure UpdateText;
    procedure CalendarDblClick(Sender: TObject);
    procedure CalendarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TodayClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure OkClick(Sender: TObject);
    procedure PopupClosed(Sender: TObject);
    function GetIsNull: Boolean;
  protected
    procedure DoButtonClick(Index: Integer); override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEditExit; override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DropDown;
    procedure Clear;
    property IsNull: Boolean read GetIsNull;
  published
    { 0 = vazio (null) }
    property Date: TDateTime read FDate write SetDate;
    { vazio = formato curto do sistema }
    property DisplayFormat: string read FDisplayFormat write SetDisplayFormat;
    property OnDateChange: TNotifyEvent read FOnDateChange write FOnDateChange;
  end;

  TEsButtonKind = (sxbkStandard, sxbkDropDown, sxbkDropDownButton);

  { TEsButton }

  TEsButton = class(TCustomControl)
  private
    FKind: TEsButtonKind;
    FDropDownMenu: TPopupMenu;
    FImages: TCustomImageList;
    FImageIndex: TImageIndex;
    FModalResult: TModalResult;
    FFlat: Boolean;
    FHot, FPressed, FArrowHot: Boolean;
    procedure SetKind(AValue: TEsButtonKind);
    procedure SetDropDownMenu(AValue: TPopupMenu);
    procedure SetImages(AValue: TCustomImageList);
    procedure SetImageIndex(AValue: TImageIndex);
    procedure SetFlat(AValue: Boolean);
    function ArrowRect: TRect;
    procedure ShowMenu;
  protected
    procedure Paint; override;
    procedure EraseBackground(DC: HDC); override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure TextChanged; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    class function GetControlClassDefaultSize: TSize; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Click; override;
  published
    property Action;
    property Caption;
    property Kind: TEsButtonKind read FKind write SetKind default sxbkStandard;
    property DropDownMenu: TPopupMenu read FDropDownMenu write SetDropDownMenu;
    property Images: TCustomImageList read FImages write SetImages;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    property ModalResult: TModalResult read FModalResult write FModalResult default mrNone;
    property Flat: Boolean read FFlat write SetFlat default False;
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
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnEnter;
    property OnExit;
  end;

  { TEsGroupBox }

  TEsGroupBox = class(TCustomControl)
  private
    FCollapsible: Boolean;
    FCollapsed: Boolean;
    FExpandedHeight: Integer;
    FHeaderHot: Boolean;
    FOnCollapsedChange: TNotifyEvent;
    procedure SetCollapsible(AValue: Boolean);
    procedure SetCollapsed(AValue: Boolean);
    function HeaderHeight: Integer;
    procedure ThemeChanged(Sender: TObject);
  protected
    procedure Paint; override;
    procedure AdjustClientRect(var ARect: TRect); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseLeave; override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure TextChanged; override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Caption;
    property Collapsible: Boolean read FCollapsible write SetCollapsible default False;
    property Collapsed: Boolean read FCollapsed write SetCollapsed default False;
    property ExpandedHeight: Integer read FExpandedHeight write FExpandedHeight default 0;
    property OnCollapsedChange: TNotifyEvent read FOnCollapsedChange write FOnCollapsedChange;
    property Align;
    property Anchors;
    property BorderSpacing;
    property ChildSizing;
    property Constraints;
    property Enabled;
    property Font;
    property ParentFont;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnResize;
  end;

resourcestring
  rsEsToday = 'Hoje';
  rsEsClear = 'Limpar';
  rsEsOK = 'OK';

implementation

{ TEsEditButton }

constructor TEsEditButton.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FVisible := True;
  FEnabled := True;
  FImageIndex := -1;
end;

procedure TEsEditButton.Assign(Source: TPersistent);
begin
  if Source is TEsEditButton then
  begin
    FKind := TEsEditButton(Source).FKind;
    FCaption := TEsEditButton(Source).FCaption;
    FWidth := TEsEditButton(Source).FWidth;
    FVisible := TEsEditButton(Source).FVisible;
    FEnabled := TEsEditButton(Source).FEnabled;
    FImageIndex := TEsEditButton(Source).FImageIndex;
    FHint := TEsEditButton(Source).FHint;
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

function TEsEditButton.GetDisplayName: string;
const
  KindNames: array[TEsEditButtonKind] of string = ('Ellipsis', 'Down', 'Glyph',
    'Text', 'Clear', 'Search', 'Calendar', 'Up');
begin
  if FCaption <> '' then
    Result := FCaption
  else
    Result := KindNames[FKind];
end;

procedure TEsEditButton.SetKind(AValue: TEsEditButtonKind);
begin
  if FKind = AValue then Exit;
  FKind := AValue;
  Changed(False);
end;

procedure TEsEditButton.SetCaption(const AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  Changed(False);
end;

procedure TEsEditButton.SetWidth(AValue: Integer);
begin
  if FWidth = AValue then Exit;
  FWidth := Max(0, AValue);
  Changed(False);
end;

procedure TEsEditButton.SetVisible(AValue: Boolean);
begin
  if FVisible = AValue then Exit;
  FVisible := AValue;
  Changed(False);
end;

procedure TEsEditButton.SetEnabled(AValue: Boolean);
begin
  if FEnabled = AValue then Exit;
  FEnabled := AValue;
  Changed(False);
end;

procedure TEsEditButton.SetImageIndex(AValue: TImageIndex);
begin
  if FImageIndex = AValue then Exit;
  FImageIndex := AValue;
  Changed(False);
end;

{ TEsEditButtons }

constructor TEsEditButtons.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner, TEsEditButton);
end;

function TEsEditButtons.GetItem(Index: Integer): TEsEditButton;
begin
  Result := TEsEditButton(inherited Items[Index]);
end;

function TEsEditButtons.Add: TEsEditButton;
begin
  Result := TEsEditButton(inherited Add);
end;

procedure TEsEditButtons.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if Owner is TEsCustomEdit then
  begin
    TEsCustomEdit(Owner).LayoutEdit;
    TEsCustomEdit(Owner).Invalidate;
  end;
end;

{ TEsCustomEdit }

constructor TEsCustomEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] + [csCaptureMouse];
  FHotButton := -1;
  FPressedButton := -1;
  FButtons := TEsEditButtons.Create(Self);
  FEdit := TEdit.Create(Self);
  FEdit.ControlStyle := FEdit.ControlStyle + [csNoDesignSelectable];
  FEdit.BorderStyle := bsNone;
  FEdit.ParentFont := True;
  FEdit.OnEnter := @InnerEnter;
  FEdit.OnExit := @InnerExit;
  FEdit.OnChange := @InnerChange;
  FEdit.OnKeyDown := @InnerKeyDown;
  FEdit.OnKeyPress := @InnerKeyPress;
  FEdit.OnKeyUp := @InnerKeyUp;
  FEdit.Parent := Self;
  TabStop := True;
  EsThemes.AddChangeHandler(@ThemeChanged);
  EsThemes.RegisterClient(Self);
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
  SyncColors;
end;

destructor TEsCustomEdit.Destroy;
begin
  EsThemes.UnregisterClient(Self);
  EsThemes.RemoveChangeHandler(@ThemeChanged);
  FButtons.Free;
  inherited Destroy;
end;

class function TEsCustomEdit.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 160;
  Result.CY := 24;
end;

procedure TEsCustomEdit.ThemeChanged(Sender: TObject);
begin
  SyncColors;
end;

procedure TEsCustomEdit.SyncColors;
begin
  FEdit.Color := EsColor(EsSkinTheme.Surface);
  FEdit.Font.Color := EsColor(EsSkinTheme.Text);
end;

procedure TEsCustomEdit.SetButtons(AValue: TEsEditButtons);
begin
  FButtons.Assign(AValue);
end;

procedure TEsCustomEdit.SetImages(AValue: TCustomImageList);
begin
  if FImages = AValue then Exit;
  if FImages <> nil then FImages.RemoveFreeNotification(Self);
  FImages := AValue;
  if FImages <> nil then FImages.FreeNotification(Self);
  LayoutEdit;
  Invalidate;
end;

procedure TEsCustomEdit.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then
    FImages := nil;
end;

function TEsCustomEdit.ButtonWidth(Index: Integer): Integer;
var
  B: TEsEditButton;
begin
  B := FButtons[Index];
  if not B.Visible then Exit(0);
  if B.Width > 0 then Exit(EsScale(Self, B.Width));
  case B.Kind of
    sbkText: Result := EsMeasureCanvas(Font).TextWidth(B.Caption) + EsScale(Self, 14);
    sbkGlyph:
      if FImages <> nil then
        Result := FImages.Width + EsScale(Self, 8)
      else
        Result := EsScale(Self, 20);
  else
    Result := EsScale(Self, 20);
  end;
end;

function TEsCustomEdit.ButtonsTotalWidth: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FButtons.Count - 1 do
    Inc(Result, ButtonWidth(I));
end;

function TEsCustomEdit.ButtonRect(Index: Integer): TRect;
var
  I, X: Integer;
begin
  X := Width - 1;
  for I := FButtons.Count - 1 downto Index + 1 do
    Dec(X, ButtonWidth(I));
  Result := Rect(X - ButtonWidth(Index), 1, X, Height - 1);
end;

function TEsCustomEdit.ButtonAt(X, Y: Integer): Integer;
var
  I: Integer;
  R: TRect;
begin
  for I := 0 to FButtons.Count - 1 do
  begin
    R := ButtonRect(I);
    if (R.Right > R.Left) and PtInRect(R, Point(X, Y)) then
      Exit(I);
  end;
  Result := -1;
end;

procedure TEsCustomEdit.LayoutEdit;
var
  EH, L: Integer;
begin
  if FEdit = nil then Exit;
  L := EsScale(Self, 4);
  EH := FEdit.Height;
  FEdit.SetBounds(L, Max(1, (Height - EH) div 2),
    Max(4, Width - L - 2 - ButtonsTotalWidth), EH);
end;

procedure TEsCustomEdit.Resize;
begin
  inherited Resize;
  LayoutEdit;
end;

procedure TEsCustomEdit.FontChanged(Sender: TObject);
begin
  inherited FontChanged(Sender);
  if FEdit <> nil then
  begin
    SyncColors;
    LayoutEdit;
  end;
end;

procedure TEsCustomEdit.EnabledChanged;
begin
  inherited EnabledChanged;
  if FEdit <> nil then FEdit.Enabled := Enabled;
  Invalidate;
end;

procedure TEsCustomEdit.PaintButton(Index: Integer; const R: TRect);
var
  B: TEsEditButton;
  T: TEsTheme;
  Hot, Pressed: Boolean;
  GlyphColor: TColor;
begin
  B := FButtons[Index];
  T := EsSkinTheme;
  Hot := (FHotButton = Index) and B.Enabled and IsEnabled;
  Pressed := (FPressedButton = Index) and Hot;
  EsDrawButtonFace(Canvas, R, Hot, Pressed, False, True);
  if B.Enabled and IsEnabled then
    GlyphColor := EsColor(T.Text)
  else
    GlyphColor := EsColor(T.TextDisabled);
  case B.Kind of
    sbkEllipsis: EsDrawGlyph(Canvas, R, sgEllipsis, GlyphColor);
    sbkDown: EsDrawGlyph(Canvas, R, sgArrowDown, GlyphColor, 4);
    sbkUp: EsDrawGlyph(Canvas, R, sgArrowUp, GlyphColor, 4);
    sbkClear: EsDrawGlyph(Canvas, R, sgClose, GlyphColor, 3);
    sbkSearch: EsDrawGlyph(Canvas, R, sgSearch, GlyphColor, 5);
    sbkCalendar: EsDrawGlyph(Canvas, R, sgCalendar, GlyphColor, 5);
    sbkText:
      EsDrawText(Canvas, R, B.Caption, dhaCenter, dvaCenter, False, GlyphColor);
    sbkGlyph:
      if (FImages <> nil) and (B.ImageIndex >= 0) and (B.ImageIndex < FImages.Count) then
        FImages.Draw(Canvas, (R.Left + R.Right - FImages.Width) div 2,
          (R.Top + R.Bottom - FImages.Height) div 2, B.ImageIndex, B.Enabled);
  end;
end;

procedure TEsCustomEdit.EraseBackground(DC: HDC);
begin
end;

procedure TEsCustomEdit.Paint;
var
  T: TEsTheme;
  I: Integer;
  R: TRect;
  BorderC: TAlphaColor;
begin
  T := EsSkinTheme;
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := EsColor(T.Surface);
  Canvas.FillRect(ClientRect);
  for I := 0 to FButtons.Count - 1 do
  begin
    R := ButtonRect(I);
    if R.Right > R.Left then
      PaintButton(I, R);
  end;
  if FFocused then
    BorderC := T.Accent
  else if FMouseInside then
    BorderC := T.BorderHot
  else
    BorderC := T.Border;
  EsFrame(Canvas, ClientRect, EsColor(BorderC));
end;

procedure TEsCustomEdit.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  B: Integer;
begin
  inherited MouseMove(Shift, X, Y);
  B := ButtonAt(X, Y);
  if B <> FHotButton then
  begin
    FHotButton := B;
    if (B >= 0) and (FButtons[B].Hint <> '') then
      Hint := FButtons[B].Hint;
    Invalidate;
  end;
end;

procedure TEsCustomEdit.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if csDesigning in ComponentState then Exit;
  if Button <> mbLeft then Exit;
  FPressedButton := ButtonAt(X, Y);
  if (FPressedButton >= 0) and not FButtons[FPressedButton].Enabled then
    FPressedButton := -1;
  if FEdit.CanFocus and not FEdit.Focused then
    FEdit.SetFocus;
  if FPressedButton >= 0 then
    DoButtonDown(FPressedButton);
  Invalidate;
end;

procedure TEsCustomEdit.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  B: Integer;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if Button <> mbLeft then Exit;
  B := FPressedButton;
  FPressedButton := -1;
  Invalidate;
  if (B >= 0) and (ButtonAt(X, Y) = B) then
    DoButtonClick(B);
end;

procedure TEsCustomEdit.MouseEnter;
begin
  FMouseInside := True;
  Invalidate;
  inherited MouseEnter;
end;

procedure TEsCustomEdit.MouseLeave;
begin
  FMouseInside := False;
  FHotButton := -1;
  Invalidate;
  inherited MouseLeave;
end;

procedure TEsCustomEdit.DoButtonDown(Index: Integer);
begin
end;

procedure TEsCustomEdit.DoButtonClick(Index: Integer);
begin
  if (FButtons[Index].Kind = sbkClear) and not ReadOnly then
    Text := '';
  if Assigned(FOnButtonClick) then
    FOnButtonClick(Self, Index);
end;

procedure TEsCustomEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  // Ctrl+Enter aciona o primeiro botão visível (como no DevExpress)
  if (Key = VK_RETURN) and (ssCtrl in Shift) then
    for I := 0 to FButtons.Count - 1 do
      if FButtons[I].Visible and FButtons[I].Enabled then
      begin
        Key := 0;
        DoButtonClick(I);
        Break;
      end;
end;

procedure TEsCustomEdit.DoEditKeyPress(var Key: Char);
begin
end;

procedure TEsCustomEdit.DoEditChange;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TEsCustomEdit.DoEditExit;
begin
end;

procedure TEsCustomEdit.InnerEnter(Sender: TObject);
begin
  FFocused := True;
  Invalidate;
end;

procedure TEsCustomEdit.InnerExit(Sender: TObject);
begin
  FFocused := False;
  DoEditExit;
  Invalidate;
end;

procedure TEsCustomEdit.InnerChange(Sender: TObject);
begin
  if FUpdatingText then Exit;
  DoEditChange;
end;

procedure TEsCustomEdit.InnerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Assigned(OnKeyDown) then OnKeyDown(Self, Key, Shift);
  if Key <> 0 then DoEditKeyDown(Key, Shift);
end;

procedure TEsCustomEdit.InnerKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(OnKeyPress) then OnKeyPress(Self, Key);
  if Key <> #0 then DoEditKeyPress(Key);
end;

procedure TEsCustomEdit.InnerKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Assigned(OnKeyUp) then OnKeyUp(Self, Key, Shift);
end;

procedure TEsCustomEdit.SetTextSilently(const AValue: string);
begin
  FUpdatingText := True;
  try
    FEdit.Text := AValue;
  finally
    FUpdatingText := False;
  end;
end;

procedure TEsCustomEdit.SetFocus;
begin
  if FEdit.CanFocus then FEdit.SetFocus else inherited SetFocus;
end;

function TEsCustomEdit.Focused: Boolean;
begin
  Result := FEdit.Focused or inherited Focused;
end;

procedure TEsCustomEdit.SelectAll;
begin
  FEdit.SelectAll;
end;

function TEsCustomEdit.GetText: string;
begin
  Result := FEdit.Text;
end;

procedure TEsCustomEdit.SetText(const AValue: string);
begin
  FEdit.Text := AValue;
end;

function TEsCustomEdit.GetTextHint: string;
begin
  Result := FEdit.TextHint;
end;

procedure TEsCustomEdit.SetTextHint(const AValue: string);
begin
  FEdit.TextHint := AValue;
end;

function TEsCustomEdit.GetReadOnly: Boolean;
begin
  Result := FEdit.ReadOnly;
end;

procedure TEsCustomEdit.SetReadOnly(AValue: Boolean);
begin
  FEdit.ReadOnly := AValue;
end;

function TEsCustomEdit.GetMaxLength: Integer;
begin
  Result := FEdit.MaxLength;
end;

procedure TEsCustomEdit.SetMaxLength(AValue: Integer);
begin
  FEdit.MaxLength := AValue;
end;

function TEsCustomEdit.GetPasswordChar: Char;
begin
  Result := FEdit.PasswordChar;
end;

procedure TEsCustomEdit.SetPasswordChar(AValue: Char);
begin
  FEdit.PasswordChar := AValue;
end;

function TEsCustomEdit.GetEditAlignment: TAlignment;
begin
  Result := FEdit.Alignment;
end;

procedure TEsCustomEdit.SetEditAlignment(AValue: TAlignment);
begin
  FEdit.Alignment := AValue;
end;

{ TEsButtonEdit }

constructor TEsButtonEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Buttons.Add.Kind := sbkEllipsis;
end;

function TEsButtonEdit.GetPasswordCharP: Char;
begin
  Result := GetPasswordChar;
end;

procedure TEsButtonEdit.SetPasswordCharP(AValue: Char);
begin
  SetPasswordChar(AValue);
end;

{ TEsSpinEdit }

constructor TEsSpinEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIncrement := 1;
  FLargeIncrement := 10;
  FDecimalPlaces := 2;
  FValueType := svtInteger;
  // botões internos: 0 = cima, 1 = baixo
  Buttons.Add.Kind := sbkUp;
  Buttons.Add.Kind := sbkDown;
  EditAlignment := taRightJustify;
  FRepeatTimer := TTimer.Create(Self);
  FRepeatTimer.Enabled := False;
  FRepeatTimer.OnTimer := @RepeatTimerTick;
  UpdateText;
end;

procedure TEsSpinEdit.Loaded;
begin
  inherited Loaded;
  UpdateText;
end;

function TEsSpinEdit.ButtonsTotalWidth: Integer;
begin
  Result := EsScale(Self, 17);
end;

function TEsSpinEdit.ButtonRect(Index: Integer): TRect;
var
  W, MidY: Integer;
begin
  W := ButtonsTotalWidth;
  MidY := Height div 2;
  if Index = 0 then
    Result := Rect(Width - 1 - W, 1, Width - 1, MidY)
  else
    Result := Rect(Width - 1 - W, MidY, Width - 1, Height - 1);
end;

procedure TEsSpinEdit.PaintButton(Index: Integer; const R: TRect);
begin
  inherited PaintButton(Index, R);
  if Index = 0 then
  begin
    Canvas.Pen.Color := EsColor(EsSkinTheme.GridLine);
    Canvas.Line(R.Left, R.Bottom - 1, R.Right, R.Bottom - 1);
  end;
end;

function TEsSpinEdit.Clamp(V: Double): Double;
begin
  Result := V;
  if FMaxValue > FMinValue then
    Result := EnsureRange(V, FMinValue, FMaxValue);
  if FValueType = svtInteger then
    Result := Round(Result);
end;

procedure TEsSpinEdit.UpdateText;
begin
  if FValueType = svtInteger then
    SetTextSilently(IntToStr(Round(FValue)))
  else
    SetTextSilently(FloatToStrF(FValue, ffFixed, 18, FDecimalPlaces));
end;

procedure TEsSpinEdit.CommitText;
var
  V: Double;
begin
  if TryStrToFloat(Trim(Text), V) then
    Value := V
  else
    UpdateText;
end;

procedure TEsSpinEdit.SetValue(AValue: Double);
begin
  if not (csLoading in ComponentState) then
    AValue := Clamp(AValue);
  if FValue = AValue then
  begin
    UpdateText;
    Exit;
  end;
  FValue := AValue;
  UpdateText;
  if not (csLoading in ComponentState) and Assigned(FOnValueChange) then
    FOnValueChange(Self);
end;

procedure TEsSpinEdit.SetMinValue(AValue: Double);
begin
  FMinValue := AValue;
  if not (csLoading in ComponentState) then Value := FValue;
end;

procedure TEsSpinEdit.SetMaxValue(AValue: Double);
begin
  FMaxValue := AValue;
  if not (csLoading in ComponentState) then Value := FValue;
end;

procedure TEsSpinEdit.SetDecimalPlaces(AValue: Integer);
begin
  FDecimalPlaces := EnsureRange(AValue, 0, 15);
  UpdateText;
end;

procedure TEsSpinEdit.SetValueType(AValue: TEsSpinValueType);
begin
  FValueType := AValue;
  if not (csLoading in ComponentState) then Value := FValue;
  UpdateText;
end;

function TEsSpinEdit.GetIntValue: Integer;
begin
  Result := Round(FValue);
end;

procedure TEsSpinEdit.SetIntValue(AValue: Integer);
begin
  Value := AValue;
end;

procedure TEsSpinEdit.StepBy(ADelta: Double);
begin
  if ReadOnly then Exit;
  CommitText;
  Value := FValue + ADelta;
end;

procedure TEsSpinEdit.DoButtonDown(Index: Integer);
begin
  if Index = 0 then FRepeatDir := 1 else FRepeatDir := -1;
  StepBy(FRepeatDir * FIncrement);
  FRepeatTimer.Interval := 400;
  FRepeatTimer.Enabled := True;
end;

procedure TEsSpinEdit.RepeatTimerTick(Sender: TObject);
begin
  FRepeatTimer.Interval := 50;
  if FPressedButton < 0 then
  begin
    FRepeatTimer.Enabled := False;
    Exit;
  end;
  StepBy(FRepeatDir * FIncrement);
end;

procedure TEsSpinEdit.DoButtonClick(Index: Integer);
begin
  // o passo já foi dado no MouseDown
  if Assigned(OnButtonClick) then OnButtonClick(Self, Index);
end;

procedure TEsSpinEdit.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  FRepeatTimer.Enabled := False;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TEsSpinEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP: begin StepBy(FIncrement); Key := 0; end;
    VK_DOWN: begin StepBy(-FIncrement); Key := 0; end;
    VK_PRIOR: begin StepBy(FLargeIncrement); Key := 0; end;
    VK_NEXT: begin StepBy(-FLargeIncrement); Key := 0; end;
    VK_RETURN: begin CommitText; SelectAll; Key := 0; end;
    VK_ESCAPE: begin UpdateText; Key := 0; end;
  end;
  if Key <> 0 then inherited DoEditKeyDown(Key, Shift);
end;

procedure TEsSpinEdit.DoEditKeyPress(var Key: Char);
begin
  if Key in [#8, #13, #27] then Exit;
  if Key in ['0'..'9'] then Exit;
  if (Key = '-') then Exit;
  if (FValueType = svtFloat) and (Key in ['.', ',']) then
  begin
    Key := FormatSettings.DecimalSeparator;
    Exit;
  end;
  if Ord(Key) < 32 then Exit;
  Key := #0;
end;

procedure TEsSpinEdit.DoEditExit;
begin
  CommitText;
end;

function TEsSpinEdit.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if Result or not Focused then Exit;
  if WheelDelta > 0 then StepBy(FIncrement) else StepBy(-FIncrement);
  Result := True;
end;

{ TEsPopupForm }

constructor TEsPopupForm.CreatePopup(AOwner: TComponent);
begin
  inherited CreateNew(AOwner);
  BorderStyle := bsNone;
  FormStyle := fsStayOnTop;
  ShowInTaskBar := stNever;
  Position := poDesigned;
  KeyPreview := True;
  BorderWidth := 1;
  Color := EsColor(EsSkinTheme.Surface);
  OnDeactivate := @FormDeactivate;
end;

procedure TEsPopupForm.Paint;
begin
  inherited Paint;
  EsFrame(Canvas, ClientRect, EsColor(EsSkinTheme.BorderHot));
end;

procedure TEsPopupForm.PopupBelow(AControl: TControl; AWidth, AHeight: Integer);
var
  P: TPoint;
  M: TMonitor;
  WA: TRect;
begin
  Color := EsColor(EsSkinTheme.Surface);
  P := AControl.ClientToScreen(Point(0, AControl.Height));
  M := Screen.MonitorFromPoint(P);
  if M <> nil then
  begin
    WA := M.WorkareaRect;
    if P.Y + AHeight > WA.Bottom then
      P.Y := AControl.ClientToScreen(Point(0, 0)).Y - AHeight;
    if P.X + AWidth > WA.Right then
      P.X := WA.Right - AWidth;
    if P.X < WA.Left then P.X := WA.Left;
  end;
  SetBounds(P.X, P.Y, AWidth, AHeight);
  FClosing := False;
  Show;
end;

procedure TEsPopupForm.ClosePopup;
begin
  if FClosing then Exit;
  FClosing := True;
  Hide;
  if Assigned(FOnClosePopup) then FOnClosePopup(Self);
end;

procedure TEsPopupForm.FormDeactivate(Sender: TObject);
begin
  ClosePopup;
end;

{ TEsComboBox }

constructor TEsComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FItems := TStringList.Create;
  FItems.OnChange := @ItemsChanged;
  FItemIndex := -1;
  FDropDownRows := 8;
  FAutoComplete := True;
  Buttons.Add.Kind := sbkDown;
end;

destructor TEsComboBox.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

procedure TEsComboBox.Loaded;
begin
  inherited Loaded;
  if (FItemIndex >= 0) and (FItemIndex < FItems.Count) then
    SetTextSilently(FItems[FItemIndex]);
end;

function TEsComboBox.GetItems: TStrings;
begin
  Result := FItems;
end;

procedure TEsComboBox.SetItems(AValue: TStrings);
begin
  FItems.Assign(AValue);
end;

procedure TEsComboBox.ItemsChanged(Sender: TObject);
begin
  if FItemIndex >= FItems.Count then
    FItemIndex := -1;
end;

procedure TEsComboBox.SetItemIndex(AValue: Integer);
begin
  if (AValue < -1) then AValue := -1;
  if not (csLoading in ComponentState) and (AValue >= FItems.Count) then
    AValue := FItems.Count - 1;
  if FItemIndex = AValue then Exit;
  FItemIndex := AValue;
  if csLoading in ComponentState then Exit;
  if FItemIndex >= 0 then
    SetTextSilently(FItems[FItemIndex])
  else
    SetTextSilently('');
  DoEditChange;
end;

procedure TEsComboBox.SetDropDownListStyle(AValue: TEsDropDownListStyle);
begin
  FDropDownListStyle := AValue;
  InnerEdit.ReadOnly := AValue = lsFixedList;
end;

function TEsComboBox.DroppedDown: Boolean;
begin
  Result := (FPopup <> nil) and FPopup.Visible;
end;

procedure TEsComboBox.DropDown;
var
  H, Rows: Integer;
begin
  if csDesigning in ComponentState then Exit;
  if DroppedDown then Exit;
  if FPopup = nil then
  begin
    FPopup := TEsPopupForm.CreatePopup(Self);
    FPopup.OnClosePopup := @PopupClosed;
    FList := TListBox.Create(FPopup);
    FList.Parent := FPopup;
    FList.Align := alClient;
    FList.BorderStyle := bsNone;
    FList.OnClick := @ListClick;
    FList.OnKeyDown := @ListKeyDown;
  end;
  FList.Color := EsColor(EsSkinTheme.Surface);
  FList.Font.Assign(Font);
  FList.Font.Color := EsColor(EsSkinTheme.Text);
  FList.Items.Assign(FItems);
  FList.ItemIndex := FItems.IndexOf(Text);
  Rows := EnsureRange(FItems.Count, 1, FDropDownRows);
  H := Rows * Max(FList.ItemHeight, EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 7)) + 4;
  FPopup.PopupBelow(Self, Width, H);
  if FList.CanFocus then FList.SetFocus;
end;

procedure TEsComboBox.CloseUp;
begin
  if DroppedDown then FPopup.ClosePopup;
end;

procedure TEsComboBox.PopupClosed(Sender: TObject);
begin
  if CanFocus then SetFocus;
end;

procedure TEsComboBox.ListClick(Sender: TObject);
begin
  if FList.ItemIndex >= 0 then
  begin
    ItemIndex := FItems.IndexOf(FList.Items[FList.ItemIndex]);
    if Assigned(FOnSelect) then FOnSelect(Self);
  end;
  CloseUp;
end;

procedure TEsComboBox.ListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN: begin Key := 0; ListClick(FList); end;
    VK_ESCAPE: begin Key := 0; CloseUp; end;
  end;
end;

procedure TEsComboBox.DoButtonClick(Index: Integer);
begin
  if DroppedDown then CloseUp else DropDown;
  inherited DoButtonClick(Index);
end;

procedure TEsComboBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TEsComboBox.DoEditKeyDown(var Key: Word; Shift: TShiftState);
begin
  if ((Key = VK_DOWN) and (ssAlt in Shift)) or (Key = VK_F4) then
  begin
    Key := 0;
    DropDown;
    Exit;
  end;
  if (Shift = []) and (FItems.Count > 0) then
    case Key of
      VK_DOWN:
        begin
          ItemIndex := Min(FItemIndex + 1, FItems.Count - 1);
          SelectAll;
          Key := 0;
        end;
      VK_UP:
        begin
          ItemIndex := Max(FItemIndex - 1, 0);
          SelectAll;
          Key := 0;
        end;
    end;
  if Key <> 0 then inherited DoEditKeyDown(Key, Shift);
end;

procedure TEsComboBox.DoEditChange;
var
  I, L: Integer;
  S: string;
begin
  // auto-completar: completa com o primeiro item que começa com o texto
  if FAutoComplete and InnerEdit.Focused and (FDropDownListStyle = lsEditList) then
  begin
    S := Text;
    L := Length(S);
    if (L > 0) and (InnerEdit.SelStart = L) then
      for I := 0 to FItems.Count - 1 do
        if (Length(FItems[I]) > L) and SameText(Copy(FItems[I], 1, L), S) then
        begin
          SetTextSilently(S + Copy(FItems[I], L + 1, MaxInt));
          InnerEdit.SelStart := L;
          InnerEdit.SelLength := Length(FItems[I]) - L;
          Break;
        end;
  end;
  FItemIndex := FItems.IndexOf(Text);
  inherited DoEditChange;
end;

{ TEsDateEdit }

constructor TEsDateEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Buttons.Add.Kind := sbkDown;
  FDate := 0;
end;

destructor TEsDateEdit.Destroy;
begin
  inherited Destroy;
end;

procedure TEsDateEdit.Loaded;
begin
  inherited Loaded;
  UpdateText;
end;

function TEsDateEdit.GetIsNull: Boolean;
begin
  Result := FDate = 0;
end;

procedure TEsDateEdit.UpdateText;
var
  F: string;
begin
  if FDate = 0 then
    SetTextSilently('')
  else
  begin
    F := FDisplayFormat;
    if F = '' then F := FormatSettings.ShortDateFormat;
    SetTextSilently(FormatDateTime(F, FDate));
  end;
end;

procedure TEsDateEdit.SetDate(AValue: TDateTime);
begin
  AValue := Trunc(AValue);
  if FDate = AValue then Exit;
  FDate := AValue;
  UpdateText;
  if not (csLoading in ComponentState) and Assigned(FOnDateChange) then
    FOnDateChange(Self);
end;

procedure TEsDateEdit.SetDisplayFormat(const AValue: string);
begin
  FDisplayFormat := AValue;
  UpdateText;
end;

procedure TEsDateEdit.Clear;
begin
  Date := 0;
end;

procedure TEsDateEdit.DoEditExit;
var
  D: TDateTime;
begin
  if Trim(Text) = '' then
    Date := 0
  else if TryStrToDate(Trim(Text), D) then
    Date := D
  else
    UpdateText;
end;

procedure TEsDateEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);
begin
  if ((Key = VK_DOWN) and (ssAlt in Shift)) or (Key = VK_F4) then
  begin
    Key := 0;
    DropDown;
    Exit;
  end;
  if Key = VK_RETURN then
  begin
    DoEditExit;
    SelectAll;
  end
  else if (Key in [VK_ADD, VK_SUBTRACT]) and not ReadOnly then
  begin
    // atalho DevExpress: +/- avança ou recua um dia
    if FDate = 0 then Date := SysUtils.Date;
    if Key = VK_ADD then Date := FDate + 1 else Date := FDate - 1;
    Key := 0;
    Exit;
  end;
  if Key <> 0 then inherited DoEditKeyDown(Key, Shift);
end;

procedure TEsDateEdit.DoButtonClick(Index: Integer);
begin
  if (FPopup <> nil) and FPopup.Visible then
    FPopup.ClosePopup
  else
    DropDown;
  inherited DoButtonClick(Index);
end;

procedure TEsDateEdit.DropDown;
var
  Bar: TPanel;
  B: TButton;
  BW: Integer;
begin
  if csDesigning in ComponentState then Exit;
  if FPopup = nil then
  begin
    FPopup := TEsPopupForm.CreatePopup(Self);
    FPopup.OnClosePopup := @PopupClosed;
    FCalendar := TCalendar.Create(FPopup);
    FCalendar.Parent := FPopup;
    FCalendar.Align := alClient;
    FCalendar.OnDblClick := @CalendarDblClick;
    FCalendar.OnKeyDown := @CalendarKeyDown;
    Bar := TPanel.Create(FPopup);
    Bar.Parent := FPopup;
    Bar.Align := alBottom;
    Bar.BevelOuter := bvNone;
    Bar.Height := EsScale(Self, 32);
    Bar.ParentColor := True;
    BW := EsScale(Self, 64);
    B := TButton.Create(FPopup);
    B.Parent := Bar;
    B.Caption := rsEsToday;
    B.SetBounds(4, 4, BW, Bar.Height - 8);
    B.OnClick := @TodayClick;
    B := TButton.Create(FPopup);
    B.Parent := Bar;
    B.Caption := rsEsClear;
    B.SetBounds(8 + BW, 4, BW, Bar.Height - 8);
    B.OnClick := @ClearClick;
    B := TButton.Create(FPopup);
    B.Parent := Bar;
    B.Caption := rsEsOK;
    B.Anchors := [akTop, akRight];
    B.SetBounds(Bar.Width - BW - 4, 4, BW, Bar.Height - 8);
    B.OnClick := @OkClick;
  end;
  if FDate <> 0 then
    FCalendar.DateTime := FDate
  else
    FCalendar.DateTime := SysUtils.Date;
  FPopup.PopupBelow(Self, Max(Width, EsScale(Self, 230)), EsScale(Self, 230));
  if FCalendar.CanFocus then FCalendar.SetFocus;
end;

procedure TEsDateEdit.CalendarDblClick(Sender: TObject);
begin
  OkClick(Sender);
end;

procedure TEsDateEdit.CalendarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: begin Key := 0; OkClick(Sender); end;
    VK_ESCAPE: begin Key := 0; FPopup.ClosePopup; end;
  end;
end;

procedure TEsDateEdit.TodayClick(Sender: TObject);
begin
  Date := SysUtils.Date;
  FPopup.ClosePopup;
end;

procedure TEsDateEdit.ClearClick(Sender: TObject);
begin
  Date := 0;
  FPopup.ClosePopup;
end;

procedure TEsDateEdit.OkClick(Sender: TObject);
begin
  Date := FCalendar.DateTime;
  FPopup.ClosePopup;
end;

procedure TEsDateEdit.PopupClosed(Sender: TObject);
begin
  if CanFocus then SetFocus;
end;

{ TEsButton }

constructor TEsButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csClickEvents] + [csCaptureMouse];
  FImageIndex := -1;
  TabStop := True;
  EsThemes.RegisterClient(Self);
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;

class function TEsButton.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 90;
  Result.CY := 28;
end;

procedure TEsButton.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = FDropDownMenu then FDropDownMenu := nil;
    if AComponent = FImages then FImages := nil;
  end;
end;

procedure TEsButton.SetKind(AValue: TEsButtonKind);
begin
  if FKind = AValue then Exit;
  FKind := AValue;
  Invalidate;
end;

procedure TEsButton.SetDropDownMenu(AValue: TPopupMenu);
begin
  if FDropDownMenu = AValue then Exit;
  if FDropDownMenu <> nil then FDropDownMenu.RemoveFreeNotification(Self);
  FDropDownMenu := AValue;
  if FDropDownMenu <> nil then FDropDownMenu.FreeNotification(Self);
end;

procedure TEsButton.SetImages(AValue: TCustomImageList);
begin
  if FImages = AValue then Exit;
  if FImages <> nil then FImages.RemoveFreeNotification(Self);
  FImages := AValue;
  if FImages <> nil then FImages.FreeNotification(Self);
  Invalidate;
end;

procedure TEsButton.SetImageIndex(AValue: TImageIndex);
begin
  if FImageIndex = AValue then Exit;
  FImageIndex := AValue;
  Invalidate;
end;

procedure TEsButton.SetFlat(AValue: Boolean);
begin
  if FFlat = AValue then Exit;
  FFlat := AValue;
  Invalidate;
end;

function TEsButton.ArrowRect: TRect;
begin
  case FKind of
    sxbkDropDownButton: Result := Rect(Width - EsScale(Self, 18), 0, Width, Height);
    sxbkDropDown: Result := Rect(Width - EsScale(Self, 16), 0, Width, Height);
  else
    Result := Rect(Width, 0, Width, Height);
  end;
end;

procedure TEsButton.EraseBackground(DC: HDC);
begin
end;

procedure TEsButton.Paint;
var
  T: TEsTheme;
  R, AR, TR: TRect;
  TC: TColor;
  X, TW: Integer;
begin
  T := EsSkinTheme;
  R := ClientRect;
  Canvas.Brush.Color := EsColor(T.Background);
  if Parent <> nil then
    Canvas.Brush.Color := Parent.GetRGBColorResolvingParent;
  Canvas.FillRect(R);
  Canvas.Font.Assign(Font);
  EsDrawButtonFace(Canvas, R, FHot and IsEnabled, FPressed and not FArrowHot,
    Focused, FFlat);
  AR := ArrowRect;
  if IsEnabled then TC := EsColor(T.ButtonText) else TC := EsColor(T.TextDisabled);
  if FKind <> sxbkStandard then
  begin
    if FKind = sxbkDropDownButton then
    begin
      if FPressed and FArrowHot then
        EsDrawButtonFace(Canvas, AR, True, True, False);
      Canvas.Pen.Color := EsColor(T.Border);
      Canvas.Line(AR.Left, R.Top + 4, AR.Left, R.Bottom - 4);
    end;
    EsDrawGlyph(Canvas, AR, sgArrowDown, TC, 3);
  end;
  TR := Rect(R.Left + 4, R.Top, AR.Left - 2, R.Bottom);
  if (FImages <> nil) and (FImageIndex >= 0) and (FImageIndex < FImages.Count) then
  begin
    TW := Canvas.TextWidth(Caption);
    X := Max(TR.Left, (TR.Left + TR.Right - FImages.Width - 4 - TW) div 2);
    FImages.Draw(Canvas, X, (Height - FImages.Height) div 2, FImageIndex, IsEnabled);
    TR.Left := X + FImages.Width + 4;
    EsDrawText(Canvas, TR, Caption, dhaLeading, dvaCenter, False, TC, True);
  end
  else
    EsDrawText(Canvas, TR, Caption, dhaCenter, dvaCenter, False, TC, True);
  if Focused then
  begin
    Canvas.Pen.Color := EsColor(T.Accent);
    Canvas.Pen.Style := psDot;
    Canvas.Brush.Style := bsClear;
    Canvas.Rectangle(R.Left + 3, R.Top + 3, R.Right - 3, R.Bottom - 3);
    Canvas.Pen.Style := psSolid;
  end;
end;

procedure TEsButton.MouseEnter;
begin
  FHot := True;
  Invalidate;
  inherited MouseEnter;
end;

procedure TEsButton.MouseLeave;
begin
  FHot := False;
  FArrowHot := False;
  Invalidate;
  inherited MouseLeave;
end;

procedure TEsButton.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  A: Boolean;
begin
  inherited MouseMove(Shift, X, Y);
  A := PtInRect(ArrowRect, Point(X, Y));
  if A <> FArrowHot then
  begin
    FArrowHot := A;
    Invalidate;
  end;
end;

procedure TEsButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button <> mbLeft then Exit;
  if CanFocus then SetFocus;
  FPressed := True;
  Invalidate;
  if (FKind = sxbkDropDown) or ((FKind = sxbkDropDownButton) and FArrowHot) then
  begin
    ShowMenu;
    FPressed := False;
    Invalidate;
  end;
end;

procedure TEsButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  WasPressed: Boolean;
begin
  WasPressed := FPressed;
  FPressed := False;
  Invalidate;
  inherited MouseUp(Button, Shift, X, Y);
  if (Button = mbLeft) and WasPressed and PtInRect(ClientRect, Point(X, Y)) and
     not ((FKind = sxbkDropDownButton) and FArrowHot) and (FKind <> sxbkDropDown) then
    Click;
end;

procedure TEsButton.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key in [VK_SPACE, VK_RETURN]) and (Shift = []) then
  begin
    Key := 0;
    if FKind = sxbkDropDown then ShowMenu else Click;
  end
  else if (Key = VK_DOWN) and (ssAlt in Shift) and (FKind <> sxbkStandard) then
  begin
    Key := 0;
    ShowMenu;
  end;
  inherited KeyDown(Key, Shift);
end;

procedure TEsButton.ShowMenu;
var
  P: TPoint;
begin
  if FDropDownMenu = nil then Exit;
  P := ClientToScreen(Point(0, Height));
  FDropDownMenu.PopupComponent := Self;
  FDropDownMenu.Popup(P.X, P.Y);
end;

procedure TEsButton.Click;
var
  F: TCustomForm;
begin
  if FModalResult <> mrNone then
  begin
    F := GetParentForm(Self);
    if F <> nil then F.ModalResult := FModalResult;
  end;
  inherited Click;
end;

procedure TEsButton.DoEnter;
begin
  inherited DoEnter;
  Invalidate;
end;

procedure TEsButton.DoExit;
begin
  inherited DoExit;
  Invalidate;
end;

procedure TEsButton.TextChanged;
begin
  inherited TextChanged;
  Invalidate;
end;

{ TEsGroupBox }

constructor TEsGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls, csSetCaption];
  EsThemes.RegisterClient(Self);
  EsThemes.AddChangeHandler(@ThemeChanged);
  SetInitialBounds(0, 0, 200, 140);
  ThemeChanged(nil);
end;

destructor TEsGroupBox.Destroy;
begin
  EsThemes.RemoveChangeHandler(@ThemeChanged);
  EsThemes.UnregisterClient(Self);
  inherited Destroy;
end;

procedure TEsGroupBox.ThemeChanged(Sender: TObject);
begin
  Color := EsColor(EsSkinTheme.Surface);
end;

procedure TEsGroupBox.Loaded;
begin
  inherited Loaded;
  if FCollapsed and (FExpandedHeight = 0) then
    FExpandedHeight := 140;
end;

function TEsGroupBox.HeaderHeight: Integer;
begin
    Result := EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 10);
end;

procedure TEsGroupBox.AdjustClientRect(var ARect: TRect);
begin
  inherited AdjustClientRect(ARect);
  Inc(ARect.Top, HeaderHeight);
  InflateRect(ARect, -1, -1);
end;

procedure TEsGroupBox.Paint;
var
  T: TEsTheme;
  H: Integer;
  HR, BR: TRect;
begin
  T := EsSkinTheme;
  H := HeaderHeight;
  Canvas.Brush.Color := EsColor(T.Surface);
  Canvas.FillRect(ClientRect);
  HR := Rect(0, 0, Width, H);
  EsFillGradientV(Canvas, HR, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
  if FHeaderHot and FCollapsible then
  begin
    Canvas.Brush.Color := EsColor(BlendOver(T.HeaderFace, T.Hover));
    Canvas.FillRect(HR);
  end;
  Canvas.Pen.Color := EsColor(T.Border);
  Canvas.Line(0, H - 1, Width, H - 1);
  Canvas.Font.Assign(Font);
  Canvas.Font.Style := Canvas.Font.Style + [fsBold];
  EsDrawText(Canvas, Rect(EsScale(Self, 8), 0, Width - H, H), Caption, dhaLeading,
    dvaCenter, False, EsColor(T.HeaderText), True);
  Canvas.Font.Style := Canvas.Font.Style - [fsBold];
  if FCollapsible then
  begin
    BR := Rect(Width - H, 0, Width, H);
    if FCollapsed then
      EsDrawGlyph(Canvas, BR, sgArrowDown, EsColor(T.HeaderText), 4)
    else
      EsDrawGlyph(Canvas, BR, sgArrowUp, EsColor(T.HeaderText), 4);
  end;
  EsFrame(Canvas, ClientRect, EsColor(T.Border));
end;

procedure TEsGroupBox.SetCollapsible(AValue: Boolean);
begin
  if FCollapsible = AValue then Exit;
  FCollapsible := AValue;
  Invalidate;
end;

procedure TEsGroupBox.SetCollapsed(AValue: Boolean);
begin
  if FCollapsed = AValue then Exit;
  FCollapsed := AValue;
  if csLoading in ComponentState then Exit;
  if FCollapsed then
  begin
    FExpandedHeight := Height;
    Height := HeaderHeight + 1;
  end
  else if FExpandedHeight > 0 then
    Height := FExpandedHeight;
  Invalidate;
  if Assigned(FOnCollapsedChange) then FOnCollapsedChange(Self);
end;

procedure TEsGroupBox.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Hot: Boolean;
begin
  inherited MouseMove(Shift, X, Y);
  Hot := Y < HeaderHeight;
  if Hot <> FHeaderHot then
  begin
    FHeaderHot := Hot;
    Invalidate;
  end;
end;

procedure TEsGroupBox.MouseLeave;
begin
  FHeaderHot := False;
  Invalidate;
  inherited MouseLeave;
end;

procedure TEsGroupBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if (Button = mbLeft) and FCollapsible and (Y < HeaderHeight) and
     not (csDesigning in ComponentState) then
    Collapsed := not Collapsed;
end;

procedure TEsGroupBox.TextChanged;
begin
  inherited TextChanged;
  Invalidate;
end;

end.
