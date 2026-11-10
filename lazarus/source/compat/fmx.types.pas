{
 *****************************************************************************
  ESKit - camada de compatibilidade com o FireMonkey (Delphi)
  FMX.Types: cores (TAlphaColor/TAlphaColors) e tipos básicos
  Apenas apelidos de tipos: permite compilar código FMX com poucas mudanças.
  Os nomes reais (TFx*) continuam sendo os gravados no .lfm.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit FMX.Types;

{$mode objfpc}{$H+}

interface

uses
  Types, EsGraphics, EsTheme, EsFxBase;

type
  TAlphaColor = EsGraphics.TAlphaColor;
  TAlphaColors = EsGraphics.TAlphaColors;
  TPointF = Types.TPointF;
  TRectF = Types.TRectF;
  TCorner = EsGraphics.TEsCorner;
  TCorners = EsGraphics.TEsCorners;
  TBrushKind = EsFxBase.TEsFxBrushKind;
  TTextAlign = EsFxBase.TEsFxTextAlign;
  TBrush = EsFxBase.TEsFxBrush;
  TStrokeBrush = EsFxBase.TEsFxStroke;
  TTextSettings = EsFxBase.TEsFxTextSettings;

const
  AllCorners = EsAllCorners;
  // valores das enumerações (apelidos de tipo não trazem os valores)
  bkNone = EsFxBase.bkNone;
  bkSolid = EsFxBase.bkSolid;
  bkGradient = EsFxBase.bkGradient;
  txLeading = EsFxBase.txLeading;
  txCenter = EsFxBase.txCenter;
  txTrailing = EsFxBase.txTrailing;
  dcTopLeft = EsGraphics.dcTopLeft;
  dcTopRight = EsGraphics.dcTopRight;
  dcBottomLeft = EsGraphics.dcBottomLeft;
  dcBottomRight = EsGraphics.dcBottomRight;

implementation

end.
