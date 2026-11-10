{
 *****************************************************************************
  ESKit - eskitreg.pas
  Registro dos componentes na paleta do Lazarus.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit ESKitReg;

{$mode objfpc}{$H+}

interface

uses
  Classes, LResources, EsFxBase, EsFxAnimations, EsFxShapes, EsFxStdCtrls, EsFxLists, EsSkins,
  EsEditors, EsGrid, EsNavBar, EsRibbon, EsToolBarGrid, EsDB;

const
  EsPageFMX = 'ESKit FMX';
  EsPageFMXAni = 'ESKit FMX Animations';
  EsPageExpress = 'ESKit Express';
  EsPageDB = 'ESKit DB';

procedure Register;

implementation

{$R ../images/eskit_images.res}

procedure Register;
begin
  RegisterComponents(EsPageFMX, [TEsFxStyleBook, TEsFxLayout, TEsFxRectangle,
    TEsFxCircle, TEsFxEllipse, TEsFxLine, TEsFxText, TEsFxButton, TEsFxEdit, TEsFxSwitch,
    TEsFxCheckBox, TEsFxRadioButton, TEsFxTrackBar, TEsFxProgressBar, TEsFxArcProgress,
    TEsFxAniIndicator, TEsFxTabControl, TEsFxListBox]);
  RegisterNoIcon([TEsFxTabItem]);
  RegisterComponents(EsPageFMXAni, [TEsFxFloatAnimation, TEsFxColorAnimation]);
  RegisterComponents(EsPageExpress, [TEsSkinController, TEsGrid, TEsToolBarGrid, TEsButtonEdit,
    TEsSpinEdit, TEsComboBox, TEsDateEdit, TEsButton, TEsGroupBox, TEsNavBar,
    TEsRibbon]);
  RegisterComponents(EsPageDB, [TEsConnection, TEsTransaction, TEsQuery,
    TEsTable, TEsCommand, TEsMemTable]);
end;

end.
