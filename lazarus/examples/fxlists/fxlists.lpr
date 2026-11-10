program fxlists;

{ Teste/demonstração de TEsFxTabControl e TEsFxListBox.
  Uso: fxlists [pasta-de-saída] }

{$mode objfpc}{$H+}

uses
  Interfaces, LCLIntf, Classes, SysUtils, Forms, Controls, Graphics, StdCtrls, LCLType, LMessages,
  EsGraphics, EsTheme, EsFxBase, EsFxShapes, EsFxStdCtrls, EsFxLists;

type
  TTabHack = class(TEsFxTabControl);
  TListHack = class(TEsFxListBox);

  THandlers = class
    Changes, Clicks, Checks: Integer;
    procedure Change(Sender: TObject);
    procedure ItemClick(Sender: TObject; AIndex: Integer);
    procedure CheckChange(Sender: TObject; AIndex: Integer);
  end;

var
  Fails: Integer = 0;
  OutDir: string;
  H: THandlers;

procedure THandlers.Change(Sender: TObject);
begin
  Inc(Changes);
end;

procedure THandlers.ItemClick(Sender: TObject; AIndex: Integer);
begin
  Inc(Clicks);
end;

procedure THandlers.CheckChange(Sender: TObject; AIndex: Integer);
begin
  Inc(Checks);
end;

procedure Check(Cond: Boolean; const Msg: string);
begin
  if Cond then WriteLn('OK    ', Msg) else begin WriteLn('FALHA ', Msg); Inc(Fails); end;
end;

procedure Pump(N: Integer = 15);
var
  I: Integer;
begin
  for I := 1 to N do
  begin
    Application.ProcessMessages;
    Sleep(16);
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

procedure Key(C: TWinControl; AKey: Word; Shift: TShiftState = []);
var
  K: Word;
begin
  K := AKey;
  if C is TEsFxListBox then TListHack(C).KeyDown(K, Shift)
  else TTabHack(C).KeyDown(K, Shift);
  Pump(3);
end;

procedure ClickList(L: TEsFxListBox; AIndex: Integer; Shift: TShiftState = []; XOff: Integer = 60);
var
  R: TRect;
begin
  R := L.ItemRect(AIndex);
  TListHack(L).MouseDown(mbLeft, Shift, R.Left + XOff, (R.Top + R.Bottom) div 2);
  TListHack(L).MouseUp(mbLeft, Shift, R.Left + XOff, (R.Top + R.Bottom) div 2);
  Pump(3);
end;

var
  F: TForm;
  TC: TEsFxTabControl;
  T1, T2, T3: TEsFxTabItem;
  B: TEsFxButton;
  E: TEdit;
  L, L2: TEsFxListBox;
  I, X0, Mid: Integer;
  SL: TStringList;
  Msg: TLMMouse;
  K: TUTF8Char;
  R: TRect;

