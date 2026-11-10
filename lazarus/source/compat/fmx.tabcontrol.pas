{
 *****************************************************************************
  ESKit - camada de compatibilidade com o FireMonkey (Delphi)
  FMX.TabControl
  Apenas apelidos de tipos: permite compilar código FMX com poucas mudanças.
  Os nomes reais (TFx*) continuam sendo os gravados no .lfm.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit FMX.TabControl;

{$mode objfpc}{$H+}

interface

uses
  EsFxLists;

type
  TTabControl = EsFxLists.TEsFxTabControl;
  TTabItem = EsFxLists.TEsFxTabItem;
  TTabPosition = EsFxLists.TEsFxTabPosition;
  TTabTransition = EsFxLists.TEsFxTabTransition;
  TTabTransitionDirection = EsFxLists.TEsFxTabTransitionDirection;

implementation

end.
