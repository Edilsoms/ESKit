#!/usr/bin/env python3
"""Gera a versão Delphi (VCL) das units do ESKit a partir da versão Lazarus.

    python3 tools/lazarus2delphi.py            # regrava delphi/source/*.pas
    python3 tools/lazarus2delphi.py --check    # só mostra o que mudaria

Units convertidas automaticamente: ver UNITS abaixo. EsGraphics, EsTheme,
EsDB, EsPropEdits e ESKitReg são mantidas à mão na pasta delphi/source
(dependem de APIs muito diferentes: TLazIntfImage, SQLDB x FireDAC, IDE).

A conversão é feita por substituições exatas: se um trecho esperado não for
encontrado o script para e mostra qual foi, para que a regra seja ajustada.
"""
import difflib, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LAZ = os.path.join(ROOT, 'lazarus', 'source')
DEL = os.path.join(ROOT, 'delphi', 'source')


# ---------------------------------------------------------------- genéricas

def nofpc(s):
    """Resolve os blocos condicionais de compilador: fica só o ramo do Delphi
    (sem aninhamento)."""
    s = re.sub(r'\{\$IFDEF FPC\}.*?\{\$ELSE\}\n?(.*?)\{\$ENDIF\}\n?', r'\1', s, flags=re.S)
    s = re.sub(r'\{\$IFNDEF FPC\}\n?(.*?)\{\$ENDIF\}\n?', r'\1', s, flags=re.S)
    s = re.sub(r'\{\$IFDEF FPC\}.*?\{\$ENDIF\}\n?', '', s, flags=re.S)
    return s


def common(s):
    """Transformações genéricas LCL -> VCL."""
    s = nofpc(s)
    s = re.sub(r':= @([A-Za-z_][\w.]*)\s*;', r':= \1;', s)
    s = s.replace('    property BorderSpacing;\n', '    property AlignWithMargins;\n    property Margins;\n')
    s = s.replace('    property ChildSizing;\n', '    property Padding;\n')
    s = re.sub(r'SetInitialBounds\(0, 0, ', 'SetBounds(0, 0, ', s)
    s = re.sub(r'(?<![\w.])IsEnabled\b', 'EsIsEnabled(Self)', s)
    s = re.sub(r'\(@([A-Za-z_]\w*)\)', r'(\1)', s)
    s = re.sub(r'(?<![\w.])Math\.', 'System.Math.', s)
    s = s.replace('class function GetControlClassDefaultSize: TSize; override;',
                  'class function GetControlClassDefaultSize: TSize;')
    s = s.replace('PtrInt', 'NativeInt')
    # TCanvas.Line só existe na LCL
    s = re.sub(r'(\b[A-Za-z_][\w.]*)\.Line\(', r'EsLine(\1, ', s)
    s = re.sub(r'(?<![\w.])LineEnding\b', 'sLineBreak', s)
    s = s.replace('+ [csNoDesignSelectable, csNoDesignVisible]', '+ [csNoDesignVisible]')
    s = s.replace('  FEdit.ControlStyle := FEdit.ControlStyle + [csNoDesignSelectable];\n', '')
    s = s.replace('{$mode objfpc}{$H+}\n\n', '', 1)
    s = s.replace('{$mode objfpc}{$H+}\n', '', 1)
    return s


def vclmsg(s):
    """Overrides da LCL que na VCL são mensagens (classes que descendem
    diretamente de controles VCL)."""
    decl = {
        'procedure MouseEnter; override;': 'procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;',
        'procedure MouseLeave; override;': 'procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;',
        'procedure EnabledChanged; override;': 'procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;',
        'procedure TextChanged; override;': 'procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;',
        'procedure FontChanged(Sender: TObject); override;': 'procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;',
        'procedure EraseBackground(DC: HDC); override;': 'procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;',
    }
    for a, b in decl.items():
        s = s.replace(a, b)
    impl = [
        (r'procedure (\w+)\.MouseEnter;\n', r'procedure \1.CMMouseEnter(var Message: TMessage);\n', 'inherited MouseEnter;'),
        (r'procedure (\w+)\.MouseLeave;\n', r'procedure \1.CMMouseLeave(var Message: TMessage);\n', 'inherited MouseLeave;'),
        (r'procedure (\w+)\.EnabledChanged;\n', r'procedure \1.CMEnabledChanged(var Message: TMessage);\n', 'inherited EnabledChanged;'),
        (r'procedure (\w+)\.TextChanged;\n', r'procedure \1.CMTextChanged(var Message: TMessage);\n', 'inherited TextChanged;'),
        (r'procedure (\w+)\.FontChanged\(Sender: TObject\);\n', r'procedure \1.CMFontChanged(var Message: TMessage);\n', 'inherited FontChanged(Sender);'),
    ]
    for pat, rep, inh in impl:
        s = re.sub(pat, rep, s)
        s = s.replace(inh, 'inherited;')
    s = re.sub(r'procedure (\w+)\.EraseBackground\(DC: HDC\);\n(\s*)begin\n',
               r'procedure \1.WMEraseBkgnd(var Message: TWMEraseBkgnd);\n\2begin\n  Message.Result := 1;\n', s)
    s = re.sub(r'(\b[A-Za-z_][\w.]*)\.GetRGBColorResolvingParent\b', r'EsParentColor(\1)', s)
    s = re.sub(r'(?<![\w.])SysUtils\.', 'System.SysUtils.', s)
    return s


