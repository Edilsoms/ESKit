{
 *****************************************************************************
  ESKit para Delphi (VCL) - EsToolBarGrid.pas
  TEsToolBarGrid - barra de ferramentas para a TEsGrid.
  Porte do componente TToolBarGrid (unToolBarGrid.pas, Delphi + DevExpress)
  e da sua versão React (ToolBarGrid.jsx), com os mesmos botões, ícones,
  mensagens e regras de habilitação:

    Ajustar colunas | Salvar / Carregar / Apagar layout
    Mudar tipo de seleção | Selecionar todos | Limpar seleção
    Contar registros | Somar coluna | Somar agrupamento | Média da coluna |
      Média do grupo | Remover sumários
    Expandir / Retrair agrupamento
    Imprimir grid | Configuração da impressora
    Exportar para Excel / PDF / HTML / CSV / texto / XML

  Ícones: equivalentes de uso livre baseados no Lucide (https://lucide.dev,
  licença ISC) - ver images/toolbargrid/LICENSE-lucide.txt. Para regerar o
  .res: images/toolbargrid/build_icons.py.

  O layout é salvo em <LayoutDirectory>\<User>_<GridId>.ini (por padrão
  ao lado do executável, como no Delphi) e carregado automaticamente quando
  User e Grid são definidos.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsToolBarGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI, Winapi.CommCtrl,
  System.SysUtils, System.Classes, System.Types, System.Math, System.UITypes,
  System.ImageList, Vcl.Controls, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ImgList, Vcl.Printers, Vcl.Imaging.pngimage,
  EsGraphics, EsTheme, EsSkins, EsGrid, EsGridExport;

type
  TEsToolBarGridButton = (
    tgbBestFit, tgbSaveLayout, tgbLoadLayout, tgbDeleteLayout,
    tgbMultiSelect, tgbSelectAll, tgbUnselectAll,
    tgbCountColumn, tgbSumColumn, tgbSumGroup, tgbAvgColumn, tgbAvgGroup,
    tgbRemoveSummaries,
    tgbExpandGroup, tgbCollapseGroup,
    tgbPrint, tgbPrintSetup,
    tgbExportExcel, tgbExportPDF, tgbExportHTML, tgbExportCSV, tgbExportText,
    tgbExportXML);
  TEsToolBarGridButtons = set of TEsToolBarGridButton;

  TEsToolBarGridMessageEvent = procedure(Sender: TObject; const AMessage: string;
    var AHandled: Boolean) of object;
  TEsToolBarGridButtonEvent = procedure(Sender: TObject;
    AButton: TEsToolBarGridButton; var AHandled: Boolean) of object;
  TEsToolBarGridExportEvent = procedure(Sender: TObject; AFormat: TEsExportFormat;
    var AFileName: string; var AAllow: Boolean) of object;

  { TEsToolBarGrid }

  TEsToolBarGrid = class(TCustomControl)
  private
    FGrid: TEsGrid;
    FUser: string;
    FTitleReport: string;
    FCompanyName: string;
    FAppName: string;
    FGridId: string;
    FLayoutDirectory: string;
    FAutoLoadLayout: Boolean;
    FOpenAfterExport: Boolean;
    FAskFileName: Boolean;
    FVisibleButtons: TEsToolBarGridButtons;
    FOrientation: TEsPageOrientation;
    FPaper: TEsPaperSize;
    FPdfFontMode: TEsPdfFontMode;
    FPdfFontFile: string;
    FImages: TImageList;
    FImageSize: Integer;
    FStatusIndex: Integer;
    FHot: Integer;
    FPressed: Integer;
    FHasLayout: Boolean;
    FLastExportDir: string;
    FOnMessage: TEsToolBarGridMessageEvent;
    FOnButtonClick: TEsToolBarGridButtonEvent;
    FOnBeforeExport: TEsToolBarGridExportEvent;
    FOnAfterExport: TNotifyEvent;
    procedure SetGrid(AValue: TEsGrid);
    procedure SetUser(const AValue: string);
    procedure SetGridId(const AValue: string);
    procedure SetVisibleButtons(AValue: TEsToolBarGridButtons);
    procedure GridStateChanged(Sender: TObject);
    procedure EnsureImages;
    function ButtonSize: Integer;
    function ButtonRect(AButton: TEsToolBarGridButton): TRect;
    function ButtonAt(X, Y: Integer): Integer;
    function StatusRect: TRect;
    function HasSeparatorAfter(AButton: TEsToolBarGridButton): Boolean;
    procedure UpdateHeight;
    function CheckColumn(AKind: TEsSummaryKind): TEsGridColumn;
    procedure DoPrint;
    procedure PrinterNewPage(Sender: TObject);
    procedure DoPrintSetup;
    procedure DoExport(AFormat: TEsExportFormat);
    function ReportOptions: TEsReportOptions;
  protected
    procedure Paint; override;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    class function GetControlClassDefaultSize: TSize;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { executa a ação de um botão (como se tivesse sido clicado) }
    procedure ExecuteButton(AButton: TEsToolBarGridButton);
    function ButtonEnabled(AButton: TEsToolBarGridButton): Boolean;
    function ButtonDown(AButton: TEsToolBarGridButton): Boolean;
    procedure ShowMessageText(const AMessage: string);
    { layout }
    function LayoutFileName: string;
    function EffectiveGridId: string;
    procedure SaveLayout(AQuiet: Boolean = False);
    procedure LoadLayout(AQuiet: Boolean = False);
    procedure DeleteLayout(AQuiet: Boolean = False);
    function LayoutExists: Boolean;
    { impressão / exportação programáticas }
    procedure Print;
    function ExportTo(AFormat: TEsExportFormat; const AFileName: string): Boolean;
    function DefaultExportFileName(AFormat: TEsExportFormat): string;
  published
    property Grid: TEsGrid read FGrid write SetGrid;
    property User: string read FUser write SetUser;
    property TitleReport: string read FTitleReport write FTitleReport;
    property CompanyName: string read FCompanyName write FCompanyName;
    { usado no nome dos arquivos exportados: <AppName>_<GridId>_Dados.ext
      (vazio = nome do executável) }
    property AppName: string read FAppName write FAppName;
    { identificador da grade no arquivo de layout (vazio = Grid.Name) }
    property GridId: string read FGridId write SetGridId;
    { pasta dos .ini de layout (vazio = pasta do executável) }
    property LayoutDirectory: string read FLayoutDirectory write FLayoutDirectory;
    property AutoLoadLayout: Boolean read FAutoLoadLayout write FAutoLoadLayout default True;
    property OpenAfterExport: Boolean read FOpenAfterExport write FOpenAfterExport default True;
    { mostra o diálogo "Salvar como" antes de exportar }
    property AskFileName: Boolean read FAskFileName write FAskFileName default True;
    property VisibleButtons: TEsToolBarGridButtons read FVisibleButtons write SetVisibleButtons
      default [Low(TEsToolBarGridButton)..High(TEsToolBarGridButton)];
    property PrintOrientation: TEsPageOrientation read FOrientation write FOrientation default spoLandscape;
    property PaperSize: TEsPaperSize read FPaper write FPaper default spsA4;
    { PDF: Helvetica ou fonte TrueType embutida (automático pelo conteúdo) }
    property PdfFontMode: TEsPdfFontMode read FPdfFontMode write FPdfFontMode default pfmAuto;
    { .ttf a embutir quando necessário ('' = fonte do sistema) }
    property PdfFontFile: string read FPdfFontFile write FPdfFontFile;
    { substitui o ShowMessage padrão }
    property OnMessage: TEsToolBarGridMessageEvent read FOnMessage write FOnMessage;
    { permite tratar/cancelar a ação padrão de um botão }
    property OnButtonClick: TEsToolBarGridButtonEvent read FOnButtonClick write FOnButtonClick;
    property OnBeforeExport: TEsToolBarGridExportEvent read FOnBeforeExport write FOnBeforeExport;
    property OnAfterExport: TNotifyEvent read FOnAfterExport write FOnAfterExport;
    property Align default alTop;
    property Anchors;
    property AlignWithMargins;
    property Margins;
    property Enabled;
    property ShowHint default True;
    property Visible;
  end;

  { TEsPrintSetupForm - orientação, papel e impressora }

  TEsPrintSetupForm = class(TForm)
  private
    FOrientation: TRadioGroup;
    FPaper: TComboBox;
    procedure PrinterClick(Sender: TObject);
  public
    constructor CreateSetup(AOwner: TComponent; AOrientation: TEsPageOrientation;
      APaper: TEsPaperSize);
    function Orientation: TEsPageOrientation;
    function Paper: TEsPaperSize;
  end;

resourcestring
  rsTbgBestFit = 'Ajustar colunas';
  rsTbgSaveLayout = 'Salvar layout';
  rsTbgLoadLayout = 'Carregar layout';
  rsTbgDeleteLayout = 'Apagar layout';
  rsTbgMultiSelect = 'Mudar tipo de seleção';
  rsTbgSelectAll = 'Selecionar todos';
  rsTbgUnselectAll = 'Limpar seleção';
  rsTbgCount = 'Contar registros';
  rsTbgSum = 'Somar coluna';
  rsTbgSumGroup = 'Somar agrupamento';
  rsTbgAvg = 'Média da coluna';
  rsTbgAvgGroup = 'Média do grupo';
  rsTbgRemoveSummaries = 'Remover sumários';
  rsTbgExpand = 'Expandir agrupamento';
  rsTbgCollapse = 'Retrair agrupamento';
  rsTbgPrint = 'Imprimir grid';
  rsTbgPrintSetup = 'Configuração da impressora';
  rsTbgExcel = 'Exportar para Excel';
  rsTbgPDF = 'Exportar para PDF';
  rsTbgHTML = 'Exportar para HTML';
  rsTbgCSV = 'Exportar para CSV';
  rsTbgText = 'Exportar para texto';
  rsTbgXML = 'Exportar para XML';
  rsTbgStatusLayout = 'Existe um layout salvo para esta grid';
  rsTbgMsgSaved = 'Layout da grid salvo com sucesso!';
  rsTbgMsgSaveError = 'Erro ao salvar o layout da grid.';
  rsTbgMsgLoaded = 'O layout da grid foi carregado com sucesso!';
  rsTbgMsgDeleted = 'Layout da grid apagado com sucesso!';
  rsTbgMsgDeleteError = 'Erro ao apagar o layout da grid.';
  rsTbgMsgSelectColumn = 'Selecione uma coluna da grid.';
  rsTbgMsgCantSum = 'Não é possível somar esse tipo de coluna!';
  rsTbgMsgCantAvg = 'Não é possível fazer a média desse tipo de coluna!';
  rsTbgMsgExported = 'Dados exportados para %s com sucesso!';
  rsTbgMsgExportError = 'Ocorreu um problema ao gerar o arquivo %s final.';
  rsTbgMsgNoGrid = 'Nenhuma grid associada à barra (propriedade Grid).';
  rsTbgMsgPrintError = 'Não foi possível imprimir: %s';
  rsTbgSetupCaption = 'Configuração da impressora';
  rsTbgSetupOrientation = 'Orientação';
  rsTbgSetupLandscape = 'Paisagem';
  rsTbgSetupPortrait = 'Retrato';
  rsTbgSetupPaper = 'Papel';
  rsTbgSetupPrinter = 'Impressora...';
  rsTbgSetupCancel = 'Cancelar';
  rsTbgSetupOK = 'OK';

implementation

{ PNG (RGBA) -> bitmap 32 bits com alfa "reto", como a ImageList 32 bits espera }
function EsPngToAlphaBitmap(APng: TPngImage; ASize: Integer): TBitmap;
var
  X, Y: Integer;
  Src: PRGBTriple;
  Alpha: PByte;
  Dst: PCardinal;
begin
  Result := TBitmap.Create;
  try
    Result.PixelFormat := pf32bit;
    Result.AlphaFormat := afIgnored;
    Result.SetSize(ASize, ASize);
    if (APng.Header.ColorType = COLOR_RGBALPHA) and (APng.Width = ASize) and
       (APng.Height = ASize) then
    begin
      for Y := 0 to ASize - 1 do
      begin
        Src := APng.Scanline[Y];
        Alpha := PByte(APng.AlphaScanline[Y]);
        Dst := Result.ScanLine[Y];
        for X := 0 to ASize - 1 do
        begin
          Dst^ := (Cardinal(Alpha^) shl 24) or (Cardinal(Src^.rgbtRed) shl 16) or
            (Cardinal(Src^.rgbtGreen) shl 8) or Src^.rgbtBlue;
          Inc(Src);
          Inc(Alpha);
          Inc(Dst);
        end;
      end;
    end
    else
    begin
      // outros formatos: desenha sobre fundo transparente (sem alfa parcial)
      Result.Canvas.Brush.Color := clFuchsia;
      Result.Canvas.FillRect(Rect(0, 0, ASize, ASize));
      Result.Canvas.StretchDraw(Rect(0, 0, ASize, ASize), APng);
    end;
  except
    Result.Free;
    raise;
  end;
end;

{ seleciona o papel na impressora atual (DEVMODE) }
procedure EsSetPrinterPaper(APaper: TEsPaperSize);
const
  Codes: array[TEsPaperSize] of SmallInt = (DMPAPER_A4, DMPAPER_LETTER, DMPAPER_LEGAL);
var
  Device, Driver, Port: array[0..MAX_PATH] of Char;
  HDM: THandle;
  DM: PDeviceMode;
begin
  Printer.GetPrinter(Device, Driver, Port, HDM);
  if HDM = 0 then
  begin
    Printer.PrinterIndex := Printer.PrinterIndex; // força a criação do DEVMODE
    Printer.GetPrinter(Device, Driver, Port, HDM);
  end;
  if HDM = 0 then Exit;
  DM := GlobalLock(HDM);
  if DM = nil then Exit;
  try
    DM^.dmFields := DM^.dmFields or DM_PAPERSIZE;
    DM^.dmPaperSize := Codes[APaper];
  finally
    GlobalUnlock(HDM);
  end;
  Printer.SetPrinter(Device, Driver, Port, HDM);
end;

{$R EsToolBarGridIcons.res}

const
  ButtonHints: array[TEsToolBarGridButton] of string = (
    rsTbgBestFit, rsTbgSaveLayout, rsTbgLoadLayout, rsTbgDeleteLayout,
    rsTbgMultiSelect, rsTbgSelectAll, rsTbgUnselectAll,
    rsTbgCount, rsTbgSum, rsTbgSumGroup, rsTbgAvg, rsTbgAvgGroup,
    rsTbgRemoveSummaries, rsTbgExpand, rsTbgCollapse, rsTbgPrint,
    rsTbgPrintSetup, rsTbgExcel, rsTbgPDF, rsTbgHTML, rsTbgCSV, rsTbgText,
    rsTbgXML);
  ButtonIcons: array[TEsToolBarGridButton] of string = (
    'TBG_BESTFIT', 'TBG_SAVELAYOUT', 'TBG_LOADLAYOUT', 'TBG_DELETELAYOUT',
    'TBG_MULTISELECT', 'TBG_SELECTALL', 'TBG_UNSELECTALL',
    'TBG_COUNTCOLUMN', 'TBG_SUMCOLUMN', 'TBG_SUMGROUP', 'TBG_AVGCOLUMN',
    'TBG_AVGGROUP', 'TBG_REMOVESUMMARY', 'TBG_EXPANDGROUP', 'TBG_COLLAPSEGROUP',
    'TBG_PRINT', 'TBG_PRINTSETUP', 'TBG_EXPORTXLSX', 'TBG_EXPORTPDF',
    'TBG_EXPORTHTML', 'TBG_EXPORTCSV', 'TBG_EXPORTTXT', 'TBG_EXPORTXML');
  // fim de cada grupo (mesma ordem do AtualizarEstadoBotoes do Delphi)
  GroupEnds = [tgbDeleteLayout, tgbUnselectAll, tgbRemoveSummaries,
    tgbCollapseGroup, tgbPrintSetup];

{ TEsPrintSetupForm }

constructor TEsPrintSetupForm.CreateSetup(AOwner: TComponent;
  AOrientation: TEsPageOrientation; APaper: TEsPaperSize);
var
  L: TLabel;
  B: TButton;
  P: TPanel;
begin
  inherited CreateNew(AOwner);
  Caption := rsTbgSetupCaption;
  BorderStyle := bsDialog;
  Position := poOwnerFormCenter;
  ClientWidth := 320;
  ClientHeight := 210;
  FOrientation := TRadioGroup.Create(Self);
  FOrientation.Parent := Self;
  FOrientation.Caption := rsTbgSetupOrientation;
  FOrientation.SetBounds(12, 10, 296, 70);
  FOrientation.Columns := 2;
  FOrientation.Items.Add(rsTbgSetupLandscape);
  FOrientation.Items.Add(rsTbgSetupPortrait);
  FOrientation.ItemIndex := Ord(AOrientation);
  L := TLabel.Create(Self);
  L.Parent := Self;
  L.Caption := rsTbgSetupPaper;
  L.SetBounds(14, 96, 60, 20);
  FPaper := TComboBox.Create(Self);
  FPaper.Parent := Self;
  FPaper.Style := csDropDownList;
  FPaper.SetBounds(80, 92, 228, 26);
  FPaper.Items.Add('A4');
  FPaper.Items.Add('Carta (Letter)');
  FPaper.Items.Add('Ofício (Legal)');
  FPaper.ItemIndex := Ord(APaper);
  B := TButton.Create(Self);
  B.Parent := Self;
  B.Caption := rsTbgSetupPrinter;
  B.SetBounds(12, 130, 120, 28);
  B.OnClick := PrinterClick;
  P := TPanel.Create(Self);
  P.Parent := Self;
  P.Align := alBottom;
  P.Height := 44;
  P.BevelOuter := bvNone;
  B := TButton.Create(Self);
  B.Parent := P;
  B.Caption := rsTbgSetupCancel;
  B.ModalResult := mrCancel;
  B.Cancel := True;
  B.SetBounds(140, 8, 80, 28);
  B := TButton.Create(Self);
  B.Parent := P;
  B.Caption := rsTbgSetupOK;
  B.ModalResult := mrOK;
  B.Default := True;
  B.SetBounds(228, 8, 80, 28);
end;

procedure TEsPrintSetupForm.PrinterClick(Sender: TObject);
var
  D: TPrinterSetupDialog;
begin
  D := TPrinterSetupDialog.Create(Self);
  try
    try
      if D.Execute then
      begin
        if Printer.Orientation = poPortrait then
          FOrientation.ItemIndex := Ord(spoPortrait)
        else
          FOrientation.ItemIndex := Ord(spoLandscape);
      end;
    except
      on E: Exception do
        MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  finally
    D.Free;
  end;
end;

function TEsPrintSetupForm.Orientation: TEsPageOrientation;
begin
  Result := TEsPageOrientation(Max(0, FOrientation.ItemIndex));
end;

function TEsPrintSetupForm.Paper: TEsPaperSize;
begin
  Result := TEsPaperSize(Max(0, FPaper.ItemIndex));
end;

{ TEsToolBarGrid }

constructor TEsToolBarGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption];
  FAutoLoadLayout := True;
  FOpenAfterExport := True;
  FAskFileName := True;
  FVisibleButtons := [Low(TEsToolBarGridButton)..High(TEsToolBarGridButton)];
  FOrientation := spoLandscape;
  FPaper := spsA4;
  FHot := -1;
  FPressed := -1;
  FStatusIndex := -1;
  ShowHint := True;
  Align := alTop;
  EsThemes.RegisterClient(Self);
  with GetControlClassDefaultSize do
    SetBounds(0, 0, CX, CY);
