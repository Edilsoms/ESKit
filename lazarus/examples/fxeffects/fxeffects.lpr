program fxeffects;

{ Teste/demonstração dos efeitos FX (brilho, desfoque, vidro fosco) e dos
  arquivos de tema. Uso: fxeffects [pasta-de-saída] }

{$mode objfpc}{$H+}

uses
  Interfaces, Classes, SysUtils, Math, Forms, Controls, Graphics, EsGraphics, EsTheme,
  EsFxBase, EsFxShapes, EsFxStdCtrls;

var
  Fails: Integer = 0;
  OutDir: string;

procedure Check(C: Boolean; const M: string);
begin
  if C then WriteLn('OK    ', M) else begin WriteLn('FALHA ', M); Inc(Fails); end;
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

function Snap(F: TForm; const AName: string): TBitmap;
var
  P: TPortableNetworkGraphic;
begin
  Pump;
  Result := F.GetFormImage;
  P := TPortableNetworkGraphic.Create;
  try
    P.Assign(Result);
    P.SaveToFile(IncludeTrailingPathDelimiter(OutDir) + AName);
  finally
    P.Free;
  end;
end;

{ variação média entre pixels vizinhos (mede nitidez) }
function Sharpness(B: TBitmap; const R: TRect): Double;
var
  X, Y, N: Integer;
  C1, C2: TColor;
begin
  Result := 0;
  N := 0;
  for Y := R.Top to R.Bottom - 1 do
    for X := R.Left to R.Right - 1 do
    begin
      // vizinho de baixo (as listras são horizontais)
      C1 := B.Canvas.Pixels[X, Y];
      C2 := B.Canvas.Pixels[X, Y + 1];
      Result := Result + Abs(Red(C1) - Red(C2)) + Abs(Green(C1) - Green(C2)) +
        Abs(Blue(C1) - Blue(C2));
      Inc(N);
    end;
  if N > 0 then Result := Result / N;
end;

var
  F: TForm;
  Bg, R, Glass: TEsFxRectangle;
  E, Blurred: TEsFxEllipse;
  Stripes: array[0..11] of TEsFxLine;
  SB: TEsFxStyleBook;
  T1, T2: TEsTheme;
  K: TEsStyleKind;
  L: TStringList;
  B: TBitmap;
  MS: TMemoryStream;
  SS: TStringStream;
  I: Integer;
  Sharp1, Sharp2, SharpOut: Double;

