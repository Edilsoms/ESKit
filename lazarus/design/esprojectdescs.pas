{
 *****************************************************************************
  ESKit (design-time) - esprojectdescs.pas
  Modelos de projeto e de formulário no estilo Delphi para o diálogo
  Arquivo > Novo / Projeto > Novo Projeto:

    * Aplicação estilo Delphi (VCL)   - modo Delphi, fonte principal
                                        idêntico ao .dpr do Delphi
    * Aplicação ESKit (FMX/Express) - igual, já dependente do pacote
                                        ESKit e com formulário estilizado
    * Formulário ESKit              - unit com os uses dos componentes

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsProjectDescs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, LazIDEIntf, ProjectIntf, CompOptsIntf;

type

  { TEsDelphiAppDescriptor }

  TEsDelphiAppDescriptor = class(TProjectDescriptor)
  protected
    function ProgramSource: string; virtual;
  public
    constructor Create; override;
    function GetLocalizedName: string; override;
    function GetLocalizedDescription: string; override;
    function InitProject(AProject: TLazProject): TModalResult; override;
    function CreateStartFiles(AProject: TLazProject): TModalResult; override;
  end;

  { TEsKitAppDescriptor }

  TEsKitAppDescriptor = class(TEsDelphiAppDescriptor)
  public
    constructor Create; override;
    function GetLocalizedName: string; override;
    function GetLocalizedDescription: string; override;
    function InitProject(AProject: TLazProject): TModalResult; override;
    function CreateStartFiles(AProject: TLazProject): TModalResult; override;
  end;

  { TEsKitFormDescriptor }

  TEsKitFormDescriptor = class(TFileDescPascalUnitWithResource)
  public
    constructor Create; override;
    function GetLocalizedName: string; override;
    function GetLocalizedDescription: string; override;
    function GetInterfaceUsesSection: string; override;
  end;

var
  EsKitFormDescriptor: TEsKitFormDescriptor = nil;

procedure RegisterESKitDescriptors;

resourcestring
  rsEsDelphiApp = 'Aplicação estilo Delphi (VCL)';
  rsEsDelphiAppDesc = 'Aplicação gráfica com {$mode delphi}, fonte principal no ' +
    'formato do Delphi (Application.Initialize / CreateForm / Run) e ' +
    'formulários criados em modo Delphi.';
  rsEsKitApp = 'Aplicação ESKit (FMX + Express)';
  rsEsKitAppDesc = 'Aplicação em {$mode delphi} que já usa o pacote ESKit: ' +
    'componentes estilo FireMonkey (TFx*) e DevExpress (TSx*), com tema ' +
    'claro/escuro.';
  rsEsKitForm = 'Formulário ESKit';
  rsEsKitFormDesc = 'Formulário com as units dos componentes ESKit ' +
    '(FMX e Express) já declaradas.';

implementation

const
  LE = LineEnding;

procedure RegisterESKitDescriptors;
begin
  EsKitFormDescriptor := TEsKitFormDescriptor.Create;
  RegisterProjectFileDescriptor(EsKitFormDescriptor);
  RegisterProjectDescriptor(TEsDelphiAppDescriptor.Create);
  RegisterProjectDescriptor(TEsKitAppDescriptor.Create);
end;

{ TEsDelphiAppDescriptor }

constructor TEsDelphiAppDescriptor.Create;
begin
  inherited Create;
  Name := 'ESKit.DelphiApplication';
end;

function TEsDelphiAppDescriptor.GetLocalizedName: string;
begin
  Result := rsEsDelphiApp;
end;

function TEsDelphiAppDescriptor.GetLocalizedDescription: string;
begin
  Result := rsEsDelphiAppDesc;
end;

function TEsDelphiAppDescriptor.ProgramSource: string;
begin
  Result :=
    'program Project1;' + LE +
    LE +
    '{$mode delphi}{$H+}' + LE +
    LE +
    'uses' + LE +
    '  {$IFDEF UNIX}' + LE +
    '  cthreads,' + LE +
    '  {$ENDIF}' + LE +
    '  Interfaces, // widgetset do LCL (equivale ao Vcl.* do Delphi)' + LE +
    '  Forms;' + LE +
    LE +
    '{$R *.res}' + LE +
    LE +
    'begin' + LE +
    '  RequireDerivedFormResource := True;' + LE +
    '  Application.Scaled := True;' + LE +
    '  Application.Initialize;' + LE +
    '  {$PUSH}{$WARN 5044 OFF}' + LE +
    '  Application.MainFormOnTaskbar := True;' + LE +
    '  {$POP}' + LE +
    '  Application.Run;' + LE +
    'end.' + LE;
end;

function TEsDelphiAppDescriptor.InitProject(AProject: TLazProject): TModalResult;
var
  MainFile: TLazProjectFile;
begin
  Result := inherited InitProject(AProject);
  MainFile := AProject.CreateProjectFile('project1.lpr');
  MainFile.IsPartOfProject := True;
  AProject.AddFile(MainFile, False);
  AProject.MainFileID := 0;
  AProject.UseAppBundle := True;
  AProject.UseManifest := True;
  AProject.Scaled := True;
  AProject.LoadDefaultIcon;
  AProject.MainFile.SetSourceText(ProgramSource, True);
  AProject.AddPackageDependency('LCL');
  with AProject.LazCompilerOptions do
  begin
    SyntaxMode := 'Delphi';
    Win32GraphicApp := True;
    UnitOutputDirectory := 'lib' + PathDelim + '$(TargetCPU)-$(TargetOS)';
    TargetFilename := 'project1';
  end;
end;

function TEsDelphiAppDescriptor.CreateStartFiles(AProject: TLazProject): TModalResult;
begin
  // o formulário herda {$mode Delphi} das opções do projeto
  Result := LazarusIDE.DoNewEditorFile(FileDescriptorForm, '', '',
    [nfIsPartOfProject, nfOpenInEditor, nfCreateDefaultSrc]);
end;

{ TEsKitAppDescriptor }

constructor TEsKitAppDescriptor.Create;
begin
  inherited Create;
  Name := 'ESKit.KitApplication';
end;

function TEsKitAppDescriptor.GetLocalizedName: string;
begin
  Result := rsEsKitApp;
end;

function TEsKitAppDescriptor.GetLocalizedDescription: string;
begin
  Result := rsEsKitAppDesc;
end;

function TEsKitAppDescriptor.InitProject(AProject: TLazProject): TModalResult;
begin
  Result := inherited InitProject(AProject);
  AProject.AddPackageDependency('ESKit');
end;

function TEsKitAppDescriptor.CreateStartFiles(AProject: TLazProject): TModalResult;
begin
  Result := LazarusIDE.DoNewEditorFile(EsKitFormDescriptor, '', '',
    [nfIsPartOfProject, nfOpenInEditor, nfCreateDefaultSrc]);
end;

{ TEsKitFormDescriptor }

constructor TEsKitFormDescriptor.Create;
begin
  inherited Create;
  Name := 'ESKit.Form';
  ResourceClass := TForm;
  UseCreateFormStatements := True;
  RequiredPackages := 'LCL;ESKit';
end;

function TEsKitFormDescriptor.GetLocalizedName: string;
begin
  Result := rsEsKitForm;
end;

function TEsKitFormDescriptor.GetLocalizedDescription: string;
begin
  Result := rsEsKitFormDesc;
end;

function TEsKitFormDescriptor.GetInterfaceUsesSection: string;
begin
  Result := inherited GetInterfaceUsesSection +
    ', Forms, Controls, Graphics, Dialogs,' + LE +
    '  EsGraphics, EsTheme, EsFxBase, EsFxShapes, EsFxStdCtrls, EsFxAnimations,' + LE +
    '  EsSkins, EsEditors, EsGrid, EsNavBar, EsRibbon';
end;

end.
