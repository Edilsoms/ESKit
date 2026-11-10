{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Forms
  Gerado por tools/genvclcompat.py a partir de Forms.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Forms;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Classes, LCLProc, InterfaceBase, Graphics, HelpIntfs, Controls, LazLoggerBase, Forms;
type
{$if declared(TProcedure)}
  TProcedure = Forms.TProcedure;
{$endif}
{$if declared(TProcedureOfObject)}
  TProcedureOfObject = Forms.TProcedureOfObject;
{$endif}
{$if declared(TPosition)}
  TPosition = Forms.TPosition;
{$endif}
{$if declared(TCloseAction)}
  TCloseAction = Forms.TCloseAction;
{$endif}
{$if declared(TWindowState)}
  TWindowState = Forms.TWindowState;
{$endif}
{$if declared(TIDesigner)}
  TIDesigner = Forms.TIDesigner;
{$endif}
{$if declared(TMonitor)}
  TMonitor = Forms.TMonitor;
{$endif}
{$if declared(TScrollingWinControl)}
  TScrollingWinControl = Forms.TScrollingWinControl;
{$endif}
{$if declared(TCustomForm)}
  TCustomForm = Forms.TCustomForm;
{$endif}
{$if declared(TCustomHintAction)}
  TCustomHintAction = Forms.TCustomHintAction;
{$endif}
{$if declared(TScrollBarKind)}
  TScrollBarKind = Forms.TScrollBarKind;
{$endif}
{$if declared(TScrollBarInc)}
  TScrollBarInc = Forms.TScrollBarInc;
{$endif}
{$if declared(TScrollBarStyle)}
  TScrollBarStyle = Forms.TScrollBarStyle;
{$endif}
{$if declared(EScrollBar)}
  EScrollBar = Forms.EScrollBar;
{$endif}
{$if declared(TControlScrollBar)}
  TControlScrollBar = Forms.TControlScrollBar;
{$endif}
{$if declared(TScrollBox)}
  TScrollBox = Forms.TScrollBox;
{$endif}
{$if declared(TCustomDesignControl)}
  TCustomDesignControl = Forms.TCustomDesignControl;
{$endif}
{$if declared(TCustomFrame)}
  TCustomFrame = Forms.TCustomFrame;
{$endif}
{$if declared(TCustomFrameClass)}
  TCustomFrameClass = Forms.TCustomFrameClass;
{$endif}
{$if declared(TFrame)}
  TFrame = Forms.TFrame;
{$endif}
{$if declared(TWindowMagnetOptions)}
  TWindowMagnetOptions = Forms.TWindowMagnetOptions;
{$endif}
{$if declared(TWindowMagnetManager)}
  TWindowMagnetManager = Forms.TWindowMagnetManager;
{$endif}
{$if declared(TBorderIcon)}
  TBorderIcon = Forms.TBorderIcon;
{$endif}
{$if declared(TBorderIcons)}
  TBorderIcons = Forms.TBorderIcons;
{$endif}
{$if declared(TDefaultMonitor)}
  TDefaultMonitor = Forms.TDefaultMonitor;
{$endif}
{$if declared(TFormStateType)}
  TFormStateType = Forms.TFormStateType;
{$endif}
{$if declared(TFormState)}
  TFormState = Forms.TFormState;
{$endif}
{$if declared(PModalResult)}
  PModalResult = Forms.PModalResult;
{$endif}
{$if declared(TFormHandlerType)}
  TFormHandlerType = Forms.TFormHandlerType;
{$endif}
{$if declared(TShowInTaskbar)}
  TShowInTaskbar = Forms.TShowInTaskbar;
{$endif}
{$if declared(TPopupMode)}
  TPopupMode = Forms.TPopupMode;
{$endif}
{$if declared(TTileMode)}
  TTileMode = Forms.TTileMode;
{$endif}
{$if declared(TCloseEvent)}
  TCloseEvent = Forms.TCloseEvent;
{$endif}
{$if declared(TCloseQueryEvent)}
  TCloseQueryEvent = Forms.TCloseQueryEvent;
{$endif}
{$if declared(TDropFilesEvent)}
  TDropFilesEvent = Forms.TDropFilesEvent;
{$endif}
{$if declared(THelpEvent)}
  THelpEvent = Forms.THelpEvent;
{$endif}
{$if declared(TShortCutEvent)}
  TShortCutEvent = Forms.TShortCutEvent;
{$endif}
{$if declared(TModalDialogFinished)}
  TModalDialogFinished = Forms.TModalDialogFinished;
{$endif}
{$if declared(TCustomFormClass)}
  TCustomFormClass = Forms.TCustomFormClass;
{$endif}
{$if declared(TForm)}
  TForm = Forms.TForm;
{$endif}
{$if declared(TFormClass)}
  TFormClass = Forms.TFormClass;
{$endif}
{$if declared(TCustomDockForm)}
  TCustomDockForm = Forms.TCustomDockForm;
{$endif}
{$if declared(THintWindow)}
  THintWindow = Forms.THintWindow;
{$endif}
{$if declared(THintWindowClass)}
  THintWindowClass = Forms.THintWindowClass;
{$endif}
{$if declared(THintWindowRendered)}
  THintWindowRendered = Forms.THintWindowRendered;
{$endif}
{$if declared(TMonitorList)}
  TMonitorList = Forms.TMonitorList;
{$endif}
{$if declared(PCursorRec)}
  PCursorRec = Forms.PCursorRec;
{$endif}
{$if declared(TCursorRec)}
  TCursorRec = Forms.TCursorRec;
{$endif}
{$if declared(TScreenFormEvent)}
  TScreenFormEvent = Forms.TScreenFormEvent;
{$endif}
{$if declared(TScreenControlEvent)}
  TScreenControlEvent = Forms.TScreenControlEvent;
{$endif}
{$if declared(TScreenNotification)}
  TScreenNotification = Forms.TScreenNotification;
{$endif}
{$if declared(TMonitorDefaultTo)}
  TMonitorDefaultTo = Forms.TMonitorDefaultTo;
{$endif}
{$if declared(TScreen)}
  TScreen = Forms.TScreen;
{$endif}
{$if declared(TQueryEndSessionEvent)}
  TQueryEndSessionEvent = Forms.TQueryEndSessionEvent;
{$endif}
{$if declared(TExceptionEvent)}
  TExceptionEvent = Forms.TExceptionEvent;
{$endif}
{$if declared(TGetHandleEvent)}
  TGetHandleEvent = Forms.TGetHandleEvent;
{$endif}
{$if declared(TIdleEvent)}
  TIdleEvent = Forms.TIdleEvent;
{$endif}
{$if declared(TOnUserInputEvent)}
  TOnUserInputEvent = Forms.TOnUserInputEvent;
{$endif}
{$if declared(TDataEvent)}
  TDataEvent = Forms.TDataEvent;
{$endif}
{$if declared(TLogMessageEvent)}
  TLogMessageEvent = Forms.TLogMessageEvent;
{$endif}
{$if declared(TCMHintShow)}
  TCMHintShow = Forms.TCMHintShow;
{$endif}
{$if declared(TCMHintShowPause)}
  TCMHintShowPause = Forms.TCMHintShowPause;
{$endif}
{$if declared(TAppHintTimerType)}
  TAppHintTimerType = Forms.TAppHintTimerType;
{$endif}
{$if declared(TShowHintEvent)}
  TShowHintEvent = Forms.TShowHintEvent;
{$endif}
{$if declared(THintInfoAtMouse)}
  THintInfoAtMouse = Forms.THintInfoAtMouse;
{$endif}
{$if declared(TApplicationFlag)}
  TApplicationFlag = Forms.TApplicationFlag;
{$endif}
{$if declared(TApplicationFlags)}
  TApplicationFlags = Forms.TApplicationFlags;
{$endif}
{$if declared(TApplicationNavigationOption)}
  TApplicationNavigationOption = Forms.TApplicationNavigationOption;
{$endif}
{$if declared(TApplicationNavigationOptions)}
  TApplicationNavigationOptions = Forms.TApplicationNavigationOptions;
{$endif}
{$if declared(TApplicationHandlerType)}
  TApplicationHandlerType = Forms.TApplicationHandlerType;
{$endif}
{$if declared(PAsyncCallQueueItem)}
  PAsyncCallQueueItem = Forms.PAsyncCallQueueItem;
{$endif}
{$if declared(TAsyncCallQueueItem)}
  TAsyncCallQueueItem = Forms.TAsyncCallQueueItem;
{$endif}
{$if declared(TAsyncCallQueue)}
  TAsyncCallQueue = Forms.TAsyncCallQueue;
{$endif}
{$if declared(TAsyncCallQueues)}
  TAsyncCallQueues = Forms.TAsyncCallQueues;
{$endif}
{$if declared(TApplicationType)}
  TApplicationType = Forms.TApplicationType;
{$endif}
{$if declared(TApplicationExceptionDlg)}
  TApplicationExceptionDlg = Forms.TApplicationExceptionDlg;
{$endif}
{$if declared(TApplicationShowGlyphs)}
  TApplicationShowGlyphs = Forms.TApplicationShowGlyphs;
{$endif}
{$if declared(TApplicationGlyphDrawEffectsEnabled)}
  TApplicationGlyphDrawEffectsEnabled = Forms.TApplicationGlyphDrawEffectsEnabled;
{$endif}
{$if declared(TTaskBarBehavior)}
  TTaskBarBehavior = Forms.TTaskBarBehavior;
{$endif}
{$if declared(TApplicationDoubleBuffered)}
  TApplicationDoubleBuffered = Forms.TApplicationDoubleBuffered;
{$endif}
{$if declared(TApplication)}
  TApplication = Forms.TApplication;
{$endif}
{$if declared(TApplicationProperties)}
  TApplicationProperties = Forms.TApplicationProperties;
{$endif}
{$if declared(TFormPropertyStorage)}
  TFormPropertyStorage = Forms.TFormPropertyStorage;
{$endif}
{$if declared(TGetDesignerFormEvent)}
  TGetDesignerFormEvent = Forms.TGetDesignerFormEvent;
{$endif}
{$if declared(TIsFormDesignFunction)}
  TIsFormDesignFunction = Forms.TIsFormDesignFunction;
{$endif}
{$if declared(TMessageBoxFunction)}
  TMessageBoxFunction = Forms.TMessageBoxFunction;
{$endif}
{$if declared(TModalResult)}
  TModalResult = Forms.TModalResult;
{$endif}
{$if declared(TFocusState)}
  TFocusState = Forms.TFocusState;
{$endif}
const
{$if declared(poDesigned)}
  poDesigned = Forms.poDesigned;
{$endif}
{$if declared(poDefault)}
  poDefault = Forms.poDefault;
{$endif}
{$if declared(poDefaultPosOnly)}
  poDefaultPosOnly = Forms.poDefaultPosOnly;
{$endif}
{$if declared(poDefaultSizeOnly)}
  poDefaultSizeOnly = Forms.poDefaultSizeOnly;
{$endif}
{$if declared(poScreenCenter)}
  poScreenCenter = Forms.poScreenCenter;
{$endif}
{$if declared(poDesktopCenter)}
  poDesktopCenter = Forms.poDesktopCenter;
{$endif}
{$if declared(poMainFormCenter)}
  poMainFormCenter = Forms.poMainFormCenter;
{$endif}
{$if declared(poOwnerFormCenter)}
  poOwnerFormCenter = Forms.poOwnerFormCenter;
{$endif}
{$if declared(poWorkAreaCenter)}
  poWorkAreaCenter = Forms.poWorkAreaCenter;
{$endif}
{$if declared(caNone)}
  caNone = Forms.caNone;
{$endif}
{$if declared(caHide)}
  caHide = Forms.caHide;
{$endif}
{$if declared(caFree)}
  caFree = Forms.caFree;
{$endif}
{$if declared(caMinimize)}
  caMinimize = Forms.caMinimize;
{$endif}
{$if declared(wsNormal)}
  wsNormal = Forms.wsNormal;
{$endif}
{$if declared(wsMinimized)}
  wsMinimized = Forms.wsMinimized;
{$endif}
{$if declared(wsMaximized)}
  wsMaximized = Forms.wsMaximized;
{$endif}
{$if declared(wsFullScreen)}
  wsFullScreen = Forms.wsFullScreen;
{$endif}
{$if declared(sbHorizontal)}
  sbHorizontal = Forms.sbHorizontal;
{$endif}
{$if declared(sbVertical)}
  sbVertical = Forms.sbVertical;
{$endif}
{$if declared(ssRegular)}
  ssRegular = Forms.ssRegular;
{$endif}
{$if declared(ssFlat)}
  ssFlat = Forms.ssFlat;
{$endif}
{$if declared(ssHotTrack)}
  ssHotTrack = Forms.ssHotTrack;
{$endif}
{$if declared(biSystemMenu)}
  biSystemMenu = Forms.biSystemMenu;
{$endif}
{$if declared(biMinimize)}
  biMinimize = Forms.biMinimize;
{$endif}
{$if declared(biMaximize)}
  biMaximize = Forms.biMaximize;
{$endif}
{$if declared(biHelp)}
  biHelp = Forms.biHelp;
{$endif}
{$if declared(dmDesktop)}
  dmDesktop = Forms.dmDesktop;
{$endif}
{$if declared(dmPrimary)}
  dmPrimary = Forms.dmPrimary;
{$endif}
{$if declared(dmMainForm)}
  dmMainForm = Forms.dmMainForm;
{$endif}
{$if declared(dmActiveForm)}
  dmActiveForm = Forms.dmActiveForm;
{$endif}
{$if declared(fsCreating)}
  fsCreating = Forms.fsCreating;
{$endif}
{$if declared(fsVisible)}
  fsVisible = Forms.fsVisible;
{$endif}
{$if declared(fsShowing)}
  fsShowing = Forms.fsShowing;
{$endif}
{$if declared(fsModal)}
  fsModal = Forms.fsModal;
{$endif}
{$if declared(fsCreatedMDIChild)}
  fsCreatedMDIChild = Forms.fsCreatedMDIChild;
{$endif}
{$if declared(fsBorderStyleChanged)}
  fsBorderStyleChanged = Forms.fsBorderStyleChanged;
{$endif}
{$if declared(fsFormStyleChanged)}
  fsFormStyleChanged = Forms.fsFormStyleChanged;
{$endif}
{$if declared(fsFirstShow)}
  fsFirstShow = Forms.fsFirstShow;
{$endif}
{$if declared(fsDisableAutoSize)}
  fsDisableAutoSize = Forms.fsDisableAutoSize;
{$endif}
{$if declared(fhtFirstShow)}
  fhtFirstShow = Forms.fhtFirstShow;
{$endif}
{$if declared(fhtClose)}
  fhtClose = Forms.fhtClose;
{$endif}
{$if declared(fhtCreate)}
  fhtCreate = Forms.fhtCreate;
{$endif}
{$if declared(stDefault)}
  stDefault = Forms.stDefault;
{$endif}
{$if declared(stAlways)}
  stAlways = Forms.stAlways;
{$endif}
{$if declared(stNever)}
  stNever = Forms.stNever;
{$endif}
{$if declared(pmNone)}
  pmNone = Forms.pmNone;
{$endif}
{$if declared(pmAuto)}
  pmAuto = Forms.pmAuto;
{$endif}
{$if declared(pmExplicit)}
  pmExplicit = Forms.pmExplicit;
{$endif}
{$if declared(tbHorizontal)}
  tbHorizontal = Forms.tbHorizontal;
{$endif}
{$if declared(tbVertical)}
  tbVertical = Forms.tbVertical;
{$endif}
{$if declared(snNewFormCreated)}
  snNewFormCreated = Forms.snNewFormCreated;
{$endif}
{$if declared(snFormAdded)}
  snFormAdded = Forms.snFormAdded;
{$endif}
{$if declared(snRemoveForm)}
  snRemoveForm = Forms.snRemoveForm;
{$endif}
{$if declared(snActiveControlChanged)}
  snActiveControlChanged = Forms.snActiveControlChanged;
{$endif}
{$if declared(snActiveFormChanged)}
  snActiveFormChanged = Forms.snActiveFormChanged;
{$endif}
{$if declared(snFormVisibleChanged)}
  snFormVisibleChanged = Forms.snFormVisibleChanged;
{$endif}
{$if declared(mdNearest)}
  mdNearest = Forms.mdNearest;
{$endif}
{$if declared(mdNull)}
  mdNull = Forms.mdNull;
{$endif}
{$if declared(mdPrimary)}
  mdPrimary = Forms.mdPrimary;
{$endif}
{$if declared(ahttNone)}
  ahttNone = Forms.ahttNone;
{$endif}
{$if declared(ahttShowHint)}
  ahttShowHint = Forms.ahttShowHint;
{$endif}
{$if declared(ahttHideHint)}
  ahttHideHint = Forms.ahttHideHint;
{$endif}
{$if declared(ahttReshowHint)}
  ahttReshowHint = Forms.ahttReshowHint;
{$endif}
{$if declared(AppWaiting)}
  AppWaiting = Forms.AppWaiting;
{$endif}
{$if declared(AppIdleEndSent)}
  AppIdleEndSent = Forms.AppIdleEndSent;
{$endif}
{$if declared(AppNoExceptionMessages)}
  AppNoExceptionMessages = Forms.AppNoExceptionMessages;
{$endif}
{$if declared(AppActive)}
  AppActive = Forms.AppActive;
{$endif}
{$if declared(AppDestroying)}
  AppDestroying = Forms.AppDestroying;
{$endif}
{$if declared(AppDoNotCallAsyncQueue)}
  AppDoNotCallAsyncQueue = Forms.AppDoNotCallAsyncQueue;
{$endif}
{$if declared(AppInitialized)}
  AppInitialized = Forms.AppInitialized;
{$endif}
{$if declared(anoTabToSelectNext)}
  anoTabToSelectNext = Forms.anoTabToSelectNext;
{$endif}
{$if declared(anoReturnForDefaultControl)}
  anoReturnForDefaultControl = Forms.anoReturnForDefaultControl;
{$endif}
{$if declared(anoEscapeForCancelControl)}
  anoEscapeForCancelControl = Forms.anoEscapeForCancelControl;
{$endif}
{$if declared(anoF1ForHelp)}
  anoF1ForHelp = Forms.anoF1ForHelp;
{$endif}
{$if declared(anoArrowToSelectNextInParent)}
  anoArrowToSelectNextInParent = Forms.anoArrowToSelectNextInParent;
{$endif}
{$if declared(ahtIdle)}
  ahtIdle = Forms.ahtIdle;
{$endif}
{$if declared(ahtIdleEnd)}
  ahtIdleEnd = Forms.ahtIdleEnd;
{$endif}
{$if declared(ahtKeyDownBefore)}
  ahtKeyDownBefore = Forms.ahtKeyDownBefore;
{$endif}
{$if declared(ahtKeyDownAfter)}
  ahtKeyDownAfter = Forms.ahtKeyDownAfter;
{$endif}
{$if declared(ahtActivate)}
  ahtActivate = Forms.ahtActivate;
{$endif}
{$if declared(ahtDeactivate)}
  ahtDeactivate = Forms.ahtDeactivate;
{$endif}
{$if declared(ahtUserInput)}
  ahtUserInput = Forms.ahtUserInput;
{$endif}
{$if declared(ahtException)}
  ahtException = Forms.ahtException;
{$endif}
{$if declared(ahtEndSession)}
  ahtEndSession = Forms.ahtEndSession;
{$endif}
{$if declared(ahtQueryEndSession)}
  ahtQueryEndSession = Forms.ahtQueryEndSession;
{$endif}
{$if declared(ahtMinimize)}
  ahtMinimize = Forms.ahtMinimize;
{$endif}
{$if declared(ahtModalBegin)}
  ahtModalBegin = Forms.ahtModalBegin;
{$endif}
{$if declared(ahtModalEnd)}
  ahtModalEnd = Forms.ahtModalEnd;
{$endif}
{$if declared(ahtRestore)}
  ahtRestore = Forms.ahtRestore;
{$endif}
{$if declared(ahtDropFiles)}
  ahtDropFiles = Forms.ahtDropFiles;
{$endif}
{$if declared(ahtHelp)}
  ahtHelp = Forms.ahtHelp;
{$endif}
{$if declared(ahtHint)}
  ahtHint = Forms.ahtHint;
{$endif}
{$if declared(ahtShowHint)}
  ahtShowHint = Forms.ahtShowHint;
{$endif}
{$if declared(ahtGetMainFormHandle)}
  ahtGetMainFormHandle = Forms.ahtGetMainFormHandle;
{$endif}
{$if declared(ahtActionExecute)}
  ahtActionExecute = Forms.ahtActionExecute;
{$endif}
{$if declared(ahtActionUpdate)}
  ahtActionUpdate = Forms.ahtActionUpdate;
{$endif}
{$if declared(atDefault)}
  atDefault = Forms.atDefault;
{$endif}
{$if declared(atDesktop)}
  atDesktop = Forms.atDesktop;
{$endif}
{$if declared(atPDA)}
  atPDA = Forms.atPDA;
{$endif}
{$if declared(atKeyPadDevice)}
  atKeyPadDevice = Forms.atKeyPadDevice;
{$endif}
{$if declared(atTablet)}
  atTablet = Forms.atTablet;
{$endif}
{$if declared(atTV)}
  atTV = Forms.atTV;
{$endif}
{$if declared(atMobileEmulator)}
  atMobileEmulator = Forms.atMobileEmulator;
{$endif}
{$if declared(aedOkCancelDialog)}
  aedOkCancelDialog = Forms.aedOkCancelDialog;
{$endif}
{$if declared(aedOkMessageBox)}
  aedOkMessageBox = Forms.aedOkMessageBox;
{$endif}
{$if declared(sbgAlways)}
  sbgAlways = Forms.sbgAlways;
{$endif}
{$if declared(sbgNever)}
  sbgNever = Forms.sbgNever;
{$endif}
{$if declared(sbgSystem)}
  sbgSystem = Forms.sbgSystem;
{$endif}
{$if declared(gdeAlways)}
  gdeAlways = Forms.gdeAlways;
{$endif}
{$if declared(gdeNever)}
  gdeNever = Forms.gdeNever;
{$endif}
{$if declared(gdeSystem)}
  gdeSystem = Forms.gdeSystem;
{$endif}
{$if declared(tbDefault)}
  tbDefault = Forms.tbDefault;
{$endif}
{$if declared(tbMultiButton)}
  tbMultiButton = Forms.tbMultiButton;
{$endif}
{$if declared(tbSingleButton)}
  tbSingleButton = Forms.tbSingleButton;
{$endif}
{$if declared(adbDefault)}
  adbDefault = Forms.adbDefault;
{$endif}
{$if declared(adbFalse)}
  adbFalse = Forms.adbFalse;
{$endif}
{$if declared(adbTrue)}
  adbTrue = Forms.adbTrue;
{$endif}
{$if declared(DefHintColor)}
  DefHintColor = Forms.DefHintColor;
{$endif}
{$if declared(DefHintPause)}
  DefHintPause = Forms.DefHintPause;
{$endif}
{$if declared(DefHintShortPause)}
  DefHintShortPause = Forms.DefHintShortPause;
{$endif}
{$if declared(DefHintHidePause)}
  DefHintHidePause = Forms.DefHintHidePause;
{$endif}
{$if declared(DefHintHidePausePerChar)}
  DefHintHidePausePerChar = Forms.DefHintHidePausePerChar;
{$endif}
var
{$if declared(DefaultApplicationBiDiMode)}
  DefaultApplicationBiDiMode: TBiDiMode absolute Forms.DefaultApplicationBiDiMode;
{$endif}
{$if declared(OnGetDesignerForm)}
  OnGetDesignerForm: TGetDesignerFormEvent absolute Forms.OnGetDesignerForm;
{$endif}
{$if declared(IsFormDesign)}
  IsFormDesign: TIsFormDesignFunction absolute Forms.IsFormDesign;
{$endif}
{$if declared(Application)}
  Application: TApplication absolute Forms.Application;
{$endif}
{$if declared(Screen)}
  Screen: TScreen absolute Forms.Screen;
{$endif}
{$if declared(ExceptionObject)}
  ExceptionObject: TExceptObject absolute Forms.ExceptionObject;
{$endif}
{$if declared(HintWindowClass)}
  HintWindowClass: THintWindowClass absolute Forms.HintWindowClass;
{$endif}
{$if declared(RequireDerivedFormResource)}
  RequireDerivedFormResource: Boolean absolute Forms.RequireDerivedFormResource;
{$endif}
{$if declared(MessageBoxFunction)}
  MessageBoxFunction: TMessageBoxFunction absolute Forms.MessageBoxFunction;
{$endif}
{$if declared(KeysToShiftState)}
function KeysToShiftState(Keys: PtrUInt): TShiftState; inline;
{$endif}
{$if declared(KeyDataToShiftState)}
function KeyDataToShiftState(KeyData: PtrInt): TShiftState; inline;
{$endif}
{$if declared(KeyboardStateToShiftState)}
function KeyboardStateToShiftState: TShiftState; inline;
{$endif}
{$if declared(ShiftStateToKeys)}
function ShiftStateToKeys(ShiftState: TShiftState): PtrUInt; inline;
{$endif}
{$if declared(WindowStateToStr)}
function WindowStateToStr(const State: TWindowState): string; inline;
{$endif}
{$if declared(StrToWindowState)}
function StrToWindowState(const Name: string): TWindowState; inline;
{$endif}
{$if declared(dbgs)}
function dbgs(const State: TWindowState): string; overload; inline;
{$endif}
{$if declared(dbgs)}
function dbgs(const Action: TCloseAction): string; overload; inline;
{$endif}
{$if declared(dbgs)}
function dbgs(const Kind: TScrollBarKind): string; overload; inline;
{$endif}
{$if declared(SaveFocusState)}
function SaveFocusState: TFocusState; inline;
{$endif}
{$if declared(RestoreFocusState)}
procedure RestoreFocusState(FocusState: TFocusState); inline;
{$endif}
{$if declared(GetParentForm)}
function GetParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm; inline;
{$endif}
{$if declared(GetDesignerForm)}
function GetDesignerForm(Control: TControl): TCustomForm; overload; inline;
{$endif}
{$if declared(GetDesignerForm)}
function GetDesignerForm(APersistent: TPersistent): TCustomForm; overload; inline;
{$endif}
{$if declared(GetFirstParentForm)}
function GetFirstParentForm(Control:TControl): TCustomForm; inline;
{$endif}
{$if declared(GetTopFormSkipNonDocked)}
function GetTopFormSkipNonDocked(Control: TControl): TCustomForm; inline;
{$endif}
{$if declared(ValidParentForm)}
function ValidParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm; inline;
{$endif}
{$if declared(FindRootDesigner)}
function FindRootDesigner(APersistent: TPersistent): TIDesigner; inline;
{$endif}
{$if declared(GetParentDesignControl)}
function GetParentDesignControl(Control: TControl): TCustomDesignControl; inline;
{$endif}
{$if declared(NeedParentDesignControl)}
function NeedParentDesignControl(Control: TControl): TCustomDesignControl; inline;
{$endif}
{$if declared(IsAccel)}
function IsAccel(VK: word; const Str: string): Boolean; inline;
{$endif}
{$if declared(GetShortHint)}
function GetShortHint(const Hint: string): string; inline;
{$endif}
{$if declared(GetLongHint)}
function GetLongHint(const Hint: string): string; inline;
{$endif}
{$if declared(CreateWidgetset)}
procedure CreateWidgetset(AWidgetsetClass: TWidgetsetClass); inline;
{$endif}
{$if declared(FreeWidgetSet)}
procedure FreeWidgetSet; inline;
{$endif}

implementation

{$if declared(KeysToShiftState)}
function KeysToShiftState(Keys: PtrUInt): TShiftState;
begin
  Result := Forms.KeysToShiftState(Keys);
end;

{$endif}
{$if declared(KeyDataToShiftState)}
function KeyDataToShiftState(KeyData: PtrInt): TShiftState;
begin
  Result := Forms.KeyDataToShiftState(KeyData);
end;

{$endif}
{$if declared(KeyboardStateToShiftState)}
function KeyboardStateToShiftState: TShiftState;
begin
  Result := Forms.KeyboardStateToShiftState;
end;

{$endif}
{$if declared(ShiftStateToKeys)}
function ShiftStateToKeys(ShiftState: TShiftState): PtrUInt;
begin
  Result := Forms.ShiftStateToKeys(ShiftState);
end;

{$endif}
{$if declared(WindowStateToStr)}
function WindowStateToStr(const State: TWindowState): string;
begin
  Result := Forms.WindowStateToStr(State);
end;

{$endif}
{$if declared(StrToWindowState)}
function StrToWindowState(const Name: string): TWindowState;
begin
  Result := Forms.StrToWindowState(Name);
end;

{$endif}
{$if declared(dbgs)}
function dbgs(const State: TWindowState): string;
begin
  Result := Forms.dbgs(State);
end;

{$endif}
{$if declared(dbgs)}
function dbgs(const Action: TCloseAction): string;
begin
  Result := Forms.dbgs(Action);
end;

{$endif}
{$if declared(dbgs)}
function dbgs(const Kind: TScrollBarKind): string;
begin
  Result := Forms.dbgs(Kind);
end;

{$endif}
{$if declared(SaveFocusState)}
function SaveFocusState: TFocusState;
begin
  Result := Forms.SaveFocusState;
end;

{$endif}
{$if declared(RestoreFocusState)}
procedure RestoreFocusState(FocusState: TFocusState);
begin
  Forms.RestoreFocusState(FocusState);
end;

{$endif}
{$if declared(GetParentForm)}
function GetParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm;
begin
  Result := Forms.GetParentForm(Control, TopForm);
end;

{$endif}
{$if declared(GetDesignerForm)}
function GetDesignerForm(Control: TControl): TCustomForm;
begin
  Result := Forms.GetDesignerForm(Control);
end;

{$endif}
{$if declared(GetDesignerForm)}
function GetDesignerForm(APersistent: TPersistent): TCustomForm;
begin
  Result := Forms.GetDesignerForm(APersistent);
end;

{$endif}
{$if declared(GetFirstParentForm)}
function GetFirstParentForm(Control:TControl): TCustomForm;
begin
  Result := Forms.GetFirstParentForm(Control);
end;

{$endif}
{$if declared(GetTopFormSkipNonDocked)}
function GetTopFormSkipNonDocked(Control: TControl): TCustomForm;
begin
  Result := Forms.GetTopFormSkipNonDocked(Control);
end;

{$endif}
{$if declared(ValidParentForm)}
function ValidParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm;
begin
  Result := Forms.ValidParentForm(Control, TopForm);
end;

{$endif}
{$if declared(FindRootDesigner)}
function FindRootDesigner(APersistent: TPersistent): TIDesigner;
begin
  Result := Forms.FindRootDesigner(APersistent);
end;

{$endif}
{$if declared(GetParentDesignControl)}
function GetParentDesignControl(Control: TControl): TCustomDesignControl;
begin
  Result := Forms.GetParentDesignControl(Control);
end;

{$endif}
{$if declared(NeedParentDesignControl)}
function NeedParentDesignControl(Control: TControl): TCustomDesignControl;
begin
  Result := Forms.NeedParentDesignControl(Control);
end;

{$endif}
{$if declared(IsAccel)}
function IsAccel(VK: word; const Str: string): Boolean;
begin
  Result := Forms.IsAccel(VK, Str);
end;

{$endif}
{$if declared(GetShortHint)}
function GetShortHint(const Hint: string): string;
begin
  Result := Forms.GetShortHint(Hint);
end;

{$endif}
{$if declared(GetLongHint)}
function GetLongHint(const Hint: string): string;
begin
  Result := Forms.GetLongHint(Hint);
end;

{$endif}
{$if declared(CreateWidgetset)}
procedure CreateWidgetset(AWidgetsetClass: TWidgetsetClass);
begin
  Forms.CreateWidgetset(AWidgetsetClass);
end;

{$endif}
{$if declared(FreeWidgetSet)}
procedure FreeWidgetSet;
begin
  Forms.FreeWidgetSet;
end;

{$endif}
end.
