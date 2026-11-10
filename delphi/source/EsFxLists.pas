{
 *****************************************************************************
  ESKit para Delphi (VCL) - EsFxLists.pas
  Controles de lista e abas no estilo FireMonkey:
    - TEsFxTabControl / TEsFxTabItem (TTabControl / TTabItem)
    - TEsFxListBox (TListBox com itens ricos, rolagem suave e por arrasto)

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsFxLists;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,
  System.Math, System.UITypes, System.ImageList, Vcl.Controls, Vcl.Graphics, Vcl.Forms,
  Vcl.ImgList, EsGraphics, EsTheme, EsFxBase, EsFxShapes, EsFxStdCtrls;

type
  TEsFxTabPosition = (tpTop, tpBottom, tpNone, tpDots);
  TEsFxTabTransition = (ttNone, ttSlide);
  TEsFxTabTransitionDirection = (tdNormal, tdReversed);

  TEsFxTabControl = class;

  { TEsFxTabItem - página de um TEsFxTabControl (aceita outros controles) }

  TEsFxTabItem = class(TEsFxContainer)
  private
    FTabVisible: Boolean;
    FImageIndex: Integer;
    FHeaderRect: TRect;
    procedure SetTabVisible(AValue: Boolean);
    procedure SetImageIndex(AValue: Integer);
    function GetTabControl: TEsFxTabControl;
    function GetIndex: Integer;
    procedure SetIndex(AValue: Integer);
  protected
    procedure SetParent(NewParent: TWinControl); override;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
  public
    constructor Create(AOwner: TComponent); override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
    property TabControl: TEsFxTabControl read GetTabControl;
    property Index: Integer read GetIndex write SetIndex;
    { área do cabeçalho desta aba, em coordenadas do TabControl }
    property HeaderRect: TRect read FHeaderRect;
  published
    property Text;
    property TabVisible: Boolean read FTabVisible write SetTabVisible default True;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
    property Font;
    property ParentFont;
    property Hint;
    property ShowHint;
    property ParentShowHint;
    property PopupMenu;
    property OnClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
  end;

  { TEsFxTabControl }

  TEsFxTabControl = class(TEsFxFocusControl)
  private
    FTabIndex: Integer;
    FTabPosition: TEsFxTabPosition;
    FTabHeight: Integer;
    FFullSize: Boolean;
    FImages: TCustomImageList;
    FHotTab: Integer;
    FIndX, FIndW: Single;        // indicador animado
    FIndTX, FIndTW: Single;
    FIndInit: Boolean;
    FSlide: Single;              // 0..1 durante a transição
    FSlideFrom: Integer;
    FSlideDir: Integer;
    FTicking: Boolean;
    FLayingOut: Boolean;
    FOnChange: TNotifyEvent;
    function GetTab(AIndex: Integer): TEsFxTabItem;
    function GetTabCount: Integer;
    function GetActiveTab: TEsFxTabItem;
    procedure SetActiveTab(AValue: TEsFxTabItem);
    procedure SetTabIndex(AValue: Integer);
    procedure SetTabPosition(AValue: TEsFxTabPosition);
    procedure SetTabHeight(AValue: Integer);
    procedure SetFullSize(AValue: Boolean);
    procedure SetImages(AValue: TCustomImageList);
    procedure Tick(DeltaSec: Double);
    procedure StartTicking;
    procedure StopTicking;
    procedure CMDesignHitTest(var Message: TCMDesignHitTest); message CM_DESIGNHITTEST;
    function SlideEase: Single;
  protected
    procedure AlignControls(AControl: TControl; var ARect: TRect); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    procedure Resize; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseLeave; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure RenderContent(ACanvas: TCanvas); override;
    class function GetControlClassDefaultSize: TSize;
    function HeaderHeight: Integer;
    function HeaderRect: TRect;
    function ContentRect: TRect;
    procedure LayoutHeaders;
    { mostra só a aba ativa (e a anterior durante a transição); fora do
      AlignControls, senão a LCL não repassa a visibilidade ao widget }
    procedure UpdateTabVisibility;
    procedure DoChange; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
    { chamado pelos TEsFxTabItem ao entrar/sair/mudar }
    procedure TabsChanged;
    function TabAt(X, Y: Integer): Integer;
    function Add(const AText: string = ''): TEsFxTabItem;
    { como no FMX: troca de aba com animação de deslize }
    procedure SetActiveTabWithTransition(ATab: TEsFxTabItem;
      ATransition: TEsFxTabTransition = ttSlide;
      ADirection: TEsFxTabTransitionDirection = tdNormal);
    function Next(ATransition: TEsFxTabTransition = ttSlide): Boolean;
    function Previous(ATransition: TEsFxTabTransition = ttSlide): Boolean;
    property Tabs[AIndex: Integer]: TEsFxTabItem read GetTab;
    property TabCount: Integer read GetTabCount;
    property ActiveTab: TEsFxTabItem read GetActiveTab write SetActiveTab;
  published
    property TabIndex: Integer read FTabIndex write SetTabIndex default -1;
    property TabPosition: TEsFxTabPosition read FTabPosition write SetTabPosition default tpTop;
    { 0 = automático }
    property TabHeight: Integer read FTabHeight write SetTabHeight default 0;
    { abas dividem a largura toda igualmente }
    property FullSize: Boolean read FFullSize write SetFullSize default False;
    property Images: TCustomImageList read FImages write SetImages;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  { TEsFxListItem }

  TEsFxListAccessory = (laNone, laMore, laCheckmark, laDetail);

  TEsFxListItem = class(TCollectionItem)
  private
    FText: string;
    FDetail: string;
    FImageIndex: Integer;
    FChecked: Boolean;
    FIsHeader: Boolean;
    FEnabled: Boolean;
    FAccessory: TEsFxListAccessory;
    FSelected: Boolean;
    FTag: NativeInt;
    FData: TObject;
    procedure SetText(const AValue: string);
    procedure SetDetail(const AValue: string);
    procedure SetImageIndex(AValue: Integer);
    procedure SetChecked(AValue: Boolean);
    procedure SetIsHeader(AValue: Boolean);
    procedure SetEnabled(AValue: Boolean);
    procedure SetAccessory(AValue: TEsFxListAccessory);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(ACollection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    property Selected: Boolean read FSelected;
    property Data: TObject read FData write FData;
  published
    property Text: string read FText write SetText;
    property Detail: string read FDetail write SetDetail;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
    property Checked: Boolean read FChecked write SetChecked default False;
    { cabeçalho de grupo (TListBoxGroupHeader): não é selecionável }
    property IsHeader: Boolean read FIsHeader write SetIsHeader default False;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Accessory: TEsFxListAccessory read FAccessory write SetAccessory default laNone;
    property Tag: NativeInt read FTag write FTag default 0;
  end;

  { TEsFxListItems }

  TEsFxListItems = class(TOwnedCollection)
  private
    function GetItem(AIndex: Integer): TEsFxListItem;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    function Add: TEsFxListItem;
    function AddItem(const AText: string; const ADetail: string = '';
      AImageIndex: Integer = -1): TEsFxListItem;
    function AddHeader(const AText: string): TEsFxListItem;
    function IndexOfText(const AText: string): Integer;
    { aceita também TStrings (uma linha = um item) }
    procedure Assign(Source: TPersistent); override;
    procedure AssignTo(Dest: TPersistent); override;
    property Items[AIndex: Integer]: TEsFxListItem read GetItem; default;
  end;

  TEsFxListItemEvent = procedure(Sender: TObject; AIndex: Integer) of object;

  { TEsFxListBox }

  TEsFxListBox = class(TEsFxFocusControl)
  private
    FItems: TEsFxListItems;
    FItemIndex: Integer;
    FMultiSelect: Boolean;
    FShowCheckboxes: Boolean;
    FItemHeight: Integer;
    FImages: TCustomImageList;
    FAlternatingRowBackground: Boolean;
    FScroll, FScrollTarget: Single;
    FTicking: Boolean;
    FHot: Integer;
    FAnchor: Integer;
    FDown: Boolean;
    FDownPt: TPoint;
    FDownScroll: Single;
    FDragScroll: Boolean;
    FThumbDrag: Boolean;
    FThumbGrab: Single;
    FThumbHot: TEsFxTransition;
    FVelocity: Single;
    FLastMoveY: Integer;
    FLastMoveTime: UInt64;
    FSearch: string;
    FSearchTime: UInt64;
    FUpdating: Integer;
    FOnChange: TNotifyEvent;
    FOnItemClick: TEsFxListItemEvent;
    FOnCheckChange: TEsFxListItemEvent;
    procedure SetItems(AValue: TEsFxListItems);
    procedure SetItemIndex(AValue: Integer);
    procedure SetMultiSelect(AValue: Boolean);
    procedure SetShowCheckboxes(AValue: Boolean);
    procedure SetItemHeight(AValue: Integer);
    procedure SetImages(AValue: TCustomImageList);
    procedure SetAlternatingRowBackground(AValue: Boolean);
    function GetSelected(AIndex: Integer): Boolean;
    procedure SetSelected(AIndex: Integer; AValue: Boolean);
    function GetSelCount: Integer;
    function GetSelectedItem: TEsFxListItem;
    procedure Tick(DeltaSec: Double);
    procedure StartTicking;
    procedure StopTicking;
    function CanSelect(AIndex: Integer): Boolean;
    function NextSelectable(AFrom, ADir: Integer): Integer;
    procedure SelectRange(AFrom, ATo: Integer);
    procedure ClickItem(AIndex: Integer; Shift: TShiftState);
    function ThumbRect: TRectF;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseLeave; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Resize; override;
    procedure RenderContent(ACanvas: TCanvas); override;
    class function GetControlClassDefaultSize: TSize;
    procedure DoChange; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RenderShape(S: TEsSurface; OX, OY: Single); override;
    procedure ItemsChanged;
    procedure BeginUpdate;
    procedure EndUpdate;
    function RowHeight: Integer;
    function ContentHeight: Integer;
    function MaxScroll: Single;
    function ItemAt(X, Y: Integer): Integer;
    function ItemRect(AIndex: Integer): TRect;
    procedure ScrollToItem(AIndex: Integer; AAnimate: Boolean = True);
    procedure ScrollList(ADelta: Single; AAnimate: Boolean = True);
    procedure ClearSelection;
    procedure SelectAll;
    procedure Clear;
    property Selected[AIndex: Integer]: Boolean read GetSelected write SetSelected;
    property SelCount: Integer read GetSelCount;
    property SelectedItem: TEsFxListItem read GetSelectedItem;
    property ScrollPos: Single read FScroll;
  published
    property Items: TEsFxListItems read FItems write SetItems;
    property ItemIndex: Integer read FItemIndex write SetItemIndex default -1;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property ShowCheckboxes: Boolean read FShowCheckboxes write SetShowCheckboxes default False;
    { 0 = automático (conforme a fonte) }
    property ItemHeight: Integer read FItemHeight write SetItemHeight default 0;
    property Images: TCustomImageList read FImages write SetImages;
    property AlternatingRowBackground: Boolean read FAlternatingRowBackground
      write SetAlternatingRowBackground default False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnItemClick: TEsFxListItemEvent read FOnItemClick write FOnItemClick;
    property OnCheckChange: TEsFxListItemEvent read FOnCheckChange write FOnCheckChange;
    property OnClick;
    property OnDblClick;
  end;

implementation

{ ---------- auxiliares ---------- }

function TextColorOn(ABack, AFore: TAlphaColor; AOpacity: Single): TColor;
begin
  Result := AlphaColorToColor(BlendOver(ABack, FadeColor(AFore, AOpacity)));
end;

{ TEsFxTabItem }

constructor TEsFxTabItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls] - [csSetCaption];
  FTabVisible := True;
  FImageIndex := -1;
  SetBounds(0, 0, 200, 150);
end;

{ posição de AChild entre os filhos janela de AParent }
function EsWinIndex(AParent: TWinControl; AChild: TControl): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to AParent.ControlCount - 1 do
  begin
    if AParent.Controls[I] = AChild then Exit;
    if AParent.Controls[I] is TWinControl then Inc(Result);
  end;
end;

function TEsFxTabItem.GetTabControl: TEsFxTabControl;
begin
  if Parent is TEsFxTabControl then
    Result := TEsFxTabControl(Parent)
  else
    Result := nil;
end;

function TEsFxTabItem.GetIndex: Integer;
var
  TC: TEsFxTabControl;
  I: Integer;
begin
  Result := -1;
  TC := TabControl;
  if TC = nil then Exit;
  for I := 0 to TC.TabCount - 1 do
    if TC.Tabs[I] = Self then
      Exit(I);
end;

procedure TEsFxTabItem.SetIndex(AValue: Integer);
var
  TC: TEsFxTabControl;
  Active: TEsFxTabItem;
begin
  TC := TabControl;
  if (TC = nil) or (AValue = Index) then Exit;
  Active := TC.ActiveTab;
  AValue := EnsureRange(AValue, 0, TC.TabCount - 1);
  // a ordem das abas é a ordem dos controles filhos
  // VCL: SetZOrderPosition é privado; SetChildOrder chama-o no filho
  TC.SetChildOrder(Self, EsWinIndex(TC, TC.Tabs[AValue]));
  // a aba ativa continua a mesma (o índice dela é que mudou)
  if Active <> nil then TC.FTabIndex := Active.Index;
  TC.FIndInit := False;
  TC.TabsChanged;
end;

procedure TEsFxTabItem.SetParent(NewParent: TWinControl);
var
  Old: TWinControl;
begin
  Old := Parent;
  inherited SetParent(NewParent);
  if (Old is TEsFxTabControl) and (Old <> NewParent) then
    TEsFxTabControl(Old).TabsChanged;
  if NewParent is TEsFxTabControl then
    TEsFxTabControl(NewParent).TabsChanged;
end;

procedure TEsFxTabItem.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if TabControl <> nil then TabControl.TabsChanged;
end;

procedure TEsFxTabItem.SetTabVisible(AValue: Boolean);
begin
  if FTabVisible = AValue then Exit;
  FTabVisible := AValue;
  if TabControl <> nil then TabControl.TabsChanged;
end;

procedure TEsFxTabItem.SetImageIndex(AValue: Integer);
begin
  if FImageIndex = AValue then Exit;
  FImageIndex := AValue;
  if TabControl <> nil then TabControl.TabsChanged;
end;

procedure TEsFxTabItem.RenderShape(S: TEsSurface; OX, OY: Single);
begin
  // transparente, como no FMX: o fundo vem do TabControl
end;

{ TEsFxTabControl }

constructor TEsFxTabControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls];
  FTabIndex := -1;
  FHotTab := -1;
  FSlideFrom := -1;
  ShowFocusRing := False;
  with GetControlClassDefaultSize do
    SetBounds(0, 0, CX, CY);