def dynarrays(s):
    """'array of X' em campos/variáveis/tipos -> TArray<X> (no Delphi, dois
    'array of X' anônimos não são compatíveis entre si)."""
    s = re.sub(r'^(\s+[A-Za-z_][\w, ]*:\s*)array of array of (\w+);', r'\1TArray<TArray<\2>>;', s, flags=re.M)
    s = re.sub(r'^(\s+[A-Za-z_][\w, ]*:\s*)array of (\w+);', r'\1TArray<\2>;', s, flags=re.M)
    s = re.sub(r'^(\s+T\w+\s*=\s*)array of (\w+);', r'\1TArray<\2>;', s, flags=re.M)
    return s


def header(s, laz_name, del_name):
    return s.replace('  ESKit - %s' % laz_name, '  ESKit para Delphi (VCL) - %s' % del_name, 1)


def apply(s, reps, unit):
    for a, b in reps:
        if a not in s:
            raise SystemExit('[%s] trecho não encontrado:\n%s' % (unit, a[:400]))
        s = s.replace(a, b)
    return s


# ---------------------------------------------------------- regras por unit

USES_MSG = 'Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,\n  '

UNITS = {}

UNITS['EsFxBase'] = ('esfxbase.pas', [], [
("""uses
  Classes, SysUtils, Types, Math, Controls, Graphics, ExtCtrls, LCLType,
  LCLIntf, LMessages, EsGraphics, EsTheme;""", """uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,
  System.Math, Vcl.Controls, Vcl.Graphics, Vcl.ExtCtrls, EsGraphics, EsTheme;"""),
("""    FClients: array of TEsFxTickEvent;
    FLastTick: QWord;""", """    FClients: TArray<TEsFxTickEvent>;
    FLastTick: Cardinal;"""),
("""    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure EnabledChanged; override;
    function EffectiveOpacity: Single;
    function ThemeText: TAlphaColor;
    function TextColorFor""", """    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure MouseEnter; virtual;
    procedure MouseLeave; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure EnabledChanged; virtual;
    function EffectiveOpacity: Single;
    function ThemeText: TAlphaColor;
    function TextColorFor"""),
("""    procedure Paint; override;
    procedure EraseBackground(DC: HDC); override;
    procedure RenderContent(ACanvas: TCanvas); virtual;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure EnabledChanged; override;""", """    procedure Paint; override;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure RenderContent(ACanvas: TCanvas); virtual;
    procedure MouseEnter; virtual;
    procedure MouseLeave; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure EnabledChanged; virtual;"""),
("""function ResolvedColor(P: TControl): TColor;
begin
  Result := P.GetRGBColorResolvingParent;
end;""", """function ResolvedColor(P: TControl): TColor;
begin
  Result := EsParentColor(P);
end;"""),
("""    FTimer.OnTimer := @TimerTick;
  end;
  if not FTimer.Enabled then
  begin
    FLastTick := GetTickCount64;""", """    FTimer.OnTimer := TimerTick;
  end;
  if not FTimer.Enabled then
  begin
    FLastTick := GetTickCount;"""),
("""  Now: QWord;
  Delta: Double;
  Snapshot: array of TEsFxTickEvent;
  I: Integer;
begin
  Now := GetTickCount64;
  Delta := (Now - FLastTick) / 1000;""", """  Now: Cardinal;
  Delta: Double;
  Snapshot: TArray<TEsFxTickEvent>;
  I: Integer;
begin
  Now := GetTickCount;
  Delta := Cardinal(Now - FLastTick) / 1000;"""),
("""procedure TEsFxGraphicControl.MouseEnter;
begin
  FIsMouseOver := True;
  FHover.SetTarget(1);
  EsFxNotifyTrigger(Self, ftMouseOver, True);
  inherited MouseEnter;
end;

procedure TEsFxGraphicControl.MouseLeave;
begin
  FIsMouseOver := False;
  FHover.SetTarget(0);
  EsFxNotifyTrigger(Self, ftMouseOver, False);
  inherited MouseLeave;
end;""", """procedure TEsFxGraphicControl.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  MouseEnter;
end;

procedure TEsFxGraphicControl.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  MouseLeave;
end;

procedure TEsFxGraphicControl.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  EnabledChanged;
end;

procedure TEsFxGraphicControl.MouseEnter;
begin
  FIsMouseOver := True;
  FHover.SetTarget(1);
  EsFxNotifyTrigger(Self, ftMouseOver, True);
end;

procedure TEsFxGraphicControl.MouseLeave;
begin
  FIsMouseOver := False;
  FHover.SetTarget(0);
  EsFxNotifyTrigger(Self, ftMouseOver, False);
end;"""),
("""procedure TEsFxGraphicControl.EnabledChanged;
begin
  inherited EnabledChanged;
  Invalidate;
end;""", """procedure TEsFxGraphicControl.EnabledChanged;
begin
  Invalidate;
end;"""),
("""procedure TEsFxContainer.EraseBackground(DC: HDC);
begin
  // nada: o Paint cobre toda a área (evita cintilação)
end;""", """procedure TEsFxContainer.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  // nada: o Paint cobre toda a área (evita cintilação)
  Message.Result := 1;
end;"""),
("""procedure TEsFxContainer.MouseEnter;
begin
  FIsMouseOver := True;
  EsFxNotifyTrigger(Self, ftMouseOver, True);
  inherited MouseEnter;
end;

procedure TEsFxContainer.MouseLeave;
begin
  FIsMouseOver := False;
  EsFxNotifyTrigger(Self, ftMouseOver, False);
  inherited MouseLeave;
end;""", """procedure TEsFxContainer.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  MouseEnter;
end;

procedure TEsFxContainer.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  MouseLeave;
end;

procedure TEsFxContainer.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  EnabledChanged;
end;

procedure TEsFxContainer.MouseEnter;
begin
  FIsMouseOver := True;
  EsFxNotifyTrigger(Self, ftMouseOver, True);
end;

procedure TEsFxContainer.MouseLeave;
begin
  FIsMouseOver := False;
  EsFxNotifyTrigger(Self, ftMouseOver, False);
end;"""),
("""procedure TEsFxContainer.EnabledChanged;
begin
  inherited EnabledChanged;
  PropsChanged(Self);
end;""", """procedure TEsFxContainer.EnabledChanged;
begin
  PropsChanged(Self);
end;"""),
], ['common'])

