unit UMainForm;

{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Math,
  System.StrUtils, System.DateUtils, System.Variants, System.IniFiles, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Grids, Data.DB;

const
  WM_TESTE = WM_USER + 10;

type
  TMainForm = class(TForm)
  private
    FEdit: TEdit;
    FButton: TButton;
    FPanel: TPanel;
    FGrid: TStringGrid;
    FTimer: TTimer;
    FMessages: Integer;
    procedure ButtonClick(Sender: TObject);
    procedure TimerTick(Sender: TObject);
    procedure WMTeste(var Msg: TMessage); message WM_TESTE;
    procedure Check(ACond: Boolean; const AMsg: string);
  public
    Fails: Integer;
    constructor Create(AOwner: TComponent); override;
  end;

var
  MainForm: TMainForm;

implementation

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited CreateNew(AOwner);
  Caption := 'Delphi no Lazarus';
  SetBounds(100, 100, 420, 300);
  Position := poDesigned;
  FPanel := TPanel.Create(Self);
  FPanel.Parent := Self;
  FPanel.Align := alTop;
  FPanel.Height := 48;
  FPanel.Color := clSkyBlue;
  FEdit := TEdit.Create(Self);
  FEdit.Parent := FPanel;
  FEdit.SetBounds(8, 10, 200, 28);
  FEdit.Text := '42';
  FButton := TButton.Create(Self);
  FButton.Parent := FPanel;
  FButton.SetBounds(220, 10, 120, 28);
  FButton.Caption := 'Dobrar';
  FButton.OnClick := ButtonClick;
  FGrid := TStringGrid.Create(Self);
  FGrid.Parent := Self;
  FGrid.Align := alClient;
  FGrid.ColCount := 3;
  FGrid.RowCount := 4;
  FTimer := TTimer.Create(Self);
  FTimer.Interval := 200;
  FTimer.OnTimer := TimerTick;
end;

procedure TMainForm.Check(ACond: Boolean; const AMsg: string);
begin
  if ACond then
    WriteLn('OK    ', AMsg)
  else
  begin
    WriteLn('FALHA ', AMsg);
    Inc(Fails);
  end;
end;

procedure TMainForm.ButtonClick(Sender: TObject);
begin
  FEdit.Text := IntToStr(StrToIntDef(FEdit.Text, 0) * 2);
end;

procedure TMainForm.WMTeste(var Msg: TMessage);
begin
  Inc(FMessages, Msg.WParam);
end;

procedure TMainForm.TimerTick(Sender: TObject);
var
  L: TStringList;
  Ini: TMemIniFile;
  V: Variant;
  D: TDateTime;
  R: TRect;
  P: TPoint;
begin
  FTimer.Enabled := False;
  FButton.Click;
  Check(FEdit.Text = '84', 'TButton.Click / OnClick / IntToStr / StrToIntDef');
  SendMessage(Handle, WM_TESTE, 5, 0);
  Check(FMessages = 5, 'SendMessage + handler message WM_USER (Winapi.Windows/Messages)');
  Check(Format('%s-%d-%.2f', ['a', 7, 1.5]) = 'a-7-1.50', 'Format (System.SysUtils)');
  Check((Max(3, 9) = 9) and SameValue(Power(2, 10), 1024), 'Max / Power (System.Math)');
  Check(ContainsText('Lazarus e Delphi', 'DELPHI') and (IfThen(True, 'sim', 'não') = 'sim') and
    (ReverseString('abc') = 'cba'), 'ContainsText / IfThen / ReverseString (System.StrUtils)');
  D := EncodeDate(2026, 11, 8);
  Check((YearOf(D) = 2026) and (DaysBetween(D, IncDay(D, 10)) = 10), 'YearOf / IncDay (System.DateUtils)');
  V := 10;
  Check(VarIsNumeric(V) and (VarToStr(V) = '10'), 'Variant (System.Variants)');
  L := TStringList.Create;
  Ini := TMemIniFile.Create('');
  try
    L.CommaText := 'b,a,c';
    L.Sort;
    Check(L.CommaText = 'a,b,c', 'TStringList (System.Classes)');
    Ini.WriteInteger('Sec', 'N', 3);
    Check(Ini.ReadInteger('Sec', 'N', 0) = 3, 'TMemIniFile (System.IniFiles)');
  finally
    Ini.Free;
    L.Free;
  end;
  Check((GetRValue(RGB(10, 20, 30)) = 10) and (ColorToRGB(clRed) = RGB(255, 0, 0)),
    'RGB / GetRValue / clRed (Winapi.Windows, Vcl.Graphics)');
  Check((VK_RETURN = 13) and (mrOk = 1) and (MB_OK = 0), 'VK_RETURN / mrOk / MB_OK');
  R := Rect(0, 0, 10, 20);
  P := Point(5, 5);
  Check(PtInRect(R, P) and (R.Width = 10), 'TRect / PtInRect (System.Types)');
  FGrid.Cells[1, 1] := 'Vcl.Grids';
  Check(FGrid.Cells[1, 1] = 'Vcl.Grids', 'TStringGrid (Vcl.Grids)');
  Check(Application.MainForm = Self, 'Application.MainForm (Vcl.Forms)');
  Check(Screen.Width > 0, 'Screen (Vcl.Forms)');
  Check(ftInteger <> ftString, 'TFieldType (Data.DB)');
  Check((ExtractFileName(IncludeTrailingPathDelimiter('pasta') + 'b.txt') = 'b.txt') and
    (GetCurrentDir <> ''), 'ExtractFileName / GetCurrentDir (System.SysUtils)');
  Check(GetTickCount > 0, 'GetTickCount (Winapi.Windows)');
  WriteLn('Falhas: ', Fails);
  Close;
end;

end.
