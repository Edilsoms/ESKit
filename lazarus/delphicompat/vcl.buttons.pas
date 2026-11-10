{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Buttons
  Gerado por tools/genvclcompat.py a partir de Buttons.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Buttons;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  LCLType, LCLProc, Graphics, Controls, Forms, Buttons;
type
{$if declared(TButtonLayout)}
  TButtonLayout = Buttons.TButtonLayout;
{$endif}
{$if declared(TButtonState)}
  TButtonState = Buttons.TButtonState;
{$endif}
{$if declared(TButtonImage)}
  TButtonImage = Buttons.TButtonImage;
{$endif}
{$if declared(TNumGlyphs)}
  TNumGlyphs = Buttons.TNumGlyphs;
{$endif}
{$if declared(TGlyphTransparencyMode)}
  TGlyphTransparencyMode = Buttons.TGlyphTransparencyMode;
{$endif}
{$if declared(TGlyphDrawEffectsEnabled)}
  TGlyphDrawEffectsEnabled = Buttons.TGlyphDrawEffectsEnabled;
{$endif}
{$if declared(TGlyphImageLayout)}
  TGlyphImageLayout = Buttons.TGlyphImageLayout;
{$endif}
{$if declared(TButtonGlyph)}
  TButtonGlyph = Buttons.TButtonGlyph;
{$endif}
{$if declared(TBitBtnKind)}
  TBitBtnKind = Buttons.TBitBtnKind;
{$endif}
{$if declared(TBitBtnKinds)}
  TBitBtnKinds = Buttons.TBitBtnKinds;
{$endif}
{$if declared(TCustomBitBtn)}
  TCustomBitBtn = Buttons.TCustomBitBtn;
{$endif}
{$if declared(TBitBtn)}
  TBitBtn = Buttons.TBitBtn;
{$endif}
{$if declared(TSpeedButtonActionLink)}
  TSpeedButtonActionLink = Buttons.TSpeedButtonActionLink;
{$endif}
{$if declared(TCustomSpeedButton)}
  TCustomSpeedButton = Buttons.TCustomSpeedButton;
{$endif}
{$if declared(TSpeedButton)}
  TSpeedButton = Buttons.TSpeedButton;
{$endif}
{$if declared(TGetDefaultBitBtnGlyph)}
  TGetDefaultBitBtnGlyph = Buttons.TGetDefaultBitBtnGlyph;
{$endif}
const
{$if declared(blGlyphLeft)}
  blGlyphLeft = Buttons.blGlyphLeft;
{$endif}
{$if declared(blGlyphRight)}
  blGlyphRight = Buttons.blGlyphRight;
{$endif}
{$if declared(blGlyphTop)}
  blGlyphTop = Buttons.blGlyphTop;
{$endif}
{$if declared(blGlyphBottom)}
  blGlyphBottom = Buttons.blGlyphBottom;
{$endif}
{$if declared(bsUp)}
  bsUp = Buttons.bsUp;
{$endif}
{$if declared(bsDisabled)}
  bsDisabled = Buttons.bsDisabled;
{$endif}
{$if declared(bsDown)}
  bsDown = Buttons.bsDown;
{$endif}
{$if declared(bsExclusive)}
  bsExclusive = Buttons.bsExclusive;
{$endif}
{$if declared(bsHot)}
  bsHot = Buttons.bsHot;
{$endif}
{$if declared(gtmGlyph)}
  gtmGlyph = Buttons.gtmGlyph;
{$endif}
{$if declared(gtmOpaque)}
  gtmOpaque = Buttons.gtmOpaque;
{$endif}
{$if declared(gtmTransparent)}
  gtmTransparent = Buttons.gtmTransparent;
{$endif}
{$if declared(deeAlways)}
  deeAlways = Buttons.deeAlways;
{$endif}
{$if declared(deeNever)}
  deeNever = Buttons.deeNever;
{$endif}
{$if declared(deeSystem)}
  deeSystem = Buttons.deeSystem;
{$endif}
{$if declared(deeApplication)}
  deeApplication = Buttons.deeApplication;
{$endif}
{$if declared(gilHorizontal)}
  gilHorizontal = Buttons.gilHorizontal;
{$endif}
{$if declared(gilVertical)}
  gilVertical = Buttons.gilVertical;
{$endif}
{$if declared(bkCustom)}
  bkCustom = Buttons.bkCustom;
{$endif}
{$if declared(bkOK)}
  bkOK = Buttons.bkOK;
{$endif}
{$if declared(bkCancel)}
  bkCancel = Buttons.bkCancel;
{$endif}
{$if declared(bkHelp)}
  bkHelp = Buttons.bkHelp;
{$endif}
{$if declared(bkYes)}
  bkYes = Buttons.bkYes;
{$endif}
{$if declared(bkNo)}
  bkNo = Buttons.bkNo;
{$endif}
{$if declared(bkClose)}
  bkClose = Buttons.bkClose;
{$endif}
{$if declared(bkAbort)}
  bkAbort = Buttons.bkAbort;
{$endif}
{$if declared(bkRetry)}
  bkRetry = Buttons.bkRetry;
{$endif}
{$if declared(bkIgnore)}
  bkIgnore = Buttons.bkIgnore;
{$endif}
{$if declared(bkAll)}
  bkAll = Buttons.bkAll;
{$endif}
{$if declared(bkNoToAll)}
  bkNoToAll = Buttons.bkNoToAll;
{$endif}
{$if declared(bkYesToAll)}
  bkYesToAll = Buttons.bkYesToAll;
{$endif}
var
{$if declared(GetDefaultBitBtnGlyph)}
  GetDefaultBitBtnGlyph: TGetDefaultBitBtnGlyph absolute Buttons.GetDefaultBitBtnGlyph;
{$endif}
{$if declared(GetLCLDefaultBtnGlyph)}
function GetLCLDefaultBtnGlyph(Kind: TBitBtnKind): TGraphic; inline;
{$endif}
{$if declared(LoadGlyphFromResourceName)}
procedure LoadGlyphFromResourceName(AGlyph: TButtonGlyph; Instance: TLCLHandle; const AName: String); inline;
{$endif}
{$if declared(LoadGlyphFromLazarusResource)}
procedure LoadGlyphFromLazarusResource(AGlyph: TButtonGlyph; const AName: String); inline;
{$endif}
{$if declared(LoadGlyphFromStock)}
procedure LoadGlyphFromStock(AGlyph: TButtonGlyph; idButton: Integer); inline;
{$endif}
{$if declared(LoadGlyphFromResource)}
procedure LoadGlyphFromResource(AGlyph: TButtonGlyph; idButton: Integer); inline;
{$endif}
{$if declared(GetButtonCaption)}
function GetButtonCaption(idButton: Integer): String; inline;
{$endif}
{$if declared(GetDefaultButtonIcon)}
function GetDefaultButtonIcon(idButton: Integer; ScalePercent: Integer = 100): TCustomBitmap; inline;
{$endif}
{$if declared(GetButtonIcon)}
function GetButtonIcon(idButton: Integer): TCustomBitmap; inline;
{$endif}
{$if declared(GetButtonImageIndex)}
function GetButtonImageIndex(idButton: TButtonImage): Integer; inline;
{$endif}
{$if declared(BidiAdjustButtonLayout)}
function BidiAdjustButtonLayout(IsRightToLeft: Boolean; Layout: TButtonLayout): TButtonLayout; inline;
{$endif}
{$if declared(dbgs)}
function dbgs(Kind: TBitBtnKind): string; overload; inline;
{$endif}

implementation

{$if declared(GetLCLDefaultBtnGlyph)}
function GetLCLDefaultBtnGlyph(Kind: TBitBtnKind): TGraphic;
begin
  Result := Buttons.GetLCLDefaultBtnGlyph(Kind);
end;

{$endif}
{$if declared(LoadGlyphFromResourceName)}
procedure LoadGlyphFromResourceName(AGlyph: TButtonGlyph; Instance: TLCLHandle; const AName: String);
begin
  Buttons.LoadGlyphFromResourceName(AGlyph, Instance, AName);
end;

{$endif}
{$if declared(LoadGlyphFromLazarusResource)}
procedure LoadGlyphFromLazarusResource(AGlyph: TButtonGlyph; const AName: String);
begin
  Buttons.LoadGlyphFromLazarusResource(AGlyph, AName);
end;

{$endif}
{$if declared(LoadGlyphFromStock)}
procedure LoadGlyphFromStock(AGlyph: TButtonGlyph; idButton: Integer);
begin
  Buttons.LoadGlyphFromStock(AGlyph, idButton);
end;

{$endif}
{$if declared(LoadGlyphFromResource)}
procedure LoadGlyphFromResource(AGlyph: TButtonGlyph; idButton: Integer);
begin
  Buttons.LoadGlyphFromResource(AGlyph, idButton);
end;

{$endif}
{$if declared(GetButtonCaption)}
function GetButtonCaption(idButton: Integer): String;
begin
  Result := Buttons.GetButtonCaption(idButton);
end;

{$endif}
{$if declared(GetDefaultButtonIcon)}
function GetDefaultButtonIcon(idButton: Integer; ScalePercent: Integer = 100): TCustomBitmap;
begin
  Result := Buttons.GetDefaultButtonIcon(idButton, ScalePercent);
end;

{$endif}
{$if declared(GetButtonIcon)}
function GetButtonIcon(idButton: Integer): TCustomBitmap;
begin
  Result := Buttons.GetButtonIcon(idButton);
end;

{$endif}
{$if declared(GetButtonImageIndex)}
function GetButtonImageIndex(idButton: TButtonImage): Integer;
begin
  Result := Buttons.GetButtonImageIndex(idButton);
end;

{$endif}
{$if declared(BidiAdjustButtonLayout)}
function BidiAdjustButtonLayout(IsRightToLeft: Boolean; Layout: TButtonLayout): TButtonLayout;
begin
  Result := Buttons.BidiAdjustButtonLayout(IsRightToLeft, Layout);
end;

{$endif}
{$if declared(dbgs)}
function dbgs(Kind: TBitBtnKind): string;
begin
  Result := Buttons.dbgs(Kind);
end;

{$endif}
end.
