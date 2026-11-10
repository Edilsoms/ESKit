{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Dialogs
  Gerado por tools/genvclcompat.py a partir de Dialogs.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Dialogs;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Types, Classes, System.UITypes, InterfaceBase, Forms, Controls, Graphics, Buttons, ComCtrls, LazLoggerBase, Dialogs;
type
{$if declared(TCDWSEventCapability)}
  TCDWSEventCapability = Dialogs.TCDWSEventCapability;
{$endif}
{$if declared(TCDWSEventCapabilities)}
  TCDWSEventCapabilities = Dialogs.TCDWSEventCapabilities;
{$endif}
{$if declared(TDialogResultEvent)}
  TDialogResultEvent = Dialogs.TDialogResultEvent;
{$endif}
{$if declared(TCommonDialog)}
  TCommonDialog = Dialogs.TCommonDialog;
{$endif}
{$if declared(TFileDialog)}
  TFileDialog = Dialogs.TFileDialog;
{$endif}
{$if declared(TOpenOption)}
  TOpenOption = Dialogs.TOpenOption;
{$endif}
{$if declared(TOpenOptions)}
  TOpenOptions = Dialogs.TOpenOptions;
{$endif}
{$if declared(TOpenOptionEx)}
  TOpenOptionEx = Dialogs.TOpenOptionEx;
{$endif}
{$if declared(TOpenOptionsEx)}
  TOpenOptionsEx = Dialogs.TOpenOptionsEx;
{$endif}
{$if declared(TOpenDialog)}
  TOpenDialog = Dialogs.TOpenDialog;
{$endif}
{$if declared(TSaveDialog)}
  TSaveDialog = Dialogs.TSaveDialog;
{$endif}
{$if declared(TSelectDirectoryDialog)}
  TSelectDirectoryDialog = Dialogs.TSelectDirectoryDialog;
{$endif}
{$if declared(TColorDialogOption)}
  TColorDialogOption = Dialogs.TColorDialogOption;
{$endif}
{$if declared(TColorDialogOptions)}
  TColorDialogOptions = Dialogs.TColorDialogOptions;
{$endif}
{$if declared(TColorDialog)}
  TColorDialog = Dialogs.TColorDialog;
{$endif}
{$if declared(TColorButton)}
  TColorButton = Dialogs.TColorButton;
{$endif}
{$if declared(TFontDialogOption)}
  TFontDialogOption = Dialogs.TFontDialogOption;
{$endif}
{$if declared(TFontDialogOptions)}
  TFontDialogOptions = Dialogs.TFontDialogOptions;
{$endif}
{$if declared(TFontDialog)}
  TFontDialog = Dialogs.TFontDialog;
{$endif}
{$if declared(TFindOption)}
  TFindOption = Dialogs.TFindOption;
{$endif}
{$if declared(TFindOptions)}
  TFindOptions = Dialogs.TFindOptions;
{$endif}
{$if declared(TFindDialog)}
  TFindDialog = Dialogs.TFindDialog;
{$endif}
{$if declared(TReplaceDialog)}
  TReplaceDialog = Dialogs.TReplaceDialog;
{$endif}
{$if declared(TCustomPrinterSetupDialog)}
  TCustomPrinterSetupDialog = Dialogs.TCustomPrinterSetupDialog;
{$endif}
{$if declared(TPrintRange)}
  TPrintRange = Dialogs.TPrintRange;
{$endif}
{$if declared(TPrintDialogOption)}
  TPrintDialogOption = Dialogs.TPrintDialogOption;
{$endif}
{$if declared(TPrintDialogOptions)}
  TPrintDialogOptions = Dialogs.TPrintDialogOptions;
{$endif}
{$if declared(TCustomPrintDialog)}
  TCustomPrintDialog = Dialogs.TCustomPrintDialog;
{$endif}
{$if declared(TCustomTaskDialog)}
  TCustomTaskDialog = Dialogs.TCustomTaskDialog;
{$endif}
{$if declared(TTaskDialogFlag)}
  TTaskDialogFlag = Dialogs.TTaskDialogFlag;
{$endif}
{$if declared(TTaskDialogFlags)}
  TTaskDialogFlags = Dialogs.TTaskDialogFlags;
{$endif}
{$if declared(TTaskDialogCommonButton)}
  TTaskDialogCommonButton = Dialogs.TTaskDialogCommonButton;
{$endif}
{$if declared(TTaskDialogCommonButtons)}
  TTaskDialogCommonButtons = Dialogs.TTaskDialogCommonButtons;
{$endif}
{$if declared(TTaskDlgClickEvent)}
  TTaskDlgClickEvent = Dialogs.TTaskDlgClickEvent;
{$endif}
{$if declared(TTaskDlgTimerEvent)}
  TTaskDlgTimerEvent = Dialogs.TTaskDlgTimerEvent;
{$endif}
{$if declared(TTaskDialogIcon)}
  TTaskDialogIcon = Dialogs.TTaskDialogIcon;
{$endif}
{$if declared(TTaskDialogButtons)}
  TTaskDialogButtons = Dialogs.TTaskDialogButtons;
{$endif}
{$if declared(TTaskDialogBaseButtonItem)}
  TTaskDialogBaseButtonItem = Dialogs.TTaskDialogBaseButtonItem;
{$endif}
{$if declared(TTaskDialogButtonItem)}
  TTaskDialogButtonItem = Dialogs.TTaskDialogButtonItem;
{$endif}
{$if declared(TTaskDialogRadioButtonItem)}
  TTaskDialogRadioButtonItem = Dialogs.TTaskDialogRadioButtonItem;
{$endif}
{$if declared(TTaskDialogButtonsEnumerator)}
  TTaskDialogButtonsEnumerator = Dialogs.TTaskDialogButtonsEnumerator;
{$endif}
{$if declared(TTaskDialogProgressBar)}
  TTaskDialogProgressBar = Dialogs.TTaskDialogProgressBar;
{$endif}
{$if declared(TTaskDialog)}
  TTaskDialog = Dialogs.TTaskDialog;
{$endif}
{$if declared(TCustomCopyToClipboardDialog)}
  TCustomCopyToClipboardDialog = Dialogs.TCustomCopyToClipboardDialog;
{$endif}
{$if declared(TSelectDirOpt)}
  TSelectDirOpt = Dialogs.TSelectDirOpt;
{$endif}
{$if declared(TSelectDirOpts)}
  TSelectDirOpts = Dialogs.TSelectDirOpts;
{$endif}
{$if declared(TInputCloseQueryEvent)}
  TInputCloseQueryEvent = Dialogs.TInputCloseQueryEvent;
{$endif}
{$if declared(TMsgDlgType)}
  TMsgDlgType = Dialogs.TMsgDlgType;
{$endif}
{$if declared(TMsgDlgBtn)}
  TMsgDlgBtn = Dialogs.TMsgDlgBtn;
{$endif}
{$if declared(TMsgDlgButtons)}
  TMsgDlgButtons = Dialogs.TMsgDlgButtons;
{$endif}
{$if declared(TProgressBarState)}
  TProgressBarState = Dialogs.TProgressBarState;
{$endif}
const
{$if declared(cdecWSPerformsDoShow)}
  cdecWSPerformsDoShow = Dialogs.cdecWSPerformsDoShow;
{$endif}
{$if declared(cdecWSPerformsDoCanClose)}
  cdecWSPerformsDoCanClose = Dialogs.cdecWSPerformsDoCanClose;
{$endif}
{$if declared(cdecWSPerformsDoClose)}
  cdecWSPerformsDoClose = Dialogs.cdecWSPerformsDoClose;
{$endif}
{$if declared(cdecWSNOCanCloseSupport)}
  cdecWSNOCanCloseSupport = Dialogs.cdecWSNOCanCloseSupport;
{$endif}
{$if declared(ofReadOnly)}
  ofReadOnly = Dialogs.ofReadOnly;
{$endif}
{$if declared(ofOverwritePrompt)}
  ofOverwritePrompt = Dialogs.ofOverwritePrompt;
{$endif}
{$if declared(ofHideReadOnly)}
  ofHideReadOnly = Dialogs.ofHideReadOnly;
{$endif}
{$if declared(ofNoChangeDir)}
  ofNoChangeDir = Dialogs.ofNoChangeDir;
{$endif}
{$if declared(ofShowHelp)}
  ofShowHelp = Dialogs.ofShowHelp;
{$endif}
{$if declared(ofNoValidate)}
  ofNoValidate = Dialogs.ofNoValidate;
{$endif}
{$if declared(ofAllowMultiSelect)}
  ofAllowMultiSelect = Dialogs.ofAllowMultiSelect;
{$endif}
{$if declared(ofExtensionDifferent)}
  ofExtensionDifferent = Dialogs.ofExtensionDifferent;
{$endif}
{$if declared(ofPathMustExist)}
  ofPathMustExist = Dialogs.ofPathMustExist;
{$endif}
{$if declared(ofFileMustExist)}
  ofFileMustExist = Dialogs.ofFileMustExist;
{$endif}
{$if declared(ofCreatePrompt)}
  ofCreatePrompt = Dialogs.ofCreatePrompt;
{$endif}
{$if declared(ofShareAware)}
  ofShareAware = Dialogs.ofShareAware;
{$endif}
{$if declared(ofNoReadOnlyReturn)}
  ofNoReadOnlyReturn = Dialogs.ofNoReadOnlyReturn;
{$endif}
{$if declared(ofNoTestFileCreate)}
  ofNoTestFileCreate = Dialogs.ofNoTestFileCreate;
{$endif}
{$if declared(ofNoNetworkButton)}
  ofNoNetworkButton = Dialogs.ofNoNetworkButton;
{$endif}
{$if declared(ofNoLongNames)}
  ofNoLongNames = Dialogs.ofNoLongNames;
{$endif}
{$if declared(ofOldStyleDialog)}
  ofOldStyleDialog = Dialogs.ofOldStyleDialog;
{$endif}
{$if declared(ofNoDereferenceLinks)}
  ofNoDereferenceLinks = Dialogs.ofNoDereferenceLinks;
{$endif}
{$if declared(ofNoResolveLinks)}
  ofNoResolveLinks = Dialogs.ofNoResolveLinks;
{$endif}
{$if declared(ofEnableIncludeNotify)}
  ofEnableIncludeNotify = Dialogs.ofEnableIncludeNotify;
{$endif}
{$if declared(ofEnableSizing)}
  ofEnableSizing = Dialogs.ofEnableSizing;
{$endif}
{$if declared(ofDontAddToRecent)}
  ofDontAddToRecent = Dialogs.ofDontAddToRecent;
{$endif}
{$if declared(ofForceShowHidden)}
  ofForceShowHidden = Dialogs.ofForceShowHidden;
{$endif}
{$if declared(ofViewDetail)}
  ofViewDetail = Dialogs.ofViewDetail;
{$endif}
{$if declared(ofAutoPreview)}
  ofAutoPreview = Dialogs.ofAutoPreview;
{$endif}
{$if declared(ofHidePinnedPlaces)}
  ofHidePinnedPlaces = Dialogs.ofHidePinnedPlaces;
{$endif}
{$if declared(ofStrictFileTypes)}
  ofStrictFileTypes = Dialogs.ofStrictFileTypes;
{$endif}
{$if declared(ofPickFolders)}
  ofPickFolders = Dialogs.ofPickFolders;
{$endif}
{$if declared(ofOkButtonNeedsInteraction)}
  ofOkButtonNeedsInteraction = Dialogs.ofOkButtonNeedsInteraction;
{$endif}
{$if declared(ofForceFileSystem)}
  ofForceFileSystem = Dialogs.ofForceFileSystem;
{$endif}
{$if declared(ofAllNonStorageItems)}
  ofAllNonStorageItems = Dialogs.ofAllNonStorageItems;
{$endif}
{$if declared(ofUseXPStyleAsFallBack)}
  ofUseXPStyleAsFallBack = Dialogs.ofUseXPStyleAsFallBack;
{$endif}
{$if declared(ofShowsFilePackagesSwitch)}
  ofShowsFilePackagesSwitch = Dialogs.ofShowsFilePackagesSwitch;
{$endif}
{$if declared(ofAllowsFilePackagesContents)}
  ofAllowsFilePackagesContents = Dialogs.ofAllowsFilePackagesContents;
{$endif}
{$if declared(ofUseAlternativeTitle)}
  ofUseAlternativeTitle = Dialogs.ofUseAlternativeTitle;
{$endif}
{$if declared(cdFullOpen)}
  cdFullOpen = Dialogs.cdFullOpen;
{$endif}
{$if declared(cdPreventFullOpen)}
  cdPreventFullOpen = Dialogs.cdPreventFullOpen;
{$endif}
{$if declared(cdShowHelp)}
  cdShowHelp = Dialogs.cdShowHelp;
{$endif}
{$if declared(cdSolidColor)}
  cdSolidColor = Dialogs.cdSolidColor;
{$endif}
{$if declared(cdAnyColor)}
  cdAnyColor = Dialogs.cdAnyColor;
{$endif}
{$if declared(cdShowAlphaChannel)}
  cdShowAlphaChannel = Dialogs.cdShowAlphaChannel;
{$endif}
{$if declared(cdNoButtons)}
  cdNoButtons = Dialogs.cdNoButtons;
{$endif}
{$if declared(cdDontUseNativeDialog)}
  cdDontUseNativeDialog = Dialogs.cdDontUseNativeDialog;
{$endif}
{$if declared(cdNoEyeDropperButton)}
  cdNoEyeDropperButton = Dialogs.cdNoEyeDropperButton;
{$endif}
{$if declared(fdAnsiOnly)}
  fdAnsiOnly = Dialogs.fdAnsiOnly;
{$endif}
{$if declared(fdTrueTypeOnly)}
  fdTrueTypeOnly = Dialogs.fdTrueTypeOnly;
{$endif}
{$if declared(fdEffects)}
  fdEffects = Dialogs.fdEffects;
{$endif}
{$if declared(fdFixedPitchOnly)}
  fdFixedPitchOnly = Dialogs.fdFixedPitchOnly;
{$endif}
{$if declared(fdForceFontExist)}
  fdForceFontExist = Dialogs.fdForceFontExist;
{$endif}
{$if declared(fdNoFaceSel)}
  fdNoFaceSel = Dialogs.fdNoFaceSel;
{$endif}
{$if declared(fdNoOEMFonts)}
  fdNoOEMFonts = Dialogs.fdNoOEMFonts;
{$endif}
{$if declared(fdNoSimulations)}
  fdNoSimulations = Dialogs.fdNoSimulations;
{$endif}
{$if declared(fdNoSizeSel)}
  fdNoSizeSel = Dialogs.fdNoSizeSel;
{$endif}
{$if declared(fdNoStyleSel)}
  fdNoStyleSel = Dialogs.fdNoStyleSel;
{$endif}
{$if declared(fdNoVectorFonts)}
  fdNoVectorFonts = Dialogs.fdNoVectorFonts;
{$endif}
{$if declared(fdShowHelp)}
  fdShowHelp = Dialogs.fdShowHelp;
{$endif}
{$if declared(fdWysiwyg)}
  fdWysiwyg = Dialogs.fdWysiwyg;
{$endif}
{$if declared(fdLimitSize)}
  fdLimitSize = Dialogs.fdLimitSize;
{$endif}
{$if declared(fdScalableOnly)}
  fdScalableOnly = Dialogs.fdScalableOnly;
{$endif}
{$if declared(fdApplyButton)}
  fdApplyButton = Dialogs.fdApplyButton;
{$endif}
{$if declared(frDown)}
  frDown = Dialogs.frDown;
{$endif}
{$if declared(frFindNext)}
  frFindNext = Dialogs.frFindNext;
{$endif}
{$if declared(frHideMatchCase)}
  frHideMatchCase = Dialogs.frHideMatchCase;
{$endif}
{$if declared(frHideWholeWord)}
  frHideWholeWord = Dialogs.frHideWholeWord;
{$endif}
{$if declared(frHideUpDown)}
  frHideUpDown = Dialogs.frHideUpDown;
{$endif}
{$if declared(frMatchCase)}
  frMatchCase = Dialogs.frMatchCase;
{$endif}
{$if declared(frDisableMatchCase)}
  frDisableMatchCase = Dialogs.frDisableMatchCase;
{$endif}
{$if declared(frDisableUpDown)}
  frDisableUpDown = Dialogs.frDisableUpDown;
{$endif}
{$if declared(frDisableWholeWord)}
  frDisableWholeWord = Dialogs.frDisableWholeWord;
{$endif}
{$if declared(frReplace)}
  frReplace = Dialogs.frReplace;
{$endif}
{$if declared(frReplaceAll)}
  frReplaceAll = Dialogs.frReplaceAll;
{$endif}
{$if declared(frWholeWord)}
  frWholeWord = Dialogs.frWholeWord;
{$endif}
{$if declared(frShowHelp)}
  frShowHelp = Dialogs.frShowHelp;
{$endif}
{$if declared(frEntireScope)}
  frEntireScope = Dialogs.frEntireScope;
{$endif}
{$if declared(frHideEntireScope)}
  frHideEntireScope = Dialogs.frHideEntireScope;
{$endif}
{$if declared(frPromptOnReplace)}
  frPromptOnReplace = Dialogs.frPromptOnReplace;
{$endif}
{$if declared(frHidePromptOnReplace)}
  frHidePromptOnReplace = Dialogs.frHidePromptOnReplace;
{$endif}
{$if declared(frButtonsAtBottom)}
  frButtonsAtBottom = Dialogs.frButtonsAtBottom;
{$endif}
{$if declared(prAllPages)}
  prAllPages = Dialogs.prAllPages;
{$endif}
{$if declared(prSelection)}
  prSelection = Dialogs.prSelection;
{$endif}
{$if declared(prPageNums)}
  prPageNums = Dialogs.prPageNums;
{$endif}
{$if declared(prCurrentPage)}
  prCurrentPage = Dialogs.prCurrentPage;
{$endif}
{$if declared(poPrintToFile)}
  poPrintToFile = Dialogs.poPrintToFile;
{$endif}
{$if declared(poPageNums)}
  poPageNums = Dialogs.poPageNums;
{$endif}
{$if declared(poSelection)}
  poSelection = Dialogs.poSelection;
{$endif}
{$if declared(poWarning)}
  poWarning = Dialogs.poWarning;
{$endif}
{$if declared(poHelp)}
  poHelp = Dialogs.poHelp;
{$endif}
{$if declared(poDisablePrintToFile)}
  poDisablePrintToFile = Dialogs.poDisablePrintToFile;
{$endif}
{$if declared(poBeforeBeginDoc)}
  poBeforeBeginDoc = Dialogs.poBeforeBeginDoc;
{$endif}
{$if declared(tfEnableHyperlinks)}
  tfEnableHyperlinks = Dialogs.tfEnableHyperlinks;
{$endif}
{$if declared(tfUseHiconMain)}
  tfUseHiconMain = Dialogs.tfUseHiconMain;
{$endif}
{$if declared(tfUseHiconFooter)}
  tfUseHiconFooter = Dialogs.tfUseHiconFooter;
{$endif}
{$if declared(tfAllowDialogCancellation)}
  tfAllowDialogCancellation = Dialogs.tfAllowDialogCancellation;
{$endif}
{$if declared(tfUseCommandLinks)}
  tfUseCommandLinks = Dialogs.tfUseCommandLinks;
{$endif}
{$if declared(tfUseCommandLinksNoIcon)}
  tfUseCommandLinksNoIcon = Dialogs.tfUseCommandLinksNoIcon;
{$endif}
{$if declared(tfExpandFooterArea)}
  tfExpandFooterArea = Dialogs.tfExpandFooterArea;
{$endif}
{$if declared(tfExpandedByDefault)}
  tfExpandedByDefault = Dialogs.tfExpandedByDefault;
{$endif}
{$if declared(tfVerificationFlagChecked)}
  tfVerificationFlagChecked = Dialogs.tfVerificationFlagChecked;
{$endif}
{$if declared(tfShowProgressBar)}
  tfShowProgressBar = Dialogs.tfShowProgressBar;
{$endif}
{$if declared(tfShowMarqueeProgressBar)}
  tfShowMarqueeProgressBar = Dialogs.tfShowMarqueeProgressBar;
{$endif}
{$if declared(tfCallbackTimer)}
  tfCallbackTimer = Dialogs.tfCallbackTimer;
{$endif}
{$if declared(tfPositionRelativeToWindow)}
  tfPositionRelativeToWindow = Dialogs.tfPositionRelativeToWindow;
{$endif}
{$if declared(tfRtlLayout)}
  tfRtlLayout = Dialogs.tfRtlLayout;
{$endif}
{$if declared(tfNoDefaultRadioButton)}
  tfNoDefaultRadioButton = Dialogs.tfNoDefaultRadioButton;
{$endif}
{$if declared(tfCanBeMinimized)}
  tfCanBeMinimized = Dialogs.tfCanBeMinimized;
{$endif}
{$if declared(tfNoSetForeGround)}
  tfNoSetForeGround = Dialogs.tfNoSetForeGround;
{$endif}
{$if declared(tfSizeToContent)}
  tfSizeToContent = Dialogs.tfSizeToContent;
{$endif}
{$if declared(tfForceNonNative)}
  tfForceNonNative = Dialogs.tfForceNonNative;
{$endif}
{$if declared(tfEmulateClassicStyle)}
  tfEmulateClassicStyle = Dialogs.tfEmulateClassicStyle;
{$endif}
{$if declared(tfQuery)}
  tfQuery = Dialogs.tfQuery;
{$endif}
{$if declared(tfSimpleQuery)}
  tfSimpleQuery = Dialogs.tfSimpleQuery;
{$endif}
{$if declared(tfQueryFixedChoices)}
  tfQueryFixedChoices = Dialogs.tfQueryFixedChoices;
{$endif}
{$if declared(tfQueryFocused)}
  tfQueryFocused = Dialogs.tfQueryFocused;
{$endif}
{$if declared(tcbOk)}
  tcbOk = Dialogs.tcbOk;
{$endif}
{$if declared(tcbYes)}
  tcbYes = Dialogs.tcbYes;
{$endif}
{$if declared(tcbNo)}
  tcbNo = Dialogs.tcbNo;
{$endif}
{$if declared(tcbCancel)}
  tcbCancel = Dialogs.tcbCancel;
{$endif}
{$if declared(tcbRetry)}
  tcbRetry = Dialogs.tcbRetry;
{$endif}
{$if declared(tcbClose)}
  tcbClose = Dialogs.tcbClose;
{$endif}
{$if declared(tdiNone)}
  tdiNone = Dialogs.tdiNone;
{$endif}
{$if declared(tdiWarning)}
  tdiWarning = Dialogs.tdiWarning;
{$endif}
{$if declared(tdiError)}
  tdiError = Dialogs.tdiError;
{$endif}
{$if declared(tdiInformation)}
  tdiInformation = Dialogs.tdiInformation;
{$endif}
{$if declared(tdiShield)}
  tdiShield = Dialogs.tdiShield;
{$endif}
{$if declared(tdiQuestion)}
  tdiQuestion = Dialogs.tdiQuestion;
{$endif}
{$if declared(sdAllowCreate)}
  sdAllowCreate = Dialogs.sdAllowCreate;
{$endif}
{$if declared(sdPerformCreate)}
  sdPerformCreate = Dialogs.sdPerformCreate;
{$endif}
{$if declared(sdPrompt)}
  sdPrompt = Dialogs.sdPrompt;
{$endif}
{$if declared(mtWarning)}
  mtWarning = Dialogs.mtWarning;
{$endif}
{$if declared(mtError)}
  mtError = Dialogs.mtError;
{$endif}
{$if declared(mtInformation)}
  mtInformation = Dialogs.mtInformation;
{$endif}
{$if declared(mtConfirmation)}
  mtConfirmation = Dialogs.mtConfirmation;
{$endif}
{$if declared(mtCustom)}
  mtCustom = Dialogs.mtCustom;
{$endif}
{$if declared(mbYes)}
  mbYes = Dialogs.mbYes;
{$endif}
{$if declared(mbNo)}
  mbNo = Dialogs.mbNo;
{$endif}
{$if declared(mbOK)}
  mbOK = Dialogs.mbOK;
{$endif}
{$if declared(mbCancel)}
  mbCancel = Dialogs.mbCancel;
{$endif}
{$if declared(mbAbort)}
  mbAbort = Dialogs.mbAbort;
{$endif}
{$if declared(mbRetry)}
  mbRetry = Dialogs.mbRetry;
{$endif}
{$if declared(mbIgnore)}
  mbIgnore = Dialogs.mbIgnore;
{$endif}
{$if declared(mbAll)}
  mbAll = Dialogs.mbAll;
{$endif}
{$if declared(mbNoToAll)}
  mbNoToAll = Dialogs.mbNoToAll;
{$endif}
{$if declared(mbYesToAll)}
  mbYesToAll = Dialogs.mbYesToAll;
{$endif}
{$if declared(mbHelp)}
  mbHelp = Dialogs.mbHelp;
{$endif}
{$if declared(mbClose)}
  mbClose = Dialogs.mbClose;
{$endif}
{$if declared(mbYesNoCancel)}
  mbYesNoCancel = Dialogs.mbYesNoCancel;
{$endif}
{$if declared(mbYesNo)}
  mbYesNo = Dialogs.mbYesNo;
{$endif}
{$if declared(mbOKCancel)}
  mbOKCancel = Dialogs.mbOKCancel;
{$endif}
{$if declared(mbAbortRetryIgnore)}
  mbAbortRetryIgnore = Dialogs.mbAbortRetryIgnore;
{$endif}
{$if declared(ofExNoPlacesBar)}
  ofExNoPlacesBar = Dialogs.ofExNoPlacesBar;
{$endif}
{$if declared(DefaultOpenDialogOptions)}
  DefaultOpenDialogOptions = Dialogs.DefaultOpenDialogOptions;
{$endif}
{$if declared(DefaultColorDialogOptions)}
  DefaultColorDialogOptions = Dialogs.DefaultColorDialogOptions;
{$endif}
{$if declared(PBST_NORMAL)}
  PBST_NORMAL = Dialogs.PBST_NORMAL;
{$endif}
{$if declared(PBST_ERROR)}
  PBST_ERROR = Dialogs.PBST_ERROR;
{$endif}
{$if declared(PBST_PAUSED)}
  PBST_PAUSED = Dialogs.PBST_PAUSED;
{$endif}
{$if declared(PB_DEFMIN)}
  PB_DEFMIN = Dialogs.PB_DEFMIN;
{$endif}
{$if declared(PB_DEFMAX)}
  PB_DEFMAX = Dialogs.PB_DEFMAX;
{$endif}
{$if declared(TDE_CONTENT)}
  TDE_CONTENT = Dialogs.TDE_CONTENT;
{$endif}
{$if declared(TDE_EXPANDED_INFORMATION)}
  TDE_EXPANDED_INFORMATION = Dialogs.TDE_EXPANDED_INFORMATION;
{$endif}
{$if declared(TDE_FOOTER)}
  TDE_FOOTER = Dialogs.TDE_FOOTER;
{$endif}
{$if declared(TDE_MAIN_INSTRUCTION)}
  TDE_MAIN_INSTRUCTION = Dialogs.TDE_MAIN_INSTRUCTION;
{$endif}
{$if declared(TaskDialogFirstButtonIndex)}
  TaskDialogFirstButtonIndex = Dialogs.TaskDialogFirstButtonIndex;
{$endif}
{$if declared(TaskDialogFirstRadioButtonIndex)}
  TaskDialogFirstRadioButtonIndex = Dialogs.TaskDialogFirstRadioButtonIndex;
{$endif}
var
{$if declared(MinimumDialogButtonWidth)}
  MinimumDialogButtonWidth: Integer absolute Dialogs.MinimumDialogButtonWidth;
{$endif}
{$if declared(MinimumDialogButtonHeight)}
  MinimumDialogButtonHeight: Integer absolute Dialogs.MinimumDialogButtonHeight;
{$endif}
{$if declared(cInputQueryEditSizePixels)}
  cInputQueryEditSizePixels: Integer absolute Dialogs.cInputQueryEditSizePixels;
{$endif}
{$if declared(cInputQueryEditSizePercents)}
  cInputQueryEditSizePercents: Integer absolute Dialogs.cInputQueryEditSizePercents;
{$endif}
{$if declared(cInputQuerySpacingSize)}
  cInputQuerySpacingSize: Integer absolute Dialogs.cInputQuerySpacingSize;
{$endif}
{$if declared(MessageDlg)}
function MessageDlg(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult; overload; inline;
{$endif}
{$if declared(MessageDlg)}
function MessageDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult; overload; inline;
{$endif}
{$if declared(MessageDlg)}
function MessageDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): TModalResult; overload; inline;
{$endif}
{$if declared(MessageDlg)}
function MessageDlg(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): TModalResult; overload; inline;
{$endif}
{$if declared(MessageDlg)}
function MessageDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; const HelpKeyword: string): TModalResult; overload; inline;
{$endif}
{$if declared(MessageDlgPos)}
function MessageDlgPos(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): TModalResult; overload; inline;
{$endif}
{$if declared(MessageDlgPosHelp)}
function MessageDlgPosHelp(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer; const HelpFileName: string): TModalResult; overload; inline;
{$endif}
{$if declared(CreateMessageDialog)}
function CreateMessageDialog(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): TForm; overload; inline;
{$endif}
{$if declared(CreateMessageDialog)}
function CreateMessageDialog(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): TForm; overload; inline;
{$endif}
{$if declared(DefaultPromptDialog)}
function DefaultPromptDialog(const DialogCaption, DialogMessage: string; DialogType: longint; Buttons: PLongint; ButtonCount, DefaultIndex, EscapeResult: Longint; UseDefaultPos: Boolean; X, Y: Longint): Longint; inline;
{$endif}
{$if declared(QuestionDlg)}
function QuestionDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: array of const; HelpCtx: Longint): TModalResult; overload; inline;
{$endif}
{$if declared(QuestionDlg)}
function QuestionDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: array of const; const HelpKeyword: string): TModalResult; overload; inline;
{$endif}
{$if declared(DefaultQuestionDialog)}
function DefaultQuestionDialog(const aCaption, aMsg: string; DlgType: LongInt; Buttons: TDialogButtons; HelpCtx: Longint): LongInt; inline;
{$endif}
{$if declared(ShowMessage)}
procedure ShowMessage(const aMsg: string); inline;
{$endif}
{$if declared(ShowMessageFmt)}
procedure ShowMessageFmt(const aMsg: string; Params: array of const); inline;
{$endif}
{$if declared(ShowMessagePos)}
procedure ShowMessagePos(const aMsg: string; X, Y: Integer); inline;
{$endif}
{$if declared(DefaultMessageBox)}
function DefaultMessageBox(Text, Caption: PChar; Flags: Longint) : Integer; inline;
{$endif}
{$if declared(InputBox)}
function InputBox(const ACaption, APrompt, ADefault : string) : string; inline;
{$endif}
{$if declared(PasswordBox)}
function PasswordBox(const ACaption, APrompt : string) : string; inline;
{$endif}
{$if declared(PromptForFileName)}
function PromptForFileName(var AFileName: string; const AFilter: string = ''; const ADefaultExt: string = ''; const ATitle: string = ''; const AInitialDir: string = ''; AIsSaveDialog: Boolean = False): Boolean; inline;
{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult; overload; inline;
{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; ADefaultButton: TMsgDlgBtn; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult; overload; inline;
{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult; overload; inline;
{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; ADefaultButton: TMsgDlgBtn; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult; overload; inline;
{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const ACheckBoxText: string; out Checked: boolean; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult; overload; inline;
{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; ADefaultButton: TMsgDlgBtn; const ACheckBoxText: string; out Checked: boolean; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult; overload; inline;
{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const ACheckBoxText: string; out Checked: boolean; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult; overload; inline;
{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; ADefaultButton: TMsgDlgBtn; const ACheckBoxText: string; out Checked: boolean; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult; overload; inline;
{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const ACustomButtons: array of string; ADefaultButton: Integer; const ACheckBoxText: string; out Checked: boolean; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; const aShowDetails: string = ''; const aHideDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult; overload; inline;
{$endif}
{$if declared(RegisterDialogForCopyToClipboard)}
procedure RegisterDialogForCopyToClipboard(const ADlg: TCustomForm); inline;
{$endif}
{$if declared(DialogCopyToClipboard)}
procedure DialogCopyToClipboard(Self, Sender: TObject; var Key: Word; Shift: TShiftState); inline;
{$endif}
{$if declared(SelectDirectory)}
function SelectDirectory(const Caption, InitialDirectory: string; out Directory: string): Boolean; overload; inline;
{$endif}
{$if declared(SelectDirectory)}
function SelectDirectory(const Caption, InitialDirectory: string; out Directory: string; ShowHidden: Boolean; HelpCtx: Longint = 0): Boolean; overload; inline;
{$endif}
{$if declared(SelectDirectory)}
function SelectDirectory(out Directory: string; Options: TSelectDirOpts; HelpCtx: Longint): Boolean; overload; inline;
{$endif}
{$if declared(InputQuery)}
function InputQuery(const ACaption, APrompt : string; MaskInput : Boolean; var Value : string) : Boolean; overload; inline;
{$endif}
{$if declared(InputQuery)}
function InputQuery(const ACaption, APrompt : string; var Value : string) : Boolean; overload; inline;
{$endif}
{$if declared(InputQuery)}
function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; ACloseEvent: TInputCloseQueryEvent = nil): Boolean; overload; inline;
{$endif}
{$if declared(DefaultInputDialog)}
function DefaultInputDialog(const InputCaption, InputPrompt : string; MaskInput : Boolean; var Value : string) : Boolean; inline;
{$endif}
{$if declared(InputCombo)}
function InputCombo(const ACaption, APrompt: string; const AList: TStrings): Integer; overload; inline;
{$endif}
{$if declared(InputCombo)}
function InputCombo(const ACaption, APrompt: string; const AList : Array of string): Integer; overload; inline;
{$endif}
{$if declared(InputComboEx)}
function InputComboEx(const ACaption, APrompt: string; const AList: TStrings; AllowCustomText: Boolean = False): string; overload; inline;
{$endif}
{$if declared(InputComboEx)}
function InputComboEx(const ACaption, APrompt: string; const AList : Array of string; AllowCustomText: Boolean = False): string; overload; inline;
{$endif}
{$if declared(ExtractColorIndexAndColor)}
function ExtractColorIndexAndColor(const AColorList: TStrings; const AIndex: Integer; out ColorIndex: Integer; out ColorValue: TColor): Boolean; inline;
{$endif}
{$if declared(GetDialogCaption)}
function GetDialogCaption(idDiag: Integer): string; inline;
{$endif}
{$if declared(GetDialogIcon)}
function GetDialogIcon(idDiag: Integer): TCustomBitmap; inline;
{$endif}
{$if declared(dbgs)}
function dbgs(Option: TOpenOption): string; overload; inline;
{$endif}
{$if declared(dbgs)}
function dbgs(Options: TOpenOptions): string; overload; inline;
{$endif}
{$if declared(dbgs)}
function DbgS(aFlag: TTaskDialogFlag): String; overload; inline;
{$endif}
{$if declared(dbgs)}
function DbgS(Flags: Dialogs.TTaskDialogFlags): String; overload; inline;
{$endif}

implementation

{$if declared(MessageDlg)}
function MessageDlg(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;
begin
  Result := Dialogs.MessageDlg(aMsg, DlgType, Buttons, HelpCtx);
end;

{$endif}
{$if declared(MessageDlg)}
function MessageDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;
begin
  Result := Dialogs.MessageDlg(aCaption, aMsg, DlgType, Buttons, HelpCtx);
end;

{$endif}
{$if declared(MessageDlg)}
function MessageDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): TModalResult;
begin
  Result := Dialogs.MessageDlg(aCaption, aMsg, DlgType, Buttons, HelpCtx, DefaultButton);
end;

{$endif}
{$if declared(MessageDlg)}
function MessageDlg(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): TModalResult;
begin
  Result := Dialogs.MessageDlg(aMsg, DlgType, Buttons, HelpCtx, DefaultButton);
end;

{$endif}
{$if declared(MessageDlg)}
function MessageDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; const HelpKeyword: string): TModalResult;
begin
  Result := Dialogs.MessageDlg(aCaption, aMsg, DlgType, Buttons, HelpKeyword);
end;

{$endif}
{$if declared(MessageDlgPos)}
function MessageDlgPos(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): TModalResult;
begin
  Result := Dialogs.MessageDlgPos(aMsg, DlgType, Buttons, HelpCtx, X, Y);
end;

{$endif}
{$if declared(MessageDlgPosHelp)}
function MessageDlgPosHelp(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer; const HelpFileName: string): TModalResult;
begin
  Result := Dialogs.MessageDlgPosHelp(aMsg, DlgType, Buttons, HelpCtx, X, Y, HelpFileName);
end;

{$endif}
{$if declared(CreateMessageDialog)}
function CreateMessageDialog(const aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): TForm;
begin
  Result := Dialogs.CreateMessageDialog(aMsg, DlgType, Buttons);
end;

{$endif}
{$if declared(CreateMessageDialog)}
function CreateMessageDialog(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): TForm;
begin
  Result := Dialogs.CreateMessageDialog(aCaption, aMsg, DlgType, Buttons);
end;

{$endif}
{$if declared(DefaultPromptDialog)}
function DefaultPromptDialog(const DialogCaption, DialogMessage: string; DialogType: longint; Buttons: PLongint; ButtonCount, DefaultIndex, EscapeResult: Longint; UseDefaultPos: Boolean; X, Y: Longint): Longint;
begin
  Result := Dialogs.DefaultPromptDialog(DialogCaption, DialogMessage, DialogType, Buttons, ButtonCount, DefaultIndex, EscapeResult, UseDefaultPos, X, Y);
end;

{$endif}
{$if declared(QuestionDlg)}
function QuestionDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: array of const; HelpCtx: Longint): TModalResult;
begin
  Result := Dialogs.QuestionDlg(aCaption, aMsg, DlgType, Buttons, HelpCtx);
end;

{$endif}
{$if declared(QuestionDlg)}
function QuestionDlg(const aCaption, aMsg: string; DlgType: TMsgDlgType; Buttons: array of const; const HelpKeyword: string): TModalResult;
begin
  Result := Dialogs.QuestionDlg(aCaption, aMsg, DlgType, Buttons, HelpKeyword);
end;

{$endif}
{$if declared(DefaultQuestionDialog)}
function DefaultQuestionDialog(const aCaption, aMsg: string; DlgType: LongInt; Buttons: TDialogButtons; HelpCtx: Longint): LongInt;
begin
  Result := Dialogs.DefaultQuestionDialog(aCaption, aMsg, DlgType, Buttons, HelpCtx);
end;

{$endif}
{$if declared(ShowMessage)}
procedure ShowMessage(const aMsg: string);
begin
  Dialogs.ShowMessage(aMsg);
end;

{$endif}
{$if declared(ShowMessageFmt)}
procedure ShowMessageFmt(const aMsg: string; Params: array of const);
begin
  Dialogs.ShowMessageFmt(aMsg, Params);
end;

{$endif}
{$if declared(ShowMessagePos)}
procedure ShowMessagePos(const aMsg: string; X, Y: Integer);
begin
  Dialogs.ShowMessagePos(aMsg, X, Y);
end;

{$endif}
{$if declared(DefaultMessageBox)}
function DefaultMessageBox(Text, Caption: PChar; Flags: Longint) : Integer;
begin
  Result := Dialogs.DefaultMessageBox(Text, Caption, Flags);
end;

{$endif}
{$if declared(InputBox)}
function InputBox(const ACaption, APrompt, ADefault : string) : string;
begin
  Result := Dialogs.InputBox(ACaption, APrompt, ADefault);
end;

{$endif}
{$if declared(PasswordBox)}
function PasswordBox(const ACaption, APrompt : string) : string;
begin
  Result := Dialogs.PasswordBox(ACaption, APrompt);
end;

{$endif}
{$if declared(PromptForFileName)}
function PromptForFileName(var AFileName: string; const AFilter: string = ''; const ADefaultExt: string = ''; const ATitle: string = ''; const AInitialDir: string = ''; AIsSaveDialog: Boolean = False): Boolean;
begin
  Result := Dialogs.PromptForFileName(AFileName, AFilter, ADefaultExt, ATitle, AInitialDir, AIsSaveDialog);
end;

{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult;
begin
  Result := Dialogs.TaskDlg(aCaption, aMsg, aInfo, DlgIcon, AButtons, aFooter, aDetails, AFlags);
end;

{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; ADefaultButton: TMsgDlgBtn; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult;
begin
  Result := Dialogs.TaskDlg(aCaption, aMsg, aInfo, DlgIcon, AButtons, ADefaultButton, aFooter, aDetails, AFlags);
end;

{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult;
begin
  Result := Dialogs.TaskDlg(aCaption, aMsg, aInfo, DlgIcon, AButtons, ARadioButtons, RadioIndex, ADefaultRadio, aFooter, aDetails, AFlags);
end;

{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; ADefaultButton: TMsgDlgBtn; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult;
begin
  Result := Dialogs.TaskDlg(aCaption, aMsg, aInfo, DlgIcon, AButtons, ADefaultButton, ARadioButtons, RadioIndex, ADefaultRadio, aFooter, aDetails, AFlags);
end;

{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const ACheckBoxText: string; out Checked: boolean; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult;
begin
  Result := Dialogs.TaskDlg(aCaption, aMsg, aInfo, DlgIcon, AButtons, ACheckBoxText, Checked, aFooter, aDetails, AFlags);
end;

{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; ADefaultButton: TMsgDlgBtn; const ACheckBoxText: string; out Checked: boolean; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult;
begin
  Result := Dialogs.TaskDlg(aCaption, aMsg, aInfo, DlgIcon, AButtons, ADefaultButton, ACheckBoxText, Checked, aFooter, aDetails, AFlags);
end;

{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const ACheckBoxText: string; out Checked: boolean; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult;
begin
  Result := Dialogs.TaskDlg(aCaption, aMsg, aInfo, DlgIcon, AButtons, ACheckBoxText, Checked, ARadioButtons, RadioIndex, ADefaultRadio, aFooter, aDetails, AFlags);
end;

{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; ADefaultButton: TMsgDlgBtn; const ACheckBoxText: string; out Checked: boolean; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult;
begin
  Result := Dialogs.TaskDlg(aCaption, aMsg, aInfo, DlgIcon, AButtons, ADefaultButton, ACheckBoxText, Checked, ARadioButtons, RadioIndex, ADefaultRadio, aFooter, aDetails, AFlags);
end;

{$endif}
{$if declared(TaskDlg)}
function TaskDlg(const aCaption, aMsg, aInfo: string; DlgIcon: TTaskDialogIcon; AButtons: TMsgDlgButtons; const ACustomButtons: array of string; ADefaultButton: Integer; const ACheckBoxText: string; out Checked: boolean; const ARadioButtons: array of string; out RadioIndex: integer; ADefaultRadio: Integer = -1; const aFooter: string = ''; const aDetails: string = ''; const aShowDetails: string = ''; const aHideDetails: string = ''; AFlags: TTaskDialogFlags = [tfAllowDialogCancellation] ): TModalResult;
begin
  Result := Dialogs.TaskDlg(aCaption, aMsg, aInfo, DlgIcon, AButtons, ACustomButtons, ADefaultButton, ACheckBoxText, Checked, ARadioButtons, RadioIndex, ADefaultRadio, aFooter, aDetails, aShowDetails, aHideDetails, AFlags);
end;

{$endif}
{$if declared(RegisterDialogForCopyToClipboard)}
procedure RegisterDialogForCopyToClipboard(const ADlg: TCustomForm);
begin
  Dialogs.RegisterDialogForCopyToClipboard(ADlg);
end;

{$endif}
{$if declared(DialogCopyToClipboard)}
procedure DialogCopyToClipboard(Self, Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Dialogs.DialogCopyToClipboard(Self, Sender, Key, Shift);
end;

{$endif}
{$if declared(SelectDirectory)}
function SelectDirectory(const Caption, InitialDirectory: string; out Directory: string): Boolean;
begin
  Result := Dialogs.SelectDirectory(Caption, InitialDirectory, Directory);
end;

{$endif}
{$if declared(SelectDirectory)}
function SelectDirectory(const Caption, InitialDirectory: string; out Directory: string; ShowHidden: Boolean; HelpCtx: Longint = 0): Boolean;
begin
  Result := Dialogs.SelectDirectory(Caption, InitialDirectory, Directory, ShowHidden, HelpCtx);
end;

{$endif}
{$if declared(SelectDirectory)}
function SelectDirectory(out Directory: string; Options: TSelectDirOpts; HelpCtx: Longint): Boolean;
begin
  Result := Dialogs.SelectDirectory(Directory, Options, HelpCtx);
end;

{$endif}
{$if declared(InputQuery)}
function InputQuery(const ACaption, APrompt : string; MaskInput : Boolean; var Value : string) : Boolean;
begin
  Result := Dialogs.InputQuery(ACaption, APrompt, MaskInput, Value);
end;

{$endif}
{$if declared(InputQuery)}
function InputQuery(const ACaption, APrompt : string; var Value : string) : Boolean;
begin
  Result := Dialogs.InputQuery(ACaption, APrompt, Value);
end;

{$endif}
{$if declared(InputQuery)}
function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; ACloseEvent: TInputCloseQueryEvent = nil): Boolean;
begin
  Result := Dialogs.InputQuery(ACaption, APrompts, AValues, ACloseEvent);
end;

{$endif}
{$if declared(DefaultInputDialog)}
function DefaultInputDialog(const InputCaption, InputPrompt : string; MaskInput : Boolean; var Value : string) : Boolean;
begin
  Result := Dialogs.DefaultInputDialog(InputCaption, InputPrompt, MaskInput, Value);
end;

{$endif}
{$if declared(InputCombo)}
function InputCombo(const ACaption, APrompt: string; const AList: TStrings): Integer;
begin
  Result := Dialogs.InputCombo(ACaption, APrompt, AList);
end;

{$endif}
{$if declared(InputCombo)}
function InputCombo(const ACaption, APrompt: string; const AList : Array of string): Integer;
begin
  Result := Dialogs.InputCombo(ACaption, APrompt, AList);
end;

{$endif}
{$if declared(InputComboEx)}
function InputComboEx(const ACaption, APrompt: string; const AList: TStrings; AllowCustomText: Boolean = False): string;
begin
  Result := Dialogs.InputComboEx(ACaption, APrompt, AList, AllowCustomText);
end;

{$endif}
{$if declared(InputComboEx)}
function InputComboEx(const ACaption, APrompt: string; const AList : Array of string; AllowCustomText: Boolean = False): string;
begin
  Result := Dialogs.InputComboEx(ACaption, APrompt, AList, AllowCustomText);
end;

{$endif}
{$if declared(ExtractColorIndexAndColor)}
function ExtractColorIndexAndColor(const AColorList: TStrings; const AIndex: Integer; out ColorIndex: Integer; out ColorValue: TColor): Boolean;
begin
  Result := Dialogs.ExtractColorIndexAndColor(AColorList, AIndex, ColorIndex, ColorValue);
end;

{$endif}
{$if declared(GetDialogCaption)}
function GetDialogCaption(idDiag: Integer): string;
begin
  Result := Dialogs.GetDialogCaption(idDiag);
end;

{$endif}
{$if declared(GetDialogIcon)}
function GetDialogIcon(idDiag: Integer): TCustomBitmap;
begin
  Result := Dialogs.GetDialogIcon(idDiag);
end;

{$endif}
{$if declared(dbgs)}
function dbgs(Option: TOpenOption): string;
begin
  Result := Dialogs.dbgs(Option);
end;

{$endif}
{$if declared(dbgs)}
function dbgs(Options: TOpenOptions): string;
begin
  Result := Dialogs.dbgs(Options);
end;

{$endif}
{$if declared(dbgs)}
function DbgS(aFlag: TTaskDialogFlag): String;
begin
  Result := Dialogs.dbgs(aFlag);
end;

{$endif}
{$if declared(dbgs)}
function DbgS(Flags: Dialogs.TTaskDialogFlags): String;
begin
  Result := Dialogs.dbgs(Flags);
end;

{$endif}
end.
