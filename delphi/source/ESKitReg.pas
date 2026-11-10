{
 *****************************************************************************
  ESKit para Delphi (design-time) - ESKitReg.pas
  Registro dos componentes na paleta e dos editores de propriedade.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit ESKitReg;

interface

procedure Register;

implementation

uses
  System.SysUtils, System.Classes, DesignIntf, DesignEditors, ColnEdit, EsGraphics,
  EsFxBase, EsFxAnimations, EsFxShapes, EsFxStdCtrls, EsFxLists, EsSkins, EsEditors,
  EsGrid, EsNavBar, EsRibbon, EsToolBarGrid, EsDB, EsPropEdits;

{$R ESKitReg.dcr}

type
  { TEsFxTabControlEditor - nova aba, navegar, mover e excluir }

  TEsFxTabControlEditor = class(TDefaultEditor)
  protected
    function TabControl: TEsFxTabControl;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TEsFxListBoxEditor - editar itens }

  TEsFxListBoxEditor = class(TDefaultEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

function TEsFxTabControlEditor.TabControl: TEsFxTabControl;
begin
  if Component is TEsFxTabControl then
    Result := TEsFxTabControl(Component)
  else if (Component is TEsFxTabItem) and (TEsFxTabItem(Component).TabControl <> nil) then
    Result := TEsFxTabItem(Component).TabControl
  else
    Result := nil;
end;

procedure TEsFxTabControlEditor.ExecuteVerb(Index: Integer);
var
  TC: TEsFxTabControl;
  T: TEsFxTabItem;
begin
  TC := TabControl;
  if TC = nil then Exit;
  case Index of
    0:
      begin
        T := TEsFxTabItem.Create(TC.Owner);
        T.Name := Designer.UniqueName(T.ClassName);
        T.Text := T.Name;
        T.Parent := TC;
        TC.TabIndex := T.Index;
        Designer.SelectComponent(T);
      end;
    1:
      begin
        T := TC.ActiveTab;
        if T = nil then Exit;
        Designer.SelectComponent(TC);
        T.Free;
      end;
    2: if TC.TabIndex < TC.TabCount - 1 then TC.TabIndex := TC.TabIndex + 1;
    3: if TC.TabIndex > 0 then TC.TabIndex := TC.TabIndex - 1;
    4: if TC.ActiveTab <> nil then TC.ActiveTab.Index := TC.ActiveTab.Index - 1;
    5: if TC.ActiveTab <> nil then TC.ActiveTab.Index := TC.ActiveTab.Index + 1;
  end;
  Designer.Modified;
end;

function TEsFxTabControlEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Nova aba';
    1: Result := 'Excluir aba';
    2: Result := 'Próxima aba';
    3: Result := 'Aba anterior';
    4: Result := 'Mover aba para a esquerda';
    5: Result := 'Mover aba para a direita';
  else
    Result := '';
  end;
end;

function TEsFxTabControlEditor.GetVerbCount: Integer;
begin
  Result := 6;
end;

procedure TEsFxListBoxEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then
    ShowCollectionEditor(Designer, Component, TEsFxListBox(Component).Items, 'Items');
end;

function TEsFxListBoxEditor.GetVerb(Index: Integer): string;
begin
  Result := 'Editar itens...';
end;

function TEsFxListBoxEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

const
  EsPageFMX = 'ESKit FMX';
  EsPageFMXAni = 'ESKit FMX Animations';
  EsPageExpress = 'ESKit Express';
  EsPageDB = 'ESKit DB';

procedure Register;
begin
  RegisterComponents(EsPageFMX, [TEsFxStyleBook, TEsFxLayout, TEsFxRectangle,
    TEsFxCircle, TEsFxEllipse, TEsFxLine, TEsFxText, TEsFxButton, TEsFxEdit, TEsFxSwitch,
    TEsFxCheckBox, TEsFxRadioButton, TEsFxTrackBar, TEsFxProgressBar, TEsFxArcProgress,
    TEsFxAniIndicator, TEsFxTabControl, TEsFxListBox]);
  RegisterNoIcon([TEsFxTabItem]);
  RegisterComponentEditor(TEsFxTabControl, TEsFxTabControlEditor);
  RegisterComponentEditor(TEsFxTabItem, TEsFxTabControlEditor);
  RegisterComponentEditor(TEsFxListBox, TEsFxListBoxEditor);
  RegisterComponents(EsPageFMXAni, [TEsFxFloatAnimation, TEsFxColorAnimation]);
  RegisterComponents(EsPageExpress, [TEsSkinController, TEsGrid, TEsToolBarGrid,
    TEsButtonEdit, TEsSpinEdit, TEsComboBox, TEsDateEdit, TEsButton, TEsGroupBox,
    TEsNavBar, TEsRibbon]);
  RegisterComponents(EsPageDB, [TEsConnection, TEsTransaction, TEsQuery,
    TEsTable, TEsCommand, TEsMemTable]);

  // só nas classes do ESKit (o FMX tem o seu próprio editor de TAlphaColor)
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsFxBrush, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsFxShadow, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsFxGlow, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsRibbonTab, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsRibbonGalleryEntry, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsFxTextSettings, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsFxColorAnimation, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsFxProgressBar, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsFxArcProgress, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsFxStyleBook, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(TAlphaColor), TEsSkinController, '', TEsAlphaColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TEsConnection, 'DriverID', TEsDriverIDProperty);
end;

end.
