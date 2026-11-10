program ESKitDemo;

{ Demo do ESKit para Delphi (VCL). O formulário é montado em código
  (UDemo.pas), então não depende de .dfm: basta abrir e rodar. }

uses
  Vcl.Forms,
  UDemo in 'UDemo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ESKit Demo';
  Application.CreateForm(TDemoForm, DemoForm);
  Application.Run;
end.
