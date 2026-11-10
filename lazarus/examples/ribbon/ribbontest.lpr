program ribbontest;

{ Teste/demonstração da TEsRibbon: barra de acesso rápido, galerias,
  abas contextuais e KeyTips. Uso: ribbontest [pasta-de-saída]. }

{$mode objfpc}{$H+}

uses
  Interfaces, Classes, SysUtils, Forms, Controls, Graphics, ExtCtrls, StdCtrls, LCLType,
  ImgList, EsGraphics, EsTheme, EsSkins, EsRibbon;

type
  TRibbonHack = class(TEsRibbon);

  { THandlers }

  THandlers = class
    Clicks: Integer;
    GalleryHits: Integer;
    LastGallery: Integer;
    procedure ItemClick(Sender: TObject);
    procedure GalleryClick(Sender: TObject; AItem: TEsRibbonItem; AIndex: Integer);
  end;

var
  Fails: Integer = 0;
  OutDir: string;
  H: THandlers;

procedure THandlers.ItemClick(Sender: TObject);
begin
  Inc(Clicks);
end;

procedure THandlers.GalleryClick(Sender: TObject; AItem: TEsRibbonItem; AIndex: Integer);
begin
  Inc(GalleryHits);
  LastGallery := AIndex;
end;

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

function MakeImages(AOwner: TComponent; ASize: Integer): TImageList;
const
  Cols: array[0..5] of TColor = ($3A7BD5, $2EAD5B, $D9822B, $C0392B, $8E44AD, $16A0A0);
var
  B: TBitmap;
  I: Integer;
begin
  Result := TImageList.Create(AOwner);
  Result.Width := ASize;
  Result.Height := ASize;
  for I := 0 to High(Cols) do
  begin
    B := TBitmap.Create;
    try
      B.SetSize(ASize, ASize);
      B.Canvas.Brush.Color := clFuchsia;
      B.Canvas.FillRect(0, 0, ASize, ASize);
      B.Canvas.Brush.Color := Cols[I];
      B.Canvas.Pen.Color := clBlack;
      B.Canvas.RoundRect(1, 1, ASize - 1, ASize - 1, ASize div 3, ASize div 3);
      Result.AddMasked(B, clFuchsia);
    finally
      B.Free;
    end;
  end;
end;

function AddItem(G: TEsRibbonGroup; const ACaption: string; AImg: Integer;
  ASize: TEsRibbonItemSize; AStyle: TEsRibbonButtonStyle = rbsButton): TEsRibbonItem;
begin
  Result := G.Items.Add;
  Result.Caption := ACaption;
  Result.ImageIndex := AImg;
  Result.Size := ASize;
  Result.ButtonStyle := AStyle;
  Result.OnClick := @H.ItemClick;
end;

function LI(R: TEsRibbon; AItem: TEsRibbonItem): TRect;
begin
  Result := R.ItemRect(AItem);
end;

procedure Click(R: TEsRibbon; X, Y: Integer);
begin
  TRibbonHack(R).MouseDown(mbLeft, [], X, Y);
  TRibbonHack(R).MouseUp(mbLeft, [], X, Y);
  Pump;
end;

var
  F: TForm;
  R: TEsRibbon;
  Tab, TabCtx: TEsRibbonTab;
  G: TEsRibbonGroup;
  Save, Cut, Gal, Q: TEsRibbonItem;
  I: Integer;
  K: Word;
  IR: TRect;
  H0, CtxTabIdx: Integer;
  Memo: TMemo;
const
  Pal: array[0..5] of TColor = ($3A7BD5, $2EAD5B, $D9822B, $C0392B, $8E44AD, $16A0A0);