end;

destructor TEsToolBarGrid.Destroy;
begin
  EsThemes.UnregisterClient(Self);
  if FGrid <> nil then
    FGrid.RemoveStateChangeHandler(GridStateChanged);
  inherited Destroy;
end;

class function TEsToolBarGrid.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 640;
  Result.CY := 30;
end;

procedure TEsToolBarGrid.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FGrid) then
  begin
    FGrid := nil;
    Invalidate;
  end;
end;

procedure TEsToolBarGrid.Loaded;
begin
  inherited Loaded;
  UpdateHeight;
  // SetUser do Delphi: ao ter usuário e grade, carrega o layout salvo
  if FAutoLoadLayout and not (csDesigning in ComponentState) then
    LoadLayout(True);
  FHasLayout := LayoutExists;
end;

procedure TEsToolBarGrid.SetGrid(AValue: TEsGrid);
begin
  if FGrid = AValue then Exit;
  if FGrid <> nil then
  begin
    FGrid.RemoveStateChangeHandler(GridStateChanged);
    FGrid.RemoveFreeNotification(Self);
  end;
  FGrid := AValue;
  if FGrid <> nil then
  begin
    FGrid.FreeNotification(Self);
    FGrid.AddStateChangeHandler(GridStateChanged);
  end;
  if [csLoading, csDesigning] * ComponentState = [] then
  begin
    if FAutoLoadLayout then LoadLayout(True);
    FHasLayout := LayoutExists;
  end;
  Invalidate;
