{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.ValEdit
  Gerado por tools/genvclcompat.py a partir de ValEdit.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.ValEdit;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  ValEdit;
type
{$if declared(TValueListEditor)}
  TValueListEditor = ValEdit.TValueListEditor;
{$endif}
{$if declared(TValueListStrings)}
  TValueListStrings = ValEdit.TValueListStrings;
{$endif}
{$if declared(TEditStyle)}
  TEditStyle = ValEdit.TEditStyle;
{$endif}
{$if declared(TVleSortCol)}
  TVleSortCol = ValEdit.TVleSortCol;
{$endif}
{$if declared(TItemProp)}
  TItemProp = ValEdit.TItemProp;
{$endif}
{$if declared(TItemPropList)}
  TItemPropList = ValEdit.TItemPropList;
{$endif}
{$if declared(TKeyValuePair)}
  TKeyValuePair = ValEdit.TKeyValuePair;
{$endif}
{$if declared(TDisplayOption)}
  TDisplayOption = ValEdit.TDisplayOption;
{$endif}
{$if declared(TDisplayOptions)}
  TDisplayOptions = ValEdit.TDisplayOptions;
{$endif}
{$if declared(TKeyOption)}
  TKeyOption = ValEdit.TKeyOption;
{$endif}
{$if declared(TKeyOptions)}
  TKeyOptions = ValEdit.TKeyOptions;
{$endif}
{$if declared(TGetPickListEvent)}
  TGetPickListEvent = ValEdit.TGetPickListEvent;
{$endif}
{$if declared(TOnValidateEvent)}
  TOnValidateEvent = ValEdit.TOnValidateEvent;
{$endif}
const
{$if declared(esSimple)}
  esSimple = ValEdit.esSimple;
{$endif}
{$if declared(esEllipsis)}
  esEllipsis = ValEdit.esEllipsis;
{$endif}
{$if declared(esPickList)}
  esPickList = ValEdit.esPickList;
{$endif}
{$if declared(colKey)}
  colKey = ValEdit.colKey;
{$endif}
{$if declared(colValue)}
  colValue = ValEdit.colValue;
{$endif}
{$if declared(doColumnTitles)}
  doColumnTitles = ValEdit.doColumnTitles;
{$endif}
{$if declared(doAutoColResize)}
  doAutoColResize = ValEdit.doAutoColResize;
{$endif}
{$if declared(doKeyColFixed)}
  doKeyColFixed = ValEdit.doKeyColFixed;
{$endif}
{$if declared(keyEdit)}
  keyEdit = ValEdit.keyEdit;
{$endif}
{$if declared(keyAdd)}
  keyAdd = ValEdit.keyAdd;
{$endif}
{$if declared(keyDelete)}
  keyDelete = ValEdit.keyDelete;
{$endif}
{$if declared(keyUnique)}
  keyUnique = ValEdit.keyUnique;
{$endif}
{$if declared(rsVLEDuplicateKey)}
  rsVLEDuplicateKey = ValEdit.rsVLEDuplicateKey;
{$endif}
{$if declared(rsVLEKey)}
  rsVLEKey = ValEdit.rsVLEKey;
{$endif}
{$if declared(rsVLEValue)}
  rsVLEValue = ValEdit.rsVLEValue;
{$endif}
{$if declared(rsVLEInvalidRowColOperation)}
  rsVLEInvalidRowColOperation = ValEdit.rsVLEInvalidRowColOperation;
{$endif}
{$if declared(rsVLENoRowCountFound)}
  rsVLENoRowCountFound = ValEdit.rsVLENoRowCountFound;
{$endif}
{$if declared(rsVLERowIndexOutOfBounds)}
  rsVLERowIndexOutOfBounds = ValEdit.rsVLERowIndexOutOfBounds;
{$endif}
{$if declared(rsVLEColIndexOutOfBounds)}
  rsVLEColIndexOutOfBounds = ValEdit.rsVLEColIndexOutOfBounds;
{$endif}
{$if declared(rsVLEIllegalColCount)}
  rsVLEIllegalColCount = ValEdit.rsVLEIllegalColCount;
{$endif}


implementation


end.
