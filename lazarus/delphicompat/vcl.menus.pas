{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Menus
  Gerado por tools/genvclcompat.py a partir de Menus.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Menus;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Classes, Menus;
type
{$if declared(TMenu)}
  TMenu = Menus.TMenu;
{$endif}
{$if declared(TMenuItem)}
  TMenuItem = Menus.TMenuItem;
{$endif}
{$if declared(EMenuError)}
  EMenuError = Menus.EMenuError;
{$endif}
{$if declared(TGlyphShowMode)}
  TGlyphShowMode = Menus.TGlyphShowMode;
{$endif}
{$if declared(TMenuChangeEvent)}
  TMenuChangeEvent = Menus.TMenuChangeEvent;
{$endif}
{$if declared(TMenuItemAutoFlag)}
  TMenuItemAutoFlag = Menus.TMenuItemAutoFlag;
{$endif}
{$if declared(TMenuAutoFlag)}
  TMenuAutoFlag = Menus.TMenuAutoFlag;
{$endif}
{$if declared(TMenuActionLink)}
  TMenuActionLink = Menus.TMenuActionLink;
{$endif}
{$if declared(TMenuActionLinkClass)}
  TMenuActionLinkClass = Menus.TMenuActionLinkClass;
{$endif}
{$if declared(TMenuItemEnumerator)}
  TMenuItemEnumerator = Menus.TMenuItemEnumerator;
{$endif}
{$if declared(TMenuItemHandlerType)}
  TMenuItemHandlerType = Menus.TMenuItemHandlerType;
{$endif}
{$if declared(TMenuDrawItemEvent)}
  TMenuDrawItemEvent = Menus.TMenuDrawItemEvent;
{$endif}
{$if declared(TMenuMeasureItemEvent)}
  TMenuMeasureItemEvent = Menus.TMenuMeasureItemEvent;
{$endif}
{$if declared(TMergedMenuItems)}
  TMergedMenuItems = Menus.TMergedMenuItems;
{$endif}
{$if declared(TMenuItems)}
  TMenuItems = Menus.TMenuItems;
{$endif}
{$if declared(TMenuItemClass)}
  TMenuItemClass = Menus.TMenuItemClass;
{$endif}
{$if declared(TFindItemKind)}
  TFindItemKind = Menus.TFindItemKind;
{$endif}
{$if declared(TMainMenu)}
  TMainMenu = Menus.TMainMenu;
{$endif}
{$if declared(TPopupAlignment)}
  TPopupAlignment = Menus.TPopupAlignment;
{$endif}
{$if declared(TTrackButton)}
  TTrackButton = Menus.TTrackButton;
{$endif}
{$if declared(TPopupMenu)}
  TPopupMenu = Menus.TPopupMenu;
{$endif}
const
{$if declared(gsmAlways)}
  gsmAlways = Menus.gsmAlways;
{$endif}
{$if declared(gsmNever)}
  gsmNever = Menus.gsmNever;
{$endif}
{$if declared(gsmApplication)}
  gsmApplication = Menus.gsmApplication;
{$endif}
{$if declared(gsmSystem)}
  gsmSystem = Menus.gsmSystem;
{$endif}
{$if declared(maAutomatic)}
  maAutomatic = Menus.maAutomatic;
{$endif}
{$if declared(maManual)}
  maManual = Menus.maManual;
{$endif}
{$if declared(maParent)}
  maParent = Menus.maParent;
{$endif}
{$if declared(mihtDestroy)}
  mihtDestroy = Menus.mihtDestroy;
{$endif}
{$if declared(fkCommand)}
  fkCommand = Menus.fkCommand;
{$endif}
{$if declared(fkHandle)}
  fkHandle = Menus.fkHandle;
{$endif}
{$if declared(fkShortCut)}
  fkShortCut = Menus.fkShortCut;
{$endif}
{$if declared(paLeft)}
  paLeft = Menus.paLeft;
{$endif}
{$if declared(paRight)}
  paRight = Menus.paRight;
{$endif}
{$if declared(paCenter)}
  paCenter = Menus.paCenter;
{$endif}
{$if declared(tbRightButton)}
  tbRightButton = Menus.tbRightButton;
{$endif}
{$if declared(tbLeftButton)}
  tbLeftButton = Menus.tbLeftButton;
{$endif}
{$if declared(cHotkeyPrefix)}
  cHotkeyPrefix = Menus.cHotkeyPrefix;
{$endif}
{$if declared(cLineCaption)}
  cLineCaption = Menus.cLineCaption;
{$endif}
{$if declared(cDialogSuffix)}
  cDialogSuffix = Menus.cDialogSuffix;
{$endif}
var
{$if declared(ActivePopupMenu)}
  ActivePopupMenu: TPopupMenu absolute Menus.ActivePopupMenu;
{$endif}
{$if declared(OnDesignerMenuItemClick)}
  OnDesignerMenuItemClick: TNotifyEvent absolute Menus.OnDesignerMenuItemClick;
{$endif}
{$if declared(OnMenuPopupHandler)}
  OnMenuPopupHandler: TNotifyEvent absolute Menus.OnMenuPopupHandler;
{$endif}
{$if declared(ValidMenuHotkeys)}
  ValidMenuHotkeys: string absolute Menus.ValidMenuHotkeys;
{$endif}
{$if declared(ShortCut)}
function ShortCut(const Key: Word; const Shift : TShiftState) : TShortCut; inline;
{$endif}
{$if declared(ShortCutToKey)}
procedure ShortCutToKey(const ShortCut : TShortCut; out Key: Word; out Shift : TShiftState); inline;
{$endif}
{$if declared(NewMenu)}
function NewMenu(Owner: TComponent; const AName: string; const Items: array of TMenuItem): TMainMenu; inline;
{$endif}
{$if declared(NewPopupMenu)}
function NewPopupMenu(Owner: TComponent; const AName: string; Alignment: TPopupAlignment; AutoPopup: Boolean; const Items: array of TMenuItem): TPopupMenu; inline;
{$endif}
{$if declared(NewSubMenu)}
function NewSubMenu(const ACaption: string; hCtx: THelpContext; const AName: string; const Items: array of TMenuItem; TheEnabled: Boolean = True): TMenuItem; inline;
{$endif}
{$if declared(NewItem)}
function NewItem(const ACaption: string; AShortCut: TShortCut; AChecked, TheEnabled: Boolean; TheOnClick: TNotifyEvent; hCtx: THelpContext; const AName: string): TMenuItem; inline;
{$endif}
{$if declared(NewLine)}
function NewLine: TMenuItem; inline;
{$endif}
{$if declared(StripHotkey)}
function StripHotkey(const Text: string): string; inline;
{$endif}

implementation

{$if declared(ShortCut)}
function ShortCut(const Key: Word; const Shift : TShiftState) : TShortCut;
begin
  Result := Menus.ShortCut(Key, Shift);
end;

{$endif}
{$if declared(ShortCutToKey)}
procedure ShortCutToKey(const ShortCut : TShortCut; out Key: Word; out Shift : TShiftState);
begin
  Menus.ShortCutToKey(ShortCut, Key, Shift);
end;

{$endif}
{$if declared(NewMenu)}
function NewMenu(Owner: TComponent; const AName: string; const Items: array of TMenuItem): TMainMenu;
begin
  Result := Menus.NewMenu(Owner, AName, Items);
end;

{$endif}
{$if declared(NewPopupMenu)}
function NewPopupMenu(Owner: TComponent; const AName: string; Alignment: TPopupAlignment; AutoPopup: Boolean; const Items: array of TMenuItem): TPopupMenu;
begin
  Result := Menus.NewPopupMenu(Owner, AName, Alignment, AutoPopup, Items);
end;

{$endif}
{$if declared(NewSubMenu)}
function NewSubMenu(const ACaption: string; hCtx: THelpContext; const AName: string; const Items: array of TMenuItem; TheEnabled: Boolean = True): TMenuItem;
begin
  Result := Menus.NewSubMenu(ACaption, hCtx, AName, Items, TheEnabled);
end;

{$endif}
{$if declared(NewItem)}
function NewItem(const ACaption: string; AShortCut: TShortCut; AChecked, TheEnabled: Boolean; TheOnClick: TNotifyEvent; hCtx: THelpContext; const AName: string): TMenuItem;
begin
  Result := Menus.NewItem(ACaption, AShortCut, AChecked, TheEnabled, TheOnClick, hCtx, AName);
end;

{$endif}
{$if declared(NewLine)}
function NewLine: TMenuItem;
begin
  Result := Menus.NewLine;
end;

{$endif}
{$if declared(StripHotkey)}
function StripHotkey(const Text: string): string;
begin
  Result := Menus.StripHotkey(Text);
end;

{$endif}
end.