end;

procedure TEsToolBarGrid.SetUser(const AValue: string);
begin
  if FUser = AValue then Exit;
  FUser := AValue;
  if [csLoading, csDesigning] * ComponentState = [] then
  begin
    if FAutoLoadLayout then LoadLayout(True);
    FHasLayout := LayoutExists;
    Invalidate;
  end;
end;

procedure TEsToolBarGrid.SetGridId(const AValue: string);
begin
  if FGridId = AValue then Exit;
  FGridId := AValue;
  if not (csLoading in ComponentState) then
  begin
    FHasLayout := LayoutExists;
    Invalidate;
  end;
end;

procedure TEsToolBarGrid.SetVisibleButtons(AValue: TEsToolBarGridButtons);
begin
  if FVisibleButtons = AValue then Exit;
  FVisibleButtons := AValue;
  Invalidate;
end;

procedure TEsToolBarGrid.GridStateChanged(Sender: TObject);
begin
  Invalidate;
end;

procedure TEsToolBarGrid.ShowMessageText(const AMessage: string);
var
  Handled: Boolean;
begin
  Handled := False;
  if Assigned(FOnMessage) then
    FOnMessage(Self, AMessage, Handled);
  if not Handled then
    ShowMessage(AMessage);
end;

{ ---------- ícones / geometria ---------- }