end;

destructor TEsFxTabControl.Destroy;
begin
  StopTicking;
  inherited Destroy;
end;

class function TEsFxTabControl.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 320;
  Result.CY := 240;
end;

function TEsFxTabControl.GetTabCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to ControlCount - 1 do
    if Controls[I] is TEsFxTabItem then Inc(Result);
end;

function TEsFxTabControl.GetTab(AIndex: Integer): TEsFxTabItem;
var
  I, N: Integer;
begin
  N := 0;
  for I := 0 to ControlCount - 1 do
    if Controls[I] is TEsFxTabItem then
    begin
      if N = AIndex then Exit(TEsFxTabItem(Controls[I]));
      Inc(N);
    end;
  Result := nil;
end;

function TEsFxTabControl.GetActiveTab: TEsFxTabItem;
begin
  Result := GetTab(FTabIndex);
end;

procedure TEsFxTabControl.SetActiveTab(AValue: TEsFxTabItem);
begin
  if (AValue <> nil) and (AValue.Parent = Self) then
    TabIndex := AValue.Index;
end;

procedure TEsFxTabControl.SetTabIndex(AValue: Integer);
begin
  if not (csLoading in ComponentState) then
    AValue := EnsureRange(AValue, -1, TabCount - 1);
  if FTabIndex = AValue then Exit;
  FTabIndex := AValue;
  FSlide := 0;
  FSlideFrom := -1;
  TabsChanged;
  DoChange;
