{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Clipbrd
  Gerado por tools/genvclcompat.py a partir de Clipbrd.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Clipbrd;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  SysUtils, LCLType, Clipbrd;
type
{$if declared(TClipboardData)}
  TClipboardData = Clipbrd.TClipboardData;
{$endif}
{$if declared(TClipboard)}
  TClipboard = Clipbrd.TClipboard;
{$endif}
{$if declared(CF_Text)}
function CF_Text: TClipboardFormat; inline;
{$endif}
{$if declared(CF_Bitmap)}
function CF_Bitmap: TClipboardFormat; inline;
{$endif}
{$if declared(CF_Picture)}
function CF_Picture: TClipboardFormat; inline;
{$endif}
{$if declared(CF_MetaFilePict)}
function CF_MetaFilePict: TClipboardFormat; inline;
{$endif}
{$if declared(CF_Object)}
function CF_Object: TClipboardFormat; inline;
{$endif}
{$if declared(CF_Component)}
function CF_Component: TClipboardFormat; inline;
{$endif}
{$if declared(CF_HTML)}
function CF_HTML: TClipboardformat; inline;
{$endif}
{$if declared(Clipboard)}
function Clipboard: TClipboard; overload; inline;
{$endif}
{$if declared(Clipboard)}
function Clipboard(ClipboardType: TClipboardType): TClipboard; overload; inline;
{$endif}
{$if declared(SetClipboard)}
function SetClipboard(NewClipboard: TClipboard): TClipboard; overload; inline;
{$endif}
{$if declared(SetClipboard)}
function SetClipboard(ClipboardType: TClipboardType; NewClipboard: TClipboard): TClipboard; overload; inline;
{$endif}
{$if declared(PrimarySelection)}
function PrimarySelection: TClipboard; inline;
{$endif}
{$if declared(SecondarySelection)}
function SecondarySelection: TClipboard; inline;
{$endif}
{$if declared(FreeAllClipboards)}
procedure FreeAllClipboards; inline;
{$endif}
{$if declared(RegisterClipboardFormat)}
function RegisterClipboardFormat(const Format: string): TClipboardFormat; inline;
{$endif}

implementation

{$if declared(CF_Text)}
function CF_Text: TClipboardFormat;
begin
  Result := Clipbrd.CF_Text;
end;

{$endif}
{$if declared(CF_Bitmap)}
function CF_Bitmap: TClipboardFormat;
begin
  Result := Clipbrd.CF_Bitmap;
end;

{$endif}
{$if declared(CF_Picture)}
function CF_Picture: TClipboardFormat;
begin
  Result := Clipbrd.CF_Picture;
end;

{$endif}
{$if declared(CF_MetaFilePict)}
function CF_MetaFilePict: TClipboardFormat;
begin
  Result := Clipbrd.CF_MetaFilePict;
end;

{$endif}
{$if declared(CF_Object)}
function CF_Object: TClipboardFormat;
begin
  Result := Clipbrd.CF_Object;
end;

{$endif}
{$if declared(CF_Component)}
function CF_Component: TClipboardFormat;
begin
  Result := Clipbrd.CF_Component;
end;

{$endif}
{$if declared(CF_HTML)}
function CF_HTML: TClipboardformat;
begin
  Result := Clipbrd.CF_HTML;
end;

{$endif}
{$if declared(Clipboard)}
function Clipboard: TClipboard;
begin
  Result := Clipbrd.Clipboard;
end;

{$endif}
{$if declared(Clipboard)}
function Clipboard(ClipboardType: TClipboardType): TClipboard;
begin
  Result := Clipbrd.Clipboard(ClipboardType);
end;

{$endif}
{$if declared(SetClipboard)}
function SetClipboard(NewClipboard: TClipboard): TClipboard;
begin
  Result := Clipbrd.SetClipboard(NewClipboard);
end;

{$endif}
{$if declared(SetClipboard)}
function SetClipboard(ClipboardType: TClipboardType; NewClipboard: TClipboard): TClipboard;
begin
  Result := Clipbrd.SetClipboard(ClipboardType, NewClipboard);
end;

{$endif}
{$if declared(PrimarySelection)}
function PrimarySelection: TClipboard;
begin
  Result := Clipbrd.PrimarySelection;
end;

{$endif}
{$if declared(SecondarySelection)}
function SecondarySelection: TClipboard;
begin
  Result := Clipbrd.SecondarySelection;
end;

{$endif}
{$if declared(FreeAllClipboards)}
procedure FreeAllClipboards;
begin
  Clipbrd.FreeAllClipboards;
end;

{$endif}
{$if declared(RegisterClipboardFormat)}
function RegisterClipboardFormat(const Format: string): TClipboardFormat;
begin
  Result := Clipbrd.RegisterClipboardFormat(Format);
end;

{$endif}
end.