UNITS['EsFxAnimations'] = ('esfxanimations.pas', [], [
("""uses
  Classes, SysUtils, Math, TypInfo, Controls, Graphics, EsGraphics, EsFxBase;""", """uses
  System.SysUtils, System.Classes, System.Math, System.TypInfo, Vcl.Controls,
  Vcl.Graphics, EsGraphics, EsFxBase;"""),
("  GAnimations: TFPList = nil;", "  GAnimations: TList = nil;"),
("  Parts: TStringArray;", "  Parts: TArray<string>;"),
("  N := LowerCase(P^.PropType^.Name);", "  N := LowerCase(string(P^.PropType^.Name));"),
("    GAnimations := TFPList.Create;", "    GAnimations := TList.Create;"),
("    SetOrdProp(Obj, P, Int64(C));", "    SetOrdProp(Obj, P, Integer(C));"),
("  EsFxTriggerHook := @AnimationTriggerHook;", "  EsFxTriggerHook := AnimationTriggerHook;"),
], ['common'])

UNITS['EsFxShapes'] = ('esfxshapes.pas', [], [
("""interface

uses
  Classes, SysUtils, Types, Math, Controls, Graphics, EsGraphics, EsTheme,
  EsFxBase;""", """interface

uses
  Winapi.Messages, System.SysUtils, System.Classes, System.Types, System.Math,
  Vcl.Controls, Vcl.Graphics, EsGraphics, EsTheme, EsFxBase;"""),
("""    procedure RenderContent(ACanvas: TCanvas); override;
    procedure TextChanged; override;
    class function GetControlClassDefaultSize: TSize; override;
  public""", """    procedure RenderContent(ACanvas: TCanvas); override;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
  public"""),
("""  FTextSettings.OnChange := @PropsChanged;
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);
end;""", """  FTextSettings.OnChange := PropsChanged;
  SetBounds(0, 0, 120, 24);
end;"""),
("""class function TEsFxText.GetControlClassDefaultSize: TSize;
begin
  Result.CX := 120;
  Result.CY := 24;
end;

""", ""),
("""procedure TEsFxText.TextChanged;
begin
  inherited TextChanged;
  Invalidate;
end;""", """procedure TEsFxText.CMTextChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;"""),
], ['common'])

UNITS['EsFxStdCtrls'] = ('esfxstdctrls.pas', [], [
("""uses
  Classes, SysUtils, Types, Math, Controls, Graphics, Forms, StdCtrls,
  ImgList, LCLType, LCLIntf, LMessages, ActnList,
  EsGraphics, EsTheme, EsFxBase, EsFxShapes;""", """uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,
  System.Math, System.UITypes, System.ImageList, Vcl.Controls, Vcl.Graphics,
  Vcl.Forms, Vcl.StdCtrls, Vcl.ImgList, Vcl.ActnList,
  EsGraphics, EsTheme, EsFxBase, EsFxShapes;"""),
("""    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure TextChanged; override;
    { ação principal""", """    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    { ação principal"""),
("""procedure TEsFxFocusControl.TextChanged;
begin
  inherited TextChanged;
  Invalidate;
end;""", """procedure TEsFxFocusControl.CMTextChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TEsFxFocusControl.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  // setas chegam ao KeyDown (TrackBar etc.) em vez de mudar o foco
  Message.Result := Message.Result or DLGC_WANTARROWS;
end;"""),
("""    procedure FontChanged(Sender: TObject); override;""",
 """    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;"""),
("""procedure TEsFxEdit.FontChanged(Sender: TObject);
begin
  inherited FontChanged(Sender);""", """procedure TEsFxEdit.CMFontChanged(var Message: TMessage);
begin
  inherited;"""),
("""  FCustomStyle.LoadFromFile(AFileName);""", """  FCustomStyle.LoadFromFile(AFileName, TEncoding.UTF8);"""),
], ['common'])

