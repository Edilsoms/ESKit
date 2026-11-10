{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.Classes
  Gerado por tools/genvclcompat.py a partir de Classes.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.Classes;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  sysutils, types, Classes;
type
  TSeekOrigin = Classes.TSeekOrigin;
  TAlignment = Classes.TAlignment;
  TLeftRight = Classes.TLeftRight;
  TVerticalAlignment = Classes.TVerticalAlignment;
  TTopBottom = Classes.TTopBottom;
  TBiDiMode = Classes.TBiDiMode;
  TShiftStateEnum = Classes.TShiftStateEnum;
  TShiftState = Classes.TShiftState;
  THelpContext = Classes.THelpContext;
  THelpType = Classes.THelpType;
  TShortCut = Classes.TShortCut;
  TNotifyEvent = Classes.TNotifyEvent;
  THelpEvent = Classes.THelpEvent;
  TGetStrProc = Classes.TGetStrProc;
  EStreamError = Classes.EStreamError;
  EFCreateError = Classes.EFCreateError;
  EFOpenError = Classes.EFOpenError;
  EFilerError = Classes.EFilerError;
  EReadError = Classes.EReadError;
  EWriteError = Classes.EWriteError;
  EClassNotFound = Classes.EClassNotFound;
  EMethodNotFound = Classes.EMethodNotFound;
  EInvalidImage = Classes.EInvalidImage;
  EResNotFound = Classes.EResNotFound;
  EListError = Classes.EListError;
  EBitsError = Classes.EBitsError;
  EStringListError = Classes.EStringListError;
  EComponentError = Classes.EComponentError;
  EParserError = Classes.EParserError;
  EOutOfResources = Classes.EOutOfResources;
  EInvalidOperation = Classes.EInvalidOperation;
  TExceptionClass = Classes.TExceptionClass;
  TFPObservedOperation = Classes.TFPObservedOperation;
  IFPObserved = Classes.IFPObserved;
  IFPObserver = Classes.IFPObserver;
  EObserver = Classes.EObserver;
  TStream = Classes.TStream;
  TFiler = Classes.TFiler;
  TReader = Classes.TReader;
  TWriter = Classes.TWriter;
  TComponent = Classes.TComponent;
  PPointerList = Classes.PPointerList;
  TPointerList = Classes.TPointerList;
  TListSortCompare = Classes.TListSortCompare;
  TListAssignOp = Classes.TListAssignOp;
  TFPList = Classes.TFPList;
  TFPListEnumerator = Classes.TFPListEnumerator;
  TListNotification = Classes.TListNotification;
  TList = Classes.TList;
  TListEnumerator = Classes.TListEnumerator;
  TThreadList = Classes.TThreadList;
  TBitArray = Classes.TBitArray;
  TBits = Classes.TBits;
  TPersistent = Classes.TPersistent;
  TPersistentClass = Classes.TPersistentClass;
  TInterfacedPersistent = Classes.TInterfacedPersistent;
  TRecall = Classes.TRecall;
  TCollection = Classes.TCollection;
  TCollectionItem = Classes.TCollectionItem;
  TCollectionEnumerator = Classes.TCollectionEnumerator;
  TCollectionItemClass = Classes.TCollectionItemClass;
  TCollectionNotification = Classes.TCollectionNotification;
  TCollectionSortCompare = Classes.TCollectionSortCompare;
  TOwnedCollection = Classes.TOwnedCollection;
  TStrings = Classes.TStrings;
  IStringsAdapter = Classes.IStringsAdapter;
  TStringsEnumerator = Classes.TStringsEnumerator;
  TStringsFilterMethod = Classes.TStringsFilterMethod;
  TStringsReduceMethod = Classes.TStringsReduceMethod;
  TStringsMapMethod = Classes.TStringsMapMethod;
  TStringsForEachMethodExObj = Classes.TStringsForEachMethodExObj;
  TStringsForEachMethodEx = Classes.TStringsForEachMethodEx;
  TStringsForEachMethod = Classes.TStringsForEachMethod;
  TMissingNameValueSeparatorAction = Classes.TMissingNameValueSeparatorAction;
  TMissingNameValueSeparatorActions = Classes.TMissingNameValueSeparatorActions;
  TStringsOption = Classes.TStringsOption;
  TStringsOptions = Classes.TStringsOptions;
  TStringsClass = Classes.TStringsClass;
  TStringList = Classes.TStringList;
  TStringListSortCompare = Classes.TStringListSortCompare;
  PStringItem = Classes.PStringItem;
  TStringItem = Classes.TStringItem;
  PStringItemList = Classes.PStringItemList;
  TStringItemList = Classes.TStringItemList;
  TStringsSortStyle = Classes.TStringsSortStyle;
  TStringsSortStyles = Classes.TStringsSortStyles;
  TProxyStream = Classes.TProxyStream;
  TOwnerStream = Classes.TOwnerStream;
  IStreamPersist = Classes.IStreamPersist;
  THandleStream = Classes.THandleStream;
  TFileStream = Classes.TFileStream;
  TCustomMemoryStream = Classes.TCustomMemoryStream;
  TMemoryStream = Classes.TMemoryStream;
  TBytesStream = Classes.TBytesStream;
  TStringStream = Classes.TStringStream;
  TRawByteStringStream = Classes.TRawByteStringStream;
  TResourceStream = Classes.TResourceStream;
  TStreamOwnership = Classes.TStreamOwnership;
  TStreamAdapter = Classes.TStreamAdapter;
  TValueType = Classes.TValueType;
  TFilerFlag = Classes.TFilerFlag;
  TFilerFlags = Classes.TFilerFlags;
  TReaderProc = Classes.TReaderProc;
  TWriterProc = Classes.TWriterProc;
  TStreamProc = Classes.TStreamProc;
  TComponentClass = Classes.TComponentClass;
  TAbstractObjectReader = Classes.TAbstractObjectReader;
  TBinaryObjectReader = Classes.TBinaryObjectReader;
  TFindMethodEvent = Classes.TFindMethodEvent;
  TSetMethodPropertyEvent = Classes.TSetMethodPropertyEvent;
  TSetNameEvent = Classes.TSetNameEvent;
  TReferenceNameEvent = Classes.TReferenceNameEvent;
  TAncestorNotFoundEvent = Classes.TAncestorNotFoundEvent;
  TReadComponentsProc = Classes.TReadComponentsProc;
  TReaderError = Classes.TReaderError;
  TPropertyNotFoundEvent = Classes.TPropertyNotFoundEvent;
  TFindComponentClassEvent = Classes.TFindComponentClassEvent;
  TCreateComponentEvent = Classes.TCreateComponentEvent;
  TReadWriteStringPropertyEvent = Classes.TReadWriteStringPropertyEvent;
  TAbstractObjectWriter = Classes.TAbstractObjectWriter;
  TBinaryObjectWriter = Classes.TBinaryObjectWriter;
  TTextObjectWriter = Classes.TTextObjectWriter;
  TFindAncestorEvent = Classes.TFindAncestorEvent;
  TWriteMethodPropertyEvent = Classes.TWriteMethodPropertyEvent;
  TParser = Classes.TParser;
  TThread = Classes.TThread;
  EThread = Classes.EThread;
  EThreadExternalException = Classes.EThreadExternalException;
  EThreadDestroyCalled = Classes.EThreadDestroyCalled;
  TSynchronizeProcVar = Classes.TSynchronizeProcVar;
  TThreadMethod = Classes.TThreadMethod;
  TThreadReportStatus = Classes.TThreadReportStatus;
  TThreadStatusNotifyEvent = Classes.TThreadStatusNotifyEvent;
  TThreadExecuteStatusHandler = Classes.TThreadExecuteStatusHandler;
  TNotifyCallBack = Classes.TNotifyCallBack;
  TThreadStatusNotifyCallBack = Classes.TThreadStatusNotifyCallBack;
  TThreadExecuteCallBack = Classes.TThreadExecuteCallBack;
  TThreadExecuteStatusCallBack = Classes.TThreadExecuteStatusCallBack;
  TThreadPriority = Classes.TThreadPriority;
  TOperation = Classes.TOperation;
  TComponentState = Classes.TComponentState;
  TComponentStyle = Classes.TComponentStyle;
  TGetChildProc = Classes.TGetChildProc;
  IVCLComObject = Classes.IVCLComObject;
  IInterfaceComponentReference = Classes.IInterfaceComponentReference;
  IDesignerNotify = Classes.IDesignerNotify;
  TComponentEnumerator = Classes.TComponentEnumerator;
  TBasicAction = Classes.TBasicAction;
  TBasicActionLink = Classes.TBasicActionLink;
  TBasicActionLinkClass = Classes.TBasicActionLinkClass;
  TBasicActionClass = Classes.TBasicActionClass;
  TActiveXRegType = Classes.TActiveXRegType;
  IInterfaceList = Classes.IInterfaceList;
  TInterfaceList = Classes.TInterfaceList;
  TInterfaceListEnumerator = Classes.TInterfaceListEnumerator;
  TDataModule = Classes.TDataModule;
  TDataModuleClass = Classes.TDataModuleClass;
  TIdentMapEntry = Classes.TIdentMapEntry;
  TIdentToInt = Classes.TIdentToInt;
  TIntToIdent = Classes.TIntToIdent;
  TFindGlobalComponent = Classes.TFindGlobalComponent;
  TInitComponentHandler = Classes.TInitComponentHandler;
  TObjectTextEncoding = Classes.TObjectTextEncoding;
  HRSRC = Classes.HRSRC;
  TComponentName = Classes.TComponentName;
  THandle = Classes.THandle;
  TPoint = Classes.TPoint;
  TRect = Classes.TRect;
  TSmallPoint = Classes.TSmallPoint;
  HModule = Classes.HModule;
  TDuplicates = Classes.TDuplicates;
  TListCallback = Classes.TListCallback;
  TListStaticCallback = Classes.TListStaticCallback;
  TThreadExecuteHandler = Classes.TThreadExecuteHandler;
const
  soBeginning = Classes.soBeginning;
  soCurrent = Classes.soCurrent;
  soEnd = Classes.soEnd;
  taLeftJustify = Classes.taLeftJustify;
  taRightJustify = Classes.taRightJustify;
  taCenter = Classes.taCenter;
  taAlignTop = Classes.taAlignTop;
  taAlignBottom = Classes.taAlignBottom;
  taVerticalCenter = Classes.taVerticalCenter;
  bdLeftToRight = Classes.bdLeftToRight;
  bdRightToLeft = Classes.bdRightToLeft;
  bdRightToLeftNoAlign = Classes.bdRightToLeftNoAlign;
  bdRightToLeftReadingOnly = Classes.bdRightToLeftReadingOnly;
  ssShift = Classes.ssShift;
  ssAlt = Classes.ssAlt;
  ssCtrl = Classes.ssCtrl;
  ssLeft = Classes.ssLeft;
  ssRight = Classes.ssRight;
  ssMiddle = Classes.ssMiddle;
  ssDouble = Classes.ssDouble;
  ssMeta = Classes.ssMeta;
  ssSuper = Classes.ssSuper;
  ssHyper = Classes.ssHyper;
  ssAltGr = Classes.ssAltGr;
  ssCaps = Classes.ssCaps;
  ssNum = Classes.ssNum;
  ssScroll = Classes.ssScroll;
  ssTriple = Classes.ssTriple;
  ssQuad = Classes.ssQuad;
  ssExtra1 = Classes.ssExtra1;
  ssExtra2 = Classes.ssExtra2;
  htKeyword = Classes.htKeyword;
  htContext = Classes.htContext;
  ooChange = Classes.ooChange;
  ooFree = Classes.ooFree;
  ooAddItem = Classes.ooAddItem;
  ooDeleteItem = Classes.ooDeleteItem;
  ooCustom = Classes.ooCustom;
  laCopy = Classes.laCopy;
  laAnd = Classes.laAnd;
  laOr = Classes.laOr;
  laXor = Classes.laXor;
  laSrcUnique = Classes.laSrcUnique;
  laDestUnique = Classes.laDestUnique;
  lnAdded = Classes.lnAdded;
  lnExtracted = Classes.lnExtracted;
  lnDeleted = Classes.lnDeleted;
  cnAdded = Classes.cnAdded;
  cnExtracting = Classes.cnExtracting;
  cnDeleting = Classes.cnDeleting;
  mnvaValue = Classes.mnvaValue;
  mnvaName = Classes.mnvaName;
  mnvaEmpty = Classes.mnvaEmpty;
  mnvaError = Classes.mnvaError;
  soStrictDelimiter = Classes.soStrictDelimiter;
  soWriteBOM = Classes.soWriteBOM;
  soTrailingLineBreak = Classes.soTrailingLineBreak;
  soUseLocale = Classes.soUseLocale;
  soPreserveBOM = Classes.soPreserveBOM;
  sslNone = Classes.sslNone;
  sslUser = Classes.sslUser;
  sslAuto = Classes.sslAuto;
  soReference = Classes.soReference;
  soOwned = Classes.soOwned;
  vaNull = Classes.vaNull;
  vaList = Classes.vaList;
  vaInt8 = Classes.vaInt8;
  vaInt16 = Classes.vaInt16;
  vaInt32 = Classes.vaInt32;
  vaExtended = Classes.vaExtended;
  vaString = Classes.vaString;
  vaIdent = Classes.vaIdent;
  vaFalse = Classes.vaFalse;
  vaTrue = Classes.vaTrue;
  vaBinary = Classes.vaBinary;
  vaSet = Classes.vaSet;
  vaLString = Classes.vaLString;
  vaNil = Classes.vaNil;
  vaCollection = Classes.vaCollection;
  vaSingle = Classes.vaSingle;
  vaCurrency = Classes.vaCurrency;
  vaDate = Classes.vaDate;
  vaWString = Classes.vaWString;
  vaInt64 = Classes.vaInt64;
  vaUTF8String = Classes.vaUTF8String;
  vaUString = Classes.vaUString;
  vaQWord = Classes.vaQWord;
  ffInherited = Classes.ffInherited;
  ffChildPos = Classes.ffChildPos;
  ffInline = Classes.ffInline;
  tpIdle = Classes.tpIdle;
  tpLowest = Classes.tpLowest;
  tpLower = Classes.tpLower;
  tpNormal = Classes.tpNormal;
  tpHigher = Classes.tpHigher;
  tpHighest = Classes.tpHighest;
  tpTimeCritical = Classes.tpTimeCritical;
  opInsert = Classes.opInsert;
  opRemove = Classes.opRemove;
  axrComponentOnly = Classes.axrComponentOnly;
  axrIncludeDescendants = Classes.axrIncludeDescendants;
  oteDFM = Classes.oteDFM;
  oteLFM = Classes.oteLFM;
  MaxListSize = Classes.MaxListSize;
  scShift = Classes.scShift;
  scCtrl = Classes.scCtrl;
  scAlt = Classes.scAlt;
  scNone = Classes.scNone;
  soFromBeginning = Classes.soFromBeginning;
  soFromCurrent = Classes.soFromCurrent;
  soFromEnd = Classes.soFromEnd;
  dupIgnore = Classes.dupIgnore;
  dupAccept = Classes.dupAccept;
  dupError = Classes.dupError;
  fmCreate = Classes.fmCreate;
  fmOpenRead = Classes.fmOpenRead;
  fmOpenWrite = Classes.fmOpenWrite;
  fmOpenReadWrite = Classes.fmOpenReadWrite;
  toEOF = Classes.toEOF;
  toSymbol = Classes.toSymbol;
  toString = Classes.toString;
  toInteger = Classes.toInteger;
  toFloat = Classes.toFloat;
  toWString = Classes.toWString;
  SGUIDObserved = Classes.SGUIDObserved;
  SGUIDObserver = Classes.SGUIDObserver;
  BITSHIFT = Classes.BITSHIFT;
  MASK = Classes.MASK;
  MaxBitFlags = Classes.MaxBitFlags;
  MaxBitRec = Classes.MaxBitRec;
var
  WakeMainThread: TNotifyEvent absolute Classes.WakeMainThread;
  GlobalNameSpace: IReadWriteSync absolute Classes.GlobalNameSpace;
  MainThreadID: TThreadID absolute Classes.MainThreadID;
function CheckSynchronize(timeout : longint=0) : boolean; inline;
function Point(AX, AY: Integer): TPoint; inline;
function SmallPoint(AX, AY: SmallInt): TSmallPoint; inline;
function Rect(ALeft, ATop, ARight, ABottom: Integer): TRect; inline;
function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect; inline;
function PointsEqual(const P1, P2: TPoint): Boolean; overload; inline;
function PointsEqual(const P1, P2: TSmallPoint): Boolean; overload; inline;
function InvalidPoint(X, Y: Integer): Boolean; overload; inline;
function InvalidPoint(const At: TPoint): Boolean; overload; inline;
function InvalidPoint(const At: TSmallPoint): Boolean; overload; inline;
procedure RegisterClass(AClass: TPersistentClass); inline;
procedure RegisterClasses(AClasses: array of TPersistentClass); inline;
procedure RegisterClassAlias(AClass: TPersistentClass; const Alias: string); inline;
procedure UnRegisterClass(AClass: TPersistentClass); inline;
procedure UnRegisterClasses(AClasses: array of TPersistentClass); inline;
procedure UnRegisterModuleClasses(Module: HMODULE); inline;
function FindClass(const AClassName: string): TPersistentClass; inline;
function GetClass(const AClassName: string): TPersistentClass; inline;
procedure StartClassGroup(AClass: TPersistentClass); inline;
procedure GroupDescendentsWith(AClass, AClassGroup: TPersistentClass); inline;
function ActivateClassGroup(AClass: TPersistentClass): TPersistentClass; inline;
function ClassGroupOf(AClass: TPersistentClass): TPersistentClass; overload; inline;
function ClassGroupOf(Instance: TPersistent): TPersistentClass; overload; inline;
procedure RegisterComponents(const Page: string; ComponentClasses: array of TComponentClass); inline;
procedure RegisterNoIcon(ComponentClasses: array of TComponentClass); inline;
procedure RegisterNonActiveX(ComponentClasses: array of TComponentClass; AxRegType: TActiveXRegType); inline;
procedure RegisterIntegerConsts(IntegerType: Pointer; IdentToIntFn: TIdentToInt; IntToIdentFn: TIntToIdent); inline;
function IdentToInt(const Ident: string; out Int: Longint; const Map: array of TIdentMapEntry): Boolean; inline;
function IntToIdent(Int: Longint; var Ident: string; const Map: array of TIdentMapEntry): Boolean; inline;
function FindIntToIdent(AIntegerType: Pointer): TIntToIdent; inline;
function FindIdentToInt(AIntegerType: Pointer): TIdentToInt; inline;
procedure RegisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent); inline;
procedure UnregisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent); inline;
function FindGlobalComponent(const Name: string): TComponent; inline;
function InitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean; inline;
function InitComponentRes(const ResName: string; Instance: TComponent): Boolean; inline;
function ReadComponentRes(const ResName: string; Instance: TComponent): TComponent; inline;
function ReadComponentResEx(HInstance: THandle; const ResName: string): TComponent; inline;
function ReadComponentResFile(const FileName: string; Instance: TComponent): TComponent; inline;
procedure WriteComponentResFile(const FileName: string; Instance: TComponent); inline;
procedure RegisterInitComponentHandler(ComponentClass: TComponentClass; Handler: TInitComponentHandler); inline;
procedure GlobalFixupReferences; inline;
procedure GetFixupReferenceNames(Root: TComponent; Names: TStrings); inline;
procedure GetFixupInstanceNames(Root: TComponent; const ReferenceRootName: string; Names: TStrings); inline;
procedure RedirectFixupReferences(Root: TComponent; const OldRootName, NewRootName: string); inline;
procedure RemoveFixupReferences(Root: TComponent; const RootName: string); inline;
procedure RemoveFixups(Instance: TPersistent); inline;
Function FindNestedComponent(Root : TComponent; APath : String; CStyle : Boolean = True) : TComponent; inline;
procedure BeginGlobalLoading; inline;
procedure NotifyGlobalLoading; inline;
procedure EndGlobalLoading; inline;
function CollectionsEqual(C1, C2: TCollection): Boolean; overload; inline;
function CollectionsEqual(C1, C2: TCollection; Owner1, Owner2: TComponent): Boolean; overload; inline;
procedure ObjectBinaryToText(Input, Output: TStream; Encoding: TObjectTextEncoding); overload; inline;
procedure ObjectBinaryToText(Input, Output: TStream); overload; inline;
procedure ObjectTextToBinary(Input, Output: TStream); inline;
procedure ObjectResourceToText(Input, Output: TStream); inline;
procedure ObjectTextToResource(Input, Output: TStream); inline;
function LineStart(Buffer, BufPos: PChar): PChar; inline;
procedure BinToHex(BinValue, HexValue: PChar; BinBufSize: Integer); inline;
function HexToBin(HexValue, BinValue: PChar; BinBufSize: Integer): Integer; inline;
function ExtractStrings(Separators, WhiteSpace: TSysCharSet; Content: PChar; Strings: TStrings; AddEmptyStrings : Boolean = False): Integer; inline;