end;

procedure TEsFxTabControl.DoChange;
var
  F: TCustomForm;
begin
  if csLoading in ComponentState then Exit;
  if csDesigning in ComponentState then
  begin
    F := GetParentForm(Self);
    if (F <> nil) and (F.Designer <> nil) then F.Designer.Modified;
  end;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TEsFxTabControl.SetTabPosition(AValue: TEsFxTabPosition);
begin
  if FTabPosition = AValue then Exit;
  FTabPosition := AValue;
  TabsChanged;
end;

procedure TEsFxTabControl.SetTabHeight(AValue: Integer);
begin
  AValue := Max(0, AValue);
  if FTabHeight = AValue then Exit;
  FTabHeight := AValue;
  TabsChanged;
end;

procedure TEsFxTabControl.SetFullSize(AValue: Boolean);
begin
  if FFullSize = AValue then Exit;
  FFullSize := AValue;
  TabsChanged;
end;

procedure TEsFxTabControl.SetImages(AValue: TCustomImageList);
begin
  if FImages = AValue then Exit;
  if FImages <> nil then FImages.RemoveFreeNotification(Self);
  FImages := AValue;
  if FImages <> nil then FImages.FreeNotification(Self);
  TabsChanged;
end;

procedure TEsFxTabControl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then
  begin
    FImages := nil;
    TabsChanged;
  end;
end;

procedure TEsFxTabControl.Loaded;
begin
  inherited Loaded;
  if TabCount > 0 then
    FTabIndex := EnsureRange(FTabIndex, 0, TabCount - 1)
  else
    FTabIndex := -1;
  FIndInit := False;
  TabsChanged;
end;

procedure TEsFxTabControl.Resize;
begin
  inherited Resize;
  FIndInit := False;
  LayoutHeaders;
end;

function TEsFxTabControl.HeaderHeight: Integer;
begin
  case FTabPosition of
    tpTop, tpBottom:
      if FTabHeight > 0 then
        Result := FTabHeight
      else
      begin
        Result := EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 16);
        if FImages <> nil then Result := Max(Result, FImages.Height + EsScale(Self, 12));
      end;
    tpDots: Result := EsScale(Self, 20);
  else
    Result := 0;
  end;
end;

function TEsFxTabControl.HeaderRect: TRect;
begin
  case FTabPosition of
    tpTop: Result := Rect(0, 0, Width, HeaderHeight);
    tpBottom, tpDots: Result := Rect(0, Height - HeaderHeight, Width, Height);
  else
    Result := Rect(0, 0, 0, 0);
  end;
end;

function TEsFxTabControl.ContentRect: TRect;
begin
  Result := Rect(0, 0, Width, Height);
  case FTabPosition of
    tpTop: Result.Top := HeaderHeight;
    tpBottom, tpDots: Result.Bottom := Height - HeaderHeight;
  end;
end;

procedure TEsFxTabControl.LayoutHeaders;
var
  I, N, X, W, Pad, IW, Vis: Integer;
  HR: TRect;
  T: TEsFxTabItem;
  C: TCanvas;
begin
  HR := HeaderRect;
  N := TabCount;
  Vis := 0;
  for I := 0 to N - 1 do
    if Tabs[I].TabVisible then Inc(Vis);
  C := EsMeasureCanvas(Font);
  Pad := EsScale(Self, 14);
  if FImages <> nil then IW := FImages.Width + EsScale(Self, 6) else IW := 0;
  if FTabPosition = tpDots then
  begin
    // pontos centralizados
    W := EsScale(Self, 14);
    X := (Width - Vis * W) div 2;
    for I := 0 to N - 1 do
    begin
      T := Tabs[I];
      if not T.TabVisible then
      begin
        T.FHeaderRect := Rect(0, 0, 0, 0);
        Continue;
      end;
      T.FHeaderRect := Rect(X, HR.Top, X + W, HR.Bottom);
      Inc(X, W);
    end;
  end
  else
  begin
    X := 0;
    for I := 0 to N - 1 do
    begin
      T := Tabs[I];
      if not T.TabVisible or (FTabPosition = tpNone) then
      begin
        T.FHeaderRect := Rect(0, 0, 0, 0);
        Continue;
      end;
      if FFullSize and (Vis > 0) then
        W := Width div Vis
      else
      begin
        W := C.TextWidth(T.Text) + 2 * Pad;
        if (FImages <> nil) and (T.ImageIndex >= 0) then Inc(W, IW);
      end;
      T.FHeaderRect := Rect(X, HR.Top, X + W, HR.Bottom);
      Inc(X, W);
    end;
  end;
  // alvo do indicador
  T := ActiveTab;
  if (T <> nil) and T.TabVisible then
  begin
    FIndTX := T.FHeaderRect.Left;
    FIndTW := T.FHeaderRect.Right - T.FHeaderRect.Left;
    if not FIndInit or (csDesigning in ComponentState) then
    begin
      FIndX := FIndTX;
      FIndW := FIndTW;
      FIndInit := True;
    end
    else if (Abs(FIndX - FIndTX) > 0.5) or (Abs(FIndW - FIndTW) > 0.5) then
      StartTicking;
  end;
end;

procedure TEsFxTabControl.TabsChanged;
begin
  if csDestroying in ComponentState then Exit;
  if not (csLoading in ComponentState) and (FTabIndex >= TabCount) then
    FTabIndex := TabCount - 1;
  if not (csLoading in ComponentState) and (FTabIndex < 0) and (TabCount > 0) then
    FTabIndex := 0;
  LayoutHeaders;
  UpdateTabVisibility;
  ReAlign;
  Invalidate;
end;

function TEsFxTabControl.SlideEase: Single;
begin
  if FSlideFrom >= 0 then
    Result := 1 - Power(1 - FSlide, 3) // ease-out cúbico
  else
    Result := 1;
end;

procedure TEsFxTabControl.UpdateTabVisibility;
var
  I: Integer;
  T: TEsFxTabItem;
  ShowIt: Boolean;
begin
  if csDestroying in ComponentState then Exit;
  for I := 0 to TabCount - 1 do
  begin
    T := Tabs[I];
    ShowIt := (I = FTabIndex) or ((I = FSlideFrom) and (SlideEase < 1));
    if T.Visible <> ShowIt then
      T.Visible := ShowIt;
  end;
end;

procedure TEsFxTabControl.AlignControls(AControl: TControl; var ARect: TRect);
var
  CR: TRect;
  I, W, Off: Integer;
  E: Single;
begin
  if FLayingOut then Exit;
  FLayingOut := True;
  try
    CR := ContentRect;
    W := CR.Right - CR.Left;
    E := SlideEase;
    // todas as abas ficam na área de conteúdo (as ocultas também, para
    // aparecerem já no lugar); durante a transição, deslocadas
    for I := 0 to TabCount - 1 do
    begin
      Off := 0;
      if FSlideFrom >= 0 then
      begin
        if I = FTabIndex then
          Off := Round(FSlideDir * W * (1 - E))
        else if I = FSlideFrom then
          Off := Round(-FSlideDir * W * E);
      end;
      Tabs[I].SetBounds(CR.Left + Off, CR.Top, W, CR.Bottom - CR.Top);
    end;
    ARect := CR;
    inherited AlignControls(AControl, ARect);
  finally
    FLayingOut := False;
  end;
end;

procedure TEsFxTabControl.StartTicking;
begin
  if FTicking or (csDesigning in ComponentState) then Exit;
  FTicking := True;
  EsFxTicker.Add(Tick);