procedure TEsToolBarGrid.EnsureImages;
var
  Want: Integer;
  Suffix: string;
  B: TEsToolBarGridButton;

  procedure AddIcon(const AName: string);
  var
    Png: TPngImage;
    RS: TResourceStream;
    Bmp: TBitmap;
  begin
    Png := TPngImage.Create;
    Bmp := nil;
    try
      try
        RS := TResourceStream.Create(HInstance, AName + Suffix, RT_RCDATA);
        try
          Png.LoadFromStream(RS);
        finally
          RS.Free;
        end;
        Bmp := EsPngToAlphaBitmap(Png, Want);
        ImageList_Add(FImages.Handle, Bmp.Handle, 0);
      except
        // recurso ausente: ícone vazio (mantém os índices)
        FreeAndNil(Bmp);
        Bmp := TBitmap.Create;
        Bmp.PixelFormat := pf32bit;
        Bmp.SetSize(Want, Want);
        ImageList_Add(FImages.Handle, Bmp.Handle, 0);
      end;
    finally
      Bmp.Free;
      Png.Free;
    end;
  end;

begin
  Want := EsScale(Self, 16);
  if Want >= 30 then Want := 32
  else if Want >= 22 then Want := 24
  else Want := 16;
  if (FImages <> nil) and (FImageSize = Want) then Exit;
  FreeAndNil(FImages);
  FImageSize := Want;
  if Want = 16 then Suffix := '' else Suffix := '_' + IntToStr(Want);
  FImages := TImageList.Create(Self);
  FImages.ColorDepth := cd32Bit;
  FImages.DrawingStyle := dsTransparent;
  FImages.Width := Want;
  FImages.Height := Want;
  for B := Low(TEsToolBarGridButton) to High(TEsToolBarGridButton) do
    AddIcon(ButtonIcons[B]);
  FStatusIndex := FImages.Count;
  AddIcon('TBG_STATUSLAYOUT');