implementation

function CheckSynchronize(timeout : longint=0) : boolean;
begin
  Result := Classes.CheckSynchronize(timeout);
end;

function Point(AX, AY: Integer): TPoint;
begin
  Result := Classes.Point(AX, AY);
end;

function SmallPoint(AX, AY: SmallInt): TSmallPoint;
begin
  Result := Classes.SmallPoint(AX, AY);
end;

function Rect(ALeft, ATop, ARight, ABottom: Integer): TRect;
begin
  Result := Classes.Rect(ALeft, ATop, ARight, ABottom);
end;

function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
begin
  Result := Classes.Bounds(ALeft, ATop, AWidth, AHeight);
end;

function PointsEqual(const P1, P2: TPoint): Boolean;
begin
  Result := Classes.PointsEqual(P1, P2);
end;

function PointsEqual(const P1, P2: TSmallPoint): Boolean;
begin
  Result := Classes.PointsEqual(P1, P2);
end;

function InvalidPoint(X, Y: Integer): Boolean;
begin
  Result := Classes.InvalidPoint(X, Y);
end;

function InvalidPoint(const At: TPoint): Boolean;
begin
  Result := Classes.InvalidPoint(At);
end;

function InvalidPoint(const At: TSmallPoint): Boolean;
begin
  Result := Classes.InvalidPoint(At);
