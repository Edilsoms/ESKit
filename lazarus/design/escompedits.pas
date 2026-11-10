{
 *****************************************************************************
  ESKit (design-time) - escompedits.pas
  Editores de componente: TEsFxTabControl (nova aba, mover, excluir) e
  TEsFxListBox (editar itens).

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsCompEdits;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Controls, ComponentEditors, PropEdits, EsFxLists;

type

  { TEsFxTabControlEditor }

  TEsFxTabControlEditor = class(TDefaultComponentEditor)
  protected
    function TabControl: TEsFxTabControl;
    procedure AddTab;
    procedure DeleteTab;
    procedure MoveTab(ADelta: Integer);
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TEsFxTabItemEditor - os mesmos comandos pelo TabItem selecionado }

  TEsFxTabItemEditor = class(TEsFxTabControlEditor)
  end;

  { TEsFxListBoxEditor }

  TEsFxListBoxEditor = class(TDefaultComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

resourcestring
  rsEsAddTab = 'Nova aba';
  rsEsDeleteTab = 'Excluir aba';
  rsEsNextTab = 'Próxima aba';
  rsEsPrevTab = 'Aba anterior';
  rsEsMoveTabLeft = 'Mover aba para a esquerda';
  rsEsMoveTabRight = 'Mover aba para a direita';
  rsEsEditItems = 'Editar itens...';

implementation

{ TEsFxTabControlEditor }

function TEsFxTabControlEditor.TabControl: TEsFxTabControl;
begin
  if Component is TEsFxTabControl then
    Result := TEsFxTabControl(Component)
  else if (Component is TEsFxTabItem) and (TEsFxTabItem(Component).TabControl <> nil) then
    Result := TEsFxTabItem(Component).TabControl
  else
    Result := nil;
end;

procedure TEsFxTabControlEditor.AddTab;
var
  Hook: TPropertyEditorHook;
  TC: TEsFxTabControl;
  T: TEsFxTabItem;
  NewName: string;
begin
  TC := TabControl;
  if (TC = nil) or not GetHook(Hook) then Exit;
  T := TEsFxTabItem.Create(TC.Owner);
  NewName := GetDesigner.CreateUniqueComponentName(T.ClassName);
  T.Name := NewName;
  T.Text := NewName;
  T.Parent := TC;
  TC.TabIndex := T.Index;
  Hook.PersistentAdded(T, True);
  Modified;
end;

procedure TEsFxTabControlEditor.DeleteTab;
var
  Hook: TPropertyEditorHook;
  TC: TEsFxTabControl;
  T: TEsFxTabItem;
begin
  TC := TabControl;
  if TC = nil then Exit;
  T := TC.ActiveTab;
  if (T = nil) or not GetHook(Hook) then Exit;
  Hook.DeletePersistent(TPersistent(T));
end;

procedure TEsFxTabControlEditor.MoveTab(ADelta: Integer);
var
  TC: TEsFxTabControl;
  T: TEsFxTabItem;
begin
  TC := TabControl;
  if TC = nil then Exit;
  T := TC.ActiveTab;
  if T = nil then Exit;
  T.Index := T.Index + ADelta;
  Modified;
end;

procedure TEsFxTabControlEditor.ExecuteVerb(Index: Integer);
var
  TC: TEsFxTabControl;
begin
  TC := TabControl;
  if TC = nil then Exit;
  case Index of
    0: AddTab;
    1: DeleteTab;
    2: if TC.TabIndex < TC.TabCount - 1 then
       begin
         TC.TabIndex := TC.TabIndex + 1;
         Modified;
       end;
    3: if TC.TabIndex > 0 then
       begin
         TC.TabIndex := TC.TabIndex - 1;
         Modified;
       end;
    4: MoveTab(-1);
    5: MoveTab(1);
  end;
end;

function TEsFxTabControlEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := rsEsAddTab;
    1: Result := rsEsDeleteTab;
    2: Result := rsEsNextTab;
    3: Result := rsEsPrevTab;
    4: Result := rsEsMoveTabLeft;
    5: Result := rsEsMoveTabRight;
  else
    Result := '';
  end;
end;

function TEsFxTabControlEditor.GetVerbCount: Integer;
begin
  Result := 6;
end;

{ TEsFxListBoxEditor }

procedure TEsFxListBoxEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then
    EditCollection(Component, TEsFxListBox(Component).Items, 'Items')
  else
    inherited ExecuteVerb(Index);
end;

function TEsFxListBoxEditor.GetVerb(Index: Integer): string;
begin
  if Index = 0 then Result := rsEsEditItems else Result := '';
end;

function TEsFxListBoxEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
