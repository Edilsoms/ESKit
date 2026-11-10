program gridviews;

{ Teste/demonstração da TEsGrid: visão em bandas, visão em cartões e
  mestre-detalhe. Uso: gridviews [pasta-de-saída]  (salva capturas e
  imprime OK/FALHA de cada verificação). }

{$mode objfpc}{$H+}

uses
  Interfaces, Classes, SysUtils, Variants, Forms, Controls, Graphics, ExtCtrls, LCLType, LMessages,
  EsGraphics, EsTheme, EsSkins, EsGrid, EsGridExport;

type
  TGridHack = class(TEsGrid);

var
  Fails: Integer = 0;
  OutDir: string;

procedure Check(Cond: Boolean; const Msg: string);
begin
  if Cond then WriteLn('OK    ', Msg) else begin WriteLn('FALHA ', Msg); Inc(Fails); end;
end;

procedure Pump;
var
  I: Integer;
begin
  for I := 1 to 15 do
  begin
    Application.ProcessMessages;
    Sleep(15);
  end;
end;

procedure Key(G: TEsGrid; AKey: Word; AShift: TShiftState = []);
var
  K: Word;
begin
  K := AKey;
  TGridHack(G).KeyDown(K, AShift);
  Pump;
end;

procedure Shot(AForm: TForm; const AName: string);
var
  B: TBitmap;
  P: TPortableNetworkGraphic;
begin
  Pump;
  B := AForm.GetFormImage;
  P := TPortableNetworkGraphic.Create;
  try
    P.Assign(B);
    P.SaveToFile(IncludeTrailingPathDelimiter(OutDir) + AName);
  finally
    P.Free;
    B.Free;
  end;
end;

function AddCol(G: TEsGrid; const ACaption, AField: string; AWidth: Integer;
  ABand: Integer = -1): TEsGridColumn;
begin
  Result := G.Columns.Add;
  Result.Caption := ACaption;
  Result.FieldName := AField;
  Result.Width := AWidth;
  Result.BandIndex := ABand;
end;

const
  Clientes: array[0..5] of string = ('Ana Souza', 'Bruno Lima', 'Carla Dias',
    'Diego Alves', 'Elisa Rocha', 'Fábio Nunes');
  Cidades: array[0..3] of string = ('Recife', 'São Paulo', 'Curitiba', 'Natal');
  Produtos: array[0..4] of string = ('Notebook', 'Monitor', 'Teclado', 'Mouse', 'Cadeira');
  Precos: array[0..4] of Double = (4200, 1100, 180, 90, 950);

var
  F: TForm;
  Master, Itens, D: TEsGrid;
  I, J, R, P, Q, Rec, Cnt: Integer;
  Total: Double;
