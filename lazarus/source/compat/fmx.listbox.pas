{
 *****************************************************************************
  ESKit - camada de compatibilidade com o FireMonkey (Delphi)
  FMX.ListBox
  Apenas apelidos de tipos: permite compilar código FMX com poucas mudanças.
  Os nomes reais (TFx*) continuam sendo os gravados no .lfm.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit FMX.ListBox;

{$mode objfpc}{$H+}

interface

uses
  EsFxLists;

type
  TListBox = EsFxLists.TEsFxListBox;
  TListBoxItem = EsFxLists.TEsFxListItem;
  TListBoxItems = EsFxLists.TEsFxListItems;
  TListBoxItemAccessory = EsFxLists.TEsFxListAccessory;

implementation

end.
