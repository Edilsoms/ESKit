{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Graphics
  Gerado por tools/genvclcompat.py a partir de Graphics.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Graphics;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Types, Classes, FPImage, System.UITypes, LCLType, LCLProc, LResources, IntfGraphics, WSReferences, GraphType, LazLoggerBase, Graphics;
type
{$if declared(TFontPitch)}
  TFontPitch = Graphics.TFontPitch;
{$endif}
{$if declared(TFontDataName)}
  TFontDataName = Graphics.TFontDataName;
{$endif}
{$if declared(TFontStyle)}
  TFontStyle = Graphics.TFontStyle;
{$endif}
{$if declared(TFontStyles)}
  TFontStyles = Graphics.TFontStyles;
{$endif}
{$if declared(TFontStylesbase)}
  TFontStylesbase = Graphics.TFontStylesbase;
{$endif}
{$if declared(TFontCharSet)}
  TFontCharSet = Graphics.TFontCharSet;
{$endif}
{$if declared(TFontQuality)}
  TFontQuality = Graphics.TFontQuality;
{$endif}
{$if declared(TFontData)}
  TFontData = Graphics.TFontData;
{$endif}
{$if declared(TTextLayout)}
  TTextLayout = Graphics.TTextLayout;
{$endif}
{$if declared(TTextStyle)}
  TTextStyle = Graphics.TTextStyle;
{$endif}
{$if declared(TFillMode)}
  TFillMode = Graphics.TFillMode;
{$endif}
{$if declared(TCanvasStates)}
  TCanvasStates = Graphics.TCanvasStates;
{$endif}
{$if declared(TCanvasState)}
  TCanvasState = Graphics.TCanvasState;
{$endif}
{$if declared(TCanvasOrientation)}
  TCanvasOrientation = Graphics.TCanvasOrientation;
{$endif}
{$if declared(TPixelFormat)}
  TPixelFormat = Graphics.TPixelFormat;
{$endif}
{$if declared(TTransparentMode)}
  TTransparentMode = Graphics.TTransparentMode;
{$endif}
{$if declared(TCanvas)}
  TCanvas = Graphics.TCanvas;
{$endif}
{$if declared(TRasterImage)}
  TRasterImage = Graphics.TRasterImage;
{$endif}
{$if declared(TRasterImageClass)}
  TRasterImageClass = Graphics.TRasterImageClass;
{$endif}
{$if declared(TCustomBitmap)}
  TCustomBitmap = Graphics.TCustomBitmap;
{$endif}
{$if declared(TCustomBitmapClass)}
  TCustomBitmapClass = Graphics.TCustomBitmapClass;
{$endif}
{$if declared(TBitmap)}
  TBitmap = Graphics.TBitmap;
{$endif}
{$if declared(TPixmap)}
  TPixmap = Graphics.TPixmap;
{$endif}
{$if declared(TIcon)}
  TIcon = Graphics.TIcon;
{$endif}
{$if declared(TPortableNetworkGraphic)}
  TPortableNetworkGraphic = Graphics.TPortableNetworkGraphic;
{$endif}
{$if declared(TPortableAnyMapGraphic)}
  TPortableAnyMapGraphic = Graphics.TPortableAnyMapGraphic;
{$endif}
{$if declared(TJpegImage)}
  TJpegImage = Graphics.TJpegImage;
{$endif}
{$if declared(TGIFImage)}
  TGIFImage = Graphics.TGIFImage;
{$endif}
{$if declared(TGraphicsObject)}
  TGraphicsObject = Graphics.TGraphicsObject;
{$endif}
{$if declared(TFontHandleCacheDescriptor)}
  TFontHandleCacheDescriptor = Graphics.TFontHandleCacheDescriptor;
{$endif}
{$if declared(TFontHandleCache)}
  TFontHandleCache = Graphics.TFontHandleCache;
{$endif}
{$if declared(TFont)}
  TFont = Graphics.TFont;
{$endif}
{$if declared(TPenPattern)}
  TPenPattern = Graphics.TPenPattern;
{$endif}
{$if declared(TPenHandleCacheDescriptor)}
  TPenHandleCacheDescriptor = Graphics.TPenHandleCacheDescriptor;
{$endif}
{$if declared(TPenHandleCache)}
  TPenHandleCache = Graphics.TPenHandleCache;
{$endif}
{$if declared(TPen)}
  TPen = Graphics.TPen;
{$endif}
{$if declared(TBrushHandleCache)}
  TBrushHandleCache = Graphics.TBrushHandleCache;
{$endif}
{$if declared(TBrush)}
  TBrush = Graphics.TBrush;
{$endif}
{$if declared(TRegionCombineMode)}
  TRegionCombineMode = Graphics.TRegionCombineMode;
{$endif}
{$if declared(TRegionOperationType)}
  TRegionOperationType = Graphics.TRegionOperationType;
{$endif}
{$if declared(TRegionOperation)}
  TRegionOperation = Graphics.TRegionOperation;
{$endif}
{$if declared(TRegionOperations)}
  TRegionOperations = Graphics.TRegionOperations;
{$endif}
{$if declared(TRegion)}
  TRegion = Graphics.TRegion;
{$endif}
{$if declared(TGraphic)}
  TGraphic = Graphics.TGraphic;
{$endif}
{$if declared(TGraphicClass)}
  TGraphicClass = Graphics.TGraphicClass;
{$endif}
{$if declared(TPicture)}
  TPicture = Graphics.TPicture;
{$endif}
{$if declared(EGraphicException)}
  EGraphicException = Graphics.EGraphicException;
{$endif}
{$if declared(EInvalidGraphic)}
  EInvalidGraphic = Graphics.EInvalidGraphic;
{$endif}
{$if declared(EInvalidGraphicOperation)}
  EInvalidGraphicOperation = Graphics.EInvalidGraphicOperation;
{$endif}
{$if declared(TGradientDirection)}
  TGradientDirection = Graphics.TGradientDirection;
{$endif}
{$if declared(TAntialiasingMode)}
  TAntialiasingMode = Graphics.TAntialiasingMode;
{$endif}
{$if declared(TLCLTextMetric)}
  TLCLTextMetric = Graphics.TLCLTextMetric;
{$endif}
{$if declared(TDefaultColorType)}
  TDefaultColorType = Graphics.TDefaultColorType;
{$endif}
{$if declared(TSharedImage)}
  TSharedImage = Graphics.TSharedImage;
{$endif}
{$if declared(TBitmapHandleType)}
  TBitmapHandleType = Graphics.TBitmapHandleType;
{$endif}
{$if declared(TSharedRasterImage)}
  TSharedRasterImage = Graphics.TSharedRasterImage;
{$endif}
{$if declared(TSharedRasterImageClass)}
  TSharedRasterImageClass = Graphics.TSharedRasterImageClass;
{$endif}
{$if declared(TSharedCustomBitmap)}
  TSharedCustomBitmap = Graphics.TSharedCustomBitmap;
{$endif}
{$if declared(TFPImageBitmap)}
  TFPImageBitmap = Graphics.TFPImageBitmap;
{$endif}
{$if declared(TFPImageBitmapClass)}
  TFPImageBitmapClass = Graphics.TFPImageBitmapClass;
{$endif}
{$if declared(TSharedBitmap)}
  TSharedBitmap = Graphics.TSharedBitmap;
{$endif}
{$if declared(TSharedPixmap)}
  TSharedPixmap = Graphics.TSharedPixmap;
{$endif}
{$if declared(TSharedPortableNetworkGraphic)}
  TSharedPortableNetworkGraphic = Graphics.TSharedPortableNetworkGraphic;
{$endif}
{$if declared(TSharedPortableAnyMapGraphic)}
  TSharedPortableAnyMapGraphic = Graphics.TSharedPortableAnyMapGraphic;
{$endif}
{$if declared(TIconImage)}
  TIconImage = Graphics.TIconImage;
{$endif}
{$if declared(TIconImageClass)}
  TIconImageClass = Graphics.TIconImageClass;
{$endif}
{$if declared(TSharedIcon)}
  TSharedIcon = Graphics.TSharedIcon;
{$endif}
{$if declared(TCustomIcon)}
  TCustomIcon = Graphics.TCustomIcon;
{$endif}
{$if declared(TIcnsRec)}
  TIcnsRec = Graphics.TIcnsRec;
{$endif}
{$if declared(PIcnsRec)}
  PIcnsRec = Graphics.PIcnsRec;
{$endif}
{$if declared(TIcnsList)}
  TIcnsList = Graphics.TIcnsList;
{$endif}
{$if declared(TSharedIcnsIcon)}
  TSharedIcnsIcon = Graphics.TSharedIcnsIcon;
{$endif}
{$if declared(TIcnsIcon)}
  TIcnsIcon = Graphics.TIcnsIcon;
{$endif}
{$if declared(TSharedCursorImage)}
  TSharedCursorImage = Graphics.TSharedCursorImage;
{$endif}
{$if declared(TCursorImageImage)}
  TCursorImageImage = Graphics.TCursorImageImage;
{$endif}
{$if declared(TCursorImage)}
  TCursorImage = Graphics.TCursorImage;
{$endif}
{$if declared(TSharedJpegImage)}
  TSharedJpegImage = Graphics.TSharedJpegImage;
{$endif}
{$if declared(TSharedTiffImage)}
  TSharedTiffImage = Graphics.TSharedTiffImage;
{$endif}
{$if declared(TTiffUnit)}
  TTiffUnit = Graphics.TTiffUnit;
{$endif}
{$if declared(TTiffImage)}
  TTiffImage = Graphics.TTiffImage;
{$endif}
{$if declared(TSharedGIFImage)}
  TSharedGIFImage = Graphics.TSharedGIFImage;
{$endif}
{$if declared(TGetColorStringProc)}
  TGetColorStringProc = Graphics.TGetColorStringProc;
{$endif}
{$if declared(TOnLoadGraphicFromClipboardFormat)}
  TOnLoadGraphicFromClipboardFormat = Graphics.TOnLoadGraphicFromClipboardFormat;
{$endif}
{$if declared(TOnSaveGraphicToClipboardFormat)}
  TOnSaveGraphicToClipboardFormat = Graphics.TOnSaveGraphicToClipboardFormat;
{$endif}
{$if declared(TOnGetSystemFont)}
  TOnGetSystemFont = Graphics.TOnGetSystemFont;
{$endif}
{$if declared(PColor)}
  PColor = Graphics.PColor;
{$endif}
{$if declared(TColor)}
  TColor = Graphics.TColor;
{$endif}
{$if declared(TFontName)}
  TFontName = Graphics.TFontName;
{$endif}
{$if declared(TFillStyle)}
  TFillStyle = Graphics.TFillStyle;
{$endif}
{$if declared(TCopymode)}
  TCopymode = Graphics.TCopymode;
{$endif}
{$if declared(TProgressStage)}
  TProgressStage = Graphics.TProgressStage;
{$endif}
{$if declared(TProgressEvent)}
  TProgressEvent = Graphics.TProgressEvent;
{$endif}
{$if declared(TPenStyle)}
  TPenStyle = Graphics.TPenStyle;
{$endif}
{$if declared(TPenMode)}
  TPenMode = Graphics.TPenMode;
{$endif}
{$if declared(TPenEndCap)}
  TPenEndCap = Graphics.TPenEndCap;
{$endif}
{$if declared(TPenJoinStyle)}
  TPenJoinStyle = Graphics.TPenJoinStyle;
{$endif}
{$if declared(TBrushStyle)}
  TBrushStyle = Graphics.TBrushStyle;
{$endif}
{$if declared(TJPEGQualityRange)}
  TJPEGQualityRange = Graphics.TJPEGQualityRange;
{$endif}
{$if declared(TJPEGPerformance)}
  TJPEGPerformance = Graphics.TJPEGPerformance;
{$endif}
const
{$if declared(fpDefault)}
  fpDefault = Graphics.fpDefault;
{$endif}
{$if declared(fpVariable)}
  fpVariable = Graphics.fpVariable;
{$endif}
{$if declared(fpFixed)}
  fpFixed = Graphics.fpFixed;
{$endif}
{$if declared(fsBold)}
  fsBold = Graphics.fsBold;
{$endif}
{$if declared(fsItalic)}
  fsItalic = Graphics.fsItalic;
{$endif}
{$if declared(fsUnderline)}
  fsUnderline = Graphics.fsUnderline;
{$endif}
{$if declared(fsStrikeOut)}
  fsStrikeOut = Graphics.fsStrikeOut;
{$endif}
{$if declared(fqDefault)}
  fqDefault = Graphics.fqDefault;
{$endif}
{$if declared(fqDraft)}
  fqDraft = Graphics.fqDraft;
{$endif}
{$if declared(fqProof)}
  fqProof = Graphics.fqProof;
{$endif}
{$if declared(fqNonAntialiased)}
  fqNonAntialiased = Graphics.fqNonAntialiased;
{$endif}
{$if declared(fqAntialiased)}
  fqAntialiased = Graphics.fqAntialiased;
{$endif}
{$if declared(fqCleartype)}
  fqCleartype = Graphics.fqCleartype;
{$endif}
{$if declared(fqCleartypeNatural)}
  fqCleartypeNatural = Graphics.fqCleartypeNatural;
{$endif}
{$if declared(tlTop)}
  tlTop = Graphics.tlTop;
{$endif}
{$if declared(tlCenter)}
  tlCenter = Graphics.tlCenter;
{$endif}
{$if declared(tlBottom)}
  tlBottom = Graphics.tlBottom;
{$endif}
{$if declared(fmAlternate)}
  fmAlternate = Graphics.fmAlternate;
{$endif}
{$if declared(fmWinding)}
  fmWinding = Graphics.fmWinding;
{$endif}
{$if declared(csHandleValid)}
  csHandleValid = Graphics.csHandleValid;
{$endif}
{$if declared(csFontValid)}
  csFontValid = Graphics.csFontValid;
{$endif}
{$if declared(csPenvalid)}
  csPenvalid = Graphics.csPenvalid;
{$endif}
{$if declared(csBrushValid)}
  csBrushValid = Graphics.csBrushValid;
{$endif}
{$if declared(csRegionValid)}
  csRegionValid = Graphics.csRegionValid;
{$endif}
{$if declared(csLefttoRight)}
  csLefttoRight = Graphics.csLefttoRight;
{$endif}
{$if declared(coRighttoLeft)}
  coRighttoLeft = Graphics.coRighttoLeft;
{$endif}
{$if declared(pfDevice)}
  pfDevice = Graphics.pfDevice;
{$endif}
{$if declared(pf1bit)}
  pf1bit = Graphics.pf1bit;
{$endif}
{$if declared(pf4bit)}
  pf4bit = Graphics.pf4bit;
{$endif}
{$if declared(pf8bit)}
  pf8bit = Graphics.pf8bit;
{$endif}
{$if declared(pf15bit)}
  pf15bit = Graphics.pf15bit;
{$endif}
{$if declared(pf16bit)}
  pf16bit = Graphics.pf16bit;
{$endif}
{$if declared(pf24bit)}
  pf24bit = Graphics.pf24bit;
{$endif}
{$if declared(pf32bit)}
  pf32bit = Graphics.pf32bit;
{$endif}
{$if declared(pfCustom)}
  pfCustom = Graphics.pfCustom;
{$endif}
{$if declared(tmAuto)}
  tmAuto = Graphics.tmAuto;
{$endif}
{$if declared(tmFixed)}
  tmFixed = Graphics.tmFixed;
{$endif}
{$if declared(rgnAnd)}
  rgnAnd = Graphics.rgnAnd;
{$endif}
{$if declared(rgnCopy)}
  rgnCopy = Graphics.rgnCopy;
{$endif}
{$if declared(rgnDiff)}
  rgnDiff = Graphics.rgnDiff;
{$endif}
{$if declared(rgnOr)}
  rgnOr = Graphics.rgnOr;
{$endif}
{$if declared(rgnXOR)}
  rgnXOR = Graphics.rgnXOR;
{$endif}
{$if declared(rgnNewRect)}
  rgnNewRect = Graphics.rgnNewRect;
{$endif}
{$if declared(rgnCombine)}
  rgnCombine = Graphics.rgnCombine;
{$endif}
{$if declared(gdVertical)}
  gdVertical = Graphics.gdVertical;
{$endif}
{$if declared(gdHorizontal)}
  gdHorizontal = Graphics.gdHorizontal;
{$endif}
{$if declared(amDontCare)}
  amDontCare = Graphics.amDontCare;
{$endif}
{$if declared(amOn)}
  amOn = Graphics.amOn;
{$endif}
{$if declared(amOff)}
  amOff = Graphics.amOff;
{$endif}
{$if declared(dctBrush)}
  dctBrush = Graphics.dctBrush;
{$endif}
{$if declared(dctFont)}
  dctFont = Graphics.dctFont;
{$endif}
{$if declared(bmDIB)}
  bmDIB = Graphics.bmDIB;
{$endif}
{$if declared(bmDDB)}
  bmDDB = Graphics.bmDDB;
{$endif}
{$if declared(tuUnknown)}
  tuUnknown = Graphics.tuUnknown;
{$endif}
{$if declared(tuNone)}
  tuNone = Graphics.tuNone;
{$endif}
{$if declared(tuInch)}
  tuInch = Graphics.tuInch;
{$endif}
{$if declared(tuCentimeter)}
  tuCentimeter = Graphics.tuCentimeter;
{$endif}
{$if declared(psSolid)}
  psSolid = Graphics.psSolid;
{$endif}
{$if declared(psDash)}
  psDash = Graphics.psDash;
{$endif}
{$if declared(psDot)}
  psDot = Graphics.psDot;
{$endif}
{$if declared(psDashDot)}
  psDashDot = Graphics.psDashDot;
{$endif}
{$if declared(psDashDotDot)}
  psDashDotDot = Graphics.psDashDotDot;
{$endif}
{$if declared(psClear)}
  psClear = Graphics.psClear;
{$endif}
{$if declared(psInsideframe)}
  psInsideframe = Graphics.psInsideframe;
{$endif}
{$if declared(psPattern)}
  psPattern = Graphics.psPattern;
{$endif}
{$if declared(pmBlack)}
  pmBlack = Graphics.pmBlack;
{$endif}
{$if declared(pmWhite)}
  pmWhite = Graphics.pmWhite;
{$endif}
{$if declared(pmNop)}
  pmNop = Graphics.pmNop;
{$endif}
{$if declared(pmNot)}
  pmNot = Graphics.pmNot;
{$endif}
{$if declared(pmCopy)}
  pmCopy = Graphics.pmCopy;
{$endif}
{$if declared(pmNotCopy)}
  pmNotCopy = Graphics.pmNotCopy;
{$endif}
{$if declared(pmMergePenNot)}
  pmMergePenNot = Graphics.pmMergePenNot;
{$endif}
{$if declared(pmMaskPenNot)}
  pmMaskPenNot = Graphics.pmMaskPenNot;
{$endif}
{$if declared(pmMergeNotPen)}
  pmMergeNotPen = Graphics.pmMergeNotPen;
{$endif}
{$if declared(pmMaskNotPen)}
  pmMaskNotPen = Graphics.pmMaskNotPen;
{$endif}
{$if declared(pmMerge)}
  pmMerge = Graphics.pmMerge;
{$endif}
{$if declared(pmNotMerge)}
  pmNotMerge = Graphics.pmNotMerge;
{$endif}
{$if declared(pmMask)}
  pmMask = Graphics.pmMask;
{$endif}
{$if declared(pmNotMask)}
  pmNotMask = Graphics.pmNotMask;
{$endif}
{$if declared(pmXor)}
  pmXor = Graphics.pmXor;
{$endif}
{$if declared(pmNotXor)}
  pmNotXor = Graphics.pmNotXor;
{$endif}
{$if declared(bsSolid)}
  bsSolid = Graphics.bsSolid;
{$endif}
{$if declared(bsClear)}
  bsClear = Graphics.bsClear;
{$endif}
{$if declared(bsHorizontal)}
  bsHorizontal = Graphics.bsHorizontal;
{$endif}
{$if declared(bsVertical)}
  bsVertical = Graphics.bsVertical;
{$endif}
{$if declared(bsFDiagonal)}
  bsFDiagonal = Graphics.bsFDiagonal;
{$endif}
{$if declared(bsBDiagonal)}
  bsBDiagonal = Graphics.bsBDiagonal;
{$endif}
{$if declared(bsCross)}
  bsCross = Graphics.bsCross;
{$endif}
{$if declared(bsDiagCross)}
  bsDiagCross = Graphics.bsDiagCross;
{$endif}
{$if declared(bsImage)}
  bsImage = Graphics.bsImage;
{$endif}
{$if declared(bsPattern)}
  bsPattern = Graphics.bsPattern;
{$endif}
{$if declared(pecRound)}
  pecRound = Graphics.pecRound;
{$endif}
{$if declared(pecSquare)}
  pecSquare = Graphics.pecSquare;
{$endif}
{$if declared(pecFlat)}
  pecFlat = Graphics.pecFlat;
{$endif}
{$if declared(pjsRound)}
  pjsRound = Graphics.pjsRound;
{$endif}
{$if declared(pjsBevel)}
  pjsBevel = Graphics.pjsBevel;
{$endif}
{$if declared(pjsMiter)}
  pjsMiter = Graphics.pjsMiter;
{$endif}
{$if declared(clBlack)}
  clBlack = Graphics.clBlack;
{$endif}
{$if declared(clMaroon)}
  clMaroon = Graphics.clMaroon;
{$endif}
{$if declared(clGreen)}
  clGreen = Graphics.clGreen;
{$endif}
{$if declared(clOlive)}
  clOlive = Graphics.clOlive;
{$endif}
{$if declared(clNavy)}
  clNavy = Graphics.clNavy;
{$endif}
{$if declared(clPurple)}
  clPurple = Graphics.clPurple;
{$endif}
{$if declared(clTeal)}
  clTeal = Graphics.clTeal;
{$endif}
{$if declared(clGray)}
  clGray = Graphics.clGray;
{$endif}
{$if declared(clSilver)}
  clSilver = Graphics.clSilver;
{$endif}
{$if declared(clRed)}
  clRed = Graphics.clRed;
{$endif}
{$if declared(clLime)}
  clLime = Graphics.clLime;
{$endif}
{$if declared(clYellow)}
  clYellow = Graphics.clYellow;
{$endif}
{$if declared(clBlue)}
  clBlue = Graphics.clBlue;
{$endif}
{$if declared(clFuchsia)}
  clFuchsia = Graphics.clFuchsia;
{$endif}
{$if declared(clAqua)}
  clAqua = Graphics.clAqua;
{$endif}
{$if declared(clLtGray)}
  clLtGray = Graphics.clLtGray;
{$endif}
{$if declared(clDkGray)}
  clDkGray = Graphics.clDkGray;
{$endif}
{$if declared(clWhite)}
  clWhite = Graphics.clWhite;
{$endif}
{$if declared(StandardColorsCount)}
  StandardColorsCount = Graphics.StandardColorsCount;
{$endif}
{$if declared(clMoneyGreen)}
  clMoneyGreen = Graphics.clMoneyGreen;
{$endif}
{$if declared(clSkyBlue)}
  clSkyBlue = Graphics.clSkyBlue;
{$endif}
{$if declared(clCream)}
  clCream = Graphics.clCream;
{$endif}
{$if declared(clMedGray)}
  clMedGray = Graphics.clMedGray;
{$endif}
{$if declared(ExtendedColorCount)}
  ExtendedColorCount = Graphics.ExtendedColorCount;
{$endif}
{$if declared(clNone)}
  clNone = Graphics.clNone;
{$endif}
{$if declared(clDefault)}
  clDefault = Graphics.clDefault;
{$endif}
{$if declared(clScrollBar)}
  clScrollBar = Graphics.clScrollBar;
{$endif}
{$if declared(clBackground)}
  clBackground = Graphics.clBackground;
{$endif}
{$if declared(clActiveCaption)}
  clActiveCaption = Graphics.clActiveCaption;
{$endif}
{$if declared(clInactiveCaption)}
  clInactiveCaption = Graphics.clInactiveCaption;
{$endif}
{$if declared(clMenu)}
  clMenu = Graphics.clMenu;
{$endif}
{$if declared(clWindow)}
  clWindow = Graphics.clWindow;
{$endif}
{$if declared(clWindowFrame)}
  clWindowFrame = Graphics.clWindowFrame;
{$endif}
{$if declared(clMenuText)}
  clMenuText = Graphics.clMenuText;
{$endif}
{$if declared(clWindowText)}
  clWindowText = Graphics.clWindowText;
{$endif}
{$if declared(clCaptionText)}
  clCaptionText = Graphics.clCaptionText;
{$endif}
{$if declared(clActiveBorder)}
  clActiveBorder = Graphics.clActiveBorder;
{$endif}
{$if declared(clInactiveBorder)}
  clInactiveBorder = Graphics.clInactiveBorder;
{$endif}
{$if declared(clAppWorkspace)}
  clAppWorkspace = Graphics.clAppWorkspace;
{$endif}
{$if declared(clHighlight)}
  clHighlight = Graphics.clHighlight;
{$endif}
{$if declared(clHighlightText)}
  clHighlightText = Graphics.clHighlightText;
{$endif}
{$if declared(clBtnFace)}
  clBtnFace = Graphics.clBtnFace;
{$endif}
{$if declared(clBtnShadow)}
  clBtnShadow = Graphics.clBtnShadow;
{$endif}
{$if declared(clGrayText)}
  clGrayText = Graphics.clGrayText;
{$endif}
{$if declared(clBtnText)}
  clBtnText = Graphics.clBtnText;
{$endif}
{$if declared(clInactiveCaptionText)}
  clInactiveCaptionText = Graphics.clInactiveCaptionText;
{$endif}
{$if declared(clBtnHighlight)}
  clBtnHighlight = Graphics.clBtnHighlight;
{$endif}
{$if declared(cl3DDkShadow)}
  cl3DDkShadow = Graphics.cl3DDkShadow;
{$endif}
{$if declared(cl3DLight)}
  cl3DLight = Graphics.cl3DLight;
{$endif}
{$if declared(clInfoText)}
  clInfoText = Graphics.clInfoText;
{$endif}
{$if declared(clInfoBk)}
  clInfoBk = Graphics.clInfoBk;
{$endif}
{$if declared(clHotLight)}
  clHotLight = Graphics.clHotLight;
{$endif}
{$if declared(clGradientActiveCaption)}
  clGradientActiveCaption = Graphics.clGradientActiveCaption;
{$endif}
{$if declared(clGradientInactiveCaption)}
  clGradientInactiveCaption = Graphics.clGradientInactiveCaption;
{$endif}
{$if declared(clMenuHighlight)}
  clMenuHighlight = Graphics.clMenuHighlight;
{$endif}
{$if declared(clMenuBar)}
  clMenuBar = Graphics.clMenuBar;
{$endif}
{$if declared(clForm)}
  clForm = Graphics.clForm;
{$endif}
{$if declared(clColorDesktop)}
  clColorDesktop = Graphics.clColorDesktop;
{$endif}
{$if declared(cl3DFace)}
  cl3DFace = Graphics.cl3DFace;
{$endif}
{$if declared(cl3DShadow)}
  cl3DShadow = Graphics.cl3DShadow;
{$endif}
{$if declared(cl3DHiLight)}
  cl3DHiLight = Graphics.cl3DHiLight;
{$endif}
{$if declared(clBtnHiLight)}
  clBtnHiLight = Graphics.clBtnHiLight;
{$endif}
{$if declared(clFirstSpecialColor)}
  clFirstSpecialColor = Graphics.clFirstSpecialColor;
{$endif}
{$if declared(clMask)}
  clMask = Graphics.clMask;
{$endif}
{$if declared(clDontMask)}
  clDontMask = Graphics.clDontMask;
{$endif}
{$if declared(cmBlackness)}
  cmBlackness = Graphics.cmBlackness;
{$endif}
{$if declared(cmDstInvert)}
  cmDstInvert = Graphics.cmDstInvert;
{$endif}
{$if declared(cmMergeCopy)}
  cmMergeCopy = Graphics.cmMergeCopy;
{$endif}
{$if declared(cmMergePaint)}
  cmMergePaint = Graphics.cmMergePaint;
{$endif}
{$if declared(cmNotSrcCopy)}
  cmNotSrcCopy = Graphics.cmNotSrcCopy;
{$endif}
{$if declared(cmNotSrcErase)}
  cmNotSrcErase = Graphics.cmNotSrcErase;
{$endif}
{$if declared(cmPatCopy)}
  cmPatCopy = Graphics.cmPatCopy;
{$endif}
{$if declared(cmPatInvert)}
  cmPatInvert = Graphics.cmPatInvert;
{$endif}
{$if declared(cmPatPaint)}
  cmPatPaint = Graphics.cmPatPaint;
{$endif}
{$if declared(cmSrcAnd)}
  cmSrcAnd = Graphics.cmSrcAnd;
{$endif}
{$if declared(cmSrcCopy)}
  cmSrcCopy = Graphics.cmSrcCopy;
{$endif}
{$if declared(cmSrcErase)}
  cmSrcErase = Graphics.cmSrcErase;
{$endif}
{$if declared(cmSrcInvert)}
  cmSrcInvert = Graphics.cmSrcInvert;
{$endif}
{$if declared(cmSrcPaint)}
  cmSrcPaint = Graphics.cmSrcPaint;
{$endif}
{$if declared(cmWhiteness)}
  cmWhiteness = Graphics.cmWhiteness;
{$endif}
var
{$if declared(DefFontData)}
  DefFontData: TFontData absolute Graphics.DefFontData;
{$endif}
{$if declared(OnLoadSaveClipBrdGraphicValid)}
  OnLoadSaveClipBrdGraphicValid: boolean absolute Graphics.OnLoadSaveClipBrdGraphicValid;
{$endif}
{$if declared(OnLoadGraphicFromClipboardFormat)}
  OnLoadGraphicFromClipboardFormat: TOnLoadGraphicFromClipboardFormat absolute Graphics.OnLoadGraphicFromClipboardFormat;
{$endif}
{$if declared(OnSaveGraphicToClipboardFormat)}
  OnSaveGraphicToClipboardFormat: TOnSaveGraphicToClipboardFormat absolute Graphics.OnSaveGraphicToClipboardFormat;
{$endif}
{$if declared(OnGetSystemFont)}
  OnGetSystemFont: TOnGetSystemFont absolute Graphics.OnGetSystemFont;
{$endif}
{$if declared(ScreenInfo)}
  ScreenInfo: TScreenInfo absolute Graphics.ScreenInfo;
{$endif}
{$if declared(FontResourceCache)}
  FontResourceCache: TFontHandleCache absolute Graphics.FontResourceCache;
{$endif}
{$if declared(PenResourceCache)}
  PenResourceCache: TPenHandleCache absolute Graphics.PenResourceCache;
{$endif}
{$if declared(BrushResourceCache)}
  BrushResourceCache: TBrushHandleCache absolute Graphics.BrushResourceCache;
{$endif}
{$if declared(GraphicFilter)}
function GraphicFilter(GraphicClass: TGraphicClass): string; inline;
{$endif}
{$if declared(GraphicExtension)}
function GraphicExtension(GraphicClass: TGraphicClass): string; inline;
{$endif}
{$if declared(GraphicFileMask)}
function GraphicFileMask(GraphicClass: TGraphicClass): string; inline;
{$endif}
{$if declared(GetGraphicClassForFileExtension)}
function GetGraphicClassForFileExtension(const FileExt: string): TGraphicClass; inline;
{$endif}
{$if declared(IdentEntry)}
function IdentEntry(Entry: Longint; out MapEntry: TIdentMapEntry): boolean; inline;
{$endif}
{$if declared(ColorToIdent)}
function ColorToIdent(Color: Longint; out Ident: String): Boolean; inline;
{$endif}
{$if declared(IdentToColor)}
function IdentToColor(const Ident: string; out Color: Longint): Boolean; inline;
{$endif}
{$if declared(ColorIndex)}
function ColorIndex(Color: Longint; out Index: Integer): Boolean; inline;
{$endif}
{$if declared(SysColorToSysColorIndex)}
function SysColorToSysColorIndex(Color: TColor): integer; inline;
{$endif}
{$if declared(ColorToRGB)}
function ColorToRGB(Color: TColor): Longint; inline;
{$endif}
{$if declared(ColorToString)}
function ColorToString(Color: TColor): AnsiString; inline;
{$endif}
{$if declared(StringToColor)}
function StringToColor(const S: shortstring): TColor; inline;
{$endif}
{$if declared(StringToColorDef)}
function StringToColorDef(const S: shortstring; const DefaultValue: TColor): TColor; inline;
{$endif}
{$if declared(GetColorValues)}
procedure GetColorValues(Proc: TGetColorStringProc); inline;
{$endif}
{$if declared(InvertColor)}
function InvertColor(AColor: TColor): TColor; inline;
{$endif}
{$if declared(DecColor)}
function DecColor(AColor: TColor; AQuantity: Byte): TColor; inline;
{$endif}
{$if declared(IncColor)}
function IncColor(AColor: TColor; AQuantity: Byte): TColor; inline;
{$endif}
{$if declared(IsSysColor)}
function IsSysColor(AColor: TColorRef): Boolean; inline;
{$endif}
{$if declared(Blue)}
function Blue(rgb: TColorRef): BYTE; inline;
{$endif}
{$if declared(Green)}
function Green(rgb: TColorRef): BYTE; inline;
{$endif}
{$if declared(Red)}
function Red(rgb: TColorRef): BYTE; inline;
{$endif}
{$if declared(RGBToColor)}
function RGBToColor(R, G, B: Byte): TColor; inline;
{$endif}
{$if declared(RedGreenBlue)}
procedure RedGreenBlue(rgb: TColorRef; out Red, Green, Blue: Byte); inline;
{$endif}
{$if declared(FPColorToTColorRef)}
function FPColorToTColorRef(const FPColor: TFPColor): TColorRef; inline;
{$endif}
{$if declared(FPColorToTColor)}
function FPColorToTColor(const FPColor: TFPColor): TColor; inline;
{$endif}
{$if declared(TColorToFPColor)}
function TColorToFPColor(const c: TColorRef): TFPColor; overload; inline;
{$endif}
{$if declared(TColorToFPColor)}
function TColorToFPColor(const c: TColor): TFPColor; overload; inline;
{$endif}
{$if declared(GetCharsetValues)}
procedure GetCharsetValues(Proc: TGetStrProc); inline;
{$endif}
{$if declared(CharsetToIdent)}
function CharsetToIdent(Charset: Longint; out Ident: string): Boolean; inline;
{$endif}
{$if declared(IdentToCharset)}
function IdentToCharset(const Ident: string; out Charset: Longint): Boolean; inline;
{$endif}
{$if declared(GetFontData)}
function GetFontData(Font: HFont): TFontData; inline;
{$endif}
{$if declared(GetDefFontCharSet)}
function GetDefFontCharSet: TFontCharSet; inline;
{$endif}
{$if declared(IsFontNameXLogicalFontDesc)}
function IsFontNameXLogicalFontDesc(const LongFontName: string): boolean; inline;
{$endif}
{$if declared(XLFDNameToLogFont)}
function XLFDNameToLogFont(const XLFDName: string): TLogFont; inline;
{$endif}
{$if declared(ExtractXLFDItem)}
function ExtractXLFDItem(const XLFDName: string; Index: integer): string; inline;
{$endif}
{$if declared(ExtractFamilyFromXLFDName)}
function ExtractFamilyFromXLFDName(const XLFDName: string): string; inline;
{$endif}
{$if declared(ClearXLFDItem)}
function ClearXLFDItem(const LongFontName: string; Index: integer): string; inline;
{$endif}
{$if declared(ClearXLFDHeight)}
function ClearXLFDHeight(const LongFontName: string): string; inline;
{$endif}
{$if declared(ClearXLFDPitch)}
function ClearXLFDPitch(const LongFontName: string): string; inline;
{$endif}
{$if declared(ClearXLFDStyle)}
function ClearXLFDStyle(const LongFontName: string): string; inline;
{$endif}
{$if declared(XLFDHeightIsSet)}
function XLFDHeightIsSet(const LongFontName: string): boolean; inline;
{$endif}
{$if declared(FontNameToPangoFontDescStr)}
procedure FontNameToPangoFontDescStr(const LongFontName: string; out aFamily,aStyle:String; out aSize: Integer; out aSizeInPixels: Boolean); inline;
{$endif}
{$if declared(TestStreamIsBMP)}
function TestStreamIsBMP(const AStream: TStream): boolean; inline;
{$endif}
{$if declared(TestStreamIsXPM)}
function TestStreamIsXPM(const AStream: TStream): boolean; inline;
{$endif}
{$if declared(TestStreamIsIcon)}
function TestStreamIsIcon(const AStream: TStream): boolean; inline;
{$endif}
{$if declared(TestStreamIsCursor)}
function TestStreamIsCursor(const AStream: TStream): boolean; inline;
{$endif}
{$if declared(XPMToPPChar)}
function XPMToPPChar(const XPM: string): PPChar; inline;
{$endif}
{$if declared(LazResourceXPMToPPChar)}
function LazResourceXPMToPPChar(const ResourceName: string): PPChar; inline;
{$endif}
{$if declared(ReadXPMFromStream)}
function ReadXPMFromStream(Stream: TStream; Size: integer): PPChar; inline;
{$endif}
{$if declared(ReadXPMSize)}
function ReadXPMSize(XPM: PPChar; var Width, Height, ColorCount: integer): boolean; inline;
{$endif}
{$if declared(LoadCursorFromLazarusResource)}
function LoadCursorFromLazarusResource(ACursorName: String): HCursor; inline;
{$endif}
{$if declared(CreateGraphicFromResourceName)}
function CreateGraphicFromResourceName(Instance: TLCLHandle; const ResName: String): TGraphic; inline;
{$endif}
{$if declared(CreateBitmapFromResourceName)}
function CreateBitmapFromResourceName(Instance: TLCLHandle; const ResName: String): TCustomBitmap; inline;
{$endif}
{$if declared(CreateBitmapFromLazarusResource)}
function CreateBitmapFromLazarusResource(const AName: String): TCustomBitmap; overload; inline;
{$endif}
{$if declared(CreateBitmapFromLazarusResource)}
function CreateBitmapFromLazarusResource(const AName: String; AMinimumClass: TCustomBitmapClass): TCustomBitmap; overload; inline;
{$endif}
{$if declared(CreateBitmapFromLazarusResource)}
function CreateBitmapFromLazarusResource(AHandle: TLResource): TCustomBitmap; overload; inline;
{$endif}
{$if declared(CreateBitmapFromLazarusResource)}
function CreateBitmapFromLazarusResource(AHandle: TLResource; AMinimumClass: TCustomBitmapClass): TCustomBitmap; overload; inline;
{$endif}
{$if declared(CreateCompatibleBitmaps)}
function CreateCompatibleBitmaps(const ARawImage: TRawImage; out ABitmap, AMask: HBitmap; ASkipMask: Boolean = False): Boolean; inline;
{$endif}
{$if declared(CreateBitmapFromFPImage)}
function CreateBitmapFromFPImage(Img: TFPCustomImage): TBitmap; inline;
{$endif}
{$if declared(AllocPatternBitmap)}
function AllocPatternBitmap(colorBG, colorFG: TColor): TBitmap; inline;
{$endif}
{$if declared(DbgS)}
function DbgS(const Style: TFontStyles): string; overload; inline;
{$endif}
{$if declared(ScaleX)}
function ScaleX(const SizeX, FromDPI: Integer): Integer; inline;
{$endif}
{$if declared(ScaleY)}
function ScaleY(const SizeY, FromDPI: Integer): Integer; inline;
{$endif}

implementation

{$if declared(GraphicFilter)}
function GraphicFilter(GraphicClass: TGraphicClass): string;
begin
  Result := Graphics.GraphicFilter(GraphicClass);
end;

{$endif}
{$if declared(GraphicExtension)}
function GraphicExtension(GraphicClass: TGraphicClass): string;
begin
  Result := Graphics.GraphicExtension(GraphicClass);
end;

{$endif}
{$if declared(GraphicFileMask)}
function GraphicFileMask(GraphicClass: TGraphicClass): string;
begin
  Result := Graphics.GraphicFileMask(GraphicClass);
end;

{$endif}
{$if declared(GetGraphicClassForFileExtension)}
function GetGraphicClassForFileExtension(const FileExt: string): TGraphicClass;
begin
  Result := Graphics.GetGraphicClassForFileExtension(FileExt);
end;

{$endif}
{$if declared(IdentEntry)}
function IdentEntry(Entry: Longint; out MapEntry: TIdentMapEntry): boolean;
begin
  Result := Graphics.IdentEntry(Entry, MapEntry);
end;

{$endif}
{$if declared(ColorToIdent)}
function ColorToIdent(Color: Longint; out Ident: String): Boolean;
begin
  Result := Graphics.ColorToIdent(Color, Ident);
end;

{$endif}
{$if declared(IdentToColor)}
function IdentToColor(const Ident: string; out Color: Longint): Boolean;
begin
  Result := Graphics.IdentToColor(Ident, Color);
end;

{$endif}
{$if declared(ColorIndex)}
function ColorIndex(Color: Longint; out Index: Integer): Boolean;
begin
  Result := Graphics.ColorIndex(Color, Index);
end;

{$endif}
{$if declared(SysColorToSysColorIndex)}
function SysColorToSysColorIndex(Color: TColor): integer;
begin
  Result := Graphics.SysColorToSysColorIndex(Color);
end;

{$endif}
{$if declared(ColorToRGB)}
function ColorToRGB(Color: TColor): Longint;
begin
  Result := Graphics.ColorToRGB(Color);
end;

{$endif}
{$if declared(ColorToString)}
function ColorToString(Color: TColor): AnsiString;
begin
  Result := Graphics.ColorToString(Color);
end;

{$endif}
{$if declared(StringToColor)}
function StringToColor(const S: shortstring): TColor;
begin
  Result := Graphics.StringToColor(S);
end;

{$endif}
{$if declared(StringToColorDef)}
function StringToColorDef(const S: shortstring; const DefaultValue: TColor): TColor;
begin
  Result := Graphics.StringToColorDef(S, DefaultValue);
end;

{$endif}
{$if declared(GetColorValues)}
procedure GetColorValues(Proc: TGetColorStringProc);
begin
  Graphics.GetColorValues(Proc);
end;

{$endif}
{$if declared(InvertColor)}
function InvertColor(AColor: TColor): TColor;
begin
  Result := Graphics.InvertColor(AColor);
end;

{$endif}
{$if declared(DecColor)}
function DecColor(AColor: TColor; AQuantity: Byte): TColor;
begin
  Result := Graphics.DecColor(AColor, AQuantity);
end;

{$endif}
{$if declared(IncColor)}
function IncColor(AColor: TColor; AQuantity: Byte): TColor;
begin
  Result := Graphics.IncColor(AColor, AQuantity);
end;

{$endif}
{$if declared(IsSysColor)}
function IsSysColor(AColor: TColorRef): Boolean;
begin
  Result := Graphics.IsSysColor(AColor);
end;

{$endif}
{$if declared(Blue)}
function Blue(rgb: TColorRef): BYTE;
begin
  Result := Graphics.Blue(rgb);
end;

{$endif}
{$if declared(Green)}
function Green(rgb: TColorRef): BYTE;
begin
  Result := Graphics.Green(rgb);
end;

{$endif}
{$if declared(Red)}
function Red(rgb: TColorRef): BYTE;
begin
  Result := Graphics.Red(rgb);
end;

{$endif}
{$if declared(RGBToColor)}
function RGBToColor(R, G, B: Byte): TColor;
begin
  Result := Graphics.RGBToColor(R, G, B);
end;

{$endif}
{$if declared(RedGreenBlue)}
procedure RedGreenBlue(rgb: TColorRef; out Red, Green, Blue: Byte);
begin
  Graphics.RedGreenBlue(rgb, Red, Green, Blue);
end;

{$endif}
{$if declared(FPColorToTColorRef)}
function FPColorToTColorRef(const FPColor: TFPColor): TColorRef;
begin
  Result := Graphics.FPColorToTColorRef(FPColor);
end;

{$endif}
{$if declared(FPColorToTColor)}
function FPColorToTColor(const FPColor: TFPColor): TColor;
begin
  Result := Graphics.FPColorToTColor(FPColor);
end;

{$endif}
{$if declared(TColorToFPColor)}
function TColorToFPColor(const c: TColorRef): TFPColor;
begin
  Result := Graphics.TColorToFPColor(c);
end;

{$endif}
{$if declared(TColorToFPColor)}
function TColorToFPColor(const c: TColor): TFPColor;
begin
  Result := Graphics.TColorToFPColor(c);
end;

{$endif}
{$if declared(GetCharsetValues)}
procedure GetCharsetValues(Proc: TGetStrProc);
begin
  Graphics.GetCharsetValues(Proc);
end;

{$endif}
{$if declared(CharsetToIdent)}
function CharsetToIdent(Charset: Longint; out Ident: string): Boolean;
begin
  Result := Graphics.CharsetToIdent(Charset, Ident);
end;

{$endif}
{$if declared(IdentToCharset)}
function IdentToCharset(const Ident: string; out Charset: Longint): Boolean;
begin
  Result := Graphics.IdentToCharset(Ident, Charset);
end;

{$endif}
{$if declared(GetFontData)}
function GetFontData(Font: HFont): TFontData;
begin
  Result := Graphics.GetFontData(Font);
end;

{$endif}
{$if declared(GetDefFontCharSet)}
function GetDefFontCharSet: TFontCharSet;
begin
  Result := Graphics.GetDefFontCharSet;
end;

{$endif}
{$if declared(IsFontNameXLogicalFontDesc)}
function IsFontNameXLogicalFontDesc(const LongFontName: string): boolean;
begin
  Result := Graphics.IsFontNameXLogicalFontDesc(LongFontName);
end;

{$endif}
{$if declared(XLFDNameToLogFont)}
function XLFDNameToLogFont(const XLFDName: string): TLogFont;
begin
  Result := Graphics.XLFDNameToLogFont(XLFDName);
end;

{$endif}
{$if declared(ExtractXLFDItem)}
function ExtractXLFDItem(const XLFDName: string; Index: integer): string;
begin
  Result := Graphics.ExtractXLFDItem(XLFDName, Index);
end;

{$endif}
{$if declared(ExtractFamilyFromXLFDName)}
function ExtractFamilyFromXLFDName(const XLFDName: string): string;
begin
  Result := Graphics.ExtractFamilyFromXLFDName(XLFDName);
end;

{$endif}
{$if declared(ClearXLFDItem)}
function ClearXLFDItem(const LongFontName: string; Index: integer): string;
begin
  Result := Graphics.ClearXLFDItem(LongFontName, Index);
end;

{$endif}
{$if declared(ClearXLFDHeight)}
function ClearXLFDHeight(const LongFontName: string): string;
begin
  Result := Graphics.ClearXLFDHeight(LongFontName);
end;

{$endif}
{$if declared(ClearXLFDPitch)}
function ClearXLFDPitch(const LongFontName: string): string;
begin
  Result := Graphics.ClearXLFDPitch(LongFontName);
end;

{$endif}
{$if declared(ClearXLFDStyle)}
function ClearXLFDStyle(const LongFontName: string): string;
begin
  Result := Graphics.ClearXLFDStyle(LongFontName);
end;

{$endif}
{$if declared(XLFDHeightIsSet)}
function XLFDHeightIsSet(const LongFontName: string): boolean;
begin
  Result := Graphics.XLFDHeightIsSet(LongFontName);
end;

{$endif}
{$if declared(FontNameToPangoFontDescStr)}
procedure FontNameToPangoFontDescStr(const LongFontName: string; out aFamily,aStyle:String; out aSize: Integer; out aSizeInPixels: Boolean);
begin
  Graphics.FontNameToPangoFontDescStr(LongFontName, aFamily, aStyle, aSize, aSizeInPixels);
end;

{$endif}
{$if declared(TestStreamIsBMP)}
function TestStreamIsBMP(const AStream: TStream): boolean;
begin
  Result := Graphics.TestStreamIsBMP(AStream);
end;

{$endif}
{$if declared(TestStreamIsXPM)}
function TestStreamIsXPM(const AStream: TStream): boolean;
begin
  Result := Graphics.TestStreamIsXPM(AStream);
end;

{$endif}
{$if declared(TestStreamIsIcon)}
function TestStreamIsIcon(const AStream: TStream): boolean;
begin
  Result := Graphics.TestStreamIsIcon(AStream);
end;

{$endif}
{$if declared(TestStreamIsCursor)}
function TestStreamIsCursor(const AStream: TStream): boolean;
begin
  Result := Graphics.TestStreamIsCursor(AStream);
end;

{$endif}
{$if declared(XPMToPPChar)}
function XPMToPPChar(const XPM: string): PPChar;
begin
  Result := Graphics.XPMToPPChar(XPM);
end;

{$endif}
{$if declared(LazResourceXPMToPPChar)}
function LazResourceXPMToPPChar(const ResourceName: string): PPChar;
begin
  Result := Graphics.LazResourceXPMToPPChar(ResourceName);
end;

{$endif}
{$if declared(ReadXPMFromStream)}
function ReadXPMFromStream(Stream: TStream; Size: integer): PPChar;
begin
  Result := Graphics.ReadXPMFromStream(Stream, Size);
end;

{$endif}
{$if declared(ReadXPMSize)}
function ReadXPMSize(XPM: PPChar; var Width, Height, ColorCount: integer): boolean;
begin
  Result := Graphics.ReadXPMSize(XPM, Width, Height, ColorCount);
end;

{$endif}
{$if declared(LoadCursorFromLazarusResource)}
function LoadCursorFromLazarusResource(ACursorName: String): HCursor;
begin
  Result := Graphics.LoadCursorFromLazarusResource(ACursorName);
end;

{$endif}
{$if declared(CreateGraphicFromResourceName)}
function CreateGraphicFromResourceName(Instance: TLCLHandle; const ResName: String): TGraphic;
begin
  Result := Graphics.CreateGraphicFromResourceName(Instance, ResName);
end;

{$endif}
{$if declared(CreateBitmapFromResourceName)}
function CreateBitmapFromResourceName(Instance: TLCLHandle; const ResName: String): TCustomBitmap;
begin
  Result := Graphics.CreateBitmapFromResourceName(Instance, ResName);
end;

{$endif}
{$if declared(CreateBitmapFromLazarusResource)}
function CreateBitmapFromLazarusResource(const AName: String): TCustomBitmap;
begin
  Result := Graphics.CreateBitmapFromLazarusResource(AName);
end;

{$endif}
{$if declared(CreateBitmapFromLazarusResource)}
function CreateBitmapFromLazarusResource(const AName: String; AMinimumClass: TCustomBitmapClass): TCustomBitmap;
begin
  Result := Graphics.CreateBitmapFromLazarusResource(AName, AMinimumClass);
end;

{$endif}
{$if declared(CreateBitmapFromLazarusResource)}
function CreateBitmapFromLazarusResource(AHandle: TLResource): TCustomBitmap;
begin
  Result := Graphics.CreateBitmapFromLazarusResource(AHandle);
end;

{$endif}
{$if declared(CreateBitmapFromLazarusResource)}
function CreateBitmapFromLazarusResource(AHandle: TLResource; AMinimumClass: TCustomBitmapClass): TCustomBitmap;
begin
  Result := Graphics.CreateBitmapFromLazarusResource(AHandle, AMinimumClass);
end;

{$endif}
{$if declared(CreateCompatibleBitmaps)}
function CreateCompatibleBitmaps(const ARawImage: TRawImage; out ABitmap, AMask: HBitmap; ASkipMask: Boolean = False): Boolean;
begin
  Result := Graphics.CreateCompatibleBitmaps(ARawImage, ABitmap, AMask, ASkipMask);
end;

{$endif}
{$if declared(CreateBitmapFromFPImage)}
function CreateBitmapFromFPImage(Img: TFPCustomImage): TBitmap;
begin
  Result := Graphics.CreateBitmapFromFPImage(Img);
end;

{$endif}
{$if declared(AllocPatternBitmap)}
function AllocPatternBitmap(colorBG, colorFG: TColor): TBitmap;
begin
  Result := Graphics.AllocPatternBitmap(colorBG, colorFG);
end;

{$endif}
{$if declared(DbgS)}
function DbgS(const Style: TFontStyles): string;
begin
  Result := Graphics.DbgS(Style);
end;

{$endif}
{$if declared(ScaleX)}
function ScaleX(const SizeX, FromDPI: Integer): Integer;
begin
  Result := Graphics.ScaleX(SizeX, FromDPI);
end;

{$endif}
{$if declared(ScaleY)}
function ScaleY(const SizeY, FromDPI: Integer): Integer;
begin
  Result := Graphics.ScaleY(SizeY, FromDPI);
end;

{$endif}
end.