end;

function TEsToolBarGrid.ButtonSize: Integer;
begin
  EnsureImages;
  Result := FImageSize + EsScale(Self, 8);
end;

procedure TEsToolBarGrid.UpdateHeight;
begin
  if [csLoading, csDestroying] * ComponentState <> [] then Exit;
  if Align in [alTop, alBottom, alNone] then
    Height := ButtonSize + EsScale(Self, 6);
end;

function TEsToolBarGrid.HasSeparatorAfter(AButton: TEsToolBarGridButton): Boolean;
var
  B: TEsToolBarGridButton;
begin
  Result := False;
  if not (AButton in GroupEnds) then Exit;
  // só separa se houver algum botão visível depois
  for B := Succ(AButton) to High(TEsToolBarGridButton) do
    if B in FVisibleButtons then Exit(True);
end;

function TEsToolBarGrid.ButtonRect(AButton: TEsToolBarGridButton): TRect;
var
  B: TEsToolBarGridButton;
  X, S, BtnTop, Sep: Integer;
begin
  S := ButtonSize;
  Sep := EsScale(Self, 9);
  X := EsScale(Self, 4);
  BtnTop := (Height - S) div 2;
  for B := Low(TEsToolBarGridButton) to High(TEsToolBarGridButton) do
  begin
    if not (B in FVisibleButtons) then
    begin
      if B = AButton then Exit(Rect(0, 0, 0, 0));
      Continue;
    end;
    if B = AButton then
      Exit(Rect(X, BtnTop, X + S, BtnTop + S));
    Inc(X, S + 1);
    if HasSeparatorAfter(B) then Inc(X, Sep);
  end;
  Result := Rect(0, 0, 0, 0);