end;

procedure RegisterClass(AClass: TPersistentClass);
begin
  Classes.RegisterClass(AClass);
end;

procedure RegisterClasses(AClasses: array of TPersistentClass);
begin
  Classes.RegisterClasses(AClasses);
end;

procedure RegisterClassAlias(AClass: TPersistentClass; const Alias: string);
begin
  Classes.RegisterClassAlias(AClass, Alias);
end;

procedure UnRegisterClass(AClass: TPersistentClass);
begin
  Classes.UnRegisterClass(AClass);
end;

procedure UnRegisterClasses(AClasses: array of TPersistentClass);
begin
  Classes.UnRegisterClasses(AClasses);
end;

procedure UnRegisterModuleClasses(Module: HMODULE);
begin
  Classes.UnRegisterModuleClasses(Module);
end;

function FindClass(const AClassName: string): TPersistentClass;
begin
  Result := Classes.FindClass(AClassName);
end;

function GetClass(const AClassName: string): TPersistentClass;
begin
  Result := Classes.GetClass(AClassName);
end;

procedure StartClassGroup(AClass: TPersistentClass);
begin
  Classes.StartClassGroup(AClass);
end;

procedure GroupDescendentsWith(AClass, AClassGroup: TPersistentClass);
begin
  Classes.GroupDescendentsWith(AClass, AClassGroup);