begin
  OutDir := GetCurrentDir;
  if ParamCount > 0 then OutDir := ParamStr(1);
  ForceDirectories(OutDir);
  Application.Initialize;
  H := THandlers.Create;
  F := TForm.CreateNew(nil);
  F.SetBounds(40, 40, 900, 330);
  F.Caption := 'TEsRibbon';
  R := TEsRibbon.Create(F);
  R.Parent := F;
  R.Images := MakeImages(F, 16);
  R.LargeImages := MakeImages(F, 32);
  Memo := TMemo.Create(F);
  Memo.Parent := F;
  Memo.Align := alClient;

  Tab := R.Tabs.Add;
  Tab.Caption := 'Início';
  G := Tab.Groups.Add;
  G.Caption := 'Arquivo';
  Save := AddItem(G, 'Salvar', 0, risLarge);
  Save.KeyTip := 'S';
  AddItem(G, 'Abrir', 1, risLarge);
  G := Tab.Groups.Add;
  G.Caption := 'Edição';
  Cut := AddItem(G, 'Recortar', 3, risSmall);
  AddItem(G, 'Copiar', 4, risSmall);
  AddItem(G, 'Colar', 5, risSmall);
  G := Tab.Groups.Add;
  G.Caption := 'Estilos';
  Gal := AddItem(G, 'Estilos', -1, risLarge, rbsGallery);
  Gal.GalleryColumns := 4;
  for I := 0 to 9 do
    with Gal.Gallery.Add do
    begin
      Caption := 'Estilo ' + IntToStr(I + 1);
      ImageIndex := I mod 6;
    end;
  G := Tab.Groups.Add;
  G.Caption := 'Cores';
  Q := AddItem(G, 'Cores', -1, risLarge, rbsGallery);
  Q.GalleryColumns := 3;
  for I := 0 to 5 do
    with Q.Gallery.Add do
      Color := ColorToAlphaColor(Pal[I]);
  R.OnGalleryClick := @H.GalleryClick;

  Tab := R.Tabs.Add;
  Tab.Caption := 'Inserir';
  G := Tab.Groups.Add;
  G.Caption := 'Objetos';
  AddItem(G, 'Tabela', 2, risLarge);
  AddItem(G, 'Imagem', 1, risLarge);

  TabCtx := R.Tabs.Add;
  TabCtx.Caption := 'Design';
  TabCtx.ContextCaption := 'Ferramentas de Tabela';
  TabCtx.ContextColor := ColorToAlphaColor($2EAD5B);
  TabCtx.Visible := False;
  CtxTabIdx := TabCtx.Index;
  G := TabCtx.Groups.Add;
  G.Caption := 'Linhas';
  AddItem(G, 'Inserir linha', 0, risLarge);
  AddItem(G, 'Excluir linha', 3, risLarge);

  F.Show;
  Pump;
  H0 := R.Height;
  Shot(F, 'ribbon_base.png');

  // ---- Acesso rápido ----
  R.AddToQuickAccess(Save);
  R.AddToQuickAccess(Cut);
  R.AddToQuickAccess(Save); // duplicado é ignorado
  Pump;
  Check(R.QuickAccessItems.Count = 2, 'QAT: 2 itens (duplicata ignorada)');
  IR := LI(R, R.QuickAccessItems[0]);
  Check(IR.Bottom <= TRibbonHack(R).HeaderHeight, 'QAT na barra de abas');
  H.Clicks := 0;
  Click(R, (IR.Left + IR.Right) div 2, (IR.Top + IR.Bottom) div 2);
  Check(H.Clicks = 1, 'clique no botão do acesso rápido executa OnClick');
  Shot(F, 'ribbon_qat.png');
  R.QuickAccessPosition := qapBelow;
  Pump;
  Check(R.Height > H0, 'QAT abaixo aumenta a altura');
  IR := LI(R, R.QuickAccessItems[0]);
  Check(IR.Top >= R.Height - TRibbonHack(R).QATBelowHeight, 'QAT desenhada abaixo do corpo');
  Shot(F, 'ribbon_qat_abaixo.png');
  R.QuickAccessPosition := qapTabBar;
  R.RemoveFromQuickAccess(Cut);
  Pump;
  Check(R.QuickAccessItems.Count = 1, 'RemoveFromQuickAccess');

  // ---- Galeria ----
  Pump;
  IR := LI(R, Gal);
  Check(IR.Right - IR.Left > 150, 'galeria ocupa largura de 4 colunas');
  H.GalleryHits := 0;
  Click(R, IR.Left + 3 + ((IR.Right - IR.Left - 18) div 4) * 2 + 5, (IR.Top + IR.Bottom) div 2);
  Check((Gal.GalleryIndex = 2) and (H.GalleryHits = 1) and (H.LastGallery = 2),
    'clique na 3ª célula seleciona o índice 2 e dispara OnGalleryClick');
  // rolar para baixo
  Click(R, IR.Right - 6, IR.Top + (IR.Bottom - IR.Top) div 2);
  Check(Gal.GalleryTop = 1, 'botão de rolagem desce uma linha');
  Shot(F, 'ribbon_galeria.png');
  Click(R, IR.Right - 6, IR.Top + 3);
  Check(Gal.GalleryTop = 0, 'botão de rolagem sobe');
  // abrir popup "mais"
  Click(R, IR.Right - 6, IR.Bottom - 4);
  Check((TRibbonHack(R).GalleryPopup <> nil) and TRibbonHack(R).GalleryPopup.Visible,
    'botão "mais" abre a galeria completa');
  Pump;
  if TRibbonHack(R).GalleryPopup <> nil then
  begin
    TRibbonHack(R).GalleryPopupMouseMove(TRibbonHack(R).GalleryPopup, [], 10 + 64 + 5, 10 + 70 + 5);
    TRibbonHack(R).GalleryPopup.Repaint;
    Pump;
    TRibbonHack(R).GalleryPopupMouseUp(TRibbonHack(R).GalleryPopup, mbLeft, [], 10 + 64 + 5, 10 + 70 + 5);
    Pump;
    Check(Gal.GalleryIndex = 5, 'clique na galeria completa (linha 2, coluna 2) escolhe o índice 5');
    Check(Gal.GalleryTop = 1, 'faixa rola até a linha escolhida');
  end;
  IR := LI(R, Q);
  Click(R, IR.Left + 5, (IR.Top + IR.Bottom) div 2);
  Check(Q.GalleryIndex = 0, 'galeria de cores: seleção');

  // ---- Abas contextuais ----
  Check(R.Height = H0, 'sem abas contextuais visíveis a altura não muda');
  R.ShowContext('Ferramentas de Tabela', True, True);
  Pump;
  Check(R.ActiveTabIndex = CtxTabIdx, 'ShowContext ativa a aba contextual');
  Check(TRibbonHack(R).ContextRowHeight > 0, 'linha de cabeçalho contextual exibida');
  Shot(F, 'ribbon_contextual.png');
  R.ShowContext('Ferramentas de Tabela', False);
  Pump;
  Check((R.ActiveTabIndex = 0) and not TabCtx.Visible, 'ocultar contexto volta para a primeira aba visível');
  Check(R.Height = H0, 'altura restaurada após ocultar o contexto');

  // ---- KeyTips ----
  R.ShowKeyTips;
  Pump;
  Check(R.KeyTipMode = ktmTabs, 'ShowKeyTips: modo abas');
  Shot(F, 'ribbon_keytips_abas.png');
  Check(R.ProcessKeyTip(Ord('I')), 'tecla I processada');
  Pump;
  // "Início" e "Inserir" começam com I -> IN e IS
  Check(R.KeyTipMode = ktmTabs, 'prefixo ambíguo aguarda segunda letra');
  R.ProcessKeyTip(Ord('S'));
  Pump;
  Check((R.KeyTipMode = ktmItems) and (R.ActiveTabIndex = 1), 'IS escolhe Inserir e passa aos itens');
  R.ProcessKeyTip(VK_ESCAPE);
  Check(R.KeyTipMode = ktmTabs, 'Esc volta ao nível das abas');
  R.HideKeyTips;
  R.ActiveTabIndex := 0;
  Pump;
  R.ShowKeyTips;
  R.ProcessKeyTip(Ord('I'));
  R.ProcessKeyTip(Ord('N'));
  Pump;
  Check(R.ActiveTabIndex = 0, 'IN = Início (primeira aba com 2 letras ''IN'')');
  Shot(F, 'ribbon_keytips_itens.png');
  H.Clicks := 0;
  R.ProcessKeyTip(Ord('S'));
  Pump;
  Check((H.Clicks = 1) and (R.KeyTipMode = ktmNone), 'KeyTip S executa Salvar e fecha as dicas');
  // Alt solto pelo formulário
  K := VK_MENU;
  TRibbonHack(R).FormKeyDown(F, K, [ssAlt]);
  K := VK_MENU;
  TRibbonHack(R).FormKeyUp(F, K, []);
  Check(R.KeyTipMode = ktmTabs, 'Alt pressionado e solto mostra as KeyTips');
  K := VK_ESCAPE;
  TRibbonHack(R).FormKeyDown(F, K, []);
  Check(R.KeyTipMode = ktmNone, 'Esc pelo formulário fecha as KeyTips');
  K := VK_F10;
  TRibbonHack(R).FormKeyDown(F, K, []);
  Check(R.KeyTipMode = ktmTabs, 'F10 mostra as KeyTips');
  R.HideKeyTips;

  // ---- Minimizar ----
  R.Minimized := True;
  Pump;
  Check(R.Height < H0 div 2, 'minimizado');
  R.Minimized := False;
  Pump;
  Check(R.Height = H0, 'restaurado');

  F.Free;
  H.Free;
  WriteLn('Falhas: ', Fails);
  if Fails > 0 then Halt(1);
end.