end;

procedure TEsFxTabControl.StopTicking;
begin
  if not FTicking then Exit;
  FTicking := False;
  EsFxTicker.Remove(Tick);
end;

procedure TEsFxTabControl.Tick(DeltaSec: Double);
var
  K: Single;
  Busy: Boolean;
begin
  Busy := False;
  K := Min(1, DeltaSec * 14);
  if (Abs(FIndX - FIndTX) > 0.5) or (Abs(FIndW - FIndTW) > 0.5) then
  begin
    FIndX := FIndX + (FIndTX - FIndX) * K;
    FIndW := FIndW + (FIndTW - FIndW) * K;
    Busy := True;
  end
  else
  begin
    FIndX := FIndTX;
    FIndW := FIndTW;
  end;
  if FSlideFrom >= 0 then
  begin
    FSlide := Min(1, FSlide + DeltaSec / 0.28);
    if FSlide >= 1 then
    begin
      FSlideFrom := -1;
      FSlide := 0;
    end
    else
      Busy := True;
    UpdateTabVisibility;
    ReAlign;
  end;
  Invalidate;
  if not Busy then StopTicking;
end;

procedure TEsFxTabControl.SetActiveTabWithTransition(ATab: TEsFxTabItem;
  ATransition: TEsFxTabTransition; ADirection: TEsFxTabTransitionDirection);
var
  Old, New: Integer;
begin
  if (ATab = nil) or (ATab.Parent <> Self) then Exit;
  New := ATab.Index;
  Old := FTabIndex;
  if New = Old then Exit;
  if (ATransition = ttNone) or (Old < 0) or (csDesigning in ComponentState) then
  begin
    TabIndex := New;
    Exit;
  end;
  if (New > Old) = (ADirection = tdNormal) then FSlideDir := 1 else FSlideDir := -1;
  FTabIndex := New;
  FSlideFrom := Old;
  FSlide := 0;
  LayoutHeaders;
  UpdateTabVisibility;
  ReAlign;
  StartTicking;
  Invalidate;
  DoChange;
end;

function TEsFxTabControl.Next(ATransition: TEsFxTabTransition): Boolean;
var
  I: Integer;
begin
  for I := FTabIndex + 1 to TabCount - 1 do
    if Tabs[I].TabVisible then
    begin
      SetActiveTabWithTransition(Tabs[I], ATransition);
      Exit(True);
    end;
  Result := False;
end;

function TEsFxTabControl.Previous(ATransition: TEsFxTabTransition): Boolean;
var
  I: Integer;
begin
  for I := FTabIndex - 1 downto 0 do
    if Tabs[I].TabVisible then
    begin
      SetActiveTabWithTransition(Tabs[I], ATransition);
      Exit(True);
    end;
  Result := False;
end;

function TEsFxTabControl.Add(const AText: string): TEsFxTabItem;
begin
  Result := TEsFxTabItem.Create(Owner);
  if AText <> '' then
    Result.Text := AText
  else
    Result.Text := 'TabItem' + IntToStr(TabCount + 1);
  Result.Parent := Self;
  if FTabIndex < 0 then TabIndex := 0;
end;

function TEsFxTabControl.TabAt(X, Y: Integer): Integer;
var
  I: Integer;
begin
  for I := 0 to TabCount - 1 do
    if Tabs[I].TabVisible and PtInRect(Tabs[I].FHeaderRect, Point(X, Y)) then
      Exit(I);
  Result := -1;
end;

procedure TEsFxTabControl.CMDesignHitTest(var Message: TCMDesignHitTest);
begin
  // no designer, um clique no cabeçalho troca de aba (como o TPageControl)
  if TabAt(Message.XPos, Message.YPos) >= 0 then
    Message.Result := 1
  else
    Message.Result := 0;
end;

procedure TEsFxTabControl.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  T: Integer;
begin
  inherited MouseMove(Shift, X, Y);
  T := TabAt(X, Y);
  if T <> FHotTab then
  begin
    FHotTab := T;
    if T >= 0 then Hint := Tabs[T].Hint;
    Invalidate;
  end;
end;

procedure TEsFxTabControl.MouseLeave;
begin
  FHotTab := -1;
  Invalidate;
  inherited MouseLeave;
end;

procedure TEsFxTabControl.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  T: Integer;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button <> mbLeft then Exit;
  T := TabAt(X, Y);
  if T < 0 then Exit;
  if csDesigning in ComponentState then
    TabIndex := T
  else
    SetActiveTabWithTransition(Tabs[T], ttSlide);
end;

procedure TEsFxTabControl.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_LEFT:
      begin
        Previous;
        Key := 0;
      end;
    VK_RIGHT:
      begin
        Next;
        Key := 0;
      end;
    VK_TAB:
      if ssCtrl in Shift then
      begin
        if ssShift in Shift then Previous else Next;
        Key := 0;
      end;
  end;
  if Key <> 0 then
    inherited KeyDown(Key, Shift);
end;

procedure TEsFxTabControl.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  HR: TRect;
  I, H: Integer;
  R: TRectF;
  Tab: TEsFxTabItem;
  Y: Single;
begin
  T := EsCurrentTheme;
  HR := HeaderRect;
  H := HR.Bottom - HR.Top;
  if H <= 0 then Exit;
  if FTabPosition = tpDots then
  begin
    for I := 0 to TabCount - 1 do
    begin
      Tab := Tabs[I];
      if not Tab.TabVisible then Continue;
      R := EsRectF(OX + (Tab.FHeaderRect.Left + Tab.FHeaderRect.Right) / 2 - 3.5,
        OY + HR.Top + H / 2 - 3.5, OX + (Tab.FHeaderRect.Left + Tab.FHeaderRect.Right) / 2 + 3.5,
        OY + HR.Top + H / 2 + 3.5);
      if I = FTabIndex then
        S.FillEllipse(R, EsSolid(T.Accent))
      else if I = FHotTab then
        S.FillEllipse(R, EsSolid(T.BorderHot))
      else
        S.FillEllipse(R, EsSolid(T.Border));
    end;
    Exit;
  end;
  // barra das abas
  S.FillRect(EsRectF(OX + HR.Left, OY + HR.Top, OX + HR.Right, OY + HR.Bottom),
    EsSolid(T.Surface));
  if FTabPosition = tpTop then
    S.FillRect(EsRectF(OX, OY + HR.Bottom - 1, OX + Width, OY + HR.Bottom), EsSolid(T.Border))
  else
    S.FillRect(EsRectF(OX, OY + HR.Top, OX + Width, OY + HR.Top + 1), EsSolid(T.Border));
  if (FHotTab >= 0) and (FHotTab <> FTabIndex) then
  begin
    Tab := Tabs[FHotTab];
    S.FillRect(EsRectF(OX + Tab.FHeaderRect.Left, OY + HR.Top, OX + Tab.FHeaderRect.Right,
      OY + HR.Bottom - Ord(FTabPosition = tpTop)), EsSolid(T.Hover));
  end;
  // indicador da aba ativa (desliza até a aba nova)
  if (ActiveTab <> nil) and ActiveTab.TabVisible and (FIndW > 0) then
  begin
    if FTabPosition = tpTop then Y := HR.Bottom - 3 else Y := HR.Top;
    S.FillRoundRect(EsRectF(OX + FIndX + 6, OY + Y, OX + FIndX + FIndW - 6, OY + Y + 3), 1.5,
      EsSolid(T.Accent));
  end;
  if Focused and ShowFocusRing and (ActiveTab <> nil) then
    RenderFocusRing(S, EsRectF(OX + FIndX + 2, OY + HR.Top + 2, OX + FIndX + FIndW - 2,
      OY + HR.Bottom - 2), 4);
end;

procedure TEsFxTabControl.RenderContent(ACanvas: TCanvas);
var
  T: TEsTheme;
  I, X: Integer;
  Tab: TEsFxTabItem;
  R: TRect;
  Col: TColor;
