{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.ExtCtrls
  Gerado por tools/genvclcompat.py a partir de ExtCtrls.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.ExtCtrls;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Types, Classes, Graphics, LCLIntf, ExtCtrls;
type
{$if declared(TPage)}
  TPage = ExtCtrls.TPage;
{$endif}
{$if declared(TBeforeShowPageEvent)}
  TBeforeShowPageEvent = ExtCtrls.TBeforeShowPageEvent;
{$endif}
{$if declared(TImagePaintBackgroundEvent)}
  TImagePaintBackgroundEvent = ExtCtrls.TImagePaintBackgroundEvent;
{$endif}
{$if declared(TNotebook)}
  TNotebook = ExtCtrls.TNotebook;
{$endif}
{$if declared(TUNBPages)}
  TUNBPages = ExtCtrls.TUNBPages;
{$endif}
{$if declared(TTimer)}
  TTimer = ExtCtrls.TTimer;
{$endif}
{$if declared(TIdleTimerAutoEvent)}
  TIdleTimerAutoEvent = ExtCtrls.TIdleTimerAutoEvent;
{$endif}
{$if declared(TIdleTimerAutoEvents)}
  TIdleTimerAutoEvents = ExtCtrls.TIdleTimerAutoEvents;
{$endif}
{$if declared(TCustomIdleTimer)}
  TCustomIdleTimer = ExtCtrls.TCustomIdleTimer;
{$endif}
{$if declared(TIdleTimer)}
  TIdleTimer = ExtCtrls.TIdleTimer;
{$endif}
{$if declared(TShapeType)}
  TShapeType = ExtCtrls.TShapeType;
{$endif}
{$if declared(TShapePointsEvent)}
  TShapePointsEvent = ExtCtrls.TShapePointsEvent;
{$endif}
{$if declared(TCustomShape)}
  TCustomShape = ExtCtrls.TCustomShape;
{$endif}
{$if declared(TShape)}
  TShape = ExtCtrls.TShape;
{$endif}
{$if declared(TResizeStyle)}
  TResizeStyle = ExtCtrls.TResizeStyle;
{$endif}
{$if declared(TCanOffsetEvent)}
  TCanOffsetEvent = ExtCtrls.TCanOffsetEvent;
{$endif}
{$if declared(TCanResizeEvent)}
  TCanResizeEvent = ExtCtrls.TCanResizeEvent;
{$endif}
{$if declared(TCustomSplitter)}
  TCustomSplitter = ExtCtrls.TCustomSplitter;
{$endif}
{$if declared(TSplitter)}
  TSplitter = ExtCtrls.TSplitter;
{$endif}
{$if declared(TPaintBox)}
  TPaintBox = ExtCtrls.TPaintBox;
{$endif}
{$if declared(TCustomImage)}
  TCustomImage = ExtCtrls.TCustomImage;
{$endif}
{$if declared(TImage)}
  TImage = ExtCtrls.TImage;
{$endif}
{$if declared(TBevelStyle)}
  TBevelStyle = ExtCtrls.TBevelStyle;
{$endif}
{$if declared(TBevelShape)}
  TBevelShape = ExtCtrls.TBevelShape;
{$endif}
{$if declared(TBevel)}
  TBevel = ExtCtrls.TBevel;
{$endif}
{$if declared(TColumnLayout)}
  TColumnLayout = ExtCtrls.TColumnLayout;
{$endif}
{$if declared(TCustomRadioGroup)}
  TCustomRadioGroup = ExtCtrls.TCustomRadioGroup;
{$endif}
{$if declared(TRadioGroup)}
  TRadioGroup = ExtCtrls.TRadioGroup;
{$endif}
{$if declared(TCheckGroupClicked)}
  TCheckGroupClicked = ExtCtrls.TCheckGroupClicked;
{$endif}
{$if declared(TCustomCheckGroup)}
  TCustomCheckGroup = ExtCtrls.TCustomCheckGroup;
{$endif}
{$if declared(TCheckGroup)}
  TCheckGroup = ExtCtrls.TCheckGroup;
{$endif}
{$if declared(TBoundLabel)}
  TBoundLabel = ExtCtrls.TBoundLabel;
{$endif}
{$if declared(TLabelPosition)}
  TLabelPosition = ExtCtrls.TLabelPosition;
{$endif}
{$if declared(TCustomLabeledEdit)}
  TCustomLabeledEdit = ExtCtrls.TCustomLabeledEdit;
{$endif}
{$if declared(TLabeledEdit)}
  TLabeledEdit = ExtCtrls.TLabeledEdit;
{$endif}
{$if declared(TBevelWidth)}
  TBevelWidth = ExtCtrls.TBevelWidth;
{$endif}
{$if declared(TCustomPanel)}
  TCustomPanel = ExtCtrls.TCustomPanel;
{$endif}
{$if declared(TPanel)}
  TPanel = ExtCtrls.TPanel;
{$endif}
{$if declared(TFlowPanel)}
  TFlowPanel = ExtCtrls.TFlowPanel;
{$endif}
{$if declared(TCustomFlowPanel)}
  TCustomFlowPanel = ExtCtrls.TCustomFlowPanel;
{$endif}
{$if declared(TFlowPanelControl)}
  TFlowPanelControl = ExtCtrls.TFlowPanelControl;
{$endif}
{$if declared(TFlowPanelControlList)}
  TFlowPanelControlList = ExtCtrls.TFlowPanelControlList;
{$endif}
{$if declared(TFlowStyle)}
  TFlowStyle = ExtCtrls.TFlowStyle;
{$endif}
{$if declared(TWrapAfter)}
  TWrapAfter = ExtCtrls.TWrapAfter;
{$endif}
{$if declared(TBalloonFlags)}
  TBalloonFlags = ExtCtrls.TBalloonFlags;
{$endif}
{$if declared(TCustomTrayIcon)}
  TCustomTrayIcon = ExtCtrls.TCustomTrayIcon;
{$endif}
{$if declared(TTrayIcon)}
  TTrayIcon = ExtCtrls.TTrayIcon;
{$endif}
{$if declared(TBandDrawingStyle)}
  TBandDrawingStyle = ExtCtrls.TBandDrawingStyle;
{$endif}
{$if declared(TBandPaintOption)}
  TBandPaintOption = ExtCtrls.TBandPaintOption;
{$endif}
{$if declared(TBandPaintOptions)}
  TBandPaintOptions = ExtCtrls.TBandPaintOptions;
{$endif}
{$if declared(TBandDragEvent)}
  TBandDragEvent = ExtCtrls.TBandDragEvent;
{$endif}
{$if declared(TBandInfoEvent)}
  TBandInfoEvent = ExtCtrls.TBandInfoEvent;
{$endif}
{$if declared(TBandMoveEvent)}
  TBandMoveEvent = ExtCtrls.TBandMoveEvent;
{$endif}
{$if declared(TBandPaintEvent)}
  TBandPaintEvent = ExtCtrls.TBandPaintEvent;
{$endif}
{$if declared(TRowSize)}
  TRowSize = ExtCtrls.TRowSize;
{$endif}
{$if declared(TBandMove)}
  TBandMove = ExtCtrls.TBandMove;
{$endif}
{$if declared(TCursorDesign)}
  TCursorDesign = ExtCtrls.TCursorDesign;
{$endif}
{$if declared(TCtrlBand)}
  TCtrlBand = ExtCtrls.TCtrlBand;
{$endif}
{$if declared(TCtrlBands)}
  TCtrlBands = ExtCtrls.TCtrlBands;
{$endif}
{$if declared(TCustomControlBar)}
  TCustomControlBar = ExtCtrls.TCustomControlBar;
{$endif}
{$if declared(TControlBar)}
  TControlBar = ExtCtrls.TControlBar;
{$endif}
{$if declared(TPanelBevel)}
  TPanelBevel = ExtCtrls.TPanelBevel;
{$endif}
const
{$if declared(itaOnIdle)}
  itaOnIdle = ExtCtrls.itaOnIdle;
{$endif}
{$if declared(itaOnIdleEnd)}
  itaOnIdleEnd = ExtCtrls.itaOnIdleEnd;
{$endif}
{$if declared(itaOnUserInput)}
  itaOnUserInput = ExtCtrls.itaOnUserInput;
{$endif}
{$if declared(stRectangle)}
  stRectangle = ExtCtrls.stRectangle;
{$endif}
{$if declared(stSquare)}
  stSquare = ExtCtrls.stSquare;
{$endif}
{$if declared(stRoundRect)}
  stRoundRect = ExtCtrls.stRoundRect;
{$endif}
{$if declared(stRoundSquare)}
  stRoundSquare = ExtCtrls.stRoundSquare;
{$endif}
{$if declared(stEllipse)}
  stEllipse = ExtCtrls.stEllipse;
{$endif}
{$if declared(stCircle)}
  stCircle = ExtCtrls.stCircle;
{$endif}
{$if declared(stSquaredDiamond)}
  stSquaredDiamond = ExtCtrls.stSquaredDiamond;
{$endif}
{$if declared(stDiamond)}
  stDiamond = ExtCtrls.stDiamond;
{$endif}
{$if declared(stTriangle)}
  stTriangle = ExtCtrls.stTriangle;
{$endif}
{$if declared(stTriangleLeft)}
  stTriangleLeft = ExtCtrls.stTriangleLeft;
{$endif}
{$if declared(stTriangleRight)}
  stTriangleRight = ExtCtrls.stTriangleRight;
{$endif}
{$if declared(stTriangleDown)}
  stTriangleDown = ExtCtrls.stTriangleDown;
{$endif}
{$if declared(stStar)}
  stStar = ExtCtrls.stStar;
{$endif}
{$if declared(stStarDown)}
  stStarDown = ExtCtrls.stStarDown;
{$endif}
{$if declared(stPolygon)}
  stPolygon = ExtCtrls.stPolygon;
{$endif}
{$if declared(rsLine)}
  rsLine = ExtCtrls.rsLine;
{$endif}
{$if declared(rsNone)}
  rsNone = ExtCtrls.rsNone;
{$endif}
{$if declared(rsPattern)}
  rsPattern = ExtCtrls.rsPattern;
{$endif}
{$if declared(rsUpdate)}
  rsUpdate = ExtCtrls.rsUpdate;
{$endif}
{$if declared(bsLowered)}
  bsLowered = ExtCtrls.bsLowered;
{$endif}
{$if declared(bsRaised)}
  bsRaised = ExtCtrls.bsRaised;
{$endif}
{$if declared(bsBox)}
  bsBox = ExtCtrls.bsBox;
{$endif}
{$if declared(bsFrame)}
  bsFrame = ExtCtrls.bsFrame;
{$endif}
{$if declared(bsTopLine)}
  bsTopLine = ExtCtrls.bsTopLine;
{$endif}
{$if declared(bsBottomLine)}
  bsBottomLine = ExtCtrls.bsBottomLine;
{$endif}
{$if declared(bsLeftLine)}
  bsLeftLine = ExtCtrls.bsLeftLine;
{$endif}
{$if declared(bsRightLine)}
  bsRightLine = ExtCtrls.bsRightLine;
{$endif}
{$if declared(bsSpacer)}
  bsSpacer = ExtCtrls.bsSpacer;
{$endif}
{$if declared(clHorizontalThenVertical)}
  clHorizontalThenVertical = ExtCtrls.clHorizontalThenVertical;
{$endif}
{$if declared(clVerticalThenHorizontal)}
  clVerticalThenHorizontal = ExtCtrls.clVerticalThenHorizontal;
{$endif}
{$if declared(lpAbove)}
  lpAbove = ExtCtrls.lpAbove;
{$endif}
{$if declared(lpBelow)}
  lpBelow = ExtCtrls.lpBelow;
{$endif}
{$if declared(lpLeft)}
  lpLeft = ExtCtrls.lpLeft;
{$endif}
{$if declared(lpRight)}
  lpRight = ExtCtrls.lpRight;
{$endif}
{$if declared(fsLeftRightTopBottom)}
  fsLeftRightTopBottom = ExtCtrls.fsLeftRightTopBottom;
{$endif}
{$if declared(fsRightLeftTopBottom)}
  fsRightLeftTopBottom = ExtCtrls.fsRightLeftTopBottom;
{$endif}
{$if declared(fsLeftRightBottomTop)}
  fsLeftRightBottomTop = ExtCtrls.fsLeftRightBottomTop;
{$endif}
{$if declared(fsRightLeftBottomTop)}
  fsRightLeftBottomTop = ExtCtrls.fsRightLeftBottomTop;
{$endif}
{$if declared(fsTopBottomLeftRight)}
  fsTopBottomLeftRight = ExtCtrls.fsTopBottomLeftRight;
{$endif}
{$if declared(fsBottomTopLeftRight)}
  fsBottomTopLeftRight = ExtCtrls.fsBottomTopLeftRight;
{$endif}
{$if declared(fsTopBottomRightLeft)}
  fsTopBottomRightLeft = ExtCtrls.fsTopBottomRightLeft;
{$endif}
{$if declared(fsBottomTopRightLeft)}
  fsBottomTopRightLeft = ExtCtrls.fsBottomTopRightLeft;
{$endif}
{$if declared(waAuto)}
  waAuto = ExtCtrls.waAuto;
{$endif}
{$if declared(waForce)}
  waForce = ExtCtrls.waForce;
{$endif}
{$if declared(waAvoid)}
  waAvoid = ExtCtrls.waAvoid;
{$endif}
{$if declared(waForbid)}
  waForbid = ExtCtrls.waForbid;
{$endif}
{$if declared(bfNone)}
  bfNone = ExtCtrls.bfNone;
{$endif}
{$if declared(bfInfo)}
  bfInfo = ExtCtrls.bfInfo;
{$endif}
{$if declared(bfWarning)}
  bfWarning = ExtCtrls.bfWarning;
{$endif}
{$if declared(bfError)}
  bfError = ExtCtrls.bfError;
{$endif}
{$if declared(dsNormal)}
  dsNormal = ExtCtrls.dsNormal;
{$endif}
{$if declared(dsGradient)}
  dsGradient = ExtCtrls.dsGradient;
{$endif}
{$if declared(bpoGrabber)}
  bpoGrabber = ExtCtrls.bpoGrabber;
{$endif}
{$if declared(bpoFrame)}
  bpoFrame = ExtCtrls.bpoFrame;
{$endif}
{$if declared(bpoGradient)}
  bpoGradient = ExtCtrls.bpoGradient;
{$endif}
{$if declared(bpoRoundRect)}
  bpoRoundRect = ExtCtrls.bpoRoundRect;
{$endif}
{$if declared(bmNone)}
  bmNone = ExtCtrls.bmNone;
{$endif}
{$if declared(bmReady)}
  bmReady = ExtCtrls.bmReady;
{$endif}
{$if declared(bmMoving)}
  bmMoving = ExtCtrls.bmMoving;
{$endif}
{$if declared(cdDefault)}
  cdDefault = ExtCtrls.cdDefault;
{$endif}
{$if declared(cdGrabber)}
  cdGrabber = ExtCtrls.cdGrabber;
{$endif}
{$if declared(cdRestricted)}
  cdRestricted = ExtCtrls.cdRestricted;
{$endif}
{$if declared(DefaultSplitterWidth)}
  DefaultSplitterWidth = ExtCtrls.DefaultSplitterWidth;
{$endif}
{$if declared(Frame3D)}
procedure Frame3D(ACanvas: TCanvas; var ARect: TRect; TopColor, BottomColor: TColor; const FrameWidth: integer); inline;
{$endif}

implementation

{$if declared(Frame3D)}
procedure Frame3D(ACanvas: TCanvas; var ARect: TRect; TopColor, BottomColor: TColor; const FrameWidth: integer);
begin
  ExtCtrls.Frame3D(ACanvas, ARect, TopColor, BottomColor, FrameWidth);
end;

{$endif}
end.
