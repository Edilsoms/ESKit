program delphiapp;

{ Código no estilo Delphi (VCL): só units com nomes do Delphi. Compila no
  Lazarus com o pacote ESKitDelphiCompat. Fecha sozinho e imprime OK/FALHA. }

{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Math,
  System.StrUtils, System.DateUtils, System.Variants, System.IniFiles, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Menus, Vcl.Grids, Vcl.Buttons, Vcl.Clipbrd, Data.DB,
  {$IFDEF FPC}Interfaces,{$ENDIF} UMainForm in 'UMainForm.pas';

{$IFNDEF FPC}{$R *.res}{$ENDIF}

begin
  Application.Initialize;
  Application.Title := 'Delphi no Lazarus';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
  if MainForm.Fails > 0 then Halt(1);
end.
