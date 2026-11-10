{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Samples.Spin
  Gerado por tools/genvclcompat.py a partir de Spin.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Samples.Spin;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Spin;
type
{$if declared(TCustomFloatSpinEdit)}
  TCustomFloatSpinEdit = Spin.TCustomFloatSpinEdit;
{$endif}
{$if declared(TFloatSpinEdit)}
  TFloatSpinEdit = Spin.TFloatSpinEdit;
{$endif}
{$if declared(TCustomSpinEdit)}
  TCustomSpinEdit = Spin.TCustomSpinEdit;
{$endif}
{$if declared(TSpinEdit)}
  TSpinEdit = Spin.TSpinEdit;
{$endif}


implementation


end.
