unit uMain;

{ Demo do ESKit - mostra os componentes estilo FMX (TFx*) e
  estilo DevExpress (TSx*) num formulário no modo Delphi. }

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, Math, Variants, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Menus, ImgList, DB, BufDataset,
  EsGraphics, EsTheme, EsFxBase, EsFxShapes, EsFxStdCtrls, EsFxAnimations,
  EsSkins, EsEditors, EsGrid, EsNavBar, EsRibbon, EsToolBarGrid,
  ESKitReg, EsDB; // inclui os ícones (recursos) usados no demo

type

  { TForm1 }

  TForm1 = class(TForm)
    EsConnection1: TEsConnection;
    SkinController: TEsSkinController;
    Ribbon: TEsRibbon;
    NavBar: TEsNavBar;
    pnlContent: TPanel;
    pnlGrid: TPanel;
    ToolBar: TEsToolBarGrid;
    Grid: TEsGrid;
    pnlDataSet: TPanel;
    GridDB: TEsGrid;
    pnlFmx: TPanel;
    Card: TEsFxRectangle;
    txtTitle: TEsFxText;
    btnDefault: TEsFxButton;
    btnPrimary: TEsFxButton;
    btnOutline: TEsFxButton;
    btnDanger: TEsFxButton;
    swDark: TEsFxSwitch;
    txtDark: TEsFxText;
    chkNotify: TEsFxCheckBox;
    rbOptA: TEsFxRadioButton;
    rbOptB: TEsFxRadioButton;
    trkValue: TEsFxTrackBar;
    prgValue: TEsFxProgressBar;
    arcValue: TEsFxArcProgress;
    aniBusy: TEsFxAniIndicator;
    edtName: TEsFxEdit;
    Bubble: TEsFxCircle;
    BubbleColorAni: TEsFxColorAnimation;
    Pulse: TEsFxRectangle;
    PulseAni: TEsFxFloatAnimation;
    pnlEditors: TPanel;
    gbEditors: TEsGroupBox;
    lblButtonEdit: TLabel;
    edtButton: TEsButtonEdit;
    lblSpin: TLabel;
    edtSpin: TEsSpinEdit;
    lblCombo: TLabel;
    cbSkin: TEsComboBox;
    lblDate: TLabel;
    edtDate: TEsDateEdit;
    btnMenu: TEsButton;
    pmExport: TPopupMenu;
    miCSV: TMenuItem;
    miClipboard: TMenuItem;
    pmApp: TPopupMenu;
    miAbout: TMenuItem;
    miExit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NavBarItemClick(Sender: TObject; AItem: TEsNavBarItem);
    procedure RibbonCmd(Sender: TObject);
    procedure SkinItemClick(Sender: TObject);
    procedure swDarkSwitch(Sender: TObject);
    procedure trkValueTracking(Sender: TObject);
    procedure btnPrimaryClick(Sender: TObject);
    procedure btnDangerClick(Sender: TObject);
    procedure edtButtonButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cbSkinChange(Sender: TObject);
    procedure miCSVClick(Sender: TObject);
    procedure miClipboardClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure GridCustomDrawCell(Sender: TEsGrid; ACanvas: TCanvas;
      const ARect: TRect; ARecordIndex: Integer; AColumn: TEsGridColumn;
      ASelected: Boolean; var ADone: Boolean);
  private
    FImages: TImageList;
    FLargeImages: TImageList;
    FDataSet: TBufDataset;
    FDataSource: TDataSource;
    procedure LoadIcons;
    procedure FillSalesGrid;
    procedure CreateDataSetDemo;
    procedure ShowPage(APage: TPanel);
    procedure SyncRibbonChecks;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

const
  Countries: array[0..5] of string = ('Brasil', 'Portugal', 'Argentina',
    'Chile', 'México', 'Espanha');
  Products: array[0..7] of string = ('Notebook', 'Monitor 27"', 'Teclado',
    'Mouse', 'Headset', 'Webcam', 'SSD 1TB', 'Dock USB-C');
  Sellers: array[0..4] of string = ('Ana', 'Bruno', 'Carla', 'Diego', 'Elisa');
  Cities: array[0..4] of string = ('São Paulo', 'Rio de Janeiro', 'Curitiba',
    'Recife', 'Porto Alegre');
  Prices: array[0..7] of Double = (4899, 1899, 349, 129, 459, 399, 589, 1299);

  IconNames: array[0..11] of string = ('tesgrid', 'tesgroupbox', 'tesnavbar',
    'tescombobox', 'tesbuttonedit', 'tesribbon', 'tesfxlayout', 'tesfxfloatanimation',
    'tesskincontroller', 'tesfxswitch', 'tesspinedit', 'tesfxcoloranimation');

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  K: TEsStyleKind;
begin
  LoadIcons;
  Ribbon.Images := FImages;
  Ribbon.LargeImages := FLargeImages;
  NavBar.Images := FImages;
  FillSalesGrid;
  CreateDataSetDemo;
  for K := Low(TEsStyleKind) to High(TEsStyleKind) do
    cbSkin.Items.Add(EsStyleName(K));
  cbSkin.ItemIndex := Ord(SkinController.SkinName);
  edtDate.Date := Date;
  trkValueTracking(nil);
  ShowPage(pnlGrid);
  SyncRibbonChecks;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FDataSet.Free;