end;

function TEsToolBarGrid.ButtonAt(X, Y: Integer): Integer;
var
  B: TEsToolBarGridButton;
begin
  for B := Low(TEsToolBarGridButton) to High(TEsToolBarGridButton) do
    if (B in FVisibleButtons) and PtInRect(ButtonRect(B), Point(X, Y)) then
      Exit(Ord(B));
  Result := -1;
end;

function TEsToolBarGrid.StatusRect: TRect;
var
  S: Integer;
begin
  S := ButtonSize;
  Result := Rect(Width - S - EsScale(Self, 4), (Height - S) div 2,
    Width - EsScale(Self, 4), (Height - S) div 2 + S);
end;

{ ---------- estado dos botões ---------- }

function TEsToolBarGrid.ButtonDown(AButton: TEsToolBarGridButton): Boolean;
begin
  Result := (AButton = tgbMultiSelect) and (FGrid <> nil) and FGrid.MultiSelect;
end;

function TEsToolBarGrid.ButtonEnabled(AButton: TEsToolBarGridButton): Boolean;
var
  Multi, Grouped: Boolean;
begin
  if (FGrid = nil) or not EsIsEnabled(Self) then Exit(False);
  Multi := FGrid.MultiSelect;
  Grouped := FGrid.GroupCount > 0;
  // mesmas regras do AtualizarEstadoBotoes
  case AButton of
    tgbSelectAll, tgbUnselectAll: Result := Multi;
    tgbCountColumn, tgbSumColumn, tgbAvgColumn, tgbRemoveSummaries: Result := not Multi;
    tgbSumGroup, tgbAvgGroup: Result := Grouped and not Multi;
    tgbExpandGroup, tgbCollapseGroup: Result := Grouped;
  else
    Result := True;
  end;
end;

{ ---------- desenho ---------- }

procedure TEsToolBarGrid.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TEsToolBarGrid.Paint;
var
  T: TEsTheme;
  B: TEsToolBarGridButton;
  R: TRect;
  En, Down: Boolean;
  X: Integer;
begin
  EnsureImages;
  T := EsSkinTheme;
  EsFillGradientV(Canvas, ClientRect, EsColor(T.HeaderFace), EsColor(T.HeaderFace2));
  Canvas.Pen.Color := EsColor(T.Border);
  EsLine(Canvas, 0, Height - 1, Width, Height - 1);
  for B := Low(TEsToolBarGridButton) to High(TEsToolBarGridButton) do
  begin
    if not (B in FVisibleButtons) then Continue;
    R := ButtonRect(B);
    En := ButtonEnabled(B) or (csDesigning in ComponentState);
    Down := ButtonDown(B);
    if En and ((FHot = Ord(B)) or Down) then
    begin
      if (FPressed = Ord(B)) or Down then
        Canvas.Brush.Color := EsColor(BlendOver(T.HeaderFace, FadeColor(T.Accent, 0.30)))
      else
        Canvas.Brush.Color := EsColor(BlendOver(T.HeaderFace, FadeColor(T.Accent, 0.15)));
      Canvas.FillRect(R);
      EsFrame(Canvas, R, EsColor(BlendOver(T.HeaderFace, FadeColor(T.Accent, 0.55))));
    end;
    FImages.Draw(Canvas, R.Left + (R.Right - R.Left - FImageSize) div 2,
      R.Top + (R.Bottom - R.Top - FImageSize) div 2, Ord(B), En);
    if HasSeparatorAfter(B) then
    begin
      X := R.Right + EsScale(Self, 4) + 1;
      Canvas.Pen.Color := EsColor(T.Border);
      EsLine(Canvas, X, R.Top + 3, X, R.Bottom - 3);
    end;
  end;
  if FHasLayout and not (csDesigning in ComponentState) then
  begin
    R := StatusRect;
    FImages.Draw(Canvas, R.Left + (R.Right - R.Left - FImageSize) div 2,
      R.Top + (R.Bottom - R.Top - FImageSize) div 2, FStatusIndex);
  end;
end;

{ ---------- mouse ---------- }

procedure TEsToolBarGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  B: Integer;
  H: string;
begin
  inherited MouseMove(Shift, X, Y);
  B := ButtonAt(X, Y);
  if B >= 0 then
    H := ButtonHints[TEsToolBarGridButton(B)]
  else if FHasLayout and PtInRect(StatusRect, Point(X, Y)) then
    H := rsTbgStatusLayout
  else
    H := '';
  if H <> Hint then
  begin
    Hint := H;
    Application.CancelHint;
  end;
  if B <> FHot then
  begin
    FHot := B;
    Invalidate;
  end;
end;

procedure TEsToolBarGrid.CMMouseLeave(var Message: TMessage);
begin
  FHot := -1;
  FPressed := -1;
  Invalidate;
  inherited;
