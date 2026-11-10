{
 *****************************************************************************
  ESKit (design-time) - esdelphiprofile.pas
  Ferramentas > "Perfil Delphi (ESKit)...": deixa a IDE do Lazarus com cara e
  jeito do Delphi:
    - IDE em janela única, com o designer de formulários encaixado
      (instala os pacotes AnchorDockingDsgn e DockedFormEditor, que vêm com o
      Lazarus; a IDE é reconstruída);
    - esquema de cores "Delphi" no editor;
    - fonte do editor Consolas 10 (ou Courier New), como no Delphi.
  No Lazarus 5.99 em diante cores e fonte valem na hora; no 4.x e 5.0, depois
  de reiniciar.
  Os atalhos padrão do Lazarus já seguem os do Delphi (F9, Ctrl+F9, F7/F8,
  F12, Ctrl+Shift+C, Ctrl+Clique...).

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsDelphiProfile;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Contnrs, Forms, Controls, StdCtrls, ExtCtrls, Dialogs,
  LazVersion, MenuIntf, PackageIntf;

procedure RegisterDelphiProfile;

{ aplica as opções escolhidas; devolve o que foi feito (para a mensagem) }
function ApplyDelphiProfile(ADocking, AColors, AFont: Boolean): string;

resourcestring
  rsEsDelphiProfileMenu = 'Perfil Delphi (ESKit)...';
  rsEsDelphiProfileTitle = 'Perfil Delphi';
  rsEsDelphiProfileInfo = 'Deixa a IDE do Lazarus parecida com a do Delphi.';
  rsEsDelphiProfileDocking = 'IDE em janela única com o designer encaixado '
    + '(instala AnchorDockingDsgn e DockedFormEditor e reconstrói a IDE)';
  rsEsDelphiProfileColors = 'Esquema de cores "Delphi" no editor';
  rsEsDelphiProfileFont = 'Fonte do editor como no Delphi (Consolas 10)';
  rsEsDelphiProfileApply = 'Aplicar';
  rsEsDelphiProfileCancel = 'Cancelar';
  rsEsDelphiProfileDockingDone = 'Pacotes de encaixe instalados (a IDE foi reconstruída).';
  rsEsDelphiProfileDockingAlready = 'O encaixe já estava instalado.';
  rsEsDelphiProfileDockingFail = 'Não foi possível instalar os pacotes de encaixe.';
  rsEsDelphiProfileColorsDone = 'Esquema de cores "Delphi" selecionado.';
  rsEsDelphiProfileFontDone = 'Fonte do editor: %s %d.';
  rsEsDelphiProfileRestart = 'Reinicie o Lazarus para as cores e a fonte valerem '
    + '(até lá, não altere as opções do editor, senão a IDE grava por cima).';

implementation

{ O Lazarus 5.99 em diante tem, em EditorOptionsIntf, a API que aplica cores e
  fonte na hora. Nas versões anteriores não há essa API: os valores são gravados no
  editoroptions.xml e valem quando a IDE é reiniciada (a IDE só regrava esse
  arquivo quando as opções do editor são alteradas). }
{$IF laz_fullversion >= 5990000}
  {$DEFINE ES_EDITOROPTSINTF}
{$ENDIF}

uses
  {$IFDEF ES_EDITOROPTSINTF}EditorOptionsIntf{$ELSE}LazIDEIntf, Laz2_XMLCfg{$ENDIF};

const
  DockPackages: array[0..1] of string = ('AnchorDockingDsgn', 'DockedFormEditor');

function PickFont: string;
const
  Candidates: array[0..4] of string = ('Consolas', 'Cascadia Mono', 'DejaVu Sans Mono',
    'Liberation Mono', 'Courier New');
var
  I: Integer;
begin
  for I := 0 to High(Candidates) do
    if Screen.Fonts.IndexOf(Candidates[I]) >= 0 then
      Exit(Candidates[I]);
  Result := '';
end;

{ cores e fonte; devolve o texto para a mensagem }
function ApplyEditorOptions(AColors, AFont: Boolean): string;
var
  F: string;
{$IFNDEF ES_EDITOROPTSINTF}
  Cfg: TXMLConfig;
{$ENDIF}
begin
  Result := '';
  if not (AColors or AFont) then Exit;
  F := '';
  if AFont then
    F := PickFont;
{$IFDEF ES_EDITOROPTSINTF}
  if IDEEditorOptions = nil then Exit;
  if AColors then
    IDEEditorOptions.SetColorSchemeName('ObjectPascal', 'Delphi');
  if F <> '' then
  begin
    IDEEditorOptions.EditorFontName := F;
    IDEEditorOptions.EditorFontSize := 10;
  end;
  // grava as opções do editor e avisa a IDE (aplica na hora)
  IDEEditorOptions.DoAfterWrite(False);
{$ELSE}
  Cfg := TXMLConfig.Create(IncludeTrailingPathDelimiter(
    LazarusIDE.GetPrimaryConfigPath) + 'editoroptions.xml');
  try
    if AColors then
      Cfg.SetValue('EditorOptions/Color/LangObjectPascal/ColorScheme/Value', 'Delphi');
    if F <> '' then
    begin
      Cfg.SetValue('EditorOptions/Display/EditorFont', F);
      Cfg.SetValue('EditorOptions/Display/EditorFontSize', 10);
    end;
    Cfg.Flush;
  finally
    Cfg.Free;
  end;
{$ENDIF}
  if AColors then
    Result := Result + rsEsDelphiProfileColorsDone + LineEnding;
  if F <> '' then
    Result := Result + Format(rsEsDelphiProfileFontDone, [F, 10]) + LineEnding;
{$IFNDEF ES_EDITOROPTSINTF}
  Result := Result + rsEsDelphiProfileRestart + LineEnding;
{$ENDIF}
end;

function ApplyDelphiProfile(ADocking, AColors, AFont: Boolean): string;
var
  L: TObjectList;
  ID: TLazPackageID;
  I: Integer;
begin
  Result := ApplyEditorOptions(AColors, AFont);
  if ADocking and (PackageEditingInterface <> nil) then
  begin
    L := TObjectList.Create(True);
    try
      for I := 0 to High(DockPackages) do
        if PackageEditingInterface.IsPackageInstalled(DockPackages[I]) = nil then
        begin
          ID := TLazPackageID.Create;
          if ID.StringToID(DockPackages[I]) then
            L.Add(ID)
          else
            ID.Free;
        end;
      if L.Count = 0 then
        Result := Result + rsEsDelphiProfileDockingAlready + LineEnding
      // a própria IDE pergunta se pode reconstruir e reinicia
      else if PackageEditingInterface.InstallPackages(L, [piiifRebuildIDE]) = mrOk then
        Result := Result + rsEsDelphiProfileDockingDone + LineEnding
      else
        Result := Result + rsEsDelphiProfileDockingFail + LineEnding;
    finally
      L.Free;
    end;
  end;
end;

type
  TEsDelphiProfileHandler = class
    procedure Execute(Sender: TObject);
  end;

var
  Handler: TEsDelphiProfileHandler = nil;

procedure TEsDelphiProfileHandler.Execute(Sender: TObject);
var
  F: TForm;
  Info: TLabel;
  CDock, CColors, CFont: TCheckBox;
  Buttons: TPanel;
  BOk, BCancel: TButton;
  Msg: string;
begin
  F := TForm.CreateNew(nil);
  try
    F.Caption := rsEsDelphiProfileTitle;
    F.Position := poScreenCenter;
    F.BorderStyle := bsDialog;
    F.AutoSize := True;
    F.ChildSizing.LeftRightSpacing := 12;
    F.ChildSizing.TopBottomSpacing := 12;
    F.ChildSizing.VerticalSpacing := 8;
    F.ChildSizing.Layout := cclLeftToRightThenTopToBottom;
    F.ChildSizing.ControlsPerLine := 1;
    Info := TLabel.Create(F);
    Info.Caption := rsEsDelphiProfileInfo;
    Info.Parent := F;
    CDock := TCheckBox.Create(F);
    CDock.Caption := rsEsDelphiProfileDocking;
    CDock.Checked := True;
    CDock.Parent := F;
    CColors := TCheckBox.Create(F);
    CColors.Caption := rsEsDelphiProfileColors;
    CColors.Checked := True;
    CColors.Parent := F;
    CFont := TCheckBox.Create(F);
    CFont.Caption := rsEsDelphiProfileFont;
    CFont.Checked := True;
    CFont.Parent := F;
    Buttons := TPanel.Create(F);
    Buttons.BevelOuter := bvNone;
    Buttons.AutoSize := True;
    Buttons.ChildSizing.HorizontalSpacing := 8;
    Buttons.ChildSizing.Layout := cclLeftToRightThenTopToBottom;
    Buttons.ChildSizing.ControlsPerLine := 2;
    Buttons.Parent := F;
    BOk := TButton.Create(F);
    BOk.Caption := rsEsDelphiProfileApply;
    BOk.ModalResult := mrOk;
    BOk.Default := True;
    BOk.AutoSize := True;
    BOk.Parent := Buttons;
    BCancel := TButton.Create(F);
    BCancel.Caption := rsEsDelphiProfileCancel;
    BCancel.ModalResult := mrCancel;
    BCancel.Cancel := True;
    BCancel.AutoSize := True;
    BCancel.Parent := Buttons;
    if F.ShowModal <> mrOk then Exit;
    Msg := ApplyDelphiProfile(CDock.Checked, CColors.Checked, CFont.Checked);
    if Msg <> '' then
      MessageDlg(rsEsDelphiProfileTitle, Trim(Msg), mtInformation, [mbOK], 0);
  finally
    F.Free;
  end;
end;

procedure RegisterDelphiProfile;
begin
  if Handler = nil then
    Handler := TEsDelphiProfileHandler.Create;
  RegisterIDEMenuCommand(itmSecondaryTools, 'ESKitDelphiProfile', rsEsDelphiProfileMenu,
    @Handler.Execute);
end;

finalization
  FreeAndNil(Handler);
end.
