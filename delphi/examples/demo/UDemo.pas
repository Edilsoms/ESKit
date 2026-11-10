unit UDemo;

{ Demo do ESKit para Delphi: grade estilo DevExpress com a barra de
  ferramentas (TEsToolBarGrid), editores e controles estilo FireMonkey.
  Tudo criado em código, para funcionar sem .dfm. }

interface

uses
  System.SysUtils, System.Classes, System.Variants, System.UITypes, Vcl.Controls,
  Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls,
  EsGraphics, EsTheme, EsFxBase, EsFxShapes, EsFxStdCtrls, EsSkins, EsEditors,
  EsGrid, EsToolBarGrid;

type
  TDemoForm = class(TForm)
  private
    FSkin: TEsSkinController;
    FTop: TEsFxRectangle;
    FTitle: TEsFxText;
    FDark: TEsFxSwitch;
    FDarkText: TEsFxText;
    FSearch: TEsButtonEdit;
    FDate: TEsDateEdit;
    FBar: TEsToolBarGrid;
    FGrid: TEsGrid;
    procedure DarkChange(Sender: TObject);
    procedure BuildGrid;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  DemoForm: TDemoForm;

implementation

const
  Countries: array[0..5] of string = ('Brasil', 'Argentina', 'Chile', 'Portugal',
    'Espanha', 'México');
  Products: array[0..4] of string = ('Notebook', 'Monitor', 'Teclado', 'Mouse',
    'Headset');
  Prices: array[0..4] of Double = (4200, 1100, 180, 90, 350);

constructor TDemoForm.Create(AOwner: TComponent);
begin
  // sem .dfm: CreateNew em vez de Create
  inherited CreateNew(AOwner);
  Caption := 'ESKit para Delphi';
  Width := 1100;
  Height := 700;
  Position := poScreenCenter;

  FSkin := TEsSkinController.Create(Self);
  FSkin.SkinName := dsOffice2019Colorful;

  FTop := TEsFxRectangle.Create(Self);
  FTop.Parent := Self;
  FTop.Align := alTop;
  FTop.Height := 56;
  FTop.ThemeFill := tfSurface;
  FTop.Stroke.Kind := bkNone;

  FTitle := TEsFxText.Create(Self);
  FTitle.Parent := FTop;
  FTitle.SetBounds(16, 12, 260, 32);
  FTitle.Text := 'Vendas 2026';
  FTitle.TextSettings.HorzAlign := txLeading;
  FTitle.Font.Size := 14;

  FSearch := TEsButtonEdit.Create(Self);
  FSearch.Parent := FTop;
  FSearch.SetBounds(300, 16, 220, 24);
  FSearch.TextHint := 'Pesquisar...';
  FSearch.Buttons[0].Kind := sbkSearch;

  FDate := TEsDateEdit.Create(Self);
  FDate.Parent := FTop;
  FDate.SetBounds(536, 16, 130, 24);
  FDate.Date := Date;

  FDark := TEsFxSwitch.Create(Self);
  FDark.Parent := FTop;
  FDark.SetBounds(690, 14, 52, 28);
  FDark.OnSwitch := DarkChange;

  FDarkText := TEsFxText.Create(Self);
  FDarkText.Parent := FTop;
  FDarkText.SetBounds(750, 14, 120, 28);
  FDarkText.Text := 'Tema escuro';
  FDarkText.TextSettings.HorzAlign := txLeading;

  FBar := TEsToolBarGrid.Create(Self);
  FBar.Parent := Self;
  FBar.Align := alTop;
  FBar.Top := 100;

  FGrid := TEsGrid.Create(Self);
  FGrid.Name := 'GridVendas';
  FGrid.Parent := Self;
  FGrid.Align := alClient;
  BuildGrid;

  FBar.Grid := FGrid;
  FBar.User := 'demo';
  FBar.TitleReport := 'Relatório de vendas';
  FBar.CompanyName := 'ESKit';
end;

procedure TDemoForm.BuildGrid;
var
  C: TEsGridColumn;
  I, R, P, Qty: Integer;

  function AddCol(const ACaption, AField: string; AWidth: Integer): TEsGridColumn;
  begin
    Result := FGrid.Columns.Add;
    Result.Caption := ACaption;
    Result.FieldName := AField;
    Result.Width := AWidth;
  end;

begin
  FGrid.OptionsView.Footer := True;
  FGrid.OptionsView.FilterRow := True;
  AddCol('Nº', 'Id', 60);
  AddCol('País', 'Pais', 120);
  AddCol('Produto', 'Produto', 150);
  C := AddCol('Data', 'Data', 110);
  C.DisplayFormat := 'dd/mm/yyyy';
  C := AddCol('Qtd', 'Qtd', 80);
  C.FooterSummaries := [skSum];
  C := AddCol('Total (R$)', 'Total', 120);
  C.DisplayFormat := '#,##0.00';
  C.FooterSummaries := [skSum, skAverage];
  RandSeed := 2026;
  FGrid.DataController.BeginUpdate;
  try
    for I := 1 to 300 do
    begin
      P := Random(Length(Products));
      Qty := 1 + Random(10);
      R := FGrid.DataController.AppendRecord;
      FGrid.DataController.Values[R, 0] := I;
      FGrid.DataController.Values[R, 1] := Countries[Random(Length(Countries))];
      FGrid.DataController.Values[R, 2] := Products[P];
      FGrid.DataController.Values[R, 3] := VarFromDateTime(EncodeDate(2026, 1, 1) + Random(300));
      FGrid.DataController.Values[R, 4] := Qty;
      FGrid.DataController.Values[R, 5] := Prices[P] * Qty;
    end;
  finally
    FGrid.DataController.EndUpdate;
  end;
  FGrid.GroupBy(FGrid.Columns[1]);
end;

procedure TDemoForm.DarkChange(Sender: TObject);
begin
  if FDark.IsChecked then
    FSkin.SkinName := dsOffice2019Black
  else
    FSkin.SkinName := dsOffice2019Colorful;
end;

end.