UNITS['EsSkins'] = ('esskins.pas', [], [
("""uses
  Classes, SysUtils, Types, Math, Controls, Graphics, Forms, LCLType, LCLIntf,
  GraphType, EsGraphics, EsTheme;""", """uses
  System.SysUtils, System.Classes, System.Types, System.Math, Vcl.Controls,
  Vcl.Graphics, Vcl.GraphUtil, Vcl.Forms, Vcl.StdCtrls, EsGraphics, EsTheme;"""),
("""    ACanvas.GradientFill(R, C1, C2, gdVertical);""", """    GradientFillCanvas(ACanvas, C1, C2, R, gdVertical);"""),
("""{ fundo de botão skinado (normal/hot/pressed) }""", """{ posição/limites/página de um TScrollBar, na ordem que a VCL aceita }
procedure EsSetScrollParams(SB: TScrollBar; APos, AMin, AMax, APage: Integer);
{ fundo de botão skinado (normal/hot/pressed) }"""),
("""\nimplementation\n""", """\nimplementation

{ TScrollBar da VCL valida Max >= PageSize a cada atribuição: ordem importa }
procedure EsSetScrollParams(SB: TScrollBar; APos, AMin, AMax, APage: Integer);
begin
  if AMax < AMin then AMax := AMin;
  SB.PageSize := 0;
  SB.SetParams(EnsureRange(APos, AMin, AMax), AMin, AMax);
  SB.PageSize := Min(Max(APage, 0), AMax - AMin + 1);
end;
"""),
], ['common'])

UNITS['EsEditors'] = ('eseditors.pas', [], [
("""uses
  Classes, SysUtils, Types, Math, Controls, Graphics, Forms, StdCtrls, ExtCtrls,
  Menus, ImgList, Calendar, LCLType, LCLIntf, LMessages,
  EsGraphics, EsTheme, EsSkins;""", """uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,
  System.Math, System.UITypes, System.ImageList, Vcl.Controls, Vcl.Graphics,
  Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.ImgList, Vcl.ComCtrls,
  EsGraphics, EsTheme, EsSkins;"""),
("""    FCalendar: TCalendar;""", """    FCalendar: TMonthCalendar;"""),
("""  FormStyle := fsStayOnTop;
  ShowInTaskBar := stNever;
  Position := poDesigned;""", """  FormStyle := fsStayOnTop;
  PopupMode := pmAuto;
  Position := poDesigned;"""),
("""    FCalendar := TCalendar.Create(FPopup);""", """    FCalendar := TMonthCalendar.Create(FPopup);"""),
("""  if FDate <> 0 then
    FCalendar.DateTime := FDate
  else
    FCalendar.DateTime := SysUtils.Date;""", """  if FDate <> 0 then
    FCalendar.Date := FDate
  else
    FCalendar.Date := System.SysUtils.Date;"""),
("""  Date := FCalendar.DateTime;""", """  Date := FCalendar.Date;"""),
], ['common', 'vclmsg'])

UNITS['EsFxLists'] = ('esfxlists.pas', [], [
("""uses
  Classes, SysUtils, Types, Math, Controls, Graphics, Forms, ImgList, LCLType,
  LCLIntf, LMessages, EsGraphics, EsTheme, EsFxBase, EsFxShapes, EsFxStdCtrls;""", """uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,
  System.Math, System.UITypes, System.ImageList, Vcl.Controls, Vcl.Graphics, Vcl.Forms,
  Vcl.ImgList, EsGraphics, EsTheme, EsFxBase, EsFxShapes, EsFxStdCtrls;"""),
# TextChanged (LCL) -> CM_TEXTCHANGED (VCL)
("""    procedure SetParent(NewParent: TWinControl); override;
    procedure TextChanged; override;""", """    procedure SetParent(NewParent: TWinControl); override;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;"""),
("""procedure TEsFxTabItem.TextChanged;
begin
  inherited TextChanged;""", """procedure TEsFxTabItem.CMTextChanged(var Message: TMessage);
begin
  inherited;"""),
# a ordem das abas: na VCL as janelas filhas ficam em FWinControls (SetChildOrder)
("""  TC.SetControlIndex(Self, TC.GetControlIndex(TC.Tabs[AValue]));""", """  // VCL: SetZOrderPosition é privado; SetChildOrder chama-o no filho
  TC.SetChildOrder(Self, EsWinIndex(TC, TC.Tabs[AValue]));"""),
("""function TEsFxTabItem.GetTabControl: TEsFxTabControl;""", """{ posição de AChild entre os filhos janela de AParent }
function EsWinIndex(AParent: TWinControl; AChild: TControl): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to AParent.ControlCount - 1 do
  begin
    if AParent.Controls[I] = AChild then Exit;
    if AParent.Controls[I] is TWinControl then Inc(Result);
  end;
end;

function TEsFxTabItem.GetTabControl: TEsFxTabControl;"""),
# UTF8KeyPress (LCL) -> KeyPress (VCL, UTF-16)
("""    procedure UTF8KeyPress(var UTF8Key: TUTF8Char); override;""", """    procedure KeyPress(var Key: Char); override;"""),
("""procedure TEsFxListBox.UTF8KeyPress(var UTF8Key: TUTF8Char);
var
  I, J, Start: Integer;
  Now: QWord;
begin
  inherited UTF8KeyPress(UTF8Key);
  if (UTF8Key = '') or (UTF8Key[1] < ' ') then Exit;""", """procedure TEsFxListBox.KeyPress(var Key: Char);
var
  I, J, Start: Integer;
  Now: UInt64;
begin
  inherited KeyPress(Key);
  if Key < ' ' then Exit;"""),
("""  FSearch := FSearch + UTF8Key;
  Start := Max(FItemIndex, 0);
  if Length(FSearch) = Length(UTF8Key) then Inc(Start);""", """  FSearch := FSearch + Key;
  Start := Max(FItemIndex, 0);
  if Length(FSearch) = 1 then Inc(Start);"""),
("""    FLastMoveTime: QWord;
    FSearch: string;
    FSearchTime: QWord;""", """    FLastMoveTime: UInt64;
    FSearch: string;
    FSearchTime: UInt64;"""),
("""  Now: QWord;
  Dt: Single;""", """  Now: UInt64;
  Dt: Single;"""),
], ['common'])

