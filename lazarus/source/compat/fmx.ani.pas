{
 *****************************************************************************
  ESKit - camada de compatibilidade com o FireMonkey (Delphi)
  FMX.Ani: animações e TAnimator
  Apenas apelidos de tipos: permite compilar código FMX com poucas mudanças.
  Os nomes reais (TFx*) continuam sendo os gravados no .lfm.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit FMX.Ani;

{$mode objfpc}{$H+}

interface

uses
  EsFxBase, EsFxAnimations;

type
  TAnimation = EsFxAnimations.TEsFxAnimation;
  TFloatAnimation = EsFxAnimations.TEsFxFloatAnimation;
  TColorAnimation = EsFxAnimations.TEsFxColorAnimation;
  TAnimator = EsFxAnimations.TEsFxAnimator;
  TInterpolationType = EsFxAnimations.TEsFxInterpolationType;
  TAnimationType = EsFxAnimations.TEsFxAnimationType;
  TTrigger = EsFxBase.TEsFxTrigger;

const
  itLinear = EsFxAnimations.itLinear;
  itQuadratic = EsFxAnimations.itQuadratic;
  itCubic = EsFxAnimations.itCubic;
  itQuartic = EsFxAnimations.itQuartic;
  itQuintic = EsFxAnimations.itQuintic;
  itSinusoidal = EsFxAnimations.itSinusoidal;
  itExponential = EsFxAnimations.itExponential;
  itCircular = EsFxAnimations.itCircular;
  itElastic = EsFxAnimations.itElastic;
  itBack = EsFxAnimations.itBack;
  itBounce = EsFxAnimations.itBounce;
  atIn = EsFxAnimations.atIn;
  atOut = EsFxAnimations.atOut;
  atInOut = EsFxAnimations.atInOut;
  ftNone = EsFxBase.ftNone;
  ftMouseOver = EsFxBase.ftMouseOver;
  ftPressed = EsFxBase.ftPressed;
  ftFocused = EsFxBase.ftFocused;
  ftChecked = EsFxBase.ftChecked;

implementation

end.
