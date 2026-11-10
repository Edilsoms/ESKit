{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Grids
  Gerado por tools/genvclcompat.py a partir de Grids.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Grids;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Classes, Types, LCLType, Graphics, Grids;
type
{$if declared(EGridException)}
  EGridException = Grids.EGridException;
{$endif}
{$if declared(TGridOption)}
  TGridOption = Grids.TGridOption;
{$endif}
{$if declared(TGridOptions)}
  TGridOptions = Grids.TGridOptions;
{$endif}
{$if declared(TGridOption2)}
  TGridOption2 = Grids.TGridOption2;
{$endif}
{$if declared(TGridOptions2)}
  TGridOptions2 = Grids.TGridOptions2;
{$endif}
{$if declared(TGridSaveOptions)}
  TGridSaveOptions = Grids.TGridSaveOptions;
{$endif}
{$if declared(TSaveOptions)}
  TSaveOptions = Grids.TSaveOptions;
{$endif}
{$if declared(TGridDrawState)}
  TGridDrawState = Grids.TGridDrawState;
{$endif}
{$if declared(TGridState)}
  TGridState = Grids.TGridState;
{$endif}
{$if declared(TGridZone)}
  TGridZone = Grids.TGridZone;
{$endif}
{$if declared(TGridZoneSet)}
  TGridZoneSet = Grids.TGridZoneSet;
{$endif}
{$if declared(TAutoAdvance)}
  TAutoAdvance = Grids.TAutoAdvance;
{$endif}
{$if declared(TRangeSelectMode)}
  TRangeSelectMode = Grids.TRangeSelectMode;
{$endif}
{$if declared(TItemType)}
  TItemType = Grids.TItemType;
{$endif}
{$if declared(TColumnButtonStyle)}
  TColumnButtonStyle = Grids.TColumnButtonStyle;
{$endif}
{$if declared(TTitleStyle)}
  TTitleStyle = Grids.TTitleStyle;
{$endif}
{$if declared(TGridFlagsOption)}
  TGridFlagsOption = Grids.TGridFlagsOption;
{$endif}
{$if declared(TGridFlags)}
  TGridFlags = Grids.TGridFlags;
{$endif}
{$if declared(TSortOrder)}
  TSortOrder = Grids.TSortOrder;
{$endif}
{$if declared(TPrefixOption)}
  TPrefixOption = Grids.TPrefixOption;
{$endif}
{$if declared(TMouseWheelOption)}
  TMouseWheelOption = Grids.TMouseWheelOption;
{$endif}
{$if declared(TCellHintPriority)}
  TCellHintPriority = Grids.TCellHintPriority;
{$endif}
{$if declared(TCellProcessType)}
  TCellProcessType = Grids.TCellProcessType;
{$endif}
{$if declared(TCustomGrid)}
  TCustomGrid = Grids.TCustomGrid;
{$endif}
{$if declared(TGridColumn)}
  TGridColumn = Grids.TGridColumn;
{$endif}
{$if declared(PCellProps)}
  PCellProps = Grids.PCellProps;
{$endif}
{$if declared(TCellProps)}
  TCellProps = Grids.TCellProps;
{$endif}
{$if declared(PColRowProps)}
  PColRowProps = Grids.PColRowProps;
{$endif}
{$if declared(TColRowProps)}
  TColRowProps = Grids.TColRowProps;
{$endif}
{$if declared(PGridMessage)}
  PGridMessage = Grids.PGridMessage;
{$endif}
{$if declared(TGridMessage)}
  TGridMessage = Grids.TGridMessage;
{$endif}
{$if declared(TStringCellEditor)}
  TStringCellEditor = Grids.TStringCellEditor;
{$endif}
{$if declared(TButtonCellEditor)}
  TButtonCellEditor = Grids.TButtonCellEditor;
{$endif}
{$if declared(TPickListCellEditor)}
  TPickListCellEditor = Grids.TPickListCellEditor;
{$endif}
{$if declared(TEditorItem)}
  TEditorItem = Grids.TEditorItem;
{$endif}
{$if declared(TCompositeCellEditor)}
  TCompositeCellEditor = Grids.TCompositeCellEditor;
{$endif}
{$if declared(TOnDrawCell)}
  TOnDrawCell = Grids.TOnDrawCell;
{$endif}
{$if declared(TOnSelectCellEvent)}
  TOnSelectCellEvent = Grids.TOnSelectCellEvent;
{$endif}
{$if declared(TOnSelectEvent)}
  TOnSelectEvent = Grids.TOnSelectEvent;
{$endif}
{$if declared(TGridOperationEvent)}
  TGridOperationEvent = Grids.TGridOperationEvent;
{$endif}
{$if declared(THdrEvent)}
  THdrEvent = Grids.THdrEvent;
{$endif}
{$if declared(TOnCompareCells)}
  TOnCompareCells = Grids.TOnCompareCells;
{$endif}
{$if declared(TSelectEditorEvent)}
  TSelectEditorEvent = Grids.TSelectEditorEvent;
{$endif}
{$if declared(TOnPrepareCanvasEvent)}
  TOnPrepareCanvasEvent = Grids.TOnPrepareCanvasEvent;
{$endif}
{$if declared(TUserCheckBoxBitmapEvent)}
  TUserCheckBoxBitmapEvent = Grids.TUserCheckBoxBitmapEvent;
{$endif}
{$if declared(TUserCheckBoxImageEvent)}
  TUserCheckBoxImageEvent = Grids.TUserCheckBoxImageEvent;
{$endif}
{$if declared(TValidateEntryEvent)}
  TValidateEntryEvent = Grids.TValidateEntryEvent;
{$endif}
{$if declared(TToggledCheckboxEvent)}
  TToggledCheckboxEvent = Grids.TToggledCheckboxEvent;
{$endif}
{$if declared(THeaderSizingEvent)}
  THeaderSizingEvent = Grids.THeaderSizingEvent;
{$endif}
{$if declared(TCellProcessEvent)}
  TCellProcessEvent = Grids.TCellProcessEvent;
{$endif}
{$if declared(TGetCellHintEvent)}
  TGetCellHintEvent = Grids.TGetCellHintEvent;
{$endif}
{$if declared(TSaveColumnEvent)}
  TSaveColumnEvent = Grids.TSaveColumnEvent;
{$endif}
{$if declared(TVirtualGrid)}
  TVirtualGrid = Grids.TVirtualGrid;
{$endif}
{$if declared(TGridColumnTitle)}
  TGridColumnTitle = Grids.TGridColumnTitle;
{$endif}
{$if declared(TGridPropertyBackup)}
  TGridPropertyBackup = Grids.TGridPropertyBackup;
{$endif}
{$if declared(TGridColumns)}
  TGridColumns = Grids.TGridColumns;
{$endif}
{$if declared(TGridRectArray)}
  TGridRectArray = Grids.TGridRectArray;
{$endif}
{$if declared(TSizingRec)}
  TSizingRec = Grids.TSizingRec;
{$endif}
{$if declared(TGridDataCache)}
  TGridDataCache = Grids.TGridDataCache;
{$endif}
{$if declared(TGridCursorState)}
  TGridCursorState = Grids.TGridCursorState;
{$endif}
{$if declared(TGridScrollerDoScroll)}
  TGridScrollerDoScroll = Grids.TGridScrollerDoScroll;
{$endif}
{$if declared(TGridScroller)}
  TGridScroller = Grids.TGridScroller;
{$endif}
{$if declared(TGetEditEvent)}
  TGetEditEvent = Grids.TGetEditEvent;
{$endif}
{$if declared(TSetEditEvent)}
  TSetEditEvent = Grids.TSetEditEvent;
{$endif}
{$if declared(TGetCheckboxStateEvent)}
  TGetCheckboxStateEvent = Grids.TGetCheckboxStateEvent;
{$endif}
{$if declared(TSetCheckboxStateEvent)}
  TSetCheckboxStateEvent = Grids.TSetCheckboxStateEvent;
{$endif}
{$if declared(TCustomDrawGrid)}
  TCustomDrawGrid = Grids.TCustomDrawGrid;
{$endif}
{$if declared(TDrawGrid)}
  TDrawGrid = Grids.TDrawGrid;
{$endif}
{$if declared(TCustomStringGrid)}
  TCustomStringGrid = Grids.TCustomStringGrid;
{$endif}
{$if declared(TStringGridStrings)}
  TStringGridStrings = Grids.TStringGridStrings;
{$endif}
{$if declared(TStringGrid)}
  TStringGrid = Grids.TStringGrid;
{$endif}
{$if declared(TGridCoord)}
  TGridCoord = Grids.TGridCoord;
{$endif}
{$if declared(TGridRect)}
  TGridRect = Grids.TGridRect;
{$endif}
const
{$if declared(goFixedVertLine)}
  goFixedVertLine = Grids.goFixedVertLine;
{$endif}
{$if declared(goFixedHorzLine)}
  goFixedHorzLine = Grids.goFixedHorzLine;
{$endif}
{$if declared(goVertLine)}
  goVertLine = Grids.goVertLine;
{$endif}
{$if declared(goHorzLine)}
  goHorzLine = Grids.goHorzLine;
{$endif}
{$if declared(goRangeSelect)}
  goRangeSelect = Grids.goRangeSelect;
{$endif}
{$if declared(goDrawFocusSelected)}
  goDrawFocusSelected = Grids.goDrawFocusSelected;
{$endif}
{$if declared(goRowSizing)}
  goRowSizing = Grids.goRowSizing;
{$endif}
{$if declared(goColSizing)}
  goColSizing = Grids.goColSizing;
{$endif}
{$if declared(goRowMoving)}
  goRowMoving = Grids.goRowMoving;
{$endif}
{$if declared(goColMoving)}
  goColMoving = Grids.goColMoving;
{$endif}
{$if declared(goEditing)}
  goEditing = Grids.goEditing;
{$endif}
{$if declared(goAutoAddRows)}
  goAutoAddRows = Grids.goAutoAddRows;
{$endif}
{$if declared(goTabs)}
  goTabs = Grids.goTabs;
{$endif}
{$if declared(goRowSelect)}
  goRowSelect = Grids.goRowSelect;
{$endif}
{$if declared(goAlwaysShowEditor)}
  goAlwaysShowEditor = Grids.goAlwaysShowEditor;
{$endif}
{$if declared(goThumbTracking)}
  goThumbTracking = Grids.goThumbTracking;
{$endif}
{$if declared(goColSpanning)}
  goColSpanning = Grids.goColSpanning;
{$endif}
{$if declared(goRelaxedRowSelect)}
  goRelaxedRowSelect = Grids.goRelaxedRowSelect;
{$endif}
{$if declared(goDblClickAutoSize)}
  goDblClickAutoSize = Grids.goDblClickAutoSize;
{$endif}
{$if declared(goSmoothScroll)}
  goSmoothScroll = Grids.goSmoothScroll;
{$endif}
{$if declared(goFixedRowNumbering)}
  goFixedRowNumbering = Grids.goFixedRowNumbering;
{$endif}
{$if declared(goScrollKeepVisible)}
  goScrollKeepVisible = Grids.goScrollKeepVisible;
{$endif}
{$if declared(goHeaderHotTracking)}
  goHeaderHotTracking = Grids.goHeaderHotTracking;
{$endif}
{$if declared(goHeaderPushedLook)}
  goHeaderPushedLook = Grids.goHeaderPushedLook;
{$endif}
{$if declared(goSelectionActive)}
  goSelectionActive = Grids.goSelectionActive;
{$endif}
{$if declared(goFixedColSizing)}
  goFixedColSizing = Grids.goFixedColSizing;
{$endif}
{$if declared(goDontScrollPartCell)}
  goDontScrollPartCell = Grids.goDontScrollPartCell;
{$endif}
{$if declared(goCellHints)}
  goCellHints = Grids.goCellHints;
{$endif}
{$if declared(goTruncCellHints)}
  goTruncCellHints = Grids.goTruncCellHints;
{$endif}
{$if declared(goCellEllipsis)}
  goCellEllipsis = Grids.goCellEllipsis;
{$endif}
{$if declared(goAutoAddRowsSkipContentCheck)}
  goAutoAddRowsSkipContentCheck = Grids.goAutoAddRowsSkipContentCheck;
{$endif}
{$if declared(goRowHighlight)}
  goRowHighlight = Grids.goRowHighlight;
{$endif}
{$if declared(goScrollToLastCol)}
  goScrollToLastCol = Grids.goScrollToLastCol;
{$endif}
{$if declared(goScrollToLastRow)}
  goScrollToLastRow = Grids.goScrollToLastRow;
{$endif}
{$if declared(goEditorParentColor)}
  goEditorParentColor = Grids.goEditorParentColor;
{$endif}
{$if declared(goEditorParentFont)}
  goEditorParentFont = Grids.goEditorParentFont;
{$endif}
{$if declared(goCopyWithoutTrailingLinebreak)}
  goCopyWithoutTrailingLinebreak = Grids.goCopyWithoutTrailingLinebreak;
{$endif}
{$if declared(soDesign)}
  soDesign = Grids.soDesign;
{$endif}
{$if declared(soAttributes)}
  soAttributes = Grids.soAttributes;
{$endif}
{$if declared(soContent)}
  soContent = Grids.soContent;
{$endif}
{$if declared(soPosition)}
  soPosition = Grids.soPosition;
{$endif}
{$if declared(gsNormal)}
  gsNormal = Grids.gsNormal;
{$endif}
{$if declared(gsSelecting)}
  gsSelecting = Grids.gsSelecting;
{$endif}
{$if declared(gsRowSizing)}
  gsRowSizing = Grids.gsRowSizing;
{$endif}
{$if declared(gsColSizing)}
  gsColSizing = Grids.gsColSizing;
{$endif}
{$if declared(gsRowMoving)}
  gsRowMoving = Grids.gsRowMoving;
{$endif}
{$if declared(gsColMoving)}
  gsColMoving = Grids.gsColMoving;
{$endif}
{$if declared(gsHeaderClicking)}
  gsHeaderClicking = Grids.gsHeaderClicking;
{$endif}
{$if declared(gsButtonColumnClicking)}
  gsButtonColumnClicking = Grids.gsButtonColumnClicking;
{$endif}
{$if declared(gzNormal)}
  gzNormal = Grids.gzNormal;
{$endif}
{$if declared(gzFixedCols)}
  gzFixedCols = Grids.gzFixedCols;
{$endif}
{$if declared(gzFixedRows)}
  gzFixedRows = Grids.gzFixedRows;
{$endif}
{$if declared(gzFixedCells)}
  gzFixedCells = Grids.gzFixedCells;
{$endif}
{$if declared(gzInvalid)}
  gzInvalid = Grids.gzInvalid;
{$endif}
{$if declared(aaNone)}
  aaNone = Grids.aaNone;
{$endif}
{$if declared(aaDown)}
  aaDown = Grids.aaDown;
{$endif}
{$if declared(aaRight)}
  aaRight = Grids.aaRight;
{$endif}
{$if declared(aaLeft)}
  aaLeft = Grids.aaLeft;
{$endif}
{$if declared(aaRightDown)}
  aaRightDown = Grids.aaRightDown;
{$endif}
{$if declared(aaLeftDown)}
  aaLeftDown = Grids.aaLeftDown;
{$endif}
{$if declared(aaRightUp)}
  aaRightUp = Grids.aaRightUp;
{$endif}
{$if declared(aaLeftUp)}
  aaLeftUp = Grids.aaLeftUp;
{$endif}
{$if declared(rsmSingle)}
  rsmSingle = Grids.rsmSingle;
{$endif}
{$if declared(rsmMulti)}
  rsmMulti = Grids.rsmMulti;
{$endif}
{$if declared(itNormal)}
  itNormal = Grids.itNormal;
{$endif}
{$if declared(itCell)}
  itCell = Grids.itCell;
{$endif}
{$if declared(itColumn)}
  itColumn = Grids.itColumn;
{$endif}
{$if declared(itRow)}
  itRow = Grids.itRow;
{$endif}
{$if declared(itFixed)}
  itFixed = Grids.itFixed;
{$endif}
{$if declared(itFixedColumn)}
  itFixedColumn = Grids.itFixedColumn;
{$endif}
{$if declared(itFixedRow)}
  itFixedRow = Grids.itFixedRow;
{$endif}
{$if declared(itSelected)}
  itSelected = Grids.itSelected;
{$endif}
{$if declared(cbsAuto)}
  cbsAuto = Grids.cbsAuto;
{$endif}
{$if declared(cbsEllipsis)}
  cbsEllipsis = Grids.cbsEllipsis;
{$endif}
{$if declared(cbsNone)}
  cbsNone = Grids.cbsNone;
{$endif}
{$if declared(cbsPickList)}
  cbsPickList = Grids.cbsPickList;
{$endif}
{$if declared(cbsCheckboxColumn)}
  cbsCheckboxColumn = Grids.cbsCheckboxColumn;
{$endif}
{$if declared(cbsButton)}
  cbsButton = Grids.cbsButton;
{$endif}
{$if declared(cbsButtonColumn)}
  cbsButtonColumn = Grids.cbsButtonColumn;
{$endif}
{$if declared(tsLazarus)}
  tsLazarus = Grids.tsLazarus;
{$endif}
{$if declared(tsStandard)}
  tsStandard = Grids.tsStandard;
{$endif}
{$if declared(tsNative)}
  tsNative = Grids.tsNative;
{$endif}
{$if declared(gfEditorUpdateLock)}
  gfEditorUpdateLock = Grids.gfEditorUpdateLock;
{$endif}
{$if declared(gfNeedsSelectActive)}
  gfNeedsSelectActive = Grids.gfNeedsSelectActive;
{$endif}
{$if declared(gfEditorTab)}
  gfEditorTab = Grids.gfEditorTab;
{$endif}
{$if declared(gfRevEditorTab)}
  gfRevEditorTab = Grids.gfRevEditorTab;
{$endif}
{$if declared(gfVisualChange)}
  gfVisualChange = Grids.gfVisualChange;
{$endif}
{$if declared(gfColumnsLocked)}
  gfColumnsLocked = Grids.gfColumnsLocked;
{$endif}
{$if declared(gfEditingDone)}
  gfEditingDone = Grids.gfEditingDone;
{$endif}
{$if declared(gfSizingStarted)}
  gfSizingStarted = Grids.gfSizingStarted;
{$endif}
{$if declared(gfPainting)}
  gfPainting = Grids.gfPainting;
{$endif}
{$if declared(gfUpdatingSize)}
  gfUpdatingSize = Grids.gfUpdatingSize;
{$endif}
{$if declared(gfClientRectChange)}
  gfClientRectChange = Grids.gfClientRectChange;
{$endif}
{$if declared(gfAutoEditPending)}
  gfAutoEditPending = Grids.gfAutoEditPending;
{$endif}
{$if declared(gfUpdatingScrollbar)}
  gfUpdatingScrollbar = Grids.gfUpdatingScrollbar;
{$endif}
{$if declared(soAscending)}
  soAscending = Grids.soAscending;
{$endif}
{$if declared(soDescending)}
  soDescending = Grids.soDescending;
{$endif}
{$if declared(poNone)}
  poNone = Grids.poNone;
{$endif}
{$if declared(poHeaderClick)}
  poHeaderClick = Grids.poHeaderClick;
{$endif}
{$if declared(mwCursor)}
  mwCursor = Grids.mwCursor;
{$endif}
{$if declared(mwGrid)}
  mwGrid = Grids.mwGrid;
{$endif}
{$if declared(chpAll)}
  chpAll = Grids.chpAll;
{$endif}
{$if declared(chpAllNoDefault)}
  chpAllNoDefault = Grids.chpAllNoDefault;
{$endif}
{$if declared(chpTruncOnly)}
  chpTruncOnly = Grids.chpTruncOnly;
{$endif}
{$if declared(cpCopy)}
  cpCopy = Grids.cpCopy;
{$endif}
{$if declared(cpPaste)}
  cpPaste = Grids.cpPaste;
{$endif}
{$if declared(gcsDefault)}
  gcsDefault = Grids.gcsDefault;
{$endif}
{$if declared(gcsColWidthChanging)}
  gcsColWidthChanging = Grids.gcsColWidthChanging;
{$endif}
{$if declared(gcsRowHeightChanging)}
  gcsRowHeightChanging = Grids.gcsRowHeightChanging;
{$endif}
{$if declared(gcsDragging)}
  gcsDragging = Grids.gcsDragging;
{$endif}
{$if declared(GRIDFILEVERSION)}
  GRIDFILEVERSION = Grids.GRIDFILEVERSION;
{$endif}
{$if declared(GM_SETVALUE)}
  GM_SETVALUE = Grids.GM_SETVALUE;
{$endif}
{$if declared(GM_GETVALUE)}
  GM_GETVALUE = Grids.GM_GETVALUE;
{$endif}
{$if declared(GM_SETGRID)}
  GM_SETGRID = Grids.GM_SETGRID;
{$endif}
{$if declared(GM_SETBOUNDS)}
  GM_SETBOUNDS = Grids.GM_SETBOUNDS;
{$endif}
{$if declared(GM_SELECTALL)}
  GM_SELECTALL = Grids.GM_SELECTALL;
{$endif}
{$if declared(GM_SETMASK)}
  GM_SETMASK = Grids.GM_SETMASK;
{$endif}
{$if declared(GM_SETPOS)}
  GM_SETPOS = Grids.GM_SETPOS;
{$endif}
{$if declared(GM_READY)}
  GM_READY = Grids.GM_READY;
{$endif}
{$if declared(GM_GETGRID)}
  GM_GETGRID = Grids.GM_GETGRID;
{$endif}
{$if declared(EO_AUTOSIZE)}
  EO_AUTOSIZE = Grids.EO_AUTOSIZE;
{$endif}
{$if declared(EO_HOOKKEYDOWN)}
  EO_HOOKKEYDOWN = Grids.EO_HOOKKEYDOWN;
{$endif}
{$if declared(EO_HOOKKEYPRESS)}
  EO_HOOKKEYPRESS = Grids.EO_HOOKKEYPRESS;
{$endif}
{$if declared(EO_HOOKKEYUP)}
  EO_HOOKKEYUP = Grids.EO_HOOKKEYUP;
{$endif}
{$if declared(EO_SELECTALL)}
  EO_SELECTALL = Grids.EO_SELECTALL;
{$endif}
{$if declared(EO_IMPLEMENTED)}
  EO_IMPLEMENTED = Grids.EO_IMPLEMENTED;
{$endif}
{$if declared(DEFCOLWIDTH)}
  DEFCOLWIDTH = Grids.DEFCOLWIDTH;
{$endif}
{$if declared(DEFBUTTONWIDTH)}
  DEFBUTTONWIDTH = Grids.DEFBUTTONWIDTH;
{$endif}
{$if declared(DEFIMAGEPADDING)}
  DEFIMAGEPADDING = Grids.DEFIMAGEPADDING;
{$endif}
{$if declared(DEFMINSIZE)}
  DEFMINSIZE = Grids.DEFMINSIZE;
{$endif}
{$if declared(DEFMAXSIZE)}
  DEFMAXSIZE = Grids.DEFMAXSIZE;
{$endif}
{$if declared(DEFSIZEPRIORITY)}
  DEFSIZEPRIORITY = Grids.DEFSIZEPRIORITY;
{$endif}
{$if declared(DefaultGridOptions)}
  DefaultGridOptions = Grids.DefaultGridOptions;
{$endif}
{$if declared(DefaultGridOptions2)}
  DefaultGridOptions2 = Grids.DefaultGridOptions2;
{$endif}
var
{$if declared(soAll)}
  soAll: TSaveOptions absolute Grids.soAll;
{$endif}
{$if declared(constRubberSpace)}
  constRubberSpace: byte absolute Grids.constRubberSpace;
{$endif}
{$if declared(constCellPadding)}
  constCellPadding: byte absolute Grids.constCellPadding;
{$endif}
{$if declared(constColRowBorderTolerance)}
  constColRowBorderTolerance: byte absolute Grids.constColRowBorderTolerance;
{$endif}
{$if declared(varRubberSpace)}
  varRubberSpace: byte absolute Grids.varRubberSpace;
{$endif}
{$if declared(varCellpadding)}
  varCellpadding: byte absolute Grids.varCellpadding;
{$endif}
{$if declared(varColRowBorderTolerance)}
  varColRowBorderTolerance: byte absolute Grids.varColRowBorderTolerance;
{$endif}
{$if declared(DrawRubberRect)}
procedure DrawRubberRect(Canvas: TCanvas; aRect: TRect; Color: TColor; DrawBits:Byte=BF_RECT); inline;
{$endif}
{$if declared(GetWorkingCanvas)}
function GetWorkingCanvas(const Canvas: TCanvas): TCanvas; inline;
{$endif}
{$if declared(FreeWorkingCanvas)}
procedure FreeWorkingCanvas(canvas: TCanvas); inline;
{$endif}

implementation

{$if declared(DrawRubberRect)}
procedure DrawRubberRect(Canvas: TCanvas; aRect: TRect; Color: TColor; DrawBits:Byte=BF_RECT);
begin
  Grids.DrawRubberRect(Canvas, aRect, Color, DrawBits);
end;

{$endif}
{$if declared(GetWorkingCanvas)}
function GetWorkingCanvas(const Canvas: TCanvas): TCanvas;
begin
  Result := Grids.GetWorkingCanvas(Canvas);
end;

{$endif}
{$if declared(FreeWorkingCanvas)}
procedure FreeWorkingCanvas(canvas: TCanvas);
begin
  Grids.FreeWorkingCanvas(canvas);
end;

{$endif}
end.