end;

procedure TForm1.LoadIcons;
var
  I: Integer;
  Png: TPortableNetworkGraphic;

  procedure AddTo(IL: TImageList; const ResName: string);
  begin
    Png := TPortableNetworkGraphic.Create;
    try
      try
        Png.LoadFromResourceName(HInstance, ResName);
        IL.Add(Png, nil);
      except
        IL.Add(nil, nil); // mantém índices alinhados
      end;
    finally
      Png.Free;
    end;
  end;

begin
  FImages := TImageList.Create(Self);
  FImages.Width := 24;
  FImages.Height := 24;
  FLargeImages := TImageList.Create(Self);
  FLargeImages.Width := 36;
  FLargeImages.Height := 36;
  for I := 0 to High(IconNames) do
  begin
    AddTo(FImages, UpperCase(IconNames[I]));
    AddTo(FLargeImages, UpperCase(IconNames[I] + '_150'));
  end;
end;

procedure TForm1.FillSalesGrid;
var
  I, Qty, P: Integer;
  R: Integer;
begin
  RandSeed := 2026;
  Grid.DataController.BeginUpdate;
  try
    for I := 1 to 400 do
    begin
      P := Random(Length(Products));
      Qty := 1 + Random(12);
      R := Grid.DataController.AppendRecord;
      Grid.DataController.Values[R, 0] := I;
      Grid.DataController.Values[R, 1] := Countries[Random(Length(Countries))];
      Grid.DataController.Values[R, 2] := Products[P];
      Grid.DataController.Values[R, 3] := Sellers[Random(Length(Sellers))];
      Grid.DataController.Values[R, 4] := VarFromDateTime(EncodeDate(2026, 1, 1) + Random(300));
      Grid.DataController.Values[R, 5] := Qty;
      Grid.DataController.Values[R, 6] := Prices[P] * Qty;
      Grid.DataController.Values[R, 7] := Random(3) > 0;
    end;
  finally
    Grid.DataController.EndUpdate;
  end;
  Grid.GroupBy(Grid.Columns[1]); // País
  Grid.FullCollapse;
end;

procedure TForm1.CreateDataSetDemo;
var
  I: Integer;
begin
  FDataSet := TBufDataset.Create(nil);
  FDataSet.FieldDefs.Add('Codigo', ftInteger);
  FDataSet.FieldDefs.Add('Cliente', ftString, 40);
  FDataSet.FieldDefs.Add('Cidade', ftString, 30);
  FDataSet.FieldDefs.Add('Limite', ftCurrency);
  FDataSet.FieldDefs.Add('Cadastro', ftDate);
  FDataSet.FieldDefs.Add('Ativo', ftBoolean);
  FDataSet.CreateDataset;
  RandSeed := 7;
  for I := 1 to 60 do
  begin
    FDataSet.Append;
    FDataSet.FieldByName('Codigo').AsInteger := I;
    FDataSet.FieldByName('Cliente').AsString := Format('Cliente %.3d', [I]);
    FDataSet.FieldByName('Cidade').AsString := Cities[Random(Length(Cities))];
    FDataSet.FieldByName('Limite').AsCurrency := 1000 + Random(50) * 250;
    FDataSet.FieldByName('Cadastro').AsDateTime := EncodeDate(2025, 1, 1) + Random(600);
    FDataSet.FieldByName('Ativo').AsBoolean := Random(4) > 0;
    FDataSet.Post;
  end;
  FDataSet.First;
  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FDataSet;
  // colunas criadas automaticamente a partir dos campos (como "Retrieve Fields")
  GridDB.DataSource := FDataSource;
  GridDB.Columns.ColumnByFieldName('Limite').SummaryKind := skSum;
  GridDB.Columns.ColumnByFieldName('Codigo').SummaryKind := skCount;
end;

procedure TForm1.ShowPage(APage: TPanel);
begin
  pnlGrid.Visible := APage = pnlGrid;
  pnlDataSet.Visible := APage = pnlDataSet;
  pnlFmx.Visible := APage = pnlFmx;
  pnlEditors.Visible := APage = pnlEditors;
end;

procedure TForm1.NavBarItemClick(Sender: TObject; AItem: TEsNavBarItem);
begin
  case AItem.Tag of
    0: ShowPage(pnlGrid);
    1: ShowPage(pnlDataSet);
    2: ShowPage(pnlFmx);
    3: ShowPage(pnlEditors);
  end;
end;

procedure TForm1.SyncRibbonChecks;
var
  It: TEsRibbonItem;
begin
  It := Ribbon.FindItemByCaption('Rodapé');
  if It <> nil then It.Down := Grid.OptionsView.Footer;
  It := Ribbon.FindItemByCaption('Linha de filtro');
  if It <> nil then It.Down := Grid.OptionsView.FilterRow;
  It := Ribbon.FindItemByCaption('Pesquisa');
  if It <> nil then It.Down := Grid.OptionsView.FindPanel;
