{
 *****************************************************************************
  ESKit (design-time) - eskitdsgnreg.pas
  Registra editores de propriedade e modelos de projeto na IDE.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit ESKitDsgnReg;

{$mode objfpc}{$H+}

interface

uses
  Classes, PropEdits, ComponentEditors, EsGraphics, EsDB, EsFxLists, EsPropEdits,
  EsProjectDescs, EsCompEdits, EsDelphiProfile;

procedure Register;

implementation

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TAlphaColor), nil, '', TEsAlphaColorPropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TEsConnection, 'DriverID', TEsDriverIDPropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TEsTable, 'TableName', TEsTableNamePropertyEditor);
  RegisterComponentEditor(TEsFxTabControl, TEsFxTabControlEditor);
  RegisterComponentEditor(TEsFxTabItem, TEsFxTabItemEditor);
  RegisterComponentEditor(TEsFxListBox, TEsFxListBoxEditor);
  RegisterESKitDescriptors;
  RegisterDelphiProfile;
end;

end.