begin
  OutDir := ParamStr(1);
  if OutDir = '' then OutDir := '.';
  Application.Initialize;
  H := THandlers.Create;
  EsThemes.ApplyStyle(dsLight);
  F := TForm.CreateNew(nil);
  F.SetBounds(30, 30, 760, 420);
  F.Caption := 'TEsFxTabControl / TEsFxListBox';
  F.Color := clWhite;

  TC := TEsFxTabControl.Create(F);
  TC.Parent := F;
  TC.SetBounds(10, 10, 360, 400);
  TC.OnChange := @H.Change;
  T1 := TC.Add('Geral');
  T2 := TC.Add('Lista');
  T3 := TC.Add('Configurações avançadas');
  B := TEsFxButton.Create(F);
  B.Parent := T1;
  B.SetBounds(20, 20, 140, 36);
  B.Caption := 'Botão na aba 1';
  E := TEdit.Create(F);
  E.Parent := T3;
  E.SetBounds(20, 20, 200, 28);
  E.Text := 'campo na aba 3';

  // lista dentro da aba 2
  L := TEsFxListBox.Create(F);
  L.Parent := T2;
  L.Align := alClient;
  L.BorderSpacing.Around := 10;
  L.ShowCheckboxes := True;
  L.OnChange := @H.Change;
  L.OnItemClick := @H.ItemClick;
  L.OnCheckChange := @H.CheckChange;
  L.BeginUpdate;
  L.Items.AddHeader('Frutas');
  for I := 1 to 12 do
    L.Items.AddItem('Fruta ' + IntToStr(I), IntToStr(I * 3) + ' un');
  L.Items.AddHeader('Legumes');
  for I := 1 to 12 do
    L.Items.AddItem('Legume ' + IntToStr(I)).Accessory := laMore;
  L.EndUpdate;

  // lista independente (multisseleção)
  L2 := TEsFxListBox.Create(F);
  L2.Parent := F;
  L2.SetBounds(390, 10, 360, 400);
  L2.MultiSelect := True;
  L2.AlternatingRowBackground := True;
  SL := TStringList.Create;
  for I := 1 to 60 do SL.Add(Format('Cliente %.2d', [I]));
  SL.Add('Zeca');
  L2.Items.Assign(SL);
  SL.Free;

  F.Show;
  Pump;
  Check(TC.TabCount = 3, '3 abas');
  Check((TC.TabIndex = 0) and T1.Visible and not T2.Visible and not T3.Visible,
    'só a aba ativa visível');
  Check(T1.Top = TTabHack(TC).HeaderHeight, 'conteúdo abaixo do cabeçalho');
  Check(not T3.HandleAllocated or not IsWindowVisible(T3.Handle),
    'aba inativa oculta também no widget (controles nativos não aparecem)');
  Shot(F, 'tab_geral.png');

  // clique no cabeçalho com transição de deslize
  H.Changes := 0;
  R := T2.HeaderRect;
  TTabHack(TC).MouseDown(mbLeft, [], (R.Left + R.Right) div 2, (R.Top + R.Bottom) div 2);
  TTabHack(TC).MouseUp(mbLeft, [], (R.Left + R.Right) div 2, (R.Top + R.Bottom) div 2);
  Check((TC.TabIndex = 1) and (H.Changes = 1), 'clique troca de aba e dispara OnChange');
  // início da transição: a aba nova entra pela direita, a antiga ainda no lugar
  Mid := T2.Left;
  Check(T1.Visible and T2.Visible and (T1.Left = 0) and (Mid = TC.Width),
    'transição de deslize: as duas abas aparecem');
  Application.ProcessMessages;
  Sleep(60);
  Application.ProcessMessages;
  Shot(F, 'tab_transicao.png');
  Pump(30);
  Check(not T1.Visible and T2.Visible and (T2.Left = 0), 'fim da transição: só a aba 2, na posição');
  Shot(F, 'tab_lista.png');

  // teclado no cabeçalho
  Key(TC, VK_RIGHT);
  Pump(30);
  Check(TC.TabIndex = 2, 'seta para a direita: próxima aba');
  Check(E.Visible and E.IsVisible, 'controle nativo da aba 3 visível');
  Key(TC, VK_TAB, [ssCtrl, ssShift]);
  Pump(30);
  Check(TC.TabIndex = 1, 'Ctrl+Shift+Tab: aba anterior');
  T3.TabVisible := False;
  Check(not TC.Next(ttNone), 'aba oculta é pulada');
  T3.TabVisible := True;
  T3.Index := 0;
  Check((TC.Tabs[0] = T3) and (TC.ActiveTab = T2), 'Index reordena e mantém a aba ativa');
  Check(T2.Visible and not T3.Visible and (T2.HeaderRect.Left > 0),
    'após reordenar, o conteúdo exibido continua sendo o da aba ativa');
  T3.Index := 2;

  // design-time hit test
  Msg := Default(TLMMouse);
  Msg.Msg := CM_DESIGNHITTEST;
  Msg.XPos := (T1.HeaderRect.Left + T1.HeaderRect.Right) div 2;
  Msg.YPos := 10;
  TC.Dispatch(Msg);
  Check(Msg.Result = 1, 'CM_DESIGNHITTEST: cabeçalho responde no designer');
  Msg.YPos := 200;
  Msg.Result := 0;
  TC.Dispatch(Msg);
  Check(Msg.Result = 0, 'CM_DESIGNHITTEST: conteúdo fica com o designer');

  // modo pontos
  TC.TabPosition := tpDots;
  Pump;
  Check(T2.Top = 0, 'tpDots: conteúdo no topo, pontos embaixo');
  Shot(F, 'tab_pontos.png');
  TC.TabPosition := tpTop;
  TC.FullSize := True;
  Pump;
  Check(T1.HeaderRect.Right - T1.HeaderRect.Left = TC.Width div 3, 'FullSize: abas de mesma largura');

  // ---- ListBox ----
  Check(L.Items.Count = 26, 'itens com cabeçalhos');
  ClickList(L, 0);
  Check(L.ItemIndex = -1, 'cabeçalho não é selecionável');
  H.Changes := 0; H.Clicks := 0;
  ClickList(L, 2);
  Check((L.ItemIndex = 2) and (H.Changes = 1) and (H.Clicks = 1), 'clique seleciona e dispara eventos');
  ClickList(L, 2, [], 12);
  Check(L.Items[2].Checked and (H.Checks = 1), 'clique na caixa marca o item');
  L.SetFocus;
  Key(L, VK_SPACE);
  Check(not L.Items[2].Checked, 'Espaço alterna a marca');
  L.ItemIndex := 12;
  Key(L, VK_DOWN);
  Check(L.ItemIndex = 14, 'seta para baixo pula o cabeçalho');
  Key(L, VK_END);
  Pump(40);
  Check((L.ItemIndex = 25) and (L.ScrollPos > 0) and (Abs(L.ScrollPos - L.MaxScroll) < 1),
    'End vai ao último e rola até o fim (suave)');
  Key(L, VK_HOME);
  Pump(40);
  Check((L.ItemIndex = 1) and (L.ScrollPos < 1), 'Home volta ao primeiro selecionável');
  K := 'L';
  TListHack(L).UTF8KeyPress(K);
  Check(L.ItemIndex = 14, 'busca incremental pela letra');
  Shot(F, 'lista_checkbox.png');

  // multisseleção
  ClickList(L2, 1);
  ClickList(L2, 4, [ssShift]);
  Check(L2.SelCount = 4, 'Shift+clique seleciona o intervalo');
  ClickList(L2, 8, [ssCtrl]);
  Check(L2.SelCount = 5, 'Ctrl+clique soma à seleção');
  ClickList(L2, 8, [ssCtrl]);
  Check(L2.SelCount = 4, 'Ctrl+clique tira da seleção');
  L2.SetFocus;
  Key(L2, Ord('A'), [ssCtrl]);
  Check(L2.SelCount = 61, 'Ctrl+A seleciona tudo');
  ClickList(L2, 3);
  Check(L2.SelCount = 1, 'clique simples deixa só um');
  // roda do mouse (rolagem suave)
  TListHack(L2).DoMouseWheel([], -240, Point(50, 50));
  Check(L2.ScrollPos < 1, 'rolagem é animada (começa onde estava)');
  Pump(40);
  Check(Abs(L2.ScrollPos - 6 * L2.RowHeight) < 1, 'roda do mouse: 2 cliques = 6 linhas');
  // arrasto rola o conteúdo
  X0 := Round(L2.ScrollPos);
  TListHack(L2).MouseDown(mbLeft, [], 100, 300);
  TListHack(L2).MouseMove([ssLeft], 100, 250);
  TListHack(L2).MouseMove([ssLeft], 100, 200);
  TListHack(L2).MouseUp(mbLeft, [], 100, 200);
  Check(Round(L2.ScrollPos) >= X0 + 100, 'arrastar rola a lista (toque)');
  Check(L2.SelCount = 1, 'arrastar não muda a seleção');
  Pump(60);
  Shot(F, 'lista_multi.png');
  // Assign para TStrings
  SL := TStringList.Create;
  SL.Assign(L2.Items);
  Check((SL.Count = 61) and (SL[60] = 'Zeca'), 'Items -> TStrings');
  SL.Free;
  // tema escuro
  EsThemes.ApplyStyle(dsDark);
  F.Color := clBlack;
  TC.TabIndex := 1;
  Pump(30);
  Shot(F, 'escuro.png');

  F.Free;
  H.Free;
  WriteLn('Falhas: ', Fails);
  if Fails > 0 then Halt(1);
end.
