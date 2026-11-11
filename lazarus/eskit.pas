{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ESKit;

{$warn 5023 off : no warning about unused units}
interface

uses
  EsGraphics, EsTheme, EsFxBase, EsFxAnimations, EsFxShapes, EsFxStdCtrls, EsSkins, EsEditors, EsGrid, EsNavBar, EsRibbon, EsGridExport, EsToolBarGrid, EsDB, EsDBOracle, ESKitReg, EsFxLists, EsTrueType, FMX.Ani, FMX.Controls, FMX.Edit, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.StdCtrls, FMX.TabControl, FMX.Types, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('ESKitReg', @ESKitReg.Register);
end;

initialization
  RegisterPackage('ESKit', @Register);
end.
