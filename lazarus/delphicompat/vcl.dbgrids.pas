{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.DBGrids
  Gerado por tools/genvclcompat.py a partir de DBGrids.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.DBGrids;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  DBGrids;
type
{$if declared(TCustomDbGrid)}
  TCustomDbGrid = DBGrids.TCustomDbGrid;
{$endif}
{$if declared(TColumn)}
  TColumn = DBGrids.TColumn;
{$endif}
{$if declared(EInvalidGridOperation)}
  EInvalidGridOperation = DBGrids.EInvalidGridOperation;
{$endif}
{$if declared(TDBGridOption)}
  TDBGridOption = DBGrids.TDBGridOption;
{$endif}
{$if declared(TDbGridOptions)}
  TDbGridOptions = DBGrids.TDbGridOptions;
{$endif}
{$if declared(TDbGridExtraOption)}
  TDbGridExtraOption = DBGrids.TDbGridExtraOption;
{$endif}
{$if declared(TDbGridExtraOptions)}
  TDbGridExtraOptions = DBGrids.TDbGridExtraOptions;
{$endif}
{$if declared(TDbGridStatusItem)}
  TDbGridStatusItem = DBGrids.TDbGridStatusItem;
{$endif}
{$if declared(TDbGridStatus)}
  TDbGridStatus = DBGrids.TDbGridStatus;
{$endif}
{$if declared(TDataSetScrolledEvent)}
  TDataSetScrolledEvent = DBGrids.TDataSetScrolledEvent;
{$endif}
{$if declared(TFocusControlEvent)}
  TFocusControlEvent = DBGrids.TFocusControlEvent;
{$endif}
{$if declared(TDBGridClickEvent)}
  TDBGridClickEvent = DBGrids.TDBGridClickEvent;
{$endif}
{$if declared(TMovedEvent)}
  TMovedEvent = DBGrids.TMovedEvent;
{$endif}
{$if declared(TDrawColumnCellEvent)}
  TDrawColumnCellEvent = DBGrids.TDrawColumnCellEvent;
{$endif}
{$if declared(TGetDbEditMaskEvent)}
  TGetDbEditMaskEvent = DBGrids.TGetDbEditMaskEvent;
{$endif}
{$if declared(TDbGridSelEditorEvent)}
  TDbGridSelEditorEvent = DBGrids.TDbGridSelEditorEvent;
{$endif}
{$if declared(TPrepareDbGridCanvasEvent)}
  TPrepareDbGridCanvasEvent = DBGrids.TPrepareDbGridCanvasEvent;
{$endif}
{$if declared(TDbGridCheckBoxBitmapEvent)}
  TDbGridCheckBoxBitmapEvent = DBGrids.TDbGridCheckBoxBitmapEvent;
{$endif}
{$if declared(TDbGridCheckboxStateEvent)}
  TDbGridCheckboxStateEvent = DBGrids.TDbGridCheckboxStateEvent;
{$endif}
{$if declared(TDbGridCellHintEvent)}
  TDbGridCellHintEvent = DBGrids.TDbGridCellHintEvent;
{$endif}
{$if declared(TBookmarkList)}
  TBookmarkList = DBGrids.TBookmarkList;
{$endif}
{$if declared(TBookmarkedRecordEnumeratorOptions)}
  TBookmarkedRecordEnumeratorOptions = DBGrids.TBookmarkedRecordEnumeratorOptions;
{$endif}
{$if declared(TBookmarkedRecordEnumerator)}
  TBookmarkedRecordEnumerator = DBGrids.TBookmarkedRecordEnumerator;
{$endif}
{$if declared(TComponentDataLink)}
  TComponentDataLink = DBGrids.TComponentDataLink;
{$endif}
{$if declared(TColumnTitle)}
  TColumnTitle = DBGrids.TColumnTitle;
{$endif}
{$if declared(TColumnOrder)}
  TColumnOrder = DBGrids.TColumnOrder;
{$endif}
{$if declared(TDBGridColumns)}
  TDBGridColumns = DBGrids.TDBGridColumns;
{$endif}
{$if declared(TDBGrid)}
  TDBGrid = DBGrids.TDBGrid;
{$endif}
const
{$if declared(dgEditing)}
  dgEditing = DBGrids.dgEditing;
{$endif}
{$if declared(dgTitles)}
  dgTitles = DBGrids.dgTitles;
{$endif}
{$if declared(dgIndicator)}
  dgIndicator = DBGrids.dgIndicator;
{$endif}
{$if declared(dgColumnResize)}
  dgColumnResize = DBGrids.dgColumnResize;
{$endif}
{$if declared(dgColumnMove)}
  dgColumnMove = DBGrids.dgColumnMove;
{$endif}
{$if declared(dgColLines)}
  dgColLines = DBGrids.dgColLines;
{$endif}
{$if declared(dgRowLines)}
  dgRowLines = DBGrids.dgRowLines;
{$endif}
{$if declared(dgTabs)}
  dgTabs = DBGrids.dgTabs;
{$endif}
{$if declared(dgAlwaysShowEditor)}
  dgAlwaysShowEditor = DBGrids.dgAlwaysShowEditor;
{$endif}
{$if declared(dgRowSelect)}
  dgRowSelect = DBGrids.dgRowSelect;
{$endif}
{$if declared(dgAlwaysShowSelection)}
  dgAlwaysShowSelection = DBGrids.dgAlwaysShowSelection;
{$endif}
{$if declared(dgConfirmDelete)}
  dgConfirmDelete = DBGrids.dgConfirmDelete;
{$endif}
{$if declared(dgCancelOnExit)}
  dgCancelOnExit = DBGrids.dgCancelOnExit;
{$endif}
{$if declared(dgMultiselect)}
  dgMultiselect = DBGrids.dgMultiselect;
{$endif}
{$if declared(dgHeaderHotTracking)}
  dgHeaderHotTracking = DBGrids.dgHeaderHotTracking;
{$endif}
{$if declared(dgHeaderPushedLook)}
  dgHeaderPushedLook = DBGrids.dgHeaderPushedLook;
{$endif}
{$if declared(dgPersistentMultiSelect)}
  dgPersistentMultiSelect = DBGrids.dgPersistentMultiSelect;
{$endif}
{$if declared(dgAutoSizeColumns)}
  dgAutoSizeColumns = DBGrids.dgAutoSizeColumns;
{$endif}
{$if declared(dgAnyButtonCanSelect)}
  dgAnyButtonCanSelect = DBGrids.dgAnyButtonCanSelect;
{$endif}
{$if declared(dgDisableDelete)}
  dgDisableDelete = DBGrids.dgDisableDelete;
{$endif}
{$if declared(dgDisableInsert)}
  dgDisableInsert = DBGrids.dgDisableInsert;
{$endif}
{$if declared(dgCellHints)}
  dgCellHints = DBGrids.dgCellHints;
{$endif}
{$if declared(dgTruncCellHints)}
  dgTruncCellHints = DBGrids.dgTruncCellHints;
{$endif}
{$if declared(dgCellEllipsis)}
  dgCellEllipsis = DBGrids.dgCellEllipsis;
{$endif}
{$if declared(dgRowHighlight)}
  dgRowHighlight = DBGrids.dgRowHighlight;
{$endif}
{$if declared(dgThumbTracking)}
  dgThumbTracking = DBGrids.dgThumbTracking;
{$endif}
{$if declared(dgDblClickAutoSize)}
  dgDblClickAutoSize = DBGrids.dgDblClickAutoSize;
{$endif}
{$if declared(dgDisplayMemoText)}
  dgDisplayMemoText = DBGrids.dgDisplayMemoText;
{$endif}
{$if declared(dgeAutoColumns)}
  dgeAutoColumns = DBGrids.dgeAutoColumns;
{$endif}
{$if declared(dgeCheckboxColumn)}
  dgeCheckboxColumn = DBGrids.dgeCheckboxColumn;
{$endif}
{$if declared(gsUpdatingData)}
  gsUpdatingData = DBGrids.gsUpdatingData;
{$endif}
{$if declared(gsAddingAutoColumns)}
  gsAddingAutoColumns = DBGrids.gsAddingAutoColumns;
{$endif}
{$if declared(gsRemovingAutoColumns)}
  gsRemovingAutoColumns = DBGrids.gsRemovingAutoColumns;
{$endif}
{$if declared(gsAutoSized)}
  gsAutoSized = DBGrids.gsAutoSized;
{$endif}
{$if declared(gsStartEditing)}
  gsStartEditing = DBGrids.gsStartEditing;
{$endif}
{$if declared(gsLoadingGrid)}
  gsLoadingGrid = DBGrids.gsLoadingGrid;
{$endif}
{$if declared(coDesignOrder)}
  coDesignOrder = DBGrids.coDesignOrder;
{$endif}
{$if declared(coFieldIndexOrder)}
  coFieldIndexOrder = DBGrids.coFieldIndexOrder;
{$endif}
{$if declared(DEFINDICATORCOLWIDTH)}
  DEFINDICATORCOLWIDTH = DBGrids.DEFINDICATORCOLWIDTH;
{$endif}


implementation


end.
