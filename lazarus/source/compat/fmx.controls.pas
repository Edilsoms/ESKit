{
 *****************************************************************************
  ESKit - camada de compatibilidade com o FireMonkey (Delphi)
  FMX.Controls: TStyleBook
  Apenas apelidos de tipos: permite compilar código FMX com poucas mudanças.
  Os nomes reais (TFx*) continuam sendo os gravados no .lfm.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit FMX.Controls;

{$mode objfpc}{$H+}

interface

uses
  EsFxStdCtrls;

type
  TStyleBook = EsFxStdCtrls.TEsFxStyleBook;

implementation

end.