begin
  if not (FTabPosition in [tpTop, tpBottom]) then Exit;
  T := EsCurrentTheme;
  for I := 0 to TabCount - 1 do
  begin
    Tab := Tabs[I];
    if not Tab.TabVisible then Continue;
    R := Tab.FHeaderRect;
    if I = FTabIndex then
      Col := TextColorOn(T.Surface, T.Accent, EffectiveOpacity)
    else
      Col := TextColorOn(T.Surface, T.TextDim, EffectiveOpacity);
    if not Tab.Enabled then
      Col := TextColorOn(T.Surface, T.TextDisabled, EffectiveOpacity);
    if (FImages <> nil) and (Tab.ImageIndex >= 0) and (Tab.ImageIndex < FImages.Count) then
    begin
      X := R.Left + EsScale(Self, 10);
      if FFullSize then
        X := (R.Left + R.Right - FImages.Width - EsScale(Self, 6) -
          ACanvas.TextWidth(Tab.Text)) div 2;
      FImages.Draw(ACanvas, X, (R.Top + R.Bottom - FImages.Height) div 2, Tab.ImageIndex,
        Tab.Enabled);
      R.Left := X + FImages.Width + EsScale(Self, 6);
      EsDrawText(ACanvas, R, Tab.Text, dhaLeading, dvaCenter, False, Col, True);
    end
    else
      EsDrawText(ACanvas, R, Tab.Text, dhaCenter, dvaCenter, False, Col, True);
  end;
end;

{ TEsFxListItem }

constructor TEsFxListItem.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FImageIndex := -1;
  FEnabled := True;
end;

procedure TEsFxListItem.Assign(Source: TPersistent);
begin
  if Source is TEsFxListItem then
  begin
    FText := TEsFxListItem(Source).FText;
    FDetail := TEsFxListItem(Source).FDetail;
    FImageIndex := TEsFxListItem(Source).FImageIndex;
    FChecked := TEsFxListItem(Source).FChecked;
    FIsHeader := TEsFxListItem(Source).FIsHeader;
    FEnabled := TEsFxListItem(Source).FEnabled;
    FAccessory := TEsFxListItem(Source).FAccessory;
    FTag := TEsFxListItem(Source).FTag;
    FData := TEsFxListItem(Source).FData;
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

function TEsFxListItem.GetDisplayName: string;
begin
  if FText <> '' then Result := FText else Result := inherited GetDisplayName;
end;

procedure TEsFxListItem.SetText(const AValue: string);
begin
  if FText = AValue then Exit;
  FText := AValue;
  Changed(False);
end;

procedure TEsFxListItem.SetDetail(const AValue: string);
begin
  if FDetail = AValue then Exit;
  FDetail := AValue;
  Changed(False);
end;

procedure TEsFxListItem.SetImageIndex(AValue: Integer);
begin
  if FImageIndex = AValue then Exit;
  FImageIndex := AValue;
  Changed(False);
end;

procedure TEsFxListItem.SetChecked(AValue: Boolean);
begin
  if FChecked = AValue then Exit;
  FChecked := AValue;
  Changed(False);
end;

procedure TEsFxListItem.SetIsHeader(AValue: Boolean);
begin
  if FIsHeader = AValue then Exit;
  FIsHeader := AValue;
  if AValue then FSelected := False;
  Changed(False);
end;

procedure TEsFxListItem.SetEnabled(AValue: Boolean);
begin
  if FEnabled = AValue then Exit;
  FEnabled := AValue;
  Changed(False);
end;

procedure TEsFxListItem.SetAccessory(AValue: TEsFxListAccessory);
begin
  if FAccessory = AValue then Exit;
  FAccessory := AValue;
  Changed(False);
end;

{ TEsFxListItems }

function TEsFxListItems.GetItem(AIndex: Integer): TEsFxListItem;
begin
  Result := TEsFxListItem(inherited Items[AIndex]);
end;

procedure TEsFxListItems.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if Owner is TEsFxListBox then
    TEsFxListBox(Owner).ItemsChanged;
end;

function TEsFxListItems.Add: TEsFxListItem;
begin
  Result := TEsFxListItem(inherited Add);
end;

function TEsFxListItems.AddItem(const AText: string; const ADetail: string;
  AImageIndex: Integer): TEsFxListItem;
begin
  BeginUpdate;
  try
    Result := Add;
    Result.FText := AText;
    Result.FDetail := ADetail;
    Result.FImageIndex := AImageIndex;
  finally
    EndUpdate;
  end;
end;

function TEsFxListItems.AddHeader(const AText: string): TEsFxListItem;
begin
  BeginUpdate;
  try
    Result := Add;
    Result.FText := AText;
    Result.FIsHeader := True;
  finally
    EndUpdate;
  end;
end;

function TEsFxListItems.IndexOfText(const AText: string): Integer;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if SameText(Items[I].Text, AText) then
      Exit(I);
  Result := -1;
end;

procedure TEsFxListItems.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TStrings then
  begin
    BeginUpdate;
    try
      Clear;
      for I := 0 to TStrings(Source).Count - 1 do
        AddItem(TStrings(Source)[I]).FData := TStrings(Source).Objects[I];
    finally
      EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TEsFxListItems.AssignTo(Dest: TPersistent);
var
  I: Integer;
begin
  if Dest is TStrings then
  begin
    TStrings(Dest).BeginUpdate;
    try
      TStrings(Dest).Clear;
      for I := 0 to Count - 1 do
        TStrings(Dest).AddObject(Items[I].Text, Items[I].Data);
    finally
      TStrings(Dest).EndUpdate;
    end;
  end
  else
    inherited AssignTo(Dest);
end;

{ TEsFxListBox }

constructor TEsFxListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FItems := TEsFxListItems.Create(Self, TEsFxListItem);
  FItemIndex := -1;
  FHot := -1;
  FAnchor := -1;
  FThumbHot := TEsFxTransition.Create(Self, 0.15);
  ShowFocusRing := False;
  with GetControlClassDefaultSize do
    SetBounds(0, 0, CX, CY);
end;

destructor TEsFxListBox.Destroy;
begin
  StopTicking;
  FThumbHot.Free;
  FreeAndNil(FItems);
  inherited Destroy;
end;

class function TEsFxListBox.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 200;
  Result.CY := 220;
end;

procedure TEsFxListBox.SetItems(AValue: TEsFxListItems);
begin
  FItems.Assign(AValue);
end;

procedure TEsFxListBox.BeginUpdate;
begin
  Inc(FUpdating);
  FItems.BeginUpdate;
end;

procedure TEsFxListBox.EndUpdate;
begin
  FItems.EndUpdate;
  Dec(FUpdating);
  if FUpdating = 0 then ItemsChanged;
end;

procedure TEsFxListBox.ItemsChanged;
begin
  if (FItems = nil) or (csDestroying in ComponentState) or (FUpdating > 0) then Exit;
  if FItemIndex >= FItems.Count then FItemIndex := FItems.Count - 1;
  if FHot >= FItems.Count then FHot := -1;
  FScrollTarget := EnsureRange(FScrollTarget, 0, MaxScroll);
  FScroll := EnsureRange(FScroll, 0, MaxScroll);
  Invalidate;
end;

procedure TEsFxListBox.Clear;
begin
  FItems.Clear;
  FItemIndex := -1;
  FAnchor := -1;
  FScroll := 0;
  FScrollTarget := 0;
  Invalidate;
end;

procedure TEsFxListBox.SetMultiSelect(AValue: Boolean);
begin
  if FMultiSelect = AValue then Exit;
  FMultiSelect := AValue;
  if not AValue then
  begin
    ClearSelection;
    if CanSelect(FItemIndex) then FItems[FItemIndex].FSelected := True;
  end;
  Invalidate;
end;

procedure TEsFxListBox.SetShowCheckboxes(AValue: Boolean);
begin
  if FShowCheckboxes = AValue then Exit;
  FShowCheckboxes := AValue;
  Invalidate;
end;

