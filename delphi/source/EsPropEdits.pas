{
 *****************************************************************************
  ESKit para Delphi (design-time) - EsPropEdits.pas
  Editores de propriedade do Object Inspector:
    - TAlphaColor: nome da cor (ou #AARRGGBB), amostra colorida, lista de
      cores nomeadas e diálogo de cor (preservando o alfa)
    - TEsConnection.DriverID: lista dos drivers FireDAC registrados

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsPropEdits;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.UITypes, Vcl.Graphics,
  Vcl.Dialogs, DesignIntf, DesignEditors, VCLEditors, EsGraphics;

type
  { TEsAlphaColorProperty }

  TEsAlphaColorProperty = class(TOrdinalProperty, ICustomPropertyDrawing,
    ICustomPropertyListDrawing)
  private
    function GetColor: TAlphaColor;
    procedure SetColor(C: TAlphaColor);
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure Edit; override;
    { ICustomPropertyListDrawing }
    procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
      var AHeight: Integer);
    procedure ListMeasureWidth(const Value: string; ACanvas: TCanvas;
      var AWidth: Integer);
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
      const ARect: TRect; ASelected: Boolean);
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
  end;

  { TEsDriverIDProperty - lista de drivers da TEsConnection }

  TEsDriverIDProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

implementation

uses
  EsDB;

{ TEsAlphaColorProperty }

function TEsAlphaColorProperty.GetColor: TAlphaColor;
begin
  Result := TAlphaColor(Cardinal(GetOrdValue));
end;

procedure TEsAlphaColorProperty.SetColor(C: TAlphaColor);
begin
  SetOrdValue(Longint(Cardinal(C)));
end;

function TEsAlphaColorProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paDialog, paValueList, paRevertable];
end;

function TEsAlphaColorProperty.GetValue: string;
begin
  Result := AlphaColorToString(GetColor);
end;

procedure TEsAlphaColorProperty.SetValue(const Value: string);
var
  C: TAlphaColor;
begin
  if StringToAlphaColor(Value, C) then
    SetColor(C)
  else
    raise EConvertError.CreateFmt('Cor inválida: "%s". Use um nome ou #AARRGGBB.', [Value]);
end;

procedure TEsAlphaColorProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := Low(EsNamedColors) to High(EsNamedColors) do
    Proc(EsNamedColors[I].Name);
end;

procedure TEsAlphaColorProperty.Edit;
var
  Dlg: TColorDialog;
  C: TAlphaColor;
  A: Byte;
begin
  C := GetColor;
  A := AlphaOf(C);
  if A = 0 then A := 255;
  Dlg := TColorDialog.Create(nil);
  try
    Dlg.Options := [cdFullOpen];
    Dlg.Color := AlphaColorToColor(C);
    if Dlg.Execute then
      SetColor(ColorToAlphaColor(Dlg.Color, A));
  finally
    Dlg.Free;
  end;
end;

procedure TEsAlphaColorProperty.ListMeasureHeight(const Value: string;
  ACanvas: TCanvas; var AHeight: Integer);
begin
  // mantém a altura padrão
end;

procedure TEsAlphaColorProperty.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
begin
  AWidth := AWidth + ACanvas.TextHeight('M') + 6;
end;

procedure TEsAlphaColorProperty.ListDrawValue(const Value: string;
  ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
var
  C: TAlphaColor;
  SW: TRect;
  OldBrush, OldPen: TColor;
  CX, CY: Integer;
begin
  if not StringToAlphaColor(Value, C) then C := TAlphaColors.Null;
  SW := Rect(ARect.Left + 2, ARect.Top + 2, ARect.Left + (ARect.Bottom - ARect.Top) + 2,
    ARect.Bottom - 2);
  OldBrush := ACanvas.Brush.Color;
  OldPen := ACanvas.Pen.Color;
  ACanvas.FillRect(ARect);
  // xadrez para indicar transparência
  ACanvas.Brush.Color := clWhite;
  ACanvas.FillRect(SW);
  ACanvas.Brush.Color := clSilver;
  CX := (SW.Left + SW.Right) div 2;
  CY := (SW.Top + SW.Bottom) div 2;
  ACanvas.FillRect(Rect(SW.Left, SW.Top, CX, CY));
  ACanvas.FillRect(Rect(CX, CY, SW.Right, SW.Bottom));
  if AlphaOf(C) > 0 then
  begin
    ACanvas.Brush.Color := AlphaColorToColor(BlendOver(TAlphaColors.White, C));
    ACanvas.FillRect(SW);
  end;
  ACanvas.Pen.Color := clBlack;
  ACanvas.Brush.Style := bsClear;
  ACanvas.Rectangle(SW);
  ACanvas.Brush.Style := bsSolid;
  ACanvas.Brush.Color := OldBrush;
  ACanvas.Pen.Color := OldPen;
  DefaultPropertyListDrawValue(Value, ACanvas,
    Rect(SW.Right + 2, ARect.Top, ARect.Right, ARect.Bottom), ASelected);
end;

procedure TEsAlphaColorProperty.PropDrawName(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;

procedure TEsAlphaColorProperty.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  if GetVisualValue <> '' then
    ListDrawValue(GetVisualValue, ACanvas, ARect, ASelected)
  else
    DefaultPropertyDrawValue(Self, ACanvas, ARect);
end;

{ TEsDriverIDProperty }

function TEsDriverIDProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paRevertable];
end;

procedure TEsDriverIDProperty.GetValues(Proc: TGetStrProc);
var
  L: TStringList;
  I: Integer;
begin
  L := TStringList.Create;
  try
    TEsConnection.GetDriverIDs(L);
    for I := 0 to L.Count - 1 do
      Proc(L[I]);
  finally
    L.Free;
  end;
end;

end.
