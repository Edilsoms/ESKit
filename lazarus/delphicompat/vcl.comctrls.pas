{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.ComCtrls
  Gerado por tools/genvclcompat.py a partir de ComCtrls.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.ComCtrls;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  LCLProc, Graphics, Controls, Forms, Buttons, LazLoggerBase, ComCtrls;
type
{$if declared(THitTest)}
  THitTest = ComCtrls.THitTest;
{$endif}
{$if declared(THitTests)}
  THitTests = ComCtrls.THitTests;
{$endif}
{$if declared(TStatusPanelStyle)}
  TStatusPanelStyle = ComCtrls.TStatusPanelStyle;
{$endif}
{$if declared(TStatusPanelBevel)}
  TStatusPanelBevel = ComCtrls.TStatusPanelBevel;
{$endif}
{$if declared(TStatusBar)}
  TStatusBar = ComCtrls.TStatusBar;
{$endif}
{$if declared(TPanelPart)}
  TPanelPart = ComCtrls.TPanelPart;
{$endif}
{$if declared(TPanelParts)}
  TPanelParts = ComCtrls.TPanelParts;
{$endif}
{$if declared(TStatusPanelClass)}
  TStatusPanelClass = ComCtrls.TStatusPanelClass;
{$endif}
{$if declared(TStatusPanel)}
  TStatusPanel = ComCtrls.TStatusPanel;
{$endif}
{$if declared(TStatusPanels)}
  TStatusPanels = ComCtrls.TStatusPanels;
{$endif}
{$if declared(TSBCreatePanelClassEvent)}
  TSBCreatePanelClassEvent = ComCtrls.TSBCreatePanelClassEvent;
{$endif}
{$if declared(TDrawPanelEvent)}
  TDrawPanelEvent = ComCtrls.TDrawPanelEvent;
{$endif}
{$if declared(TPageFlag)}
  TPageFlag = ComCtrls.TPageFlag;
{$endif}
{$if declared(TPageFlags)}
  TPageFlags = ComCtrls.TPageFlags;
{$endif}
{$if declared(TCustomPage)}
  TCustomPage = ComCtrls.TCustomPage;
{$endif}
{$if declared(TCustomPageClass)}
  TCustomPageClass = ComCtrls.TCustomPageClass;
{$endif}
{$if declared(TCustomTabControl)}
  TCustomTabControl = ComCtrls.TCustomTabControl;
{$endif}
{$if declared(TNBBasePages)}
  TNBBasePages = ComCtrls.TNBBasePages;
{$endif}
{$if declared(TNBBasePagesClass)}
  TNBBasePagesClass = ComCtrls.TNBBasePagesClass;
{$endif}
{$if declared(TNBPages)}
  TNBPages = ComCtrls.TNBPages;
{$endif}
{$if declared(TNBNoPages)}
  TNBNoPages = ComCtrls.TNBNoPages;
{$endif}
{$if declared(TTabChangingEvent)}
  TTabChangingEvent = ComCtrls.TTabChangingEvent;
{$endif}
{$if declared(TTabPosition)}
  TTabPosition = ComCtrls.TTabPosition;
{$endif}
{$if declared(TTabStyle)}
  TTabStyle = ComCtrls.TTabStyle;
{$endif}
{$if declared(TTabGetImageEvent)}
  TTabGetImageEvent = ComCtrls.TTabGetImageEvent;
{$endif}
{$if declared(TCTabControlOption)}
  TCTabControlOption = ComCtrls.TCTabControlOption;
{$endif}
{$if declared(TCTabControlOptions)}
  TCTabControlOptions = ComCtrls.TCTabControlOptions;
{$endif}
{$if declared(TCTabControlCapability)}
  TCTabControlCapability = ComCtrls.TCTabControlCapability;
{$endif}
{$if declared(TCTabControlCapabilities)}
  TCTabControlCapabilities = ComCtrls.TCTabControlCapabilities;
{$endif}
{$if declared(TDrawTabEvent)}
  TDrawTabEvent = ComCtrls.TDrawTabEvent;
{$endif}
{$if declared(TPageControl)}
  TPageControl = ComCtrls.TPageControl;
{$endif}
{$if declared(TTabSheet)}
  TTabSheet = ComCtrls.TTabSheet;
{$endif}
{$if declared(TTabControl)}
  TTabControl = ComCtrls.TTabControl;
{$endif}
{$if declared(TTabControlStrings)}
  TTabControlStrings = ComCtrls.TTabControlStrings;
{$endif}
{$if declared(TNoteBookStringsTabControl)}
  TNoteBookStringsTabControl = ComCtrls.TNoteBookStringsTabControl;
{$endif}
{$if declared(TNoteBookStringsTabControlClass)}
  TNoteBookStringsTabControlClass = ComCtrls.TNoteBookStringsTabControlClass;
{$endif}
{$if declared(TTabControlNoteBookStrings)}
  TTabControlNoteBookStrings = ComCtrls.TTabControlNoteBookStrings;
{$endif}
{$if declared(TCustomDrawTarget)}
  TCustomDrawTarget = ComCtrls.TCustomDrawTarget;
{$endif}
{$if declared(TCustomDrawStage)}
  TCustomDrawStage = ComCtrls.TCustomDrawStage;
{$endif}
{$if declared(TCustomDrawStateFlag)}
  TCustomDrawStateFlag = ComCtrls.TCustomDrawStateFlag;
{$endif}
{$if declared(TCustomDrawState)}
  TCustomDrawState = ComCtrls.TCustomDrawState;
{$endif}
{$if declared(TCustomDrawResultFlag)}
  TCustomDrawResultFlag = ComCtrls.TCustomDrawResultFlag;
{$endif}
{$if declared(TCustomDrawResult)}
  TCustomDrawResult = ComCtrls.TCustomDrawResult;
{$endif}
{$if declared(TListItems)}
  TListItems = ComCtrls.TListItems;
{$endif}
{$if declared(TCustomListView)}
  TCustomListView = ComCtrls.TCustomListView;
{$endif}
{$if declared(TSortType)}
  TSortType = ComCtrls.TSortType;
{$endif}
{$if declared(TListItemState)}
  TListItemState = ComCtrls.TListItemState;
{$endif}
{$if declared(TListItemStates)}
  TListItemStates = ComCtrls.TListItemStates;
{$endif}
{$if declared(TListItemFlag)}
  TListItemFlag = ComCtrls.TListItemFlag;
{$endif}
{$if declared(TListItemFlags)}
  TListItemFlags = ComCtrls.TListItemFlags;
{$endif}
{$if declared(TDisplayCode)}
  TDisplayCode = ComCtrls.TDisplayCode;
{$endif}
{$if declared(TIconArrangement)}
  TIconArrangement = ComCtrls.TIconArrangement;
{$endif}
{$if declared(TIconOptions)}
  TIconOptions = ComCtrls.TIconOptions;
{$endif}
{$if declared(TListItem)}
  TListItem = ComCtrls.TListItem;
{$endif}
{$if declared(TListItemClass)}
  TListItemClass = ComCtrls.TListItemClass;
{$endif}
{$if declared(TOwnerDataListItem)}
  TOwnerDataListItem = ComCtrls.TOwnerDataListItem;
{$endif}
{$if declared(TListItemsEnumerator)}
  TListItemsEnumerator = ComCtrls.TListItemsEnumerator;
{$endif}
{$if declared(TListItemsFlag)}
  TListItemsFlag = ComCtrls.TListItemsFlag;
{$endif}
{$if declared(TListItemsFlags)}
  TListItemsFlags = ComCtrls.TListItemsFlags;
{$endif}
{$if declared(TOwnerDataListItems)}
  TOwnerDataListItems = ComCtrls.TOwnerDataListItems;
{$endif}
{$if declared(TWidth)}
  TWidth = ComCtrls.TWidth;
{$endif}
{$if declared(TSortIndicator)}
  TSortIndicator = ComCtrls.TSortIndicator;
{$endif}
{$if declared(TListColumn)}
  TListColumn = ComCtrls.TListColumn;
{$endif}
{$if declared(TListColumnClass)}
  TListColumnClass = ComCtrls.TListColumnClass;
{$endif}
{$if declared(TListColumns)}
  TListColumns = ComCtrls.TListColumns;
{$endif}
{$if declared(TItemChange)}
  TItemChange = ComCtrls.TItemChange;
{$endif}
{$if declared(TViewStyle)}
  TViewStyle = ComCtrls.TViewStyle;
{$endif}
{$if declared(TItemFind)}
  TItemFind = ComCtrls.TItemFind;
{$endif}
{$if declared(TSearchDirection)}
  TSearchDirection = ComCtrls.TSearchDirection;
{$endif}
{$if declared(TLVChangeEvent)}
  TLVChangeEvent = ComCtrls.TLVChangeEvent;
{$endif}
{$if declared(TLVChangingEvent)}
  TLVChangingEvent = ComCtrls.TLVChangingEvent;
{$endif}
{$if declared(TLVDataFindEvent)}
  TLVDataFindEvent = ComCtrls.TLVDataFindEvent;
{$endif}
{$if declared(TLVDataHintEvent)}
  TLVDataHintEvent = ComCtrls.TLVDataHintEvent;
{$endif}
{$if declared(TLVDataStateChangeEvent)}
  TLVDataStateChangeEvent = ComCtrls.TLVDataStateChangeEvent;
{$endif}
{$if declared(TLVColumnClickEvent)}
  TLVColumnClickEvent = ComCtrls.TLVColumnClickEvent;
{$endif}
{$if declared(TLVColumnRClickEvent)}
  TLVColumnRClickEvent = ComCtrls.TLVColumnRClickEvent;
{$endif}
{$if declared(TLVCompare)}
  TLVCompare = ComCtrls.TLVCompare;
{$endif}
{$if declared(TLVCompareEvent)}
  TLVCompareEvent = ComCtrls.TLVCompareEvent;
{$endif}
{$if declared(TLVDeletedEvent)}
  TLVDeletedEvent = ComCtrls.TLVDeletedEvent;
{$endif}
{$if declared(TLVEditingEvent)}
  TLVEditingEvent = ComCtrls.TLVEditingEvent;
{$endif}
{$if declared(TLVEditedEvent)}
  TLVEditedEvent = ComCtrls.TLVEditedEvent;
{$endif}
{$if declared(TLVCheckedItemEvent)}
  TLVCheckedItemEvent = ComCtrls.TLVCheckedItemEvent;
{$endif}
{$if declared(TLVSelectItemEvent)}
  TLVSelectItemEvent = ComCtrls.TLVSelectItemEvent;
{$endif}
{$if declared(TLVCustomDrawEvent)}
  TLVCustomDrawEvent = ComCtrls.TLVCustomDrawEvent;
{$endif}
{$if declared(TLVCustomDrawItemEvent)}
  TLVCustomDrawItemEvent = ComCtrls.TLVCustomDrawItemEvent;
{$endif}
{$if declared(TLVCustomDrawSubItemEvent)}
  TLVCustomDrawSubItemEvent = ComCtrls.TLVCustomDrawSubItemEvent;
{$endif}
{$if declared(TLVDrawItemEvent)}
  TLVDrawItemEvent = ComCtrls.TLVDrawItemEvent;
{$endif}
{$if declared(TLVAdvancedCustomDrawEvent)}
  TLVAdvancedCustomDrawEvent = ComCtrls.TLVAdvancedCustomDrawEvent;
{$endif}
{$if declared(TLVAdvancedCustomDrawItemEvent)}
  TLVAdvancedCustomDrawItemEvent = ComCtrls.TLVAdvancedCustomDrawItemEvent;
{$endif}
{$if declared(TLVAdvancedCustomDrawSubItemEvent)}
  TLVAdvancedCustomDrawSubItemEvent = ComCtrls.TLVAdvancedCustomDrawSubItemEvent;
{$endif}
{$if declared(TLVCreateItemClassEvent)}
  TLVCreateItemClassEvent = ComCtrls.TLVCreateItemClassEvent;
{$endif}
{$if declared(TListViewProperty)}
  TListViewProperty = ComCtrls.TListViewProperty;
{$endif}
{$if declared(TListViewProperties)}
  TListViewProperties = ComCtrls.TListViewProperties;
{$endif}
{$if declared(TListViewImageList)}
  TListViewImageList = ComCtrls.TListViewImageList;
{$endif}
{$if declared(TListHotTrackStyle)}
  TListHotTrackStyle = ComCtrls.TListHotTrackStyle;
{$endif}
{$if declared(TListHotTrackStyles)}
  TListHotTrackStyles = ComCtrls.TListHotTrackStyles;
{$endif}
{$if declared(TListViewFlag)}
  TListViewFlag = ComCtrls.TListViewFlag;
{$endif}
{$if declared(TListViewFlags)}
  TListViewFlags = ComCtrls.TListViewFlags;
{$endif}
{$if declared(TSortDirection)}
  TSortDirection = ComCtrls.TSortDirection;
{$endif}
{$if declared(TCustomListViewEditor)}
  TCustomListViewEditor = ComCtrls.TCustomListViewEditor;
{$endif}
{$if declared(TListView)}
  TListView = ComCtrls.TListView;
{$endif}
{$if declared(TProgressBarOrientation)}
  TProgressBarOrientation = ComCtrls.TProgressBarOrientation;
{$endif}
{$if declared(TProgressBarStyle)}
  TProgressBarStyle = ComCtrls.TProgressBarStyle;
{$endif}
{$if declared(TProgressBarState)}
  TProgressBarState = ComCtrls.TProgressBarState;
{$endif}
{$if declared(TCustomProgressBar)}
  TCustomProgressBar = ComCtrls.TCustomProgressBar;
{$endif}
{$if declared(TProgressBar)}
  TProgressBar = ComCtrls.TProgressBar;
{$endif}
{$if declared(TUDAlignButton)}
  TUDAlignButton = ComCtrls.TUDAlignButton;
{$endif}
{$if declared(TUDOrientation)}
  TUDOrientation = ComCtrls.TUDOrientation;
{$endif}
{$if declared(TUpDownDirection)}
  TUpDownDirection = ComCtrls.TUpDownDirection;
{$endif}
{$if declared(TUDBtnType)}
  TUDBtnType = ComCtrls.TUDBtnType;
{$endif}
{$if declared(TUDClickEvent)}
  TUDClickEvent = ComCtrls.TUDClickEvent;
{$endif}
{$if declared(TUDChangingEvent)}
  TUDChangingEvent = ComCtrls.TUDChangingEvent;
{$endif}
{$if declared(TUDChangingEventEx)}
  TUDChangingEventEx = ComCtrls.TUDChangingEventEx;
{$endif}
{$if declared(TCustomUpDown)}
  TCustomUpDown = ComCtrls.TCustomUpDown;
{$endif}
{$if declared(TUpDown)}
  TUpDown = ComCtrls.TUpDown;
{$endif}
{$if declared(TToolButtonStyle)}
  TToolButtonStyle = ComCtrls.TToolButtonStyle;
{$endif}
{$if declared(TToolButtonFlag)}
  TToolButtonFlag = ComCtrls.TToolButtonFlag;
{$endif}
{$if declared(TToolButtonFlags)}
  TToolButtonFlags = ComCtrls.TToolButtonFlags;
{$endif}
{$if declared(TToolButtonActionLink)}
  TToolButtonActionLink = ComCtrls.TToolButtonActionLink;
{$endif}
{$if declared(TToolButtonActionLinkClass)}
  TToolButtonActionLinkClass = ComCtrls.TToolButtonActionLinkClass;
{$endif}
{$if declared(TToolBar)}
  TToolBar = ComCtrls.TToolBar;
{$endif}
{$if declared(TToolButton)}
  TToolButton = ComCtrls.TToolButton;
{$endif}
{$if declared(TToolBarEnumerator)}
  TToolBarEnumerator = ComCtrls.TToolBarEnumerator;
{$endif}
{$if declared(TToolBarOnPaintButton)}
  TToolBarOnPaintButton = ComCtrls.TToolBarOnPaintButton;
{$endif}
{$if declared(TToolBarOrientation)}
  TToolBarOrientation = ComCtrls.TToolBarOrientation;
{$endif}
{$if declared(TToolBarFlag)}
  TToolBarFlag = ComCtrls.TToolBarFlag;
{$endif}
{$if declared(TToolBarFlags)}
  TToolBarFlags = ComCtrls.TToolBarFlags;
{$endif}
{$if declared(TGrabStyle)}
  TGrabStyle = ComCtrls.TGrabStyle;
{$endif}
{$if declared(TDragBand)}
  TDragBand = ComCtrls.TDragBand;
{$endif}
{$if declared(TCustomCoolBar)}
  TCustomCoolBar = ComCtrls.TCustomCoolBar;
{$endif}
{$if declared(TCoolBand)}
  TCoolBand = ComCtrls.TCoolBand;
{$endif}
{$if declared(TCoolBands)}
  TCoolBands = ComCtrls.TCoolBands;
{$endif}
{$if declared(TCoolBandMaximize)}
  TCoolBandMaximize = ComCtrls.TCoolBandMaximize;
{$endif}
{$if declared(TCoolBar)}
  TCoolBar = ComCtrls.TCoolBar;
{$endif}
{$if declared(TTrackBarOrientation)}
  TTrackBarOrientation = ComCtrls.TTrackBarOrientation;
{$endif}
{$if declared(TTickMark)}
  TTickMark = ComCtrls.TTickMark;
{$endif}
{$if declared(TTickStyle)}
  TTickStyle = ComCtrls.TTickStyle;
{$endif}
{$if declared(TTrackBarScalePos)}
  TTrackBarScalePos = ComCtrls.TTrackBarScalePos;
{$endif}
{$if declared(TCustomTrackBar)}
  TCustomTrackBar = ComCtrls.TCustomTrackBar;
{$endif}
{$if declared(TTrackBar)}
  TTrackBar = ComCtrls.TTrackBar;
{$endif}
{$if declared(TCustomTreeView)}
  TCustomTreeView = ComCtrls.TCustomTreeView;
{$endif}
{$if declared(TTreeNodes)}
  TTreeNodes = ComCtrls.TTreeNodes;
{$endif}
{$if declared(TTreeNode)}
  TTreeNode = ComCtrls.TTreeNode;
{$endif}
{$if declared(TTreeNodeClass)}
  TTreeNodeClass = ComCtrls.TTreeNodeClass;
{$endif}
{$if declared(TNodeState)}
  TNodeState = ComCtrls.TNodeState;
{$endif}
{$if declared(TNodeStates)}
  TNodeStates = ComCtrls.TNodeStates;
{$endif}
{$if declared(TNodeAttachMode)}
  TNodeAttachMode = ComCtrls.TNodeAttachMode;
{$endif}
{$if declared(TAddMode)}
  TAddMode = ComCtrls.TAddMode;
{$endif}
{$if declared(TMultiSelectStyles)}
  TMultiSelectStyles = ComCtrls.TMultiSelectStyles;
{$endif}
{$if declared(TMultiSelectStyle)}
  TMultiSelectStyle = ComCtrls.TMultiSelectStyle;
{$endif}
{$if declared(TTreeNodeArray)}
  TTreeNodeArray = ComCtrls.TTreeNodeArray;
{$endif}
{$if declared(ETreeNodeError)}
  ETreeNodeError = ComCtrls.ETreeNodeError;
{$endif}
{$if declared(ETreeViewError)}
  ETreeViewError = ComCtrls.ETreeViewError;
{$endif}
{$if declared(TTreeNodeChangeReason)}
  TTreeNodeChangeReason = ComCtrls.TTreeNodeChangeReason;
{$endif}
{$if declared(TTVChangingEvent)}
  TTVChangingEvent = ComCtrls.TTVChangingEvent;
{$endif}
{$if declared(TTVChangedEvent)}
  TTVChangedEvent = ComCtrls.TTVChangedEvent;
{$endif}
{$if declared(TTVNodeChangedEvent)}
  TTVNodeChangedEvent = ComCtrls.TTVNodeChangedEvent;
{$endif}
{$if declared(TTVEditingEvent)}
  TTVEditingEvent = ComCtrls.TTVEditingEvent;
{$endif}
{$if declared(TTVEditingEndEvent)}
  TTVEditingEndEvent = ComCtrls.TTVEditingEndEvent;
{$endif}
{$if declared(TTVEditedEvent)}
  TTVEditedEvent = ComCtrls.TTVEditedEvent;
{$endif}
{$if declared(TTVExpandingEvent)}
  TTVExpandingEvent = ComCtrls.TTVExpandingEvent;
{$endif}
{$if declared(TTVCollapsingEvent)}
  TTVCollapsingEvent = ComCtrls.TTVCollapsingEvent;
{$endif}
{$if declared(TTVExpandedEvent)}
  TTVExpandedEvent = ComCtrls.TTVExpandedEvent;
{$endif}
{$if declared(TTVCompareEvent)}
  TTVCompareEvent = ComCtrls.TTVCompareEvent;
{$endif}
{$if declared(TTVCustomDrawEvent)}
  TTVCustomDrawEvent = ComCtrls.TTVCustomDrawEvent;
{$endif}
{$if declared(TTVCustomDrawItemEvent)}
  TTVCustomDrawItemEvent = ComCtrls.TTVCustomDrawItemEvent;
{$endif}
{$if declared(TTVCustomDrawArrowEvent)}
  TTVCustomDrawArrowEvent = ComCtrls.TTVCustomDrawArrowEvent;
{$endif}
{$if declared(TTVAdvancedCustomDrawEvent)}
  TTVAdvancedCustomDrawEvent = ComCtrls.TTVAdvancedCustomDrawEvent;
{$endif}
{$if declared(TTVAdvancedCustomDrawItemEvent)}
  TTVAdvancedCustomDrawItemEvent = ComCtrls.TTVAdvancedCustomDrawItemEvent;
{$endif}
{$if declared(TTVCustomCreateNodeEvent)}
  TTVCustomCreateNodeEvent = ComCtrls.TTVCustomCreateNodeEvent;
{$endif}
{$if declared(TTVCreateNodeClassEvent)}
  TTVCreateNodeClassEvent = ComCtrls.TTVCreateNodeClassEvent;
{$endif}
{$if declared(TTVHasChildrenEvent)}
  TTVHasChildrenEvent = ComCtrls.TTVHasChildrenEvent;
{$endif}
{$if declared(TTreeNodeCompare)}
  TTreeNodeCompare = ComCtrls.TTreeNodeCompare;
{$endif}
{$if declared(TOldTreeNodeInfo)}
  TOldTreeNodeInfo = ComCtrls.TOldTreeNodeInfo;
{$endif}
{$if declared(TTreeNodeInfo)}
  TTreeNodeInfo = ComCtrls.TTreeNodeInfo;
{$endif}
{$if declared(PDelphiNodeInfo)}
  PDelphiNodeInfo = ComCtrls.PDelphiNodeInfo;
{$endif}
{$if declared(TDelphiNodeInfo)}
  TDelphiNodeInfo = ComCtrls.TDelphiNodeInfo;
{$endif}
{$if declared(TDelphiNodeDataInfo)}
  TDelphiNodeDataInfo = ComCtrls.TDelphiNodeDataInfo;
{$endif}
{$if declared(TTreeNodesEnumerator)}
  TTreeNodesEnumerator = ComCtrls.TTreeNodesEnumerator;
{$endif}
{$if declared(PNodeCache)}
  PNodeCache = ComCtrls.PNodeCache;
{$endif}
{$if declared(TNodeCache)}
  TNodeCache = ComCtrls.TNodeCache;
{$endif}
{$if declared(TTreeViewState)}
  TTreeViewState = ComCtrls.TTreeViewState;
{$endif}
{$if declared(TTreeViewStates)}
  TTreeViewStates = ComCtrls.TTreeViewStates;
{$endif}
{$if declared(TTreeViewOption)}
  TTreeViewOption = ComCtrls.TTreeViewOption;
{$endif}
{$if declared(TTreeViewOptions)}
  TTreeViewOptions = ComCtrls.TTreeViewOptions;
{$endif}
{$if declared(TTreeViewExpandSignType)}
  TTreeViewExpandSignType = ComCtrls.TTreeViewExpandSignType;
{$endif}
{$if declared(TTreeViewInsertMarkType)}
  TTreeViewInsertMarkType = ComCtrls.TTreeViewInsertMarkType;
{$endif}
{$if declared(THideSelectionMode)}
  THideSelectionMode = ComCtrls.THideSelectionMode;
{$endif}
{$if declared(TOnDragOverTreeView)}
  TOnDragOverTreeView = ComCtrls.TOnDragOverTreeView;
{$endif}
{$if declared(TTreeView)}
  TTreeView = ComCtrls.TTreeView;
{$endif}
{$if declared(TTVGetNodeText)}
  TTVGetNodeText = ComCtrls.TTVGetNodeText;
{$endif}
{$if declared(TTreeNodeExpandedState)}
  TTreeNodeExpandedState = ComCtrls.TTreeNodeExpandedState;
{$endif}
{$if declared(TCustomHeaderControl)}
  TCustomHeaderControl = ComCtrls.TCustomHeaderControl;
{$endif}
{$if declared(THeaderSectionState)}
  THeaderSectionState = ComCtrls.THeaderSectionState;
{$endif}
{$if declared(THeaderSection)}
  THeaderSection = ComCtrls.THeaderSection;
{$endif}
{$if declared(THeaderSectionClass)}
  THeaderSectionClass = ComCtrls.THeaderSectionClass;
{$endif}
{$if declared(THeaderSections)}
  THeaderSections = ComCtrls.THeaderSections;
{$endif}
{$if declared(TSectionTrackState)}
  TSectionTrackState = ComCtrls.TSectionTrackState;
{$endif}
{$if declared(TCustomSectionTrackEvent)}
  TCustomSectionTrackEvent = ComCtrls.TCustomSectionTrackEvent;
{$endif}
{$if declared(TSectionDragEvent)}
  TSectionDragEvent = ComCtrls.TSectionDragEvent;
{$endif}
{$if declared(TCustomSectionNotifyEvent)}
  TCustomSectionNotifyEvent = ComCtrls.TCustomSectionNotifyEvent;
{$endif}
{$if declared(TCustomHCCreateSectionClassEvent)}
  TCustomHCCreateSectionClassEvent = ComCtrls.TCustomHCCreateSectionClassEvent;
{$endif}
{$if declared(THeaderControl)}
  THeaderControl = ComCtrls.THeaderControl;
{$endif}
{$if declared(TLVInsertEvent)}
  TLVInsertEvent = ComCtrls.TLVInsertEvent;
{$endif}
{$if declared(TLVDataEvent)}
  TLVDataEvent = ComCtrls.TLVDataEvent;
{$endif}
const
{$if declared(htAbove)}
  htAbove = ComCtrls.htAbove;
{$endif}
{$if declared(htBelow)}
  htBelow = ComCtrls.htBelow;
{$endif}
{$if declared(htNowhere)}
  htNowhere = ComCtrls.htNowhere;
{$endif}
{$if declared(htOnItem)}
  htOnItem = ComCtrls.htOnItem;
{$endif}
{$if declared(htOnButton)}
  htOnButton = ComCtrls.htOnButton;
{$endif}
{$if declared(htOnIcon)}
  htOnIcon = ComCtrls.htOnIcon;
{$endif}
{$if declared(htOnIndent)}
  htOnIndent = ComCtrls.htOnIndent;
{$endif}
{$if declared(htOnLabel)}
  htOnLabel = ComCtrls.htOnLabel;
{$endif}
{$if declared(htOnRight)}
  htOnRight = ComCtrls.htOnRight;
{$endif}
{$if declared(htOnStateIcon)}
  htOnStateIcon = ComCtrls.htOnStateIcon;
{$endif}
{$if declared(htToLeft)}
  htToLeft = ComCtrls.htToLeft;
{$endif}
{$if declared(htToRight)}
  htToRight = ComCtrls.htToRight;
{$endif}
{$if declared(psText)}
  psText = ComCtrls.psText;
{$endif}
{$if declared(psOwnerDraw)}
  psOwnerDraw = ComCtrls.psOwnerDraw;
{$endif}
{$if declared(pbNone)}
  pbNone = ComCtrls.pbNone;
{$endif}
{$if declared(pbLowered)}
  pbLowered = ComCtrls.pbLowered;
{$endif}
{$if declared(pbRaised)}
  pbRaised = ComCtrls.pbRaised;
{$endif}
{$if declared(ppText)}
  ppText = ComCtrls.ppText;
{$endif}
{$if declared(ppBorder)}
  ppBorder = ComCtrls.ppBorder;
{$endif}
{$if declared(ppWidth)}
  ppWidth = ComCtrls.ppWidth;
{$endif}
{$if declared(pfAdded)}
  pfAdded = ComCtrls.pfAdded;
{$endif}
{$if declared(pfAdding)}
  pfAdding = ComCtrls.pfAdding;
{$endif}
{$if declared(pfRemoving)}
  pfRemoving = ComCtrls.pfRemoving;
{$endif}
{$if declared(pfInserting)}
  pfInserting = ComCtrls.pfInserting;
{$endif}
{$if declared(tpTop)}
  tpTop = ComCtrls.tpTop;
{$endif}
{$if declared(tpBottom)}
  tpBottom = ComCtrls.tpBottom;
{$endif}
{$if declared(tpLeft)}
  tpLeft = ComCtrls.tpLeft;
{$endif}
{$if declared(tpRight)}
  tpRight = ComCtrls.tpRight;
{$endif}
{$if declared(tsTabs)}
  tsTabs = ComCtrls.tsTabs;
{$endif}
{$if declared(tsButtons)}
  tsButtons = ComCtrls.tsButtons;
{$endif}
{$if declared(tsFlatButtons)}
  tsFlatButtons = ComCtrls.tsFlatButtons;
{$endif}
{$if declared(nboShowCloseButtons)}
  nboShowCloseButtons = ComCtrls.nboShowCloseButtons;
{$endif}
{$if declared(nboMultiLine)}
  nboMultiLine = ComCtrls.nboMultiLine;
{$endif}
{$if declared(nboHidePageListPopup)}
  nboHidePageListPopup = ComCtrls.nboHidePageListPopup;
{$endif}
{$if declared(nboKeyboardTabSwitch)}
  nboKeyboardTabSwitch = ComCtrls.nboKeyboardTabSwitch;
{$endif}
{$if declared(nboShowAddTabButton)}
  nboShowAddTabButton = ComCtrls.nboShowAddTabButton;
{$endif}
{$if declared(nboDoChangeOnSetIndex)}
  nboDoChangeOnSetIndex = ComCtrls.nboDoChangeOnSetIndex;
{$endif}
{$if declared(nbcShowCloseButtons)}
  nbcShowCloseButtons = ComCtrls.nbcShowCloseButtons;
{$endif}
{$if declared(nbcMultiLine)}
  nbcMultiLine = ComCtrls.nbcMultiLine;
{$endif}
{$if declared(nbcPageListPopup)}
  nbcPageListPopup = ComCtrls.nbcPageListPopup;
{$endif}
{$if declared(nbcShowAddTabButton)}
  nbcShowAddTabButton = ComCtrls.nbcShowAddTabButton;
{$endif}
{$if declared(nbcTabsSizeable)}
  nbcTabsSizeable = ComCtrls.nbcTabsSizeable;
{$endif}
{$if declared(dtControl)}
  dtControl = ComCtrls.dtControl;
{$endif}
{$if declared(dtItem)}
  dtItem = ComCtrls.dtItem;
{$endif}
{$if declared(dtSubItem)}
  dtSubItem = ComCtrls.dtSubItem;
{$endif}
{$if declared(cdPrePaint)}
  cdPrePaint = ComCtrls.cdPrePaint;
{$endif}
{$if declared(cdPostPaint)}
  cdPostPaint = ComCtrls.cdPostPaint;
{$endif}
{$if declared(cdPreErase)}
  cdPreErase = ComCtrls.cdPreErase;
{$endif}
{$if declared(cdPostErase)}
  cdPostErase = ComCtrls.cdPostErase;
{$endif}
{$if declared(cdsSelected)}
  cdsSelected = ComCtrls.cdsSelected;
{$endif}
{$if declared(cdsGrayed)}
  cdsGrayed = ComCtrls.cdsGrayed;
{$endif}
{$if declared(cdsDisabled)}
  cdsDisabled = ComCtrls.cdsDisabled;
{$endif}
{$if declared(cdsChecked)}
  cdsChecked = ComCtrls.cdsChecked;
{$endif}
{$if declared(cdsFocused)}
  cdsFocused = ComCtrls.cdsFocused;
{$endif}
{$if declared(cdsDefault)}
  cdsDefault = ComCtrls.cdsDefault;
{$endif}
{$if declared(cdsHot)}
  cdsHot = ComCtrls.cdsHot;
{$endif}
{$if declared(cdsMarked)}
  cdsMarked = ComCtrls.cdsMarked;
{$endif}
{$if declared(cdsIndeterminate)}
  cdsIndeterminate = ComCtrls.cdsIndeterminate;
{$endif}
{$if declared(cdrSkipDefault)}
  cdrSkipDefault = ComCtrls.cdrSkipDefault;
{$endif}
{$if declared(cdrNotifyPostpaint)}
  cdrNotifyPostpaint = ComCtrls.cdrNotifyPostpaint;
{$endif}
{$if declared(cdrNotifyItemdraw)}
  cdrNotifyItemdraw = ComCtrls.cdrNotifyItemdraw;
{$endif}
{$if declared(cdrNotifySubitemdraw)}
  cdrNotifySubitemdraw = ComCtrls.cdrNotifySubitemdraw;
{$endif}
{$if declared(cdrNotifyPosterase)}
  cdrNotifyPosterase = ComCtrls.cdrNotifyPosterase;
{$endif}
{$if declared(cdrNotifyItemerase)}
  cdrNotifyItemerase = ComCtrls.cdrNotifyItemerase;
{$endif}
{$if declared(stNone)}
  stNone = ComCtrls.stNone;
{$endif}
{$if declared(stData)}
  stData = ComCtrls.stData;
{$endif}
{$if declared(stText)}
  stText = ComCtrls.stText;
{$endif}
{$if declared(stBoth)}
  stBoth = ComCtrls.stBoth;
{$endif}
{$if declared(lisCut)}
  lisCut = ComCtrls.lisCut;
{$endif}
{$if declared(lisDropTarget)}
  lisDropTarget = ComCtrls.lisDropTarget;
{$endif}
{$if declared(lisFocused)}
  lisFocused = ComCtrls.lisFocused;
{$endif}
{$if declared(lisSelected)}
  lisSelected = ComCtrls.lisSelected;
{$endif}
{$if declared(lifDestroying)}
  lifDestroying = ComCtrls.lifDestroying;
{$endif}
{$if declared(lifCreated)}
  lifCreated = ComCtrls.lifCreated;
{$endif}
{$if declared(drBounds)}
  drBounds = ComCtrls.drBounds;
{$endif}
{$if declared(drIcon)}
  drIcon = ComCtrls.drIcon;
{$endif}
{$if declared(drLabel)}
  drLabel = ComCtrls.drLabel;
{$endif}
{$if declared(drSelectBounds)}
  drSelectBounds = ComCtrls.drSelectBounds;
{$endif}
{$if declared(iaTop)}
  iaTop = ComCtrls.iaTop;
{$endif}
{$if declared(iaLeft)}
  iaLeft = ComCtrls.iaLeft;
{$endif}
{$if declared(lisfWSItemsCreated)}
  lisfWSItemsCreated = ComCtrls.lisfWSItemsCreated;
{$endif}
{$if declared(siNone)}
  siNone = ComCtrls.siNone;
{$endif}
{$if declared(siAscending)}
  siAscending = ComCtrls.siAscending;
{$endif}
{$if declared(siDescending)}
  siDescending = ComCtrls.siDescending;
{$endif}
{$if declared(ctText)}
  ctText = ComCtrls.ctText;
{$endif}
{$if declared(ctImage)}
  ctImage = ComCtrls.ctImage;
{$endif}
{$if declared(ctState)}
  ctState = ComCtrls.ctState;
{$endif}
{$if declared(vsIcon)}
  vsIcon = ComCtrls.vsIcon;
{$endif}
{$if declared(vsSmallIcon)}
  vsSmallIcon = ComCtrls.vsSmallIcon;
{$endif}
{$if declared(vsList)}
  vsList = ComCtrls.vsList;
{$endif}
{$if declared(vsReport)}
  vsReport = ComCtrls.vsReport;
{$endif}
{$if declared(ifData)}
  ifData = ComCtrls.ifData;
{$endif}
{$if declared(ifPartialString)}
  ifPartialString = ComCtrls.ifPartialString;
{$endif}
{$if declared(ifExactString)}
  ifExactString = ComCtrls.ifExactString;
{$endif}
{$if declared(ifNearest)}
  ifNearest = ComCtrls.ifNearest;
{$endif}
{$if declared(sdLeft)}
  sdLeft = ComCtrls.sdLeft;
{$endif}
{$if declared(sdRight)}
  sdRight = ComCtrls.sdRight;
{$endif}
{$if declared(sdAbove)}
  sdAbove = ComCtrls.sdAbove;
{$endif}
{$if declared(sdBelow)}
  sdBelow = ComCtrls.sdBelow;
{$endif}
{$if declared(sdAll)}
  sdAll = ComCtrls.sdAll;
{$endif}
{$if declared(lvpAutoArrange)}
  lvpAutoArrange = ComCtrls.lvpAutoArrange;
{$endif}
{$if declared(lvpCheckboxes)}
  lvpCheckboxes = ComCtrls.lvpCheckboxes;
{$endif}
{$if declared(lvpColumnClick)}
  lvpColumnClick = ComCtrls.lvpColumnClick;
{$endif}
{$if declared(lvpFlatScrollBars)}
  lvpFlatScrollBars = ComCtrls.lvpFlatScrollBars;
{$endif}
{$if declared(lvpFullDrag)}
  lvpFullDrag = ComCtrls.lvpFullDrag;
{$endif}
{$if declared(lvpGridLines)}
  lvpGridLines = ComCtrls.lvpGridLines;
{$endif}
{$if declared(lvpHideSelection)}
  lvpHideSelection = ComCtrls.lvpHideSelection;
{$endif}
{$if declared(lvpHotTrack)}
  lvpHotTrack = ComCtrls.lvpHotTrack;
{$endif}
{$if declared(lvpMultiSelect)}
  lvpMultiSelect = ComCtrls.lvpMultiSelect;
{$endif}
{$if declared(lvpOwnerDraw)}
  lvpOwnerDraw = ComCtrls.lvpOwnerDraw;
{$endif}
{$if declared(lvpReadOnly)}
  lvpReadOnly = ComCtrls.lvpReadOnly;
{$endif}
{$if declared(lvpRowSelect)}
  lvpRowSelect = ComCtrls.lvpRowSelect;
{$endif}
{$if declared(lvpShowColumnHeaders)}
  lvpShowColumnHeaders = ComCtrls.lvpShowColumnHeaders;
{$endif}
{$if declared(lvpShowWorkAreas)}
  lvpShowWorkAreas = ComCtrls.lvpShowWorkAreas;
{$endif}
{$if declared(lvpWrapText)}
  lvpWrapText = ComCtrls.lvpWrapText;
{$endif}
{$if declared(lvpToolTips)}
  lvpToolTips = ComCtrls.lvpToolTips;
{$endif}
{$if declared(lvilSmall)}
  lvilSmall = ComCtrls.lvilSmall;
{$endif}
{$if declared(lvilLarge)}
  lvilLarge = ComCtrls.lvilLarge;
{$endif}
{$if declared(lvilState)}
  lvilState = ComCtrls.lvilState;
{$endif}
{$if declared(htHandPoint)}
  htHandPoint = ComCtrls.htHandPoint;
{$endif}
{$if declared(htUnderlineCold)}
  htUnderlineCold = ComCtrls.htUnderlineCold;
{$endif}
{$if declared(htUnderlineHot)}
  htUnderlineHot = ComCtrls.htUnderlineHot;
{$endif}
{$if declared(lffSelectedValid)}
  lffSelectedValid = ComCtrls.lffSelectedValid;
{$endif}
{$if declared(lffItemsMoving)}
  lffItemsMoving = ComCtrls.lffItemsMoving;
{$endif}
{$if declared(lffItemsSorting)}
  lffItemsSorting = ComCtrls.lffItemsSorting;
{$endif}
{$if declared(lffPreparingSorting)}
  lffPreparingSorting = ComCtrls.lffPreparingSorting;
{$endif}
{$if declared(sdAscending)}
  sdAscending = ComCtrls.sdAscending;
{$endif}
{$if declared(sdDescending)}
  sdDescending = ComCtrls.sdDescending;
{$endif}
{$if declared(pbHorizontal)}
  pbHorizontal = ComCtrls.pbHorizontal;
{$endif}
{$if declared(pbVertical)}
  pbVertical = ComCtrls.pbVertical;
{$endif}
{$if declared(pbRightToLeft)}
  pbRightToLeft = ComCtrls.pbRightToLeft;
{$endif}
{$if declared(pbTopDown)}
  pbTopDown = ComCtrls.pbTopDown;
{$endif}
{$if declared(pbstNormal)}
  pbstNormal = ComCtrls.pbstNormal;
{$endif}
{$if declared(pbstMarquee)}
  pbstMarquee = ComCtrls.pbstMarquee;
{$endif}
{$if declared(pbsNormal)}
  pbsNormal = ComCtrls.pbsNormal;
{$endif}
{$if declared(pbsError)}
  pbsError = ComCtrls.pbsError;
{$endif}
{$if declared(pbsPaused)}
  pbsPaused = ComCtrls.pbsPaused;
{$endif}
{$if declared(udLeft)}
  udLeft = ComCtrls.udLeft;
{$endif}
{$if declared(udRight)}
  udRight = ComCtrls.udRight;
{$endif}
{$if declared(udTop)}
  udTop = ComCtrls.udTop;
{$endif}
{$if declared(udBottom)}
  udBottom = ComCtrls.udBottom;
{$endif}
{$if declared(udHorizontal)}
  udHorizontal = ComCtrls.udHorizontal;
{$endif}
{$if declared(udVertical)}
  udVertical = ComCtrls.udVertical;
{$endif}
{$if declared(updNone)}
  updNone = ComCtrls.updNone;
{$endif}
{$if declared(updUp)}
  updUp = ComCtrls.updUp;
{$endif}
{$if declared(updDown)}
  updDown = ComCtrls.updDown;
{$endif}
{$if declared(btNext)}
  btNext = ComCtrls.btNext;
{$endif}
{$if declared(btPrev)}
  btPrev = ComCtrls.btPrev;
{$endif}
{$if declared(tbsButton)}
  tbsButton = ComCtrls.tbsButton;
{$endif}
{$if declared(tbsCheck)}
  tbsCheck = ComCtrls.tbsCheck;
{$endif}
{$if declared(tbsDropDown)}
  tbsDropDown = ComCtrls.tbsDropDown;
{$endif}
{$if declared(tbsSeparator)}
  tbsSeparator = ComCtrls.tbsSeparator;
{$endif}
{$if declared(tbsDivider)}
  tbsDivider = ComCtrls.tbsDivider;
{$endif}
{$if declared(tbsButtonDrop)}
  tbsButtonDrop = ComCtrls.tbsButtonDrop;
{$endif}
{$if declared(tbfPressed)}
  tbfPressed = ComCtrls.tbfPressed;
{$endif}
{$if declared(tbfArrowPressed)}
  tbfArrowPressed = ComCtrls.tbfArrowPressed;
{$endif}
{$if declared(tbfMouseInArrow)}
  tbfMouseInArrow = ComCtrls.tbfMouseInArrow;
{$endif}
{$if declared(tbfDropDownMenuShown)}
  tbfDropDownMenuShown = ComCtrls.tbfDropDownMenuShown;
{$endif}
{$if declared(tboAutomatic)}
  tboAutomatic = ComCtrls.tboAutomatic;
{$endif}
{$if declared(tboHorizontal)}
  tboHorizontal = ComCtrls.tboHorizontal;
{$endif}
{$if declared(tboVertical)}
  tboVertical = ComCtrls.tboVertical;
{$endif}
{$if declared(tbfUpdateVisibleBarNeeded)}
  tbfUpdateVisibleBarNeeded = ComCtrls.tbfUpdateVisibleBarNeeded;
{$endif}
{$if declared(tbfPlacingControls)}
  tbfPlacingControls = ComCtrls.tbfPlacingControls;
{$endif}
{$if declared(gsSimple)}
  gsSimple = ComCtrls.gsSimple;
{$endif}
{$if declared(gsDouble)}
  gsDouble = ComCtrls.gsDouble;
{$endif}
{$if declared(gsHorLines)}
  gsHorLines = ComCtrls.gsHorLines;
{$endif}
{$if declared(gsVerLines)}
  gsVerLines = ComCtrls.gsVerLines;
{$endif}
{$if declared(gsGripper)}
  gsGripper = ComCtrls.gsGripper;
{$endif}
{$if declared(gsButton)}
  gsButton = ComCtrls.gsButton;
{$endif}
{$if declared(dbNone)}
  dbNone = ComCtrls.dbNone;
{$endif}
{$if declared(dbMove)}
  dbMove = ComCtrls.dbMove;
{$endif}
{$if declared(dbResize)}
  dbResize = ComCtrls.dbResize;
{$endif}
{$if declared(bmNone)}
  bmNone = ComCtrls.bmNone;
{$endif}
{$if declared(bmClick)}
  bmClick = ComCtrls.bmClick;
{$endif}
{$if declared(bmDblClick)}
  bmDblClick = ComCtrls.bmDblClick;
{$endif}
{$if declared(trHorizontal)}
  trHorizontal = ComCtrls.trHorizontal;
{$endif}
{$if declared(trVertical)}
  trVertical = ComCtrls.trVertical;
{$endif}
{$if declared(tmBottomRight)}
  tmBottomRight = ComCtrls.tmBottomRight;
{$endif}
{$if declared(tmTopLeft)}
  tmTopLeft = ComCtrls.tmTopLeft;
{$endif}
{$if declared(tmBoth)}
  tmBoth = ComCtrls.tmBoth;
{$endif}
{$if declared(tsNone)}
  tsNone = ComCtrls.tsNone;
{$endif}
{$if declared(tsAuto)}
  tsAuto = ComCtrls.tsAuto;
{$endif}
{$if declared(tsManual)}
  tsManual = ComCtrls.tsManual;
{$endif}
{$if declared(trLeft)}
  trLeft = ComCtrls.trLeft;
{$endif}
{$if declared(trRight)}
  trRight = ComCtrls.trRight;
{$endif}
{$if declared(trTop)}
  trTop = ComCtrls.trTop;
{$endif}
{$if declared(trBottom)}
  trBottom = ComCtrls.trBottom;
{$endif}
{$if declared(nsCut)}
  nsCut = ComCtrls.nsCut;
{$endif}
{$if declared(nsDropHilited)}
  nsDropHilited = ComCtrls.nsDropHilited;
{$endif}
{$if declared(nsFocused)}
  nsFocused = ComCtrls.nsFocused;
{$endif}
{$if declared(nsSelected)}
  nsSelected = ComCtrls.nsSelected;
{$endif}
{$if declared(nsMultiSelected)}
  nsMultiSelected = ComCtrls.nsMultiSelected;
{$endif}
{$if declared(nsExpanded)}
  nsExpanded = ComCtrls.nsExpanded;
{$endif}
{$if declared(nsHasChildren)}
  nsHasChildren = ComCtrls.nsHasChildren;
{$endif}
{$if declared(nsDeleting)}
  nsDeleting = ComCtrls.nsDeleting;
{$endif}
{$if declared(nsVisible)}
  nsVisible = ComCtrls.nsVisible;
{$endif}
{$if declared(nsEnabled)}
  nsEnabled = ComCtrls.nsEnabled;
{$endif}
{$if declared(nsBound)}
  nsBound = ComCtrls.nsBound;
{$endif}
{$if declared(nsValidHasChildren)}
  nsValidHasChildren = ComCtrls.nsValidHasChildren;
{$endif}
{$if declared(naAdd)}
  naAdd = ComCtrls.naAdd;
{$endif}
{$if declared(naAddFirst)}
  naAddFirst = ComCtrls.naAddFirst;
{$endif}
{$if declared(naAddChild)}
  naAddChild = ComCtrls.naAddChild;
{$endif}
{$if declared(naAddChildFirst)}
  naAddChildFirst = ComCtrls.naAddChildFirst;
{$endif}
{$if declared(naInsert)}
  naInsert = ComCtrls.naInsert;
{$endif}
{$if declared(naInsertBehind)}
  naInsertBehind = ComCtrls.naInsertBehind;
{$endif}
{$if declared(taAddFirst)}
  taAddFirst = ComCtrls.taAddFirst;
{$endif}
{$if declared(taAdd)}
  taAdd = ComCtrls.taAdd;
{$endif}
{$if declared(taInsert)}
  taInsert = ComCtrls.taInsert;
{$endif}
{$if declared(msControlSelect)}
  msControlSelect = ComCtrls.msControlSelect;
{$endif}
{$if declared(msShiftSelect)}
  msShiftSelect = ComCtrls.msShiftSelect;
{$endif}
{$if declared(msVisibleOnly)}
  msVisibleOnly = ComCtrls.msVisibleOnly;
{$endif}
{$if declared(msSiblingOnly)}
  msSiblingOnly = ComCtrls.msSiblingOnly;
{$endif}
{$if declared(ncTextChanged)}
  ncTextChanged = ComCtrls.ncTextChanged;
{$endif}
{$if declared(ncDataChanged)}
  ncDataChanged = ComCtrls.ncDataChanged;
{$endif}
{$if declared(ncHeightChanged)}
  ncHeightChanged = ComCtrls.ncHeightChanged;
{$endif}
{$if declared(ncImageEffect)}
  ncImageEffect = ComCtrls.ncImageEffect;
{$endif}
{$if declared(ncImageIndex)}
  ncImageIndex = ComCtrls.ncImageIndex;
{$endif}
{$if declared(ncParentChanged)}
  ncParentChanged = ComCtrls.ncParentChanged;
{$endif}
{$if declared(ncVisibility)}
  ncVisibility = ComCtrls.ncVisibility;
{$endif}
{$if declared(ncEnablement)}
  ncEnablement = ComCtrls.ncEnablement;
{$endif}
{$if declared(ncOverlayIndex)}
  ncOverlayIndex = ComCtrls.ncOverlayIndex;
{$endif}
{$if declared(ncStateIndex)}
  ncStateIndex = ComCtrls.ncStateIndex;
{$endif}
{$if declared(ncSelectedIndex)}
  ncSelectedIndex = ComCtrls.ncSelectedIndex;
{$endif}
{$if declared(tvsScrollbarChanged)}
  tvsScrollbarChanged = ComCtrls.tvsScrollbarChanged;
{$endif}
{$if declared(tvsMaxRightNeedsUpdate)}
  tvsMaxRightNeedsUpdate = ComCtrls.tvsMaxRightNeedsUpdate;
{$endif}
{$if declared(tvsTopsNeedsUpdate)}
  tvsTopsNeedsUpdate = ComCtrls.tvsTopsNeedsUpdate;
{$endif}
{$if declared(tvsMaxLvlNeedsUpdate)}
  tvsMaxLvlNeedsUpdate = ComCtrls.tvsMaxLvlNeedsUpdate;
{$endif}
{$if declared(tvsTopItemNeedsUpdate)}
  tvsTopItemNeedsUpdate = ComCtrls.tvsTopItemNeedsUpdate;
{$endif}
{$if declared(tvsBottomItemNeedsUpdate)}
  tvsBottomItemNeedsUpdate = ComCtrls.tvsBottomItemNeedsUpdate;
{$endif}
{$if declared(tvsCanvasChanged)}
  tvsCanvasChanged = ComCtrls.tvsCanvasChanged;
{$endif}
{$if declared(tvsDragged)}
  tvsDragged = ComCtrls.tvsDragged;
{$endif}
{$if declared(tvsIsEditing)}
  tvsIsEditing = ComCtrls.tvsIsEditing;
{$endif}
{$if declared(tvsStateChanging)}
  tvsStateChanging = ComCtrls.tvsStateChanging;
{$endif}
{$if declared(tvsManualNotify)}
  tvsManualNotify = ComCtrls.tvsManualNotify;
{$endif}
{$if declared(tvsPainting)}
  tvsPainting = ComCtrls.tvsPainting;
{$endif}
{$if declared(tvoFocusedPainting)}
  tvoFocusedPainting = ComCtrls.tvoFocusedPainting;
{$endif}
{$if declared(tvsDblClicked)}
  tvsDblClicked = ComCtrls.tvsDblClicked;
{$endif}
{$if declared(tvsTripleClicked)}
  tvsTripleClicked = ComCtrls.tvsTripleClicked;
{$endif}
{$if declared(tvsQuadClicked)}
  tvsQuadClicked = ComCtrls.tvsQuadClicked;
{$endif}
{$if declared(tvsSelectionChanged)}
  tvsSelectionChanged = ComCtrls.tvsSelectionChanged;
{$endif}
{$if declared(tvsEditOnMouseUp)}
  tvsEditOnMouseUp = ComCtrls.tvsEditOnMouseUp;
{$endif}
{$if declared(tvsSingleSelectOnMouseUp)}
  tvsSingleSelectOnMouseUp = ComCtrls.tvsSingleSelectOnMouseUp;
{$endif}
{$if declared(tvoAllowMultiselect)}
  tvoAllowMultiselect = ComCtrls.tvoAllowMultiselect;
{$endif}
{$if declared(tvoAutoExpand)}
  tvoAutoExpand = ComCtrls.tvoAutoExpand;
{$endif}
{$if declared(tvoAutoInsertMark)}
  tvoAutoInsertMark = ComCtrls.tvoAutoInsertMark;
{$endif}
{$if declared(tvoAutoItemHeight)}
  tvoAutoItemHeight = ComCtrls.tvoAutoItemHeight;
{$endif}
{$if declared(tvoHideSelection)}
  tvoHideSelection = ComCtrls.tvoHideSelection;
{$endif}
{$if declared(tvoHotTrack)}
  tvoHotTrack = ComCtrls.tvoHotTrack;
{$endif}
{$if declared(tvoKeepCollapsedNodes)}
  tvoKeepCollapsedNodes = ComCtrls.tvoKeepCollapsedNodes;
{$endif}
{$if declared(tvoReadOnly)}
  tvoReadOnly = ComCtrls.tvoReadOnly;
{$endif}
{$if declared(tvoRightClickSelect)}
  tvoRightClickSelect = ComCtrls.tvoRightClickSelect;
{$endif}
{$if declared(tvoRowSelect)}
  tvoRowSelect = ComCtrls.tvoRowSelect;
{$endif}
{$if declared(tvoShowButtons)}
  tvoShowButtons = ComCtrls.tvoShowButtons;
{$endif}
{$if declared(tvoShowLines)}
  tvoShowLines = ComCtrls.tvoShowLines;
{$endif}
{$if declared(tvoShowRoot)}
  tvoShowRoot = ComCtrls.tvoShowRoot;
{$endif}
{$if declared(tvoShowSeparators)}
  tvoShowSeparators = ComCtrls.tvoShowSeparators;
{$endif}
{$if declared(tvoToolTips)}
  tvoToolTips = ComCtrls.tvoToolTips;
{$endif}
{$if declared(tvoNoDoubleClickExpand)}
  tvoNoDoubleClickExpand = ComCtrls.tvoNoDoubleClickExpand;
{$endif}
{$if declared(tvoThemedDraw)}
  tvoThemedDraw = ComCtrls.tvoThemedDraw;
{$endif}
{$if declared(tvoEmptySpaceUnselect)}
  tvoEmptySpaceUnselect = ComCtrls.tvoEmptySpaceUnselect;
{$endif}
{$if declared(tvestTheme)}
  tvestTheme = ComCtrls.tvestTheme;
{$endif}
{$if declared(tvestPlusMinus)}
  tvestPlusMinus = ComCtrls.tvestPlusMinus;
{$endif}
{$if declared(tvestArrow)}
  tvestArrow = ComCtrls.tvestArrow;
{$endif}
{$if declared(tvestArrowFill)}
  tvestArrowFill = ComCtrls.tvestArrowFill;
{$endif}
{$if declared(tvestAngleBracket)}
  tvestAngleBracket = ComCtrls.tvestAngleBracket;
{$endif}
{$if declared(tvimNone)}
  tvimNone = ComCtrls.tvimNone;
{$endif}
{$if declared(tvimAsFirstChild)}
  tvimAsFirstChild = ComCtrls.tvimAsFirstChild;
{$endif}
{$if declared(tvimAsNextSibling)}
  tvimAsNextSibling = ComCtrls.tvimAsNextSibling;
{$endif}
{$if declared(tvimAsPrevSibling)}
  tvimAsPrevSibling = ComCtrls.tvimAsPrevSibling;
{$endif}
{$if declared(hsmGray)}
  hsmGray = ComCtrls.hsmGray;
{$endif}
{$if declared(hsmHide)}
  hsmHide = ComCtrls.hsmHide;
{$endif}
{$if declared(hsNormal)}
  hsNormal = ComCtrls.hsNormal;
{$endif}
{$if declared(hsHot)}
  hsHot = ComCtrls.hsHot;
{$endif}
{$if declared(hsPressed)}
  hsPressed = ComCtrls.hsPressed;
{$endif}
{$if declared(tsTrackBegin)}
  tsTrackBegin = ComCtrls.tsTrackBegin;
{$endif}
{$if declared(tsTrackMove)}
  tsTrackMove = ComCtrls.tsTrackMove;
{$endif}
{$if declared(tsTrackEnd)}
  tsTrackEnd = ComCtrls.tsTrackEnd;
{$endif}
{$if declared(CN_DROPDOWNCLOSED)}
  CN_DROPDOWNCLOSED = ComCtrls.CN_DROPDOWNCLOSED;
{$endif}
{$if declared(LCLStreamID)}
  LCLStreamID = ComCtrls.LCLStreamID;
{$endif}
{$if declared(DefaultTreeViewOptions)}
  DefaultTreeViewOptions = ComCtrls.DefaultTreeViewOptions;
{$endif}
{$if declared(DefaultMultiSelectStyle)}
  DefaultMultiSelectStyle = ComCtrls.DefaultMultiSelectStyle;
{$endif}
{$if declared(DefaultTreeNodeHeight)}
  DefaultTreeNodeHeight = ComCtrls.DefaultTreeNodeHeight;
{$endif}
{$if declared(DefaultTreeNodeExpandSignSize)}
  DefaultTreeNodeExpandSignSize = ComCtrls.DefaultTreeNodeExpandSignSize;
{$endif}
{$if declared(TCN_First)}
  TCN_First = ComCtrls.TCN_First;
{$endif}
{$if declared(TCN_SELCHANGE)}
  TCN_SELCHANGE = ComCtrls.TCN_SELCHANGE;
{$endif}
{$if declared(TCN_SELCHANGING)}
  TCN_SELCHANGING = ComCtrls.TCN_SELCHANGING;
{$endif}
{$if declared(CompareExpandedNodes)}
function CompareExpandedNodes(Data1, Data2: Pointer): integer; inline;
{$endif}
{$if declared(CompareTextWithExpandedNode)}
function CompareTextWithExpandedNode(Key, Data: Pointer): integer; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(Opt: TCTabControlOptions): String; overload; inline;
{$endif}
{$if declared(RegisterCustomPage)}
procedure RegisterCustomPage; inline;
{$endif}
{$if declared(RegisterCustomTabControl)}
procedure RegisterCustomTabControl; inline;
{$endif}

implementation

{$if declared(CompareExpandedNodes)}
function CompareExpandedNodes(Data1, Data2: Pointer): integer;
begin
  Result := ComCtrls.CompareExpandedNodes(Data1, Data2);
end;

{$endif}
{$if declared(CompareTextWithExpandedNode)}
function CompareTextWithExpandedNode(Key, Data: Pointer): integer;
begin
  Result := ComCtrls.CompareTextWithExpandedNode(Key, Data);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(Opt: TCTabControlOptions): String;
begin
  Result := ComCtrls.DbgS(Opt);
end;

{$endif}
{$if declared(RegisterCustomPage)}
procedure RegisterCustomPage;
begin
  ComCtrls.RegisterCustomPage;
end;

{$endif}
{$if declared(RegisterCustomTabControl)}
procedure RegisterCustomTabControl;
begin
  ComCtrls.RegisterCustomTabControl;
end;

{$endif}
end.