procedure TEsFxListBox.SetItemHeight(AValue: Integer);
begin
  AValue := Max(0, AValue);
  if FItemHeight = AValue then Exit;
  FItemHeight := AValue;
  ItemsChanged;
end;

procedure TEsFxListBox.SetImages(AValue: TCustomImageList);
begin
  if FImages = AValue then Exit;
  if FImages <> nil then FImages.RemoveFreeNotification(Self);
  FImages := AValue;
  if FImages <> nil then FImages.FreeNotification(Self);
  ItemsChanged;
end;

procedure TEsFxListBox.SetAlternatingRowBackground(AValue: Boolean);
begin
  if FAlternatingRowBackground = AValue then Exit;
  FAlternatingRowBackground := AValue;
  Invalidate;
end;

procedure TEsFxListBox.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then
  begin
    FImages := nil;
    ItemsChanged;
  end;
end;

function TEsFxListBox.RowHeight: Integer;
begin
  if FItemHeight > 0 then Exit(FItemHeight);
  Result := EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 14);
  if FImages <> nil then Result := Max(Result, FImages.Height + EsScale(Self, 8));
end;

function TEsFxListBox.ContentHeight: Integer;
begin
  Result := FItems.Count * RowHeight;
end;

function TEsFxListBox.MaxScroll: Single;
begin
  Result := Max(0, ContentHeight - (Height - 4));
end;

function TEsFxListBox.ItemAt(X, Y: Integer): Integer;
begin
  if (X < 2) or (X >= Width - 2) or (Y < 2) or (Y >= Height - 2) then Exit(-1);
  Result := Floor((Y - 2 + FScroll) / RowHeight);
  if (Result < 0) or (Result >= FItems.Count) then Result := -1;
end;

function TEsFxListBox.ItemRect(AIndex: Integer): TRect;
var
  Y: Integer;
begin
  Y := 2 + Round(AIndex * RowHeight - FScroll);
  Result := Rect(2, Y, Width - 2, Y + RowHeight);
end;

function TEsFxListBox.CanSelect(AIndex: Integer): Boolean;
begin
  Result := (AIndex >= 0) and (AIndex < FItems.Count) and not FItems[AIndex].IsHeader and
    FItems[AIndex].Enabled;
end;

function TEsFxListBox.NextSelectable(AFrom, ADir: Integer): Integer;
begin
  Result := AFrom + ADir;
  while (Result >= 0) and (Result < FItems.Count) and not CanSelect(Result) do
    Inc(Result, ADir);
  if (Result < 0) or (Result >= FItems.Count) then Result := AFrom;
end;

function TEsFxListBox.GetSelected(AIndex: Integer): Boolean;
begin
  Result := (AIndex >= 0) and (AIndex < FItems.Count) and FItems[AIndex].FSelected;
end;

procedure TEsFxListBox.SetSelected(AIndex: Integer; AValue: Boolean);
begin
  if not CanSelect(AIndex) then Exit;
  if not FMultiSelect and AValue then
  begin
    ItemIndex := AIndex;
    Exit;
  end;
  if FItems[AIndex].FSelected = AValue then Exit;
  FItems[AIndex].FSelected := AValue;
  Invalidate;
end;

function TEsFxListBox.GetSelCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FItems.Count - 1 do
    if FItems[I].FSelected then Inc(Result);
end;

function TEsFxListBox.GetSelectedItem: TEsFxListItem;
begin
  if (FItemIndex >= 0) and (FItemIndex < FItems.Count) then
    Result := FItems[FItemIndex]
  else
    Result := nil;
end;

procedure TEsFxListBox.ClearSelection;
var
  I: Integer;
begin
  for I := 0 to FItems.Count - 1 do
    FItems[I].FSelected := False;
  Invalidate;
end;

procedure TEsFxListBox.SelectAll;
var
  I: Integer;
begin
  if not FMultiSelect then Exit;
  for I := 0 to FItems.Count - 1 do
    FItems[I].FSelected := CanSelect(I);
  Invalidate;
end;

procedure TEsFxListBox.SelectRange(AFrom, ATo: Integer);
var
  I: Integer;
begin
  if AFrom > ATo then
  begin
    I := AFrom;
    AFrom := ATo;
    ATo := I;
  end;
  for I := 0 to FItems.Count - 1 do
    FItems[I].FSelected := (I >= AFrom) and (I <= ATo) and CanSelect(I);
end;

procedure TEsFxListBox.SetItemIndex(AValue: Integer);
begin
  if (AValue <> -1) and not CanSelect(AValue) then Exit;
  if FItemIndex = AValue then Exit;
  FItemIndex := AValue;
  FAnchor := AValue;
  if not FMultiSelect then
  begin
    ClearSelection;
    if AValue >= 0 then FItems[AValue].FSelected := True;
  end;
  if AValue >= 0 then ScrollToItem(AValue);
  Invalidate;
  DoChange;
end;

procedure TEsFxListBox.DoChange;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TEsFxListBox.ScrollToItem(AIndex: Integer; AAnimate: Boolean);
var
  YTop, YBot, View: Single;
begin
  if (AIndex < 0) or (AIndex >= FItems.Count) then Exit;
  YBot := (AIndex + 1) * RowHeight;
  // ao subir, mostra também o(s) cabeçalho(s) de grupo logo acima
  while (AIndex > 0) and FItems[AIndex - 1].IsHeader do Dec(AIndex);
  YTop := AIndex * RowHeight;
  View := Height - 4;
  if YTop < FScrollTarget then
    FScrollTarget := YTop
  else if YBot > FScrollTarget + View then
    FScrollTarget := YBot - View
  else
    Exit;
  FScrollTarget := EnsureRange(FScrollTarget, 0, MaxScroll);
  if AAnimate and not (csDesigning in ComponentState) then
    StartTicking
  else
  begin
    FScroll := FScrollTarget;
    Invalidate;
  end;
end;

procedure TEsFxListBox.ScrollList(ADelta: Single; AAnimate: Boolean);
begin
  FScrollTarget := EnsureRange(FScrollTarget + ADelta, 0, MaxScroll);
  if AAnimate and not (csDesigning in ComponentState) then
    StartTicking
  else
  begin
    FScroll := FScrollTarget;
    Invalidate;
  end;
end;

procedure TEsFxListBox.StartTicking;
begin
  if FTicking then Exit;
  FTicking := True;
  EsFxTicker.Add(Tick);
end;

procedure TEsFxListBox.StopTicking;
begin
  if not FTicking then Exit;
  FTicking := False;
  EsFxTicker.Remove(Tick);
end;

procedure TEsFxListBox.Tick(DeltaSec: Double);
begin
  // inércia: a velocidade do arrasto decai
  if not FDown and (Abs(FVelocity) > 20) then
  begin
    FScrollTarget := EnsureRange(FScrollTarget + FVelocity * DeltaSec, 0, MaxScroll);
    FVelocity := FVelocity * Power(0.04, DeltaSec);
    if (FScrollTarget <= 0) or (FScrollTarget >= MaxScroll) then FVelocity := 0;
  end
  else if not FDown then
    FVelocity := 0;
  FScroll := FScroll + (FScrollTarget - FScroll) * Min(1, DeltaSec * 16);
  if (Abs(FScrollTarget - FScroll) < 0.5) and (FVelocity = 0) then
  begin
    FScroll := FScrollTarget;
    StopTicking;
  end;
  Invalidate;
end;

function TEsFxListBox.ThumbRect: TRectF;
var
  View, CH, TH, TY, W: Single;
begin
  View := Height - 4;
  CH := ContentHeight;
  if CH <= View then Exit(EsRectF(0, 0, 0, 0));
  TH := Max(24, View * View / CH);
  TY := 2 + (View - TH) * FScroll / Max(1, MaxScroll);
  W := 4 + 3 * FThumbHot.Eased;
  Result := EsRectF(Width - 3 - W, TY, Width - 3, TY + TH);
end;

procedure TEsFxListBox.Resize;
begin
  inherited Resize;
  ItemsChanged;