end;

procedure TEsToolBarGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) and not (csDesigning in ComponentState) then
  begin
    FPressed := ButtonAt(X, Y);
    Invalidate;
  end;
end;

procedure TEsToolBarGrid.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  B: Integer;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if Button <> mbLeft then Exit;
  B := FPressed;
  FPressed := -1;
  Invalidate;
  if (B >= 0) and (ButtonAt(X, Y) = B) and
     ButtonEnabled(TEsToolBarGridButton(B)) then
    ExecuteButton(TEsToolBarGridButton(B));
end;

{ ---------- layout ---------- }

function TEsToolBarGrid.EffectiveGridId: string;
begin
  Result := FGridId;
  if (Result = '') and (FGrid <> nil) then
    Result := FGrid.Name;
end;

function TEsToolBarGrid.LayoutFileName: string;
var
  Dir: string;
begin
  Dir := FLayoutDirectory;
  if Dir = '' then
    Dir := ExtractFilePath(ParamStr(0));
  Result := IncludeTrailingPathDelimiter(Dir) + FUser + '_' + EffectiveGridId + '.ini';
end;

function TEsToolBarGrid.LayoutExists: Boolean;
begin
  Result := (FUser <> '') and (FGrid <> nil) and FileExists(LayoutFileName);
end;

procedure TEsToolBarGrid.SaveLayout(AQuiet: Boolean);
begin
  if FGrid = nil then Exit;
  try
    ForceDirectories(ExtractFilePath(LayoutFileName));
    FGrid.StoreToIniFile(LayoutFileName);
    FHasLayout := FUser <> '';
    Invalidate;
    if not AQuiet then ShowMessageText(rsTbgMsgSaved);
  except
    if not AQuiet then ShowMessageText(rsTbgMsgSaveError);
  end;
end;

procedure TEsToolBarGrid.LoadLayout(AQuiet: Boolean);
begin
  if FGrid = nil then Exit;
  if FileExists(LayoutFileName) then
    FGrid.RestoreFromIniFile(LayoutFileName);
  if not AQuiet then ShowMessageText(rsTbgMsgLoaded);
end;

procedure TEsToolBarGrid.DeleteLayout(AQuiet: Boolean);
begin
  if (FGrid = nil) or not FileExists(LayoutFileName) then Exit;
  if DeleteFile(LayoutFileName) then
  begin
    if not AQuiet then ShowMessageText(rsTbgMsgDeleted);
  end
  else if not AQuiet then
    ShowMessageText(rsTbgMsgDeleteError);
  FHasLayout := False;
  Invalidate;
end;

{ ---------- sumários ---------- }

function TEsToolBarGrid.CheckColumn(AKind: TEsSummaryKind): TEsGridColumn;
begin
  Result := FGrid.FocusedColumn;
  if (Result = nil) or not Result.Visible then
  begin
    ShowMessageText(rsTbgMsgSelectColumn);
    Exit(nil);
  end;
  if (AKind <> skCount) and not Result.IsNumeric then
  begin
    if AKind = skSum then
      ShowMessageText(rsTbgMsgCantSum)
    else
      ShowMessageText(rsTbgMsgCantAvg);
    Exit(nil);
  end;
end;

{ ---------- impressão / exportação ---------- }

function TEsToolBarGrid.ReportOptions: TEsReportOptions;
begin
  Result := EsDefaultReportOptions;
  Result.PdfFontMode := FPdfFontMode;
  Result.PdfFontFile := FPdfFontFile;
  Result.CompanyName := FCompanyName;
  Result.TitleReport := FTitleReport;
  Result.Orientation := FOrientation;
  Result.Paper := FPaper;
end;

procedure TEsToolBarGrid.Print;
begin
  DoPrint;
end;

procedure TEsToolBarGrid.DoPrint;
var
  Data: TEsExportData;
  Target: TEsCanvasReportTarget;
  W, H: Single;
  DpiX, DpiY: Integer;
begin
  if FGrid = nil then Exit;
  Data := TEsExportData.Create(FGrid);
  try
    try
      if FOrientation = spoPortrait then
        Printer.Orientation := poPortrait
      else
        Printer.Orientation := poLandscape;
      try
        EsSetPrinterPaper(FPaper);
      except
        // impressora sem esse papel: usa o atual
      end;
      Printer.Title := FTitleReport;
      Printer.BeginDoc;
      try
        DpiX := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
        DpiY := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
        Target := TEsCanvasReportTarget.Create(Printer.Canvas, DpiX);
        try
          W := Printer.PageWidth / DpiX * 72;
          H := Printer.PageHeight / DpiY * 72;
          // cada página (a partir da 2ª) pede Printer.NewPage
          Target.OnNewPage := PrinterNewPage;
          TEsReportRenderer.Render(Data, ReportOptions, Target, W, H);
        finally
          Target.Free;
        end;
      finally
        Printer.EndDoc;
      end;
    except
      on E: Exception do
      begin
        if Printer.Printing then Printer.Abort;
        ShowMessageText(Format(rsTbgMsgPrintError, [E.Message]));
      end;
    end;
  finally
    Data.Free;
  end;
end;

