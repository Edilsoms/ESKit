{
 *****************************************************************************
  ESKit (design-time) - espropedits.pas
  Editor de propriedades para TAlphaColor no Inspetor de Objetos, igual ao
  do Delphi/FMX: mostra o nome da cor (ou #AARRGGBB), amostra colorida,
  lista de cores nomeadas e diálogo de cor (preservando o alfa).

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsPropEdits;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, TypInfo, Graphics, Dialogs, PropEdits, EsGraphics, EsDB;

type

  { TEsAlphaColorPropertyEditor }

  TEsAlphaColorPropertyEditor = class(TPropertyEditor)
  private
    function GetColor: TAlphaColor;
    procedure SetColor(C: TAlphaColor);
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: ansistring; override;
    procedure SetValue(const NewValue: ansistring); override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure Edit; override;
    procedure ListMeasureWidth(const CurValue: ansistring; Index: integer;
      ACanvas: TCanvas; var AWidth: Integer); override;
    procedure ListDrawValue(const CurValue: ansistring; Index: integer;
      ACanvas: TCanvas; const ARect: TRect; AState: TPropEditDrawState); override;
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      AState: TPropEditDrawState); override;
  end;

  { TEsDriverIDPropertyEditor - lista de drivers da TEsConnection }

  TEsDriverIDPropertyEditor = class(TStringPropertyEditor)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  { TEsTableNamePropertyEditor - tabelas do banco (com a conexão ativa) }

  TEsTableNamePropertyEditor = class(TStringPropertyEditor)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

implementation

{ TEsDriverIDPropertyEditor }

function TEsDriverIDPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paRevertable];
end;

procedure TEsDriverIDPropertyEditor.GetValues(Proc: TGetStrProc);
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

{ TEsTableNamePropertyEditor }

function TEsTableNamePropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paRevertable];
end;

procedure TEsTableNamePropertyEditor.GetValues(Proc: TGetStrProc);
var
  T: TEsTable;
  L: TStringList;
  I: Integer;
begin
  if not (GetComponent(0) is TEsTable) then Exit;
  T := TEsTable(GetComponent(0));
  if (T.Connection = nil) or not T.Connection.Connected then Exit;
  L := TStringList.Create;
  try
    try
      T.Connection.GetTableNames(L, False);
    except
      Exit; // driver sem suporte: deixa digitar o nome
    end;
    for I := 0 to L.Count - 1 do
      Proc(L[I]);
  finally
    L.Free;
  end;
end;

{ TEsAlphaColorPropertyEditor }

function TEsAlphaColorPropertyEditor.GetColor: TAlphaColor;
begin
  Result := TAlphaColor(Cardinal(GetOrdValue));
end;

procedure TEsAlphaColorPropertyEditor.SetColor(C: TAlphaColor);
begin
  SetOrdValue(Longint(Cardinal(C)));
end;

function TEsAlphaColorPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paDialog, paValueList, paCustomDrawn, paRevertable];
end;

function TEsAlphaColorPropertyEditor.GetValue: ansistring;
begin
  Result := AlphaColorToString(GetColor);
end;

procedure TEsAlphaColorPropertyEditor.SetValue(const NewValue: ansistring);
var
  C: TAlphaColor;
begin
  if StringToAlphaColor(NewValue, C) then
    SetColor(C)
  else
    raise EPropertyError.CreateFmt('Cor inválida: "%s". Use um nome ou #AARRGGBB.', [NewValue]);
end;

procedure TEsAlphaColorPropertyEditor.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := Low(EsNamedColors) to High(EsNamedColors) do
    Proc(EsNamedColors[I].Name);
end;

procedure TEsAlphaColorPropertyEditor.Edit;
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
    Dlg.Color := AlphaColorToColor(C);
    if Dlg.Execute then
      SetColor(ColorToAlphaColor(Dlg.Color, A));
  finally
    Dlg.Free;
  end;
end;

procedure TEsAlphaColorPropertyEditor.ListMeasureWidth(const CurValue: ansistring;
  Index: integer; ACanvas: TCanvas; var AWidth: Integer);
begin
  AWidth := ACanvas.TextWidth('Fluent Blue') + 30;
end;

procedure TEsAlphaColorPropertyEditor.ListDrawValue(const CurValue: ansistring;
  Index: integer; ACanvas: TCanvas; const ARect: TRect; AState: TPropEditDrawState);
var
  C: TAlphaColor;
  SW: TRect;
  OldBrush, OldPen: TColor;
  CX, CY: Integer;
begin
  if not StringToAlphaColor(CurValue, C) then C := TAlphaColors.Null;
  SW := Rect(ARect.Left + 2, ARect.Top + 2, ARect.Left + (ARect.Bottom - ARect.Top) + 2,
    ARect.Bottom - 2);
  OldBrush := ACanvas.Brush.Color;
  OldPen := ACanvas.Pen.Color;
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
  inherited ListDrawValue(CurValue, Index, ACanvas,
    Rect(SW.Right + 2, ARect.Top, ARect.Right, ARect.Bottom), AState);
end;

procedure TEsAlphaColorPropertyEditor.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; AState: TPropEditDrawState);
begin
  ListDrawValue(GetVisualValue, -1, ACanvas, ARect, [pedsInEdit]);
end;

end.
