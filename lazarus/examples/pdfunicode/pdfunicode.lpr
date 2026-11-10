program pdfunicode;

{ Teste da exportação PDF: Helvetica para texto latino, fonte TrueType
  embutida para as demais escritas (grego, cirílico, hebraico, árabe com
  formas contextuais, chinês...). Uso: pdfunicode [pasta-de-saída] }

{$mode objfpc}{$H+}

uses
  Interfaces, Classes, SysUtils, Forms, EsGrid, EsGridExport;

var
  Fails: Integer = 0;
  OutDir: string;

procedure Check(C: Boolean; const M: string);
begin
  if C then WriteLn('OK    ', M) else begin WriteLn('FALHA ', M); Inc(Fails); end;
end;

function FileText(const AFile: string): string;
var
  F: TFileStream;
begin
  F := TFileStream.Create(AFile, fmOpenRead);
  try
    SetLength(Result, F.Size);
    if F.Size > 0 then F.ReadBuffer(Result[1], F.Size);
  finally
    F.Free;
  end;
end;

procedure Col(G: TEsGrid; const C, Fl: string);
var
  X: TEsGridColumn;
begin
  X := G.Columns.Add;
  X.Caption := C;
  X.FieldName := Fl;
  X.Width := 220;
end;

var
  F: TForm;
  G: TEsGrid;
  O: TEsReportOptions;
  I: Integer;
  Latin, Uni: string;
begin
  OutDir := ParamStr(1);
  if OutDir = '' then OutDir := '.';
  Application.Initialize;
  F := TForm.CreateNew(nil);
  G := TEsGrid.Create(F);
  G.Parent := F;
  Col(G, 'Nome', 'n');
  Col(G, 'Cidade', 'c');
  Col(G, 'Valor', 'v');
  G.Columns[2].DataKind := dkNumber;
  for I := 0 to 4 do
    G.DataController.AppendRecord(['Ação ' + IntToStr(I), 'São Paulo', I * 10.5]);
  O := EsDefaultReportOptions;
  O.TitleReport := 'Relatório';
  O.CompanyName := 'Minha Empresa';
  Latin := IncludeTrailingPathDelimiter(OutDir) + 'latino.pdf';
  EsExportGrid(G, sefPDF, Latin, O);
  G.DataController.AppendRecord(['Ελληνικά', 'Москва', 1.0]);
  G.DataController.AppendRecord(['עברית שלום', 'Kraków Łódź', 2.0]);
  G.DataController.AppendRecord(['مرحبا بالعالم', 'کتاب فارسی', 3.0]);
  G.DataController.AppendRecord(['数学 ✓ →', 'Ωmega', 4.0]);
  Uni := IncludeTrailingPathDelimiter(OutDir) + 'unicode.pdf';
  EsExportGrid(G, sefPDF, Uni, O);
  with TStringList.Create do
  try
    Text := FileText(Latin);
    Check(Pos('/BaseFont /Helvetica', Text) > 0, 'texto latino: Helvetica padrão');
    Check(Pos('FontFile2', Text) = 0, 'texto latino: nenhuma fonte embutida');
    Text := FileText(Uni);
    Check((Pos('/Subtype /Type0', Text) > 0) and (Pos('/Identity-H', Text) > 0),
      'texto Unicode: fonte Type0 / Identity-H');
    Check(Pos('/FontFile2', Text) > 0, 'texto Unicode: subconjunto TrueType embutido');
    Check(Pos('/ToUnicode', Text) > 0, 'texto Unicode: ToUnicode (copiar/pesquisar)');
    Check(Length(FileText(Uni)) < 400 * 1024, Format('subconjunto pequeno (%d KB)',
      [Length(FileText(Uni)) div 1024]));
  finally
    Free;
  end;
  F.Free;
  WriteLn('Falhas: ', Fails);
  if Fails > 0 then Halt(1);
end.
