{
 *****************************************************************************
  ESKit - camada de compatibilidade com o FireMonkey (Delphi)
  FMX.StdCtrls: controles padrão
  Apenas apelidos de tipos: permite compilar código FMX com poucas mudanças.
  Os nomes reais (TFx*) continuam sendo os gravados no .lfm.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit FMX.StdCtrls;

{$mode objfpc}{$H+}

interface

uses
  EsFxStdCtrls;

type
  TButton = EsFxStdCtrls.TEsFxButton;
  TSpeedButton = EsFxStdCtrls.TEsFxButton;
  TSwitch = EsFxStdCtrls.TEsFxSwitch;
  TCheckBox = EsFxStdCtrls.TEsFxCheckBox;
  TRadioButton = EsFxStdCtrls.TEsFxRadioButton;
  TTrackBar = EsFxStdCtrls.TEsFxTrackBar;
  TProgressBar = EsFxStdCtrls.TEsFxProgressBar;
  TAniIndicator = EsFxStdCtrls.TEsFxAniIndicator;
  TArcDial = EsFxStdCtrls.TEsFxArcProgress;

implementation

end.
