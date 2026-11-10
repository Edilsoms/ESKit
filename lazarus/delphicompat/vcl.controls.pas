{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Controls
  Gerado por tools/genvclcompat.py a partir de Controls.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Controls;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Classes, Types, LCLType, LCLProc, Graphics, LMessages, LazLoggerBase, Controls;
type
{$if declared(IObjInspInterface)}
  IObjInspInterface = Controls.IObjInspInterface;
{$endif}
{$if declared(TWinControl)}
  TWinControl = Controls.TWinControl;
{$endif}
{$if declared(TControl)}
  TControl = Controls.TControl;
{$endif}
{$if declared(TWinControlClass)}
  TWinControlClass = Controls.TWinControlClass;
{$endif}
{$if declared(TControlClass)}
  TControlClass = Controls.TControlClass;
{$endif}
{$if declared(TCMMouseWheel)}
  TCMMouseWheel = Controls.TCMMouseWheel;
{$endif}
{$if declared(TCMControlChange)}
  TCMControlChange = Controls.TCMControlChange;
{$endif}
{$if declared(TCMChanged)}
  TCMChanged = Controls.TCMChanged;
{$endif}
{$if declared(TCMControlListChange)}
  TCMControlListChange = Controls.TCMControlListChange;
{$endif}
{$if declared(TCMCancelMode)}
  TCMCancelMode = Controls.TCMCancelMode;
{$endif}
{$if declared(TCMChildKey)}
  TCMChildKey = Controls.TCMChildKey;
{$endif}
{$if declared(TAlign)}
  TAlign = Controls.TAlign;
{$endif}
{$if declared(TAlignSet)}
  TAlignSet = Controls.TAlignSet;
{$endif}
{$if declared(TAnchorKind)}
  TAnchorKind = Controls.TAnchorKind;
{$endif}
{$if declared(TAnchors)}
  TAnchors = Controls.TAnchors;
{$endif}
{$if declared(TAnchorSideReference)}
  TAnchorSideReference = Controls.TAnchorSideReference;
{$endif}
{$if declared(TCursor)}
  TCursor = Controls.TCursor;
{$endif}
{$if declared(TFormStyle)}
  TFormStyle = Controls.TFormStyle;
{$endif}
{$if declared(TFormBorderStyle)}
  TFormBorderStyle = Controls.TFormBorderStyle;
{$endif}
{$if declared(TBorderStyle)}
  TBorderStyle = Controls.TBorderStyle;
{$endif}
{$if declared(TControlRoleForForm)}
  TControlRoleForForm = Controls.TControlRoleForForm;
{$endif}
{$if declared(TControlRolesForForm)}
  TControlRolesForForm = Controls.TControlRolesForForm;
{$endif}
{$if declared(TMouseButton)}
  TMouseButton = Controls.TMouseButton;
{$endif}
{$if declared(TCaptureMouseButtons)}
  TCaptureMouseButtons = Controls.TCaptureMouseButtons;
{$endif}
{$if declared(TWndMethod)}
  TWndMethod = Controls.TWndMethod;
{$endif}
{$if declared(TControlStyleType)}
  TControlStyleType = Controls.TControlStyleType;
{$endif}
{$if declared(TControlStyle)}
  TControlStyle = Controls.TControlStyle;
{$endif}
{$if declared(TControlStateType)}
  TControlStateType = Controls.TControlStateType;
{$endif}
{$if declared(TControlState)}
  TControlState = Controls.TControlState;
{$endif}
{$if declared(TControlCanvas)}
  TControlCanvas = Controls.TControlCanvas;
{$endif}
{$if declared(PHintInfo)}
  PHintInfo = Controls.PHintInfo;
{$endif}
{$if declared(THintInfo)}
  THintInfo = Controls.THintInfo;
{$endif}
{$if declared(TDragImageList)}
  TDragImageList = Controls.TDragImageList;
{$endif}
{$if declared(TDragImageListResolution)}
  TDragImageListResolution = Controls.TDragImageListResolution;
{$endif}
{$if declared(TKeyEvent)}
  TKeyEvent = Controls.TKeyEvent;
{$endif}
{$if declared(TKeyPressEvent)}
  TKeyPressEvent = Controls.TKeyPressEvent;
{$endif}
{$if declared(TUTF8KeyPressEvent)}
  TUTF8KeyPressEvent = Controls.TUTF8KeyPressEvent;
{$endif}
{$if declared(TMouseEvent)}
  TMouseEvent = Controls.TMouseEvent;
{$endif}
{$if declared(TMouseMoveEvent)}
  TMouseMoveEvent = Controls.TMouseMoveEvent;
{$endif}
{$if declared(TMouseWheelEvent)}
  TMouseWheelEvent = Controls.TMouseWheelEvent;
{$endif}
{$if declared(TMouseWheelUpDownEvent)}
  TMouseWheelUpDownEvent = Controls.TMouseWheelUpDownEvent;
{$endif}
{$if declared(TGetDockCaptionEvent)}
  TGetDockCaptionEvent = Controls.TGetDockCaptionEvent;
{$endif}
{$if declared(TDragObject)}
  TDragObject = Controls.TDragObject;
{$endif}
{$if declared(TDragKind)}
  TDragKind = Controls.TDragKind;
{$endif}
{$if declared(TDragMode)}
  TDragMode = Controls.TDragMode;
{$endif}
{$if declared(TDragState)}
  TDragState = Controls.TDragState;
{$endif}
{$if declared(TDragMessage)}
  TDragMessage = Controls.TDragMessage;
{$endif}
{$if declared(TDragOverEvent)}
  TDragOverEvent = Controls.TDragOverEvent;
{$endif}
{$if declared(TDragDropEvent)}
  TDragDropEvent = Controls.TDragDropEvent;
{$endif}
{$if declared(TStartDragEvent)}
  TStartDragEvent = Controls.TStartDragEvent;
{$endif}
{$if declared(TEndDragEvent)}
  TEndDragEvent = Controls.TEndDragEvent;
{$endif}
{$if declared(TDragObjectClass)}
  TDragObjectClass = Controls.TDragObjectClass;
{$endif}
{$if declared(TDragObjectEx)}
  TDragObjectEx = Controls.TDragObjectEx;
{$endif}
{$if declared(TDragControlObject)}
  TDragControlObject = Controls.TDragControlObject;
{$endif}
{$if declared(TDragControlObjectEx)}
  TDragControlObjectEx = Controls.TDragControlObjectEx;
{$endif}
{$if declared(TDragDockObject)}
  TDragDockObject = Controls.TDragDockObject;
{$endif}
{$if declared(TDockOrientation)}
  TDockOrientation = Controls.TDockOrientation;
{$endif}
{$if declared(TDockDropEvent)}
  TDockDropEvent = Controls.TDockDropEvent;
{$endif}
{$if declared(TDockOverEvent)}
  TDockOverEvent = Controls.TDockOverEvent;
{$endif}
{$if declared(TUnDockEvent)}
  TUnDockEvent = Controls.TUnDockEvent;
{$endif}
{$if declared(TStartDockEvent)}
  TStartDockEvent = Controls.TStartDockEvent;
{$endif}
{$if declared(TGetSiteInfoEvent)}
  TGetSiteInfoEvent = Controls.TGetSiteInfoEvent;
{$endif}
{$if declared(TDrawDockImageEvent)}
  TDrawDockImageEvent = Controls.TDrawDockImageEvent;
{$endif}
{$if declared(TDragDockObjectEx)}
  TDragDockObjectEx = Controls.TDragDockObjectEx;
{$endif}
{$if declared(TDragManager)}
  TDragManager = Controls.TDragManager;
{$endif}
{$if declared(TDockManager)}
  TDockManager = Controls.TDockManager;
{$endif}
{$if declared(TDockManagerClass)}
  TDockManagerClass = Controls.TDockManagerClass;
{$endif}
{$if declared(TConstraintSize)}
  TConstraintSize = Controls.TConstraintSize;
{$endif}
{$if declared(TSizeConstraintsOption)}
  TSizeConstraintsOption = Controls.TSizeConstraintsOption;
{$endif}
{$if declared(TSizeConstraintsOptions)}
  TSizeConstraintsOptions = Controls.TSizeConstraintsOptions;
{$endif}
{$if declared(TSizeConstraints)}
  TSizeConstraints = Controls.TSizeConstraints;
{$endif}
{$if declared(TConstrainedResizeEvent)}
  TConstrainedResizeEvent = Controls.TConstrainedResizeEvent;
{$endif}
{$if declared(TControlCellAlign)}
  TControlCellAlign = Controls.TControlCellAlign;
{$endif}
{$if declared(TControlCellAligns)}
  TControlCellAligns = Controls.TControlCellAligns;
{$endif}
{$if declared(TControlBorderSpacingDefault)}
  TControlBorderSpacingDefault = Controls.TControlBorderSpacingDefault;
{$endif}
{$if declared(PControlBorderSpacingDefault)}
  PControlBorderSpacingDefault = Controls.PControlBorderSpacingDefault;
{$endif}
{$if declared(TControlBorderSpacing)}
  TControlBorderSpacing = Controls.TControlBorderSpacing;
{$endif}
{$if declared(TAnchorSideChangeOperation)}
  TAnchorSideChangeOperation = Controls.TAnchorSideChangeOperation;
{$endif}
{$if declared(TAnchorSide)}
  TAnchorSide = Controls.TAnchorSide;
{$endif}
{$if declared(TControlActionLink)}
  TControlActionLink = Controls.TControlActionLink;
{$endif}
{$if declared(TControlActionLinkClass)}
  TControlActionLinkClass = Controls.TControlActionLinkClass;
{$endif}
{$if declared(ELayoutException)}
  ELayoutException = Controls.ELayoutException;
{$endif}
{$if declared(TControlAutoSizePhase)}
  TControlAutoSizePhase = Controls.TControlAutoSizePhase;
{$endif}
{$if declared(TControlAutoSizePhases)}
  TControlAutoSizePhases = Controls.TControlAutoSizePhases;
{$endif}
{$if declared(TTabOrder)}
  TTabOrder = Controls.TTabOrder;
{$endif}
{$if declared(TControlShowHintEvent)}
  TControlShowHintEvent = Controls.TControlShowHintEvent;
{$endif}
{$if declared(TContextPopupEvent)}
  TContextPopupEvent = Controls.TContextPopupEvent;
{$endif}
{$if declared(TControlFlag)}
  TControlFlag = Controls.TControlFlag;
{$endif}
{$if declared(TControlFlags)}
  TControlFlags = Controls.TControlFlags;
{$endif}
{$if declared(TControlHandlerType)}
  TControlHandlerType = Controls.TControlHandlerType;
{$endif}
{$if declared(TLayoutAdjustmentPolicy)}
  TLayoutAdjustmentPolicy = Controls.TLayoutAdjustmentPolicy;
{$endif}
{$if declared(TLazAccessibilityRole)}
  TLazAccessibilityRole = Controls.TLazAccessibilityRole;
{$endif}
{$if declared(TLazAccessibleObject)}
  TLazAccessibleObject = Controls.TLazAccessibleObject;
{$endif}
{$if declared(TLazAccessibleObjectEnumerator)}
  TLazAccessibleObjectEnumerator = Controls.TLazAccessibleObjectEnumerator;
{$endif}
{$if declared(TControlFont)}
  TControlFont = Controls.TControlFont;
{$endif}
{$if declared(TControlFontClass)}
  TControlFontClass = Controls.TControlFontClass;
{$endif}
{$if declared(TBorderWidth)}
  TBorderWidth = Controls.TBorderWidth;
{$endif}
{$if declared(TGetChildProc)}
  TGetChildProc = Controls.TGetChildProc;
{$endif}
{$if declared(TChildControlResizeStyle)}
  TChildControlResizeStyle = Controls.TChildControlResizeStyle;
{$endif}
{$if declared(TControlChildrenLayout)}
  TControlChildrenLayout = Controls.TControlChildrenLayout;
{$endif}
{$if declared(TControlChildSizing)}
  TControlChildSizing = Controls.TControlChildSizing;
{$endif}
{$if declared(TWinControlActionLinkClass)}
  TWinControlActionLinkClass = Controls.TWinControlActionLinkClass;
{$endif}
{$if declared(TWinControlFlag)}
  TWinControlFlag = Controls.TWinControlFlag;
{$endif}
{$if declared(TWinControlFlags)}
  TWinControlFlags = Controls.TWinControlFlags;
{$endif}
{$if declared(TControlAtPosFlag)}
  TControlAtPosFlag = Controls.TControlAtPosFlag;
{$endif}
{$if declared(TControlAtPosFlags)}
  TControlAtPosFlags = Controls.TControlAtPosFlags;
{$endif}
{$if declared(TAlignInfo)}
  TAlignInfo = Controls.TAlignInfo;
{$endif}
{$if declared(TAlignInsertBeforeEvent)}
  TAlignInsertBeforeEvent = Controls.TAlignInsertBeforeEvent;
{$endif}
{$if declared(TAlignPositionEvent)}
  TAlignPositionEvent = Controls.TAlignPositionEvent;
{$endif}
{$if declared(TWinControlEnumerator)}
  TWinControlEnumerator = Controls.TWinControlEnumerator;
{$endif}
{$if declared(TGraphicControl)}
  TGraphicControl = Controls.TGraphicControl;
{$endif}
{$if declared(TCustomControl)}
  TCustomControl = Controls.TCustomControl;
{$endif}
{$if declared(TImageList)}
  TImageList = Controls.TImageList;
{$endif}
{$if declared(TControlPropertyStorage)}
  TControlPropertyStorage = Controls.TControlPropertyStorage;
{$endif}
{$if declared(TDockTree)}
  TDockTree = Controls.TDockTree;
{$endif}
{$if declared(TDockZone)}
  TDockZone = Controls.TDockZone;
{$endif}
{$if declared(TDockZoneClass)}
  TDockZoneClass = Controls.TDockZoneClass;
{$endif}
{$if declared(TForEachZoneProc)}
  TForEachZoneProc = Controls.TForEachZoneProc;
{$endif}
{$if declared(TDockTreeFlag)}
  TDockTreeFlag = Controls.TDockTreeFlag;
{$endif}
{$if declared(TDockTreeFlags)}
  TDockTreeFlags = Controls.TDockTreeFlags;
{$endif}
{$if declared(TMouse)}
  TMouse = Controls.TMouse;
{$endif}
{$if declared(TCMHitTest)}
  TCMHitTest = Controls.TCMHitTest;
{$endif}
{$if declared(TCMDesignHitTest)}
  TCMDesignHitTest = Controls.TCMDesignHitTest;
{$endif}
{$if declared(TCMDialogChar)}
  TCMDialogChar = Controls.TCMDialogChar;
{$endif}
{$if declared(TCMDialogKey)}
  TCMDialogKey = Controls.TCMDialogKey;
{$endif}
{$if declared(TCMEnter)}
  TCMEnter = Controls.TCMEnter;
{$endif}
{$if declared(TCMExit)}
  TCMExit = Controls.TCMExit;
{$endif}
{$if declared(TCaption)}
  TCaption = Controls.TCaption;
{$endif}
{$if declared(TControlBorderStyle)}
  TControlBorderStyle = Controls.TControlBorderStyle;
{$endif}
{$if declared(TBevelCut)}
  TBevelCut = Controls.TBevelCut;
{$endif}
{$if declared(TSpacingSize)}
  TSpacingSize = Controls.TSpacingSize;
{$endif}
{$if declared(TWinControlActionLink)}
  TWinControlActionLink = Controls.TWinControlActionLink;
{$endif}
const
{$if declared(alNone)}
  alNone = Controls.alNone;
{$endif}
{$if declared(alTop)}
  alTop = Controls.alTop;
{$endif}
{$if declared(alBottom)}
  alBottom = Controls.alBottom;
{$endif}
{$if declared(alLeft)}
  alLeft = Controls.alLeft;
{$endif}
{$if declared(alRight)}
  alRight = Controls.alRight;
{$endif}
{$if declared(alClient)}
  alClient = Controls.alClient;
{$endif}
{$if declared(alCustom)}
  alCustom = Controls.alCustom;
{$endif}
{$if declared(akTop)}
  akTop = Controls.akTop;
{$endif}
{$if declared(akLeft)}
  akLeft = Controls.akLeft;
{$endif}
{$if declared(akRight)}
  akRight = Controls.akRight;
{$endif}
{$if declared(akBottom)}
  akBottom = Controls.akBottom;
{$endif}
{$if declared(asrTop)}
  asrTop = Controls.asrTop;
{$endif}
{$if declared(asrBottom)}
  asrBottom = Controls.asrBottom;
{$endif}
{$if declared(asrCenter)}
  asrCenter = Controls.asrCenter;
{$endif}
{$if declared(fsNormal)}
  fsNormal = Controls.fsNormal;
{$endif}
{$if declared(fsMDIChild)}
  fsMDIChild = Controls.fsMDIChild;
{$endif}
{$if declared(fsMDIForm)}
  fsMDIForm = Controls.fsMDIForm;
{$endif}
{$if declared(fsStayOnTop)}
  fsStayOnTop = Controls.fsStayOnTop;
{$endif}
{$if declared(fsSplash)}
  fsSplash = Controls.fsSplash;
{$endif}
{$if declared(fsSystemStayOnTop)}
  fsSystemStayOnTop = Controls.fsSystemStayOnTop;
{$endif}
{$if declared(bsNone)}
  bsNone = Controls.bsNone;
{$endif}
{$if declared(bsSingle)}
  bsSingle = Controls.bsSingle;
{$endif}
{$if declared(bsSizeable)}
  bsSizeable = Controls.bsSizeable;
{$endif}
{$if declared(bsDialog)}
  bsDialog = Controls.bsDialog;
{$endif}
{$if declared(bsToolWindow)}
  bsToolWindow = Controls.bsToolWindow;
{$endif}
{$if declared(bsSizeToolWin)}
  bsSizeToolWin = Controls.bsSizeToolWin;
{$endif}
{$if declared(crffDefault)}
  crffDefault = Controls.crffDefault;
{$endif}
{$if declared(crffCancel)}
  crffCancel = Controls.crffCancel;
{$endif}
{$if declared(mbLeft)}
  mbLeft = Controls.mbLeft;
{$endif}
{$if declared(mbRight)}
  mbRight = Controls.mbRight;
{$endif}
{$if declared(mbMiddle)}
  mbMiddle = Controls.mbMiddle;
{$endif}
{$if declared(mbExtra1)}
  mbExtra1 = Controls.mbExtra1;
{$endif}
{$if declared(mbExtra2)}
  mbExtra2 = Controls.mbExtra2;
{$endif}
{$if declared(csAcceptsControls)}
  csAcceptsControls = Controls.csAcceptsControls;
{$endif}
{$if declared(csCaptureMouse)}
  csCaptureMouse = Controls.csCaptureMouse;
{$endif}
{$if declared(csDesignInteractive)}
  csDesignInteractive = Controls.csDesignInteractive;
{$endif}
{$if declared(csClickEvents)}
  csClickEvents = Controls.csClickEvents;
{$endif}
{$if declared(csFramed)}
  csFramed = Controls.csFramed;
{$endif}
{$if declared(csSetCaption)}
  csSetCaption = Controls.csSetCaption;
{$endif}
{$if declared(csOpaque)}
  csOpaque = Controls.csOpaque;
{$endif}
{$if declared(csDoubleClicks)}
  csDoubleClicks = Controls.csDoubleClicks;
{$endif}
{$if declared(csTripleClicks)}
  csTripleClicks = Controls.csTripleClicks;
{$endif}
{$if declared(csQuadClicks)}
  csQuadClicks = Controls.csQuadClicks;
{$endif}
{$if declared(csFixedWidth)}
  csFixedWidth = Controls.csFixedWidth;
{$endif}
{$if declared(csFixedHeight)}
  csFixedHeight = Controls.csFixedHeight;
{$endif}
{$if declared(csNoDesignVisible)}
  csNoDesignVisible = Controls.csNoDesignVisible;
{$endif}
{$if declared(csReplicatable)}
  csReplicatable = Controls.csReplicatable;
{$endif}
{$if declared(csNoStdEvents)}
  csNoStdEvents = Controls.csNoStdEvents;
{$endif}
{$if declared(csDisplayDragImage)}
  csDisplayDragImage = Controls.csDisplayDragImage;
{$endif}
{$if declared(csReflector)}
  csReflector = Controls.csReflector;
{$endif}
{$if declared(csActionClient)}
  csActionClient = Controls.csActionClient;
{$endif}
{$if declared(csMenuEvents)}
  csMenuEvents = Controls.csMenuEvents;
{$endif}
{$if declared(csNoFocus)}
  csNoFocus = Controls.csNoFocus;
{$endif}
{$if declared(csNeedsBorderPaint)}
  csNeedsBorderPaint = Controls.csNeedsBorderPaint;
{$endif}
{$if declared(csParentBackground)}
  csParentBackground = Controls.csParentBackground;
{$endif}
{$if declared(csDesignNoSmoothResize)}
  csDesignNoSmoothResize = Controls.csDesignNoSmoothResize;
{$endif}
{$if declared(csDesignFixedBounds)}
  csDesignFixedBounds = Controls.csDesignFixedBounds;
{$endif}
{$if declared(csHasDefaultAction)}
  csHasDefaultAction = Controls.csHasDefaultAction;
{$endif}
{$if declared(csHasCancelAction)}
  csHasCancelAction = Controls.csHasCancelAction;
{$endif}
{$if declared(csNoDesignSelectable)}
  csNoDesignSelectable = Controls.csNoDesignSelectable;
{$endif}
{$if declared(csOwnedChildrenNotSelectable)}
  csOwnedChildrenNotSelectable = Controls.csOwnedChildrenNotSelectable;
{$endif}
{$if declared(csAutoSize0x0)}
  csAutoSize0x0 = Controls.csAutoSize0x0;
{$endif}
{$if declared(csAutoSizeKeepChildLeft)}
  csAutoSizeKeepChildLeft = Controls.csAutoSizeKeepChildLeft;
{$endif}
{$if declared(csAutoSizeKeepChildTop)}
  csAutoSizeKeepChildTop = Controls.csAutoSizeKeepChildTop;
{$endif}
{$if declared(csAutoSizeIgnoreByParent)}
  csAutoSizeIgnoreByParent = Controls.csAutoSizeIgnoreByParent;
{$endif}
{$if declared(csRequiresKeyboardInput)}
  csRequiresKeyboardInput = Controls.csRequiresKeyboardInput;
{$endif}
{$if declared(csLButtonDown)}
  csLButtonDown = Controls.csLButtonDown;
{$endif}
{$if declared(csClicked)}
  csClicked = Controls.csClicked;
{$endif}
{$if declared(csPalette)}
  csPalette = Controls.csPalette;
{$endif}
{$if declared(csReadingState)}
  csReadingState = Controls.csReadingState;
{$endif}
{$if declared(csFocusing)}
  csFocusing = Controls.csFocusing;
{$endif}
{$if declared(csCreating)}
  csCreating = Controls.csCreating;
{$endif}
{$if declared(csPaintCopy)}
  csPaintCopy = Controls.csPaintCopy;
{$endif}
{$if declared(csCustomPaint)}
  csCustomPaint = Controls.csCustomPaint;
{$endif}
{$if declared(csDestroyingHandle)}
  csDestroyingHandle = Controls.csDestroyingHandle;
{$endif}
{$if declared(csDocking)}
  csDocking = Controls.csDocking;
{$endif}
{$if declared(csVisibleSetInLoading)}
  csVisibleSetInLoading = Controls.csVisibleSetInLoading;
{$endif}
{$if declared(dkDrag)}
  dkDrag = Controls.dkDrag;
{$endif}
{$if declared(dkDock)}
  dkDock = Controls.dkDock;
{$endif}
{$if declared(dmManual)}
  dmManual = Controls.dmManual;
{$endif}
{$if declared(dmAutomatic)}
  dmAutomatic = Controls.dmAutomatic;
{$endif}
{$if declared(dsDragEnter)}
  dsDragEnter = Controls.dsDragEnter;
{$endif}
{$if declared(dsDragLeave)}
  dsDragLeave = Controls.dsDragLeave;
{$endif}
{$if declared(dsDragMove)}
  dsDragMove = Controls.dsDragMove;
{$endif}
{$if declared(dmDragEnter)}
  dmDragEnter = Controls.dmDragEnter;
{$endif}
{$if declared(dmDragLeave)}
  dmDragLeave = Controls.dmDragLeave;
{$endif}
{$if declared(dmDragMove)}
  dmDragMove = Controls.dmDragMove;
{$endif}
{$if declared(dmDragDrop)}
  dmDragDrop = Controls.dmDragDrop;
{$endif}
{$if declared(dmDragCancel)}
  dmDragCancel = Controls.dmDragCancel;
{$endif}
{$if declared(dmFindTarget)}
  dmFindTarget = Controls.dmFindTarget;
{$endif}
{$if declared(doNoOrient)}
  doNoOrient = Controls.doNoOrient;
{$endif}
{$if declared(doHorizontal)}
  doHorizontal = Controls.doHorizontal;
{$endif}
{$if declared(doVertical)}
  doVertical = Controls.doVertical;
{$endif}
{$if declared(doPages)}
  doPages = Controls.doPages;
{$endif}
{$if declared(scoAdviceWidthAsMin)}
  scoAdviceWidthAsMin = Controls.scoAdviceWidthAsMin;
{$endif}
{$if declared(scoAdviceWidthAsMax)}
  scoAdviceWidthAsMax = Controls.scoAdviceWidthAsMax;
{$endif}
{$if declared(scoAdviceHeightAsMin)}
  scoAdviceHeightAsMin = Controls.scoAdviceHeightAsMin;
{$endif}
{$if declared(scoAdviceHeightAsMax)}
  scoAdviceHeightAsMax = Controls.scoAdviceHeightAsMax;
{$endif}
{$if declared(ccaFill)}
  ccaFill = Controls.ccaFill;
{$endif}
{$if declared(ccaLeftTop)}
  ccaLeftTop = Controls.ccaLeftTop;
{$endif}
{$if declared(ccaRightBottom)}
  ccaRightBottom = Controls.ccaRightBottom;
{$endif}
{$if declared(ccaCenter)}
  ccaCenter = Controls.ccaCenter;
{$endif}
{$if declared(ascoAdd)}
  ascoAdd = Controls.ascoAdd;
{$endif}
{$if declared(ascoRemove)}
  ascoRemove = Controls.ascoRemove;
{$endif}
{$if declared(ascoChangeSide)}
  ascoChangeSide = Controls.ascoChangeSide;
{$endif}
{$if declared(caspNone)}
  caspNone = Controls.caspNone;
{$endif}
{$if declared(caspChangingProperties)}
  caspChangingProperties = Controls.caspChangingProperties;
{$endif}
{$if declared(caspCreatingHandles)}
  caspCreatingHandles = Controls.caspCreatingHandles;
{$endif}
{$if declared(caspComputingBounds)}
  caspComputingBounds = Controls.caspComputingBounds;
{$endif}
{$if declared(caspRealizingBounds)}
  caspRealizingBounds = Controls.caspRealizingBounds;
{$endif}
{$if declared(caspShowing)}
  caspShowing = Controls.caspShowing;
{$endif}
{$if declared(cfLoading)}
  cfLoading = Controls.cfLoading;
{$endif}
{$if declared(cfAutoSizeNeeded)}
  cfAutoSizeNeeded = Controls.cfAutoSizeNeeded;
{$endif}
{$if declared(cfLeftLoaded)}
  cfLeftLoaded = Controls.cfLeftLoaded;
{$endif}
{$if declared(cfTopLoaded)}
  cfTopLoaded = Controls.cfTopLoaded;
{$endif}
{$if declared(cfWidthLoaded)}
  cfWidthLoaded = Controls.cfWidthLoaded;
{$endif}
{$if declared(cfHeightLoaded)}
  cfHeightLoaded = Controls.cfHeightLoaded;
{$endif}
{$if declared(cfClientWidthLoaded)}
  cfClientWidthLoaded = Controls.cfClientWidthLoaded;
{$endif}
{$if declared(cfClientHeightLoaded)}
  cfClientHeightLoaded = Controls.cfClientHeightLoaded;
{$endif}
{$if declared(cfBoundsRectForNewParentValid)}
  cfBoundsRectForNewParentValid = Controls.cfBoundsRectForNewParentValid;
{$endif}
{$if declared(cfBaseBoundsValid)}
  cfBaseBoundsValid = Controls.cfBaseBoundsValid;
{$endif}
{$if declared(cfPreferredSizeValid)}
  cfPreferredSizeValid = Controls.cfPreferredSizeValid;
{$endif}
{$if declared(cfPreferredMinSizeValid)}
  cfPreferredMinSizeValid = Controls.cfPreferredMinSizeValid;
{$endif}
{$if declared(cfOnChangeBoundsNeeded)}
  cfOnChangeBoundsNeeded = Controls.cfOnChangeBoundsNeeded;
{$endif}
{$if declared(cfProcessingWMPaint)}
  cfProcessingWMPaint = Controls.cfProcessingWMPaint;
{$endif}
{$if declared(cfKillChangeBounds)}
  cfKillChangeBounds = Controls.cfKillChangeBounds;
{$endif}
{$if declared(cfKillInvalidatePreferredSize)}
  cfKillInvalidatePreferredSize = Controls.cfKillInvalidatePreferredSize;
{$endif}
{$if declared(cfKillAdjustSize)}
  cfKillAdjustSize = Controls.cfKillAdjustSize;
{$endif}
{$if declared(chtOnResize)}
  chtOnResize = Controls.chtOnResize;
{$endif}
{$if declared(chtOnChangeBounds)}
  chtOnChangeBounds = Controls.chtOnChangeBounds;
{$endif}
{$if declared(chtOnVisibleChanging)}
  chtOnVisibleChanging = Controls.chtOnVisibleChanging;
{$endif}
{$if declared(chtOnVisibleChanged)}
  chtOnVisibleChanged = Controls.chtOnVisibleChanged;
{$endif}
{$if declared(chtOnEnabledChanging)}
  chtOnEnabledChanging = Controls.chtOnEnabledChanging;
{$endif}
{$if declared(chtOnEnabledChanged)}
  chtOnEnabledChanged = Controls.chtOnEnabledChanged;
{$endif}
{$if declared(chtOnKeyDown)}
  chtOnKeyDown = Controls.chtOnKeyDown;
{$endif}
{$if declared(chtOnBeforeDestruction)}
  chtOnBeforeDestruction = Controls.chtOnBeforeDestruction;
{$endif}
{$if declared(chtOnMouseWheel)}
  chtOnMouseWheel = Controls.chtOnMouseWheel;
{$endif}
{$if declared(chtOnMouseWheelHorz)}
  chtOnMouseWheelHorz = Controls.chtOnMouseWheelHorz;
{$endif}
{$if declared(lapDefault)}
  lapDefault = Controls.lapDefault;
{$endif}
{$if declared(lapFixedLayout)}
  lapFixedLayout = Controls.lapFixedLayout;
{$endif}
{$if declared(lapAutoAdjustWithoutHorizontalScrolling)}
  lapAutoAdjustWithoutHorizontalScrolling = Controls.lapAutoAdjustWithoutHorizontalScrolling;
{$endif}
{$if declared(lapAutoAdjustForDPI)}
  lapAutoAdjustForDPI = Controls.lapAutoAdjustForDPI;
{$endif}
{$if declared(larIgnore)}
  larIgnore = Controls.larIgnore;
{$endif}
{$if declared(larAnimation)}
  larAnimation = Controls.larAnimation;
{$endif}
{$if declared(larButton)}
  larButton = Controls.larButton;
{$endif}
{$if declared(larCell)}
  larCell = Controls.larCell;
{$endif}
{$if declared(larChart)}
  larChart = Controls.larChart;
{$endif}
{$if declared(larCheckBox)}
  larCheckBox = Controls.larCheckBox;
{$endif}
{$if declared(larClock)}
  larClock = Controls.larClock;
{$endif}
{$if declared(larColorPicker)}
  larColorPicker = Controls.larColorPicker;
{$endif}
{$if declared(larColumn)}
  larColumn = Controls.larColumn;
{$endif}
{$if declared(larComboBox)}
  larComboBox = Controls.larComboBox;
{$endif}
{$if declared(larDateField)}
  larDateField = Controls.larDateField;
{$endif}
{$if declared(larGrid)}
  larGrid = Controls.larGrid;
{$endif}
{$if declared(larGroup)}
  larGroup = Controls.larGroup;
{$endif}
{$if declared(larImage)}
  larImage = Controls.larImage;
{$endif}
{$if declared(larLabel)}
  larLabel = Controls.larLabel;
{$endif}
{$if declared(larListBox)}
  larListBox = Controls.larListBox;
{$endif}
{$if declared(larListItem)}
  larListItem = Controls.larListItem;
{$endif}
{$if declared(larMenuBar)}
  larMenuBar = Controls.larMenuBar;
{$endif}
{$if declared(larMenuItem)}
  larMenuItem = Controls.larMenuItem;
{$endif}
{$if declared(larProgressIndicator)}
  larProgressIndicator = Controls.larProgressIndicator;
{$endif}
{$if declared(larRadioButton)}
  larRadioButton = Controls.larRadioButton;
{$endif}
{$if declared(larResizeGrip)}
  larResizeGrip = Controls.larResizeGrip;
{$endif}
{$if declared(larRow)}
  larRow = Controls.larRow;
{$endif}
{$if declared(larScrollBar)}
  larScrollBar = Controls.larScrollBar;
{$endif}
{$if declared(larSpinner)}
  larSpinner = Controls.larSpinner;
{$endif}
{$if declared(larTabControl)}
  larTabControl = Controls.larTabControl;
{$endif}
{$if declared(larText)}
  larText = Controls.larText;
{$endif}
{$if declared(larTextEditorMultiline)}
  larTextEditorMultiline = Controls.larTextEditorMultiline;
{$endif}
{$if declared(larTextEditorSingleline)}
  larTextEditorSingleline = Controls.larTextEditorSingleline;
{$endif}
{$if declared(larToolBar)}
  larToolBar = Controls.larToolBar;
{$endif}
{$if declared(larToolBarButton)}
  larToolBarButton = Controls.larToolBarButton;
{$endif}
{$if declared(larTrackBar)}
  larTrackBar = Controls.larTrackBar;
{$endif}
{$if declared(larTreeView)}
  larTreeView = Controls.larTreeView;
{$endif}
{$if declared(larTreeItem)}
  larTreeItem = Controls.larTreeItem;
{$endif}
{$if declared(larUnknown)}
  larUnknown = Controls.larUnknown;
{$endif}
{$if declared(larWindow)}
  larWindow = Controls.larWindow;
{$endif}
{$if declared(crsAnchorAligning)}
  crsAnchorAligning = Controls.crsAnchorAligning;
{$endif}
{$if declared(crsScaleChilds)}
  crsScaleChilds = Controls.crsScaleChilds;
{$endif}
{$if declared(crsHomogenousChildResize)}
  crsHomogenousChildResize = Controls.crsHomogenousChildResize;
{$endif}
{$if declared(crsHomogenousSpaceResize)}
  crsHomogenousSpaceResize = Controls.crsHomogenousSpaceResize;
{$endif}
{$if declared(crsSameSize)}
  crsSameSize = Controls.crsSameSize;
{$endif}
{$if declared(cclNone)}
  cclNone = Controls.cclNone;
{$endif}
{$if declared(cclLeftToRightThenTopToBottom)}
  cclLeftToRightThenTopToBottom = Controls.cclLeftToRightThenTopToBottom;
{$endif}
{$if declared(cclTopToBottomThenLeftToRight)}
  cclTopToBottomThenLeftToRight = Controls.cclTopToBottomThenLeftToRight;
{$endif}
{$if declared(wcfClientRectNeedsUpdate)}
  wcfClientRectNeedsUpdate = Controls.wcfClientRectNeedsUpdate;
{$endif}
{$if declared(wcfColorChanged)}
  wcfColorChanged = Controls.wcfColorChanged;
{$endif}
{$if declared(wcfFontChanged)}
  wcfFontChanged = Controls.wcfFontChanged;
{$endif}
{$if declared(wcfAllAutoSizing)}
  wcfAllAutoSizing = Controls.wcfAllAutoSizing;
{$endif}
{$if declared(wcfAligningControls)}
  wcfAligningControls = Controls.wcfAligningControls;
{$endif}
{$if declared(wcfEraseBackground)}
  wcfEraseBackground = Controls.wcfEraseBackground;
{$endif}
{$if declared(wcfCreatingHandle)}
  wcfCreatingHandle = Controls.wcfCreatingHandle;
{$endif}
{$if declared(wcfInitializing)}
  wcfInitializing = Controls.wcfInitializing;
{$endif}
{$if declared(wcfCreatingChildHandles)}
  wcfCreatingChildHandles = Controls.wcfCreatingChildHandles;
{$endif}
{$if declared(wcfRealizingBounds)}
  wcfRealizingBounds = Controls.wcfRealizingBounds;
{$endif}
{$if declared(wcfBoundsRealized)}
  wcfBoundsRealized = Controls.wcfBoundsRealized;
{$endif}
{$if declared(wcfUpdateShowing)}
  wcfUpdateShowing = Controls.wcfUpdateShowing;
{$endif}
{$if declared(wcfHandleVisible)}
  wcfHandleVisible = Controls.wcfHandleVisible;
{$endif}
{$if declared(wcfAdjustedLogicalClientRectValid)}
  wcfAdjustedLogicalClientRectValid = Controls.wcfAdjustedLogicalClientRectValid;
{$endif}
{$if declared(wcfKillIntfSetBounds)}
  wcfKillIntfSetBounds = Controls.wcfKillIntfSetBounds;
{$endif}
{$if declared(wcfDesignerDeleting)}
  wcfDesignerDeleting = Controls.wcfDesignerDeleting;
{$endif}
{$if declared(wcfSpecialSubControl)}
  wcfSpecialSubControl = Controls.wcfSpecialSubControl;
{$endif}
{$if declared(capfAllowDisabled)}
  capfAllowDisabled = Controls.capfAllowDisabled;
{$endif}
{$if declared(capfAllowWinControls)}
  capfAllowWinControls = Controls.capfAllowWinControls;
{$endif}
{$if declared(capfOnlyClientAreas)}
  capfOnlyClientAreas = Controls.capfOnlyClientAreas;
{$endif}
{$if declared(capfRecursive)}
  capfRecursive = Controls.capfRecursive;
{$endif}
{$if declared(capfHasScrollOffset)}
  capfHasScrollOffset = Controls.capfHasScrollOffset;
{$endif}
{$if declared(capfOnlyWinControls)}
  capfOnlyWinControls = Controls.capfOnlyWinControls;
{$endif}
{$if declared(dtfUpdateAllNeeded)}
  dtfUpdateAllNeeded = Controls.dtfUpdateAllNeeded;
{$endif}
{$if declared(CM_BASE)}
  CM_BASE = Controls.CM_BASE;
{$endif}
{$if declared(CM_LCLOFFSET)}
  CM_LCLOFFSET = Controls.CM_LCLOFFSET;
{$endif}
{$if declared(CM_ACTIVATE)}
  CM_ACTIVATE = Controls.CM_ACTIVATE;
{$endif}
{$if declared(CM_DEACTIVATE)}
  CM_DEACTIVATE = Controls.CM_DEACTIVATE;
{$endif}
{$if declared(CM_GOTFOCUS)}
  CM_GOTFOCUS = Controls.CM_GOTFOCUS;
{$endif}
{$if declared(CM_LOSTFOCUS)}
  CM_LOSTFOCUS = Controls.CM_LOSTFOCUS;
{$endif}
{$if declared(CM_CANCELMODE)}
  CM_CANCELMODE = Controls.CM_CANCELMODE;
{$endif}
{$if declared(CM_DIALOGKEY)}
  CM_DIALOGKEY = Controls.CM_DIALOGKEY;
{$endif}
{$if declared(CM_DIALOGCHAR)}
  CM_DIALOGCHAR = Controls.CM_DIALOGCHAR;
{$endif}
{$if declared(CM_FOCUSCHANGED)}
  CM_FOCUSCHANGED = Controls.CM_FOCUSCHANGED;
{$endif}
{$if declared(CM_PARENTFONTCHANGED)}
  CM_PARENTFONTCHANGED = Controls.CM_PARENTFONTCHANGED;
{$endif}
{$if declared(CM_PARENTCOLORCHANGED)}
  CM_PARENTCOLORCHANGED = Controls.CM_PARENTCOLORCHANGED;
{$endif}
{$if declared(CM_HITTEST)}
  CM_HITTEST = Controls.CM_HITTEST;
{$endif}
{$if declared(CM_VISIBLECHANGED)}
  CM_VISIBLECHANGED = Controls.CM_VISIBLECHANGED;
{$endif}
{$if declared(CM_ENABLEDCHANGED)}
  CM_ENABLEDCHANGED = Controls.CM_ENABLEDCHANGED;
{$endif}
{$if declared(CM_COLORCHANGED)}
  CM_COLORCHANGED = Controls.CM_COLORCHANGED;
{$endif}
{$if declared(CM_FONTCHANGED)}
  CM_FONTCHANGED = Controls.CM_FONTCHANGED;
{$endif}
{$if declared(CM_CURSORCHANGED)}
  CM_CURSORCHANGED = Controls.CM_CURSORCHANGED;
{$endif}
{$if declared(CM_CTL3DCHANGED)}
  CM_CTL3DCHANGED = Controls.CM_CTL3DCHANGED;
{$endif}
{$if declared(CM_PARENTCTL3DCHANGED)}
  CM_PARENTCTL3DCHANGED = Controls.CM_PARENTCTL3DCHANGED;
{$endif}
{$if declared(CM_TEXTCHANGED)}
  CM_TEXTCHANGED = Controls.CM_TEXTCHANGED;
{$endif}
{$if declared(CM_MOUSEENTER)}
  CM_MOUSEENTER = Controls.CM_MOUSEENTER;
{$endif}
{$if declared(CM_MOUSELEAVE)}
  CM_MOUSELEAVE = Controls.CM_MOUSELEAVE;
{$endif}
{$if declared(CM_MENUCHANGED)}
  CM_MENUCHANGED = Controls.CM_MENUCHANGED;
{$endif}
{$if declared(CM_APPKEYDOWN)}
  CM_APPKEYDOWN = Controls.CM_APPKEYDOWN;
{$endif}
{$if declared(CM_APPSYSCOMMAND)}
  CM_APPSYSCOMMAND = Controls.CM_APPSYSCOMMAND;
{$endif}
{$if declared(CM_BUTTONPRESSED)}
  CM_BUTTONPRESSED = Controls.CM_BUTTONPRESSED;
{$endif}
{$if declared(CM_SHOWINGCHANGED)}
  CM_SHOWINGCHANGED = Controls.CM_SHOWINGCHANGED;
{$endif}
{$if declared(CM_ENTER)}
  CM_ENTER = Controls.CM_ENTER;
{$endif}
{$if declared(CM_EXIT)}
  CM_EXIT = Controls.CM_EXIT;
{$endif}
{$if declared(CM_DESIGNHITTEST)}
  CM_DESIGNHITTEST = Controls.CM_DESIGNHITTEST;
{$endif}
{$if declared(CM_ICONCHANGED)}
  CM_ICONCHANGED = Controls.CM_ICONCHANGED;
{$endif}
{$if declared(CM_WANTSPECIALKEY)}
  CM_WANTSPECIALKEY = Controls.CM_WANTSPECIALKEY;
{$endif}
{$if declared(CM_INVOKEHELP)}
  CM_INVOKEHELP = Controls.CM_INVOKEHELP;
{$endif}
{$if declared(CM_WINDOWHOOK)}
  CM_WINDOWHOOK = Controls.CM_WINDOWHOOK;
{$endif}
{$if declared(CM_RELEASE)}
  CM_RELEASE = Controls.CM_RELEASE;
{$endif}
{$if declared(CM_SHOWHINTCHANGED)}
  CM_SHOWHINTCHANGED = Controls.CM_SHOWHINTCHANGED;
{$endif}
{$if declared(CM_PARENTSHOWHINTCHANGED)}
  CM_PARENTSHOWHINTCHANGED = Controls.CM_PARENTSHOWHINTCHANGED;
{$endif}
{$if declared(CM_SYSCOLORCHANGE)}
  CM_SYSCOLORCHANGE = Controls.CM_SYSCOLORCHANGE;
{$endif}
{$if declared(CM_WININICHANGE)}
  CM_WININICHANGE = Controls.CM_WININICHANGE;
{$endif}
{$if declared(CM_FONTCHANGE)}
  CM_FONTCHANGE = Controls.CM_FONTCHANGE;
{$endif}
{$if declared(CM_TIMECHANGE)}
  CM_TIMECHANGE = Controls.CM_TIMECHANGE;
{$endif}
{$if declared(CM_TABSTOPCHANGED)}
  CM_TABSTOPCHANGED = Controls.CM_TABSTOPCHANGED;
{$endif}
{$if declared(CM_UIACTIVATE)}
  CM_UIACTIVATE = Controls.CM_UIACTIVATE;
{$endif}
{$if declared(CM_UIDEACTIVATE)}
  CM_UIDEACTIVATE = Controls.CM_UIDEACTIVATE;
{$endif}
{$if declared(CM_DOCWINDOWACTIVATE)}
  CM_DOCWINDOWACTIVATE = Controls.CM_DOCWINDOWACTIVATE;
{$endif}
{$if declared(CM_CONTROLLISTCHANGE)}
  CM_CONTROLLISTCHANGE = Controls.CM_CONTROLLISTCHANGE;
{$endif}
{$if declared(CM_GETDATALINK)}
  CM_GETDATALINK = Controls.CM_GETDATALINK;
{$endif}
{$if declared(CM_CHILDKEY)}
  CM_CHILDKEY = Controls.CM_CHILDKEY;
{$endif}
{$if declared(CM_DRAG)}
  CM_DRAG = Controls.CM_DRAG;
{$endif}
{$if declared(CM_HINTSHOW)}
  CM_HINTSHOW = Controls.CM_HINTSHOW;
{$endif}
{$if declared(CM_DIALOGHANDLE)}
  CM_DIALOGHANDLE = Controls.CM_DIALOGHANDLE;
{$endif}
{$if declared(CM_ISTOOLCONTROL)}
  CM_ISTOOLCONTROL = Controls.CM_ISTOOLCONTROL;
{$endif}
{$if declared(CM_RECREATEWND)}
  CM_RECREATEWND = Controls.CM_RECREATEWND;
{$endif}
{$if declared(CM_INVALIDATE)}
  CM_INVALIDATE = Controls.CM_INVALIDATE;
{$endif}
{$if declared(CM_SYSFONTCHANGED)}
  CM_SYSFONTCHANGED = Controls.CM_SYSFONTCHANGED;
{$endif}
{$if declared(CM_CONTROLCHANGE)}
  CM_CONTROLCHANGE = Controls.CM_CONTROLCHANGE;
{$endif}
{$if declared(CM_CHANGED)}
  CM_CHANGED = Controls.CM_CHANGED;
{$endif}
{$if declared(CM_DOCKCLIENT)}
  CM_DOCKCLIENT = Controls.CM_DOCKCLIENT;
{$endif}
{$if declared(CM_UNDOCKCLIENT)}
  CM_UNDOCKCLIENT = Controls.CM_UNDOCKCLIENT;
{$endif}
{$if declared(CM_FLOAT)}
  CM_FLOAT = Controls.CM_FLOAT;
{$endif}
{$if declared(CM_BORDERCHANGED)}
  CM_BORDERCHANGED = Controls.CM_BORDERCHANGED;
{$endif}
{$if declared(CM_BIDIMODECHANGED)}
  CM_BIDIMODECHANGED = Controls.CM_BIDIMODECHANGED;
{$endif}
{$if declared(CM_PARENTBIDIMODECHANGED)}
  CM_PARENTBIDIMODECHANGED = Controls.CM_PARENTBIDIMODECHANGED;
{$endif}
{$if declared(CM_ALLCHILDRENFLIPPED)}
  CM_ALLCHILDRENFLIPPED = Controls.CM_ALLCHILDRENFLIPPED;
{$endif}
{$if declared(CM_ACTIONUPDATE)}
  CM_ACTIONUPDATE = Controls.CM_ACTIONUPDATE;
{$endif}
{$if declared(CM_ACTIONEXECUTE)}
  CM_ACTIONEXECUTE = Controls.CM_ACTIONEXECUTE;
{$endif}
{$if declared(CM_HINTSHOWPAUSE)}
  CM_HINTSHOWPAUSE = Controls.CM_HINTSHOWPAUSE;
{$endif}
{$if declared(CM_DOCKNOTIFICATION)}
  CM_DOCKNOTIFICATION = Controls.CM_DOCKNOTIFICATION;
{$endif}
{$if declared(CM_MOUSEWHEEL)}
  CM_MOUSEWHEEL = Controls.CM_MOUSEWHEEL;
{$endif}
{$if declared(CM_ISSHORTCUT)}
  CM_ISSHORTCUT = Controls.CM_ISSHORTCUT;
{$endif}
{$if declared(CM_UPDATEACTIONS)}
  CM_UPDATEACTIONS = Controls.CM_UPDATEACTIONS;
{$endif}
{$if declared(CM_INVALIDATEDOCKHOST)}
  CM_INVALIDATEDOCKHOST = Controls.CM_INVALIDATEDOCKHOST;
{$endif}
{$if declared(CM_SETACTIVECONTROL)}
  CM_SETACTIVECONTROL = Controls.CM_SETACTIVECONTROL;
{$endif}
{$if declared(CM_POPUPHWNDDESTROY)}
  CM_POPUPHWNDDESTROY = Controls.CM_POPUPHWNDDESTROY;
{$endif}
{$if declared(CM_CREATEPOPUP)}
  CM_CREATEPOPUP = Controls.CM_CREATEPOPUP;
{$endif}
{$if declared(CM_DESTROYHANDLE)}
  CM_DESTROYHANDLE = Controls.CM_DESTROYHANDLE;
{$endif}
{$if declared(CM_MOUSEACTIVATE)}
  CM_MOUSEACTIVATE = Controls.CM_MOUSEACTIVATE;
{$endif}
{$if declared(CM_CONTROLLISTCHANGING)}
  CM_CONTROLLISTCHANGING = Controls.CM_CONTROLLISTCHANGING;
{$endif}
{$if declared(CM_BUFFEREDPRINTCLIENT)}
  CM_BUFFEREDPRINTCLIENT = Controls.CM_BUFFEREDPRINTCLIENT;
{$endif}
{$if declared(CM_UNTHEMECONTROL)}
  CM_UNTHEMECONTROL = Controls.CM_UNTHEMECONTROL;
{$endif}
{$if declared(CM_DOUBLEBUFFEREDCHANGED)}
  CM_DOUBLEBUFFEREDCHANGED = Controls.CM_DOUBLEBUFFEREDCHANGED;
{$endif}
{$if declared(CM_PARENTDOUBLEBUFFEREDCHANGED)}
  CM_PARENTDOUBLEBUFFEREDCHANGED = Controls.CM_PARENTDOUBLEBUFFEREDCHANGED;
{$endif}
{$if declared(CM_THEMECHANGED)}
  CM_THEMECHANGED = Controls.CM_THEMECHANGED;
{$endif}
{$if declared(CM_GESTURE)}
  CM_GESTURE = Controls.CM_GESTURE;
{$endif}
{$if declared(CM_CUSTOMGESTURESCHANGED)}
  CM_CUSTOMGESTURESCHANGED = Controls.CM_CUSTOMGESTURESCHANGED;
{$endif}
{$if declared(CM_GESTUREMANAGERCHANGED)}
  CM_GESTUREMANAGERCHANGED = Controls.CM_GESTUREMANAGERCHANGED;
{$endif}
{$if declared(CM_STANDARDGESTURESCHANGED)}
  CM_STANDARDGESTURESCHANGED = Controls.CM_STANDARDGESTURESCHANGED;
{$endif}
{$if declared(CM_INPUTLANGCHANGE)}
  CM_INPUTLANGCHANGE = Controls.CM_INPUTLANGCHANGE;
{$endif}
{$if declared(CM_TABLETOPTIONSCHANGED)}
  CM_TABLETOPTIONSCHANGED = Controls.CM_TABLETOPTIONSCHANGED;
{$endif}
{$if declared(CM_PARENTTABLETOPTIONSCHANGED)}
  CM_PARENTTABLETOPTIONSCHANGED = Controls.CM_PARENTTABLETOPTIONSCHANGED;
{$endif}
{$if declared(CM_MASKHITTEST)}
  CM_MASKHITTEST = Controls.CM_MASKHITTEST;
{$endif}
{$if declared(CM_APPSHOWBTNGLYPHCHANGED)}
  CM_APPSHOWBTNGLYPHCHANGED = Controls.CM_APPSHOWBTNGLYPHCHANGED;
{$endif}
{$if declared(CM_APPSHOWMENUGLYPHCHANGED)}
  CM_APPSHOWMENUGLYPHCHANGED = Controls.CM_APPSHOWMENUGLYPHCHANGED;
{$endif}
{$if declared(CN_BASE)}
  CN_BASE = Controls.CN_BASE;
{$endif}
{$if declared(CN_CHARTOITEM)}
  CN_CHARTOITEM = Controls.CN_CHARTOITEM;
{$endif}
{$if declared(CN_COMMAND)}
  CN_COMMAND = Controls.CN_COMMAND;
{$endif}
{$if declared(CN_COMPAREITEM)}
  CN_COMPAREITEM = Controls.CN_COMPAREITEM;
{$endif}
{$if declared(CN_CTLCOLORBTN)}
  CN_CTLCOLORBTN = Controls.CN_CTLCOLORBTN;
{$endif}
{$if declared(CN_CTLCOLORDLG)}
  CN_CTLCOLORDLG = Controls.CN_CTLCOLORDLG;
{$endif}
{$if declared(CN_CTLCOLOREDIT)}
  CN_CTLCOLOREDIT = Controls.CN_CTLCOLOREDIT;
{$endif}
{$if declared(CN_CTLCOLORLISTBOX)}
  CN_CTLCOLORLISTBOX = Controls.CN_CTLCOLORLISTBOX;
{$endif}
{$if declared(CN_CTLCOLORMSGBOX)}
  CN_CTLCOLORMSGBOX = Controls.CN_CTLCOLORMSGBOX;
{$endif}
{$if declared(CN_CTLCOLORSCROLLBAR)}
  CN_CTLCOLORSCROLLBAR = Controls.CN_CTLCOLORSCROLLBAR;
{$endif}
{$if declared(CN_CTLCOLORSTATIC)}
  CN_CTLCOLORSTATIC = Controls.CN_CTLCOLORSTATIC;
{$endif}
{$if declared(CN_DELETEITEM)}
  CN_DELETEITEM = Controls.CN_DELETEITEM;
{$endif}
{$if declared(CN_DRAWITEM)}
  CN_DRAWITEM = Controls.CN_DRAWITEM;
{$endif}
{$if declared(CN_HSCROLL)}
  CN_HSCROLL = Controls.CN_HSCROLL;
{$endif}
{$if declared(CN_MEASUREITEM)}
  CN_MEASUREITEM = Controls.CN_MEASUREITEM;
{$endif}
{$if declared(CN_PARENTNOTIFY)}
  CN_PARENTNOTIFY = Controls.CN_PARENTNOTIFY;
{$endif}
{$if declared(CN_VKEYTOITEM)}
  CN_VKEYTOITEM = Controls.CN_VKEYTOITEM;
{$endif}
{$if declared(CN_VSCROLL)}
  CN_VSCROLL = Controls.CN_VSCROLL;
{$endif}
{$if declared(CN_KEYDOWN)}
  CN_KEYDOWN = Controls.CN_KEYDOWN;
{$endif}
{$if declared(CN_KEYUP)}
  CN_KEYUP = Controls.CN_KEYUP;
{$endif}
{$if declared(CN_CHAR)}
  CN_CHAR = Controls.CN_CHAR;
{$endif}
{$if declared(CN_SYSKEYUP)}
  CN_SYSKEYUP = Controls.CN_SYSKEYUP;
{$endif}
{$if declared(CN_SYSKEYDOWN)}
  CN_SYSKEYDOWN = Controls.CN_SYSKEYDOWN;
{$endif}
{$if declared(CN_SYSCHAR)}
  CN_SYSCHAR = Controls.CN_SYSCHAR;
{$endif}
{$if declared(CN_NOTIFY)}
  CN_NOTIFY = Controls.CN_NOTIFY;
{$endif}
{$if declared(mrNone)}
  mrNone = Controls.mrNone;
{$endif}
{$if declared(mrOK)}
  mrOK = Controls.mrOK;
{$endif}
{$if declared(mrCancel)}
  mrCancel = Controls.mrCancel;
{$endif}
{$if declared(mrAbort)}
  mrAbort = Controls.mrAbort;
{$endif}
{$if declared(mrRetry)}
  mrRetry = Controls.mrRetry;
{$endif}
{$if declared(mrIgnore)}
  mrIgnore = Controls.mrIgnore;
{$endif}
{$if declared(mrYes)}
  mrYes = Controls.mrYes;
{$endif}
{$if declared(mrNo)}
  mrNo = Controls.mrNo;
{$endif}
{$if declared(mrAll)}
  mrAll = Controls.mrAll;
{$endif}
{$if declared(mrNoToAll)}
  mrNoToAll = Controls.mrNoToAll;
{$endif}
{$if declared(mrYesToAll)}
  mrYesToAll = Controls.mrYesToAll;
{$endif}
{$if declared(mrClose)}
  mrClose = Controls.mrClose;
{$endif}
{$if declared(mrLast)}
  mrLast = Controls.mrLast;
{$endif}
{$if declared(fsSurface)}
  fsSurface = Controls.fsSurface;
{$endif}
{$if declared(fsBorder)}
  fsBorder = Controls.fsBorder;
{$endif}
{$if declared(bvNone)}
  bvNone = Controls.bvNone;
{$endif}
{$if declared(bvLowered)}
  bvLowered = Controls.bvLowered;
{$endif}
{$if declared(bvRaised)}
  bvRaised = Controls.bvRaised;
{$endif}
{$if declared(bvSpace)}
  bvSpace = Controls.bvSpace;
{$endif}
{$if declared(ssModifier)}
  ssModifier = Controls.ssModifier;
{$endif}
{$if declared(GUID_ObjInspInterface)}
  GUID_ObjInspInterface = Controls.GUID_ObjInspInterface;
{$endif}
{$if declared(asrLeft)}
  asrLeft = Controls.asrLeft;
{$endif}
{$if declared(asrRight)}
  asrRight = Controls.asrRight;
{$endif}
{$if declared(fsAllStayOnTop)}
  fsAllStayOnTop = Controls.fsAllStayOnTop;
{$endif}
{$if declared(fsAllNonSystemStayOnTop)}
  fsAllNonSystemStayOnTop = Controls.fsAllNonSystemStayOnTop;
{$endif}
{$if declared(crHigh)}
  crHigh = Controls.crHigh;
{$endif}
{$if declared(crDefault)}
  crDefault = Controls.crDefault;
{$endif}
{$if declared(crNone)}
  crNone = Controls.crNone;
{$endif}
{$if declared(crArrow)}
  crArrow = Controls.crArrow;
{$endif}
{$if declared(crCross)}
  crCross = Controls.crCross;
{$endif}
{$if declared(crIBeam)}
  crIBeam = Controls.crIBeam;
{$endif}
{$if declared(crSize)}
  crSize = Controls.crSize;
{$endif}
{$if declared(crSizeNESW)}
  crSizeNESW = Controls.crSizeNESW;
{$endif}
{$if declared(crSizeNS)}
  crSizeNS = Controls.crSizeNS;
{$endif}
{$if declared(crSizeNWSE)}
  crSizeNWSE = Controls.crSizeNWSE;
{$endif}
{$if declared(crSizeWE)}
  crSizeWE = Controls.crSizeWE;
{$endif}
{$if declared(crSizeNW)}
  crSizeNW = Controls.crSizeNW;
{$endif}
{$if declared(crSizeN)}
  crSizeN = Controls.crSizeN;
{$endif}
{$if declared(crSizeNE)}
  crSizeNE = Controls.crSizeNE;
{$endif}
{$if declared(crSizeW)}
  crSizeW = Controls.crSizeW;
{$endif}
{$if declared(crSizeE)}
  crSizeE = Controls.crSizeE;
{$endif}
{$if declared(crSizeSW)}
  crSizeSW = Controls.crSizeSW;
{$endif}
{$if declared(crSizeS)}
  crSizeS = Controls.crSizeS;
{$endif}
{$if declared(crSizeSE)}
  crSizeSE = Controls.crSizeSE;
{$endif}
{$if declared(crUpArrow)}
  crUpArrow = Controls.crUpArrow;
{$endif}
{$if declared(crHourGlass)}
  crHourGlass = Controls.crHourGlass;
{$endif}
{$if declared(crDrag)}
  crDrag = Controls.crDrag;
{$endif}
{$if declared(crNoDrop)}
  crNoDrop = Controls.crNoDrop;
{$endif}
{$if declared(crHSplit)}
  crHSplit = Controls.crHSplit;
{$endif}
{$if declared(crVSplit)}
  crVSplit = Controls.crVSplit;
{$endif}
{$if declared(crMultiDrag)}
  crMultiDrag = Controls.crMultiDrag;
{$endif}
{$if declared(crSQLWait)}
  crSQLWait = Controls.crSQLWait;
{$endif}
{$if declared(crNo)}
  crNo = Controls.crNo;
{$endif}
{$if declared(crAppStart)}
  crAppStart = Controls.crAppStart;
{$endif}
{$if declared(crHelp)}
  crHelp = Controls.crHelp;
{$endif}
{$if declared(crHandPoint)}
  crHandPoint = Controls.crHandPoint;
{$endif}
{$if declared(crSizeAll)}
  crSizeAll = Controls.crSizeAll;
{$endif}
{$if declared(crLow)}
  crLow = Controls.crLow;
{$endif}
{$if declared(csMultiClicks)}
  csMultiClicks = Controls.csMultiClicks;
{$endif}
var
{$if declared(OnDrawDockImage)}
  OnDrawDockImage: TDrawDockImageEvent absolute Controls.OnDrawDockImage;
{$endif}
{$if declared(DragManager)}
  DragManager: TDragManager absolute Controls.DragManager;
{$endif}
{$if declared(DockSplitterClass)}
  DockSplitterClass: TControlClass absolute Controls.DockSplitterClass;
{$endif}
{$if declared(DefaultDockManagerClass)}
  DefaultDockManagerClass: TDockManagerClass absolute Controls.DefaultDockManagerClass;
{$endif}
{$if declared(NewStyleControls)}
  NewStyleControls: Boolean absolute Controls.NewStyleControls;
{$endif}
{$if declared(Mouse)}
  Mouse: TMouse absolute Controls.Mouse;
{$endif}
{$if declared(FindDragTarget)}
function FindDragTarget(const Position: TPoint; AllowDisabled: Boolean): TControl; inline;
{$endif}
{$if declared(FindControlAtPosition)}
function FindControlAtPosition(const Position: TPoint; AllowDisabled: Boolean): TControl; inline;
{$endif}
{$if declared(FindLCLWindow)}
function FindLCLWindow(const ScreenPos: TPoint; AllowDisabled: Boolean = True): TWinControl; inline;
{$endif}
{$if declared(FindControl)}
function FindControl(Handle: HWND): TWinControl; inline;
{$endif}
{$if declared(FindOwnerControl)}
function FindOwnerControl(Handle: HWND): TWinControl; inline;
{$endif}
{$if declared(FindLCLControl)}
function FindLCLControl(const ScreenPos: TPoint): TControl; inline;
{$endif}
{$if declared(SendAppMessage)}
function SendAppMessage(Msg: Cardinal; WParam: WParam; LParam: LParam): Longint; inline;
{$endif}
{$if declared(MoveWindowOrg)}
procedure MoveWindowOrg(dc: hdc; X,Y: Integer); inline;
{$endif}
{$if declared(RecreateWnd)}
procedure RecreateWnd(const AWinControl:TWinControl); inline;
{$endif}
{$if declared(CancelDrag)}
procedure CancelDrag; inline;
{$endif}
{$if declared(SetCaptureControl)}
procedure SetCaptureControl(AWinControl: TWinControl; const Position: TPoint); overload; inline;
{$endif}
{$if declared(SetCaptureControl)}
procedure SetCaptureControl(Control: TControl); overload; inline;
{$endif}
{$if declared(GetCaptureControl)}
function GetCaptureControl: TControl; inline;
{$endif}
{$if declared(CursorToString)}
function CursorToString(Cursor: TCursor): string; inline;
{$endif}
{$if declared(StringToCursor)}
function StringToCursor(const S: string): TCursor; inline;
{$endif}
{$if declared(GetCursorValues)}
procedure GetCursorValues(Proc: TGetStrProc); inline;
{$endif}
{$if declared(CursorToIdent)}
function CursorToIdent(Cursor: Longint; var Ident: string): Boolean; inline;
{$endif}
{$if declared(IdentToCursor)}
function IdentToCursor(const Ident: string; var Cursor: Longint): Boolean; inline;
{$endif}
{$if declared(CheckTransparentWindow)}
procedure CheckTransparentWindow(var Handle: TLCLHandle; var AWinControl: TWinControl); inline;
{$endif}
{$if declared(CheckMouseButtonDownUp)}
function CheckMouseButtonDownUp(const AWinHandle: TLCLHandle; const AWinControl: TWinControl; var LastMouse: TLastMouseInfo; const AMousePos: TPoint; const AButton: Byte; const AMouseDown: Boolean): Cardinal; inline;
{$endif}
{$if declared(GetKeyShiftState)}
function GetKeyShiftState: TShiftState; inline;
{$endif}
{$if declared(AdjustBorderSpace)}
procedure AdjustBorderSpace(var RemainingClientRect, CurBorderSpace: TRect; Left, Top, Right, Bottom: Integer); overload; inline;
{$endif}
{$if declared(AdjustBorderSpace)}
procedure AdjustBorderSpace(var RemainingClientRect, CurBorderSpace: TRect; const Space: TRect); overload; inline;
{$endif}
{$if declared(IsColorDefault)}
function IsColorDefault(AControl: TControl): Boolean; inline;
{$endif}
{$if declared(BidiFlipAlignment)}
function BidiFlipAlignment(Alignment: TAlignment; Flip: Boolean = True): TAlignment; inline;
{$endif}
{$if declared(BidiFlipAnchors)}
function BidiFlipAnchors(Control: TControl; Flip: Boolean): TAnchors; inline;
{$endif}
{$if declared(BidiFlipRect)}
function BidiFlipRect(const Rect: TRect; const ParentRect: TRect; const Flip: Boolean): TRect; inline;
{$endif}
{$if declared(ChangeBiDiModeAlignment)}
procedure ChangeBiDiModeAlignment(var Alignment: TAlignment); inline;
{$endif}
{$if declared(DbgS)}
function DbgS(a: TAnchorKind): string; overload; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(Anchors: TAnchors): string; overload; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(a: TAlign): string; overload; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(a: TAnchorKind; Side: TAnchorSideReference): string; overload; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(p: TControlAutoSizePhase): string; overload; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(Phases: TControlAutoSizePhases): string; overload; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(cst: TControlStyleType): string; overload; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(cs: TControlStyle): string; overload; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(fs: TFormStyle): string; overload; inline;
{$endif}
{$if declared(CompareLazAccessibleObjectsByDataObject)}
function CompareLazAccessibleObjectsByDataObject(o1, o2: Pointer): Integer; inline;
{$endif}
{$if declared(CompareDataObjectWithLazAccessibleObject)}
function CompareDataObjectWithLazAccessibleObject(o, ao: Pointer): Integer; inline;
{$endif}

implementation

{$if declared(FindDragTarget)}
function FindDragTarget(const Position: TPoint; AllowDisabled: Boolean): TControl;
begin
  Result := Controls.FindDragTarget(Position, AllowDisabled);
end;

{$endif}
{$if declared(FindControlAtPosition)}
function FindControlAtPosition(const Position: TPoint; AllowDisabled: Boolean): TControl;
begin
  Result := Controls.FindControlAtPosition(Position, AllowDisabled);
end;

{$endif}
{$if declared(FindLCLWindow)}
function FindLCLWindow(const ScreenPos: TPoint; AllowDisabled: Boolean = True): TWinControl;
begin
  Result := Controls.FindLCLWindow(ScreenPos, AllowDisabled);
end;

{$endif}
{$if declared(FindControl)}
function FindControl(Handle: HWND): TWinControl;
begin
  Result := Controls.FindControl(Handle);
end;

{$endif}
{$if declared(FindOwnerControl)}
function FindOwnerControl(Handle: HWND): TWinControl;
begin
  Result := Controls.FindOwnerControl(Handle);
end;

{$endif}
{$if declared(FindLCLControl)}
function FindLCLControl(const ScreenPos: TPoint): TControl;
begin
  Result := Controls.FindLCLControl(ScreenPos);
end;

{$endif}
{$if declared(SendAppMessage)}
function SendAppMessage(Msg: Cardinal; WParam: WParam; LParam: LParam): Longint;
begin
  Result := Controls.SendAppMessage(Msg, WParam, LParam);
end;

{$endif}
{$if declared(MoveWindowOrg)}
procedure MoveWindowOrg(dc: hdc; X,Y: Integer);
begin
  Controls.MoveWindowOrg(dc, X, Y);
end;

{$endif}
{$if declared(RecreateWnd)}
procedure RecreateWnd(const AWinControl:TWinControl);
begin
  Controls.RecreateWnd(AWinControl);
end;

{$endif}
{$if declared(CancelDrag)}
procedure CancelDrag;
begin
  Controls.CancelDrag;
end;

{$endif}
{$if declared(SetCaptureControl)}
procedure SetCaptureControl(AWinControl: TWinControl; const Position: TPoint);
begin
  Controls.SetCaptureControl(AWinControl, Position);
end;

{$endif}
{$if declared(SetCaptureControl)}
procedure SetCaptureControl(Control: TControl);
begin
  Controls.SetCaptureControl(Control);
end;

{$endif}
{$if declared(GetCaptureControl)}
function GetCaptureControl: TControl;
begin
  Result := Controls.GetCaptureControl;
end;

{$endif}
{$if declared(CursorToString)}
function CursorToString(Cursor: TCursor): string;
begin
  Result := Controls.CursorToString(Cursor);
end;

{$endif}
{$if declared(StringToCursor)}
function StringToCursor(const S: string): TCursor;
begin
  Result := Controls.StringToCursor(S);
end;

{$endif}
{$if declared(GetCursorValues)}
procedure GetCursorValues(Proc: TGetStrProc);
begin
  Controls.GetCursorValues(Proc);
end;

{$endif}
{$if declared(CursorToIdent)}
function CursorToIdent(Cursor: Longint; var Ident: string): Boolean;
begin
  Result := Controls.CursorToIdent(Cursor, Ident);
end;

{$endif}
{$if declared(IdentToCursor)}
function IdentToCursor(const Ident: string; var Cursor: Longint): Boolean;
begin
  Result := Controls.IdentToCursor(Ident, Cursor);
end;

{$endif}
{$if declared(CheckTransparentWindow)}
procedure CheckTransparentWindow(var Handle: TLCLHandle; var AWinControl: TWinControl);
begin
  Controls.CheckTransparentWindow(Handle, AWinControl);
end;

{$endif}
{$if declared(CheckMouseButtonDownUp)}
function CheckMouseButtonDownUp(const AWinHandle: TLCLHandle; const AWinControl: TWinControl; var LastMouse: TLastMouseInfo; const AMousePos: TPoint; const AButton: Byte; const AMouseDown: Boolean): Cardinal;
begin
  Result := Controls.CheckMouseButtonDownUp(AWinHandle, AWinControl, LastMouse, AMousePos, AButton, AMouseDown);
end;

{$endif}
{$if declared(GetKeyShiftState)}
function GetKeyShiftState: TShiftState;
begin
  Result := Controls.GetKeyShiftState;
end;

{$endif}
{$if declared(AdjustBorderSpace)}
procedure AdjustBorderSpace(var RemainingClientRect, CurBorderSpace: TRect; Left, Top, Right, Bottom: Integer);
begin
  Controls.AdjustBorderSpace(RemainingClientRect, CurBorderSpace, Left, Top, Right, Bottom);
end;

{$endif}
{$if declared(AdjustBorderSpace)}
procedure AdjustBorderSpace(var RemainingClientRect, CurBorderSpace: TRect; const Space: TRect);
begin
  Controls.AdjustBorderSpace(RemainingClientRect, CurBorderSpace, Space);
end;

{$endif}
{$if declared(IsColorDefault)}
function IsColorDefault(AControl: TControl): Boolean;
begin
  Result := Controls.IsColorDefault(AControl);
end;

{$endif}
{$if declared(BidiFlipAlignment)}
function BidiFlipAlignment(Alignment: TAlignment; Flip: Boolean = True): TAlignment;
begin
  Result := Controls.BidiFlipAlignment(Alignment, Flip);
end;

{$endif}
{$if declared(BidiFlipAnchors)}
function BidiFlipAnchors(Control: TControl; Flip: Boolean): TAnchors;
begin
  Result := Controls.BidiFlipAnchors(Control, Flip);
end;

{$endif}
{$if declared(BidiFlipRect)}
function BidiFlipRect(const Rect: TRect; const ParentRect: TRect; const Flip: Boolean): TRect;
begin
  Result := Controls.BidiFlipRect(Rect, ParentRect, Flip);
end;

{$endif}
{$if declared(ChangeBiDiModeAlignment)}
procedure ChangeBiDiModeAlignment(var Alignment: TAlignment);
begin
  Controls.ChangeBiDiModeAlignment(Alignment);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(a: TAnchorKind): string;
begin
  Result := Controls.DbgS(a);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(Anchors: TAnchors): string;
begin
  Result := Controls.DbgS(Anchors);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(a: TAlign): string;
begin
  Result := Controls.DbgS(a);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(a: TAnchorKind; Side: TAnchorSideReference): string;
begin
  Result := Controls.DbgS(a, Side);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(p: TControlAutoSizePhase): string;
begin
  Result := Controls.DbgS(p);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(Phases: TControlAutoSizePhases): string;
begin
  Result := Controls.DbgS(Phases);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(cst: TControlStyleType): string;
begin
  Result := Controls.DbgS(cst);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(cs: TControlStyle): string;
begin
  Result := Controls.DbgS(cs);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(fs: TFormStyle): string;
begin
  Result := Controls.DbgS(fs);
end;

{$endif}
{$if declared(CompareLazAccessibleObjectsByDataObject)}
function CompareLazAccessibleObjectsByDataObject(o1, o2: Pointer): Integer;
begin
  Result := Controls.CompareLazAccessibleObjectsByDataObject(o1, o2);
end;

{$endif}
{$if declared(CompareDataObjectWithLazAccessibleObject)}
function CompareDataObjectWithLazAccessibleObject(o, ao: Pointer): Integer;
begin
  Result := Controls.CompareDataObjectWithLazAccessibleObject(o, ao);
end;

{$endif}
end.