end;

function ActivateClassGroup(AClass: TPersistentClass): TPersistentClass;
begin
  Result := Classes.ActivateClassGroup(AClass);
end;

function ClassGroupOf(AClass: TPersistentClass): TPersistentClass;
begin
  Result := Classes.ClassGroupOf(AClass);
end;

function ClassGroupOf(Instance: TPersistent): TPersistentClass;
begin
  Result := Classes.ClassGroupOf(Instance);
end;

procedure RegisterComponents(const Page: string; ComponentClasses: array of TComponentClass);
begin
  Classes.RegisterComponents(Page, ComponentClasses);
end;

procedure RegisterNoIcon(ComponentClasses: array of TComponentClass);
begin
  Classes.RegisterNoIcon(ComponentClasses);
end;

procedure RegisterNonActiveX(ComponentClasses: array of TComponentClass; AxRegType: TActiveXRegType);
begin
  Classes.RegisterNonActiveX(ComponentClasses, AxRegType);
end;

procedure RegisterIntegerConsts(IntegerType: Pointer; IdentToIntFn: TIdentToInt; IntToIdentFn: TIntToIdent);
begin
  Classes.RegisterIntegerConsts(IntegerType, IdentToIntFn, IntToIdentFn);
end;

function IdentToInt(const Ident: string; out Int: Longint; const Map: array of TIdentMapEntry): Boolean;
begin
  Result := Classes.IdentToInt(Ident, Int, Map);