UNITS['EsGrid'] = ('esgrid.pas', [], [
("""uses
  Classes, SysUtils, Types, Math, Variants, Controls, Graphics, Forms, StdCtrls,
  ExtCtrls, Menus, Clipbrd, DB, IniFiles, LCLType, LCLIntf, LMessages, LazMethodList,
  EsGraphics, EsTheme, EsSkins;""", """uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,
  System.Math, System.Variants, System.UITypes, System.IniFiles, Vcl.Controls,
  Vcl.Graphics, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Clipbrd,
  Data.DB, EsGraphics, EsTheme, EsSkins;"""),
("""    FGroupCols: TFPList;
    FSortCols: TFPList;""", """    FGroupCols: TList;
    FSortCols: TList;"""),
("""    FStateHandlers: TMethodList;""", """    FStateHandlers: TEsNotifyList;"""),
("""    procedure AsyncFocusEditor(Data: PtrInt);
    procedure AsyncShowEditor(Data: PtrInt);""", """    procedure AsyncFocusEditor(Data: NativeInt);
    procedure AsyncShowEditor(Data: NativeInt);
    procedure PostAsync(AKind: Integer);
    procedure WMEsAsync(var Message: TMessage); message WM_USER + $3E1;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;"""),
("""    procedure SortIndices(var A: array of Integer);""", """    procedure SortIndices(var A: TArray<Integer>);"""),
("""procedure TEsGrid.SortIndices(var A: array of Integer);""", """procedure TEsGrid.SortIndices(var A: TArray<Integer>);"""),
("""  FGroupCols := TFPList.Create;
  FSortCols := TFPList.Create;""", """  FGroupCols := TList.Create;
  FSortCols := TList.Create;"""),
("""  FStateHandlers := TMethodList.Create;""", """  FStateHandlers := TEsNotifyList.Create;"""),
("""  FEditor := TEdit.Create(Self);""", """  FEditor := TEsGridInplaceEdit.Create(Self);"""),
("""  Application.RemoveAsyncCalls(Self);\n""", ""),
("""  FStateHandlers.Add(TMethod(AHandler));""", """  FStateHandlers.Add(AHandler);"""),
("""    FStateHandlers.Remove(TMethod(AHandler));""", """    FStateHandlers.Remove(AHandler);"""),
("""procedure TEsGrid.AsyncShowEditor(Data: PtrInt);""", """procedure TEsGrid.PostAsync(AKind: Integer);
begin
  // equivale ao Application.QueueAsyncCall do Lazarus; morre junto com a janela
  if HandleAllocated then
    PostMessage(Handle, WM_USER + $3E1, AKind, 0);
end;

procedure TEsGrid.WMEsAsync(var Message: TMessage);
begin
  case Message.WParam of
    0: AsyncShowEditor(0);
    1: AsyncFocusEditor(0);
  end;
end;

procedure TEsGrid.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  Message.Result := Message.Result or DLGC_WANTARROWS or DLGC_WANTCHARS;
end;

procedure TEsGrid.AsyncShowEditor(Data: PtrInt);"""),
("""\nimplementation\n""", """\nimplementation

type
  { editor da célula: quer Tab e setas (na VCL o Tab mudaria o foco) }
  TEsGridInplaceEdit = class(TEdit)
  protected
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
  end;

procedure TEsGridInplaceEdit.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  Message.Result := Message.Result or DLGC_WANTTAB or DLGC_WANTARROWS;
end;
"""),
], ['common', 'vclmsg', 'dynarrays'], [
    ('re', r'Application\.QueueAsyncCall\(@AsyncShowEditor, 0\);', 'PostAsync(0);'),
    ('re', r'Application\.QueueAsyncCall\(@AsyncFocusEditor, 0\);', 'PostAsync(1);'),
    ('str', 'varLongWord, varInt64, varQWord', 'varLongWord, varInt64, varUInt64'),
    ('str', 'TMemIniFile.Create(AFileName)', 'TMemIniFile.Create(AFileName, TEncoding.UTF8)'),
    ('str', 'VarIsEmptyOrNull', 'EsVarIsEmptyOrNull'),
    # TScrollBar.SetParams de 4 argumentos (LCL) -> ordem segura na VCL
    ('re', r'(\bF\w*Scroll)\.SetParams\(', r'EsSetScrollParams(\1, '),
])

