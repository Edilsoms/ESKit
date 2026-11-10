{
 *****************************************************************************
  ESKit - estheme.pas
  Motor de temas compartilhado pelos componentes FX (estilo FireMonkey) e
  Sx (estilo DevExpress). Um tema global é aplicado por TEsFxStyleBook ou
  TEsSkinController e todos os controles registrados são repintados.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsTheme;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, TypInfo, Controls, Graphics, Forms, LCLType, LazMethodList, EsGraphics;

type
  { estilos disponíveis (FMX-like e skins DevExpress-like) }
  TEsStyleKind = (
    dsLight,            // FMX "Light"
    dsDark,             // FMX "Dark"
    dsAir,              // FMX "Air" (azul claro)
    dsJet,              // FMX "Jet" (grafite)
    dsOffice2019White,  // DevExpress "Office 2019 White"
    dsOffice2019Colorful,
    dsOffice2019Black,
    dsTheBezier,        // DevExpress "The Bezier"
    dsBasic             // DevExpress "Basic"
  );

  TEsTheme = record
    Name: string;
    Dark: Boolean;
    // geral
    Background: TAlphaColor;   // fundo de formulário
    Surface: TAlphaColor;      // fundo de controles (edits, grid)
    SurfaceAlt: TAlphaColor;   // linhas alternadas, painéis
    Text: TAlphaColor;
    TextDim: TAlphaColor;
    TextDisabled: TAlphaColor;
    Border: TAlphaColor;
    BorderHot: TAlphaColor;
    Accent: TAlphaColor;       // cor de destaque (seleção, foco, botões primários)
    AccentText: TAlphaColor;
    Hover: TAlphaColor;
    Pressed: TAlphaColor;
    Track: TAlphaColor;        // trilhos de switch/trackbar/progresso
    Danger: TAlphaColor;
    Success: TAlphaColor;
    // botões
    ButtonFace: TAlphaColor;
    ButtonFace2: TAlphaColor;  // para gradiente vertical
    ButtonText: TAlphaColor;
    // grid / navbar / ribbon (DevExpress-like)
    HeaderFace: TAlphaColor;
    HeaderFace2: TAlphaColor;
    HeaderText: TAlphaColor;
    GroupPanel: TAlphaColor;
    GroupRow: TAlphaColor;
    GridLine: TAlphaColor;
    Selection: TAlphaColor;
    SelectionText: TAlphaColor;
    SelectionInactive: TAlphaColor;
    FooterFace: TAlphaColor;
    RibbonTabBar: TAlphaColor;
    RibbonTabBarText: TAlphaColor;
    RibbonBody: TAlphaColor;
    // métricas
    Radius: Single;            // raio de cantos padrão
    UseGradients: Boolean;
  end;

  { TEsThemeManager }

  TEsThemeManager = class
  private
    FTheme: TEsTheme;
    FKind: TEsStyleKind;
    FClients: TFPList;
    FListeners: TMethodList;
    FAccentOverride: TAlphaColor;
    procedure NotifyAll;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterClient(AControl: TControl);
    procedure UnregisterClient(AControl: TControl);
    procedure AddChangeHandler(const AHandler: TNotifyEvent);
    procedure RemoveChangeHandler(const AHandler: TNotifyEvent);
    procedure ApplyStyle(AKind: TEsStyleKind; AAccent: TAlphaColor = TAlphaColors.Null);
    procedure ApplyTheme(const ATheme: TEsTheme);
    { arquivos de tema (substituem os .style do FMX): texto INI com o estilo
      base e as cores; chaves ausentes vêm do estilo base }
    procedure SaveToFile(const AFileName: string);
    procedure LoadFromFile(const AFileName: string);
    procedure SaveToStrings(AList: TStrings);
    procedure LoadFromStrings(AList: TStrings);
    property Theme: TEsTheme read FTheme;
    property Kind: TEsStyleKind read FKind;
  end;

function EsThemes: TEsThemeManager;
function EsCurrentTheme: TEsTheme; inline;
function EsBuildTheme(AKind: TEsStyleKind): TEsTheme;
function EsStyleName(AKind: TEsStyleKind): string;
{ tema <-> texto (formato INI: [ESKitTheme], Base=, Name=, Dark=, Radius=,
  UseGradients= e uma linha por cor no formato #AARRGGBB) }
procedure EsThemeToStrings(const ATheme: TEsTheme; ABase: TEsStyleKind; AList: TStrings);
function EsThemeFromStrings(AList: TStrings; out ABase: TEsStyleKind): TEsTheme;
function EsStyleKindFromName(const AName: string; out AKind: TEsStyleKind): Boolean;
{ escala de 96 dpi para o dpi do formulário; seguro mesmo sem formulário pai }
function EsScale(AControl: TControl; AValue: Integer): Integer;

implementation

function EsScale(AControl: TControl; AValue: Integer): Integer;
begin
  if (AControl <> nil) and (GetParentDesignControl(AControl) <> nil) then
    Result := AControl.Scale96ToForm(AValue)
  else
    Result := MulDiv(AValue, Screen.PixelsPerInch, 96);
end;

var
  GThemes: TEsThemeManager = nil;

function EsThemes: TEsThemeManager;
begin
  if GThemes = nil then
    GThemes := TEsThemeManager.Create;
  Result := GThemes;
end;

function EsCurrentTheme: TEsTheme;
begin
  Result := EsThemes.Theme;
end;

function EsStyleName(AKind: TEsStyleKind): string;
const
  Names: array[TEsStyleKind] of string = ('Light', 'Dark', 'Air', 'Jet',
    'Office 2019 White', 'Office 2019 Colorful', 'Office 2019 Black',
    'The Bezier', 'Basic');
begin
  Result := Names[AKind];
end;

function C(V: Cardinal): TAlphaColor; inline;
begin
  Result := TAlphaColor(V);
end;

function EsBuildTheme(AKind: TEsStyleKind): TEsTheme;
begin
  Result := Default(TEsTheme);
  Result.Name := EsStyleName(AKind);
  Result.Radius := 6;
  Result.UseGradients := False;
  Result.Danger := C($FFD13438);
  Result.Success := C($FF107C10);
  Result.AccentText := TAlphaColors.White;

  case AKind of
    dsLight, dsAir, dsOffice2019White, dsOffice2019Colorful, dsBasic:
      begin
        Result.Dark := False;
        Result.Background := C($FFF3F3F3);
        Result.Surface := C($FFFFFFFF);
        Result.SurfaceAlt := C($FFF7F7F7);
        Result.Text := C($FF202020);
        Result.TextDim := C($FF6B6B6B);
        Result.TextDisabled := C($FFA0A0A0);
        Result.Border := C($FFC8C8C8);
        Result.BorderHot := C($FF8A8A8A);
        Result.Accent := C($FF0067C0);
        Result.Hover := C($14000000);
        Result.Pressed := C($28000000);
        Result.Track := C($FFD6D6D6);
        Result.ButtonFace := C($FFFDFDFD);
        Result.ButtonFace2 := C($FFF0F0F0);
        Result.ButtonText := C($FF202020);
        Result.HeaderFace := C($FFF5F5F5);
        Result.HeaderFace2 := C($FFE9E9E9);
        Result.HeaderText := C($FF303030);
        Result.GroupPanel := C($FFE8E8E8);
        Result.GroupRow := C($FFEFEFEF);
        Result.GridLine := C($FFE1E1E1);
        Result.Selection := C($FFCCE4F7);
        Result.SelectionText := C($FF000000);
        Result.SelectionInactive := C($FFE5E5E5);
        Result.FooterFace := C($FFF0F0F0);
        Result.RibbonTabBar := C($FFF3F3F3);
        Result.RibbonTabBarText := C($FF262626);
        Result.RibbonBody := C($FFFAFAFA);
      end;
  else
    begin
      Result.Dark := True;
      Result.Background := C($FF202020);
      Result.Surface := C($FF2B2B2B);
      Result.SurfaceAlt := C($FF323232);
      Result.Text := C($FFF0F0F0);
      Result.TextDim := C($FFB0B0B0);
      Result.TextDisabled := C($FF707070);
      Result.Border := C($FF4A4A4A);
      Result.BorderHot := C($FF7A7A7A);
      Result.Accent := C($FF4CC2FF);
      Result.AccentText := C($FF000000);
      Result.Hover := C($18FFFFFF);
      Result.Pressed := C($30FFFFFF);
      Result.Track := C($FF4A4A4A);
      Result.ButtonFace := C($FF3A3A3A);
      Result.ButtonFace2 := C($FF323232);
      Result.ButtonText := C($FFF0F0F0);
      Result.HeaderFace := C($FF333333);
      Result.HeaderFace2 := C($FF2D2D2D);
      Result.HeaderText := C($FFE0E0E0);
      Result.GroupPanel := C($FF262626);
      Result.GroupRow := C($FF303030);
      Result.GridLine := C($FF3C3C3C);
      Result.Selection := C($FF094771);
      Result.SelectionText := C($FFFFFFFF);
      Result.SelectionInactive := C($FF3A3A3A);
      Result.FooterFace := C($FF2F2F2F);
      Result.RibbonTabBar := C($FF2B2B2B);
      Result.RibbonTabBarText := C($FFF0F0F0);
      Result.RibbonBody := C($FF333333);
    end;
  end;

  case AKind of
    dsLight: ;
    dsDark: ;
    dsAir:
      begin
        Result.Background := C($FFEAF2FB);
        Result.Accent := C($FF2A7DE1);
        Result.Track := C($FFC9D9EE);
        Result.Border := C($FFB6CBE6);
        Result.HeaderFace := C($FFE3EEFA);
        Result.HeaderFace2 := C($FFD3E3F6);
        Result.Selection := C($FFBBD7F7);
        Result.Radius := 10;
        Result.UseGradients := True;
      end;
    dsJet:
      begin
        Result.Background := C($FF1B1E23);
        Result.Surface := C($FF23272E);
        Result.SurfaceAlt := C($FF2A2F37);
        Result.Accent := C($FFFF8A00);
        Result.AccentText := C($FF000000);
        Result.Border := C($FF3B414B);
        Result.Selection := C($FF5A3A10);
        Result.Radius := 4;
      end;
    dsOffice2019White:
      begin
        Result.Accent := C($FF2B579A);
        Result.AccentText := TAlphaColors.White;
        Result.Radius := 2;
        Result.RibbonTabBar := C($FFFFFFFF);
        Result.RibbonBody := C($FFF8F8F8);
        Result.Selection := C($FFC5D7EC);
      end;
    dsOffice2019Colorful:
      begin
        Result.Accent := C($FF2B579A);
        Result.AccentText := TAlphaColors.White;
        Result.Radius := 2;
        Result.RibbonTabBar := C($FF2B579A);
        Result.RibbonTabBarText := TAlphaColors.White;
        Result.RibbonBody := C($FFF3F3F3);
        Result.GroupPanel := C($FFDCE6F2);
        Result.HeaderFace := C($FFF2F6FB);
        Result.HeaderFace2 := C($FFE3EBF5);
        Result.Selection := C($FFC5D7EC);
      end;
    dsOffice2019Black:
      begin
        Result.Background := C($FF262626);
        Result.Surface := C($FF2F2F2F);
        Result.Accent := C($FF6D9BD8);
        Result.AccentText := TAlphaColors.Black;
        Result.Radius := 2;
        Result.RibbonTabBar := C($FF0A0A0A);
        Result.RibbonBody := C($FF444444);
        Result.Selection := C($FF3F5F86);
      end;
    dsTheBezier:
      begin
        Result.Background := C($FF1F2A44);
        Result.Surface := C($FF26334F);
        Result.SurfaceAlt := C($FF2C3A59);
        Result.Accent := C($FF00B4D8);
        Result.AccentText := C($FF00121A);
        Result.Border := C($FF3A4A6E);
        Result.HeaderFace := C($FF2C3A59);
        Result.HeaderFace2 := C($FF26334F);
        Result.GroupPanel := C($FF1A243B);
        Result.GroupRow := C($FF2A3756);
        Result.GridLine := C($FF33426A);
        Result.Selection := C($FF14597A);
        Result.RibbonTabBar := C($FF19223A);
        Result.RibbonBody := C($FF26334F);
        Result.Radius := 4;
      end;
    dsBasic:
      begin
        Result.Accent := C($FF5B9BD5);
        Result.Radius := 3;
        Result.UseGradients := True;
        Result.HeaderFace := C($FFFFFFFF);
        Result.HeaderFace2 := C($FFE4E4E4);
        Result.ButtonFace := C($FFFFFFFF);
        Result.ButtonFace2 := C($FFE6E6E6);
      end;
  end;
end;

{ TEsThemeManager }

constructor TEsThemeManager.Create;
begin
  inherited Create;
  FClients := TFPList.Create;
  FListeners := TMethodList.Create;
  FAccentOverride := TAlphaColors.Null;
  FKind := dsLight;
  FTheme := EsBuildTheme(dsLight);
end;

destructor TEsThemeManager.Destroy;
begin
  FListeners.Free;
  FClients.Free;
  inherited Destroy;
end;

procedure TEsThemeManager.RegisterClient(AControl: TControl);
begin
  if FClients.IndexOf(AControl) < 0 then
    FClients.Add(AControl);
end;

procedure TEsThemeManager.UnregisterClient(AControl: TControl);
begin
  FClients.Remove(AControl);
end;

procedure TEsThemeManager.AddChangeHandler(const AHandler: TNotifyEvent);
begin
  FListeners.Add(TMethod(AHandler));
end;

procedure TEsThemeManager.RemoveChangeHandler(const AHandler: TNotifyEvent);
begin
  FListeners.Remove(TMethod(AHandler));
end;

procedure TEsThemeManager.NotifyAll;
var
  I: Integer;
begin
  for I := FClients.Count - 1 downto 0 do
    TControl(FClients[I]).Invalidate;
  FListeners.CallNotifyEvents(Self);
end;

procedure TEsThemeManager.ApplyStyle(AKind: TEsStyleKind; AAccent: TAlphaColor);
begin
  FKind := AKind;
  FTheme := EsBuildTheme(AKind);
  FAccentOverride := AAccent;
  if AlphaOf(AAccent) > 0 then
  begin
    FTheme.Accent := AAccent;
    if IsDarkColor(AAccent) then
      FTheme.AccentText := TAlphaColors.White
    else
      FTheme.AccentText := TAlphaColors.Black;
  end;
  NotifyAll;
end;

procedure TEsThemeManager.ApplyTheme(const ATheme: TEsTheme);
begin
  FTheme := ATheme;
  NotifyAll;
end;

procedure TEsThemeManager.SaveToStrings(AList: TStrings);
begin
  EsThemeToStrings(FTheme, FKind, AList);
end;

procedure TEsThemeManager.LoadFromStrings(AList: TStrings);
var
  K: TEsStyleKind;
  T: TEsTheme;
begin
  T := EsThemeFromStrings(AList, K);
  FKind := K;
  FAccentOverride := TAlphaColors.Null;
  ApplyTheme(T);
end;

procedure TEsThemeManager.SaveToFile(const AFileName: string);
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    SaveToStrings(L);
    L.SaveToFile(AFileName);
  finally
    L.Free;
  end;
end;

procedure TEsThemeManager.LoadFromFile(const AFileName: string);
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    L.LoadFromFile(AFileName);
    LoadFromStrings(L);
  finally
    L.Free;
  end;
end;

type
  PAlphaColor = ^TAlphaColor;

const
  ThemeColorNames: array[0..30] of string = (
    'Background', 'Surface', 'SurfaceAlt', 'Text', 'TextDim', 'TextDisabled', 'Border', 'BorderHot', 'Accent', 'AccentText', 'Hover', 'Pressed', 'Track', 'Danger', 'Success', 'ButtonFace', 'ButtonFace2', 'ButtonText', 'HeaderFace', 'HeaderFace2', 'HeaderText', 'GroupPanel', 'GroupRow', 'GridLine', 'Selection', 'SelectionText', 'SelectionInactive', 'FooterFace', 'RibbonTabBar', 'RibbonTabBarText', 'RibbonBody');

function ThemeColorPtr(var T: TEsTheme; AIndex: Integer): PAlphaColor;
begin
  case AIndex of
    0: Result := @T.Background;
    1: Result := @T.Surface;
    2: Result := @T.SurfaceAlt;
    3: Result := @T.Text;
    4: Result := @T.TextDim;
    5: Result := @T.TextDisabled;
    6: Result := @T.Border;
    7: Result := @T.BorderHot;
    8: Result := @T.Accent;
    9: Result := @T.AccentText;
    10: Result := @T.Hover;
    11: Result := @T.Pressed;
    12: Result := @T.Track;
    13: Result := @T.Danger;
    14: Result := @T.Success;
    15: Result := @T.ButtonFace;
    16: Result := @T.ButtonFace2;
    17: Result := @T.ButtonText;
    18: Result := @T.HeaderFace;
    19: Result := @T.HeaderFace2;
    20: Result := @T.HeaderText;
    21: Result := @T.GroupPanel;
    22: Result := @T.GroupRow;
    23: Result := @T.GridLine;
    24: Result := @T.Selection;
    25: Result := @T.SelectionText;
    26: Result := @T.SelectionInactive;
    27: Result := @T.FooterFace;
    28: Result := @T.RibbonTabBar;
    29: Result := @T.RibbonTabBarText;
    30: Result := @T.RibbonBody;
  else
    Result := nil;
  end;
end;

function EsStyleKindFromName(const AName: string; out AKind: TEsStyleKind): Boolean;
var
  K: TEsStyleKind;
begin
  for K := Low(TEsStyleKind) to High(TEsStyleKind) do
    if SameText(AName, EsStyleName(K)) or
       SameText(AName, Copy(GetEnumName(TypeInfo(TEsStyleKind), Ord(K)), 3, MaxInt)) then
    begin
      AKind := K;
      Exit(True);
    end;
  AKind := dsLight;
  Result := False;
end;

function B01(B: Boolean): string;
begin
  if B then Result := '1' else Result := '0';
end;

procedure EsThemeToStrings(const ATheme: TEsTheme; ABase: TEsStyleKind; AList: TStrings);
var
  T: TEsTheme;
  I: Integer;
  FS: TFormatSettings;
begin
  FS := FormatSettings;
  FS.DecimalSeparator := '.';
  T := ATheme;
  AList.Clear;
  AList.Add('[ESKitTheme]');
  AList.Add('Base=' + Copy(GetEnumName(TypeInfo(TEsStyleKind), Ord(ABase)), 3, MaxInt));
  AList.Add('Name=' + T.Name);
  AList.Add('Dark=' + B01(T.Dark));
  AList.Add('Radius=' + FloatToStr(T.Radius, FS));
  AList.Add('UseGradients=' + B01(T.UseGradients));
  for I := 0 to High(ThemeColorNames) do
    AList.Add(ThemeColorNames[I] + '=#' + IntToHex(ThemeColorPtr(T, I)^, 8));
end;

function EsThemeFromStrings(AList: TStrings; out ABase: TEsStyleKind): TEsTheme;
var
  I, J, P: Integer;
  K, V: string;
  C: TAlphaColor;
  FS: TFormatSettings;
begin
  FS := FormatSettings;
  FS.DecimalSeparator := '.';
  ABase := dsLight;
  // primeiro o estilo base (as demais chaves sobrepõem as dele)
  for I := 0 to AList.Count - 1 do
  begin
    P := Pos('=', AList[I]);
    if (P > 0) and SameText(Trim(Copy(AList[I], 1, P - 1)), 'Base') then
      EsStyleKindFromName(Trim(Copy(AList[I], P + 1, MaxInt)), ABase);
  end;
  Result := EsBuildTheme(ABase);
  for I := 0 to AList.Count - 1 do
  begin
    P := Pos('=', AList[I]);
    if P = 0 then Continue;
    K := Trim(Copy(AList[I], 1, P - 1));
    V := Trim(Copy(AList[I], P + 1, MaxInt));
    if (K = '') or CharInSet(K[1], [';', '#', '[']) then Continue;
    if SameText(K, 'Name') then Result.Name := V
    else if SameText(K, 'Dark') then Result.Dark := (V = '1') or SameText(V, 'true')
    else if SameText(K, 'UseGradients') then Result.UseGradients := (V = '1') or SameText(V, 'true')
    else if SameText(K, 'Radius') then Result.Radius := StrToFloatDef(V, Result.Radius, FS)
    else
      for J := 0 to High(ThemeColorNames) do
        if SameText(K, ThemeColorNames[J]) then
        begin
          if (V <> '') and (V[1] = '#') then
          begin
            C := TAlphaColor(StrToInt64Def('$' + Copy(V, 2, 8), ThemeColorPtr(Result, J)^));
            if Length(V) = 7 then C := C or $FF000000; // #RRGGBB
            ThemeColorPtr(Result, J)^ := C;
          end
          else if StringToAlphaColor(V, C) then
            ThemeColorPtr(Result, J)^ := C;
          Break;
        end;
  end;
end;


finalization
  FreeAndNil(GThemes);

end.