end;

function IntToIdent(Int: Longint; var Ident: string; const Map: array of TIdentMapEntry): Boolean;
begin
  Result := Classes.IntToIdent(Int, Ident, Map);
end;

function FindIntToIdent(AIntegerType: Pointer): TIntToIdent;
begin
  Result := Classes.FindIntToIdent(AIntegerType);
end;

function FindIdentToInt(AIntegerType: Pointer): TIdentToInt;
begin
  Result := Classes.FindIdentToInt(AIntegerType);
end;

procedure RegisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent);
begin
  Classes.RegisterFindGlobalComponentProc(AFindGlobalComponent);
end;

procedure UnregisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent);
begin
  Classes.UnregisterFindGlobalComponentProc(AFindGlobalComponent);
end;

function FindGlobalComponent(const Name: string): TComponent;
begin
  Result := Classes.FindGlobalComponent(Name);
end;

function InitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean;
begin
  Result := Classes.InitInheritedComponent(Instance, RootAncestor);
end;

function InitComponentRes(const ResName: string; Instance: TComponent): Boolean;
begin
  Result := Classes.InitComponentRes(ResName, Instance);
end;

function ReadComponentRes(const ResName: string; Instance: TComponent): TComponent;
begin
  Result := Classes.ReadComponentRes(ResName, Instance);
