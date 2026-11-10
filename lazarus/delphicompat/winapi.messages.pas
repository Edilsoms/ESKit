{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Winapi.Messages
  Gerado por tools/genvclcompat.py a partir de LMessages.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Winapi.Messages;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  LMessages;
type
{$if declared(TLMDrawItems)}
  TLMDrawItems = LMessages.TLMDrawItems;
{$endif}
{$if declared(TLMDrawListItem)}
  TLMDrawListItem = LMessages.TLMDrawListItem;
{$endif}
{$if declared(TLMMeasureItem)}
  TLMMeasureItem = LMessages.TLMMeasureItem;
{$endif}
{$if declared(TLMNoParams)}
  TLMNoParams = LMessages.TLMNoParams;
{$endif}
{$if declared(TLMEraseBkgnd)}
  TLMEraseBkgnd = LMessages.TLMEraseBkgnd;
{$endif}
{$if declared(TLMGetText)}
  TLMGetText = LMessages.TLMGetText;
{$endif}
{$if declared(TLMKey)}
  TLMKey = LMessages.TLMKey;
{$endif}
{$if declared(TLMGetDlgCode)}
  TLMGetDlgCode = LMessages.TLMGetDlgCode;
{$endif}
{$if declared(TLMSetCursor)}
  TLMSetCursor = LMessages.TLMSetCursor;
{$endif}
{$if declared(TLMMouse)}
  TLMMouse = LMessages.TLMMouse;
{$endif}
{$if declared(TLMMove)}
  TLMMove = LMessages.TLMMove;
{$endif}
{$if declared(TLMActivate)}
  TLMActivate = LMessages.TLMActivate;
{$endif}
{$if declared(TLMNCActivate)}
  TLMNCActivate = LMessages.TLMNCActivate;
{$endif}
{$if declared(TLMNotify)}
  TLMNotify = LMessages.TLMNotify;
{$endif}
{$if declared(TLMNotifyFormat)}
  TLMNotifyFormat = LMessages.TLMNotifyFormat;
{$endif}
{$if declared(TLMPaint)}
  TLMPaint = LMessages.TLMPaint;
{$endif}
{$if declared(PWindowPos)}
  PWindowPos = LMessages.PWindowPos;
{$endif}
{$if declared(tagWINDOWPOS)}
  tagWINDOWPOS = LMessages.tagWINDOWPOS;
{$endif}
{$if declared(TLMWindowPosMsg)}
  TLMWindowPosMsg = LMessages.TLMWindowPosMsg;
{$endif}
{$if declared(PNCCalcSizeParams)}
  PNCCalcSizeParams = LMessages.PNCCalcSizeParams;
{$endif}
{$if declared(tagNCCalcSize_Params)}
  tagNCCalcSize_Params = LMessages.tagNCCalcSize_Params;
{$endif}
{$if declared(TLMNCCalcSize)}
  TLMNCCalcSize = LMessages.TLMNCCalcSize;
{$endif}
{$if declared(TLMSysCommand)}
  TLMSysCommand = LMessages.TLMSysCommand;
{$endif}
{$if declared(TLMSysDeadChar)}
  TLMSysDeadChar = LMessages.TLMSysDeadChar;
{$endif}
{$if declared(TLMSystemError)}
  TLMSystemError = LMessages.TLMSystemError;
{$endif}
{$if declared(TLMSetText)}
  TLMSetText = LMessages.TLMSetText;
{$endif}
{$if declared(PLMMouseEvent)}
  PLMMouseEvent = LMessages.PLMMouseEvent;
{$endif}
{$if declared(TLMMouseEvent)}
  TLMMouseEvent = LMessages.TLMMouseEvent;
{$endif}
{$if declared(TLastMouseInfo)}
  TLastMouseInfo = LMessages.TLastMouseInfo;
{$endif}
{$if declared(TLMSetFocus)}
  TLMSetFocus = LMessages.TLMSetFocus;
{$endif}
{$if declared(TLMSize)}
  TLMSize = LMessages.TLMSize;
{$endif}
{$if declared(PLMessage)}
  PLMessage = LMessages.PLMessage;
{$endif}
{$if declared(TLMessage)}
  TLMessage = LMessages.TLMessage;
{$endif}
{$if declared(TLMScroll)}
  TLMScroll = LMessages.TLMScroll;
{$endif}
{$if declared(TLMShowWindow)}
  TLMShowWindow = LMessages.TLMShowWindow;
{$endif}
{$if declared(TLMNCHITTEST)}
  TLMNCHITTEST = LMessages.TLMNCHITTEST;
{$endif}
{$if declared(TLMCommand)}
  TLMCommand = LMessages.TLMCommand;
{$endif}
{$if declared(TLMContextMenu)}
  TLMContextMenu = LMessages.TLMContextMenu;
{$endif}
{$if declared(TLMHelp)}
  TLMHelp = LMessages.TLMHelp;
{$endif}
{$if declared(TLMGetTextLength)}
  TLMGetTextLength = LMessages.TLMGetTextLength;
{$endif}
{$if declared(TLMChar)}
  TLMChar = LMessages.TLMChar;
{$endif}
{$if declared(TLMKeyDown)}
  TLMKeyDown = LMessages.TLMKeyDown;
{$endif}
{$if declared(TLMKeyUp)}
  TLMKeyUp = LMessages.TLMKeyUp;
{$endif}
{$if declared(TLMSysChar)}
  TLMSysChar = LMessages.TLMSysChar;
{$endif}
{$if declared(TLMSysKeyDown)}
  TLMSysKeyDown = LMessages.TLMSysKeyDown;
{$endif}
{$if declared(TLMSysKeyUp)}
  TLMSysKeyUp = LMessages.TLMSysKeyUp;
{$endif}
{$if declared(TCMWantSpecialKey)}
  TCMWantSpecialKey = LMessages.TCMWantSpecialKey;
{$endif}
{$if declared(TLMCut)}
  TLMCut = LMessages.TLMCut;
{$endif}
{$if declared(TLMCopy)}
  TLMCopy = LMessages.TLMCopy;
{$endif}
{$if declared(TLMPaste)}
  TLMPaste = LMessages.TLMPaste;
{$endif}
{$if declared(TLMMouseMove)}
  TLMMouseMove = LMessages.TLMMouseMove;
{$endif}
{$if declared(TWindowPos)}
  TWindowPos = LMessages.TWindowPos;
{$endif}
{$if declared(WINDOWPOS)}
  WINDOWPOS = LMessages.WINDOWPOS;
{$endif}
{$if declared(TLMWindowPosChanged)}
  TLMWindowPosChanged = LMessages.TLMWindowPosChanged;
{$endif}
{$if declared(TLMWindowPosChanging)}
  TLMWindowPosChanging = LMessages.TLMWindowPosChanging;
{$endif}
{$if declared(TNCCalcSizeParams)}
  TNCCalcSizeParams = LMessages.TNCCalcSizeParams;
{$endif}
{$if declared(ncCalcSizeParams)}
  ncCalcSizeParams = LMessages.ncCalcSizeParams;
{$endif}
{$if declared(TLMSysColorChange)}
  TLMSysColorChange = LMessages.TLMSysColorChange;
{$endif}
{$if declared(TLMTimeChange)}
  TLMTimeChange = LMessages.TLMTimeChange;
{$endif}
{$if declared(TLMLButtonDown)}
  TLMLButtonDown = LMessages.TLMLButtonDown;
{$endif}
{$if declared(TLMRButtonDown)}
  TLMRButtonDown = LMessages.TLMRButtonDown;
{$endif}
{$if declared(TLMMButtonDown)}
  TLMMButtonDown = LMessages.TLMMButtonDown;
{$endif}
{$if declared(TLMXButtonDown)}
  TLMXButtonDown = LMessages.TLMXButtonDown;
{$endif}
{$if declared(TLMLButtonDblClk)}
  TLMLButtonDblClk = LMessages.TLMLButtonDblClk;
{$endif}
{$if declared(TLMRButtonDblClk)}
  TLMRButtonDblClk = LMessages.TLMRButtonDblClk;
{$endif}
{$if declared(TLMMButtonDblClk)}
  TLMMButtonDblClk = LMessages.TLMMButtonDblClk;
{$endif}
{$if declared(TLMXButtonDblClk)}
  TLMXButtonDblClk = LMessages.TLMXButtonDblClk;
{$endif}
{$if declared(TLMLButtonTripleClk)}
  TLMLButtonTripleClk = LMessages.TLMLButtonTripleClk;
{$endif}
{$if declared(TLMRButtonTripleClk)}
  TLMRButtonTripleClk = LMessages.TLMRButtonTripleClk;
{$endif}
{$if declared(TLMMButtonTripleClk)}
  TLMMButtonTripleClk = LMessages.TLMMButtonTripleClk;
{$endif}
{$if declared(TLMXButtonTripleClk)}
  TLMXButtonTripleClk = LMessages.TLMXButtonTripleClk;
{$endif}
{$if declared(TLMLButtonQuadClk)}
  TLMLButtonQuadClk = LMessages.TLMLButtonQuadClk;
{$endif}
{$if declared(TLMRButtonQuadClk)}
  TLMRButtonQuadClk = LMessages.TLMRButtonQuadClk;
{$endif}
{$if declared(TLMMButtonQuadClk)}
  TLMMButtonQuadClk = LMessages.TLMMButtonQuadClk;
{$endif}
{$if declared(TLMXButtonQuadClk)}
  TLMXButtonQuadClk = LMessages.TLMXButtonQuadClk;
{$endif}
{$if declared(TLMLButtonUp)}
  TLMLButtonUp = LMessages.TLMLButtonUp;
{$endif}
{$if declared(TLMRButtonUp)}
  TLMRButtonUp = LMessages.TLMRButtonUp;
{$endif}
{$if declared(TLMMButtonUp)}
  TLMMButtonUp = LMessages.TLMMButtonUp;
{$endif}
{$if declared(TLMXButtonUp)}
  TLMXButtonUp = LMessages.TLMXButtonUp;
{$endif}
{$if declared(TLMEnter)}
  TLMEnter = LMessages.TLMEnter;
{$endif}
{$if declared(TLMExit)}
  TLMExit = LMessages.TLMExit;
{$endif}
{$if declared(TLMHScroll)}
  TLMHScroll = LMessages.TLMHScroll;
{$endif}
{$if declared(TLMVScroll)}
  TLMVScroll = LMessages.TLMVScroll;
{$endif}
{$if declared(TLMKILLFOCUS)}
  TLMKILLFOCUS = LMessages.TLMKILLFOCUS;
{$endif}
{$if declared(TLMDestroy)}
  TLMDestroy = LMessages.TLMDestroy;
{$endif}
{$if declared(TLMDrawItems)}
  TWMDrawItems = TLMDrawItems;
{$endif}
{$if declared(TLMDrawListItem)}
  TWMDrawListItem = TLMDrawListItem;
{$endif}
{$if declared(TLMMeasureItem)}
  TWMMeasureItem = TLMMeasureItem;
{$endif}
{$if declared(TLMNoParams)}
  TWMNoParams = TLMNoParams;
{$endif}
{$if declared(TLMEraseBkgnd)}
  TWMEraseBkgnd = TLMEraseBkgnd;
{$endif}
{$if declared(TLMGetText)}
  TWMGetText = TLMGetText;
{$endif}
{$if declared(TLMKey)}
  TWMKey = TLMKey;
{$endif}
{$if declared(TLMGetDlgCode)}
  TWMGetDlgCode = TLMGetDlgCode;
{$endif}
{$if declared(TLMSetCursor)}
  TWMSetCursor = TLMSetCursor;
{$endif}
{$if declared(TLMMouse)}
  TWMMouse = TLMMouse;
{$endif}
{$if declared(TLMMove)}
  TWMMove = TLMMove;
{$endif}
{$if declared(TLMActivate)}
  TWMActivate = TLMActivate;
{$endif}
{$if declared(TLMNCActivate)}
  TWMNCActivate = TLMNCActivate;
{$endif}
{$if declared(TLMNotify)}
  TWMNotify = TLMNotify;
{$endif}
{$if declared(TLMNotifyFormat)}
  TWMNotifyFormat = TLMNotifyFormat;
{$endif}
{$if declared(TLMPaint)}
  TWMPaint = TLMPaint;
{$endif}
{$if declared(TLMWindowPosMsg)}
  TWMWindowPosMsg = TLMWindowPosMsg;
{$endif}
{$if declared(TLMNCCalcSize)}
  TWMNCCalcSize = TLMNCCalcSize;
{$endif}
{$if declared(TLMSysCommand)}
  TWMSysCommand = TLMSysCommand;
{$endif}
{$if declared(TLMSysDeadChar)}
  TWMSysDeadChar = TLMSysDeadChar;
{$endif}
{$if declared(TLMSystemError)}
  TWMSystemError = TLMSystemError;
{$endif}
{$if declared(TLMSetText)}
  TWMSetText = TLMSetText;
{$endif}
{$if declared(TLMMouseEvent)}
  TWMMouseEvent = TLMMouseEvent;
{$endif}
{$if declared(TLMSetFocus)}
  TWMSetFocus = TLMSetFocus;
{$endif}
{$if declared(TLMSize)}
  TWMSize = TLMSize;
{$endif}
{$if declared(PLMessage)}
  PMessage = PLMessage;
{$endif}
{$if declared(TLMessage)}
  TMessage = TLMessage;
{$endif}
{$if declared(TLMScroll)}
  TWMScroll = TLMScroll;
{$endif}
{$if declared(TLMShowWindow)}
  TWMShowWindow = TLMShowWindow;
{$endif}
{$if declared(TLMNCHITTEST)}
  TWMNCHITTEST = TLMNCHITTEST;
{$endif}
{$if declared(TLMCommand)}
  TWMCommand = TLMCommand;
{$endif}
{$if declared(TLMContextMenu)}
  TWMContextMenu = TLMContextMenu;
{$endif}
{$if declared(TLMHelp)}
  TWMHelp = TLMHelp;
{$endif}
{$if declared(TLMGetTextLength)}
  TWMGetTextLength = TLMGetTextLength;
{$endif}
{$if declared(TLMChar)}
  TWMChar = TLMChar;
{$endif}
{$if declared(TLMKeyDown)}
  TWMKeyDown = TLMKeyDown;
{$endif}
{$if declared(TLMKeyUp)}
  TWMKeyUp = TLMKeyUp;
{$endif}
{$if declared(TLMSysChar)}
  TWMSysChar = TLMSysChar;
{$endif}
{$if declared(TLMSysKeyDown)}
  TWMSysKeyDown = TLMSysKeyDown;
{$endif}
{$if declared(TLMSysKeyUp)}
  TWMSysKeyUp = TLMSysKeyUp;
{$endif}
{$if declared(TLMCut)}
  TWMCut = TLMCut;
{$endif}
{$if declared(TLMCopy)}
  TWMCopy = TLMCopy;
{$endif}
{$if declared(TLMPaste)}
  TWMPaste = TLMPaste;
{$endif}
{$if declared(TLMMouseMove)}
  TWMMouseMove = TLMMouseMove;
{$endif}
{$if declared(TLMWindowPosChanged)}
  TWMWindowPosChanged = TLMWindowPosChanged;
{$endif}
{$if declared(TLMWindowPosChanging)}
  TWMWindowPosChanging = TLMWindowPosChanging;
{$endif}
{$if declared(TLMSysColorChange)}
  TWMSysColorChange = TLMSysColorChange;
{$endif}
{$if declared(TLMTimeChange)}
  TWMTimeChange = TLMTimeChange;
{$endif}
{$if declared(TLMLButtonDown)}
  TWMLButtonDown = TLMLButtonDown;
{$endif}
{$if declared(TLMRButtonDown)}
  TWMRButtonDown = TLMRButtonDown;
{$endif}
{$if declared(TLMMButtonDown)}
  TWMMButtonDown = TLMMButtonDown;
{$endif}
{$if declared(TLMXButtonDown)}
  TWMXButtonDown = TLMXButtonDown;
{$endif}
{$if declared(TLMLButtonDblClk)}
  TWMLButtonDblClk = TLMLButtonDblClk;
{$endif}
{$if declared(TLMRButtonDblClk)}
  TWMRButtonDblClk = TLMRButtonDblClk;
{$endif}
{$if declared(TLMMButtonDblClk)}
  TWMMButtonDblClk = TLMMButtonDblClk;
{$endif}
{$if declared(TLMXButtonDblClk)}
  TWMXButtonDblClk = TLMXButtonDblClk;
{$endif}
{$if declared(TLMLButtonTripleClk)}
  TWMLButtonTripleClk = TLMLButtonTripleClk;
{$endif}
{$if declared(TLMRButtonTripleClk)}
  TWMRButtonTripleClk = TLMRButtonTripleClk;
{$endif}
{$if declared(TLMMButtonTripleClk)}
  TWMMButtonTripleClk = TLMMButtonTripleClk;
{$endif}
{$if declared(TLMXButtonTripleClk)}
  TWMXButtonTripleClk = TLMXButtonTripleClk;
{$endif}
{$if declared(TLMLButtonQuadClk)}
  TWMLButtonQuadClk = TLMLButtonQuadClk;
{$endif}
{$if declared(TLMRButtonQuadClk)}
  TWMRButtonQuadClk = TLMRButtonQuadClk;
{$endif}
{$if declared(TLMMButtonQuadClk)}
  TWMMButtonQuadClk = TLMMButtonQuadClk;
{$endif}
{$if declared(TLMXButtonQuadClk)}
  TWMXButtonQuadClk = TLMXButtonQuadClk;
{$endif}
{$if declared(TLMLButtonUp)}
  TWMLButtonUp = TLMLButtonUp;
{$endif}
{$if declared(TLMRButtonUp)}
  TWMRButtonUp = TLMRButtonUp;
{$endif}
{$if declared(TLMMButtonUp)}
  TWMMButtonUp = TLMMButtonUp;
{$endif}
{$if declared(TLMXButtonUp)}
  TWMXButtonUp = TLMXButtonUp;
{$endif}
{$if declared(TLMEnter)}
  TWMEnter = TLMEnter;
{$endif}
{$if declared(TLMExit)}
  TWMExit = TLMExit;
{$endif}
{$if declared(TLMHScroll)}
  TWMHScroll = TLMHScroll;
{$endif}
{$if declared(TLMVScroll)}
  TWMVScroll = TLMVScroll;
{$endif}
{$if declared(TLMKILLFOCUS)}
  TWMKILLFOCUS = TLMKILLFOCUS;
{$endif}
{$if declared(TLMDestroy)}
  TWMDestroy = TLMDestroy;
{$endif}
const
{$if declared(LM_USER)}
  LM_USER = LMessages.LM_USER;
{$endif}
{$if declared(WM_USER)}
  WM_USER = LMessages.WM_USER;
{$endif}
{$if declared(LM_LCL)}
  LM_LCL = LMessages.LM_LCL;
{$endif}
{$if declared(LM_ACTIVATEITEM)}
  LM_ACTIVATEITEM = LMessages.LM_ACTIVATEITEM;
{$endif}
{$if declared(LM_CHANGED)}
  LM_CHANGED = LMessages.LM_CHANGED;
{$endif}
{$if declared(LM_FOCUS)}
  LM_FOCUS = LMessages.LM_FOCUS;
{$endif}
{$if declared(LM_CLICKED)}
  LM_CLICKED = LMessages.LM_CLICKED;
{$endif}
{$if declared(LM_RELEASED)}
  LM_RELEASED = LMessages.LM_RELEASED;
{$endif}
{$if declared(LM_ENTER)}
  LM_ENTER = LMessages.LM_ENTER;
{$endif}
{$if declared(LM_LEAVE)}
  LM_LEAVE = LMessages.LM_LEAVE;
{$endif}
{$if declared(LM_CHECKRESIZE)}
  LM_CHECKRESIZE = LMessages.LM_CHECKRESIZE;
{$endif}
{$if declared(LM_SETEDITABLE)}
  LM_SETEDITABLE = LMessages.LM_SETEDITABLE;
{$endif}
{$if declared(LM_MOVEWORD)}
  LM_MOVEWORD = LMessages.LM_MOVEWORD;
{$endif}
{$if declared(LM_MOVEPAGE)}
  LM_MOVEPAGE = LMessages.LM_MOVEPAGE;
{$endif}
{$if declared(LM_MOVETOROW)}
  LM_MOVETOROW = LMessages.LM_MOVETOROW;
{$endif}
{$if declared(LM_MOVETOCOLUMN)}
  LM_MOVETOCOLUMN = LMessages.LM_MOVETOCOLUMN;
{$endif}
{$if declared(LM_KILLCHAR)}
  LM_KILLCHAR = LMessages.LM_KILLCHAR;
{$endif}
{$if declared(LM_KILLWORD)}
  LM_KILLWORD = LMessages.LM_KILLWORD;
{$endif}
{$if declared(LM_KILLLINE)}
  LM_KILLLINE = LMessages.LM_KILLLINE;
{$endif}
{$if declared(LM_CONFIGUREEVENT)}
  LM_CONFIGUREEVENT = LMessages.LM_CONFIGUREEVENT;
{$endif}
{$if declared(LM_EXIT)}
  LM_EXIT = LMessages.LM_EXIT;
{$endif}
{$if declared(LM_CLOSEQUERY)}
  LM_CLOSEQUERY = LMessages.LM_CLOSEQUERY;
{$endif}
{$if declared(LM_DRAGSTART)}
  LM_DRAGSTART = LMessages.LM_DRAGSTART;
{$endif}
{$if declared(LM_QUIT)}
  LM_QUIT = LMessages.LM_QUIT;
{$endif}
{$if declared(LM_MONTHCHANGED)}
  LM_MONTHCHANGED = LMessages.LM_MONTHCHANGED;
{$endif}
{$if declared(LM_YEARCHANGED)}
  LM_YEARCHANGED = LMessages.LM_YEARCHANGED;
{$endif}
{$if declared(LM_DAYCHANGED)}
  LM_DAYCHANGED = LMessages.LM_DAYCHANGED;
{$endif}
{$if declared(LM_MOUSEFIRST2)}
  LM_MOUSEFIRST2 = LMessages.LM_MOUSEFIRST2;
{$endif}
{$if declared(LM_LBUTTONTRIPLECLK)}
  LM_LBUTTONTRIPLECLK = LMessages.LM_LBUTTONTRIPLECLK;
{$endif}
{$if declared(LM_LBUTTONQUADCLK)}
  LM_LBUTTONQUADCLK = LMessages.LM_LBUTTONQUADCLK;
{$endif}
{$if declared(LM_MBUTTONTRIPLECLK)}
  LM_MBUTTONTRIPLECLK = LMessages.LM_MBUTTONTRIPLECLK;
{$endif}
{$if declared(LM_MBUTTONQUADCLK)}
  LM_MBUTTONQUADCLK = LMessages.LM_MBUTTONQUADCLK;
{$endif}
{$if declared(LM_RBUTTONTRIPLECLK)}
  LM_RBUTTONTRIPLECLK = LMessages.LM_RBUTTONTRIPLECLK;
{$endif}
{$if declared(LM_RBUTTONQUADCLK)}
  LM_RBUTTONQUADCLK = LMessages.LM_RBUTTONQUADCLK;
{$endif}
{$if declared(LM_MOUSEENTER)}
  LM_MOUSEENTER = LMessages.LM_MOUSEENTER;
{$endif}
{$if declared(LM_MOUSELEAVE)}
  LM_MOUSELEAVE = LMessages.LM_MOUSELEAVE;
{$endif}
{$if declared(LM_XBUTTONTRIPLECLK)}
  LM_XBUTTONTRIPLECLK = LMessages.LM_XBUTTONTRIPLECLK;
{$endif}
{$if declared(LM_XBUTTONQUADCLK)}
  LM_XBUTTONQUADCLK = LMessages.LM_XBUTTONQUADCLK;
{$endif}
{$if declared(LM_MOUSELAST2)}
  LM_MOUSELAST2 = LMessages.LM_MOUSELAST2;
{$endif}
{$if declared(LM_GRABFOCUS)}
  LM_GRABFOCUS = LMessages.LM_GRABFOCUS;
{$endif}
{$if declared(LM_DRAWLISTITEM)}
  LM_DRAWLISTITEM = LMessages.LM_DRAWLISTITEM;
{$endif}
{$if declared(LM_DEFERREDEDIT)}
  LM_DEFERREDEDIT = LMessages.LM_DEFERREDEDIT;
{$endif}
{$if declared(LM_INTERFACEFIRST)}
  LM_INTERFACEFIRST = LMessages.LM_INTERFACEFIRST;
{$endif}
{$if declared(LM_INTERFACELAST)}
  LM_INTERFACELAST = LMessages.LM_INTERFACELAST;
{$endif}
{$if declared(LM_UNKNOWN)}
  LM_UNKNOWN = LMessages.LM_UNKNOWN;
{$endif}
{$if declared(LM_IM_COMPOSITION)}
  LM_IM_COMPOSITION = LMessages.LM_IM_COMPOSITION;
{$endif}
{$if declared(LM_IM_QUERY)}
  LM_IM_QUERY = LMessages.LM_IM_QUERY;
{$endif}
{$if declared(GTK_IM_FLAG_START)}
  GTK_IM_FLAG_START = LMessages.GTK_IM_FLAG_START;
{$endif}
{$if declared(GTK_IM_FLAG_PREEDIT)}
  GTK_IM_FLAG_PREEDIT = LMessages.GTK_IM_FLAG_PREEDIT;
{$endif}
{$if declared(GTK_IM_FLAG_END)}
  GTK_IM_FLAG_END = LMessages.GTK_IM_FLAG_END;
{$endif}
{$if declared(GTK_IM_FLAG_COMMIT)}
  GTK_IM_FLAG_COMMIT = LMessages.GTK_IM_FLAG_COMMIT;
{$endif}
{$if declared(GTK_IM_FLAG_REPLACE)}
  GTK_IM_FLAG_REPLACE = LMessages.GTK_IM_FLAG_REPLACE;
{$endif}
{$if declared(SC_SIZE)}
  SC_SIZE = LMessages.SC_SIZE;
{$endif}
{$if declared(SC_MOVE)}
  SC_MOVE = LMessages.SC_MOVE;
{$endif}
{$if declared(SC_MINIMIZE)}
  SC_MINIMIZE = LMessages.SC_MINIMIZE;
{$endif}
{$if declared(SC_MAXIMIZE)}
  SC_MAXIMIZE = LMessages.SC_MAXIMIZE;
{$endif}
{$if declared(SC_NEXTWINDOW)}
  SC_NEXTWINDOW = LMessages.SC_NEXTWINDOW;
{$endif}
{$if declared(SC_PREVWINDOW)}
  SC_PREVWINDOW = LMessages.SC_PREVWINDOW;
{$endif}
{$if declared(SC_CLOSE)}
  SC_CLOSE = LMessages.SC_CLOSE;
{$endif}
{$if declared(SC_VSCROLL)}
  SC_VSCROLL = LMessages.SC_VSCROLL;
{$endif}
{$if declared(SC_HSCROLL)}
  SC_HSCROLL = LMessages.SC_HSCROLL;
{$endif}
{$if declared(SC_MOUSEMENU)}
  SC_MOUSEMENU = LMessages.SC_MOUSEMENU;
{$endif}
{$if declared(SC_KEYMENU)}
  SC_KEYMENU = LMessages.SC_KEYMENU;
{$endif}
{$if declared(SC_ARRANGE)}
  SC_ARRANGE = LMessages.SC_ARRANGE;
{$endif}
{$if declared(SC_RESTORE)}
  SC_RESTORE = LMessages.SC_RESTORE;
{$endif}
{$if declared(SC_TASKLIST)}
  SC_TASKLIST = LMessages.SC_TASKLIST;
{$endif}
{$if declared(SC_SCREENSAVE)}
  SC_SCREENSAVE = LMessages.SC_SCREENSAVE;
{$endif}
{$if declared(SC_HOTKEY)}
  SC_HOTKEY = LMessages.SC_HOTKEY;
{$endif}
{$if declared(SC_DEFAULT)}
  SC_DEFAULT = LMessages.SC_DEFAULT;
{$endif}
{$if declared(SC_MONITORPOWER)}
  SC_MONITORPOWER = LMessages.SC_MONITORPOWER;
{$endif}
{$if declared(SC_CONTEXTHELP)}
  SC_CONTEXTHELP = LMessages.SC_CONTEXTHELP;
{$endif}
{$if declared(SC_SEPARATOR)}
  SC_SEPARATOR = LMessages.SC_SEPARATOR;
{$endif}
{$if declared(LM_NULL)}
  LM_NULL = LMessages.LM_NULL;
{$endif}
{$if declared(LM_CREATE)}
  LM_CREATE = LMessages.LM_CREATE;
{$endif}
{$if declared(LM_DESTROY)}
  LM_DESTROY = LMessages.LM_DESTROY;
{$endif}
{$if declared(LM_MOVE)}
  LM_MOVE = LMessages.LM_MOVE;
{$endif}
{$if declared(LM_SIZE)}
  LM_SIZE = LMessages.LM_SIZE;
{$endif}
{$if declared(LM_ACTIVATE)}
  LM_ACTIVATE = LMessages.LM_ACTIVATE;
{$endif}
{$if declared(LM_SETFOCUS)}
  LM_SETFOCUS = LMessages.LM_SETFOCUS;
{$endif}
{$if declared(LM_KILLFOCUS)}
  LM_KILLFOCUS = LMessages.LM_KILLFOCUS;
{$endif}
{$if declared(LM_ENABLE)}
  LM_ENABLE = LMessages.LM_ENABLE;
{$endif}
{$if declared(LM_GETTEXTLENGTH)}
  LM_GETTEXTLENGTH = LMessages.LM_GETTEXTLENGTH;
{$endif}
{$if declared(LM_PAINT)}
  LM_PAINT = LMessages.LM_PAINT;
{$endif}
{$if declared(LM_ERASEBKGND)}
  LM_ERASEBKGND = LMessages.LM_ERASEBKGND;
{$endif}
{$if declared(LM_SHOWWINDOW)}
  LM_SHOWWINDOW = LMessages.LM_SHOWWINDOW;
{$endif}
{$if declared(LM_CANCELMODE)}
  LM_CANCELMODE = LMessages.LM_CANCELMODE;
{$endif}
{$if declared(LM_SETCURSOR)}
  LM_SETCURSOR = LMessages.LM_SETCURSOR;
{$endif}
{$if declared(LM_DRAWITEM)}
  LM_DRAWITEM = LMessages.LM_DRAWITEM;
{$endif}
{$if declared(LM_MEASUREITEM)}
  LM_MEASUREITEM = LMessages.LM_MEASUREITEM;
{$endif}
{$if declared(LM_DELETEITEM)}
  LM_DELETEITEM = LMessages.LM_DELETEITEM;
{$endif}
{$if declared(LM_VKEYTOITEM)}
  LM_VKEYTOITEM = LMessages.LM_VKEYTOITEM;
{$endif}
{$if declared(LM_CHARTOITEM)}
  LM_CHARTOITEM = LMessages.LM_CHARTOITEM;
{$endif}
{$if declared(LM_SETFONT)}
  LM_SETFONT = LMessages.LM_SETFONT;
{$endif}
{$if declared(LM_COMPAREITEM)}
  LM_COMPAREITEM = LMessages.LM_COMPAREITEM;
{$endif}
{$if declared(LM_WINDOWPOSCHANGING)}
  LM_WINDOWPOSCHANGING = LMessages.LM_WINDOWPOSCHANGING;
{$endif}
{$if declared(LM_WINDOWPOSCHANGED)}
  LM_WINDOWPOSCHANGED = LMessages.LM_WINDOWPOSCHANGED;
{$endif}
{$if declared(LM_NOTIFY)}
  LM_NOTIFY = LMessages.LM_NOTIFY;
{$endif}
{$if declared(LM_HELP)}
  LM_HELP = LMessages.LM_HELP;
{$endif}
{$if declared(LM_NOTIFYFORMAT)}
  LM_NOTIFYFORMAT = LMessages.LM_NOTIFYFORMAT;
{$endif}
{$if declared(LM_CONTEXTMENU)}
  LM_CONTEXTMENU = LMessages.LM_CONTEXTMENU;
{$endif}
{$if declared(LM_NCCALCSIZE)}
  LM_NCCALCSIZE = LMessages.LM_NCCALCSIZE;
{$endif}
{$if declared(LM_NCHITTEST)}
  LM_NCHITTEST = LMessages.LM_NCHITTEST;
{$endif}
{$if declared(LM_NCPAINT)}
  LM_NCPAINT = LMessages.LM_NCPAINT;
{$endif}
{$if declared(LM_NCACTIVATE)}
  LM_NCACTIVATE = LMessages.LM_NCACTIVATE;
{$endif}
{$if declared(LM_GETDLGCODE)}
  LM_GETDLGCODE = LMessages.LM_GETDLGCODE;
{$endif}
{$if declared(LM_NCMOUSEMOVE)}
  LM_NCMOUSEMOVE = LMessages.LM_NCMOUSEMOVE;
{$endif}
{$if declared(LM_NCLBUTTONDOWN)}
  LM_NCLBUTTONDOWN = LMessages.LM_NCLBUTTONDOWN;
{$endif}
{$if declared(LM_NCLBUTTONUP)}
  LM_NCLBUTTONUP = LMessages.LM_NCLBUTTONUP;
{$endif}
{$if declared(LM_NCLBUTTONDBLCLK)}
  LM_NCLBUTTONDBLCLK = LMessages.LM_NCLBUTTONDBLCLK;
{$endif}
{$if declared(LM_KEYFIRST)}
  LM_KEYFIRST = LMessages.LM_KEYFIRST;
{$endif}
{$if declared(LM_KEYDOWN)}
  LM_KEYDOWN = LMessages.LM_KEYDOWN;
{$endif}
{$if declared(LM_KEYUP)}
  LM_KEYUP = LMessages.LM_KEYUP;
{$endif}
{$if declared(LM_CHAR)}
  LM_CHAR = LMessages.LM_CHAR;
{$endif}
{$if declared(LM_SYSKEYDOWN)}
  LM_SYSKEYDOWN = LMessages.LM_SYSKEYDOWN;
{$endif}
{$if declared(LM_SYSKEYUP)}
  LM_SYSKEYUP = LMessages.LM_SYSKEYUP;
{$endif}
{$if declared(LM_SYSCHAR)}
  LM_SYSCHAR = LMessages.LM_SYSCHAR;
{$endif}
{$if declared(LM_KEYLAST)}
  LM_KEYLAST = LMessages.LM_KEYLAST;
{$endif}
{$if declared(LM_COMMAND)}
  LM_COMMAND = LMessages.LM_COMMAND;
{$endif}
{$if declared(LM_SYSCOMMAND)}
  LM_SYSCOMMAND = LMessages.LM_SYSCOMMAND;
{$endif}
{$if declared(LM_TIMER)}
  LM_TIMER = LMessages.LM_TIMER;
{$endif}
{$if declared(LM_HSCROLL)}
  LM_HSCROLL = LMessages.LM_HSCROLL;
{$endif}
{$if declared(LM_VSCROLL)}
  LM_VSCROLL = LMessages.LM_VSCROLL;
{$endif}
{$if declared(LM_CTLCOLORMSGBOX)}
  LM_CTLCOLORMSGBOX = LMessages.LM_CTLCOLORMSGBOX;
{$endif}
{$if declared(LM_CTLCOLOREDIT)}
  LM_CTLCOLOREDIT = LMessages.LM_CTLCOLOREDIT;
{$endif}
{$if declared(LM_CTLCOLORLISTBOX)}
  LM_CTLCOLORLISTBOX = LMessages.LM_CTLCOLORLISTBOX;
{$endif}
{$if declared(LM_CTLCOLORBTN)}
  LM_CTLCOLORBTN = LMessages.LM_CTLCOLORBTN;
{$endif}
{$if declared(LM_CTLCOLORDLG)}
  LM_CTLCOLORDLG = LMessages.LM_CTLCOLORDLG;
{$endif}
{$if declared(LM_CTLCOLORSCROLLBAR)}
  LM_CTLCOLORSCROLLBAR = LMessages.LM_CTLCOLORSCROLLBAR;
{$endif}
{$if declared(LM_CTLCOLORSTATIC)}
  LM_CTLCOLORSTATIC = LMessages.LM_CTLCOLORSTATIC;
{$endif}
{$if declared(LM_MOUSEFIRST)}
  LM_MOUSEFIRST = LMessages.LM_MOUSEFIRST;
{$endif}
{$if declared(LM_MOUSEMOVE)}
  LM_MOUSEMOVE = LMessages.LM_MOUSEMOVE;
{$endif}
{$if declared(LM_LBUTTONDOWN)}
  LM_LBUTTONDOWN = LMessages.LM_LBUTTONDOWN;
{$endif}
{$if declared(LM_LBUTTONUP)}
  LM_LBUTTONUP = LMessages.LM_LBUTTONUP;
{$endif}
{$if declared(LM_LBUTTONDBLCLK)}
  LM_LBUTTONDBLCLK = LMessages.LM_LBUTTONDBLCLK;
{$endif}
{$if declared(LM_RBUTTONDOWN)}
  LM_RBUTTONDOWN = LMessages.LM_RBUTTONDOWN;
{$endif}
{$if declared(LM_RBUTTONUP)}
  LM_RBUTTONUP = LMessages.LM_RBUTTONUP;
{$endif}
{$if declared(LM_RBUTTONDBLCLK)}
  LM_RBUTTONDBLCLK = LMessages.LM_RBUTTONDBLCLK;
{$endif}
{$if declared(LM_MBUTTONDOWN)}
  LM_MBUTTONDOWN = LMessages.LM_MBUTTONDOWN;
{$endif}
{$if declared(LM_MBUTTONUP)}
  LM_MBUTTONUP = LMessages.LM_MBUTTONUP;
{$endif}
{$if declared(LM_MBUTTONDBLCLK)}
  LM_MBUTTONDBLCLK = LMessages.LM_MBUTTONDBLCLK;
{$endif}
{$if declared(LM_MOUSEWHEEL)}
  LM_MOUSEWHEEL = LMessages.LM_MOUSEWHEEL;
{$endif}
{$if declared(LM_XBUTTONDOWN)}
  LM_XBUTTONDOWN = LMessages.LM_XBUTTONDOWN;
{$endif}
{$if declared(LM_XBUTTONUP)}
  LM_XBUTTONUP = LMessages.LM_XBUTTONUP;
{$endif}
{$if declared(LM_XBUTTONDBLCLK)}
  LM_XBUTTONDBLCLK = LMessages.LM_XBUTTONDBLCLK;
{$endif}
{$if declared(LM_MOUSEHWHEEL)}
  LM_MOUSEHWHEEL = LMessages.LM_MOUSEHWHEEL;
{$endif}
{$if declared(LM_MOUSELAST)}
  LM_MOUSELAST = LMessages.LM_MOUSELAST;
{$endif}
{$if declared(LM_PARENTNOTIFY)}
  LM_PARENTNOTIFY = LMessages.LM_PARENTNOTIFY;
{$endif}
{$if declared(LM_CAPTURECHANGED)}
  LM_CAPTURECHANGED = LMessages.LM_CAPTURECHANGED;
{$endif}
{$if declared(LM_DEVICECHANGE)}
  LM_DEVICECHANGE = LMessages.LM_DEVICECHANGE;
{$endif}
{$if declared(LM_DROPFILES)}
  LM_DROPFILES = LMessages.LM_DROPFILES;
{$endif}
{$if declared(LM_SELCHANGE)}
  LM_SELCHANGE = LMessages.LM_SELCHANGE;
{$endif}
{$if declared(LM_DPICHANGED)}
  LM_DPICHANGED = LMessages.LM_DPICHANGED;
{$endif}
{$if declared(LM_CUT)}
  LM_CUT = LMessages.LM_CUT;
{$endif}
{$if declared(LM_COPY)}
  LM_COPY = LMessages.LM_COPY;
{$endif}
{$if declared(LM_PASTE)}
  LM_PASTE = LMessages.LM_PASTE;
{$endif}
{$if declared(LM_CLEAR)}
  LM_CLEAR = LMessages.LM_CLEAR;
{$endif}
{$if declared(TDM_NAVIGATE_PAGE)}
  TDM_NAVIGATE_PAGE = LMessages.TDM_NAVIGATE_PAGE;
{$endif}
{$if declared(TDM_CLICK_BUTTON)}
  TDM_CLICK_BUTTON = LMessages.TDM_CLICK_BUTTON;
{$endif}
{$if declared(TDM_SET_MARQUEE_PROGRESS_BAR)}
  TDM_SET_MARQUEE_PROGRESS_BAR = LMessages.TDM_SET_MARQUEE_PROGRESS_BAR;
{$endif}
{$if declared(TDM_SET_PROGRESS_BAR_STATE)}
  TDM_SET_PROGRESS_BAR_STATE = LMessages.TDM_SET_PROGRESS_BAR_STATE;
{$endif}
{$if declared(TDM_SET_PROGRESS_BAR_RANGE)}
  TDM_SET_PROGRESS_BAR_RANGE = LMessages.TDM_SET_PROGRESS_BAR_RANGE;
{$endif}
{$if declared(TDM_SET_PROGRESS_BAR_POS)}
  TDM_SET_PROGRESS_BAR_POS = LMessages.TDM_SET_PROGRESS_BAR_POS;
{$endif}
{$if declared(TDM_SET_PROGRESS_BAR_MARQUEE)}
  TDM_SET_PROGRESS_BAR_MARQUEE = LMessages.TDM_SET_PROGRESS_BAR_MARQUEE;
{$endif}
{$if declared(TDM_SET_ELEMENT_TEXT)}
  TDM_SET_ELEMENT_TEXT = LMessages.TDM_SET_ELEMENT_TEXT;
{$endif}
{$if declared(TDM_CLICK_RADIO_BUTTON)}
  TDM_CLICK_RADIO_BUTTON = LMessages.TDM_CLICK_RADIO_BUTTON;
{$endif}
{$if declared(TDM_ENABLE_BUTTON)}
  TDM_ENABLE_BUTTON = LMessages.TDM_ENABLE_BUTTON;
{$endif}
{$if declared(TDM_ENABLE_RADIO_BUTTON)}
  TDM_ENABLE_RADIO_BUTTON = LMessages.TDM_ENABLE_RADIO_BUTTON;
{$endif}
{$if declared(TDM_CLICK_VERIFICATION)}
  TDM_CLICK_VERIFICATION = LMessages.TDM_CLICK_VERIFICATION;
{$endif}
{$if declared(TDM_UPDATE_ELEMENT_TEXT)}
  TDM_UPDATE_ELEMENT_TEXT = LMessages.TDM_UPDATE_ELEMENT_TEXT;
{$endif}
{$if declared(TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE)}
  TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE = LMessages.TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE;
{$endif}
{$if declared(TDM_UPDATE_ICON)}
  TDM_UPDATE_ICON = LMessages.TDM_UPDATE_ICON;
{$endif}
{$if declared(CM_BASE)}
  CM_BASE = LMessages.CM_BASE;
{$endif}
{$if declared(CM_LCLOFFSET)}
  CM_LCLOFFSET = LMessages.CM_LCLOFFSET;
{$endif}
{$if declared(CM_ACTIVATE)}
  CM_ACTIVATE = LMessages.CM_ACTIVATE;
{$endif}
{$if declared(CM_DEACTIVATE)}
  CM_DEACTIVATE = LMessages.CM_DEACTIVATE;
{$endif}
{$if declared(CM_GOTFOCUS)}
  CM_GOTFOCUS = LMessages.CM_GOTFOCUS;
{$endif}
{$if declared(CM_LOSTFOCUS)}
  CM_LOSTFOCUS = LMessages.CM_LOSTFOCUS;
{$endif}
{$if declared(CM_CANCELMODE)}
  CM_CANCELMODE = LMessages.CM_CANCELMODE;
{$endif}
{$if declared(CM_DIALOGKEY)}
  CM_DIALOGKEY = LMessages.CM_DIALOGKEY;
{$endif}
{$if declared(CM_DIALOGCHAR)}
  CM_DIALOGCHAR = LMessages.CM_DIALOGCHAR;
{$endif}
{$if declared(CM_FOCUSCHANGED)}
  CM_FOCUSCHANGED = LMessages.CM_FOCUSCHANGED;
{$endif}
{$if declared(CM_PARENTFONTCHANGED)}
  CM_PARENTFONTCHANGED = LMessages.CM_PARENTFONTCHANGED;
{$endif}
{$if declared(CM_PARENTCOLORCHANGED)}
  CM_PARENTCOLORCHANGED = LMessages.CM_PARENTCOLORCHANGED;
{$endif}
{$if declared(CM_HITTEST)}
  CM_HITTEST = LMessages.CM_HITTEST;
{$endif}
{$if declared(CM_VISIBLECHANGED)}
  CM_VISIBLECHANGED = LMessages.CM_VISIBLECHANGED;
{$endif}
{$if declared(CM_ENABLEDCHANGED)}
  CM_ENABLEDCHANGED = LMessages.CM_ENABLEDCHANGED;
{$endif}
{$if declared(CM_COLORCHANGED)}
  CM_COLORCHANGED = LMessages.CM_COLORCHANGED;
{$endif}
{$if declared(CM_FONTCHANGED)}
  CM_FONTCHANGED = LMessages.CM_FONTCHANGED;
{$endif}
{$if declared(CM_CURSORCHANGED)}
  CM_CURSORCHANGED = LMessages.CM_CURSORCHANGED;
{$endif}
{$if declared(CM_CTL3DCHANGED)}
  CM_CTL3DCHANGED = LMessages.CM_CTL3DCHANGED;
{$endif}
{$if declared(CM_PARENTCTL3DCHANGED)}
  CM_PARENTCTL3DCHANGED = LMessages.CM_PARENTCTL3DCHANGED;
{$endif}
{$if declared(CM_TEXTCHANGED)}
  CM_TEXTCHANGED = LMessages.CM_TEXTCHANGED;
{$endif}
{$if declared(CM_MOUSEENTER)}
  CM_MOUSEENTER = LMessages.CM_MOUSEENTER;
{$endif}
{$if declared(CM_MOUSELEAVE)}
  CM_MOUSELEAVE = LMessages.CM_MOUSELEAVE;
{$endif}
{$if declared(CM_MENUCHANGED)}
  CM_MENUCHANGED = LMessages.CM_MENUCHANGED;
{$endif}
{$if declared(CM_APPKEYDOWN)}
  CM_APPKEYDOWN = LMessages.CM_APPKEYDOWN;
{$endif}
{$if declared(CM_APPSYSCOMMAND)}
  CM_APPSYSCOMMAND = LMessages.CM_APPSYSCOMMAND;
{$endif}
{$if declared(CM_BUTTONPRESSED)}
  CM_BUTTONPRESSED = LMessages.CM_BUTTONPRESSED;
{$endif}
{$if declared(CM_SHOWINGCHANGED)}
  CM_SHOWINGCHANGED = LMessages.CM_SHOWINGCHANGED;
{$endif}
{$if declared(CM_ENTER)}
  CM_ENTER = LMessages.CM_ENTER;
{$endif}
{$if declared(CM_EXIT)}
  CM_EXIT = LMessages.CM_EXIT;
{$endif}
{$if declared(CM_DESIGNHITTEST)}
  CM_DESIGNHITTEST = LMessages.CM_DESIGNHITTEST;
{$endif}
{$if declared(CM_ICONCHANGED)}
  CM_ICONCHANGED = LMessages.CM_ICONCHANGED;
{$endif}
{$if declared(CM_WANTSPECIALKEY)}
  CM_WANTSPECIALKEY = LMessages.CM_WANTSPECIALKEY;
{$endif}
{$if declared(CM_INVOKEHELP)}
  CM_INVOKEHELP = LMessages.CM_INVOKEHELP;
{$endif}
{$if declared(CM_WINDOWHOOK)}
  CM_WINDOWHOOK = LMessages.CM_WINDOWHOOK;
{$endif}
{$if declared(CM_RELEASE)}
  CM_RELEASE = LMessages.CM_RELEASE;
{$endif}
{$if declared(CM_SHOWHINTCHANGED)}
  CM_SHOWHINTCHANGED = LMessages.CM_SHOWHINTCHANGED;
{$endif}
{$if declared(CM_PARENTSHOWHINTCHANGED)}
  CM_PARENTSHOWHINTCHANGED = LMessages.CM_PARENTSHOWHINTCHANGED;
{$endif}
{$if declared(CM_SYSCOLORCHANGE)}
  CM_SYSCOLORCHANGE = LMessages.CM_SYSCOLORCHANGE;
{$endif}
{$if declared(CM_WININICHANGE)}
  CM_WININICHANGE = LMessages.CM_WININICHANGE;
{$endif}
{$if declared(CM_FONTCHANGE)}
  CM_FONTCHANGE = LMessages.CM_FONTCHANGE;
{$endif}
{$if declared(CM_TIMECHANGE)}
  CM_TIMECHANGE = LMessages.CM_TIMECHANGE;
{$endif}
{$if declared(CM_TABSTOPCHANGED)}
  CM_TABSTOPCHANGED = LMessages.CM_TABSTOPCHANGED;
{$endif}
{$if declared(CM_UIACTIVATE)}
  CM_UIACTIVATE = LMessages.CM_UIACTIVATE;
{$endif}
{$if declared(CM_UIDEACTIVATE)}
  CM_UIDEACTIVATE = LMessages.CM_UIDEACTIVATE;
{$endif}
{$if declared(CM_DOCWINDOWACTIVATE)}
  CM_DOCWINDOWACTIVATE = LMessages.CM_DOCWINDOWACTIVATE;
{$endif}
{$if declared(CM_CONTROLLISTCHANGE)}
  CM_CONTROLLISTCHANGE = LMessages.CM_CONTROLLISTCHANGE;
{$endif}
{$if declared(CM_GETDATALINK)}
  CM_GETDATALINK = LMessages.CM_GETDATALINK;
{$endif}
{$if declared(CM_CHILDKEY)}
  CM_CHILDKEY = LMessages.CM_CHILDKEY;
{$endif}
{$if declared(CM_DRAG)}
  CM_DRAG = LMessages.CM_DRAG;
{$endif}
{$if declared(CM_HINTSHOW)}
  CM_HINTSHOW = LMessages.CM_HINTSHOW;
{$endif}
{$if declared(CM_DIALOGHANDLE)}
  CM_DIALOGHANDLE = LMessages.CM_DIALOGHANDLE;
{$endif}
{$if declared(CM_ISTOOLCONTROL)}
  CM_ISTOOLCONTROL = LMessages.CM_ISTOOLCONTROL;
{$endif}
{$if declared(CM_RECREATEWND)}
  CM_RECREATEWND = LMessages.CM_RECREATEWND;
{$endif}
{$if declared(CM_INVALIDATE)}
  CM_INVALIDATE = LMessages.CM_INVALIDATE;
{$endif}
{$if declared(CM_SYSFONTCHANGED)}
  CM_SYSFONTCHANGED = LMessages.CM_SYSFONTCHANGED;
{$endif}
{$if declared(CM_CONTROLCHANGE)}
  CM_CONTROLCHANGE = LMessages.CM_CONTROLCHANGE;
{$endif}
{$if declared(CM_CHANGED)}
  CM_CHANGED = LMessages.CM_CHANGED;
{$endif}
{$if declared(CM_DOCKCLIENT)}
  CM_DOCKCLIENT = LMessages.CM_DOCKCLIENT;
{$endif}
{$if declared(CM_UNDOCKCLIENT)}
  CM_UNDOCKCLIENT = LMessages.CM_UNDOCKCLIENT;
{$endif}
{$if declared(CM_FLOAT)}
  CM_FLOAT = LMessages.CM_FLOAT;
{$endif}
{$if declared(CM_BORDERCHANGED)}
  CM_BORDERCHANGED = LMessages.CM_BORDERCHANGED;
{$endif}
{$if declared(CM_BIDIMODECHANGED)}
  CM_BIDIMODECHANGED = LMessages.CM_BIDIMODECHANGED;
{$endif}
{$if declared(CM_PARENTBIDIMODECHANGED)}
  CM_PARENTBIDIMODECHANGED = LMessages.CM_PARENTBIDIMODECHANGED;
{$endif}
{$if declared(CM_ALLCHILDRENFLIPPED)}
  CM_ALLCHILDRENFLIPPED = LMessages.CM_ALLCHILDRENFLIPPED;
{$endif}
{$if declared(CM_ACTIONUPDATE)}
  CM_ACTIONUPDATE = LMessages.CM_ACTIONUPDATE;
{$endif}
{$if declared(CM_ACTIONEXECUTE)}
  CM_ACTIONEXECUTE = LMessages.CM_ACTIONEXECUTE;
{$endif}
{$if declared(CM_HINTSHOWPAUSE)}
  CM_HINTSHOWPAUSE = LMessages.CM_HINTSHOWPAUSE;
{$endif}
{$if declared(CM_DOCKNOTIFICATION)}
  CM_DOCKNOTIFICATION = LMessages.CM_DOCKNOTIFICATION;
{$endif}
{$if declared(CM_MOUSEWHEEL)}
  CM_MOUSEWHEEL = LMessages.CM_MOUSEWHEEL;
{$endif}
{$if declared(CM_ISSHORTCUT)}
  CM_ISSHORTCUT = LMessages.CM_ISSHORTCUT;
{$endif}
{$if declared(CM_UPDATEACTIONS)}
  CM_UPDATEACTIONS = LMessages.CM_UPDATEACTIONS;
{$endif}
{$if declared(CM_INVALIDATEDOCKHOST)}
  CM_INVALIDATEDOCKHOST = LMessages.CM_INVALIDATEDOCKHOST;
{$endif}
{$if declared(CM_SETACTIVECONTROL)}
  CM_SETACTIVECONTROL = LMessages.CM_SETACTIVECONTROL;
{$endif}
{$if declared(CM_POPUPHWNDDESTROY)}
  CM_POPUPHWNDDESTROY = LMessages.CM_POPUPHWNDDESTROY;
{$endif}
{$if declared(CM_CREATEPOPUP)}
  CM_CREATEPOPUP = LMessages.CM_CREATEPOPUP;
{$endif}
{$if declared(CM_DESTROYHANDLE)}
  CM_DESTROYHANDLE = LMessages.CM_DESTROYHANDLE;
{$endif}
{$if declared(CM_MOUSEACTIVATE)}
  CM_MOUSEACTIVATE = LMessages.CM_MOUSEACTIVATE;
{$endif}
{$if declared(CM_CONTROLLISTCHANGING)}
  CM_CONTROLLISTCHANGING = LMessages.CM_CONTROLLISTCHANGING;
{$endif}
{$if declared(CM_BUFFEREDPRINTCLIENT)}
  CM_BUFFEREDPRINTCLIENT = LMessages.CM_BUFFEREDPRINTCLIENT;
{$endif}
{$if declared(CM_UNTHEMECONTROL)}
  CM_UNTHEMECONTROL = LMessages.CM_UNTHEMECONTROL;
{$endif}
{$if declared(CM_DOUBLEBUFFEREDCHANGED)}
  CM_DOUBLEBUFFEREDCHANGED = LMessages.CM_DOUBLEBUFFEREDCHANGED;
{$endif}
{$if declared(CM_PARENTDOUBLEBUFFEREDCHANGED)}
  CM_PARENTDOUBLEBUFFEREDCHANGED = LMessages.CM_PARENTDOUBLEBUFFEREDCHANGED;
{$endif}
{$if declared(CM_THEMECHANGED)}
  CM_THEMECHANGED = LMessages.CM_THEMECHANGED;
{$endif}
{$if declared(CM_GESTURE)}
  CM_GESTURE = LMessages.CM_GESTURE;
{$endif}
{$if declared(CM_CUSTOMGESTURESCHANGED)}
  CM_CUSTOMGESTURESCHANGED = LMessages.CM_CUSTOMGESTURESCHANGED;
{$endif}
{$if declared(CM_GESTUREMANAGERCHANGED)}
  CM_GESTUREMANAGERCHANGED = LMessages.CM_GESTUREMANAGERCHANGED;
{$endif}
{$if declared(CM_STANDARDGESTURESCHANGED)}
  CM_STANDARDGESTURESCHANGED = LMessages.CM_STANDARDGESTURESCHANGED;
{$endif}
{$if declared(CM_INPUTLANGCHANGE)}
  CM_INPUTLANGCHANGE = LMessages.CM_INPUTLANGCHANGE;
{$endif}
{$if declared(CM_TABLETOPTIONSCHANGED)}
  CM_TABLETOPTIONSCHANGED = LMessages.CM_TABLETOPTIONSCHANGED;
{$endif}
{$if declared(CM_PARENTTABLETOPTIONSCHANGED)}
  CM_PARENTTABLETOPTIONSCHANGED = LMessages.CM_PARENTTABLETOPTIONSCHANGED;
{$endif}
{$if declared(CM_MASKHITTEST)}
  CM_MASKHITTEST = LMessages.CM_MASKHITTEST;
{$endif}
{$if declared(CM_APPSHOWBTNGLYPHCHANGED)}
  CM_APPSHOWBTNGLYPHCHANGED = LMessages.CM_APPSHOWBTNGLYPHCHANGED;
{$endif}
{$if declared(CM_APPSHOWMENUGLYPHCHANGED)}
  CM_APPSHOWMENUGLYPHCHANGED = LMessages.CM_APPSHOWMENUGLYPHCHANGED;
{$endif}
{$if declared(CN_BASE)}
  CN_BASE = LMessages.CN_BASE;
{$endif}
{$if declared(CN_CHARTOITEM)}
  CN_CHARTOITEM = LMessages.CN_CHARTOITEM;
{$endif}
{$if declared(CN_COMMAND)}
  CN_COMMAND = LMessages.CN_COMMAND;
{$endif}
{$if declared(CN_COMPAREITEM)}
  CN_COMPAREITEM = LMessages.CN_COMPAREITEM;
{$endif}
{$if declared(CN_CTLCOLORBTN)}
  CN_CTLCOLORBTN = LMessages.CN_CTLCOLORBTN;
{$endif}
{$if declared(CN_CTLCOLORDLG)}
  CN_CTLCOLORDLG = LMessages.CN_CTLCOLORDLG;
{$endif}
{$if declared(CN_CTLCOLOREDIT)}
  CN_CTLCOLOREDIT = LMessages.CN_CTLCOLOREDIT;
{$endif}
{$if declared(CN_CTLCOLORLISTBOX)}
  CN_CTLCOLORLISTBOX = LMessages.CN_CTLCOLORLISTBOX;
{$endif}
{$if declared(CN_CTLCOLORMSGBOX)}
  CN_CTLCOLORMSGBOX = LMessages.CN_CTLCOLORMSGBOX;
{$endif}
{$if declared(CN_CTLCOLORSCROLLBAR)}
  CN_CTLCOLORSCROLLBAR = LMessages.CN_CTLCOLORSCROLLBAR;
{$endif}
{$if declared(CN_CTLCOLORSTATIC)}
  CN_CTLCOLORSTATIC = LMessages.CN_CTLCOLORSTATIC;
{$endif}
{$if declared(CN_DELETEITEM)}
  CN_DELETEITEM = LMessages.CN_DELETEITEM;
{$endif}
{$if declared(CN_DRAWITEM)}
  CN_DRAWITEM = LMessages.CN_DRAWITEM;
{$endif}
{$if declared(CN_HSCROLL)}
  CN_HSCROLL = LMessages.CN_HSCROLL;
{$endif}
{$if declared(CN_MEASUREITEM)}
  CN_MEASUREITEM = LMessages.CN_MEASUREITEM;
{$endif}
{$if declared(CN_PARENTNOTIFY)}
  CN_PARENTNOTIFY = LMessages.CN_PARENTNOTIFY;
{$endif}
{$if declared(CN_VKEYTOITEM)}
  CN_VKEYTOITEM = LMessages.CN_VKEYTOITEM;
{$endif}
{$if declared(CN_VSCROLL)}
  CN_VSCROLL = LMessages.CN_VSCROLL;
{$endif}
{$if declared(CN_KEYDOWN)}
  CN_KEYDOWN = LMessages.CN_KEYDOWN;
{$endif}
{$if declared(CN_KEYUP)}
  CN_KEYUP = LMessages.CN_KEYUP;
{$endif}
{$if declared(CN_CHAR)}
  CN_CHAR = LMessages.CN_CHAR;
{$endif}
{$if declared(CN_SYSKEYUP)}
  CN_SYSKEYUP = LMessages.CN_SYSKEYUP;
{$endif}
{$if declared(CN_SYSKEYDOWN)}
  CN_SYSKEYDOWN = LMessages.CN_SYSKEYDOWN;
{$endif}
{$if declared(CN_SYSCHAR)}
  CN_SYSCHAR = LMessages.CN_SYSCHAR;
{$endif}
{$if declared(CN_NOTIFY)}
  CN_NOTIFY = LMessages.CN_NOTIFY;
{$endif}
{$if declared(WA_INACTIVE)}
  WA_INACTIVE = LMessages.WA_INACTIVE;
{$endif}
{$if declared(WA_ACTIVE)}
  WA_ACTIVE = LMessages.WA_ACTIVE;
{$endif}
{$if declared(WA_CLICKACTIVE)}
  WA_CLICKACTIVE = LMessages.WA_CLICKACTIVE;
{$endif}
{$if declared(CBN_ERRSPACE)}
  CBN_ERRSPACE = LMessages.CBN_ERRSPACE;
{$endif}
{$if declared(CBN_SELCHANGE)}
  CBN_SELCHANGE = LMessages.CBN_SELCHANGE;
{$endif}
{$if declared(CBN_DBLCLK)}
  CBN_DBLCLK = LMessages.CBN_DBLCLK;
{$endif}
{$if declared(CBN_SETFOCUS)}
  CBN_SETFOCUS = LMessages.CBN_SETFOCUS;
{$endif}
{$if declared(CBN_KILLFOCUS)}
  CBN_KILLFOCUS = LMessages.CBN_KILLFOCUS;
{$endif}
{$if declared(CBN_EDITCHANGE)}
  CBN_EDITCHANGE = LMessages.CBN_EDITCHANGE;
{$endif}
{$if declared(CBN_EDITUPDATE)}
  CBN_EDITUPDATE = LMessages.CBN_EDITUPDATE;
{$endif}
{$if declared(CBN_DROPDOWN)}
  CBN_DROPDOWN = LMessages.CBN_DROPDOWN;
{$endif}
{$if declared(CBN_CLOSEUP)}
  CBN_CLOSEUP = LMessages.CBN_CLOSEUP;
{$endif}
{$if declared(CBN_SELENDOK)}
  CBN_SELENDOK = LMessages.CBN_SELENDOK;
{$endif}
{$if declared(CBN_SELENDCANCEL)}
  CBN_SELENDCANCEL = LMessages.CBN_SELENDCANCEL;
{$endif}
{$if declared(LM_LCL)}
  WM_LCL = LM_LCL;
{$endif}
{$if declared(LM_ACTIVATEITEM)}
  WM_ACTIVATEITEM = LM_ACTIVATEITEM;
{$endif}
{$if declared(LM_CHANGED)}
  WM_CHANGED = LM_CHANGED;
{$endif}
{$if declared(LM_FOCUS)}
  WM_FOCUS = LM_FOCUS;
{$endif}
{$if declared(LM_CLICKED)}
  WM_CLICKED = LM_CLICKED;
{$endif}
{$if declared(LM_RELEASED)}
  WM_RELEASED = LM_RELEASED;
{$endif}
{$if declared(LM_ENTER)}
  WM_ENTER = LM_ENTER;
{$endif}
{$if declared(LM_LEAVE)}
  WM_LEAVE = LM_LEAVE;
{$endif}
{$if declared(LM_CHECKRESIZE)}
  WM_CHECKRESIZE = LM_CHECKRESIZE;
{$endif}
{$if declared(LM_SETEDITABLE)}
  WM_SETEDITABLE = LM_SETEDITABLE;
{$endif}
{$if declared(LM_MOVEWORD)}
  WM_MOVEWORD = LM_MOVEWORD;
{$endif}
{$if declared(LM_MOVEPAGE)}
  WM_MOVEPAGE = LM_MOVEPAGE;
{$endif}
{$if declared(LM_MOVETOROW)}
  WM_MOVETOROW = LM_MOVETOROW;
{$endif}
{$if declared(LM_MOVETOCOLUMN)}
  WM_MOVETOCOLUMN = LM_MOVETOCOLUMN;
{$endif}
{$if declared(LM_KILLCHAR)}
  WM_KILLCHAR = LM_KILLCHAR;
{$endif}
{$if declared(LM_KILLWORD)}
  WM_KILLWORD = LM_KILLWORD;
{$endif}
{$if declared(LM_KILLLINE)}
  WM_KILLLINE = LM_KILLLINE;
{$endif}
{$if declared(LM_CONFIGUREEVENT)}
  WM_CONFIGUREEVENT = LM_CONFIGUREEVENT;
{$endif}
{$if declared(LM_EXIT)}
  WM_EXIT = LM_EXIT;
{$endif}
{$if declared(LM_CLOSEQUERY)}
  WM_CLOSEQUERY = LM_CLOSEQUERY;
{$endif}
{$if declared(LM_DRAGSTART)}
  WM_DRAGSTART = LM_DRAGSTART;
{$endif}
{$if declared(LM_QUIT)}
  WM_QUIT = LM_QUIT;
{$endif}
{$if declared(LM_MONTHCHANGED)}
  WM_MONTHCHANGED = LM_MONTHCHANGED;
{$endif}
{$if declared(LM_YEARCHANGED)}
  WM_YEARCHANGED = LM_YEARCHANGED;
{$endif}
{$if declared(LM_DAYCHANGED)}
  WM_DAYCHANGED = LM_DAYCHANGED;
{$endif}
{$if declared(LM_MOUSEFIRST2)}
  WM_MOUSEFIRST2 = LM_MOUSEFIRST2;
{$endif}
{$if declared(LM_LBUTTONTRIPLECLK)}
  WM_LBUTTONTRIPLECLK = LM_LBUTTONTRIPLECLK;
{$endif}
{$if declared(LM_LBUTTONQUADCLK)}
  WM_LBUTTONQUADCLK = LM_LBUTTONQUADCLK;
{$endif}
{$if declared(LM_MBUTTONTRIPLECLK)}
  WM_MBUTTONTRIPLECLK = LM_MBUTTONTRIPLECLK;
{$endif}
{$if declared(LM_MBUTTONQUADCLK)}
  WM_MBUTTONQUADCLK = LM_MBUTTONQUADCLK;
{$endif}
{$if declared(LM_RBUTTONTRIPLECLK)}
  WM_RBUTTONTRIPLECLK = LM_RBUTTONTRIPLECLK;
{$endif}
{$if declared(LM_RBUTTONQUADCLK)}
  WM_RBUTTONQUADCLK = LM_RBUTTONQUADCLK;
{$endif}
{$if declared(LM_MOUSEENTER)}
  WM_MOUSEENTER = LM_MOUSEENTER;
{$endif}
{$if declared(LM_MOUSELEAVE)}
  WM_MOUSELEAVE = LM_MOUSELEAVE;
{$endif}
{$if declared(LM_XBUTTONTRIPLECLK)}
  WM_XBUTTONTRIPLECLK = LM_XBUTTONTRIPLECLK;
{$endif}
{$if declared(LM_XBUTTONQUADCLK)}
  WM_XBUTTONQUADCLK = LM_XBUTTONQUADCLK;
{$endif}
{$if declared(LM_MOUSELAST2)}
  WM_MOUSELAST2 = LM_MOUSELAST2;
{$endif}
{$if declared(LM_GRABFOCUS)}
  WM_GRABFOCUS = LM_GRABFOCUS;
{$endif}
{$if declared(LM_DRAWLISTITEM)}
  WM_DRAWLISTITEM = LM_DRAWLISTITEM;
{$endif}
{$if declared(LM_DEFERREDEDIT)}
  WM_DEFERREDEDIT = LM_DEFERREDEDIT;
{$endif}
{$if declared(LM_INTERFACEFIRST)}
  WM_INTERFACEFIRST = LM_INTERFACEFIRST;
{$endif}
{$if declared(LM_INTERFACELAST)}
  WM_INTERFACELAST = LM_INTERFACELAST;
{$endif}
{$if declared(LM_UNKNOWN)}
  WM_UNKNOWN = LM_UNKNOWN;
{$endif}
{$if declared(LM_IM_COMPOSITION)}
  WM_IM_COMPOSITION = LM_IM_COMPOSITION;
{$endif}
{$if declared(LM_IM_QUERY)}
  WM_IM_QUERY = LM_IM_QUERY;
{$endif}
{$if declared(LM_NULL)}
  WM_NULL = LM_NULL;
{$endif}
{$if declared(LM_CREATE)}
  WM_CREATE = LM_CREATE;
{$endif}
{$if declared(LM_DESTROY)}
  WM_DESTROY = LM_DESTROY;
{$endif}
{$if declared(LM_MOVE)}
  WM_MOVE = LM_MOVE;
{$endif}
{$if declared(LM_SIZE)}
  WM_SIZE = LM_SIZE;
{$endif}
{$if declared(LM_ACTIVATE)}
  WM_ACTIVATE = LM_ACTIVATE;
{$endif}
{$if declared(LM_SETFOCUS)}
  WM_SETFOCUS = LM_SETFOCUS;
{$endif}
{$if declared(LM_KILLFOCUS)}
  WM_KILLFOCUS = LM_KILLFOCUS;
{$endif}
{$if declared(LM_ENABLE)}
  WM_ENABLE = LM_ENABLE;
{$endif}
{$if declared(LM_GETTEXTLENGTH)}
  WM_GETTEXTLENGTH = LM_GETTEXTLENGTH;
{$endif}
{$if declared(LM_PAINT)}
  WM_PAINT = LM_PAINT;
{$endif}
{$if declared(LM_ERASEBKGND)}
  WM_ERASEBKGND = LM_ERASEBKGND;
{$endif}
{$if declared(LM_SHOWWINDOW)}
  WM_SHOWWINDOW = LM_SHOWWINDOW;
{$endif}
{$if declared(LM_CANCELMODE)}
  WM_CANCELMODE = LM_CANCELMODE;
{$endif}
{$if declared(LM_SETCURSOR)}
  WM_SETCURSOR = LM_SETCURSOR;
{$endif}
{$if declared(LM_DRAWITEM)}
  WM_DRAWITEM = LM_DRAWITEM;
{$endif}
{$if declared(LM_MEASUREITEM)}
  WM_MEASUREITEM = LM_MEASUREITEM;
{$endif}
{$if declared(LM_DELETEITEM)}
  WM_DELETEITEM = LM_DELETEITEM;
{$endif}
{$if declared(LM_VKEYTOITEM)}
  WM_VKEYTOITEM = LM_VKEYTOITEM;
{$endif}
{$if declared(LM_CHARTOITEM)}
  WM_CHARTOITEM = LM_CHARTOITEM;
{$endif}
{$if declared(LM_SETFONT)}
  WM_SETFONT = LM_SETFONT;
{$endif}
{$if declared(LM_COMPAREITEM)}
  WM_COMPAREITEM = LM_COMPAREITEM;
{$endif}
{$if declared(LM_WINDOWPOSCHANGING)}
  WM_WINDOWPOSCHANGING = LM_WINDOWPOSCHANGING;
{$endif}
{$if declared(LM_WINDOWPOSCHANGED)}
  WM_WINDOWPOSCHANGED = LM_WINDOWPOSCHANGED;
{$endif}
{$if declared(LM_NOTIFY)}
  WM_NOTIFY = LM_NOTIFY;
{$endif}
{$if declared(LM_HELP)}
  WM_HELP = LM_HELP;
{$endif}
{$if declared(LM_NOTIFYFORMAT)}
  WM_NOTIFYFORMAT = LM_NOTIFYFORMAT;
{$endif}
{$if declared(LM_CONTEXTMENU)}
  WM_CONTEXTMENU = LM_CONTEXTMENU;
{$endif}
{$if declared(LM_NCCALCSIZE)}
  WM_NCCALCSIZE = LM_NCCALCSIZE;
{$endif}
{$if declared(LM_NCHITTEST)}
  WM_NCHITTEST = LM_NCHITTEST;
{$endif}
{$if declared(LM_NCPAINT)}
  WM_NCPAINT = LM_NCPAINT;
{$endif}
{$if declared(LM_NCACTIVATE)}
  WM_NCACTIVATE = LM_NCACTIVATE;
{$endif}
{$if declared(LM_GETDLGCODE)}
  WM_GETDLGCODE = LM_GETDLGCODE;
{$endif}
{$if declared(LM_NCMOUSEMOVE)}
  WM_NCMOUSEMOVE = LM_NCMOUSEMOVE;
{$endif}
{$if declared(LM_NCLBUTTONDOWN)}
  WM_NCLBUTTONDOWN = LM_NCLBUTTONDOWN;
{$endif}
{$if declared(LM_NCLBUTTONUP)}
  WM_NCLBUTTONUP = LM_NCLBUTTONUP;
{$endif}
{$if declared(LM_NCLBUTTONDBLCLK)}
  WM_NCLBUTTONDBLCLK = LM_NCLBUTTONDBLCLK;
{$endif}
{$if declared(LM_KEYFIRST)}
  WM_KEYFIRST = LM_KEYFIRST;
{$endif}
{$if declared(LM_KEYDOWN)}
  WM_KEYDOWN = LM_KEYDOWN;
{$endif}
{$if declared(LM_KEYUP)}
  WM_KEYUP = LM_KEYUP;
{$endif}
{$if declared(LM_CHAR)}
  WM_CHAR = LM_CHAR;
{$endif}
{$if declared(LM_SYSKEYDOWN)}
  WM_SYSKEYDOWN = LM_SYSKEYDOWN;
{$endif}
{$if declared(LM_SYSKEYUP)}
  WM_SYSKEYUP = LM_SYSKEYUP;
{$endif}
{$if declared(LM_SYSCHAR)}
  WM_SYSCHAR = LM_SYSCHAR;
{$endif}
{$if declared(LM_KEYLAST)}
  WM_KEYLAST = LM_KEYLAST;
{$endif}
{$if declared(LM_COMMAND)}
  WM_COMMAND = LM_COMMAND;
{$endif}
{$if declared(LM_SYSCOMMAND)}
  WM_SYSCOMMAND = LM_SYSCOMMAND;
{$endif}
{$if declared(LM_TIMER)}
  WM_TIMER = LM_TIMER;
{$endif}
{$if declared(LM_HSCROLL)}
  WM_HSCROLL = LM_HSCROLL;
{$endif}
{$if declared(LM_VSCROLL)}
  WM_VSCROLL = LM_VSCROLL;
{$endif}
{$if declared(LM_CTLCOLORMSGBOX)}
  WM_CTLCOLORMSGBOX = LM_CTLCOLORMSGBOX;
{$endif}
{$if declared(LM_CTLCOLOREDIT)}
  WM_CTLCOLOREDIT = LM_CTLCOLOREDIT;
{$endif}
{$if declared(LM_CTLCOLORLISTBOX)}
  WM_CTLCOLORLISTBOX = LM_CTLCOLORLISTBOX;
{$endif}
{$if declared(LM_CTLCOLORBTN)}
  WM_CTLCOLORBTN = LM_CTLCOLORBTN;
{$endif}
{$if declared(LM_CTLCOLORDLG)}
  WM_CTLCOLORDLG = LM_CTLCOLORDLG;
{$endif}
{$if declared(LM_CTLCOLORSCROLLBAR)}
  WM_CTLCOLORSCROLLBAR = LM_CTLCOLORSCROLLBAR;
{$endif}
{$if declared(LM_CTLCOLORSTATIC)}
  WM_CTLCOLORSTATIC = LM_CTLCOLORSTATIC;
{$endif}
{$if declared(LM_MOUSEFIRST)}
  WM_MOUSEFIRST = LM_MOUSEFIRST;
{$endif}
{$if declared(LM_MOUSEMOVE)}
  WM_MOUSEMOVE = LM_MOUSEMOVE;
{$endif}
{$if declared(LM_LBUTTONDOWN)}
  WM_LBUTTONDOWN = LM_LBUTTONDOWN;
{$endif}
{$if declared(LM_LBUTTONUP)}
  WM_LBUTTONUP = LM_LBUTTONUP;
{$endif}
{$if declared(LM_LBUTTONDBLCLK)}
  WM_LBUTTONDBLCLK = LM_LBUTTONDBLCLK;
{$endif}
{$if declared(LM_RBUTTONDOWN)}
  WM_RBUTTONDOWN = LM_RBUTTONDOWN;
{$endif}
{$if declared(LM_RBUTTONUP)}
  WM_RBUTTONUP = LM_RBUTTONUP;
{$endif}
{$if declared(LM_RBUTTONDBLCLK)}
  WM_RBUTTONDBLCLK = LM_RBUTTONDBLCLK;
{$endif}
{$if declared(LM_MBUTTONDOWN)}
  WM_MBUTTONDOWN = LM_MBUTTONDOWN;
{$endif}
{$if declared(LM_MBUTTONUP)}
  WM_MBUTTONUP = LM_MBUTTONUP;
{$endif}
{$if declared(LM_MBUTTONDBLCLK)}
  WM_MBUTTONDBLCLK = LM_MBUTTONDBLCLK;
{$endif}
{$if declared(LM_MOUSEWHEEL)}
  WM_MOUSEWHEEL = LM_MOUSEWHEEL;
{$endif}
{$if declared(LM_XBUTTONDOWN)}
  WM_XBUTTONDOWN = LM_XBUTTONDOWN;
{$endif}
{$if declared(LM_XBUTTONUP)}
  WM_XBUTTONUP = LM_XBUTTONUP;
{$endif}
{$if declared(LM_XBUTTONDBLCLK)}
  WM_XBUTTONDBLCLK = LM_XBUTTONDBLCLK;
{$endif}
{$if declared(LM_MOUSEHWHEEL)}
  WM_MOUSEHWHEEL = LM_MOUSEHWHEEL;
{$endif}
{$if declared(LM_MOUSELAST)}
  WM_MOUSELAST = LM_MOUSELAST;
{$endif}
{$if declared(LM_PARENTNOTIFY)}
  WM_PARENTNOTIFY = LM_PARENTNOTIFY;
{$endif}
{$if declared(LM_CAPTURECHANGED)}
  WM_CAPTURECHANGED = LM_CAPTURECHANGED;
{$endif}
{$if declared(LM_DEVICECHANGE)}
  WM_DEVICECHANGE = LM_DEVICECHANGE;
{$endif}
{$if declared(LM_DROPFILES)}
  WM_DROPFILES = LM_DROPFILES;
{$endif}
{$if declared(LM_SELCHANGE)}
  WM_SELCHANGE = LM_SELCHANGE;
{$endif}
{$if declared(LM_DPICHANGED)}
  WM_DPICHANGED = LM_DPICHANGED;
{$endif}
{$if declared(LM_CUT)}
  WM_CUT = LM_CUT;
{$endif}
{$if declared(LM_COPY)}
  WM_COPY = LM_COPY;
{$endif}
{$if declared(LM_PASTE)}
  WM_PASTE = LM_PASTE;
{$endif}
{$if declared(LM_CLEAR)}
  WM_CLEAR = LM_CLEAR;
{$endif}
{$if declared(GetMessageName)}
function GetMessageName(const AMessage: Integer): String; inline;
{$endif}

implementation

{$if declared(GetMessageName)}
function GetMessageName(const AMessage: Integer): String;
begin
  Result := LMessages.GetMessageName(AMessage);
end;

{$endif}
end.