end;

procedure TEsFxListBox.ClickItem(AIndex: Integer; Shift: TShiftState);
begin
  if not CanSelect(AIndex) then Exit;
  if FMultiSelect and (ssShift in Shift) and (FAnchor >= 0) then
  begin
    SelectRange(FAnchor, AIndex);
    FItemIndex := AIndex;
    ScrollToItem(AIndex);
    Invalidate;
    DoChange;
  end
  else if FMultiSelect and (ssCtrl in Shift) then
  begin
    FItems[AIndex].FSelected := not FItems[AIndex].FSelected;
    FItemIndex := AIndex;
    FAnchor := AIndex;
    Invalidate;
    DoChange;
  end
  else
  begin
    if FMultiSelect then
    begin
      ClearSelection;
      FItems[AIndex].FSelected := True;
    end;
    if FItemIndex <> AIndex then
      ItemIndex := AIndex
    else
      FAnchor := AIndex;
  end;
  if Assigned(FOnItemClick) then FOnItemClick(Self, AIndex);
end;

procedure TEsFxListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  H: Integer;
  TR: TRectF;
  Now: UInt64;
  Dt: Single;
begin
  inherited MouseMove(Shift, X, Y);
  if FThumbDrag then
  begin
    TR := ThumbRect;
    if Height - 4 - TR.Height > 0 then
      FScroll := EnsureRange((Y - FThumbGrab - 2) / (Height - 4 - TR.Height) * MaxScroll,
        0, MaxScroll);
    FScrollTarget := FScroll;
    Invalidate;
    Exit;
  end;
  if FDown and not FDragScroll and (Abs(Y - FDownPt.Y) > EsScale(Self, 6)) then
  begin
    FDragScroll := True;  // arrasto: rola o conteúdo (como no toque)
    FLastMoveY := Y;
    FLastMoveTime := GetTickCount64;
  end;
  if FDragScroll then
  begin
    Now := GetTickCount64;
    Dt := Max(1, Now - FLastMoveTime) / 1000;
    FVelocity := 0.6 * FVelocity + 0.4 * ((FLastMoveY - Y) / Dt);
    FLastMoveY := Y;
    FLastMoveTime := Now;
    FScroll := EnsureRange(FDownScroll + (FDownPt.Y - Y), 0, MaxScroll);
    FScrollTarget := FScroll;
    Invalidate;
    Exit;
  end;
  TR := ThumbRect;
  if (TR.Width > 0) and (X >= Width - 14) then
    FThumbHot.SetTarget(1)
  else
    FThumbHot.SetTarget(0);
  H := ItemAt(X, Y);
  if H <> FHot then
  begin
    FHot := H;
    Invalidate;
  end;
end;

procedure TEsFxListBox.MouseLeave;
begin
  FHot := -1;
  FThumbHot.SetTarget(0);
  Invalidate;
  inherited MouseLeave;
end;

procedure TEsFxListBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  TR: TRectF;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button <> mbLeft then Exit;
  if CanFocus and not Focused then SetFocus;
  TR := ThumbRect;
  if (TR.Width > 0) and (X >= Width - 14) then
  begin
    if (Y >= TR.Top) and (Y <= TR.Bottom) then
      FThumbGrab := Y - TR.Top
    else
    begin
      // clique na trilha: pula para o ponto
      FThumbGrab := TR.Height / 2;
      MouseMove(Shift, X, Y);
    end;
    FThumbDrag := True;
    StopTicking;
    Exit;
  end;
  FDown := True;
  FDragScroll := False;
  FDownPt := Point(X, Y);
  FDownScroll := FScroll;
  FVelocity := 0;
  StopTicking;
  FScrollTarget := FScroll;
end;

procedure TEsFxListBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  I, CB: Integer;
  R: TRect;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if Button <> mbLeft then Exit;
  if FThumbDrag then
  begin
    FThumbDrag := False;
    Exit;
  end;
  if not FDown then Exit;
  FDown := False;
  if FDragScroll then
  begin
    FDragScroll := False;
    if GetTickCount64 - FLastMoveTime > 80 then FVelocity := 0;
    if Abs(FVelocity) > 20 then StartTicking;
    Exit;
  end;
  I := ItemAt(X, Y);
  if I < 0 then Exit;
  // caixa de seleção
  if FShowCheckboxes and CanSelect(I) then
  begin
    R := ItemRect(I);
    CB := R.Left + EsScale(Self, 8) + EsScale(Self, 18);
    if X < CB + 4 then
    begin
      FItems[I].Checked := not FItems[I].Checked;
      if Assigned(FOnCheckChange) then FOnCheckChange(Self, I);
    end;
  end;
  ClickItem(I, Shift);
end;

function TEsFxListBox.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if not Result then
  begin
    ScrollList(-WheelDelta / 120 * RowHeight * 3);
    Result := True;
  end;
end;

procedure TEsFxListBox.KeyDown(var Key: Word; Shift: TShiftState);
var
  N, Page: Integer;
begin
  N := -2;
  Page := Max(1, (Height - 4) div RowHeight - 1);
  case Key of
    VK_UP: N := NextSelectable(Max(FItemIndex, 0), -1);
    VK_DOWN:
      if FItemIndex < 0 then N := NextSelectable(-1, 1)
      else N := NextSelectable(FItemIndex, 1);
    VK_HOME: N := NextSelectable(-1, 1);
    VK_END: N := NextSelectable(FItems.Count, -1);
    VK_PRIOR: N := NextSelectable(Max(0, FItemIndex - Page + 1), -1);
    VK_NEXT: N := NextSelectable(Min(FItems.Count - 1, FItemIndex + Page - 1), 1);
    VK_SPACE:
      if CanSelect(FItemIndex) then
      begin
        if FShowCheckboxes then
        begin
          FItems[FItemIndex].Checked := not FItems[FItemIndex].Checked;
          if Assigned(FOnCheckChange) then FOnCheckChange(Self, FItemIndex);
        end
        else if FMultiSelect then
        begin
          FItems[FItemIndex].FSelected := not FItems[FItemIndex].FSelected;
          Invalidate;
          DoChange;
        end;
        Key := 0;
      end;
    Ord('A'):
      if (ssCtrl in Shift) and FMultiSelect then
      begin
        SelectAll;
        DoChange;
        Key := 0;
      end;
  end;
  if (N >= 0) and CanSelect(N) then
  begin
    if FMultiSelect and (ssShift in Shift) and (FAnchor >= 0) then
    begin
      SelectRange(FAnchor, N);
      FItemIndex := N;
      ScrollToItem(N);
      Invalidate;
      DoChange;
    end
    else if FMultiSelect and (ssCtrl in Shift) then
    begin
      FItemIndex := N;  // move o foco sem mudar a seleção
      ScrollToItem(N);
      Invalidate;
    end
    else
    begin
      if FMultiSelect then
      begin
        ClearSelection;
        FItems[N].FSelected := True;
      end;
      ItemIndex := N;
    end;
    Key := 0;
  end;
  if Key <> 0 then
    inherited KeyDown(Key, Shift);
end;

procedure TEsFxListBox.KeyPress(var Key: Char);
var
  I, J, Start: Integer;
  Now: UInt64;
begin
  inherited KeyPress(Key);
  if Key < ' ' then Exit;
  // busca incremental pelo início do texto
  Now := GetTickCount64;
  if Now - FSearchTime > 900 then FSearch := '';
  FSearchTime := Now;
  FSearch := FSearch + Key;
  Start := Max(FItemIndex, 0);
  if Length(FSearch) = 1 then Inc(Start);
  for J := 0 to FItems.Count - 1 do
  begin
    I := (Start + J) mod Max(1, FItems.Count);
    if CanSelect(I) and SameText(Copy(FItems[I].Text, 1, Length(FSearch)), FSearch) then
    begin
      if FMultiSelect then
      begin
        ClearSelection;
        FItems[I].FSelected := True;
      end;
      ItemIndex := I;
      Break;
    end;
  end;