UNITS['EsNavBar'] = ('esnavbar.pas', [], [
("""uses
  Classes, SysUtils, Types, Math, Controls, Graphics, StdCtrls, Forms, ImgList,
  LCLType, LCLIntf, EsGraphics, EsTheme, EsSkins;""", """uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,
  System.Math, System.UITypes, System.ImageList, Vcl.Controls, Vcl.Graphics,
  Vcl.StdCtrls, Vcl.Forms, Vcl.ImgList, EsGraphics, EsTheme, EsSkins;"""),
("    FScroll.SetParams(FScrollY, 0, CH, Max(1, ClientHeight))",
 "    EsSetScrollParams(FScroll, FScrollY, 0, CH, Max(1, ClientHeight))"),
], ['common', 'vclmsg', 'dynarrays'])

UNITS['EsRibbon'] = ('esribbon.pas', [], [
("""uses
  Classes, SysUtils, Types, Math, Controls, Graphics, Forms, Menus, ImgList, ActnList,
  LCLType, LCLIntf, EsGraphics, EsTheme, EsSkins, EsEditors;""", """uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types,
  System.Math, System.UITypes, System.ImageList, Vcl.Controls, Vcl.Graphics,
  Vcl.Forms, Vcl.Menus, Vcl.ImgList, Vcl.ActnList, EsGraphics, EsTheme, EsSkins,
  EsEditors;"""),
], ['common', 'vclmsg', 'dynarrays'])

UNITS['EsGridExport'] = ('esgridexport.pas', [], [
("""  Classes, SysUtils, Types, Math, Variants, Graphics, LazUTF8, LConvEncoding, Zipper,
  ZStream, EsGrid, EsTrueType;""", """  System.SysUtils, System.Classes, System.Types, System.Math, System.Variants,
  System.Zip, System.ZLib, Vcl.Graphics, EsGraphics, EsGrid, EsTrueType;"""),
("""procedure SaveText(const AFileName, AText: string; ABom: Boolean = False);
var
  F: TFileStream;
  Bom: array[0..2] of Byte = ($EF, $BB, $BF);
begin
  F := TFileStream.Create(AFileName, fmCreate);
  try
    if ABom then F.WriteBuffer(Bom, 3);
    if AText <> '' then F.WriteBuffer(AText[1], Length(AText));
  finally
    F.Free;
  end;
end;""", """procedure SaveText(const AFileName, AText: string; ABom: Boolean = False);
const
  Bom: array[0..2] of Byte = ($EF, $BB, $BF);
var
  F: TFileStream;
  B: TBytes;
begin
  // os arquivos são sempre gravados em UTF-8
  B := TEncoding.UTF8.GetBytes(AText);
  F := TFileStream.Create(AFileName, fmCreate);
  try
    if ABom then F.WriteBuffer(Bom, 3);
    if Length(B) > 0 then F.WriteBuffer(B[0], Length(B));
  finally
    F.Free;
  end;
end;"""),
("""  FCanvas.Brush.Color := RGBToColor(AGray, AGray, AGray);
  FCanvas.FillRect(FOffsetX + Round(X * FScale), FOffsetY + Round(Y * FScale),
    FOffsetX + Round((X + W) * FScale), FOffsetY + Round((Y + H) * FScale));""",
 """  FCanvas.Brush.Color := TColor(AGray or (AGray shl 8) or (AGray shl 16));
  FCanvas.FillRect(Rect(FOffsetX + Round(X * FScale), FOffsetY + Round(Y * FScale),
    FOffsetX + Round((X + W) * FScale), FOffsetY + Round((Y + H) * FScale)));"""),
("""  FCanvas.Pen.Color := RGBToColor(AGray, AGray, AGray);""",
 """  FCanvas.Pen.Color := TColor(AGray or (AGray shl 8) or (AGray shl 16));"""),
("""  for I := 1 to Length(AKey) do
    if AKey[I] in ['A'..'Z', 'a'..'z', '0'..'9', '_', '.', '-'] then
      Result := Result + AKey[I]
    else if Ord(AKey[I]) < $80 then
      Result := Result + '_'
    else if (Ord(AKey[I]) and $C0) = $C0 then
      Result := Result + '_'; // início de caractere UTF-8 não ASCII
  if (Result = '') or not (Result[1] in ['A'..'Z', 'a'..'z', '_']) then""",
 """  for I := 1 to Length(AKey) do
    if CharInSet(AKey[I], ['A'..'Z', 'a'..'z', '0'..'9', '_', '.', '-']) then
      Result := Result + AKey[I]
    else
      Result := Result + '_';
  if (Result = '') or not CharInSet(Result[1], ['A'..'Z', 'a'..'z', '_']) then"""),
("""  InvFS := DefaultFormatSettings;""", """  InvFS := FormatSettings;"""),
# XLSX: TZipper (FPC) -> TZipFile (System.Zip)
("""  Z: TZipper;
  Streams: TList;""", """  Z: TZipFile;"""),
("""  procedure Add(const AName, AContent: string);
  var
    S: TStringStream;
  begin
    S := TStringStream.Create(AContent);
    Streams.Add(S);
    Z.Entries.AddFileEntry(S, AName);
  end;""", """  procedure Add(const AName, AContent: string);
  begin
    Z.Add(TEncoding.UTF8.GetBytes(AContent), AName);
  end;"""),
("""  Z := TZipper.Create;
  Streams := TList.Create;
  Sheet := TStringBuilder.Create;
  try
    Z.FileName := AFileName;""", """  Z := TZipFile.Create;
  Sheet := TStringBuilder.Create;
  try
    if FileExists(AFileName) then
      DeleteFile(AFileName);
    Z.Open(AFileName, zmWrite);"""),
("""    Z.ZipAllFiles;
  finally
    for R := 0 to Streams.Count - 1 do
      TObject(Streams[R]).Free;
    Streams.Free;""", """    Z.Close;
  finally"""),
# clDefault também existe (TColor) na Vcl.Graphics
("""    Z := TCompressionStream.Create(clDefault, Dst);""", """    Z := TCompressionStream.Create(System.ZLib.clDefault, Dst);"""),
], ['common', 'vclmsg', 'dynarrays'], [
    ('str', 'UTF8Length(', 'Length('),
    ('str', 'UTF8Copy(', 'Copy('),
])