end;

function ReadComponentResEx(HInstance: THandle; const ResName: string): TComponent;
begin
  Result := Classes.ReadComponentResEx(HInstance, ResName);
end;

function ReadComponentResFile(const FileName: string; Instance: TComponent): TComponent;
begin
  Result := Classes.ReadComponentResFile(FileName, Instance);
end;

procedure WriteComponentResFile(const FileName: string; Instance: TComponent);
begin
  Classes.WriteComponentResFile(FileName, Instance);
end;

procedure RegisterInitComponentHandler(ComponentClass: TComponentClass; Handler: TInitComponentHandler);
begin
  Classes.RegisterInitComponentHandler(ComponentClass, Handler);
end;

procedure GlobalFixupReferences;
begin
  Classes.GlobalFixupReferences;
end;

procedure GetFixupReferenceNames(Root: TComponent; Names: TStrings);
begin
  Classes.GetFixupReferenceNames(Root, Names);
end;

procedure GetFixupInstanceNames(Root: TComponent; const ReferenceRootName: string; Names: TStrings);
begin
  Classes.GetFixupInstanceNames(Root, ReferenceRootName, Names);
end;

procedure RedirectFixupReferences(Root: TComponent; const OldRootName, NewRootName: string);
begin
  Classes.RedirectFixupReferences(Root, OldRootName, NewRootName);
