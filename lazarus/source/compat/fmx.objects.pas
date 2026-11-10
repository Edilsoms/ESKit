{
 *****************************************************************************
  ESKit - camada de compatibilidade com o FireMonkey (Delphi)
  FMX.Objects: formas
  Apenas apelidos de tipos: permite compilar código FMX com poucas mudanças.
  Os nomes reais (TFx*) continuam sendo os gravados no .lfm.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit FMX.Objects;

{$mode objfpc}{$H+}

interface

uses
  EsFxShapes;

type
  TRectangle = EsFxShapes.TEsFxRectangle;
  TRoundRect = EsFxShapes.TEsFxRectangle;
  TCircle = EsFxShapes.TEsFxCircle;
  TEllipse = EsFxShapes.TEsFxEllipse;
  TLine = EsFxShapes.TEsFxLine;
  TText = EsFxShapes.TEsFxText;

implementation

end.
