{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ESKitDsgn;

{$warn 5023 off : no warning about unused units}
interface

uses
  ESKitDsgnReg, EsPropEdits, EsProjectDescs, EsCompEdits, EsDelphiProfile, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('ESKitDsgnReg', @ESKitDsgnReg.Register);
end;

initialization
  RegisterPackage('ESKitDsgn', @Register);
end.
