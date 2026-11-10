{
 *****************************************************************************
  ESKit para Delphi (VCL) - EsGrid.pas
  TEsGrid - grade no estilo DevExpress cxGrid (TableView):
    * painel "Arraste um cabeçalho de coluna aqui para agrupar"
    * agrupamento multinível com expandir/recolher e resumo por grupo
    * ordenação multi-coluna (clique / Shift+clique / Ctrl+clique limpa)
    * linha de filtro automática (contém, =, <>, >, <, >=, <=)
    * painel de pesquisa (Find Panel) com realce dos resultados
    * rodapé com sumários (Soma, Contagem, Média, Mín, Máx)
    * redimensionar/mover colunas, "melhor ajuste", menu de cabeçalho
    * modo não vinculado (DataController.Values) ou vinculado (DataSource)
    * edição in-place, colunas booleanas como checkbox
    * exportação CSV e cópia para a área de transferência
    * visão em bandas (Bands + Column.BandIndex), visão em cartões (ViewMode =
      gvmCards) e mestre-detalhe (DetailGrid: uma grade filha por registro)

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,
  System.Math, System.Variants, System.UITypes, System.IniFiles, Vcl.Controls,
  Vcl.Graphics, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Clipbrd,
  Data.DB, EsGraphics, EsTheme, EsSkins;

type
  TEsGrid = class;
  TEsGridColumn = class;

  TEsSortOrder = (esoNone, esoAscending, esoDescending);
  TEsSummaryKind = (skNone, skSum, skCount, skAverage, skMin, skMax);
  TEsSummaryKinds = set of TEsSummaryKind;
  TEsIntegerArray = TArray<Integer>;
  TEsColumnAlignment = (caAuto, caLeft, caCenter, caRight);
  TEsDataKind = (dkAuto, dkString, dkNumber, dkDate, dkBoolean);
  { gvmTable = tabela; gvmBanded = tabela com bandas (cabeçalhos que agrupam
    colunas); gvmCards = um cartão por registro (cxGridCardView) }
  TEsGridViewMode = (gvmTable, gvmBanded, gvmCards);

  { TEsGridBand - faixa de cabeçalho que agrupa colunas (cxGridBandedTableView) }

  TEsGridBand = class(TCollectionItem)
  private
    FCaption: string;
    FVisible: Boolean;
    procedure SetCaption(const AValue: string);
    procedure SetVisible(AValue: Boolean);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(ACollection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    { soma das larguras das colunas visíveis da banda }
    function Width: Integer;
  published
    property Caption: string read FCaption write SetCaption;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

  { TEsGridBands }

  TEsGridBands = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TEsGridBand;
  protected
    procedure Update(Item: TCollectionItem); override;
    procedure Notify(Item: TCollectionItem; Action: TCollectionNotification); override;
  public
    constructor Create(AGrid: TEsGrid);
    function Add: TEsGridBand;
    { move a banda levando junto as suas colunas }
    procedure MoveBand(AFrom, ATo: Integer);
    property Items[Index: Integer]: TEsGridBand read GetItem; default;
  end;

  { TEsGridColumn }

  TEsGridColumn = class(TCollectionItem)
  private
    FCaption: string;
    FFieldName: string;
    FWidth: Integer;
    FMinWidth: Integer;
    FVisible: Boolean;
    FAlignment: TEsColumnAlignment;
    FSortOrder: TEsSortOrder;
    FSummaryKind: TEsSummaryKind;
    FFooterSummaries: TEsSummaryKinds;
    FGroupSummaries: TEsSummaryKinds;
    FSummaryFormat: string;
    FDisplayFormat: string;
    FDataKind: TEsDataKind;
    FReadOnly: Boolean;
    FAllowSort: Boolean;
    FAllowGroup: Boolean;
    FAllowFilter: Boolean;
    FFilterText: string;
    FBandIndex: Integer;
    FSlot: Integer;
    FTag: NativeInt;
    procedure SetBandIndex(AValue: Integer);
    procedure SetCaption(const AValue: string);
    procedure SetFieldName(const AValue: string);
    procedure SetWidth(AValue: Integer);
    procedure SetVisible(AValue: Boolean);
    procedure SetAlignment(AValue: TEsColumnAlignment);
    procedure SetSortOrder(AValue: TEsSortOrder);
    procedure SetSummaryKind(AValue: TEsSummaryKind);
    procedure SetFooterSummaries(AValue: TEsSummaryKinds);
    procedure SetGroupSummaries(AValue: TEsSummaryKinds);
    procedure SetDisplayFormat(const AValue: string);
    procedure SetFilterText(const AValue: string);
    function GetGroupIndex: Integer;
    procedure SetGroupIndex(AValue: Integer);
    function GetGrid: TEsGrid;
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(ACollection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    function ResolvedKind: TEsDataKind;
    function ResolvedAlignment: TAlignment;
    function FormatValue(const V: Variant): string;
    { sumários exibidos no rodapé (SummaryKind + FooterSummaries) }
    function FooterKinds: TEsSummaryKinds;
    function IsNumeric: Boolean;
    { chave usada para salvar o layout (FieldName, Caption ou ID) }
    function LayoutKey: string;
    { título exibido (Caption, ou FieldName se vazio) }
    function DisplayTitle: string;
    property Grid: TEsGrid read GetGrid;
    { posição no buffer de dados (estável mesmo se a coluna for movida) }
    property DataSlot: Integer read FSlot;
    property Tag: NativeInt read FTag write FTag;
  published
    property Caption: string read FCaption write SetCaption;
    property FieldName: string read FFieldName write SetFieldName;
    property Width: Integer read FWidth write SetWidth default 100;
    property MinWidth: Integer read FMinWidth write FMinWidth default 24;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Alignment: TEsColumnAlignment read FAlignment write SetAlignment default caAuto;
    property SortOrder: TEsSortOrder read FSortOrder write SetSortOrder default esoNone;
    { -1 = não agrupada; 0, 1, 2... = nível de agrupamento }
    property GroupIndex: Integer read GetGroupIndex write SetGroupIndex default -1;
    property SummaryKind: TEsSummaryKind read FSummaryKind write SetSummaryKind default skNone;
    { vários sumários por coluna, como no cxGrid (rodapé e grupo) }
    property FooterSummaries: TEsSummaryKinds read FFooterSummaries write SetFooterSummaries default [];
    property GroupSummaries: TEsSummaryKinds read FGroupSummaries write SetGroupSummaries default [];
    { ex.: 'Total: %s' - recebe o valor já formatado }
    property SummaryFormat: string read FSummaryFormat write FSummaryFormat;
    { FormatFloat para números, FormatDateTime para datas }
    property DisplayFormat: string read FDisplayFormat write SetDisplayFormat;
    property DataKind: TEsDataKind read FDataKind write FDataKind default dkAuto;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
    property AllowSort: Boolean read FAllowSort write FAllowSort default True;
    property AllowGroup: Boolean read FAllowGroup write FAllowGroup default True;
    property AllowFilter: Boolean read FAllowFilter write FAllowFilter default True;
    property FilterText: string read FFilterText write SetFilterText;
    { banda da coluna na visão em bandas (-1 = sem banda) }
    property BandIndex: Integer read FBandIndex write SetBandIndex default -1;
  end;

  { TEsGridColumns }

  TEsGridColumns = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TEsGridColumn;
  protected
    procedure Update(Item: TCollectionItem); override;
    procedure Notify(Item: TCollectionItem; Action: TCollectionNotification); override;
  public
    constructor Create(AGrid: TEsGrid);
    function Add: TEsGridColumn;
    function ColumnByFieldName(const AFieldName: string): TEsGridColumn;
    property Items[Index: Integer]: TEsGridColumn read GetItem; default;
  end;

  TEsRecord = TArray<Variant>;

  { TEsDataController - armazena os registros em memória (como o cxGrid) }

  TEsDataController = class
  private
    FGrid: TEsGrid;
    FRecords: TArray<TEsRecord>;
    FRecNos: TArray<Integer>;   // RecNo do DataSet de origem (modo vinculado)
    FCount: Integer;
    FUpdateCount: Integer;
    function GetValue(ARecordIndex, AColumnIndex: Integer): Variant;
    procedure SetValue(ARecordIndex, AColumnIndex: Integer; const AValue: Variant);
    procedure SetRecordCount(AValue: Integer);
    function GetFocusedRecordIndex: Integer;
    procedure SetFocusedRecordIndex(AValue: Integer);
  protected
    procedure Changed;
  public
    constructor Create(AGrid: TEsGrid);
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Clear;
    function AppendRecord: Integer; overload;
    function AppendRecord(const AValues: array of Variant): Integer; overload;
    procedure DeleteRecord(ARecordIndex: Integer);
    function GetSlotValue(ARecordIndex, ASlot: Integer): Variant;
    procedure SetSlotValue(ARecordIndex, ASlot: Integer; const AValue: Variant);
    function RecNoOf(ARecordIndex: Integer): Integer;
    property RecordCount: Integer read FCount write SetRecordCount;
    property Values[ARecordIndex, AColumnIndex: Integer]: Variant read GetValue write SetValue;
    property FocusedRecordIndex: Integer read GetFocusedRecordIndex write SetFocusedRecordIndex;
  end;

  { vrkDetail: linhas reservadas para a grade de detalhe de um registro }
  TEsViewRowKind = (vrkData, vrkGroup, vrkDetail);

  TEsViewRow = record
    Kind: TEsViewRowKind;
    Level: Integer;
    RecIndex: Integer;          // vrkData
    DetailRec: Integer;         // vrkDetail: registro mestre
    DetailPart: Integer;        // vrkDetail: 0..n-1 dentro da área do detalhe
    GroupColumn: TEsGridColumn; // vrkGroup
    GroupValue: Variant;
    GroupKey: string;
    Expanded: Boolean;
    FirstSorted, LastSorted: Integer; // faixa em FSorted (registros do grupo)
  end;

  TEsHitArea = (shaNone, shaGroupPanel, shaGroupChip, shaHeader, shaHeaderEdge,
    shaIndicator, shaFilterCell, shaDataCell, shaGroupRow, shaExpandButton,
    shaFooter, shaEmpty, shaBandHeader, shaDetailButton, shaDetailArea);

  TEsHitInfo = record
    Area: TEsHitArea;
    Column: TEsGridColumn;
    ViewRow: Integer;
    ChipIndex: Integer;
  end;

  { linha da visão em cartões: um cabeçalho de grupo ou uma fileira de cartões }
  TEsCardLine = record
    IsGroup: Boolean;
    FirstRow, LastRow: Integer;  // linhas da visão (FRows)
    Left: Integer;               // x do primeiro cartão
    Height: Integer;
  end;

  { TEsGridOptionsCard - aparência da visão em cartões }

  TEsGridOptionsCard = class(TPersistent)
  private
    FGrid: TEsGrid;
    FCardWidth: Integer;
    FLabelWidth: Integer;
    FSpacing: Integer;
    FShowLabels: Boolean;
    FTitleField: string;
    procedure SetCardWidth(AValue: Integer);
    procedure SetLabelWidth(AValue: Integer);
    procedure SetSpacing(AValue: Integer);
    procedure SetShowLabels(AValue: Boolean);
    procedure SetTitleField(const AValue: string);
    procedure Changed;
  public
    constructor Create(AGrid: TEsGrid);
    procedure Assign(Source: TPersistent); override;
  published
    property CardWidth: Integer read FCardWidth write SetCardWidth default 260;
    property LabelWidth: Integer read FLabelWidth write SetLabelWidth default 100;
    property Spacing: Integer read FSpacing write SetSpacing default 10;
    property ShowLabels: Boolean read FShowLabels write SetShowLabels default True;
    { FieldName da coluna exibida como título do cartão (vazio = 1ª visível) }
    property TitleField: string read FTitleField write SetTitleField;
  end;

  TEsDetailEvent = procedure(Sender: TEsGrid; AMasterRecord: Integer;
    ADetail: TEsGrid) of object;

  { TEsGridOptionsView }

  TEsGridOptionsView = class(TPersistent)
  private
    FGrid: TEsGrid;
    FGroupByBox: Boolean;
    FFilterRow: Boolean;
    FFooter: Boolean;
    FFindPanel: Boolean;
    FIndicator: Boolean;
    FStriped: Boolean;
    FGridLines: Boolean;
    FExpandGroupsByDefault: Boolean;
    FGroupSummaryInRow: Boolean;
    FCellAutoHeight: Boolean;
    procedure SetBool(Index: Integer; AValue: Boolean);
    function GetBool(Index: Integer): Boolean;
  public
    constructor Create(AGrid: TEsGrid);
    procedure Assign(Source: TPersistent); override;
  published
    property GroupByBox: Boolean index 0 read GetBool write SetBool default True;
    property FilterRow: Boolean index 1 read GetBool write SetBool default False;
    property Footer: Boolean index 2 read GetBool write SetBool default False;
    property FindPanel: Boolean index 3 read GetBool write SetBool default False;
    property Indicator: Boolean index 4 read GetBool write SetBool default True;
    property Striped: Boolean index 5 read GetBool write SetBool default True;
    property GridLines: Boolean index 6 read GetBool write SetBool default True;
    property ExpandGroupsByDefault: Boolean index 7 read GetBool write SetBool default True;
    property GroupSummaryInRow: Boolean index 8 read GetBool write SetBool default True;
  end;

  { TEsGridDataLink }

  TEsGridDataLink = class(TDataLink)
  private
    FGrid: TEsGrid;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    procedure LayoutChanged; override;
  public
    constructor Create(AGrid: TEsGrid);
  end;

  TEsCustomDrawCellEvent = procedure(Sender: TEsGrid; ACanvas: TCanvas;
    const ARect: TRect; ARecordIndex: Integer; AColumn: TEsGridColumn;
    ASelected: Boolean; var ADone: Boolean) of object;
  TEsGetDisplayTextEvent = procedure(Sender: TEsGrid; ARecordIndex: Integer;
    AColumn: TEsGridColumn; var AText: string) of object;
  TEsCellEvent = procedure(Sender: TEsGrid; ARecordIndex: Integer;
    AColumn: TEsGridColumn) of object;
  TEsValidateEvent = procedure(Sender: TEsGrid; ARecordIndex: Integer;
    AColumn: TEsGridColumn; var AValue: Variant; var AAccept: Boolean) of object;

  { TEsGrid }

  TEsGrid = class(TCustomControl)
  private
    FColumns: TEsGridColumns;
    FData: TEsDataController;
    FOptionsView: TEsGridOptionsView;
    FDataLink: TEsGridDataLink;
    FNextSlot: Integer;
    // estado da visão
    FGroupCols: TList;
    FSortCols: TList;
    FFiltered: TArray<Integer>;
    FSorted: TArray<Integer>;
    FRows: TArray<TEsViewRow>;
    FRowCount: Integer;
    FToggled: TStringList;
    FVisCols: TArray<TEsGridColumn>;
    FNeedRebuild: Boolean;
    FUpdateLock: Integer;
    // rolagem / foco
    FTopRow: Integer;
    FHOffset: Integer;
    FFocusedRow: Integer;
    FFocusedCol: Integer;
    FVScroll: TScrollBar;
    FHScroll: TScrollBar;
    FScrolling: Boolean;
    // métricas
    FRowHeight: Integer;
    // pesquisa
    FFindPanelCtl: TPanel;
    FFindEdit: TEdit;
    FFindText: string;
    // mouse
    FHotHeader: TEsGridColumn;
    FDownHit: TEsHitInfo;
    FDownPos: TPoint;
    FDragging: Boolean;
    FDragPos: TPoint;
    FResizeCol: TEsGridColumn;
    FResizeStartW: Integer;
    // edição
    FEditor: TEdit;
    FEditCol: TEsGridColumn;
    FEditRec: Integer;
    FEditIsFilter: Boolean;
    FHeaderMenu: TPopupMenu;
    FMenuCol: TEsGridColumn;
    FSyncingDataSet: Boolean;
    FLoadingDataSet: Boolean;
    FReadOnly: Boolean;
    FLastSize: TPoint;
    // bandas / cartões
    FBands: TEsGridBands;
    FViewMode: TEsGridViewMode;
    FOptionsCard: TEsGridOptionsCard;
    FCardLines: TArray<TEsCardLine>;
    FCardLayoutValid: Boolean;
    // mestre-detalhe
    FDetailTemplate: TEsGrid;
    FMasterKeyField: string;
    FDetailKeyField: string;
    FDetailHeight: Integer;
    FDetailOpen: TStringList;      // chave do mestre -> grade filha (Objects)
    FMasterGrid: TEsGrid;          // nas grades filhas: a grade mestre
    FDetailSourceRecs: TArray<Integer>; // nas filhas: registro no modelo
    FRefreshingDetails: Boolean;
    FWritingBack: Boolean;
    FOnGetDetailRecords: TEsDetailEvent;
    FOnDetailExpanded: TEsDetailEvent;
    // seleção múltipla
    FMultiSelect: Boolean;
    FSelected: TArray<Boolean>;
    FAnchorRow: Integer;
    FStateHandlers: TEsNotifyList;
    FOnSelectionChanged: TNotifyEvent;
    // eventos
    FOnFocusedRecordChanged: TNotifyEvent;
    FOnCustomDrawCell: TEsCustomDrawCellEvent;
    FOnGetDisplayText: TEsGetDisplayTextEvent;
    FOnCellDblClick: TEsCellEvent;
    FOnValidateValue: TEsValidateEvent;
    FOnDataChanged: TNotifyEvent;
    procedure SetColumns(AValue: TEsGridColumns);
    procedure SetOptionsView(AValue: TEsGridOptionsView);
    function GetDataSource: TDataSource;
    procedure SetDataSource(AValue: TDataSource);
    procedure ScrollBarChange(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure FindEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FindClearClick(Sender: TObject);
    procedure EditorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditorExit(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure ThemeChanged(Sender: TObject);
    procedure HeaderMenuClick(Sender: TObject);
    procedure AsyncFocusEditor(Data: NativeInt);
    procedure AsyncShowEditor(Data: NativeInt);
    procedure PostAsync(AKind: Integer);
    procedure WMEsAsync(var Message: TMessage); message WM_USER + $3E1;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    function GetFocusedRecordIndex: Integer;
    procedure SetFocusedRecordIndex(AValue: Integer);
    function GetFocusedColumn: TEsGridColumn;
    function GetGroupCount: Integer;
    function GetViewRow(Index: Integer): TEsViewRow;
    procedure SetMultiSelect(AValue: Boolean);
    procedure SetBands(AValue: TEsGridBands);
    procedure SetViewMode(AValue: TEsGridViewMode);
    procedure SetOptionsCard(AValue: TEsGridOptionsCard);
    procedure SetDetailTemplate(AValue: TEsGrid);
    procedure SetDetailHeight(AValue: Integer);
    procedure SetMasterKeyField(const AValue: string);
    procedure SetDetailKeyField(const AValue: string);
    procedure DetailTemplateChanged(Sender: TObject);
    procedure SelectionChanged;
    procedure SelectViewRange(AFromRow, AToRow: Integer; AKeep: Boolean);
  protected
    // estrutura
    procedure ColumnsChanged;
    procedure DataChanged;
    procedure Rebuild;
    procedure EnsureBuilt;
    function CompareRecords(A, B: Integer): Integer;
    function RecordPassesFilter(ARec: Integer): Boolean;
    function ValueMatchesFilter(AColumn: TEsGridColumn; const V: Variant;
      const AFilter: string): Boolean;
    procedure SortIndices(var A: TArray<Integer>);
    // geometria
    function FindPanelHeight: Integer;
    function GroupPanelHeight: Integer;
    function HeaderTop: Integer;
    function HeaderHeight: Integer;
    function FilterRowTop: Integer;
    function DataTop: Integer;
    function DataBottom: Integer;
    function FooterTop: Integer;
    function ClientW: Integer;
    function IndicatorWidth: Integer;
    function IndentWidth: Integer;
    function ColumnsLeft: Integer;
    function ColumnX(AColumn: TEsGridColumn): Integer;
    function TotalColumnsWidth: Integer;
    function VisibleRowCount: Integer;
    function ChipRect(Index: Integer): TRect;
    function CellRect(AViewRow: Integer; AColumn: TEsGridColumn): TRect;
    procedure UpdateScrollBars;
    procedure UpdateMetrics;
    function FixedLeft: Integer;
    function BandRowHeight: Integer;
    function IsBanded: Boolean;
    function IsCardMode: Boolean;
    function ScrollCount: Integer;
    // cartões
    function CardTitleColumn: TEsGridColumn;
    function CardHeight: Integer;
    function CardsPerLine(ALevel: Integer): Integer;
    procedure EnsureCardLayout;
    function CardLineOfRow(AViewRow: Integer): Integer;
    function CardLinesFitting(AFirstLine: Integer): Integer;
    function CardMaxTop: Integer;
    function CardRect(AViewRow: Integer): TRect;
    function CardFieldRect(AViewRow, AFieldIndex: Integer): TRect;
    // mestre-detalhe
    function DetailButtonWidth: Integer;
    function DetailRowSpan: Integer;
    function DetailKey(ARecordIndex: Integer): string;
    procedure FillDetail(ADetail: TEsGrid; AMasterRecord: Integer);
    procedure LayoutDetails;
    // desenho
    procedure Paint; override;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure PaintGroupPanel(const R: TRect);
    procedure PaintHeader(const R: TRect);
    procedure PaintFilterRow(const R: TRect);
    procedure PaintRows;
    procedure PaintGroupRow(AViewRow, Y: Integer);
    procedure PaintBands(const R: TRect);
    procedure PaintCards;
    procedure PaintFooter(const R: TRect);
    procedure PaintCellText(const R: TRect; const S: string; AAlign: TAlignment;
      AColor: TColor; AHighlight: Boolean);
    // interação
    function HitTest(X, Y: Integer): TEsHitInfo;
    function HitTestCards(X, Y: Integer; var AHit: TEsHitInfo): Boolean;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure DblClick; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
    procedure Resize; override;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    procedure HeaderClick(AColumn: TEsGridColumn; Shift: TShiftState);
    procedure ShowHeaderMenu(AColumn: TEsGridColumn; X, Y: Integer);
    procedure FocusRow(AViewRow: Integer; Shift: TShiftState = []);
    procedure MakeRowVisible(AViewRow: Integer);
    procedure MakeColumnVisible(AColumn: TEsGridColumn);
    procedure SyncDataSetPosition;
    procedure FocusRecordByRecNo(ARecNo: Integer);
    class function GetControlClassDefaultSize: TSize;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BeginUpdate;
    procedure EndUpdate;
    { agrupamento / ordenação }
    procedure GroupBy(AColumn: TEsGridColumn; ALevel: Integer = -1);
    procedure UngroupColumn(AColumn: TEsGridColumn);
    procedure ClearGrouping;
    procedure ClearSorting;
    procedure ClearFilter;
    procedure FullExpand;
    procedure FullCollapse;
    procedure ApplyBestFit(AColumn: TEsGridColumn = nil);
    { dados }
    procedure LoadFromDataSet(ADataSet: TDataSet);
    procedure CreateColumnsFromDataSet(ADataSet: TDataSet);
    function DisplayText(ARecordIndex: Integer; AColumn: TEsGridColumn): string;
    function GetCellValue(ARecordIndex: Integer; AColumn: TEsGridColumn): Variant;
    procedure SetCellValue(ARecordIndex: Integer; AColumn: TEsGridColumn; const AValue: Variant);
    function SummaryText(AColumn: TEsGridColumn; AFirstSorted, ALastSorted: Integer): string;
    function SummaryKindText(AColumn: TEsGridColumn; AKind: TEsSummaryKind;
      AFirstSorted, ALastSorted: Integer): string;
    function SummaryValue(AColumn: TEsGridColumn; AKind: TEsSummaryKind;
      AFirstSorted, ALastSorted: Integer): Variant;
    function HasFooterSummaries: Boolean;
    function HasGroupSummaries: Boolean;
    procedure AddFooterSummary(AColumn: TEsGridColumn; AKind: TEsSummaryKind);
    procedure AddGroupSummary(AColumn: TEsGridColumn; AKind: TEsSummaryKind);
    procedure RemoveAllSummaries;
    { seleção múltipla (OptionsSelection.MultiSelect do cxGrid) }
    function IsRecordSelected(ARecordIndex: Integer): Boolean;
    procedure SelectRecord(ARecordIndex: Integer; ASelect: Boolean);
    procedure SelectAll;
    procedure ClearSelection;
    function SelectedRecordCount: Integer;
    function SelectedRecords: TEsIntegerArray;
    { layout (equivale a StoreToIniFile/RestoreFromIniFile do cxGrid) }
    procedure StoreToIniFile(const AFileName: string);
    procedure RestoreFromIniFile(const AFileName: string);
    procedure StoreToIni(AIni: TCustomIniFile; const APrefix: string = 'EsGrid');
    procedure RestoreFromIni(AIni: TCustomIniFile; const APrefix: string = 'EsGrid');
    function ColumnSortIndex(AColumn: TEsGridColumn): Integer;
    { notificação de mudança de estado (agrupamento, seleção, sumários...) }
    procedure AddStateChangeHandler(const AHandler: TNotifyEvent);
    procedure RemoveStateChangeHandler(const AHandler: TNotifyEvent);
    function ViewRecordCount: Integer;
    function ViewRecordIndex(AIndex: Integer): Integer;
    { colunas agrupadas (na ordem do agrupamento) e colunas visíveis na área de dados }
    function GroupColumn(AIndex: Integer): TEsGridColumn;
    function VisibleColumnCount: Integer;
    function VisibleColumn(AIndex: Integer): TEsGridColumn;
    { banda de uma coluna visível (nil = sem banda ou fora da visão em bandas) }
    function ColumnBand(AColumn: TEsGridColumn): TEsGridBand;
    { mestre-detalhe }
    function HasDetails: Boolean;
    function IsDetailExpanded(ARecordIndex: Integer): Boolean;
    procedure ExpandDetail(ARecordIndex: Integer);
    procedure CollapseDetail(ARecordIndex: Integer);
    procedure ToggleDetail(ARecordIndex: Integer);
    procedure CollapseAllDetails;
    { recarrega as grades de detalhe abertas a partir do modelo }
    procedure RefreshDetails;
    function DetailGridOf(ARecordIndex: Integer): TEsGrid;
    { nas grades de detalhe: a grade mestre (nil nas demais) }
    property MasterGrid: TEsGrid read FMasterGrid;
    { edição }
    procedure ShowEditor;
    procedure HideEditor(ACommit: Boolean);
    function Editing: Boolean;
    { exportação }
    procedure ExportToCSV(const AFileName: string; ASeparator: Char = ';');
    procedure CopyToClipboard(AOnlyFocused: Boolean = False);
    property DataController: TEsDataController read FData;
    property FocusedRecordIndex: Integer read GetFocusedRecordIndex write SetFocusedRecordIndex;
    property FocusedColumn: TEsGridColumn read GetFocusedColumn;
    property FocusedViewRow: Integer read FFocusedRow;
    property ViewRowCount: Integer read FRowCount;
    property ViewRows[Index: Integer]: TEsViewRow read GetViewRow;
    property GroupCount: Integer read GetGroupCount;
    property FindText: string read FFindText;
  published
    property Columns: TEsGridColumns read FColumns write SetColumns;
    property OptionsView: TEsGridOptionsView read FOptionsView write SetOptionsView;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property ViewMode: TEsGridViewMode read FViewMode write SetViewMode default gvmTable;
    property Bands: TEsGridBands read FBands write SetBands;
    property OptionsCard: TEsGridOptionsCard read FOptionsCard write SetOptionsCard;
    { mestre-detalhe: grade modelo (colunas, opções e todos os registros de
      detalhe; pode ficar invisível). Cada registro mestre expandido ganha uma
      cópia dela filtrada por DetailKeyField = valor de MasterKeyField. }
    property DetailGrid: TEsGrid read FDetailTemplate write SetDetailTemplate;
    property MasterKeyField: string read FMasterKeyField write SetMasterKeyField;
    property DetailKeyField: string read FDetailKeyField write SetDetailKeyField;
    property DetailHeight: Integer read FDetailHeight write SetDetailHeight default 180;
    { preenche a grade de detalhe por código (substitui o filtro por chave) }
    property OnGetDetailRecords: TEsDetailEvent read FOnGetDetailRecords write FOnGetDetailRecords;
    property OnDetailExpanded: TEsDetailEvent read FOnDetailExpanded write FOnDetailExpanded;
    property OnSelectionChanged: TNotifyEvent read FOnSelectionChanged write FOnSelectionChanged;
    property OnFocusedRecordChanged: TNotifyEvent read FOnFocusedRecordChanged write FOnFocusedRecordChanged;
    property OnCustomDrawCell: TEsCustomDrawCellEvent read FOnCustomDrawCell write FOnCustomDrawCell;
    property OnGetDisplayText: TEsGetDisplayTextEvent read FOnGetDisplayText write FOnGetDisplayText;
    property OnCellDblClick: TEsCellEvent read FOnCellDblClick write FOnCellDblClick;
    property OnValidateValue: TEsValidateEvent read FOnValidateValue write FOnValidateValue;
    property OnDataChanged: TNotifyEvent read FOnDataChanged write FOnDataChanged;
    property Align;
    property Anchors;
    property AlignWithMargins;
    property Margins;
    property Constraints;
    property Enabled;
    property Font;
    property ParentFont;
    property PopupMenu;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnMouseDown;
    property OnMouseUp;
  end;

resourcestring
  rsEsGroupByBoxHint = 'Arraste um cabeçalho de coluna aqui para agrupar por essa coluna';
  rsEsFilterRowHint = 'Clique aqui para definir um filtro';
  rsEsFindHint = 'Digite o texto a pesquisar...';
  rsEsFindClear = 'Limpar';
  rsEsNoData = '<Sem dados para exibir>';
  rsEsSortAsc = 'Ordenar crescente';
  rsEsSortDesc = 'Ordenar decrescente';
  rsEsClearSort = 'Limpar ordenação';
  rsEsGroupByThis = 'Agrupar por esta coluna';
  rsEsUngroup = 'Desagrupar';
  rsEsGroupBox = 'Painel de agrupamento';
  rsEsFooter = 'Rodapé';
  rsEsFilterRowMenu = 'Linha de filtro';
  rsEsFindPanelMenu = 'Painel de pesquisa';
  rsEsBestFit = 'Melhor ajuste';
  rsEsBestFitAll = 'Melhor ajuste (todas as colunas)';
  rsEsExpandAll = 'Expandir tudo';
  rsEsCollapseAll = 'Recolher tudo';
  rsEsHideColumn = 'Ocultar esta coluna';
  rsEsSumFmtCount = 'Registros: %s';
  rsEsSumFmtSum = 'Soma: %s';
  rsEsSumFmtAvg = 'Média: %s';
  rsEsSumFmtMin = 'Mín: %s';
  rsEsSumFmtMax = 'Máx: %s';
  rsEsSumSum = 'Σ';
  rsEsSumCount = 'Nº';
  rsEsSumAvg = 'Méd';
  rsEsSumMin = 'Mín';
  rsEsSumMax = 'Máx';
  rsEsItems = 'registros';
  rsEsTrue = 'Sim';
  rsEsFalse = 'Não';
  rsEsViewTable = 'Visão em tabela';
  rsEsViewBanded = 'Visão em bandas';
  rsEsViewCards = 'Visão em cartões';
  rsEsCollapseDetails = 'Recolher detalhes';

implementation

type
  { editor da célula: quer Tab e setas (na VCL o Tab mudaria o foco) }
  TEsGridInplaceEdit = class(TEdit)
  protected
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
  end;

procedure TEsGridInplaceEdit.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  Message.Result := Message.Result or DLGC_WANTTAB or DLGC_WANTARROWS;
end;

const
  ChipH = 22;
  // ordem de exibição dos sumários: Registros | Soma | Média | Mín | Máx
  SummaryOrder: array[0..4] of TEsSummaryKind = (skCount, skSum, skAverage, skMin, skMax);

{ helpers de variant }

function EsVarIsEmptyOrNull(const V: Variant): Boolean; inline;
begin
  Result := VarIsEmpty(V) or VarIsNull(V);
end;

function VarIsNumericOrDate(const V: Variant): Boolean;
begin
  Result := not EsVarIsEmptyOrNull(V) and
    (VarIsNumeric(V) or (VarType(V) = varDate) or VarIsType(V, varBoolean));
end;

function CompareVariants(const A, B: Variant): Integer;
var
  DA, DB: Double;
begin
  if EsVarIsEmptyOrNull(A) then
  begin
    if EsVarIsEmptyOrNull(B) then Exit(0) else Exit(-1);
  end;
  if EsVarIsEmptyOrNull(B) then Exit(1);
  if VarIsNumericOrDate(A) and VarIsNumericOrDate(B) then
  begin
    DA := VarAsType(A, varDouble);
    DB := VarAsType(B, varDouble);
    if DA < DB then Result := -1
    else if DA > DB then Result := 1
    else Result := 0;
  end
  else
    Result := AnsiCompareText(VarToStr(A), VarToStr(B));
end;

{ TEsGridColumn }

constructor TEsGridColumn.Create(ACollection: TCollection);
var
  G: TEsGrid;
begin
  inherited Create(ACollection);
  FWidth := 100;
  FMinWidth := 24;
  FVisible := True;
  FAllowSort := True;
  FAllowGroup := True;
  FAllowFilter := True;
  FBandIndex := -1;
  G := GetGrid;
  if G <> nil then
  begin
    FSlot := G.FNextSlot;
    Inc(G.FNextSlot);
  end;
end;

function TEsGridColumn.GetGrid: TEsGrid;
begin
  if (Collection <> nil) and (TEsGridColumns(Collection).Owner is TEsGrid) then
    Result := TEsGrid(TEsGridColumns(Collection).Owner)
  else
    Result := nil;
end;

procedure TEsGridColumn.Assign(Source: TPersistent);
var
  S: TEsGridColumn;
begin
  if Source is TEsGridColumn then
  begin
    S := TEsGridColumn(Source);
    FCaption := S.FCaption;
    FFieldName := S.FFieldName;
    FWidth := S.FWidth;
    FMinWidth := S.FMinWidth;
    FVisible := S.FVisible;
    FAlignment := S.FAlignment;
    FSummaryKind := S.FSummaryKind;
    FFooterSummaries := S.FFooterSummaries;
    FGroupSummaries := S.FGroupSummaries;
    FSummaryFormat := S.FSummaryFormat;
    FDisplayFormat := S.FDisplayFormat;
    FDataKind := S.FDataKind;
    FReadOnly := S.FReadOnly;
    FAllowSort := S.FAllowSort;
    FAllowGroup := S.FAllowGroup;
    FAllowFilter := S.FAllowFilter;
    FBandIndex := S.FBandIndex;
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

function TEsGridColumn.GetDisplayName: string;
begin
  if FCaption <> '' then Result := FCaption
  else if FFieldName <> '' then Result := FFieldName
  else Result := inherited GetDisplayName;
end;

procedure TEsGridColumn.SetBandIndex(AValue: Integer);
begin
  if AValue < -1 then AValue := -1;
  if FBandIndex = AValue then Exit;
  FBandIndex := AValue;
  Changed(False);
end;

procedure TEsGridColumn.SetCaption(const AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  Changed(False);
end;

procedure TEsGridColumn.SetFieldName(const AValue: string);
begin
  if FFieldName = AValue then Exit;
  FFieldName := AValue;
  Changed(False);
end;

procedure TEsGridColumn.SetWidth(AValue: Integer);
begin
  AValue := Max(AValue, FMinWidth);
  if FWidth = AValue then Exit;
  FWidth := AValue;
  Changed(False);
end;

procedure TEsGridColumn.SetVisible(AValue: Boolean);
begin
  if FVisible = AValue then Exit;
  FVisible := AValue;
  Changed(False);
end;

procedure TEsGridColumn.SetAlignment(AValue: TEsColumnAlignment);
begin
  if FAlignment = AValue then Exit;
  FAlignment := AValue;
  Changed(False);
end;

procedure TEsGridColumn.SetSortOrder(AValue: TEsSortOrder);
var
  G: TEsGrid;
begin
  if FSortOrder = AValue then Exit;
  FSortOrder := AValue;
  G := GetGrid;
  if G <> nil then
  begin
    if (AValue = esoNone) then
      G.FSortCols.Remove(Self)
    else if (G.FSortCols.IndexOf(Self) < 0) and (G.FGroupCols.IndexOf(Self) < 0) then
      G.FSortCols.Add(Self);
    G.DataChanged;
  end;
end;

procedure TEsGridColumn.SetFooterSummaries(AValue: TEsSummaryKinds);
begin
  AValue := AValue - [skNone];
  if FFooterSummaries = AValue then Exit;
  FFooterSummaries := AValue;
  Changed(False);
end;

procedure TEsGridColumn.SetGroupSummaries(AValue: TEsSummaryKinds);
begin
  AValue := AValue - [skNone];
  if FGroupSummaries = AValue then Exit;
  FGroupSummaries := AValue;
  Changed(False);
end;

function TEsGridColumn.FooterKinds: TEsSummaryKinds;
begin
  Result := FFooterSummaries;
  if FSummaryKind <> skNone then
    Include(Result, FSummaryKind);
end;

function TEsGridColumn.IsNumeric: Boolean;
begin
  Result := ResolvedKind = dkNumber;
end;

function TEsGridColumn.DisplayTitle: string;
begin
  Result := GetDisplayName;
end;

function TEsGridColumn.LayoutKey: string;
begin
  if FFieldName <> '' then Result := FFieldName
  else if FCaption <> '' then Result := FCaption
  else Result := 'Column' + IntToStr(ID);
end;

procedure TEsGridColumn.SetSummaryKind(AValue: TEsSummaryKind);
begin
  if FSummaryKind = AValue then Exit;
  FSummaryKind := AValue;
  Changed(False);
end;

procedure TEsGridColumn.SetDisplayFormat(const AValue: string);
begin
  if FDisplayFormat = AValue then Exit;
  FDisplayFormat := AValue;
  Changed(False);
end;

procedure TEsGridColumn.SetFilterText(const AValue: string);
var
  G: TEsGrid;
begin
  if FFilterText = AValue then Exit;
  FFilterText := AValue;
  G := GetGrid;
  if G <> nil then G.DataChanged;
end;

function TEsGridColumn.GetGroupIndex: Integer;
var
  G: TEsGrid;
begin
  G := GetGrid;
  if G = nil then Exit(-1);
  Result := G.FGroupCols.IndexOf(Self);
end;

procedure TEsGridColumn.SetGroupIndex(AValue: Integer);
var
  G: TEsGrid;
begin
  G := GetGrid;
  if G = nil then Exit;
  if AValue < 0 then
    G.UngroupColumn(Self)
  else
    G.GroupBy(Self, AValue);
end;

function TEsGridColumn.ResolvedKind: TEsDataKind;
var
  G: TEsGrid;
  I: Integer;
  V: Variant;
begin
  if FDataKind <> dkAuto then Exit(FDataKind);
  Result := dkString;
  G := GetGrid;
  if G = nil then Exit;
  for I := 0 to Min(G.FData.FCount, 50) - 1 do
  begin
    V := G.FData.GetSlotValue(I, FSlot);
    if EsVarIsEmptyOrNull(V) then Continue;
    case VarType(V) and varTypeMask of
      varBoolean: Exit(dkBoolean);
      varDate: Exit(dkDate);
      varSmallint, varInteger, varSingle, varDouble, varCurrency, varShortInt,
      varByte, varWord, varLongWord, varInt64, varUInt64: Exit(dkNumber);
    else
      Exit(dkString);
    end;
  end;
end;

function TEsGridColumn.ResolvedAlignment: TAlignment;
begin
  case FAlignment of
    caLeft: Result := taLeftJustify;
    caCenter: Result := taCenter;
    caRight: Result := taRightJustify;
  else
    case ResolvedKind of
      dkNumber: Result := taRightJustify;
      dkBoolean: Result := taCenter;
    else
      Result := taLeftJustify;
    end;
  end;
end;

function TEsGridColumn.FormatValue(const V: Variant): string;
begin
  if EsVarIsEmptyOrNull(V) then Exit('');
  try
    case VarType(V) and varTypeMask of
      varBoolean:
        if V then Result := rsEsTrue else Result := rsEsFalse;
      varDate:
        if FDisplayFormat <> '' then
          Result := FormatDateTime(FDisplayFormat, VarToDateTime(V))
        else
          Result := DateTimeToStr(VarToDateTime(V));
      varSmallint, varInteger, varSingle, varDouble, varCurrency, varShortInt,
      varByte, varWord, varLongWord, varInt64, varUInt64:
        if FDisplayFormat <> '' then
          Result := FormatFloat(FDisplayFormat, Double(V))
        else
          Result := VarToStr(V);
    else
      Result := VarToStr(V);
    end;
  except
    Result := VarToStr(V);
  end;
end;

{ TEsGridColumns }

constructor TEsGridColumns.Create(AGrid: TEsGrid);
begin
  inherited Create(AGrid, TEsGridColumn);
end;

function TEsGridColumns.GetItem(Index: Integer): TEsGridColumn;
begin
  Result := TEsGridColumn(inherited Items[Index]);
end;

function TEsGridColumns.Add: TEsGridColumn;
begin
  Result := TEsGridColumn(inherited Add);
end;

function TEsGridColumns.ColumnByFieldName(const AFieldName: string): TEsGridColumn;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if SameText(Items[I].FieldName, AFieldName) then
      Exit(Items[I]);
  Result := nil;
end;

procedure TEsGridColumns.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if Owner is TEsGrid then
    TEsGrid(Owner).ColumnsChanged;
end;

procedure TEsGridColumns.Notify(Item: TCollectionItem; Action: TCollectionNotification);
var
  G: TEsGrid;
begin
  inherited Notify(Item, Action);
  if not (Owner is TEsGrid) then Exit;
  G := TEsGrid(Owner);
  if Action in [cnExtracting, cnDeleting] then
  begin
    G.FGroupCols.Remove(Item);
    G.FSortCols.Remove(Item);
    if G.FHotHeader = Item then G.FHotHeader := nil;
    if G.FEditCol = Item then G.FEditCol := nil;
    if G.FResizeCol = Item then G.FResizeCol := nil;
    if G.FMenuCol = Item then G.FMenuCol := nil;
    if G.FDownHit.Column = Item then G.FDownHit.Column := nil;
    SetLength(G.FVisCols, 0);
    G.FNeedRebuild := True;
  end;
end;

{ TEsGridBand }

constructor TEsGridBand.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FVisible := True;
end;

procedure TEsGridBand.Assign(Source: TPersistent);
begin
  if Source is TEsGridBand then
  begin
    FCaption := TEsGridBand(Source).FCaption;
    FVisible := TEsGridBand(Source).FVisible;
    Changed(False);
  end
  else
    inherited Assign(Source);
end;

function TEsGridBand.GetDisplayName: string;
begin
  if FCaption <> '' then Result := FCaption else Result := inherited GetDisplayName;
end;

procedure TEsGridBand.SetCaption(const AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  Changed(False);
end;

procedure TEsGridBand.SetVisible(AValue: Boolean);
begin
  if FVisible = AValue then Exit;
  FVisible := AValue;
  Changed(False);
end;

function TEsGridBand.Width: Integer;
var
  G: TEsGrid;
  I: Integer;
begin
  Result := 0;
  if not (TEsGridBands(Collection).Owner is TEsGrid) then Exit;
  G := TEsGrid(TEsGridBands(Collection).Owner);
  for I := 0 to G.FColumns.Count - 1 do
    if (G.FColumns[I].FBandIndex = Index) and G.FColumns[I].Visible then
      Inc(Result, G.FColumns[I].Width);
end;

{ TEsGridBands }

constructor TEsGridBands.Create(AGrid: TEsGrid);
begin
  inherited Create(AGrid, TEsGridBand);
end;

function TEsGridBands.GetItem(Index: Integer): TEsGridBand;
begin
  Result := TEsGridBand(inherited Items[Index]);
end;

function TEsGridBands.Add: TEsGridBand;
begin
  Result := TEsGridBand(inherited Add);
end;

procedure TEsGridBands.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if Owner is TEsGrid then
    TEsGrid(Owner).ColumnsChanged;
end;

procedure TEsGridBands.Notify(Item: TCollectionItem; Action: TCollectionNotification);
var
  G: TEsGrid;
  I, Idx: Integer;
begin
  inherited Notify(Item, Action);
  if not (Owner is TEsGrid) then Exit;
  G := TEsGrid(Owner);
  if (Action in [cnExtracting, cnDeleting]) and (G.FColumns <> nil) then
  begin
    // colunas da banda removida ficam sem banda; as seguintes "sobem" um índice
    Idx := Item.Index;
    for I := 0 to G.FColumns.Count - 1 do
      if G.FColumns[I].FBandIndex = Idx then
        G.FColumns[I].FBandIndex := -1
      else if G.FColumns[I].FBandIndex > Idx then
        Dec(G.FColumns[I].FBandIndex);
    G.ColumnsChanged;
  end;
end;

procedure TEsGridBands.MoveBand(AFrom, ATo: Integer);
var
  G: TEsGrid;
  I, B: Integer;
begin
  if (AFrom = ATo) or (AFrom < 0) or (AFrom >= Count) or (ATo < 0) or (ATo >= Count) then
    Exit;
  if Owner is TEsGrid then
  begin
    G := TEsGrid(Owner);
    for I := 0 to G.FColumns.Count - 1 do
    begin
      B := G.FColumns[I].FBandIndex;
      if B < 0 then Continue;
      if B = AFrom then
        B := ATo
      else if (AFrom < ATo) and (B > AFrom) and (B <= ATo) then
        Dec(B)
      else if (AFrom > ATo) and (B >= ATo) and (B < AFrom) then
        Inc(B);
      G.FColumns[I].FBandIndex := B;
    end;
  end;
  Items[AFrom].Index := ATo;
end;

{ TEsGridOptionsCard }

constructor TEsGridOptionsCard.Create(AGrid: TEsGrid);
begin
  inherited Create;
  FGrid := AGrid;
  FCardWidth := 260;
  FLabelWidth := 100;
  FSpacing := 10;
  FShowLabels := True;
end;

procedure TEsGridOptionsCard.Assign(Source: TPersistent);
begin
  if Source is TEsGridOptionsCard then
  begin
    FCardWidth := TEsGridOptionsCard(Source).FCardWidth;
    FLabelWidth := TEsGridOptionsCard(Source).FLabelWidth;
    FSpacing := TEsGridOptionsCard(Source).FSpacing;
    FShowLabels := TEsGridOptionsCard(Source).FShowLabels;
    FTitleField := TEsGridOptionsCard(Source).FTitleField;
    Changed;
  end
  else
    inherited Assign(Source);
end;

procedure TEsGridOptionsCard.Changed;
begin
  if FGrid <> nil then
  begin
    FGrid.FCardLayoutValid := False;
    FGrid.DataChanged;
  end;
end;

procedure TEsGridOptionsCard.SetCardWidth(AValue: Integer);
begin
  AValue := Max(80, AValue);
  if FCardWidth = AValue then Exit;
  FCardWidth := AValue;
  Changed;
end;

procedure TEsGridOptionsCard.SetLabelWidth(AValue: Integer);
begin
  AValue := Max(0, AValue);
  if FLabelWidth = AValue then Exit;
  FLabelWidth := AValue;
  Changed;
end;

procedure TEsGridOptionsCard.SetSpacing(AValue: Integer);
begin
  AValue := EnsureRange(AValue, 0, 60);
  if FSpacing = AValue then Exit;
  FSpacing := AValue;
  Changed;
end;

procedure TEsGridOptionsCard.SetShowLabels(AValue: Boolean);
begin
  if FShowLabels = AValue then Exit;
  FShowLabels := AValue;
  Changed;
end;

procedure TEsGridOptionsCard.SetTitleField(const AValue: string);
begin
  if FTitleField = AValue then Exit;
  FTitleField := AValue;
  Changed;
end;

{ TEsDataController }

constructor TEsDataController.Create(AGrid: TEsGrid);
begin
  inherited Create;
  FGrid := AGrid;
end;

procedure TEsDataController.Changed;
begin
  if FUpdateCount = 0 then
    FGrid.DataChanged;
end;

procedure TEsDataController.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TEsDataController.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount <= 0 then
  begin
    FUpdateCount := 0;
    FGrid.DataChanged;
  end;
end;

procedure TEsDataController.Clear;
begin
  SetLength(FGrid.FSelected, 0);
  FCount := 0;
  SetLength(FRecords, 0);
  SetLength(FRecNos, 0);
  Changed;
end;

procedure TEsDataController.SetRecordCount(AValue: Integer);
var
  I: Integer;
begin
  if AValue < 0 then AValue := 0;
  if AValue > Length(FRecords) then
  begin
    SetLength(FRecords, AValue);
    SetLength(FRecNos, AValue);
  end;
  for I := FCount to AValue - 1 do
  begin
    SetLength(FRecords[I], 0);
    FRecNos[I] := -1;
  end;
  FCount := AValue;
  Changed;
end;

function TEsDataController.AppendRecord: Integer;
begin
  if FCount >= Length(FRecords) then
  begin
    SetLength(FRecords, Max(16, Length(FRecords) * 2));
    SetLength(FRecNos, Length(FRecords));
  end;
  Result := FCount;
  SetLength(FRecords[Result], 0);
  FRecNos[Result] := -1;
  Inc(FCount);
  Changed;
end;

function TEsDataController.AppendRecord(const AValues: array of Variant): Integer;
var
  I: Integer;
begin
  Result := -1;
  BeginUpdate;
  try
    Result := Self.AppendRecord;
    for I := 0 to High(AValues) do
      if I < FGrid.Columns.Count then
        SetValue(Result, I, AValues[I]);
  finally
    EndUpdate;
  end;
end;

procedure TEsDataController.DeleteRecord(ARecordIndex: Integer);
var
  I: Integer;
begin
  if (ARecordIndex < 0) or (ARecordIndex >= FCount) then Exit;
  SetLength(FGrid.FSelected, 0);
  for I := ARecordIndex to FCount - 2 do
  begin
    FRecords[I] := FRecords[I + 1];
    FRecNos[I] := FRecNos[I + 1];
  end;
  Dec(FCount);
  SetLength(FRecords[FCount], 0);
  Changed;
end;

function TEsDataController.GetSlotValue(ARecordIndex, ASlot: Integer): Variant;
begin
  if (ARecordIndex < 0) or (ARecordIndex >= FCount) or (ASlot < 0) or
     (ASlot >= Length(FRecords[ARecordIndex])) then
    Result := Null
  else
    Result := FRecords[ARecordIndex][ASlot];
end;

procedure TEsDataController.SetSlotValue(ARecordIndex, ASlot: Integer;
  const AValue: Variant);
var
  I, OldLen: Integer;
begin
  if (ARecordIndex < 0) or (ARecordIndex >= FCount) or (ASlot < 0) then Exit;
  OldLen := Length(FRecords[ARecordIndex]);
  if ASlot >= OldLen then
  begin
    SetLength(FRecords[ARecordIndex], ASlot + 1);
    for I := OldLen to ASlot do
      FRecords[ARecordIndex][I] := Null;
  end;
  FRecords[ARecordIndex][ASlot] := AValue;
  Changed;
end;

function TEsDataController.GetValue(ARecordIndex, AColumnIndex: Integer): Variant;
begin
  if (AColumnIndex < 0) or (AColumnIndex >= FGrid.Columns.Count) then
    Exit(Null);
  Result := GetSlotValue(ARecordIndex, FGrid.Columns[AColumnIndex].FSlot);
end;

procedure TEsDataController.SetValue(ARecordIndex, AColumnIndex: Integer;
  const AValue: Variant);
begin
  if (AColumnIndex < 0) or (AColumnIndex >= FGrid.Columns.Count) then Exit;
  SetSlotValue(ARecordIndex, FGrid.Columns[AColumnIndex].FSlot, AValue);
end;

function TEsDataController.RecNoOf(ARecordIndex: Integer): Integer;
begin
  if (ARecordIndex < 0) or (ARecordIndex >= FCount) then Exit(-1);
  Result := FRecNos[ARecordIndex];
end;

function TEsDataController.GetFocusedRecordIndex: Integer;
begin
  Result := FGrid.FocusedRecordIndex;
end;

procedure TEsDataController.SetFocusedRecordIndex(AValue: Integer);
begin
  FGrid.FocusedRecordIndex := AValue;
end;

{ TEsGridOptionsView }

constructor TEsGridOptionsView.Create(AGrid: TEsGrid);
begin
  inherited Create;
  FGrid := AGrid;
  FGroupByBox := True;
  FIndicator := True;
  FStriped := True;
  FGridLines := True;
  FExpandGroupsByDefault := True;
  FGroupSummaryInRow := True;
end;

procedure TEsGridOptionsView.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TEsGridOptionsView then
  begin
    for I := 0 to 8 do
      SetBool(I, TEsGridOptionsView(Source).GetBool(I));
  end
  else
    inherited Assign(Source);
end;

function TEsGridOptionsView.GetBool(Index: Integer): Boolean;
begin
  case Index of
    0: Result := FGroupByBox;
    1: Result := FFilterRow;
    2: Result := FFooter;
    3: Result := FFindPanel;
    4: Result := FIndicator;
    5: Result := FStriped;
    6: Result := FGridLines;
    7: Result := FExpandGroupsByDefault;
    8: Result := FGroupSummaryInRow;
  else
    Result := False;
  end;
end;

procedure TEsGridOptionsView.SetBool(Index: Integer; AValue: Boolean);
begin
  if GetBool(Index) = AValue then Exit;
  case Index of
    0: FGroupByBox := AValue;
    1: FFilterRow := AValue;
    2: FFooter := AValue;
    3: FFindPanel := AValue;
    4: FIndicator := AValue;
    5: FStriped := AValue;
    6: FGridLines := AValue;
    7: begin FExpandGroupsByDefault := AValue; FGrid.FToggled.Clear; end;
    8: FGroupSummaryInRow := AValue;
  end;
  if Index = 3 then
    FGrid.FFindPanelCtl.Visible := AValue;
  FGrid.DataChanged;
end;

{ TEsGridDataLink }

constructor TEsGridDataLink.Create(AGrid: TEsGrid);
begin
  inherited Create;
  FGrid := AGrid;
  VisualControl := True;
end;

procedure TEsGridDataLink.ActiveChanged;
begin
  inherited ActiveChanged;
  if FGrid.FLoadingDataSet then Exit;
  if Active then
    FGrid.LoadFromDataSet(DataSet)
  else
    FGrid.FData.Clear;
end;

procedure TEsGridDataLink.DataSetChanged;
begin
  inherited DataSetChanged;
  if FGrid.FLoadingDataSet or FGrid.FSyncingDataSet then Exit;
  if Active and not (DataSet.State in [dsEdit, dsInsert]) then
    FGrid.LoadFromDataSet(DataSet);
end;

procedure TEsGridDataLink.DataSetScrolled(Distance: Integer);
begin
  inherited DataSetScrolled(Distance);
  if FGrid.FLoadingDataSet or FGrid.FSyncingDataSet then Exit;
  if Active then
    FGrid.FocusRecordByRecNo(DataSet.RecNo);
end;

procedure TEsGridDataLink.LayoutChanged;
begin
  inherited LayoutChanged;
  if FGrid.FLoadingDataSet then Exit;
  if Active then
    FGrid.LoadFromDataSet(DataSet);
end;

{ TEsGrid }

constructor TEsGrid.Create(AOwner: TComponent);
var
  B: TButton;
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls] + [csCaptureMouse, csDoubleClicks];
  TabStop := True;
  DoubleBuffered := True;
  FColumns := TEsGridColumns.Create(Self);
  FBands := TEsGridBands.Create(Self);
  FOptionsCard := TEsGridOptionsCard.Create(Self);
  FDetailOpen := TStringList.Create;
  FDetailOpen.Sorted := True;
  FDetailHeight := 180;
  FData := TEsDataController.Create(Self);
  FOptionsView := TEsGridOptionsView.Create(Self);
  FDataLink := TEsGridDataLink.Create(Self);
  FGroupCols := TList.Create;
  FSortCols := TList.Create;
  FToggled := TStringList.Create;
  FToggled.Sorted := True;
  FToggled.Duplicates := dupIgnore;
  FFocusedRow := -1;
  FNeedRebuild := True;
  FRowHeight := 22; // valor provisório até UpdateMetrics (Resize ocorre antes)
  FAnchorRow := -1;
  FStateHandlers := TEsNotifyList.Create;

  FVScroll := TScrollBar.Create(Self);
  FVScroll.Kind := sbVertical;
  FVScroll.Align := alRight;
  FVScroll.ControlStyle := FVScroll.ControlStyle + [csNoDesignVisible];
  FVScroll.TabStop := False;
  FVScroll.OnChange := ScrollBarChange;
  FVScroll.Parent := Self;

  FHScroll := TScrollBar.Create(Self);
  FHScroll.Kind := sbHorizontal;
  FHScroll.Align := alBottom;
  FHScroll.ControlStyle := FHScroll.ControlStyle + [csNoDesignVisible];
  FHScroll.TabStop := False;
  FHScroll.OnChange := ScrollBarChange;
  FHScroll.Parent := Self;

  FFindPanelCtl := TPanel.Create(Self);
  FFindPanelCtl.ControlStyle := FFindPanelCtl.ControlStyle + [csNoDesignVisible];
  FFindPanelCtl.Align := alTop;
  FFindPanelCtl.BevelOuter := bvNone;
  FFindPanelCtl.Height := 34;
  FFindPanelCtl.Visible := False;
  FFindPanelCtl.Parent := Self;
  FFindEdit := TEdit.Create(Self);
  FFindEdit.Parent := FFindPanelCtl;
  FFindEdit.TextHint := rsEsFindHint;
  FFindEdit.SetBounds(6, 5, 260, 24);
  FFindEdit.Anchors := [akLeft, akTop, akRight];
  FFindEdit.OnChange := FindEditChange;
  FFindEdit.OnKeyDown := FindEditKeyDown;
  B := TButton.Create(Self);
  B.Parent := FFindPanelCtl;
  B.Caption := rsEsFindClear;
  B.SetBounds(272, 5, 80, 24);
  B.OnClick := FindClearClick;

  FEditor := TEsGridInplaceEdit.Create(Self);
  FEditor.Visible := False;
  FEditor.ControlStyle := FEditor.ControlStyle + [csNoDesignVisible];
  FEditor.BorderStyle := bsNone;
  FEditor.OnKeyDown := EditorKeyDown;
  FEditor.OnExit := EditorExit;
  FEditor.OnChange := EditorChange;
  FEditor.Parent := Self;

  FHeaderMenu := TPopupMenu.Create(Self);

  EsThemes.AddChangeHandler(ThemeChanged);
  EsThemes.RegisterClient(Self);
  with GetControlClassDefaultSize do
    SetBounds(0, 0, CX, CY);
  UpdateMetrics;
  ThemeChanged(nil);
end;

destructor TEsGrid.Destroy;
begin
  EsThemes.UnregisterClient(Self);
  EsThemes.RemoveChangeHandler(ThemeChanged);
  if FDetailTemplate <> nil then
    FDetailTemplate.RemoveStateChangeHandler(DetailTemplateChanged);
  CollapseAllDetails;
  FreeAndNil(FDetailOpen);
  FDataLink.Free;
  FreeAndNil(FBands);
  FreeAndNil(FOptionsCard);
  FreeAndNil(FColumns);
  FGroupCols.Free;
  FSortCols.Free;
  FToggled.Free;
  FData.Free;
  FOptionsView.Free;
  FStateHandlers.Free;
  inherited Destroy;
end;

class function TEsGrid.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 480;
  Result.CY := 280;
end;

procedure TEsGrid.ThemeChanged(Sender: TObject);
var
  T: TEsTheme;
begin
  T := EsSkinTheme;
  Color := EsColor(T.Surface);
  FFindPanelCtl.Color := EsColor(T.GroupPanel);
  FFindEdit.Color := EsColor(T.Surface);
  FFindEdit.Font.Color := EsColor(T.Text);
  FEditor.Color := EsColor(T.Surface);
  FEditor.Font.Color := EsColor(T.Text);
  Invalidate;
end;

procedure TEsGrid.SetColumns(AValue: TEsGridColumns);
begin
  FColumns.Assign(AValue);
end;

procedure TEsGrid.SetOptionsView(AValue: TEsGridOptionsView);
begin
  FOptionsView.Assign(AValue);
end;

function TEsGrid.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TEsGrid.SetDataSource(AValue: TDataSource);
begin
  if FDataLink.DataSource = AValue then Exit;
  FDataLink.DataSource := AValue;
  if AValue <> nil then AValue.FreeNotification(Self);
end;

procedure TEsGrid.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
     (AComponent = FDataLink.DataSource) then
    FDataLink.DataSource := nil;
  if (Operation = opRemove) and (AComponent = FDetailTemplate) then
  begin
    FDetailTemplate := nil;
    if FDetailOpen <> nil then
      CollapseAllDetails;
  end;
end;

procedure TEsGrid.SetBands(AValue: TEsGridBands);
begin
  FBands.Assign(AValue);
end;

procedure TEsGrid.SetOptionsCard(AValue: TEsGridOptionsCard);
begin
  FOptionsCard.Assign(AValue);
end;

procedure TEsGrid.SetViewMode(AValue: TEsGridViewMode);
begin
  if FViewMode = AValue then Exit;
  HideEditor(True);
  if AValue = gvmCards then
    CollapseAllDetails;
  FViewMode := AValue;
  FTopRow := 0;
  FCardLayoutValid := False;
  ColumnsChanged;
end;

function TEsGrid.IsBanded: Boolean;
begin
  Result := (FViewMode = gvmBanded) and (FBands.Count > 0);
end;

function TEsGrid.IsCardMode: Boolean;
begin
  Result := FViewMode = gvmCards;
end;

function TEsGrid.ColumnBand(AColumn: TEsGridColumn): TEsGridBand;
begin
  Result := nil;
  if (AColumn <> nil) and IsBanded and (AColumn.FBandIndex >= 0) and
     (AColumn.FBandIndex < FBands.Count) then
    Result := FBands[AColumn.FBandIndex];
end;

{ ---------- mestre-detalhe ---------- }

procedure TEsGrid.SetDetailTemplate(AValue: TEsGrid);
begin
  if AValue = Self then AValue := nil;
  if FDetailTemplate = AValue then Exit;
  if FDetailTemplate <> nil then
  begin
    FDetailTemplate.RemoveStateChangeHandler(DetailTemplateChanged);
    FDetailTemplate.RemoveFreeNotification(Self);
  end;
  CollapseAllDetails;
  FDetailTemplate := AValue;
  if FDetailTemplate <> nil then
  begin
    FDetailTemplate.FreeNotification(Self);
    FDetailTemplate.AddStateChangeHandler(DetailTemplateChanged);
  end;
  DataChanged;
end;

procedure TEsGrid.SetDetailHeight(AValue: Integer);
begin
  AValue := Max(60, AValue);
  if FDetailHeight = AValue then Exit;
  FDetailHeight := AValue;
  DataChanged;
end;

procedure TEsGrid.SetMasterKeyField(const AValue: string);
begin
  if FMasterKeyField = AValue then Exit;
  FMasterKeyField := AValue;
  RefreshDetails;
end;

procedure TEsGrid.SetDetailKeyField(const AValue: string);
begin
  if FDetailKeyField = AValue then Exit;
  FDetailKeyField := AValue;
  RefreshDetails;
end;

procedure TEsGrid.DetailTemplateChanged(Sender: TObject);
begin
  // o modelo mudou (dados, colunas...): recarrega os detalhes abertos
  if not FWritingBack then
    RefreshDetails;
end;

function TEsGrid.HasDetails: Boolean;
begin
  Result := ((FDetailTemplate <> nil) or Assigned(FOnGetDetailRecords)) and
    not IsCardMode and not (csDesigning in ComponentState);
end;

function TEsGrid.DetailButtonWidth: Integer;
begin
  if HasDetails then Result := IndentWidth else Result := 0;
end;

function TEsGrid.DetailRowSpan: Integer;
begin
  Result := Max(2, (EsScale(Self, FDetailHeight) + FRowHeight - 1) div Max(1, FRowHeight));
end;

function TEsGrid.DetailKey(ARecordIndex: Integer): string;
var
  C: TEsGridColumn;
begin
  C := nil;
  if FMasterKeyField <> '' then
    C := FColumns.ColumnByFieldName(FMasterKeyField);
  if C <> nil then
    Result := 'K' + VarToStr(FData.GetSlotValue(ARecordIndex, C.FSlot))
  else
    Result := 'R' + IntToStr(ARecordIndex);
end;

function TEsGrid.IsDetailExpanded(ARecordIndex: Integer): Boolean;
begin
  Result := (ARecordIndex >= 0) and (FDetailOpen <> nil) and
    (FDetailOpen.IndexOf(DetailKey(ARecordIndex)) >= 0);
end;

function TEsGrid.DetailGridOf(ARecordIndex: Integer): TEsGrid;
var
  I: Integer;
begin
  Result := nil;
  if (ARecordIndex < 0) or (FDetailOpen = nil) then Exit;
  I := FDetailOpen.IndexOf(DetailKey(ARecordIndex));
  if I >= 0 then
    Result := TEsGrid(FDetailOpen.Objects[I]);
end;

procedure TEsGrid.FillDetail(ADetail: TEsGrid; AMasterRecord: Integer);
var
  KeyCol, MasterCol: TEsGridColumn;
  MasterValue: string;
  I, J, R, N: Integer;
  T: TEsGrid;
begin
  ADetail.FData.BeginUpdate;
  try
    ADetail.FData.Clear;
    SetLength(ADetail.FDetailSourceRecs, 0);
    if Assigned(FOnGetDetailRecords) then
      FOnGetDetailRecords(Self, AMasterRecord, ADetail)
    else if FDetailTemplate <> nil then
    begin
      T := FDetailTemplate;
      KeyCol := nil;
      if FDetailKeyField <> '' then
        KeyCol := T.FColumns.ColumnByFieldName(FDetailKeyField);
      MasterCol := nil;
      if FMasterKeyField <> '' then
        MasterCol := FColumns.ColumnByFieldName(FMasterKeyField);
      if (KeyCol <> nil) and (MasterCol <> nil) then
        MasterValue := VarToStr(FData.GetSlotValue(AMasterRecord, MasterCol.FSlot))
      else
        MasterValue := '';
      N := 0;
      SetLength(ADetail.FDetailSourceRecs, T.FData.FCount);
      for I := 0 to T.FData.FCount - 1 do
      begin
        if (KeyCol <> nil) and (MasterCol <> nil) and
           (VarToStr(T.FData.GetSlotValue(I, KeyCol.FSlot)) <> MasterValue) then
          Continue;
        R := ADetail.FData.AppendRecord;
        for J := 0 to Min(T.FColumns.Count, ADetail.FColumns.Count) - 1 do
          ADetail.FData.SetSlotValue(R, ADetail.FColumns[J].FSlot,
            T.FData.GetSlotValue(I, T.FColumns[J].FSlot));
        ADetail.FDetailSourceRecs[N] := I;
        Inc(N);
      end;
      SetLength(ADetail.FDetailSourceRecs, N);
    end;
  finally
    ADetail.FData.EndUpdate;
  end;
end;

procedure TEsGrid.ExpandDetail(ARecordIndex: Integer);
var
  D: TEsGrid;
begin
  if not HasDetails or (ARecordIndex < 0) or (ARecordIndex >= FData.FCount) then Exit;
  if IsDetailExpanded(ARecordIndex) then Exit;
  HideEditor(True);
  D := TEsGrid.Create(nil);
  D.FMasterGrid := Self;
  D.Visible := False;
  if FDetailTemplate <> nil then
  begin
    D.FColumns.Assign(FDetailTemplate.FColumns);
    D.FBands.Assign(FDetailTemplate.FBands);
    D.FOptionsView.Assign(FDetailTemplate.FOptionsView);
    D.FOptionsCard.Assign(FDetailTemplate.FOptionsCard);
    D.FViewMode := FDetailTemplate.FViewMode;
    D.ReadOnly := FDetailTemplate.ReadOnly;
    D.Font.Assign(FDetailTemplate.Font);
    D.OnCustomDrawCell := FDetailTemplate.OnCustomDrawCell;
    D.OnGetDisplayText := FDetailTemplate.OnGetDisplayText;
    D.OnValidateValue := FDetailTemplate.OnValidateValue;
    // a grade filha pode ter o próprio detalhe (vários níveis)
    D.FMasterKeyField := FDetailTemplate.FMasterKeyField;
    D.FDetailKeyField := FDetailTemplate.FDetailKeyField;
    D.FDetailHeight := FDetailTemplate.FDetailHeight;
    D.OnGetDetailRecords := FDetailTemplate.OnGetDetailRecords;
    if FDetailTemplate.FDetailTemplate <> nil then
      D.DetailGrid := FDetailTemplate.FDetailTemplate;
  end
  else
    D.Font.Assign(Font);
  D.FOptionsView.FGroupByBox := False;
  D.FOptionsView.FFindPanel := False;
  D.FFindPanelCtl.Visible := False;
  FillDetail(D, ARecordIndex);
  D.Parent := Self;
  FDetailOpen.AddObject(DetailKey(ARecordIndex), D);
  DataChanged;
  EnsureBuilt;
  if Assigned(FOnDetailExpanded) then
    FOnDetailExpanded(Self, ARecordIndex, D);
end;

procedure TEsGrid.CollapseDetail(ARecordIndex: Integer);
var
  I: Integer;
  D: TEsGrid;
begin
  if (ARecordIndex < 0) or (FDetailOpen = nil) then Exit;
  I := FDetailOpen.IndexOf(DetailKey(ARecordIndex));
  if I < 0 then Exit;
  D := TEsGrid(FDetailOpen.Objects[I]);
  FDetailOpen.Delete(I);
  D.Free;
  if CanFocus and not (csDestroying in ComponentState) then SetFocus;
  DataChanged;
end;

procedure TEsGrid.ToggleDetail(ARecordIndex: Integer);
begin
  if IsDetailExpanded(ARecordIndex) then
    CollapseDetail(ARecordIndex)
  else
    ExpandDetail(ARecordIndex);
end;

procedure TEsGrid.CollapseAllDetails;
var
  I: Integer;
begin
  if (FDetailOpen = nil) or (FDetailOpen.Count = 0) then Exit;
  for I := FDetailOpen.Count - 1 downto 0 do
    FDetailOpen.Objects[I].Free;
  FDetailOpen.Clear;
  if not (csDestroying in ComponentState) then
    DataChanged;
end;

procedure TEsGrid.RefreshDetails;
var
  I, Rec: Integer;
  D: TEsGrid;
begin
  if (FDetailOpen = nil) or (FDetailOpen.Count = 0) or FRefreshingDetails then Exit;
  FRefreshingDetails := True;
  try
    for I := 0 to FDetailOpen.Count - 1 do
    begin
      D := TEsGrid(FDetailOpen.Objects[I]);
      // registro mestre que corresponde à chave
      for Rec := 0 to FData.FCount - 1 do
        if DetailKey(Rec) = FDetailOpen[I] then
        begin
          FillDetail(D, Rec);
          Break;
        end;
    end;
  finally
    FRefreshingDetails := False;
  end;
  Invalidate;
end;

procedure TEsGrid.LayoutDetails;
var
  I, J, YT, YB, H, L, DT, DB: Integer;
  D: TEsGrid;
  Found: Boolean;
begin
  if (FDetailOpen = nil) or (FDetailOpen.Count = 0) then Exit;
  DT := DataTop;
  DB := DataBottom;
  for I := 0 to FDetailOpen.Count - 1 do
  begin
    D := TEsGrid(FDetailOpen.Objects[I]);
    Found := False;
    for J := 0 to FRowCount - 1 do
      if (FRows[J].Kind = vrkDetail) and (FRows[J].DetailPart = 0) and
         (DetailKey(FRows[J].DetailRec) = FDetailOpen[I]) then
      begin
        Found := True;
        YT := DT + (J - FTopRow) * FRowHeight + 2;
        H := DetailRowSpan * FRowHeight - 4;
        L := IndicatorWidth + FRows[J].Level * IndentWidth + DetailButtonWidth - FHOffset;
        YB := YT + H;
        if YT < DT then YT := DT;
        if YB > DB then YB := DB;
        if YB - YT < 24 then
          D.Visible := False
        else
        begin
          D.SetBounds(Max(L, IndicatorWidth), YT, Max(40, ClientW - Max(L, IndicatorWidth) - 4),
            YB - YT);
          D.Visible := True;
        end;
        Break;
      end;
    if not Found then
      D.Visible := False;
  end;
end;

procedure TEsGrid.Loaded;
var
  I: Integer;
begin
  inherited Loaded;
  // reconstrói a lista de ordenação a partir das colunas carregadas
  for I := 0 to FColumns.Count - 1 do
    if (FColumns[I].SortOrder <> esoNone) and (FSortCols.IndexOf(FColumns[I]) < 0)
       and (FGroupCols.IndexOf(FColumns[I]) < 0) then
      FSortCols.Add(FColumns[I]);
  FFindPanelCtl.Visible := FOptionsView.FindPanel;
  if FDataLink.Active then
    LoadFromDataSet(FDataLink.DataSet);
  DataChanged;
end;

procedure TEsGrid.BeginUpdate;
begin
  Inc(FUpdateLock);
end;

procedure TEsGrid.EndUpdate;
begin
  Dec(FUpdateLock);
  if FUpdateLock <= 0 then
  begin
    FUpdateLock := 0;
    DataChanged;
  end;
end;

procedure TEsGrid.ColumnsChanged;
begin
  SetLength(FVisCols, 0);
  DataChanged;
end;

procedure TEsGrid.DataChanged;
begin
  FNeedRebuild := True;
  if (FUpdateLock = 0) and not (csLoading in ComponentState) then
  begin
    Invalidate;
    if Assigned(FOnDataChanged) and not (csDestroying in ComponentState) then
      FOnDataChanged(Self);
    if (FStateHandlers <> nil) and not (csDestroying in ComponentState) then
      FStateHandlers.CallNotifyEvents(Self);
  end;
end;

procedure TEsGrid.UpdateMetrics;
begin
    FRowHeight := EsMeasureCanvas(Font).TextHeight('Ag') + EsScale(Self, 8);
  if FRowHeight < 18 then FRowHeight := 18;
end;

procedure TEsGrid.CMFontChanged(var Message: TMessage);
begin
  inherited;
  UpdateMetrics;
  Invalidate;
end;

{ ---------- construção da visão ---------- }

function TEsGrid.ValueMatchesFilter(AColumn: TEsGridColumn; const V: Variant;
  const AFilter: string): Boolean;
var
  F, Op, S: string;
  D, FV: Double;
  DT: TDateTime;
  C: Integer;
begin
  F := Trim(AFilter);
  if F = '' then Exit(True);
  Op := '';
  if (Length(F) >= 2) and ((Copy(F, 1, 2) = '>=') or (Copy(F, 1, 2) = '<=') or
     (Copy(F, 1, 2) = '<>')) then
    Op := Copy(F, 1, 2)
  else if F[1] in ['>', '<', '='] then
    Op := F[1];
  if Op <> '' then
  begin
    S := Trim(Copy(F, Length(Op) + 1, MaxInt));
    if VarIsNumericOrDate(V) and (TryStrToFloat(S, FV) or TryStrToDate(S, DT)) then
    begin
      if not TryStrToFloat(S, FV) then FV := DT;
      D := VarAsType(V, varDouble);
      if D < FV then C := -1 else if D > FV then C := 1 else C := 0;
    end
    else
      C := AnsiCompareText(AColumn.FormatValue(V), S);
    if Op = '=' then Result := C = 0
    else if Op = '<>' then Result := C <> 0
    else if Op = '>' then Result := C > 0
    else if Op = '<' then Result := C < 0
    else if Op = '>=' then Result := C >= 0
    else Result := C <= 0;
  end
  else
    Result := Pos(AnsiLowerCase(F), AnsiLowerCase(AColumn.FormatValue(V))) > 0;
end;

function TEsGrid.RecordPassesFilter(ARec: Integer): Boolean;
var
  I: Integer;
  C: TEsGridColumn;
  Found: Boolean;
  LF: string;
begin
  for I := 0 to FColumns.Count - 1 do
  begin
    C := FColumns[I];
    if (C.FFilterText <> '') and
       not ValueMatchesFilter(C, FData.GetSlotValue(ARec, C.FSlot), C.FFilterText) then
      Exit(False);
  end;
  if FFindText <> '' then
  begin
    LF := AnsiLowerCase(FFindText);
    Found := False;
    for I := 0 to FColumns.Count - 1 do
      if FColumns[I].Visible and
         (Pos(LF, AnsiLowerCase(DisplayText(ARec, FColumns[I]))) > 0) then
      begin
        Found := True;
        Break;
      end;
    if not Found then Exit(False);
  end;
  Result := True;
end;

function TEsGrid.CompareRecords(A, B: Integer): Integer;
var
  I: Integer;
  C: TEsGridColumn;
begin
  for I := 0 to FGroupCols.Count - 1 do
  begin
    C := TEsGridColumn(FGroupCols[I]);
    Result := CompareVariants(FData.GetSlotValue(A, C.FSlot), FData.GetSlotValue(B, C.FSlot));
    if C.FSortOrder = esoDescending then Result := -Result;
    if Result <> 0 then Exit;
  end;
  for I := 0 to FSortCols.Count - 1 do
  begin
    C := TEsGridColumn(FSortCols[I]);
    Result := CompareVariants(FData.GetSlotValue(A, C.FSlot), FData.GetSlotValue(B, C.FSlot));
    if C.FSortOrder = esoDescending then Result := -Result;
    if Result <> 0 then Exit;
  end;
  // estável
  if A < B then Result := -1 else if A > B then Result := 1 else Result := 0;
end;

procedure TEsGrid.SortIndices(var A: TArray<Integer>);
var
  Tmp: TArray<Integer>;

  procedure MergeSort(Lo, Hi: Integer);
  var
    Mid, I, J, K: Integer;
  begin
    if Hi - Lo < 1 then Exit;
    Mid := (Lo + Hi) div 2;
    MergeSort(Lo, Mid);
    MergeSort(Mid + 1, Hi);
    if CompareRecords(A[Mid], A[Mid + 1]) <= 0 then Exit;
    I := Lo; J := Mid + 1; K := Lo;
    while (I <= Mid) and (J <= Hi) do
    begin
      if CompareRecords(A[I], A[J]) <= 0 then
      begin
        Tmp[K] := A[I]; Inc(I);
      end
      else
      begin
        Tmp[K] := A[J]; Inc(J);
      end;
      Inc(K);
    end;
    while I <= Mid do begin Tmp[K] := A[I]; Inc(I); Inc(K); end;
    while J <= Hi do begin Tmp[K] := A[J]; Inc(J); Inc(K); end;
    for K := Lo to Hi do A[K] := Tmp[K];
  end;

begin
  if Length(A) < 2 then Exit;
  if (FGroupCols.Count = 0) and (FSortCols.Count = 0) then Exit;
  SetLength(Tmp, Length(A));
  MergeSort(0, High(A));
end;

procedure TEsGrid.Rebuild;
var
  I, J, N, OldRec, Span: Integer;
  Details: Boolean;

  procedure AddRow(const R: TEsViewRow);
  begin
    if FRowCount >= Length(FRows) then
      SetLength(FRows, Max(64, Length(FRows) * 2));
    FRows[FRowCount] := R;
    Inc(FRowCount);
  end;

  procedure Emit(Lo, Hi, Level: Integer; const ParentKey: string);
  var
    C: TEsGridColumn;
    RunLo, J, K: Integer;
    V: Variant;
    R: TEsViewRow;
    Key: string;
  begin
    if Level >= FGroupCols.Count then
    begin
      for J := Lo to Hi do
      begin
        R := Default(TEsViewRow);
        R.Kind := vrkData;
        R.Level := Level;
        R.RecIndex := FSorted[J];
        R.DetailRec := -1;
        R.FirstSorted := J;
        R.LastSorted := J;
        AddRow(R);
        // área da grade de detalhe logo abaixo do registro mestre
        if Details and IsDetailExpanded(FSorted[J]) then
          for K := 0 to Span - 1 do
          begin
            R := Default(TEsViewRow);
            R.Kind := vrkDetail;
            R.Level := Level;
            R.RecIndex := -1;
            R.DetailRec := FSorted[J];
            R.DetailPart := K;
            R.FirstSorted := J;
            R.LastSorted := J;
            AddRow(R);
          end;
      end;
      Exit;
    end;
    C := TEsGridColumn(FGroupCols[Level]);
    RunLo := Lo;
    while RunLo <= Hi do
    begin
      V := FData.GetSlotValue(FSorted[RunLo], C.FSlot);
      J := RunLo;
      while (J + 1 <= Hi) and
            (CompareVariants(FData.GetSlotValue(FSorted[J + 1], C.FSlot), V) = 0) do
        Inc(J);
      Key := ParentKey + #1 + VarToStr(V);
      R := Default(TEsViewRow);
      R.Kind := vrkGroup;
      R.Level := Level;
      R.RecIndex := -1;
      R.DetailRec := -1;
      R.GroupColumn := C;
      R.GroupValue := V;
      R.GroupKey := Key;
      R.Expanded := FOptionsView.ExpandGroupsByDefault xor (FToggled.IndexOf(Key) >= 0);
      R.FirstSorted := RunLo;
      R.LastSorted := J;
      AddRow(R);
      if R.Expanded then
        Emit(RunLo, J, Level + 1, Key);
      RunLo := J + 1;
    end;
  end;

begin
  FNeedRebuild := False;
  FCardLayoutValid := False;
  Details := HasDetails;
  Span := DetailRowSpan;
  OldRec := -1;
  if (FFocusedRow >= 0) and (FFocusedRow < FRowCount) then
    OldRec := FRows[FFocusedRow].RecIndex;
  // colunas visíveis (colunas agrupadas ficam ocultas, como no cxGrid)
  SetLength(FVisCols, 0);
  if IsBanded then
  begin
    // visão em bandas: colunas na ordem das bandas; sem banda vão para o fim
    for J := 0 to FBands.Count - 1 do
      if FBands[J].Visible then
        for I := 0 to FColumns.Count - 1 do
          if FColumns[I].Visible and (FColumns[I].FBandIndex = J) and
             (FGroupCols.IndexOf(FColumns[I]) < 0) then
          begin
            SetLength(FVisCols, Length(FVisCols) + 1);
            FVisCols[High(FVisCols)] := FColumns[I];
          end;
    for I := 0 to FColumns.Count - 1 do
      if FColumns[I].Visible and ((FColumns[I].FBandIndex < 0) or
         (FColumns[I].FBandIndex >= FBands.Count)) and
         (FGroupCols.IndexOf(FColumns[I]) < 0) then
      begin
        SetLength(FVisCols, Length(FVisCols) + 1);
        FVisCols[High(FVisCols)] := FColumns[I];
      end;
  end
  else
    for I := 0 to FColumns.Count - 1 do
      if FColumns[I].Visible and (FGroupCols.IndexOf(FColumns[I]) < 0) then
      begin
        SetLength(FVisCols, Length(FVisCols) + 1);
        FVisCols[High(FVisCols)] := FColumns[I];
      end;
  // filtro
  SetLength(FFiltered, FData.FCount);
  N := 0;
  for I := 0 to FData.FCount - 1 do
    if RecordPassesFilter(I) then
    begin
      FFiltered[N] := I;
      Inc(N);
    end;
  SetLength(FFiltered, N);
  // ordenação
  FSorted := Copy(FFiltered, 0, N);
  SortIndices(FSorted);
  // linhas
  FRowCount := 0;
  if N > 0 then
    Emit(0, N - 1, 0, '');
  // restaura foco
  if FRowCount = 0 then
    FFocusedRow := -1
  else
  begin
    if OldRec >= 0 then
      for I := 0 to FRowCount - 1 do
        if FRows[I].RecIndex = OldRec then
        begin
          FFocusedRow := I;
          Break;
        end;
    FFocusedRow := EnsureRange(FFocusedRow, 0, FRowCount - 1);
    // nunca focar a área de um detalhe: volta para o registro mestre
    while (FFocusedRow > 0) and (FRows[FFocusedRow].Kind = vrkDetail) do
      Dec(FFocusedRow);
  end;
  if FFocusedCol >= Length(FVisCols) then
    FFocusedCol := Max(0, High(FVisCols));
  UpdateScrollBars;
end;

procedure TEsGrid.EnsureBuilt;
begin
  if FNeedRebuild then
    Rebuild;
end;

function TEsGrid.GetGroupCount: Integer;
begin
  Result := FGroupCols.Count;
end;

function TEsGrid.GetViewRow(Index: Integer): TEsViewRow;
begin
  EnsureBuilt;
  Result := FRows[Index];
end;

function TEsGrid.ViewRecordCount: Integer;
begin
  EnsureBuilt;
  Result := Length(FSorted);
end;

function TEsGrid.GroupColumn(AIndex: Integer): TEsGridColumn;
begin
  Result := TEsGridColumn(FGroupCols[AIndex]);
end;

function TEsGrid.VisibleColumnCount: Integer;
begin
  EnsureBuilt;
  Result := Length(FVisCols);
end;

function TEsGrid.VisibleColumn(AIndex: Integer): TEsGridColumn;
begin
  EnsureBuilt;
  Result := FVisCols[AIndex];
end;

function TEsGrid.ViewRecordIndex(AIndex: Integer): Integer;
begin
  EnsureBuilt;
  Result := FSorted[AIndex];
end;

{ ---------- valores ---------- }

function TEsGrid.GetCellValue(ARecordIndex: Integer; AColumn: TEsGridColumn): Variant;
begin
  Result := FData.GetSlotValue(ARecordIndex, AColumn.FSlot);
end;

procedure TEsGrid.SetCellValue(ARecordIndex: Integer; AColumn: TEsGridColumn;
  const AValue: Variant);
var
  DS: TDataSet;
  F: TField;
  V: Variant;
  Accept: Boolean;
begin
  V := AValue;
  Accept := True;
  if Assigned(FOnValidateValue) then
    FOnValidateValue(Self, ARecordIndex, AColumn, V, Accept);
  if not Accept then Exit;
  if FDataLink.Active and (AColumn.FieldName <> '') then
  begin
    DS := FDataLink.DataSet;
    F := DS.FindField(AColumn.FieldName);
    if (F <> nil) and not F.ReadOnly and DS.CanModify then
    begin
      FSyncingDataSet := True;
      try
        if FData.RecNoOf(ARecordIndex) > 0 then
          DS.RecNo := FData.RecNoOf(ARecordIndex);
        DS.Edit;
        if EsVarIsEmptyOrNull(V) or (VarToStr(V) = '') then
          F.Clear
        else
          F.Value := V;
        DS.Post;
        V := F.Value;
      finally
        FSyncingDataSet := False;
      end;
    end;
  end;
  // grade de detalhe: grava também no registro de origem do modelo
  if (FMasterGrid <> nil) and (FMasterGrid.FDetailTemplate <> nil) and
     (ARecordIndex >= 0) and (ARecordIndex < Length(FDetailSourceRecs)) and
     (AColumn.Index < FMasterGrid.FDetailTemplate.FColumns.Count) then
  begin
    FMasterGrid.FWritingBack := True;
    try
      FMasterGrid.FDetailTemplate.SetCellValue(FDetailSourceRecs[ARecordIndex],
        FMasterGrid.FDetailTemplate.FColumns[AColumn.Index], V);
    finally
      FMasterGrid.FWritingBack := False;
    end;
  end;
  FData.SetSlotValue(ARecordIndex, AColumn.FSlot, V);
end;

function TEsGrid.DisplayText(ARecordIndex: Integer; AColumn: TEsGridColumn): string;
begin
  Result := AColumn.FormatValue(FData.GetSlotValue(ARecordIndex, AColumn.FSlot));
  if Assigned(FOnGetDisplayText) then
    FOnGetDisplayText(Self, ARecordIndex, AColumn, Result);
end;

function TEsGrid.SummaryValue(AColumn: TEsGridColumn; AKind: TEsSummaryKind;
  AFirstSorted, ALastSorted: Integer): Variant;
var
  I, Cnt, NumCnt: Integer;
  V, Best: Variant;
  Sum: Double;
begin
  Result := Null;
  if AKind = skCount then
    Exit(Max(0, ALastSorted - AFirstSorted + 1));
  Cnt := 0;
  NumCnt := 0;
  Sum := 0;
  Best := Null;
  for I := AFirstSorted to ALastSorted do
  begin
    V := FData.GetSlotValue(FSorted[I], AColumn.FSlot);
    if EsVarIsEmptyOrNull(V) then Continue;
    Inc(Cnt);
    if VarIsNumericOrDate(V) then
    begin
      Sum := Sum + Double(VarAsType(V, varDouble));
      Inc(NumCnt);
    end;
    case AKind of
      skMin: if EsVarIsEmptyOrNull(Best) or (CompareVariants(V, Best) < 0) then Best := V;
      skMax: if EsVarIsEmptyOrNull(Best) or (CompareVariants(V, Best) > 0) then Best := V;
    end;
  end;
  case AKind of
    skSum: Result := Sum;
    skAverage: if NumCnt > 0 then Result := Sum / NumCnt else Result := 0.0;
    skMin, skMax: Result := Best;
  end;
end;

function TEsGrid.SummaryKindText(AColumn: TEsGridColumn; AKind: TEsSummaryKind;
  AFirstSorted, ALastSorted: Integer): string;
var
  V: Variant;
  F: string;
begin
  Result := '';
  if AKind = skNone then Exit;
  V := SummaryValue(AColumn, AKind, AFirstSorted, ALastSorted);
  // mesmos formatos do TToolBarGrid: 'Registros: ,0', 'Soma: ,0.00', 'Média: ,0.00'
  case AKind of
    skCount: Result := FormatFloat(',0', Double(V));
    skSum, skAverage:
      begin
        F := AColumn.FDisplayFormat;
        if F = '' then F := ',0.00';
        Result := FormatFloat(F, Double(V));
      end;
  else
    Result := AColumn.FormatValue(V);
  end;
  if (AKind = AColumn.FSummaryKind) and (AColumn.FSummaryFormat <> '') then
    Exit(Format(AColumn.FSummaryFormat, [Result]));
  case AKind of
    skCount: Result := Format(rsEsSumFmtCount, [Result]);
    skSum: Result := Format(rsEsSumFmtSum, [Result]);
    skAverage: Result := Format(rsEsSumFmtAvg, [Result]);
    skMin: Result := Format(rsEsSumFmtMin, [Result]);
    skMax: Result := Format(rsEsSumFmtMax, [Result]);
  end;
end;

function TEsGrid.SummaryText(AColumn: TEsGridColumn; AFirstSorted,
  ALastSorted: Integer): string;
var
  K: TEsSummaryKind;
begin
  Result := '';
  for K in SummaryOrder do
    if K in AColumn.FooterKinds then
    begin
      if Result <> '' then Result := Result + ' | ';
      Result := Result + SummaryKindText(AColumn, K, AFirstSorted, ALastSorted);
    end;
end;

function TEsGrid.HasFooterSummaries: Boolean;
var
  I: Integer;
begin
  for I := 0 to FColumns.Count - 1 do
    if FColumns[I].FooterKinds <> [] then Exit(True);
  Result := False;
end;

function TEsGrid.HasGroupSummaries: Boolean;
var
  I: Integer;
begin
  for I := 0 to FColumns.Count - 1 do
    if FColumns[I].FGroupSummaries <> [] then Exit(True);
  Result := False;
end;

procedure TEsGrid.AddFooterSummary(AColumn: TEsGridColumn; AKind: TEsSummaryKind);
begin
  if (AColumn = nil) or (AKind = skNone) then Exit;
  AColumn.FooterSummaries := AColumn.FooterSummaries + [AKind];
  FOptionsView.Footer := True;
end;

procedure TEsGrid.AddGroupSummary(AColumn: TEsGridColumn; AKind: TEsSummaryKind);
begin
  if (AColumn = nil) or (AKind = skNone) then Exit;
  AColumn.GroupSummaries := AColumn.GroupSummaries + [AKind];
end;

procedure TEsGrid.RemoveAllSummaries;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to FColumns.Count - 1 do
    begin
      FColumns[I].FSummaryKind := skNone;
      FColumns[I].FFooterSummaries := [];
      FColumns[I].FGroupSummaries := [];
    end;
    FOptionsView.FFooter := False;
  finally
    EndUpdate;
  end;
end;

{ ---------- seleção múltipla ---------- }

procedure TEsGrid.SetMultiSelect(AValue: Boolean);
begin
  if FMultiSelect = AValue then Exit;
  FMultiSelect := AValue;
  SetLength(FSelected, 0);
  FAnchorRow := FFocusedRow;
  DataChanged;
  if Assigned(FOnSelectionChanged) and not (csLoading in ComponentState) then
    FOnSelectionChanged(Self);
end;

procedure TEsGrid.SelectionChanged;
begin
  Invalidate;
  if Assigned(FOnSelectionChanged) then FOnSelectionChanged(Self);
  if FStateHandlers <> nil then FStateHandlers.CallNotifyEvents(Self);
end;

function TEsGrid.IsRecordSelected(ARecordIndex: Integer): Boolean;
begin
  Result := FMultiSelect and (ARecordIndex >= 0) and
    (ARecordIndex < Length(FSelected)) and FSelected[ARecordIndex];
end;

procedure TEsGrid.SelectRecord(ARecordIndex: Integer; ASelect: Boolean);
begin
  if not FMultiSelect or (ARecordIndex < 0) or (ARecordIndex >= FData.FCount) then Exit;
  if Length(FSelected) < FData.FCount then
    SetLength(FSelected, FData.FCount);
  FSelected[ARecordIndex] := ASelect;
  SelectionChanged;
end;

procedure TEsGrid.SelectAll;
var
  I: Integer;
begin
  if not FMultiSelect then Exit;
  EnsureBuilt;
  SetLength(FSelected, 0);
  SetLength(FSelected, FData.FCount);
  for I := 0 to High(FSorted) do
    FSelected[FSorted[I]] := True;
  SelectionChanged;
end;

procedure TEsGrid.ClearSelection;
begin
  SetLength(FSelected, 0);
  SelectionChanged;
end;

function TEsGrid.SelectedRecordCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to High(FSelected) do
    if FSelected[I] then Inc(Result);
end;

function TEsGrid.SelectedRecords: TEsIntegerArray;
var
  I, N: Integer;
begin
  Result := nil;
  EnsureBuilt;
  SetLength(Result, Length(FSorted));
  N := 0;
  // na ordem em que aparecem na grade
  for I := 0 to High(FSorted) do
    if IsRecordSelected(FSorted[I]) then
    begin
      Result[N] := FSorted[I];
      Inc(N);
    end;
  SetLength(Result, N);
end;

procedure TEsGrid.SelectViewRange(AFromRow, AToRow: Integer; AKeep: Boolean);
var
  I, A, B: Integer;
begin
  if not AKeep then SetLength(FSelected, 0);
  SetLength(FSelected, FData.FCount);
  A := Min(AFromRow, AToRow);
  B := Max(AFromRow, AToRow);
  for I := Max(0, A) to Min(B, FRowCount - 1) do
    if FRows[I].Kind = vrkData then
      FSelected[FRows[I].RecIndex] := True;
  SelectionChanged;
end;

procedure TEsGrid.AddStateChangeHandler(const AHandler: TNotifyEvent);
begin
  FStateHandlers.Add(AHandler);
end;

procedure TEsGrid.RemoveStateChangeHandler(const AHandler: TNotifyEvent);
begin
  if FStateHandlers <> nil then
    FStateHandlers.Remove(AHandler);
end;

{ ---------- layout ---------- }

function KindsToInt(K: TEsSummaryKinds): Integer;
var
  E: TEsSummaryKind;
begin
  Result := 0;
  for E := Low(TEsSummaryKind) to High(TEsSummaryKind) do
    if E in K then Result := Result or (1 shl Ord(E));
end;

function IntToKinds(V: Integer): TEsSummaryKinds;
var
  E: TEsSummaryKind;
begin
  Result := [];
  for E := Low(TEsSummaryKind) to High(TEsSummaryKind) do
    if (V and (1 shl Ord(E))) <> 0 then Include(Result, E);
end;

function TEsGrid.ColumnSortIndex(AColumn: TEsGridColumn): Integer;
begin
  Result := FSortCols.IndexOf(AColumn);
end;

procedure TEsGrid.StoreToIni(AIni: TCustomIniFile; const APrefix: string);
var
  I: Integer;
  C: TEsGridColumn;
  Sec: string;
  L: TStringList;
begin
  // remove seções antigas deste prefixo
  L := TStringList.Create;
  try
    AIni.ReadSections(L);
    for I := 0 to L.Count - 1 do
      if SameText(Copy(L[I], 1, Length(APrefix)), APrefix) then
        AIni.EraseSection(L[I]);
  finally
    L.Free;
  end;
  Sec := APrefix + '.Options';
  AIni.WriteBool(Sec, 'GroupByBox', FOptionsView.GroupByBox);
  AIni.WriteBool(Sec, 'FilterRow', FOptionsView.FilterRow);
  AIni.WriteBool(Sec, 'Footer', FOptionsView.Footer);
  AIni.WriteBool(Sec, 'FindPanel', FOptionsView.FindPanel);
  AIni.WriteInteger(Sec, 'ViewMode', Ord(FViewMode));
  for I := 0 to FBands.Count - 1 do
    AIni.WriteBool(Sec, 'BandVisible' + IntToStr(I), FBands[I].Visible);
  for I := 0 to FColumns.Count - 1 do
  begin
    C := FColumns[I];
    Sec := APrefix + '.Column.' + C.LayoutKey;
    AIni.WriteInteger(Sec, 'Index', C.Index);
    AIni.WriteInteger(Sec, 'Width', C.Width);
    AIni.WriteBool(Sec, 'Visible', C.Visible);
    AIni.WriteInteger(Sec, 'SortOrder', Ord(C.FSortOrder));
    AIni.WriteInteger(Sec, 'SortIndex', FSortCols.IndexOf(C));
    AIni.WriteInteger(Sec, 'GroupIndex', FGroupCols.IndexOf(C));
    AIni.WriteString(Sec, 'Filter', C.FFilterText);
    AIni.WriteInteger(Sec, 'SummaryKind', Ord(C.FSummaryKind));
    AIni.WriteInteger(Sec, 'FooterSummaries', KindsToInt(C.FFooterSummaries));
    AIni.WriteInteger(Sec, 'GroupSummaries', KindsToInt(C.FGroupSummaries));
    AIni.WriteInteger(Sec, 'BandIndex', C.FBandIndex);
  end;
end;

procedure TEsGrid.RestoreFromIni(AIni: TCustomIniFile; const APrefix: string);
type
  TColInfo = record
    Col: TEsGridColumn;
    Index, SortIndex, GroupIndex: Integer;
    Found: Boolean;
  end;
var
  Infos: TArray<TColInfo>;
  I, J, N: Integer;
  C: TEsGridColumn;
  Sec: string;
  Tmp: TColInfo;
  Order: TArray<TEsGridColumn>;
begin
  SetLength(Infos, FColumns.Count);
  BeginUpdate;
  try
    Sec := APrefix + '.Options';
    if AIni.SectionExists(Sec) then
    begin
      FOptionsView.FGroupByBox := AIni.ReadBool(Sec, 'GroupByBox', FOptionsView.GroupByBox);
      FOptionsView.FFilterRow := AIni.ReadBool(Sec, 'FilterRow', FOptionsView.FilterRow);
      FOptionsView.FFooter := AIni.ReadBool(Sec, 'Footer', FOptionsView.Footer);
      FOptionsView.FFindPanel := AIni.ReadBool(Sec, 'FindPanel', FOptionsView.FindPanel);
      FFindPanelCtl.Visible := FOptionsView.FFindPanel;
      FViewMode := TEsGridViewMode(EnsureRange(AIni.ReadInteger(Sec, 'ViewMode',
        Ord(FViewMode)), 0, Ord(High(TEsGridViewMode))));
      for I := 0 to FBands.Count - 1 do
        FBands[I].FVisible := AIni.ReadBool(Sec, 'BandVisible' + IntToStr(I), FBands[I].FVisible);
      FCardLayoutValid := False;
    end;
    for I := 0 to FColumns.Count - 1 do
    begin
      C := FColumns[I];
      Infos[I].Col := C;
      Infos[I].Index := I;
      Infos[I].SortIndex := -1;
      Infos[I].GroupIndex := -1;
      Sec := APrefix + '.Column.' + C.LayoutKey;
      Infos[I].Found := AIni.SectionExists(Sec);
      if not Infos[I].Found then Continue;
      Infos[I].Index := AIni.ReadInteger(Sec, 'Index', I);
      C.FWidth := Max(C.FMinWidth, AIni.ReadInteger(Sec, 'Width', C.FWidth));
      C.FVisible := AIni.ReadBool(Sec, 'Visible', C.FVisible);
      C.FSortOrder := TEsSortOrder(EnsureRange(AIni.ReadInteger(Sec, 'SortOrder', 0),
        0, Ord(High(TEsSortOrder))));
      Infos[I].SortIndex := AIni.ReadInteger(Sec, 'SortIndex', -1);
      Infos[I].GroupIndex := AIni.ReadInteger(Sec, 'GroupIndex', -1);
      C.FFilterText := AIni.ReadString(Sec, 'Filter', '');
      C.FSummaryKind := TEsSummaryKind(EnsureRange(AIni.ReadInteger(Sec, 'SummaryKind', 0),
        0, Ord(High(TEsSummaryKind))));
      C.FFooterSummaries := IntToKinds(AIni.ReadInteger(Sec, 'FooterSummaries', 0)) - [skNone];
      C.FGroupSummaries := IntToKinds(AIni.ReadInteger(Sec, 'GroupSummaries', 0)) - [skNone];
      C.FBandIndex := Max(-1, AIni.ReadInteger(Sec, 'BandIndex', C.FBandIndex));
    end;
    // ordem das colunas (as que não existiam no layout vão para o fim)
    for I := 0 to High(Infos) do
      if not Infos[I].Found then Infos[I].Index := 10000 + I;
    for I := 1 to High(Infos) do
    begin
      Tmp := Infos[I];
      J := I - 1;
      while (J >= 0) and (Infos[J].Index > Tmp.Index) do
      begin
        Infos[J + 1] := Infos[J];
        Dec(J);
      end;
      Infos[J + 1] := Tmp;
    end;
    SetLength(Order, Length(Infos));
    for I := 0 to High(Infos) do Order[I] := Infos[I].Col;
    FColumns.BeginUpdate;
    try
      for I := 0 to High(Order) do
        Order[I].Index := I;
    finally
      FColumns.EndUpdate;
    end;
    // agrupamento
    FGroupCols.Clear;
    N := 0;
    for I := 0 to High(Infos) do
      if Infos[I].GroupIndex >= 0 then N := Max(N, Infos[I].GroupIndex + 1);
    for J := 0 to N - 1 do
      for I := 0 to High(Infos) do
        if Infos[I].GroupIndex = J then
        begin
          if Infos[I].Col.FSortOrder = esoNone then Infos[I].Col.FSortOrder := esoAscending;
          FGroupCols.Add(Infos[I].Col);
        end;
    // ordenação
    FSortCols.Clear;
    N := 0;
    for I := 0 to High(Infos) do
      if Infos[I].SortIndex >= 0 then N := Max(N, Infos[I].SortIndex + 1);
    for J := 0 to N - 1 do
      for I := 0 to High(Infos) do
        if (Infos[I].SortIndex = J) and (Infos[I].Col.FSortOrder <> esoNone) and
           (FGroupCols.IndexOf(Infos[I].Col) < 0) then
          FSortCols.Add(Infos[I].Col);
    FToggled.Clear;
    SetLength(FVisCols, 0);
  finally
    EndUpdate;
  end;
end;

procedure TEsGrid.StoreToIniFile(const AFileName: string);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(AFileName, TEncoding.UTF8);
  try
    StoreToIni(Ini);
    Ini.UpdateFile;
  finally
    Ini.Free;
  end;
end;

procedure TEsGrid.RestoreFromIniFile(const AFileName: string);
var
  Ini: TMemIniFile;
begin
  if not FileExists(AFileName) then Exit;
  Ini := TMemIniFile.Create(AFileName, TEncoding.UTF8);
  try
    RestoreFromIni(Ini);
  finally
    Ini.Free;
  end;
end;

{ ---------- DataSet ---------- }

procedure TEsGrid.CreateColumnsFromDataSet(ADataSet: TDataSet);
var
  I: Integer;
  F: TField;
  C: TEsGridColumn;
begin
  if ADataSet = nil then Exit;
  FColumns.BeginUpdate;
  try
    for I := 0 to ADataSet.FieldCount - 1 do
    begin
      F := ADataSet.Fields[I];
      if not F.Visible then Continue;
      if FColumns.ColumnByFieldName(F.FieldName) <> nil then Continue;
      C := FColumns.Add;
      C.FieldName := F.FieldName;
      C.Caption := F.DisplayLabel;
      C.Width := EnsureRange(F.DisplayWidth * EsMeasureCanvas(Font).TextWidth('0') + 12, 50, 300);
      case F.DataType of
        ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftLargeint,
        ftFMTBcd, ftAutoInc:
          C.DataKind := dkNumber;
        ftDate, ftTime, ftDateTime, ftTimeStamp:
          C.DataKind := dkDate;
        ftBoolean:
          C.DataKind := dkBoolean;
      else
        C.DataKind := dkString;
      end;
      if F.DataType = ftCurrency then
        C.DisplayFormat := ',0.00';
    end;
  finally
    FColumns.EndUpdate;
  end;
end;

procedure TEsGrid.LoadFromDataSet(ADataSet: TDataSet);
var
  BM: TBookmark;
  I, R, RN: Integer;
  Fields: TArray<TField>;
begin
  if (ADataSet = nil) or not ADataSet.Active then Exit;
  if csDestroying in ComponentState then Exit;
  FLoadingDataSet := True;
  try
    if (FColumns.Count = 0) and not (csDesigning in ComponentState) then
      CreateColumnsFromDataSet(ADataSet);
    SetLength(Fields, FColumns.Count);
    for I := 0 to FColumns.Count - 1 do
      if FColumns[I].FieldName <> '' then
        Fields[I] := ADataSet.FindField(FColumns[I].FieldName)
      else
        Fields[I] := nil;
    RN := ADataSet.RecNo;
    BM := ADataSet.GetBookmark;
    ADataSet.DisableControls;
    FData.BeginUpdate;
    try
      FData.Clear;
      ADataSet.First;
      while not ADataSet.EOF do
      begin
        R := FData.AppendRecord;
        FData.FRecNos[R] := ADataSet.RecNo;
        for I := 0 to High(Fields) do
          if Fields[I] <> nil then
            FData.SetSlotValue(R, FColumns[I].FSlot, Fields[I].Value);
        ADataSet.Next;
      end;
      if ADataSet.BookmarkValid(BM) then
        ADataSet.GotoBookmark(BM);
    finally
      ADataSet.FreeBookmark(BM);
      FData.FUpdateCount := 0;
      ADataSet.EnableControls;
    end;
    Rebuild;
    FocusRecordByRecNo(RN);
  finally
    FLoadingDataSet := False;
  end;
  Invalidate;
end;

procedure TEsGrid.FocusRecordByRecNo(ARecNo: Integer);
var
  I: Integer;
begin
  EnsureBuilt;
  for I := 0 to FRowCount - 1 do
    if (FRows[I].Kind = vrkData) and (FData.RecNoOf(FRows[I].RecIndex) = ARecNo) then
    begin
      if I <> FFocusedRow then
      begin
        FFocusedRow := I;
        MakeRowVisible(I);
        Invalidate;
      end;
      Exit;
    end;
end;

procedure TEsGrid.SyncDataSetPosition;
var
  Rec, RN: Integer;
begin
  if not FDataLink.Active or FLoadingDataSet then Exit;
  Rec := FocusedRecordIndex;
  if Rec < 0 then Exit;
  RN := FData.RecNoOf(Rec);
  if (RN > 0) and (FDataLink.DataSet.RecNo <> RN) then
  begin
    FSyncingDataSet := True;
    try
      FDataLink.DataSet.RecNo := RN;
    finally
      FSyncingDataSet := False;
    end;
  end;
end;

{ ---------- agrupamento / ordenação ---------- }

procedure TEsGrid.GroupBy(AColumn: TEsGridColumn; ALevel: Integer);
begin
  if AColumn = nil then Exit;
  FGroupCols.Remove(AColumn);
  FSortCols.Remove(AColumn);
  if AColumn.FSortOrder = esoNone then
    AColumn.FSortOrder := esoAscending;
  if (ALevel < 0) or (ALevel > FGroupCols.Count) then
    FGroupCols.Add(AColumn)
  else
    FGroupCols.Insert(ALevel, AColumn);
  FToggled.Clear;
  ColumnsChanged;
end;

procedure TEsGrid.UngroupColumn(AColumn: TEsGridColumn);
begin
  if FGroupCols.IndexOf(AColumn) < 0 then Exit;
  FGroupCols.Remove(AColumn);
  if AColumn.FSortOrder <> esoNone then
    FSortCols.Insert(0, AColumn);
  FToggled.Clear;
  ColumnsChanged;
end;

procedure TEsGrid.ClearGrouping;
var
  I: Integer;
begin
  for I := FGroupCols.Count - 1 downto 0 do
    TEsGridColumn(FGroupCols[I]).FSortOrder := esoNone;
  FGroupCols.Clear;
  FToggled.Clear;
  ColumnsChanged;
end;

procedure TEsGrid.ClearSorting;
var
  I: Integer;
begin
  for I := 0 to FSortCols.Count - 1 do
    TEsGridColumn(FSortCols[I]).FSortOrder := esoNone;
  FSortCols.Clear;
  DataChanged;
end;

procedure TEsGrid.ClearFilter;
var
  I: Integer;
begin
  for I := 0 to FColumns.Count - 1 do
    FColumns[I].FFilterText := '';
  FFindEdit.Text := '';
  FFindText := '';
  DataChanged;
end;

procedure TEsGrid.FullExpand;
var
  I: Integer;
begin
  FToggled.Clear;
  if not FOptionsView.ExpandGroupsByDefault then
  begin
    // força todos expandidos: marca todas as chaves de grupo conhecidas
    FOptionsView.FExpandGroupsByDefault := True;
  end;
  DataChanged;
end;

procedure TEsGrid.FullCollapse;
begin
  FToggled.Clear;
  FOptionsView.FExpandGroupsByDefault := False;
  DataChanged;
end;

procedure TEsGrid.HeaderClick(AColumn: TEsGridColumn; Shift: TShiftState);
var
  I: Integer;
begin
  if (AColumn = nil) or not AColumn.AllowSort then Exit;
  if ssCtrl in Shift then
  begin
    AColumn.SortOrder := esoNone;
    Exit;
  end;
  if not (ssShift in Shift) then
  begin
    // ordenação simples: limpa as demais (exceto agrupadas)
    for I := FSortCols.Count - 1 downto 0 do
      if FSortCols[I] <> Pointer(AColumn) then
      begin
        TEsGridColumn(FSortCols[I]).FSortOrder := esoNone;
        FSortCols.Delete(I);
      end;
  end;
  if AColumn.SortOrder = esoAscending then
    AColumn.SortOrder := esoDescending
  else
    AColumn.SortOrder := esoAscending;
  DataChanged;
end;

procedure TEsGrid.ApplyBestFit(AColumn: TEsGridColumn);
var
  I, J, W: Integer;
  C: TEsGridColumn;
begin
  EnsureBuilt;
    for J := 0 to FColumns.Count - 1 do
  begin
    C := FColumns[J];
    if (AColumn <> nil) and (C <> AColumn) then Continue;
    W := EsMeasureCanvas(Font).TextWidth(C.Caption) + 28;
    for I := 0 to Min(High(FSorted), 2000) do
      W := Max(W, EsMeasureCanvas(Font).TextWidth(DisplayText(FSorted[I], C)) + 14);
    C.Width := Min(W, 600);
  end;
end;

{ ---------- geometria ---------- }

function TEsGrid.ClientW: Integer;
begin
  Result := ClientWidth;
  if FVScroll.Visible and not (csDesigning in ComponentState) then
    Dec(Result, FVScroll.Width);
end;

function TEsGrid.FindPanelHeight: Integer;
begin
  if FFindPanelCtl.Visible and not (csDesigning in ComponentState) then Result := FFindPanelCtl.Height else Result := 0;
end;

function TEsGrid.GroupPanelHeight: Integer;
begin
  if not FOptionsView.GroupByBox then Exit(0);
  if FGroupCols.Count = 0 then
    Result := EsScale(Self, 38)
  else
    Result := EsScale(Self, 14) + EsScale(Self, ChipH) + (FGroupCols.Count - 1) * EsScale(Self, 8);
end;

function TEsGrid.BandRowHeight: Integer;
begin
  if IsBanded then Result := FRowHeight + 2 else Result := 0;
end;

function TEsGrid.HeaderTop: Integer;
begin
  Result := FindPanelHeight + GroupPanelHeight + BandRowHeight;
end;

function TEsGrid.FixedLeft: Integer;
begin
  Result := IndicatorWidth + FGroupCols.Count * IndentWidth + DetailButtonWidth;
end;

function TEsGrid.HeaderHeight: Integer;
begin
  Result := FRowHeight + 2;
end;

function TEsGrid.FilterRowTop: Integer;
begin
  Result := HeaderTop + HeaderHeight;
end;

function TEsGrid.DataTop: Integer;
begin
  Result := FilterRowTop;
  if FOptionsView.FilterRow then Inc(Result, FRowHeight);
end;

function TEsGrid.DataBottom: Integer;
begin
  Result := ClientHeight;
  if FHScroll.Visible and not (csDesigning in ComponentState) then
    Dec(Result, FHScroll.Height);
  if FOptionsView.Footer then Dec(Result, FRowHeight + 2);
end;

function TEsGrid.FooterTop: Integer;
begin
  Result := DataBottom;
end;

function TEsGrid.IndicatorWidth: Integer;
begin
  if FOptionsView.Indicator then Result := EsScale(Self, 14) else Result := 0;
end;

function TEsGrid.IndentWidth: Integer;
begin
  Result := EsScale(Self, 20);
end;

function TEsGrid.ColumnsLeft: Integer;
begin
  Result := FixedLeft - FHOffset;
end;

function TEsGrid.ColumnX(AColumn: TEsGridColumn): Integer;
var
  I: Integer;
begin
  Result := ColumnsLeft;
  for I := 0 to High(FVisCols) do
  begin
    if FVisCols[I] = AColumn then Exit;
    Inc(Result, FVisCols[I].Width);
  end;
end;

function TEsGrid.TotalColumnsWidth: Integer;
var
  I: Integer;
begin
  Result := FixedLeft;
  for I := 0 to High(FVisCols) do
    Inc(Result, FVisCols[I].Width);
end;

function TEsGrid.VisibleRowCount: Integer;
begin
  Result := Max(1, (DataBottom - DataTop) div Max(1, FRowHeight));
end;

function TEsGrid.ChipRect(Index: Integer): TRect;
var
  I, X, W: Integer;
begin
  X := EsScale(Self, 10);
    for I := 0 to Index - 1 do
    Inc(X, EsMeasureCanvas(Font).TextWidth(TEsGridColumn(FGroupCols[I]).GetDisplayName) + EsScale(Self, 40));
  W := EsMeasureCanvas(Font).TextWidth(TEsGridColumn(FGroupCols[Index]).GetDisplayName) + EsScale(Self, 28);
  Result.Left := X;
  Result.Top := FindPanelHeight + EsScale(Self, 7) + Index * EsScale(Self, 8);
  Result.Right := X + W;
  Result.Bottom := Result.Top + EsScale(Self, ChipH);
end;

function TEsGrid.CellRect(AViewRow: Integer; AColumn: TEsGridColumn): TRect;
var
  Y, I: Integer;
begin
  if IsCardMode then
  begin
    for I := 0 to High(FVisCols) do
      if FVisCols[I] = AColumn then
        Exit(CardFieldRect(AViewRow, I));
    Exit(CardRect(AViewRow));
  end;
  Y := DataTop + (AViewRow - FTopRow) * FRowHeight;
  Result.Left := ColumnX(AColumn);
  Result.Right := Result.Left + AColumn.Width;
  Result.Top := Y;
  Result.Bottom := Y + FRowHeight;
end;

function TEsGrid.ScrollCount: Integer;
begin
  if IsCardMode then
  begin
    EnsureCardLayout;
    Result := Length(FCardLines);
  end
  else
    Result := FRowCount;
end;

procedure TEsGrid.UpdateScrollBars;
var
  VisRows, Total, DataW, Cnt, MaxTop: Integer;
  NeedV, NeedH: Boolean;
begin
  if FScrolling or (FVScroll = nil) then Exit;
  FScrolling := True;
  try
    Total := TotalColumnsWidth;
    Cnt := ScrollCount;
    if IsCardMode then
    begin
      MaxTop := CardMaxTop;
      NeedV := MaxTop > 0;
    end
    else
    begin
      VisRows := VisibleRowCount;
      NeedV := FRowCount > VisRows;
    end;
    if FVScroll.Visible <> NeedV then
    begin
      FVScroll.Visible := NeedV;
      FCardLayoutValid := False; // a largura útil mudou
      Cnt := ScrollCount;
    end;
    DataW := ClientW;
    NeedH := Total > DataW;
    if FHScroll.Visible <> NeedH then FHScroll.Visible := NeedH;
    if IsCardMode then
    begin
      MaxTop := CardMaxTop;
      VisRows := CardLinesFitting(FTopRow);
    end
    else
    begin
      VisRows := VisibleRowCount;
      MaxTop := Max(0, FRowCount - VisRows);
    end;
    if NeedV then
    begin
      EsSetScrollParams(FVScroll, FTopRow, 0, Max(0, Cnt - 1), Max(1, Cnt - MaxTop));
      FVScroll.LargeChange := Max(1, VisRows);
    end;
    FTopRow := EnsureRange(FTopRow, 0, MaxTop);
    if NeedH then
    begin
      EsSetScrollParams(FHScroll, FHOffset, 0, Total, Max(1, DataW));
      FHScroll.LargeChange := Max(1, DataW div 2);
      FHScroll.SmallChange := 20;
    end;
    FHOffset := EnsureRange(FHOffset, 0, Max(0, Total - DataW));
    if not NeedH then FHOffset := 0;
  finally
    FScrolling := False;
  end;
  LayoutDetails;
end;

procedure TEsGrid.ScrollBarChange(Sender: TObject);
begin
  if FScrolling then Exit;
  HideEditor(True);
  if Sender = FVScroll then
    FTopRow := FVScroll.Position
  else
    FHOffset := FHScroll.Position;
  LayoutDetails;
  Invalidate;
end;

procedure TEsGrid.Resize;
begin
  inherited Resize;
  if FVScroll = nil then Exit;
  FCardLayoutValid := False;
  UpdateScrollBars;
  // mostrar o editor (filho) também dispara Resize: só fecha se o tamanho mudou
  if (Width <> FLastSize.X) or (Height <> FLastSize.Y) then
  begin
    FLastSize := Point(Width, Height);
    HideEditor(True);
  end;
end;

{ ---------- desenho ---------- }

procedure TEsGrid.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TEsGrid.PaintCellText(const R: TRect; const S: string; AAlign: TAlignment;
  AColor: TColor; AHighlight: Boolean);
var
  TR, HR: TRect;
  P, TW, X: Integer;
  Pre, Mid: string;
  DA: TEsHAlign;
begin
  TR := Rect(R.Left + 4, R.Top, R.Right - 4, R.Bottom);
  case AAlign of
    taRightJustify: DA := dhaTrailing;
    taCenter: DA := dhaCenter;
  else
    DA := dhaLeading;
  end;
  // realce do texto pesquisado (Find Panel)
  if AHighlight and (FFindText <> '') then
  begin
    P := Pos(AnsiLowerCase(FFindText), AnsiLowerCase(S));
    if P > 0 then
    begin
      TW := Canvas.TextWidth(S);
      case AAlign of
        taRightJustify: X := TR.Right - TW;
        taCenter: X := (TR.Left + TR.Right - TW) div 2;
      else
        X := TR.Left;
      end;
      Pre := Copy(S, 1, P - 1);
      Mid := Copy(S, P, Length(FFindText));
      HR := Rect(X + Canvas.TextWidth(Pre), R.Top + 3,
        X + Canvas.TextWidth(Pre) + Canvas.TextWidth(Mid), R.Bottom - 3);
      IntersectRect(HR, HR, TR);
      Canvas.Brush.Style := bsSolid;
      Canvas.Brush.Color := TColor($66D9FF); // amarelo suave
      Canvas.FillRect(HR);
      AColor := clBlack;
    end;
  end;
  EsDrawText(Canvas, TR, S, DA, dvaCenter, False, AColor, True);
end;

procedure TEsGrid.PaintGroupPanel(const R: TRect);
var
  T: TEsTheme;
  I: Integer;
  CR, PR: TRect;
  C: TEsGridColumn;
begin
  T := EsSkinTheme;
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := EsColor(T.GroupPanel);
  Canvas.FillRect(R);
  if FGroupCols.Count = 0 then
  begin
    Canvas.Font.Style := [];
    EsDrawText(Canvas, Rect(R.Left + 10, R.Top, R.Right - 10, R.Bottom),
      rsEsGroupByBoxHint, dhaLeading, dvaCenter, False, EsColor(T.TextDim), True);
    Exit;
  end;
  for I := 0 to FGroupCols.Count - 1 do
  begin
    C := TEsGridColumn(FGroupCols[I]);
    CR := ChipRect(I);
    // conector em cascata (estilo DevExpress)
    if I > 0 then
    begin
      PR := ChipRect(I - 1);
      Canvas.Pen.Color := EsColor(T.BorderHot);
      EsLine(Canvas, PR.Right - 8, PR.Bottom, PR.Right - 8, (CR.Top + CR.Bottom) div 2);
      EsLine(Canvas, PR.Right - 8, (CR.Top + CR.Bottom) div 2, CR.Left, (CR.Top + CR.Bottom) div 2);
    end;
    EsFillGradientV(Canvas, CR, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
    EsFrame(Canvas, CR, EsColor(T.BorderHot));
    EsDrawText(Canvas, Rect(CR.Left + 6, CR.Top, CR.Right - 16, CR.Bottom),
      C.GetDisplayName, dhaLeading, dvaCenter, False, EsColor(T.HeaderText));
    if C.SortOrder <> esoNone then
      EsDrawSortArrow(Canvas, Rect(CR.Right - 16, CR.Top, CR.Right - 2, CR.Bottom),
        C.SortOrder = esoAscending, EsColor(T.TextDim));
  end;
end;

procedure TEsGrid.PaintHeader(const R: TRect);
var
  T: TEsTheme;
  I, X, SortIdx: Integer;
  C: TEsGridColumn;
  HR, TR: TRect;
  Face1, Face2: TAlphaColor;
begin
  T := EsSkinTheme;
  EsFillGradientV(Canvas, R, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
  Canvas.Pen.Color := EsColor(T.Border);
  EsLine(Canvas, R.Left, R.Bottom - 1, R.Right, R.Bottom - 1);
  X := ColumnsLeft;
  for I := 0 to High(FVisCols) do
  begin
    C := FVisCols[I];
    HR := Rect(X, R.Top, X + C.Width, R.Bottom - 1);
    Inc(X, C.Width);
    if HR.Right < 0 then Continue;
    if HR.Left > ClientW then Break;
    Face1 := T.HeaderFace;
    Face2 := T.HeaderFace2;
    if (C = FHotHeader) and not FDragging then
    begin
      Face1 := BlendOver(Face1, FadeColor(T.Accent, 0.12));
      Face2 := BlendOver(Face2, FadeColor(T.Accent, 0.12));
    end;
    if FDragging and (FDownHit.Area = shaHeader) and (FDownHit.Column = C) then
    begin
      Face1 := BlendOver(Face1, FadeColor(T.Accent, 0.25));
      Face2 := Face1;
    end;
    EsFillGradientV(Canvas, HR, EsColor(Face1), EsColor(Face2));
    Canvas.Pen.Color := EsColor(T.Border);
    EsLine(Canvas, HR.Right - 1, HR.Top + 3, HR.Right - 1, HR.Bottom - 2);
    TR := Rect(HR.Left, HR.Top, HR.Right, HR.Bottom);
    if C.SortOrder <> esoNone then
    begin
      Dec(TR.Right, 14);
      EsDrawSortArrow(Canvas, Rect(HR.Right - 16, HR.Top, HR.Right - 2, HR.Bottom),
        C.SortOrder = esoAscending, EsColor(T.TextDim));
      SortIdx := FSortCols.IndexOf(C);
      if (FSortCols.Count > 1) and (SortIdx >= 0) then
      begin
        Canvas.Font.Size := Max(6, Font.Size - 2);
        EsDrawText(Canvas, Rect(HR.Right - 28, HR.Top, HR.Right - 14, HR.Bottom),
          IntToStr(SortIdx + 1), dhaCenter, dvaCenter, False, EsColor(T.TextDim));
        Canvas.Font.Size := Font.Size;
        Dec(TR.Right, 10);
      end;
    end;
    if C.FFilterText <> '' then
      Canvas.Font.Style := [fsBold, fsUnderline]
    else
      Canvas.Font.Style := [];
    PaintCellText(TR, C.GetDisplayName, C.ResolvedAlignment, EsColor(T.HeaderText), False);
    Canvas.Font.Style := [];
  end;
  // indicador + recuo de grupos (+ coluna dos botões de detalhe)
  if FixedLeft > 0 then
  begin
    HR := Rect(0, R.Top, FixedLeft, R.Bottom - 1);
    EsFillGradientV(Canvas, HR, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
    Canvas.Pen.Color := EsColor(T.Border);
    EsLine(Canvas, HR.Right - 1, HR.Top, HR.Right - 1, HR.Bottom);
  end;
end;

procedure TEsGrid.PaintFilterRow(const R: TRect);
var
  T: TEsTheme;
  I, X, AnyFilter: Integer;
  C: TEsGridColumn;
  CR: TRect;
begin
  T := EsSkinTheme;
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := EsColor(T.SurfaceAlt);
  Canvas.FillRect(R);
  AnyFilter := 0;
  X := ColumnsLeft;
  for I := 0 to High(FVisCols) do
  begin
    C := FVisCols[I];
    CR := Rect(X, R.Top, X + C.Width, R.Bottom);
    Inc(X, C.Width);
    if C.FFilterText <> '' then
    begin
      Inc(AnyFilter);
      PaintCellText(CR, C.FFilterText, C.ResolvedAlignment, EsColor(T.Text), False);
    end;
    if FOptionsView.GridLines then
    begin
      Canvas.Pen.Color := EsColor(T.GridLine);
      EsLine(Canvas, CR.Right - 1, CR.Top, CR.Right - 1, CR.Bottom);
    end;
  end;
  if AnyFilter = 0 then
    EsDrawText(Canvas, Rect(ColumnsLeft + 4, R.Top, ClientW, R.Bottom),
      rsEsFilterRowHint, dhaLeading, dvaCenter, False, EsColor(T.TextDim), True);
  // ícone de funil no indicador
  if IndicatorWidth > 0 then
    EsDrawGlyph(Canvas, Rect(0, R.Top, IndicatorWidth, R.Bottom), sgSearch,
      EsColor(T.TextDim), 3);
  Canvas.Pen.Color := EsColor(T.Border);
  EsLine(Canvas, R.Left, R.Bottom - 1, R.Right, R.Bottom - 1);
end;

procedure TEsGrid.PaintRows;
var
  T: TEsTheme;
  I, J, Y, X, Bottom, LevelX, Cnt: Integer;
  Row: TEsViewRow;
  C: TEsGridColumn;
  CR, RR, BR: TRect;
  Bg, Fg: TColor;
  Selected, IsFocusedCell, Done, InSel: Boolean;
  S, Sm: string;
  V: Variant;
  Kinds: TEsSummaryKinds;
  K: TEsSummaryKind;
begin
  T := EsSkinTheme;
  Y := DataTop;
  Bottom := DataBottom;
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := EsColor(T.Surface);
  Canvas.FillRect(Rect(0, Y, ClientW, Bottom));
  if FRowCount = 0 then
  begin
    EsDrawText(Canvas, Rect(0, Y, ClientW, Min(Bottom, Y + FRowHeight * 3)),
      rsEsNoData, dhaCenter, dvaCenter, False, EsColor(T.TextDim));
    Exit;
  end;
  I := FTopRow;
  while (I < FRowCount) and (Y < Bottom) do
  begin
    Row := FRows[I];
    RR := Rect(0, Y, ClientW, Y + FRowHeight);
    Selected := I = FFocusedRow;
    LevelX := IndicatorWidth + Row.Level * IndentWidth - FHOffset;
    // recuo de grupos à esquerda
    for J := 0 to Row.Level - 1 do
    begin
      Canvas.Brush.Color := EsColor(T.GroupRow);
      Canvas.FillRect(Rect(IndicatorWidth + J * IndentWidth - FHOffset, Y,
        IndicatorWidth + (J + 1) * IndentWidth - FHOffset, Y + FRowHeight));
    end;
    if Row.Kind = vrkGroup then
      PaintGroupRow(I, Y)
    else if Row.Kind = vrkDetail then
    begin
      // área ocupada pela grade de detalhe (o controle filho fica por cima)
      Canvas.Brush.Color := EsColor(T.GroupRow);
      Canvas.FillRect(Rect(LevelX, Y, ClientW, Y + FRowHeight));
      if Row.DetailPart = DetailRowSpan - 1 then
      begin
        Canvas.Pen.Color := EsColor(T.GridLine);
        EsLine(Canvas, LevelX, Y + FRowHeight - 1, ClientW, Y + FRowHeight - 1);
      end;
    end
    else
    begin
      InSel := IsRecordSelected(Row.RecIndex);
      if InSel then
        Bg := EsColor(T.Selection)
      else if FMultiSelect and Selected then
        Bg := EsColor(BlendOver(T.Surface, FadeColor(T.Selection, 0.45)))
      else if Selected and Focused then
        Bg := EsColor(T.Selection)
      else if Selected then
        Bg := EsColor(T.SelectionInactive)
      else if FOptionsView.Striped and Odd(I) then
        Bg := EsColor(T.SurfaceAlt)
      else
        Bg := EsColor(T.Surface);
      Canvas.Brush.Color := Bg;
      Canvas.FillRect(Rect(LevelX, Y, ClientW, Y + FRowHeight));
      if HasDetails then
        EsDrawExpandButton(Canvas, Rect(LevelX, Y, LevelX + DetailButtonWidth, Y + FRowHeight),
          IsDetailExpanded(Row.RecIndex));
      X := ColumnsLeft;
      for J := 0 to High(FVisCols) do
      begin
        C := FVisCols[J];
        CR := Rect(X, Y, X + C.Width, Y + FRowHeight);
        Inc(X, C.Width);
        if CR.Right < LevelX then Continue;
        if CR.Left > ClientW then Break;
        IsFocusedCell := Selected and (J = FFocusedCol) and Focused and not FMultiSelect;
        if IsFocusedCell then
        begin
          Canvas.Brush.Color := EsColor(T.Accent);
          Canvas.FillRect(CR);
          Fg := EsColor(T.AccentText);
        end
        else if InSel or (Selected and Focused and not FMultiSelect) then
          Fg := EsColor(T.SelectionText)
        else
          Fg := EsColor(T.Text);
        Done := False;
        if Assigned(FOnCustomDrawCell) then
        begin
          Canvas.Font.Color := Fg;
          FOnCustomDrawCell(Self, Canvas, CR, Row.RecIndex, C, Selected, Done);
        end;
        if not Done then
        begin
          if C.ResolvedKind = dkBoolean then
          begin
            V := FData.GetSlotValue(Row.RecIndex, C.FSlot);
            EsDrawCheckBox(Canvas, CR, not EsVarIsEmptyOrNull(V) and Boolean(V));
          end
          else
            PaintCellText(CR, DisplayText(Row.RecIndex, C), C.ResolvedAlignment,
              Fg, True);
        end;
        if FOptionsView.GridLines then
        begin
          Canvas.Pen.Color := EsColor(T.GridLine);
          EsLine(Canvas, CR.Right - 1, CR.Top, CR.Right - 1, CR.Bottom);
        end;
      end;
      if FOptionsView.GridLines then
      begin
        Canvas.Pen.Color := EsColor(T.GridLine);
        EsLine(Canvas, LevelX, Y + FRowHeight - 1, ClientW, Y + FRowHeight - 1);
      end;
      // linha focada no modo multisseleção: contorno
      if FMultiSelect and Selected and Focused then
      begin
        Canvas.Pen.Color := EsColor(T.Accent);
        Canvas.Brush.Style := bsClear;
        Canvas.Rectangle(LevelX, Y, ClientW, Y + FRowHeight);
        Canvas.Brush.Style := bsSolid;
      end;
    end;
    // indicador
    if IndicatorWidth > 0 then
    begin
      Canvas.Brush.Color := EsColor(T.HeaderFace);
      Canvas.FillRect(Rect(0, Y, IndicatorWidth, Y + FRowHeight));
      Canvas.Pen.Color := EsColor(T.Border);
      EsLine(Canvas, IndicatorWidth - 1, Y, IndicatorWidth - 1, Y + FRowHeight);
      if Selected then
        EsDrawGlyph(Canvas, Rect(0, Y, IndicatorWidth, Y + FRowHeight),
          sgArrowRight, EsColor(T.Text), 4);
    end;
    Inc(Y, FRowHeight);
    Inc(I);
  end;
end;

procedure TEsGrid.PaintGroupRow(AViewRow, Y: Integer);
var
  T: TEsTheme;
  J, LevelX, Cnt: Integer;
  Row: TEsViewRow;
  CR, BR: TRect;
  Fg: TColor;
  Selected: Boolean;
  S, Sm: string;
  Kinds: TEsSummaryKinds;
  K: TEsSummaryKind;
begin
  T := EsSkinTheme;
  Row := FRows[AViewRow];
  Selected := AViewRow = FFocusedRow;
  if IsCardMode then
    LevelX := IndicatorWidth + Row.Level * IndentWidth
  else
    LevelX := IndicatorWidth + Row.Level * IndentWidth - FHOffset;
      CR := Rect(LevelX, Y, ClientW, Y + FRowHeight);
      if Selected and Focused then
        Canvas.Brush.Color := EsColor(T.Selection)
      else if Selected then
        Canvas.Brush.Color := EsColor(T.SelectionInactive)
      else
        Canvas.Brush.Color := EsColor(T.GroupRow);
      Canvas.FillRect(CR);
      BR := Rect(LevelX, Y, LevelX + IndentWidth, Y + FRowHeight);
      EsDrawExpandButton(Canvas, BR, Row.Expanded);
      Cnt := Row.LastSorted - Row.FirstSorted + 1;
      S := Row.GroupColumn.GetDisplayName + ': ' + Row.GroupColumn.FormatValue(Row.GroupValue);
      Sm := Format('%d %s', [Cnt, rsEsItems]);
      for J := 0 to FColumns.Count - 1 do
      begin
        Kinds := FColumns[J].GroupSummaries;
        if FOptionsView.GroupSummaryInRow then
          Kinds := Kinds + (FColumns[J].FooterKinds - [skCount]);
        for K in SummaryOrder do
          if K in Kinds then
            Sm := Sm + ', ' + FColumns[J].GetDisplayName + ' ' +
              SummaryKindText(FColumns[J], K, Row.FirstSorted, Row.LastSorted);
      end;
      S := S + '  (' + Sm + ')';
      Canvas.Font.Style := [fsBold];
      if Selected and Focused then Fg := EsColor(T.SelectionText) else Fg := EsColor(T.Text);
      EsDrawText(Canvas, Rect(BR.Right + 2, Y, ClientW - 4, Y + FRowHeight), S,
        dhaLeading, dvaCenter, False, Fg, True);
      Canvas.Font.Style := [];
      Canvas.Pen.Color := EsColor(T.GridLine);
      EsLine(Canvas, LevelX, Y + FRowHeight - 1, ClientW, Y + FRowHeight - 1);
end;

procedure TEsGrid.PaintBands(const R: TRect);
var
  T: TEsTheme;
  I, X, B, SpanL: Integer;
  BR: TRect;
  Cap: string;

  function BandOf(C: TEsGridColumn): Integer;
  begin
    if (C.FBandIndex >= 0) and (C.FBandIndex < FBands.Count) then
      Result := C.FBandIndex
    else
      Result := -1;
  end;

begin
  T := EsSkinTheme;
  EsFillGradientV(Canvas, R, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
  Canvas.Pen.Color := EsColor(T.Border);
  EsLine(Canvas, R.Left, R.Bottom - 1, R.Right, R.Bottom - 1);
  X := ColumnsLeft;
  I := 0;
  while I <= High(FVisCols) do
  begin
    B := BandOf(FVisCols[I]);
    SpanL := X;
    while (I <= High(FVisCols)) and (BandOf(FVisCols[I]) = B) do
    begin
      Inc(X, FVisCols[I].Width);
      Inc(I);
    end;
    BR := Rect(SpanL, R.Top, X, R.Bottom - 1);
    if (BR.Right < 0) or (BR.Left > ClientW) then Continue;
    if B >= 0 then Cap := FBands[B].Caption else Cap := '';
    Canvas.Pen.Color := EsColor(T.Border);
    EsLine(Canvas, BR.Right - 1, BR.Top, BR.Right - 1, BR.Bottom);
    Canvas.Font.Style := [fsBold];
    EsDrawText(Canvas, Rect(Max(BR.Left, FixedLeft) + 4, BR.Top, BR.Right - 4, BR.Bottom),
      Cap, dhaCenter, dvaCenter, False, EsColor(T.HeaderText), True);
    Canvas.Font.Style := [];
  end;
  if FixedLeft > 0 then
  begin
    BR := Rect(0, R.Top, FixedLeft, R.Bottom - 1);
    EsFillGradientV(Canvas, BR, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
    Canvas.Pen.Color := EsColor(T.Border);
    EsLine(Canvas, BR.Right - 1, BR.Top, BR.Right - 1, BR.Bottom);
  end;
end;

{ ---------- visão em cartões ---------- }

function TEsGrid.CardTitleColumn: TEsGridColumn;
begin
  Result := nil;
  if FOptionsCard.TitleField <> '' then
    Result := FColumns.ColumnByFieldName(FOptionsCard.TitleField);
  if (Result = nil) and (Length(FVisCols) > 0) then
    Result := FVisCols[0];
end;

function TEsGrid.CardHeight: Integer;
var
  N: Integer;
begin
  N := Length(FVisCols);
  if (CardTitleColumn <> nil) and (N > 0) then
  begin
    // o título não se repete como campo quando é uma coluna visível
    if FVisCols[0] = CardTitleColumn then Dec(N)
    else if FOptionsCard.TitleField <> '' then
      if FColumns.ColumnByFieldName(FOptionsCard.TitleField).Visible then Dec(N);
  end;
  Result := (FRowHeight + 4) + Max(1, N) * FRowHeight + EsScale(Self, 8);
end;

function TEsGrid.CardsPerLine(ALevel: Integer): Integer;
var
  Avail, CW, Gap: Integer;
begin
  CW := EsScale(Self, FOptionsCard.CardWidth);
  Gap := EsScale(Self, FOptionsCard.Spacing);
  Avail := ClientW - (IndicatorWidth + ALevel * IndentWidth) - Gap;
  Result := Max(1, (Avail + Gap) div Max(1, CW + Gap));
end;

procedure TEsGrid.EnsureCardLayout;
var
  I, Lvl, Per, Cnt, Gap, CH: Integer;
  L: TEsCardLine;
  N: Integer;

  procedure AddLine(const ALine: TEsCardLine);
  begin
    if N >= Length(FCardLines) then
      SetLength(FCardLines, Max(32, Length(FCardLines) * 2));
    FCardLines[N] := ALine;
    Inc(N);
  end;

begin
  if FCardLayoutValid then Exit;
  FCardLayoutValid := True;
  N := 0;
  Gap := EsScale(Self, FOptionsCard.Spacing);
  CH := CardHeight;
  I := 0;
  while I < FRowCount do
  begin
    L := Default(TEsCardLine);
    if FRows[I].Kind = vrkGroup then
    begin
      L.IsGroup := True;
      L.FirstRow := I;
      L.LastRow := I;
      L.Height := FRowHeight;
      AddLine(L);
      Inc(I);
      Continue;
    end;
    if FRows[I].Kind = vrkDetail then
    begin
      Inc(I);
      Continue;
    end;
    Lvl := FRows[I].Level;
    Per := CardsPerLine(Lvl);
    L.FirstRow := I;
    Cnt := 0;
    while (I < FRowCount) and (FRows[I].Kind = vrkData) and (FRows[I].Level = Lvl) and
          (Cnt < Per) do
    begin
      Inc(I);
      Inc(Cnt);
    end;
    L.LastRow := I - 1;
    L.Left := IndicatorWidth + Lvl * IndentWidth + Gap;
    L.Height := CH + Gap;
    AddLine(L);
  end;
  SetLength(FCardLines, N);
end;

function TEsGrid.CardLineOfRow(AViewRow: Integer): Integer;
var
  I: Integer;
begin
  EnsureCardLayout;
  for I := 0 to High(FCardLines) do
    if (AViewRow >= FCardLines[I].FirstRow) and (AViewRow <= FCardLines[I].LastRow) then
      Exit(I);
  Result := -1;
end;

function TEsGrid.CardLinesFitting(AFirstLine: Integer): Integer;
var
  Avail, I, H: Integer;
begin
  EnsureCardLayout;
  Avail := DataBottom - DataTop;
  Result := 0;
  H := 0;
  for I := Max(0, AFirstLine) to High(FCardLines) do
  begin
    Inc(H, FCardLines[I].Height);
    if H > Avail then Break;
    Inc(Result);
  end;
  Result := Max(1, Result);
end;

function TEsGrid.CardMaxTop: Integer;
var
  Avail, I, H: Integer;
begin
  EnsureCardLayout;
  Avail := DataBottom - DataTop;
  H := 0;
  Result := Length(FCardLines);
  for I := High(FCardLines) downto 0 do
  begin
    Inc(H, FCardLines[I].Height);
    if H > Avail then Break;
    Result := I;
  end;
  if Result > High(FCardLines) then
    Result := Max(0, High(FCardLines));
end;

function TEsGrid.CardRect(AViewRow: Integer): TRect;
var
  L, I, Y, CW, Gap: Integer;
begin
  Result := Rect(0, 0, 0, 0);
  L := CardLineOfRow(AViewRow);
  if L < 0 then Exit;
  Y := DataTop;
  if L >= FTopRow then
    for I := FTopRow to L - 1 do Inc(Y, FCardLines[I].Height)
  else
    for I := L to FTopRow - 1 do Dec(Y, FCardLines[I].Height);
  if FCardLines[L].IsGroup then
    Exit(Rect(IndicatorWidth, Y, ClientW, Y + FRowHeight));
  CW := EsScale(Self, FOptionsCard.CardWidth);
  Gap := EsScale(Self, FOptionsCard.Spacing);
  Result.Left := FCardLines[L].Left + (AViewRow - FCardLines[L].FirstRow) * (CW + Gap);
  Result.Top := Y + Gap;
  Result.Right := Result.Left + CW;
  Result.Bottom := Result.Top + CardHeight;
end;

function TEsGrid.CardFieldRect(AViewRow, AFieldIndex: Integer): TRect;
var
  CR: TRect;
  I, P, Pad, LW: Integer;
  TC: TEsGridColumn;
begin
  CR := CardRect(AViewRow);
  TC := CardTitleColumn;
  Pad := EsScale(Self, 6);
  if (AFieldIndex < 0) or (AFieldIndex > High(FVisCols)) or (FVisCols[AFieldIndex] = TC) then
    Exit(Rect(CR.Left + Pad, CR.Top + 1, CR.Right - Pad, CR.Top + FRowHeight + 3));
  P := 0;
  for I := 0 to AFieldIndex - 1 do
    if FVisCols[I] <> TC then Inc(P);
  if FOptionsCard.ShowLabels then LW := EsScale(Self, FOptionsCard.LabelWidth) else LW := 0;
  Result.Left := Min(CR.Left + Pad + LW, CR.Right - Pad - 20);
  Result.Right := CR.Right - Pad;
  Result.Top := CR.Top + FRowHeight + 4 + P * FRowHeight + EsScale(Self, 2);
  Result.Bottom := Result.Top + FRowHeight;
end;

procedure TEsGrid.PaintCards;
var
  T: TEsTheme;
  L, I, J, Y, Bottom, Gap, CW, CH, Pad, LW, P, K: Integer;
  Line: TEsCardLine;
  Rec: Integer;
  CR, TR, FR, VR, LR: TRect;
  TC, C: TEsGridColumn;
  Sel, InSel, Done: Boolean;
  Fg: TColor;
  V: Variant;
begin
  T := EsSkinTheme;
  EnsureCardLayout;
  Y := DataTop;
  Bottom := DataBottom;
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := EsColor(T.SurfaceAlt);
  Canvas.FillRect(Rect(0, Y, ClientW, Bottom));
  if FRowCount = 0 then
  begin
    EsDrawText(Canvas, Rect(0, Y, ClientW, Min(Bottom, Y + FRowHeight * 3)),
      rsEsNoData, dhaCenter, dvaCenter, False, EsColor(T.TextDim));
    Exit;
  end;
  Gap := EsScale(Self, FOptionsCard.Spacing);
  CW := EsScale(Self, FOptionsCard.CardWidth);
  CH := CardHeight;
  Pad := EsScale(Self, 6);
  if FOptionsCard.ShowLabels then LW := EsScale(Self, FOptionsCard.LabelWidth) else LW := 0;
  TC := CardTitleColumn;
  L := FTopRow;
  while (L <= High(FCardLines)) and (Y < Bottom) do
  begin
    Line := FCardLines[L];
    // recuo dos grupos e indicador
    for J := 0 to FRows[Line.FirstRow].Level - 1 do
    begin
      Canvas.Brush.Color := EsColor(T.GroupRow);
      Canvas.FillRect(Rect(IndicatorWidth + J * IndentWidth, Y,
        IndicatorWidth + (J + 1) * IndentWidth, Y + Line.Height));
    end;
    if IndicatorWidth > 0 then
    begin
      Canvas.Brush.Color := EsColor(T.HeaderFace);
      Canvas.FillRect(Rect(0, Y, IndicatorWidth, Y + Line.Height));
      Canvas.Pen.Color := EsColor(T.Border);
      EsLine(Canvas, IndicatorWidth - 1, Y, IndicatorWidth - 1, Y + Line.Height);
      if (FFocusedRow >= Line.FirstRow) and (FFocusedRow <= Line.LastRow) then
        EsDrawGlyph(Canvas, Rect(0, Y, IndicatorWidth, Y + Min(Line.Height, FRowHeight * 2)),
          sgArrowRight, EsColor(T.Text), 4);
    end;
    if Line.IsGroup then
      PaintGroupRow(Line.FirstRow, Y)
    else
      for I := Line.FirstRow to Line.LastRow do
      begin
        Rec := FRows[I].RecIndex;
        Sel := I = FFocusedRow;
        InSel := IsRecordSelected(Rec);
        CR := Rect(Line.Left + (I - Line.FirstRow) * (CW + Gap), Y + Gap,
          Line.Left + (I - Line.FirstRow) * (CW + Gap) + CW, Y + Gap + CH);
        // sombra leve + corpo do cartão
        Canvas.Brush.Color := EsColor(BlendOver(T.SurfaceAlt, FadeColor(T.Text, 0.08)));
        Canvas.FillRect(Rect(CR.Left + 2, CR.Top + 2, CR.Right + 2, CR.Bottom + 2));
        Canvas.Brush.Color := EsColor(T.Surface);
        Canvas.FillRect(CR);
        // título
        TR := Rect(CR.Left + 1, CR.Top + 1, CR.Right - 1, CR.Top + FRowHeight + 3);
        if InSel or (Sel and Focused) then
        begin
          Canvas.Brush.Color := EsColor(T.Selection);
          Canvas.FillRect(TR);
          Fg := EsColor(T.SelectionText);
        end
        else
        begin
          EsFillGradientV(Canvas, TR, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
          Fg := EsColor(T.HeaderText);
        end;
        Canvas.Font.Style := [fsBold];
        if TC <> nil then
          EsDrawText(Canvas, Rect(TR.Left + Pad, TR.Top, TR.Right - Pad, TR.Bottom),
            DisplayText(Rec, TC), dhaLeading, dvaCenter, False, Fg, True);
        Canvas.Font.Style := [];
        // campos
        P := 0;
        for J := 0 to High(FVisCols) do
        begin
          C := FVisCols[J];
          if C = TC then Continue;
          FR := Rect(CR.Left + Pad, TR.Bottom + EsScale(Self, 2) + P * FRowHeight,
            CR.Right - Pad, TR.Bottom + EsScale(Self, 2) + (P + 1) * FRowHeight);
          Inc(P);
          if FR.Top > Bottom then Break;
          VR := Rect(Min(FR.Left + LW, FR.Right - 20), FR.Top, FR.Right, FR.Bottom);
          if LW > 0 then
          begin
            LR := Rect(FR.Left, FR.Top, VR.Left - 4, FR.Bottom);
            EsDrawText(Canvas, LR, C.GetDisplayName + ':', dhaLeading, dvaCenter, False,
              EsColor(T.TextDim), True);
          end;
          Fg := EsColor(T.Text);
          if Sel and Focused and (J = FFocusedCol) and not FMultiSelect then
          begin
            Canvas.Brush.Color := EsColor(T.Accent);
            Canvas.FillRect(VR);
            Fg := EsColor(T.AccentText);
          end;
          Done := False;
          if Assigned(FOnCustomDrawCell) then
          begin
            Canvas.Font.Color := Fg;
            FOnCustomDrawCell(Self, Canvas, VR, Rec, C, Sel, Done);
          end;
          if not Done then
          begin
            if C.ResolvedKind = dkBoolean then
            begin
              V := FData.GetSlotValue(Rec, C.FSlot);
              K := VR.Bottom - VR.Top;
              EsDrawCheckBox(Canvas, Rect(VR.Left, VR.Top, VR.Left + K, VR.Bottom),
                not EsVarIsEmptyOrNull(V) and Boolean(V));
            end
            else
              PaintCellText(Rect(VR.Left - 4, VR.Top, VR.Right + 4, VR.Bottom),
                DisplayText(Rec, C), taLeftJustify, Fg, True);
          end;
        end;
        // borda (destaque para o cartão focado/selecionado)
        if Sel and Focused then
        begin
          EsFrame(Canvas, CR, EsColor(T.Accent));
          EsFrame(Canvas, Rect(CR.Left + 1, CR.Top + 1, CR.Right - 1, CR.Bottom - 1),
            EsColor(T.Accent));
        end
        else if InSel or Sel then
          EsFrame(Canvas, CR, EsColor(T.Accent))
        else
          EsFrame(Canvas, CR, EsColor(T.Border));
      end;
    Inc(Y, Line.Height);
    Inc(L);
  end;
end;

function TEsGrid.HitTestCards(X, Y: Integer; var AHit: TEsHitInfo): Boolean;
var
  L, Yc, CW, Gap, K, Off, BX, P, J, FieldTop: Integer;
  Line: TEsCardLine;
  TC: TEsGridColumn;
begin
  Result := True;
  EnsureCardLayout;
  AHit.Column := nil;
  Yc := DataTop;
  L := FTopRow;
  while (L <= High(FCardLines)) and (Y >= Yc + FCardLines[L].Height) do
  begin
    Inc(Yc, FCardLines[L].Height);
    Inc(L);
  end;
  if L > High(FCardLines) then
  begin
    AHit.Area := shaEmpty;
    Exit;
  end;
  Line := FCardLines[L];
  if X < IndicatorWidth then
  begin
    AHit.Area := shaIndicator;
    AHit.ViewRow := Line.FirstRow;
    Exit;
  end;
  if Line.IsGroup then
  begin
    AHit.ViewRow := Line.FirstRow;
    BX := IndicatorWidth + FRows[Line.FirstRow].Level * IndentWidth;
    if (X >= BX) and (X < BX + IndentWidth) then
      AHit.Area := shaExpandButton
    else
      AHit.Area := shaGroupRow;
    Exit;
  end;
  CW := EsScale(Self, FOptionsCard.CardWidth);
  Gap := EsScale(Self, FOptionsCard.Spacing);
  AHit.Area := shaEmpty;
  if X < Line.Left then Exit;
  K := (X - Line.Left) div (CW + Gap);
  Off := (X - Line.Left) mod (CW + Gap);
  if (Off >= CW) or (Line.FirstRow + K > Line.LastRow) then Exit;
  if (Y < Yc + Gap) or (Y >= Yc + Gap + CardHeight) then Exit;
  AHit.ViewRow := Line.FirstRow + K;
  AHit.Area := shaDataCell;
  // campo sob o mouse
  TC := CardTitleColumn;
  FieldTop := Yc + Gap + FRowHeight + 4 + EsScale(Self, 2);
  if Y < FieldTop then Exit;
  P := (Y - FieldTop) div Max(1, FRowHeight);
  for J := 0 to High(FVisCols) do
  begin
    if FVisCols[J] = TC then Continue;
    if P = 0 then
    begin
      AHit.Column := FVisCols[J];
      Exit;
    end;
    Dec(P);
  end;
end;

procedure TEsGrid.PaintFooter(const R: TRect);
var
  T: TEsTheme;
  I, J, X, UsedRight: Integer;
  C: TEsGridColumn;
  CR: TRect;
  S: string;
begin
  T := EsSkinTheme;
  UsedRight := -MaxInt;
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := EsColor(T.FooterFace);
  Canvas.FillRect(R);
  Canvas.Pen.Color := EsColor(T.Border);
  EsLine(Canvas, R.Left, R.Top, R.Right, R.Top);
  X := ColumnsLeft;
  for I := 0 to High(FVisCols) do
  begin
    C := FVisCols[I];
    CR := Rect(X, R.Top + 1, X + C.Width, R.Bottom);
    Inc(X, C.Width);
    if C.FooterKinds = [] then Continue;
    S := SummaryText(C, 0, High(FSorted));
    // texto maior que a coluna: ocupa as colunas vizinhas sem sumário
    // (primeiro à direita, depois à esquerda), como o rodapé do cxGrid
    if Canvas.TextWidth(S) > CR.Right - CR.Left - 12 then
    begin
      J := I + 1;
      while (J <= High(FVisCols)) and (FVisCols[J].FooterKinds = []) and
            (Canvas.TextWidth(S) > CR.Right - CR.Left - 12) do
      begin
        Inc(CR.Right, FVisCols[J].Width);
        Inc(J);
      end;
      J := I - 1;
      while (J >= 0) and (FVisCols[J].FooterKinds = []) and
            (CR.Left - FVisCols[J].Width >= UsedRight) and
            (Canvas.TextWidth(S) > CR.Right - CR.Left - 12) do
      begin
        Dec(CR.Left, FVisCols[J].Width);
        Dec(J);
      end;
    end;
    UsedRight := CR.Right;
    // "célula" de sumário com borda, como no DevExpress
    InflateRect(CR, -2, -2);
    Canvas.Brush.Color := EsColor(T.Surface);
    Canvas.FillRect(CR);
    EsFrame(Canvas, CR, EsColor(T.GridLine));
    // se não couber, alinha à esquerda (mostra o rótulo e corta o fim com "...")
    if Canvas.TextWidth(S) > CR.Right - CR.Left - 8 then
      PaintCellText(CR, S, taLeftJustify, EsColor(T.Text), False)
    else
      PaintCellText(CR, S, C.ResolvedAlignment, EsColor(T.Text), False);
  end;
end;

procedure TEsGrid.Paint;
var
  T: TEsTheme;
  W, H, GP: Integer;
  R: TRect;
  S: string;
begin
  EnsureBuilt;
  T := EsSkinTheme;
  Canvas.Font.Assign(Font);
  W := ClientW;
  H := ClientHeight;
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := EsColor(T.Surface);
  Canvas.FillRect(Rect(0, 0, ClientWidth, H));
  GP := GroupPanelHeight;
  if GP > 0 then
    PaintGroupPanel(Rect(0, FindPanelHeight, W, FindPanelHeight + GP));
  if IsBanded then
    PaintBands(Rect(0, HeaderTop - BandRowHeight, W, HeaderTop));
  PaintHeader(Rect(0, HeaderTop, W, HeaderTop + HeaderHeight));
  if FOptionsView.FilterRow then
    PaintFilterRow(Rect(0, FilterRowTop, W, FilterRowTop + FRowHeight));
  if IsCardMode then
    PaintCards
  else
    PaintRows;
  if FOptionsView.Footer then
    PaintFooter(Rect(0, FooterTop, W, FooterTop + FRowHeight + 2));
  // canto entre as barras de rolagem
  if FVScroll.Visible and FHScroll.Visible then
  begin
    Canvas.Brush.Color := EsColor(T.Background);
    Canvas.FillRect(Rect(W, H - FHScroll.Height, ClientWidth, H));
  end;
  // imagem de arraste do cabeçalho / chip
  if FDragging and (FDownHit.Column <> nil) then
  begin
    S := FDownHit.Column.GetDisplayName;
    R := Rect(FDragPos.X - 10, FDragPos.Y - 10,
      FDragPos.X + Canvas.TextWidth(S) + 24, FDragPos.Y - 10 + HeaderHeight);
    EsFillGradientV(Canvas, R, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
    EsFrame(Canvas, R, EsColor(T.Accent));
    EsDrawText(Canvas, Rect(R.Left + 6, R.Top, R.Right, R.Bottom), S, dhaLeading,
      dvaCenter, False, EsColor(T.HeaderText));
  end;
  // borda
  EsFrame(Canvas, Rect(0, 0, ClientWidth, H), EsColor(T.Border));
end;

{ ---------- hit test / mouse ---------- }

function TEsGrid.HitTest(X, Y: Integer): TEsHitInfo;
var
  I, CX, Row: Integer;
  C: TEsGridColumn;
  BX: Integer;
begin
  Result := Default(TEsHitInfo);
  Result.Area := shaNone;
  Result.ViewRow := -1;
  Result.ChipIndex := -1;
  if (X >= ClientW) or (Y < FindPanelHeight) then Exit;
  if Y < HeaderTop - BandRowHeight then
  begin
    Result.Area := shaGroupPanel;
    for I := 0 to FGroupCols.Count - 1 do
      if PtInRect(ChipRect(I), Point(X, Y)) then
      begin
        Result.Area := shaGroupChip;
        Result.ChipIndex := I;
        Result.Column := TEsGridColumn(FGroupCols[I]);
      end;
    Exit;
  end;
  // localiza a coluna em X
  CX := ColumnsLeft;
  for I := 0 to High(FVisCols) do
  begin
    C := FVisCols[I];
    if (X >= CX) and (X < CX + C.Width) then
    begin
      Result.Column := C;
      Break;
    end;
    Inc(CX, C.Width);
  end;
  if Y < HeaderTop then
  begin
    // linha das bandas
    Result.Area := shaBandHeader;
    if (Result.Column <> nil) and (Result.Column.FBandIndex < FBands.Count) then
      Result.ChipIndex := Result.Column.FBandIndex;
    Exit;
  end;
  if Y < HeaderTop + HeaderHeight then
  begin
    if X < IndicatorWidth then
    begin
      Result.Area := shaIndicator;
      Exit;
    end;
    Result.Area := shaHeader;
    // borda de redimensionamento
    CX := ColumnsLeft;
    for I := 0 to High(FVisCols) do
    begin
      Inc(CX, FVisCols[I].Width);
      if Abs(X - CX) <= 3 then
      begin
        Result.Area := shaHeaderEdge;
        Result.Column := FVisCols[I];
        Break;
      end;
    end;
    Exit;
  end;
  if FOptionsView.FilterRow and (Y < DataTop) then
  begin
    Result.Area := shaFilterCell;
    Exit;
  end;
  if Y >= DataBottom then
  begin
    if FOptionsView.Footer then Result.Area := shaFooter;
    Exit;
  end;
  if IsCardMode then
  begin
    HitTestCards(X, Y, Result);
    Exit;
  end;
  Row := FTopRow + (Y - DataTop) div Max(1, FRowHeight);
  if Row >= FRowCount then
  begin
    Result.Area := shaEmpty;
    Exit;
  end;
  Result.ViewRow := Row;
  if X < IndicatorWidth then
  begin
    Result.Area := shaIndicator;
    Exit;
  end;
  BX := IndicatorWidth + FRows[Row].Level * IndentWidth - FHOffset;
  if FRows[Row].Kind = vrkGroup then
  begin
    if (X >= BX) and (X < BX + IndentWidth) then
      Result.Area := shaExpandButton
    else
      Result.Area := shaGroupRow;
  end
  else if FRows[Row].Kind = vrkDetail then
    Result.Area := shaDetailArea
  else if HasDetails and (X >= BX) and (X < BX + DetailButtonWidth) then
    Result.Area := shaDetailButton
  else
    Result.Area := shaDataCell;
end;

procedure TEsGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  H: TEsHitInfo;
  I: Integer;
  V: Variant;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if csDesigning in ComponentState then Exit;
  if CanFocus and not Focused and not FEditor.Focused then SetFocus;
  EnsureBuilt;
  H := HitTest(X, Y);
  FDownHit := H;
  FDownPos := Point(X, Y);
  FDragging := False;
  if Button = mbRight then
  begin
    if H.Area in [shaHeader, shaHeaderEdge, shaGroupChip, shaGroupPanel, shaBandHeader] then
      ShowHeaderMenu(H.Column, X, Y)
    else if IsCardMode and (H.Area in [shaDataCell, shaEmpty]) then
      ShowHeaderMenu(H.Column, X, Y);
    Exit;
  end;
  if Button <> mbLeft then Exit;
  HideEditor(True);
  case H.Area of
    shaHeaderEdge:
      begin
        FResizeCol := H.Column;
        FResizeStartW := H.Column.Width;
      end;
    shaExpandButton:
      begin
        FocusRow(H.ViewRow, Shift);
        if FToggled.IndexOf(FRows[H.ViewRow].GroupKey) >= 0 then
          FToggled.Delete(FToggled.IndexOf(FRows[H.ViewRow].GroupKey))
        else
          FToggled.Add(FRows[H.ViewRow].GroupKey);
        DataChanged;
      end;
    shaDetailButton:
      begin
        FocusRow(H.ViewRow, Shift);
        ToggleDetail(FRows[H.ViewRow].RecIndex);
      end;
    shaGroupRow, shaIndicator:
      if (H.ViewRow >= 0) and (FRows[H.ViewRow].Kind <> vrkDetail) then
        FocusRow(H.ViewRow, Shift);
    shaDataCell:
      begin
        if FMultiSelect then
        begin
          // como no cxGrid: clique simples seleciona só a linha, Ctrl alterna,
          // Shift seleciona o intervalo a partir da âncora
          if (ssShift in Shift) and (FAnchorRow >= 0) then
            SelectViewRange(FAnchorRow, H.ViewRow, ssCtrl in Shift)
          else if ssCtrl in Shift then
          begin
            SelectRecord(FRows[H.ViewRow].RecIndex,
              not IsRecordSelected(FRows[H.ViewRow].RecIndex));
            FAnchorRow := H.ViewRow;
          end
          else
          begin
            SetLength(FSelected, 0);
            SelectRecord(FRows[H.ViewRow].RecIndex, True);
            FAnchorRow := H.ViewRow;
          end;
        end;
        FocusRow(H.ViewRow, Shift);
        if H.Column <> nil then
          for I := 0 to High(FVisCols) do
            if FVisCols[I] = H.Column then
            begin
              FFocusedCol := I;
              Break;
            end;
        // checkbox: alterna com um clique
        if (H.Column <> nil) and (H.Column.ResolvedKind = dkBoolean) and
           not FReadOnly and not H.Column.ReadOnly then
        begin
          V := GetCellValue(FRows[H.ViewRow].RecIndex, H.Column);
          SetCellValue(FRows[H.ViewRow].RecIndex, H.Column,
            not (not EsVarIsEmptyOrNull(V) and Boolean(V)));
        end;
        Invalidate;
      end;
    shaFilterCell:
      if (H.Column <> nil) and H.Column.AllowFilter then
      begin
        FEditCol := H.Column;
        FEditIsFilter := True;
        // abre depois que o clique terminar (o widgetset devolve o foco à grade)
        PostAsync(0);
      end;
  end;
end;

procedure TEsGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  H: TEsHitInfo;
  NewW: Integer;
begin
  inherited MouseMove(Shift, X, Y);
  if csDesigning in ComponentState then Exit;
  if FResizeCol <> nil then
  begin
    NewW := FResizeStartW + (X - FDownPos.X);
    FResizeCol.Width := NewW;
    UpdateScrollBars;
    Exit;
  end;
  if (ssLeft in Shift) and (FDownHit.Area in [shaHeader, shaGroupChip]) and
     (FDownHit.Column <> nil) then
  begin
    if not FDragging and ((Abs(X - FDownPos.X) > 5) or (Abs(Y - FDownPos.Y) > 5)) then
      FDragging := True;
    if FDragging then
    begin
      FDragPos := Point(X, Y);
      Invalidate;
      Exit;
    end;
  end;
  H := HitTest(X, Y);
  if H.Area = shaHeaderEdge then
    Cursor := crHSplit
  else
    Cursor := crDefault;
  if (H.Area = shaHeader) and (H.Column <> FHotHeader) then
  begin
    FHotHeader := H.Column;
    Invalidate;
  end
  else if (H.Area <> shaHeader) and (FHotHeader <> nil) then
  begin
    FHotHeader := nil;
    Invalidate;
  end;
end;

procedure TEsGrid.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  H: TEsHitInfo;
  Col: TEsGridColumn;
  I, Target: Integer;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if csDesigning in ComponentState then Exit;
  if FResizeCol <> nil then
  begin
    FResizeCol := nil;
    Exit;
  end;
  if Button <> mbLeft then Exit;
  H := HitTest(X, Y);
  Col := FDownHit.Column;
  if FDragging and (Col <> nil) then
  begin
    FDragging := False;
    if H.Area in [shaGroupPanel, shaGroupChip] then
    begin
      // soltar no painel de agrupamento
      if Col.AllowGroup then
      begin
        if H.Area = shaGroupChip then Target := H.ChipIndex else Target := -1;
        GroupBy(Col, Target);
      end;
    end
    else if H.Area in [shaHeader, shaHeaderEdge, shaBandHeader] then
    begin
      if FDownHit.Area = shaGroupChip then
        UngroupColumn(Col)
      else if (H.Area = shaBandHeader) and IsBanded then
      begin
        // soltar sobre uma banda: a coluna passa a fazer parte dela
        if H.ChipIndex >= 0 then
        begin
          Col.FBandIndex := H.ChipIndex;
          ColumnsChanged;
        end;
      end
      else if (H.Column <> nil) and (H.Column <> Col) then
      begin
        if IsBanded then
          Col.FBandIndex := H.Column.FBandIndex;
        Col.Index := H.Column.Index;   // mover coluna
        ColumnsChanged;
      end;
    end
    else if FDownHit.Area = shaGroupChip then
      UngroupColumn(Col);
    Invalidate;
    Exit;
  end;
  FDragging := False;
  if (FDownHit.Area = shaHeader) and (H.Area = shaHeader) and (H.Column = Col) then
    HeaderClick(Col, Shift)
  else if (FDownHit.Area = shaGroupChip) and (H.Area = shaGroupChip) and (Col <> nil) then
  begin
    if Col.SortOrder = esoDescending then Col.FSortOrder := esoAscending
    else Col.FSortOrder := esoDescending;
    DataChanged;
  end;
end;

procedure TEsGrid.CMMouseLeave(var Message: TMessage);
begin
  if FHotHeader <> nil then
  begin
    FHotHeader := nil;
    Invalidate;
  end;
  inherited;
end;

procedure TEsGrid.DblClick;
var
  H: TEsHitInfo;
  P: TPoint;
begin
  inherited DblClick;
  P := ScreenToClient(Mouse.CursorPos);
  H := HitTest(P.X, P.Y);
  case H.Area of
    shaHeaderEdge: ApplyBestFit(H.Column);
    shaGroupRow:
      begin
        if FToggled.IndexOf(FRows[H.ViewRow].GroupKey) >= 0 then
          FToggled.Delete(FToggled.IndexOf(FRows[H.ViewRow].GroupKey))
        else
          FToggled.Add(FRows[H.ViewRow].GroupKey);
        DataChanged;
      end;
    shaDataCell:
      begin
        if Assigned(FOnCellDblClick) and (H.Column <> nil) then
          FOnCellDblClick(Self, FRows[H.ViewRow].RecIndex, H.Column);
        if (H.Column <> nil) and (H.Column.ResolvedKind <> dkBoolean) then
        begin
          FEditIsFilter := False;
          PostAsync(0);
        end;
      end;
  end;
end;

function TEsGrid.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if Result then Exit;
  HideEditor(True);
  if ssShift in Shift then
    FHOffset := FHOffset - WheelDelta div 2
  else if IsCardMode then
    FTopRow := FTopRow - WheelDelta div 120
  else
    FTopRow := FTopRow - (WheelDelta div 120) * 3;
  UpdateScrollBars;
  FScrolling := True;
  try
    if FVScroll.Visible then FVScroll.Position := FTopRow;
    if FHScroll.Visible then FHScroll.Position := FHOffset;
  finally
    FScrolling := False;
  end;
  Invalidate;
  Result := True;
end;

{ ---------- foco / teclado ---------- }

function TEsGrid.GetFocusedRecordIndex: Integer;
begin
  EnsureBuilt;
  if (FFocusedRow >= 0) and (FFocusedRow < FRowCount) then
    Result := FRows[FFocusedRow].RecIndex
  else
    Result := -1;
end;

procedure TEsGrid.SetFocusedRecordIndex(AValue: Integer);
var
  I: Integer;
begin
  EnsureBuilt;
  for I := 0 to FRowCount - 1 do
    if FRows[I].RecIndex = AValue then
    begin
      FocusRow(I);
      Exit;
    end;
end;

function TEsGrid.GetFocusedColumn: TEsGridColumn;
begin
  EnsureBuilt;
  if (FFocusedCol >= 0) and (FFocusedCol <= High(FVisCols)) then
    Result := FVisCols[FFocusedCol]
  else
    Result := nil;
end;

procedure TEsGrid.MakeRowVisible(AViewRow: Integer);
var
  Vis, L, Last: Integer;
begin
  if IsCardMode then
  begin
    L := CardLineOfRow(AViewRow);
    if L >= 0 then
    begin
      if L < FTopRow then
        FTopRow := L
      else
        while (FTopRow < L) and (L >= FTopRow + CardLinesFitting(FTopRow)) do
          Inc(FTopRow);
    end;
  end
  else
  begin
    Vis := VisibleRowCount;
    // o registro mestre e a área do detalhe aberto devem caber juntos
    Last := AViewRow;
    while (Last + 1 < FRowCount) and (FRows[Last + 1].Kind = vrkDetail) and
          (Last + 1 - AViewRow < Vis) do
      Inc(Last);
    if AViewRow < FTopRow then
      FTopRow := AViewRow
    else if Last >= FTopRow + Vis then
      FTopRow := Min(AViewRow, Last - Vis + 1);
  end;
  FTopRow := Max(0, FTopRow);
  UpdateScrollBars;
  FScrolling := True;
  try
    if FVScroll.Visible then FVScroll.Position := FTopRow;
  finally
    FScrolling := False;
  end;
end;

procedure TEsGrid.MakeColumnVisible(AColumn: TEsGridColumn);
var
  L, R, Fixed: Integer;
begin
  if AColumn = nil then Exit;
  Fixed := FixedLeft;
  L := ColumnX(AColumn) + FHOffset;
  R := L + AColumn.Width;
  if L - Fixed < FHOffset then
    FHOffset := L - Fixed
  else if R > FHOffset + ClientW then
    FHOffset := R - ClientW;
  FHOffset := Max(0, FHOffset);
  UpdateScrollBars;
  FScrolling := True;
  try
    if FHScroll.Visible then FHScroll.Position := FHOffset;
  finally
    FScrolling := False;
  end;
end;

procedure TEsGrid.FocusRow(AViewRow: Integer; Shift: TShiftState);
var
  Old: Integer;
begin
  EnsureBuilt;
  if FRowCount = 0 then Exit;
  AViewRow := EnsureRange(AViewRow, 0, FRowCount - 1);
  if FRows[AViewRow].Kind = vrkDetail then
  begin
    if AViewRow > FFocusedRow then
    begin
      // descendo: pula a área do detalhe
      while (AViewRow < FRowCount - 1) and (FRows[AViewRow].Kind = vrkDetail) do
        Inc(AViewRow);
      if FRows[AViewRow].Kind = vrkDetail then
        AViewRow := AViewRow - FRows[AViewRow].DetailPart - 1;
    end
    else
      AViewRow := AViewRow - FRows[AViewRow].DetailPart - 1;
    AViewRow := EnsureRange(AViewRow, 0, FRowCount - 1);
  end;
  Old := FocusedRecordIndex;
  FFocusedRow := AViewRow;
  MakeRowVisible(AViewRow);
  Invalidate;
  if FocusedRecordIndex <> Old then
  begin
    SyncDataSetPosition;
    if Assigned(FOnFocusedRecordChanged) then
      FOnFocusedRecordChanged(Self);
  end;
end;

procedure TEsGrid.KeyDown(var Key: Word; Shift: TShiftState);
var
  Row: TEsViewRow;
  Idx, Off, Tgt: Integer;
begin
  inherited KeyDown(Key, Shift);
  if Key = 0 then Exit;
  EnsureBuilt;
  if FMultiSelect then
  begin
    if (Key = Ord('A')) and (ssCtrl in Shift) then
    begin
      SelectAll;
      Key := 0;
      Exit;
    end;
    if (Key = VK_SPACE) and (FFocusedRow >= 0) and (FRows[FFocusedRow].Kind = vrkData) then
    begin
      SelectRecord(FRows[FFocusedRow].RecIndex,
        not IsRecordSelected(FRows[FFocusedRow].RecIndex));
      FAnchorRow := FFocusedRow;
      Key := 0;
      Exit;
    end;
    if (ssShift in Shift) and (Key in [VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT]) then
    begin
      if FAnchorRow < 0 then FAnchorRow := Max(0, FFocusedRow);
      case Key of
        VK_UP: FocusRow(FFocusedRow - 1, Shift);
        VK_DOWN: FocusRow(FFocusedRow + 1, Shift);
        VK_PRIOR: FocusRow(FFocusedRow - VisibleRowCount, Shift);
        VK_NEXT: FocusRow(FFocusedRow + VisibleRowCount, Shift);
      end;
      SelectViewRange(FAnchorRow, FFocusedRow, False);
      Key := 0;
      Exit;
    end;
    if Key in [VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, VK_HOME, VK_END] then
      FAnchorRow := -1;
  end;
  if IsCardMode and (FFocusedRow >= 0) and (FFocusedRow < FRowCount) then
  begin
    // cartões: esquerda/direita = cartão anterior/seguinte, cima/baixo = fileira,
    // Ctrl+cima/baixo = campo anterior/seguinte
    Idx := CardLineOfRow(FFocusedRow);
    case Key of
      VK_LEFT, VK_RIGHT:
        if FRows[FFocusedRow].Kind = vrkData then
        begin
          if Key = VK_LEFT then FocusRow(FFocusedRow - 1, Shift)
          else FocusRow(FFocusedRow + 1, Shift);
          Key := 0;
          Exit;
        end;
      VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT:
        begin
          if ssCtrl in Shift then
          begin
            if Key in [VK_UP, VK_PRIOR] then FFocusedCol := Max(0, FFocusedCol - 1)
            else FFocusedCol := Min(High(FVisCols), FFocusedCol + 1);
            Invalidate;
          end
          else if Idx >= 0 then
          begin
            case Key of
              VK_UP: Off := -1;
              VK_DOWN: Off := 1;
              VK_PRIOR: Off := -CardLinesFitting(FTopRow);
            else
              Off := CardLinesFitting(FTopRow);
            end;
            Tgt := EnsureRange(Idx + Off, 0, High(FCardLines));
            if FCardLines[Tgt].IsGroup then
              FocusRow(FCardLines[Tgt].FirstRow, Shift)
            else
              FocusRow(Min(FCardLines[Tgt].FirstRow +
                (FFocusedRow - FCardLines[Idx].FirstRow), FCardLines[Tgt].LastRow), Shift);
          end;
          Key := 0;
          Exit;
        end;
    end;
  end;
  case Key of
    VK_UP: FocusRow(FFocusedRow - 1, Shift);
    VK_DOWN: FocusRow(FFocusedRow + 1, Shift);
    VK_PRIOR: FocusRow(FFocusedRow - VisibleRowCount, Shift);
    VK_NEXT: FocusRow(FFocusedRow + VisibleRowCount, Shift);
    VK_HOME:
      if ssCtrl in Shift then FocusRow(0) else
      begin
        FFocusedCol := 0;
        MakeColumnVisible(FocusedColumn);
        Invalidate;
      end;
    VK_END:
      if ssCtrl in Shift then FocusRow(FRowCount - 1) else
      begin
        FFocusedCol := High(FVisCols);
        MakeColumnVisible(FocusedColumn);
        Invalidate;
      end;
    VK_LEFT, VK_RIGHT, VK_ADD, VK_SUBTRACT:
      if (FFocusedRow >= 0) and (FRows[FFocusedRow].Kind = vrkGroup) then
      begin
        Row := FRows[FFocusedRow];
        if ((Key in [VK_RIGHT, VK_ADD]) and not Row.Expanded) or
           ((Key in [VK_LEFT, VK_SUBTRACT]) and Row.Expanded) then
        begin
          Idx := FToggled.IndexOf(Row.GroupKey);
          if Idx >= 0 then FToggled.Delete(Idx) else FToggled.Add(Row.GroupKey);
          DataChanged;
        end;
      end
      else if Key = VK_LEFT then
      begin
        FFocusedCol := Max(0, FFocusedCol - 1);
        MakeColumnVisible(FocusedColumn);
        Invalidate;
      end
      else if Key = VK_RIGHT then
      begin
        FFocusedCol := Min(High(FVisCols), FFocusedCol + 1);
        MakeColumnVisible(FocusedColumn);
        Invalidate;
      end
      else if HasDetails and (FFocusedRow >= 0) and (FRows[FFocusedRow].Kind = vrkData) then
      begin
        // +/- do teclado numérico abre/fecha o detalhe do registro
        if Key = VK_ADD then
          ExpandDetail(FRows[FFocusedRow].RecIndex)
        else
          CollapseDetail(FRows[FFocusedRow].RecIndex);
      end
      else
        Exit;
    VK_F2, VK_RETURN:
      if (FFocusedRow >= 0) and (FRows[FFocusedRow].Kind = vrkGroup) then
      begin
        Idx := FToggled.IndexOf(FRows[FFocusedRow].GroupKey);
        if Idx >= 0 then FToggled.Delete(Idx) else FToggled.Add(FRows[FFocusedRow].GroupKey);
        DataChanged;
      end
      else
        ShowEditor;
    Ord('C'):
      if ssCtrl in Shift then CopyToClipboard(True) else Exit;
    Ord('F'):
      if (ssCtrl in Shift) and FOptionsView.FindPanel and FFindEdit.CanFocus then
        FFindEdit.SetFocus
      else
        Exit;
  else
    Exit;
  end;
  Key := 0;
end;

procedure TEsGrid.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if FMultiSelect and (Key = ' ') then
  begin
    Key := #0;
    Exit;
  end;
  // começar a digitar inicia a edição (como no cxGrid)
  if (Key >= ' ') and (FocusedColumn <> nil) and (FocusedRecordIndex >= 0) and
     not FReadOnly and not FocusedColumn.ReadOnly and
     (FocusedColumn.ResolvedKind <> dkBoolean) then
  begin
    ShowEditor;
    if FEditor.Visible then
    begin
      FEditor.Text := Key;
      FEditor.SelStart := Length(FEditor.Text);
    end;
    Key := #0;
  end;
end;

procedure TEsGrid.DoEnter;
begin
  inherited DoEnter;
  Invalidate;
end;

procedure TEsGrid.DoExit;
begin
  inherited DoExit;
  Invalidate;
end;

{ ---------- edição ---------- }

function TEsGrid.Editing: Boolean;
begin
  Result := FEditor.Visible;
end;

procedure TEsGrid.ShowEditor;
var
  R: TRect;
  Rec: Integer;
begin
  EnsureBuilt;
  if not FEditIsFilter then
  begin
    if FReadOnly then Exit;
    FEditCol := FocusedColumn;
    Rec := FocusedRecordIndex;
    if (FEditCol = nil) or (Rec < 0) or FEditCol.ReadOnly then Exit;
    FEditRec := Rec;
    MakeColumnVisible(FEditCol);
    R := CellRect(FFocusedRow, FEditCol);
    FEditor.Text := DisplayText(Rec, FEditCol);
  end
  else
  begin
    if FEditCol = nil then Exit;
    R := Rect(ColumnX(FEditCol), FilterRowTop, ColumnX(FEditCol) + FEditCol.Width,
      FilterRowTop + FRowHeight);
    FEditor.Text := FEditCol.FFilterText;
  end;
  if R.Left < IndicatorWidth then R.Left := IndicatorWidth;
  if R.Right > ClientW then R.Right := ClientW;
  InflateRect(R, -1, -1);
  FEditor.Font.Assign(Font);
  FEditor.Font.Color := EsColor(EsSkinTheme.Text);
  FEditor.Alignment := FEditCol.ResolvedAlignment;
  FEditor.SetBounds(R.Left + 2, R.Top + Max(0, (R.Bottom - R.Top - FEditor.Height) div 2),
    R.Right - R.Left - 4, FEditor.Height);
  FEditor.Visible := True;
  FEditor.BringToFront;
  // alguns widgetsets (GTK3) só aceitam o foco depois que o widget é mapeado
  if FEditor.CanFocus then
  begin
    FEditor.SetFocus;
    FEditor.SelectAll;
  end
  else
    PostAsync(1);
end;

procedure TEsGrid.PostAsync(AKind: Integer);
begin
  // equivale ao Application.QueueAsyncCall do Lazarus; morre junto com a janela
  if HandleAllocated then
    PostMessage(Handle, WM_USER + $3E1, AKind, 0);
end;

procedure TEsGrid.WMEsAsync(var Message: TMessage);
begin
  case Message.WParam of
    0: AsyncShowEditor(0);
    1: AsyncFocusEditor(0);
  end;
end;

procedure TEsGrid.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  Message.Result := Message.Result or DLGC_WANTARROWS or DLGC_WANTCHARS;
end;

procedure TEsGrid.AsyncShowEditor(Data: NativeInt);
begin
  if not (csDestroying in ComponentState) and not FEditor.Visible then
    ShowEditor;
end;

procedure TEsGrid.AsyncFocusEditor(Data: NativeInt);
begin
  if FEditor.Visible and FEditor.CanFocus then
  begin
    FEditor.SetFocus;
    FEditor.SelectAll;
  end;
end;

procedure TEsGrid.HideEditor(ACommit: Boolean);
var
  S: string;
  V: Variant;
  D: Double;
  DT: TDateTime;
  Col: TEsGridColumn;
  WasFilter: Boolean;
begin
  if not FEditor.Visible then Exit;
  Col := FEditCol;
  WasFilter := FEditIsFilter;
  FEditor.Visible := False;
  FEditIsFilter := False;
  if ACommit and (Col <> nil) then
  begin
    S := FEditor.Text;
    if WasFilter then
      Col.FilterText := S
    else
    begin
      case Col.ResolvedKind of
        dkNumber:
          if Trim(S) = '' then V := Null
          else if TryStrToFloat(StringReplace(S, FormatSettings.ThousandSeparator, '', [rfReplaceAll]), D) then V := D
          else V := GetCellValue(FEditRec, Col);
        dkDate:
          if Trim(S) = '' then V := Null
          else if TryStrToDateTime(S, DT) then V := VarFromDateTime(DT)
          else V := GetCellValue(FEditRec, Col);
      else
        V := S;
      end;
      SetCellValue(FEditRec, Col, V);
    end;
  end;
  if CanFocus and not (csDestroying in ComponentState) then SetFocus;
  Invalidate;
end;

procedure TEsGrid.EditorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        Key := 0;
        HideEditor(True);
      end;
    VK_ESCAPE:
      begin
        Key := 0;
        HideEditor(False);
      end;
    VK_UP, VK_DOWN:
      if not FEditIsFilter then
      begin
        HideEditor(True);
        if Key = VK_UP then FocusRow(FFocusedRow - 1) else FocusRow(FFocusedRow + 1);
        Key := 0;
      end;
    VK_TAB:
      begin
        HideEditor(True);
        if ssShift in Shift then FFocusedCol := Max(0, FFocusedCol - 1)
        else FFocusedCol := Min(High(FVisCols), FFocusedCol + 1);
        Key := 0;
        Invalidate;
      end;
  end;
end;

procedure TEsGrid.EditorExit(Sender: TObject);
begin
  HideEditor(True);
end;

procedure TEsGrid.EditorChange(Sender: TObject);
begin
  // filtro "ao vivo" enquanto digita na linha de filtro
  if FEditIsFilter and (FEditCol <> nil) and FEditor.Visible then
  begin
    FEditCol.FFilterText := FEditor.Text;
    FNeedRebuild := True;
    Invalidate;
  end;
end;

{ ---------- painel de pesquisa ---------- }

procedure TEsGrid.FindEditChange(Sender: TObject);
begin
  FFindText := Trim(FFindEdit.Text);
  DataChanged;
end;

procedure TEsGrid.FindEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: begin FFindEdit.Text := ''; Key := 0; end;
    VK_DOWN, VK_RETURN: begin if CanFocus then SetFocus; Key := 0; end;
  end;
end;

procedure TEsGrid.FindClearClick(Sender: TObject);
begin
  FFindEdit.Text := '';
end;

{ ---------- menu de cabeçalho ---------- }

procedure TEsGrid.ShowHeaderMenu(AColumn: TEsGridColumn; X, Y: Integer);

  procedure AddItem(const ACaption: string; ATag: Integer; AChecked: Boolean = False;
    AEnabled: Boolean = True);
  var
    MI: TMenuItem;
  begin
    MI := TMenuItem.Create(FHeaderMenu);
    MI.Caption := ACaption;
    MI.Tag := ATag;
    MI.Checked := AChecked;
    MI.Enabled := AEnabled;
    MI.OnClick := HeaderMenuClick;
    FHeaderMenu.Items.Add(MI);
  end;

var
  P: TPoint;
  HasCol: Boolean;
begin
  FMenuCol := AColumn;
  HasCol := AColumn <> nil;
  FHeaderMenu.Items.Clear;
  AddItem(rsEsSortAsc, 1, HasCol and (AColumn.SortOrder = esoAscending), HasCol);
  AddItem(rsEsSortDesc, 2, HasCol and (AColumn.SortOrder = esoDescending), HasCol);
  AddItem(rsEsClearSort, 3, False, HasCol and (AColumn.SortOrder <> esoNone));
  AddItem('-', 0);
  if HasCol and (FGroupCols.IndexOf(AColumn) >= 0) then
    AddItem(rsEsUngroup, 5)
  else
    AddItem(rsEsGroupByThis, 4, False, HasCol and AColumn.AllowGroup);
  AddItem(rsEsGroupBox, 6, FOptionsView.GroupByBox);
  AddItem(rsEsFooter, 7, FOptionsView.Footer);
  AddItem(rsEsFilterRowMenu, 8, FOptionsView.FilterRow);
  AddItem(rsEsFindPanelMenu, 9, FOptionsView.FindPanel);
  AddItem('-', 0);
  AddItem(rsEsBestFit, 10, False, HasCol);
  AddItem(rsEsBestFitAll, 11);
  AddItem(rsEsHideColumn, 14, False, HasCol);
  if FGroupCols.Count > 0 then
  begin
    AddItem('-', 0);
    AddItem(rsEsExpandAll, 12);
    AddItem(rsEsCollapseAll, 13);
  end;
  AddItem('-', 0);
  AddItem(rsEsViewTable, 20, FViewMode = gvmTable);
  AddItem(rsEsViewBanded, 21, FViewMode = gvmBanded, FBands.Count > 0);
  AddItem(rsEsViewCards, 22, FViewMode = gvmCards);
  if FDetailOpen.Count > 0 then
    AddItem(rsEsCollapseDetails, 23);
  P := ClientToScreen(Point(X, Y));
  FHeaderMenu.Popup(P.X, P.Y);
end;

procedure TEsGrid.HeaderMenuClick(Sender: TObject);
var
  C: TEsGridColumn;
begin
  C := FMenuCol;
  case TMenuItem(Sender).Tag of
    1: if C <> nil then begin HeaderClick(C, [ssShift]); C.SortOrder := esoAscending; end;
    2: if C <> nil then begin HeaderClick(C, [ssShift]); C.SortOrder := esoDescending; end;
    3: if C <> nil then C.SortOrder := esoNone;
    4: GroupBy(C);
    5: UngroupColumn(C);
    6: FOptionsView.GroupByBox := not FOptionsView.GroupByBox;
    7: FOptionsView.Footer := not FOptionsView.Footer;
    8: FOptionsView.FilterRow := not FOptionsView.FilterRow;
    9: FOptionsView.FindPanel := not FOptionsView.FindPanel;
    10: ApplyBestFit(C);
    11: ApplyBestFit(nil);
    12: FullExpand;
    13: FullCollapse;
    14: if C <> nil then C.Visible := False;
    20: ViewMode := gvmTable;
    21: ViewMode := gvmBanded;
    22: ViewMode := gvmCards;
    23: CollapseAllDetails;
  end;
end;

{ ---------- exportação ---------- }

procedure TEsGrid.ExportToCSV(const AFileName: string; ASeparator: Char);
var
  SL: TStringList;
  I, J: Integer;
  Line, S: string;
  Cols: TArray<TEsGridColumn>;

  function Quote(const V: string): string;
  begin
    if (Pos(ASeparator, V) > 0) or (Pos('"', V) > 0) or (Pos(#10, V) > 0) then
      Result := '"' + StringReplace(V, '"', '""', [rfReplaceAll]) + '"'
    else
      Result := V;
  end;

begin
  EnsureBuilt;
  SetLength(Cols, 0);
  for I := 0 to FGroupCols.Count - 1 do
  begin
    SetLength(Cols, Length(Cols) + 1);
    Cols[High(Cols)] := TEsGridColumn(FGroupCols[I]);
  end;
  for I := 0 to High(FVisCols) do
  begin
    SetLength(Cols, Length(Cols) + 1);
    Cols[High(Cols)] := FVisCols[I];
  end;
  SL := TStringList.Create;
  try
    Line := '';
    for J := 0 to High(Cols) do
    begin
      if J > 0 then Line := Line + ASeparator;
      Line := Line + Quote(Cols[J].GetDisplayName);
    end;
    SL.Add(Line);
    for I := 0 to High(FSorted) do
    begin
      Line := '';
      for J := 0 to High(Cols) do
      begin
        if J > 0 then Line := Line + ASeparator;
        S := DisplayText(FSorted[I], Cols[J]);
        Line := Line + Quote(S);
      end;
      SL.Add(Line);
    end;
    SL.SaveToFile(AFileName);
  finally
    SL.Free;
  end;
end;

procedure TEsGrid.CopyToClipboard(AOnlyFocused: Boolean);
var
  SL: TStringList;
  I, J, Rec: Integer;
  Line: string;
begin
  EnsureBuilt;
  SL := TStringList.Create;
  try
    if AOnlyFocused then
    begin
      Rec := FocusedRecordIndex;
      if Rec < 0 then Exit;
      Line := '';
      for J := 0 to High(FVisCols) do
      begin
        if J > 0 then Line := Line + #9;
        Line := Line + DisplayText(Rec, FVisCols[J]);
      end;
      SL.Add(Line);
    end
    else
    begin
      Line := '';
      for J := 0 to High(FVisCols) do
      begin
        if J > 0 then Line := Line + #9;
        Line := Line + FVisCols[J].GetDisplayName;
      end;
      SL.Add(Line);
      for I := 0 to High(FSorted) do
      begin
        Line := '';
        for J := 0 to High(FVisCols) do
        begin
          if J > 0 then Line := Line + #9;
          Line := Line + DisplayText(FSorted[I], FVisCols[J]);
        end;
        SL.Add(Line);
      end;
    end;
    Clipboard.AsText := SL.Text;
  finally
    SL.Free;
  end;
end;

end.
