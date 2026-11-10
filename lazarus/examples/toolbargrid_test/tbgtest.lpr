program tbgtest;
{$mode objfpc}{$H+}
uses
  {$IFDEF UNIX}cthreads,{$ENDIF}
  Interfaces, Classes, SysUtils, Forms, Controls, Graphics, Variants,
  EsGrid, EsGridExport, EsToolBarGrid, ESKit;

type
  TMsg = class
    procedure OnMsg(Sender: TObject; const AMessage: string; var AHandled: Boolean);
  end;

procedure TMsg.OnMsg(Sender: TObject; const AMessage: string; var AHandled: Boolean);
begin
  WriteLn('MSG: ', AMessage);
  AHandled := True;
end;

const
  Cidades: array[0..2] of string = ('São Paulo', 'Curitiba', 'Recife');
var
  F: TForm;
  G: TEsGrid;
  TB: TEsToolBarGrid;
  M: TMsg;
  I, R: Integer;
  Dir: string;
  Opt: TEsReportOptions;
  Bmp: TBitmap;
  Png: TPortableNetworkGraphic;
  Tgt: TEsCanvasReportTarget;
  D: TEsExportData;
  W, H: Single;
  B: TEsToolBarGridButton;
  Fmt: TEsExportFormat;

procedure AddCol(const ACap, AField: string; AKind: TEsDataKind; AWidth: Integer; const AFmt: string = '');
begin
  with G.Columns.Add do
  begin
    Caption := ACap; FieldName := AField; DataKind := AKind; Width := AWidth; DisplayFormat := AFmt;
  end;
end;

procedure Dump(const ATitle: string);
var J: Integer;
begin
  Write(ATitle, ': ');
  for J := 0 to G.Columns.Count - 1 do
    Write(G.Columns[J].FieldName, '[i', G.Columns[J].Index, ' w', G.Columns[J].Width,
      ' s', Ord(G.Columns[J].SortOrder), ' g', G.Columns[J].GroupIndex,
      ' v', Ord(G.Columns[J].Visible), ' f', Integer(G.Columns[J].FooterKinds <> []), '] ');
  WriteLn;
end;

