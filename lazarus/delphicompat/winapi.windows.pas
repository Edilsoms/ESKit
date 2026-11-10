{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Winapi.Windows
  Gerado por tools/genvclcompat.py a partir de LCLType, LCLIntf.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Winapi.Windows;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  System.UITypes, Classes, SysUtils, WSReferences, Math, Types, InterfaceBase, GraphType, GraphMath, LazSysUtils, LCLType, LCLIntf;
type
{$if declared(TUTF8Char)}
  TUTF8Char = LCLType.TUTF8Char;
{$endif}
{$if declared(TTranslateString)}
  TTranslateString = LCLType.TTranslateString;
{$endif}
{$if declared(PCriticalSection)}
  PCriticalSection = LCLType.PCriticalSection;
{$endif}
{$if declared(TDockImageOperation)}
  TDockImageOperation = LCLType.TDockImageOperation;
{$endif}
{$if declared(TNativeHandleType)}
  TNativeHandleType = LCLType.TNativeHandleType;
{$endif}
{$if declared(TNativeHandleTypes)}
  TNativeHandleTypes = LCLType.TNativeHandleTypes;
{$endif}
{$if declared(TNativeCanvasType)}
  TNativeCanvasType = LCLType.TNativeCanvasType;
{$endif}
{$if declared(TNativeCanvasTypes)}
  TNativeCanvasTypes = LCLType.TNativeCanvasTypes;
{$endif}
{$if declared(TOnShowSelectItemDialogResult)}
  TOnShowSelectItemDialogResult = LCLType.TOnShowSelectItemDialogResult;
{$endif}
{$if (not defined(WINDOWS))}
{$if declared(PInt)}
  PInt = LCLType.PInt;
{$endif}
{$endif}
{$if declared(HDC)}
  HDC = LCLType.HDC;
{$endif}
{$if declared(HHOOK)}
  HHOOK = LCLType.HHOOK;
{$endif}
{$if declared(HFONT)}
  HFONT = LCLType.HFONT;
{$endif}
{$if declared(HGDIOBJ)}
  HGDIOBJ = LCLType.HGDIOBJ;
{$endif}
{$if declared(HPEN)}
  HPEN = LCLType.HPEN;
{$endif}
{$if declared(HRGN)}
  HRGN = LCLType.HRGN;
{$endif}
{$if declared(HINST)}
  HINST = LCLType.HINST;
{$endif}
{$if declared(HICON)}
  HICON = LCLType.HICON;
{$endif}
{$if declared(HIMAGELIST)}
  HIMAGELIST = LCLType.HIMAGELIST;
{$endif}
{$if declared(HGLOBAL)}
  HGLOBAL = LCLType.HGLOBAL;
{$endif}
{$if declared(HWND)}
  HWND = LCLType.HWND;
{$endif}
{$if declared(HMENU)}
  HMENU = LCLType.HMENU;
{$endif}
{$if declared(HBITMAP)}
  HBITMAP = LCLType.HBITMAP;
{$endif}
{$if declared(HPALETTE)}
  HPALETTE = LCLType.HPALETTE;
{$endif}
{$if declared(HBRUSH)}
  HBRUSH = LCLType.HBRUSH;
{$endif}
{$if declared(HMONITOR)}
  HMONITOR = LCLType.HMONITOR;
{$endif}
{$if (not defined(WINDOWS))}
{$if declared(PRect)}
  PRect = LCLType.PRect;
{$endif}
{$endif}
{$if declared(WPARAM)}
  WPARAM = LCLType.WPARAM;
{$endif}
{$if declared(LPARAM)}
  LPARAM = LCLType.LPARAM;
{$endif}
{$if declared(LRESULT)}
  LRESULT = LCLType.LRESULT;
{$endif}
{$if (not defined(WINDOWS))}
{$if declared(ULONG_PTR)}
  ULONG_PTR = LCLType.ULONG_PTR;
{$endif}
{$endif}
{$if declared(PHKEY)}
  PHKEY = LCLType.PHKEY;
{$endif}
{$if declared(TKeyBoardState)}
  TKeyBoardState = LCLType.TKeyBoardState;
{$endif}
{$if declared(PABC)}
  PABC = LCLType.PABC;
{$endif}
{$if declared(_ABC)}
  _ABC = LCLType._ABC;
{$endif}
{$if declared(PNMHdr)}
  PNMHdr = LCLType.PNMHdr;
{$endif}
{$if declared(tagNMHDR)}
  tagNMHDR = LCLType.tagNMHDR;
{$endif}
{$if declared(PScreenInfo)}
  PScreenInfo = LCLType.PScreenInfo;
{$endif}
{$if declared(TScreenInfo)}
  TScreenInfo = LCLType.TScreenInfo;
{$endif}
{$if declared(tagMonitorInfo)}
  tagMonitorInfo = LCLType.tagMonitorInfo;
{$endif}
{$if declared(PMonitorInfo)}
  PMonitorInfo = LCLType.PMonitorInfo;
{$endif}
{$if declared(tagMonitorInfoEx)}
  tagMonitorInfoEx = LCLType.tagMonitorInfoEx;
{$endif}
{$if declared(PMonitorInfoEx)}
  PMonitorInfoEx = LCLType.PMonitorInfoEx;
{$endif}
{$if declared(tagMonitorInfoExW)}
  tagMonitorInfoExW = LCLType.tagMonitorInfoExW;
{$endif}
{$if declared(PMonitorInfoExW)}
  PMonitorInfoExW = LCLType.PMonitorInfoExW;
{$endif}
{$if declared(MONITOR_DPI_TYPE)}
  MONITOR_DPI_TYPE = LCLType.MONITOR_DPI_TYPE;
{$endif}
{$if declared(PDrawItemStruct)}
  PDrawItemStruct = LCLType.PDrawItemStruct;
{$endif}
{$if declared(tagDrawItemStruct)}
  tagDrawItemStruct = LCLType.tagDrawItemStruct;
{$endif}
{$if declared(TOwnerDrawStateType)}
  TOwnerDrawStateType = LCLType.TOwnerDrawStateType;
{$endif}
{$if declared(TOwnerDrawState)}
  TOwnerDrawState = LCLType.TOwnerDrawState;
{$endif}
{$if declared(PDrawListItemStruct)}
  PDrawListItemStruct = LCLType.PDrawListItemStruct;
{$endif}
{$if declared(TDrawListItemStruct)}
  TDrawListItemStruct = LCLType.TDrawListItemStruct;
{$endif}
{$if declared(PMeasureItemStruct)}
  PMeasureItemStruct = LCLType.PMeasureItemStruct;
{$endif}
{$if declared(TMeasureItemStruct)}
  TMeasureItemStruct = LCLType.TMeasureItemStruct;
{$endif}
{$if declared(PPaintStruct)}
  PPaintStruct = LCLType.PPaintStruct;
{$endif}
{$if declared(tagPAINTSTRUCT)}
  tagPAINTSTRUCT = LCLType.tagPAINTSTRUCT;
{$endif}
{$if declared(PWindowPos)}
  PWindowPos = LCLType.PWindowPos;
{$endif}
{$if declared(tagWindowPos)}
  tagWindowPos = LCLType.tagWindowPos;
{$endif}
{$if declared(tagScrollInfo)}
  tagScrollInfo = LCLType.tagScrollInfo;
{$endif}
{$if declared(PScrollInfo)}
  PScrollInfo = LCLType.PScrollInfo;
{$endif}
{$if declared(PPaletteEntry)}
  PPaletteEntry = LCLType.PPaletteEntry;
{$endif}
{$if declared(tagPALETTEENTRY)}
  tagPALETTEENTRY = LCLType.tagPALETTEENTRY;
{$endif}
{$if declared(PLogPalette)}
  PLogPalette = LCLType.PLogPalette;
{$endif}
{$if declared(tagLOGPALETTE)}
  tagLOGPALETTE = LCLType.tagLOGPALETTE;
{$endif}
{$if declared(PTriVertex)}
  PTriVertex = LCLType.PTriVertex;
{$endif}
{$if declared(tagTRIVERTEX)}
  tagTRIVERTEX = LCLType.tagTRIVERTEX;
{$endif}
{$if declared(PGradientTriangle)}
  PGradientTriangle = LCLType.PGradientTriangle;
{$endif}
{$if declared(tagGRADIENTTRIANGLE)}
  tagGRADIENTTRIANGLE = LCLType.tagGRADIENTTRIANGLE;
{$endif}
{$if declared(PGradientRect)}
  PGradientRect = LCLType.PGradientRect;
{$endif}
{$if declared(tagGRADIENTRECT)}
  tagGRADIENTRECT = LCLType.tagGRADIENTRECT;
{$endif}
{$if declared(PBitmap)}
  PBitmap = LCLType.PBitmap;
{$endif}
{$if declared(tagBITMAP)}
  tagBITMAP = LCLType.tagBITMAP;
{$endif}
{$if declared(PBitmapCoreHeader)}
  PBitmapCoreHeader = LCLType.PBitmapCoreHeader;
{$endif}
{$if declared(tagBITMAPCOREHEADER)}
  tagBITMAPCOREHEADER = LCLType.tagBITMAPCOREHEADER;
{$endif}
{$if declared(PBitmapInfoHeader)}
  PBitmapInfoHeader = LCLType.PBitmapInfoHeader;
{$endif}
{$if declared(tagBITMAPINFOHEADER)}
  tagBITMAPINFOHEADER = LCLType.tagBITMAPINFOHEADER;
{$endif}
{$if declared(PRGBTriple)}
  PRGBTriple = LCLType.PRGBTriple;
{$endif}
{$if declared(tagRGBTRIPLE)}
  tagRGBTRIPLE = LCLType.tagRGBTRIPLE;
{$endif}
{$if declared(PRGBQUAD)}
  PRGBQUAD = LCLType.PRGBQUAD;
{$endif}
{$if declared(tagRGBQUAD)}
  tagRGBQUAD = LCLType.tagRGBQUAD;
{$endif}
{$if declared(TRGBAQuad)}
  TRGBAQuad = LCLType.TRGBAQuad;
{$endif}
{$if declared(PRGBAQuad)}
  PRGBAQuad = LCLType.PRGBAQuad;
{$endif}
{$if declared(TRGBAQuadArray)}
  TRGBAQuadArray = LCLType.TRGBAQuadArray;
{$endif}
{$if declared(PBitmapInfo)}
  PBitmapInfo = LCLType.PBitmapInfo;
{$endif}
{$if declared(tagBITMAPINFO)}
  tagBITMAPINFO = LCLType.tagBITMAPINFO;
{$endif}
{$if declared(PBitmapCoreInfo)}
  PBitmapCoreInfo = LCLType.PBitmapCoreInfo;
{$endif}
{$if declared(tagBITMAPCOREINFO)}
  tagBITMAPCOREINFO = LCLType.tagBITMAPCOREINFO;
{$endif}
{$if declared(PBitmapFileHeader)}
  PBitmapFileHeader = LCLType.PBitmapFileHeader;
{$endif}
{$if declared(tagBITMAPFILEHEADER)}
  tagBITMAPFILEHEADER = LCLType.tagBITMAPFILEHEADER;
{$endif}
{$if declared(PDIBSection)}
  PDIBSection = LCLType.PDIBSection;
{$endif}
{$if declared(tagDIBSECTION)}
  tagDIBSECTION = LCLType.tagDIBSECTION;
{$endif}
{$if declared(tagHELPINFO)}
  tagHELPINFO = LCLType.tagHELPINFO;
{$endif}
{$if declared(PHelpInfo)}
  PHelpInfo = LCLType.PHelpInfo;
{$endif}
{$if declared(PLogFontA)}
  PLogFontA = LCLType.PLogFontA;
{$endif}
{$if declared(PLogFontW)}
  PLogFontW = LCLType.PLogFontW;
{$endif}
{$if declared(LOGFONTA)}
  LOGFONTA = LCLType.LOGFONTA;
{$endif}
{$if declared(LOGFONTW)}
  LOGFONTW = LCLType.LOGFONTW;
{$endif}
{$if declared(LPLOGFONT)}
  LPLOGFONT = LCLType.LPLOGFONT;
{$endif}
{$if declared(PLogBrush)}
  PLogBrush = LCLType.PLogBrush;
{$endif}
{$if declared(tagLOGBRUSH)}
  tagLOGBRUSH = LCLType.tagLOGBRUSH;
{$endif}
{$if declared(TLogGradientStop)}
  TLogGradientStop = LCLType.TLogGradientStop;
{$endif}
{$if declared(TLogRadialGradient)}
  TLogRadialGradient = LCLType.TLogRadialGradient;
{$endif}
{$if declared(PMaxLogPalette)}
  PMaxLogPalette = LCLType.PMaxLogPalette;
{$endif}
{$if declared(TMaxLogPalette)}
  TMaxLogPalette = LCLType.TMaxLogPalette;
{$endif}
{$if declared(PEnumLogFontA)}
  PEnumLogFontA = LCLType.PEnumLogFontA;
{$endif}
{$if declared(PEnumLogFontW)}
  PEnumLogFontW = LCLType.PEnumLogFontW;
{$endif}
{$if declared(tagENUMLOGFONTA)}
  tagENUMLOGFONTA = LCLType.tagENUMLOGFONTA;
{$endif}
{$if declared(tagENUMLOGFONTW)}
  tagENUMLOGFONTW = LCLType.tagENUMLOGFONTW;
{$endif}
{$if declared(PEnumLogFontExA)}
  PEnumLogFontExA = LCLType.PEnumLogFontExA;
{$endif}
{$if declared(PEnumLogFontExW)}
  PEnumLogFontExW = LCLType.PEnumLogFontExW;
{$endif}
{$if declared(tagENUMLOGFONTEXA)}
  tagENUMLOGFONTEXA = LCLType.tagENUMLOGFONTEXA;
{$endif}
{$if declared(tagENUMLOGFONTEXW)}
  tagENUMLOGFONTEXW = LCLType.tagENUMLOGFONTEXW;
{$endif}
{$if declared(PLogPen)}
  PLogPen = LCLType.PLogPen;
{$endif}
{$if declared(tagLOGPEN)}
  tagLOGPEN = LCLType.tagLOGPEN;
{$endif}
{$if declared(PExtLogPen)}
  PExtLogPen = LCLType.PExtLogPen;
{$endif}
{$if declared(tagEXTLOGPEN)}
  tagEXTLOGPEN = LCLType.tagEXTLOGPEN;
{$endif}
{$if declared(PTextMetricA)}
  PTextMetricA = LCLType.PTextMetricA;
{$endif}
{$if declared(PTextMetricW)}
  PTextMetricW = LCLType.PTextMetricW;
{$endif}
{$if declared(tagTextMetricA)}
  tagTextMetricA = LCLType.tagTextMetricA;
{$endif}
{$if declared(tagTEXTMETRICW)}
  tagTEXTMETRICW = LCLType.tagTEXTMETRICW;
{$endif}
{$if declared(TNewTextMetric)}
  TNewTextMetric = LCLType.TNewTextMetric;
{$endif}
{$if declared(TFontSignature)}
  TFontSignature = LCLType.TFontSignature;
{$endif}
{$if declared(TNewTextMetricEx)}
  TNewTextMetricEx = LCLType.TNewTextMetricEx;
{$endif}
{$if declared(FontEnumProc)}
  FontEnumProc = LCLType.FontEnumProc;
{$endif}
{$if declared(FontEnumExProc)}
  FontEnumExProc = LCLType.FontEnumExProc;
{$endif}
{$if declared(MonitorEnumProc)}
  MonitorEnumProc = LCLType.MonitorEnumProc;
{$endif}
{$if declared(PWndClassExA)}
  PWndClassExA = LCLType.PWndClassExA;
{$endif}
{$if declared(PWndClassExW)}
  PWndClassExW = LCLType.PWndClassExW;
{$endif}
{$if declared(tagWNDCLASSEXA)}
  tagWNDCLASSEXA = LCLType.tagWNDCLASSEXA;
{$endif}
{$if declared(tagWNDCLASSEXW)}
  tagWNDCLASSEXW = LCLType.tagWNDCLASSEXW;
{$endif}
{$if declared(PWndClassA)}
  PWndClassA = LCLType.PWndClassA;
{$endif}
{$if declared(PWndClassW)}
  PWndClassW = LCLType.PWndClassW;
{$endif}
{$if declared(tagWNDCLASSA)}
  tagWNDCLASSA = LCLType.tagWNDCLASSA;
{$endif}
{$if declared(tagWNDCLASSW)}
  tagWNDCLASSW = LCLType.tagWNDCLASSW;
{$endif}
{$if declared(PMsg)}
  PMsg = LCLType.PMsg;
{$endif}
{$if declared(tagMSG)}
  tagMSG = LCLType.tagMSG;
{$endif}
{$if declared(TCreateParams)}
  TCreateParams = LCLType.TCreateParams;
{$endif}
{$if declared(TIconInfo)}
  TIconInfo = LCLType.TIconInfo;
{$endif}
{$if declared(PIconInfo)}
  PIconInfo = LCLType.PIconInfo;
{$endif}
{$if declared(TTimerProc)}
  TTimerProc = LCLType.TTimerProc;
{$endif}
{$if declared(TLMTimer)}
  TLMTimer = LCLType.TLMTimer;
{$endif}
{$if declared(PClipboardFormat)}
  PClipboardFormat = LCLType.PClipboardFormat;
{$endif}
{$if declared(TClipboardRequestEvent)}
  TClipboardRequestEvent = LCLType.TClipboardRequestEvent;
{$endif}
{$if declared(TClipboardType)}
  TClipboardType = LCLType.TClipboardType;
{$endif}
{$if declared(TPredefinedClipboardFormat)}
  TPredefinedClipboardFormat = LCLType.TPredefinedClipboardFormat;
{$endif}
{$if declared(TListChangeEvent)}
  TListChangeEvent = LCLType.TListChangeEvent;
{$endif}
{$if declared(TListWithEvent)}
  TListWithEvent = LCLType.TListWithEvent;
{$endif}
{$if declared(PNMListView)}
  PNMListView = LCLType.PNMListView;
{$endif}
{$if declared(TNMListView)}
  TNMListView = LCLType.TNMListView;
{$endif}
{$if declared(TStockFont)}
  TStockFont = LCLType.TStockFont;
{$endif}
{$if declared(UINT)}
  UINT = LCLType.UINT;
{$endif}
{$if declared(UINT_PTR)}
  UINT_PTR = LCLType.UINT_PTR;
{$endif}
{$if declared(TCriticalSection)}
  TCriticalSection = LCLType.TCriticalSection;
{$endif}
{$if declared(HKEY)}
  HKEY = LCLType.HKEY;
{$endif}
{$if declared(HCURSOR)}
  HCURSOR = LCLType.HCURSOR;
{$endif}
{$if declared(Bool)}
  Bool = LCLType.Bool;
{$endif}
{$if declared(Short)}
  Short = LCLType.Short;
{$endif}
{$if declared(TLCLHandle)}
  TLCLHandle = LCLType.TLCLHandle;
{$endif}
{$if declared(TABC)}
  TABC = LCLType.TABC;
{$endif}
{$if declared(TNMHdr)}
  TNMHdr = LCLType.TNMHdr;
{$endif}
{$if declared(NMHDR)}
  NMHDR = LCLType.NMHDR;
{$endif}
{$if declared(TMonitorInfo)}
  TMonitorInfo = LCLType.TMonitorInfo;
{$endif}
{$if declared(TMonitorInfoEx)}
  TMonitorInfoEx = LCLType.TMonitorInfoEx;
{$endif}
{$if declared(TMonitorInfoExW)}
  TMonitorInfoExW = LCLType.TMonitorInfoExW;
{$endif}
{$if declared(TMonitorDpiType)}
  TMonitorDpiType = LCLType.TMonitorDpiType;
{$endif}
{$if declared(TDrawItemStruct)}
  TDrawItemStruct = LCLType.TDrawItemStruct;
{$endif}
{$if declared(DrawItemStruct)}
  DrawItemStruct = LCLType.DrawItemStruct;
{$endif}
{$if declared(TPaintStruct)}
  TPaintStruct = LCLType.TPaintStruct;
{$endif}
{$if declared(PAINTSTRUCT)}
  PAINTSTRUCT = LCLType.PAINTSTRUCT;
{$endif}
{$if declared(TWindowPos)}
  TWindowPos = LCLType.TWindowPos;
{$endif}
{$if declared(WindowPos)}
  WindowPos = LCLType.WindowPos;
{$endif}
{$if declared(TScrollInfo)}
  TScrollInfo = LCLType.TScrollInfo;
{$endif}
{$if declared(TPaletteEntry)}
  TPaletteEntry = LCLType.TPaletteEntry;
{$endif}
{$if declared(PALETTEENTRY)}
  PALETTEENTRY = LCLType.PALETTEENTRY;
{$endif}
{$if declared(LOGPALETTE)}
  LOGPALETTE = LCLType.LOGPALETTE;
{$endif}
{$if declared(TLOGPALETTE)}
  TLOGPALETTE = LCLType.TLOGPALETTE;
{$endif}
{$if declared(TRIVERTEX)}
  TRIVERTEX = LCLType.TRIVERTEX;
{$endif}
{$if declared(TTriVertex)}
  TTriVertex = LCLType.TTriVertex;
{$endif}
{$if declared(GRADIENTTRIANGLE)}
  GRADIENTTRIANGLE = LCLType.GRADIENTTRIANGLE;
{$endif}
{$if declared(TGradientTriangle)}
  TGradientTriangle = LCLType.TGradientTriangle;
{$endif}
{$if declared(GRADIENTRECT)}
  GRADIENTRECT = LCLType.GRADIENTRECT;
{$endif}
{$if declared(TGradientRect)}
  TGradientRect = LCLType.TGradientRect;
{$endif}
{$if declared(BITMAP)}
  BITMAP = LCLType.BITMAP;
{$endif}
{$if declared(TBitmapCoreHeader)}
  TBitmapCoreHeader = LCLType.TBitmapCoreHeader;
{$endif}
{$if declared(BITMAPCOREHEADER)}
  BITMAPCOREHEADER = LCLType.BITMAPCOREHEADER;
{$endif}
{$if declared(TBitmapInfoHeader)}
  TBitmapInfoHeader = LCLType.TBitmapInfoHeader;
{$endif}
{$if declared(BITMAPINFOHEADER)}
  BITMAPINFOHEADER = LCLType.BITMAPINFOHEADER;
{$endif}
{$if declared(TRGBTriple)}
  TRGBTriple = LCLType.TRGBTriple;
{$endif}
{$if declared(RGBTRIPLE)}
  RGBTRIPLE = LCLType.RGBTRIPLE;
{$endif}
{$if declared(TRGBQuad)}
  TRGBQuad = LCLType.TRGBQuad;
{$endif}
{$if declared(RGBQUAD)}
  RGBQUAD = LCLType.RGBQUAD;
{$endif}
{$if declared(TBitmapInfo)}
  TBitmapInfo = LCLType.TBitmapInfo;
{$endif}
{$if declared(BITMAPINFO)}
  BITMAPINFO = LCLType.BITMAPINFO;
{$endif}
{$if declared(TBitmapCoreInfo)}
  TBitmapCoreInfo = LCLType.TBitmapCoreInfo;
{$endif}
{$if declared(BITMAPCOREINFO)}
  BITMAPCOREINFO = LCLType.BITMAPCOREINFO;
{$endif}
{$if declared(TBitmapFileHeader)}
  TBitmapFileHeader = LCLType.TBitmapFileHeader;
{$endif}
{$if declared(BITMAPFILEHEADER)}
  BITMAPFILEHEADER = LCLType.BITMAPFILEHEADER;
{$endif}
{$if declared(TDIBSection)}
  TDIBSection = LCLType.TDIBSection;
{$endif}
{$if declared(DIBSECTION)}
  DIBSECTION = LCLType.DIBSECTION;
{$endif}
{$if declared(THelpInfo)}
  THelpInfo = LCLType.THelpInfo;
{$endif}
{$if declared(COLORREF)}
  COLORREF = LCLType.COLORREF;
{$endif}
{$if declared(TColorRef)}
  TColorRef = LCLType.TColorRef;
{$endif}
{$if declared(TResourceType)}
  TResourceType = LCLType.TResourceType;
{$endif}
{$if declared(TFarProc)}
  TFarProc = LCLType.TFarProc;
{$endif}
{$if declared(TFNWndProc)}
  TFNWndProc = LCLType.TFNWndProc;
{$endif}
{$if declared(PLogFont)}
  PLogFont = LCLType.PLogFont;
{$endif}
{$if declared(tagLOGFONTA)}
  tagLOGFONTA = LCLType.tagLOGFONTA;
{$endif}
{$if declared(tagLOGFONTW)}
  tagLOGFONTW = LCLType.tagLOGFONTW;
{$endif}
{$if declared(tagLOGFONT)}
  tagLOGFONT = LCLType.tagLOGFONT;
{$endif}
{$if declared(TLogFontA)}
  TLogFontA = LCLType.TLogFontA;
{$endif}
{$if declared(TLogFontW)}
  TLogFontW = LCLType.TLogFontW;
{$endif}
{$if declared(TLogFont)}
  TLogFont = LCLType.TLogFont;
{$endif}
{$if declared(LOGFONT)}
  LOGFONT = LCLType.LOGFONT;
{$endif}
{$if declared(TLogBrush)}
  TLogBrush = LCLType.TLogBrush;
{$endif}
{$if declared(LOGBRUSH)}
  LOGBRUSH = LCLType.LOGBRUSH;
{$endif}
{$if declared(PEnumLogFont)}
  PEnumLogFont = LCLType.PEnumLogFont;
{$endif}
{$if declared(tagENUMLOGFONT)}
  tagENUMLOGFONT = LCLType.tagENUMLOGFONT;
{$endif}
{$if declared(TEnumLogFontA)}
  TEnumLogFontA = LCLType.TEnumLogFontA;
{$endif}
{$if declared(TEnumLogFontW)}
  TEnumLogFontW = LCLType.TEnumLogFontW;
{$endif}
{$if declared(TEnumLogFont)}
  TEnumLogFont = LCLType.TEnumLogFont;
{$endif}
{$if declared(ENUMLOGFONTA)}
  ENUMLOGFONTA = LCLType.ENUMLOGFONTA;
{$endif}
{$if declared(ENUMLOGFONTW)}
  ENUMLOGFONTW = LCLType.ENUMLOGFONTW;
{$endif}
{$if declared(ENUMLOGFONT)}
  ENUMLOGFONT = LCLType.ENUMLOGFONT;
{$endif}
{$if declared(PEnumLogFontEx)}
  PEnumLogFontEx = LCLType.PEnumLogFontEx;
{$endif}
{$if declared(tagENUMLOGFONTEX)}
  tagENUMLOGFONTEX = LCLType.tagENUMLOGFONTEX;
{$endif}
{$if declared(TEnumLogFontExA)}
  TEnumLogFontExA = LCLType.TEnumLogFontExA;
{$endif}
{$if declared(TEnumLogFontExW)}
  TEnumLogFontExW = LCLType.TEnumLogFontExW;
{$endif}
{$if declared(TEnumLogFontEx)}
  TEnumLogFontEx = LCLType.TEnumLogFontEx;
{$endif}
{$if declared(ENUMLOGFONTEXA)}
  ENUMLOGFONTEXA = LCLType.ENUMLOGFONTEXA;
{$endif}
{$if declared(ENUMLOGFONTEXW)}
  ENUMLOGFONTEXW = LCLType.ENUMLOGFONTEXW;
{$endif}
{$if declared(ENUMLOGFONTEX)}
  ENUMLOGFONTEX = LCLType.ENUMLOGFONTEX;
{$endif}
{$if declared(TLogPen)}
  TLogPen = LCLType.TLogPen;
{$endif}
{$if declared(LOGPEN)}
  LOGPEN = LCLType.LOGPEN;
{$endif}
{$if declared(TExtLogPen)}
  TExtLogPen = LCLType.TExtLogPen;
{$endif}
{$if declared(EXTLOGPEN)}
  EXTLOGPEN = LCLType.EXTLOGPEN;
{$endif}
{$if declared(PTextMetric)}
  PTextMetric = LCLType.PTextMetric;
{$endif}
{$if declared(tagTEXTMETRIC)}
  tagTEXTMETRIC = LCLType.tagTEXTMETRIC;
{$endif}
{$if declared(TTextMetricA)}
  TTextMetricA = LCLType.TTextMetricA;
{$endif}
{$if declared(TTextMetricW)}
  TTextMetricW = LCLType.TTextMetricW;
{$endif}
{$if declared(TTextMetric)}
  TTextMetric = LCLType.TTextMetric;
{$endif}
{$if declared(TEXTMETRICA)}
  TEXTMETRICA = LCLType.TEXTMETRICA;
{$endif}
{$if declared(TEXTMETRICW)}
  TEXTMETRICW = LCLType.TEXTMETRICW;
{$endif}
{$if declared(TEXTMETRIC)}
  TEXTMETRIC = LCLType.TEXTMETRIC;
{$endif}
{$if declared(PWndClassEx)}
  PWndClassEx = LCLType.PWndClassEx;
{$endif}
{$if declared(tagWNDCLASSEX)}
  tagWNDCLASSEX = LCLType.tagWNDCLASSEX;
{$endif}
{$if declared(TWndClassExA)}
  TWndClassExA = LCLType.TWndClassExA;
{$endif}
{$if declared(TWndClassExW)}
  TWndClassExW = LCLType.TWndClassExW;
{$endif}
{$if declared(TWndClassEx)}
  TWndClassEx = LCLType.TWndClassEx;
{$endif}
{$if declared(WNDCLASSEXA)}
  WNDCLASSEXA = LCLType.WNDCLASSEXA;
{$endif}
{$if declared(WNDCLASSEXW)}
  WNDCLASSEXW = LCLType.WNDCLASSEXW;
{$endif}
{$if declared(WNDCLASSEX)}
  WNDCLASSEX = LCLType.WNDCLASSEX;
{$endif}
{$if declared(PWndClass)}
  PWndClass = LCLType.PWndClass;
{$endif}
{$if declared(tagWNDCLASS)}
  tagWNDCLASS = LCLType.tagWNDCLASS;
{$endif}
{$if declared(TWndClassA)}
  TWndClassA = LCLType.TWndClassA;
{$endif}
{$if declared(TWndClassW)}
  TWndClassW = LCLType.TWndClassW;
{$endif}
{$if declared(TWndClass)}
  TWndClass = LCLType.TWndClass;
{$endif}
{$if declared(WNDCLASSA)}
  WNDCLASSA = LCLType.WNDCLASSA;
{$endif}
{$if declared(WNDCLASSW)}
  WNDCLASSW = LCLType.WNDCLASSW;
{$endif}
{$if declared(WNDCLASS)}
  WNDCLASS = LCLType.WNDCLASS;
{$endif}
{$if declared(TMsg)}
  TMsg = LCLType.TMsg;
{$endif}
{$if declared(_MSG)}
  _MSG = LCLType._MSG;
{$endif}
{$if declared(TFNTimerProc)}
  TFNTimerProc = LCLType.TFNTimerProc;
{$endif}
{$if declared(TClipboardFormat)}
  TClipboardFormat = LCLType.TClipboardFormat;
{$endif}
{$if declared(_NM_LISTVIEW)}
  _NM_LISTVIEW = LCLType._NM_LISTVIEW;
{$endif}
{$if declared(NM_LISTVIEW)}
  NM_LISTVIEW = LCLType.NM_LISTVIEW;
{$endif}
{$if declared(tagNMLISTVIEW)}
  tagNMLISTVIEW = LCLType.tagNMLISTVIEW;
{$endif}
{$if declared(TOpenParamStringProc)}
  TOpenParamStringProc = LCLIntf.TOpenParamStringProc;
{$endif}
const
{$if declared(disShow)}
  disShow = LCLType.disShow;
{$endif}
{$if declared(disMove)}
  disMove = LCLType.disMove;
{$endif}
{$if declared(disHide)}
  disHide = LCLType.disHide;
{$endif}
{$if declared(nhtWindowsHWND)}
  nhtWindowsHWND = LCLType.nhtWindowsHWND;
{$endif}
{$if declared(nhtX11TWindow)}
  nhtX11TWindow = LCLType.nhtX11TWindow;
{$endif}
{$if declared(nhtCocoaNSWindow)}
  nhtCocoaNSWindow = LCLType.nhtCocoaNSWindow;
{$endif}
{$if declared(nhtQtQWidget)}
  nhtQtQWidget = LCLType.nhtQtQWidget;
{$endif}
{$if declared(nctWindowsDC)}
  nctWindowsDC = LCLType.nctWindowsDC;
{$endif}
{$if declared(nctLazCanvas)}
  nctLazCanvas = LCLType.nctLazCanvas;
{$endif}
{$if declared(MDT_EFFECTIVE_DPI)}
  MDT_EFFECTIVE_DPI = LCLType.MDT_EFFECTIVE_DPI;
{$endif}
{$if declared(MDT_ANGULAR_DPI)}
  MDT_ANGULAR_DPI = LCLType.MDT_ANGULAR_DPI;
{$endif}
{$if declared(MDT_RAW_DPI)}
  MDT_RAW_DPI = LCLType.MDT_RAW_DPI;
{$endif}
{$if declared(MDT_DEFAULT)}
  MDT_DEFAULT = LCLType.MDT_DEFAULT;
{$endif}
{$if declared(odSelected)}
  odSelected = LCLType.odSelected;
{$endif}
{$if declared(odGrayed)}
  odGrayed = LCLType.odGrayed;
{$endif}
{$if declared(odDisabled)}
  odDisabled = LCLType.odDisabled;
{$endif}
{$if declared(odChecked)}
  odChecked = LCLType.odChecked;
{$endif}
{$if declared(odFocused)}
  odFocused = LCLType.odFocused;
{$endif}
{$if declared(odDefault)}
  odDefault = LCLType.odDefault;
{$endif}
{$if declared(odHotLight)}
  odHotLight = LCLType.odHotLight;
{$endif}
{$if declared(odInactive)}
  odInactive = LCLType.odInactive;
{$endif}
{$if declared(odNoAccel)}
  odNoAccel = LCLType.odNoAccel;
{$endif}
{$if declared(odNoFocusRect)}
  odNoFocusRect = LCLType.odNoFocusRect;
{$endif}
{$if declared(odReserved1)}
  odReserved1 = LCLType.odReserved1;
{$endif}
{$if declared(odReserved2)}
  odReserved2 = LCLType.odReserved2;
{$endif}
{$if declared(odComboBoxEdit)}
  odComboBoxEdit = LCLType.odComboBoxEdit;
{$endif}
{$if declared(odBackgroundPainted)}
  odBackgroundPainted = LCLType.odBackgroundPainted;
{$endif}
{$if declared(ctPrimarySelection)}
  ctPrimarySelection = LCLType.ctPrimarySelection;
{$endif}
{$if declared(ctSecondarySelection)}
  ctSecondarySelection = LCLType.ctSecondarySelection;
{$endif}
{$if declared(ctClipboard)}
  ctClipboard = LCLType.ctClipboard;
{$endif}
{$if declared(pcfText)}
  pcfText = LCLType.pcfText;
{$endif}
{$if declared(pcfBitmap)}
  pcfBitmap = LCLType.pcfBitmap;
{$endif}
{$if declared(pcfPixmap)}
  pcfPixmap = LCLType.pcfPixmap;
{$endif}
{$if declared(pcfIcon)}
  pcfIcon = LCLType.pcfIcon;
{$endif}
{$if declared(pcfPicture)}
  pcfPicture = LCLType.pcfPicture;
{$endif}
{$if declared(pcfMetaFilePict)}
  pcfMetaFilePict = LCLType.pcfMetaFilePict;
{$endif}
{$if declared(pcfObject)}
  pcfObject = LCLType.pcfObject;
{$endif}
{$if declared(pcfComponent)}
  pcfComponent = LCLType.pcfComponent;
{$endif}
{$if declared(pcfCustomData)}
  pcfCustomData = LCLType.pcfCustomData;
{$endif}
{$if declared(sfSystem)}
  sfSystem = LCLType.sfSystem;
{$endif}
{$if declared(sfHint)}
  sfHint = LCLType.sfHint;
{$endif}
{$if declared(sfIcon)}
  sfIcon = LCLType.sfIcon;
{$endif}
{$if declared(sfMenu)}
  sfMenu = LCLType.sfMenu;
{$endif}
{$if declared(INVALID_HANDLE_VALUE)}
  INVALID_HANDLE_VALUE = LCLType.INVALID_HANDLE_VALUE;
{$endif}
{$if declared(MAXBYTE)}
  MAXBYTE = LCLType.MAXBYTE;
{$endif}
{$if declared(MAXWORD)}
  MAXWORD = LCLType.MAXWORD;
{$endif}
{$if declared(MAXDWORD)}
  MAXDWORD = LCLType.MAXDWORD;
{$endif}
{$if declared(MINCHAR)}
  MINCHAR = LCLType.MINCHAR;
{$endif}
{$if declared(MAXCHAR)}
  MAXCHAR = LCLType.MAXCHAR;
{$endif}
{$if declared(MINSHORT)}
  MINSHORT = LCLType.MINSHORT;
{$endif}
{$if declared(MAXSHORT)}
  MAXSHORT = LCLType.MAXSHORT;
{$endif}
{$if declared(MINLONG)}
  MINLONG = LCLType.MINLONG;
{$endif}
{$if declared(MAXLONG)}
  MAXLONG = LCLType.MAXLONG;
{$endif}
{$if declared(R2_BLACK)}
  R2_BLACK = LCLType.R2_BLACK;
{$endif}
{$if declared(R2_NOTMERGEPEN)}
  R2_NOTMERGEPEN = LCLType.R2_NOTMERGEPEN;
{$endif}
{$if declared(R2_MASKNOTPEN)}
  R2_MASKNOTPEN = LCLType.R2_MASKNOTPEN;
{$endif}
{$if declared(R2_NOTCOPYPEN)}
  R2_NOTCOPYPEN = LCLType.R2_NOTCOPYPEN;
{$endif}
{$if declared(R2_MASKPENNOT)}
  R2_MASKPENNOT = LCLType.R2_MASKPENNOT;
{$endif}
{$if declared(R2_NOT)}
  R2_NOT = LCLType.R2_NOT;
{$endif}
{$if declared(R2_XORPEN)}
  R2_XORPEN = LCLType.R2_XORPEN;
{$endif}
{$if declared(R2_NOTMASKPEN)}
  R2_NOTMASKPEN = LCLType.R2_NOTMASKPEN;
{$endif}
{$if declared(R2_MASKPEN)}
  R2_MASKPEN = LCLType.R2_MASKPEN;
{$endif}
{$if declared(R2_NOTXORPEN)}
  R2_NOTXORPEN = LCLType.R2_NOTXORPEN;
{$endif}
{$if declared(R2_NOP)}
  R2_NOP = LCLType.R2_NOP;
{$endif}
{$if declared(R2_MERGENOTPEN)}
  R2_MERGENOTPEN = LCLType.R2_MERGENOTPEN;
{$endif}
{$if declared(R2_COPYPEN)}
  R2_COPYPEN = LCLType.R2_COPYPEN;
{$endif}
{$if declared(R2_MERGEPENNOT)}
  R2_MERGEPENNOT = LCLType.R2_MERGEPENNOT;
{$endif}
{$if declared(R2_MERGEPEN)}
  R2_MERGEPEN = LCLType.R2_MERGEPEN;
{$endif}
{$if declared(R2_WHITE)}
  R2_WHITE = LCLType.R2_WHITE;
{$endif}
{$if declared(R2_LAST)}
  R2_LAST = LCLType.R2_LAST;
{$endif}
{$if declared(SRCCOPY)}
  SRCCOPY = LCLType.SRCCOPY;
{$endif}
{$if declared(SRCPAINT)}
  SRCPAINT = LCLType.SRCPAINT;
{$endif}
{$if declared(SRCAND)}
  SRCAND = LCLType.SRCAND;
{$endif}
{$if declared(SRCINVERT)}
  SRCINVERT = LCLType.SRCINVERT;
{$endif}
{$if declared(SRCERASE)}
  SRCERASE = LCLType.SRCERASE;
{$endif}
{$if declared(NOTSRCCOPY)}
  NOTSRCCOPY = LCLType.NOTSRCCOPY;
{$endif}
{$if declared(NOTSRCERASE)}
  NOTSRCERASE = LCLType.NOTSRCERASE;
{$endif}
{$if declared(MERGECOPY)}
  MERGECOPY = LCLType.MERGECOPY;
{$endif}
{$if declared(MERGEPAINT)}
  MERGEPAINT = LCLType.MERGEPAINT;
{$endif}
{$if declared(PATCOPY)}
  PATCOPY = LCLType.PATCOPY;
{$endif}
{$if declared(PATPAINT)}
  PATPAINT = LCLType.PATPAINT;
{$endif}
{$if declared(PATINVERT)}
  PATINVERT = LCLType.PATINVERT;
{$endif}
{$if declared(DSTINVERT)}
  DSTINVERT = LCLType.DSTINVERT;
{$endif}
{$if declared(BLACKNESS)}
  BLACKNESS = LCLType.BLACKNESS;
{$endif}
{$if declared(WHITENESS)}
  WHITENESS = LCLType.WHITENESS;
{$endif}
{$if declared(ETO_OPAQUE)}
  ETO_OPAQUE = LCLType.ETO_OPAQUE;
{$endif}
{$if declared(ETO_CLIPPED)}
  ETO_CLIPPED = LCLType.ETO_CLIPPED;
{$endif}
{$if declared(ETO_RTLREADING)}
  ETO_RTLREADING = LCLType.ETO_RTLREADING;
{$endif}
{$if declared(CS_VREDRAW)}
  CS_VREDRAW = LCLType.CS_VREDRAW;
{$endif}
{$if declared(CS_HREDRAW)}
  CS_HREDRAW = LCLType.CS_HREDRAW;
{$endif}
{$if declared(RGN_AND)}
  RGN_AND = LCLType.RGN_AND;
{$endif}
{$if declared(RGN_OR)}
  RGN_OR = LCLType.RGN_OR;
{$endif}
{$if declared(RGN_XOR)}
  RGN_XOR = LCLType.RGN_XOR;
{$endif}
{$if declared(RGN_DIFF)}
  RGN_DIFF = LCLType.RGN_DIFF;
{$endif}
{$if declared(RGN_COPY)}
  RGN_COPY = LCLType.RGN_COPY;
{$endif}
{$if declared(DT_TOP)}
  DT_TOP = LCLType.DT_TOP;
{$endif}
{$if declared(DT_LEFT)}
  DT_LEFT = LCLType.DT_LEFT;
{$endif}
{$if declared(DT_CENTER)}
  DT_CENTER = LCLType.DT_CENTER;
{$endif}
{$if declared(DT_RIGHT)}
  DT_RIGHT = LCLType.DT_RIGHT;
{$endif}
{$if declared(DT_VCENTER)}
  DT_VCENTER = LCLType.DT_VCENTER;
{$endif}
{$if declared(DT_BOTTOM)}
  DT_BOTTOM = LCLType.DT_BOTTOM;
{$endif}
{$if declared(DT_WORDBREAK)}
  DT_WORDBREAK = LCLType.DT_WORDBREAK;
{$endif}
{$if declared(DT_SINGLELINE)}
  DT_SINGLELINE = LCLType.DT_SINGLELINE;
{$endif}
{$if declared(DT_EXPANDTABS)}
  DT_EXPANDTABS = LCLType.DT_EXPANDTABS;
{$endif}
{$if declared(DT_NOCLIP)}
  DT_NOCLIP = LCLType.DT_NOCLIP;
{$endif}
{$if declared(DT_CALCRECT)}
  DT_CALCRECT = LCLType.DT_CALCRECT;
{$endif}
{$if declared(DT_NOPREFIX)}
  DT_NOPREFIX = LCLType.DT_NOPREFIX;
{$endif}
{$if declared(DT_INTERNAL)}
  DT_INTERNAL = LCLType.DT_INTERNAL;
{$endif}
{$if declared(DT_EDITCONTROL)}
  DT_EDITCONTROL = LCLType.DT_EDITCONTROL;
{$endif}
{$if declared(DT_END_ELLIPSIS)}
  DT_END_ELLIPSIS = LCLType.DT_END_ELLIPSIS;
{$endif}
{$if declared(DT_MODIFYSTRING)}
  DT_MODIFYSTRING = LCLType.DT_MODIFYSTRING;
{$endif}
{$if declared(DT_RTLREADING)}
  DT_RTLREADING = LCLType.DT_RTLREADING;
{$endif}
{$if declared(DT_HIDEPREFIX)}
  DT_HIDEPREFIX = LCLType.DT_HIDEPREFIX;
{$endif}
{$if declared(DT_PREFIXONLY)}
  DT_PREFIXONLY = LCLType.DT_PREFIXONLY;
{$endif}
{$if declared(DFC_CAPTION)}
  DFC_CAPTION = LCLType.DFC_CAPTION;
{$endif}
{$if declared(DFC_MENU)}
  DFC_MENU = LCLType.DFC_MENU;
{$endif}
{$if declared(DFC_SCROLL)}
  DFC_SCROLL = LCLType.DFC_SCROLL;
{$endif}
{$if declared(DFC_BUTTON)}
  DFC_BUTTON = LCLType.DFC_BUTTON;
{$endif}
{$if declared(DFCS_BUTTONCHECK)}
  DFCS_BUTTONCHECK = LCLType.DFCS_BUTTONCHECK;
{$endif}
{$if declared(DFCS_BUTTONRADIOIMAGE)}
  DFCS_BUTTONRADIOIMAGE = LCLType.DFCS_BUTTONRADIOIMAGE;
{$endif}
{$if declared(DFCS_BUTTONRADIOMASK)}
  DFCS_BUTTONRADIOMASK = LCLType.DFCS_BUTTONRADIOMASK;
{$endif}
{$if declared(DFCS_BUTTONRADIO)}
  DFCS_BUTTONRADIO = LCLType.DFCS_BUTTONRADIO;
{$endif}
{$if declared(DFCS_BUTTON3STATE)}
  DFCS_BUTTON3STATE = LCLType.DFCS_BUTTON3STATE;
{$endif}
{$if declared(DFCS_BUTTONPUSH)}
  DFCS_BUTTONPUSH = LCLType.DFCS_BUTTONPUSH;
{$endif}
{$if declared(DFCS_CAPTIONCLOSE)}
  DFCS_CAPTIONCLOSE = LCLType.DFCS_CAPTIONCLOSE;
{$endif}
{$if declared(DFCS_CAPTIONMIN)}
  DFCS_CAPTIONMIN = LCLType.DFCS_CAPTIONMIN;
{$endif}
{$if declared(DFCS_CAPTIONMAX)}
  DFCS_CAPTIONMAX = LCLType.DFCS_CAPTIONMAX;
{$endif}
{$if declared(DFCS_CAPTIONRESTORE)}
  DFCS_CAPTIONRESTORE = LCLType.DFCS_CAPTIONRESTORE;
{$endif}
{$if declared(DFCS_CAPTIONHELP)}
  DFCS_CAPTIONHELP = LCLType.DFCS_CAPTIONHELP;
{$endif}
{$if declared(DFCS_MENUARROW)}
  DFCS_MENUARROW = LCLType.DFCS_MENUARROW;
{$endif}
{$if declared(DFCS_MENUCHECK)}
  DFCS_MENUCHECK = LCLType.DFCS_MENUCHECK;
{$endif}
{$if declared(DFCS_MENUBULLET)}
  DFCS_MENUBULLET = LCLType.DFCS_MENUBULLET;
{$endif}
{$if declared(DFCS_SCROLLDOWN)}
  DFCS_SCROLLDOWN = LCLType.DFCS_SCROLLDOWN;
{$endif}
{$if declared(DFCS_SCROLLLEFT)}
  DFCS_SCROLLLEFT = LCLType.DFCS_SCROLLLEFT;
{$endif}
{$if declared(DFCS_SCROLLRIGHT)}
  DFCS_SCROLLRIGHT = LCLType.DFCS_SCROLLRIGHT;
{$endif}
{$if declared(DFCS_SCROLLCOMBOBOX)}
  DFCS_SCROLLCOMBOBOX = LCLType.DFCS_SCROLLCOMBOBOX;
{$endif}
{$if declared(DFCS_SCROLLSIZEGRIP)}
  DFCS_SCROLLSIZEGRIP = LCLType.DFCS_SCROLLSIZEGRIP;
{$endif}
{$if declared(DFCS_SCROLLUP)}
  DFCS_SCROLLUP = LCLType.DFCS_SCROLLUP;
{$endif}
{$if declared(DFCS_INACTIVE)}
  DFCS_INACTIVE = LCLType.DFCS_INACTIVE;
{$endif}
{$if declared(DFCS_PUSHED)}
  DFCS_PUSHED = LCLType.DFCS_PUSHED;
{$endif}
{$if declared(DFCS_CHECKED)}
  DFCS_CHECKED = LCLType.DFCS_CHECKED;
{$endif}
{$if declared(DFCS_TRANSPARENT)}
  DFCS_TRANSPARENT = LCLType.DFCS_TRANSPARENT;
{$endif}
{$if declared(DFCS_HOT)}
  DFCS_HOT = LCLType.DFCS_HOT;
{$endif}
{$if declared(DFCS_ADJUSTRECT)}
  DFCS_ADJUSTRECT = LCLType.DFCS_ADJUSTRECT;
{$endif}
{$if declared(DFCS_FLAT)}
  DFCS_FLAT = LCLType.DFCS_FLAT;
{$endif}
{$if declared(DFCS_MONO)}
  DFCS_MONO = LCLType.DFCS_MONO;
{$endif}
{$if declared(HTERROR)}
  HTERROR = LCLType.HTERROR;
{$endif}
{$if declared(HTTRANSPARENT)}
  HTTRANSPARENT = LCLType.HTTRANSPARENT;
{$endif}
{$if declared(HTNOWHERE)}
  HTNOWHERE = LCLType.HTNOWHERE;
{$endif}
{$if declared(HTCLIENT)}
  HTCLIENT = LCLType.HTCLIENT;
{$endif}
{$if declared(HTCAPTION)}
  HTCAPTION = LCLType.HTCAPTION;
{$endif}
{$if declared(MSGF_DIALOGBOX)}
  MSGF_DIALOGBOX = LCLType.MSGF_DIALOGBOX;
{$endif}
{$if declared(MSGF_MESSAGEBOX)}
  MSGF_MESSAGEBOX = LCLType.MSGF_MESSAGEBOX;
{$endif}
{$if declared(MSGF_MENU)}
  MSGF_MENU = LCLType.MSGF_MENU;
{$endif}
{$if declared(MSGF_MOVE)}
  MSGF_MOVE = LCLType.MSGF_MOVE;
{$endif}
{$if declared(MSGF_SIZE)}
  MSGF_SIZE = LCLType.MSGF_SIZE;
{$endif}
{$if declared(MSGF_SCROLLBAR)}
  MSGF_SCROLLBAR = LCLType.MSGF_SCROLLBAR;
{$endif}
{$if declared(MSGF_NEXTWINDOW)}
  MSGF_NEXTWINDOW = LCLType.MSGF_NEXTWINDOW;
{$endif}
{$if declared(PM_Noremove)}
  PM_Noremove = LCLType.PM_Noremove;
{$endif}
{$if declared(PM_Remove)}
  PM_Remove = LCLType.PM_Remove;
{$endif}
{$if declared(MF_BYCOMMAND)}
  MF_BYCOMMAND = LCLType.MF_BYCOMMAND;
{$endif}
{$if declared(MF_BYPOSITION)}
  MF_BYPOSITION = LCLType.MF_BYPOSITION;
{$endif}
{$if declared(MF_BYHANDLE)}
  MF_BYHANDLE = LCLType.MF_BYHANDLE;
{$endif}
{$if declared(MF_SEPARATOR)}
  MF_SEPARATOR = LCLType.MF_SEPARATOR;
{$endif}
{$if declared(MF_ENABLED)}
  MF_ENABLED = LCLType.MF_ENABLED;
{$endif}
{$if declared(MF_GRAYED)}
  MF_GRAYED = LCLType.MF_GRAYED;
{$endif}
{$if declared(MF_DISABLED)}
  MF_DISABLED = LCLType.MF_DISABLED;
{$endif}
{$if declared(MF_UNCHECKED)}
  MF_UNCHECKED = LCLType.MF_UNCHECKED;
{$endif}
{$if declared(MF_CHECKED)}
  MF_CHECKED = LCLType.MF_CHECKED;
{$endif}
{$if declared(MF_USECHECKBITMAPS)}
  MF_USECHECKBITMAPS = LCLType.MF_USECHECKBITMAPS;
{$endif}
{$if declared(MF_STRING)}
  MF_STRING = LCLType.MF_STRING;
{$endif}
{$if declared(MF_BITMAP)}
  MF_BITMAP = LCLType.MF_BITMAP;
{$endif}
{$if declared(MF_OWNERDRAW)}
  MF_OWNERDRAW = LCLType.MF_OWNERDRAW;
{$endif}
{$if declared(MF_POPUP)}
  MF_POPUP = LCLType.MF_POPUP;
{$endif}
{$if declared(MF_MENUBARBREAK)}
  MF_MENUBARBREAK = LCLType.MF_MENUBARBREAK;
{$endif}
{$if declared(MF_MENUBREAK)}
  MF_MENUBREAK = LCLType.MF_MENUBREAK;
{$endif}
{$if declared(MF_UNHILITE)}
  MF_UNHILITE = LCLType.MF_UNHILITE;
{$endif}
{$if declared(MF_HILITE)}
  MF_HILITE = LCLType.MF_HILITE;
{$endif}
{$if declared(MF_DEFAULT)}
  MF_DEFAULT = LCLType.MF_DEFAULT;
{$endif}
{$if declared(MF_SYSMENU)}
  MF_SYSMENU = LCLType.MF_SYSMENU;
{$endif}
{$if declared(MF_HELP)}
  MF_HELP = LCLType.MF_HELP;
{$endif}
{$if declared(MF_RIGHTJUSTIFY)}
  MF_RIGHTJUSTIFY = LCLType.MF_RIGHTJUSTIFY;
{$endif}
{$if declared(MF_MOUSESELECT)}
  MF_MOUSESELECT = LCLType.MF_MOUSESELECT;
{$endif}
{$if declared(MF_UNSUPPORTED)}
  MF_UNSUPPORTED = LCLType.MF_UNSUPPORTED;
{$endif}
{$if declared(KF_EXTENDED)}
  KF_EXTENDED = LCLType.KF_EXTENDED;
{$endif}
{$if declared(KF_DLGMODE)}
  KF_DLGMODE = LCLType.KF_DLGMODE;
{$endif}
{$if declared(KF_MENUMODE)}
  KF_MENUMODE = LCLType.KF_MENUMODE;
{$endif}
{$if declared(KF_ALTDOWN)}
  KF_ALTDOWN = LCLType.KF_ALTDOWN;
{$endif}
{$if declared(KF_REPEAT)}
  KF_REPEAT = LCLType.KF_REPEAT;
{$endif}
{$if declared(KF_UP)}
  KF_UP = LCLType.KF_UP;
{$endif}
{$if declared(scMeta)}
  scMeta = LCLType.scMeta;
{$endif}
{$if declared(scAltGr)}
  scAltGr = LCLType.scAltGr;
{$endif}
{$if declared(VK_UNKNOWN)}
  VK_UNKNOWN = LCLType.VK_UNKNOWN;
{$endif}
{$if declared(VK_LBUTTON)}
  VK_LBUTTON = LCLType.VK_LBUTTON;
{$endif}
{$if declared(VK_RBUTTON)}
  VK_RBUTTON = LCLType.VK_RBUTTON;
{$endif}
{$if declared(VK_CANCEL)}
  VK_CANCEL = LCLType.VK_CANCEL;
{$endif}
{$if declared(VK_MBUTTON)}
  VK_MBUTTON = LCLType.VK_MBUTTON;
{$endif}
{$if declared(VK_XBUTTON1)}
  VK_XBUTTON1 = LCLType.VK_XBUTTON1;
{$endif}
{$if declared(VK_XBUTTON2)}
  VK_XBUTTON2 = LCLType.VK_XBUTTON2;
{$endif}
{$if declared(VK_BACK)}
  VK_BACK = LCLType.VK_BACK;
{$endif}
{$if declared(VK_TAB)}
  VK_TAB = LCLType.VK_TAB;
{$endif}
{$if declared(VK_CLEAR)}
  VK_CLEAR = LCLType.VK_CLEAR;
{$endif}
{$if declared(VK_RETURN)}
  VK_RETURN = LCLType.VK_RETURN;
{$endif}
{$if declared(VK_SHIFT)}
  VK_SHIFT = LCLType.VK_SHIFT;
{$endif}
{$if declared(VK_CONTROL)}
  VK_CONTROL = LCLType.VK_CONTROL;
{$endif}
{$if declared(VK_MENU)}
  VK_MENU = LCLType.VK_MENU;
{$endif}
{$if declared(VK_PAUSE)}
  VK_PAUSE = LCLType.VK_PAUSE;
{$endif}
{$if declared(VK_CAPITAL)}
  VK_CAPITAL = LCLType.VK_CAPITAL;
{$endif}
{$if declared(VK_KANA)}
  VK_KANA = LCLType.VK_KANA;
{$endif}
{$if declared(VK_HANGUL)}
  VK_HANGUL = LCLType.VK_HANGUL;
{$endif}
{$if declared(VK_IME_ON)}
  VK_IME_ON = LCLType.VK_IME_ON;
{$endif}
{$if declared(VK_FN)}
  VK_FN = LCLType.VK_FN;
{$endif}
{$if declared(VK_JUNJA)}
  VK_JUNJA = LCLType.VK_JUNJA;
{$endif}
{$if declared(VK_FINAL)}
  VK_FINAL = LCLType.VK_FINAL;
{$endif}
{$if declared(VK_HANJA)}
  VK_HANJA = LCLType.VK_HANJA;
{$endif}
{$if declared(VK_KANJI)}
  VK_KANJI = LCLType.VK_KANJI;
{$endif}
{$if declared(VK_IME_OFF)}
  VK_IME_OFF = LCLType.VK_IME_OFF;
{$endif}
{$if declared(VK_ESCAPE)}
  VK_ESCAPE = LCLType.VK_ESCAPE;
{$endif}
{$if declared(VK_CONVERT)}
  VK_CONVERT = LCLType.VK_CONVERT;
{$endif}
{$if declared(VK_NONCONVERT)}
  VK_NONCONVERT = LCLType.VK_NONCONVERT;
{$endif}
{$if declared(VK_ACCEPT)}
  VK_ACCEPT = LCLType.VK_ACCEPT;
{$endif}
{$if declared(VK_MODECHANGE)}
  VK_MODECHANGE = LCLType.VK_MODECHANGE;
{$endif}
{$if declared(VK_SPACE)}
  VK_SPACE = LCLType.VK_SPACE;
{$endif}
{$if declared(VK_PRIOR)}
  VK_PRIOR = LCLType.VK_PRIOR;
{$endif}
{$if declared(VK_NEXT)}
  VK_NEXT = LCLType.VK_NEXT;
{$endif}
{$if declared(VK_END)}
  VK_END = LCLType.VK_END;
{$endif}
{$if declared(VK_HOME)}
  VK_HOME = LCLType.VK_HOME;
{$endif}
{$if declared(VK_LEFT)}
  VK_LEFT = LCLType.VK_LEFT;
{$endif}
{$if declared(VK_UP)}
  VK_UP = LCLType.VK_UP;
{$endif}
{$if declared(VK_RIGHT)}
  VK_RIGHT = LCLType.VK_RIGHT;
{$endif}
{$if declared(VK_DOWN)}
  VK_DOWN = LCLType.VK_DOWN;
{$endif}
{$if declared(VK_SELECT)}
  VK_SELECT = LCLType.VK_SELECT;
{$endif}
{$if declared(VK_PRINT)}
  VK_PRINT = LCLType.VK_PRINT;
{$endif}
{$if declared(VK_EXECUTE)}
  VK_EXECUTE = LCLType.VK_EXECUTE;
{$endif}
{$if declared(VK_SNAPSHOT)}
  VK_SNAPSHOT = LCLType.VK_SNAPSHOT;
{$endif}
{$if declared(VK_INSERT)}
  VK_INSERT = LCLType.VK_INSERT;
{$endif}
{$if declared(VK_DELETE)}
  VK_DELETE = LCLType.VK_DELETE;
{$endif}
{$if declared(VK_HELP)}
  VK_HELP = LCLType.VK_HELP;
{$endif}
{$if declared(VK_0)}
  VK_0 = LCLType.VK_0;
{$endif}
{$if declared(VK_1)}
  VK_1 = LCLType.VK_1;
{$endif}
{$if declared(VK_2)}
  VK_2 = LCLType.VK_2;
{$endif}
{$if declared(VK_3)}
  VK_3 = LCLType.VK_3;
{$endif}
{$if declared(VK_4)}
  VK_4 = LCLType.VK_4;
{$endif}
{$if declared(VK_5)}
  VK_5 = LCLType.VK_5;
{$endif}
{$if declared(VK_6)}
  VK_6 = LCLType.VK_6;
{$endif}
{$if declared(VK_7)}
  VK_7 = LCLType.VK_7;
{$endif}
{$if declared(VK_8)}
  VK_8 = LCLType.VK_8;
{$endif}
{$if declared(VK_9)}
  VK_9 = LCLType.VK_9;
{$endif}
{$if declared(VK_A)}
  VK_A = LCLType.VK_A;
{$endif}
{$if declared(VK_B)}
  VK_B = LCLType.VK_B;
{$endif}
{$if declared(VK_C)}
  VK_C = LCLType.VK_C;
{$endif}
{$if declared(VK_D)}
  VK_D = LCLType.VK_D;
{$endif}
{$if declared(VK_E)}
  VK_E = LCLType.VK_E;
{$endif}
{$if declared(VK_F)}
  VK_F = LCLType.VK_F;
{$endif}
{$if declared(VK_G)}
  VK_G = LCLType.VK_G;
{$endif}
{$if declared(VK_H)}
  VK_H = LCLType.VK_H;
{$endif}
{$if declared(VK_I)}
  VK_I = LCLType.VK_I;
{$endif}
{$if declared(VK_J)}
  VK_J = LCLType.VK_J;
{$endif}
{$if declared(VK_K)}
  VK_K = LCLType.VK_K;
{$endif}
{$if declared(VK_L)}
  VK_L = LCLType.VK_L;
{$endif}
{$if declared(VK_M)}
  VK_M = LCLType.VK_M;
{$endif}
{$if declared(VK_N)}
  VK_N = LCLType.VK_N;
{$endif}
{$if declared(VK_O)}
  VK_O = LCLType.VK_O;
{$endif}
{$if declared(VK_P)}
  VK_P = LCLType.VK_P;
{$endif}
{$if declared(VK_Q)}
  VK_Q = LCLType.VK_Q;
{$endif}
{$if declared(VK_R)}
  VK_R = LCLType.VK_R;
{$endif}
{$if declared(VK_S)}
  VK_S = LCLType.VK_S;
{$endif}
{$if declared(VK_T)}
  VK_T = LCLType.VK_T;
{$endif}
{$if declared(VK_U)}
  VK_U = LCLType.VK_U;
{$endif}
{$if declared(VK_V)}
  VK_V = LCLType.VK_V;
{$endif}
{$if declared(VK_W)}
  VK_W = LCLType.VK_W;
{$endif}
{$if declared(VK_X)}
  VK_X = LCLType.VK_X;
{$endif}
{$if declared(VK_Y)}
  VK_Y = LCLType.VK_Y;
{$endif}
{$if declared(VK_Z)}
  VK_Z = LCLType.VK_Z;
{$endif}
{$if declared(VK_LWIN)}
  VK_LWIN = LCLType.VK_LWIN;
{$endif}
{$if declared(VK_RWIN)}
  VK_RWIN = LCLType.VK_RWIN;
{$endif}
{$if declared(VK_APPS)}
  VK_APPS = LCLType.VK_APPS;
{$endif}
{$if declared(VK_SLEEP)}
  VK_SLEEP = LCLType.VK_SLEEP;
{$endif}
{$if declared(VK_NUMPAD0)}
  VK_NUMPAD0 = LCLType.VK_NUMPAD0;
{$endif}
{$if declared(VK_NUMPAD1)}
  VK_NUMPAD1 = LCLType.VK_NUMPAD1;
{$endif}
{$if declared(VK_NUMPAD2)}
  VK_NUMPAD2 = LCLType.VK_NUMPAD2;
{$endif}
{$if declared(VK_NUMPAD3)}
  VK_NUMPAD3 = LCLType.VK_NUMPAD3;
{$endif}
{$if declared(VK_NUMPAD4)}
  VK_NUMPAD4 = LCLType.VK_NUMPAD4;
{$endif}
{$if declared(VK_NUMPAD5)}
  VK_NUMPAD5 = LCLType.VK_NUMPAD5;
{$endif}
{$if declared(VK_NUMPAD6)}
  VK_NUMPAD6 = LCLType.VK_NUMPAD6;
{$endif}
{$if declared(VK_NUMPAD7)}
  VK_NUMPAD7 = LCLType.VK_NUMPAD7;
{$endif}
{$if declared(VK_NUMPAD8)}
  VK_NUMPAD8 = LCLType.VK_NUMPAD8;
{$endif}
{$if declared(VK_NUMPAD9)}
  VK_NUMPAD9 = LCLType.VK_NUMPAD9;
{$endif}
{$if declared(VK_MULTIPLY)}
  VK_MULTIPLY = LCLType.VK_MULTIPLY;
{$endif}
{$if declared(VK_ADD)}
  VK_ADD = LCLType.VK_ADD;
{$endif}
{$if declared(VK_SEPARATOR)}
  VK_SEPARATOR = LCLType.VK_SEPARATOR;
{$endif}
{$if declared(VK_SUBTRACT)}
  VK_SUBTRACT = LCLType.VK_SUBTRACT;
{$endif}
{$if declared(VK_DECIMAL)}
  VK_DECIMAL = LCLType.VK_DECIMAL;
{$endif}
{$if declared(VK_DIVIDE)}
  VK_DIVIDE = LCLType.VK_DIVIDE;
{$endif}
{$if declared(VK_F1)}
  VK_F1 = LCLType.VK_F1;
{$endif}
{$if declared(VK_F2)}
  VK_F2 = LCLType.VK_F2;
{$endif}
{$if declared(VK_F3)}
  VK_F3 = LCLType.VK_F3;
{$endif}
{$if declared(VK_F4)}
  VK_F4 = LCLType.VK_F4;
{$endif}
{$if declared(VK_F5)}
  VK_F5 = LCLType.VK_F5;
{$endif}
{$if declared(VK_F6)}
  VK_F6 = LCLType.VK_F6;
{$endif}
{$if declared(VK_F7)}
  VK_F7 = LCLType.VK_F7;
{$endif}
{$if declared(VK_F8)}
  VK_F8 = LCLType.VK_F8;
{$endif}
{$if declared(VK_F9)}
  VK_F9 = LCLType.VK_F9;
{$endif}
{$if declared(VK_F10)}
  VK_F10 = LCLType.VK_F10;
{$endif}
{$if declared(VK_F11)}
  VK_F11 = LCLType.VK_F11;
{$endif}
{$if declared(VK_F12)}
  VK_F12 = LCLType.VK_F12;
{$endif}
{$if declared(VK_F13)}
  VK_F13 = LCLType.VK_F13;
{$endif}
{$if declared(VK_F14)}
  VK_F14 = LCLType.VK_F14;
{$endif}
{$if declared(VK_F15)}
  VK_F15 = LCLType.VK_F15;
{$endif}
{$if declared(VK_F16)}
  VK_F16 = LCLType.VK_F16;
{$endif}
{$if declared(VK_F17)}
  VK_F17 = LCLType.VK_F17;
{$endif}
{$if declared(VK_F18)}
  VK_F18 = LCLType.VK_F18;
{$endif}
{$if declared(VK_F19)}
  VK_F19 = LCLType.VK_F19;
{$endif}
{$if declared(VK_F20)}
  VK_F20 = LCLType.VK_F20;
{$endif}
{$if declared(VK_F21)}
  VK_F21 = LCLType.VK_F21;
{$endif}
{$if declared(VK_F22)}
  VK_F22 = LCLType.VK_F22;
{$endif}
{$if declared(VK_F23)}
  VK_F23 = LCLType.VK_F23;
{$endif}
{$if declared(VK_F24)}
  VK_F24 = LCLType.VK_F24;
{$endif}
{$if declared(VK_NUMLOCK)}
  VK_NUMLOCK = LCLType.VK_NUMLOCK;
{$endif}
{$if declared(VK_SCROLL)}
  VK_SCROLL = LCLType.VK_SCROLL;
{$endif}
{$if declared(VK_LSHIFT)}
  VK_LSHIFT = LCLType.VK_LSHIFT;
{$endif}
{$if declared(VK_RSHIFT)}
  VK_RSHIFT = LCLType.VK_RSHIFT;
{$endif}
{$if declared(VK_LCONTROL)}
  VK_LCONTROL = LCLType.VK_LCONTROL;
{$endif}
{$if declared(VK_RCONTROL)}
  VK_RCONTROL = LCLType.VK_RCONTROL;
{$endif}
{$if declared(VK_LMENU)}
  VK_LMENU = LCLType.VK_LMENU;
{$endif}
{$if declared(VK_RMENU)}
  VK_RMENU = LCLType.VK_RMENU;
{$endif}
{$if declared(VK_BROWSER_BACK)}
  VK_BROWSER_BACK = LCLType.VK_BROWSER_BACK;
{$endif}
{$if declared(VK_BROWSER_FORWARD)}
  VK_BROWSER_FORWARD = LCLType.VK_BROWSER_FORWARD;
{$endif}
{$if declared(VK_BROWSER_REFRESH)}
  VK_BROWSER_REFRESH = LCLType.VK_BROWSER_REFRESH;
{$endif}
{$if declared(VK_BROWSER_STOP)}
  VK_BROWSER_STOP = LCLType.VK_BROWSER_STOP;
{$endif}
{$if declared(VK_BROWSER_SEARCH)}
  VK_BROWSER_SEARCH = LCLType.VK_BROWSER_SEARCH;
{$endif}
{$if declared(VK_BROWSER_FAVORITES)}
  VK_BROWSER_FAVORITES = LCLType.VK_BROWSER_FAVORITES;
{$endif}
{$if declared(VK_BROWSER_HOME)}
  VK_BROWSER_HOME = LCLType.VK_BROWSER_HOME;
{$endif}
{$if declared(VK_VOLUME_MUTE)}
  VK_VOLUME_MUTE = LCLType.VK_VOLUME_MUTE;
{$endif}
{$if declared(VK_VOLUME_DOWN)}
  VK_VOLUME_DOWN = LCLType.VK_VOLUME_DOWN;
{$endif}
{$if declared(VK_VOLUME_UP)}
  VK_VOLUME_UP = LCLType.VK_VOLUME_UP;
{$endif}
{$if declared(VK_MEDIA_NEXT_TRACK)}
  VK_MEDIA_NEXT_TRACK = LCLType.VK_MEDIA_NEXT_TRACK;
{$endif}
{$if declared(VK_MEDIA_PREV_TRACK)}
  VK_MEDIA_PREV_TRACK = LCLType.VK_MEDIA_PREV_TRACK;
{$endif}
{$if declared(VK_MEDIA_STOP)}
  VK_MEDIA_STOP = LCLType.VK_MEDIA_STOP;
{$endif}
{$if declared(VK_MEDIA_PLAY_PAUSE)}
  VK_MEDIA_PLAY_PAUSE = LCLType.VK_MEDIA_PLAY_PAUSE;
{$endif}
{$if declared(VK_LAUNCH_MAIL)}
  VK_LAUNCH_MAIL = LCLType.VK_LAUNCH_MAIL;
{$endif}
{$if declared(VK_LAUNCH_MEDIA_SELECT)}
  VK_LAUNCH_MEDIA_SELECT = LCLType.VK_LAUNCH_MEDIA_SELECT;
{$endif}
{$if declared(VK_LAUNCH_APP1)}
  VK_LAUNCH_APP1 = LCLType.VK_LAUNCH_APP1;
{$endif}
{$if declared(VK_LAUNCH_APP2)}
  VK_LAUNCH_APP2 = LCLType.VK_LAUNCH_APP2;
{$endif}
{$if declared(VK_OEM_1)}
  VK_OEM_1 = LCLType.VK_OEM_1;
{$endif}
{$if declared(VK_OEM_PLUS)}
  VK_OEM_PLUS = LCLType.VK_OEM_PLUS;
{$endif}
{$if declared(VK_OEM_COMMA)}
  VK_OEM_COMMA = LCLType.VK_OEM_COMMA;
{$endif}
{$if declared(VK_OEM_MINUS)}
  VK_OEM_MINUS = LCLType.VK_OEM_MINUS;
{$endif}
{$if declared(VK_OEM_PERIOD)}
  VK_OEM_PERIOD = LCLType.VK_OEM_PERIOD;
{$endif}
{$if declared(VK_OEM_2)}
  VK_OEM_2 = LCLType.VK_OEM_2;
{$endif}
{$if declared(VK_OEM_3)}
  VK_OEM_3 = LCLType.VK_OEM_3;
{$endif}
{$if declared(VK_OEM_4)}
  VK_OEM_4 = LCLType.VK_OEM_4;
{$endif}
{$if declared(VK_OEM_5)}
  VK_OEM_5 = LCLType.VK_OEM_5;
{$endif}
{$if declared(VK_OEM_6)}
  VK_OEM_6 = LCLType.VK_OEM_6;
{$endif}
{$if declared(VK_OEM_7)}
  VK_OEM_7 = LCLType.VK_OEM_7;
{$endif}
{$if declared(VK_OEM_8)}
  VK_OEM_8 = LCLType.VK_OEM_8;
{$endif}
{$if declared(VK_OEM_102)}
  VK_OEM_102 = LCLType.VK_OEM_102;
{$endif}
{$if declared(VK_PROCESSKEY)}
  VK_PROCESSKEY = LCLType.VK_PROCESSKEY;
{$endif}
{$if declared(VK_ATTN)}
  VK_ATTN = LCLType.VK_ATTN;
{$endif}
{$if declared(VK_CRSEL)}
  VK_CRSEL = LCLType.VK_CRSEL;
{$endif}
{$if declared(VK_EXSEL)}
  VK_EXSEL = LCLType.VK_EXSEL;
{$endif}
{$if declared(VK_EREOF)}
  VK_EREOF = LCLType.VK_EREOF;
{$endif}
{$if declared(VK_PLAY)}
  VK_PLAY = LCLType.VK_PLAY;
{$endif}
{$if declared(VK_ZOOM)}
  VK_ZOOM = LCLType.VK_ZOOM;
{$endif}
{$if declared(VK_NONAME)}
  VK_NONAME = LCLType.VK_NONAME;
{$endif}
{$if declared(VK_PA1)}
  VK_PA1 = LCLType.VK_PA1;
{$endif}
{$if declared(VK_OEM_CLEAR)}
  VK_OEM_CLEAR = LCLType.VK_OEM_CLEAR;
{$endif}
{$if declared(VK_HIGHESTVALUE)}
  VK_HIGHESTVALUE = LCLType.VK_HIGHESTVALUE;
{$endif}
{$if declared(VK_UNDEFINED)}
  VK_UNDEFINED = LCLType.VK_UNDEFINED;
{$endif}
{$if declared(VK_LCL_EQUAL)}
  VK_LCL_EQUAL = LCLType.VK_LCL_EQUAL;
{$endif}
{$if declared(VK_LCL_COMMA)}
  VK_LCL_COMMA = LCLType.VK_LCL_COMMA;
{$endif}
{$if declared(VK_LCL_POINT)}
  VK_LCL_POINT = LCLType.VK_LCL_POINT;
{$endif}
{$if declared(VK_LCL_SLASH)}
  VK_LCL_SLASH = LCLType.VK_LCL_SLASH;
{$endif}
{$if declared(VK_LCL_SEMI_COMMA)}
  VK_LCL_SEMI_COMMA = LCLType.VK_LCL_SEMI_COMMA;
{$endif}
{$if declared(VK_LCL_MINUS)}
  VK_LCL_MINUS = LCLType.VK_LCL_MINUS;
{$endif}
{$if declared(VK_LCL_OPEN_BRACKET)}
  VK_LCL_OPEN_BRACKET = LCLType.VK_LCL_OPEN_BRACKET;
{$endif}
{$if declared(VK_LCL_CLOSE_BRACKET)}
  VK_LCL_CLOSE_BRACKET = LCLType.VK_LCL_CLOSE_BRACKET;
{$endif}
{$if declared(VK_LCL_BACKSLASH)}
  VK_LCL_BACKSLASH = LCLType.VK_LCL_BACKSLASH;
{$endif}
{$if declared(VK_LCL_TILDE)}
  VK_LCL_TILDE = LCLType.VK_LCL_TILDE;
{$endif}
{$if declared(VK_LCL_QUOTE)}
  VK_LCL_QUOTE = LCLType.VK_LCL_QUOTE;
{$endif}
{$if declared(VK_LCL_ALT)}
  VK_LCL_ALT = LCLType.VK_LCL_ALT;
{$endif}
{$if declared(VK_LCL_LALT)}
  VK_LCL_LALT = LCLType.VK_LCL_LALT;
{$endif}
{$if declared(VK_LCL_RALT)}
  VK_LCL_RALT = LCLType.VK_LCL_RALT;
{$endif}
{$if declared(VK_LCL_CAPSLOCK)}
  VK_LCL_CAPSLOCK = LCLType.VK_LCL_CAPSLOCK;
{$endif}
{$if declared(VK_LCL_PAGEDOWN)}
  VK_LCL_PAGEDOWN = LCLType.VK_LCL_PAGEDOWN;
{$endif}
{$if declared(VK_LCL_PAGEUP)}
  VK_LCL_PAGEUP = LCLType.VK_LCL_PAGEUP;
{$endif}
{$if declared(VK_LCL_BACKSPACE)}
  VK_LCL_BACKSPACE = LCLType.VK_LCL_BACKSPACE;
{$endif}
{$if declared(VK_LCL_ENTER)}
  VK_LCL_ENTER = LCLType.VK_LCL_ENTER;
{$endif}
{$if declared(VK_LCL_POWER)}
  VK_LCL_POWER = LCLType.VK_LCL_POWER;
{$endif}
{$if declared(VK_LCL_CALL)}
  VK_LCL_CALL = LCLType.VK_LCL_CALL;
{$endif}
{$if declared(VK_LCL_ENDCALL)}
  VK_LCL_ENDCALL = LCLType.VK_LCL_ENDCALL;
{$endif}
{$if declared(VK_LCL_AT)}
  VK_LCL_AT = LCLType.VK_LCL_AT;
{$endif}
{$if declared(BDR_RAISEDOUTER)}
  BDR_RAISEDOUTER = LCLType.BDR_RAISEDOUTER;
{$endif}
{$if declared(BDR_SUNKENOUTER)}
  BDR_SUNKENOUTER = LCLType.BDR_SUNKENOUTER;
{$endif}
{$if declared(BDR_RAISEDINNER)}
  BDR_RAISEDINNER = LCLType.BDR_RAISEDINNER;
{$endif}
{$if declared(BDR_SUNKENINNER)}
  BDR_SUNKENINNER = LCLType.BDR_SUNKENINNER;
{$endif}
{$if declared(BDR_OUTER)}
  BDR_OUTER = LCLType.BDR_OUTER;
{$endif}
{$if declared(BDR_INNER)}
  BDR_INNER = LCLType.BDR_INNER;
{$endif}
{$if declared(BDR_RAISED)}
  BDR_RAISED = LCLType.BDR_RAISED;
{$endif}
{$if declared(BDR_SUNKEN)}
  BDR_SUNKEN = LCLType.BDR_SUNKEN;
{$endif}
{$if declared(EDGE_BUMP)}
  EDGE_BUMP = LCLType.EDGE_BUMP;
{$endif}
{$if declared(EDGE_ETCHED)}
  EDGE_ETCHED = LCLType.EDGE_ETCHED;
{$endif}
{$if declared(EDGE_RAISED)}
  EDGE_RAISED = LCLType.EDGE_RAISED;
{$endif}
{$if declared(EDGE_SUNKEN)}
  EDGE_SUNKEN = LCLType.EDGE_SUNKEN;
{$endif}
{$if declared(BF_LEFT)}
  BF_LEFT = LCLType.BF_LEFT;
{$endif}
{$if declared(BF_TOP)}
  BF_TOP = LCLType.BF_TOP;
{$endif}
{$if declared(BF_RIGHT)}
  BF_RIGHT = LCLType.BF_RIGHT;
{$endif}
{$if declared(BF_BOTTOM)}
  BF_BOTTOM = LCLType.BF_BOTTOM;
{$endif}
{$if declared(BF_TOPLEFT)}
  BF_TOPLEFT = LCLType.BF_TOPLEFT;
{$endif}
{$if declared(BF_TOPRIGHT)}
  BF_TOPRIGHT = LCLType.BF_TOPRIGHT;
{$endif}
{$if declared(BF_BOTTOMLEFT)}
  BF_BOTTOMLEFT = LCLType.BF_BOTTOMLEFT;
{$endif}
{$if declared(BF_BOTTOMRIGHT)}
  BF_BOTTOMRIGHT = LCLType.BF_BOTTOMRIGHT;
{$endif}
{$if declared(BF_RECT)}
  BF_RECT = LCLType.BF_RECT;
{$endif}
{$if declared(BF_DIAGONAL)}
  BF_DIAGONAL = LCLType.BF_DIAGONAL;
{$endif}
{$if declared(BF_DIAGONAL_ENDTOPRIGHT)}
  BF_DIAGONAL_ENDTOPRIGHT = LCLType.BF_DIAGONAL_ENDTOPRIGHT;
{$endif}
{$if declared(BF_DIAGONAL_ENDTOPLEFT)}
  BF_DIAGONAL_ENDTOPLEFT = LCLType.BF_DIAGONAL_ENDTOPLEFT;
{$endif}
{$if declared(BF_DIAGONAL_ENDBOTTOMLEFT)}
  BF_DIAGONAL_ENDBOTTOMLEFT = LCLType.BF_DIAGONAL_ENDBOTTOMLEFT;
{$endif}
{$if declared(BF_DIAGONAL_ENDBOTTOMRIGHT)}
  BF_DIAGONAL_ENDBOTTOMRIGHT = LCLType.BF_DIAGONAL_ENDBOTTOMRIGHT;
{$endif}
{$if declared(BF_MIDDLE)}
  BF_MIDDLE = LCLType.BF_MIDDLE;
{$endif}
{$if declared(BF_SOFT)}
  BF_SOFT = LCLType.BF_SOFT;
{$endif}
{$if declared(BF_ADJUST)}
  BF_ADJUST = LCLType.BF_ADJUST;
{$endif}
{$if declared(BF_FLAT)}
  BF_FLAT = LCLType.BF_FLAT;
{$endif}
{$if declared(BF_MONO)}
  BF_MONO = LCLType.BF_MONO;
{$endif}
{$if declared(DLGC_WANTARROWS)}
  DLGC_WANTARROWS = LCLType.DLGC_WANTARROWS;
{$endif}
{$if declared(DLGC_WANTTAB)}
  DLGC_WANTTAB = LCLType.DLGC_WANTTAB;
{$endif}
{$if declared(DLGC_WANTALLKEYS)}
  DLGC_WANTALLKEYS = LCLType.DLGC_WANTALLKEYS;
{$endif}
{$if declared(DLGC_WANTCHARS)}
  DLGC_WANTCHARS = LCLType.DLGC_WANTCHARS;
{$endif}
{$if declared(SW_SMOOTHSCROLL)}
  SW_SMOOTHSCROLL = LCLType.SW_SMOOTHSCROLL;
{$endif}
{$if declared(SW_ERASE)}
  SW_ERASE = LCLType.SW_ERASE;
{$endif}
{$if declared(SW_INVALIDATE)}
  SW_INVALIDATE = LCLType.SW_INVALIDATE;
{$endif}
{$if declared(SW_SCROLLCHILDREN)}
  SW_SCROLLCHILDREN = LCLType.SW_SCROLLCHILDREN;
{$endif}
{$if declared(ODT_MENU)}
  ODT_MENU = LCLType.ODT_MENU;
{$endif}
{$if declared(ODT_LISTBOX)}
  ODT_LISTBOX = LCLType.ODT_LISTBOX;
{$endif}
{$if declared(ODT_COMBOBOX)}
  ODT_COMBOBOX = LCLType.ODT_COMBOBOX;
{$endif}
{$if declared(ODT_BUTTON)}
  ODT_BUTTON = LCLType.ODT_BUTTON;
{$endif}
{$if declared(ODT_STATIC)}
  ODT_STATIC = LCLType.ODT_STATIC;
{$endif}
{$if declared(ODT_HEADER)}
  ODT_HEADER = LCLType.ODT_HEADER;
{$endif}
{$if declared(ODT_TAB)}
  ODT_TAB = LCLType.ODT_TAB;
{$endif}
{$if declared(ODT_LISTVIEW)}
  ODT_LISTVIEW = LCLType.ODT_LISTVIEW;
{$endif}
{$if declared(ODA_DRAWENTIRE)}
  ODA_DRAWENTIRE = LCLType.ODA_DRAWENTIRE;
{$endif}
{$if declared(ODA_SELECT)}
  ODA_SELECT = LCLType.ODA_SELECT;
{$endif}
{$if declared(ODA_FOCUS)}
  ODA_FOCUS = LCLType.ODA_FOCUS;
{$endif}
{$if declared(ODS_SELECTED)}
  ODS_SELECTED = LCLType.ODS_SELECTED;
{$endif}
{$if declared(ODS_GRAYED)}
  ODS_GRAYED = LCLType.ODS_GRAYED;
{$endif}
{$if declared(ODS_DISABLED)}
  ODS_DISABLED = LCLType.ODS_DISABLED;
{$endif}
{$if declared(ODS_CHECKED)}
  ODS_CHECKED = LCLType.ODS_CHECKED;
{$endif}
{$if declared(ODS_FOCUS)}
  ODS_FOCUS = LCLType.ODS_FOCUS;
{$endif}
{$if declared(ODS_DEFAULT)}
  ODS_DEFAULT = LCLType.ODS_DEFAULT;
{$endif}
{$if declared(ODS_HOTLIGHT)}
  ODS_HOTLIGHT = LCLType.ODS_HOTLIGHT;
{$endif}
{$if declared(ODS_INACTIVE)}
  ODS_INACTIVE = LCLType.ODS_INACTIVE;
{$endif}
{$if declared(ODS_NOACCEL)}
  ODS_NOACCEL = LCLType.ODS_NOACCEL;
{$endif}
{$if declared(ODS_NOFOCUSRECT)}
  ODS_NOFOCUSRECT = LCLType.ODS_NOFOCUSRECT;
{$endif}
{$if declared(ODS_COMBOBOXEDIT)}
  ODS_COMBOBOXEDIT = LCLType.ODS_COMBOBOXEDIT;
{$endif}
{$if declared(GWL_WNDPROC)}
  GWL_WNDPROC = LCLType.GWL_WNDPROC;
{$endif}
{$if declared(GWL_HINSTANCE)}
  GWL_HINSTANCE = LCLType.GWL_HINSTANCE;
{$endif}
{$if declared(GWL_HWNDPARENT)}
  GWL_HWNDPARENT = LCLType.GWL_HWNDPARENT;
{$endif}
{$if declared(GWL_STYLE)}
  GWL_STYLE = LCLType.GWL_STYLE;
{$endif}
{$if declared(GWL_EXSTYLE)}
  GWL_EXSTYLE = LCLType.GWL_EXSTYLE;
{$endif}
{$if declared(GWL_USERDATA)}
  GWL_USERDATA = LCLType.GWL_USERDATA;
{$endif}
{$if declared(GWL_ID)}
  GWL_ID = LCLType.GWL_ID;
{$endif}
{$if declared(MB_OK)}
  MB_OK = LCLType.MB_OK;
{$endif}
{$if declared(MB_OKCANCEL)}
  MB_OKCANCEL = LCLType.MB_OKCANCEL;
{$endif}
{$if declared(MB_ABORTRETRYIGNORE)}
  MB_ABORTRETRYIGNORE = LCLType.MB_ABORTRETRYIGNORE;
{$endif}
{$if declared(MB_YESNOCANCEL)}
  MB_YESNOCANCEL = LCLType.MB_YESNOCANCEL;
{$endif}
{$if declared(MB_YESNO)}
  MB_YESNO = LCLType.MB_YESNO;
{$endif}
{$if declared(MB_RETRYCANCEL)}
  MB_RETRYCANCEL = LCLType.MB_RETRYCANCEL;
{$endif}
{$if declared(MB_CANCELTRYCONTINUE)}
  MB_CANCELTRYCONTINUE = LCLType.MB_CANCELTRYCONTINUE;
{$endif}
{$if declared(MB_HELP)}
  MB_HELP = LCLType.MB_HELP;
{$endif}
{$if declared(MB_ICONHAND)}
  MB_ICONHAND = LCLType.MB_ICONHAND;
{$endif}
{$if declared(MB_ICONQUESTION)}
  MB_ICONQUESTION = LCLType.MB_ICONQUESTION;
{$endif}
{$if declared(MB_ICONEXCLAMATION)}
  MB_ICONEXCLAMATION = LCLType.MB_ICONEXCLAMATION;
{$endif}
{$if declared(MB_ICONASTERISK)}
  MB_ICONASTERISK = LCLType.MB_ICONASTERISK;
{$endif}
{$if declared(MB_ICONWARNING)}
  MB_ICONWARNING = LCLType.MB_ICONWARNING;
{$endif}
{$if declared(MB_ICONERROR)}
  MB_ICONERROR = LCLType.MB_ICONERROR;
{$endif}
{$if declared(MB_ICONSTOP)}
  MB_ICONSTOP = LCLType.MB_ICONSTOP;
{$endif}
{$if declared(MB_ICONINFORMATION)}
  MB_ICONINFORMATION = LCLType.MB_ICONINFORMATION;
{$endif}
{$if declared(IDOK)}
  IDOK = LCLType.IDOK;
{$endif}
{$if declared(ID_OK)}
  ID_OK = LCLType.ID_OK;
{$endif}
{$if declared(IDCANCEL)}
  IDCANCEL = LCLType.IDCANCEL;
{$endif}
{$if declared(ID_CANCEL)}
  ID_CANCEL = LCLType.ID_CANCEL;
{$endif}
{$if declared(IDABORT)}
  IDABORT = LCLType.IDABORT;
{$endif}
{$if declared(ID_ABORT)}
  ID_ABORT = LCLType.ID_ABORT;
{$endif}
{$if declared(IDRETRY)}
  IDRETRY = LCLType.IDRETRY;
{$endif}
{$if declared(ID_RETRY)}
  ID_RETRY = LCLType.ID_RETRY;
{$endif}
{$if declared(IDIGNORE)}
  IDIGNORE = LCLType.IDIGNORE;
{$endif}
{$if declared(ID_IGNORE)}
  ID_IGNORE = LCLType.ID_IGNORE;
{$endif}
{$if declared(IDYES)}
  IDYES = LCLType.IDYES;
{$endif}
{$if declared(ID_YES)}
  ID_YES = LCLType.ID_YES;
{$endif}
{$if declared(IDNO)}
  IDNO = LCLType.IDNO;
{$endif}
{$if declared(ID_NO)}
  ID_NO = LCLType.ID_NO;
{$endif}
{$if declared(IDCLOSE)}
  IDCLOSE = LCLType.IDCLOSE;
{$endif}
{$if declared(ID_CLOSE)}
  ID_CLOSE = LCLType.ID_CLOSE;
{$endif}
{$if declared(IDHELP)}
  IDHELP = LCLType.IDHELP;
{$endif}
{$if declared(ID_HELP)}
  ID_HELP = LCLType.ID_HELP;
{$endif}
{$if declared(MB_DEFBUTTON1)}
  MB_DEFBUTTON1 = LCLType.MB_DEFBUTTON1;
{$endif}
{$if declared(MB_DEFBUTTON2)}
  MB_DEFBUTTON2 = LCLType.MB_DEFBUTTON2;
{$endif}
{$if declared(MB_DEFBUTTON3)}
  MB_DEFBUTTON3 = LCLType.MB_DEFBUTTON3;
{$endif}
{$if declared(MB_DEFBUTTON4)}
  MB_DEFBUTTON4 = LCLType.MB_DEFBUTTON4;
{$endif}
{$if declared(Error)}
  Error = LCLType.Error;
{$endif}
{$if declared(NullRegion)}
  NullRegion = LCLType.NullRegion;
{$endif}
{$if declared(SimpleRegion)}
  SimpleRegion = LCLType.SimpleRegion;
{$endif}
{$if declared(ComplexRegion)}
  ComplexRegion = LCLType.ComplexRegion;
{$endif}
{$if declared(Region_Error)}
  Region_Error = LCLType.Region_Error;
{$endif}
{$if declared(SB_Horz)}
  SB_Horz = LCLType.SB_Horz;
{$endif}
{$if declared(SB_Vert)}
  SB_Vert = LCLType.SB_Vert;
{$endif}
{$if declared(SB_CTL)}
  SB_CTL = LCLType.SB_CTL;
{$endif}
{$if declared(SB_BOTH)}
  SB_BOTH = LCLType.SB_BOTH;
{$endif}
{$if declared(SB_LINEUP)}
  SB_LINEUP = LCLType.SB_LINEUP;
{$endif}
{$if declared(SB_LINELEFT)}
  SB_LINELEFT = LCLType.SB_LINELEFT;
{$endif}
{$if declared(SB_LINEDOWN)}
  SB_LINEDOWN = LCLType.SB_LINEDOWN;
{$endif}
{$if declared(SB_LINERIGHT)}
  SB_LINERIGHT = LCLType.SB_LINERIGHT;
{$endif}
{$if declared(SB_PAGEUP)}
  SB_PAGEUP = LCLType.SB_PAGEUP;
{$endif}
{$if declared(SB_PAGELEFT)}
  SB_PAGELEFT = LCLType.SB_PAGELEFT;
{$endif}
{$if declared(SB_PAGEDOWN)}
  SB_PAGEDOWN = LCLType.SB_PAGEDOWN;
{$endif}
{$if declared(SB_PAGERIGHT)}
  SB_PAGERIGHT = LCLType.SB_PAGERIGHT;
{$endif}
{$if declared(SB_THUMBPOSITION)}
  SB_THUMBPOSITION = LCLType.SB_THUMBPOSITION;
{$endif}
{$if declared(SB_THUMBTRACK)}
  SB_THUMBTRACK = LCLType.SB_THUMBTRACK;
{$endif}
{$if declared(SB_TOP)}
  SB_TOP = LCLType.SB_TOP;
{$endif}
{$if declared(SB_LEFT)}
  SB_LEFT = LCLType.SB_LEFT;
{$endif}
{$if declared(SB_BOTTOM)}
  SB_BOTTOM = LCLType.SB_BOTTOM;
{$endif}
{$if declared(SB_RIGHT)}
  SB_RIGHT = LCLType.SB_RIGHT;
{$endif}
{$if declared(SB_ENDSCROLL)}
  SB_ENDSCROLL = LCLType.SB_ENDSCROLL;
{$endif}
{$if declared(SB_POLICY_CONTINUOUS)}
  SB_POLICY_CONTINUOUS = LCLType.SB_POLICY_CONTINUOUS;
{$endif}
{$if declared(SB_POLICY_DISCONTINUOUS)}
  SB_POLICY_DISCONTINUOUS = LCLType.SB_POLICY_DISCONTINUOUS;
{$endif}
{$if declared(SB_POLICY_DELAYED)}
  SB_POLICY_DELAYED = LCLType.SB_POLICY_DELAYED;
{$endif}
{$if declared(SBS_HORZ)}
  SBS_HORZ = LCLType.SBS_HORZ;
{$endif}
{$if declared(SBS_VERT)}
  SBS_VERT = LCLType.SBS_VERT;
{$endif}
{$if declared(SBS_TOPALIGN)}
  SBS_TOPALIGN = LCLType.SBS_TOPALIGN;
{$endif}
{$if declared(SBS_LEFTALIGN)}
  SBS_LEFTALIGN = LCLType.SBS_LEFTALIGN;
{$endif}
{$if declared(SBS_BOTTOMALIGN)}
  SBS_BOTTOMALIGN = LCLType.SBS_BOTTOMALIGN;
{$endif}
{$if declared(SBS_RIGHTALIGN)}
  SBS_RIGHTALIGN = LCLType.SBS_RIGHTALIGN;
{$endif}
{$if declared(SBS_SIZEBOXTOPLEFTALIGN)}
  SBS_SIZEBOXTOPLEFTALIGN = LCLType.SBS_SIZEBOXTOPLEFTALIGN;
{$endif}
{$if declared(SBS_SIZEBOXBOTTOMRIGHTALIGN)}
  SBS_SIZEBOXBOTTOMRIGHTALIGN = LCLType.SBS_SIZEBOXBOTTOMRIGHTALIGN;
{$endif}
{$if declared(SBS_SIZEBOX)}
  SBS_SIZEBOX = LCLType.SBS_SIZEBOX;
{$endif}
{$if declared(SBS_SIZEGRIP)}
  SBS_SIZEGRIP = LCLType.SBS_SIZEGRIP;
{$endif}
{$if declared(SIF_RANGE)}
  SIF_RANGE = LCLType.SIF_RANGE;
{$endif}
{$if declared(SIF_PAGE)}
  SIF_PAGE = LCLType.SIF_PAGE;
{$endif}
{$if declared(SIF_POS)}
  SIF_POS = LCLType.SIF_POS;
{$endif}
{$if declared(SIF_DISABLENOSCROLL)}
  SIF_DISABLENOSCROLL = LCLType.SIF_DISABLENOSCROLL;
{$endif}
{$if declared(SIF_TRACKPOS)}
  SIF_TRACKPOS = LCLType.SIF_TRACKPOS;
{$endif}
{$if declared(SIF_ALL)}
  SIF_ALL = LCLType.SIF_ALL;
{$endif}
{$if declared(SIF_UPDATEPOLICY)}
  SIF_UPDATEPOLICY = LCLType.SIF_UPDATEPOLICY;
{$endif}
{$if declared(SWP_NOSIZE)}
  SWP_NOSIZE = LCLType.SWP_NOSIZE;
{$endif}
{$if declared(SWP_NOMOVE)}
  SWP_NOMOVE = LCLType.SWP_NOMOVE;
{$endif}
{$if declared(SWP_NOZORDER)}
  SWP_NOZORDER = LCLType.SWP_NOZORDER;
{$endif}
{$if declared(SWP_NOREDRAW)}
  SWP_NOREDRAW = LCLType.SWP_NOREDRAW;
{$endif}
{$if declared(SWP_NOACTIVATE)}
  SWP_NOACTIVATE = LCLType.SWP_NOACTIVATE;
{$endif}
{$if declared(SWP_DRAWFRAME)}
  SWP_DRAWFRAME = LCLType.SWP_DRAWFRAME;
{$endif}
{$if declared(SWP_FRAMECHANGED)}
  SWP_FRAMECHANGED = LCLType.SWP_FRAMECHANGED;
{$endif}
{$if declared(SWP_SHOWWINDOW)}
  SWP_SHOWWINDOW = LCLType.SWP_SHOWWINDOW;
{$endif}
{$if declared(SWP_HIDEWINDOW)}
  SWP_HIDEWINDOW = LCLType.SWP_HIDEWINDOW;
{$endif}
{$if declared(SWP_NOCOPYBITS)}
  SWP_NOCOPYBITS = LCLType.SWP_NOCOPYBITS;
{$endif}
{$if declared(SWP_NOOWNERZORDER)}
  SWP_NOOWNERZORDER = LCLType.SWP_NOOWNERZORDER;
{$endif}
{$if declared(SWP_NOREPOSITION)}
  SWP_NOREPOSITION = LCLType.SWP_NOREPOSITION;
{$endif}
{$if declared(SWP_NOSENDCHANGING)}
  SWP_NOSENDCHANGING = LCLType.SWP_NOSENDCHANGING;
{$endif}
{$if declared(SWP_DEFERERASE)}
  SWP_DEFERERASE = LCLType.SWP_DEFERERASE;
{$endif}
{$if declared(SWP_ASYNCWINDOWPOS)}
  SWP_ASYNCWINDOWPOS = LCLType.SWP_ASYNCWINDOWPOS;
{$endif}
{$if declared(SWP_STATECHANGED)}
  SWP_STATECHANGED = LCLType.SWP_STATECHANGED;
{$endif}
{$if declared(SWP_SourceIsInterface)}
  SWP_SourceIsInterface = LCLType.SWP_SourceIsInterface;
{$endif}
{$if declared(SIZE_RESTORED)}
  SIZE_RESTORED = LCLType.SIZE_RESTORED;
{$endif}
{$if declared(SIZE_MINIMIZED)}
  SIZE_MINIMIZED = LCLType.SIZE_MINIMIZED;
{$endif}
{$if declared(SIZE_MAXIMIZED)}
  SIZE_MAXIMIZED = LCLType.SIZE_MAXIMIZED;
{$endif}
{$if declared(SIZE_MAXSHOW)}
  SIZE_MAXSHOW = LCLType.SIZE_MAXSHOW;
{$endif}
{$if declared(SIZE_MAXHIDE)}
  SIZE_MAXHIDE = LCLType.SIZE_MAXHIDE;
{$endif}
{$if declared(SIZE_FULLSCREEN)}
  SIZE_FULLSCREEN = LCLType.SIZE_FULLSCREEN;
{$endif}
{$if declared(Size_SourceIsInterface)}
  Size_SourceIsInterface = LCLType.Size_SourceIsInterface;
{$endif}
{$if declared(SIZENORMAL)}
  SIZENORMAL = LCLType.SIZENORMAL;
{$endif}
{$if declared(SIZEICONIC)}
  SIZEICONIC = LCLType.SIZEICONIC;
{$endif}
{$if declared(SIZEFULLSCREEN)}
  SIZEFULLSCREEN = LCLType.SIZEFULLSCREEN;
{$endif}
{$if declared(SIZEZOOMSHOW)}
  SIZEZOOMSHOW = LCLType.SIZEZOOMSHOW;
{$endif}
{$if declared(SIZEZOOMHIDE)}
  SIZEZOOMHIDE = LCLType.SIZEZOOMHIDE;
{$endif}
{$if declared(Move_Default)}
  Move_Default = LCLType.Move_Default;
{$endif}
{$if declared(Move_SourceIsInterface)}
  Move_SourceIsInterface = LCLType.Move_SourceIsInterface;
{$endif}
{$if declared(WS_OVERLAPPED)}
  WS_OVERLAPPED = LCLType.WS_OVERLAPPED;
{$endif}
{$if declared(WS_POPUP)}
  WS_POPUP = LCLType.WS_POPUP;
{$endif}
{$if declared(WS_CHILD)}
  WS_CHILD = LCLType.WS_CHILD;
{$endif}
{$if declared(WS_MINIMIZE)}
  WS_MINIMIZE = LCLType.WS_MINIMIZE;
{$endif}
{$if declared(WS_VISIBLE)}
  WS_VISIBLE = LCLType.WS_VISIBLE;
{$endif}
{$if declared(WS_DISABLED)}
  WS_DISABLED = LCLType.WS_DISABLED;
{$endif}
{$if declared(WS_CLIPSIBLINGS)}
  WS_CLIPSIBLINGS = LCLType.WS_CLIPSIBLINGS;
{$endif}
{$if declared(WS_CLIPCHILDREN)}
  WS_CLIPCHILDREN = LCLType.WS_CLIPCHILDREN;
{$endif}
{$if declared(WS_MAXIMIZE)}
  WS_MAXIMIZE = LCLType.WS_MAXIMIZE;
{$endif}
{$if declared(WS_BORDER)}
  WS_BORDER = LCLType.WS_BORDER;
{$endif}
{$if declared(WS_DLGFRAME)}
  WS_DLGFRAME = LCLType.WS_DLGFRAME;
{$endif}
{$if declared(WS_CAPTION)}
  WS_CAPTION = LCLType.WS_CAPTION;
{$endif}
{$if declared(WS_VSCROLL)}
  WS_VSCROLL = LCLType.WS_VSCROLL;
{$endif}
{$if declared(WS_HSCROLL)}
  WS_HSCROLL = LCLType.WS_HSCROLL;
{$endif}
{$if declared(WS_SYSMENU)}
  WS_SYSMENU = LCLType.WS_SYSMENU;
{$endif}
{$if declared(WS_THICKFRAME)}
  WS_THICKFRAME = LCLType.WS_THICKFRAME;
{$endif}
{$if declared(WS_GROUP)}
  WS_GROUP = LCLType.WS_GROUP;
{$endif}
{$if declared(WS_TABSTOP)}
  WS_TABSTOP = LCLType.WS_TABSTOP;
{$endif}
{$if declared(WS_MINIMIZEBOX)}
  WS_MINIMIZEBOX = LCLType.WS_MINIMIZEBOX;
{$endif}
{$if declared(WS_MAXIMIZEBOX)}
  WS_MAXIMIZEBOX = LCLType.WS_MAXIMIZEBOX;
{$endif}
{$if declared(WS_TILED)}
  WS_TILED = LCLType.WS_TILED;
{$endif}
{$if declared(WS_ICONIC)}
  WS_ICONIC = LCLType.WS_ICONIC;
{$endif}
{$if declared(WS_SIZEBOX)}
  WS_SIZEBOX = LCLType.WS_SIZEBOX;
{$endif}
{$if declared(WS_OVERLAPPEDWINDOW)}
  WS_OVERLAPPEDWINDOW = LCLType.WS_OVERLAPPEDWINDOW;
{$endif}
{$if declared(WS_TILEDWINDOW)}
  WS_TILEDWINDOW = LCLType.WS_TILEDWINDOW;
{$endif}
{$if declared(WS_POPUPWINDOW)}
  WS_POPUPWINDOW = LCLType.WS_POPUPWINDOW;
{$endif}
{$if declared(WS_CHILDWINDOW)}
  WS_CHILDWINDOW = LCLType.WS_CHILDWINDOW;
{$endif}
{$if declared(WS_EX_DLGMODALFRAME)}
  WS_EX_DLGMODALFRAME = LCLType.WS_EX_DLGMODALFRAME;
{$endif}
{$if declared(WS_EX_NOPARENTNOTIFY)}
  WS_EX_NOPARENTNOTIFY = LCLType.WS_EX_NOPARENTNOTIFY;
{$endif}
{$if declared(WS_EX_TOPMOST)}
  WS_EX_TOPMOST = LCLType.WS_EX_TOPMOST;
{$endif}
{$if declared(WS_EX_ACCEPTFILES)}
  WS_EX_ACCEPTFILES = LCLType.WS_EX_ACCEPTFILES;
{$endif}
{$if declared(WS_EX_TRANSPARENT)}
  WS_EX_TRANSPARENT = LCLType.WS_EX_TRANSPARENT;
{$endif}
{$if declared(WS_EX_MDICHILD)}
  WS_EX_MDICHILD = LCLType.WS_EX_MDICHILD;
{$endif}
{$if declared(WS_EX_TOOLWINDOW)}
  WS_EX_TOOLWINDOW = LCLType.WS_EX_TOOLWINDOW;
{$endif}
{$if declared(WS_EX_WINDOWEDGE)}
  WS_EX_WINDOWEDGE = LCLType.WS_EX_WINDOWEDGE;
{$endif}
{$if declared(WS_EX_CLIENTEDGE)}
  WS_EX_CLIENTEDGE = LCLType.WS_EX_CLIENTEDGE;
{$endif}
{$if declared(WS_EX_CONTEXTHELP)}
  WS_EX_CONTEXTHELP = LCLType.WS_EX_CONTEXTHELP;
{$endif}
{$if declared(WS_EX_RIGHT)}
  WS_EX_RIGHT = LCLType.WS_EX_RIGHT;
{$endif}
{$if declared(WS_EX_LEFT)}
  WS_EX_LEFT = LCLType.WS_EX_LEFT;
{$endif}
{$if declared(WS_EX_RTLREADING)}
  WS_EX_RTLREADING = LCLType.WS_EX_RTLREADING;
{$endif}
{$if declared(WS_EX_LTRREADING)}
  WS_EX_LTRREADING = LCLType.WS_EX_LTRREADING;
{$endif}
{$if declared(WS_EX_LEFTSCROLLBAR)}
  WS_EX_LEFTSCROLLBAR = LCLType.WS_EX_LEFTSCROLLBAR;
{$endif}
{$if declared(WS_EX_RIGHTSCROLLBAR)}
  WS_EX_RIGHTSCROLLBAR = LCLType.WS_EX_RIGHTSCROLLBAR;
{$endif}
{$if declared(WS_EX_CONTROLPARENT)}
  WS_EX_CONTROLPARENT = LCLType.WS_EX_CONTROLPARENT;
{$endif}
{$if declared(WS_EX_STATICEDGE)}
  WS_EX_STATICEDGE = LCLType.WS_EX_STATICEDGE;
{$endif}
{$if declared(WS_EX_APPWINDOW)}
  WS_EX_APPWINDOW = LCLType.WS_EX_APPWINDOW;
{$endif}
{$if declared(WS_EX_OVERLAPPEDWINDOW)}
  WS_EX_OVERLAPPEDWINDOW = LCLType.WS_EX_OVERLAPPEDWINDOW;
{$endif}
{$if declared(WS_EX_PALETTEWINDOW)}
  WS_EX_PALETTEWINDOW = LCLType.WS_EX_PALETTEWINDOW;
{$endif}
{$if declared(BS_PUSHBUTTON)}
  BS_PUSHBUTTON = LCLType.BS_PUSHBUTTON;
{$endif}
{$if declared(BS_DEFPUSHBUTTON)}
  BS_DEFPUSHBUTTON = LCLType.BS_DEFPUSHBUTTON;
{$endif}
{$if declared(BS_AUTOCHECKBOX)}
  BS_AUTOCHECKBOX = LCLType.BS_AUTOCHECKBOX;
{$endif}
{$if declared(BS_RADIOBUTTON)}
  BS_RADIOBUTTON = LCLType.BS_RADIOBUTTON;
{$endif}
{$if declared(BS_3STATE)}
  BS_3STATE = LCLType.BS_3STATE;
{$endif}
{$if declared(BS_GROUPBOX)}
  BS_GROUPBOX = LCLType.BS_GROUPBOX;
{$endif}
{$if declared(BS_OWNERDRAW)}
  BS_OWNERDRAW = LCLType.BS_OWNERDRAW;
{$endif}
{$if declared(BS_RIGHTBUTTON)}
  BS_RIGHTBUTTON = LCLType.BS_RIGHTBUTTON;
{$endif}
{$if declared(BS_PUSHLIKE)}
  BS_PUSHLIKE = LCLType.BS_PUSHLIKE;
{$endif}
{$if declared(ES_LEFT)}
  ES_LEFT = LCLType.ES_LEFT;
{$endif}
{$if declared(ES_CENTER)}
  ES_CENTER = LCLType.ES_CENTER;
{$endif}
{$if declared(ES_RIGHT)}
  ES_RIGHT = LCLType.ES_RIGHT;
{$endif}
{$if declared(ES_MULTILINE)}
  ES_MULTILINE = LCLType.ES_MULTILINE;
{$endif}
{$if declared(ES_AUTOVSCROLL)}
  ES_AUTOVSCROLL = LCLType.ES_AUTOVSCROLL;
{$endif}
{$if declared(ES_AUTOHSCROLL)}
  ES_AUTOHSCROLL = LCLType.ES_AUTOHSCROLL;
{$endif}
{$if declared(ES_NOHIDESEL)}
  ES_NOHIDESEL = LCLType.ES_NOHIDESEL;
{$endif}
{$if declared(ES_NUMBER)}
  ES_NUMBER = LCLType.ES_NUMBER;
{$endif}
{$if declared(ES_READONLY)}
  ES_READONLY = LCLType.ES_READONLY;
{$endif}
{$if declared(ES_WANTRETURN)}
  ES_WANTRETURN = LCLType.ES_WANTRETURN;
{$endif}
{$if declared(CBS_SIMPLE)}
  CBS_SIMPLE = LCLType.CBS_SIMPLE;
{$endif}
{$if declared(CBS_DROPDOWN)}
  CBS_DROPDOWN = LCLType.CBS_DROPDOWN;
{$endif}
{$if declared(CBS_DROPDOWNLIST)}
  CBS_DROPDOWNLIST = LCLType.CBS_DROPDOWNLIST;
{$endif}
{$if declared(CBS_OWNERDRAWFIXED)}
  CBS_OWNERDRAWFIXED = LCLType.CBS_OWNERDRAWFIXED;
{$endif}
{$if declared(CBS_OWNERDRAWVARIABLE)}
  CBS_OWNERDRAWVARIABLE = LCLType.CBS_OWNERDRAWVARIABLE;
{$endif}
{$if declared(CBS_AUTOHSCROLL)}
  CBS_AUTOHSCROLL = LCLType.CBS_AUTOHSCROLL;
{$endif}
{$if declared(CBS_SORT)}
  CBS_SORT = LCLType.CBS_SORT;
{$endif}
{$if declared(CBS_HASSTRINGS)}
  CBS_HASSTRINGS = LCLType.CBS_HASSTRINGS;
{$endif}
{$if declared(LBS_NOTIFY)}
  LBS_NOTIFY = LCLType.LBS_NOTIFY;
{$endif}
{$if declared(LBS_SORT)}
  LBS_SORT = LCLType.LBS_SORT;
{$endif}
{$if declared(LBS_NOREDRAW)}
  LBS_NOREDRAW = LCLType.LBS_NOREDRAW;
{$endif}
{$if declared(LBS_MULTIPLESEL)}
  LBS_MULTIPLESEL = LCLType.LBS_MULTIPLESEL;
{$endif}
{$if declared(LBS_OWNERDRAWFIXED)}
  LBS_OWNERDRAWFIXED = LCLType.LBS_OWNERDRAWFIXED;
{$endif}
{$if declared(LBS_OWNERDRAWVARIABLE)}
  LBS_OWNERDRAWVARIABLE = LCLType.LBS_OWNERDRAWVARIABLE;
{$endif}
{$if declared(LBS_HASSTRINGS)}
  LBS_HASSTRINGS = LCLType.LBS_HASSTRINGS;
{$endif}
{$if declared(LBS_USETABSTOPS)}
  LBS_USETABSTOPS = LCLType.LBS_USETABSTOPS;
{$endif}
{$if declared(LBS_NOINTEGRALHEIGHT)}
  LBS_NOINTEGRALHEIGHT = LCLType.LBS_NOINTEGRALHEIGHT;
{$endif}
{$if declared(LBS_MULTICOLUMN)}
  LBS_MULTICOLUMN = LCLType.LBS_MULTICOLUMN;
{$endif}
{$if declared(LBS_WANTKEYBOARDINPUT)}
  LBS_WANTKEYBOARDINPUT = LCLType.LBS_WANTKEYBOARDINPUT;
{$endif}
{$if declared(LBS_EXTENDEDSEL)}
  LBS_EXTENDEDSEL = LCLType.LBS_EXTENDEDSEL;
{$endif}
{$if declared(LBS_DISABLENOSCROLL)}
  LBS_DISABLENOSCROLL = LCLType.LBS_DISABLENOSCROLL;
{$endif}
{$if declared(LBS_NODATA)}
  LBS_NODATA = LCLType.LBS_NODATA;
{$endif}
{$if declared(LBS_NOSEL)}
  LBS_NOSEL = LCLType.LBS_NOSEL;
{$endif}
{$if declared(LBS_STANDARD)}
  LBS_STANDARD = LCLType.LBS_STANDARD;
{$endif}
{$if declared(HWND_TOP)}
  HWND_TOP = LCLType.HWND_TOP;
{$endif}
{$if declared(HWND_BOTTOM)}
  HWND_BOTTOM = LCLType.HWND_BOTTOM;
{$endif}
{$if declared(HWND_TOPMOST)}
  HWND_TOPMOST = LCLType.HWND_TOPMOST;
{$endif}
{$if declared(HWND_NOTOPMOST)}
  HWND_NOTOPMOST = LCLType.HWND_NOTOPMOST;
{$endif}
{$if declared(SW_HIDE)}
  SW_HIDE = LCLType.SW_HIDE;
{$endif}
{$if declared(SW_SHOWNORMAL)}
  SW_SHOWNORMAL = LCLType.SW_SHOWNORMAL;
{$endif}
{$if declared(SW_NORMAL)}
  SW_NORMAL = LCLType.SW_NORMAL;
{$endif}
{$if declared(SW_SHOWMINIMIZED)}
  SW_SHOWMINIMIZED = LCLType.SW_SHOWMINIMIZED;
{$endif}
{$if declared(SW_SHOWMAXIMIZED)}
  SW_SHOWMAXIMIZED = LCLType.SW_SHOWMAXIMIZED;
{$endif}
{$if declared(SW_MAXIMIZE)}
  SW_MAXIMIZE = LCLType.SW_MAXIMIZE;
{$endif}
{$if declared(SW_SHOWNOACTIVATE)}
  SW_SHOWNOACTIVATE = LCLType.SW_SHOWNOACTIVATE;
{$endif}
{$if declared(SW_SHOW)}
  SW_SHOW = LCLType.SW_SHOW;
{$endif}
{$if declared(SW_MINIMIZE)}
  SW_MINIMIZE = LCLType.SW_MINIMIZE;
{$endif}
{$if declared(SW_SHOWMINNOACTIVE)}
  SW_SHOWMINNOACTIVE = LCLType.SW_SHOWMINNOACTIVE;
{$endif}
{$if declared(SW_SHOWNA)}
  SW_SHOWNA = LCLType.SW_SHOWNA;
{$endif}
{$if declared(SW_RESTORE)}
  SW_RESTORE = LCLType.SW_RESTORE;
{$endif}
{$if declared(SW_SHOWDEFAULT)}
  SW_SHOWDEFAULT = LCLType.SW_SHOWDEFAULT;
{$endif}
{$if declared(SW_MAX)}
  SW_MAX = LCLType.SW_MAX;
{$endif}
{$if declared(SW_SHOWFULLSCREEN)}
  SW_SHOWFULLSCREEN = LCLType.SW_SHOWFULLSCREEN;
{$endif}
{$if declared(RDW_INVALIDATE)}
  RDW_INVALIDATE = LCLType.RDW_INVALIDATE;
{$endif}
{$if declared(RDW_INTERNALPAINT)}
  RDW_INTERNALPAINT = LCLType.RDW_INTERNALPAINT;
{$endif}
{$if declared(RDW_ERASE)}
  RDW_ERASE = LCLType.RDW_ERASE;
{$endif}
{$if declared(RDW_VALIDATE)}
  RDW_VALIDATE = LCLType.RDW_VALIDATE;
{$endif}
{$if declared(RDW_NOINTERNALPAINT)}
  RDW_NOINTERNALPAINT = LCLType.RDW_NOINTERNALPAINT;
{$endif}
{$if declared(RDW_NOERASE)}
  RDW_NOERASE = LCLType.RDW_NOERASE;
{$endif}
{$if declared(RDW_NOCHILDREN)}
  RDW_NOCHILDREN = LCLType.RDW_NOCHILDREN;
{$endif}
{$if declared(RDW_ALLCHILDREN)}
  RDW_ALLCHILDREN = LCLType.RDW_ALLCHILDREN;
{$endif}
{$if declared(RDW_UPDATENOW)}
  RDW_UPDATENOW = LCLType.RDW_UPDATENOW;
{$endif}
{$if declared(RDW_ERASENOW)}
  RDW_ERASENOW = LCLType.RDW_ERASENOW;
{$endif}
{$if declared(RDW_FRAME)}
  RDW_FRAME = LCLType.RDW_FRAME;
{$endif}
{$if declared(RDW_NOFRAME)}
  RDW_NOFRAME = LCLType.RDW_NOFRAME;
{$endif}
{$if declared(DIB_RGB_COLORS)}
  DIB_RGB_COLORS = LCLType.DIB_RGB_COLORS;
{$endif}
{$if declared(DIB_PAL_COLORS)}
  DIB_PAL_COLORS = LCLType.DIB_PAL_COLORS;
{$endif}
{$if declared(GRADIENT_FILL_RECT_H)}
  GRADIENT_FILL_RECT_H = LCLType.GRADIENT_FILL_RECT_H;
{$endif}
{$if declared(GRADIENT_FILL_RECT_V)}
  GRADIENT_FILL_RECT_V = LCLType.GRADIENT_FILL_RECT_V;
{$endif}
{$if declared(GRADIENT_FILL_TRIANGLE)}
  GRADIENT_FILL_TRIANGLE = LCLType.GRADIENT_FILL_TRIANGLE;
{$endif}
{$if declared(MONITOR_UNIMPL)}
  MONITOR_UNIMPL = LCLType.MONITOR_UNIMPL;
{$endif}
{$if declared(MONITOR_DEFAULTTONULL)}
  MONITOR_DEFAULTTONULL = LCLType.MONITOR_DEFAULTTONULL;
{$endif}
{$if declared(MONITOR_DEFAULTTOPRIMARY)}
  MONITOR_DEFAULTTOPRIMARY = LCLType.MONITOR_DEFAULTTOPRIMARY;
{$endif}
{$if declared(MONITOR_DEFAULTTONEAREST)}
  MONITOR_DEFAULTTONEAREST = LCLType.MONITOR_DEFAULTTONEAREST;
{$endif}
{$if declared(MONITORINFOF_PRIMARY)}
  MONITORINFOF_PRIMARY = LCLType.MONITORINFOF_PRIMARY;
{$endif}
{$if declared(CCHDEVICENAME)}
  CCHDEVICENAME = LCLType.CCHDEVICENAME;
{$endif}
{$if declared(RASTER_FONTTYPE)}
  RASTER_FONTTYPE = LCLType.RASTER_FONTTYPE;
{$endif}
{$if declared(DEVICE_FONTTYPE)}
  DEVICE_FONTTYPE = LCLType.DEVICE_FONTTYPE;
{$endif}
{$if declared(TRUETYPE_FONTTYPE)}
  TRUETYPE_FONTTYPE = LCLType.TRUETYPE_FONTTYPE;
{$endif}
{$if declared(GCP_DBCS)}
  GCP_DBCS = LCLType.GCP_DBCS;
{$endif}
{$if declared(HELPINFO_WINDOW)}
  HELPINFO_WINDOW = LCLType.HELPINFO_WINDOW;
{$endif}
{$if declared(HELPINFO_MENUITEM)}
  HELPINFO_MENUITEM = LCLType.HELPINFO_MENUITEM;
{$endif}
{$if declared(HELP_CONTEXT)}
  HELP_CONTEXT = LCLType.HELP_CONTEXT;
{$endif}
{$if declared(HELP_COMMAND)}
  HELP_COMMAND = LCLType.HELP_COMMAND;
{$endif}
{$if declared(TRANSPARENT)}
  TRANSPARENT = LCLType.TRANSPARENT;
{$endif}
{$if declared(OPAQUE)}
  OPAQUE = LCLType.OPAQUE;
{$endif}
{$if declared(BKMODE_LAST)}
  BKMODE_LAST = LCLType.BKMODE_LAST;
{$endif}
{$if declared(LF_FULLFACESIZE)}
  LF_FULLFACESIZE = LCLType.LF_FULLFACESIZE;
{$endif}
{$if declared(LF_FACESIZE)}
  LF_FACESIZE = LCLType.LF_FACESIZE;
{$endif}
{$if declared(OUT_DEFAULT_PRECIS)}
  OUT_DEFAULT_PRECIS = LCLType.OUT_DEFAULT_PRECIS;
{$endif}
{$if declared(OUT_STRING_PRECIS)}
  OUT_STRING_PRECIS = LCLType.OUT_STRING_PRECIS;
{$endif}
{$if declared(OUT_CHARACTER_PRECIS)}
  OUT_CHARACTER_PRECIS = LCLType.OUT_CHARACTER_PRECIS;
{$endif}
{$if declared(OUT_STROKE_PRECIS)}
  OUT_STROKE_PRECIS = LCLType.OUT_STROKE_PRECIS;
{$endif}
{$if declared(OUT_TT_PRECIS)}
  OUT_TT_PRECIS = LCLType.OUT_TT_PRECIS;
{$endif}
{$if declared(OUT_DEVICE_PRECIS)}
  OUT_DEVICE_PRECIS = LCLType.OUT_DEVICE_PRECIS;
{$endif}
{$if declared(OUT_RASTER_PRECIS)}
  OUT_RASTER_PRECIS = LCLType.OUT_RASTER_PRECIS;
{$endif}
{$if declared(OUT_TT_ONLY_PRECIS)}
  OUT_TT_ONLY_PRECIS = LCLType.OUT_TT_ONLY_PRECIS;
{$endif}
{$if declared(OUT_OUTLINE_PRECIS)}
  OUT_OUTLINE_PRECIS = LCLType.OUT_OUTLINE_PRECIS;
{$endif}
{$if declared(OUT_SCREEN_OUTLINE_PRECIS)}
  OUT_SCREEN_OUTLINE_PRECIS = LCLType.OUT_SCREEN_OUTLINE_PRECIS;
{$endif}
{$if declared(CLIP_DEFAULT_PRECIS)}
  CLIP_DEFAULT_PRECIS = LCLType.CLIP_DEFAULT_PRECIS;
{$endif}
{$if declared(CLIP_CHARACTER_PRECIS)}
  CLIP_CHARACTER_PRECIS = LCLType.CLIP_CHARACTER_PRECIS;
{$endif}
{$if declared(CLIP_STROKE_PRECIS)}
  CLIP_STROKE_PRECIS = LCLType.CLIP_STROKE_PRECIS;
{$endif}
{$if declared(CLIP_MASK)}
  CLIP_MASK = LCLType.CLIP_MASK;
{$endif}
{$if declared(CLIP_LH_ANGLES)}
  CLIP_LH_ANGLES = LCLType.CLIP_LH_ANGLES;
{$endif}
{$if declared(CLIP_TT_ALWAYS)}
  CLIP_TT_ALWAYS = LCLType.CLIP_TT_ALWAYS;
{$endif}
{$if declared(CLIP_EMBEDDED)}
  CLIP_EMBEDDED = LCLType.CLIP_EMBEDDED;
{$endif}
{$if declared(DEFAULT_QUALITY)}
  DEFAULT_QUALITY = LCLType.DEFAULT_QUALITY;
{$endif}
{$if declared(DRAFT_QUALITY)}
  DRAFT_QUALITY = LCLType.DRAFT_QUALITY;
{$endif}
{$if declared(PROOF_QUALITY)}
  PROOF_QUALITY = LCLType.PROOF_QUALITY;
{$endif}
{$if declared(NONANTIALIASED_QUALITY)}
  NONANTIALIASED_QUALITY = LCLType.NONANTIALIASED_QUALITY;
{$endif}
{$if declared(ANTIALIASED_QUALITY)}
  ANTIALIASED_QUALITY = LCLType.ANTIALIASED_QUALITY;
{$endif}
{$if declared(CLEARTYPE_QUALITY)}
  CLEARTYPE_QUALITY = LCLType.CLEARTYPE_QUALITY;
{$endif}
{$if declared(CLEARTYPE_NATURAL_QUALITY)}
  CLEARTYPE_NATURAL_QUALITY = LCLType.CLEARTYPE_NATURAL_QUALITY;
{$endif}
{$if declared(DEFAULT_PITCH)}
  DEFAULT_PITCH = LCLType.DEFAULT_PITCH;
{$endif}
{$if declared(FIXED_PITCH)}
  FIXED_PITCH = LCLType.FIXED_PITCH;
{$endif}
{$if declared(VARIABLE_PITCH)}
  VARIABLE_PITCH = LCLType.VARIABLE_PITCH;
{$endif}
{$if declared(MONO_FONT)}
  MONO_FONT = LCLType.MONO_FONT;
{$endif}
{$if declared(ANSI_CHARSET)}
  ANSI_CHARSET = LCLType.ANSI_CHARSET;
{$endif}
{$if declared(DEFAULT_CHARSET)}
  DEFAULT_CHARSET = LCLType.DEFAULT_CHARSET;
{$endif}
{$if declared(SYMBOL_CHARSET)}
  SYMBOL_CHARSET = LCLType.SYMBOL_CHARSET;
{$endif}
{$if declared(FCS_ISO_10646_1)}
  FCS_ISO_10646_1 = LCLType.FCS_ISO_10646_1;
{$endif}
{$if declared(FCS_ISO_8859_1)}
  FCS_ISO_8859_1 = LCLType.FCS_ISO_8859_1;
{$endif}
{$if declared(FCS_ISO_8859_2)}
  FCS_ISO_8859_2 = LCLType.FCS_ISO_8859_2;
{$endif}
{$if declared(FCS_ISO_8859_3)}
  FCS_ISO_8859_3 = LCLType.FCS_ISO_8859_3;
{$endif}
{$if declared(FCS_ISO_8859_4)}
  FCS_ISO_8859_4 = LCLType.FCS_ISO_8859_4;
{$endif}
{$if declared(FCS_ISO_8859_5)}
  FCS_ISO_8859_5 = LCLType.FCS_ISO_8859_5;
{$endif}
{$if declared(FCS_ISO_8859_6)}
  FCS_ISO_8859_6 = LCLType.FCS_ISO_8859_6;
{$endif}
{$if declared(FCS_ISO_8859_7)}
  FCS_ISO_8859_7 = LCLType.FCS_ISO_8859_7;
{$endif}
{$if declared(FCS_ISO_8859_8)}
  FCS_ISO_8859_8 = LCLType.FCS_ISO_8859_8;
{$endif}
{$if declared(FCS_ISO_8859_9)}
  FCS_ISO_8859_9 = LCLType.FCS_ISO_8859_9;
{$endif}
{$if declared(FCS_ISO_8859_10)}
  FCS_ISO_8859_10 = LCLType.FCS_ISO_8859_10;
{$endif}
{$if declared(FCS_ISO_8859_15)}
  FCS_ISO_8859_15 = LCLType.FCS_ISO_8859_15;
{$endif}
{$if declared(MAC_CHARSET)}
  MAC_CHARSET = LCLType.MAC_CHARSET;
{$endif}
{$if declared(SHIFTJIS_CHARSET)}
  SHIFTJIS_CHARSET = LCLType.SHIFTJIS_CHARSET;
{$endif}
{$if declared(HANGEUL_CHARSET)}
  HANGEUL_CHARSET = LCLType.HANGEUL_CHARSET;
{$endif}
{$if declared(JOHAB_CHARSET)}
  JOHAB_CHARSET = LCLType.JOHAB_CHARSET;
{$endif}
{$if declared(GB2312_CHARSET)}
  GB2312_CHARSET = LCLType.GB2312_CHARSET;
{$endif}
{$if declared(CHINESEBIG5_CHARSET)}
  CHINESEBIG5_CHARSET = LCLType.CHINESEBIG5_CHARSET;
{$endif}
{$if declared(GREEK_CHARSET)}
  GREEK_CHARSET = LCLType.GREEK_CHARSET;
{$endif}
{$if declared(TURKISH_CHARSET)}
  TURKISH_CHARSET = LCLType.TURKISH_CHARSET;
{$endif}
{$if declared(VIETNAMESE_CHARSET)}
  VIETNAMESE_CHARSET = LCLType.VIETNAMESE_CHARSET;
{$endif}
{$if declared(HEBREW_CHARSET)}
  HEBREW_CHARSET = LCLType.HEBREW_CHARSET;
{$endif}
{$if declared(ARABIC_CHARSET)}
  ARABIC_CHARSET = LCLType.ARABIC_CHARSET;
{$endif}
{$if declared(BALTIC_CHARSET)}
  BALTIC_CHARSET = LCLType.BALTIC_CHARSET;
{$endif}
{$if declared(RUSSIAN_CHARSET)}
  RUSSIAN_CHARSET = LCLType.RUSSIAN_CHARSET;
{$endif}
{$if declared(THAI_CHARSET)}
  THAI_CHARSET = LCLType.THAI_CHARSET;
{$endif}
{$if declared(EASTEUROPE_CHARSET)}
  EASTEUROPE_CHARSET = LCLType.EASTEUROPE_CHARSET;
{$endif}
{$if declared(OEM_CHARSET)}
  OEM_CHARSET = LCLType.OEM_CHARSET;
{$endif}
{$if declared(FS_LATIN1)}
  FS_LATIN1 = LCLType.FS_LATIN1;
{$endif}
{$if declared(FS_LATIN2)}
  FS_LATIN2 = LCLType.FS_LATIN2;
{$endif}
{$if declared(FS_CYRILLIC)}
  FS_CYRILLIC = LCLType.FS_CYRILLIC;
{$endif}
{$if declared(FS_GREEK)}
  FS_GREEK = LCLType.FS_GREEK;
{$endif}
{$if declared(FS_TURKISH)}
  FS_TURKISH = LCLType.FS_TURKISH;
{$endif}
{$if declared(FS_HEBREW)}
  FS_HEBREW = LCLType.FS_HEBREW;
{$endif}
{$if declared(FS_ARABIC)}
  FS_ARABIC = LCLType.FS_ARABIC;
{$endif}
{$if declared(FS_BALTIC)}
  FS_BALTIC = LCLType.FS_BALTIC;
{$endif}
{$if declared(FS_VIETNAMESE)}
  FS_VIETNAMESE = LCLType.FS_VIETNAMESE;
{$endif}
{$if declared(FS_THAI)}
  FS_THAI = LCLType.FS_THAI;
{$endif}
{$if declared(FS_JISJAPAN)}
  FS_JISJAPAN = LCLType.FS_JISJAPAN;
{$endif}
{$if declared(FS_CHINESESIMP)}
  FS_CHINESESIMP = LCLType.FS_CHINESESIMP;
{$endif}
{$if declared(FS_WANSUNG)}
  FS_WANSUNG = LCLType.FS_WANSUNG;
{$endif}
{$if declared(FS_CHINESETRAD)}
  FS_CHINESETRAD = LCLType.FS_CHINESETRAD;
{$endif}
{$if declared(FS_JOHAB)}
  FS_JOHAB = LCLType.FS_JOHAB;
{$endif}
{$if declared(FS_SYMBOL)}
  FS_SYMBOL = LCLType.FS_SYMBOL;
{$endif}
{$if declared(FF_DONTCARE)}
  FF_DONTCARE = LCLType.FF_DONTCARE;
{$endif}
{$if declared(FF_ROMAN)}
  FF_ROMAN = LCLType.FF_ROMAN;
{$endif}
{$if declared(FF_SWISS)}
  FF_SWISS = LCLType.FF_SWISS;
{$endif}
{$if declared(FF_MODERN)}
  FF_MODERN = LCLType.FF_MODERN;
{$endif}
{$if declared(FF_SCRIPT)}
  FF_SCRIPT = LCLType.FF_SCRIPT;
{$endif}
{$if declared(FF_DECORATIVE)}
  FF_DECORATIVE = LCLType.FF_DECORATIVE;
{$endif}
{$if declared(FW_DONTCARE)}
  FW_DONTCARE = LCLType.FW_DONTCARE;
{$endif}
{$if declared(FW_THIN)}
  FW_THIN = LCLType.FW_THIN;
{$endif}
{$if declared(FW_EXTRALIGHT)}
  FW_EXTRALIGHT = LCLType.FW_EXTRALIGHT;
{$endif}
{$if declared(FW_LIGHT)}
  FW_LIGHT = LCLType.FW_LIGHT;
{$endif}
{$if declared(FW_SEMILIGHT)}
  FW_SEMILIGHT = LCLType.FW_SEMILIGHT;
{$endif}
{$if declared(FW_NORMAL)}
  FW_NORMAL = LCLType.FW_NORMAL;
{$endif}
{$if declared(FW_MEDIUM)}
  FW_MEDIUM = LCLType.FW_MEDIUM;
{$endif}
{$if declared(FW_SEMIBOLD)}
  FW_SEMIBOLD = LCLType.FW_SEMIBOLD;
{$endif}
{$if declared(FW_BOLD)}
  FW_BOLD = LCLType.FW_BOLD;
{$endif}
{$if declared(FW_EXTRABOLD)}
  FW_EXTRABOLD = LCLType.FW_EXTRABOLD;
{$endif}
{$if declared(FW_HEAVY)}
  FW_HEAVY = LCLType.FW_HEAVY;
{$endif}
{$if declared(FW_HAIRLINE)}
  FW_HAIRLINE = LCLType.FW_HAIRLINE;
{$endif}
{$if declared(FW_ULTRALIGHT)}
  FW_ULTRALIGHT = LCLType.FW_ULTRALIGHT;
{$endif}
{$if declared(FW_REGULAR)}
  FW_REGULAR = LCLType.FW_REGULAR;
{$endif}
{$if declared(FW_DEMIBOLD)}
  FW_DEMIBOLD = LCLType.FW_DEMIBOLD;
{$endif}
{$if declared(FW_ULTRABOLD)}
  FW_ULTRABOLD = LCLType.FW_ULTRABOLD;
{$endif}
{$if declared(FW_BLACK)}
  FW_BLACK = LCLType.FW_BLACK;
{$endif}
{$if declared(FONT_STRETCH_ULTRA_CONDENSED)}
  FONT_STRETCH_ULTRA_CONDENSED = LCLType.FONT_STRETCH_ULTRA_CONDENSED;
{$endif}
{$if declared(FONT_STRETCH_EXTRA_CONDENSED)}
  FONT_STRETCH_EXTRA_CONDENSED = LCLType.FONT_STRETCH_EXTRA_CONDENSED;
{$endif}
{$if declared(FONT_STRETCH_CONDENSED)}
  FONT_STRETCH_CONDENSED = LCLType.FONT_STRETCH_CONDENSED;
{$endif}
{$if declared(FONT_STRETCH_SEMI_CONDENSED)}
  FONT_STRETCH_SEMI_CONDENSED = LCLType.FONT_STRETCH_SEMI_CONDENSED;
{$endif}
{$if declared(FONT_STRETCH_NORMAL)}
  FONT_STRETCH_NORMAL = LCLType.FONT_STRETCH_NORMAL;
{$endif}
{$if declared(FONT_STRETCH_SEMI_EXPANDED)}
  FONT_STRETCH_SEMI_EXPANDED = LCLType.FONT_STRETCH_SEMI_EXPANDED;
{$endif}
{$if declared(FONT_STRETCH_EXPANDED)}
  FONT_STRETCH_EXPANDED = LCLType.FONT_STRETCH_EXPANDED;
{$endif}
{$if declared(FONT_STRETCH_EXTRA_EXPANDED)}
  FONT_STRETCH_EXTRA_EXPANDED = LCLType.FONT_STRETCH_EXTRA_EXPANDED;
{$endif}
{$if declared(FONT_STRETCH_ULTRA_EXPANDED)}
  FONT_STRETCH_ULTRA_EXPANDED = LCLType.FONT_STRETCH_ULTRA_EXPANDED;
{$endif}
{$if declared(FOUNDRYCHAR_OPEN)}
  FOUNDRYCHAR_OPEN = LCLType.FOUNDRYCHAR_OPEN;
{$endif}
{$if declared(FOUNDRYCHAR_CLOSE)}
  FOUNDRYCHAR_CLOSE = LCLType.FOUNDRYCHAR_CLOSE;
{$endif}
{$if declared(XLFD_FONTNAME_REG)}
  XLFD_FONTNAME_REG = LCLType.XLFD_FONTNAME_REG;
{$endif}
{$if declared(XLFD_FOUNDRY)}
  XLFD_FOUNDRY = LCLType.XLFD_FOUNDRY;
{$endif}
{$if declared(XLFD_FAMILY)}
  XLFD_FAMILY = LCLType.XLFD_FAMILY;
{$endif}
{$if declared(XLFD_WEIGHTNAME)}
  XLFD_WEIGHTNAME = LCLType.XLFD_WEIGHTNAME;
{$endif}
{$if declared(XLFD_SLANT)}
  XLFD_SLANT = LCLType.XLFD_SLANT;
{$endif}
{$if declared(XLFD_WIDTHNAME)}
  XLFD_WIDTHNAME = LCLType.XLFD_WIDTHNAME;
{$endif}
{$if declared(XLFD_STYLENAME)}
  XLFD_STYLENAME = LCLType.XLFD_STYLENAME;
{$endif}
{$if declared(XLFD_PIXELSIZE)}
  XLFD_PIXELSIZE = LCLType.XLFD_PIXELSIZE;
{$endif}
{$if declared(XLFD_POINTSIZE)}
  XLFD_POINTSIZE = LCLType.XLFD_POINTSIZE;
{$endif}
{$if declared(XLFD_RESX)}
  XLFD_RESX = LCLType.XLFD_RESX;
{$endif}
{$if declared(XLFD_RESY)}
  XLFD_RESY = LCLType.XLFD_RESY;
{$endif}
{$if declared(XLFD_SPACING)}
  XLFD_SPACING = LCLType.XLFD_SPACING;
{$endif}
{$if declared(XLFD_AVG_WIDTH)}
  XLFD_AVG_WIDTH = LCLType.XLFD_AVG_WIDTH;
{$endif}
{$if declared(XLFD_CHARSET_REG)}
  XLFD_CHARSET_REG = LCLType.XLFD_CHARSET_REG;
{$endif}
{$if declared(XLFD_CHARSET_COD)}
  XLFD_CHARSET_COD = LCLType.XLFD_CHARSET_COD;
{$endif}
{$if declared(BS_SOLID)}
  BS_SOLID = LCLType.BS_SOLID;
{$endif}
{$if declared(BS_NULL)}
  BS_NULL = LCLType.BS_NULL;
{$endif}
{$if declared(BS_HOLLOW)}
  BS_HOLLOW = LCLType.BS_HOLLOW;
{$endif}
{$if declared(BS_HATCHED)}
  BS_HATCHED = LCLType.BS_HATCHED;
{$endif}
{$if declared(BS_PATTERN)}
  BS_PATTERN = LCLType.BS_PATTERN;
{$endif}
{$if declared(BS_INDEXED)}
  BS_INDEXED = LCLType.BS_INDEXED;
{$endif}
{$if declared(BS_DIBPATTERN)}
  BS_DIBPATTERN = LCLType.BS_DIBPATTERN;
{$endif}
{$if declared(BS_DIBPATTERNPT)}
  BS_DIBPATTERNPT = LCLType.BS_DIBPATTERNPT;
{$endif}
{$if declared(BS_PATTERN8X8)}
  BS_PATTERN8X8 = LCLType.BS_PATTERN8X8;
{$endif}
{$if declared(BS_DIBPATTERN8X8)}
  BS_DIBPATTERN8X8 = LCLType.BS_DIBPATTERN8X8;
{$endif}
{$if declared(BS_MONOPATTERN)}
  BS_MONOPATTERN = LCLType.BS_MONOPATTERN;
{$endif}
{$if declared(HS_HORIZONTAL)}
  HS_HORIZONTAL = LCLType.HS_HORIZONTAL;
{$endif}
{$if declared(HS_VERTICAL)}
  HS_VERTICAL = LCLType.HS_VERTICAL;
{$endif}
{$if declared(HS_FDIAGONAL)}
  HS_FDIAGONAL = LCLType.HS_FDIAGONAL;
{$endif}
{$if declared(HS_BDIAGONAL)}
  HS_BDIAGONAL = LCLType.HS_BDIAGONAL;
{$endif}
{$if declared(HS_CROSS)}
  HS_CROSS = LCLType.HS_CROSS;
{$endif}
{$if declared(HS_DIAGCROSS)}
  HS_DIAGCROSS = LCLType.HS_DIAGCROSS;
{$endif}
{$if declared(PS_SOLID)}
  PS_SOLID = LCLType.PS_SOLID;
{$endif}
{$if declared(PS_DASH)}
  PS_DASH = LCLType.PS_DASH;
{$endif}
{$if declared(PS_DOT)}
  PS_DOT = LCLType.PS_DOT;
{$endif}
{$if declared(PS_DASHDOT)}
  PS_DASHDOT = LCLType.PS_DASHDOT;
{$endif}
{$if declared(PS_DASHDOTDOT)}
  PS_DASHDOTDOT = LCLType.PS_DASHDOTDOT;
{$endif}
{$if declared(PS_NULL)}
  PS_NULL = LCLType.PS_NULL;
{$endif}
{$if declared(PS_INSIDEFRAME)}
  PS_INSIDEFRAME = LCLType.PS_INSIDEFRAME;
{$endif}
{$if declared(PS_USERSTYLE)}
  PS_USERSTYLE = LCLType.PS_USERSTYLE;
{$endif}
{$if declared(PS_ALTERNATE)}
  PS_ALTERNATE = LCLType.PS_ALTERNATE;
{$endif}
{$if declared(PS_STYLE_MASK)}
  PS_STYLE_MASK = LCLType.PS_STYLE_MASK;
{$endif}
{$if declared(PS_ENDCAP_ROUND)}
  PS_ENDCAP_ROUND = LCLType.PS_ENDCAP_ROUND;
{$endif}
{$if declared(PS_ENDCAP_SQUARE)}
  PS_ENDCAP_SQUARE = LCLType.PS_ENDCAP_SQUARE;
{$endif}
{$if declared(PS_ENDCAP_FLAT)}
  PS_ENDCAP_FLAT = LCLType.PS_ENDCAP_FLAT;
{$endif}
{$if declared(PS_ENDCAP_MASK)}
  PS_ENDCAP_MASK = LCLType.PS_ENDCAP_MASK;
{$endif}
{$if declared(PS_JOIN_ROUND)}
  PS_JOIN_ROUND = LCLType.PS_JOIN_ROUND;
{$endif}
{$if declared(PS_JOIN_BEVEL)}
  PS_JOIN_BEVEL = LCLType.PS_JOIN_BEVEL;
{$endif}
{$if declared(PS_JOIN_MITER)}
  PS_JOIN_MITER = LCLType.PS_JOIN_MITER;
{$endif}
{$if declared(PS_JOIN_MASK)}
  PS_JOIN_MASK = LCLType.PS_JOIN_MASK;
{$endif}
{$if declared(PS_COSMETIC)}
  PS_COSMETIC = LCLType.PS_COSMETIC;
{$endif}
{$if declared(PS_GEOMETRIC)}
  PS_GEOMETRIC = LCLType.PS_GEOMETRIC;
{$endif}
{$if declared(PS_TYPE_MASK)}
  PS_TYPE_MASK = LCLType.PS_TYPE_MASK;
{$endif}
{$if declared(MM_TEXT)}
  MM_TEXT = LCLType.MM_TEXT;
{$endif}
{$if declared(MM_LOMETRIC)}
  MM_LOMETRIC = LCLType.MM_LOMETRIC;
{$endif}
{$if declared(MM_HIMETRIC)}
  MM_HIMETRIC = LCLType.MM_HIMETRIC;
{$endif}
{$if declared(MM_LOENGLISH)}
  MM_LOENGLISH = LCLType.MM_LOENGLISH;
{$endif}
{$if declared(MM_HIENGLISH)}
  MM_HIENGLISH = LCLType.MM_HIENGLISH;
{$endif}
{$if declared(MM_TWIPS)}
  MM_TWIPS = LCLType.MM_TWIPS;
{$endif}
{$if declared(MM_ISOTROPIC)}
  MM_ISOTROPIC = LCLType.MM_ISOTROPIC;
{$endif}
{$if declared(MM_ANISOTROPIC)}
  MM_ANISOTROPIC = LCLType.MM_ANISOTROPIC;
{$endif}
{$if declared(CLR_NONE)}
  CLR_NONE = LCLType.CLR_NONE;
{$endif}
{$if declared(CLR_DEFAULT)}
  CLR_DEFAULT = LCLType.CLR_DEFAULT;
{$endif}
{$if declared(CLR_INVALID)}
  CLR_INVALID = LCLType.CLR_INVALID;
{$endif}
{$if declared(COLOR_SCROLLBAR)}
  COLOR_SCROLLBAR = LCLType.COLOR_SCROLLBAR;
{$endif}
{$if declared(COLOR_BACKGROUND)}
  COLOR_BACKGROUND = LCLType.COLOR_BACKGROUND;
{$endif}
{$if declared(COLOR_ACTIVECAPTION)}
  COLOR_ACTIVECAPTION = LCLType.COLOR_ACTIVECAPTION;
{$endif}
{$if declared(COLOR_INACTIVECAPTION)}
  COLOR_INACTIVECAPTION = LCLType.COLOR_INACTIVECAPTION;
{$endif}
{$if declared(COLOR_MENU)}
  COLOR_MENU = LCLType.COLOR_MENU;
{$endif}
{$if declared(COLOR_WINDOW)}
  COLOR_WINDOW = LCLType.COLOR_WINDOW;
{$endif}
{$if declared(COLOR_WINDOWFRAME)}
  COLOR_WINDOWFRAME = LCLType.COLOR_WINDOWFRAME;
{$endif}
{$if declared(COLOR_MENUTEXT)}
  COLOR_MENUTEXT = LCLType.COLOR_MENUTEXT;
{$endif}
{$if declared(COLOR_WINDOWTEXT)}
  COLOR_WINDOWTEXT = LCLType.COLOR_WINDOWTEXT;
{$endif}
{$if declared(COLOR_CAPTIONTEXT)}
  COLOR_CAPTIONTEXT = LCLType.COLOR_CAPTIONTEXT;
{$endif}
{$if declared(COLOR_ACTIVEBORDER)}
  COLOR_ACTIVEBORDER = LCLType.COLOR_ACTIVEBORDER;
{$endif}
{$if declared(COLOR_INACTIVEBORDER)}
  COLOR_INACTIVEBORDER = LCLType.COLOR_INACTIVEBORDER;
{$endif}
{$if declared(COLOR_APPWORKSPACE)}
  COLOR_APPWORKSPACE = LCLType.COLOR_APPWORKSPACE;
{$endif}
{$if declared(COLOR_HIGHLIGHT)}
  COLOR_HIGHLIGHT = LCLType.COLOR_HIGHLIGHT;
{$endif}
{$if declared(COLOR_HIGHLIGHTTEXT)}
  COLOR_HIGHLIGHTTEXT = LCLType.COLOR_HIGHLIGHTTEXT;
{$endif}
{$if declared(COLOR_BTNFACE)}
  COLOR_BTNFACE = LCLType.COLOR_BTNFACE;
{$endif}
{$if declared(COLOR_BTNSHADOW)}
  COLOR_BTNSHADOW = LCLType.COLOR_BTNSHADOW;
{$endif}
{$if declared(COLOR_GRAYTEXT)}
  COLOR_GRAYTEXT = LCLType.COLOR_GRAYTEXT;
{$endif}
{$if declared(COLOR_BTNTEXT)}
  COLOR_BTNTEXT = LCLType.COLOR_BTNTEXT;
{$endif}
{$if declared(COLOR_INACTIVECAPTIONTEXT)}
  COLOR_INACTIVECAPTIONTEXT = LCLType.COLOR_INACTIVECAPTIONTEXT;
{$endif}
{$if declared(COLOR_BTNHIGHLIGHT)}
  COLOR_BTNHIGHLIGHT = LCLType.COLOR_BTNHIGHLIGHT;
{$endif}
{$if declared(COLOR_3DDKSHADOW)}
  COLOR_3DDKSHADOW = LCLType.COLOR_3DDKSHADOW;
{$endif}
{$if declared(COLOR_3DLIGHT)}
  COLOR_3DLIGHT = LCLType.COLOR_3DLIGHT;
{$endif}
{$if declared(COLOR_INFOTEXT)}
  COLOR_INFOTEXT = LCLType.COLOR_INFOTEXT;
{$endif}
{$if declared(COLOR_INFOBK)}
  COLOR_INFOBK = LCLType.COLOR_INFOBK;
{$endif}
{$if declared(COLOR_HOTLIGHT)}
  COLOR_HOTLIGHT = LCLType.COLOR_HOTLIGHT;
{$endif}
{$if declared(COLOR_GRADIENTACTIVECAPTION)}
  COLOR_GRADIENTACTIVECAPTION = LCLType.COLOR_GRADIENTACTIVECAPTION;
{$endif}
{$if declared(COLOR_GRADIENTINACTIVECAPTION)}
  COLOR_GRADIENTINACTIVECAPTION = LCLType.COLOR_GRADIENTINACTIVECAPTION;
{$endif}
{$if declared(COLOR_MENUHILIGHT)}
  COLOR_MENUHILIGHT = LCLType.COLOR_MENUHILIGHT;
{$endif}
{$if declared(COLOR_MENUBAR)}
  COLOR_MENUBAR = LCLType.COLOR_MENUBAR;
{$endif}
{$if declared(COLOR_FORM)}
  COLOR_FORM = LCLType.COLOR_FORM;
{$endif}
{$if declared(COLOR_ENDCOLORS)}
  COLOR_ENDCOLORS = LCLType.COLOR_ENDCOLORS;
{$endif}
{$if declared(COLOR_DESKTOP)}
  COLOR_DESKTOP = LCLType.COLOR_DESKTOP;
{$endif}
{$if declared(COLOR_3DFACE)}
  COLOR_3DFACE = LCLType.COLOR_3DFACE;
{$endif}
{$if declared(COLOR_3DSHADOW)}
  COLOR_3DSHADOW = LCLType.COLOR_3DSHADOW;
{$endif}
{$if declared(COLOR_3DHIGHLIGHT)}
  COLOR_3DHIGHLIGHT = LCLType.COLOR_3DHIGHLIGHT;
{$endif}
{$if declared(COLOR_3DHILIGHT)}
  COLOR_3DHILIGHT = LCLType.COLOR_3DHILIGHT;
{$endif}
{$if declared(COLOR_BTNHILIGHT)}
  COLOR_BTNHILIGHT = LCLType.COLOR_BTNHILIGHT;
{$endif}
{$if declared(MAX_SYS_COLORS)}
  MAX_SYS_COLORS = LCLType.MAX_SYS_COLORS;
{$endif}
{$if declared(SYS_COLOR_BASE)}
  SYS_COLOR_BASE = LCLType.SYS_COLOR_BASE;
{$endif}
{$if declared(WHITE_BRUSH)}
  WHITE_BRUSH = LCLType.WHITE_BRUSH;
{$endif}
{$if declared(LTGRAY_BRUSH)}
  LTGRAY_BRUSH = LCLType.LTGRAY_BRUSH;
{$endif}
{$if declared(GRAY_BRUSH)}
  GRAY_BRUSH = LCLType.GRAY_BRUSH;
{$endif}
{$if declared(DKGRAY_BRUSH)}
  DKGRAY_BRUSH = LCLType.DKGRAY_BRUSH;
{$endif}
{$if declared(BLACK_BRUSH)}
  BLACK_BRUSH = LCLType.BLACK_BRUSH;
{$endif}
{$if declared(NULL_BRUSH)}
  NULL_BRUSH = LCLType.NULL_BRUSH;
{$endif}
{$if declared(HOLLOW_BRUSH)}
  HOLLOW_BRUSH = LCLType.HOLLOW_BRUSH;
{$endif}
{$if declared(WHITE_PEN)}
  WHITE_PEN = LCLType.WHITE_PEN;
{$endif}
{$if declared(BLACK_PEN)}
  BLACK_PEN = LCLType.BLACK_PEN;
{$endif}
{$if declared(NULL_PEN)}
  NULL_PEN = LCLType.NULL_PEN;
{$endif}
{$if declared(OEM_FIXED_FONT)}
  OEM_FIXED_FONT = LCLType.OEM_FIXED_FONT;
{$endif}
{$if declared(ANSI_FIXED_FONT)}
  ANSI_FIXED_FONT = LCLType.ANSI_FIXED_FONT;
{$endif}
{$if declared(ANSI_VAR_FONT)}
  ANSI_VAR_FONT = LCLType.ANSI_VAR_FONT;
{$endif}
{$if declared(SYSTEM_FONT)}
  SYSTEM_FONT = LCLType.SYSTEM_FONT;
{$endif}
{$if declared(DEVICE_DEFAULT_FONT)}
  DEVICE_DEFAULT_FONT = LCLType.DEVICE_DEFAULT_FONT;
{$endif}
{$if declared(DEFAULT_PALETTE)}
  DEFAULT_PALETTE = LCLType.DEFAULT_PALETTE;
{$endif}
{$if declared(SYSTEM_FIXED_FONT)}
  SYSTEM_FIXED_FONT = LCLType.SYSTEM_FIXED_FONT;
{$endif}
{$if declared(DEFAULT_GUI_FONT)}
  DEFAULT_GUI_FONT = LCLType.DEFAULT_GUI_FONT;
{$endif}
{$if declared(DC_BRUSH)}
  DC_BRUSH = LCLType.DC_BRUSH;
{$endif}
{$if declared(DC_PEN)}
  DC_PEN = LCLType.DC_PEN;
{$endif}
{$if declared(STOCK_LAST)}
  STOCK_LAST = LCLType.STOCK_LAST;
{$endif}
{$if declared(idButtonBase)}
  idButtonBase = LCLType.idButtonBase;
{$endif}
{$if declared(idButtonOk)}
  idButtonOk = LCLType.idButtonOk;
{$endif}
{$if declared(idButtonCancel)}
  idButtonCancel = LCLType.idButtonCancel;
{$endif}
{$if declared(idButtonHelp)}
  idButtonHelp = LCLType.idButtonHelp;
{$endif}
{$if declared(idButtonYes)}
  idButtonYes = LCLType.idButtonYes;
{$endif}
{$if declared(idButtonNo)}
  idButtonNo = LCLType.idButtonNo;
{$endif}
{$if declared(idButtonClose)}
  idButtonClose = LCLType.idButtonClose;
{$endif}
{$if declared(idButtonAbort)}
  idButtonAbort = LCLType.idButtonAbort;
{$endif}
{$if declared(idButtonRetry)}
  idButtonRetry = LCLType.idButtonRetry;
{$endif}
{$if declared(idButtonIgnore)}
  idButtonIgnore = LCLType.idButtonIgnore;
{$endif}
{$if declared(idButtonAll)}
  idButtonAll = LCLType.idButtonAll;
{$endif}
{$if declared(idButtonYesToAll)}
  idButtonYesToAll = LCLType.idButtonYesToAll;
{$endif}
{$if declared(idButtonNoToAll)}
  idButtonNoToAll = LCLType.idButtonNoToAll;
{$endif}
{$if declared(idButtonOpen)}
  idButtonOpen = LCLType.idButtonOpen;
{$endif}
{$if declared(idButtonSave)}
  idButtonSave = LCLType.idButtonSave;
{$endif}
{$if declared(idButtonShield)}
  idButtonShield = LCLType.idButtonShield;
{$endif}
{$if declared(idButtonContinue)}
  idButtonContinue = LCLType.idButtonContinue;
{$endif}
{$if declared(idButtonTryAgain)}
  idButtonTryAgain = LCLType.idButtonTryAgain;
{$endif}
{$if declared(idDialogBase)}
  idDialogBase = LCLType.idDialogBase;
{$endif}
{$if declared(idDialogWarning)}
  idDialogWarning = LCLType.idDialogWarning;
{$endif}
{$if declared(idDialogError)}
  idDialogError = LCLType.idDialogError;
{$endif}
{$if declared(idDialogInfo)}
  idDialogInfo = LCLType.idDialogInfo;
{$endif}
{$if declared(idDialogConfirm)}
  idDialogConfirm = LCLType.idDialogConfirm;
{$endif}
{$if declared(idDialogShield)}
  idDialogShield = LCLType.idDialogShield;
{$endif}
{$if declared(OBJ_PEN)}
  OBJ_PEN = LCLType.OBJ_PEN;
{$endif}
{$if declared(OBJ_BRUSH)}
  OBJ_BRUSH = LCLType.OBJ_BRUSH;
{$endif}
{$if declared(OBJ_DC)}
  OBJ_DC = LCLType.OBJ_DC;
{$endif}
{$if declared(OBJ_METADC)}
  OBJ_METADC = LCLType.OBJ_METADC;
{$endif}
{$if declared(OBJ_PAL)}
  OBJ_PAL = LCLType.OBJ_PAL;
{$endif}
{$if declared(OBJ_FONT)}
  OBJ_FONT = LCLType.OBJ_FONT;
{$endif}
{$if declared(OBJ_BITMAP)}
  OBJ_BITMAP = LCLType.OBJ_BITMAP;
{$endif}
{$if declared(OBJ_REGION)}
  OBJ_REGION = LCLType.OBJ_REGION;
{$endif}
{$if declared(OBJ_METAFILE)}
  OBJ_METAFILE = LCLType.OBJ_METAFILE;
{$endif}
{$if declared(OBJ_MEMDC)}
  OBJ_MEMDC = LCLType.OBJ_MEMDC;
{$endif}
{$if declared(OBJ_EXTPEN)}
  OBJ_EXTPEN = LCLType.OBJ_EXTPEN;
{$endif}
{$if declared(OBJ_ENHMETADC)}
  OBJ_ENHMETADC = LCLType.OBJ_ENHMETADC;
{$endif}
{$if declared(OBJ_ENHMETAFILE)}
  OBJ_ENHMETAFILE = LCLType.OBJ_ENHMETAFILE;
{$endif}
{$if declared(OBJ_COLORSPACE)}
  OBJ_COLORSPACE = LCLType.OBJ_COLORSPACE;
{$endif}
{$if declared(SM_CXSCREEN)}
  SM_CXSCREEN = LCLType.SM_CXSCREEN;
{$endif}
{$if declared(SM_CYSCREEN)}
  SM_CYSCREEN = LCLType.SM_CYSCREEN;
{$endif}
{$if declared(SM_CXVSCROLL)}
  SM_CXVSCROLL = LCLType.SM_CXVSCROLL;
{$endif}
{$if declared(SM_CYHSCROLL)}
  SM_CYHSCROLL = LCLType.SM_CYHSCROLL;
{$endif}
{$if declared(SM_CYCAPTION)}
  SM_CYCAPTION = LCLType.SM_CYCAPTION;
{$endif}
{$if declared(SM_CXBORDER)}
  SM_CXBORDER = LCLType.SM_CXBORDER;
{$endif}
{$if declared(SM_CYBORDER)}
  SM_CYBORDER = LCLType.SM_CYBORDER;
{$endif}
{$if declared(SM_CXDLGFRAME)}
  SM_CXDLGFRAME = LCLType.SM_CXDLGFRAME;
{$endif}
{$if declared(SM_CYDLGFRAME)}
  SM_CYDLGFRAME = LCLType.SM_CYDLGFRAME;
{$endif}
{$if declared(SM_CYVTHUMB)}
  SM_CYVTHUMB = LCLType.SM_CYVTHUMB;
{$endif}
{$if declared(SM_CXHTHUMB)}
  SM_CXHTHUMB = LCLType.SM_CXHTHUMB;
{$endif}
{$if declared(SM_CXICON)}
  SM_CXICON = LCLType.SM_CXICON;
{$endif}
{$if declared(SM_CYICON)}
  SM_CYICON = LCLType.SM_CYICON;
{$endif}
{$if declared(SM_CXCURSOR)}
  SM_CXCURSOR = LCLType.SM_CXCURSOR;
{$endif}
{$if declared(SM_CYCURSOR)}
  SM_CYCURSOR = LCLType.SM_CYCURSOR;
{$endif}
{$if declared(SM_CYMENU)}
  SM_CYMENU = LCLType.SM_CYMENU;
{$endif}
{$if declared(SM_CXFULLSCREEN)}
  SM_CXFULLSCREEN = LCLType.SM_CXFULLSCREEN;
{$endif}
{$if declared(SM_CYFULLSCREEN)}
  SM_CYFULLSCREEN = LCLType.SM_CYFULLSCREEN;
{$endif}
{$if declared(SM_CYKANJIWINDOW)}
  SM_CYKANJIWINDOW = LCLType.SM_CYKANJIWINDOW;
{$endif}
{$if declared(SM_MOUSEPRESENT)}
  SM_MOUSEPRESENT = LCLType.SM_MOUSEPRESENT;
{$endif}
{$if declared(SM_CYVSCROLL)}
  SM_CYVSCROLL = LCLType.SM_CYVSCROLL;
{$endif}
{$if declared(SM_CXHSCROLL)}
  SM_CXHSCROLL = LCLType.SM_CXHSCROLL;
{$endif}
{$if declared(SM_DEBUG)}
  SM_DEBUG = LCLType.SM_DEBUG;
{$endif}
{$if declared(SM_SWAPBUTTON)}
  SM_SWAPBUTTON = LCLType.SM_SWAPBUTTON;
{$endif}
{$if declared(SM_RESERVED1)}
  SM_RESERVED1 = LCLType.SM_RESERVED1;
{$endif}
{$if declared(SM_RESERVED2)}
  SM_RESERVED2 = LCLType.SM_RESERVED2;
{$endif}
{$if declared(SM_RESERVED3)}
  SM_RESERVED3 = LCLType.SM_RESERVED3;
{$endif}
{$if declared(SM_RESERVED4)}
  SM_RESERVED4 = LCLType.SM_RESERVED4;
{$endif}
{$if declared(SM_CXMIN)}
  SM_CXMIN = LCLType.SM_CXMIN;
{$endif}
{$if declared(SM_CYMIN)}
  SM_CYMIN = LCLType.SM_CYMIN;
{$endif}
{$if declared(SM_CXSIZE)}
  SM_CXSIZE = LCLType.SM_CXSIZE;
{$endif}
{$if declared(SM_CYSIZE)}
  SM_CYSIZE = LCLType.SM_CYSIZE;
{$endif}
{$if declared(SM_CXFRAME)}
  SM_CXFRAME = LCLType.SM_CXFRAME;
{$endif}
{$if declared(SM_CYFRAME)}
  SM_CYFRAME = LCLType.SM_CYFRAME;
{$endif}
{$if declared(SM_CXMINTRACK)}
  SM_CXMINTRACK = LCLType.SM_CXMINTRACK;
{$endif}
{$if declared(SM_CYMINTRACK)}
  SM_CYMINTRACK = LCLType.SM_CYMINTRACK;
{$endif}
{$if declared(SM_CXDOUBLECLK)}
  SM_CXDOUBLECLK = LCLType.SM_CXDOUBLECLK;
{$endif}
{$if declared(SM_CYDOUBLECLK)}
  SM_CYDOUBLECLK = LCLType.SM_CYDOUBLECLK;
{$endif}
{$if declared(SM_CXICONSPACING)}
  SM_CXICONSPACING = LCLType.SM_CXICONSPACING;
{$endif}
{$if declared(SM_CYICONSPACING)}
  SM_CYICONSPACING = LCLType.SM_CYICONSPACING;
{$endif}
{$if declared(SM_MENUDROPALIGNMENT)}
  SM_MENUDROPALIGNMENT = LCLType.SM_MENUDROPALIGNMENT;
{$endif}
{$if declared(SM_PENWINDOWS)}
  SM_PENWINDOWS = LCLType.SM_PENWINDOWS;
{$endif}
{$if declared(SM_DBCSENABLED)}
  SM_DBCSENABLED = LCLType.SM_DBCSENABLED;
{$endif}
{$if declared(SM_CMOUSEBUTTONS)}
  SM_CMOUSEBUTTONS = LCLType.SM_CMOUSEBUTTONS;
{$endif}
{$if declared(SM_CXFIXEDFRAME)}
  SM_CXFIXEDFRAME = LCLType.SM_CXFIXEDFRAME;
{$endif}
{$if declared(SM_CYFIXEDFRAME)}
  SM_CYFIXEDFRAME = LCLType.SM_CYFIXEDFRAME;
{$endif}
{$if declared(SM_CXSIZEFRAME)}
  SM_CXSIZEFRAME = LCLType.SM_CXSIZEFRAME;
{$endif}
{$if declared(SM_CYSIZEFRAME)}
  SM_CYSIZEFRAME = LCLType.SM_CYSIZEFRAME;
{$endif}
{$if declared(SM_SECURE)}
  SM_SECURE = LCLType.SM_SECURE;
{$endif}
{$if declared(SM_CXEDGE)}
  SM_CXEDGE = LCLType.SM_CXEDGE;
{$endif}
{$if declared(SM_CYEDGE)}
  SM_CYEDGE = LCLType.SM_CYEDGE;
{$endif}
{$if declared(SM_CXMINSPACING)}
  SM_CXMINSPACING = LCLType.SM_CXMINSPACING;
{$endif}
{$if declared(SM_CYMINSPACING)}
  SM_CYMINSPACING = LCLType.SM_CYMINSPACING;
{$endif}
{$if declared(SM_CXSMICON)}
  SM_CXSMICON = LCLType.SM_CXSMICON;
{$endif}
{$if declared(SM_CYSMICON)}
  SM_CYSMICON = LCLType.SM_CYSMICON;
{$endif}
{$if declared(SM_CYSMCAPTION)}
  SM_CYSMCAPTION = LCLType.SM_CYSMCAPTION;
{$endif}
{$if declared(SM_CXSMSIZE)}
  SM_CXSMSIZE = LCLType.SM_CXSMSIZE;
{$endif}
{$if declared(SM_CYSMSIZE)}
  SM_CYSMSIZE = LCLType.SM_CYSMSIZE;
{$endif}
{$if declared(SM_CXMENUSIZE)}
  SM_CXMENUSIZE = LCLType.SM_CXMENUSIZE;
{$endif}
{$if declared(SM_CYMENUSIZE)}
  SM_CYMENUSIZE = LCLType.SM_CYMENUSIZE;
{$endif}
{$if declared(SM_ARRANGE)}
  SM_ARRANGE = LCLType.SM_ARRANGE;
{$endif}
{$if declared(SM_CXMINIMIZED)}
  SM_CXMINIMIZED = LCLType.SM_CXMINIMIZED;
{$endif}
{$if declared(SM_CYMINIMIZED)}
  SM_CYMINIMIZED = LCLType.SM_CYMINIMIZED;
{$endif}
{$if declared(SM_CXMAXTRACK)}
  SM_CXMAXTRACK = LCLType.SM_CXMAXTRACK;
{$endif}
{$if declared(SM_CYMAXTRACK)}
  SM_CYMAXTRACK = LCLType.SM_CYMAXTRACK;
{$endif}
{$if declared(SM_CXMAXIMIZED)}
  SM_CXMAXIMIZED = LCLType.SM_CXMAXIMIZED;
{$endif}
{$if declared(SM_CYMAXIMIZED)}
  SM_CYMAXIMIZED = LCLType.SM_CYMAXIMIZED;
{$endif}
{$if declared(SM_NETWORK)}
  SM_NETWORK = LCLType.SM_NETWORK;
{$endif}
{$if declared(SM_CLEANBOOT)}
  SM_CLEANBOOT = LCLType.SM_CLEANBOOT;
{$endif}
{$if declared(SM_CXDRAG)}
  SM_CXDRAG = LCLType.SM_CXDRAG;
{$endif}
{$if declared(SM_CYDRAG)}
  SM_CYDRAG = LCLType.SM_CYDRAG;
{$endif}
{$if declared(SM_SHOWSOUNDS)}
  SM_SHOWSOUNDS = LCLType.SM_SHOWSOUNDS;
{$endif}
{$if declared(SM_CXMENUCHECK)}
  SM_CXMENUCHECK = LCLType.SM_CXMENUCHECK;
{$endif}
{$if declared(SM_CYMENUCHECK)}
  SM_CYMENUCHECK = LCLType.SM_CYMENUCHECK;
{$endif}
{$if declared(SM_SLOWMACHINE)}
  SM_SLOWMACHINE = LCLType.SM_SLOWMACHINE;
{$endif}
{$if declared(SM_MIDEASTENABLED)}
  SM_MIDEASTENABLED = LCLType.SM_MIDEASTENABLED;
{$endif}
{$if declared(SM_MOUSEWHEELPRESENT)}
  SM_MOUSEWHEELPRESENT = LCLType.SM_MOUSEWHEELPRESENT;
{$endif}
{$if declared(SM_CMETRICS)}
  SM_CMETRICS = LCLType.SM_CMETRICS;
{$endif}
{$if declared(SM_XVIRTUALSCREEN)}
  SM_XVIRTUALSCREEN = LCLType.SM_XVIRTUALSCREEN;
{$endif}
{$if declared(SM_YVIRTUALSCREEN)}
  SM_YVIRTUALSCREEN = LCLType.SM_YVIRTUALSCREEN;
{$endif}
{$if declared(SM_CXVIRTUALSCREEN)}
  SM_CXVIRTUALSCREEN = LCLType.SM_CXVIRTUALSCREEN;
{$endif}
{$if declared(SM_CYVIRTUALSCREEN)}
  SM_CYVIRTUALSCREEN = LCLType.SM_CYVIRTUALSCREEN;
{$endif}
{$if declared(SM_CMONITORS)}
  SM_CMONITORS = LCLType.SM_CMONITORS;
{$endif}
{$if declared(SM_SAMEDISPLAYFORMAT)}
  SM_SAMEDISPLAYFORMAT = LCLType.SM_SAMEDISPLAYFORMAT;
{$endif}
{$if declared(SM_SWSCROLLBARSPACING)}
  SM_SWSCROLLBARSPACING = LCLType.SM_SWSCROLLBARSPACING;
{$endif}
{$if declared(SM_LCLMAXIMIZEDWIDTH)}
  SM_LCLMAXIMIZEDWIDTH = LCLType.SM_LCLMAXIMIZEDWIDTH;
{$endif}
{$if declared(SM_LCLMAXIMIZEDHEIGHT)}
  SM_LCLMAXIMIZEDHEIGHT = LCLType.SM_LCLMAXIMIZEDHEIGHT;
{$endif}
{$if declared(SM_LCLHasFormAlphaBlend)}
  SM_LCLHasFormAlphaBlend = LCLType.SM_LCLHasFormAlphaBlend;
{$endif}
{$if declared(SM_REMOTESESSION)}
  SM_REMOTESESSION = LCLType.SM_REMOTESESSION;
{$endif}
{$if declared(SPI_GETBEEP)}
  SPI_GETBEEP = LCLType.SPI_GETBEEP;
{$endif}
{$if declared(SPI_SETBEEP)}
  SPI_SETBEEP = LCLType.SPI_SETBEEP;
{$endif}
{$if declared(SPI_GETMOUSE)}
  SPI_GETMOUSE = LCLType.SPI_GETMOUSE;
{$endif}
{$if declared(SPI_SETMOUSE)}
  SPI_SETMOUSE = LCLType.SPI_SETMOUSE;
{$endif}
{$if declared(SPI_GETBORDER)}
  SPI_GETBORDER = LCLType.SPI_GETBORDER;
{$endif}
{$if declared(SPI_SETBORDER)}
  SPI_SETBORDER = LCLType.SPI_SETBORDER;
{$endif}
{$if declared(SPI_GETKEYBOARDSPEED)}
  SPI_GETKEYBOARDSPEED = LCLType.SPI_GETKEYBOARDSPEED;
{$endif}
{$if declared(SPI_SETKEYBOARDSPEED)}
  SPI_SETKEYBOARDSPEED = LCLType.SPI_SETKEYBOARDSPEED;
{$endif}
{$if declared(SPI_LANGDRIVER)}
  SPI_LANGDRIVER = LCLType.SPI_LANGDRIVER;
{$endif}
{$if declared(SPI_ICONHORIZONTALSPACING)}
  SPI_ICONHORIZONTALSPACING = LCLType.SPI_ICONHORIZONTALSPACING;
{$endif}
{$if declared(SPI_GETSCREENSAVETIMEOUT)}
  SPI_GETSCREENSAVETIMEOUT = LCLType.SPI_GETSCREENSAVETIMEOUT;
{$endif}
{$if declared(SPI_SETSCREENSAVETIMEOUT)}
  SPI_SETSCREENSAVETIMEOUT = LCLType.SPI_SETSCREENSAVETIMEOUT;
{$endif}
{$if declared(SPI_GETSCREENSAVEACTIVE)}
  SPI_GETSCREENSAVEACTIVE = LCLType.SPI_GETSCREENSAVEACTIVE;
{$endif}
{$if declared(SPI_SETSCREENSAVEACTIVE)}
  SPI_SETSCREENSAVEACTIVE = LCLType.SPI_SETSCREENSAVEACTIVE;
{$endif}
{$if declared(SPI_GETGRIDGRANULARITY)}
  SPI_GETGRIDGRANULARITY = LCLType.SPI_GETGRIDGRANULARITY;
{$endif}
{$if declared(SPI_SETGRIDGRANULARITY)}
  SPI_SETGRIDGRANULARITY = LCLType.SPI_SETGRIDGRANULARITY;
{$endif}
{$if declared(SPI_SETDESKWALLPAPER)}
  SPI_SETDESKWALLPAPER = LCLType.SPI_SETDESKWALLPAPER;
{$endif}
{$if declared(SPI_SETDESKPATTERN)}
  SPI_SETDESKPATTERN = LCLType.SPI_SETDESKPATTERN;
{$endif}
{$if declared(SPI_GETKEYBOARDDELAY)}
  SPI_GETKEYBOARDDELAY = LCLType.SPI_GETKEYBOARDDELAY;
{$endif}
{$if declared(SPI_SETKEYBOARDDELAY)}
  SPI_SETKEYBOARDDELAY = LCLType.SPI_SETKEYBOARDDELAY;
{$endif}
{$if declared(SPI_ICONVERTICALSPACING)}
  SPI_ICONVERTICALSPACING = LCLType.SPI_ICONVERTICALSPACING;
{$endif}
{$if declared(SPI_GETICONTITLEWRAP)}
  SPI_GETICONTITLEWRAP = LCLType.SPI_GETICONTITLEWRAP;
{$endif}
{$if declared(SPI_SETICONTITLEWRAP)}
  SPI_SETICONTITLEWRAP = LCLType.SPI_SETICONTITLEWRAP;
{$endif}
{$if declared(SPI_GETMENUDROPALIGNMENT)}
  SPI_GETMENUDROPALIGNMENT = LCLType.SPI_GETMENUDROPALIGNMENT;
{$endif}
{$if declared(SPI_SETMENUDROPALIGNMENT)}
  SPI_SETMENUDROPALIGNMENT = LCLType.SPI_SETMENUDROPALIGNMENT;
{$endif}
{$if declared(SPI_SETDOUBLECLKWIDTH)}
  SPI_SETDOUBLECLKWIDTH = LCLType.SPI_SETDOUBLECLKWIDTH;
{$endif}
{$if declared(SPI_SETDOUBLECLKHEIGHT)}
  SPI_SETDOUBLECLKHEIGHT = LCLType.SPI_SETDOUBLECLKHEIGHT;
{$endif}
{$if declared(SPI_GETICONTITLELOGFONT)}
  SPI_GETICONTITLELOGFONT = LCLType.SPI_GETICONTITLELOGFONT;
{$endif}
{$if declared(SPI_SETDOUBLECLICKTIME)}
  SPI_SETDOUBLECLICKTIME = LCLType.SPI_SETDOUBLECLICKTIME;
{$endif}
{$if declared(SPI_SETMOUSEBUTTONSWAP)}
  SPI_SETMOUSEBUTTONSWAP = LCLType.SPI_SETMOUSEBUTTONSWAP;
{$endif}
{$if declared(SPI_SETICONTITLELOGFONT)}
  SPI_SETICONTITLELOGFONT = LCLType.SPI_SETICONTITLELOGFONT;
{$endif}
{$if declared(SPI_GETFASTTASKSWITCH)}
  SPI_GETFASTTASKSWITCH = LCLType.SPI_GETFASTTASKSWITCH;
{$endif}
{$if declared(SPI_SETFASTTASKSWITCH)}
  SPI_SETFASTTASKSWITCH = LCLType.SPI_SETFASTTASKSWITCH;
{$endif}
{$if declared(SPI_SETDRAGFULLWINDOWS)}
  SPI_SETDRAGFULLWINDOWS = LCLType.SPI_SETDRAGFULLWINDOWS;
{$endif}
{$if declared(SPI_GETDRAGFULLWINDOWS)}
  SPI_GETDRAGFULLWINDOWS = LCLType.SPI_GETDRAGFULLWINDOWS;
{$endif}
{$if declared(SPI_GETNONCLIENTMETRICS)}
  SPI_GETNONCLIENTMETRICS = LCLType.SPI_GETNONCLIENTMETRICS;
{$endif}
{$if declared(SPI_SETNONCLIENTMETRICS)}
  SPI_SETNONCLIENTMETRICS = LCLType.SPI_SETNONCLIENTMETRICS;
{$endif}
{$if declared(SPI_GETMINIMIZEDMETRICS)}
  SPI_GETMINIMIZEDMETRICS = LCLType.SPI_GETMINIMIZEDMETRICS;
{$endif}
{$if declared(SPI_SETMINIMIZEDMETRICS)}
  SPI_SETMINIMIZEDMETRICS = LCLType.SPI_SETMINIMIZEDMETRICS;
{$endif}
{$if declared(SPI_GETICONMETRICS)}
  SPI_GETICONMETRICS = LCLType.SPI_GETICONMETRICS;
{$endif}
{$if declared(SPI_SETICONMETRICS)}
  SPI_SETICONMETRICS = LCLType.SPI_SETICONMETRICS;
{$endif}
{$if declared(SPI_SETWORKAREA)}
  SPI_SETWORKAREA = LCLType.SPI_SETWORKAREA;
{$endif}
{$if declared(SPI_GETWORKAREA)}
  SPI_GETWORKAREA = LCLType.SPI_GETWORKAREA;
{$endif}
{$if declared(SPI_SETPENWINDOWS)}
  SPI_SETPENWINDOWS = LCLType.SPI_SETPENWINDOWS;
{$endif}
{$if declared(SPI_GETFILTERKEYS)}
  SPI_GETFILTERKEYS = LCLType.SPI_GETFILTERKEYS;
{$endif}
{$if declared(SPI_SETFILTERKEYS)}
  SPI_SETFILTERKEYS = LCLType.SPI_SETFILTERKEYS;
{$endif}
{$if declared(SPI_GETTOGGLEKEYS)}
  SPI_GETTOGGLEKEYS = LCLType.SPI_GETTOGGLEKEYS;
{$endif}
{$if declared(SPI_SETTOGGLEKEYS)}
  SPI_SETTOGGLEKEYS = LCLType.SPI_SETTOGGLEKEYS;
{$endif}
{$if declared(SPI_GETMOUSEKEYS)}
  SPI_GETMOUSEKEYS = LCLType.SPI_GETMOUSEKEYS;
{$endif}
{$if declared(SPI_SETMOUSEKEYS)}
  SPI_SETMOUSEKEYS = LCLType.SPI_SETMOUSEKEYS;
{$endif}
{$if declared(SPI_GETSHOWSOUNDS)}
  SPI_GETSHOWSOUNDS = LCLType.SPI_GETSHOWSOUNDS;
{$endif}
{$if declared(SPI_SETSHOWSOUNDS)}
  SPI_SETSHOWSOUNDS = LCLType.SPI_SETSHOWSOUNDS;
{$endif}
{$if declared(SPI_GETSTICKYKEYS)}
  SPI_GETSTICKYKEYS = LCLType.SPI_GETSTICKYKEYS;
{$endif}
{$if declared(SPI_SETSTICKYKEYS)}
  SPI_SETSTICKYKEYS = LCLType.SPI_SETSTICKYKEYS;
{$endif}
{$if declared(SPI_GETACCESSTIMEOUT)}
  SPI_GETACCESSTIMEOUT = LCLType.SPI_GETACCESSTIMEOUT;
{$endif}
{$if declared(SPI_SETACCESSTIMEOUT)}
  SPI_SETACCESSTIMEOUT = LCLType.SPI_SETACCESSTIMEOUT;
{$endif}
{$if declared(SPI_GETSERIALKEYS)}
  SPI_GETSERIALKEYS = LCLType.SPI_GETSERIALKEYS;
{$endif}
{$if declared(SPI_SETSERIALKEYS)}
  SPI_SETSERIALKEYS = LCLType.SPI_SETSERIALKEYS;
{$endif}
{$if declared(SPI_GETSOUNDSENTRY)}
  SPI_GETSOUNDSENTRY = LCLType.SPI_GETSOUNDSENTRY;
{$endif}
{$if declared(SPI_SETSOUNDSENTRY)}
  SPI_SETSOUNDSENTRY = LCLType.SPI_SETSOUNDSENTRY;
{$endif}
{$if declared(SPI_GETHIGHCONTRAST)}
  SPI_GETHIGHCONTRAST = LCLType.SPI_GETHIGHCONTRAST;
{$endif}
{$if declared(SPI_SETHIGHCONTRAST)}
  SPI_SETHIGHCONTRAST = LCLType.SPI_SETHIGHCONTRAST;
{$endif}
{$if declared(SPI_GETKEYBOARDPREF)}
  SPI_GETKEYBOARDPREF = LCLType.SPI_GETKEYBOARDPREF;
{$endif}
{$if declared(SPI_SETKEYBOARDPREF)}
  SPI_SETKEYBOARDPREF = LCLType.SPI_SETKEYBOARDPREF;
{$endif}
{$if declared(SPI_GETSCREENREADER)}
  SPI_GETSCREENREADER = LCLType.SPI_GETSCREENREADER;
{$endif}
{$if declared(SPI_SETSCREENREADER)}
  SPI_SETSCREENREADER = LCLType.SPI_SETSCREENREADER;
{$endif}
{$if declared(SPI_GETANIMATION)}
  SPI_GETANIMATION = LCLType.SPI_GETANIMATION;
{$endif}
{$if declared(SPI_SETANIMATION)}
  SPI_SETANIMATION = LCLType.SPI_SETANIMATION;
{$endif}
{$if declared(SPI_GETFONTSMOOTHING)}
  SPI_GETFONTSMOOTHING = LCLType.SPI_GETFONTSMOOTHING;
{$endif}
{$if declared(SPI_SETFONTSMOOTHING)}
  SPI_SETFONTSMOOTHING = LCLType.SPI_SETFONTSMOOTHING;
{$endif}
{$if declared(SPI_SETDRAGWIDTH)}
  SPI_SETDRAGWIDTH = LCLType.SPI_SETDRAGWIDTH;
{$endif}
{$if declared(SPI_SETDRAGHEIGHT)}
  SPI_SETDRAGHEIGHT = LCLType.SPI_SETDRAGHEIGHT;
{$endif}
{$if declared(SPI_SETHANDHELD)}
  SPI_SETHANDHELD = LCLType.SPI_SETHANDHELD;
{$endif}
{$if declared(SPI_GETLOWPOWERTIMEOUT)}
  SPI_GETLOWPOWERTIMEOUT = LCLType.SPI_GETLOWPOWERTIMEOUT;
{$endif}
{$if declared(SPI_GETPOWEROFFTIMEOUT)}
  SPI_GETPOWEROFFTIMEOUT = LCLType.SPI_GETPOWEROFFTIMEOUT;
{$endif}
{$if declared(SPI_SETLOWPOWERTIMEOUT)}
  SPI_SETLOWPOWERTIMEOUT = LCLType.SPI_SETLOWPOWERTIMEOUT;
{$endif}
{$if declared(SPI_SETPOWEROFFTIMEOUT)}
  SPI_SETPOWEROFFTIMEOUT = LCLType.SPI_SETPOWEROFFTIMEOUT;
{$endif}
{$if declared(SPI_GETLOWPOWERACTIVE)}
  SPI_GETLOWPOWERACTIVE = LCLType.SPI_GETLOWPOWERACTIVE;
{$endif}
{$if declared(SPI_GETPOWEROFFACTIVE)}
  SPI_GETPOWEROFFACTIVE = LCLType.SPI_GETPOWEROFFACTIVE;
{$endif}
{$if declared(SPI_SETLOWPOWERACTIVE)}
  SPI_SETLOWPOWERACTIVE = LCLType.SPI_SETLOWPOWERACTIVE;
{$endif}
{$if declared(SPI_SETPOWEROFFACTIVE)}
  SPI_SETPOWEROFFACTIVE = LCLType.SPI_SETPOWEROFFACTIVE;
{$endif}
{$if declared(SPI_SETCURSORS)}
  SPI_SETCURSORS = LCLType.SPI_SETCURSORS;
{$endif}
{$if declared(SPI_SETICONS)}
  SPI_SETICONS = LCLType.SPI_SETICONS;
{$endif}
{$if declared(SPI_GETDEFAULTINPUTLANG)}
  SPI_GETDEFAULTINPUTLANG = LCLType.SPI_GETDEFAULTINPUTLANG;
{$endif}
{$if declared(SPI_SETDEFAULTINPUTLANG)}
  SPI_SETDEFAULTINPUTLANG = LCLType.SPI_SETDEFAULTINPUTLANG;
{$endif}
{$if declared(SPI_SETLANGTOGGLE)}
  SPI_SETLANGTOGGLE = LCLType.SPI_SETLANGTOGGLE;
{$endif}
{$if declared(SPI_GETWINDOWSEXTENSION)}
  SPI_GETWINDOWSEXTENSION = LCLType.SPI_GETWINDOWSEXTENSION;
{$endif}
{$if declared(SPI_SETMOUSETRAILS)}
  SPI_SETMOUSETRAILS = LCLType.SPI_SETMOUSETRAILS;
{$endif}
{$if declared(SPI_GETMOUSETRAILS)}
  SPI_GETMOUSETRAILS = LCLType.SPI_GETMOUSETRAILS;
{$endif}
{$if declared(SPI_GETSNAPTODEFBUTTON)}
  SPI_GETSNAPTODEFBUTTON = LCLType.SPI_GETSNAPTODEFBUTTON;
{$endif}
{$if declared(SPI_SETSNAPTODEFBUTTON)}
  SPI_SETSNAPTODEFBUTTON = LCLType.SPI_SETSNAPTODEFBUTTON;
{$endif}
{$if declared(SPI_SCREENSAVERRUNNING)}
  SPI_SCREENSAVERRUNNING = LCLType.SPI_SCREENSAVERRUNNING;
{$endif}
{$if declared(SPI_SETSCREENSAVERRUNNING)}
  SPI_SETSCREENSAVERRUNNING = LCLType.SPI_SETSCREENSAVERRUNNING;
{$endif}
{$if declared(SPI_GETMOUSEHOVERWIDTH)}
  SPI_GETMOUSEHOVERWIDTH = LCLType.SPI_GETMOUSEHOVERWIDTH;
{$endif}
{$if declared(SPI_SETMOUSEHOVERWIDTH)}
  SPI_SETMOUSEHOVERWIDTH = LCLType.SPI_SETMOUSEHOVERWIDTH;
{$endif}
{$if declared(SPI_GETMOUSEHOVERHEIGHT)}
  SPI_GETMOUSEHOVERHEIGHT = LCLType.SPI_GETMOUSEHOVERHEIGHT;
{$endif}
{$if declared(SPI_SETMOUSEHOVERHEIGHT)}
  SPI_SETMOUSEHOVERHEIGHT = LCLType.SPI_SETMOUSEHOVERHEIGHT;
{$endif}
{$if declared(SPI_GETMOUSEHOVERTIME)}
  SPI_GETMOUSEHOVERTIME = LCLType.SPI_GETMOUSEHOVERTIME;
{$endif}
{$if declared(SPI_SETMOUSEHOVERTIME)}
  SPI_SETMOUSEHOVERTIME = LCLType.SPI_SETMOUSEHOVERTIME;
{$endif}
{$if declared(SPI_GETWHEELSCROLLLINES)}
  SPI_GETWHEELSCROLLLINES = LCLType.SPI_GETWHEELSCROLLLINES;
{$endif}
{$if declared(SPI_SETWHEELSCROLLLINES)}
  SPI_SETWHEELSCROLLLINES = LCLType.SPI_SETWHEELSCROLLLINES;
{$endif}
{$if declared(SPI_GETMENUSHOWDELAY)}
  SPI_GETMENUSHOWDELAY = LCLType.SPI_GETMENUSHOWDELAY;
{$endif}
{$if declared(SPI_SETMENUSHOWDELAY)}
  SPI_SETMENUSHOWDELAY = LCLType.SPI_SETMENUSHOWDELAY;
{$endif}
{$if declared(SPI_GETSHOWIMEUI)}
  SPI_GETSHOWIMEUI = LCLType.SPI_GETSHOWIMEUI;
{$endif}
{$if declared(SPI_SETSHOWIMEUI)}
  SPI_SETSHOWIMEUI = LCLType.SPI_SETSHOWIMEUI;
{$endif}
{$if declared(SPI_GETMOUSESPEED)}
  SPI_GETMOUSESPEED = LCLType.SPI_GETMOUSESPEED;
{$endif}
{$if declared(SPI_SETMOUSESPEED)}
  SPI_SETMOUSESPEED = LCLType.SPI_SETMOUSESPEED;
{$endif}
{$if declared(SPI_GETSCREENSAVERRUNNING)}
  SPI_GETSCREENSAVERRUNNING = LCLType.SPI_GETSCREENSAVERRUNNING;
{$endif}
{$if declared(SPI_GETDESKWALLPAPER)}
  SPI_GETDESKWALLPAPER = LCLType.SPI_GETDESKWALLPAPER;
{$endif}
{$if declared(SPI_GETACTIVEWINDOWTRACKING)}
  SPI_GETACTIVEWINDOWTRACKING = LCLType.SPI_GETACTIVEWINDOWTRACKING;
{$endif}
{$if declared(SPI_SETACTIVEWINDOWTRACKING)}
  SPI_SETACTIVEWINDOWTRACKING = LCLType.SPI_SETACTIVEWINDOWTRACKING;
{$endif}
{$if declared(SPI_GETMENUANIMATION)}
  SPI_GETMENUANIMATION = LCLType.SPI_GETMENUANIMATION;
{$endif}
{$if declared(SPI_SETMENUANIMATION)}
  SPI_SETMENUANIMATION = LCLType.SPI_SETMENUANIMATION;
{$endif}
{$if declared(SPI_GETCOMBOBOXANIMATION)}
  SPI_GETCOMBOBOXANIMATION = LCLType.SPI_GETCOMBOBOXANIMATION;
{$endif}
{$if declared(SPI_SETCOMBOBOXANIMATION)}
  SPI_SETCOMBOBOXANIMATION = LCLType.SPI_SETCOMBOBOXANIMATION;
{$endif}
{$if declared(SPI_GETLISTBOXSMOOTHSCROLLING)}
  SPI_GETLISTBOXSMOOTHSCROLLING = LCLType.SPI_GETLISTBOXSMOOTHSCROLLING;
{$endif}
{$if declared(SPI_SETLISTBOXSMOOTHSCROLLING)}
  SPI_SETLISTBOXSMOOTHSCROLLING = LCLType.SPI_SETLISTBOXSMOOTHSCROLLING;
{$endif}
{$if declared(SPI_GETGRADIENTCAPTIONS)}
  SPI_GETGRADIENTCAPTIONS = LCLType.SPI_GETGRADIENTCAPTIONS;
{$endif}
{$if declared(SPI_SETGRADIENTCAPTIONS)}
  SPI_SETGRADIENTCAPTIONS = LCLType.SPI_SETGRADIENTCAPTIONS;
{$endif}
{$if declared(SPI_GETKEYBOARDCUES)}
  SPI_GETKEYBOARDCUES = LCLType.SPI_GETKEYBOARDCUES;
{$endif}
{$if declared(SPI_SETKEYBOARDCUES)}
  SPI_SETKEYBOARDCUES = LCLType.SPI_SETKEYBOARDCUES;
{$endif}
{$if declared(SPI_GETMENUUNDERLINES)}
  SPI_GETMENUUNDERLINES = LCLType.SPI_GETMENUUNDERLINES;
{$endif}
{$if declared(SPI_SETMENUUNDERLINES)}
  SPI_SETMENUUNDERLINES = LCLType.SPI_SETMENUUNDERLINES;
{$endif}
{$if declared(SPI_GETACTIVEWNDTRKZORDER)}
  SPI_GETACTIVEWNDTRKZORDER = LCLType.SPI_GETACTIVEWNDTRKZORDER;
{$endif}
{$if declared(SPI_SETACTIVEWNDTRKZORDER)}
  SPI_SETACTIVEWNDTRKZORDER = LCLType.SPI_SETACTIVEWNDTRKZORDER;
{$endif}
{$if declared(SPI_GETHOTTRACKING)}
  SPI_GETHOTTRACKING = LCLType.SPI_GETHOTTRACKING;
{$endif}
{$if declared(SPI_SETHOTTRACKING)}
  SPI_SETHOTTRACKING = LCLType.SPI_SETHOTTRACKING;
{$endif}
{$if declared(SPI_GETMENUFADE)}
  SPI_GETMENUFADE = LCLType.SPI_GETMENUFADE;
{$endif}
{$if declared(SPI_SETMENUFADE)}
  SPI_SETMENUFADE = LCLType.SPI_SETMENUFADE;
{$endif}
{$if declared(SPI_GETSELECTIONFADE)}
  SPI_GETSELECTIONFADE = LCLType.SPI_GETSELECTIONFADE;
{$endif}
{$if declared(SPI_SETSELECTIONFADE)}
  SPI_SETSELECTIONFADE = LCLType.SPI_SETSELECTIONFADE;
{$endif}
{$if declared(SPI_GETTOOLTIPANIMATION)}
  SPI_GETTOOLTIPANIMATION = LCLType.SPI_GETTOOLTIPANIMATION;
{$endif}
{$if declared(SPI_SETTOOLTIPANIMATION)}
  SPI_SETTOOLTIPANIMATION = LCLType.SPI_SETTOOLTIPANIMATION;
{$endif}
{$if declared(SPI_GETTOOLTIPFADE)}
  SPI_GETTOOLTIPFADE = LCLType.SPI_GETTOOLTIPFADE;
{$endif}
{$if declared(SPI_SETTOOLTIPFADE)}
  SPI_SETTOOLTIPFADE = LCLType.SPI_SETTOOLTIPFADE;
{$endif}
{$if declared(SPI_GETCURSORSHADOW)}
  SPI_GETCURSORSHADOW = LCLType.SPI_GETCURSORSHADOW;
{$endif}
{$if declared(SPI_SETCURSORSHADOW)}
  SPI_SETCURSORSHADOW = LCLType.SPI_SETCURSORSHADOW;
{$endif}
{$if declared(SPI_GETUIEFFECTS)}
  SPI_GETUIEFFECTS = LCLType.SPI_GETUIEFFECTS;
{$endif}
{$if declared(SPI_SETUIEFFECTS)}
  SPI_SETUIEFFECTS = LCLType.SPI_SETUIEFFECTS;
{$endif}
{$if declared(SPI_GETFOREGROUNDLOCKTIMEOUT)}
  SPI_GETFOREGROUNDLOCKTIMEOUT = LCLType.SPI_GETFOREGROUNDLOCKTIMEOUT;
{$endif}
{$if declared(SPI_SETFOREGROUNDLOCKTIMEOUT)}
  SPI_SETFOREGROUNDLOCKTIMEOUT = LCLType.SPI_SETFOREGROUNDLOCKTIMEOUT;
{$endif}
{$if declared(SPI_GETACTIVEWNDTRKTIMEOUT)}
  SPI_GETACTIVEWNDTRKTIMEOUT = LCLType.SPI_GETACTIVEWNDTRKTIMEOUT;
{$endif}
{$if declared(SPI_SETACTIVEWNDTRKTIMEOUT)}
  SPI_SETACTIVEWNDTRKTIMEOUT = LCLType.SPI_SETACTIVEWNDTRKTIMEOUT;
{$endif}
{$if declared(SPI_GETFOREGROUNDFLASHCOUNT)}
  SPI_GETFOREGROUNDFLASHCOUNT = LCLType.SPI_GETFOREGROUNDFLASHCOUNT;
{$endif}
{$if declared(SPI_SETFOREGROUNDFLASHCOUNT)}
  SPI_SETFOREGROUNDFLASHCOUNT = LCLType.SPI_SETFOREGROUNDFLASHCOUNT;
{$endif}
{$if declared(SPI_GETCARETWIDTH)}
  SPI_GETCARETWIDTH = LCLType.SPI_GETCARETWIDTH;
{$endif}
{$if declared(SPI_SETCARETWIDTH)}
  SPI_SETCARETWIDTH = LCLType.SPI_SETCARETWIDTH;
{$endif}
{$if declared(SPI_GETMOUSESONAR)}
  SPI_GETMOUSESONAR = LCLType.SPI_GETMOUSESONAR;
{$endif}
{$if declared(SPI_SETMOUSESONAR)}
  SPI_SETMOUSESONAR = LCLType.SPI_SETMOUSESONAR;
{$endif}
{$if declared(SPI_GETMOUSECLICKLOCK)}
  SPI_GETMOUSECLICKLOCK = LCLType.SPI_GETMOUSECLICKLOCK;
{$endif}
{$if declared(SPI_SETMOUSECLICKLOCK)}
  SPI_SETMOUSECLICKLOCK = LCLType.SPI_SETMOUSECLICKLOCK;
{$endif}
{$if declared(SPI_GETMOUSEVANISH)}
  SPI_GETMOUSEVANISH = LCLType.SPI_GETMOUSEVANISH;
{$endif}
{$if declared(SPI_SETMOUSEVANISH)}
  SPI_SETMOUSEVANISH = LCLType.SPI_SETMOUSEVANISH;
{$endif}
{$if declared(SPI_GETFLATMENU)}
  SPI_GETFLATMENU = LCLType.SPI_GETFLATMENU;
{$endif}
{$if declared(SPI_SETFLATMENU)}
  SPI_SETFLATMENU = LCLType.SPI_SETFLATMENU;
{$endif}
{$if declared(SPI_GETDROPSHADOW)}
  SPI_GETDROPSHADOW = LCLType.SPI_GETDROPSHADOW;
{$endif}
{$if declared(SPI_SETDROPSHADOW)}
  SPI_SETDROPSHADOW = LCLType.SPI_SETDROPSHADOW;
{$endif}
{$if declared(SPI_GETBLOCKSENDINPUTRESETS)}
  SPI_GETBLOCKSENDINPUTRESETS = LCLType.SPI_GETBLOCKSENDINPUTRESETS;
{$endif}
{$if declared(SPI_SETBLOCKSENDINPUTRESETS)}
  SPI_SETBLOCKSENDINPUTRESETS = LCLType.SPI_SETBLOCKSENDINPUTRESETS;
{$endif}
{$if declared(SPI_GETMOUSECLICKLOCKTIME)}
  SPI_GETMOUSECLICKLOCKTIME = LCLType.SPI_GETMOUSECLICKLOCKTIME;
{$endif}
{$if declared(SPI_SETMOUSECLICKLOCKTIME)}
  SPI_SETMOUSECLICKLOCKTIME = LCLType.SPI_SETMOUSECLICKLOCKTIME;
{$endif}
{$if declared(SPI_GETFONTSMOOTHINGTYPE)}
  SPI_GETFONTSMOOTHINGTYPE = LCLType.SPI_GETFONTSMOOTHINGTYPE;
{$endif}
{$if declared(SPI_SETFONTSMOOTHINGTYPE)}
  SPI_SETFONTSMOOTHINGTYPE = LCLType.SPI_SETFONTSMOOTHINGTYPE;
{$endif}
{$if declared(SPI_GETFONTSMOOTHINGCONTRAST)}
  SPI_GETFONTSMOOTHINGCONTRAST = LCLType.SPI_GETFONTSMOOTHINGCONTRAST;
{$endif}
{$if declared(SPI_SETFONTSMOOTHINGCONTRAST)}
  SPI_SETFONTSMOOTHINGCONTRAST = LCLType.SPI_SETFONTSMOOTHINGCONTRAST;
{$endif}
{$if declared(SPI_GETFOCUSBORDERWIDTH)}
  SPI_GETFOCUSBORDERWIDTH = LCLType.SPI_GETFOCUSBORDERWIDTH;
{$endif}
{$if declared(SPI_SETFOCUSBORDERWIDTH)}
  SPI_SETFOCUSBORDERWIDTH = LCLType.SPI_SETFOCUSBORDERWIDTH;
{$endif}
{$if declared(SPI_GETFOCUSBORDERHEIGHT)}
  SPI_GETFOCUSBORDERHEIGHT = LCLType.SPI_GETFOCUSBORDERHEIGHT;
{$endif}
{$if declared(SPI_SETFOCUSBORDERHEIGHT)}
  SPI_SETFOCUSBORDERHEIGHT = LCLType.SPI_SETFOCUSBORDERHEIGHT;
{$endif}
{$if declared(SPI_GETFONTSMOOTHINGORIENTATION)}
  SPI_GETFONTSMOOTHINGORIENTATION = LCLType.SPI_GETFONTSMOOTHINGORIENTATION;
{$endif}
{$if declared(SPI_SETFONTSMOOTHINGORIENTATION)}
  SPI_SETFONTSMOOTHINGORIENTATION = LCLType.SPI_SETFONTSMOOTHINGORIENTATION;
{$endif}
{$if declared(BI_RGB)}
  BI_RGB = LCLType.BI_RGB;
{$endif}
{$if declared(BI_RLE8)}
  BI_RLE8 = LCLType.BI_RLE8;
{$endif}
{$if declared(BI_RLE4)}
  BI_RLE4 = LCLType.BI_RLE4;
{$endif}
{$if declared(BI_BITFIELDS)}
  BI_BITFIELDS = LCLType.BI_BITFIELDS;
{$endif}
{$if declared(HORZSIZE)}
  HORZSIZE = LCLType.HORZSIZE;
{$endif}
{$if declared(VERTSIZE)}
  VERTSIZE = LCLType.VERTSIZE;
{$endif}
{$if declared(HORZRES)}
  HORZRES = LCLType.HORZRES;
{$endif}
{$if declared(VERTRES)}
  VERTRES = LCLType.VERTRES;
{$endif}
{$if declared(BITSPIXEL)}
  BITSPIXEL = LCLType.BITSPIXEL;
{$endif}
{$if declared(PLANES)}
  PLANES = LCLType.PLANES;
{$endif}
{$if declared(NUMCOLORS)}
  NUMCOLORS = LCLType.NUMCOLORS;
{$endif}
{$if declared(LOGPIXELSX)}
  LOGPIXELSX = LCLType.LOGPIXELSX;
{$endif}
{$if declared(LOGPIXELSY)}
  LOGPIXELSY = LCLType.LOGPIXELSY;
{$endif}
{$if declared(SIZEPALETTE)}
  SIZEPALETTE = LCLType.SIZEPALETTE;
{$endif}
{$if declared(NUMRESERVED)}
  NUMRESERVED = LCLType.NUMRESERVED;
{$endif}
{$if declared(TA_NOUPDATECP)}
  TA_NOUPDATECP = LCLType.TA_NOUPDATECP;
{$endif}
{$if declared(TA_UPDATECP)}
  TA_UPDATECP = LCLType.TA_UPDATECP;
{$endif}
{$if declared(TA_LEFT)}
  TA_LEFT = LCLType.TA_LEFT;
{$endif}
{$if declared(TA_RIGHT)}
  TA_RIGHT = LCLType.TA_RIGHT;
{$endif}
{$if declared(TA_CENTER)}
  TA_CENTER = LCLType.TA_CENTER;
{$endif}
{$if declared(TA_TOP)}
  TA_TOP = LCLType.TA_TOP;
{$endif}
{$if declared(TA_BOTTOM)}
  TA_BOTTOM = LCLType.TA_BOTTOM;
{$endif}
{$if declared(TA_BASELINE)}
  TA_BASELINE = LCLType.TA_BASELINE;
{$endif}
{$if declared(TA_RTLREADING)}
  TA_RTLREADING = LCLType.TA_RTLREADING;
{$endif}
{$if declared(TA_MASK)}
  TA_MASK = LCLType.TA_MASK;
{$endif}
{$if declared(ALTERNATE)}
  ALTERNATE = LCLType.ALTERNATE;
{$endif}
{$if declared(WINDING)}
  WINDING = LCLType.WINDING;
{$endif}
{$if declared(POLYFILL_LAST)}
  POLYFILL_LAST = LCLType.POLYFILL_LAST;
{$endif}
{$if declared(BLACKONWHITE)}
  BLACKONWHITE = LCLType.BLACKONWHITE;
{$endif}
{$if declared(WHITEONBLACK)}
  WHITEONBLACK = LCLType.WHITEONBLACK;
{$endif}
{$if declared(COLORONCOLOR)}
  COLORONCOLOR = LCLType.COLORONCOLOR;
{$endif}
{$if declared(HALFTONE)}
  HALFTONE = LCLType.HALFTONE;
{$endif}
{$if declared(MAXSTRETCHBLTMODE)}
  MAXSTRETCHBLTMODE = LCLType.MAXSTRETCHBLTMODE;
{$endif}
{$if declared(CBM_INIT)}
  CBM_INIT = LCLType.CBM_INIT;
{$endif}
{$if declared(RT_CURSOR)}
  RT_CURSOR = LCLType.RT_CURSOR;
{$endif}
{$if declared(RT_BITMAP)}
  RT_BITMAP = LCLType.RT_BITMAP;
{$endif}
{$if declared(RT_ICON)}
  RT_ICON = LCLType.RT_ICON;
{$endif}
{$if declared(RT_MENU)}
  RT_MENU = LCLType.RT_MENU;
{$endif}
{$if declared(RT_DIALOG)}
  RT_DIALOG = LCLType.RT_DIALOG;
{$endif}
{$if declared(RT_STRING)}
  RT_STRING = LCLType.RT_STRING;
{$endif}
{$if declared(RT_FONTDIR)}
  RT_FONTDIR = LCLType.RT_FONTDIR;
{$endif}
{$if declared(RT_FONT)}
  RT_FONT = LCLType.RT_FONT;
{$endif}
{$if declared(RT_ACCELERATOR)}
  RT_ACCELERATOR = LCLType.RT_ACCELERATOR;
{$endif}
{$if declared(RT_RCDATA)}
  RT_RCDATA = LCLType.RT_RCDATA;
{$endif}
{$if declared(RT_MESSAGETABLE)}
  RT_MESSAGETABLE = LCLType.RT_MESSAGETABLE;
{$endif}
{$if declared(RT_GROUP_CURSOR)}
  RT_GROUP_CURSOR = LCLType.RT_GROUP_CURSOR;
{$endif}
{$if declared(RT_GROUP_ICON)}
  RT_GROUP_ICON = LCLType.RT_GROUP_ICON;
{$endif}
{$if declared(RT_VERSION)}
  RT_VERSION = LCLType.RT_VERSION;
{$endif}
{$if declared(RT_ANICURSOR)}
  RT_ANICURSOR = LCLType.RT_ANICURSOR;
{$endif}
{$if declared(RT_ANIICON)}
  RT_ANIICON = LCLType.RT_ANIICON;
{$endif}
{$if declared(RT_HTML)}
  RT_HTML = LCLType.RT_HTML;
{$endif}
{$if declared(RT_MANIFEST)}
  RT_MANIFEST = LCLType.RT_MANIFEST;
{$endif}
{$if declared(IMAGE_BITMAP)}
  IMAGE_BITMAP = LCLType.IMAGE_BITMAP;
{$endif}
{$if declared(IMAGE_ICON)}
  IMAGE_ICON = LCLType.IMAGE_ICON;
{$endif}
{$if declared(IMAGE_CURSOR)}
  IMAGE_CURSOR = LCLType.IMAGE_CURSOR;
{$endif}
{$if declared(IMAGE_ENHMETAFILE)}
  IMAGE_ENHMETAFILE = LCLType.IMAGE_ENHMETAFILE;
{$endif}
{$if declared(LR_DEFAULTCOLOR)}
  LR_DEFAULTCOLOR = LCLType.LR_DEFAULTCOLOR;
{$endif}
{$if declared(LR_MONOCHROME)}
  LR_MONOCHROME = LCLType.LR_MONOCHROME;
{$endif}
{$if declared(LR_COLOR)}
  LR_COLOR = LCLType.LR_COLOR;
{$endif}
{$if declared(LR_COPYRETURNORG)}
  LR_COPYRETURNORG = LCLType.LR_COPYRETURNORG;
{$endif}
{$if declared(LR_COPYDELETEORG)}
  LR_COPYDELETEORG = LCLType.LR_COPYDELETEORG;
{$endif}
{$if declared(LR_LOADFROMFILE)}
  LR_LOADFROMFILE = LCLType.LR_LOADFROMFILE;
{$endif}
{$if declared(LR_LOADTRANSPARENT)}
  LR_LOADTRANSPARENT = LCLType.LR_LOADTRANSPARENT;
{$endif}
{$if declared(LR_DEFAULTSIZE)}
  LR_DEFAULTSIZE = LCLType.LR_DEFAULTSIZE;
{$endif}
{$if declared(LR_VGACOLOR)}
  LR_VGACOLOR = LCLType.LR_VGACOLOR;
{$endif}
{$if declared(LR_LOADMAP3DCOLORS)}
  LR_LOADMAP3DCOLORS = LCLType.LR_LOADMAP3DCOLORS;
{$endif}
{$if declared(LR_CREATEDIBSECTION)}
  LR_CREATEDIBSECTION = LCLType.LR_CREATEDIBSECTION;
{$endif}
{$if declared(LR_COPYFROMRESOURCE)}
  LR_COPYFROMRESOURCE = LCLType.LR_COPYFROMRESOURCE;
{$endif}
{$if declared(LR_SHARED)}
  LR_SHARED = LCLType.LR_SHARED;
{$endif}
{$if declared(csNone)}
  csNone = LCLType.csNone;
{$endif}
{$if declared(csButton)}
  csButton = LCLType.csButton;
{$endif}
{$if declared(csComboBox)}
  csComboBox = LCLType.csComboBox;
{$endif}
{$if declared(csCheckbox)}
  csCheckbox = LCLType.csCheckbox;
{$endif}
{$if declared(csEdit)}
  csEdit = LCLType.csEdit;
{$endif}
{$if declared(csForm)}
  csForm = LCLType.csForm;
{$endif}
{$if declared(csStaticText)}
  csStaticText = LCLType.csStaticText;
{$endif}
{$if declared(csScrollBar)}
  csScrollBar = LCLType.csScrollBar;
{$endif}
{$if declared(csListView)}
  csListView = LCLType.csListView;
{$endif}
{$if declared(csMemo)}
  csMemo = LCLType.csMemo;
{$endif}
{$if declared(csMainMenu)}
  csMainMenu = LCLType.csMainMenu;
{$endif}
{$if declared(csMenuBar)}
  csMenuBar = LCLType.csMenuBar;
{$endif}
{$if declared(csMenuItem)}
  csMenuItem = LCLType.csMenuItem;
{$endif}
{$if declared(csNotebook)}
  csNotebook = LCLType.csNotebook;
{$endif}
{$if declared(csFileDialog)}
  csFileDialog = LCLType.csFileDialog;
{$endif}
{$if declared(csRadioButton)}
  csRadioButton = LCLType.csRadioButton;
{$endif}
{$if declared(csScrolledWindow)}
  csScrolledWindow = LCLType.csScrolledWindow;
{$endif}
{$if declared(csSpinedit)}
  csSpinedit = LCLType.csSpinedit;
{$endif}
{$if declared(csStatusBar)}
  csStatusBar = LCLType.csStatusBar;
{$endif}
{$if declared(csToggleBox)}
  csToggleBox = LCLType.csToggleBox;
{$endif}
{$if declared(csGroupBox)}
  csGroupBox = LCLType.csGroupBox;
{$endif}
{$if declared(csPage)}
  csPage = LCLType.csPage;
{$endif}
{$if declared(csColorDialog)}
  csColorDialog = LCLType.csColorDialog;
{$endif}
{$if declared(csListBox)}
  csListBox = LCLType.csListBox;
{$endif}
{$if declared(csFontDialog)}
  csFontDialog = LCLType.csFontDialog;
{$endif}
{$if declared(csProgressBar)}
  csProgressBar = LCLType.csProgressBar;
{$endif}
{$if declared(csTrackBar)}
  csTrackBar = LCLType.csTrackBar;
{$endif}
{$if declared(csWinControl)}
  csWinControl = LCLType.csWinControl;
{$endif}
{$if declared(csFixed)}
  csFixed = LCLType.csFixed;
{$endif}
{$if declared(csBitBtn)}
  csBitBtn = LCLType.csBitBtn;
{$endif}
{$if declared(csCListBox)}
  csCListBox = LCLType.csCListBox;
{$endif}
{$if declared(csPopupMenu)}
  csPopupMenu = LCLType.csPopupMenu;
{$endif}
{$if declared(csHintWindow)}
  csHintWindow = LCLType.csHintWindow;
{$endif}
{$if declared(csCalendar)}
  csCalendar = LCLType.csCalendar;
{$endif}
{$if declared(csArrow)}
  csArrow = LCLType.csArrow;
{$endif}
{$if declared(csPanel)}
  csPanel = LCLType.csPanel;
{$endif}
{$if declared(csScrollBox)}
  csScrollBox = LCLType.csScrollBox;
{$endif}
{$if declared(csCheckListBox)}
  csCheckListBox = LCLType.csCheckListBox;
{$endif}
{$if declared(csPairSplitter)}
  csPairSplitter = LCLType.csPairSplitter;
{$endif}
{$if declared(csPairSplitterSide)}
  csPairSplitterSide = LCLType.csPairSplitterSide;
{$endif}
{$if declared(csOpenFileDialog)}
  csOpenFileDialog = LCLType.csOpenFileDialog;
{$endif}
{$if declared(csSaveFileDialog)}
  csSaveFileDialog = LCLType.csSaveFileDialog;
{$endif}
{$if declared(csSelectDirectoryDialog)}
  csSelectDirectoryDialog = LCLType.csSelectDirectoryDialog;
{$endif}
{$if declared(csPreviewFileControl)}
  csPreviewFileControl = LCLType.csPreviewFileControl;
{$endif}
{$if declared(csPreviewFileDialog)}
  csPreviewFileDialog = LCLType.csPreviewFileDialog;
{$endif}
{$if declared(csNonLCL)}
  csNonLCL = LCLType.csNonLCL;
{$endif}
{$if declared(MK_LBUTTON)}
  MK_LBUTTON = LCLType.MK_LBUTTON;
{$endif}
{$if declared(MK_RBUTTON)}
  MK_RBUTTON = LCLType.MK_RBUTTON;
{$endif}
{$if declared(MK_SHIFT)}
  MK_SHIFT = LCLType.MK_SHIFT;
{$endif}
{$if declared(MK_CONTROL)}
  MK_CONTROL = LCLType.MK_CONTROL;
{$endif}
{$if declared(MK_MBUTTON)}
  MK_MBUTTON = LCLType.MK_MBUTTON;
{$endif}
{$if declared(MK_XBUTTON1)}
  MK_XBUTTON1 = LCLType.MK_XBUTTON1;
{$endif}
{$if declared(MK_XBUTTON2)}
  MK_XBUTTON2 = LCLType.MK_XBUTTON2;
{$endif}
{$if declared(MK_DOUBLECLICK)}
  MK_DOUBLECLICK = LCLType.MK_DOUBLECLICK;
{$endif}
{$if declared(MK_TRIPLECLICK)}
  MK_TRIPLECLICK = LCLType.MK_TRIPLECLICK;
{$endif}
{$if declared(MK_QUADCLICK)}
  MK_QUADCLICK = LCLType.MK_QUADCLICK;
{$endif}
{$if declared(MK_ALT)}
  MK_ALT = LCLType.MK_ALT;
{$endif}
{$if declared(NM_FIRST)}
  NM_FIRST = LCLType.NM_FIRST;
{$endif}
{$if declared(NM_OUTOFMEMORY)}
  NM_OUTOFMEMORY = LCLType.NM_OUTOFMEMORY;
{$endif}
{$if declared(NM_CLICK)}
  NM_CLICK = LCLType.NM_CLICK;
{$endif}
{$if declared(NM_DBLCLK)}
  NM_DBLCLK = LCLType.NM_DBLCLK;
{$endif}
{$if declared(NM_RETURN)}
  NM_RETURN = LCLType.NM_RETURN;
{$endif}
{$if declared(NM_RCLICK)}
  NM_RCLICK = LCLType.NM_RCLICK;
{$endif}
{$if declared(NM_RDBLCLK)}
  NM_RDBLCLK = LCLType.NM_RDBLCLK;
{$endif}
{$if declared(NM_SETFOCUS)}
  NM_SETFOCUS = LCLType.NM_SETFOCUS;
{$endif}
{$if declared(NM_KILLFOCUS)}
  NM_KILLFOCUS = LCLType.NM_KILLFOCUS;
{$endif}
{$if declared(NM_CUSTOMDRAW)}
  NM_CUSTOMDRAW = LCLType.NM_CUSTOMDRAW;
{$endif}
{$if declared(NM_HOVER)}
  NM_HOVER = LCLType.NM_HOVER;
{$endif}
{$if declared(NM_NCHITTEST)}
  NM_NCHITTEST = LCLType.NM_NCHITTEST;
{$endif}
{$if declared(NM_KEYDOWN)}
  NM_KEYDOWN = LCLType.NM_KEYDOWN;
{$endif}
{$if declared(NM_RELEASEDCAPTURE)}
  NM_RELEASEDCAPTURE = LCLType.NM_RELEASEDCAPTURE;
{$endif}
{$if declared(NM_SETCURSOR)}
  NM_SETCURSOR = LCLType.NM_SETCURSOR;
{$endif}
{$if declared(NM_CHAR)}
  NM_CHAR = LCLType.NM_CHAR;
{$endif}
{$if declared(NM_LAST)}
  NM_LAST = LCLType.NM_LAST;
{$endif}
{$if declared(LVN_FIRST)}
  LVN_FIRST = LCLType.LVN_FIRST;
{$endif}
{$if declared(LVN_LAST)}
  LVN_LAST = LCLType.LVN_LAST;
{$endif}
{$if declared(HDN_FIRST)}
  HDN_FIRST = LCLType.HDN_FIRST;
{$endif}
{$if declared(HDN_LAST)}
  HDN_LAST = LCLType.HDN_LAST;
{$endif}
{$if declared(TVN_FIRST)}
  TVN_FIRST = LCLType.TVN_FIRST;
{$endif}
{$if declared(TVN_LAST)}
  TVN_LAST = LCLType.TVN_LAST;
{$endif}
{$if declared(TTN_FIRST)}
  TTN_FIRST = LCLType.TTN_FIRST;
{$endif}
{$if declared(TTN_LAST)}
  TTN_LAST = LCLType.TTN_LAST;
{$endif}
{$if declared(TCN_FIRST)}
  TCN_FIRST = LCLType.TCN_FIRST;
{$endif}
{$if declared(TCN_LAST)}
  TCN_LAST = LCLType.TCN_LAST;
{$endif}
{$if declared(TBN_First)}
  TBN_First = LCLType.TBN_First;
{$endif}
{$if declared(TBN_Last)}
  TBN_Last = LCLType.TBN_Last;
{$endif}
{$if declared(CCS_TOP)}
  CCS_TOP = LCLType.CCS_TOP;
{$endif}
{$if declared(CCS_NOMOVEY)}
  CCS_NOMOVEY = LCLType.CCS_NOMOVEY;
{$endif}
{$if declared(CCS_BOTTOM)}
  CCS_BOTTOM = LCLType.CCS_BOTTOM;
{$endif}
{$if declared(CCS_NORESIZE)}
  CCS_NORESIZE = LCLType.CCS_NORESIZE;
{$endif}
{$if declared(CCS_NOPARENTALIGN)}
  CCS_NOPARENTALIGN = LCLType.CCS_NOPARENTALIGN;
{$endif}
{$if declared(CCS_ADJUSTABLE)}
  CCS_ADJUSTABLE = LCLType.CCS_ADJUSTABLE;
{$endif}
{$if declared(CCS_NODIVIDER)}
  CCS_NODIVIDER = LCLType.CCS_NODIVIDER;
{$endif}
{$if declared(CCS_VERT)}
  CCS_VERT = LCLType.CCS_VERT;
{$endif}
{$if declared(CCS_LEFT)}
  CCS_LEFT = LCLType.CCS_LEFT;
{$endif}
{$if declared(CCS_RIGHT)}
  CCS_RIGHT = LCLType.CCS_RIGHT;
{$endif}
{$if declared(CCS_NOMOVEX)}
  CCS_NOMOVEX = LCLType.CCS_NOMOVEX;
{$endif}
{$if declared(LVN_ITEMCHANGING)}
  LVN_ITEMCHANGING = LCLType.LVN_ITEMCHANGING;
{$endif}
{$if declared(LVN_ITEMCHANGED)}
  LVN_ITEMCHANGED = LCLType.LVN_ITEMCHANGED;
{$endif}
{$if declared(LVN_INSERTITEM)}
  LVN_INSERTITEM = LCLType.LVN_INSERTITEM;
{$endif}
{$if declared(LVN_DELETEITEM)}
  LVN_DELETEITEM = LCLType.LVN_DELETEITEM;
{$endif}
{$if declared(LVN_DELETEALLITEMS)}
  LVN_DELETEALLITEMS = LCLType.LVN_DELETEALLITEMS;
{$endif}
{$if declared(LVN_COLUMNCLICK)}
  LVN_COLUMNCLICK = LCLType.LVN_COLUMNCLICK;
{$endif}
{$if declared(LVN_BEGINDRAG)}
  LVN_BEGINDRAG = LCLType.LVN_BEGINDRAG;
{$endif}
{$if declared(LVN_BEGINRDRAG)}
  LVN_BEGINRDRAG = LCLType.LVN_BEGINRDRAG;
{$endif}
{$if declared(LVN_ODCACHEHINT)}
  LVN_ODCACHEHINT = LCLType.LVN_ODCACHEHINT;
{$endif}
{$if declared(LVN_ITEMACTIVATE)}
  LVN_ITEMACTIVATE = LCLType.LVN_ITEMACTIVATE;
{$endif}
{$if declared(LVN_ODSTATECHANGED)}
  LVN_ODSTATECHANGED = LCLType.LVN_ODSTATECHANGED;
{$endif}
{$if declared(LVN_HOTTRACK)}
  LVN_HOTTRACK = LCLType.LVN_HOTTRACK;
{$endif}
{$if declared(LVN_KEYDOWN)}
  LVN_KEYDOWN = LCLType.LVN_KEYDOWN;
{$endif}
{$if declared(LVN_MARQUEEBEGIN)}
  LVN_MARQUEEBEGIN = LCLType.LVN_MARQUEEBEGIN;
{$endif}
{$if declared(LVN_GETINFOTIP)}
  LVN_GETINFOTIP = LCLType.LVN_GETINFOTIP;
{$endif}
{$if declared(LVN_INCREMENTALSEARCH)}
  LVN_INCREMENTALSEARCH = LCLType.LVN_INCREMENTALSEARCH;
{$endif}
{$if declared(LVN_BEGINLABELEDIT)}
  LVN_BEGINLABELEDIT = LCLType.LVN_BEGINLABELEDIT;
{$endif}
{$if declared(LVN_ENDLABELEDIT)}
  LVN_ENDLABELEDIT = LCLType.LVN_ENDLABELEDIT;
{$endif}
{$if declared(LVN_GETDISPINFO)}
  LVN_GETDISPINFO = LCLType.LVN_GETDISPINFO;
{$endif}
{$if declared(LVN_SETDISPINFO)}
  LVN_SETDISPINFO = LCLType.LVN_SETDISPINFO;
{$endif}
{$if declared(LVN_ODFINDITEM)}
  LVN_ODFINDITEM = LCLType.LVN_ODFINDITEM;
{$endif}
{$if declared(LVN_BEGINSCROLL)}
  LVN_BEGINSCROLL = LCLType.LVN_BEGINSCROLL;
{$endif}
{$if declared(LVN_ENDSCROLL)}
  LVN_ENDSCROLL = LCLType.LVN_ENDSCROLL;
{$endif}
{$if declared(LVIF_TEXT)}
  LVIF_TEXT = LCLType.LVIF_TEXT;
{$endif}
{$if declared(LVIF_IMAGE)}
  LVIF_IMAGE = LCLType.LVIF_IMAGE;
{$endif}
{$if declared(LVIF_PARAM)}
  LVIF_PARAM = LCLType.LVIF_PARAM;
{$endif}
{$if declared(LVIF_STATE)}
  LVIF_STATE = LCLType.LVIF_STATE;
{$endif}
{$if declared(LVIF_INDENT)}
  LVIF_INDENT = LCLType.LVIF_INDENT;
{$endif}
{$if declared(LVIF_NORECOMPUTE)}
  LVIF_NORECOMPUTE = LCLType.LVIF_NORECOMPUTE;
{$endif}
{$if declared(LVIS_FOCUSED)}
  LVIS_FOCUSED = LCLType.LVIS_FOCUSED;
{$endif}
{$if declared(LVIS_SELECTED)}
  LVIS_SELECTED = LCLType.LVIS_SELECTED;
{$endif}
{$if declared(LVIS_CUT)}
  LVIS_CUT = LCLType.LVIS_CUT;
{$endif}
{$if declared(LVIS_DROPHILITED)}
  LVIS_DROPHILITED = LCLType.LVIS_DROPHILITED;
{$endif}
{$if declared(LVIS_ACTIVATING)}
  LVIS_ACTIVATING = LCLType.LVIS_ACTIVATING;
{$endif}
{$if declared(LVIS_OVERLAYMASK)}
  LVIS_OVERLAYMASK = LCLType.LVIS_OVERLAYMASK;
{$endif}
{$if declared(LVIS_STATEIMAGEMASK)}
  LVIS_STATEIMAGEMASK = LCLType.LVIS_STATEIMAGEMASK;
{$endif}
var
{$if declared(DefaultLogFont)}
  DefaultLogFont: TLogFont absolute LCLType.DefaultLogFont;
{$endif}
{$if declared(OnShowSelectItemDialogResult)}
  OnShowSelectItemDialogResult: TOnShowSelectItemDialogResult absolute LCLIntf.OnShowSelectItemDialogResult;
{$endif}
{$if declared(OnListViewDialogResult)}
  OnListViewDialogResult: TOnShowSelectItemDialogResult absolute LCLIntf.OnListViewDialogResult;
{$endif}
{$if declared(OpenURLWidgetsetImplementation)}
  OpenURLWidgetsetImplementation: TOpenParamStringProc absolute LCLIntf.OpenURLWidgetsetImplementation;
{$endif}
{$if declared(OpenDocumentWidgetsetImplementation)}
  OpenDocumentWidgetsetImplementation: TOpenParamStringProc absolute LCLIntf.OpenDocumentWidgetsetImplementation;
{$endif}
{$if declared(CS_To_String)}
function CS_To_String(CompStyle: Integer): String; inline;
{$endif}
{$if declared(HiWord)}
function HiWord(i: integer): word; inline;
{$endif}
{$if declared(LoWord)}
function LoWord(i: integer): word; inline;
{$endif}
{$if declared(Char2VK)}
function Char2VK(C : Char) : Word; inline;
{$endif}
{$if declared(VK2Char)}
function VK2Char(AVK: Word): Char; inline;
{$endif}
{$if declared(MathRound)}
function MathRound(AValue: ValReal): Int64; inline;
{$endif}
{$if declared(MulDiv)}
function MulDiv(nNumber, nNumerator, nDenominator: Integer): Integer; inline;
{$endif}
{$if declared(KeyToShortCut)}
function KeyToShortCut(const Key: Word; const Shift: TShiftState): TShortCut; inline;
{$endif}
{$if declared(CharSetToString)}
function CharSetToString(const Charset: Integer): String; inline;
{$endif}
{$if declared(StringToCharset)}
function StringToCharset(Charset: string): byte; inline;
{$endif}
{$if declared(FontWeightToStr)}
function FontWeightToStr(AWeight: integer; ADefault: string = ''): string; inline;
{$endif}
{$if declared(Arc)}
function Arc(DC: HDC; Left,Top,Right,Bottom,Angle16Deg, Angle16DegLength: Integer): Boolean; inline;
{$endif}
{$if declared(AngleChord)}
function AngleChord(DC: HDC; x1,y1,x2,y2,angle1,angle2 : Integer): Boolean; inline;
{$endif}
{$if declared(BeginPaint)}
function BeginPaint(Handle : hwnd; var PS : TPaintStruct): hdc; inline;
{$endif}
{$if declared(BitBlt)}
function BitBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc: Integer; Rop: DWORD): Boolean; inline;
{$endif}
{$if declared(CallNextHookEx)}
function CallNextHookEx(hhk : HHOOK; ncode : Integer; WParam: WParam; LParam: LParam) : Integer; inline;
{$endif}
{$if declared(CallWindowProc)}
function CallWindowProc(lpPrevWndFunc : TFarProc; Handle : HWND; Msg : UINT; WParam: WParam; LParam: LParam): Integer; inline;
{$endif}
{$if declared(ClientToScreen)}
function ClientToScreen(Handle : HWND; var P : TPoint) : Boolean; inline;
{$endif}
{$if declared(CombineRgn)}
function CombineRgn(Dest, Src1, Src2 : HRGN; fnCombineMode : Longint) : Longint; inline;
{$endif}
{$if declared(CreateBitmap)}
function CreateBitmap(Width, Height: Integer; Planes, BitCount: Longint; BitmapBits: Pointer): HBITMAP; inline;
{$endif}
{$if declared(CreateBrushIndirect)}
function CreateBrushIndirect(const LogBrush: TLogBrush): HBRUSH; inline;
{$endif}
{$if declared(CreateBrushWithRadialGradient)}
function CreateBrushWithRadialGradient(const LogBrush: TLogRadialGradient): HBRUSH; inline;
{$endif}
{$if declared(CreateCaret)}
function CreateCaret(Handle: HWND; Bitmap: hBitmap; width, Height: Integer): Boolean; inline;
{$endif}
{$if declared(CreateCompatibleBitmap)}
function CreateCompatibleBitmap(DC: HDC; Width, Height: Integer): HBITMAP; inline;
{$endif}
{$if declared(CreateCompatibleDC)}
function CreateCompatibleDC(DC: HDC): HDC; inline;
{$endif}
{$if declared(CreateDIBitmap)}
function CreateDIBitmap(DC: HDC; var InfoHeader: TBitmapInfoHeader; dwUsage: DWORD; InitBits: PChar; var InitInfo: TBitmapInfo; wUsage: UINT): HBITMAP; inline;
{$endif}
{$if declared(CreateDIBSection)}
function CreateDIBSection(DC: HDC; const BitmapInfo: tagBitmapInfo; Usage: UINT; var Bits: Pointer; SectionHandle: TLCLHandle; Offset: DWORD): HBITMAP; inline;
{$endif}
{$if declared(CreateEllipticRgn)}
function CreateEllipticRgn(X1, Y1, X2, Y2: Integer): HRGN; inline;
{$endif}
{$if declared(CreateFontIndirect)}
function CreateFontIndirect(const LogFont: TLogFont): HFONT; inline;
{$endif}
{$if declared(CreateFontIndirectEx)}
function CreateFontIndirectEx(const LogFont: TLogFont; const LongFontName: string): HFONT; inline;
{$endif}
{$if declared(CreateIconIndirect)}
function CreateIconIndirect(IconInfo: PIconInfo): HICON; inline;
{$endif}
{$if declared(CreatePalette)}
function CreatePalette(const LogPalette: TLogPalette): HPalette; inline;
{$endif}
{$if declared(CreatePatternBrush)}
function CreatePatternBrush(ABitmap: HBITMAP): HBRUSH; inline;
{$endif}
{$if declared(CreatePenIndirect)}
function CreatePenIndirect(const LogPen: TLogPen): HPEN; inline;
{$endif}
{$if declared(CreatePolygonRgn)}
function CreatePolygonRgn(Points: PPoint; NumPts: Integer; FillMode: integer): HRGN; inline;
{$endif}
{$if declared(CreateRectRgn)}
function CreateRectRgn(X1,Y1,X2,Y2 : Integer): HRGN; inline;
{$endif}
{$if declared(CreateRoundRectRgn)}
function CreateRoundRectRgn(X1, Y1, X2, Y2, nWidthEllipse, nHeightEllipse: Integer): HRGN; inline;
{$endif}
{$if declared(DeleteCriticalSection)}
procedure DeleteCriticalSection(var CritSection: TCriticalSection); inline;
{$endif}
{$if declared(DeleteDC)}
function DeleteDC(hDC: HDC): Boolean; inline;
{$endif}
{$if declared(DeleteObject)}
function DeleteObject(GDIObject: HGDIOBJ): Boolean; inline;
{$endif}
{$if declared(DestroyCaret)}
function DestroyCaret(Handle : HWND): Boolean; inline;
{$endif}
{$if declared(DestroyCursor)}
function DestroyCursor(Handle: HCURSOR): Boolean; inline;
{$endif}
{$if declared(DestroyIcon)}
function DestroyIcon(Handle: HICON): Boolean; inline;
{$endif}
{$if declared(DPtoLP)}
function DPtoLP(DC: HDC; var Points; Count: Integer): BOOL; inline;
{$endif}
{$if declared(DrawFrameControl)}
function DrawFrameControl(DC: HDC; const Rect : TRect; uType, uState : Cardinal) : Boolean; inline;
{$endif}
{$if declared(DrawFocusRect)}
function DrawFocusRect(DC: HDC; const Rect: TRect): Boolean; inline;
{$endif}
{$if declared(DrawEdge)}
function DrawEdge(DC: HDC; var Rect: TRect; edge: Cardinal; grfFlags: Cardinal): Boolean; inline;
{$endif}
{$if declared(DrawText)}
function DrawText(DC: HDC; Str: PChar; Count: Integer; var Rect: TRect; Flags: Cardinal): Integer; inline;
{$endif}
{$if declared(EnableScrollBar)}
function EnableScrollBar(Wnd: HWND; wSBflags, wArrows: Cardinal): Boolean; inline;
{$endif}
{$if declared(EnableWindow)}
function EnableWindow(hWnd: HWND; bEnable: Boolean): Boolean; inline;
{$endif}
{$if declared(EndPaint)}
function EndPaint(Handle : hwnd; var PS : TPaintStruct): Integer; inline;
{$endif}
{$if declared(EnterCriticalSection)}
procedure EnterCriticalSection(var CritSection: TCriticalSection); inline;
{$endif}
{$if declared(EnumDisplayMonitors)}
function EnumDisplayMonitors(hdc: HDC; lprcClip: PRect; lpfnEnum: MonitorEnumProc; dwData: LPARAM): LongBool; inline;
{$endif}
{$if declared(EnumFontFamilies)}
function EnumFontFamilies(DC: HDC; Family: Pchar; EnumFontFamProc: FontEnumProc; LParam:Lparam):longint; inline;
{$endif}
{$if declared(EnumFontFamiliesEx)}
function EnumFontFamiliesEx(DC: HDC; lpLogFont:PLogFont; Callback: FontEnumExProc; Lparam:LParam; Flags: dword): longint; inline;
{$endif}
{$if declared(Ellipse)}
function Ellipse(DC: HDC; x1, y1, x2, y2: Integer): Boolean; inline;
{$endif}
{$if declared(EqualRgn)}
function EqualRgn(Rgn1: HRGN; Rgn2: HRGN): Boolean; inline;
{$endif}
{$if declared(ExcludeClipRect)}
function ExcludeClipRect(dc: hdc; Left, Top, Right, Bottom : Integer) : Integer; inline;
{$endif}
{$if declared(ExtCreatePen)}
function ExtCreatePen(dwPenStyle, dwWidth: DWord; const lplb: TLogBrush; dwStyleCount: DWord; lpStyle: PDWord): HPEN; inline;
{$endif}
{$if declared(ExtTextOut)}
function ExtTextOut(DC: HDC; X, Y: Integer; Options: Longint; Rect: PRect; Str: PChar; Count: Longint; Dx: PInteger): Boolean; inline;
{$endif}
{$if declared(ExtSelectClipRGN)}
function ExtSelectClipRGN(dc: hdc; rgn : hrgn; Mode : Longint) : Integer; inline;
{$endif}
{$if declared(FillRect)}
function FillRect(DC: HDC; const Rect: TRect; Brush: HBRUSH): Boolean; inline;
{$endif}
{$if declared(FillRgn)}
function FillRgn(DC: HDC; RegionHnd: HRGN; hbr: HBRUSH): BOOL; inline;
{$endif}
{$if declared(FloodFill)}
function FloodFill(DC: HDC; X, Y: Integer; Color: TGraphicsColor; FillStyle: TGraphicsFillStyle; Brush: HBRUSH): Boolean; inline;
{$endif}
{$if declared(FrameRect)}
function FrameRect(DC: HDC; const ARect: TRect; hBr: HBRUSH): Integer; inline;
{$endif}
{$if declared(GetActiveWindow)}
function GetActiveWindow : HWND; inline;
{$endif}
{$if declared(GetBitmapBits)}
function GetBitmapBits(Bitmap: HBITMAP; Count: Longint; Bits: Pointer): Longint; inline;
{$endif}
{$if declared(GetBkColor)}
function GetBkColor(DC: HDC): TColorRef; inline;
{$endif}
{$if declared(GetCapture)}
function GetCapture : HWND; inline;
{$endif}
{$if declared(GetCaretPos)}
function GetCaretPos(var lpPoint: TPoint): Boolean; inline;
{$endif}
{$if declared(GetClientRect)}
function GetClientRect(handle : HWND; var Rect: TRect) : Boolean; inline;
{$endif}
{$if declared(GetClipBox)}
function GetClipBox(DC : hDC; lpRect : PRect) : Longint; inline;
{$endif}
{$if declared(GetClipRGN)}
function GetClipRGN(DC : hDC; RGN : hRGN) : Longint; inline;
{$endif}
{$if declared(GetCompositorExtendedBorder)}
function GetCompositorExtendedBorder(handle : HWND; var Borders: TRect) : Boolean; inline;
{$endif}
{$if declared(GetCurrentObject)}
function GetCurrentObject(DC: HDC; uObjectType: UINT): HGDIOBJ; inline;
{$endif}
{$if declared(GetCursorPos)}
function GetCursorPos(var lpPoint: TPoint): Boolean; inline;
{$endif}
{$if declared(GetCharABCWidths)}
function GetCharABCWidths(DC: HDC; p2, p3: UINT; const ABCStructs): Boolean; inline;
{$endif}
{$if declared(GetDC)}
function GetDC(hWnd: HWND): HDC; inline;
{$endif}
{$if declared(GetDeviceCaps)}
function GetDeviceCaps(DC: HDC; Index: Integer): Integer; inline;
{$endif}
{$if declared(GetDIBits)}
function GetDIBits(DC: HDC; Bitmap: HBitmap; StartScan, NumScans: UINT; Bits: Pointer; var BitInfo: BitmapInfo; Usage: UINT): Integer; inline;
{$endif}
{$if declared(GetDoubleClickTime)}
function GetDoubleClickTime: UINT; inline;
{$endif}
{$if declared(GetFocus)}
function GetFocus: HWND; inline;
{$endif}
{$if declared(GetFontLanguageInfo)}
function GetFontLanguageInfo(DC: HDC): DWord; inline;
{$endif}
{$if declared(GetForegroundWindow)}
function GetForegroundWindow: HWND; inline;
{$endif}
{$if declared(GetIconInfo)}
function GetIconInfo(AIcon: HICON; AIconInfo: PIconInfo): Boolean; inline;
{$endif}
{$if declared(GetKeyState)}
function GetKeyState(nVirtKey: Integer): Smallint; inline;
{$endif}
{$if declared(GetMapMode)}
function GetMapMode(DC: HDC): Integer; inline;
{$endif}
{$if declared(GetMonitorInfo)}
function GetMonitorInfo(hMonitor: HMONITOR; lpmi: PMonitorInfo): Boolean; inline;
{$endif}
{$if declared(GetDpiForMonitor)}
function GetDpiForMonitor(hmonitor: HMONITOR; dpiType: TMonitorDpiType; out dpiX: UINT; out dpiY: UINT): HRESULT; inline;
{$endif}
{$if declared(GetObject)}
function GetObject(GDIObject: HGDIOBJ; BufSize: Integer; Buf: Pointer): Integer; inline;
{$endif}
{$if declared(GetPaletteEntries)}
function GetPaletteEntries(Palette: HPALETTE; StartIndex, NumEntries: UINT; var PaletteEntries): UINT; inline;
{$endif}
{$if declared(GetParent)}
function GetParent(Handle : HWND): HWND; inline;
{$endif}
{$if declared(GetProp)}
function GetProp(Handle : hwnd; Str : PChar): Pointer; inline;
{$endif}
{$if declared(GetRgnBox)}
function GetRgnBox(RGN : HRGN; lpRect : PRect) : Longint; inline;
{$endif}
{$if declared(GetROP2)}
function GetROP2(DC: HDC): integer; inline;
{$endif}
{$if declared(GetScrollInfo)}
function GetScrollInfo(Handle: HWND; SBStyle: Integer; var ScrollInfo: TScrollInfo): Boolean; inline;
{$endif}
{$if declared(GetStockObject)}
function GetStockObject(Value: Integer): TLCLHandle; inline;
{$endif}
{$if declared(GetSysColor)}
function GetSysColor(nIndex: Integer): DWORD; inline;
{$endif}
{$if declared(GetSysColorBrush)}
function GetSysColorBrush(nIndex: Integer): HBrush; inline;
{$endif}
{$if declared(GetSystemPaletteEntries)}
function GetSystemPaletteEntries(DC: HDC; StartIndex, NumEntries: UINT; var PaletteEntries): UINT; inline;
{$endif}
{$if declared(GetSystemMetrics)}
function GetSystemMetrics(nIndex: Integer): Integer; inline;
{$endif}
{$if declared(GetTextColor)}
function GetTextColor(DC: HDC) : TColorRef; inline;
{$endif}
{$if declared(GetTextExtentExPoint)}
function GetTextExtentExPoint(DC: HDC; Str: PChar; Count, MaxWidth: Integer; MaxCount, PartialWidths: PInteger; var Size: TSize): Boolean; inline;
{$endif}
{$if declared(GetTextExtentPoint)}
function GetTextExtentPoint(DC: HDC; Str: PChar; Count: Integer; var Size: TSize): Boolean; inline;
{$endif}
{$if declared(GetTextExtentPoint32)}
function GetTextExtentPoint32(DC: HDC; Str: PChar; Count: Integer; var Size: TSize): Boolean; inline;
{$endif}
{$if declared(GetTextMetrics)}
function GetTextMetrics(DC: HDC; var TM: TTextMetric): Boolean; inline;
{$endif}
{$if declared(GetViewPortExtEx)}
function GetViewPortExtEx(DC: HDC; Size: PSize): Integer; inline;
{$endif}
{$if declared(GetViewPortOrgEx)}
function GetViewPortOrgEx(DC: HDC; P: PPoint): Integer; inline;
{$endif}
{$if declared(GetWindowExtEx)}
function GetWindowExtEx(DC: HDC; Size: PSize): Integer; inline;
{$endif}
{$if declared(GetWindowLong)}
function GetWindowLong(Handle : hwnd; int : Integer): PtrInt; inline;
{$endif}
{$if declared(GetWindowRect)}
function GetWindowRect(Handle : hwnd; var Rect : TRect): Integer; inline;
{$endif}
{$if declared(GetWindowSize)}
function GetWindowSize(Handle : hwnd; var Width, Height: integer): boolean; inline;
{$endif}
{$if declared(GetWindowOrgEx)}
function GetWindowOrgEx(dc : hdc; var P: TPoint): Integer; overload; inline;
{$endif}
{$if declared(GetWindowOrgEx)}
function GetWindowOrgEx(dc : hdc; P : PPoint): Integer; overload; inline;
{$endif}
{$if declared(GradientFill)}
function GradientFill(DC: HDC; Vertices: PTriVertex; NumVertices : Longint; Meshes: Pointer; NumMeshes : Longint; Mode : Longint): Boolean; inline;
{$endif}
{$if declared(HideCaret)}
function HideCaret(hWnd: HWND): Boolean; inline;
{$endif}
{$if declared(InitializeCriticalSection)}
procedure InitializeCriticalSection(var CritSection: TCriticalSection); inline;
{$endif}
{$if declared(IntersectClipRect)}
function IntersectClipRect(dc: hdc; Left, Top, Right,Bottom: Integer): Integer; inline;
{$endif}
{$if declared(InvalidateRect)}
function InvalidateRect(aHandle : HWND; ARect : pRect; bErase : Boolean) : Boolean; inline;
{$endif}
{$if declared(InvalidateRgn)}
function InvalidateRgn(Handle: HWND; Rgn: HRGN; Erase: Boolean): Boolean; inline;
{$endif}
{$if declared(IsDBCSLeadByte)}
function IsDBCSLeadByte(TestChar: Byte): boolean; inline;
{$endif}
{$if declared(IsIconic)}
function IsIconic(handle: HWND): boolean; inline;
{$endif}
{$if declared(IsWindow)}
function IsWindow(handle: HWND): boolean; inline;
{$endif}
{$if declared(IsWindowEnabled)}
function IsWindowEnabled(handle: HWND): boolean; inline;
{$endif}
{$if declared(IsWindowVisible)}
function IsWindowVisible(handle: HWND): boolean; inline;
{$endif}
{$if declared(IsZoomed)}
function IsZoomed(handle: HWND): boolean; inline;
{$endif}
{$if declared(LeaveCriticalSection)}
procedure LeaveCriticalSection(var CritSection: TCriticalSection); inline;
{$endif}
{$if declared(LineTo)}
function LineTo(DC: HDC; X, Y: Integer): Boolean; inline;
{$endif}
{$if declared(LoadBitmap)}
function LoadBitmap(hInstance: TLCLHandle; lpBitmapName: PChar): HBitmap; inline;
{$endif}
{$if declared(LoadCursor)}
function LoadCursor(hInstance: TLCLHandle; lpCursorName: PChar): HCursor; inline;
{$endif}
{$if declared(LoadIcon)}
function LoadIcon(hInstance: TLCLHandle; lpIconName: PChar): HIcon; inline;
{$endif}
{$if declared(LPtoDP)}
function LPtoDP(DC: HDC; var Points; Count: Integer): BOOL; inline;
{$endif}
{$if declared(MaskBlt)}
function MaskBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc: Integer; Mask: HBITMAP; XMask, YMask: Integer; Rop: DWORD): Boolean; overload; inline;
{$endif}
{$if declared(MaskBlt)}
function MaskBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc: Integer; Mask: HBITMAP; XMask, YMask: Integer): Boolean; overload; inline;
{$endif}
{$if declared(MessageBox)}
function MessageBox(hWnd: HWND; lpText, lpCaption: PChar; uType: Cardinal = MB_OK): integer; inline;
{$endif}
{$if declared(MonitorFromPoint)}
function MonitorFromPoint(ptScreenCoords: TPoint; dwFlags: DWord): HMONITOR; inline;
{$endif}
{$if declared(MonitorFromRect)}
function MonitorFromRect(lprcScreenCoords: PRect; dwFlags: DWord): HMONITOR; inline;
{$endif}
{$if declared(MonitorFromWindow)}
function MonitorFromWindow(hWnd: HWND; dwFlags: DWord): HMONITOR; inline;
{$endif}
{$if declared(MoveToEx)}
function MoveToEx(DC: HDC; X, Y: Integer; OldPoint: PPoint): Boolean; inline;
{$endif}
{$if declared(OffsetRgn)}
function OffsetRgn(RGN: HRGN; nXOffset, nYOffset: Integer): Integer; inline;
{$endif}
{$if declared(PaintRgn)}
function PaintRgn(DC: HDC; RGN: HRGN): Boolean; inline;
{$endif}
{$if declared(PeekMessage)}
function PeekMessage(var lpMsg : TMsg; Handle : HWND; wMsgFilterMin, wMsgFilterMax,wRemoveMsg : UINT): Boolean; inline;
{$endif}
{$if declared(Pie)}
function Pie(DC: HDC; x1, y1, x2, y2, sx, sy, ex, ey: Integer): Boolean; inline;
{$endif}
{$if declared(PolyBezier)}
function PolyBezier(DC: HDC; Points: PPoint; NumPts: Integer; Filled, Continuous: boolean): boolean; inline;
{$endif}
{$if declared(Polygon)}
function Polygon(DC: HDC; Points: PPoint; NumPts: Integer; Winding: boolean): boolean; inline;
{$endif}
{$if declared(Polyline)}
function Polyline(DC: HDC; Points: PPoint; NumPts: Integer): boolean; inline;
{$endif}
{$if declared(PostMessage)}
function PostMessage(Handle: HWND; Msg: Cardinal; WParam: WParam; LParam: LParam): Boolean; inline;
{$endif}
{$if declared(PtInRegion)}
function PtInRegion(RGN: HRGN; X, Y: Integer): Boolean; inline;
{$endif}
{$if declared(RealizePalette)}
function RealizePalette(DC: HDC): Cardinal; inline;
{$endif}
{$if declared(Rectangle)}
function Rectangle(DC: HDC; X1, Y1, X2, Y2: Integer): Boolean; inline;
{$endif}
{$if declared(RectInRegion)}
function RectInRegion(RGN: HRGN; ARect: TRect): Boolean; inline;
{$endif}
{$if declared(RectVisible)}
function RectVisible(DC: HDC; const ARect: TRect): Boolean; inline;
{$endif}
{$if declared(RedrawWindow)}
function RedrawWindow(Wnd: HWND; lprcUpdate: PRECT; hrgnUpdate: HRGN; flags: UINT): Boolean; inline;
{$endif}
{$if declared(ReleaseCapture)}
function ReleaseCapture : Boolean; inline;
{$endif}
{$if declared(ReleaseDC)}
function ReleaseDC(hWnd: HWND; DC: HDC): Integer; inline;
{$endif}
{$if declared(RemoveProp)}
function RemoveProp(Handle: HWND; Str: PChar): TLCLHandle; inline;
{$endif}
{$if declared(RestoreDC)}
function RestoreDC(DC: HDC; SavedDC: Integer): Boolean; inline;
{$endif}
{$if declared(RoundRect)}
function RoundRect(DC : hDC; X1, Y1, X2, Y2: Integer; RX,RY : Integer): Boolean; inline;
{$endif}
{$if declared(SaveDC)}
function SaveDC(DC: HDC): Integer; inline;
{$endif}
{$if declared(ScreenToClient)}
function ScreenToClient(Handle : HWND; var P : TPoint) : Integer; inline;
{$endif}
{$if declared(ScrollWindowEx)}
function ScrollWindowEx(hWnd: HWND; dx, dy: Integer; prcScroll, prcClip: PRect; hrgnUpdate: HRGN; prcUpdate: PRect; flags: UINT): Boolean; inline;
{$endif}
{$if declared(SelectClipRGN)}
function SelectClipRGN(DC : hDC; RGN : HRGN) : Longint; inline;
{$endif}
{$if declared(SelectObject)}
function SelectObject(DC: HDC; GDIObj: HGDIOBJ): HGDIOBJ; inline;
{$endif}
{$if declared(SelectPalette)}
function SelectPalette(DC: HDC; Palette: HPALETTE; ForceBackground: Boolean): HPALETTE; inline;
{$endif}
{$if declared(SendMessage)}
function SendMessage(HandleWnd: HWND; Msg: Cardinal; WParam: WParam; LParam: LParam): LResult; inline;
{$endif}
{$if declared(SetActiveWindow)}
function SetActiveWindow(Handle: HWND): HWND; inline;
{$endif}
{$if declared(SetBkColor)}
function SetBkColor(DC: HDC; Color: TColorRef): TColorRef; inline;
{$endif}
{$if declared(SetBkMode)}
function SetBkMode(DC: HDC; bkMode : Integer): Integer; inline;
{$endif}
{$if declared(SetCapture)}
function SetCapture (AHandle: HWND): HWND; inline;
{$endif}
{$if declared(SetCaretPos)}
function SetCaretPos(X, Y: Integer): Boolean; inline;
{$endif}
{$if declared(SetCaretPosEx)}
function SetCaretPosEx(handle: HWnd; X, Y: Integer): Boolean; inline;
{$endif}
{$if declared(SetCursor)}
function SetCursor(hCursor: HICON): HCURSOR; inline;
{$endif}
{$if declared(SetCursorPos)}
function SetCursorPos(X, Y: Integer): Boolean; inline;
{$endif}
{$if declared(SetFocus)}
function SetFocus(hWnd: HWND): HWND; inline;
{$endif}
{$if declared(SetForegroundWindow)}
function SetForegroundWindow(hWnd : HWND): Boolean; inline;
{$endif}
{$if declared(SetMapMode)}
function SetMapMode(DC: HDC; fnMapMode : Integer): Integer; inline;
{$endif}
{$if declared(SetMenu)}
function SetMenu(AWindowHandle: HWND; AMenuHandle: HMENU): Boolean; inline;
{$endif}
{$if declared(SetParent)}
function SetParent(hWndChild: HWND; hWndParent: HWND): HWND; inline;
{$endif}
{$if declared(SetProp)}
function SetProp(Handle: hwnd; Str : PChar; Data : Pointer) : Boolean; inline;
{$endif}
{$if declared(SetRectRgn)}
function SetRectRgn(aRGN: HRGN; X1, Y1, X2, Y2 : Integer): Boolean; inline;
{$endif}
{$if declared(SetROP2)}
function SetROP2(DC: HDC; Mode: Integer): Integer; inline;
{$endif}
{$if declared(SetScrollInfo)}
function SetScrollInfo(Handle: HWND; SBStyle: Integer; ScrollInfo: TScrollInfo; Redraw : Boolean): Integer; inline;
{$endif}
{$if declared(SetStretchBltMode)}
function SetStretchBltMode(DC: HDC; StretchMode: Integer): Integer; inline;
{$endif}
{$if declared(SetSysColors)}
function SetSysColors(cElements: Integer; const lpaElements; const lpaRgbValues): Boolean; inline;
{$endif}
{$if declared(SetTextCharacterExtra)}
function SetTextCharacterExtra(_hdc : hdc; nCharExtra : Integer):Integer; inline;
{$endif}
{$if declared(SetTextColor)}
function SetTextColor(DC: HDC; Color: TColorRef): TColorRef; inline;
{$endif}
{$if declared(SetWindowLong)}
function SetWindowLong(Handle: HWND; Idx: Integer; NewLong : PtrInt): PtrInt; inline;
{$endif}
{$if declared(SetViewPortExtEx)}
function SetViewPortExtEx(DC: HDC; XExtent, YExtent : Integer; OldSize: PSize): Boolean; inline;
{$endif}
{$if declared(SetViewPortOrgEx)}
function SetViewPortOrgEx(DC: HDC; NewX, NewY: Integer; OldPoint: PPoint): Boolean; inline;
{$endif}
{$if declared(SetWindowExtEx)}
function SetWindowExtEx(DC: HDC; XExtent, YExtent: Integer; OldSize: PSize): Boolean; inline;
{$endif}
{$if declared(SetWindowOrgEx)}
function SetWindowOrgEx(dc : hdc; NewX, NewY: Integer; OldPoint: PPoint): Boolean; inline;
{$endif}
{$if declared(SetWindowPos)}
function SetWindowPos(hWnd: HWND; hWndInsertAfter: HWND; X, Y, cx, cy: Integer; uFlags: UINT): Boolean; inline;
{$endif}
{$if declared(SetWindowRgn)}
function SetWindowRgn(hWnd: HWND; hRgn: HRGN; bRedraw: Boolean): longint; inline;
{$endif}
{$if declared(ShowCaret)}
function ShowCaret(hWnd: HWND): Boolean; inline;
{$endif}
{$if declared(ShowScrollBar)}
function ShowScrollBar(Handle: HWND; wBar: Integer; bShow: Boolean): Boolean; inline;
{$endif}
{$if declared(ShowWindow)}
function ShowWindow(hWnd: HWND; nCmdShow: Integer): Boolean; inline;
{$endif}
{$if declared(StretchBlt)}
function StretchBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc, SrcWidth, SrcHeight: Integer; Rop: Cardinal): Boolean; inline;
{$endif}
{$if declared(StretchDIBits)}
function StretchDIBits(DC: HDC; DestX, DestY, DestWidth, DestHeight, SrcX, SrcY, SrcWidth, SrcHeight: Integer; Bits: Pointer; var BitsInfo: TBitmapInfo; Usage: UINT; Rop: DWORD): Integer; inline;
{$endif}
{$if declared(SystemParametersInfo)}
function SystemParametersInfo(uiAction: DWord; uiParam: DWord; pvParam: Pointer; fWinIni: DWord): LongBool; inline;
{$endif}
{$if declared(TextOut)}
function TextOut(DC: HDC; X,Y : Integer; Str : Pchar; Count: Integer) : Boolean; inline;
{$endif}
{$if declared(UpdateWindow)}
function UpdateWindow(Handle: HWND): Boolean; inline;
{$endif}
{$if declared(WindowFromPoint)}
function WindowFromPoint(Point : TPoint) : HWND; inline;
{$endif}
{$if declared(AdjustWindowRectEx)}
function AdjustWindowRectEx(Var Rect: TRect; Style1: Word; MenuExist : Boolean; Style2 : Word) : Boolean; inline;
{$endif}
{$if declared(CharLower)}
function CharLower(c: char): char; inline;
{$endif}
{$if declared(CharLowerBuff)}
function CharLowerBuff(pStr : PChar; Len : Integer): Integer; inline;
{$endif}
{$if declared(CharUpper)}
function CharUpper(c: char): char; inline;
{$endif}
{$if declared(CharUpperBuff)}
function CharUpperBuff(pStr : PChar; Len : Integer): Integer; inline;
{$endif}
{$if declared(CopyRect)}
function CopyRect(var DestRect: TRect; const SrcRect: TRect): Boolean; inline;
{$endif}
{$if declared(CreateEllipticRgnIndirect)}
function CreateEllipticRgnIndirect(const ARect: TRect): HRGN; inline;
{$endif}
{$if declared(CreateFont)}
function CreateFont(Height, Width, Escapement, Orientation, Weight: Integer; Italic, Underline, StrikeOut, CharSet, OutputPrecision, ClipPrecision, Quality, PitchAndFamily: Byte; FaceName: PChar): HFONT; inline;
{$endif}
{$if declared(CreatePen)}
function CreatePen(Style, Width: Integer; Color: TColorRef): HPEN; inline;
{$endif}
{$if declared(CreateRectRgnIndirect)}
function CreateRectRgnIndirect(const ARect: TRect): HRGN; inline;
{$endif}
{$if declared(CreateSolidBrush)}
function CreateSolidBrush(Color: TColorRef): HBRUSH; inline;
{$endif}
{$if declared(EqualRect)}
function EqualRect(const lprc1, lprc2: TRect): Boolean; inline;
{$endif}
{$if declared(GetScrollPos)}
function GetScrollPos(Handle: HWND; nBar: Integer): Integer; inline;
{$endif}
{$if declared(GetScrollRange)}
function GetScrollRange(Handle: HWND; nBar: Integer; var lpMinPos, lpMaxPos: Integer): Boolean; inline;
{$endif}
{$if declared(GetRValue)}
function GetRValue(RGB : DWORD) : BYTE; inline;
{$endif}
{$if declared(GetGValue)}
function GetGValue(RGB : DWORD) : BYTE; inline;
{$endif}
{$if declared(GetBValue)}
function GetBValue(RGB : DWORD) : BYTE; inline;
{$endif}
{$if declared(GetRGBValues)}
procedure GetRGBValues(RGB : DWORD; out R, G, B: Byte); inline;
{$endif}
{$if declared(GetRGBIntValues)}
procedure GetRGBIntValues(RGB : DWORD; out R, G, B: integer); inline;
{$endif}
{$if declared(IndexToOverlayMask)}
function IndexToOverlayMask(iOverlay: UINT): UINT; inline;
{$endif}
{$if declared(InflateRect)}
function InflateRect(var ARect: TRect; dx, dy: Integer): Boolean; inline;
{$endif}
{$if declared(IntersectRect)}
function IntersectRect(var DestRect: TRect; const SrcRect1, SrcRect2: TRect): Boolean; inline;
{$endif}
{$if declared(IsCharAlphaNumeric)}
function IsCharAlphaNumeric(c : Char) : Boolean; inline;
{$endif}
{$if declared(IsRectEmpty)}
function IsRectEmpty(const ARect: TRect): Boolean; inline;
{$endif}
{$if declared(KillTimer)}
function KillTimer(Wnd: HWND; uIDEvent: UINT_PTR): BOOL; inline;
{$endif}
{$if declared(MakeLong)}
function MakeLong(A,B: Word): DWORD; inline;
{$endif}
{$if declared(MakeROP4)}
function MakeROP4(fore, back: DWORD): DWORD; inline;
{$endif}
{$if declared(MakeWord)}
function MakeWord(A,B: Byte): Word; inline;
{$endif}
{$if declared(MakeWParam)}
function MakeWParam(l, h: Word): WPARAM; inline;
{$endif}
{$if declared(MakeLParam)}
function MakeLParam(l, h: Word): LPARAM; inline;
{$endif}
{$if declared(MakeLResult)}
function MakeLResult(l, h: Word): LRESULT; inline;
{$endif}
{$if declared(LParamExtractLoHiWord)}
procedure LParamExtractLoHiWord(const aParam: LPARAM; out LoWord, HiWord: Word); inline;
{$endif}
{$if declared(LParamHiWord)}
function LParamHiWord(const aParam: LPARAM): Word; inline;
{$endif}
{$if declared(LParamLoWord)}
function LParamLoWord(const aParam: LPARAM): Word; inline;
{$endif}
{$if declared(PtInRect)}
function PtInRect(const Rect : TRect; const Point : TPoint) : Boolean; inline;
{$endif}
{$if declared(PointToSmallPoint)}
function PointToSmallPoint(const P : TPoint) : TSmallPoint; inline;
{$endif}
{$if declared(PointToSmallPointNoChecks)}
function PointToSmallPointNoChecks(const P : TPoint) : TSmallPoint; inline;
{$endif}
{$if declared(RGB)}
function RGB(R, G, B : Byte) : TColorRef; inline;
{$endif}
{$if declared(ScrollWindow)}
function ScrollWindow(hWnd: HWND; XAmount, YAmount: Integer; Rect, ClipRect: PRect): Boolean; inline;
{$endif}
{$if declared(SetRect)}
function SetRect(var ARect : TRect; aLeft,aTop,aRight,aBottom : Integer) : Boolean; inline;
{$endif}
{$if declared(SetRectEmpty)}
function SetRectEmpty(var ARect: TRect): Boolean; inline;
{$endif}
{$if declared(SetScrollPos)}
function SetScrollPos(Handle: HWND; nBar, nPos: Integer; bRedraw: Boolean): Integer; inline;
{$endif}
{$if declared(SetScrollRange)}
function SetScrollRange(Handle: HWND; nBar, nMinPos, nMaxPos: Integer; bRedraw: Boolean): Boolean; inline;
{$endif}
{$if declared(SetTimer)}
function SetTimer(Wnd: HWND; nIDEvent: UINT_PTR; uElapse: UINT; lpTimerFunc: TTimerProc): UINT_PTR; inline;
{$endif}
{$if declared(SmallPointToPoint)}
function SmallPointToPoint(const P : TSmallPoint) : Tpoint; inline;
{$endif}
{$if declared(SubtractRect)}
function SubtractRect(out lprcDst: TRect; const lprcSrc1, lprcSrc2: TRect): Boolean; inline;
{$endif}
{$if declared(UnionRect)}
function UnionRect(var DestRect: TRect; const SrcRect1, SrcRect2: TRect): Boolean; inline;
{$endif}
{$if declared(AddEventHandler)}
function AddEventHandler(AHandle: TLCLHandle; AFlags: dword; AEventHandler: TWaitHandleEvent; AData: PtrInt): PEventHandler; inline;
{$endif}
{$if declared(AddProcessEventHandler)}
function AddProcessEventHandler(AHandle: TLCLHandle; AEventHandler: TChildExitEvent; AData: PtrInt): PProcessEventHandler; inline;
{$endif}
{$if declared(AddPipeEventHandler)}
function AddPipeEventHandler(AHandle: TLCLHandle; AEventHandler: TPipeEvent; AData: PtrInt): PPipeEventHandler; inline;
{$endif}
{$if declared(AllocateHWnd)}
function AllocateHWnd(Method: TLCLWndMethod): HWND; inline;
{$endif}
{$if declared(AskUser)}
function AskUser(const DialogCaption, DialogMessage: string; DialogType: LongInt; Buttons: TDialogButtons; HelpCtx: Longint): LongInt; inline;
{$endif}
{$if declared(CallDefaultWndHandler)}
procedure CallDefaultWndHandler(Sender: TObject; var Message); inline;
{$endif}
{$if declared(ClipboardFormatToMimeType)}
function ClipboardFormatToMimeType(FormatID: TClipboardFormat): string; inline;
{$endif}
{$if declared(ClipboardGetData)}
function ClipboardGetData(ClipboardType: TClipboardType; FormatID: TClipboardFormat; Stream: TStream): boolean; inline;
{$endif}
{$if declared(ClipboardGetFormats)}
function ClipboardGetFormats(ClipboardType: TClipboardType; var Count: integer; var List: PClipboardFormat): boolean; inline;
{$endif}
{$if declared(ClipboardGetOwnerShip)}
function ClipboardGetOwnerShip(ClipboardType: TClipboardType; OnRequestProc: TClipboardRequestEvent; FormatCount: integer; Formats: PClipboardFormat): boolean; inline;
{$endif}
{$if declared(ClipboardRegisterFormat)}
function ClipboardRegisterFormat(const AMimeType: string): TClipboardFormat; inline;
{$endif}
{$if declared(ClipboardFormatNeedsNullByte)}
function ClipboardFormatNeedsNullByte(const AFormat: TPredefinedClipboardFormat): Boolean; inline;
{$endif}
{$if declared(CreateEmptyRegion)}
function CreateEmptyRegion: hRGN; inline;
{$endif}
{$if declared(CreatePixmapIndirect)}
function CreatePixmapIndirect(const Data: Pointer; const TransColor: Longint): HBITMAP; inline;
{$endif}
{$if declared(CreateRegionCopy)}
function CreateRegionCopy(SrcRGN: hRGN): hRGN; inline;
{$endif}
{$if declared(CreateRubberBand)}
function CreateRubberBand(const ARect: TRect; const ABrush: HBrush = 0): HWND; inline;
{$endif}
{$if declared(CreateStandardCursor)}
function CreateStandardCursor(ACursor: SmallInt): hCursor; inline;
{$endif}
{$if declared(DCClipRegionValid)}
function DCClipRegionValid(DC: HDC): boolean; inline;
{$endif}
{$if declared(DeallocateHWnd)}
procedure DeallocateHWnd(Wnd: HWND); inline;
{$endif}
{$if declared(DestroyRubberBand)}
procedure DestroyRubberBand(ARubberBand: HWND); inline;
{$endif}
{$if declared(DrawDefaultDockImage)}
procedure DrawDefaultDockImage(AOldRect, ANewRect: TRect; AOperation: TDockImageOperation); inline;
{$endif}
{$if declared(DrawGrid)}
procedure DrawGrid(DC: HDC; const R: TRect; DX, DY: Integer); inline;
{$endif}
{$if declared(ExtUTF8Out)}
function ExtUTF8Out(DC: HDC; X, Y: Integer; Options: Longint; Rect: PRect; Str: PChar; Count: Longint; Dx: PInteger): Boolean; inline;
{$endif}
{$if declared(FontIsMonoSpace)}
function FontIsMonoSpace(Font: HFont): boolean; inline;
{$endif}
{$if declared(Frame3d)}
function Frame3d(DC: HDC; var ARect: TRect; const FrameWidth : integer; const Style : TGraphicsBevelCut): Boolean; inline;
{$endif}
{$if declared(GetAcceleratorString)}
function GetAcceleratorString(const AVKey: Byte; const AShiftState: TShiftState): String; inline;
{$endif}
{$if declared(GetAvailableNativeCanvasTypes)}
function GetAvailableNativeCanvasTypes(DC: HDC; AAllowFallbackToParent: Boolean = False): TNativeCanvasTypes; inline;
{$endif}
{$if declared(GetAvailableNativeHandleTypes)}
function GetAvailableNativeHandleTypes(Handle: HWND; AAllowFallbackToParent: Boolean = False): TNativeHandleTypes; inline;
{$endif}
{$if declared(GetCaretRespondToFocus)}
function GetCaretRespondToFocus(handle: HWND; var ShowHideOnFocus: boolean): Boolean; inline;
{$endif}
{$if declared(GetClientBounds)}
function GetClientBounds(handle : HWND; var ARect: TRect) : Boolean; inline;
{$endif}
{$if declared(GetCmdLineParamDescForInterface)}
function GetCmdLineParamDescForInterface: TStringList; inline;
{$endif}
{$if declared(GetControlConstraints)}
function GetControlConstraints(Constraints: TObject): boolean; inline;
{$endif}
{$if declared(GetDCOpacity)}
function GetDCOpacity(DC: HDC): Byte; inline;
{$endif}
{$if declared(GetDCOriginRelativeToWindow)}
function GetDCOriginRelativeToWindow(PaintDC: HDC; WindowHandle: HWND; var OriginDiff: TPoint): boolean; inline;
{$endif}
{$if declared(GetDesignerDC)}
function GetDesignerDC(WindowHandle: HWND): HDC; inline;
{$endif}
{$if declared(GetDeviceSize)}
function GetDeviceSize(DC: HDC; var p: TPoint): boolean; inline;
{$endif}
{$if declared(GetLCLOwnerObject)}
function GetLCLOwnerObject(Handle: HWnd): TObject; inline;
{$endif}
{$if declared(GetNativeCanvas)}
function GetNativeCanvas(DC: HDC; AHandleType: TNativeCanvasType; AAllowFallbackToParent: Boolean = False): PtrInt; inline;
{$endif}
{$if declared(GetNativeHandle)}
function GetNativeHandle(Handle: HWND; AHandleType: TNativeHandleType; AAllowFallbackToParent: Boolean = False): PtrInt; inline;
{$endif}
{$if declared(GetScrollBarSize)}
function GetScrollBarSize(Handle: HWND; SBStyle: Integer): integer; inline;
{$endif}
{$if declared(GetScrollbarVisible)}
function GetScrollbarVisible(Handle: HWND; SBStyle: Integer): boolean; inline;
{$endif}
{$if declared(GetWindowRelativePosition)}
function GetWindowRelativePosition(Handle : hwnd; var Left, Top: integer): boolean; inline;
{$endif}
{$if declared(InvalidateFrame)}
function InvalidateFrame(aHandle : HWND; ARect : pRect; bErase : Boolean; BorderWidth: integer) : Boolean; inline;
{$endif}
{$if declared(IsDesignerDC)}
function IsDesignerDC(WindowHandle: HWND; DC: HDC): Boolean; inline;
{$endif}
{$if declared(IsMobilePlatform)}
function IsMobilePlatform: Boolean; inline;
{$endif}
{$if declared(IsCDIntfControl)}
function IsCDIntfControl(AWinControl: TObject): Boolean; inline;
{$endif}
{$if declared(MoveWindowOrgEx)}
function MoveWindowOrgEx(dc : hdc; dX,dY : Integer): boolean; inline;
{$endif}
{$if declared(PromptUser)}
function PromptUser(const DialogCaption, DialogMessage : String; DialogType : longint; Buttons : PLongint; ButtonCount, DefaultIndex, EscapeResult : Longint) : Longint; overload; inline;
{$endif}
{$if declared(PromptUserAtXY)}
function PromptUserAtXY(const DialogCaption, DialogMessage : String; DialogType : longint; Buttons : PLongint; ButtonCount, DefaultIndex, EscapeResult : Longint; X, Y : Longint) : Longint; overload; inline;
{$endif}
{$if declared(RadialArc)}
function RadialArc(DC: HDC; left, top, right, bottom, sx, sy, ex, ey : Integer): Boolean; inline;
{$endif}
{$if declared(RadialChord)}
function RadialChord(DC: HDC; x1, y1, x2, y2, sx, sy, ex, ey : Integer): Boolean; inline;
{$endif}
{$if declared(RadialPie)}
function RadialPie(DC: HDC; x1, y1, x2, y2, Angle1, Angle2: Integer): Boolean; inline;
{$endif}
{$if declared(RawImage_CreateBitmaps)}
function RawImage_CreateBitmaps(const ARawImage: TRawImage; out ABitmap, AMask: HBitmap; ASkipMask: Boolean = False): Boolean; inline;
{$endif}
{$if declared(RawImage_DescriptionFromBitmap)}
function RawImage_DescriptionFromBitmap(ABitmap: HBITMAP; out ADesc: TRawImageDescription): Boolean; inline;
{$endif}
{$if declared(RawImage_DescriptionFromDevice)}
function RawImage_DescriptionFromDevice(ADC: HDC; out ADesc: TRawImageDescription): Boolean; inline;
{$endif}
{$if declared(RawImage_FromBitmap)}
function RawImage_FromBitmap(out ARawImage: TRawImage; ABitmap, AMask: HBITMAP; ARect: PRect = nil): Boolean; inline;
{$endif}
{$if declared(RawImage_FromDevice)}
function RawImage_FromDevice(out ARawImage: TRawImage; ADC: HDC; const ARect: TRect): Boolean; inline;
{$endif}
{$if declared(RawImage_QueryDescription)}
function RawImage_QueryDescription(AFlags: TRawImageQueryFlags; var ADesc: TRawImageDescription): Boolean; inline;
{$endif}
{$if declared(RegroupMenuItem)}
function RegroupMenuItem(hndMenu: HMENU; GroupIndex: integer): Boolean; inline;
{$endif}
{$if declared(ReleaseDesignerDC)}
function ReleaseDesignerDC(hWnd: HWND; DC: HDC): Integer; inline;
{$endif}
{$if declared(RemoveEventHandler)}
procedure RemoveEventHandler(var AHandler: PEventHandler); inline;
{$endif}
{$if declared(RemoveProcessEventHandler)}
procedure RemoveProcessEventHandler(var AHandler: PProcessEventHandler); inline;
{$endif}
{$if declared(RemovePipeEventHandler)}
procedure RemovePipeEventHandler(var AHandler: PPipeEventHandler); inline;
{$endif}
{$if declared(RequestInput)}
function RequestInput(const InputCaption, InputPrompt : String; MaskInput : Boolean; var Value : String) : Boolean; inline;
{$endif}
{$if declared(SendCachedLCLMessages)}
procedure SendCachedLCLMessages; inline;
{$endif}
{$if declared(SetCanvasScaleFactor)}
procedure SetCanvasScaleFactor(DC: HDC; const AScaleFactor: double); inline;
{$endif}
{$if declared(SetCaretRespondToFocus)}
function SetCaretRespondToFocus(handle: HWND; ShowHideOnFocus: boolean): Boolean; inline;
{$endif}
{$if declared(SetComboMinDropDownSize)}
function SetComboMinDropDownSize(Handle: HWND; MinItemsWidth, MinItemsHeight, MinItemCount: integer): boolean; inline;
{$endif}
{$if declared(SetDCOpacity)}
procedure SetDCOpacity(DC: HDC; AOpacity: Byte); inline;
{$endif}
{$if declared(SetEventHandlerFlags)}
procedure SetEventHandlerFlags(AHandler: PEventHandler; NewFlags: dword); inline;
{$endif}
{$if declared(SetRubberBandRect)}
procedure SetRubberBandRect(const ARubberBand: HWND; const ARect: TRect); inline;
{$endif}
{$if declared(ShowSelectItemDialog)}
function ShowSelectItemDialog(const AItems: TStrings; APos: TPoint): Boolean; inline;
{$endif}
{$if declared(StretchMaskBlt)}
function StretchMaskBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc, SrcWidth, SrcHeight: Integer; Mask: HBITMAP; XMask, YMask: Integer; Rop: DWORD): Boolean; inline;
{$endif}
{$if declared(TextUTF8Out)}
function TextUTF8Out(DC: HDC; X, Y: Integer; Str: PChar; Count: Longint): Boolean; inline;
{$endif}
{$if declared(ExcludeClipRgn)}
function ExcludeClipRgn(dc: hdc; rgn : hrgn) : Integer; inline;
{$endif}
{$if declared(PredefinedClipboardFormat)}
function PredefinedClipboardFormat(AFormat: TPredefinedClipboardFormat): TClipboardFormat; inline;
{$endif}
{$if declared(MsgKeyDataToShiftState)}
function MsgKeyDataToShiftState(KeyData: PtrInt): TShiftState; inline;
{$endif}
{$if declared(GetTickCount)}
function GetTickCount: DWord; inline;
{$endif}
{$if declared(GetTickCount64)}
function GetTickCount64: QWord; inline;
{$endif}
{$if declared(FindDefaultBrowser)}
function FindDefaultBrowser(out ABrowser, AParams: String): Boolean; inline;
{$endif}
{$if declared(OpenURL)}
function OpenURL(AURL: String): Boolean; inline;
{$endif}
{$if declared(OpenDocument)}
function OpenDocument(APath: String): Boolean; inline;
{$endif}
{$if declared(SelectInFolder)}
function SelectInFolder(AFullPath: String): Boolean; inline;
{$endif}

implementation

{$if declared(CS_To_String)}
function CS_To_String(CompStyle: Integer): String;
begin
  Result := LCLType.CS_To_String(CompStyle);
end;

{$endif}
{$if declared(HiWord)}
function HiWord(i: integer): word;
begin
  Result := LCLType.HiWord(i);
end;

{$endif}
{$if declared(LoWord)}
function LoWord(i: integer): word;
begin
  Result := LCLType.LoWord(i);
end;

{$endif}
{$if declared(Char2VK)}
function Char2VK(C : Char) : Word;
begin
  Result := LCLType.Char2VK(C);
end;

{$endif}
{$if declared(VK2Char)}
function VK2Char(AVK: Word): Char;
begin
  Result := LCLType.VK2Char(AVK);
end;

{$endif}
{$if declared(MathRound)}
function MathRound(AValue: ValReal): Int64;
begin
  Result := LCLType.MathRound(AValue);
end;

{$endif}
{$if declared(MulDiv)}
function MulDiv(nNumber, nNumerator, nDenominator: Integer): Integer;
begin
  Result := LCLType.MulDiv(nNumber, nNumerator, nDenominator);
end;

{$endif}
{$if declared(KeyToShortCut)}
function KeyToShortCut(const Key: Word; const Shift: TShiftState): TShortCut;
begin
  Result := LCLType.KeyToShortCut(Key, Shift);
end;

{$endif}
{$if declared(CharSetToString)}
function CharSetToString(const Charset: Integer): String;
begin
  Result := LCLType.CharSetToString(Charset);
end;

{$endif}
{$if declared(StringToCharset)}
function StringToCharset(Charset: string): byte;
begin
  Result := LCLType.StringToCharset(Charset);
end;

{$endif}
{$if declared(FontWeightToStr)}
function FontWeightToStr(AWeight: integer; ADefault: string = ''): string;
begin
  Result := LCLType.FontWeightToStr(AWeight, ADefault);
end;

{$endif}
{$if declared(Arc)}
function Arc(DC: HDC; Left,Top,Right,Bottom,Angle16Deg, Angle16DegLength: Integer): Boolean;
begin
  Result := LCLIntf.Arc(DC, Left, Top, Right, Bottom, Angle16Deg, Angle16DegLength);
end;

{$endif}
{$if declared(AngleChord)}
function AngleChord(DC: HDC; x1,y1,x2,y2,angle1,angle2 : Integer): Boolean;
begin
  Result := LCLIntf.AngleChord(DC, x1, y1, x2, y2, angle1, angle2);
end;

{$endif}
{$if declared(BeginPaint)}
function BeginPaint(Handle : hwnd; var PS : TPaintStruct): hdc;
begin
  Result := LCLIntf.BeginPaint(Handle, PS);
end;

{$endif}
{$if declared(BitBlt)}
function BitBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc: Integer; Rop: DWORD): Boolean;
begin
  Result := LCLIntf.BitBlt(DestDC, X, Y, Width, Height, SrcDC, XSrc, YSrc, Rop);
end;

{$endif}
{$if declared(CallNextHookEx)}
function CallNextHookEx(hhk : HHOOK; ncode : Integer; WParam: WParam; LParam: LParam) : Integer;
begin
  Result := LCLIntf.CallNextHookEx(hhk, ncode, WParam, LParam);
end;

{$endif}
{$if declared(CallWindowProc)}
function CallWindowProc(lpPrevWndFunc : TFarProc; Handle : HWND; Msg : UINT; WParam: WParam; LParam: LParam): Integer;
begin
  Result := LCLIntf.CallWindowProc(lpPrevWndFunc, Handle, Msg, WParam, LParam);
end;

{$endif}
{$if declared(ClientToScreen)}
function ClientToScreen(Handle : HWND; var P : TPoint) : Boolean;
begin
  Result := LCLIntf.ClientToScreen(Handle, P);
end;

{$endif}
{$if declared(CombineRgn)}
function CombineRgn(Dest, Src1, Src2 : HRGN; fnCombineMode : Longint) : Longint;
begin
  Result := LCLIntf.CombineRgn(Dest, Src1, Src2, fnCombineMode);
end;

{$endif}
{$if declared(CreateBitmap)}
function CreateBitmap(Width, Height: Integer; Planes, BitCount: Longint; BitmapBits: Pointer): HBITMAP;
begin
  Result := LCLIntf.CreateBitmap(Width, Height, Planes, BitCount, BitmapBits);
end;

{$endif}
{$if declared(CreateBrushIndirect)}
function CreateBrushIndirect(const LogBrush: TLogBrush): HBRUSH;
begin
  Result := LCLIntf.CreateBrushIndirect(LogBrush);
end;

{$endif}
{$if declared(CreateBrushWithRadialGradient)}
function CreateBrushWithRadialGradient(const LogBrush: TLogRadialGradient): HBRUSH;
begin
  Result := LCLIntf.CreateBrushWithRadialGradient(LogBrush);
end;

{$endif}
{$if declared(CreateCaret)}
function CreateCaret(Handle: HWND; Bitmap: hBitmap; width, Height: Integer): Boolean;
begin
  Result := LCLIntf.CreateCaret(Handle, Bitmap, width, Height);
end;

{$endif}
{$if declared(CreateCompatibleBitmap)}
function CreateCompatibleBitmap(DC: HDC; Width, Height: Integer): HBITMAP;
begin
  Result := LCLIntf.CreateCompatibleBitmap(DC, Width, Height);
end;

{$endif}
{$if declared(CreateCompatibleDC)}
function CreateCompatibleDC(DC: HDC): HDC;
begin
  Result := LCLIntf.CreateCompatibleDC(DC);
end;

{$endif}
{$if declared(CreateDIBitmap)}
function CreateDIBitmap(DC: HDC; var InfoHeader: TBitmapInfoHeader; dwUsage: DWORD; InitBits: PChar; var InitInfo: TBitmapInfo; wUsage: UINT): HBITMAP;
begin
  Result := LCLIntf.CreateDIBitmap(DC, InfoHeader, dwUsage, InitBits, InitInfo, wUsage);
end;

{$endif}
{$if declared(CreateDIBSection)}
function CreateDIBSection(DC: HDC; const BitmapInfo: tagBitmapInfo; Usage: UINT; var Bits: Pointer; SectionHandle: TLCLHandle; Offset: DWORD): HBITMAP;
begin
  Result := LCLIntf.CreateDIBSection(DC, BitmapInfo, Usage, Bits, SectionHandle, Offset);
end;

{$endif}
{$if declared(CreateEllipticRgn)}
function CreateEllipticRgn(X1, Y1, X2, Y2: Integer): HRGN;
begin
  Result := LCLIntf.CreateEllipticRgn(X1, Y1, X2, Y2);
end;

{$endif}
{$if declared(CreateFontIndirect)}
function CreateFontIndirect(const LogFont: TLogFont): HFONT;
begin
  Result := LCLIntf.CreateFontIndirect(LogFont);
end;

{$endif}
{$if declared(CreateFontIndirectEx)}
function CreateFontIndirectEx(const LogFont: TLogFont; const LongFontName: string): HFONT;
begin
  Result := LCLIntf.CreateFontIndirectEx(LogFont, LongFontName);
end;

{$endif}
{$if declared(CreateIconIndirect)}
function CreateIconIndirect(IconInfo: PIconInfo): HICON;
begin
  Result := LCLIntf.CreateIconIndirect(IconInfo);
end;

{$endif}
{$if declared(CreatePalette)}
function CreatePalette(const LogPalette: TLogPalette): HPalette;
begin
  Result := LCLIntf.CreatePalette(LogPalette);
end;

{$endif}
{$if declared(CreatePatternBrush)}
function CreatePatternBrush(ABitmap: HBITMAP): HBRUSH;
begin
  Result := LCLIntf.CreatePatternBrush(ABitmap);
end;

{$endif}
{$if declared(CreatePenIndirect)}
function CreatePenIndirect(const LogPen: TLogPen): HPEN;
begin
  Result := LCLIntf.CreatePenIndirect(LogPen);
end;

{$endif}
{$if declared(CreatePolygonRgn)}
function CreatePolygonRgn(Points: PPoint; NumPts: Integer; FillMode: integer): HRGN;
begin
  Result := LCLIntf.CreatePolygonRgn(Points, NumPts, FillMode);
end;

{$endif}
{$if declared(CreateRectRgn)}
function CreateRectRgn(X1,Y1,X2,Y2 : Integer): HRGN;
begin
  Result := LCLIntf.CreateRectRgn(X1, Y1, X2, Y2);
end;

{$endif}
{$if declared(CreateRoundRectRgn)}
function CreateRoundRectRgn(X1, Y1, X2, Y2, nWidthEllipse, nHeightEllipse: Integer): HRGN;
begin
  Result := LCLIntf.CreateRoundRectRgn(X1, Y1, X2, Y2, nWidthEllipse, nHeightEllipse);
end;

{$endif}
{$if declared(DeleteCriticalSection)}
procedure DeleteCriticalSection(var CritSection: TCriticalSection);
begin
  LCLIntf.DeleteCriticalSection(CritSection);
end;

{$endif}
{$if declared(DeleteDC)}
function DeleteDC(hDC: HDC): Boolean;
begin
  Result := LCLIntf.DeleteDC(hDC);
end;

{$endif}
{$if declared(DeleteObject)}
function DeleteObject(GDIObject: HGDIOBJ): Boolean;
begin
  Result := LCLIntf.DeleteObject(GDIObject);
end;

{$endif}
{$if declared(DestroyCaret)}
function DestroyCaret(Handle : HWND): Boolean;
begin
  Result := LCLIntf.DestroyCaret(Handle);
end;

{$endif}
{$if declared(DestroyCursor)}
function DestroyCursor(Handle: HCURSOR): Boolean;
begin
  Result := LCLIntf.DestroyCursor(Handle);
end;

{$endif}
{$if declared(DestroyIcon)}
function DestroyIcon(Handle: HICON): Boolean;
begin
  Result := LCLIntf.DestroyIcon(Handle);
end;

{$endif}
{$if declared(DPtoLP)}
function DPtoLP(DC: HDC; var Points; Count: Integer): BOOL;
begin
  Result := LCLIntf.DPtoLP(DC, Points, Count);
end;

{$endif}
{$if declared(DrawFrameControl)}
function DrawFrameControl(DC: HDC; const Rect : TRect; uType, uState : Cardinal) : Boolean;
begin
  Result := LCLIntf.DrawFrameControl(DC, Rect, uType, uState);
end;

{$endif}
{$if declared(DrawFocusRect)}
function DrawFocusRect(DC: HDC; const Rect: TRect): Boolean;
begin
  Result := LCLIntf.DrawFocusRect(DC, Rect);
end;

{$endif}
{$if declared(DrawEdge)}
function DrawEdge(DC: HDC; var Rect: TRect; edge: Cardinal; grfFlags: Cardinal): Boolean;
begin
  Result := LCLIntf.DrawEdge(DC, Rect, edge, grfFlags);
end;

{$endif}
{$if declared(DrawText)}
function DrawText(DC: HDC; Str: PChar; Count: Integer; var Rect: TRect; Flags: Cardinal): Integer;
begin
  Result := LCLIntf.DrawText(DC, Str, Count, Rect, Flags);
end;

{$endif}
{$if declared(EnableScrollBar)}
function EnableScrollBar(Wnd: HWND; wSBflags, wArrows: Cardinal): Boolean;
begin
  Result := LCLIntf.EnableScrollBar(Wnd, wSBflags, wArrows);
end;

{$endif}
{$if declared(EnableWindow)}
function EnableWindow(hWnd: HWND; bEnable: Boolean): Boolean;
begin
  Result := LCLIntf.EnableWindow(hWnd, bEnable);
end;

{$endif}
{$if declared(EndPaint)}
function EndPaint(Handle : hwnd; var PS : TPaintStruct): Integer;
begin
  Result := LCLIntf.EndPaint(Handle, PS);
end;

{$endif}
{$if declared(EnterCriticalSection)}
procedure EnterCriticalSection(var CritSection: TCriticalSection);
begin
  LCLIntf.EnterCriticalSection(CritSection);
end;

{$endif}
{$if declared(EnumDisplayMonitors)}
function EnumDisplayMonitors(hdc: HDC; lprcClip: PRect; lpfnEnum: MonitorEnumProc; dwData: LPARAM): LongBool;
begin
  Result := LCLIntf.EnumDisplayMonitors(hdc, lprcClip, lpfnEnum, dwData);
end;

{$endif}
{$if declared(EnumFontFamilies)}
function EnumFontFamilies(DC: HDC; Family: Pchar; EnumFontFamProc: FontEnumProc; LParam:Lparam):longint;
begin
  Result := LCLIntf.EnumFontFamilies(DC, Family, EnumFontFamProc, LParam);
end;

{$endif}
{$if declared(EnumFontFamiliesEx)}
function EnumFontFamiliesEx(DC: HDC; lpLogFont:PLogFont; Callback: FontEnumExProc; Lparam:LParam; Flags: dword): longint;
begin
  Result := LCLIntf.EnumFontFamiliesEx(DC, lpLogFont, Callback, Lparam, Flags);
end;

{$endif}
{$if declared(Ellipse)}
function Ellipse(DC: HDC; x1, y1, x2, y2: Integer): Boolean;
begin
  Result := LCLIntf.Ellipse(DC, x1, y1, x2, y2);
end;

{$endif}
{$if declared(EqualRgn)}
function EqualRgn(Rgn1: HRGN; Rgn2: HRGN): Boolean;
begin
  Result := LCLIntf.EqualRgn(Rgn1, Rgn2);
end;

{$endif}
{$if declared(ExcludeClipRect)}
function ExcludeClipRect(dc: hdc; Left, Top, Right, Bottom : Integer) : Integer;
begin
  Result := LCLIntf.ExcludeClipRect(dc, Left, Top, Right, Bottom);
end;

{$endif}
{$if declared(ExtCreatePen)}
function ExtCreatePen(dwPenStyle, dwWidth: DWord; const lplb: TLogBrush; dwStyleCount: DWord; lpStyle: PDWord): HPEN;
begin
  Result := LCLIntf.ExtCreatePen(dwPenStyle, dwWidth, lplb, dwStyleCount, lpStyle);
end;

{$endif}
{$if declared(ExtTextOut)}
function ExtTextOut(DC: HDC; X, Y: Integer; Options: Longint; Rect: PRect; Str: PChar; Count: Longint; Dx: PInteger): Boolean;
begin
  Result := LCLIntf.ExtTextOut(DC, X, Y, Options, Rect, Str, Count, Dx);
end;

{$endif}
{$if declared(ExtSelectClipRGN)}
function ExtSelectClipRGN(dc: hdc; rgn : hrgn; Mode : Longint) : Integer;
begin
  Result := LCLIntf.ExtSelectClipRGN(dc, rgn, Mode);
end;

{$endif}
{$if declared(FillRect)}
function FillRect(DC: HDC; const Rect: TRect; Brush: HBRUSH): Boolean;
begin
  Result := LCLIntf.FillRect(DC, Rect, Brush);
end;

{$endif}
{$if declared(FillRgn)}
function FillRgn(DC: HDC; RegionHnd: HRGN; hbr: HBRUSH): BOOL;
begin
  Result := LCLIntf.FillRgn(DC, RegionHnd, hbr);
end;

{$endif}
{$if declared(FloodFill)}
function FloodFill(DC: HDC; X, Y: Integer; Color: TGraphicsColor; FillStyle: TGraphicsFillStyle; Brush: HBRUSH): Boolean;
begin
  Result := LCLIntf.FloodFill(DC, X, Y, Color, FillStyle, Brush);
end;

{$endif}
{$if declared(FrameRect)}
function FrameRect(DC: HDC; const ARect: TRect; hBr: HBRUSH): Integer;
begin
  Result := LCLIntf.FrameRect(DC, ARect, hBr);
end;

{$endif}
{$if declared(GetActiveWindow)}
function GetActiveWindow : HWND;
begin
  Result := LCLIntf.GetActiveWindow;
end;

{$endif}
{$if declared(GetBitmapBits)}
function GetBitmapBits(Bitmap: HBITMAP; Count: Longint; Bits: Pointer): Longint;
begin
  Result := LCLIntf.GetBitmapBits(Bitmap, Count, Bits);
end;

{$endif}
{$if declared(GetBkColor)}
function GetBkColor(DC: HDC): TColorRef;
begin
  Result := LCLIntf.GetBkColor(DC);
end;

{$endif}
{$if declared(GetCapture)}
function GetCapture : HWND;
begin
  Result := LCLIntf.GetCapture;
end;

{$endif}
{$if declared(GetCaretPos)}
function GetCaretPos(var lpPoint: TPoint): Boolean;
begin
  Result := LCLIntf.GetCaretPos(lpPoint);
end;

{$endif}
{$if declared(GetClientRect)}
function GetClientRect(handle : HWND; var Rect: TRect) : Boolean;
begin
  Result := LCLIntf.GetClientRect(handle, Rect);
end;

{$endif}
{$if declared(GetClipBox)}
function GetClipBox(DC : hDC; lpRect : PRect) : Longint;
begin
  Result := LCLIntf.GetClipBox(DC, lpRect);
end;

{$endif}
{$if declared(GetClipRGN)}
function GetClipRGN(DC : hDC; RGN : hRGN) : Longint;
begin
  Result := LCLIntf.GetClipRGN(DC, RGN);
end;

{$endif}
{$if declared(GetCompositorExtendedBorder)}
function GetCompositorExtendedBorder(handle : HWND; var Borders: TRect) : Boolean;
begin
  Result := LCLIntf.GetCompositorExtendedBorder(handle, Borders);
end;

{$endif}
{$if declared(GetCurrentObject)}
function GetCurrentObject(DC: HDC; uObjectType: UINT): HGDIOBJ;
begin
  Result := LCLIntf.GetCurrentObject(DC, uObjectType);
end;

{$endif}
{$if declared(GetCursorPos)}
function GetCursorPos(var lpPoint: TPoint): Boolean;
begin
  Result := LCLIntf.GetCursorPos(lpPoint);
end;

{$endif}
{$if declared(GetCharABCWidths)}
function GetCharABCWidths(DC: HDC; p2, p3: UINT; const ABCStructs): Boolean;
begin
  Result := LCLIntf.GetCharABCWidths(DC, p2, p3, ABCStructs);
end;

{$endif}
{$if declared(GetDC)}
function GetDC(hWnd: HWND): HDC;
begin
  Result := LCLIntf.GetDC(hWnd);
end;

{$endif}
{$if declared(GetDeviceCaps)}
function GetDeviceCaps(DC: HDC; Index: Integer): Integer;
begin
  Result := LCLIntf.GetDeviceCaps(DC, Index);
end;

{$endif}
{$if declared(GetDIBits)}
function GetDIBits(DC: HDC; Bitmap: HBitmap; StartScan, NumScans: UINT; Bits: Pointer; var BitInfo: BitmapInfo; Usage: UINT): Integer;
begin
  Result := LCLIntf.GetDIBits(DC, Bitmap, StartScan, NumScans, Bits, BitInfo, Usage);
end;

{$endif}
{$if declared(GetDoubleClickTime)}
function GetDoubleClickTime: UINT;
begin
  Result := LCLIntf.GetDoubleClickTime;
end;

{$endif}
{$if declared(GetFocus)}
function GetFocus: HWND;
begin
  Result := LCLIntf.GetFocus;
end;

{$endif}
{$if declared(GetFontLanguageInfo)}
function GetFontLanguageInfo(DC: HDC): DWord;
begin
  Result := LCLIntf.GetFontLanguageInfo(DC);
end;

{$endif}
{$if declared(GetForegroundWindow)}
function GetForegroundWindow: HWND;
begin
  Result := LCLIntf.GetForegroundWindow;
end;

{$endif}
{$if declared(GetIconInfo)}
function GetIconInfo(AIcon: HICON; AIconInfo: PIconInfo): Boolean;
begin
  Result := LCLIntf.GetIconInfo(AIcon, AIconInfo);
end;

{$endif}
{$if declared(GetKeyState)}
function GetKeyState(nVirtKey: Integer): Smallint;
begin
  Result := LCLIntf.GetKeyState(nVirtKey);
end;

{$endif}
{$if declared(GetMapMode)}
function GetMapMode(DC: HDC): Integer;
begin
  Result := LCLIntf.GetMapMode(DC);
end;

{$endif}
{$if declared(GetMonitorInfo)}
function GetMonitorInfo(hMonitor: HMONITOR; lpmi: PMonitorInfo): Boolean;
begin
  Result := LCLIntf.GetMonitorInfo(hMonitor, lpmi);
end;

{$endif}
{$if declared(GetDpiForMonitor)}
function GetDpiForMonitor(hmonitor: HMONITOR; dpiType: TMonitorDpiType; out dpiX: UINT; out dpiY: UINT): HRESULT;
begin
  Result := LCLIntf.GetDpiForMonitor(hmonitor, dpiType, dpiX, dpiY);
end;

{$endif}
{$if declared(GetObject)}
function GetObject(GDIObject: HGDIOBJ; BufSize: Integer; Buf: Pointer): Integer;
begin
  Result := LCLIntf.GetObject(GDIObject, BufSize, Buf);
end;

{$endif}
{$if declared(GetPaletteEntries)}
function GetPaletteEntries(Palette: HPALETTE; StartIndex, NumEntries: UINT; var PaletteEntries): UINT;
begin
  Result := LCLIntf.GetPaletteEntries(Palette, StartIndex, NumEntries, PaletteEntries);
end;

{$endif}
{$if declared(GetParent)}
function GetParent(Handle : HWND): HWND;
begin
  Result := LCLIntf.GetParent(Handle);
end;

{$endif}
{$if declared(GetProp)}
function GetProp(Handle : hwnd; Str : PChar): Pointer;
begin
  Result := LCLIntf.GetProp(Handle, Str);
end;

{$endif}
{$if declared(GetRgnBox)}
function GetRgnBox(RGN : HRGN; lpRect : PRect) : Longint;
begin
  Result := LCLIntf.GetRgnBox(RGN, lpRect);
end;

{$endif}
{$if declared(GetROP2)}
function GetROP2(DC: HDC): integer;
begin
  Result := LCLIntf.GetROP2(DC);
end;

{$endif}
{$if declared(GetScrollInfo)}
function GetScrollInfo(Handle: HWND; SBStyle: Integer; var ScrollInfo: TScrollInfo): Boolean;
begin
  Result := LCLIntf.GetScrollInfo(Handle, SBStyle, ScrollInfo);
end;

{$endif}
{$if declared(GetStockObject)}
function GetStockObject(Value: Integer): TLCLHandle;
begin
  Result := LCLIntf.GetStockObject(Value);
end;

{$endif}
{$if declared(GetSysColor)}
function GetSysColor(nIndex: Integer): DWORD;
begin
  Result := LCLIntf.GetSysColor(nIndex);
end;

{$endif}
{$if declared(GetSysColorBrush)}
function GetSysColorBrush(nIndex: Integer): HBrush;
begin
  Result := LCLIntf.GetSysColorBrush(nIndex);
end;

{$endif}
{$if declared(GetSystemPaletteEntries)}
function GetSystemPaletteEntries(DC: HDC; StartIndex, NumEntries: UINT; var PaletteEntries): UINT;
begin
  Result := LCLIntf.GetSystemPaletteEntries(DC, StartIndex, NumEntries, PaletteEntries);
end;

{$endif}
{$if declared(GetSystemMetrics)}
function GetSystemMetrics(nIndex: Integer): Integer;
begin
  Result := LCLIntf.GetSystemMetrics(nIndex);
end;

{$endif}
{$if declared(GetTextColor)}
function GetTextColor(DC: HDC) : TColorRef;
begin
  Result := LCLIntf.GetTextColor(DC);
end;

{$endif}
{$if declared(GetTextExtentExPoint)}
function GetTextExtentExPoint(DC: HDC; Str: PChar; Count, MaxWidth: Integer; MaxCount, PartialWidths: PInteger; var Size: TSize): Boolean;
begin
  Result := LCLIntf.GetTextExtentExPoint(DC, Str, Count, MaxWidth, MaxCount, PartialWidths, Size);
end;

{$endif}
{$if declared(GetTextExtentPoint)}
function GetTextExtentPoint(DC: HDC; Str: PChar; Count: Integer; var Size: TSize): Boolean;
begin
  Result := LCLIntf.GetTextExtentPoint(DC, Str, Count, Size);
end;

{$endif}
{$if declared(GetTextExtentPoint32)}
function GetTextExtentPoint32(DC: HDC; Str: PChar; Count: Integer; var Size: TSize): Boolean;
begin
  Result := LCLIntf.GetTextExtentPoint32(DC, Str, Count, Size);
end;

{$endif}
{$if declared(GetTextMetrics)}
function GetTextMetrics(DC: HDC; var TM: TTextMetric): Boolean;
begin
  Result := LCLIntf.GetTextMetrics(DC, TM);
end;

{$endif}
{$if declared(GetViewPortExtEx)}
function GetViewPortExtEx(DC: HDC; Size: PSize): Integer;
begin
  Result := LCLIntf.GetViewPortExtEx(DC, Size);
end;

{$endif}
{$if declared(GetViewPortOrgEx)}
function GetViewPortOrgEx(DC: HDC; P: PPoint): Integer;
begin
  Result := LCLIntf.GetViewPortOrgEx(DC, P);
end;

{$endif}
{$if declared(GetWindowExtEx)}
function GetWindowExtEx(DC: HDC; Size: PSize): Integer;
begin
  Result := LCLIntf.GetWindowExtEx(DC, Size);
end;

{$endif}
{$if declared(GetWindowLong)}
function GetWindowLong(Handle : hwnd; int : Integer): PtrInt;
begin
  Result := LCLIntf.GetWindowLong(Handle, int);
end;

{$endif}
{$if declared(GetWindowRect)}
function GetWindowRect(Handle : hwnd; var Rect : TRect): Integer;
begin
  Result := LCLIntf.GetWindowRect(Handle, Rect);
end;

{$endif}
{$if declared(GetWindowSize)}
function GetWindowSize(Handle : hwnd; var Width, Height: integer): boolean;
begin
  Result := LCLIntf.GetWindowSize(Handle, Width, Height);
end;

{$endif}
{$if declared(GetWindowOrgEx)}
function GetWindowOrgEx(dc : hdc; var P: TPoint): Integer;
begin
  Result := LCLIntf.GetWindowOrgEx(dc, P);
end;

{$endif}
{$if declared(GetWindowOrgEx)}
function GetWindowOrgEx(dc : hdc; P : PPoint): Integer;
begin
  Result := LCLIntf.GetWindowOrgEx(dc, P);
end;

{$endif}
{$if declared(GradientFill)}
function GradientFill(DC: HDC; Vertices: PTriVertex; NumVertices : Longint; Meshes: Pointer; NumMeshes : Longint; Mode : Longint): Boolean;
begin
  Result := LCLIntf.GradientFill(DC, Vertices, NumVertices, Meshes, NumMeshes, Mode);
end;

{$endif}
{$if declared(HideCaret)}
function HideCaret(hWnd: HWND): Boolean;
begin
  Result := LCLIntf.HideCaret(hWnd);
end;

{$endif}
{$if declared(InitializeCriticalSection)}
procedure InitializeCriticalSection(var CritSection: TCriticalSection);
begin
  LCLIntf.InitializeCriticalSection(CritSection);
end;

{$endif}
{$if declared(IntersectClipRect)}
function IntersectClipRect(dc: hdc; Left, Top, Right,Bottom: Integer): Integer;
begin
  Result := LCLIntf.IntersectClipRect(dc, Left, Top, Right, Bottom);
end;

{$endif}
{$if declared(InvalidateRect)}
function InvalidateRect(aHandle : HWND; ARect : pRect; bErase : Boolean) : Boolean;
begin
  Result := LCLIntf.InvalidateRect(aHandle, ARect, bErase);
end;

{$endif}
{$if declared(InvalidateRgn)}
function InvalidateRgn(Handle: HWND; Rgn: HRGN; Erase: Boolean): Boolean;
begin
  Result := LCLIntf.InvalidateRgn(Handle, Rgn, Erase);
end;

{$endif}
{$if declared(IsDBCSLeadByte)}
function IsDBCSLeadByte(TestChar: Byte): boolean;
begin
  Result := LCLIntf.IsDBCSLeadByte(TestChar);
end;

{$endif}
{$if declared(IsIconic)}
function IsIconic(handle: HWND): boolean;
begin
  Result := LCLIntf.IsIconic(handle);
end;

{$endif}
{$if declared(IsWindow)}
function IsWindow(handle: HWND): boolean;
begin
  Result := LCLIntf.IsWindow(handle);
end;

{$endif}
{$if declared(IsWindowEnabled)}
function IsWindowEnabled(handle: HWND): boolean;
begin
  Result := LCLIntf.IsWindowEnabled(handle);
end;

{$endif}
{$if declared(IsWindowVisible)}
function IsWindowVisible(handle: HWND): boolean;
begin
  Result := LCLIntf.IsWindowVisible(handle);
end;

{$endif}
{$if declared(IsZoomed)}
function IsZoomed(handle: HWND): boolean;
begin
  Result := LCLIntf.IsZoomed(handle);
end;

{$endif}
{$if declared(LeaveCriticalSection)}
procedure LeaveCriticalSection(var CritSection: TCriticalSection);
begin
  LCLIntf.LeaveCriticalSection(CritSection);
end;

{$endif}
{$if declared(LineTo)}
function LineTo(DC: HDC; X, Y: Integer): Boolean;
begin
  Result := LCLIntf.LineTo(DC, X, Y);
end;

{$endif}
{$if declared(LoadBitmap)}
function LoadBitmap(hInstance: TLCLHandle; lpBitmapName: PChar): HBitmap;
begin
  Result := LCLIntf.LoadBitmap(hInstance, lpBitmapName);
end;

{$endif}
{$if declared(LoadCursor)}
function LoadCursor(hInstance: TLCLHandle; lpCursorName: PChar): HCursor;
begin
  Result := LCLIntf.LoadCursor(hInstance, lpCursorName);
end;

{$endif}
{$if declared(LoadIcon)}
function LoadIcon(hInstance: TLCLHandle; lpIconName: PChar): HIcon;
begin
  Result := LCLIntf.LoadIcon(hInstance, lpIconName);
end;

{$endif}
{$if declared(LPtoDP)}
function LPtoDP(DC: HDC; var Points; Count: Integer): BOOL;
begin
  Result := LCLIntf.LPtoDP(DC, Points, Count);
end;

{$endif}
{$if declared(MaskBlt)}
function MaskBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc: Integer; Mask: HBITMAP; XMask, YMask: Integer; Rop: DWORD): Boolean;
begin
  Result := LCLIntf.MaskBlt(DestDC, X, Y, Width, Height, SrcDC, XSrc, YSrc, Mask, XMask, YMask, Rop);
end;

{$endif}
{$if declared(MaskBlt)}
function MaskBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc: Integer; Mask: HBITMAP; XMask, YMask: Integer): Boolean;
begin
  Result := LCLIntf.MaskBlt(DestDC, X, Y, Width, Height, SrcDC, XSrc, YSrc, Mask, XMask, YMask);
end;

{$endif}
{$if declared(MessageBox)}
function MessageBox(hWnd: HWND; lpText, lpCaption: PChar; uType: Cardinal = MB_OK): integer;
begin
  Result := LCLIntf.MessageBox(hWnd, lpText, lpCaption, uType);
end;

{$endif}
{$if declared(MonitorFromPoint)}
function MonitorFromPoint(ptScreenCoords: TPoint; dwFlags: DWord): HMONITOR;
begin
  Result := LCLIntf.MonitorFromPoint(ptScreenCoords, dwFlags);
end;

{$endif}
{$if declared(MonitorFromRect)}
function MonitorFromRect(lprcScreenCoords: PRect; dwFlags: DWord): HMONITOR;
begin
  Result := LCLIntf.MonitorFromRect(lprcScreenCoords, dwFlags);
end;

{$endif}
{$if declared(MonitorFromWindow)}
function MonitorFromWindow(hWnd: HWND; dwFlags: DWord): HMONITOR;
begin
  Result := LCLIntf.MonitorFromWindow(hWnd, dwFlags);
end;

{$endif}
{$if declared(MoveToEx)}
function MoveToEx(DC: HDC; X, Y: Integer; OldPoint: PPoint): Boolean;
begin
  Result := LCLIntf.MoveToEx(DC, X, Y, OldPoint);
end;

{$endif}
{$if declared(OffsetRgn)}
function OffsetRgn(RGN: HRGN; nXOffset, nYOffset: Integer): Integer;
begin
  Result := LCLIntf.OffsetRgn(RGN, nXOffset, nYOffset);
end;

{$endif}
{$if declared(PaintRgn)}
function PaintRgn(DC: HDC; RGN: HRGN): Boolean;
begin
  Result := LCLIntf.PaintRgn(DC, RGN);
end;

{$endif}
{$if declared(PeekMessage)}
function PeekMessage(var lpMsg : TMsg; Handle : HWND; wMsgFilterMin, wMsgFilterMax,wRemoveMsg : UINT): Boolean;
begin
  Result := LCLIntf.PeekMessage(lpMsg, Handle, wMsgFilterMin, wMsgFilterMax, wRemoveMsg);
end;

{$endif}
{$if declared(Pie)}
function Pie(DC: HDC; x1, y1, x2, y2, sx, sy, ex, ey: Integer): Boolean;
begin
  Result := LCLIntf.Pie(DC, x1, y1, x2, y2, sx, sy, ex, ey);
end;

{$endif}
{$if declared(PolyBezier)}
function PolyBezier(DC: HDC; Points: PPoint; NumPts: Integer; Filled, Continuous: boolean): boolean;
begin
  Result := LCLIntf.PolyBezier(DC, Points, NumPts, Filled, Continuous);
end;

{$endif}
{$if declared(Polygon)}
function Polygon(DC: HDC; Points: PPoint; NumPts: Integer; Winding: boolean): boolean;
begin
  Result := LCLIntf.Polygon(DC, Points, NumPts, Winding);
end;

{$endif}
{$if declared(Polyline)}
function Polyline(DC: HDC; Points: PPoint; NumPts: Integer): boolean;
begin
  Result := LCLIntf.Polyline(DC, Points, NumPts);
end;

{$endif}
{$if declared(PostMessage)}
function PostMessage(Handle: HWND; Msg: Cardinal; WParam: WParam; LParam: LParam): Boolean;
begin
  Result := LCLIntf.PostMessage(Handle, Msg, WParam, LParam);
end;

{$endif}
{$if declared(PtInRegion)}
function PtInRegion(RGN: HRGN; X, Y: Integer): Boolean;
begin
  Result := LCLIntf.PtInRegion(RGN, X, Y);
end;

{$endif}
{$if declared(RealizePalette)}
function RealizePalette(DC: HDC): Cardinal;
begin
  Result := LCLIntf.RealizePalette(DC);
end;

{$endif}
{$if declared(Rectangle)}
function Rectangle(DC: HDC; X1, Y1, X2, Y2: Integer): Boolean;
begin
  Result := LCLIntf.Rectangle(DC, X1, Y1, X2, Y2);
end;

{$endif}
{$if declared(RectInRegion)}
function RectInRegion(RGN: HRGN; ARect: TRect): Boolean;
begin
  Result := LCLIntf.RectInRegion(RGN, ARect);
end;

{$endif}
{$if declared(RectVisible)}
function RectVisible(DC: HDC; const ARect: TRect): Boolean;
begin
  Result := LCLIntf.RectVisible(DC, ARect);
end;

{$endif}
{$if declared(RedrawWindow)}
function RedrawWindow(Wnd: HWND; lprcUpdate: PRECT; hrgnUpdate: HRGN; flags: UINT): Boolean;
begin
  Result := LCLIntf.RedrawWindow(Wnd, lprcUpdate, hrgnUpdate, flags);
end;

{$endif}
{$if declared(ReleaseCapture)}
function ReleaseCapture : Boolean;
begin
  Result := LCLIntf.ReleaseCapture;
end;

{$endif}
{$if declared(ReleaseDC)}
function ReleaseDC(hWnd: HWND; DC: HDC): Integer;
begin
  Result := LCLIntf.ReleaseDC(hWnd, DC);
end;

{$endif}
{$if declared(RemoveProp)}
function RemoveProp(Handle: HWND; Str: PChar): TLCLHandle;
begin
  Result := LCLIntf.RemoveProp(Handle, Str);
end;

{$endif}
{$if declared(RestoreDC)}
function RestoreDC(DC: HDC; SavedDC: Integer): Boolean;
begin
  Result := LCLIntf.RestoreDC(DC, SavedDC);
end;

{$endif}
{$if declared(RoundRect)}
function RoundRect(DC : hDC; X1, Y1, X2, Y2: Integer; RX,RY : Integer): Boolean;
begin
  Result := LCLIntf.RoundRect(DC, X1, Y1, X2, Y2, RX, RY);
end;

{$endif}
{$if declared(SaveDC)}
function SaveDC(DC: HDC): Integer;
begin
  Result := LCLIntf.SaveDC(DC);
end;

{$endif}
{$if declared(ScreenToClient)}
function ScreenToClient(Handle : HWND; var P : TPoint) : Integer;
begin
  Result := LCLIntf.ScreenToClient(Handle, P);
end;

{$endif}
{$if declared(ScrollWindowEx)}
function ScrollWindowEx(hWnd: HWND; dx, dy: Integer; prcScroll, prcClip: PRect; hrgnUpdate: HRGN; prcUpdate: PRect; flags: UINT): Boolean;
begin
  Result := LCLIntf.ScrollWindowEx(hWnd, dx, dy, prcScroll, prcClip, hrgnUpdate, prcUpdate, flags);
end;

{$endif}
{$if declared(SelectClipRGN)}
function SelectClipRGN(DC : hDC; RGN : HRGN) : Longint;
begin
  Result := LCLIntf.SelectClipRGN(DC, RGN);
end;

{$endif}
{$if declared(SelectObject)}
function SelectObject(DC: HDC; GDIObj: HGDIOBJ): HGDIOBJ;
begin
  Result := LCLIntf.SelectObject(DC, GDIObj);
end;

{$endif}
{$if declared(SelectPalette)}
function SelectPalette(DC: HDC; Palette: HPALETTE; ForceBackground: Boolean): HPALETTE;
begin
  Result := LCLIntf.SelectPalette(DC, Palette, ForceBackground);
end;

{$endif}
{$if declared(SendMessage)}
function SendMessage(HandleWnd: HWND; Msg: Cardinal; WParam: WParam; LParam: LParam): LResult;
begin
  Result := LCLIntf.SendMessage(HandleWnd, Msg, WParam, LParam);
end;

{$endif}
{$if declared(SetActiveWindow)}
function SetActiveWindow(Handle: HWND): HWND;
begin
  Result := LCLIntf.SetActiveWindow(Handle);
end;

{$endif}
{$if declared(SetBkColor)}
function SetBkColor(DC: HDC; Color: TColorRef): TColorRef;
begin
  Result := LCLIntf.SetBkColor(DC, Color);
end;

{$endif}
{$if declared(SetBkMode)}
function SetBkMode(DC: HDC; bkMode : Integer): Integer;
begin
  Result := LCLIntf.SetBkMode(DC, bkMode);
end;

{$endif}
{$if declared(SetCapture)}
function SetCapture (AHandle: HWND): HWND;
begin
  Result := LCLIntf.SetCapture(AHandle);
end;

{$endif}
{$if declared(SetCaretPos)}
function SetCaretPos(X, Y: Integer): Boolean;
begin
  Result := LCLIntf.SetCaretPos(X, Y);
end;

{$endif}
{$if declared(SetCaretPosEx)}
function SetCaretPosEx(handle: HWnd; X, Y: Integer): Boolean;
begin
  Result := LCLIntf.SetCaretPosEx(handle, X, Y);
end;

{$endif}
{$if declared(SetCursor)}
function SetCursor(hCursor: HICON): HCURSOR;
begin
  Result := LCLIntf.SetCursor(hCursor);
end;

{$endif}
{$if declared(SetCursorPos)}
function SetCursorPos(X, Y: Integer): Boolean;
begin
  Result := LCLIntf.SetCursorPos(X, Y);
end;

{$endif}
{$if declared(SetFocus)}
function SetFocus(hWnd: HWND): HWND;
begin
  Result := LCLIntf.SetFocus(hWnd);
end;

{$endif}
{$if declared(SetForegroundWindow)}
function SetForegroundWindow(hWnd : HWND): Boolean;
begin
  Result := LCLIntf.SetForegroundWindow(hWnd);
end;

{$endif}
{$if declared(SetMapMode)}
function SetMapMode(DC: HDC; fnMapMode : Integer): Integer;
begin
  Result := LCLIntf.SetMapMode(DC, fnMapMode);
end;

{$endif}
{$if declared(SetMenu)}
function SetMenu(AWindowHandle: HWND; AMenuHandle: HMENU): Boolean;
begin
  Result := LCLIntf.SetMenu(AWindowHandle, AMenuHandle);
end;

{$endif}
{$if declared(SetParent)}
function SetParent(hWndChild: HWND; hWndParent: HWND): HWND;
begin
  Result := LCLIntf.SetParent(hWndChild, hWndParent);
end;

{$endif}
{$if declared(SetProp)}
function SetProp(Handle: hwnd; Str : PChar; Data : Pointer) : Boolean;
begin
  Result := LCLIntf.SetProp(Handle, Str, Data);
end;

{$endif}
{$if declared(SetRectRgn)}
function SetRectRgn(aRGN: HRGN; X1, Y1, X2, Y2 : Integer): Boolean;
begin
  Result := LCLIntf.SetRectRgn(aRGN, X1, Y1, X2, Y2);
end;

{$endif}
{$if declared(SetROP2)}
function SetROP2(DC: HDC; Mode: Integer): Integer;
begin
  Result := LCLIntf.SetROP2(DC, Mode);
end;

{$endif}
{$if declared(SetScrollInfo)}
function SetScrollInfo(Handle: HWND; SBStyle: Integer; ScrollInfo: TScrollInfo; Redraw : Boolean): Integer;
begin
  Result := LCLIntf.SetScrollInfo(Handle, SBStyle, ScrollInfo, Redraw);
end;

{$endif}
{$if declared(SetStretchBltMode)}
function SetStretchBltMode(DC: HDC; StretchMode: Integer): Integer;
begin
  Result := LCLIntf.SetStretchBltMode(DC, StretchMode);
end;

{$endif}
{$if declared(SetSysColors)}
function SetSysColors(cElements: Integer; const lpaElements; const lpaRgbValues): Boolean;
begin
  Result := LCLIntf.SetSysColors(cElements, lpaElements, lpaRgbValues);
end;

{$endif}
{$if declared(SetTextCharacterExtra)}
function SetTextCharacterExtra(_hdc : hdc; nCharExtra : Integer):Integer;
begin
  Result := LCLIntf.SetTextCharacterExtra(_hdc, nCharExtra);
end;

{$endif}
{$if declared(SetTextColor)}
function SetTextColor(DC: HDC; Color: TColorRef): TColorRef;
begin
  Result := LCLIntf.SetTextColor(DC, Color);
end;

{$endif}
{$if declared(SetWindowLong)}
function SetWindowLong(Handle: HWND; Idx: Integer; NewLong : PtrInt): PtrInt;
begin
  Result := LCLIntf.SetWindowLong(Handle, Idx, NewLong);
end;

{$endif}
{$if declared(SetViewPortExtEx)}
function SetViewPortExtEx(DC: HDC; XExtent, YExtent : Integer; OldSize: PSize): Boolean;
begin
  Result := LCLIntf.SetViewPortExtEx(DC, XExtent, YExtent, OldSize);
end;

{$endif}
{$if declared(SetViewPortOrgEx)}
function SetViewPortOrgEx(DC: HDC; NewX, NewY: Integer; OldPoint: PPoint): Boolean;
begin
  Result := LCLIntf.SetViewPortOrgEx(DC, NewX, NewY, OldPoint);
end;

{$endif}
{$if declared(SetWindowExtEx)}
function SetWindowExtEx(DC: HDC; XExtent, YExtent: Integer; OldSize: PSize): Boolean;
begin
  Result := LCLIntf.SetWindowExtEx(DC, XExtent, YExtent, OldSize);
end;

{$endif}
{$if declared(SetWindowOrgEx)}
function SetWindowOrgEx(dc : hdc; NewX, NewY: Integer; OldPoint: PPoint): Boolean;
begin
  Result := LCLIntf.SetWindowOrgEx(dc, NewX, NewY, OldPoint);
end;

{$endif}
{$if declared(SetWindowPos)}
function SetWindowPos(hWnd: HWND; hWndInsertAfter: HWND; X, Y, cx, cy: Integer; uFlags: UINT): Boolean;
begin
  Result := LCLIntf.SetWindowPos(hWnd, hWndInsertAfter, X, Y, cx, cy, uFlags);
end;

{$endif}
{$if declared(SetWindowRgn)}
function SetWindowRgn(hWnd: HWND; hRgn: HRGN; bRedraw: Boolean): longint;
begin
  Result := LCLIntf.SetWindowRgn(hWnd, hRgn, bRedraw);
end;

{$endif}
{$if declared(ShowCaret)}
function ShowCaret(hWnd: HWND): Boolean;
begin
  Result := LCLIntf.ShowCaret(hWnd);
end;

{$endif}
{$if declared(ShowScrollBar)}
function ShowScrollBar(Handle: HWND; wBar: Integer; bShow: Boolean): Boolean;
begin
  Result := LCLIntf.ShowScrollBar(Handle, wBar, bShow);
end;

{$endif}
{$if declared(ShowWindow)}
function ShowWindow(hWnd: HWND; nCmdShow: Integer): Boolean;
begin
  Result := LCLIntf.ShowWindow(hWnd, nCmdShow);
end;

{$endif}
{$if declared(StretchBlt)}
function StretchBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc, SrcWidth, SrcHeight: Integer; Rop: Cardinal): Boolean;
begin
  Result := LCLIntf.StretchBlt(DestDC, X, Y, Width, Height, SrcDC, XSrc, YSrc, SrcWidth, SrcHeight, Rop);
end;

{$endif}
{$if declared(StretchDIBits)}
function StretchDIBits(DC: HDC; DestX, DestY, DestWidth, DestHeight, SrcX, SrcY, SrcWidth, SrcHeight: Integer; Bits: Pointer; var BitsInfo: TBitmapInfo; Usage: UINT; Rop: DWORD): Integer;
begin
  Result := LCLIntf.StretchDIBits(DC, DestX, DestY, DestWidth, DestHeight, SrcX, SrcY, SrcWidth, SrcHeight, Bits, BitsInfo, Usage, Rop);
end;

{$endif}
{$if declared(SystemParametersInfo)}
function SystemParametersInfo(uiAction: DWord; uiParam: DWord; pvParam: Pointer; fWinIni: DWord): LongBool;
begin
  Result := LCLIntf.SystemParametersInfo(uiAction, uiParam, pvParam, fWinIni);
end;

{$endif}
{$if declared(TextOut)}
function TextOut(DC: HDC; X,Y : Integer; Str : Pchar; Count: Integer) : Boolean;
begin
  Result := LCLIntf.TextOut(DC, X, Y, Str, Count);
end;

{$endif}
{$if declared(UpdateWindow)}
function UpdateWindow(Handle: HWND): Boolean;
begin
  Result := LCLIntf.UpdateWindow(Handle);
end;

{$endif}
{$if declared(WindowFromPoint)}
function WindowFromPoint(Point : TPoint) : HWND;
begin
  Result := LCLIntf.WindowFromPoint(Point);
end;

{$endif}
{$if declared(AdjustWindowRectEx)}
function AdjustWindowRectEx(Var Rect: TRect; Style1: Word; MenuExist : Boolean; Style2 : Word) : Boolean;
begin
  Result := LCLIntf.AdjustWindowRectEx(Rect, Style1, MenuExist, Style2);
end;

{$endif}
{$if declared(CharLower)}
function CharLower(c: char): char;
begin
  Result := LCLIntf.CharLower(c);
end;

{$endif}
{$if declared(CharLowerBuff)}
function CharLowerBuff(pStr : PChar; Len : Integer): Integer;
begin
  Result := LCLIntf.CharLowerBuff(pStr, Len);
end;

{$endif}
{$if declared(CharUpper)}
function CharUpper(c: char): char;
begin
  Result := LCLIntf.CharUpper(c);
end;

{$endif}
{$if declared(CharUpperBuff)}
function CharUpperBuff(pStr : PChar; Len : Integer): Integer;
begin
  Result := LCLIntf.CharUpperBuff(pStr, Len);
end;

{$endif}
{$if declared(CopyRect)}
function CopyRect(var DestRect: TRect; const SrcRect: TRect): Boolean;
begin
  Result := LCLIntf.CopyRect(DestRect, SrcRect);
end;

{$endif}
{$if declared(CreateEllipticRgnIndirect)}
function CreateEllipticRgnIndirect(const ARect: TRect): HRGN;
begin
  Result := LCLIntf.CreateEllipticRgnIndirect(ARect);
end;

{$endif}
{$if declared(CreateFont)}
function CreateFont(Height, Width, Escapement, Orientation, Weight: Integer; Italic, Underline, StrikeOut, CharSet, OutputPrecision, ClipPrecision, Quality, PitchAndFamily: Byte; FaceName: PChar): HFONT;
begin
  Result := LCLIntf.CreateFont(Height, Width, Escapement, Orientation, Weight, Italic, Underline, StrikeOut, CharSet, OutputPrecision, ClipPrecision, Quality, PitchAndFamily, FaceName);
end;

{$endif}
{$if declared(CreatePen)}
function CreatePen(Style, Width: Integer; Color: TColorRef): HPEN;
begin
  Result := LCLIntf.CreatePen(Style, Width, Color);
end;

{$endif}
{$if declared(CreateRectRgnIndirect)}
function CreateRectRgnIndirect(const ARect: TRect): HRGN;
begin
  Result := LCLIntf.CreateRectRgnIndirect(ARect);
end;

{$endif}
{$if declared(CreateSolidBrush)}
function CreateSolidBrush(Color: TColorRef): HBRUSH;
begin
  Result := LCLIntf.CreateSolidBrush(Color);
end;

{$endif}
{$if declared(EqualRect)}
function EqualRect(const lprc1, lprc2: TRect): Boolean;
begin
  Result := LCLIntf.EqualRect(lprc1, lprc2);
end;

{$endif}
{$if declared(GetScrollPos)}
function GetScrollPos(Handle: HWND; nBar: Integer): Integer;
begin
  Result := LCLIntf.GetScrollPos(Handle, nBar);
end;

{$endif}
{$if declared(GetScrollRange)}
function GetScrollRange(Handle: HWND; nBar: Integer; var lpMinPos, lpMaxPos: Integer): Boolean;
begin
  Result := LCLIntf.GetScrollRange(Handle, nBar, lpMinPos, lpMaxPos);
end;

{$endif}
{$if declared(GetRValue)}
function GetRValue(RGB : DWORD) : BYTE;
begin
  Result := LCLIntf.GetRValue(RGB);
end;

{$endif}
{$if declared(GetGValue)}
function GetGValue(RGB : DWORD) : BYTE;
begin
  Result := LCLIntf.GetGValue(RGB);
end;

{$endif}
{$if declared(GetBValue)}
function GetBValue(RGB : DWORD) : BYTE;
begin
  Result := LCLIntf.GetBValue(RGB);
end;

{$endif}
{$if declared(GetRGBValues)}
procedure GetRGBValues(RGB : DWORD; out R, G, B: Byte);
begin
  LCLIntf.GetRGBValues(RGB, R, G, B);
end;

{$endif}
{$if declared(GetRGBIntValues)}
procedure GetRGBIntValues(RGB : DWORD; out R, G, B: integer);
begin
  LCLIntf.GetRGBIntValues(RGB, R, G, B);
end;

{$endif}
{$if declared(IndexToOverlayMask)}
function IndexToOverlayMask(iOverlay: UINT): UINT;
begin
  Result := LCLIntf.IndexToOverlayMask(iOverlay);
end;

{$endif}
{$if declared(InflateRect)}
function InflateRect(var ARect: TRect; dx, dy: Integer): Boolean;
begin
  Result := LCLIntf.InflateRect(ARect, dx, dy);
end;

{$endif}
{$if declared(IntersectRect)}
function IntersectRect(var DestRect: TRect; const SrcRect1, SrcRect2: TRect): Boolean;
begin
  Result := LCLIntf.IntersectRect(DestRect, SrcRect1, SrcRect2);
end;

{$endif}
{$if declared(IsCharAlphaNumeric)}
function IsCharAlphaNumeric(c : Char) : Boolean;
begin
  Result := LCLIntf.IsCharAlphaNumeric(c);
end;

{$endif}
{$if declared(IsRectEmpty)}
function IsRectEmpty(const ARect: TRect): Boolean;
begin
  Result := LCLIntf.IsRectEmpty(ARect);
end;

{$endif}
{$if declared(KillTimer)}
function KillTimer(Wnd: HWND; uIDEvent: UINT_PTR): BOOL;
begin
  Result := LCLIntf.KillTimer(Wnd, uIDEvent);
end;

{$endif}
{$if declared(MakeLong)}
function MakeLong(A,B: Word): DWORD;
begin
  Result := LCLIntf.MakeLong(A, B);
end;

{$endif}
{$if declared(MakeROP4)}
function MakeROP4(fore, back: DWORD): DWORD;
begin
  Result := LCLIntf.MakeROP4(fore, back);
end;

{$endif}
{$if declared(MakeWord)}
function MakeWord(A,B: Byte): Word;
begin
  Result := LCLIntf.MakeWord(A, B);
end;

{$endif}
{$if declared(MakeWParam)}
function MakeWParam(l, h: Word): WPARAM;
begin
  Result := LCLIntf.MakeWParam(l, h);
end;

{$endif}
{$if declared(MakeLParam)}
function MakeLParam(l, h: Word): LPARAM;
begin
  Result := LCLIntf.MakeLParam(l, h);
end;

{$endif}
{$if declared(MakeLResult)}
function MakeLResult(l, h: Word): LRESULT;
begin
  Result := LCLIntf.MakeLResult(l, h);
end;

{$endif}
{$if declared(LParamExtractLoHiWord)}
procedure LParamExtractLoHiWord(const aParam: LPARAM; out LoWord, HiWord: Word);
begin
  LCLIntf.LParamExtractLoHiWord(aParam, LoWord, HiWord);
end;

{$endif}
{$if declared(LParamHiWord)}
function LParamHiWord(const aParam: LPARAM): Word;
begin
  Result := LCLIntf.LParamHiWord(aParam);
end;

{$endif}
{$if declared(LParamLoWord)}
function LParamLoWord(const aParam: LPARAM): Word;
begin
  Result := LCLIntf.LParamLoWord(aParam);
end;

{$endif}
{$if declared(PtInRect)}
function PtInRect(const Rect : TRect; const Point : TPoint) : Boolean;
begin
  Result := LCLIntf.PtInRect(Rect, Point);
end;

{$endif}
{$if declared(PointToSmallPoint)}
function PointToSmallPoint(const P : TPoint) : TSmallPoint;
begin
  Result := LCLIntf.PointToSmallPoint(P);
end;

{$endif}
{$if declared(PointToSmallPointNoChecks)}
function PointToSmallPointNoChecks(const P : TPoint) : TSmallPoint;
begin
  Result := LCLIntf.PointToSmallPointNoChecks(P);
end;

{$endif}
{$if declared(RGB)}
function RGB(R, G, B : Byte) : TColorRef;
begin
  Result := LCLIntf.RGB(R, G, B);
end;

{$endif}
{$if declared(ScrollWindow)}
function ScrollWindow(hWnd: HWND; XAmount, YAmount: Integer; Rect, ClipRect: PRect): Boolean;
begin
  Result := LCLIntf.ScrollWindow(hWnd, XAmount, YAmount, Rect, ClipRect);
end;

{$endif}
{$if declared(SetRect)}
function SetRect(var ARect : TRect; aLeft,aTop,aRight,aBottom : Integer) : Boolean;
begin
  Result := LCLIntf.SetRect(ARect, aLeft, aTop, aRight, aBottom);
end;

{$endif}
{$if declared(SetRectEmpty)}
function SetRectEmpty(var ARect: TRect): Boolean;
begin
  Result := LCLIntf.SetRectEmpty(ARect);
end;

{$endif}
{$if declared(SetScrollPos)}
function SetScrollPos(Handle: HWND; nBar, nPos: Integer; bRedraw: Boolean): Integer;
begin
  Result := LCLIntf.SetScrollPos(Handle, nBar, nPos, bRedraw);
end;

{$endif}
{$if declared(SetScrollRange)}
function SetScrollRange(Handle: HWND; nBar, nMinPos, nMaxPos: Integer; bRedraw: Boolean): Boolean;
begin
  Result := LCLIntf.SetScrollRange(Handle, nBar, nMinPos, nMaxPos, bRedraw);
end;

{$endif}
{$if declared(SetTimer)}
function SetTimer(Wnd: HWND; nIDEvent: UINT_PTR; uElapse: UINT; lpTimerFunc: TTimerProc): UINT_PTR;
begin
  Result := LCLIntf.SetTimer(Wnd, nIDEvent, uElapse, lpTimerFunc);
end;

{$endif}
{$if declared(SmallPointToPoint)}
function SmallPointToPoint(const P : TSmallPoint) : Tpoint;
begin
  Result := LCLIntf.SmallPointToPoint(P);
end;

{$endif}
{$if declared(SubtractRect)}
function SubtractRect(out lprcDst: TRect; const lprcSrc1, lprcSrc2: TRect): Boolean;
begin
  Result := LCLIntf.SubtractRect(lprcDst, lprcSrc1, lprcSrc2);
end;

{$endif}
{$if declared(UnionRect)}
function UnionRect(var DestRect: TRect; const SrcRect1, SrcRect2: TRect): Boolean;
begin
  Result := LCLIntf.UnionRect(DestRect, SrcRect1, SrcRect2);
end;

{$endif}
{$if declared(AddEventHandler)}
function AddEventHandler(AHandle: TLCLHandle; AFlags: dword; AEventHandler: TWaitHandleEvent; AData: PtrInt): PEventHandler;
begin
  Result := LCLIntf.AddEventHandler(AHandle, AFlags, AEventHandler, AData);
end;

{$endif}
{$if declared(AddProcessEventHandler)}
function AddProcessEventHandler(AHandle: TLCLHandle; AEventHandler: TChildExitEvent; AData: PtrInt): PProcessEventHandler;
begin
  Result := LCLIntf.AddProcessEventHandler(AHandle, AEventHandler, AData);
end;

{$endif}
{$if declared(AddPipeEventHandler)}
function AddPipeEventHandler(AHandle: TLCLHandle; AEventHandler: TPipeEvent; AData: PtrInt): PPipeEventHandler;
begin
  Result := LCLIntf.AddPipeEventHandler(AHandle, AEventHandler, AData);
end;

{$endif}
{$if declared(AllocateHWnd)}
function AllocateHWnd(Method: TLCLWndMethod): HWND;
begin
  Result := LCLIntf.AllocateHWnd(Method);
end;

{$endif}
{$if declared(AskUser)}
function AskUser(const DialogCaption, DialogMessage: string; DialogType: LongInt; Buttons: TDialogButtons; HelpCtx: Longint): LongInt;
begin
  Result := LCLIntf.AskUser(DialogCaption, DialogMessage, DialogType, Buttons, HelpCtx);
end;

{$endif}
{$if declared(CallDefaultWndHandler)}
procedure CallDefaultWndHandler(Sender: TObject; var Message);
begin
  LCLIntf.CallDefaultWndHandler(Sender, Message);
end;

{$endif}
{$if declared(ClipboardFormatToMimeType)}
function ClipboardFormatToMimeType(FormatID: TClipboardFormat): string;
begin
  Result := LCLIntf.ClipboardFormatToMimeType(FormatID);
end;

{$endif}
{$if declared(ClipboardGetData)}
function ClipboardGetData(ClipboardType: TClipboardType; FormatID: TClipboardFormat; Stream: TStream): boolean;
begin
  Result := LCLIntf.ClipboardGetData(ClipboardType, FormatID, Stream);
end;

{$endif}
{$if declared(ClipboardGetFormats)}
function ClipboardGetFormats(ClipboardType: TClipboardType; var Count: integer; var List: PClipboardFormat): boolean;
begin
  Result := LCLIntf.ClipboardGetFormats(ClipboardType, Count, List);
end;

{$endif}
{$if declared(ClipboardGetOwnerShip)}
function ClipboardGetOwnerShip(ClipboardType: TClipboardType; OnRequestProc: TClipboardRequestEvent; FormatCount: integer; Formats: PClipboardFormat): boolean;
begin
  Result := LCLIntf.ClipboardGetOwnerShip(ClipboardType, OnRequestProc, FormatCount, Formats);
end;

{$endif}
{$if declared(ClipboardRegisterFormat)}
function ClipboardRegisterFormat(const AMimeType: string): TClipboardFormat;
begin
  Result := LCLIntf.ClipboardRegisterFormat(AMimeType);
end;

{$endif}
{$if declared(ClipboardFormatNeedsNullByte)}
function ClipboardFormatNeedsNullByte(const AFormat: TPredefinedClipboardFormat): Boolean;
begin
  Result := LCLIntf.ClipboardFormatNeedsNullByte(AFormat);
end;

{$endif}
{$if declared(CreateEmptyRegion)}
function CreateEmptyRegion: hRGN;
begin
  Result := LCLIntf.CreateEmptyRegion;
end;

{$endif}
{$if declared(CreatePixmapIndirect)}
function CreatePixmapIndirect(const Data: Pointer; const TransColor: Longint): HBITMAP;
begin
  Result := LCLIntf.CreatePixmapIndirect(Data, TransColor);
end;

{$endif}
{$if declared(CreateRegionCopy)}
function CreateRegionCopy(SrcRGN: hRGN): hRGN;
begin
  Result := LCLIntf.CreateRegionCopy(SrcRGN);
end;

{$endif}
{$if declared(CreateRubberBand)}
function CreateRubberBand(const ARect: TRect; const ABrush: HBrush = 0): HWND;
begin
  Result := LCLIntf.CreateRubberBand(ARect, ABrush);
end;

{$endif}
{$if declared(CreateStandardCursor)}
function CreateStandardCursor(ACursor: SmallInt): hCursor;
begin
  Result := LCLIntf.CreateStandardCursor(ACursor);
end;

{$endif}
{$if declared(DCClipRegionValid)}
function DCClipRegionValid(DC: HDC): boolean;
begin
  Result := LCLIntf.DCClipRegionValid(DC);
end;

{$endif}
{$if declared(DeallocateHWnd)}
procedure DeallocateHWnd(Wnd: HWND);
begin
  LCLIntf.DeallocateHWnd(Wnd);
end;

{$endif}
{$if declared(DestroyRubberBand)}
procedure DestroyRubberBand(ARubberBand: HWND);
begin
  LCLIntf.DestroyRubberBand(ARubberBand);
end;

{$endif}
{$if declared(DrawDefaultDockImage)}
procedure DrawDefaultDockImage(AOldRect, ANewRect: TRect; AOperation: TDockImageOperation);
begin
  LCLIntf.DrawDefaultDockImage(AOldRect, ANewRect, AOperation);
end;

{$endif}
{$if declared(DrawGrid)}
procedure DrawGrid(DC: HDC; const R: TRect; DX, DY: Integer);
begin
  LCLIntf.DrawGrid(DC, R, DX, DY);
end;

{$endif}
{$if declared(ExtUTF8Out)}
function ExtUTF8Out(DC: HDC; X, Y: Integer; Options: Longint; Rect: PRect; Str: PChar; Count: Longint; Dx: PInteger): Boolean;
begin
  Result := LCLIntf.ExtUTF8Out(DC, X, Y, Options, Rect, Str, Count, Dx);
end;

{$endif}
{$if declared(FontIsMonoSpace)}
function FontIsMonoSpace(Font: HFont): boolean;
begin
  Result := LCLIntf.FontIsMonoSpace(Font);
end;

{$endif}
{$if declared(Frame3d)}
function Frame3d(DC: HDC; var ARect: TRect; const FrameWidth : integer; const Style : TGraphicsBevelCut): Boolean;
begin
  Result := LCLIntf.Frame3d(DC, ARect, FrameWidth, Style);
end;

{$endif}
{$if declared(GetAcceleratorString)}
function GetAcceleratorString(const AVKey: Byte; const AShiftState: TShiftState): String;
begin
  Result := LCLIntf.GetAcceleratorString(AVKey, AShiftState);
end;

{$endif}
{$if declared(GetAvailableNativeCanvasTypes)}
function GetAvailableNativeCanvasTypes(DC: HDC; AAllowFallbackToParent: Boolean = False): TNativeCanvasTypes;
begin
  Result := LCLIntf.GetAvailableNativeCanvasTypes(DC, AAllowFallbackToParent);
end;

{$endif}
{$if declared(GetAvailableNativeHandleTypes)}
function GetAvailableNativeHandleTypes(Handle: HWND; AAllowFallbackToParent: Boolean = False): TNativeHandleTypes;
begin
  Result := LCLIntf.GetAvailableNativeHandleTypes(Handle, AAllowFallbackToParent);
end;

{$endif}
{$if declared(GetCaretRespondToFocus)}
function GetCaretRespondToFocus(handle: HWND; var ShowHideOnFocus: boolean): Boolean;
begin
  Result := LCLIntf.GetCaretRespondToFocus(handle, ShowHideOnFocus);
end;

{$endif}
{$if declared(GetClientBounds)}
function GetClientBounds(handle : HWND; var ARect: TRect) : Boolean;
begin
  Result := LCLIntf.GetClientBounds(handle, ARect);
end;

{$endif}
{$if declared(GetCmdLineParamDescForInterface)}
function GetCmdLineParamDescForInterface: TStringList;
begin
  Result := LCLIntf.GetCmdLineParamDescForInterface;
end;

{$endif}
{$if declared(GetControlConstraints)}
function GetControlConstraints(Constraints: TObject): boolean;
begin
  Result := LCLIntf.GetControlConstraints(Constraints);
end;

{$endif}
{$if declared(GetDCOpacity)}
function GetDCOpacity(DC: HDC): Byte;
begin
  Result := LCLIntf.GetDCOpacity(DC);
end;

{$endif}
{$if declared(GetDCOriginRelativeToWindow)}
function GetDCOriginRelativeToWindow(PaintDC: HDC; WindowHandle: HWND; var OriginDiff: TPoint): boolean;
begin
  Result := LCLIntf.GetDCOriginRelativeToWindow(PaintDC, WindowHandle, OriginDiff);
end;

{$endif}
{$if declared(GetDesignerDC)}
function GetDesignerDC(WindowHandle: HWND): HDC;
begin
  Result := LCLIntf.GetDesignerDC(WindowHandle);
end;

{$endif}
{$if declared(GetDeviceSize)}
function GetDeviceSize(DC: HDC; var p: TPoint): boolean;
begin
  Result := LCLIntf.GetDeviceSize(DC, p);
end;

{$endif}
{$if declared(GetLCLOwnerObject)}
function GetLCLOwnerObject(Handle: HWnd): TObject;
begin
  Result := LCLIntf.GetLCLOwnerObject(Handle);
end;

{$endif}
{$if declared(GetNativeCanvas)}
function GetNativeCanvas(DC: HDC; AHandleType: TNativeCanvasType; AAllowFallbackToParent: Boolean = False): PtrInt;
begin
  Result := LCLIntf.GetNativeCanvas(DC, AHandleType, AAllowFallbackToParent);
end;

{$endif}
{$if declared(GetNativeHandle)}
function GetNativeHandle(Handle: HWND; AHandleType: TNativeHandleType; AAllowFallbackToParent: Boolean = False): PtrInt;
begin
  Result := LCLIntf.GetNativeHandle(Handle, AHandleType, AAllowFallbackToParent);
end;

{$endif}
{$if declared(GetScrollBarSize)}
function GetScrollBarSize(Handle: HWND; SBStyle: Integer): integer;
begin
  Result := LCLIntf.GetScrollBarSize(Handle, SBStyle);
end;

{$endif}
{$if declared(GetScrollbarVisible)}
function GetScrollbarVisible(Handle: HWND; SBStyle: Integer): boolean;
begin
  Result := LCLIntf.GetScrollbarVisible(Handle, SBStyle);
end;

{$endif}
{$if declared(GetWindowRelativePosition)}
function GetWindowRelativePosition(Handle : hwnd; var Left, Top: integer): boolean;
begin
  Result := LCLIntf.GetWindowRelativePosition(Handle, Left, Top);
end;

{$endif}
{$if declared(InvalidateFrame)}
function InvalidateFrame(aHandle : HWND; ARect : pRect; bErase : Boolean; BorderWidth: integer) : Boolean;
begin
  Result := LCLIntf.InvalidateFrame(aHandle, ARect, bErase, BorderWidth);
end;

{$endif}
{$if declared(IsDesignerDC)}
function IsDesignerDC(WindowHandle: HWND; DC: HDC): Boolean;
begin
  Result := LCLIntf.IsDesignerDC(WindowHandle, DC);
end;

{$endif}
{$if declared(IsMobilePlatform)}
function IsMobilePlatform: Boolean;
begin
  Result := LCLIntf.IsMobilePlatform;
end;

{$endif}
{$if declared(IsCDIntfControl)}
function IsCDIntfControl(AWinControl: TObject): Boolean;
begin
  Result := LCLIntf.IsCDIntfControl(AWinControl);
end;

{$endif}
{$if declared(MoveWindowOrgEx)}
function MoveWindowOrgEx(dc : hdc; dX,dY : Integer): boolean;
begin
  Result := LCLIntf.MoveWindowOrgEx(dc, dX, dY);
end;

{$endif}
{$if declared(PromptUser)}
function PromptUser(const DialogCaption, DialogMessage : String; DialogType : longint; Buttons : PLongint; ButtonCount, DefaultIndex, EscapeResult : Longint) : Longint;
begin
  Result := LCLIntf.PromptUser(DialogCaption, DialogMessage, DialogType, Buttons, ButtonCount, DefaultIndex, EscapeResult);
end;

{$endif}
{$if declared(PromptUserAtXY)}
function PromptUserAtXY(const DialogCaption, DialogMessage : String; DialogType : longint; Buttons : PLongint; ButtonCount, DefaultIndex, EscapeResult : Longint; X, Y : Longint) : Longint;
begin
  Result := LCLIntf.PromptUserAtXY(DialogCaption, DialogMessage, DialogType, Buttons, ButtonCount, DefaultIndex, EscapeResult, X, Y);
end;

{$endif}
{$if declared(RadialArc)}
function RadialArc(DC: HDC; left, top, right, bottom, sx, sy, ex, ey : Integer): Boolean;
begin
  Result := LCLIntf.RadialArc(DC, left, top, right, bottom, sx, sy, ex, ey);
end;

{$endif}
{$if declared(RadialChord)}
function RadialChord(DC: HDC; x1, y1, x2, y2, sx, sy, ex, ey : Integer): Boolean;
begin
  Result := LCLIntf.RadialChord(DC, x1, y1, x2, y2, sx, sy, ex, ey);
end;

{$endif}
{$if declared(RadialPie)}
function RadialPie(DC: HDC; x1, y1, x2, y2, Angle1, Angle2: Integer): Boolean;
begin
  Result := LCLIntf.RadialPie(DC, x1, y1, x2, y2, Angle1, Angle2);
end;

{$endif}
{$if declared(RawImage_CreateBitmaps)}
function RawImage_CreateBitmaps(const ARawImage: TRawImage; out ABitmap, AMask: HBitmap; ASkipMask: Boolean = False): Boolean;
begin
  Result := LCLIntf.RawImage_CreateBitmaps(ARawImage, ABitmap, AMask, ASkipMask);
end;

{$endif}
{$if declared(RawImage_DescriptionFromBitmap)}
function RawImage_DescriptionFromBitmap(ABitmap: HBITMAP; out ADesc: TRawImageDescription): Boolean;
begin
  Result := LCLIntf.RawImage_DescriptionFromBitmap(ABitmap, ADesc);
end;

{$endif}
{$if declared(RawImage_DescriptionFromDevice)}
function RawImage_DescriptionFromDevice(ADC: HDC; out ADesc: TRawImageDescription): Boolean;
begin
  Result := LCLIntf.RawImage_DescriptionFromDevice(ADC, ADesc);
end;

{$endif}
{$if declared(RawImage_FromBitmap)}
function RawImage_FromBitmap(out ARawImage: TRawImage; ABitmap, AMask: HBITMAP; ARect: PRect = nil): Boolean;
begin
  Result := LCLIntf.RawImage_FromBitmap(ARawImage, ABitmap, AMask, ARect);
end;

{$endif}
{$if declared(RawImage_FromDevice)}
function RawImage_FromDevice(out ARawImage: TRawImage; ADC: HDC; const ARect: TRect): Boolean;
begin
  Result := LCLIntf.RawImage_FromDevice(ARawImage, ADC, ARect);
end;

{$endif}
{$if declared(RawImage_QueryDescription)}
function RawImage_QueryDescription(AFlags: TRawImageQueryFlags; var ADesc: TRawImageDescription): Boolean;
begin
  Result := LCLIntf.RawImage_QueryDescription(AFlags, ADesc);
end;

{$endif}
{$if declared(RegroupMenuItem)}
function RegroupMenuItem(hndMenu: HMENU; GroupIndex: integer): Boolean;
begin
  Result := LCLIntf.RegroupMenuItem(hndMenu, GroupIndex);
end;

{$endif}
{$if declared(ReleaseDesignerDC)}
function ReleaseDesignerDC(hWnd: HWND; DC: HDC): Integer;
begin
  Result := LCLIntf.ReleaseDesignerDC(hWnd, DC);
end;

{$endif}
{$if declared(RemoveEventHandler)}
procedure RemoveEventHandler(var AHandler: PEventHandler);
begin
  LCLIntf.RemoveEventHandler(AHandler);
end;

{$endif}
{$if declared(RemoveProcessEventHandler)}
procedure RemoveProcessEventHandler(var AHandler: PProcessEventHandler);
begin
  LCLIntf.RemoveProcessEventHandler(AHandler);
end;

{$endif}
{$if declared(RemovePipeEventHandler)}
procedure RemovePipeEventHandler(var AHandler: PPipeEventHandler);
begin
  LCLIntf.RemovePipeEventHandler(AHandler);
end;

{$endif}
{$if declared(RequestInput)}
function RequestInput(const InputCaption, InputPrompt : String; MaskInput : Boolean; var Value : String) : Boolean;
begin
  Result := LCLIntf.RequestInput(InputCaption, InputPrompt, MaskInput, Value);
end;

{$endif}
{$if declared(SendCachedLCLMessages)}
procedure SendCachedLCLMessages;
begin
  LCLIntf.SendCachedLCLMessages;
end;

{$endif}
{$if declared(SetCanvasScaleFactor)}
procedure SetCanvasScaleFactor(DC: HDC; const AScaleFactor: double);
begin
  LCLIntf.SetCanvasScaleFactor(DC, AScaleFactor);
end;

{$endif}
{$if declared(SetCaretRespondToFocus)}
function SetCaretRespondToFocus(handle: HWND; ShowHideOnFocus: boolean): Boolean;
begin
  Result := LCLIntf.SetCaretRespondToFocus(handle, ShowHideOnFocus);
end;

{$endif}
{$if declared(SetComboMinDropDownSize)}
function SetComboMinDropDownSize(Handle: HWND; MinItemsWidth, MinItemsHeight, MinItemCount: integer): boolean;
begin
  Result := LCLIntf.SetComboMinDropDownSize(Handle, MinItemsWidth, MinItemsHeight, MinItemCount);
end;

{$endif}
{$if declared(SetDCOpacity)}
procedure SetDCOpacity(DC: HDC; AOpacity: Byte);
begin
  LCLIntf.SetDCOpacity(DC, AOpacity);
end;

{$endif}
{$if declared(SetEventHandlerFlags)}
procedure SetEventHandlerFlags(AHandler: PEventHandler; NewFlags: dword);
begin
  LCLIntf.SetEventHandlerFlags(AHandler, NewFlags);
end;

{$endif}
{$if declared(SetRubberBandRect)}
procedure SetRubberBandRect(const ARubberBand: HWND; const ARect: TRect);
begin
  LCLIntf.SetRubberBandRect(ARubberBand, ARect);
end;

{$endif}
{$if declared(ShowSelectItemDialog)}
function ShowSelectItemDialog(const AItems: TStrings; APos: TPoint): Boolean;
begin
  Result := LCLIntf.ShowSelectItemDialog(AItems, APos);
end;

{$endif}
{$if declared(StretchMaskBlt)}
function StretchMaskBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc, SrcWidth, SrcHeight: Integer; Mask: HBITMAP; XMask, YMask: Integer; Rop: DWORD): Boolean;
begin
  Result := LCLIntf.StretchMaskBlt(DestDC, X, Y, Width, Height, SrcDC, XSrc, YSrc, SrcWidth, SrcHeight, Mask, XMask, YMask, Rop);
end;

{$endif}
{$if declared(TextUTF8Out)}
function TextUTF8Out(DC: HDC; X, Y: Integer; Str: PChar; Count: Longint): Boolean;
begin
  Result := LCLIntf.TextUTF8Out(DC, X, Y, Str, Count);
end;

{$endif}
{$if declared(ExcludeClipRgn)}
function ExcludeClipRgn(dc: hdc; rgn : hrgn) : Integer;
begin
  Result := LCLIntf.ExcludeClipRgn(dc, rgn);
end;

{$endif}
{$if declared(PredefinedClipboardFormat)}
function PredefinedClipboardFormat(AFormat: TPredefinedClipboardFormat): TClipboardFormat;
begin
  Result := LCLIntf.PredefinedClipboardFormat(AFormat);
end;

{$endif}
{$if declared(MsgKeyDataToShiftState)}
function MsgKeyDataToShiftState(KeyData: PtrInt): TShiftState;
begin
  Result := LCLIntf.MsgKeyDataToShiftState(KeyData);
end;

{$endif}
{$if declared(GetTickCount)}
function GetTickCount: DWord;
begin
  Result := LCLIntf.GetTickCount;
end;

{$endif}
{$if declared(GetTickCount64)}
function GetTickCount64: QWord;
begin
  Result := LCLIntf.GetTickCount64;
end;

{$endif}
{$if declared(FindDefaultBrowser)}
function FindDefaultBrowser(out ABrowser, AParams: String): Boolean;
begin
  Result := LCLIntf.FindDefaultBrowser(ABrowser, AParams);
end;

{$endif}
{$if declared(OpenURL)}
function OpenURL(AURL: String): Boolean;
begin
  Result := LCLIntf.OpenURL(AURL);
end;

{$endif}
{$if declared(OpenDocument)}
function OpenDocument(APath: String): Boolean;
begin
  Result := LCLIntf.OpenDocument(APath);
end;

{$endif}
{$if declared(SelectInFolder)}
function SelectInFolder(AFullPath: String): Boolean;
begin
  Result := LCLIntf.SelectInFolder(AFullPath);
end;

{$endif}
end.
