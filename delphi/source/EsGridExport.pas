{
 *****************************************************************************
  ESKit para Delphi (VCL) - EsGridExport.pas
  Exportação e relatório da TEsGrid (equivale ao ExportGridTo* e ao
  TdxComponentPrinter usados pelo TToolBarGrid do Delphi):

    Excel (.xlsx)  - gerado direto (OOXML + zip), com tipos numéricos/data
    PDF            - gerador próprio, mesmo layout da impressão: Helvetica
                     (WinAnsi) quando o texto cabe no Windows-1252; caso
                     contrário embute um subconjunto de uma fonte TrueType
                     (Identity-H + ToUnicode), cobrindo qualquer escrita
                     que a fonte tenha
    HTML, CSV (;), XML e texto alinhado

  Regras (iguais às do componente original):
    * exporta os registros filtrados, na ordem da grade, incluindo os de
      grupos retraídos;
    * colunas agrupadas (ocultas na grade) entram primeiro;
    * a linha de rodapé traz os sumários do rodapé.

  O motor de relatório (TEsReportRenderer) desenha em pontos (1/72") num
  TEsReportTarget: TEsCanvasReportTarget (impressora/bitmap) ou
  TEsPdfReportTarget (arquivo PDF).

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsGridExport;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Math, System.Variants,
  System.Zip, System.ZLib, Vcl.Graphics, EsGraphics, EsGrid, EsTrueType;

type
  TEsExportFormat = (sefExcel, sefPDF, sefHTML, sefCSV, sefXML, sefText);
  TEsPaperSize = (spsA4, spsLetter, spsLegal);
  TEsPageOrientation = (spoLandscape, spoPortrait);
  { fonte do PDF: automático (Helvetica se todo o texto couber no
    Windows-1252, senão fonte TrueType embutida), sempre Helvetica, ou
    sempre embutida }
  TEsPdfFontMode = (pfmAuto, pfmStandard, pfmEmbedded);

  TEsExportColumn = record
    Column: TEsGridColumn;
    Title: string;
    Key: string;
    Kind: TEsDataKind;
    Numeric: Boolean;
    Align: TAlignment;
    Width: Integer; // pixels na grade
  end;

  { TEsExportData - "fotografia" dos dados da grade para exportar/imprimir }

  TEsExportData = class
  public
    Columns: TArray<TEsExportColumn>;
    Values: TArray<TArray<Variant>>;
    Texts: TArray<TArray<string>>;
    Footer: TArray<string>;
    HasFooter: Boolean;
    { visão em bandas: título da banda de cada coluna ('' = sem banda) }
    Bands: TArray<string>;
    HasBands: Boolean;
    constructor Create(AGrid: TEsGrid);
    { faixas de colunas consecutivas da mesma banda: devolve quantas colunas
      a partir de AStart pertencem à mesma banda }
    function BandSpan(AStart: Integer): Integer;
    function ColCount: Integer;
    function RowCount: Integer;
  end;

  TEsReportOptions = record
    CompanyName: string;
    TitleReport: string;
    Orientation: TEsPageOrientation;
    Paper: TEsPaperSize;
    PdfFontMode: TEsPdfFontMode;
    { .ttf a embutir ('' = procura Arial/Liberation Sans/DejaVu Sans no sistema) }
    PdfFontFile: string;
    PdfBoldFontFile: string;
  end;

  { TEsReportTarget - superfície de desenho em pontos }

  TEsReportTarget = class
  public
    procedure BeginPage(AWidthPt, AHeightPt: Single); virtual; abstract;
    procedure EndPage; virtual; abstract;
    function TextWidth(const S: string; ASize: Single; ABold: Boolean): Single; virtual; abstract;
    { Y = linha de base do texto }
    procedure DrawText(X, Y: Single; const S: string; ASize: Single; ABold: Boolean); virtual; abstract;
    procedure FillRect(X, Y, W, H: Single; AGray: Byte); virtual; abstract;
    procedure DrawLine(X1, Y1, X2, Y2: Single; AGray: Byte; AWidth: Single); virtual; abstract;
  end;

  { TEsCanvasReportTarget - desenha num TCanvas (impressora ou bitmap) }

  TEsCanvasReportTarget = class(TEsReportTarget)
  private
    FCanvas: TCanvas;
    FScale: Single; // pixels por ponto
    FOffsetX, FOffsetY: Integer;
    FPageCount: Integer;
    FOnNewPage: TNotifyEvent;
    procedure SetFont(ASize: Single; ABold: Boolean);
  public
    constructor Create(ACanvas: TCanvas; APixelsPerInch: Integer);
    procedure BeginPage(AWidthPt, AHeightPt: Single); override;
    procedure EndPage; override;
    function TextWidth(const S: string; ASize: Single; ABold: Boolean): Single; override;
    procedure DrawText(X, Y: Single; const S: string; ASize: Single; ABold: Boolean); override;
    procedure FillRect(X, Y, W, H: Single; AGray: Byte); override;
    procedure DrawLine(X1, Y1, X2, Y2: Single; AGray: Byte; AWidth: Single); override;
    property OffsetX: Integer read FOffsetX write FOffsetX;
    property OffsetY: Integer read FOffsetY write FOffsetY;
    { chamado antes de cada página a partir da 2ª (ex.: Printer.NewPage) }
    property OnNewPage: TNotifyEvent read FOnNewPage write FOnNewPage;
  end;

  { TEsPdfReportTarget - gera um PDF (Helvetica ou fonte TrueType embutida) }

  TEsPdfText = record
    Text: string;
    Size: Single;
    Bold: Boolean;
  end;

  TEsPdfReportTarget = class(TEsReportTarget)
  private
    FPages: TStringList;      // conteúdo de cada página
    FPageSizes: TArray<TPointF>;
    FCurrent: string;
    FPageH: Single;
    FMeasure: TBitmap;
    FTexts: TArray<TEsPdfText>;
    FTextCount: Integer;
    FFontMode: TEsPdfFontMode;
    FFontFile, FBoldFontFile: string;
    FFallbackFiles: TStrings;
    FAutoFallback: Boolean;
    { 0 = normal, 1 = negrito (pode ser nil), 2.. = fontes de reserva }
    FFonts: TArray<TEsTrueTypeFont>;
    FFallbackNames: TStringList; // arquivos de reserva ainda não carregados
    FFallbackScanned: Boolean;
    FCompress: Boolean;
    function Num(V: Single): string;
    function PdfString(const S: string): string;
    procedure SetFontMode(AValue: TEsPdfFontMode);
    procedure SetFallbackFiles(AValue: TStrings);
    procedure LoadFonts;
    function Embedded: Boolean;
    { fonte (índice em FFonts) e glifo para o caractere }
    function Resolve(ACodePoint: Cardinal; ABold: Boolean; out AGlyph: Integer): Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure BeginPage(AWidthPt, AHeightPt: Single); override;
    procedure EndPage; override;
    function TextWidth(const S: string; ASize: Single; ABold: Boolean): Single; override;
    procedure DrawText(X, Y: Single; const S: string; ASize: Single; ABold: Boolean); override;
    procedure FillRect(X, Y, W, H: Single; AGray: Byte); override;
    procedure DrawLine(X1, Y1, X2, Y2: Single; AGray: Byte; AWidth: Single); override;
    procedure SaveToStream(AStream: TStream);
    procedure SaveToFile(const AFileName: string);
    { verdadeiro se o texto não cabe no Windows-1252 (Helvetica do PDF) }
    class function NeedsUnicode(const S: string): Boolean;
    { definir antes de desenhar (as larguras dependem da fonte); pfmAuto
      equivale a pfmStandard aqui - EsExportToPDF decide pelo conteúdo }
    property FontMode: TEsPdfFontMode read FFontMode write SetFontMode;
    property FontFile: string read FFontFile write FFontFile;
    property BoldFontFile: string read FBoldFontFile write FBoldFontFile;
    { fontes .ttf/.ttc tentadas, em ordem, para caracteres que a fonte
      principal não tem (antes das fontes de reserva do sistema) }
    property FallbackFiles: TStrings read FFallbackFiles write SetFallbackFiles;
    { procura também fontes de reserva no sistema (DejaVu, Segoe UI Symbol,
      Microsoft YaHei, Noto...); padrão True }
    property AutoFallback: Boolean read FAutoFallback write FAutoFallback;
    { comprime os fluxos (FlateDecode); padrão True }
    property Compress: Boolean read FCompress write FCompress;
  end;

  { TEsReportRenderer - layout do relatório (cabeçalho, tabela, rodapé) }

  TEsReportRenderer = class
  public
    class procedure PaperSizePt(APaper: TEsPaperSize; AOrientation: TEsPageOrientation;
      out AWidth, AHeight: Single);
    { desenha todas as páginas; devolve a quantidade de páginas }
    class function Render(AData: TEsExportData; const AOptions: TEsReportOptions;
      ATarget: TEsReportTarget; APageWidthPt, APageHeightPt: Single): Integer;
  end;

const
  EsExportExtensions: array[TEsExportFormat] of string =
    ('.xlsx', '.pdf', '.html', '.csv', '.xml', '.txt');
  EsExportDescriptions: array[TEsExportFormat] of string =
    ('Excel', 'PDF', 'HTML', 'CSV', 'XML', 'texto');
  EsExportFilters: array[TEsExportFormat] of string =
    ('Excel (*.xlsx)|*.xlsx', 'PDF (*.pdf)|*.pdf', 'HTML (*.html)|*.html;*.htm',
     'CSV (*.csv)|*.csv', 'XML (*.xml)|*.xml', 'Texto (*.txt)|*.txt');

procedure EsExportToExcel(AData: TEsExportData; const AFileName: string);
procedure EsExportToPDF(AData: TEsExportData; const AFileName: string;
  const AOptions: TEsReportOptions);
procedure EsExportToHTML(AData: TEsExportData; const AFileName, ATitle: string);
procedure EsExportToCSV(AData: TEsExportData; const AFileName: string; ASeparator: Char = ';');
procedure EsExportToXML(AData: TEsExportData; const AFileName: string);
procedure EsExportToText(AData: TEsExportData; const AFileName: string);
{ atalho: exporta a grade no formato pedido }
procedure EsExportGrid(AGrid: TEsGrid; AFormat: TEsExportFormat;
  const AFileName: string; const AOptions: TEsReportOptions);

function EsDefaultReportOptions: TEsReportOptions;
function EsEscapeXml(const S: string): string;

resourcestring
  rsEsRptIssued = 'Emitido em %s às %s';
  rsEsRptPage = 'Página No.: %d';

implementation

const
  MM = 72 / 25.4;
  RptMarginX = 10 * MM;
  RptTableTop = 24 * MM;
  RptMarginBottom = 12 * MM;
  RptFontSize = 8;
  RptHeaderFontSize = 9;
  RptRowHeight = 14;

var
  InvFS: TFormatSettings;

function EsDefaultReportOptions: TEsReportOptions;
begin
  Result.CompanyName := '';
  Result.TitleReport := '';
  Result.Orientation := spoLandscape;
  Result.Paper := spsA4;
  Result.PdfFontMode := pfmAuto;
  Result.PdfFontFile := '';
  Result.PdfBoldFontFile := '';
end;

function EsEscapeXml(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    case S[I] of
      '&': Result := Result + '&amp;';
      '<': Result := Result + '&lt;';
      '>': Result := Result + '&gt;';
      '"': Result := Result + '&quot;';
      #0..#8, #11, #12, #14..#31: ; // inválidos em XML
    else
      Result := Result + S[I];
    end;
end;

procedure SaveText(const AFileName, AText: string; ABom: Boolean = False);
const
  Bom: array[0..2] of Byte = ($EF, $BB, $BF);
var
  F: TFileStream;
  B: TBytes;
begin
  // os arquivos são sempre gravados em UTF-8
  B := TEncoding.UTF8.GetBytes(AText);
  F := TFileStream.Create(AFileName, fmCreate);
  try
    if ABom then F.WriteBuffer(Bom, 3);
    if Length(B) > 0 then F.WriteBuffer(B[0], Length(B));
  finally
    F.Free;
  end;
end;

{ TEsExportData }

constructor TEsExportData.Create(AGrid: TEsGrid);
var
  Cols: TArray<TEsGridColumn>;
  I, J, N, Rec: Integer;
  C: TEsGridColumn;
begin
  inherited Create;
  SetLength(Cols, 0);
  // colunas agrupadas (ocultas na grade) entram na exportação
  for I := 0 to AGrid.GroupCount - 1 do
  begin
    SetLength(Cols, Length(Cols) + 1);
    Cols[High(Cols)] := AGrid.GroupColumn(I);
  end;
  for I := 0 to AGrid.VisibleColumnCount - 1 do
  begin
    SetLength(Cols, Length(Cols) + 1);
    Cols[High(Cols)] := AGrid.VisibleColumn(I);
  end;
  SetLength(Columns, Length(Cols));
  for I := 0 to High(Cols) do
  begin
    C := Cols[I];
    Columns[I].Column := C;
    Columns[I].Title := C.DisplayTitle;
    Columns[I].Key := C.LayoutKey;
    Columns[I].Kind := C.ResolvedKind;
    Columns[I].Numeric := Columns[I].Kind = dkNumber;
    Columns[I].Align := C.ResolvedAlignment;
    Columns[I].Width := C.Width;
  end;
  N := AGrid.ViewRecordCount;
  SetLength(Values, N);
  SetLength(Texts, N);
  for J := 0 to N - 1 do
  begin
    Rec := AGrid.ViewRecordIndex(J);
    SetLength(Values[J], Length(Cols));
    SetLength(Texts[J], Length(Cols));
    for I := 0 to High(Cols) do
    begin
      Values[J][I] := AGrid.GetCellValue(Rec, Cols[I]);
      Texts[J][I] := AGrid.DisplayText(Rec, Cols[I]);
    end;
  end;
  HasFooter := AGrid.HasFooterSummaries;
  SetLength(Bands, Length(Cols));
  HasBands := False;
  for I := 0 to High(Cols) do
    if AGrid.ColumnBand(Cols[I]) <> nil then
    begin
      Bands[I] := AGrid.ColumnBand(Cols[I]).Caption;
      HasBands := True;
    end
    else
      Bands[I] := '';
  SetLength(Footer, Length(Cols));
  if HasFooter then
    for I := 0 to High(Cols) do
      Footer[I] := AGrid.SummaryText(Cols[I], 0, N - 1);
end;

function TEsExportData.BandSpan(AStart: Integer): Integer;
begin
  Result := 1;
  while (AStart + Result < Length(Bands)) and (Bands[AStart + Result] = Bands[AStart]) do
    Inc(Result);
end;

function TEsExportData.ColCount: Integer;
begin
  Result := Length(Columns);
end;

function TEsExportData.RowCount: Integer;
begin
  Result := Length(Texts);
end;

{ TEsCanvasReportTarget }

constructor TEsCanvasReportTarget.Create(ACanvas: TCanvas; APixelsPerInch: Integer);
begin
  inherited Create;
  FCanvas := ACanvas;
  FScale := APixelsPerInch / 72;
end;

procedure TEsCanvasReportTarget.SetFont(ASize: Single; ABold: Boolean);
begin
  FCanvas.Font.Name := 'Arial';
  FCanvas.Font.Height := -Max(1, Round(ASize * FScale));
  if ABold then FCanvas.Font.Style := [fsBold] else FCanvas.Font.Style := [];
  FCanvas.Font.Color := clBlack;
end;

procedure TEsCanvasReportTarget.BeginPage(AWidthPt, AHeightPt: Single);
begin
  if (FPageCount > 0) and Assigned(FOnNewPage) then
    FOnNewPage(Self);
  Inc(FPageCount);
end;

procedure TEsCanvasReportTarget.EndPage;
begin
end;

function TEsCanvasReportTarget.TextWidth(const S: string; ASize: Single;
  ABold: Boolean): Single;
begin
  SetFont(ASize, ABold);
  Result := FCanvas.TextWidth(S) / FScale;
end;

procedure TEsCanvasReportTarget.DrawText(X, Y: Single; const S: string;
  ASize: Single; ABold: Boolean);
var
  Asc: Integer;
begin
  SetFont(ASize, ABold);
  FCanvas.Brush.Style := bsClear;
  Asc := Round(FCanvas.TextHeight('Ag') * 0.78);
  FCanvas.TextOut(FOffsetX + Round(X * FScale), FOffsetY + Round(Y * FScale) - Asc, S);
  FCanvas.Brush.Style := bsSolid;
end;

procedure TEsCanvasReportTarget.FillRect(X, Y, W, H: Single; AGray: Byte);
begin
  FCanvas.Brush.Style := bsSolid;
  FCanvas.Brush.Color := TColor(AGray or (AGray shl 8) or (AGray shl 16));
  FCanvas.FillRect(Rect(FOffsetX + Round(X * FScale), FOffsetY + Round(Y * FScale),
    FOffsetX + Round((X + W) * FScale), FOffsetY + Round((Y + H) * FScale)));
end;

procedure TEsCanvasReportTarget.DrawLine(X1, Y1, X2, Y2: Single; AGray: Byte;
  AWidth: Single);
begin
  FCanvas.Pen.Style := psSolid;
  FCanvas.Pen.Color := TColor(AGray or (AGray shl 8) or (AGray shl 16));
  FCanvas.Pen.Width := Max(1, Round(AWidth * FScale));
  EsLine(FCanvas, FOffsetX + Round(X1 * FScale), FOffsetY + Round(Y1 * FScale),
    FOffsetX + Round(X2 * FScale), FOffsetY + Round(Y2 * FScale));
end;

{ TEsPdfReportTarget }

constructor TEsPdfReportTarget.Create;
begin
  inherited Create;
  FPages := TStringList.Create;
  FFallbackFiles := TStringList.Create;
  FAutoFallback := True;
  FCompress := True;
  FMeasure := TBitmap.Create;
  FMeasure.SetSize(4, 4);
  // Arial / Liberation Sans têm as mesmas métricas da Helvetica do PDF
  FMeasure.Canvas.Font.Name := 'Arial';
  FMeasure.Canvas.Font.Height := -1000;
end;

destructor TEsPdfReportTarget.Destroy;
var
  I: Integer;
begin
  for I := 0 to High(FFonts) do
    FFonts[I].Free;
  FFallbackNames.Free;
  FFallbackFiles.Free;
  FMeasure.Free;
  FPages.Free;
  inherited Destroy;
end;

class function TEsPdfReportTarget.NeedsUnicode(const S: string): Boolean;
var
  CP: TEsCodePoints;
  I: Integer;
begin
  CP := EsCodePoints(S);
  for I := 0 to High(CP) do
    case CP[I] of
      0..$7F, $A0..$FF, $152, $153, $160, $161, $178, $17D, $17E, $192, $2C6, $2DC,
      $2013, $2014, $2018..$201A, $201C..$201E, $2020..$2022, $2026, $2030, $2039,
      $203A, $20AC, $2122: ;
    else
      Exit(True);
    end;
  Result := False;
end;

procedure TEsPdfReportTarget.SetFontMode(AValue: TEsPdfFontMode);
begin
  FFontMode := AValue;
  if AValue = pfmEmbedded then LoadFonts;
end;

procedure TEsPdfReportTarget.SetFallbackFiles(AValue: TStrings);
begin
  FFallbackFiles.Assign(AValue);
end;

function LoadTTF(const AFileName: string): TEsTrueTypeFont;
begin
  Result := nil;
  if (AFileName = '') or not FileExists(AFileName) then Exit;
  Result := TEsTrueTypeFont.Create;
  if not Result.TryLoadFromFile(AFileName) then
    FreeAndNil(Result);
end;

procedure TEsPdfReportTarget.LoadFonts;
var
  F: string;
begin
  if Length(FFonts) > 0 then Exit;
  SetLength(FFonts, 2);
  F := FFontFile;
  if F = '' then F := EsFindSystemFont(False);
  FFonts[0] := LoadTTF(F);
  if FFonts[0] = nil then
  begin
    // sem nenhuma fonte TrueType: volta para a Helvetica
    SetLength(FFonts, 0);
    Exit;
  end;
  F := FBoldFontFile;
  if (F = '') and (FFontFile = '') then F := EsFindSystemFont(True);
  FFonts[1] := LoadTTF(F);
end;

function TEsPdfReportTarget.Embedded: Boolean;
begin
  Result := (FFontMode = pfmEmbedded) and (Length(FFonts) > 0);
end;

function TEsPdfReportTarget.Resolve(ACodePoint: Cardinal; ABold: Boolean;
  out AGlyph: Integer): Integer;
var
  I: Integer;
  L: TStringList;
  Fnt: TEsTrueTypeFont;
begin
  if ABold and (FFonts[1] <> nil) then Result := 1 else Result := 0;
  AGlyph := FFonts[Result].GlyphOf(ACodePoint);
  if (AGlyph <> 0) or (ACodePoint < 32) then Exit;
  // caractere ausente: tenta as fontes de reserva (carregadas sob demanda)
  for I := 2 to High(FFonts) do
  begin
    AGlyph := FFonts[I].GlyphOf(ACodePoint);
    if AGlyph <> 0 then Exit(I);
  end;
  if not FFallbackScanned then
  begin
    FFallbackScanned := True;
    FFallbackNames := TStringList.Create;
    FFallbackNames.AddStrings(FFallbackFiles);
    if FAutoFallback then
    begin
      L := EsFallbackFontFiles;
      try
        FFallbackNames.AddStrings(L);
      finally
        L.Free;
      end;
    end;
  end;
  while FFallbackNames.Count > 0 do
  begin
    Fnt := LoadTTF(FFallbackNames[0]);
    FFallbackNames.Delete(0);
    if Fnt = nil then Continue;
    SetLength(FFonts, Length(FFonts) + 1);
    FFonts[High(FFonts)] := Fnt;
    AGlyph := Fnt.GlyphOf(ACodePoint);
    if AGlyph <> 0 then Exit(High(FFonts));
  end;
  // nenhuma fonte tem o caractere: .notdef da fonte principal
  if ABold and (FFonts[1] <> nil) then Result := 1 else Result := 0;
  AGlyph := 0;
end;

function TEsPdfReportTarget.Num(V: Single): string;
begin
  Result := FormatFloat('0.##', V, InvFS);
end;

{ texto em Windows-1252, um caractere (< 256) por byte }
function ToWinAnsi(const S: string): string;
var
  B: TBytes;
  I: Integer;
  E: TEncoding;
begin
  E := TEncoding.GetEncoding(1252); // instância nova: liberar
  try
    B := E.GetBytes(S);
  finally
    E.Free;
  end;
  SetLength(Result, Length(B));
  for I := 0 to High(B) do
    Result[I + 1] := Char(B[I]);
end;

{ bytes de uma string cujos caracteres são todos < 256 }
function PdfBytes(const S: string): TBytes;
var
  I: Integer;
begin
  Result := nil;
  SetLength(Result, Length(S));
  for I := 1 to Length(S) do
    Result[I - 1] := Byte(Ord(S[I]));
end;

function TEsPdfReportTarget.PdfString(const S: string): string;
var
  A: string;
  I: Integer;
begin
  A := ToWinAnsi(S);
  Result := '(';
  for I := 1 to Length(A) do
    case A[I] of
      '(', ')', '\': Result := Result + '\' + A[I];
      #10, #13: Result := Result + ' ';
    else
      Result := Result + A[I];
    end;
  Result := Result + ')';
end;

procedure TEsPdfReportTarget.BeginPage(AWidthPt, AHeightPt: Single);
begin
  FCurrent := '';
  FPageH := AHeightPt;
  SetLength(FPageSizes, Length(FPageSizes) + 1);
  FPageSizes[High(FPageSizes)].X := AWidthPt;
  FPageSizes[High(FPageSizes)].Y := AHeightPt;
end;

procedure TEsPdfReportTarget.EndPage;
begin
  FPages.Add(FCurrent);
  FCurrent := '';
end;

procedure PdfShapeArabic(var CP: TEsCodePoints; out B1, B2: TEsCodePoints); forward;

function TEsPdfReportTarget.TextWidth(const S: string; ASize: Single;
  ABold: Boolean): Single;
var
  CP, B1, B2: TEsCodePoints;
  I, G, F, Sum: Integer;
begin
  if Embedded then
  begin
    CP := EsCodePoints(S);
    PdfShapeArabic(CP, B1, B2);
    Sum := 0;
    for I := 0 to High(CP) do
    begin
      F := Resolve(CP[I], ABold, G);
      Inc(Sum, FFonts[F].Advance(G));
    end;
    Exit(Sum * ASize / 1000);
  end;
  if ABold then
    FMeasure.Canvas.Font.Style := [fsBold]
  else
    FMeasure.Canvas.Font.Style := [];
  Result := FMeasure.Canvas.TextWidth(S) * ASize / 1000;
end;

procedure TEsPdfReportTarget.DrawText(X, Y: Single; const S: string;
  ASize: Single; ABold: Boolean);
begin
  if S = '' then Exit;
  if FTextCount >= Length(FTexts) then
    SetLength(FTexts, Max(64, Length(FTexts) * 2));
  FTexts[FTextCount].Text := S;
  FTexts[FTextCount].Size := ASize;
  FTexts[FTextCount].Bold := ABold;
  // a fonte e o texto são codificados só na gravação; aqui fica um marcador
  FCurrent := FCurrent + Format('0 g BT 1 0 0 1 %s %s Tm '#1'%d'#2' ET'#10,
    [Num(X), Num(FPageH - Y), FTextCount]);
  Inc(FTextCount);
end;

procedure TEsPdfReportTarget.FillRect(X, Y, W, H: Single; AGray: Byte);
begin
  FCurrent := FCurrent + Format('%s g %s %s %s %s re f'#10,
    [Num(AGray / 255), Num(X), Num(FPageH - Y - H), Num(W), Num(H)]);
end;

procedure TEsPdfReportTarget.DrawLine(X1, Y1, X2, Y2: Single; AGray: Byte;
  AWidth: Single);
begin
  FCurrent := FCurrent + Format('%s G %s w %s %s m %s %s l S'#10,
    [Num(AGray / 255), Num(AWidth), Num(X1), Num(FPageH - Y1), Num(X2), Num(FPageH - Y2)]);
end;

function IsRtl(C: Cardinal): Boolean;
begin
  Result := ((C >= $0590) and (C <= $08FF)) or ((C >= $FB1D) and (C <= $FDFF)) or
    ((C >= $FE70) and (C <= $FEFF));
end;

{ ordem visual simplificada: trechos da direita para a esquerda (hebraico,
  árabe) são invertidos; espaços e pontuação entre letras RTL ficam no trecho }
{ ---------- formas contextuais do árabe (Presentation Forms) ---------- }

type
  TArabicForms = record
    Code: Word;
    Iso, Fin, Ini, Med: Word;  // Ini = 0: só liga com a letra anterior (R)
  end;

const
  ArabicTable: array[0..48] of TArabicForms = (
    (Code: $0621; Iso: $FE80; Fin: 0; Ini: 0; Med: 0),
    (Code: $0622; Iso: $FE81; Fin: $FE82; Ini: 0; Med: 0),
    (Code: $0623; Iso: $FE83; Fin: $FE84; Ini: 0; Med: 0),
    (Code: $0624; Iso: $FE85; Fin: $FE86; Ini: 0; Med: 0),
    (Code: $0625; Iso: $FE87; Fin: $FE88; Ini: 0; Med: 0),
    (Code: $0626; Iso: $FE89; Fin: $FE8A; Ini: $FE8B; Med: $FE8C),
    (Code: $0627; Iso: $FE8D; Fin: $FE8E; Ini: 0; Med: 0),
    (Code: $0628; Iso: $FE8F; Fin: $FE90; Ini: $FE91; Med: $FE92),
    (Code: $0629; Iso: $FE93; Fin: $FE94; Ini: 0; Med: 0),
    (Code: $062A; Iso: $FE95; Fin: $FE96; Ini: $FE97; Med: $FE98),
    (Code: $062B; Iso: $FE99; Fin: $FE9A; Ini: $FE9B; Med: $FE9C),
    (Code: $062C; Iso: $FE9D; Fin: $FE9E; Ini: $FE9F; Med: $FEA0),
    (Code: $062D; Iso: $FEA1; Fin: $FEA2; Ini: $FEA3; Med: $FEA4),
    (Code: $062E; Iso: $FEA5; Fin: $FEA6; Ini: $FEA7; Med: $FEA8),
    (Code: $062F; Iso: $FEA9; Fin: $FEAA; Ini: 0; Med: 0),
    (Code: $0630; Iso: $FEAB; Fin: $FEAC; Ini: 0; Med: 0),
    (Code: $0631; Iso: $FEAD; Fin: $FEAE; Ini: 0; Med: 0),
    (Code: $0632; Iso: $FEAF; Fin: $FEB0; Ini: 0; Med: 0),
    (Code: $0633; Iso: $FEB1; Fin: $FEB2; Ini: $FEB3; Med: $FEB4),
    (Code: $0634; Iso: $FEB5; Fin: $FEB6; Ini: $FEB7; Med: $FEB8),
    (Code: $0635; Iso: $FEB9; Fin: $FEBA; Ini: $FEBB; Med: $FEBC),
    (Code: $0636; Iso: $FEBD; Fin: $FEBE; Ini: $FEBF; Med: $FEC0),
    (Code: $0637; Iso: $FEC1; Fin: $FEC2; Ini: $FEC3; Med: $FEC4),
    (Code: $0638; Iso: $FEC5; Fin: $FEC6; Ini: $FEC7; Med: $FEC8),
    (Code: $0639; Iso: $FEC9; Fin: $FECA; Ini: $FECB; Med: $FECC),
    (Code: $063A; Iso: $FECD; Fin: $FECE; Ini: $FECF; Med: $FED0),
    (Code: $0640; Iso: $0640; Fin: $0640; Ini: $0640; Med: $0640),
    (Code: $0641; Iso: $FED1; Fin: $FED2; Ini: $FED3; Med: $FED4),
    (Code: $0642; Iso: $FED5; Fin: $FED6; Ini: $FED7; Med: $FED8),
    (Code: $0643; Iso: $FED9; Fin: $FEDA; Ini: $FEDB; Med: $FEDC),
    (Code: $0644; Iso: $FEDD; Fin: $FEDE; Ini: $FEDF; Med: $FEE0),
    (Code: $0645; Iso: $FEE1; Fin: $FEE2; Ini: $FEE3; Med: $FEE4),
    (Code: $0646; Iso: $FEE5; Fin: $FEE6; Ini: $FEE7; Med: $FEE8),
    (Code: $0647; Iso: $FEE9; Fin: $FEEA; Ini: $FEEB; Med: $FEEC),
    (Code: $0648; Iso: $FEED; Fin: $FEEE; Ini: 0; Med: 0),
    (Code: $0649; Iso: $FEEF; Fin: $FEF0; Ini: 0; Med: 0),
    (Code: $064A; Iso: $FEF1; Fin: $FEF2; Ini: $FEF3; Med: $FEF4),
    // persa / urdu (Presentation Forms-A)
    (Code: $067E; Iso: $FB56; Fin: $FB57; Ini: $FB58; Med: $FB59),
    (Code: $0686; Iso: $FB7A; Fin: $FB7B; Ini: $FB7C; Med: $FB7D),
    (Code: $0698; Iso: $FB8A; Fin: $FB8B; Ini: 0; Med: 0),
    (Code: $06A9; Iso: $FB8E; Fin: $FB8F; Ini: $FB90; Med: $FB91),
    (Code: $06AF; Iso: $FB92; Fin: $FB93; Ini: $FB94; Med: $FB95),
    (Code: $06CC; Iso: $FBFC; Fin: $FBFD; Ini: $FBFE; Med: $FBFF),
    (Code: $0679; Iso: $FB66; Fin: $FB67; Ini: $FB68; Med: $FB69),
    (Code: $0688; Iso: $FB88; Fin: $FB89; Ini: 0; Med: 0),
    (Code: $0691; Iso: $FB8C; Fin: $FB8D; Ini: 0; Med: 0),
    (Code: $06BA; Iso: $FB9E; Fin: $FB9F; Ini: 0; Med: 0),
    (Code: $06BE; Iso: $FBAA; Fin: $FBAB; Ini: $FBAC; Med: $FBAD),
    (Code: $06D2; Iso: $FBAE; Fin: $FBAF; Ini: 0; Med: 0));

function ArabicIndex(C: Cardinal): Integer;
var
  I: Integer;
begin
  if (C < $0621) or (C > $06D2) then Exit(-1);
  for I := 0 to High(ArabicTable) do
    if ArabicTable[I].Code = C then
      Exit(I);
  Result := -1;
end;

{ sinais diacríticos: não interrompem a ligação entre as letras }
function IsArabicMark(C: Cardinal): Boolean;
begin
  Result := ((C >= $064B) and (C <= $065F)) or (C = $0670) or
    ((C >= $06D6) and (C <= $06ED));
end;

{ troca cada letra árabe pela forma isolada/inicial/medial/final e junta
  lam + alef em ligadura. B1/B2 guardam o(s) caractere(s) original(is) de
  cada posição (para copiar o texto do PDF). }
procedure PdfShapeArabic(var CP: TEsCodePoints; out B1, B2: TEsCodePoints);
var
  I, J, N, Idx, PrevIdx, NextIdx, K: Integer;
  JoinPrev, JoinNext: Boolean;
  Out1, Base1, Base2: TEsCodePoints;
  C: Cardinal;

  function Neighbor(AFrom, ADir: Integer): Integer;
  var
    P: Integer;
  begin
    P := AFrom + ADir;
    while (P >= 0) and (P <= High(CP)) and IsArabicMark(CP[P]) do Inc(P, ADir);
    if (P < 0) or (P > High(CP)) then Exit(-1);
    Result := ArabicIndex(CP[P]);
  end;

  function NextLetterPos(AFrom: Integer): Integer;
  begin
    Result := AFrom + 1;
    while (Result <= High(CP)) and IsArabicMark(CP[Result]) do Inc(Result);
  end;

begin
  SetLength(Out1, Length(CP));
  SetLength(Base1, Length(CP));
  SetLength(Base2, Length(CP));
  N := 0;
  I := 0;
  while I <= High(CP) do
  begin
    C := CP[I];
    Idx := ArabicIndex(C);
    Base1[N] := C;
    Base2[N] := 0;
    if Idx < 0 then
    begin
      Out1[N] := C;
      Inc(N);
      Inc(I);
      Continue;
    end;
    PrevIdx := Neighbor(I, -1);
    // a anterior liga para a frente se tiver forma inicial/medial (D)
    JoinPrev := (PrevIdx >= 0) and (ArabicTable[PrevIdx].Ini <> 0) and
      (ArabicTable[Idx].Fin <> 0);
    // lam + alef -> ligadura
    if C = $0644 then
    begin
      J := NextLetterPos(I);
      if J <= High(CP) then
      begin
        K := 0;
        case CP[J] of
          $0622: K := $FEF5;
          $0623: K := $FEF7;
          $0625: K := $FEF9;
          $0627: K := $FEFB;
        end;
        if K <> 0 then
        begin
          if JoinPrev then Inc(K);  // forma final da ligadura
          Out1[N] := K;
          Base2[N] := CP[J];
          Inc(N);
          I := J + 1;
          Continue;
        end;
      end;
    end;
    NextIdx := Neighbor(I, 1);
    JoinNext := (ArabicTable[Idx].Ini <> 0) and (NextIdx >= 0) and
      (ArabicTable[NextIdx].Fin <> 0);
    if JoinPrev and JoinNext then Out1[N] := ArabicTable[Idx].Med
    else if JoinPrev then Out1[N] := ArabicTable[Idx].Fin
    else if JoinNext then Out1[N] := ArabicTable[Idx].Ini
    else Out1[N] := ArabicTable[Idx].Iso;
    Inc(N);
    Inc(I);
  end;
  SetLength(Out1, N);
  SetLength(Base1, N);
  SetLength(Base2, N);
  CP := Out1;
  B1 := Base1;
  B2 := Base2;
end;

procedure PdfVisualOrderEx(var CP, B1, B2: TEsCodePoints); forward;

procedure PdfVisualOrder(var CP: TEsCodePoints);
var
  B1, B2: TEsCodePoints;
begin
  B1 := nil;
  B2 := nil;
  PdfVisualOrderEx(CP, B1, B2);
end;

procedure PdfVisualOrderEx(var CP, B1, B2: TEsCodePoints);
var
  I, J, K, Last: Integer;
  T: Cardinal;
begin
  I := 0;
  while I <= High(CP) do
  begin
    if not IsRtl(CP[I]) then
    begin
      Inc(I);
      Continue;
    end;
    // estende até a última letra RTL antes de um caractere "forte" LTR
    Last := I;
    J := I + 1;
    while J <= High(CP) do
    begin
      if IsRtl(CP[J]) then Last := J
      else if ((CP[J] >= Ord('0')) and (CP[J] <= Ord('9'))) or
              ((CP[J] >= Ord('A')) and (CP[J] <= Ord('Z'))) or
              ((CP[J] >= Ord('a')) and (CP[J] <= Ord('z'))) or (CP[J] >= $C0) then
        Break;
      Inc(J);
    end;
    J := I;
    K := Last;
    while J < K do
    begin
      T := CP[J];
      CP[J] := CP[K];
      CP[K] := T;
      if Length(B1) = Length(CP) then
      begin
        T := B1[J]; B1[J] := B1[K]; B1[K] := T;
        T := B2[J]; B2[J] := B2[K]; B2[K] := T;
      end;
      Inc(J);
      Dec(K);
    end;
    I := Last + 1;
  end;
end;

function PdfDeflate(const B: TBytes): TBytes;
var
  Dst: TMemoryStream;
  Z: TCompressionStream;
begin
  Result := nil;
  Dst := TMemoryStream.Create;
  try
    Z := TCompressionStream.Create(System.ZLib.clDefault, Dst);
    try
      if Length(B) > 0 then Z.WriteBuffer(B[0], Length(B));
    finally
      Z.Free;
    end;
    SetLength(Result, Dst.Size);
    if Dst.Size > 0 then Move(Dst.Memory^, Result[0], Dst.Size);
  finally
    Dst.Free;
  end;
end;

procedure TEsPdfReportTarget.SaveToStream(AStream: TStream);
var
  Offsets: TArray<Int64>;
  NObj: Integer;
  // por fonte: glifos usados e glifo -> 1º caractere (para o ToUnicode)
  Glyphs: TArray<TArray<Integer>>;
  GlyphUni: TArray<TArray<string>>;  // UTF-16 (hex) de cada glifo
  FontRef: TArray<Integer>;
  Encoded: TArray<string>;
  I, J, P, Q, NPages, PagesObj, Idx, F, Cur, G, NF: Integer;
  Kids, Buf, Hex, FontRes: string;
  StartXRef: Int64;
  CP, B1, B2: TEsCodePoints;

  procedure WB(const B: TBytes);
  begin
    if Length(B) > 0 then AStream.WriteBuffer(B[0], Length(B));
  end;

  procedure W(const S: string);
  begin
    WB(PdfBytes(S));
  end;

  function NewObj: Integer;
  begin
    Inc(NObj);
    if NObj >= Length(Offsets) then SetLength(Offsets, NObj + 32);
    Result := NObj;
  end;

  procedure BeginObj(N: Integer);
  begin
    Offsets[N] := AStream.Position;
    W(IntToStr(N) + ' 0 obj'#10);
  end;

  procedure WriteStream(N: Integer; const AData: TBytes; const AExtraDict: string);
  var
    D: TBytes;
  begin
    BeginObj(N);
    if FCompress then
    begin
      D := PdfDeflate(AData);
      W('<< /Length ' + IntToStr(Length(D)) + ' /Filter /FlateDecode' + AExtraDict + ' >>'#10'stream'#10);
    end
    else
    begin
      D := AData;
      W('<< /Length ' + IntToStr(Length(D)) + AExtraDict + ' >>'#10'stream'#10);
    end;
    WB(D);
    W(#10'endstream'#10'endobj'#10);
  end;

  function Hex4(V: Cardinal): string;
  begin
    Result := IntToHex(Integer(V and $FFFF), 4);
  end;

  function Utf16Hex(C: Cardinal): string;
  begin
    if C >= $10000 then
    begin
      Dec(C, $10000);
      Result := Hex4($D800 + (C shr 10)) + Hex4($DC00 + (C and $3FF));
    end
    else
      Result := Hex4(C);
  end;

  procedure UseGlyph(AFont, AGlyph: Integer; const ACode: string);
  begin
    if (AGlyph <= 0) or (AGlyph >= Length(GlyphUni[AFont])) or (GlyphUni[AFont][AGlyph] <> '') then
      Exit;
    GlyphUni[AFont][AGlyph] := ACode;
    SetLength(Glyphs[AFont], Length(Glyphs[AFont]) + 1);
    Glyphs[AFont][High(Glyphs[AFont])] := AGlyph;
  end;

  { escreve a fonte Type0 (Identity-H) e devolve o número do objeto }
  function WriteFont(AIndex: Integer): Integer;
  var
    Fn: TEsTrueTypeFont;
    Desc, CID, FF, TU, K, Run, Q2: Integer;
    Widths, CMap, Tag: string;
    FontData: TBytes;
    List: TArray<Integer>;
  begin
    Fn := FFonts[AIndex];
    List := Copy(Glyphs[AIndex]);
    for K := 1 to High(List) do  // ordena (inserção)
    begin
      Run := List[K];
      Q2 := K - 1;
      while (Q2 >= 0) and (List[Q2] > Run) do
      begin
        List[Q2 + 1] := List[Q2];
        Dec(Q2);
      end;
      List[Q2 + 1] := Run;
    end;
    // prefixo de subconjunto: 6 letras maiúsculas distintas por fonte
    Tag := 'ESKIT' + Chr(Ord('A') + AIndex mod 26) + '+' + Fn.PostScriptName;
    Result := NewObj;
    CID := NewObj;
    Desc := NewObj;
    FF := NewObj;
    TU := NewObj;
    BeginObj(Result);
    W(Format('<< /Type /Font /Subtype /Type0 /BaseFont /%s /Encoding /Identity-H ' +
      '/DescendantFonts [%d 0 R] /ToUnicode %d 0 R >>'#10'endobj'#10, [Tag, CID, TU]));
    Widths := '';
    for K := 0 to High(List) do
      Widths := Widths + Format('%d [%d] ', [List[K], Fn.Advance(List[K])]);
    BeginObj(CID);
    W(Format('<< /Type /Font /Subtype /CIDFontType2 /BaseFont /%s ' +
      '/CIDSystemInfo << /Registry (Adobe) /Ordering (Identity) /Supplement 0 >> ' +
      '/FontDescriptor %d 0 R /CIDToGIDMap /Identity /DW %d /W [%s] >>'#10'endobj'#10,
      [Tag, Desc, Fn.Advance(0), Widths]));
    BeginObj(Desc);
    W(Format('<< /Type /FontDescriptor /FontName /%s /Flags 32 /FontBBox [%d %d %d %d] ' +
      '/ItalicAngle 0 /Ascent %d /Descent %d /CapHeight %d /StemV %d /FontFile2 %d 0 R >>'#10'endobj'#10,
      [Tag, Fn.BBox(0), Fn.BBox(1), Fn.BBox(2), Fn.BBox(3), Fn.Ascent, Fn.Descent, Fn.CapHeight,
       IfThen(AIndex = 1, 140, 80), FF]));
    FontData := Fn.Subset(List);
    WriteStream(FF, FontData, ' /Length1 ' + IntToStr(Length(FontData)));
    // ToUnicode: glifo -> texto (copiar/pesquisar no leitor)
    CMap := '/CIDInit /ProcSet findresource begin'#10'12 dict begin'#10'begincmap'#10 +
      '/CIDSystemInfo << /Registry (Adobe) /Ordering (UCS) /Supplement 0 >> def'#10 +
      '/CMapName /Adobe-Identity-UCS def'#10'/CMapType 2 def'#10 +
      '1 begincodespacerange'#10'<0000> <FFFF>'#10'endcodespacerange'#10;
    K := 0;
    while K <= High(List) do
    begin
      Run := Min(100, Length(List) - K);
      CMap := CMap + IntToStr(Run) + ' beginbfchar'#10;
      for Q2 := K to K + Run - 1 do
        CMap := CMap + '<' + Hex4(List[Q2]) + '> <' + GlyphUni[AIndex][List[Q2]] + '>'#10;
      CMap := CMap + 'endbfchar'#10;
      Inc(K, Run);
    end;
    CMap := CMap + 'endcmap'#10'CMapName currentdict /CMap defineresource pop'#10'end'#10'end';
    WriteStream(TU, PdfBytes(CMap), '');
  end;

  function RunPrefix(AFont: Integer; const AText: TEsPdfText): string;
  begin
    Result := Format('/F%d %s Tf ', [AFont + 1, Num(AText.Size)]);
    // negrito sem arquivo próprio: contorno + preenchimento
    if AText.Bold and (AFont <> 1) then
      Result := Result + Format('2 Tr %s w 0 G ', [Num(AText.Size / 30)])
    else
      Result := Result + '0 Tr ';
  end;

begin
  if FCurrent <> '' then EndPage;
  NPages := FPages.Count;
  NObj := 0;
  SetLength(Offsets, 32);
  // codifica os textos (as fontes de reserva podem ser carregadas aqui)
  SetLength(Encoded, FTextCount);
  if Embedded then
  begin
    for I := 0 to FTextCount - 1 do
    begin
      CP := EsCodePoints(FTexts[I].Text);
      PdfShapeArabic(CP, B1, B2);
      PdfVisualOrderEx(CP, B1, B2);
      Buf := '';
      Hex := '';
      Cur := -1;
      for J := 0 to High(CP) do
      begin
        if (CP[J] = 10) or (CP[J] = 13) then CP[J] := 32;
        F := Resolve(CP[J], FTexts[I].Bold, G);
        if F <> Cur then
        begin
          if Hex <> '' then Buf := Buf + '<' + Hex + '> Tj ';
          Buf := Buf + RunPrefix(F, FTexts[I]);
          Hex := '';
          Cur := F;
        end;
        Hex := Hex + Hex4(G);
      end;
      if Hex <> '' then Buf := Buf + '<' + Hex + '> Tj';
      Encoded[I] := Buf;
    end;
    NF := Length(FFonts);
    SetLength(Glyphs, NF);
    SetLength(GlyphUni, NF);
    for F := 0 to NF - 1 do
      if FFonts[F] <> nil then
        SetLength(GlyphUni[F], FFonts[F].NumGlyphs);
    // segunda passada: glifos usados por fonte
    for I := 0 to FTextCount - 1 do
    begin
      CP := EsCodePoints(FTexts[I].Text);
      PdfShapeArabic(CP, B1, B2);
      for J := 0 to High(CP) do
      begin
        if (CP[J] = 10) or (CP[J] = 13) then CP[J] := 32;
        F := Resolve(CP[J], FTexts[I].Bold, G);
        // o texto copiado do PDF volta às letras originais
        if B2[J] <> 0 then
          UseGlyph(F, G, Utf16Hex(B1[J]) + Utf16Hex(B2[J]))
        else
          UseGlyph(F, G, Utf16Hex(B1[J]));
      end;
    end;
  end
  else
  begin
    NF := 0;
    for I := 0 to FTextCount - 1 do
    begin
      if FTexts[I].Bold then Buf := '/F2' else Buf := '/F1';
      Encoded[I] := Format('%s %s Tf %s Tj', [Buf, Num(FTexts[I].Size), PdfString(FTexts[I].Text)]);
    end;
  end;
  W('%PDF-1.4'#10'%'#$E2#$E3#$CF#$D3#10);
  NewObj;             // 1 catálogo
  PagesObj := NewObj; // 2 árvore de páginas
  BeginObj(1);
  W('<< /Type /Catalog /Pages 2 0 R >>'#10'endobj'#10);
  // fontes
  FontRes := '';
  if Embedded then
  begin
    SetLength(FontRef, NF);
    for F := 0 to NF - 1 do
      if (FFonts[F] <> nil) and ((F = 0) or (Length(Glyphs[F]) > 0)) then
      begin
        FontRef[F] := WriteFont(F);
        FontRes := FontRes + Format('/F%d %d 0 R ', [F + 1, FontRef[F]]);
      end;
  end
  else
  begin
    I := NewObj;
    BeginObj(I);
    W('<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica /Encoding /WinAnsiEncoding >>'#10'endobj'#10);
    J := NewObj;
    BeginObj(J);
    W('<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold /Encoding /WinAnsiEncoding >>'#10'endobj'#10);
    FontRes := Format('/F1 %d 0 R /F2 %d 0 R ', [I, J]);
  end;
  Kids := '';
  for I := 0 to NPages - 1 do
  begin
    P := NewObj;
    Q := NewObj;
    Kids := Kids + IntToStr(P) + ' 0 R ';
    BeginObj(P);
    W(Format('<< /Type /Page /Parent %d 0 R /MediaBox [0 0 %s %s] ' +
      '/Resources << /Font << %s>> >> /Contents %d 0 R >>'#10'endobj'#10,
      [PagesObj, Num(FPageSizes[I].X), Num(FPageSizes[I].Y), FontRes, Q]));
    // troca os marcadores #1n#2 pelo texto codificado
    Buf := FPages[I];
    J := Pos(#1, Buf);
    while J > 0 do
    begin
      P := J + 1;
      while (P <= Length(Buf)) and (Buf[P] <> #2) do Inc(P);
      Idx := StrToInt(Copy(Buf, J + 1, P - J - 1));
      Buf := Copy(Buf, 1, J - 1) + Encoded[Idx] + Copy(Buf, P + 1, MaxInt);
      J := Pos(#1, Buf);
    end;
    WriteStream(Q, PdfBytes(Buf), '');
  end;
  BeginObj(PagesObj);
  W('<< /Type /Pages /Kids [' + Kids + '] /Count ' + IntToStr(NPages) + ' >>'#10'endobj'#10);
  StartXRef := AStream.Position;
  W('xref'#10'0 ' + IntToStr(NObj + 1) + #10);
  W('0000000000 65535 f '#10);
  for I := 1 to NObj do
    W(Format('%.10d 00000 n '#10, [Offsets[I]]));
  W('trailer'#10'<< /Size ' + IntToStr(NObj + 1) + ' /Root 1 0 R >>'#10);
  W('startxref'#10 + IntToStr(StartXRef) + #10'%%EOF'#10);
end;

procedure TEsPdfReportTarget.SaveToFile(const AFileName: string);
var
  F: TFileStream;
begin
  F := TFileStream.Create(AFileName, fmCreate);
  try
    SaveToStream(F);
  finally
    F.Free;
  end;
end;

{ TEsReportRenderer }

class procedure TEsReportRenderer.PaperSizePt(APaper: TEsPaperSize;
  AOrientation: TEsPageOrientation; out AWidth, AHeight: Single);
var
  T: Single;
begin
  case APaper of
    spsLetter: begin AWidth := 612; AHeight := 792; end;
    spsLegal: begin AWidth := 612; AHeight := 1008; end;
  else
    begin AWidth := 595.28; AHeight := 841.89; end;
  end;
  if AOrientation = spoLandscape then
  begin
    T := AWidth;
    AWidth := AHeight;
    AHeight := T;
  end;
end;

class function TEsReportRenderer.Render(AData: TEsExportData;
  const AOptions: TEsReportOptions; ATarget: TEsReportTarget; APageWidthPt,
  APageHeightPt: Single): Integer;
var
  ColW: TArray<Single>;
  ColX: TArray<Single>;
  Total, Avail, Scale, Y, TableW: Single;
  I, Row, NCols, NRows, PageNo, RowsPerPage, LastRows: Integer;
  Issued: string;

  function Fit(const S: string; W: Single; Bold: Boolean): string;
  const
    Ell = '…';
  var
    L: Integer;
  begin
    Result := S;
    if ATarget.TextWidth(S, RptFontSize, Bold) <= W then Exit;
    L := Length(S);
    while (L > 0) and (ATarget.TextWidth(Copy(S, 1, L) + Ell, RptFontSize, Bold) > W) do
      Dec(L);
    Result := Copy(S, 1, L) + Ell;
  end;

  procedure Cell(Col: Integer; YTop: Single; const S: string; Bold: Boolean);
  var
    T: string;
    TW, X: Single;
  begin
    T := Fit(S, ColW[Col] - 6, Bold);
    TW := ATarget.TextWidth(T, RptFontSize, Bold);
    case AData.Columns[Col].Align of
      taRightJustify: X := ColX[Col] + ColW[Col] - 3 - TW;
      taCenter: X := ColX[Col] + (ColW[Col] - TW) / 2;
    else
      X := ColX[Col] + 3;
    end;
    ATarget.DrawText(X, YTop + RptRowHeight - 4, T, RptFontSize, Bold);
  end;

  procedure RowLines(YTop: Single);
  var
    C: Integer;
  begin
    ATarget.DrawLine(RptMarginX, YTop + RptRowHeight, RptMarginX + TableW,
      YTop + RptRowHeight, 150, 0.5);
    for C := 0 to NCols - 1 do
      ATarget.DrawLine(ColX[C], YTop, ColX[C], YTop + RptRowHeight, 150, 0.5);
    ATarget.DrawLine(RptMarginX + TableW, YTop, RptMarginX + TableW,
      YTop + RptRowHeight, 150, 0.5);
  end;

  procedure PageHeader;
  var
    S: string;
  begin
    if AOptions.CompanyName <> '' then
      ATarget.DrawText(RptMarginX, 12 * MM, AOptions.CompanyName, RptHeaderFontSize, True);
    if AOptions.TitleReport <> '' then
      ATarget.DrawText(RptMarginX, 17 * MM, AOptions.TitleReport, RptHeaderFontSize, False);
    ATarget.DrawText(APageWidthPt - RptMarginX -
      ATarget.TextWidth(Issued, RptHeaderFontSize, False), 12 * MM, Issued,
      RptHeaderFontSize, False);
    S := Format(rsEsRptPage, [PageNo]);
    ATarget.DrawText(APageWidthPt - RptMarginX -
      ATarget.TextWidth(S, RptHeaderFontSize, False), 17 * MM, S, RptHeaderFontSize, False);
  end;

  procedure TableHeader;
  var
    C, N, K: Integer;
    W, TW: Single;
    T: string;
  begin
    if AData.HasBands then
    begin
      // linha das bandas (células mescladas sobre as colunas)
      ATarget.FillRect(RptMarginX, Y, TableW, RptRowHeight, 225);
      ATarget.DrawLine(RptMarginX, Y, RptMarginX + TableW, Y, 150, 0.5);
      C := 0;
      while C < NCols do
      begin
        N := AData.BandSpan(C);
        W := 0;
        for K := C to C + N - 1 do W := W + ColW[K];
        T := Fit(AData.Bands[C], W - 6, True);
        TW := ATarget.TextWidth(T, RptFontSize, True);
        ATarget.DrawText(ColX[C] + (W - TW) / 2, Y + RptRowHeight - 4, T, RptFontSize, True);
        ATarget.DrawLine(ColX[C], Y, ColX[C], Y + RptRowHeight, 150, 0.5);
        Inc(C, N);
      end;
      ATarget.DrawLine(RptMarginX + TableW, Y, RptMarginX + TableW, Y + RptRowHeight, 150, 0.5);
      Y := Y + RptRowHeight;
    end;
    ATarget.FillRect(RptMarginX, Y, TableW, RptRowHeight, 235);
    ATarget.DrawLine(RptMarginX, Y, RptMarginX + TableW, Y, 150, 0.5);
    for C := 0 to NCols - 1 do
      Cell(C, Y, AData.Columns[C].Title, True);
    RowLines(Y);
    Y := Y + RptRowHeight;
  end;

begin
  NCols := AData.ColCount;
  NRows := AData.RowCount;
  Issued := Format(rsEsRptIssued, [FormatDateTime('dd"/"mm"/"yyyy', Now),
    FormatDateTime('hh":"nn', Now)]);
  SetLength(ColW, NCols);
  SetLength(ColX, NCols);
  Total := 0;
  for I := 0 to NCols - 1 do
  begin
    ColW[I] := Max(20, AData.Columns[I].Width * 0.75);
    Total := Total + ColW[I];
  end;
  Avail := APageWidthPt - 2 * RptMarginX;
  if Total > Avail then Scale := Avail / Total else Scale := 1;
  TableW := 0;
  for I := 0 to NCols - 1 do
  begin
    ColW[I] := ColW[I] * Scale;
    ColX[I] := RptMarginX + TableW;
    TableW := TableW + ColW[I];
  end;
  RowsPerPage := Max(1, Floor((APageHeightPt - RptTableTop - RptMarginBottom) /
    RptRowHeight) - 1 - Ord(AData.HasBands)); // cabeçalho da tabela (+ bandas)
  PageNo := 0;
  Row := 0;
  repeat
    Inc(PageNo);
    ATarget.BeginPage(APageWidthPt, APageHeightPt);
    PageHeader;
    Y := RptTableTop;
    if NCols > 0 then
      TableHeader;
    LastRows := 0;
    while (Row < NRows) and (LastRows < RowsPerPage) do
    begin
      for I := 0 to NCols - 1 do
        Cell(I, Y, AData.Texts[Row][I], False);
      RowLines(Y);
      Y := Y + RptRowHeight;
      Inc(Row);
      Inc(LastRows);
    end;
    // rodapé de sumários na última página (se couber; senão nova página)
    if (Row >= NRows) and AData.HasFooter and (NCols > 0) then
    begin
      if LastRows >= RowsPerPage then
      begin
        ATarget.EndPage;
        Inc(PageNo);
        ATarget.BeginPage(APageWidthPt, APageHeightPt);
        PageHeader;
        Y := RptTableTop;
      end;
      ATarget.FillRect(RptMarginX, Y, TableW, RptRowHeight, 245);
      ATarget.DrawLine(RptMarginX, Y, RptMarginX + TableW, Y, 150, 0.5);
      for I := 0 to NCols - 1 do
        Cell(I, Y, AData.Footer[I], True);
      RowLines(Y);
    end;
    ATarget.EndPage;
  until Row >= NRows;
  Result := PageNo;
end;

{ ---------- exportadores ---------- }

function XlsxColName(AIndex: Integer): string;
begin
  Result := '';
  Inc(AIndex);
  while AIndex > 0 do
  begin
    Result := Chr(Ord('A') + (AIndex - 1) mod 26) + Result;
    AIndex := (AIndex - 1) div 26;
  end;
end;

procedure EsExportToExcel(AData: TEsExportData; const AFileName: string);
const
  XmlHead = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'#13#10;
  NsMain = 'http://schemas.openxmlformats.org/spreadsheetml/2006/main';
  NsRel = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships';
  NsPkg = 'http://schemas.openxmlformats.org/package/2006/relationships';
  // estilos: 0 normal, 1 cabeçalho, 2 data, 3 data/hora, 4 decimal, 5 inteiro, 6 rodapé
  StylesXml =
    '<styleSheet xmlns="' + NsMain + '">' +
    '<numFmts count="2"><numFmt numFmtId="164" formatCode="dd/mm/yyyy"/>' +
    '<numFmt numFmtId="165" formatCode="dd/mm/yyyy hh:mm"/></numFmts>' +
    '<fonts count="2"><font><sz val="11"/><name val="Calibri"/></font>' +
    '<font><b/><sz val="11"/><name val="Calibri"/></font></fonts>' +
    '<fills count="4"><fill><patternFill patternType="none"/></fill>' +
    '<fill><patternFill patternType="gray125"/></fill>' +
    '<fill><patternFill patternType="solid"><fgColor rgb="FFEBEBEB"/><bgColor indexed="64"/></patternFill></fill>' +
    '<fill><patternFill patternType="solid"><fgColor rgb="FFF5F5F5"/><bgColor indexed="64"/></patternFill></fill></fills>' +
    '<borders count="1"><border><left/><right/><top/><bottom/><diagonal/></border></borders>' +
    '<cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>' +
    '<cellXfs count="7">' +
    '<xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/>' +
    '<xf numFmtId="0" fontId="1" fillId="2" borderId="0" xfId="0" applyFont="1" applyFill="1"/>' +
    '<xf numFmtId="164" fontId="0" fillId="0" borderId="0" xfId="0" applyNumberFormat="1"/>' +
    '<xf numFmtId="165" fontId="0" fillId="0" borderId="0" xfId="0" applyNumberFormat="1"/>' +
    '<xf numFmtId="4" fontId="0" fillId="0" borderId="0" xfId="0" applyNumberFormat="1"/>' +
    '<xf numFmtId="3" fontId="0" fillId="0" borderId="0" xfId="0" applyNumberFormat="1"/>' +
    '<xf numFmtId="0" fontId="1" fillId="3" borderId="0" xfId="0" applyFont="1" applyFill="1"/>' +
    '</cellXfs><cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles>' +
    '</styleSheet>';
var
  Z: TZipFile;
  Sheet: TStringBuilder;
  R, C, N, K, H0, MergeCount: Integer;
  Merges: string;
  V: Variant;
  D: Double;
  Ref: string;

  procedure Add(const AName, AContent: string);
  begin
    Z.Add(TEncoding.UTF8.GetBytes(AContent), AName);
  end;

  procedure StrCell(const ARef, AText: string; AStyle: Integer);
  begin
    Sheet.Append('<c r="' + ARef + '" t="inlineStr"');
    if AStyle > 0 then Sheet.Append(' s="' + IntToStr(AStyle) + '"');
    Sheet.Append('><is><t xml:space="preserve">' + EsEscapeXml(AText) + '</t></is></c>');
  end;

  function IsWhole(X: Double): Boolean;
  begin
    Result := Frac(X) = 0;
  end;

begin
  Z := TZipFile.Create;
  Sheet := TStringBuilder.Create;
  try
    if FileExists(AFileName) then
      DeleteFile(AFileName);
    Z.Open(AFileName, zmWrite);
    Sheet.Append(XmlHead + '<worksheet xmlns="' + NsMain + '" xmlns:r="' + NsRel + '">');
    if AData.ColCount > 0 then
    begin
      Sheet.Append('<cols>');
      for C := 0 to AData.ColCount - 1 do
        Sheet.Append(Format('<col min="%d" max="%d" width="%s" customWidth="1"/>',
          [C + 1, C + 1, FormatFloat('0.0', Max(6, AData.Columns[C].Width / 7), InvFS)]));
      Sheet.Append('</cols>');
    end;
    Sheet.Append('<sheetData>');
    // bandas (linha mesclada acima dos títulos)
    H0 := 1;
    Merges := '';
    MergeCount := 0;
    if AData.HasBands then
    begin
      Sheet.Append('<row r="1">');
      C := 0;
      while C < AData.ColCount do
      begin
        N := AData.BandSpan(C);
        StrCell(XlsxColName(C) + '1', AData.Bands[C], 1);
        for K := C + 1 to C + N - 1 do
          Sheet.Append('<c r="' + XlsxColName(K) + '1" s="1"/>');
        if N > 1 then
        begin
          Merges := Merges + '<mergeCell ref="' + XlsxColName(C) + '1:' +
            XlsxColName(C + N - 1) + '1"/>';
          Inc(MergeCount);
        end;
        Inc(C, N);
      end;
      Sheet.Append('</row>');
      H0 := 2;
    end;
    // cabeçalho
    Sheet.Append('<row r="' + IntToStr(H0) + '">');
    for C := 0 to AData.ColCount - 1 do
      StrCell(XlsxColName(C) + IntToStr(H0), AData.Columns[C].Title, 1);
    Sheet.Append('</row>');
    for R := 0 to AData.RowCount - 1 do
    begin
      Sheet.Append('<row r="' + IntToStr(R + H0 + 1) + '">');
      for C := 0 to AData.ColCount - 1 do
      begin
        Ref := XlsxColName(C) + IntToStr(R + H0 + 1);
        V := AData.Values[R][C];
        if VarIsEmpty(V) or VarIsNull(V) then Continue;
        case AData.Columns[C].Kind of
          dkNumber:
            if VarIsNumeric(V) then
            begin
              D := VarAsType(V, varDouble);
              if IsWhole(D) and (AData.Columns[C].Column.DisplayFormat = '') then
                Sheet.Append('<c r="' + Ref + '" s="5"><v>' + FloatToStr(D, InvFS) + '</v></c>')
              else
                Sheet.Append('<c r="' + Ref + '" s="4"><v>' + FloatToStr(D, InvFS) + '</v></c>');
            end
            else
              StrCell(Ref, AData.Texts[R][C], 0);
          dkDate:
            try
              D := VarToDateTime(V);
              if IsWhole(D) then
                Sheet.Append('<c r="' + Ref + '" s="2"><v>' + FloatToStr(D, InvFS) + '</v></c>')
              else
                Sheet.Append('<c r="' + Ref + '" s="3"><v>' + FloatToStr(D, InvFS) + '</v></c>');
            except
              StrCell(Ref, AData.Texts[R][C], 0);
            end;
        else
          StrCell(Ref, AData.Texts[R][C], 0); // texto e booleanos (Sim/Não)
        end;
      end;
      Sheet.Append('</row>');
    end;
    if AData.HasFooter then
    begin
      R := AData.RowCount + H0 + 1;
      Sheet.Append('<row r="' + IntToStr(R) + '">');
      for C := 0 to AData.ColCount - 1 do
        StrCell(XlsxColName(C) + IntToStr(R), AData.Footer[C], 6);
      Sheet.Append('</row>');
    end;
    Sheet.Append('</sheetData>');
    if MergeCount > 0 then
      Sheet.Append('<mergeCells count="' + IntToStr(MergeCount) + '">' + Merges + '</mergeCells>');
    Sheet.Append('</worksheet>');

    Add('[Content_Types].xml', XmlHead +
      '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">' +
      '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>' +
      '<Default Extension="xml" ContentType="application/xml"/>' +
      '<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>' +
      '<Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>' +
      '<Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>' +
      '</Types>');
    Add('_rels/.rels', XmlHead + '<Relationships xmlns="' + NsPkg + '">' +
      '<Relationship Id="rId1" Type="' + NsRel + '/officeDocument" Target="xl/workbook.xml"/>' +
      '</Relationships>');
    Add('xl/workbook.xml', XmlHead + '<workbook xmlns="' + NsMain + '" xmlns:r="' + NsRel + '">' +
      '<sheets><sheet name="Dados" sheetId="1" r:id="rId1"/></sheets></workbook>');
    Add('xl/_rels/workbook.xml.rels', XmlHead + '<Relationships xmlns="' + NsPkg + '">' +
      '<Relationship Id="rId1" Type="' + NsRel + '/worksheet" Target="worksheets/sheet1.xml"/>' +
      '<Relationship Id="rId2" Type="' + NsRel + '/styles" Target="styles.xml"/>' +
      '</Relationships>');
    Add('xl/styles.xml', XmlHead + StylesXml);
    Add('xl/worksheets/sheet1.xml', Sheet.ToString);
    Z.Close;
  finally
    Sheet.Free;
    Z.Free;
  end;
end;

function PdfNeedsUnicode(AData: TEsExportData; const AOptions: TEsReportOptions): Boolean;
var
  R, C: Integer;
begin
  Result := True;
  if TEsPdfReportTarget.NeedsUnicode(AOptions.CompanyName) or
     TEsPdfReportTarget.NeedsUnicode(AOptions.TitleReport) then Exit;
  for C := 0 to AData.ColCount - 1 do
    if TEsPdfReportTarget.NeedsUnicode(AData.Columns[C].Title) then Exit;
  for C := 0 to High(AData.Bands) do
    if TEsPdfReportTarget.NeedsUnicode(AData.Bands[C]) then Exit;
  for C := 0 to High(AData.Footer) do
    if TEsPdfReportTarget.NeedsUnicode(AData.Footer[C]) then Exit;
  for R := 0 to AData.RowCount - 1 do
    for C := 0 to High(AData.Texts[R]) do
      if TEsPdfReportTarget.NeedsUnicode(AData.Texts[R][C]) then Exit;
  Result := False;
end;

procedure EsExportToPDF(AData: TEsExportData; const AFileName: string;
  const AOptions: TEsReportOptions);
var
  Pdf: TEsPdfReportTarget;
  W, H: Single;
begin
  Pdf := TEsPdfReportTarget.Create;
  try
    Pdf.FontFile := AOptions.PdfFontFile;
    Pdf.BoldFontFile := AOptions.PdfBoldFontFile;
    if (AOptions.PdfFontMode = pfmEmbedded) or
       ((AOptions.PdfFontMode = pfmAuto) and PdfNeedsUnicode(AData, AOptions)) then
      Pdf.FontMode := pfmEmbedded
    else
      Pdf.FontMode := pfmStandard;
    TEsReportRenderer.PaperSizePt(AOptions.Paper, AOptions.Orientation, W, H);
    TEsReportRenderer.Render(AData, AOptions, Pdf, W, H);
    Pdf.SaveToFile(AFileName);
  finally
    Pdf.Free;
  end;
end;

function HtmlTable(AData: TEsExportData): string;
var
  R, C, N: Integer;
  SB: TStringBuilder;

  function Al(Col: Integer): string;
  begin
    if AData.Columns[Col].Numeric then Result := ' style="text-align:right"' else Result := '';
  end;

begin
  SB := TStringBuilder.Create;
  try
    SB.Append('<table><thead>');
    if AData.HasBands then
    begin
      SB.Append('<tr>');
      C := 0;
      while C < AData.ColCount do
      begin
        N := AData.BandSpan(C);
        SB.Append('<th colspan="' + IntToStr(N) + '" style="text-align:center">' +
          EsEscapeXml(AData.Bands[C]) + '</th>');
        Inc(C, N);
      end;
      SB.Append('</tr>');
    end;
    SB.Append('<tr>');
    for C := 0 to AData.ColCount - 1 do
      SB.Append('<th' + Al(C) + '>' + EsEscapeXml(AData.Columns[C].Title) + '</th>');
    SB.Append('</tr></thead><tbody>'#13#10);
    for R := 0 to AData.RowCount - 1 do
    begin
      SB.Append('<tr>');
      for C := 0 to AData.ColCount - 1 do
        SB.Append('<td' + Al(C) + '>' + EsEscapeXml(AData.Texts[R][C]) + '</td>');
      SB.Append('</tr>'#13#10);
    end;
    SB.Append('</tbody>');
    if AData.HasFooter then
    begin
      SB.Append('<tfoot><tr>');
      for C := 0 to AData.ColCount - 1 do
        SB.Append('<td' + Al(C) + '>' + EsEscapeXml(AData.Footer[C]) + '</td>');
      SB.Append('</tr></tfoot>');
    end;
    SB.Append('</table>');
    Result := SB.ToString;
  finally
    SB.Free;
  end;
end;

procedure EsExportToHTML(AData: TEsExportData; const AFileName, ATitle: string);
var
  T: string;
begin
  T := ATitle;
  if T = '' then T := 'Dados';
  SaveText(AFileName,
    '<!doctype html>'#13#10'<html lang="pt-BR"><head><meta charset="utf-8"><title>' +
    EsEscapeXml(T) + '</title>'#13#10 +
    '<style>'#13#10 +
    'body{font:13px "Segoe UI",sans-serif;margin:16px}'#13#10 +
    'table{border-collapse:collapse}'#13#10 +
    'th,td{border:1px solid #ccc;padding:4px 8px}'#13#10 +
    'th{background:#eee;text-align:left}'#13#10 +
    'tfoot td{font-weight:bold;background:#f5f5f5}'#13#10 +
    '</style></head><body>'#13#10 + HtmlTable(AData) + #13#10'</body></html>'#13#10);
end;

procedure EsExportToCSV(AData: TEsExportData; const AFileName: string;
  ASeparator: Char);
var
  SB: TStringBuilder;
  R, C: Integer;

  function Field(const S: string): string;
  begin
    if (Pos(ASeparator, S) > 0) or (Pos('"', S) > 0) or (Pos(#10, S) > 0) or
       (Pos(#13, S) > 0) then
      Result := '"' + StringReplace(S, '"', '""', [rfReplaceAll]) + '"'
    else
      Result := S;
  end;

  procedure Line(const A: array of string);
  var
    I: Integer;
  begin
    for I := 0 to High(A) do
    begin
      if I > 0 then SB.Append(ASeparator);
      SB.Append(Field(A[I]));
    end;
    SB.Append(#13#10);
  end;

var
  Titles: TArray<string>;
begin
  SB := TStringBuilder.Create;
  try
    SetLength(Titles, AData.ColCount);
    for C := 0 to AData.ColCount - 1 do
      Titles[C] := AData.Columns[C].Title;
    Line(Titles);
    for R := 0 to AData.RowCount - 1 do
      Line(AData.Texts[R]);
    if AData.HasFooter then
      Line(AData.Footer);
    // BOM para o Excel reconhecer o UTF-8
    SaveText(AFileName, SB.ToString, True);
  finally
    SB.Free;
  end;
end;

function XmlTagName(const AKey: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(AKey) do
    if CharInSet(AKey[I], ['A'..'Z', 'a'..'z', '0'..'9', '_', '.', '-']) then
      Result := Result + AKey[I]
    else
      Result := Result + '_';
  if (Result = '') or not CharInSet(Result[1], ['A'..'Z', 'a'..'z', '_']) then
    Result := '_' + Result;
end;

procedure EsExportToXML(AData: TEsExportData; const AFileName: string);
var
  SB: TStringBuilder;
  R, C: Integer;
  Tags: TArray<string>;
begin
  SetLength(Tags, AData.ColCount);
  for C := 0 to AData.ColCount - 1 do
    Tags[C] := XmlTagName(AData.Columns[C].Key);
  SB := TStringBuilder.Create;
  try
    SB.Append('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Dados>'#13#10);
    for R := 0 to AData.RowCount - 1 do
    begin
      SB.Append('  <Registro>'#13#10);
      for C := 0 to AData.ColCount - 1 do
        SB.Append('    <' + Tags[C] + '>' + EsEscapeXml(AData.Texts[R][C]) +
          '</' + Tags[C] + '>'#13#10);
      SB.Append('  </Registro>'#13#10);
    end;
    SB.Append('</Dados>'#13#10);
    SaveText(AFileName, SB.ToString);
  finally
    SB.Free;
  end;
end;

procedure EsExportToText(AData: TEsExportData; const AFileName: string);
var
  W: TArray<Integer>;
  R, C: Integer;
  SB: TStringBuilder;
  Sep: string;

  function Pad(const S: string; Col: Integer): string;
  var
    N: Integer;
  begin
    N := W[Col] - Length(S);
    if N < 0 then N := 0;
    if AData.Columns[Col].Numeric then
      Result := StringOfChar(' ', N) + S
    else
      Result := S + StringOfChar(' ', N);
  end;

  procedure Line(const A: array of string);
  var
    I: Integer;
    L: string;
  begin
    L := '';
    for I := 0 to High(A) do
    begin
      if I > 0 then L := L + '  ';
      L := L + Pad(A[I], I);
    end;
    SB.Append(TrimRight(L) + #13#10);
  end;

var
  Titles: TArray<string>;
begin
  SetLength(W, AData.ColCount);
  SetLength(Titles, AData.ColCount);
  for C := 0 to AData.ColCount - 1 do
  begin
    Titles[C] := AData.Columns[C].Title;
    W[C] := Length(Titles[C]);
    for R := 0 to AData.RowCount - 1 do
      W[C] := Max(W[C], Length(AData.Texts[R][C]));
    if AData.HasFooter then
      W[C] := Max(W[C], Length(AData.Footer[C]));
  end;
  Sep := '';
  for C := 0 to AData.ColCount - 1 do
  begin
    if C > 0 then Sep := Sep + '  ';
    Sep := Sep + StringOfChar('-', W[C]);
  end;
  SB := TStringBuilder.Create;
  try
    Line(Titles);
    SB.Append(Sep + #13#10);
    for R := 0 to AData.RowCount - 1 do
      Line(AData.Texts[R]);
    if AData.HasFooter then
    begin
      SB.Append(Sep + #13#10);
      Line(AData.Footer);
    end;
    SaveText(AFileName, SB.ToString);
  finally
    SB.Free;
  end;
end;

procedure EsExportGrid(AGrid: TEsGrid; AFormat: TEsExportFormat;
  const AFileName: string; const AOptions: TEsReportOptions);
var
  D: TEsExportData;
begin
  D := TEsExportData.Create(AGrid);
  try
    case AFormat of
      sefExcel: EsExportToExcel(D, AFileName);
      sefPDF: EsExportToPDF(D, AFileName, AOptions);
      sefHTML: EsExportToHTML(D, AFileName, AOptions.TitleReport);
      sefCSV: EsExportToCSV(D, AFileName);
      sefXML: EsExportToXML(D, AFileName);
      sefText: EsExportToText(D, AFileName);
    end;
  finally
    D.Free;
  end;
end;

initialization
  InvFS := FormatSettings;
  InvFS.DecimalSeparator := '.';
  InvFS.ThousandSeparator := #0;

end.
