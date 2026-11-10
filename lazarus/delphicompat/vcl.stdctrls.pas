{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.StdCtrls
  Gerado por tools/genvclcompat.py a partir de StdCtrls.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.StdCtrls;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Graphics, Controls, StdCtrls;
type
{$if declared(TEditCharCase)}
  TEditCharCase = StdCtrls.TEditCharCase;
{$endif}
{$if declared(TEchoMode)}
  TEchoMode = StdCtrls.TEchoMode;
{$endif}
{$if declared(TEditOption)}
  TEditOption = StdCtrls.TEditOption;
{$endif}
{$if declared(TEditOptions)}
  TEditOptions = StdCtrls.TEditOptions;
{$endif}
{$if declared(TScrollStyle)}
  TScrollStyle = StdCtrls.TScrollStyle;
{$endif}
{$if declared(TScrollCode)}
  TScrollCode = StdCtrls.TScrollCode;
{$endif}
{$if declared(TScrollEvent)}
  TScrollEvent = StdCtrls.TScrollEvent;
{$endif}
{$if declared(TCustomScrollBar)}
  TCustomScrollBar = StdCtrls.TCustomScrollBar;
{$endif}
{$if declared(TScrollBar)}
  TScrollBar = StdCtrls.TScrollBar;
{$endif}
{$if declared(TCustomGroupBox)}
  TCustomGroupBox = StdCtrls.TCustomGroupBox;
{$endif}
{$if declared(TGroupBox)}
  TGroupBox = StdCtrls.TGroupBox;
{$endif}
{$if declared(TEmulatedTextHintStatus)}
  TEmulatedTextHintStatus = StdCtrls.TEmulatedTextHintStatus;
{$endif}
{$if declared(TComboBoxAutoCompleteTextOption)}
  TComboBoxAutoCompleteTextOption = StdCtrls.TComboBoxAutoCompleteTextOption;
{$endif}
{$if declared(TComboBoxAutoCompleteText)}
  TComboBoxAutoCompleteText = StdCtrls.TComboBoxAutoCompleteText;
{$endif}
{$if declared(TComboBoxStyle)}
  TComboBoxStyle = StdCtrls.TComboBoxStyle;
{$endif}
{$if declared(TDrawItemEvent)}
  TDrawItemEvent = StdCtrls.TDrawItemEvent;
{$endif}
{$if declared(TMeasureItemEvent)}
  TMeasureItemEvent = StdCtrls.TMeasureItemEvent;
{$endif}
{$if declared(TCustomComboBox)}
  TCustomComboBox = StdCtrls.TCustomComboBox;
{$endif}
{$if declared(TComboBox)}
  TComboBox = StdCtrls.TComboBox;
{$endif}
{$if declared(TListBoxStyle)}
  TListBoxStyle = StdCtrls.TListBoxStyle;
{$endif}
{$if declared(TSelectionChangeEvent)}
  TSelectionChangeEvent = StdCtrls.TSelectionChangeEvent;
{$endif}
{$if declared(TListBoxOption)}
  TListBoxOption = StdCtrls.TListBoxOption;
{$endif}
{$if declared(TListBoxOptions)}
  TListBoxOptions = StdCtrls.TListBoxOptions;
{$endif}
{$if declared(TLBGetDataEvent)}
  TLBGetDataEvent = StdCtrls.TLBGetDataEvent;
{$endif}
{$if declared(TLBGetDataObjectEvent)}
  TLBGetDataObjectEvent = StdCtrls.TLBGetDataObjectEvent;
{$endif}
{$if declared(TLBFindDataEvent)}
  TLBFindDataEvent = StdCtrls.TLBFindDataEvent;
{$endif}
{$if declared(TCustomListBox)}
  TCustomListBox = StdCtrls.TCustomListBox;
{$endif}
{$if declared(TListBox)}
  TListBox = StdCtrls.TListBox;
{$endif}
{$if declared(TCustomEdit)}
  TCustomEdit = StdCtrls.TCustomEdit;
{$endif}
{$if declared(TMemoScrollbar)}
  TMemoScrollbar = StdCtrls.TMemoScrollbar;
{$endif}
{$if declared(TCustomMemo)}
  TCustomMemo = StdCtrls.TCustomMemo;
{$endif}
{$if declared(TEdit)}
  TEdit = StdCtrls.TEdit;
{$endif}
{$if declared(TMemo)}
  TMemo = StdCtrls.TMemo;
{$endif}
{$if declared(TStaticBorderStyle)}
  TStaticBorderStyle = StdCtrls.TStaticBorderStyle;
{$endif}
{$if declared(TCustomStaticText)}
  TCustomStaticText = StdCtrls.TCustomStaticText;
{$endif}
{$if declared(TStaticText)}
  TStaticText = StdCtrls.TStaticText;
{$endif}
{$if declared(TButtonControl)}
  TButtonControl = StdCtrls.TButtonControl;
{$endif}
{$if declared(TButtonActionLink)}
  TButtonActionLink = StdCtrls.TButtonActionLink;
{$endif}
{$if declared(TButtonActionLinkClass)}
  TButtonActionLinkClass = StdCtrls.TButtonActionLinkClass;
{$endif}
{$if declared(TCustomButton)}
  TCustomButton = StdCtrls.TCustomButton;
{$endif}
{$if declared(TButton)}
  TButton = StdCtrls.TButton;
{$endif}
{$if declared(TCheckBoxState)}
  TCheckBoxState = StdCtrls.TCheckBoxState;
{$endif}
{$if declared(TCustomCheckBox)}
  TCustomCheckBox = StdCtrls.TCustomCheckBox;
{$endif}
{$if declared(TCheckBox)}
  TCheckBox = StdCtrls.TCheckBox;
{$endif}
{$if declared(TToggleBox)}
  TToggleBox = StdCtrls.TToggleBox;
{$endif}
{$if declared(TRadioButton)}
  TRadioButton = StdCtrls.TRadioButton;
{$endif}
{$if declared(TCustomLabel)}
  TCustomLabel = StdCtrls.TCustomLabel;
{$endif}
{$if declared(TLabel)}
  TLabel = StdCtrls.TLabel;
{$endif}
{$if declared(TOwnerDrawState)}
  TOwnerDrawState = StdCtrls.TOwnerDrawState;
{$endif}
const
{$if declared(ecNormal)}
  ecNormal = StdCtrls.ecNormal;
{$endif}
{$if declared(ecUppercase)}
  ecUppercase = StdCtrls.ecUppercase;
{$endif}
{$if declared(ecLowerCase)}
  ecLowerCase = StdCtrls.ecLowerCase;
{$endif}
{$if declared(emNormal)}
  emNormal = StdCtrls.emNormal;
{$endif}
{$if declared(emNone)}
  emNone = StdCtrls.emNone;
{$endif}
{$if declared(emPassword)}
  emPassword = StdCtrls.emPassword;
{$endif}
{$if declared(teoEnableTextLayout)}
  teoEnableTextLayout = StdCtrls.teoEnableTextLayout;
{$endif}
{$if declared(ssNone)}
  ssNone = StdCtrls.ssNone;
{$endif}
{$if declared(ssHorizontal)}
  ssHorizontal = StdCtrls.ssHorizontal;
{$endif}
{$if declared(ssVertical)}
  ssVertical = StdCtrls.ssVertical;
{$endif}
{$if declared(ssBoth)}
  ssBoth = StdCtrls.ssBoth;
{$endif}
{$if declared(ssAutoHorizontal)}
  ssAutoHorizontal = StdCtrls.ssAutoHorizontal;
{$endif}
{$if declared(ssAutoVertical)}
  ssAutoVertical = StdCtrls.ssAutoVertical;
{$endif}
{$if declared(ssAutoBoth)}
  ssAutoBoth = StdCtrls.ssAutoBoth;
{$endif}
{$if declared(scLineUp)}
  scLineUp = StdCtrls.scLineUp;
{$endif}
{$if declared(scLineDown)}
  scLineDown = StdCtrls.scLineDown;
{$endif}
{$if declared(scPageUp)}
  scPageUp = StdCtrls.scPageUp;
{$endif}
{$if declared(scPageDown)}
  scPageDown = StdCtrls.scPageDown;
{$endif}
{$if declared(scPosition)}
  scPosition = StdCtrls.scPosition;
{$endif}
{$if declared(scTrack)}
  scTrack = StdCtrls.scTrack;
{$endif}
{$if declared(scTop)}
  scTop = StdCtrls.scTop;
{$endif}
{$if declared(scBottom)}
  scBottom = StdCtrls.scBottom;
{$endif}
{$if declared(scEndScroll)}
  scEndScroll = StdCtrls.scEndScroll;
{$endif}
{$if declared(thsHidden)}
  thsHidden = StdCtrls.thsHidden;
{$endif}
{$if declared(thsShowing)}
  thsShowing = StdCtrls.thsShowing;
{$endif}
{$if declared(thsChanging)}
  thsChanging = StdCtrls.thsChanging;
{$endif}
{$if declared(cbactEnabled)}
  cbactEnabled = StdCtrls.cbactEnabled;
{$endif}
{$if declared(cbactEndOfLineComplete)}
  cbactEndOfLineComplete = StdCtrls.cbactEndOfLineComplete;
{$endif}
{$if declared(cbactRetainPrefixCase)}
  cbactRetainPrefixCase = StdCtrls.cbactRetainPrefixCase;
{$endif}
{$if declared(cbactSearchCaseSensitive)}
  cbactSearchCaseSensitive = StdCtrls.cbactSearchCaseSensitive;
{$endif}
{$if declared(cbactSearchAscending)}
  cbactSearchAscending = StdCtrls.cbactSearchAscending;
{$endif}
{$if declared(csDropDown)}
  csDropDown = StdCtrls.csDropDown;
{$endif}
{$if declared(csSimple)}
  csSimple = StdCtrls.csSimple;
{$endif}
{$if declared(csDropDownList)}
  csDropDownList = StdCtrls.csDropDownList;
{$endif}
{$if declared(csOwnerDrawFixed)}
  csOwnerDrawFixed = StdCtrls.csOwnerDrawFixed;
{$endif}
{$if declared(csOwnerDrawVariable)}
  csOwnerDrawVariable = StdCtrls.csOwnerDrawVariable;
{$endif}
{$if declared(csOwnerDrawEditableFixed)}
  csOwnerDrawEditableFixed = StdCtrls.csOwnerDrawEditableFixed;
{$endif}
{$if declared(csOwnerDrawEditableVariable)}
  csOwnerDrawEditableVariable = StdCtrls.csOwnerDrawEditableVariable;
{$endif}
{$if declared(lbStandard)}
  lbStandard = StdCtrls.lbStandard;
{$endif}
{$if declared(lbOwnerDrawFixed)}
  lbOwnerDrawFixed = StdCtrls.lbOwnerDrawFixed;
{$endif}
{$if declared(lbOwnerDrawVariable)}
  lbOwnerDrawVariable = StdCtrls.lbOwnerDrawVariable;
{$endif}
{$if declared(lbVirtual)}
  lbVirtual = StdCtrls.lbVirtual;
{$endif}
{$if declared(lboDrawFocusRect)}
  lboDrawFocusRect = StdCtrls.lboDrawFocusRect;
{$endif}
{$if declared(sbsNone)}
  sbsNone = StdCtrls.sbsNone;
{$endif}
{$if declared(sbsSingle)}
  sbsSingle = StdCtrls.sbsSingle;
{$endif}
{$if declared(sbsSunken)}
  sbsSunken = StdCtrls.sbsSunken;
{$endif}
{$if declared(cbUnchecked)}
  cbUnchecked = StdCtrls.cbUnchecked;
{$endif}
{$if declared(cbChecked)}
  cbChecked = StdCtrls.cbChecked;
{$endif}
{$if declared(cbGrayed)}
  cbGrayed = StdCtrls.cbGrayed;
{$endif}
{$if declared(DefaultComboBoxAutoCompleteText)}
  DefaultComboBoxAutoCompleteText = StdCtrls.DefaultComboBoxAutoCompleteText;
{$endif}
{$if declared(CreateEmulatedTextHintFont)}
function CreateEmulatedTextHintFont(AWinControl: TWinControl): TFont; inline;
{$endif}

implementation

{$if declared(CreateEmulatedTextHintFont)}
function CreateEmulatedTextHintFont(AWinControl: TWinControl): TFont;
begin
  Result := StdCtrls.CreateEmulatedTextHintFont(AWinControl);
end;

{$endif}
end.
