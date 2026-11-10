{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.Types
  Gerado por tools/genvclcompat.py a partir de Types.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.Types;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Types;
type
  TDirection = Types.TDirection;
  TValueRelationship = Types.TValueRelationship;
  PLargeInt = Types.PLargeInt;
  PLargeuInt = Types.PLargeuInt;
  TBooleanDynArray = Types.TBooleanDynArray;
  TByteDynArray = Types.TByteDynArray;
  TCardinalDynArray = Types.TCardinalDynArray;
  TInt64DynArray = Types.TInt64DynArray;
  TIntegerDynArray = Types.TIntegerDynArray;
  TLongWordDynArray = Types.TLongWordDynArray;
  TPointerDynArray = Types.TPointerDynArray;
  TQWordDynArray = Types.TQWordDynArray;
  TShortIntDynArray = Types.TShortIntDynArray;
  TSmallIntDynArray = Types.TSmallIntDynArray;
  TStringDynArray = Types.TStringDynArray;
  TObjectDynArray = Types.TObjectDynArray;
  TWideStringDynArray = Types.TWideStringDynArray;
  TWordDynArray = Types.TWordDynArray;
  TCurrencyArray = Types.TCurrencyArray;
{$if (not defined(FPUNONE))}
  TSingleDynArray = Types.TSingleDynArray;
{$endif}
{$if (not defined(FPUNONE))}
  TDoubleDynArray = Types.TDoubleDynArray;
{$endif}
{$if (not defined(FPUNONE))}
  TExtendedDynArray = Types.TExtendedDynArray;
{$endif}
{$if (not defined(FPUNONE))}
  TCompDynArray = Types.TCompDynArray;
{$endif}
  TArray4IntegerType = Types.TArray4IntegerType;
  PSmallPoint = Types.PSmallPoint;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TSmallPoint = Types.TSmallPoint;
{$endif}
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TSize = Types.TSize;
{$endif}
  PSize = Types.PSize;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TPoint = Types.TPoint;
{$endif}
  PPoint = Types.PPoint;
  TSplitRectType = Types.TSplitRectType;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TRect = Types.TRect;
{$endif}
  PRect = Types.PRect;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TPointF = Types.TPointF;
{$endif}
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TRectF = Types.TRectF;
{$endif}
  TDuplicates = Types.TDuplicates;
  PPOleStr = Types.PPOleStr;
  TListCallback = Types.TListCallback;
  TListStaticCallback = Types.TListStaticCallback;
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  PDWord = Types.PDWord;
{$endif}
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  TXrmOptionDescRec = Types.TXrmOptionDescRec;
{$endif}
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  PXrmOptionDescRec = Types.PXrmOptionDescRec;
{$endif}
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  _FILETIME = Types._FILETIME;
{$endif}
{$endif}
  PFileTime = Types.PFileTime;
  tagSTATSTG = Types.tagSTATSTG;
  PStatStg = Types.PStatStg;
  IClassFactory = Types.IClassFactory;
  ISequentialStream = Types.ISequentialStream;
  IStream = Types.IStream;
  TBitConverter = Types.TBitConverter;
  TEndian = Types.TEndian;
  DWORD = Types.DWORD;
  PLongint = Types.PLongint;
  PSmallInt = Types.PSmallInt;
{$if (not defined(FPUNONE))}
  PDouble = Types.PDouble;
{$endif}
  PByte = Types.PByte;
  Largeint = Types.Largeint;
  LARGE_INT = Types.LARGE_INT;
  LargeUint = Types.LargeUint;
  LARGE_UINT = Types.LARGE_UINT;
  TagSize = Types.TagSize;
  TagPoint = Types.TagPoint;
  TOleChar = Types.TOleChar;
  POleStr = Types.POleStr;
  PCLSID = Types.PCLSID;
  TCLSID = Types.TCLSID;
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  PDisplay = Types.PDisplay;
{$endif}
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  PEvent = Types.PEvent;
{$endif}
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  XrmOptionDescRec = Types.XrmOptionDescRec;
{$endif}
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  Widget = Types.Widget;
{$endif}
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  WidgetClass = Types.WidgetClass;
{$endif}
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  ArgList = Types.ArgList;
{$endif}
{$if ((not defined(win32)) and (not defined(win64)) and (not defined(wince)))}
  Region = Types.Region;
{$endif}
  TFileTime = Types.TFileTime;
  FILETIME = Types.FILETIME;
  TStatStg = Types.TStatStg;
  STATSTG = Types.STATSTG;
const
  FromBeginning = Types.FromBeginning;
  FromEnd = Types.FromEnd;
  srLeft = Types.srLeft;
  srRight = Types.srRight;
  srTop = Types.srTop;
  srBottom = Types.srBottom;
  dupIgnore = Types.dupIgnore;
  dupAccept = Types.dupAccept;
  dupError = Types.dupError;
  STGTY_STORAGE = Types.STGTY_STORAGE;
  STGTY_STREAM = Types.STGTY_STREAM;
  STGTY_LOCKBYTES = Types.STGTY_LOCKBYTES;
  STGTY_PROPERTY = Types.STGTY_PROPERTY;
  STREAM_SEEK_SET = Types.STREAM_SEEK_SET;
  STREAM_SEEK_CUR = Types.STREAM_SEEK_CUR;
  STREAM_SEEK_END = Types.STREAM_SEEK_END;
  LOCK_WRITE = Types.LOCK_WRITE;
  LOCK_EXCLUSIVE = Types.LOCK_EXCLUSIVE;
  LOCK_ONLYONCE = Types.LOCK_ONLYONCE;
  STATFLAG_DEFAULT = Types.STATFLAG_DEFAULT;
  STATFLAG_NONAME = Types.STATFLAG_NONAME;
  STATFLAG_NOOPEN = Types.STATFLAG_NOOPEN;
{$if (not defined(Wince))}
  E_FAIL = Types.E_FAIL;
{$endif}
{$if (not defined(Wince))}
  E_INVALIDARG = Types.E_INVALIDARG;
{$endif}
{$if (not defined(Wince))}
  STG_E_INVALIDFUNCTION = Types.STG_E_INVALIDFUNCTION;
{$endif}
{$if (not defined(Wince))}
  STG_E_FILENOTFOUND = Types.STG_E_FILENOTFOUND;
{$endif}
{$if (not defined(Wince))}
  STG_E_PATHNOTFOUND = Types.STG_E_PATHNOTFOUND;
{$endif}
{$if (not defined(Wince))}
  STG_E_TOOMANYOPENFILES = Types.STG_E_TOOMANYOPENFILES;
{$endif}
{$if (not defined(Wince))}
  STG_E_ACCESSDENIED = Types.STG_E_ACCESSDENIED;
{$endif}
{$if (not defined(Wince))}
  STG_E_INVALIDHANDLE = Types.STG_E_INVALIDHANDLE;
{$endif}
{$if (not defined(Wince))}
  STG_E_INSUFFICIENTMEMORY = Types.STG_E_INSUFFICIENTMEMORY;
{$endif}
{$if (not defined(Wince))}
  STG_E_INVALIDPOINTER = Types.STG_E_INVALIDPOINTER;
{$endif}
{$if (not defined(Wince))}
  STG_E_NOMOREFILES = Types.STG_E_NOMOREFILES;
{$endif}
{$if (not defined(Wince))}
  STG_E_DISKISWRITEPROTECTED = Types.STG_E_DISKISWRITEPROTECTED;
{$endif}
{$if (not defined(Wince))}
  STG_E_SEEKERROR = Types.STG_E_SEEKERROR;
{$endif}
{$if (not defined(Wince))}
  STG_E_WRITEFAULT = Types.STG_E_WRITEFAULT;
{$endif}
{$if (not defined(Wince))}
  STG_E_READFAULT = Types.STG_E_READFAULT;
{$endif}
{$if (not defined(Wince))}
  STG_E_SHAREVIOLATION = Types.STG_E_SHAREVIOLATION;
{$endif}
{$if (not defined(Wince))}
  STG_E_LOCKVIOLATION = Types.STG_E_LOCKVIOLATION;
{$endif}
{$if (not defined(Wince))}
  STG_E_FILEALREADYEXISTS = Types.STG_E_FILEALREADYEXISTS;
{$endif}
{$if (not defined(Wince))}
  STG_E_INVALIDPARAMETER = Types.STG_E_INVALIDPARAMETER;
{$endif}
{$if (not defined(Wince))}
  STG_E_MEDIUMFULL = Types.STG_E_MEDIUMFULL;
{$endif}
{$if (not defined(Wince))}
  STG_E_PROPSETMISMATCHED = Types.STG_E_PROPSETMISMATCHED;
{$endif}
{$if (not defined(Wince))}
  STG_E_ABNORMALAPIEXIT = Types.STG_E_ABNORMALAPIEXIT;
{$endif}
{$if (not defined(Wince))}
  STG_E_INVALIDHEADER = Types.STG_E_INVALIDHEADER;
{$endif}
{$if (not defined(Wince))}
  STG_E_INVALIDNAME = Types.STG_E_INVALIDNAME;
{$endif}
{$if (not defined(Wince))}
  STG_E_UNKNOWN = Types.STG_E_UNKNOWN;
{$endif}
{$if (not defined(Wince))}
  STG_E_UNIMPLEMENTEDFUNCTION = Types.STG_E_UNIMPLEMENTEDFUNCTION;
{$endif}
{$if (not defined(Wince))}
  STG_E_INVALIDFLAG = Types.STG_E_INVALIDFLAG;
{$endif}
{$if (not defined(Wince))}
  STG_E_INUSE = Types.STG_E_INUSE;
{$endif}
{$if (not defined(Wince))}
  STG_E_NOTCURRENT = Types.STG_E_NOTCURRENT;
{$endif}
{$if (not defined(Wince))}
  STG_E_REVERTED = Types.STG_E_REVERTED;
{$endif}
{$if (not defined(Wince))}
  STG_E_CANTSAVE = Types.STG_E_CANTSAVE;
{$endif}
{$if (not defined(Wince))}
  STG_E_OLDFORMAT = Types.STG_E_OLDFORMAT;
{$endif}
{$if (not defined(Wince))}
  STG_E_OLDDLL = Types.STG_E_OLDDLL;
{$endif}
{$if (not defined(Wince))}
  STG_E_SHAREREQUIRED = Types.STG_E_SHAREREQUIRED;
{$endif}
{$if (not defined(Wince))}
  STG_E_EXTANTMARSHALLINGS = Types.STG_E_EXTANTMARSHALLINGS;
{$endif}
{$if (not defined(Wince))}
  STG_E_DOCFILECORRUPT = Types.STG_E_DOCFILECORRUPT;
{$endif}
{$if (not defined(Wince))}
  STG_E_BADBASEADDRESS = Types.STG_E_BADBASEADDRESS;
{$endif}
{$if (not defined(Wince))}
  STG_E_INCOMPLETE = Types.STG_E_INCOMPLETE;
{$endif}
{$if (not defined(Wince))}
  STG_E_TERMINATED = Types.STG_E_TERMINATED;
{$endif}
{$if (not defined(Wince))}
  STG_S_CONVERTED = Types.STG_S_CONVERTED;
{$endif}
{$if (not defined(Wince))}
  STG_S_BLOCK = Types.STG_S_BLOCK;
{$endif}
{$if (not defined(Wince))}
  STG_S_RETRYNOW = Types.STG_S_RETRYNOW;
{$endif}
{$if (not defined(Wince))}
  STG_S_MONITORING = Types.STG_S_MONITORING;
{$endif}
var
  GUID_NULL: TGUID absolute Types.GUID_NULL;
function EqualRect(const r1,r2 : TRect) : Boolean; inline;
function Rect(Left,Top,Right,Bottom : Integer) : TRect; inline;
function Bounds(ALeft,ATop,AWidth,AHeight : Integer) : TRect; inline;
function Point(x,y : Integer) : TPoint; inline;
function PtInRect(const Rect : TRect; const p : TPoint) : Boolean; inline;
function IntersectRect(var Rect : TRect; const R1,R2 : TRect) : Boolean; inline;
function UnionRect(var Rect : TRect; const R1,R2 : TRect) : Boolean; inline;
function IsRectEmpty(const Rect : TRect) : Boolean; inline;
function OffsetRect(var Rect : TRect;DX : Integer;DY : Integer) : Boolean; inline;
function CenterPoint(const Rect: TRect): TPoint; inline;
function InflateRect(var Rect: TRect; dx: Integer; dy: Integer): Boolean; inline;
function Size(AWidth, AHeight: Integer): TSize; overload; inline;
function Size(const ARect: TRect): TSize; overload; inline;

implementation

function EqualRect(const r1,r2 : TRect) : Boolean;
begin
  Result := Types.EqualRect(r1, r2);
end;

function Rect(Left,Top,Right,Bottom : Integer) : TRect;
begin
  Result := Types.Rect(Left, Top, Right, Bottom);
end;

function Bounds(ALeft,ATop,AWidth,AHeight : Integer) : TRect;
begin
  Result := Types.Bounds(ALeft, ATop, AWidth, AHeight);
end;

function Point(x,y : Integer) : TPoint;
begin
  Result := Types.Point(x, y);
end;

function PtInRect(const Rect : TRect; const p : TPoint) : Boolean;
begin
  Result := Types.PtInRect(Rect, p);
end;

function IntersectRect(var Rect : TRect; const R1,R2 : TRect) : Boolean;
begin
  Result := Types.IntersectRect(Rect, R1, R2);
end;

function UnionRect(var Rect : TRect; const R1,R2 : TRect) : Boolean;
begin
  Result := Types.UnionRect(Rect, R1, R2);
end;

function IsRectEmpty(const Rect : TRect) : Boolean;
begin
  Result := Types.IsRectEmpty(Rect);
end;

function OffsetRect(var Rect : TRect;DX : Integer;DY : Integer) : Boolean;
begin
  Result := Types.OffsetRect(Rect, DX, DY);
end;

function CenterPoint(const Rect: TRect): TPoint;
begin
  Result := Types.CenterPoint(Rect);
end;

function InflateRect(var Rect: TRect; dx: Integer; dy: Integer): Boolean;
begin
  Result := Types.InflateRect(Rect, dx, dy);
end;

function Size(AWidth, AHeight: Integer): TSize;
begin
  Result := Types.Size(AWidth, AHeight);
end;

function Size(const ARect: TRect): TSize;
begin
  Result := Types.Size(ARect);
end;

end.
