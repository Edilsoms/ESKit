{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.ExtDlgs
  Gerado por tools/genvclcompat.py a partir de ExtDlgs.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.ExtDlgs;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  ExtDlgs;
type
{$if declared(TPreviewFileDialog)}
  TPreviewFileDialog = ExtDlgs.TPreviewFileDialog;
{$endif}
{$if declared(TPreviewFileControl)}
  TPreviewFileControl = ExtDlgs.TPreviewFileControl;
{$endif}
{$if declared(TOpenPictureDialog)}
  TOpenPictureDialog = ExtDlgs.TOpenPictureDialog;
{$endif}
{$if declared(TSavePictureDialog)}
  TSavePictureDialog = ExtDlgs.TSavePictureDialog;
{$endif}
{$if declared(TExtCommonDialog)}
  TExtCommonDialog = ExtDlgs.TExtCommonDialog;
{$endif}
{$if declared(TCalculatorDialog)}
  TCalculatorDialog = ExtDlgs.TCalculatorDialog;
{$endif}
{$if declared(TCalendarDialog)}
  TCalendarDialog = ExtDlgs.TCalendarDialog;
{$endif}
const
{$if declared(DefaultOpenDialogPictureOptions)}
  DefaultOpenDialogPictureOptions = ExtDlgs.DefaultOpenDialogPictureOptions;
{$endif}


implementation


end.