begin
  OutDir := ParamStr(1);
  if OutDir = '' then OutDir := '.';
  Application.Initialize;
  EsThemes.ApplyStyle(dsOffice2019Colorful);
  F := TForm.CreateNew(nil);
  F.SetBounds(0, 0, 1000, 640);
  F.Caption := 'ESKit - visões da grade';

  // modelo do detalhe (itens do pedido): fica invisível, guarda todos os itens
  Itens := TEsGrid.Create(F);
  Itens.Parent := F;
  Itens.Visible := False;
  AddCol(Itens, 'Pedido', 'Pedido', 60);
  AddCol(Itens, 'Produto', 'Produto', 160);
  AddCol(Itens, 'Qtd', 'Qtd', 60).FooterSummaries := [skSum];
  AddCol(Itens, 'Preço', 'Preco', 90).DisplayFormat := '#,##0.00';
  AddCol(Itens, 'Subtotal', 'Subtotal', 100).DisplayFormat := '#,##0.00';
  Itens.Columns[0].Visible := False; // chave não precisa aparecer
  Itens.OptionsView.Footer := True;

  Master := TEsGrid.Create(F);
  Master.Parent := F;
  Master.Align := alClient;
  Master.Bands.Add.Caption := 'Pedido';
  Master.Bands.Add.Caption := 'Cliente';
  Master.Bands.Add.Caption := 'Valores';
  AddCol(Master, 'Nº', 'Pedido', 60, 0);
  AddCol(Master, 'Data', 'Data', 100, 0).DisplayFormat := 'dd/mm/yyyy';
  AddCol(Master, 'Nome', 'Cliente', 150, 1);
  AddCol(Master, 'Cidade', 'Cidade', 110, 1);
  AddCol(Master, 'Itens', 'Itens', 60, 2);
  AddCol(Master, 'Total (R$)', 'Total', 110, 2).DisplayFormat := '#,##0.00';
  AddCol(Master, 'Pago', 'Pago', 60, 2);
  RandSeed := 7;
  Master.DataController.BeginUpdate;
  Itens.DataController.BeginUpdate;
  for I := 1 to 24 do
  begin
    Cnt := 1 + Random(4);
    Total := 0;
    for J := 1 to Cnt do
    begin
      P := Random(Length(Produtos));
      Q := 1 + Random(5);
      R := Itens.DataController.AppendRecord;
      Itens.DataController.Values[R, 0] := I;
      Itens.DataController.Values[R, 1] := Produtos[P];
      Itens.DataController.Values[R, 2] := Q;
      Itens.DataController.Values[R, 3] := Precos[P];
      Itens.DataController.Values[R, 4] := Precos[P] * Q;
      Total := Total + Precos[P] * Q;
    end;
    R := Master.DataController.AppendRecord;
    Master.DataController.Values[R, 0] := I;
    Master.DataController.Values[R, 1] := VarFromDateTime(EncodeDate(2026, 3, 1) + I * 3);
    Master.DataController.Values[R, 2] := Clientes[Random(Length(Clientes))];
    Master.DataController.Values[R, 3] := Cidades[Random(Length(Cidades))];
    Master.DataController.Values[R, 4] := Cnt;
    Master.DataController.Values[R, 5] := Total;
    Master.DataController.Values[R, 6] := Random(3) > 0;
  end;
  Itens.DataController.EndUpdate;
  Master.DataController.EndUpdate;
  Master.DetailGrid := Itens;
  Master.MasterKeyField := 'Pedido';
  Master.DetailKeyField := 'Pedido';
  Master.DetailHeight := 150;
  F.Show;
  Pump;

  // --- tabela com mestre-detalhe
  Check(Master.HasDetails, 'grade com detalhe configurado');
  Master.ExpandDetail(0);
  Master.ExpandDetail(2);
  Pump;
  D := Master.DetailGridOf(0);
  Check(D <> nil, 'detalhe do pedido 1 criado');
  Check((D <> nil) and (D.DataController.RecordCount = Master.DataController.Values[0, 4]),
    'detalhe mostra só os itens do pedido 1 (' + IntToStr(D.DataController.RecordCount) + ')');
  Check((D <> nil) and D.Visible and (D.Top > 0), 'grade de detalhe posicionada');
  Check(Master.IsDetailExpanded(2) and not Master.IsDetailExpanded(1), 'estado expandido por registro');
  Shot(F, 'mestre_detalhe.png');
  // edição no detalhe grava no modelo
  Rec := 0;
  for I := 0 to Itens.DataController.RecordCount - 1 do
    if Itens.DataController.Values[I, 0] = 1 then begin Rec := I; Break; end;
  D.SetCellValue(0, D.Columns[2], 99);
  Check(Itens.DataController.Values[Rec, 2] = 99, 'edição no detalhe gravada no modelo');
  Check(Master.DetailGridOf(0) = D, 'detalhe continua aberto após gravar');
  // navegação não para nas linhas de detalhe
  Master.FocusedRecordIndex := 0;
  Master.SetFocus;
  Pump;
  Rec := Master.FocusedRecordIndex;
  Key(Master, VK_DOWN);
  Check(Master.FocusedRecordIndex = 1, 'seta para baixo pula a área do detalhe (foco no registro ' +
    IntToStr(Master.FocusedRecordIndex) + ')');
  Master.CollapseDetail(2);
  Check(not Master.IsDetailExpanded(2), 'recolher detalhe');

  // --- visão em bandas
  Master.CollapseAllDetails;
  Master.ViewMode := gvmBanded;
  Master.OptionsView.Footer := True;
  Master.Columns[5].FooterSummaries := [skSum];
  Pump;
  Check(Master.VisibleColumn(0).BandIndex = 0, 'colunas ordenadas por banda');
  Check(Master.ColumnBand(Master.Columns[2]) = Master.Bands[1], 'banda da coluna Nome');
  Check(Master.Bands[2].Width = 230, 'largura da banda = soma das colunas (' +
    IntToStr(Master.Bands[2].Width) + ')');
  Master.Bands.MoveBand(2, 0);
  Pump;
  Check((Master.VisibleColumn(0).FieldName = 'Itens') and (Master.Columns[5].BandIndex = 0),
    'mover banda leva as colunas junto');
  Master.GroupBy(Master.Columns[3]);
  Master.ExpandDetail(Master.ViewRows[1].RecIndex);
  Pump;
  Shot(F, 'bandas.png');
  EsExportGrid(Master, sefExcel, IncludeTrailingPathDelimiter(OutDir) + 'bandas.xlsx', EsDefaultReportOptions);
  EsExportGrid(Master, sefPDF, IncludeTrailingPathDelimiter(OutDir) + 'bandas.pdf', EsDefaultReportOptions);
  EsExportGrid(Master, sefHTML, IncludeTrailingPathDelimiter(OutDir) + 'bandas.html', EsDefaultReportOptions);
  Check(FileExists(IncludeTrailingPathDelimiter(OutDir) + 'bandas.xlsx'), 'exportação com bandas');

  // --- visão em cartões
  Master.CollapseAllDetails;
  Master.ClearGrouping;
  Master.ViewMode := gvmCards;
  Master.OptionsCard.TitleField := 'Cliente';
  Pump;
  Check(not Master.HasDetails, 'cartões não abrem detalhe');
  Master.FocusedRecordIndex := 0;
  Master.SetFocus;
  Key(Master, VK_RIGHT);
  Check(Master.FocusedRecordIndex = 1, 'seta direita = próximo cartão');
  Key(Master, VK_DOWN);
  Check(Master.FocusedRecordIndex > 2, 'seta baixo = fileira seguinte (registro ' +
    IntToStr(Master.FocusedRecordIndex) + ')');
  Shot(F, 'cartoes.png');
  Master.GroupBy(Master.Columns[3]);
  Pump;
  Shot(F, 'cartoes_grupos.png');
  Master.ViewMode := gvmTable;
  Pump;
  Check(Master.ViewMode = gvmTable, 'volta para tabela');
  WriteLn('Falhas: ', Fails);
  F.Free;
  Halt(Fails);
end.
