{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.CheckLst
  Gerado por tools/genvclcompat.py a partir de CheckLst.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.CheckLst;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  CheckLst;
type
{$if declared(TCheckListClicked)}
  TCheckListClicked = CheckLst.TCheckListClicked;
{$endif}
{$if declared(TCustomCheckListBox)}
  TCustomCheckListBox = CheckLst.TCustomCheckListBox;
{$endif}
{$if declared(TCheckListBox)}
  TCheckListBox = CheckLst.TCheckListBox;
{$endif}


implementation


end.