begin
  OutDir := ParamStr(1);
  if OutDir = '' then OutDir := '.';
  Application.Initialize;
  EsThemes.ApplyStyle(dsLight);
  F := TForm.CreateNew(nil);
  F.SetBounds(0, 0, 640, 300);
  F.Color := clWhite;

  // ---- brilho ----
  R := TEsFxRectangle.Create(F); R.Parent := F; R.SetBounds(20, 20, 180, 120);
  R.XRadius := 12; R.YRadius := 12; R.Fill.Color := TAlphaColor($FF3060C0);
  R.Glow.Enabled := True; R.Glow.Softness := 14;
  E := TEsFxEllipse.Create(F); E.Parent := F; E.SetBounds(220, 20, 160, 140);
  E.Fill.Color := TAlphaColor($FF20A060); E.Glow.Enabled := True;
  E.Glow.GlowColor := TAlphaColor($FF00C0FF); E.Shadow.Enabled := True;

  // ---- fundo listrado + vidro fosco + forma desfocada ----
  Bg := TEsFxRectangle.Create(F); Bg.Parent := F; Bg.SetBounds(400, 10, 230, 280);
  Bg.Fill.Color := TAlphaColor($FFFFFFFF); Bg.Stroke.Kind := bkNone;
  for I := 0 to High(Stripes) do
  begin
    // linhas (controles gráficos) ficam por baixo das formas criadas depois
    Stripes[I] := TEsFxLine.Create(F);
    Stripes[I].Parent := Bg;
    Stripes[I].SetBounds(0, I * 24, 230, 12);
    Stripes[I].Stroke.Thickness := 12;
    if Odd(I) then Stripes[I].Stroke.Color := TAlphaColor($FFE91E63)
    else Stripes[I].Stroke.Color := TAlphaColor($FF1E88E5);
  end;
  Glass := TEsFxRectangle.Create(F); Glass.Parent := Bg; Glass.SetBounds(20, 40, 190, 90);
  Glass.XRadius := 14; Glass.YRadius := 14;
  Glass.Fill.Color := TAlphaColor($40FFFFFF); Glass.Stroke.Color := TAlphaColor($80FFFFFF);
  Glass.BackgroundBlur := 6;
  Blurred := TEsFxEllipse.Create(F); Blurred.Parent := Bg; Blurred.SetBounds(60, 160, 110, 110);
  Blurred.Fill.Color := TAlphaColor($FF222222); Blurred.Stroke.Kind := bkNone;
  Blurred.Blur.Enabled := True; Blurred.Blur.Softness := 5;

  F.Show;
  B := Snap(F, 'efeitos.png');
  Check(Red(B.Canvas.Pixels[20 + 14 + 3 - 6, 80]) > 200, 'brilho visível fora da forma');
  // vidro: dentro (sem as bordas) bem menos nítido que as listras fora
  Sharp1 := Sharpness(B, Rect(400 + 40, 10 + 60, 400 + 190, 10 + 110));
  SharpOut := Sharpness(B, Rect(400 + 40, 10 + 0, 400 + 190, 10 + 36));
  Check(Sharp1 < SharpOut * 0.5, Format('vidro fosco desfoca o fundo (%.1f < %.1f)', [Sharp1, SharpOut]));
  // forma desfocada: borda suave, fundo em volta continua listrado e nítido
  // borda esquerda da forma desfocada, numa faixa branca entre as listras:
  // transição gradual (degrau máximo pequeno) em vez de um corte
  Sharp2 := 0;
  for I := 400 + 30 to 400 + 115 do
    Sharp2 := Max(Sharp2, Abs(Red(B.Canvas.Pixels[I, 10 + 186]) - Red(B.Canvas.Pixels[I + 1, 10 + 186])));
  Check((Sharp2 > 0) and (Sharp2 < 40), Format('Blur suaviza a borda da forma (degrau máx. %.0f)', [Sharp2]));
  // centro da forma: escuro e sem as listras vazando
  Check(Sharpness(B, Rect(400 + 100, 10 + 205, 400 + 130, 10 + 225)) < 3,
    'centro da forma desfocada é sólido (o fundo não vaza)');
  Check(Sharpness(B, Rect(400 + 2, 10 + 240, 400 + 40, 10 + 264)) > SharpOut * 0.7,
    'fundo ao lado da forma desfocada continua nítido');
  B.Free;

  // desfoque desligado = desenho idêntico ao original
  Blurred.Blur.Enabled := False;
  B := Snap(F, 'sem_desfoque.png');
  Check(B.Canvas.Pixels[400 + 115, 10 + 215] = RGBToColor($22, $22, $22), 'Blur desligado: cor sólida');
  B.Free;

  // ---- arquivos de tema ----
  EsThemes.ApplyStyle(dsOffice2019Black, TAlphaColor($FFE91E63));
  T1 := EsThemes.Theme;
  EsThemes.SaveToFile(IncludeTrailingPathDelimiter(OutDir) + 't.estheme');
  EsThemes.ApplyStyle(dsLight);
  EsThemes.LoadFromFile(IncludeTrailingPathDelimiter(OutDir) + 't.estheme');
  T2 := EsThemes.Theme;
  Check(CompareMem(@T1.Background, @T2.Background,
    PtrUInt(@T1.RibbonBody) - PtrUInt(@T1.Background) + SizeOf(TAlphaColor)),
    'tema salvo e lido: cores idênticas');
  Check((T2.Accent = TAlphaColor($FFE91E63)) and (EsThemes.Kind = dsOffice2019Black) and
    (T2.Name = T1.Name) and (T2.Radius = T1.Radius), 'destaque, base, nome e raio preservados');
  L := TStringList.Create;
  L.Text := '[ESKitTheme]'#10'Base=Dark'#10'Accent=#FF8800'#10'Radius=9';
  T2 := EsThemeFromStrings(L, K);
  Check((K = dsDark) and (T2.Accent = TAlphaColor($FFFF8800)) and (T2.Radius = 9) and
    (T2.Background = EsBuildTheme(dsDark).Background), 'arquivo parcial: chaves ausentes vêm da base');
  SB := TEsFxStyleBook.Create(F);
  SB.CustomStyle := L;
  Check(EsThemes.Theme.Accent = TAlphaColor($FFFF8800), 'CustomStyle aplicado');
  MS := TMemoryStream.Create;
  SS := TStringStream.Create('');
  MS.WriteComponent(SB);
  MS.Position := 0;
  ObjectBinaryToText(MS, SS);
  Check(Pos('Accent=#FF8800', SS.DataString) > 0, 'CustomStyle gravado no formulário');
  MS.Free;
  SS.Free;
  SB.StyleFile := IncludeTrailingPathDelimiter(ExpandFileName(OutDir)) + 't.estheme';
  Check(EsThemes.Theme.Accent = TAlphaColor($FFE91E63), 'StyleFile tem prioridade');
  L.Free;

  F.Free;
  WriteLn('Falhas: ', Fails);
  if Fails > 0 then Halt(1);
end.