end;

procedure RemoveFixupReferences(Root: TComponent; const RootName: string);
begin
  Classes.RemoveFixupReferences(Root, RootName);
end;

procedure RemoveFixups(Instance: TPersistent);
begin
  Classes.RemoveFixups(Instance);
end;

Function FindNestedComponent(Root : TComponent; APath : String; CStyle : Boolean = True) : TComponent;
begin
  Result := Classes.FindNestedComponent(Root, APath, CStyle);
end;

procedure BeginGlobalLoading;
begin
  Classes.BeginGlobalLoading;
end;

procedure NotifyGlobalLoading;
begin
  Classes.NotifyGlobalLoading;
end;

procedure EndGlobalLoading;
begin
  Classes.EndGlobalLoading;
end;

function CollectionsEqual(C1, C2: TCollection): Boolean;
begin
  Result := Classes.CollectionsEqual(C1, C2);
end;

function CollectionsEqual(C1, C2: TCollection; Owner1, Owner2: TComponent): Boolean;
begin
  Result := Classes.CollectionsEqual(C1, C2, Owner1, Owner2);
end;

procedure ObjectBinaryToText(Input, Output: TStream; Encoding: TObjectTextEncoding);
begin
  Classes.ObjectBinaryToText(Input, Output, Encoding);