UNITS['EsTrueType'] = ('estruetype.pas', [], [
("""uses
  Classes, SysUtils;""", """uses
  System.Classes, System.SysUtils;"""),
], ['common'])

UNITS['EsToolBarGrid'] = ('estoolbargrid.pas', [], [
("""uses
  Classes, SysUtils, Types, Math, Controls, Graphics, Forms, Dialogs, StdCtrls,
  ExtCtrls, ImgList, LCLType, LCLIntf, Printers, OSPrinters, PrintersDlgs,
  EsGraphics, EsTheme, EsSkins, EsGrid, EsGridExport;""", """uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI, Winapi.CommCtrl,
  System.SysUtils, System.Classes, System.Types, System.Math, System.UITypes,
  System.ImageList, Vcl.Controls, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ImgList, Vcl.Printers, Vcl.Imaging.pngimage,
  EsGraphics, EsTheme, EsSkins, EsGrid, EsGridExport;"""),
("""  procedure AddIcon(const AName: string);
  var
    Png: TPortableNetworkGraphic;
  begin
    Png := TPortableNetworkGraphic.Create;
    try
      try
        Png.LoadFromResourceName(HInstance, AName + Suffix);
        FImages.Add(Png, nil);
      except
        FImages.Add(nil, nil);
      end;
    finally
      Png.Free;
    end;
  end;""", """  procedure AddIcon(const AName: string);
  var
    Png: TPngImage;
    RS: TResourceStream;
    Bmp: TBitmap;
  begin
    Png := TPngImage.Create;
    Bmp := nil;
    try
      try
        RS := TResourceStream.Create(HInstance, AName + Suffix, RT_RCDATA);
        try
          Png.LoadFromStream(RS);
        finally
          RS.Free;
        end;
        Bmp := EsPngToAlphaBitmap(Png, Want);
        ImageList_Add(FImages.Handle, Bmp.Handle, 0);
      except
        // recurso ausente: ícone vazio (mantém os índices)
        FreeAndNil(Bmp);
        Bmp := TBitmap.Create;
        Bmp.PixelFormat := pf32bit;
        Bmp.SetSize(Want, Want);
        ImageList_Add(FImages.Handle, Bmp.Handle, 0);
      end;
    finally
      Bmp.Free;
      Png.Free;
    end;
  end;"""),
("""  FImages := TImageList.Create(Self);
  FImages.Width := Want;
  FImages.Height := Want;""", """  FImages := TImageList.Create(Self);
  FImages.ColorDepth := cd32Bit;
  FImages.DrawingStyle := dsTransparent;
  FImages.Width := Want;
  FImages.Height := Want;"""),
("""      try
        Printer.PaperSize.PaperName := PaperNames[FPaper];
      except
        // impressora sem esse papel: usa o atual
      end;""", """      try
        EsSetPrinterPaper(FPaper);
      except
        // impressora sem esse papel: usa o atual
      end;"""),
("""        Target := TEsCanvasReportTarget.Create(Printer.Canvas, Printer.XDPI);
        try
          W := Printer.PageWidth / Printer.XDPI * 72;
          H := Printer.PageHeight / Printer.YDPI * 72;""", """        DpiX := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
        DpiY := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
        Target := TEsCanvasReportTarget.Create(Printer.Canvas, DpiX);
        try
          W := Printer.PageWidth / DpiX * 72;
          H := Printer.PageHeight / DpiY * 72;"""),
("""const
  PaperNames: array[TEsPaperSize] of string = ('A4', 'Letter', 'Legal');
var
  Data: TEsExportData;
  Target: TEsCanvasReportTarget;
  W, H: Single;""", """var
  Data: TEsExportData;
  Target: TEsCanvasReportTarget;
  W, H: Single;
  DpiX, DpiY: Integer;"""),
("""      OpenDocument(FileName);""", """      ShellExecute(0, 'open', PChar(FileName), nil, nil, SW_SHOWNORMAL);"""),
("""{$R ../images/toolbargrid_images.res}""", """{$R EsToolBarGridIcons.res}"""),
("""\nimplementation\n""", """
implementation

{ PNG (RGBA) -> bitmap 32 bits com alfa "reto", como a ImageList 32 bits espera }
function EsPngToAlphaBitmap(APng: TPngImage; ASize: Integer): TBitmap;
var
  X, Y: Integer;
  Src: PRGBTriple;
  Alpha: PByte;
  Dst: PCardinal;
begin
  Result := TBitmap.Create;
  try
    Result.PixelFormat := pf32bit;
    Result.AlphaFormat := afIgnored;
    Result.SetSize(ASize, ASize);
    if (APng.Header.ColorType = COLOR_RGBALPHA) and (APng.Width = ASize) and
       (APng.Height = ASize) then
    begin
      for Y := 0 to ASize - 1 do
      begin
        Src := APng.Scanline[Y];
        Alpha := PByte(APng.AlphaScanline[Y]);
        Dst := Result.ScanLine[Y];
        for X := 0 to ASize - 1 do
        begin
          Dst^ := (Cardinal(Alpha^) shl 24) or (Cardinal(Src^.rgbtRed) shl 16) or
            (Cardinal(Src^.rgbtGreen) shl 8) or Src^.rgbtBlue;
          Inc(Src);
          Inc(Alpha);
          Inc(Dst);
        end;
      end;
    end
    else
    begin
      // outros formatos: desenha sobre fundo transparente (sem alfa parcial)
      Result.Canvas.Brush.Color := clFuchsia;
      Result.Canvas.FillRect(Rect(0, 0, ASize, ASize));
      Result.Canvas.StretchDraw(Rect(0, 0, ASize, ASize), APng);
    end;
  except
    Result.Free;
    raise;
  end;
end;

{ seleciona o papel na impressora atual (DEVMODE) }
procedure EsSetPrinterPaper(APaper: TEsPaperSize);
const
  Codes: array[TEsPaperSize] of SmallInt = (DMPAPER_A4, DMPAPER_LETTER, DMPAPER_LEGAL);
var
  Device, Driver, Port: array[0..MAX_PATH] of Char;
  HDM: THandle;
  DM: PDeviceMode;
begin
  Printer.GetPrinter(Device, Driver, Port, HDM);
  if HDM = 0 then
  begin
    Printer.PrinterIndex := Printer.PrinterIndex; // força a criação do DEVMODE
    Printer.GetPrinter(Device, Driver, Port, HDM);
  end;
  if HDM = 0 then Exit;
  DM := GlobalLock(HDM);
  if DM = nil then Exit;
  try
    DM^.dmFields := DM^.dmFields or DM_PAPERSIZE;
    DM^.dmPaperSize := Codes[APaper];
  finally
    GlobalUnlock(HDM);
  end;
  Printer.SetPrinter(Device, Driver, Port, HDM);
end;
"""),
], ['common', 'vclmsg', 'dynarrays'])