end;

procedure TEsFxListBox.RenderShape(S: TEsSurface; OX, OY: Single);
var
  T: TEsTheme;
  R, IR, CBR: TRectF;
  I, First, Last, RH, CB: Integer;
  Y, CX, CY: Single;
  It: TEsFxListItem;
  Back: TAlphaColor;
begin
  T := EsCurrentTheme;
  R := EsRectF(OX + 0.5, OY + 0.5, OX + Width - 0.5, OY + Height - 0.5);
  S.FillRoundRect(R, 4, EsSolid(T.Surface));
  RH := RowHeight;
  First := Max(0, Floor(FScroll / RH));
  Last := Min(FItems.Count - 1, Ceil((FScroll + Height) / RH));
  CB := EsScale(Self, 18);
  for I := First to Last do
  begin
    It := FItems[I];
    Y := OY + 2 + I * RH - FScroll;
    IR := EsRectF(OX + 2, Max(OY + 2, Y), OX + Width - 2, Min(OY + Height - 2, Y + RH));
    if IR.Bottom <= IR.Top then Continue;
    Back := T.Surface;
    if It.IsHeader then
    begin
      S.FillRect(IR, EsSolid(T.SurfaceAlt));
      Back := T.SurfaceAlt;
    end
    else if It.FSelected or (not FMultiSelect and (I = FItemIndex)) then
    begin
      if Focused then Back := T.Selection else Back := T.SelectionInactive;
      S.FillRoundRect(EsInflate(IR, -1), 3, EsSolid(Back));
    end
    else if I = FHot then
      S.FillRoundRect(EsInflate(IR, -1), 3, EsSolid(T.Hover))
    else if FAlternatingRowBackground and Odd(I) then
      S.FillRect(IR, EsSolid(BlendOver(T.Surface, FadeColor(T.SurfaceAlt, 0.6))));
    if FMultiSelect and Focused and (I = FItemIndex) and not It.IsHeader then
      S.StrokeRoundRect(EsInflate(IR, -1), 3, 1, EsSolid(T.Accent));
    // caixa de seleção
    if FShowCheckboxes and not It.IsHeader then
    begin
      CX := OX + 2 + EsScale(Self, 8);
      CY := Y + (RH - CB) / 2;
      if (CY >= OY) and (CY + CB <= OY + Height) then
      begin
        CBR := EsRectF(CX, CY, CX + CB, CY + CB);
        if It.Checked then
        begin
          S.FillRoundRect(CBR, 3, EsSolid(T.Accent));
          S.DrawLine(CX + CB * 0.25, CY + CB * 0.52, CX + CB * 0.43, CY + CB * 0.7, 2,
            EsSolid(T.AccentText));
          S.DrawLine(CX + CB * 0.43, CY + CB * 0.7, CX + CB * 0.76, CY + CB * 0.32, 2,
            EsSolid(T.AccentText));
        end
        else
        begin
          S.FillRoundRect(CBR, 3, EsSolid(T.Surface));
          S.StrokeRoundRect(CBR, 3, 1.2, EsSolid(T.BorderHot));
        end;
      end;
    end;
    // acessório à direita
    if not It.IsHeader and (It.Accessory <> laNone) then
    begin
      CX := OX + Width - 2 - EsScale(Self, 16);
      CY := Y + RH / 2;
      if (CY > OY + 4) and (CY < OY + Height - 4) then
        case It.Accessory of
          laMore:
            begin
              S.DrawLine(CX - 2, CY - 4, CX + 2, CY, 1.5, EsSolid(T.TextDim));
              S.DrawLine(CX + 2, CY, CX - 2, CY + 4, 1.5, EsSolid(T.TextDim));
            end;
          laCheckmark:
            begin
              S.DrawLine(CX - 5, CY, CX - 1.5, CY + 3.5, 2, EsSolid(T.Accent));
              S.DrawLine(CX - 1.5, CY + 3.5, CX + 5, CY - 4, 2, EsSolid(T.Accent));
            end;
          laDetail:
            begin
              S.StrokeEllipse(EsRectF(CX - 7, CY - 7, CX + 7, CY + 7), 1.4, EsSolid(T.Accent));
              S.FillEllipse(EsRectF(CX - 1, CY - 4.5, CX + 1, CY - 2.5), EsSolid(T.Accent));
              S.DrawLine(CX, CY - 0.5, CX, CY + 4, 1.6, EsSolid(T.Accent));
            end;
        end;
    end;
  end;
  // barra de rolagem fina (só aparece se houver conteúdo além da área)
  IR := ThumbRect;
  if IR.Width > 0 then
    S.FillRoundRect(IR, IR.Width / 2, EsSolid(FadeColor(T.TextDim, 0.35 + 0.3 * FThumbHot.Eased)));
  if Focused then
    S.StrokeRoundRect(R, 4, 1.2, EsSolid(T.Accent))
  else
    S.StrokeRoundRect(R, 4, 1, EsSolid(T.Border));
end;

procedure TEsFxListBox.RenderContent(ACanvas: TCanvas);
var
  T: TEsTheme;
  I, First, Last, RH, X, DW: Integer;
  R: TRect;
  It: TEsFxListItem;
  Back: TAlphaColor;
  Col, DCol: TColor;
  Op: Single;
begin
  T := EsCurrentTheme;
  RH := RowHeight;
  Op := EffectiveOpacity;
  First := Max(0, Floor(FScroll / RH));
  Last := Min(FItems.Count - 1, Ceil((FScroll + Height) / RH));
  // nada além da borda
  IntersectClipRect(ACanvas.Handle, 2, 2, Width - 2, Height - 2);
  for I := First to Last do
  begin
    It := FItems[I];
    R := ItemRect(I);
    Back := T.Surface;
    if It.IsHeader then
      Back := T.SurfaceAlt
    else if It.FSelected or (not FMultiSelect and (I = FItemIndex)) then
    begin
      if Focused then Back := T.Selection else Back := T.SelectionInactive;
    end;
    if It.IsHeader then
      Col := TextColorOn(Back, T.TextDim, Op)
    else if not It.Enabled then
      Col := TextColorOn(Back, T.TextDisabled, Op)
    else if It.FSelected and Focused then
      Col := TextColorOn(Back, T.SelectionText, Op)
    else
      Col := TextColorOn(Back, T.Text, Op);
    X := R.Left + EsScale(Self, 10);
    if FShowCheckboxes and not It.IsHeader then
      Inc(X, EsScale(Self, 18) + EsScale(Self, 8));
    if (FImages <> nil) and not It.IsHeader then
    begin
      if (It.ImageIndex >= 0) and (It.ImageIndex < FImages.Count) then
        FImages.Draw(ACanvas, X, (R.Top + R.Bottom - FImages.Height) div 2, It.ImageIndex,
          It.Enabled and EsIsEnabled(Self));
      Inc(X, FImages.Width + EsScale(Self, 8));
    end;
    R.Left := X;
    Dec(R.Right, EsScale(Self, 10));
    if It.Accessory <> laNone then Dec(R.Right, EsScale(Self, 18));
    if It.IsHeader then
      ACanvas.Font.Style := [fsBold]
    else
      ACanvas.Font.Style := Font.Style;
    if It.Detail <> '' then
    begin
      // detalhe à direita, mais claro (ItemData.Detail)
      DW := Min(ACanvas.TextWidth(It.Detail), (R.Right - R.Left) div 2);
      DCol := TextColorOn(Back, T.TextDim, Op);
      EsDrawText(ACanvas, Rect(R.Right - DW, R.Top, R.Right, R.Bottom), It.Detail,
        dhaTrailing, dvaCenter, False, DCol, True);
      Dec(R.Right, DW + EsScale(Self, 8));
    end;
    EsDrawText(ACanvas, R, It.Text, dhaLeading, dvaCenter, False, Col, True);
  end;
  ACanvas.Font.Style := Font.Style;
end;

initialization
  RegisterClass(TEsFxTabItem);
end.