end;

procedure ObjectBinaryToText(Input, Output: TStream);
begin
  Classes.ObjectBinaryToText(Input, Output);
end;

procedure ObjectTextToBinary(Input, Output: TStream);
begin
  Classes.ObjectTextToBinary(Input, Output);
end;

procedure ObjectResourceToText(Input, Output: TStream);
begin
  Classes.ObjectResourceToText(Input, Output);
end;

procedure ObjectTextToResource(Input, Output: TStream);
begin
  Classes.ObjectTextToResource(Input, Output);
end;

function LineStart(Buffer, BufPos: PChar): PChar;
begin
  Result := Classes.LineStart(Buffer, BufPos);
end;

procedure BinToHex(BinValue, HexValue: PChar; BinBufSize: Integer);
begin
  Classes.BinToHex(BinValue, HexValue, BinBufSize);
end;

function HexToBin(HexValue, BinValue: PChar; BinBufSize: Integer): Integer;
begin
  Result := Classes.HexToBin(HexValue, BinValue, BinBufSize);
end;

function ExtractStrings(Separators, WhiteSpace: TSysCharSet; Content: PChar; Strings: TStrings; AddEmptyStrings : Boolean = False): Integer;
begin
  Result := Classes.ExtractStrings(Separators, WhiteSpace, Content, Strings, AddEmptyStrings);
end;

end.