def convert(name):
    src, _, reps, passes, *post = UNITS[name]
    s = open(os.path.join(LAZ, src), encoding='utf-8').read()
    s = header(s, src, name + '.pas')
    s = apply(s, reps, name)
    for p in passes:
        s = globals()[p](s)
    for kind, a, b in (post[0] if post else []):
        s = re.sub(a, b, s) if kind == 're' else s.replace(a, b)
    # o Delphi não aceita 'finalization' sem 'initialization' (o FPC aceita)
    if re.search(r'^finalization\b', s, re.M | re.I) and not re.search(r'^initialization\b', s, re.M | re.I):
        s = re.sub(r'^finalization\b', 'initialization\n\nfinalization', s, count=1, flags=re.M | re.I)
    left = [l for l in s.splitlines()
            if re.search(r'@[A-Za-z_]|\bLCL\w*\b|LMessages|\{\$mode|\bTLM\w+|\bLM_|TFPList|QueueAsync', l)]
    if left:
        print('[%s] revisar:' % name, *left[:20], sep='\n    ')
    return s


def main():
    check = '--check' in sys.argv
    names = [a for a in sys.argv[1:] if not a.startswith('--')] or list(UNITS)
    for n in names:
        new = convert(n)
        path = os.path.join(DEL, n + '.pas')
        old = open(path, encoding='utf-8-sig').read() if os.path.exists(path) else ''
        if check:
            d = list(difflib.unified_diff(old.splitlines(), new.splitlines(), n, n + '(novo)', lineterm='', n=1))
            print('%s: %s' % (n, 'igual' if not d else '%d linhas diferentes' % len(d)))
            for l in d[:40]:
                print('   ', l)
        else:
            # BOM: o Delphi só lê como UTF-8 os fontes que começam com BOM
            open(path, 'w', encoding='utf-8-sig', newline='\r\n').write(new)
            print('gerado', path)


if __name__ == '__main__':
    main()