end;

procedure TForm1.RibbonCmd(Sender: TObject);
var
  It: TEsRibbonItem;
begin
  It := Sender as TEsRibbonItem;
  case It.Tag of
    1: if Grid.Columns[1].GroupIndex >= 0 then Grid.ClearGrouping
       else Grid.GroupBy(Grid.Columns[1]);
    2: Grid.OptionsView.Footer := It.Down;
    3: Grid.OptionsView.FilterRow := It.Down;
    4: Grid.OptionsView.FindPanel := It.Down;
    5: Grid.FullExpand;
    6: Grid.FullCollapse;
    7: Grid.ApplyBestFit;
    8:
      begin
        ShowPage(pnlFmx);
        btnPrimaryClick(nil);
        Exit;
      end;
  end;
  ShowPage(pnlGrid);
end;

procedure TForm1.SkinItemClick(Sender: TObject);
var
  It: TEsRibbonItem;
begin
  It := Sender as TEsRibbonItem;
  SkinController.SkinName := TEsStyleKind(It.Tag);
  cbSkin.ItemIndex := It.Tag;
end;

procedure TForm1.cbSkinChange(Sender: TObject);
begin
  if cbSkin.ItemIndex >= 0 then
    SkinController.SkinName := TEsStyleKind(cbSkin.ItemIndex);
  swDark.IsChecked := EsCurrentTheme.Dark;
end;

procedure TForm1.swDarkSwitch(Sender: TObject);
begin
  if swDark.IsChecked then
    SkinController.SkinName := dsDark
  else
    SkinController.SkinName := dsLight;
  cbSkin.ItemIndex := Ord(SkinController.SkinName);
end;

procedure TForm1.trkValueTracking(Sender: TObject);
begin
  prgValue.Value := trkValue.Value;
  arcValue.Value := trkValue.Value;
  aniBusy.Active := trkValue.Value < 100;
end;

procedure TForm1.btnPrimaryClick(Sender: TObject);
begin
  // TAnimator do FMX: anima qualquer propriedade numérica
  if Card.XRadius < 20 then
    TEsFxAnimator.AnimateFloat(Card, 'XRadius', 28, 0.5, atOut, itBack)
  else
    TEsFxAnimator.AnimateFloat(Card, 'XRadius', 12, 0.5, atOut, itBounce);
  TEsFxAnimator.AnimateFloat(trkValue, 'Value', Random(101), 0.6, atInOut, itCubic);
end;

procedure TForm1.btnDangerClick(Sender: TObject);
begin
  TEsFxAnimator.AnimateColor(Card, 'Fill.Color',
    MakeAlphaColor(Random(256), Random(256), Random(256)), 0.4);
end;

procedure TForm1.edtButtonButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if edtButton.Buttons[AButtonIndex].Kind = sbkEllipsis then
    ShowMessage('Botão "..." clicado. Texto atual: ' + edtButton.Text);
end;

procedure TForm1.miCSVClick(Sender: TObject);
var
  Dlg: TSaveDialog;
begin
  Dlg := TSaveDialog.Create(nil);
  try
    Dlg.Filter := 'CSV (*.csv)|*.csv';
    Dlg.DefaultExt := 'csv';
    Dlg.FileName := 'vendas.csv';
    if Dlg.Execute then
      Grid.ExportToCSV(Dlg.FileName);
  finally
    Dlg.Free;
  end;
end;

procedure TForm1.miClipboardClick(Sender: TObject);
begin
  Grid.CopyToClipboard;
end;

procedure TForm1.miAboutClick(Sender: TObject);
begin
  ShowMessage('ESKit para Lazarus' + LineEnding +
    'Componentes no estilo FireMonkey (TFx*) e DevExpress (TSx*).');
end;

procedure TForm1.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.GridCustomDrawCell(Sender: TEsGrid; ACanvas: TCanvas;
  const ARect: TRect; ARecordIndex: Integer; AColumn: TEsGridColumn;
  ASelected: Boolean; var ADone: Boolean);
var
  V: Variant;
  W: Integer;
  R: TRect;
begin
  // barra de "dados" na coluna Total (exemplo de OnCustomDrawCell)
  if (AColumn.FieldName <> 'Total') or ASelected then Exit;
  V := Sender.GetCellValue(ARecordIndex, AColumn);
  if VarIsNull(V) then Exit;
  W := Round((ARect.Right - ARect.Left - 6) * Min(1, Double(V) / 50000));
  R := Rect(ARect.Left + 3, ARect.Top + 4, ARect.Left + 3 + W, ARect.Bottom - 4);
  ACanvas.Brush.Color := AlphaColorToColor(FadeColor(EsCurrentTheme.Accent, 1));
  ACanvas.Brush.Color := AlphaColorToColor(BlendOver(EsCurrentTheme.Surface,
    FadeColor(EsCurrentTheme.Accent, 0.25)));
  ACanvas.FillRect(R);
end;

end.
