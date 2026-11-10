{
 *****************************************************************************
  ESKit - esribbon.pas
  TEsRibbon - faixa de opções (Ribbon) no estilo DevExpress dxRibbon /
  Office: botão de aplicação, abas, grupos com botões grandes e pequenos,
  botões de alternância, menus suspensos, modo minimizado (duplo clique
  na aba), barra de acesso rápido (QuickAccessItems), galerias
  (ButtonStyle = rbsGallery), abas contextuais (ContextCaption) e KeyTips
  (Alt ou F10 mostram as teclas de atalho de abas e botões).

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsRibbon;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Types, Math, Controls, Graphics, Forms, Menus, ImgList, ActnList,
  LCLType, LCLIntf, EsGraphics, EsTheme, EsSkins, EsEditors;

type
  TEsRibbon = class;

  TEsRibbonItemSize = (risLarge, risSmall);
  { rbsGallery: galeria de miniaturas (Gallery) dentro da faixa }
  TEsRibbonButtonStyle = (rbsButton, rbsCheck, rbsDropDown, rbsGallery);
  TEsRibbonQATPosition = (qapTabBar, qapBelow);
  TEsRibbonKeyTipMode = (ktmNone, ktmTabs, ktmItems);

  { TEsRibbonGalleryEntry - uma miniatura da galeria }

  TEsRibbonGalleryEntry = class(TCollectionItem)
  private
    FCaption: string;
    FImageIndex: TImageIndex;
    FColor: TAlphaColor;
    FHint: string;
    procedure SetCaption(const AValue: string);
    procedure SetImageIndex(AValue: TImageIndex);
    procedure SetColor(AValue: TAlphaColor);
  public
    constructor Create(ACollection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property Caption: string read FCaption write SetCaption;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    { cor da amostra (Null = usa a imagem) }
    property Color: TAlphaColor read FColor write SetColor default 0;
    property Hint: string read FHint write FHint;
  end;

  TEsRibbonGalleryEntries = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TEsRibbonGalleryEntry;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    function Add: TEsRibbonGalleryEntry;
    property Items[Index: Integer]: TEsRibbonGalleryEntry read GetItem; default;
  end;

  TEsRibbonItem = class;
  TEsRibbonGalleryEvent = procedure(Sender: TObject; AItem: TEsRibbonItem;
    AIndex: Integer) of object;

  { TEsRibbonItem }

  TEsRibbonItem = class(TCollectionItem)
  private
    FCaption: string;
    FImageIndex: TImageIndex;
    FSize: TEsRibbonItemSize;
    FButtonStyle: TEsRibbonButtonStyle;
    FDown: Boolean;
    FEnabled: Boolean;
    FVisible: Boolean;
    FHint: string;
    FDropDownMenu: TPopupMenu;
    FTag: PtrInt;
    FKeyTip: string;
    FGallery: TEsRibbonGalleryEntries;
    FGalleryColumns: Integer;
    FGalleryIndex: Integer;
    FGalleryTop: Integer;
    FOnClick: TNotifyEvent;
    FOnGalleryClick: TEsRibbonGalleryEvent;
    procedure SetGallery(AValue: TEsRibbonGalleryEntries);
    procedure SetGalleryColumns(AValue: Integer);
    procedure SetGalleryIndex(AValue: Integer);
    procedure SetCaption(const AValue: string);
    procedure SetImageIndex(AValue: TImageIndex);
    procedure SetSize(AValue: TEsRibbonItemSize);
    procedure SetButtonStyle(AValue: TEsRibbonButtonStyle);
    procedure SetDown(AValue: Boolean);
    procedure SetEnabled(AValue: Boolean);
    procedure SetVisible(AValue: Boolean);
    procedure SetDropDownMenu(AValue: TPopupMenu);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function Ribbon: TEsRibbon;
    { primeira linha visível da galeria (rolagem) }
    property GalleryTop: Integer read FGalleryTop write FGalleryTop;
  published
    property Caption: string read FCaption write SetCaption;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    { tecla(s) do KeyTip; vazio = gerada a partir do Caption }
    property KeyTip: string read FKeyTip write FKeyTip;
    property Gallery: TEsRibbonGalleryEntries read FGallery write SetGallery;
    property GalleryColumns: Integer read FGalleryColumns write SetGalleryColumns default 4;
    { miniatura selecionada (-1 = nenhuma) }
    property GalleryIndex: Integer read FGalleryIndex write SetGalleryIndex default -1;
    property OnGalleryClick: TEsRibbonGalleryEvent read FOnGalleryClick write FOnGalleryClick;
    property Size: TEsRibbonItemSize read FSize write SetSize default risLarge;
    property ButtonStyle: TEsRibbonButtonStyle read FButtonStyle write SetButtonStyle default rbsButton;
    property Down: Boolean read FDown write SetDown default False;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Hint: string read FHint write FHint;
    property DropDownMenu: TPopupMenu read FDropDownMenu write SetDropDownMenu;
    property Tag: PtrInt read FTag write FTag default 0;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
  end;

  TEsRibbonItems = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TEsRibbonItem;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    function Add: TEsRibbonItem;
    property Items[Index: Integer]: TEsRibbonItem read GetItem; default;
  end;

  { TEsRibbonGroup }

  TEsRibbonGroup = class(TCollectionItem)
  private
    FCaption: string;
    FVisible: Boolean;
    FItems: TEsRibbonItems;
    procedure SetCaption(const AValue: string);
    procedure SetVisible(AValue: Boolean);
    procedure SetItems(AValue: TEsRibbonItems);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function Ribbon: TEsRibbon;
  published
    property Caption: string read FCaption write SetCaption;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Items: TEsRibbonItems read FItems write SetItems;
  end;

  TEsRibbonGroups = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TEsRibbonGroup;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    function Add: TEsRibbonGroup;
    property Items[Index: Integer]: TEsRibbonGroup read GetItem; default;
  end;

  { TEsRibbonTab }

  TEsRibbonTab = class(TCollectionItem)
  private
    FCaption: string;
    FVisible: Boolean;
    FGroups: TEsRibbonGroups;
    FContextCaption: string;
    FContextColor: TAlphaColor;
    FKeyTip: string;
    procedure SetContextCaption(const AValue: string);
    procedure SetContextColor(AValue: TAlphaColor);
    procedure SetCaption(const AValue: string);
    procedure SetVisible(AValue: Boolean);
    procedure SetGroups(AValue: TEsRibbonGroups);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function Ribbon: TEsRibbon;
  published
    property Caption: string read FCaption write SetCaption;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Groups: TEsRibbonGroups read FGroups write SetGroups;
    { aba contextual: abas consecutivas com o mesmo ContextCaption ganham um
      cabeçalho colorido acima delas (como "Ferramentas de Tabela" no Office) }
    property ContextCaption: string read FContextCaption write SetContextCaption;
    property ContextColor: TAlphaColor read FContextColor write SetContextColor default 0;
    property KeyTip: string read FKeyTip write FKeyTip;
  end;

  TEsRibbonTabs = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TEsRibbonTab;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    function Add: TEsRibbonTab;
    property Items[Index: Integer]: TEsRibbonTab read GetItem; default;
  end;

  TEsRibbonLayoutItem = record
    Item: TEsRibbonItem;
    R: TRect;
    QAT: Boolean;   // botão da barra de acesso rápido
  end;

  TEsRibbonLayoutGroup = record
    Group: TEsRibbonGroup;
    R: TRect;
  end;

  TEsRibbonItemEvent = procedure(Sender: TObject; AItem: TEsRibbonItem) of object;

  { TEsRibbon }

  TEsRibbon = class(TCustomControl)
  private
    FTabs: TEsRibbonTabs;
    FActiveTab: Integer;
    FImages: TCustomImageList;
    FLargeImages: TCustomImageList;
    FAppButtonCaption: string;
    FAppButtonVisible: Boolean;
    FAppMenu: TPopupMenu;
    FMinimized: Boolean;
    FLayoutItems: array of TEsRibbonLayoutItem;
    FLayoutGroups: array of TEsRibbonLayoutGroup;
    FTabRects: array of TRect;
    FAppRect: TRect;
    FHotItem: TEsRibbonItem;
    FPressedItem: TEsRibbonItem;
    FHotTab: Integer;
    FAppHot: Boolean;
    FLocked: Boolean;
    FQuickAccess: TEsRibbonItems;
    FQATPosition: TEsRibbonQATPosition;
    FCustomizeMenu: TPopupMenu;
    FMenuItem: TEsRibbonItem;
    FGalleryPopup: TEsPopupForm;
    FGalleryPopupItem: TEsRibbonItem;
    FGalleryHot: Integer;
    FKeyTipMode: TEsRibbonKeyTipMode;
    FKeyTipPrefix: string;
    FKeyTipKeys: array of string;   // teclas exibidas
    FKeyTipCodes: array of Integer; // abas: índice da aba, -1 = botão de aplicação,
                                    // 1000+n = item n do layout (acesso rápido);
                                    // itens: índice em FLayoutItems
    FKeyTipsEnabled: Boolean;
    FHookedForm: TCustomForm;
    FOldFormKeyDown: TKeyEvent;
    FOldFormKeyUp: TKeyEvent;
    FAltDown: Boolean;
    FOnGalleryClick: TEsRibbonGalleryEvent;
    FOnApplicationButtonClick: TNotifyEvent;
    FOnTabChanged: TNotifyEvent;
    FOnItemClick: TEsRibbonItemEvent;
    procedure SetTabs(AValue: TEsRibbonTabs);
    procedure SetActiveTab(AValue: Integer);
    procedure SetImages(AValue: TCustomImageList);
    procedure SetLargeImages(AValue: TCustomImageList);
    procedure SetAppButtonCaption(const AValue: string);
    procedure SetAppButtonVisible(AValue: Boolean);
    procedure SetAppMenu(AValue: TPopupMenu);
    procedure SetMinimized(AValue: Boolean);
    procedure SetQuickAccess(AValue: TEsRibbonItems);
    procedure SetQATPosition(AValue: TEsRibbonQATPosition);
  protected
    function ContextRowHeight: Integer;
    function QATBelowHeight: Integer;
    function HeaderHeight: Integer;
    procedure CustomizeMenuClick(Sender: TObject);
    // galeria
    function GalleryCellSize(AItem: TEsRibbonItem; const R: TRect; out ACols, ARows: Integer): TSize;
    function GalleryButtonsRect(const R: TRect): TRect;
    function GalleryIndexAt(const L: TEsRibbonLayoutItem; X, Y: Integer): Integer;
    procedure PaintGallery(const L: TEsRibbonLayoutItem);
    procedure PaintGalleryCell(ACanvas: TCanvas; AItem: TEsRibbonItem; AIndex: Integer;
      const R: TRect; ASelected, AHot: Boolean);
    procedure ShowGalleryPopup(AItem: TEsRibbonItem; const R: TRect);
    procedure GalleryPopupPaint(Sender: TObject);
    procedure GalleryPopupMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GalleryPopupMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SelectGalleryEntry(AItem: TEsRibbonItem; AIndex: Integer);
    // KeyTips
    procedure HookForm;
    procedure UnhookForm;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BuildKeyTips;
    procedure PaintKeyTips;
    function KeyTipRect(AIndex: Integer): TRect;
    function TabBarHeight: Integer;
    function BodyHeight: Integer;
    function GroupCaptionHeight: Integer;
    procedure DoLayout;
    function ItemAt(X, Y: Integer): TEsRibbonItem;
    function TabAt(X, Y: Integer): Integer;
    procedure PaintItem(const L: TEsRibbonLayoutItem);
    procedure UpdateHeight;
    procedure ExecuteItem(AItem: TEsRibbonItem);
    function LayoutIndexOf(AItem: TEsRibbonItem): Integer;
    property GalleryPopup: TEsPopupForm read FGalleryPopup;
    procedure Paint; override;
    procedure EraseBackground(DC: HDC); override;
    procedure Resize; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseLeave; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DblClick; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    procedure FontChanged(Sender: TObject); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure StructureChanged;
    function FindItemByCaption(const ACaption: string): TEsRibbonItem;
    { retângulo do item no layout atual (vazio se não estiver visível) }
    function ItemRect(AItem: TEsRibbonItem): TRect;
    { mostra/oculta as abas contextuais de um contexto (e opcionalmente ativa a 1ª) }
    procedure ShowContext(const AContextCaption: string; AVisible: Boolean;
      AActivate: Boolean = False);
    { barra de acesso rápido }
    function AddToQuickAccess(AItem: TEsRibbonItem): TEsRibbonItem;
    procedure RemoveFromQuickAccess(AItem: TEsRibbonItem);
    { KeyTips: entra/sai do modo (como pressionar Alt) e processa uma tecla;
      devolve True se a tecla foi consumida }
    procedure ShowKeyTips;
    procedure HideKeyTips;
    function ProcessKeyTip(AKey: Word): Boolean;
    property KeyTipMode: TEsRibbonKeyTipMode read FKeyTipMode;
  published
    property Tabs: TEsRibbonTabs read FTabs write SetTabs;
    property ActiveTabIndex: Integer read FActiveTab write SetActiveTab default 0;
    property Images: TCustomImageList read FImages write SetImages;
    property LargeImages: TCustomImageList read FLargeImages write SetLargeImages;
    property ApplicationButtonCaption: string read FAppButtonCaption write SetAppButtonCaption;
    property ApplicationButtonVisible: Boolean read FAppButtonVisible write SetAppButtonVisible default True;
    property ApplicationMenu: TPopupMenu read FAppMenu write SetAppMenu;
    property Minimized: Boolean read FMinimized write SetMinimized default False;
    property QuickAccessItems: TEsRibbonItems read FQuickAccess write SetQuickAccess;
    property QuickAccessPosition: TEsRibbonQATPosition read FQATPosition write SetQATPosition default qapTabBar;
    { Alt/F10 mostram as teclas de atalho (o formulário passa a ter KeyPreview) }
    property KeyTipsEnabled: Boolean read FKeyTipsEnabled write FKeyTipsEnabled default True;
    property OnGalleryClick: TEsRibbonGalleryEvent read FOnGalleryClick write FOnGalleryClick;
    property OnApplicationButtonClick: TNotifyEvent read FOnApplicationButtonClick write FOnApplicationButtonClick;
    property OnTabChanged: TNotifyEvent read FOnTabChanged write FOnTabChanged;
    property OnItemClick: TEsRibbonItemEvent read FOnItemClick write FOnItemClick;
    property Align default alTop;
    property Anchors;
    property BorderSpacing;
    property Enabled;
    property Font;
    property ParentFont;
    property ShowHint;
    property Visible;
  end;

resourcestring
  rsEsRibbonFile = 'Arquivo';
  rsEsRibbonAddQAT = 'Adicionar à barra de ferramentas de acesso rápido';
  rsEsRibbonRemoveQAT = 'Remover da barra de ferramentas de acesso rápido';
  rsEsRibbonQATBelow = 'Mostrar a barra de acesso rápido abaixo da faixa';
  rsEsRibbonQATAbove = 'Mostrar a barra de acesso rápido acima da faixa';
  rsEsRibbonMinimize = 'Minimizar a faixa de opções';

implementation

{ TEsRibbonGalleryEntry }

constructor TEsRibbonGalleryEntry.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FImageIndex := -1;
end;

procedure TEsRibbonGalleryEntry.Assign(Source: TPersistent);
begin
  if Source is TEsRibbonGalleryEntry then
  begin
    FCaption := TEsRibbonGalleryEntry(Source).FCaption;
    FImageIndex := TEsRibbonGalleryEntry(Source).FImageIndex;
    FColor := TEsRibbonGalleryEntry(Source).FColor;
    FHint := TEsRibbonGalleryEntry(Source).FHint;
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

procedure TEsRibbonGalleryEntry.SetCaption(const AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  Changed(False);
end;

procedure TEsRibbonGalleryEntry.SetImageIndex(AValue: TImageIndex);
begin
  if FImageIndex = AValue then Exit;
  FImageIndex := AValue;
  Changed(False);
end;

procedure TEsRibbonGalleryEntry.SetColor(AValue: TAlphaColor);
begin
  if FColor = AValue then Exit;
  FColor := AValue;
  Changed(False);
end;

{ TEsRibbonGalleryEntries }

function TEsRibbonGalleryEntries.GetItem(Index: Integer): TEsRibbonGalleryEntry;
begin
  Result := TEsRibbonGalleryEntry(inherited Items[Index]);
end;

function TEsRibbonGalleryEntries.Add: TEsRibbonGalleryEntry;
begin
  Result := TEsRibbonGalleryEntry(inherited Add);
end;

procedure TEsRibbonGalleryEntries.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if (Owner is TEsRibbonItem) and (TEsRibbonItem(Owner).Ribbon <> nil) then
    TEsRibbonItem(Owner).Ribbon.StructureChanged;
end;

{ TEsRibbonItem }

constructor TEsRibbonItem.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FImageIndex := -1;
  FEnabled := True;
  FVisible := True;
  FGalleryColumns := 4;
  FGalleryIndex := -1;
  FGallery := TEsRibbonGalleryEntries.Create(Self, TEsRibbonGalleryEntry);
end;

destructor TEsRibbonItem.Destroy;
var
  R: TEsRibbon;
begin
  R := Ribbon;
  if R <> nil then
  begin
    if R.FHotItem = Self then R.FHotItem := nil;
    if R.FPressedItem = Self then R.FPressedItem := nil;
    if R.FMenuItem = Self then R.FMenuItem := nil;
    if R.FGalleryPopupItem = Self then R.FGalleryPopupItem := nil;
    SetLength(R.FLayoutItems, 0);
  end;
  FGallery.Free;
  inherited Destroy;
end;

procedure TEsRibbonItem.SetGallery(AValue: TEsRibbonGalleryEntries);
begin
  FGallery.Assign(AValue);
end;

procedure TEsRibbonItem.SetGalleryColumns(AValue: Integer);
begin
  AValue := EnsureRange(AValue, 1, 20);
  if FGalleryColumns = AValue then Exit;
  FGalleryColumns := AValue;
  Changed(False);
end;

procedure TEsRibbonItem.SetGalleryIndex(AValue: Integer);
begin
  if AValue < -1 then AValue := -1;
  if FGalleryIndex = AValue then Exit;
  FGalleryIndex := AValue;
  Changed(False);
end;

procedure TEsRibbonItem.Assign(Source: TPersistent);
var
  S: TEsRibbonItem;
begin
  if Source is TEsRibbonItem then
  begin
    S := TEsRibbonItem(Source);
    FCaption := S.FCaption;
    FImageIndex := S.FImageIndex;
    FSize := S.FSize;
    FButtonStyle := S.FButtonStyle;
    FDown := S.FDown;
    FEnabled := S.FEnabled;
    FVisible := S.FVisible;
    FHint := S.FHint;
    FDropDownMenu := S.FDropDownMenu;
    FTag := S.FTag;
    FKeyTip := S.FKeyTip;
    FGallery.Assign(S.FGallery);
    FGalleryColumns := S.FGalleryColumns;
    FGalleryIndex := S.FGalleryIndex;
    FOnClick := S.FOnClick;
    FOnGalleryClick := S.FOnGalleryClick;
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

function TEsRibbonItem.GetDisplayName: string;
begin
  if FCaption <> '' then Result := FCaption else Result := inherited GetDisplayName;
end;

function TEsRibbonItem.Ribbon: TEsRibbon;
var
  G: TPersistent;
begin
  Result := nil;
  if Collection = nil then Exit;
  G := TEsRibbonItems(Collection).Owner;
  if G is TEsRibbonGroup then
    Result := TEsRibbonGroup(G).Ribbon
  else if G is TEsRibbon then
    Result := TEsRibbon(G); // barra de acesso rápido
end;

procedure TEsRibbonItem.SetCaption(const AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  Changed(False);
end;

procedure TEsRibbonItem.SetImageIndex(AValue: TImageIndex);
begin
  if FImageIndex = AValue then Exit;
  FImageIndex := AValue;
  Changed(False);
end;

procedure TEsRibbonItem.SetSize(AValue: TEsRibbonItemSize);
begin
  if FSize = AValue then Exit;
  FSize := AValue;
  Changed(False);
end;

procedure TEsRibbonItem.SetButtonStyle(AValue: TEsRibbonButtonStyle);
begin
  if FButtonStyle = AValue then Exit;
  FButtonStyle := AValue;
  Changed(False);
end;

procedure TEsRibbonItem.SetDown(AValue: Boolean);
begin
  if FDown = AValue then Exit;
  FDown := AValue;
  Changed(False);
end;

procedure TEsRibbonItem.SetEnabled(AValue: Boolean);
begin
  if FEnabled = AValue then Exit;
  FEnabled := AValue;
  Changed(False);
end;

procedure TEsRibbonItem.SetVisible(AValue: Boolean);
begin
  if FVisible = AValue then Exit;
  FVisible := AValue;
  Changed(False);
end;

procedure TEsRibbonItem.SetDropDownMenu(AValue: TPopupMenu);
var
  R: TEsRibbon;
begin
  if FDropDownMenu = AValue then Exit;
  FDropDownMenu := AValue;
  R := Ribbon;
  if (R <> nil) and (AValue <> nil) then
    AValue.FreeNotification(R);
end;

{ TEsRibbonItems }

function TEsRibbonItems.GetItem(Index: Integer): TEsRibbonItem;
begin
  Result := TEsRibbonItem(inherited Items[Index]);
end;

function TEsRibbonItems.Add: TEsRibbonItem;
begin
  Result := TEsRibbonItem(inherited Add);
end;

procedure TEsRibbonItems.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if (Owner is TEsRibbonGroup) and (TEsRibbonGroup(Owner).Ribbon <> nil) then
    TEsRibbonGroup(Owner).Ribbon.StructureChanged
  else if Owner is TEsRibbon then
    TEsRibbon(Owner).StructureChanged;
end;

{ TEsRibbonGroup }

constructor TEsRibbonGroup.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FVisible := True;
  FItems := TEsRibbonItems.Create(Self, TEsRibbonItem);
end;

destructor TEsRibbonGroup.Destroy;
var
  R: TEsRibbon;
begin
  R := Ribbon;
  if R <> nil then
  begin
    R.FHotItem := nil;
    R.FPressedItem := nil;
    SetLength(R.FLayoutItems, 0);
  end;
  FItems.Free;
  inherited Destroy;
end;

procedure TEsRibbonGroup.Assign(Source: TPersistent);
begin
  if Source is TEsRibbonGroup then
  begin
    FCaption := TEsRibbonGroup(Source).FCaption;
    FVisible := TEsRibbonGroup(Source).FVisible;
    FItems.Assign(TEsRibbonGroup(Source).FItems);
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

function TEsRibbonGroup.GetDisplayName: string;
begin
  if FCaption <> '' then Result := FCaption else Result := inherited GetDisplayName;
end;

function TEsRibbonGroup.Ribbon: TEsRibbon;
var
  T: TPersistent;
begin
  Result := nil;
  if Collection = nil then Exit;
  T := TEsRibbonGroups(Collection).Owner;
  if T is TEsRibbonTab then
    Result := TEsRibbonTab(T).Ribbon;
end;

procedure TEsRibbonGroup.SetCaption(const AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  Changed(False);
end;

procedure TEsRibbonGroup.SetVisible(AValue: Boolean);
begin
  if FVisible = AValue then Exit;
  FVisible := AValue;
  Changed(False);
end;

procedure TEsRibbonGroup.SetItems(AValue: TEsRibbonItems);
begin
  FItems.Assign(AValue);
end;

{ TEsRibbonGroups }

function TEsRibbonGroups.GetItem(Index: Integer): TEsRibbonGroup;
begin
  Result := TEsRibbonGroup(inherited Items[Index]);
end;

function TEsRibbonGroups.Add: TEsRibbonGroup;
begin
  Result := TEsRibbonGroup(inherited Add);
end;

procedure TEsRibbonGroups.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if (Owner is TEsRibbonTab) and (TEsRibbonTab(Owner).Ribbon <> nil) then
    TEsRibbonTab(Owner).Ribbon.StructureChanged;
end;

{ TEsRibbonTab }

constructor TEsRibbonTab.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FVisible := True;
  FGroups := TEsRibbonGroups.Create(Self, TEsRibbonGroup);
end;

destructor TEsRibbonTab.Destroy;
begin
  FGroups.Free;
  inherited Destroy;
end;

procedure TEsRibbonTab.Assign(Source: TPersistent);
begin
  if Source is TEsRibbonTab then
  begin
    FCaption := TEsRibbonTab(Source).FCaption;
    FVisible := TEsRibbonTab(Source).FVisible;
    FContextCaption := TEsRibbonTab(Source).FContextCaption;
    FContextColor := TEsRibbonTab(Source).FContextColor;
    FKeyTip := TEsRibbonTab(Source).FKeyTip;
    FGroups.Assign(TEsRibbonTab(Source).FGroups);
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

function TEsRibbonTab.GetDisplayName: string;
begin
  if FCaption <> '' then Result := FCaption else Result := inherited GetDisplayName;
end;

function TEsRibbonTab.Ribbon: TEsRibbon;
begin
  if (Collection <> nil) and (TEsRibbonTabs(Collection).Owner is TEsRibbon) then
    Result := TEsRibbon(TEsRibbonTabs(Collection).Owner)
  else
    Result := nil;
end;

procedure TEsRibbonTab.SetCaption(const AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  Changed(False);
end;

procedure TEsRibbonTab.SetVisible(AValue: Boolean);
begin
  if FVisible = AValue then Exit;
  FVisible := AValue;
  Changed(False);
end;

procedure TEsRibbonTab.SetContextCaption(const AValue: string);
begin
  if FContextCaption = AValue then Exit;
  FContextCaption := AValue;
  Changed(False);
end;

procedure TEsRibbonTab.SetContextColor(AValue: TAlphaColor);
begin
  if FContextColor = AValue then Exit;
  FContextColor := AValue;
  Changed(False);
end;

procedure TEsRibbonTab.SetGroups(AValue: TEsRibbonGroups);
begin
  FGroups.Assign(AValue);
end;

{ TEsRibbonTabs }

function TEsRibbonTabs.GetItem(Index: Integer): TEsRibbonTab;
begin
  Result := TEsRibbonTab(inherited Items[Index]);
end;

function TEsRibbonTabs.Add: TEsRibbonTab;
begin
  Result := TEsRibbonTab(inherited Add);
end;

procedure TEsRibbonTabs.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if Owner is TEsRibbon then
    TEsRibbon(Owner).StructureChanged;
end;

{ TEsRibbon }

type
  TFormHack = class(TCustomForm);

constructor TEsRibbon.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] + [csDoubleClicks];
  DoubleBuffered := True;
  FTabs := TEsRibbonTabs.Create(Self, TEsRibbonTab);
  FQuickAccess := TEsRibbonItems.Create(Self, TEsRibbonItem);
  FAppButtonCaption := rsEsRibbonFile;
  FAppButtonVisible := True;
  FKeyTipsEnabled := True;
  FHotTab := -1;
  FGalleryHot := -1;
  Align := alTop;
  EsThemes.RegisterClient(Self);
  SetInitialBounds(0, 0, 600, 120);
end;

destructor TEsRibbon.Destroy;
begin
  UnhookForm;
  EsThemes.UnregisterClient(Self);
  FLocked := True;
  FreeAndNil(FGalleryPopup);
  FreeAndNil(FTabs);
  FreeAndNil(FQuickAccess);
  inherited Destroy;
end;

procedure TEsRibbon.Loaded;
begin
  inherited Loaded;
  StructureChanged;
end;

procedure TEsRibbon.FontChanged(Sender: TObject);
begin
  inherited FontChanged(Sender);
  StructureChanged;
end;

procedure TEsRibbon.Notification(AComponent: TComponent; Operation: TOperation);

  procedure ClearMenus(AItems: TEsRibbonItems);
  var
    K: Integer;
  begin
    if AItems = nil then Exit;
    for K := 0 to AItems.Count - 1 do
      if AItems[K].FDropDownMenu = AComponent then
        AItems[K].FDropDownMenu := nil;
  end;

var
  I, J: Integer;
begin
  inherited Notification(AComponent, Operation);
  if Operation <> opRemove then Exit;
  if AComponent = FImages then FImages := nil;
  if AComponent = FLargeImages then FLargeImages := nil;
  if AComponent = FAppMenu then FAppMenu := nil;
  if AComponent = FHookedForm then FHookedForm := nil;
  if AComponent = FGalleryPopup then FGalleryPopup := nil;
  if AComponent is TPopupMenu then
  begin
    if FTabs <> nil then
      for I := 0 to FTabs.Count - 1 do
        for J := 0 to FTabs[I].Groups.Count - 1 do
          ClearMenus(FTabs[I].Groups[J].Items);
    ClearMenus(FQuickAccess);
  end;
end;

procedure TEsRibbon.SetTabs(AValue: TEsRibbonTabs);
begin
  FTabs.Assign(AValue);
end;

procedure TEsRibbon.SetQuickAccess(AValue: TEsRibbonItems);
begin
  FQuickAccess.Assign(AValue);
end;

procedure TEsRibbon.SetQATPosition(AValue: TEsRibbonQATPosition);
begin
  if FQATPosition = AValue then Exit;
  FQATPosition := AValue;
  StructureChanged;
end;

procedure TEsRibbon.SetActiveTab(AValue: Integer);
begin
  if FActiveTab = AValue then Exit;
  FActiveTab := AValue;
  StructureChanged;
  if not (csLoading in ComponentState) and Assigned(FOnTabChanged) then
    FOnTabChanged(Self);
end;

procedure TEsRibbon.SetImages(AValue: TCustomImageList);
begin
  if FImages = AValue then Exit;
  if FImages <> nil then FImages.RemoveFreeNotification(Self);
  FImages := AValue;
  if FImages <> nil then FImages.FreeNotification(Self);
  StructureChanged;
end;

procedure TEsRibbon.SetLargeImages(AValue: TCustomImageList);
begin
  if FLargeImages = AValue then Exit;
  if FLargeImages <> nil then FLargeImages.RemoveFreeNotification(Self);
  FLargeImages := AValue;
  if FLargeImages <> nil then FLargeImages.FreeNotification(Self);
  StructureChanged;
end;

procedure TEsRibbon.SetAppButtonCaption(const AValue: string);
begin
  if FAppButtonCaption = AValue then Exit;
  FAppButtonCaption := AValue;
  StructureChanged;
end;

procedure TEsRibbon.SetAppButtonVisible(AValue: Boolean);
begin
  if FAppButtonVisible = AValue then Exit;
  FAppButtonVisible := AValue;
  StructureChanged;
end;

procedure TEsRibbon.SetAppMenu(AValue: TPopupMenu);
begin
  if FAppMenu = AValue then Exit;
  if FAppMenu <> nil then FAppMenu.RemoveFreeNotification(Self);
  FAppMenu := AValue;
  if FAppMenu <> nil then FAppMenu.FreeNotification(Self);
end;

procedure TEsRibbon.SetMinimized(AValue: Boolean);
begin
  if FMinimized = AValue then Exit;
  FMinimized := AValue;
  UpdateHeight;
  StructureChanged;
end;

{ ---------- métricas ---------- }

function TEsRibbon.TabBarHeight: Integer;
begin
  Result := EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 12);
end;

function TEsRibbon.GroupCaptionHeight: Integer;
begin
  Result := EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 4);
end;

function TEsRibbon.ContextRowHeight: Integer;
var
  I: Integer;
begin
  Result := 0;
  if FTabs = nil then Exit;
  for I := 0 to FTabs.Count - 1 do
    if FTabs[I].Visible and (FTabs[I].ContextCaption <> '') then
      Exit(GroupCaptionHeight);
end;

function TEsRibbon.QATBelowHeight: Integer;
var
  I: Integer;
begin
  Result := 0;
  if (FQATPosition <> qapBelow) or (FQuickAccess = nil) then Exit;
  for I := 0 to FQuickAccess.Count - 1 do
    if FQuickAccess[I].Visible then
      Exit(TabBarHeight);
end;

function TEsRibbon.HeaderHeight: Integer;
begin
  Result := ContextRowHeight + TabBarHeight;
end;

function TEsRibbon.BodyHeight: Integer;
var
  LH: Integer;
begin
  if FLargeImages <> nil then LH := FLargeImages.Height else LH := EsScale(Self, 32);
  Result := Max(LH + 2 * EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 12),
    3 * (EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 8))) + GroupCaptionHeight + EsScale(Self, 6);
end;

procedure TEsRibbon.UpdateHeight;
begin
  if csLoading in ComponentState then Exit;
  if FMinimized then
    Height := HeaderHeight + 2 + QATBelowHeight
  else
    Height := HeaderHeight + BodyHeight + QATBelowHeight;
end;

procedure TEsRibbon.StructureChanged;
begin
  if FLocked or (csDestroying in ComponentState) then Exit;
  SetLength(FLayoutItems, 0);
  SetLength(FLayoutGroups, 0);
  FHotItem := nil;
  FPressedItem := nil;
  if not (csLoading in ComponentState) then
    UpdateHeight;
  Invalidate;
end;

function TEsRibbon.FindItemByCaption(const ACaption: string): TEsRibbonItem;
var
  I, J, K: Integer;
begin
  for I := 0 to FTabs.Count - 1 do
    for J := 0 to FTabs[I].Groups.Count - 1 do
      for K := 0 to FTabs[I].Groups[J].Items.Count - 1 do
        if SameText(FTabs[I].Groups[J].Items[K].Caption, ACaption) then
          Exit(FTabs[I].Groups[J].Items[K]);
  Result := nil;
end;

{ ---------- abas contextuais / acesso rápido ---------- }

procedure TEsRibbon.ShowContext(const AContextCaption: string; AVisible: Boolean;
  AActivate: Boolean);
var
  I, First: Integer;
begin
  First := -1;
  FLocked := True;
  try
    for I := 0 to FTabs.Count - 1 do
      if SameText(FTabs[I].ContextCaption, AContextCaption) then
      begin
        FTabs[I].FVisible := AVisible;
        if First < 0 then First := I;
      end;
  finally
    FLocked := False;
  end;
  if AVisible and AActivate and (First >= 0) then
    FActiveTab := First
  else if not AVisible and (FActiveTab >= 0) and (FActiveTab < FTabs.Count) and
          not FTabs[FActiveTab].Visible then
  begin
    FActiveTab := 0;
    for I := 0 to FTabs.Count - 1 do
      if FTabs[I].Visible then
      begin
        FActiveTab := I;
        Break;
      end;
  end;
  StructureChanged;
  if Assigned(FOnTabChanged) then FOnTabChanged(Self);
end;

function TEsRibbon.AddToQuickAccess(AItem: TEsRibbonItem): TEsRibbonItem;
var
  I: Integer;
begin
  Result := nil;
  if AItem = nil then Exit;
  for I := 0 to FQuickAccess.Count - 1 do
    if (FQuickAccess[I].Caption = AItem.Caption) and
       (FQuickAccess[I].ImageIndex = AItem.ImageIndex) then
      Exit(FQuickAccess[I]);
  Result := FQuickAccess.Add;
  Result.Assign(AItem);
  Result.FSize := risSmall;
end;

procedure TEsRibbon.RemoveFromQuickAccess(AItem: TEsRibbonItem);
var
  I: Integer;
begin
  if AItem = nil then Exit;
  if AItem.Collection = FQuickAccess then
  begin
    AItem.Free;
    Exit;
  end;
  for I := FQuickAccess.Count - 1 downto 0 do
    if (FQuickAccess[I].Caption = AItem.Caption) and
       (FQuickAccess[I].ImageIndex = AItem.ImageIndex) then
      FQuickAccess[I].Free;
end;

procedure TEsRibbon.CustomizeMenuClick(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    1: AddToQuickAccess(FMenuItem);
    2: RemoveFromQuickAccess(FMenuItem);
    3: QuickAccessPosition := qapBelow;
    4: QuickAccessPosition := qapTabBar;
    5: Minimized := not Minimized;
  end;
  FMenuItem := nil;
end;

{ ---------- layout ---------- }

procedure TEsRibbon.DoLayout;
var
  I, J, K, X, TBH, CRH, HH, YTop, YBot, LW, ColW, SmallH, SmallInCol, ColX, GStart,
    CapW, IW, LIW, LIH, NG, NI, QS, QY: Integer;
  Tab: TEsRibbonTab;
  G: TEsRibbonGroup;
  It: TEsRibbonItem;
  TW: Integer;

  procedure AddLayout(AItem: TEsRibbonItem; const AR: TRect; AQAT: Boolean);
  begin
    SetLength(FLayoutItems, NI + 1);
    FLayoutItems[NI].Item := AItem;
    FLayoutItems[NI].R := AR;
    FLayoutItems[NI].QAT := AQAT;
    Inc(NI);
  end;

begin
  TBH := TabBarHeight;
  CRH := ContextRowHeight;
  HH := CRH + TBH;
  NI := 0;
  NG := 0;
  SetLength(FLayoutItems, 0);
  SetLength(FLayoutGroups, 0);
  if FImages <> nil then IW := FImages.Width else IW := EsScale(Self, 16);
  // botão de aplicação
  X := EsScale(Self, 4);
  if FAppButtonVisible then
  begin
    FAppRect := Rect(X, CRH + 2, X + EsMeasureCanvas(Font).TextWidth(FAppButtonCaption) +
      EsScale(Self, 28), HH);
    X := FAppRect.Right + EsScale(Self, 4);
  end
  else
    FAppRect := Rect(0, 0, 0, 0);
  // barra de acesso rápido
  QS := Max(IW + EsScale(Self, 8), TBH - EsScale(Self, 6));
  if FQATPosition = qapTabBar then
    QY := CRH + (TBH - QS) div 2
  else
    QY := Height - QATBelowHeight + (QATBelowHeight - QS) div 2;
  if FQATPosition = qapBelow then
    K := EsScale(Self, 4)
  else
    K := X;
  for I := 0 to FQuickAccess.Count - 1 do
  begin
    It := FQuickAccess[I];
    if not It.Visible then Continue;
    LW := QS;
    if It.ButtonStyle = rbsDropDown then Inc(LW, EsScale(Self, 10));
    AddLayout(It, Rect(K, QY, K + LW, QY + QS), True);
    Inc(K, LW + 1);
  end;
  if (FQATPosition = qapTabBar) and (K > X) then
    X := K + EsScale(Self, 8);
  // abas
  SetLength(FTabRects, FTabs.Count);
  for I := 0 to FTabs.Count - 1 do
  begin
    if not FTabs[I].Visible then
    begin
      FTabRects[I] := Rect(0, 0, 0, 0);
      Continue;
    end;
    TW := EsMeasureCanvas(Font).TextWidth(FTabs[I].Caption) + EsScale(Self, 24);
    FTabRects[I] := Rect(X, CRH + 2, X + TW, HH);
    Inc(X, TW + 2);
  end;
  // a faixa de um contexto precisa caber a legenda do contexto: alarga a
  // última aba do grupo e desloca as seguintes
  I := 0;
  while I < FTabs.Count do
  begin
    if not FTabs[I].Visible or (FTabs[I].ContextCaption = '') then
    begin
      Inc(I);
      Continue;
    end;
    J := I;
    while (J + 1 < FTabs.Count) and FTabs[J + 1].Visible and
          SameText(FTabs[J + 1].ContextCaption, FTabs[I].ContextCaption) do
      Inc(J);
    with EsMeasureCanvas(Font) do
    begin
      Font.Style := [fsBold];
      LW := TextWidth(FTabs[I].ContextCaption) + EsScale(Self, 16) -
        (FTabRects[J].Right - FTabRects[I].Left);
      Font.Style := Self.Font.Style;
    end;
    if LW > 0 then
    begin
      Inc(FTabRects[J].Right, LW);
      for K := J + 1 to FTabs.Count - 1 do
        if FTabs[K].Visible then
          OffsetRect(FTabRects[K], LW, 0);
    end;
    I := J + 1;
  end;
  if FMinimized or (FActiveTab < 0) or (FActiveTab >= FTabs.Count) then Exit;
  Tab := FTabs[FActiveTab];
  YTop := HH + EsScale(Self, 3);
  YBot := HH + BodyHeight - GroupCaptionHeight - EsScale(Self, 3);
  SmallH := (YBot - YTop) div 3;
  if FLargeImages <> nil then
  begin
    LIW := FLargeImages.Width;
    LIH := FLargeImages.Height;
  end
  else
  begin
    LIW := EsScale(Self, 32);
    LIH := EsScale(Self, 32);
  end;
  X := EsScale(Self, 4);
  for J := 0 to Tab.Groups.Count - 1 do
  begin
    G := Tab.Groups[J];
    if not G.Visible then Continue;
    GStart := X;
    Inc(X, EsScale(Self, 3));
    SmallInCol := 0;
    ColX := X;
    ColW := 0;
    for K := 0 to G.Items.Count - 1 do
    begin
      It := G.Items[K];
      if not It.Visible then Continue;
      if (It.Size = risLarge) or (It.ButtonStyle = rbsGallery) then
      begin
        // fecha coluna de pequenos pendente
        if SmallInCol > 0 then
        begin
          X := ColX + ColW + 2;
          SmallInCol := 0;
          ColW := 0;
        end;
        if It.ButtonStyle = rbsGallery then
          LW := It.GalleryColumns * Max(LIW + EsScale(Self, 16), EsScale(Self, 56)) +
            EsScale(Self, 18)
        else
        begin
          LW := Max(LIW + EsScale(Self, 14), Min(EsScale(Self, 90),
            EsMeasureCanvas(Font).TextWidth(It.Caption) div 2 + EsScale(Self, 20)));
          if Pos(' ', It.Caption) = 0 then
            LW := Max(LW, EsMeasureCanvas(Font).TextWidth(It.Caption) + EsScale(Self, 12));
          if It.ButtonStyle = rbsDropDown then Inc(LW, 4);
        end;
        AddLayout(It, Rect(X, YTop, X + LW, YBot), False);
        Inc(X, LW + 2);
        ColX := X;
      end
      else
      begin
        if SmallInCol = 0 then
        begin
          ColX := X;
          ColW := 0;
        end;
        LW := IW + EsMeasureCanvas(Font).TextWidth(It.Caption) + EsScale(Self, 16);
        if It.ButtonStyle = rbsDropDown then Inc(LW, EsScale(Self, 12));
        ColW := Max(ColW, LW);
        AddLayout(It, Rect(ColX, YTop + SmallInCol * SmallH, ColX + LW,
          YTop + (SmallInCol + 1) * SmallH), False);
        Inc(SmallInCol);
        if SmallInCol = 3 then
        begin
          X := ColX + ColW + 2;
          SmallInCol := 0;
          ColW := 0;
        end
        else
          X := ColX + ColW + 2;
      end;
    end;
    CapW := EsMeasureCanvas(Font).TextWidth(G.Caption) + EsScale(Self, 16);
    if X - GStart < CapW then X := GStart + CapW;
    Inc(X, EsScale(Self, 3));
    SetLength(FLayoutGroups, NG + 1);
    FLayoutGroups[NG].Group := G;
    FLayoutGroups[NG].R := Rect(GStart, HH, X, HH + BodyHeight);
    Inc(NG);
    Inc(X, 1);
  end;
  // largura uniforme para pequenos na mesma coluna
  for I := 0 to NI - 1 do
    if not FLayoutItems[I].QAT and (FLayoutItems[I].Item.Size = risSmall) and
       (FLayoutItems[I].Item.ButtonStyle <> rbsGallery) then
      for J := 0 to NI - 1 do
        if (J <> I) and not FLayoutItems[J].QAT and (FLayoutItems[J].Item.Size = risSmall) and
           (FLayoutItems[J].R.Left = FLayoutItems[I].R.Left) and
           (FLayoutItems[J].R.Right > FLayoutItems[I].R.Right) then
          FLayoutItems[I].R.Right := FLayoutItems[J].R.Right;
end;

function TEsRibbon.ItemAt(X, Y: Integer): TEsRibbonItem;
var
  I: Integer;
begin
  for I := 0 to High(FLayoutItems) do
    if PtInRect(FLayoutItems[I].R, Point(X, Y)) then
      Exit(FLayoutItems[I].Item);
  Result := nil;
end;

function TEsRibbon.LayoutIndexOf(AItem: TEsRibbonItem): Integer;
var
  I: Integer;
begin
  for I := 0 to High(FLayoutItems) do
    if FLayoutItems[I].Item = AItem then
      Exit(I);
  Result := -1;
end;

function TEsRibbon.ItemRect(AItem: TEsRibbonItem): TRect;
var
  I: Integer;
begin
  if (Length(FLayoutItems) = 0) or (Length(FTabRects) <> FTabs.Count) then DoLayout;
  I := LayoutIndexOf(AItem);
  if I >= 0 then Result := FLayoutItems[I].R else Result := Rect(0, 0, 0, 0);
end;

function TEsRibbon.TabAt(X, Y: Integer): Integer;
var
  I: Integer;
begin
  for I := 0 to High(FTabRects) do
    if PtInRect(FTabRects[I], Point(X, Y)) then
      Exit(I);
  Result := -1;
end;

procedure TEsRibbon.EraseBackground(DC: HDC);
begin
end;

procedure TEsRibbon.Resize;
begin
  inherited Resize;
  SetLength(FLayoutItems, 0);
end;

{ ---------- galeria ---------- }

function TEsRibbon.GalleryButtonsRect(const R: TRect): TRect;
begin
  Result := Rect(R.Right - EsScale(Self, 16), R.Top, R.Right, R.Bottom);
end;

function TEsRibbon.GalleryCellSize(AItem: TEsRibbonItem; const R: TRect;
  out ACols, ARows: Integer): TSize;
begin
  ACols := Max(1, AItem.GalleryColumns);
  ARows := 1;
  Result.cx := Max(1, (GalleryButtonsRect(R).Left - R.Left - 2) div ACols);
  Result.cy := R.Bottom - R.Top - 2;
end;

function TEsRibbon.GalleryIndexAt(const L: TEsRibbonLayoutItem; X, Y: Integer): Integer;
var
  BR: TRect;
  Sz: TSize;
  Cols, Rows, Col, H3: Integer;
begin
  Result := -1;
  if not PtInRect(L.R, Point(X, Y)) then Exit;
  BR := GalleryButtonsRect(L.R);
  if X >= BR.Left then
  begin
    H3 := (BR.Bottom - BR.Top) div 3;
    if Y < BR.Top + H3 then Result := -2
    else if Y < BR.Top + 2 * H3 then Result := -3
    else Result := -4;
    Exit;
  end;
  Sz := GalleryCellSize(L.Item, L.R, Cols, Rows);
  Col := (X - L.R.Left - 1) div Max(1, Sz.cx);
  if (Col < 0) or (Col >= Cols) then Exit;
  Result := L.Item.FGalleryTop * Cols + Col;
  if Result >= L.Item.Gallery.Count then Result := -1;
end;

procedure TEsRibbon.PaintGalleryCell(ACanvas: TCanvas; AItem: TEsRibbonItem;
  AIndex: Integer; const R: TRect; ASelected, AHot: Boolean);
var
  T: TEsTheme;
  E: TEsRibbonGalleryEntry;
  IL: TCustomImageList;
  CapH, X, Y, S: Integer;
  SR: TRect;
begin
  T := EsSkinTheme;
  E := AItem.Gallery[AIndex];
  if ASelected then
  begin
    ACanvas.Brush.Color := EsColor(BlendOver(T.RibbonBody, FadeColor(T.Accent, 0.22)));
    ACanvas.FillRect(R);
  end
  else if AHot then
  begin
    ACanvas.Brush.Color := EsColor(BlendOver(T.RibbonBody, FadeColor(T.Accent, 0.10)));
    ACanvas.FillRect(R);
  end;
  if E.Caption <> '' then
    CapH := ACanvas.TextHeight('Ag') + 2
  else
    CapH := 0;
  if AlphaOf(E.Color) > 0 then
  begin
    // amostra de cor
    S := Min(R.Right - R.Left, R.Bottom - R.Top - CapH) - 10;
    X := (R.Left + R.Right - S) div 2;
    Y := R.Top + (R.Bottom - R.Top - CapH - S) div 2;
    SR := Rect(X, Y, X + S, Y + S);
    ACanvas.Brush.Color := EsColor(BlendOver(T.RibbonBody, E.Color));
    ACanvas.FillRect(SR);
    EsFrame(ACanvas, SR, EsColor(T.Border));
  end
  else
  begin
    IL := FLargeImages;
    if IL = nil then IL := FImages;
    if (IL <> nil) and (E.ImageIndex >= 0) and (E.ImageIndex < IL.Count) then
      IL.Draw(ACanvas, (R.Left + R.Right - IL.Width) div 2,
        R.Top + Max(2, (R.Bottom - R.Top - CapH - IL.Height) div 2), E.ImageIndex, AItem.Enabled);
  end;
  if CapH > 0 then
    EsDrawText(ACanvas, Rect(R.Left + 2, R.Bottom - CapH - 2, R.Right - 2, R.Bottom - 1),
      E.Caption, dhaCenter, dvaCenter, False, EsColor(T.Text), True);
  if ASelected then
    EsFrame(ACanvas, R, EsColor(T.Accent));
end;

procedure TEsRibbon.PaintGallery(const L: TEsRibbonLayoutItem);
var
  T: TEsTheme;
  It: TEsRibbonItem;
  Sz: TSize;
  Cols, Rows, I, Idx, H3, MaxTop: Integer;
  BR, CR, B1, B2, B3: TRect;
  Fg: TColor;
begin
  T := EsSkinTheme;
  It := L.Item;
  Canvas.Brush.Color := EsColor(T.Surface);
  Canvas.FillRect(L.R);
  EsFrame(Canvas, L.R, EsColor(T.Border));
  Sz := GalleryCellSize(It, L.R, Cols, Rows);
  MaxTop := Max(0, (It.Gallery.Count + Cols - 1) div Cols - 1);
  It.FGalleryTop := EnsureRange(It.FGalleryTop, 0, MaxTop);
  for I := 0 to Cols - 1 do
  begin
    Idx := It.FGalleryTop * Cols + I;
    if Idx >= It.Gallery.Count then Break;
    CR := Rect(L.R.Left + 1 + I * Sz.cx, L.R.Top + 1, L.R.Left + 1 + (I + 1) * Sz.cx,
      L.R.Bottom - 1);
    PaintGalleryCell(Canvas, It, Idx, CR, Idx = It.GalleryIndex,
      (It = FHotItem) and (Idx = FGalleryHot));
  end;
  // botões: rolar para cima, para baixo e "mais"
  BR := GalleryButtonsRect(L.R);
  H3 := (BR.Bottom - BR.Top) div 3;
  B1 := Rect(BR.Left, BR.Top, BR.Right, BR.Top + H3);
  B2 := Rect(BR.Left, BR.Top + H3, BR.Right, BR.Top + 2 * H3);
  B3 := Rect(BR.Left, BR.Top + 2 * H3, BR.Right, BR.Bottom);
  EsFillGradientV(Canvas, BR, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
  if (It = FHotItem) and (FGalleryHot <= -2) then
  begin
    Canvas.Brush.Color := EsColor(BlendOver(T.HeaderFace, FadeColor(T.Accent, 0.2)));
    case FGalleryHot of
      -2: Canvas.FillRect(B1);
      -3: Canvas.FillRect(B2);
    else
      Canvas.FillRect(B3);
    end;
  end;
  EsFrame(Canvas, BR, EsColor(T.Border));
  Fg := EsColor(T.Text);
  if It.FGalleryTop > 0 then
    EsDrawGlyph(Canvas, B1, sgArrowUp, Fg, 3)
  else
    EsDrawGlyph(Canvas, B1, sgArrowUp, EsColor(T.TextDisabled), 3);
  if It.FGalleryTop < MaxTop then
    EsDrawGlyph(Canvas, B2, sgArrowDown, Fg, 3)
  else
    EsDrawGlyph(Canvas, B2, sgArrowDown, EsColor(T.TextDisabled), 3);
  EsDrawGlyph(Canvas, B3, sgArrowDown, Fg, 3);
  Canvas.Pen.Color := Fg;
  Canvas.Line(B3.Left + 4, B3.Top + 3, B3.Right - 4, B3.Top + 3);
end;

procedure TEsRibbon.SelectGalleryEntry(AItem: TEsRibbonItem; AIndex: Integer);
begin
  if (AItem = nil) or (AIndex < 0) or (AIndex >= AItem.Gallery.Count) then Exit;
  AItem.GalleryIndex := AIndex;
  if Assigned(AItem.OnGalleryClick) then AItem.OnGalleryClick(Self, AItem, AIndex);
  if Assigned(FOnGalleryClick) then FOnGalleryClick(Self, AItem, AIndex);
end;

procedure TEsRibbon.ShowGalleryPopup(AItem: TEsRibbonItem; const R: TRect);
var
  Sz: TSize;
  Cols, Rows, NRows, W, H: Integer;
  LIH: Integer;
begin
  if (AItem = nil) or (AItem.Gallery.Count = 0) then Exit;
  if FGalleryPopup = nil then
  begin
    FGalleryPopup := TEsPopupForm.CreatePopup(Self);
    FGalleryPopup.OnPaint := @GalleryPopupPaint;
    FGalleryPopup.OnMouseUp := @GalleryPopupMouseUp;
    FGalleryPopup.OnMouseMove := @GalleryPopupMouseMove;
  end;
  FGalleryPopupItem := AItem;
  FGalleryHot := -1;
  if FLargeImages <> nil then LIH := FLargeImages.Height else LIH := EsScale(Self, 32);
  if R.Right > R.Left then
    Sz := GalleryCellSize(AItem, R, Cols, Rows)
  else
  begin
    Cols := AItem.GalleryColumns;
    Sz.cx := EsScale(Self, 64);
  end;
  Sz.cy := LIH + EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 14);
  NRows := (AItem.Gallery.Count + Cols - 1) div Cols;
  W := Cols * Sz.cx + 4;
  H := Min(NRows, 6) * Sz.cy + 4;
  FGalleryPopup.Font.Assign(Font);
  FGalleryPopup.Tag := Sz.cx or (Sz.cy shl 16);
  FGalleryPopup.PopupBelow(Self, W, H);
  FGalleryPopup.Left := ClientToScreen(Point(R.Left, 0)).X;
  FGalleryPopup.Top := ClientToScreen(Point(0, R.Top)).Y;
  FGalleryPopup.Invalidate;
end;

procedure TEsRibbon.GalleryPopupPaint(Sender: TObject);
var
  F: TEsPopupForm;
  CW, CH, Cols, I: Integer;
  CR: TRect;
begin
  F := TEsPopupForm(Sender);
  if FGalleryPopupItem = nil then Exit;
  CW := F.Tag and $FFFF;
  CH := (F.Tag shr 16) and $FFFF;
  Cols := Max(1, FGalleryPopupItem.GalleryColumns);
  F.Canvas.Font.Assign(Font);
  F.Canvas.Brush.Color := EsColor(EsSkinTheme.RibbonBody);
  F.Canvas.FillRect(Rect(0, 0, F.ClientWidth, F.ClientHeight));
  for I := 0 to FGalleryPopupItem.Gallery.Count - 1 do
  begin
    CR := Rect(2 + (I mod Cols) * CW, 2 + (I div Cols) * CH,
      2 + (I mod Cols + 1) * CW, 2 + (I div Cols + 1) * CH);
    PaintGalleryCell(F.Canvas, FGalleryPopupItem, I, CR,
      I = FGalleryPopupItem.GalleryIndex, I = FGalleryHot);
  end;
  EsFrame(F.Canvas, Rect(0, 0, F.ClientWidth, F.ClientHeight), EsColor(EsSkinTheme.BorderHot));
end;

procedure TEsRibbon.GalleryPopupMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  F: TEsPopupForm;
  CW, CH, Cols, Idx: Integer;
begin
  F := TEsPopupForm(Sender);
  if FGalleryPopupItem = nil then Exit;
  CW := Max(1, F.Tag and $FFFF);
  CH := Max(1, (F.Tag shr 16) and $FFFF);
  Cols := Max(1, FGalleryPopupItem.GalleryColumns);
  Idx := ((Y - 2) div CH) * Cols + (X - 2) div CW;
  if (X < 2) or ((X - 2) div CW >= Cols) or (Idx >= FGalleryPopupItem.Gallery.Count) then
    Idx := -1;
  if Idx <> FGalleryHot then
  begin
    FGalleryHot := Idx;
    F.Invalidate;
  end;
end;

procedure TEsRibbon.GalleryPopupMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  It: TEsRibbonItem;
  Idx: Integer;
begin
  GalleryPopupMouseMove(Sender, Shift, X, Y);
  It := FGalleryPopupItem;
  Idx := FGalleryHot;
  if (It = nil) or (Idx < 0) then Exit;
  FGalleryPopup.ClosePopup;
  // rola a galeria da faixa até a linha escolhida
  It.FGalleryTop := Idx div Max(1, It.GalleryColumns);
  SelectGalleryEntry(It, Idx);
  Invalidate;
end;

{ ---------- pintura ---------- }

procedure TEsRibbon.PaintItem(const L: TEsRibbonLayoutItem);
var
  T: TEsTheme;
  It: TEsRibbonItem;
  R, TR: TRect;
  Hot, Pressed: Boolean;
  Fg: TColor;
  X, Y, ImgW, ImgH: Integer;
  IL: TCustomImageList;
  Back: TAlphaColor;
begin
  T := EsSkinTheme;
  It := L.Item;
  R := L.R;
  if (It.ButtonStyle = rbsGallery) and not L.QAT then
  begin
    PaintGallery(L);
    Exit;
  end;
  if L.QAT and (FQATPosition = qapTabBar) then Back := T.RibbonTabBar else Back := T.RibbonBody;
  Hot := (It = FHotItem) and It.Enabled;
  Pressed := ((It = FPressedItem) and Hot) or It.Down;
  if Pressed then
  begin
    Canvas.Brush.Color := EsColor(BlendOver(Back, FadeColor(T.Accent, 0.30)));
    Canvas.FillRect(R);
    EsFrame(Canvas, R, EsColor(BlendOver(Back, FadeColor(T.Accent, 0.6))));
  end
  else if Hot then
  begin
    Canvas.Brush.Color := EsColor(BlendOver(Back, FadeColor(T.Accent, 0.14)));
    Canvas.FillRect(R);
    EsFrame(Canvas, R, EsColor(BlendOver(Back, FadeColor(T.Accent, 0.35))));
  end;
  if It.Enabled then Fg := EsColor(T.Text) else Fg := EsColor(T.TextDisabled);
  if L.QAT then
  begin
    // acesso rápido: só o ícone
    if L.QAT and (FQATPosition = qapTabBar) and It.Enabled then
      Fg := EsColor(T.RibbonTabBarText);
    TR := R;
    if It.ButtonStyle = rbsDropDown then
    begin
      Dec(TR.Right, EsScale(Self, 10));
      EsDrawGlyph(Canvas, Rect(TR.Right, R.Top, R.Right, R.Bottom), sgArrowDown, Fg, 3);
    end;
    if (FImages <> nil) and (It.ImageIndex >= 0) and (It.ImageIndex < FImages.Count) then
      FImages.Draw(Canvas, (TR.Left + TR.Right - FImages.Width) div 2,
        (TR.Top + TR.Bottom - FImages.Height) div 2, It.ImageIndex, It.Enabled)
    else
      EsDrawText(Canvas, TR, Copy(It.Caption, 1, 1), dhaCenter, dvaCenter, False, Fg);
    Exit;
  end;
  if It.Size = risLarge then
  begin
    IL := FLargeImages;
    if IL = nil then IL := FImages;
    if IL <> nil then
    begin
      ImgW := IL.Width;
      ImgH := IL.Height;
    end
    else
    begin
      ImgW := EsScale(Self, 32);
      ImgH := EsScale(Self, 32);
    end;
    X := (R.Left + R.Right - ImgW) div 2;
    Y := R.Top + EsScale(Self, 3);
    if (IL <> nil) and (It.ImageIndex >= 0) and (It.ImageIndex < IL.Count) then
      IL.Draw(Canvas, X, Y, It.ImageIndex, It.Enabled)
    else
    begin
      // marcador quando não há imagem
      Canvas.Brush.Color := EsColor(FadeColor(T.Accent, 0.25));
      Canvas.FillRect(Rect(X + 4, Y + 4, X + ImgW - 4, Y + ImgH - 4));
    end;
    TR := Rect(R.Left + 2, Y + ImgH + 2, R.Right - 2, R.Bottom - 2);
    if It.ButtonStyle = rbsDropDown then Dec(TR.Bottom, EsScale(Self, 8));
    EsDrawText(Canvas, TR, It.Caption, dhaCenter, dvaLeading, True, Fg);
    if It.ButtonStyle = rbsDropDown then
      EsDrawGlyph(Canvas, Rect(R.Left, R.Bottom - EsScale(Self, 12), R.Right, R.Bottom),
        sgArrowDown, Fg, 3);
  end
  else
  begin
    X := R.Left + EsScale(Self, 4);
    if FImages <> nil then
    begin
      if (It.ImageIndex >= 0) and (It.ImageIndex < FImages.Count) then
        FImages.Draw(Canvas, X, (R.Top + R.Bottom - FImages.Height) div 2,
          It.ImageIndex, It.Enabled);
      Inc(X, FImages.Width + 4);
    end
    else
      Inc(X, EsScale(Self, 20));
    TR := Rect(X, R.Top, R.Right - 2, R.Bottom);
    if It.ButtonStyle = rbsDropDown then
    begin
      Dec(TR.Right, EsScale(Self, 12));
      EsDrawGlyph(Canvas, Rect(TR.Right, R.Top, R.Right, R.Bottom), sgArrowDown, Fg, 3);
    end;
    EsDrawText(Canvas, TR, It.Caption, dhaLeading, dvaCenter, False, Fg, True);
  end;
end;

procedure TEsRibbon.Paint;
var
  T: TEsTheme;
  I, J, TBH, CRH, HH, CapH, QH: Integer;
  R, CR: TRect;
  TabFg: TColor;
  CC: TAlphaColor;
begin
  T := EsSkinTheme;
  if not (csDesigning in ComponentState) and FKeyTipsEnabled and (FHookedForm = nil) then
    HookForm;
  if (Length(FLayoutItems) = 0) or (Length(FTabRects) <> FTabs.Count) then DoLayout;
  Canvas.Font.Assign(Font);
  TBH := TabBarHeight;
  CRH := ContextRowHeight;
  HH := CRH + TBH;
  // barra de abas (+ linha das abas contextuais)
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := EsColor(T.RibbonTabBar);
  Canvas.FillRect(Rect(0, 0, Width, HH));
  if CRH > 0 then
  begin
    I := 0;
    while I < FTabs.Count do
    begin
      if not FTabs[I].Visible or (FTabs[I].ContextCaption = '') then
      begin
        Inc(I);
        Continue;
      end;
      J := I;
      while (J + 1 < FTabs.Count) and FTabs[J + 1].Visible and
            SameText(FTabs[J + 1].ContextCaption, FTabs[I].ContextCaption) do
        Inc(J);
      CC := FTabs[I].ContextColor;
      if AlphaOf(CC) = 0 then CC := T.Accent;
      CR := Rect(FTabRects[I].Left, 0, FTabRects[J].Right, HH);
      Canvas.Brush.Color := EsColor(BlendOver(T.RibbonTabBar, FadeColor(CC, 0.22)));
      Canvas.FillRect(CR);
      Canvas.Brush.Color := EsColor(CC);
      Canvas.FillRect(Rect(CR.Left, 0, CR.Right, EsScale(Self, 3)));
      Canvas.Font.Style := [fsBold];
      EsDrawText(Canvas, Rect(CR.Left + 4, 2, CR.Right - 4, CRH + 1),
        FTabs[I].ContextCaption, dhaCenter, dvaCenter, False, EsColor(DarkenColor(CC, 0.15)), True);
      Canvas.Font.Style := [];
      I := J + 1;
    end;
  end;
  // botão de aplicação
  if FAppButtonVisible then
  begin
    if FAppHot then
      Canvas.Brush.Color := EsColor(LightenColor(T.Accent, 0.15))
    else
      Canvas.Brush.Color := EsColor(T.Accent);
    Canvas.FillRect(FAppRect);
    EsDrawText(Canvas, FAppRect, FAppButtonCaption, dhaCenter, dvaCenter, False,
      EsColor(T.AccentText));
  end;
  for I := 0 to High(FTabRects) do
  begin
    R := FTabRects[I];
    if R.Right <= R.Left then Continue;
    TabFg := EsColor(T.RibbonTabBarText);
    if (I = FActiveTab) and not FMinimized then
    begin
      Canvas.Brush.Color := EsColor(T.RibbonBody);
      Canvas.FillRect(Rect(R.Left, R.Top, R.Right, R.Bottom + 1));
      Canvas.Pen.Color := EsColor(T.Border);
      Canvas.Line(R.Left, R.Bottom, R.Left, R.Top);
      Canvas.Line(R.Left, R.Top, R.Right - 1, R.Top);
      Canvas.Line(R.Right - 1, R.Top, R.Right - 1, R.Bottom);
      TabFg := EsColor(T.Text);
    end
    else if I = FHotTab then
    begin
      Canvas.Brush.Color := EsColor(BlendOver(T.RibbonTabBar, FadeColor(T.Hover, 1)));
      Canvas.FillRect(R);
    end;
    if FTabs[I].ContextCaption <> '' then
    begin
      CC := FTabs[I].ContextColor;
      if AlphaOf(CC) = 0 then CC := T.Accent;
      TabFg := EsColor(DarkenColor(CC, 0.2));
    end;
    EsDrawText(Canvas, R, FTabs[I].Caption, dhaCenter, dvaCenter, False, TabFg);
    if (I = FActiveTab) and not FMinimized then
    begin
      CC := T.Accent;
      if (FTabs[I].ContextCaption <> '') and (AlphaOf(FTabs[I].ContextColor) > 0) then
        CC := FTabs[I].ContextColor;
      Canvas.Brush.Color := EsColor(CC);
      Canvas.FillRect(Rect(R.Left + 8, R.Bottom - 3, R.Right - 8, R.Bottom - 1));
    end;
  end;
  QH := QATBelowHeight;
  if QH > 0 then
  begin
    Canvas.Brush.Color := EsColor(T.RibbonTabBar);
    Canvas.FillRect(Rect(0, Height - QH, Width, Height));
    Canvas.Pen.Color := EsColor(T.Border);
    Canvas.Line(0, Height - QH, Width, Height - QH);
  end;
  if not FMinimized then
  begin
    // corpo
    Canvas.Brush.Color := EsColor(T.RibbonBody);
    Canvas.FillRect(Rect(0, HH, Width, HH + BodyHeight));
    Canvas.Pen.Color := EsColor(T.Border);
    Canvas.Line(0, HH, Width, HH);
    if (FActiveTab >= 0) and (FActiveTab < Length(FTabRects)) then
    begin
      Canvas.Pen.Color := EsColor(T.RibbonBody);
      Canvas.Line(FTabRects[FActiveTab].Left + 1, HH, FTabRects[FActiveTab].Right - 1, HH);
    end;
    CapH := GroupCaptionHeight;
    for I := 0 to High(FLayoutGroups) do
    begin
      R := FLayoutGroups[I].R;
      EsDrawText(Canvas, Rect(R.Left, R.Bottom - CapH - 2, R.Right, R.Bottom - 2),
        FLayoutGroups[I].Group.Caption, dhaCenter, dvaCenter, False, EsColor(T.TextDim), True);
      Canvas.Pen.Color := EsColor(T.Border);
      Canvas.Line(R.Right, R.Top + 6, R.Right, R.Bottom - 6);
    end;
  end;
  Canvas.Pen.Color := EsColor(T.Border);
  Canvas.Line(0, Height - 1, Width, Height - 1);
  for I := 0 to High(FLayoutItems) do
    PaintItem(FLayoutItems[I]);
  if FKeyTipMode <> ktmNone then
    PaintKeyTips;
end;

{ ---------- mouse ---------- }

procedure TEsRibbon.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  It: TEsRibbonItem;
  Tb, GH, L: Integer;
  AH: Boolean;
begin
  inherited MouseMove(Shift, X, Y);
  It := ItemAt(X, Y);
  Tb := TabAt(X, Y);
  AH := PtInRect(FAppRect, Point(X, Y));
  GH := -1;
  if (It <> nil) and (It.ButtonStyle = rbsGallery) then
  begin
    L := LayoutIndexOf(It);
    if (L >= 0) and not FLayoutItems[L].QAT then
      GH := GalleryIndexAt(FLayoutItems[L], X, Y);
  end;
  if (It <> FHotItem) or (Tb <> FHotTab) or (AH <> FAppHot) or (GH <> FGalleryHot) then
  begin
    FHotItem := It;
    FHotTab := Tb;
    FAppHot := AH;
    FGalleryHot := GH;
    if (It <> nil) and (GH >= 0) and (It.Gallery[GH].Hint <> '') then
      Hint := It.Gallery[GH].Hint
    else if It <> nil then
      Hint := It.Hint
    else
      Hint := '';
    Invalidate;
  end;
end;

procedure TEsRibbon.MouseLeave;
begin
  FHotItem := nil;
  FHotTab := -1;
  FAppHot := False;
  FGalleryHot := -1;
  Invalidate;
  inherited MouseLeave;
end;

procedure TEsRibbon.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Tb: Integer;
  P: TPoint;
  It: TEsRibbonItem;
  MI: TMenuItem;

  procedure AddMI(const ACaption: string; ATag: Integer; AChecked: Boolean = False);
  begin
    MI := TMenuItem.Create(FCustomizeMenu);
    MI.Caption := ACaption;
    MI.Tag := ATag;
    MI.Checked := AChecked;
    MI.OnClick := @CustomizeMenuClick;
    FCustomizeMenu.Items.Add(MI);
  end;

begin
  inherited MouseDown(Button, Shift, X, Y);
  if FKeyTipMode <> ktmNone then HideKeyTips;
  if Button = mbRight then
  begin
    if csDesigning in ComponentState then Exit;
    // menu de personalização (acesso rápido / minimizar)
    It := ItemAt(X, Y);
    if FCustomizeMenu = nil then
      FCustomizeMenu := TPopupMenu.Create(Self);
    FCustomizeMenu.Items.Clear;
    FMenuItem := It;
    if It <> nil then
    begin
      if It.Collection = FQuickAccess then
        AddMI(rsEsRibbonRemoveQAT, 2)
      else
        AddMI(rsEsRibbonAddQAT, 1);
      AddMI('-', 0);
    end;
    if FQATPosition = qapTabBar then
      AddMI(rsEsRibbonQATBelow, 3)
    else
      AddMI(rsEsRibbonQATAbove, 4);
    AddMI(rsEsRibbonMinimize, 5, FMinimized);
    P := ClientToScreen(Point(X, Y));
    FCustomizeMenu.Popup(P.X, P.Y);
    Exit;
  end;
  if Button <> mbLeft then Exit;
  if PtInRect(FAppRect, Point(X, Y)) and not (csDesigning in ComponentState) then
  begin
    if Assigned(FOnApplicationButtonClick) then
      FOnApplicationButtonClick(Self);
    if FAppMenu <> nil then
    begin
      P := ClientToScreen(Point(FAppRect.Left, FAppRect.Bottom));
      FAppMenu.Popup(P.X, P.Y);
    end;
    Exit;
  end;
  Tb := TabAt(X, Y);
  if Tb >= 0 then
  begin
    ActiveTabIndex := Tb;
    Exit;
  end;
  if csDesigning in ComponentState then Exit;
  FPressedItem := ItemAt(X, Y);
  if (FPressedItem <> nil) and not FPressedItem.Enabled then
    FPressedItem := nil;
  Invalidate;
end;

procedure TEsRibbon.ExecuteItem(AItem: TEsRibbonItem);
var
  L: Integer;
  P: TPoint;
begin
  if (AItem = nil) or not AItem.Enabled then Exit;
  L := LayoutIndexOf(AItem);
  case AItem.ButtonStyle of
    rbsCheck: AItem.Down := not AItem.Down;
    rbsDropDown:
      if (AItem.DropDownMenu <> nil) and (L >= 0) then
      begin
        P := ClientToScreen(Point(FLayoutItems[L].R.Left, FLayoutItems[L].R.Bottom));
        AItem.DropDownMenu.Popup(P.X, P.Y);
      end;
    rbsGallery:
      begin
        if L >= 0 then
          ShowGalleryPopup(AItem, FLayoutItems[L].R)
        else
          ShowGalleryPopup(AItem, Rect(0, Height, 0, Height));
        Exit;
      end;
  end;
  if Assigned(AItem.OnClick) then AItem.OnClick(AItem);
  if Assigned(FOnItemClick) then FOnItemClick(Self, AItem);
end;

procedure TEsRibbon.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  It: TEsRibbonItem;
  L, G, Cols, Rows: Integer;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if Button <> mbLeft then Exit;
  It := FPressedItem;
  FPressedItem := nil;
  Invalidate;
  if (It = nil) or (ItemAt(X, Y) <> It) then Exit;
  L := LayoutIndexOf(It);
  if (It.ButtonStyle = rbsGallery) and (L >= 0) and not FLayoutItems[L].QAT then
  begin
    G := GalleryIndexAt(FLayoutItems[L], X, Y);
    GalleryCellSize(It, FLayoutItems[L].R, Cols, Rows);
    case G of
      -1: ;
      -2: It.FGalleryTop := Max(0, It.FGalleryTop - 1);
      -3: It.FGalleryTop := Min((It.Gallery.Count + Cols - 1) div Cols - 1, It.FGalleryTop + 1);
      -4: ShowGalleryPopup(It, FLayoutItems[L].R);
    else
      SelectGalleryEntry(It, G);
    end;
    Invalidate;
    Exit;
  end;
  ExecuteItem(It);
end;

procedure TEsRibbon.DblClick;
var
  P: TPoint;
begin
  inherited DblClick;
  P := ScreenToClient(Mouse.CursorPos);
  if TabAt(P.X, P.Y) >= 0 then
    Minimized := not Minimized;
end;

{ ---------- KeyTips ---------- }

procedure TEsRibbon.HookForm;
var
  F: TCustomForm;
begin
  if FHookedForm <> nil then Exit;
  F := GetParentForm(Self);
  if F = nil then Exit;
  FHookedForm := F;
  F.FreeNotification(Self);
  FOldFormKeyDown := TFormHack(F).OnKeyDown;
  FOldFormKeyUp := TFormHack(F).OnKeyUp;
  TFormHack(F).OnKeyDown := @FormKeyDown;
  TFormHack(F).OnKeyUp := @FormKeyUp;
  TFormHack(F).KeyPreview := True;
end;

procedure TEsRibbon.UnhookForm;
var
  KD, Mine: TKeyEvent;
begin
  if FHookedForm = nil then Exit;
  KD := TFormHack(FHookedForm).OnKeyDown;
  Mine := @FormKeyDown;
  if (TMethod(KD).Code = TMethod(Mine).Code) and (TMethod(KD).Data = TMethod(Mine).Data) then
  begin
    TFormHack(FHookedForm).OnKeyDown := FOldFormKeyDown;
    TFormHack(FHookedForm).OnKeyUp := FOldFormKeyUp;
  end;
  FHookedForm.RemoveFreeNotification(Self);
  FHookedForm := nil;
end;

procedure TEsRibbon.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if FKeyTipMode <> ktmNone then
  begin
    if ProcessKeyTip(Key) then
    begin
      Key := 0;
      Exit;
    end;
  end
  else if Key = VK_MENU then
    FAltDown := Shift - [ssAlt] = []
  else
  begin
    FAltDown := False;
    if (Key = VK_F10) and (Shift = []) and FKeyTipsEnabled and Visible then
    begin
      ShowKeyTips;
      Key := 0;
      Exit;
    end;
  end;
  if Assigned(FOldFormKeyDown) then FOldFormKeyDown(Sender, Key, Shift);
end;

procedure TEsRibbon.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_MENU) and FAltDown and FKeyTipsEnabled and Visible then
  begin
    FAltDown := False;
    if FKeyTipMode = ktmNone then ShowKeyTips else HideKeyTips;
    Key := 0;
    Exit;
  end;
  if Assigned(FOldFormKeyUp) then FOldFormKeyUp(Sender, Key, Shift);
end;

function KeyTipFromCaption(const ACaption: string; ALen: Integer): string;
var
  I: Integer;
  C: Char;
begin
  Result := '';
  for I := 1 to Length(ACaption) do
  begin
    C := UpCase(ACaption[I]);
    if CharInSet(C, ['A'..'Z', '0'..'9']) then
    begin
      Result := Result + C;
      if Length(Result) >= ALen then Exit;
    end;
  end;
  if Result = '' then Result := 'X';
end;

procedure TEsRibbon.BuildKeyTips;
var
  N, I, J, Dup, P: Integer;
  Caps: array of string;     // legenda (para teclas automáticas)
  Manual: array of Boolean;  // tecla definida pelo usuário
  Used: TStringList;
  C1, K: string;
  Clash: Boolean;

  procedure AddTip(const AKey, ACaption: string; ACode: Integer; AManual: Boolean);
  begin
    SetLength(FKeyTipKeys, N + 1);
    SetLength(FKeyTipCodes, N + 1);
    SetLength(Caps, N + 1);
    SetLength(Manual, N + 1);
    FKeyTipKeys[N] := UpperCase(AKey);
    FKeyTipCodes[N] := ACode;
    Caps[N] := KeyTipFromCaption(ACaption, 64);
    Manual[N] := AManual;
    Inc(N);
  end;

begin
  N := 0;
  SetLength(FKeyTipKeys, 0);
  SetLength(FKeyTipCodes, 0);
  if (Length(FLayoutItems) = 0) or (Length(FTabRects) <> FTabs.Count) then DoLayout;
  if FKeyTipMode = ktmTabs then
  begin
    if FAppButtonVisible then AddTip('F', '', -1, True);
    Dup := 0;
    for I := 0 to High(FLayoutItems) do
      if FLayoutItems[I].QAT then
      begin
        Inc(Dup);
        AddTip(IntToStr(Dup), '', 1000 + I, True);
      end;
    for I := 0 to FTabs.Count - 1 do
      if FTabs[I].Visible then
        AddTip(FTabs[I].KeyTip, FTabs[I].Caption, I, FTabs[I].KeyTip <> '');
  end
  else if FKeyTipMode = ktmItems then
    for J := 0 to High(FLayoutItems) do
      if not FLayoutItems[J].QAT then
        AddTip(FLayoutItems[J].Item.KeyTip, FLayoutItems[J].Item.Caption, J,
          FLayoutItems[J].Item.KeyTip <> '');
  // teclas automáticas: 1 letra quando a inicial é única; se várias legendas
  // começam com a mesma letra, todas recebem 2 letras (inicial + outra letra
  // da legenda), para que nenhuma tecla seja prefixo de outra
  Used := TStringList.Create;
  try
    Used.Sorted := True;
    Used.Duplicates := dupIgnore;
    for I := 0 to N - 1 do
      if Manual[I] then Used.Add(FKeyTipKeys[I]);
    for I := 0 to N - 1 do
    begin
      if Manual[I] then Continue;
      C1 := Copy(Caps[I], 1, 1);
      Clash := Used.IndexOf(C1) >= 0;
      if not Clash then
        for J := 0 to N - 1 do
          if (J <> I) and not Manual[J] and (Copy(Caps[J], 1, 1) = C1) then
            Clash := True;
      if not Clash then
      begin
        FKeyTipKeys[I] := C1;
        Used.Add(C1);
        Continue;
      end;
      K := '';
      for P := 2 to Length(Caps[I]) do
        if Used.IndexOf(C1 + Caps[I][P]) < 0 then
        begin
          K := C1 + Caps[I][P];
          Break;
        end;
      if K = '' then
      begin
        P := 1;
        while Used.IndexOf(C1 + IntToStr(P)) >= 0 do Inc(P);
        K := C1 + IntToStr(P);
      end;
      FKeyTipKeys[I] := K;
      Used.Add(K);
    end;
  finally
    Used.Free;
  end;
end;

procedure TEsRibbon.ShowKeyTips;
begin
  if csDesigning in ComponentState then Exit;
  FKeyTipMode := ktmTabs;
  FKeyTipPrefix := '';
  BuildKeyTips;
  Invalidate;
end;

procedure TEsRibbon.HideKeyTips;
begin
  if FKeyTipMode = ktmNone then Exit;
  FKeyTipMode := ktmNone;
  FKeyTipPrefix := '';
  SetLength(FKeyTipKeys, 0);
  SetLength(FKeyTipCodes, 0);
  Invalidate;
end;

function TEsRibbon.KeyTipRect(AIndex: Integer): TRect;
var
  C: Integer;
begin
  C := FKeyTipCodes[AIndex];
  if FKeyTipMode = ktmItems then
    Result := FLayoutItems[C].R
  else if C = -1 then
    Result := FAppRect
  else if C >= 1000 then
    Result := FLayoutItems[C - 1000].R
  else
    Result := FTabRects[C];
end;

procedure TEsRibbon.PaintKeyTips;
var
  I, W, H, CX, Y: Integer;
  R, B: TRect;
  T: TEsTheme;
begin
  T := EsSkinTheme;
  Canvas.Font.Assign(Font);
  Canvas.Font.Size := Max(7, Font.Size - 1);
  Canvas.Font.Style := [fsBold];
  H := Canvas.TextHeight('W') + 4;
  for I := 0 to High(FKeyTipKeys) do
  begin
    if Copy(FKeyTipKeys[I], 1, Length(FKeyTipPrefix)) <> FKeyTipPrefix then Continue;
    R := KeyTipRect(I);
    W := Max(H, Canvas.TextWidth(FKeyTipKeys[I]) + 8);
    CX := (R.Left + R.Right) div 2;
    if (FKeyTipMode = ktmItems) and (FLayoutItems[FKeyTipCodes[I]].Item.Size = risSmall) and
       (FLayoutItems[FKeyTipCodes[I]].Item.ButtonStyle <> rbsGallery) then
    begin
      CX := R.Left + W div 2 + 2;
      Y := R.Bottom - H div 2 - 2;
    end
    else
      Y := R.Bottom - H div 2;
    B := Rect(CX - W div 2, Y - H div 2, CX - W div 2 + W, Y - H div 2 + H);
    if B.Bottom > Height - 1 then OffsetRect(B, 0, Height - 1 - B.Bottom);
    Canvas.Brush.Color := EsColor(T.Text);
    Canvas.FillRect(B);
    EsFrame(Canvas, B, EsColor(T.Surface));
    EsDrawText(Canvas, B, FKeyTipKeys[I], dhaCenter, dvaCenter, False, EsColor(T.Surface));
  end;
  Canvas.Font.Assign(Font);
end;

function TEsRibbon.ProcessKeyTip(AKey: Word): Boolean;
var
  Ch: string;
  I, Matches, Hit, C: Integer;
  P: TPoint;
  It: TEsRibbonItem;
begin
  Result := False;
  if FKeyTipMode = ktmNone then Exit;
  Result := True;
  case AKey of
    VK_ESCAPE:
      begin
        if (FKeyTipMode = ktmItems) then
        begin
          FKeyTipMode := ktmTabs;
          FKeyTipPrefix := '';
          BuildKeyTips;
          Invalidate;
        end
        else
          HideKeyTips;
        Exit;
      end;
    VK_MENU, VK_SHIFT, VK_CONTROL:
      Exit;
    Ord('A')..Ord('Z'), Ord('0')..Ord('9'):
      Ch := Chr(AKey);
    VK_NUMPAD0..VK_NUMPAD9:
      Ch := Chr(Ord('0') + AKey - VK_NUMPAD0);
  else
    HideKeyTips;
    Exit(False);
  end;
  FKeyTipPrefix := FKeyTipPrefix + Ch;
  Matches := 0;
  Hit := -1;
  for I := 0 to High(FKeyTipKeys) do
    if Copy(FKeyTipKeys[I], 1, Length(FKeyTipPrefix)) = FKeyTipPrefix then
    begin
      Inc(Matches);
      if FKeyTipKeys[I] = FKeyTipPrefix then Hit := I;
    end;
  if Matches = 0 then
  begin
    // tecla sem correspondência: recomeça a digitação
    FKeyTipPrefix := '';
    Invalidate;
    Exit;
  end;
  if (Hit < 0) or (Matches > 1) then
  begin
    Invalidate;
    Exit;
  end;
  C := FKeyTipCodes[Hit];
  if FKeyTipMode = ktmTabs then
  begin
    if C = -1 then
    begin
      HideKeyTips;
      if Assigned(FOnApplicationButtonClick) then FOnApplicationButtonClick(Self);
      if FAppMenu <> nil then
      begin
        P := ClientToScreen(Point(FAppRect.Left, FAppRect.Bottom));
        FAppMenu.Popup(P.X, P.Y);
      end;
    end
    else if C >= 1000 then
    begin
      It := FLayoutItems[C - 1000].Item;
      HideKeyTips;
      ExecuteItem(It);
    end
    else
    begin
      ActiveTabIndex := C;
      if FMinimized then Minimized := False;
      DoLayout;
      FKeyTipMode := ktmItems;
      FKeyTipPrefix := '';
      BuildKeyTips;
      Invalidate;
    end;
  end
  else
  begin
    It := FLayoutItems[C].Item;
    HideKeyTips;
    ExecuteItem(It);
  end;
end;

end.