procedure TEsToolBarGrid.PrinterNewPage(Sender: TObject);
begin
  Printer.NewPage;
end;

procedure TEsToolBarGrid.DoPrintSetup;
var
  F: TEsPrintSetupForm;
begin
  F := TEsPrintSetupForm.CreateSetup(nil, FOrientation, FPaper);
  try
    if F.ShowModal = mrOK then
    begin
      FOrientation := F.Orientation;
      FPaper := F.Paper;
    end;
  finally
    F.Free;
  end;
end;

function TEsToolBarGrid.DefaultExportFileName(AFormat: TEsExportFormat): string;
var
  App: string;
begin
  App := FAppName;
  if App = '' then
    App := ChangeFileExt(ExtractFileName(ParamStr(0)), '');
  Result := App + '_' + EffectiveGridId + '_Dados' + EsExportExtensions[AFormat];
end;

function TEsToolBarGrid.ExportTo(AFormat: TEsExportFormat;
  const AFileName: string): Boolean;
begin
  Result := False;
  if FGrid = nil then Exit;
  try
    EsExportGrid(FGrid, AFormat, AFileName, ReportOptions);
    Result := True;
  except
    on E: Exception do
      ShowMessageText(Format(rsTbgMsgExportError, [EsExportDescriptions[AFormat]]) +
        sLineBreak + E.Message);
  end;
end;

procedure TEsToolBarGrid.DoExport(AFormat: TEsExportFormat);
var
  FileName: string;
  Allow: Boolean;
  Dlg: TSaveDialog;
begin
  FileName := DefaultExportFileName(AFormat);
  if FLastExportDir <> '' then
    FileName := IncludeTrailingPathDelimiter(FLastExportDir) + FileName;
  Allow := True;
  if Assigned(FOnBeforeExport) then
    FOnBeforeExport(Self, AFormat, FileName, Allow);
  if not Allow then Exit;
  if FAskFileName then
  begin
    Dlg := TSaveDialog.Create(nil);
    try
      Dlg.Filter := EsExportFilters[AFormat];
      Dlg.DefaultExt := Copy(EsExportExtensions[AFormat], 2, 10);
      Dlg.FileName := ExtractFileName(FileName);
      if ExtractFilePath(FileName) <> '' then
        Dlg.InitialDir := ExtractFilePath(FileName);
      Dlg.Options := Dlg.Options + [ofOverwritePrompt];
      if not Dlg.Execute then Exit;
      FileName := Dlg.FileName;
    finally
      Dlg.Free;
    end;
  end;
  FLastExportDir := ExtractFilePath(FileName);
  if ExportTo(AFormat, FileName) then
  begin
    ShowMessageText(Format(rsTbgMsgExported, [EsExportDescriptions[AFormat]]));
    if Assigned(FOnAfterExport) then FOnAfterExport(Self);
    if FOpenAfterExport then
      ShellExecute(0, 'open', PChar(FileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

{ ---------- ações ---------- }

procedure TEsToolBarGrid.ExecuteButton(AButton: TEsToolBarGridButton);
var
  Handled: Boolean;
  C: TEsGridColumn;
begin
  if FGrid = nil then
  begin
    ShowMessageText(rsTbgMsgNoGrid);
    Exit;
  end;
  Handled := False;
  if Assigned(FOnButtonClick) then
    FOnButtonClick(Self, AButton, Handled);
  if Handled then Exit;
  case AButton of
    tgbBestFit: FGrid.ApplyBestFit;
    tgbSaveLayout: SaveLayout;
    tgbLoadLayout: LoadLayout;
    tgbDeleteLayout: DeleteLayout;
    tgbMultiSelect: FGrid.MultiSelect := not FGrid.MultiSelect;
    tgbSelectAll: FGrid.SelectAll;
    tgbUnselectAll: FGrid.ClearSelection;
    tgbCountColumn:
      begin
        C := CheckColumn(skCount);
        if C <> nil then FGrid.AddFooterSummary(C, skCount);
      end;
    tgbSumColumn:
      begin
        C := CheckColumn(skSum);
        if C <> nil then FGrid.AddFooterSummary(C, skSum);
      end;
    tgbSumGroup:
      begin
        C := CheckColumn(skSum);
        if C <> nil then FGrid.AddGroupSummary(C, skSum);
      end;
    tgbAvgColumn:
      begin
        C := CheckColumn(skAverage);
        if C <> nil then FGrid.AddFooterSummary(C, skAverage);
      end;
    tgbAvgGroup:
      begin
        C := CheckColumn(skAverage);
        if C <> nil then FGrid.AddGroupSummary(C, skAverage);
      end;
    tgbRemoveSummaries: FGrid.RemoveAllSummaries;
    tgbExpandGroup: FGrid.FullExpand;
    tgbCollapseGroup: FGrid.FullCollapse;
    tgbPrint: DoPrint;
    tgbPrintSetup: DoPrintSetup;
    tgbExportExcel: DoExport(sefExcel);
    tgbExportPDF: DoExport(sefPDF);
    tgbExportHTML: DoExport(sefHTML);
    tgbExportCSV: DoExport(sefCSV);
    tgbExportText: DoExport(sefText);
    tgbExportXML: DoExport(sefXML);
  end;
  Invalidate;
end;

end.