begin
  Dir := ParamStr(1);
  ForceDirectories(Dir);
  Application.Initialize;
  F := TForm.CreateNew(nil);
  F.SetBounds(0, 0, 900, 500);
  G := TEsGrid.Create(F);
  G.Name := 'grdTesteTableView';
  G.Parent := F;
  G.Align := alClient;
  AddCol('Código', 'codigo', dkNumber, 80);
  AddCol('Descrição', 'descricao', dkString, 220);
  AddCol('Valor', 'valor', dkNumber, 110, ',0.00');
  AddCol('Ativo', 'ativo', dkBoolean, 70);
  AddCol('Data', 'data', dkDate, 140, 'dd/mm/yyyy hh:nn');
  AddCol('Cidade', 'cidade', dkString, 120);
  G.DataController.BeginUpdate;
  for I := 0 to 40 do
  begin
    R := G.DataController.AppendRecord;
    G.DataController.Values[R, 0] := I;
    G.DataController.Values[R, 1] := 'Descrição número ' + IntToStr(I) + ' "aspas" & <tag>; ç';
    G.DataController.Values[R, 2] := (I + 3) * 5.25;
    G.DataController.Values[R, 3] := Odd(I);
    G.DataController.Values[R, 4] := VarFromDateTime(EncodeDate(2026, 11, 1) + I + EncodeTime(14, 30, 0, 0));
    G.DataController.Values[R, 5] := Cidades[I mod 3];
  end;
  G.DataController.EndUpdate;

  M := TMsg.Create;
  TB := TEsToolBarGrid.Create(F);
  TB.Parent := F;
  TB.Grid := G;
  TB.User := 'usuario';
  TB.CompanyName := 'Minha Empresa';
  TB.TitleReport := 'Teste de impressão de relatório';
  TB.LayoutDirectory := Dir;
  TB.OnMessage := @M.OnMsg;
  F.Show;
  Application.ProcessMessages;

  // estado inicial dos botões
  Write('ENABLED (sem grupo): ');
  for B := Low(B) to High(B) do Write(Ord(TB.ButtonEnabled(B)));
  WriteLn;
  G.GroupBy(G.Columns.ColumnByFieldName('cidade'));
  Write('ENABLED (com grupo): ');
  for B := Low(B) to High(B) do Write(Ord(TB.ButtonEnabled(B)));
  WriteLn;
  TB.ExecuteButton(tgbMultiSelect);
  Write('ENABLED (multi):     ');
  for B := Low(B) to High(B) do Write(Ord(TB.ButtonEnabled(B)));
  WriteLn;
  TB.ExecuteButton(tgbSelectAll);
  WriteLn('SELECTED after SelectAll: ', G.SelectedRecordCount);
  TB.ExecuteButton(tgbUnselectAll);
  WriteLn('SELECTED after Unselect: ', G.SelectedRecordCount);
  TB.ExecuteButton(tgbMultiSelect);

  // sumários pelo botão (coluna focada = 1ª visível = codigo)
  WriteLn('Focused column: ', G.FocusedColumn.FieldName);
  TB.ExecuteButton(tgbCountColumn);
  TB.ExecuteButton(tgbSumColumn);
  TB.ExecuteButton(tgbAvgGroup);
  G.AddFooterSummary(G.Columns.ColumnByFieldName('valor'), skSum);
  G.AddFooterSummary(G.Columns.ColumnByFieldName('valor'), skAverage);
  WriteLn('FOOTER codigo: ', G.SummaryText(G.Columns.ColumnByFieldName('codigo'), 0, G.ViewRecordCount - 1));
  WriteLn('FOOTER valor:  ', G.SummaryText(G.Columns.ColumnByFieldName('valor'), 0, G.ViewRecordCount - 1));
  // coluna texto: soma deve recusar
  G.Columns.ColumnByFieldName('descricao').Index := 0;
  G.FocusedRecordIndex := 0;
  WriteLn('Focused column now: ', G.FocusedColumn.FieldName);
  TB.ExecuteButton(tgbSumColumn);
  TB.ExecuteButton(tgbAvgColumn);
  G.Columns.ColumnByFieldName('codigo').Index := 0;

  // layout roundtrip
  G.Columns.ColumnByFieldName('valor').Width := 155;
  G.Columns.ColumnByFieldName('data').SortOrder := esoDescending;
  G.Columns.ColumnByFieldName('ativo').Visible := False;
  G.Columns.ColumnByFieldName('descricao').FilterText := 'número 1';
  Dump('BEFORE SAVE');
  TB.ExecuteButton(tgbSaveLayout);
  WriteLn('Layout file exists: ', FileExists(TB.LayoutFileName), ' ', ExtractFileName(TB.LayoutFileName));
  G.ClearGrouping; G.ClearSorting; G.ClearFilter; G.RemoveAllSummaries;
  G.Columns.ColumnByFieldName('valor').Width := 60;
  G.Columns.ColumnByFieldName('ativo').Visible := True;
  G.Columns.ColumnByFieldName('cidade').Index := 0;
  Dump('CHANGED    ');
  TB.ExecuteButton(tgbLoadLayout);
  Dump('RESTORED   ');
  WriteLn('Filter restored: "', G.Columns.ColumnByFieldName('descricao').FilterText, '" rows=', G.ViewRecordCount);
  G.ClearFilter;
  WriteLn('rows after clear filter=', G.ViewRecordCount);

  // exportações
  Opt := EsDefaultReportOptions;
  Opt.CompanyName := TB.CompanyName;
  Opt.TitleReport := TB.TitleReport;
  for Fmt := Low(Fmt) to High(Fmt) do
  begin
    WriteLn('EXPORT ', EsExportDescriptions[Fmt], ' -> ', TB.DefaultExportFileName(Fmt));
    if not TB.ExportTo(Fmt, IncludeTrailingPathDelimiter(Dir) + 'out' + EsExportExtensions[Fmt]) then
      WriteLn('  FAILED');
  end;
  // PDF retrato com muitas linhas (paginação)
  G.ClearGrouping;
  G.DataController.BeginUpdate;
  for I := 41 to 120 do
  begin
    R := G.DataController.AppendRecord;
    G.DataController.Values[R, 0] := I;
    G.DataController.Values[R, 1] := 'Linha ' + IntToStr(I);
    G.DataController.Values[R, 2] := I * 1.5;
    G.DataController.Values[R, 5] := Cidades[I mod 3];
  end;
  G.DataController.EndUpdate;
  Opt.Orientation := spoPortrait;
  EsExportGrid(G, sefPDF, IncludeTrailingPathDelimiter(Dir) + 'out_portrait.pdf', Opt);

  // renderização da "impressão" num bitmap (mesmo motor da impressora)
  D := TEsExportData.Create(G);
  Bmp := TBitmap.Create;
  try
    Opt.Orientation := spoLandscape;
    TEsReportRenderer.PaperSizePt(spsA4, spoLandscape, W, H);
    Bmp.SetSize(Round(W * 2), Round(H * 2));
    Bmp.Canvas.Brush.Color := clWhite;
    Bmp.Canvas.FillRect(0, 0, Bmp.Width, Bmp.Height);
    Tgt := TEsCanvasReportTarget.Create(Bmp.Canvas, 144);
    WriteLn('Print pages: ', TEsReportRenderer.Render(D, Opt, Tgt, W, H));
    Tgt.Free;
    Png := TPortableNetworkGraphic.Create;
    Png.Assign(Bmp);
    Png.SaveToFile(IncludeTrailingPathDelimiter(Dir) + 'print_preview.png');
    Png.Free;
  finally
    Bmp.Free;
    D.Free;
  end;
  TB.ExecuteButton(tgbDeleteLayout);
  WriteLn('Layout exists after delete: ', FileExists(TB.LayoutFileName));
  M.Free;
  F.Free;
  WriteLn('DONE');
end.
