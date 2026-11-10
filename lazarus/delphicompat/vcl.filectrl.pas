{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.FileCtrl
  Gerado por tools/genvclcompat.py a partir de FileCtrl.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.FileCtrl;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Graphics, FileCtrl;
type
{$if declared(TFileAttr)}
  TFileAttr = FileCtrl.TFileAttr;
{$endif}
{$if declared(TFileType)}
  TFileType = FileCtrl.TFileType;
{$endif}
{$if declared(TCustomFileListBox)}
  TCustomFileListBox = FileCtrl.TCustomFileListBox;
{$endif}
{$if declared(TFileListBox)}
  TFileListBox = FileCtrl.TFileListBox;
{$endif}
{$if declared(TCustomFilterComboBox)}
  TCustomFilterComboBox = FileCtrl.TCustomFilterComboBox;
{$endif}
{$if declared(TFilterComboBox)}
  TFilterComboBox = FileCtrl.TFilterComboBox;
{$endif}
const
{$if declared(ftReadOnly)}
  ftReadOnly = FileCtrl.ftReadOnly;
{$endif}
{$if declared(ftHidden)}
  ftHidden = FileCtrl.ftHidden;
{$endif}
{$if declared(ftSystem)}
  ftSystem = FileCtrl.ftSystem;
{$endif}
{$if declared(ftVolumeID)}
  ftVolumeID = FileCtrl.ftVolumeID;
{$endif}
{$if declared(ftDirectory)}
  ftDirectory = FileCtrl.ftDirectory;
{$endif}
{$if declared(ftArchive)}
  ftArchive = FileCtrl.ftArchive;
{$endif}
{$if declared(ftNormal)}
  ftNormal = FileCtrl.ftNormal;
{$endif}
{$if declared(MinimizeName)}
function MinimizeName(FileName: String; Canvas: TCanvas; MaxWidth: Integer): String; inline;
{$endif}

implementation

{$if declared(MinimizeName)}
function MinimizeName(FileName: String; Canvas: TCanvas; MaxWidth: Integer): String;
begin
  Result := FileCtrl.MinimizeName(FileName, Canvas, MaxWidth);
end;

{$endif}
end.
