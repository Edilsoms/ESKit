{
 *****************************************************************************
  ESKit - esnavbar.pas
  TEsNavBar - barra de navegação lateral no estilo DevExpress dxNavBar
  (visão "Explorer Bar"): grupos recolhíveis com itens, ícones, item
  selecionado, hover e rolagem.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsNavBar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Types, Math, Controls, Graphics, StdCtrls, Forms, ImgList,
  LCLType, LCLIntf, EsGraphics, EsTheme, EsSkins;

type
  TEsNavBar = class;
  TEsNavBarGroup = class;

  { TEsNavBarItem }

  TEsNavBarItem = class(TCollectionItem)
  private
    FCaption: string;
    FImageIndex: TImageIndex;
    FEnabled: Boolean;
    FVisible: Boolean;
    FHint: string;
    FTag: PtrInt;
    FOnClick: TNotifyEvent;
    procedure SetCaption(const AValue: string);
    procedure SetImageIndex(AValue: TImageIndex);
    procedure SetEnabled(AValue: Boolean);
    procedure SetVisible(AValue: Boolean);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(ACollection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    function Group: TEsNavBarGroup;
  published
    property Caption: string read FCaption write SetCaption;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Hint: string read FHint write FHint;
    property Tag: PtrInt read FTag write FTag default 0;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
  end;

  { TEsNavBarItems }

  TEsNavBarItems = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TEsNavBarItem;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    function Add: TEsNavBarItem;
    property Items[Index: Integer]: TEsNavBarItem read GetItem; default;
  end;

  { TEsNavBarGroup }

  TEsNavBarGroup = class(TCollectionItem)
  private
    FCaption: string;
    FExpanded: Boolean;
    FVisible: Boolean;
    FImageIndex: TImageIndex;
    FItems: TEsNavBarItems;
    procedure SetCaption(const AValue: string);
    procedure SetExpanded(AValue: Boolean);
    procedure SetVisible(AValue: Boolean);
    procedure SetImageIndex(AValue: TImageIndex);
    procedure SetItems(AValue: TEsNavBarItems);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function NavBar: TEsNavBar;
  published
    property Caption: string read FCaption write SetCaption;
    property Expanded: Boolean read FExpanded write SetExpanded default True;
    property Visible: Boolean read FVisible write SetVisible default True;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    property Items: TEsNavBarItems read FItems write SetItems;
  end;

  { TEsNavBarGroups }

  TEsNavBarGroups = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TEsNavBarGroup;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    function Add: TEsNavBarGroup;
    property Items[Index: Integer]: TEsNavBarGroup read GetItem; default;
  end;

  TEsNavBarItemEvent = procedure(Sender: TObject; AItem: TEsNavBarItem) of object;

  TEsNavHitKind = (nhNone, nhGroup, nhItem);

  { TEsNavBar }

  TEsNavBar = class(TCustomControl)
  private
    FGroups: TEsNavBarGroups;
    FImages: TCustomImageList;
    FSelectedItem: TEsNavBarItem;
    FHotGroup: TEsNavBarGroup;
    FHotItem: TEsNavBarItem;
    FScrollY: Integer;
    FScroll: TScrollBar;
    FShowSelection: Boolean;
    FOnItemClick: TEsNavBarItemEvent;
    FOnGroupExpandedChanged: TNotifyEvent;
    FLayoutLock: Boolean;
    procedure SetGroups(AValue: TEsNavBarGroups);
    procedure SetImages(AValue: TCustomImageList);
    procedure SetSelectedItem(AValue: TEsNavBarItem);
    procedure ScrollChange(Sender: TObject);
    function GroupHeaderH: Integer;
    function ItemH: Integer;
    function ContentHeight: Integer;
    procedure UpdateScroll;
    function HitTest(X, Y: Integer; out AGroup: TEsNavBarGroup;
      out AItem: TEsNavBarItem): TEsNavHitKind;
  protected
    procedure Paint; override;
    procedure EraseBackground(DC: HDC); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseLeave; override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
    procedure Resize; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    class function GetControlClassDefaultSize: TSize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure StructureChanged;
    property SelectedItem: TEsNavBarItem read FSelectedItem write SetSelectedItem;
  published
    property Groups: TEsNavBarGroups read FGroups write SetGroups;
    property Images: TCustomImageList read FImages write SetImages;
    property ShowSelection: Boolean read FShowSelection write FShowSelection default True;
    property OnItemClick: TEsNavBarItemEvent read FOnItemClick write FOnItemClick;
    property OnGroupExpandedChanged: TNotifyEvent read FOnGroupExpandedChanged write FOnGroupExpandedChanged;
    property Align;
    property Anchors;
    property BorderSpacing;
    property Constraints;
    property Enabled;
    property Font;
    property ParentFont;
    property ShowHint;
    property Visible;
  end;

implementation

{ TEsNavBarItem }

constructor TEsNavBarItem.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FImageIndex := -1;
  FEnabled := True;
  FVisible := True;
end;

procedure TEsNavBarItem.Assign(Source: TPersistent);
begin
  if Source is TEsNavBarItem then
  begin
    FCaption := TEsNavBarItem(Source).FCaption;
    FImageIndex := TEsNavBarItem(Source).FImageIndex;
    FEnabled := TEsNavBarItem(Source).FEnabled;
    FVisible := TEsNavBarItem(Source).FVisible;
    FHint := TEsNavBarItem(Source).FHint;
    FTag := TEsNavBarItem(Source).FTag;
    FOnClick := TEsNavBarItem(Source).FOnClick;
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

function TEsNavBarItem.GetDisplayName: string;
begin
  if FCaption <> '' then Result := FCaption else Result := inherited GetDisplayName;
end;

function TEsNavBarItem.Group: TEsNavBarGroup;
begin
  if (Collection <> nil) and (TEsNavBarItems(Collection).Owner is TEsNavBarGroup) then
    Result := TEsNavBarGroup(TEsNavBarItems(Collection).Owner)
  else
    Result := nil;
end;

procedure TEsNavBarItem.SetCaption(const AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  Changed(False);
end;

procedure TEsNavBarItem.SetImageIndex(AValue: TImageIndex);
begin
  if FImageIndex = AValue then Exit;
  FImageIndex := AValue;
  Changed(False);
end;

procedure TEsNavBarItem.SetEnabled(AValue: Boolean);
begin
  if FEnabled = AValue then Exit;
  FEnabled := AValue;
  Changed(False);
end;

procedure TEsNavBarItem.SetVisible(AValue: Boolean);
begin
  if FVisible = AValue then Exit;
  FVisible := AValue;
  Changed(False);
end;

{ TEsNavBarItems }

function TEsNavBarItems.GetItem(Index: Integer): TEsNavBarItem;
begin
  Result := TEsNavBarItem(inherited Items[Index]);
end;

function TEsNavBarItems.Add: TEsNavBarItem;
begin
  Result := TEsNavBarItem(inherited Add);
end;

procedure TEsNavBarItems.Update(Item: TCollectionItem);
var
  G: TEsNavBarGroup;
begin
  inherited Update(Item);
  if Owner is TEsNavBarGroup then
  begin
    G := TEsNavBarGroup(Owner);
    if G.NavBar <> nil then G.NavBar.StructureChanged;
  end;
end;

{ TEsNavBarGroup }

constructor TEsNavBarGroup.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FExpanded := True;
  FVisible := True;
  FImageIndex := -1;
  FItems := TEsNavBarItems.Create(Self, TEsNavBarItem);
end;

destructor TEsNavBarGroup.Destroy;
var
  NB: TEsNavBar;
begin
  NB := NavBar;
  if (NB <> nil) and (NB.FSelectedItem <> nil) and
     (NB.FSelectedItem.Collection = FItems) then
    NB.FSelectedItem := nil;
  if NB <> nil then
  begin
    NB.FHotItem := nil;
    NB.FHotGroup := nil;
  end;
  FItems.Free;
  inherited Destroy;
end;

procedure TEsNavBarGroup.Assign(Source: TPersistent);
begin
  if Source is TEsNavBarGroup then
  begin
    FCaption := TEsNavBarGroup(Source).FCaption;
    FExpanded := TEsNavBarGroup(Source).FExpanded;
    FVisible := TEsNavBarGroup(Source).FVisible;
    FImageIndex := TEsNavBarGroup(Source).FImageIndex;
    FItems.Assign(TEsNavBarGroup(Source).FItems);
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

function TEsNavBarGroup.GetDisplayName: string;
begin
  if FCaption <> '' then Result := FCaption else Result := inherited GetDisplayName;
end;

function TEsNavBarGroup.NavBar: TEsNavBar;
begin
  if (Collection <> nil) and (TEsNavBarGroups(Collection).Owner is TEsNavBar) then
    Result := TEsNavBar(TEsNavBarGroups(Collection).Owner)
  else
    Result := nil;
end;

procedure TEsNavBarGroup.SetCaption(const AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  Changed(False);
end;

procedure TEsNavBarGroup.SetExpanded(AValue: Boolean);
begin
  if FExpanded = AValue then Exit;
  FExpanded := AValue;
  Changed(False);
  if (NavBar <> nil) and Assigned(NavBar.FOnGroupExpandedChanged) then
    NavBar.FOnGroupExpandedChanged(Self);
end;

procedure TEsNavBarGroup.SetVisible(AValue: Boolean);
begin
  if FVisible = AValue then Exit;
  FVisible := AValue;
  Changed(False);
end;

procedure TEsNavBarGroup.SetImageIndex(AValue: TImageIndex);
begin
  if FImageIndex = AValue then Exit;
  FImageIndex := AValue;
  Changed(False);
end;

procedure TEsNavBarGroup.SetItems(AValue: TEsNavBarItems);
begin
  FItems.Assign(AValue);
end;

{ TEsNavBarGroups }

function TEsNavBarGroups.GetItem(Index: Integer): TEsNavBarGroup;
begin
  Result := TEsNavBarGroup(inherited Items[Index]);
end;

function TEsNavBarGroups.Add: TEsNavBarGroup;
begin
  Result := TEsNavBarGroup(inherited Add);
end;

procedure TEsNavBarGroups.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if Owner is TEsNavBar then
    TEsNavBar(Owner).StructureChanged;
end;

{ TEsNavBar }

constructor TEsNavBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls];
  DoubleBuffered := True;
  FShowSelection := True;
  FGroups := TEsNavBarGroups.Create(Self, TEsNavBarGroup);
  FScroll := TScrollBar.Create(Self);
  FScroll.Kind := sbVertical;
  FScroll.Align := alRight;
  FScroll.Visible := False;
  FScroll.TabStop := False;
  FScroll.ControlStyle := FScroll.ControlStyle + [csNoDesignSelectable, csNoDesignVisible];
  FScroll.OnChange := @ScrollChange;
  FScroll.Parent := Self;
  EsThemes.RegisterClient(Self);
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;

destructor TEsNavBar.Destroy;
begin
  EsThemes.UnregisterClient(Self);
  FLayoutLock := True;
  FreeAndNil(FGroups);
  inherited Destroy;
end;

class function TEsNavBar.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 200;
  Result.CY := 320;
end;

procedure TEsNavBar.Loaded;
begin
  inherited Loaded;
  StructureChanged;
end;

procedure TEsNavBar.SetGroups(AValue: TEsNavBarGroups);
begin
  FGroups.Assign(AValue);
end;

procedure TEsNavBar.SetImages(AValue: TCustomImageList);
begin
  if FImages = AValue then Exit;
  if FImages <> nil then FImages.RemoveFreeNotification(Self);
  FImages := AValue;
  if FImages <> nil then FImages.FreeNotification(Self);
  StructureChanged;
end;

procedure TEsNavBar.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then
    FImages := nil;
end;

procedure TEsNavBar.SetSelectedItem(AValue: TEsNavBarItem);
begin
  if FSelectedItem = AValue then Exit;
  FSelectedItem := AValue;
  Invalidate;
end;

procedure TEsNavBar.StructureChanged;
begin
  if FLayoutLock or (csDestroying in ComponentState) then Exit;
  UpdateScroll;
  Invalidate;
end;

function TEsNavBar.GroupHeaderH: Integer;
begin
    Result := EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 14);
end;

function TEsNavBar.ItemH: Integer;
begin
    Result := EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 10);
  if (FImages <> nil) and (FImages.Height + 6 > Result) then
    Result := FImages.Height + 6;
end;

function TEsNavBar.ContentHeight: Integer;
var
  I, J: Integer;
  G: TEsNavBarGroup;
begin
  Result := 0;
  if FGroups = nil then Exit;
  for I := 0 to FGroups.Count - 1 do
  begin
    G := FGroups[I];
    if not G.Visible then Continue;
    Inc(Result, GroupHeaderH + 2);
    if G.Expanded then
    begin
      for J := 0 to G.Items.Count - 1 do
        if G.Items[J].Visible then Inc(Result, ItemH);
      Inc(Result, 6);
    end;
  end;
end;

procedure TEsNavBar.UpdateScroll;
var
  CH: Integer;
begin
  if FScroll = nil then Exit;
  CH := ContentHeight;
  FScroll.Visible := CH > ClientHeight;
  if FScroll.Visible then
    FScroll.SetParams(FScrollY, 0, CH, Max(1, ClientHeight))
  else
    FScrollY := 0;
  FScrollY := EnsureRange(FScrollY, 0, Max(0, CH - ClientHeight));
end;

procedure TEsNavBar.ScrollChange(Sender: TObject);
begin
  FScrollY := FScroll.Position;
  Invalidate;
end;

procedure TEsNavBar.Resize;
begin
  inherited Resize;
  UpdateScroll;
end;

function TEsNavBar.HitTest(X, Y: Integer; out AGroup: TEsNavBarGroup;
  out AItem: TEsNavBarItem): TEsNavHitKind;
var
  I, J, CY, GH, IH: Integer;
  G: TEsNavBarGroup;
begin
  Result := nhNone;
  AGroup := nil;
  AItem := nil;
  if FGroups = nil then Exit;
  GH := GroupHeaderH;
  IH := ItemH;
  CY := -FScrollY;
  for I := 0 to FGroups.Count - 1 do
  begin
    G := FGroups[I];
    if not G.Visible then Continue;
    if (Y >= CY) and (Y < CY + GH) then
    begin
      AGroup := G;
      Exit(nhGroup);
    end;
    Inc(CY, GH + 2);
    if G.Expanded then
    begin
      for J := 0 to G.Items.Count - 1 do
      begin
        if not G.Items[J].Visible then Continue;
        if (Y >= CY) and (Y < CY + IH) then
        begin
          AGroup := G;
          AItem := G.Items[J];
          Exit(nhItem);
        end;
        Inc(CY, IH);
      end;
      Inc(CY, 6);
    end;
  end;
end;

procedure TEsNavBar.EraseBackground(DC: HDC);
begin
end;

procedure TEsNavBar.Paint;
var
  T: TEsTheme;
  I, J, CY, GH, IH, W, X: Integer;
  G: TEsNavBarGroup;
  It: TEsNavBarItem;
  R: TRect;
  Fg: TColor;
begin
  T := EsSkinTheme;
  W := ClientWidth;
  if FScroll.Visible and not (csDesigning in ComponentState) then
    Dec(W, FScroll.Width);
  Canvas.Font.Assign(Font);
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := EsColor(T.SurfaceAlt);
  Canvas.FillRect(ClientRect);
  GH := GroupHeaderH;
  IH := ItemH;
  CY := -FScrollY;
  for I := 0 to FGroups.Count - 1 do
  begin
    G := FGroups[I];
    if not G.Visible then Continue;
    // cabeçalho do grupo
    R := Rect(0, CY, W, CY + GH);
    EsFillGradientV(Canvas, R, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
    if G = FHotGroup then
    begin
      Canvas.Brush.Color := EsColor(BlendOver(T.HeaderFace, FadeColor(T.Accent, 0.12)));
      Canvas.FillRect(R);
    end;
    Canvas.Pen.Color := EsColor(T.Border);
    Canvas.Line(0, R.Bottom - 1, W, R.Bottom - 1);
    X := EsScale(Self, 10);
    if (FImages <> nil) and (G.ImageIndex >= 0) and (G.ImageIndex < FImages.Count) then
    begin
      FImages.Draw(Canvas, X, (R.Top + R.Bottom - FImages.Height) div 2, G.ImageIndex);
      Inc(X, FImages.Width + 6);
    end;
    Canvas.Font.Style := [fsBold];
    EsDrawText(Canvas, Rect(X, R.Top, W - GH, R.Bottom), G.Caption, dhaLeading,
      dvaCenter, False, EsColor(T.HeaderText), True);
    Canvas.Font.Style := [];
    if G.Expanded then
      EsDrawGlyph(Canvas, Rect(W - GH, R.Top, W, R.Bottom), sgArrowUp, EsColor(T.TextDim), 4)
    else
      EsDrawGlyph(Canvas, Rect(W - GH, R.Top, W, R.Bottom), sgArrowDown, EsColor(T.TextDim), 4);
    Inc(CY, GH + 2);
    if not G.Expanded then Continue;
    for J := 0 to G.Items.Count - 1 do
    begin
      It := G.Items[J];
      if not It.Visible then Continue;
      R := Rect(EsScale(Self, 4), CY, W - EsScale(Self, 4), CY + IH);
      if FShowSelection and (It = FSelectedItem) then
      begin
        Canvas.Brush.Color := EsColor(T.Selection);
        Canvas.FillRect(R);
        Canvas.Brush.Color := EsColor(T.Accent);
        Canvas.FillRect(Rect(R.Left, R.Top + 3, R.Left + 3, R.Bottom - 3));
      end
      else if It = FHotItem then
      begin
        Canvas.Brush.Color := EsColor(BlendOver(T.SurfaceAlt, FadeColor(T.Accent, 0.12)));
        Canvas.FillRect(R);
      end;
      X := R.Left + EsScale(Self, 12);
      if (FImages <> nil) and (It.ImageIndex >= 0) and (It.ImageIndex < FImages.Count) then
      begin
        FImages.Draw(Canvas, X, (R.Top + R.Bottom - FImages.Height) div 2,
          It.ImageIndex, It.Enabled);
        Inc(X, FImages.Width + 8);
      end;
      if not It.Enabled then Fg := EsColor(T.TextDisabled)
      else if (It = FHotItem) and (It <> FSelectedItem) then Fg := EsColor(T.Accent)
      else if (It = FSelectedItem) and FShowSelection then Fg := EsColor(T.SelectionText)
      else Fg := EsColor(T.Text);
      if (It = FHotItem) and It.Enabled then
        Canvas.Font.Style := [fsUnderline];
      EsDrawText(Canvas, Rect(X, R.Top, R.Right - 4, R.Bottom), It.Caption,
        dhaLeading, dvaCenter, False, Fg, True);
      Canvas.Font.Style := [];
      Inc(CY, IH);
    end;
    Inc(CY, 6);
  end;
  Canvas.Pen.Color := EsColor(T.Border);
  Canvas.Brush.Style := bsClear;
  Canvas.Rectangle(0, 0, ClientWidth, ClientHeight);
end;

procedure TEsNavBar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  G: TEsNavBarGroup;
  It: TEsNavBarItem;
  K: TEsNavHitKind;
begin
  inherited MouseMove(Shift, X, Y);
  K := HitTest(X, Y, G, It);
  if K <> nhGroup then G := nil;
  if (It <> nil) and not It.Enabled then It := nil;
  if (G <> FHotGroup) or (It <> FHotItem) then
  begin
    FHotGroup := G;
    FHotItem := It;
    if It <> nil then
    begin
      Cursor := crHandPoint;
      Hint := It.Hint;
    end
    else if G <> nil then
      Cursor := crHandPoint
    else
      Cursor := crDefault;
    Invalidate;
  end;
end;

procedure TEsNavBar.MouseLeave;
begin
  FHotGroup := nil;
  FHotItem := nil;
  Invalidate;
  inherited MouseLeave;
end;

procedure TEsNavBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  G: TEsNavBarGroup;
  It: TEsNavBarItem;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if (Button <> mbLeft) or (csDesigning in ComponentState) then Exit;
  case HitTest(X, Y, G, It) of
    nhGroup: G.Expanded := not G.Expanded;
    nhItem:
      if It.Enabled then
      begin
        SelectedItem := It;
        if Assigned(It.OnClick) then It.OnClick(It);
        if Assigned(FOnItemClick) then FOnItemClick(Self, It);
      end;
  end;
end;

function TEsNavBar.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if Result or not FScroll.Visible then Exit;
  FScroll.Position := FScroll.Position - WheelDelta div 3;
  Result := True;
end;

end.
