{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.SysUtils
  Gerado por tools/genvclcompat.py a partir de SysUtils.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.SysUtils;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  SysUtils;
type
  TMonthNameArray = SysUtils.TMonthNameArray;
  TWeekNameArray = SysUtils.TWeekNameArray;
  TFormatSettings = SysUtils.TFormatSettings;
  TSysLocale = SysUtils.TSysLocale;
  TExecuteFlags = SysUtils.TExecuteFlags;
  TGetVendorNameEvent = SysUtils.TGetVendorNameEvent;
  TGetAppNameEvent = SysUtils.TGetAppNameEvent;
  TGetTempDirEvent = SysUtils.TGetTempDirEvent;
  TGetTempFileEvent = SysUtils.TGetTempFileEvent;
  TEventType = SysUtils.TEventType;
  TEventTypes = SysUtils.TEventTypes;
  PDayTable = SysUtils.PDayTable;
  TDayTable = SysUtils.TDayTable;
  TFormatDateTimeOption = SysUtils.TFormatDateTimeOption;
  TFormatDateTimeOptions = SysUtils.TFormatDateTimeOptions;
  TSystemTime = SysUtils.TSystemTime;
  TTimeStamp = SysUtils.TTimeStamp;
  TLocaleOptions = SysUtils.TLocaleOptions;
  TFloatFormat = SysUtils.TFloatFormat;
  TFloatValue = SysUtils.TFloatValue;
  TReplaceFlags = SysUtils.TReplaceFlags;
  TFloatRec = SysUtils.TFloatRec;
  TMbcsByteType = SysUtils.TMbcsByteType;
  TSysCharSet = SysUtils.TSysCharSet;
  PSysCharSet = SysUtils.PSysCharSet;
  TAnsiStringBuilder = SysUtils.TAnsiStringBuilder;
  TUnicodeStringBuilder = SysUtils.TUnicodeStringBuilder;
  TProcedure = SysUtils.TProcedure;
  TFileName = SysUtils.TFileName;
  TIntegerSet = SysUtils.TIntegerSet;
  LongRec = SysUtils.LongRec;
  WordRec = SysUtils.WordRec;
  Int64Rec = SysUtils.Int64Rec;
  Int128Rec = SysUtils.Int128Rec;
  OWordRec = SysUtils.OWordRec;
  PByteArray = SysUtils.PByteArray;
  TByteArray = SysUtils.TByteArray;
  PWordarray = SysUtils.PWordarray;
  TWordArray = SysUtils.TWordArray;
  TBytes = SysUtils.TBytes;
  Exception = SysUtils.Exception;
  ExceptClass = SysUtils.ExceptClass;
  EExternal = SysUtils.EExternal;
  EIntError = SysUtils.EIntError;
  EDivByZero = SysUtils.EDivByZero;
  ERangeError = SysUtils.ERangeError;
  EIntOverflow = SysUtils.EIntOverflow;
  EMathError = SysUtils.EMathError;
  EInvalidOp = SysUtils.EInvalidOp;
  EZeroDivide = SysUtils.EZeroDivide;
  EOverflow = SysUtils.EOverflow;
  EUnderflow = SysUtils.EUnderflow;
  EInOutError = SysUtils.EInOutError;
  EHeapMemoryError = SysUtils.EHeapMemoryError;
  EExternalException = SysUtils.EExternalException;
  EInvalidPointer = SysUtils.EInvalidPointer;
  EOutOfMemory = SysUtils.EOutOfMemory;
  EInvalidCast = SysUtils.EInvalidCast;
  EVariantError = SysUtils.EVariantError;
  EAccessViolation = SysUtils.EAccessViolation;
  EBusError = SysUtils.EBusError;
  EPrivilege = SysUtils.EPrivilege;
  EStackOverflow = SysUtils.EStackOverflow;
  EControlC = SysUtils.EControlC;
  EConvertError = SysUtils.EConvertError;
  EFormatError = SysUtils.EFormatError;
  EAbort = SysUtils.EAbort;
  EAbstractError = SysUtils.EAbstractError;
  EAssertionFailed = SysUtils.EAssertionFailed;
  EObjectCheck = SysUtils.EObjectCheck;
  EThreadError = SysUtils.EThreadError;
  ESigQuit = SysUtils.ESigQuit;
  EPropReadOnly = SysUtils.EPropReadOnly;
  EPropWriteOnly = SysUtils.EPropWriteOnly;
  EIntfCastError = SysUtils.EIntfCastError;
  EInvalidContainer = SysUtils.EInvalidContainer;
  EInvalidInsert = SysUtils.EInvalidInsert;
  EPackageError = SysUtils.EPackageError;
  EOSError = SysUtils.EOSError;
  ESafecallException = SysUtils.ESafecallException;
  ENoThreadSupport = SysUtils.ENoThreadSupport;
  ENoWideStringSupport = SysUtils.ENoWideStringSupport;
  ENoDynLibsSupport = SysUtils.ENoDynLibsSupport;
  EProgrammerNotFound = SysUtils.EProgrammerNotFound;
  ENotImplemented = SysUtils.ENotImplemented;
  EArgumentException = SysUtils.EArgumentException;
  EArgumentOutOfRangeException = SysUtils.EArgumentOutOfRangeException;
  EArgumentNilException = SysUtils.EArgumentNilException;
  EPathTooLongException = SysUtils.EPathTooLongException;
  ENotSupportedException = SysUtils.ENotSupportedException;
  EDirectoryNotFoundException = SysUtils.EDirectoryNotFoundException;
  EFileNotFoundException = SysUtils.EFileNotFoundException;
  EPathNotFoundException = SysUtils.EPathNotFoundException;
  EInvalidOpException = SysUtils.EInvalidOpException;
  ENoConstructException = SysUtils.ENoConstructException;
  TBeepHandler = SysUtils.TBeepHandler;
  TCreateGUIDFunc = SysUtils.TCreateGUIDFunc;
  TTerminateProc = SysUtils.TTerminateProc;
  TUnicodeCharArray = SysUtils.TUnicodeCharArray;
  EEncodingError = SysUtils.EEncodingError;
  TEncoding = SysUtils.TEncoding;
  TMBCSEncoding = SysUtils.TMBCSEncoding;
  TUTF7Encoding = SysUtils.TUTF7Encoding;
  TUTF8Encoding = SysUtils.TUTF8Encoding;
  TUnicodeEncoding = SysUtils.TUnicodeEncoding;
  TBigEndianUnicodeEncoding = SysUtils.TBigEndianUnicodeEncoding;
  TFilenameCaseMatch = SysUtils.TFilenameCaseMatch;
  TUnicodeSearchRec = SysUtils.TUnicodeSearchRec;
  TRawbyteSearchRec = SysUtils.TRawbyteSearchRec;
  TUnicodeSymLinkRec = SysUtils.TUnicodeSymLinkRec;
  TRawbyteSymLinkRec = SysUtils.TRawbyteSymLinkRec;
  TFileSearchOption = SysUtils.TFileSearchOption;
  TFileSearchOptions = SysUtils.TFileSearchOptions;
  IReadWriteSync = SysUtils.IReadWriteSync;
  TSimpleRWSync = SysUtils.TSimpleRWSync;
  TMultiReadExclusiveWriteSynchronizer = SysUtils.TMultiReadExclusiveWriteSynchronizer;
  TMREWException = SysUtils.TMREWException;
  TStringArray = SysUtils.TStringArray;
  TCharArray = SysUtils.TCharArray;
  TByteBitIndex = SysUtils.TByteBitIndex;
  TShortIntBitIndex = SysUtils.TShortIntBitIndex;
  TWordBitIndex = SysUtils.TWordBitIndex;
  TSmallIntBitIndex = SysUtils.TSmallIntBitIndex;
  TCardinalBitIndex = SysUtils.TCardinalBitIndex;
  TIntegerBitIndex = SysUtils.TIntegerBitIndex;
  TQwordBitIndex = SysUtils.TQwordBitIndex;
  TInt64BitIndex = SysUtils.TInt64BitIndex;
  TStringSplitOptions = SysUtils.TStringSplitOptions;
  TUseBoolStrs = SysUtils.TUseBoolStrs;
  PString = SysUtils.PString;
  TStringBuilder = SysUtils.TStringBuilder;
  THandle = SysUtils.THandle;
  EHeapException = SysUtils.EHeapException;
  TFileRec = SysUtils.TFileRec;
  TTextRec = SysUtils.TTextRec;
  TSearchRec = SysUtils.TSearchRec;
  TSymLinkRec = SysUtils.TSymLinkRec;
  TEndian = SysUtils.TEndian;
  TLongIntBitIndex = SysUtils.TLongIntBitIndex;
{$if (defined(cpu64))}
  TNativeUIntBitIndex = SysUtils.TNativeUIntBitIndex;
{$endif}
{$if (defined(cpu64))}
  TNativeIntBitIndex = SysUtils.TNativeIntBitIndex;
{$endif}
  TCompareOption = SysUtils.TCompareOption;
  TCompareOptions = SysUtils.TCompareOptions;
const
  etCustom = SysUtils.etCustom;
  etInfo = SysUtils.etInfo;
  etWarning = SysUtils.etWarning;
  etError = SysUtils.etError;
  etDebug = SysUtils.etDebug;
  fdoInterval = SysUtils.fdoInterval;
  loInvariantLocale = SysUtils.loInvariantLocale;
  loUserLocale = SysUtils.loUserLocale;
  ffGeneral = SysUtils.ffGeneral;
  ffExponent = SysUtils.ffExponent;
  ffFixed = SysUtils.ffFixed;
  ffNumber = SysUtils.ffNumber;
  ffCurrency = SysUtils.ffCurrency;
  fvExtended = SysUtils.fvExtended;
  fvCurrency = SysUtils.fvCurrency;
  fvSingle = SysUtils.fvSingle;
  fvReal = SysUtils.fvReal;
  fvDouble = SysUtils.fvDouble;
  fvComp = SysUtils.fvComp;
  mbSingleByte = SysUtils.mbSingleByte;
  mbLeadByte = SysUtils.mbLeadByte;
  mbTrailByte = SysUtils.mbTrailByte;
  mkNone = SysUtils.mkNone;
  mkExactMatch = SysUtils.mkExactMatch;
  mkSingleMatch = SysUtils.mkSingleMatch;
  mkAmbiguous = SysUtils.mkAmbiguous;
  sfoImplicitCurrentDir = SysUtils.sfoImplicitCurrentDir;
  sfoStripQuotes = SysUtils.sfoStripQuotes;
  HoursPerDay = SysUtils.HoursPerDay;
  MinsPerHour = SysUtils.MinsPerHour;
  SecsPerMin = SysUtils.SecsPerMin;
  MSecsPerSec = SysUtils.MSecsPerSec;
  MinsPerDay = SysUtils.MinsPerDay;
  SecsPerHour = SysUtils.SecsPerHour;
  SecsPerDay = SysUtils.SecsPerDay;
  MSecsPerDay = SysUtils.MSecsPerDay;
  JulianEpoch = SysUtils.JulianEpoch;
  UnixEpoch = SysUtils.UnixEpoch;
  DateDelta = SysUtils.DateDelta;
  UnixDateDelta = SysUtils.UnixDateDelta;
  SwitchChars = SysUtils.SwitchChars;
  PathDelim = SysUtils.PathDelim;
  DriveDelim = SysUtils.DriveDelim;
  PathSep = SysUtils.PathSep;
  MAX_PATH = SysUtils.MAX_PATH;
  faReadOnly = SysUtils.faReadOnly;
  faHidden = SysUtils.faHidden;
  faSysFile = SysUtils.faSysFile;
  faVolumeId = SysUtils.faVolumeId;
  faDirectory = SysUtils.faDirectory;
  faArchive = SysUtils.faArchive;
  faNormal = SysUtils.faNormal;
  faTemporary = SysUtils.faTemporary;
  faSymLink = SysUtils.faSymLink;
  faCompressed = SysUtils.faCompressed;
  faEncrypted = SysUtils.faEncrypted;
  faVirtual = SysUtils.faVirtual;
  faAnyFile = SysUtils.faAnyFile;
  fmOpenRead = SysUtils.fmOpenRead;
  fmOpenWrite = SysUtils.fmOpenWrite;
  fmOpenReadWrite = SysUtils.fmOpenReadWrite;
  fmShareCompat = SysUtils.fmShareCompat;
  fmShareExclusive = SysUtils.fmShareExclusive;
  fmShareDenyWrite = SysUtils.fmShareDenyWrite;
  fmShareDenyRead = SysUtils.fmShareDenyRead;
  fmShareDenyNone = SysUtils.fmShareDenyNone;
  fsFromBeginning = SysUtils.fsFromBeginning;
  fsFromCurrent = SysUtils.fsFromCurrent;
  fsFromEnd = SysUtils.fsFromEnd;
  feInvalidHandle = SysUtils.feInvalidHandle;
  CPUEndian = SysUtils.CPUEndian;
  pfExeModule = SysUtils.pfExeModule;
  pfNeverBuild = SysUtils.pfNeverBuild;
  pfDesignOnly = SysUtils.pfDesignOnly;
  pfRunOnly = SysUtils.pfRunOnly;
  pfIgnoreDupUnits = SysUtils.pfIgnoreDupUnits;
  pfPackageModule = SysUtils.pfPackageModule;
  pfModuleTypeMask = SysUtils.pfModuleTypeMask;
  pfV3Produced = SysUtils.pfV3Produced;
  pfProducerUndefined = SysUtils.pfProducerUndefined;
  pfBCB4Produced = SysUtils.pfBCB4Produced;
  pfDelphi4Produced = SysUtils.pfDelphi4Produced;
  pfLibraryModule = SysUtils.pfLibraryModule;
  pfProducerMask = SysUtils.pfProducerMask;
  ufMainUnit = SysUtils.ufMainUnit;
  ufPackageUnit = SysUtils.ufPackageUnit;
  ufWeakUnit = SysUtils.ufWeakUnit;
  ufOrgWeakUnit = SysUtils.ufOrgWeakUnit;
  ufImplicitUnit = SysUtils.ufImplicitUnit;
  ufWeakPackageUnit = SysUtils.ufWeakPackageUnit;
var
  DefaultFormatSettings: TFormatSettings absolute SysUtils.DefaultFormatSettings;
  FormatSettings: TFormatSettings absolute SysUtils.FormatSettings;
  DateSeparator: char absolute SysUtils.DateSeparator;
  ShortDateFormat: string absolute SysUtils.ShortDateFormat;
  LongDateFormat: string absolute SysUtils.LongDateFormat;
  ShortMonthNames: TMonthNameArray absolute SysUtils.ShortMonthNames;
  LongMonthNames: TMonthNameArray absolute SysUtils.LongMonthNames;
  ShortDayNames: TWeekNameArray absolute SysUtils.ShortDayNames;
  LongDayNames: TWeekNameArray absolute SysUtils.LongDayNames;
  ShortTimeFormat: string absolute SysUtils.ShortTimeFormat;
  LongTimeFormat: string absolute SysUtils.LongTimeFormat;
  TimeSeparator: char absolute SysUtils.TimeSeparator;
  TimeAMString: string absolute SysUtils.TimeAMString;
  TimePMString: string absolute SysUtils.TimePMString;
  DecimalSeparator: Char absolute SysUtils.DecimalSeparator;
  ThousandSeparator: Char absolute SysUtils.ThousandSeparator;
  CurrencyDecimals: Byte absolute SysUtils.CurrencyDecimals;
  CurrencyFormat: Byte absolute SysUtils.CurrencyFormat;
  NegCurrFormat: Byte absolute SysUtils.NegCurrFormat;
  CurrencyString: String absolute SysUtils.CurrencyString;
  ListSeparator: Char absolute SysUtils.ListSeparator;
  SysLocale: TSysLocale absolute SysUtils.SysLocale;
  ConfigExtension: String absolute SysUtils.ConfigExtension;
  SysConfigDir: String absolute SysUtils.SysConfigDir;
  OnGetVendorName: TGetVendorNameEvent absolute SysUtils.OnGetVendorName;
  OnGetApplicationName: TGetAppNameEvent absolute SysUtils.OnGetApplicationName;
  OnGetTempDir: TGetTempDirEvent absolute SysUtils.OnGetTempDir;
  OnGetTempFile: TGetTempFileEvent absolute SysUtils.OnGetTempFile;
  TwoDigitYearCenturyWindow: word absolute SysUtils.TwoDigitYearCenturyWindow;
{$if (not defined(FPUNONE))}
  MinDateTime: TDateTime absolute SysUtils.MinDateTime;
{$endif}
{$if (not defined(FPUNONE))}
  MaxDateTime: TDateTime absolute SysUtils.MaxDateTime;
{$endif}
  MinCurrency: Currency absolute SysUtils.MinCurrency;
  MaxCurrency: Currency absolute SysUtils.MaxCurrency;
  EmptyStr: string absolute SysUtils.EmptyStr;
  NullStr: PString absolute SysUtils.NullStr;
  EmptyWideStr: WideString absolute SysUtils.EmptyWideStr;
  OnBeep: TBeephandler absolute SysUtils.OnBeep;
  OnCreateGUID: TCreateGUIDFunc absolute SysUtils.OnCreateGUID;
  HexDisplayPrefix: string absolute SysUtils.HexDisplayPrefix;
  GUID_NULL: TGuid absolute SysUtils.GUID_NULL;
Function GetLastOSError : Integer; inline;
Procedure RaiseLastOSError; overload; inline;
Procedure RaiseLastOSError(LastError: Integer); overload; inline;
procedure CheckOSError(LastError: Integer); inline; platform;
Function GetEnvironmentVariable(Const EnvVar : AnsiString) : AnsiString; overload; inline;
Function GetEnvironmentVariable(Const EnvVar : UnicodeString) : UnicodeString; overload; inline;
Function GetEnvironmentString(Index : Integer) : AnsiString; inline;
Function GetEnvironmentVariableCount : Integer; inline;
procedure Sleep(milliseconds: Cardinal); inline;
function ExecuteProcess(Const Path: RawByteString; Const ComLine: RawByteString;Flags:TExecuteFlags=[]):integer; overload; inline;
function ExecuteProcess(Const Path: RawByteString; Const ComLine: Array of RawByteString;Flags:TExecuteFlags=[]):integer; overload; inline;
function ExecuteProcess(Const Path: UnicodeString; Const ComLine: UnicodeString;Flags:TExecuteFlags=[]):integer; overload; inline;
function ExecuteProcess(Const Path: UnicodeString; Const ComLine: Array of UnicodeString;Flags:TExecuteFlags=[]):integer; overload; inline;
Function GetTempDir(Global : Boolean) : String; overload; inline;
Function GetTempDir : String; overload; inline;
Function GetTempFileName(Const Dir,Prefix : String) : String; overload; inline;
Function GetTempFileName : String; overload; inline;
function GetTempFileName(Dir,Prefix: PChar; uUnique: DWORD; TempFileName: PChar):DWORD; overload; inline;
Function GetAppConfigDir(Global : Boolean) : String; inline;
Function GetAppConfigFile(Global : Boolean) : String; overload; inline;
Function GetAppConfigFile(Global : Boolean; SubDir : Boolean) : String; overload; inline;
Function GetUserDir : String; inline;
Function VendorName : String; inline;
Function ApplicationName : String; inline;
function DateTimeToTimeStamp(DateTime: TDateTime): TTimeStamp; inline;
function TimeStampToDateTime(const TimeStamp: TTimeStamp): TDateTime; inline;
function MSecsToTimeStamp(MSecs: Comp): TTimeStamp; inline;
function TimeStampToMSecs(const TimeStamp: TTimeStamp): comp; inline;
function TryEncodeDate(Year, Month, Day: Word; out Date: TDateTime): Boolean; inline;
function TryEncodeTime(Hour, Min, Sec, MSec: Word; out Time: TDateTime): Boolean; inline;
function EncodeDate(Year, Month, Day :word): TDateTime; inline;
function EncodeTime(Hour, Minute, Second, MilliSecond:word): TDateTime; inline;
function ComposeDateTime(Date,Time : TDateTime) : TDateTime; inline;
procedure DecodeDate(Date: TDateTime; out Year, Month, Day: word); inline;
function DecodeDateFully(const DateTime: TDateTime; out Year, Month, Day, DOW: Word): Boolean; inline;
procedure DecodeTime(Time: TDateTime; out Hour, Minute, Second, MilliSecond: word); inline;
procedure DateTimeToSystemTime(DateTime: TDateTime; out SystemTime: TSystemTime); inline;
function SystemTimeToDateTime(const SystemTime: TSystemTime): TDateTime; inline;
function DayOfWeek(DateTime: TDateTime): integer; inline;
function Date: TDateTime; inline;
function Time: TDateTime; inline;
function Now: TDateTime; inline;
function IncMonth(const DateTime: TDateTime; NumberOfMonths: integer = 1 ): TDateTime; inline;
procedure IncAMonth(var Year, Month, Day: Word; NumberOfMonths: Integer = 1); inline;
function IsLeapYear(Year: Word): boolean; inline;
function DateToStr(Date: TDateTime): string; overload; inline;
function DateToStr(Date: TDateTime; const FormatSettings: TFormatSettings): string; overload; inline;
function TimeToStr(Time: TDateTime): string; overload; inline;
function TimeToStr(Time: TDateTime; const FormatSettings: TFormatSettings): string; overload; inline;
function DateTimeToStr(DateTime: TDateTime; ForceTimeIfZero : Boolean = False): string; overload; inline;
function DateTimeToStr(DateTime: TDateTime; const FormatSettings: TFormatSettings; ForceTimeIfZero : Boolean = False): string; overload; inline;
function StrToDate(const S: ShortString): TDateTime; overload; inline;
function StrToDate(const S: Ansistring): TDateTime; overload; inline;
function StrToDate(const S: ShortString; separator : char): TDateTime; overload; inline;
function StrToDate(const S: AnsiString; separator : char): TDateTime; overload; inline;
function StrToDate(const S: string; FormatSettings : TFormatSettings): TDateTime; overload; inline;
function StrToDate(const S: ShortString; const useformat : string; separator : char = #0): TDateTime; overload; inline;
function StrToDate(const S: AnsiString; const useformat : string; separator : char = #0): TDateTime; overload; inline;
function StrToDate(const S: PChar; Len : integer; const useformat : string; separator : char = #0): TDateTime; overload; inline;
function StrToTime(const S: Shortstring): TDateTime; overload; inline;
function StrToTime(const S: Ansistring): TDateTime; overload; inline;
function StrToTime(const S: ShortString; separator : char): TDateTime; overload; inline;
function StrToTime(const S: AnsiString; separator : char): TDateTime; overload; inline;
function StrToTime(const S: string; FormatSettings : TFormatSettings): TDateTime; overload; inline;
function StrToTime(const S: PChar; Len : integer; separator : char = #0): TDateTime; overload; inline;
function StrToDateTime(const S: AnsiString): TDateTime; overload; inline;
function StrToDateTime(const s: ShortString; const FormatSettings : TFormatSettings): TDateTime; overload; inline;
function StrToDateTime(const s: AnsiString; const FormatSettings : TFormatSettings): TDateTime; overload; inline;
function FormatDateTime(const FormatStr: string; DateTime: TDateTime; Options : TFormatDateTimeOptions = []): string; overload; inline;
function FormatDateTime(const FormatStr: string; DateTime: TDateTime; const FormatSettings: TFormatSettings; Options : TFormatDateTimeOptions = []): string; overload; inline;
procedure DateTimeToString(out Result: string; const FormatStr: string; const DateTime: TDateTime; Options : TFormatDateTimeOptions = []); overload; inline;
procedure DateTimeToString(out Result: string; const FormatStr: string; const DateTime: TDateTime; const FormatSettings: TFormatSettings; Options : TFormatDateTimeOptions = []); overload; inline;
Function DateTimeToFileDate(DateTime : TDateTime) : Longint; inline;
Function FileDateToDateTime (Filedate : Longint) :TDateTime; inline;
function TryStrToDate(const S: ShortString; out Value: TDateTime): Boolean; overload; inline;
function TryStrToDate(const S: AnsiString; out Value: TDateTime): Boolean; overload; inline;
function TryStrToDate(const S: ShortString; out Value: TDateTime; separator : char): Boolean; overload; inline;
function TryStrToDate(const S: AnsiString; out Value: TDateTime; separator : char): Boolean; overload; inline;
function TryStrToDate(const S: ShortString; out Value: TDateTime; const useformat : string; separator : char = #0): Boolean; overload; inline;
function TryStrToDate(const S: AnsiString; out Value: TDateTime; const useformat : string; separator : char = #0): Boolean; overload; inline;
function TryStrToDate(const S: string; out Value: TDateTime; const FormatSettings: TFormatSettings): Boolean; overload; inline;
function TryStrToTime(const S: ShortString; out Value: TDateTime): Boolean; overload; inline;
function TryStrToTime(const S: AnsiString; out Value: TDateTime): Boolean; overload; inline;
function TryStrToTime(const S: ShortString; out Value: TDateTime; separator : char): Boolean; overload; inline;
function TryStrToTime(const S: AnsiString; out Value: TDateTime; separator : char): Boolean; overload; inline;
function TryStrToTime(const S: string; out Value: TDateTime; const FormatSettings: TFormatSettings): Boolean; overload; inline;
function TryStrToDateTime(const S: ShortString; out Value: TDateTime): Boolean; overload; inline;
function TryStrToDateTime(const S: AnsiString; out Value: TDateTime): Boolean; overload; inline;
function TryStrToDateTime(const S: string; out Value: TDateTime; const FormatSettings: TFormatSettings): Boolean; overload; inline;
function StrToDateDef(const S: ShortString; const Defvalue : TDateTime): TDateTime; overload; inline;
function StrToDateDef(const S: ShortString; const Defvalue : TDateTime; separator : char): TDateTime; overload; inline;
function StrToDateDef(const S: AnsiString; const Defvalue : TDateTime): TDateTime; overload; inline;
function StrToDateDef(const S: AnsiString; const Defvalue : TDateTime; separator : char): TDateTime; overload; inline;
function StrToTimeDef(const S: ShortString; const Defvalue : TDateTime): TDateTime; overload; inline;
function StrToTimeDef(const S: ShortString; const Defvalue : TDateTime; separator : char): TDateTime; overload; inline;
function StrToTimeDef(const S: AnsiString; const Defvalue : TDateTime): TDateTime; overload; inline;
function StrToTimeDef(const S: AnsiString; const Defvalue : TDateTime; separator : char): TDateTime; overload; inline;
function StrToDateTimeDef(const S: ShortString; const Defvalue : TDateTime): TDateTime; overload; inline;
function StrToDateTimeDef(const S: AnsiString; const Defvalue : TDateTime): TDateTime; overload; inline;
function StrToDateTimeDef(const S: AnsiString; const Defvalue : TDateTime; const FormatSettings: TFormatSettings): TDateTime; overload; inline;
function CurrentYear:Word; inline;
Procedure GetLocalTime(var SystemTime: TSystemTime); inline;
procedure ReplaceTime(var dati:TDateTime; NewTime : TDateTime); inline;
procedure ReplaceDate(var DateTime: TDateTime; const NewDate: TDateTime); inline;
function GetLocalTimeOffset: Integer; inline;
function GetTickCount: LongWord; inline;
function GetTickCount64: QWord; inline;
function NewStr(const S: string): PString; overload; inline;
procedure DisposeStr(S: PString); overload; inline;
procedure DisposeStr(S: PShortString); overload; inline;
procedure AssignStr(var P: PString; const S: string); inline;
procedure AppendStr(var Dest: String; const S: string); inline;
function UpperCase(const s: string): string; overload; inline;
function UpperCase(const s: string; LocaleOptions: TLocaleOptions): string; overload; inline;
function LowerCase(const s: string): string; overload; inline;
function LowerCase(const s: string; LocaleOptions: TLocaleOptions): string; overload; inline;
function LowerCase(const V: variant): string; overload; inline;
function CompareStr(const S1, S2: string): Integer; overload; inline;
function CompareStr(const S1, S2: string; LocaleOptions: TLocaleOptions): Integer; overload; inline;
function CompareMemRange(P1, P2: Pointer; Length: PtrUInt): integer; inline;
function CompareMem(P1, P2: Pointer; Length: PtrUInt): Boolean; inline;
function CompareText(const S1, S2: string): Integer; overload; inline;
function CompareText(const S1, S2: string; LocaleOptions: TLocaleOptions): Integer; overload; inline;
function SameText(const s1,s2:String):Boolean; overload; inline;
function SameText(const s1,s2:String; LocaleOptions: TLocaleOptions):Boolean; overload; inline;
function SameStr(const s1,s2:String):Boolean; overload; inline;
function SameStr(const s1,s2:String; LocaleOptions: TLocaleOptions):Boolean; overload; inline;
function AnsiUpperCase(const s: string): string; inline;
function AnsiLowerCase(const s: string): string; inline;
function AnsiCompareStr(const S1, S2: string): Integer; inline;
function AnsiCompareText(const S1, S2: string): Integer; inline;
function AnsiSameText(const s1,s2:String):Boolean; inline;
function AnsiSameStr(const s1,s2:String):Boolean; inline;
function AnsiStrComp(S1, S2: PChar): Integer; inline;
function AnsiStrIComp(S1, S2: PChar): Integer; inline;
function AnsiStrLComp(S1, S2: PChar; MaxLen: SizeUInt): Integer; inline;
function AnsiStrLIComp(S1, S2: PChar; MaxLen: SizeUInt): Integer; inline;
function AnsiStrLower(Str: PChar): PChar; inline;
function AnsiStrUpper(Str: PChar): PChar; inline;
function AnsiLastChar(const S: string): PChar; inline;
function AnsiStrLastChar(Str: PChar): PChar; inline;
function Trim(const S: string): string; overload; inline;
function TrimLeft(const S: string): string; overload; inline;
function TrimRight(const S: string): string; overload; inline;
function QuotedStr(const S: string): string; inline;
function AnsiQuotedStr(const S: string; Quote: char): string; inline;
function AnsiDequotedStr(const S: string; AQuote: Char): string; inline;
function AnsiExtractQuotedStr(var Src: PChar; Quote: Char): string; inline;
function AdjustLineBreaks(const S: string): string; overload; inline;
function AdjustLineBreaks(const S: string; Style: TTextLineBreakStyle): string; overload; inline;
function IsValidIdent(const Ident: string; AllowDots: Boolean = False; StrictDots: Boolean = False): Boolean; inline;
function IntToStr(Value: Longint): string; overload; inline;
function IntToStr(Value: Int64): string; overload; inline;
function IntToStr(Value: QWord): string; overload; inline;
function UIntToStr(Value: QWord): string; overload; inline;
function UIntToStr(Value: Cardinal): string; overload; inline;
function IntToHex(Value: Longint; Digits: integer): string; overload; inline;
function IntToHex(Value: Int64; Digits: integer): string; overload; inline;
function IntToHex(Value: QWord; Digits: integer): string; overload; inline;
function IntToHex(Value: Int8): string; overload; inline;
function IntToHex(Value: UInt8): string; overload; inline;
function IntToHex(Value: Int16): string; overload; inline;
function IntToHex(Value: UInt16): string; overload; inline;
function IntToHex(Value: Int32): string; overload; inline;
function IntToHex(Value: UInt32): string; overload; inline;
function IntToHex(Value: Int64): string; overload; inline;
function IntToHex(Value: UInt64): string; overload; inline;
function StrToInt(const s: string): Longint; inline;
function StrToDWord(const s: string): DWord; inline;
function StrToUInt(const s: string): Cardinal; inline;
function StrToInt64(const s: string): int64; inline;
function StrToQWord(const s: string): QWord; inline;
function StrToUInt64(const s: string): UInt64; inline;
function TryStrToInt(const s: string; Out i : Longint) : boolean; inline;
function TryStrToDWord(const s: string; Out D : DWord) : boolean; inline;
function TryStrToUInt(const s: string; out C: Cardinal): Boolean; inline;
function TryStrToInt64(const s: string; Out i : int64) : boolean; inline;
function TryStrToQWord(const s: string; Out Q : QWord) : boolean; inline;
function TryStrToUInt64(const s: string; Out u : UInt64) : boolean; inline;
function StrToIntDef(const S: string; Default: Longint): Longint; inline;
function StrToDWordDef(const S: string; Default: DWord): DWord; inline;
function StrToUIntDef(const S: string; Default: Cardinal): Cardinal; inline;
function StrToInt64Def(const S: string; Default: int64): int64; inline;
function StrToQWordDef(const S: string; Default: QWord): QWord; inline;
function StrToUInt64Def(const S: string; Default: UInt64): UInt64; inline;
function LoadStr(Ident: integer): string; inline;
Function Format (Const Fmt : String; const Args : Array of const) : String; overload; inline;
Function Format (Const Fmt: string; const Args: array of const; const FormatSettings: TFormatSettings): string; overload; inline;
Function FormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const) : Cardinal; overload; inline;
Function FormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const; Const FormatSettings: TFormatSettings) : Cardinal; overload; inline;
Function StrFmt(Buffer,Fmt : PChar; Const args: Array of const) : Pchar; overload; inline;
Function StrFmt(Buffer,Fmt : PChar; Const Args: Array of const; Const FormatSettings: TFormatSettings): PChar; overload; inline;
Function StrLFmt(Buffer : PCHar; Maxlen : Cardinal;Fmt : PChar; Const args: Array of const) : Pchar; overload; inline;
Function StrLFmt(Buffer : PCHar; Maxlen : Cardinal;Fmt : PChar; Const args: Array of const; Const FormatSettings: TFormatSettings) : Pchar; overload; inline;
Procedure FmtStr(Var Res: String; Const Fmt : String; Const args: Array of const); overload; inline;
Procedure FmtStr(Var Res: string; const Fmt : string; Const args: Array of const; Const FormatSettings: TFormatSettings); overload; inline;
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function FloatToStrF(Value: Extended; format: TFloatFormat; Precision, Digits: Integer): String; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function FloatToStrF(Value: Extended; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Double; format: TFloatFormat; Precision, Digits: Integer): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Double; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Single; format: TFloatFormat; Precision, Digits: Integer): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Single; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Comp; format: TFloatFormat; Precision, Digits: Integer): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Comp; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Currency; format: TFloatFormat; Precision, Digits: Integer): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Currency; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (not defined(FPC_COMP_IS_INT64))}
Function FloatToStrF(Value: Int64; format: TFloatFormat; Precision, Digits: Integer): String; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (not defined(FPC_COMP_IS_INT64))}
Function FloatToStrF(Value: Int64; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function CurrToStrF(Value: Currency; Format: TFloatFormat; Digits: Integer): string; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function CurrToStrF(Value: Currency; Format: TFloatFormat; Digits: Integer; Const FormatSettings: TFormatSettings): string; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function FloatToStr(Value: Extended): String; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function FloatToStr(Value: Extended; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Double): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Double; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Single): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Single; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Currency): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Currency; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Comp): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Comp; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (not defined(FPC_COMP_IS_INT64))}
Function FloatToStr(Value: Int64): String; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (not defined(FPC_COMP_IS_INT64))}
Function FloatToStr(Value: Int64; Const FormatSettings: TFormatSettings): String; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function StrToFloat(Const S : String) : Extended; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StrToFloat(Const S : String; Const FormatSettings: TFormatSettings) : Extended; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StrToFloatDef(Const S: String; Const Default: Extended): Extended; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StrToFloatDef(Const S: String; Const Default: Extended; Const FormatSettings: TFormatSettings): Extended; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryStrToFloat(Const S : String; Out Value: Single): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryStrToFloat(Const S : String; Out Value: Single; Const FormatSettings: TFormatSettings): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryStrToFloat(Const S : String; Out Value: Double): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryStrToFloat(Const S : String; Out Value: Double; Const FormatSettings: TFormatSettings): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function TryStrToFloat(Const S : String; Out Value: Extended): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function TryStrToFloat(Const S : String; Out Value: Extended; Const FormatSettings: TFormatSettings): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function TextToFloat(Buffer: PChar; Out Value: Extended): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TextToFloat(Buffer: PChar; Out Value: Extended; Const FormatSettings: TFormatSettings): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TextToFloat(Buffer: PChar; Out Value; ValueType: TFloatValue): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TextToFloat(Buffer: PChar; Out Value; ValueType: TFloatValue; Const FormatSettings: TFormatSettings): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToText(Buffer: PChar; Value: Extended; format: TFloatFormat; Precision, Digits: Integer): Longint; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToText(Buffer: PChar; Value: Extended; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): Longint; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToDateTime (Const Value : Extended) : TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloattoCurr (Const Value : Extended) : Currency; inline;
{$endif}
{$if (not defined(FPUNONE))}
function TryFloatToCurr(const Value: Extended; var AResult: Currency): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function CurrToStr(Value: Currency): string; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function CurrToStr(Value: Currency; Const FormatSettings: TFormatSettings): string; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function StrToCurr(const S: string): Currency; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function StrToCurr(const S: string; Const FormatSettings: TFormatSettings): Currency; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function TryStrToCurr(const S: string;Out Value : Currency): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function TryStrToCurr(const S: string;Out Value : Currency; Const FormatSettings: TFormatSettings): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function StrToCurrDef(const S: string; Default : Currency): Currency; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function StrToCurrDef(const S: string; Default : Currency; Const FormatSettings: TFormatSettings): Currency; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToTextFmt(Buffer: PChar; Value: Extended; format: PChar; FormatSettings : TFormatSettings): Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToTextFmt(Buffer: PChar; Value: Extended; format: PChar): Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure FloatToDecimal(Out Result: TFloatRec; const Value; ValueType: TFloatValue; Precision, Decimals : integer); overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure FloatToDecimal(Out Result: TFloatRec; Value: Extended; Precision, Decimals : integer); overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FormatFloat(Const Format : String; Value : Extended) : String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FormatFloat(Const Format : String; Value : Extended; Const FormatSettings: TFormatSettings) : String; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function FormatCurr(const Format: string; Value: Currency): string; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function FormatCurr(const Format: string; Value: Currency; Const FormatSettings: TFormatSettings): string; overload; inline;
{$endif}
function StrToBool(const S: string): Boolean; overload; inline;
function StrToBool(const S: string; Const FormatSettings: TFormatSettings): Boolean; overload; inline;
function BoolToStr(B: Boolean;UseBoolStrs:Boolean=False): string; overload; inline;
function BoolToStr(B: Boolean;const TrueS,FalseS:string): string; overload; inline;
function StrToBoolDef(const S: string; Default: Boolean): Boolean; overload; inline;
function StrToBoolDef(const S: string; Default: Boolean; Const FormatSettings: TFormatSettings): Boolean; overload; inline;
function TryStrToBool(const S: string; out Value: Boolean): Boolean; overload; inline;
function TryStrToBool(const S: string; out Value: Boolean; Const FormatSettings: TFormatSettings): Boolean; overload; inline;
function LastDelimiter(const Delimiters, S: string): SizeInt; inline;
function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags; Out aCount : Integer): string; overload; inline;
function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags): string; overload; inline;
Function IsDelimiter(const Delimiters, S: string; Index: SizeInt): Boolean; inline;
function SScanf(const s: string; const fmt : string;const Pointers : array of Pointer) : Integer; inline;
Function ByteType(const S: string; Index: SizeUInt): TMbcsByteType; inline;
Function StrByteType(Str: PChar; Index: SizeUInt): TMbcsByteType; inline;
Function ByteToCharLen(const S: string; MaxLen: SizeInt): SizeInt; inline;
Function CharToByteLen(const S: string; MaxLen: SizeInt): SizeInt; inline;
Function ByteToCharIndex(const S: string; Index: SizeInt): SizeInt; inline;
Function StrCharLength(const Str: PChar): SizeInt; inline;
function StrNextChar(const Str: PChar): PChar; inline;
function IsLeadChar(C: AnsiChar): Boolean; overload; inline;
function IsLeadChar(B: Byte): Boolean; overload; inline;
Function FindCmdLineSwitch(const Switch: string; const Chars: TSysCharSet;IgnoreCase: Boolean): Boolean; overload; inline;
Function FindCmdLineSwitch(const Switch: string; IgnoreCase: Boolean): Boolean; overload; inline;
Function FindCmdLineSwitch(const Switch: string): Boolean; overload; inline;
function WrapText(const Line, BreakStr: string; const BreakChars: TSysCharSet; MaxCol: Integer): string; overload; inline;
function WrapText(const Line: string; MaxCol: Integer): string; overload; inline;
function LeftStr(const S: string; Count: integer): string; inline;
function RightStr(const S: string; Count: integer): string; inline;
function BCDToInt(Value: integer): integer; inline;
function ExceptObject: TObject; inline;
function ExceptAddr: CodePointer; inline;
function ExceptFrameCount: Longint; inline;
function ExceptFrames: PCodePointer; inline;
function ExceptionErrorMessage(ExceptObject: TObject; ExceptAddr: Pointer; Buffer: PChar; Size: Integer): Integer; inline;
procedure ShowException(ExceptObject: TObject; ExceptAddr: Pointer); inline;
procedure Abort; inline;
procedure OutOfMemoryError; inline;
procedure Beep; inline;
function SysErrorMessage(ErrorCode: Integer): String; inline;
Function CreateGUID(out GUID : TGUID) : Integer; inline;
procedure AddTerminateProc(TermProc: TTerminateProc); inline;
function CallTerminateProcs: Boolean; inline;
function strlen(p:pchar):sizeint; overload; inline;
function strcopy(dest,source : pchar) : pchar; overload; inline;
function strlcopy(dest,source : pchar;maxlen : SizeInt) : pchar; overload; inline;
function strecopy(dest,source : pchar) : pchar; overload; inline;
function strend(p : pchar) : pchar; overload; inline;
function strcat(dest,source : pchar) : pchar; overload; inline;
function strcomp(str1,str2 : pchar) : SizeInt; overload; inline;
function strlcomp(str1,str2 : pchar;l : SizeInt) : SizeInt; overload; inline;
function stricomp(str1,str2 : pchar) : SizeInt; overload; inline;
function strmove(dest,source : pchar;l : SizeInt) : pchar; overload; inline;
function strlcat(dest,source : pchar;l : SizeInt) : pchar; overload; inline;
function strscan(p : pchar;c : char) : pchar; overload; inline;
function strrscan(p : pchar;c : char) : pchar; overload; inline;
function strlower(p : pchar) : pchar; overload; inline;
function strupper(p : pchar) : pchar; overload; inline;
function strlicomp(str1,str2 : pchar;l : SizeInt) : SizeInt; overload; inline;
function strpos(str1,str2 : pchar) : pchar; overload; inline;
function strnew(p : pchar) : pchar; overload; inline;
function StrPas(Str: PChar): string; overload; inline;
function StrPCopy(Dest: PChar; Const Source: string): PChar; overload; inline;
function StrPLCopy(Dest: PChar; Const Source: string; MaxLen: SizeUInt): PChar; overload; inline;
function StrAlloc(Size: cardinal): PChar; inline;
function StrBufSize(Str: PChar): Cardinal; overload; inline;
procedure StrDispose(Str: PChar); overload; inline;
function AnsiCompareFileName(const S1, S2 : string) : SizeInt; inline;
Function SameFileName(const S1, S2: string): Boolean; inline;
function AnsiLowerCaseFileName(const s : string) : string; inline;
function AnsiUpperCaseFileName(const s : string) : string; inline;
function AnsiPos(const substr,s : string) : SizeInt; inline;
function AnsiStrPos(str,substr : PChar) : PChar; inline;
function AnsiStrRScan(Str : PChar;Chr : Char) : PChar; inline;
function AnsiStrScan(Str : PChar;Chr: Char) : PChar; inline;
function HashName(Name: PAnsiChar): LongWord; inline;
function BytesOf(const Val: RawByteString): TBytes; overload; inline;
function BytesOf(const Val: AnsiChar): TBytes; overload; inline;
Function CharInSet(Ch: AnsiChar;Const CSet : TSysCharSet) : Boolean; overload; inline;
function CodePageToCodePageName(cp: TSystemCodePage): AnsiString; inline;
function CodePageNameToCodePage(const cpname: AnsiString): TSystemCodePage; inline;
function WideUpperCase(const s : WideString) : WideString; inline;
function WideLowerCase(const s : WideString) : WideString; inline;
function WideCompareStr(const s1, s2 : WideString) : PtrInt; inline;
function WideSameStr(const s1, s2 : WideString) : Boolean; inline;
function WideCompareText(const s1, s2 : WideString) : PtrInt; inline;
function WideSameText(const s1, s2 : WideString) : Boolean; inline;
Function WideFormat (Const Fmt : WideString; const Args : Array of const) : WideString; overload; inline;
Function WideFormat (Const Fmt : WideString; const Args : Array of const; Const FormatSettings: TFormatSettings) : WideString; overload; inline;
Function WideFormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const) : Cardinal; overload; inline;
Function WideFormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const; Const FormatSettings: TFormatSettings) : Cardinal; overload; inline;
Procedure WideFmtStr(Var Res: WideString; Const Fmt : WideString; Const args: Array of const); overload; inline;
Procedure WideFmtStr(Var Res: WideString; Const Fmt : WideString; Const args: Array of const; Const FormatSettings: TFormatSettings); overload; inline;
function WideStringReplace(const S, OldPattern, NewPattern: WideString; Flags: TReplaceFlags): WideString; overload; inline;
function WideStringReplace(const S, OldPattern, NewPattern: WideString; Flags: TReplaceFlags; Out aCount : Integer): WideString; overload; inline;
function UnicodeUpperCase(const s : UnicodeString) : UnicodeString; inline;
function UnicodeLowerCase(const s : UnicodeString) : UnicodeString; inline;
function UnicodeCompareStr(const s1, s2 : UnicodeString) : PtrInt; inline;
function UnicodeSameStr(const s1, s2 : UnicodeString) : Boolean; inline;
function UnicodeCompareText(const s1, s2 : UnicodeString) : PtrInt; inline;
function UnicodeSameText(const s1, s2 : UnicodeString) : Boolean; inline;
Function UnicodeFormat (Const Fmt : UnicodeString; const Args : Array of const) : UnicodeString; overload; inline;
Function UnicodeFormat (Const Fmt : UnicodeString; const Args : Array of const; Const FormatSettings: TFormatSettings) : UnicodeString; overload; inline;
Function UnicodeFormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const) : Cardinal; overload; inline;
Function UnicodeFormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const; Const FormatSettings: TFormatSettings) : Cardinal; overload; inline;
Procedure UnicodeFmtStr(Var Res: UnicodeString; Const Fmt : UnicodeString; Const args: Array of const); overload; inline;
Procedure UnicodeFmtStr(Var Res: UnicodeString; Const Fmt : UnicodeString; Const args: Array of const; Const FormatSettings: TFormatSettings); overload; inline;
function WideStrAlloc(size: cardinal): pwidechar; inline;
function StringOf(const Bytes: TBytes): UnicodeString; inline;
function WideBytesOf(const Value: UnicodeString): TBytes; inline;
function WideStringOf(const Value: TBytes): UnicodeString; inline;
function ByteLength(const S: UnicodeString): Integer; inline;
function UnicodeStringReplace(const S, OldPattern, NewPattern: UnicodeString; Flags: TReplaceFlags): UnicodeString; overload; inline;
function UnicodeStringReplace(const S, OldPattern, NewPattern: UnicodeString; Flags: TReplaceFlags; Out aCount : Integer): UnicodeString; overload; inline;
function ChangeFileExt(const FileName, Extension: UnicodeString): UnicodeString; overload; inline;
function ExtractFilePath(const FileName: UnicodeString): UnicodeString; overload; inline;
function ExtractFileDrive(const FileName: UnicodeString): UnicodeString; overload; inline;
function ExtractFileName(const FileName: UnicodeString): UnicodeString; overload; inline;
function ExtractFileExt(const FileName: UnicodeString): UnicodeString; overload; inline;
function ExtractFileDir(Const FileName : UnicodeString): UnicodeString; overload; inline;
function ExtractShortPathName(Const FileName : UnicodeString) : UnicodeString; overload; inline;
function ExpandFileName (Const FileName : UnicodeString): UnicodeString; overload; inline;
function ExpandFileNameCase (const FileName: UnicodeString; out MatchFound: TFilenameCaseMatch): UnicodeString; overload; inline;
function ExpandUNCFileName (Const FileName : UnicodeString): UnicodeString; overload; inline;
function ExtractRelativePath (Const BaseName,DestName : UnicodeString): UnicodeString; overload; inline;
function IncludeTrailingPathDelimiter(Const Path : UnicodeString) : UnicodeString; overload; inline;
function IncludeTrailingBackslash(Const Path : UnicodeString) : UnicodeString; overload; inline;
function ExcludeTrailingBackslash(Const Path: UnicodeString): UnicodeString; overload; inline;
function ExcludeTrailingPathDelimiter(Const Path: UnicodeString): UnicodeString; overload; inline;
function IncludeLeadingPathDelimiter(Const Path : UnicodeString) : UnicodeString; overload; inline;
function ExcludeLeadingPathDelimiter(Const Path: UnicodeString): UnicodeString; overload; inline;
function IsPathDelimiter(Const Path: UnicodeString; Index: Integer): Boolean; overload; inline;
Procedure DoDirSeparators (Var FileName : UnicodeString); overload; inline;
Function SetDirSeparators (Const FileName : UnicodeString) : UnicodeString; overload; inline;
Function GetDirs (Var DirName : UnicodeString; Var Dirs : Array of PUnicodeChar) : Longint; overload; inline;
function ConcatPaths(const Paths: array of UnicodeString): UnicodeString; overload; inline;
Function FileOpen (Const FileName : unicodestring; Mode : Integer) : THandle; overload; inline;
Function FileOpen (Const FileName : RawByteString; Mode : Integer) : THandle; overload; inline;
Function FileCreate (Const FileName : UnicodeString) : THandle; overload; inline;
Function FileCreate (Const FileName : UnicodeString; Rights : Integer) : THandle; overload; inline;
Function FileCreate (Const FileName : UnicodeString; ShareMode : Integer; Rights : Integer) : THandle; overload; inline;
Function FileCreate (Const FileName : RawByteString) : THandle; overload; inline;
Function FileCreate (Const FileName : RawByteString; Rights : Integer) : THandle; overload; inline;
Function FileCreate (Const FileName : RawByteString; ShareMode : Integer; Rights : Integer) : THandle; overload; inline;
{$if (not defined(FPUNONE))}
Function FileAge (Const FileName : UnicodeString): Longint; overload; inline;
{$endif}
function FileAge(const FileName: UnicodeString; out FileDateTime: TDateTime; FollowLink: Boolean = True): Boolean; overload; inline;
function FileAge(const FileName: RawByteString; out FileDateTime: TDateTime; FollowLink: Boolean = True): Boolean; overload; inline;
{$if (not defined(FPUNONE))}
Function FileAge (Const FileName : RawByteString): Longint; overload; inline;
{$endif}
Function FileExists (Const FileName : UnicodeString; FollowLink : Boolean = True) : Boolean; overload; inline;
Function FileExists (Const FileName : RawByteString; FollowLink : Boolean = True) : Boolean; overload; inline;
Function DirectoryExists (Const Directory : UnicodeString; FollowLink : Boolean = True) : Boolean; overload; inline;
Function DirectoryExists (Const Directory : RawByteString; FollowLink: Boolean = True) : Boolean; overload; inline;
Function FileSetDate (Const FileName : UnicodeString;Age : Longint) : Longint; overload; inline;
Function FileSetDate (Const FileName : RawByteString;Age : Longint) : Longint; overload; inline;
Function FileSetDate (Handle : THandle;Age : Longint) : Longint; overload; inline;
Function FileGetAttr (Const FileName : UnicodeString) : Longint; overload; inline;
Function FileGetAttr (Const FileName : RawByteString) : Longint; overload; inline;
Function FileSetAttr (Const Filename : UnicodeString; Attr: longint) : Longint; overload; inline;
Function FileSetAttr (Const Filename : RawByteString; Attr: longint) : Longint; overload; inline;
Function DeleteFile (Const FileName : UnicodeString) : Boolean; overload; inline;
Function DeleteFile (Const FileName : RawByteString) : Boolean; overload; inline;
Function RenameFile (Const OldName, NewName : UnicodeString) : Boolean; overload; inline;
Function RenameFile (Const OldName, NewName : RawByteString) : Boolean; overload; inline;
Function FindFirst (Const Path : UnicodeString; Attr : Longint; out Rslt : TUnicodeSearchRec) : Longint; overload; inline;
Function FindFirst (Const Path : RawByteString; Attr : Longint; out Rslt : TRawByteSearchRec) : Longint; overload; inline;
Function FindNext (Var Rslt : TUnicodeSearchRec) : Longint; overload; inline;
Function FindNext (Var Rslt : TRawByteSearchRec) : Longint; overload; inline;
Procedure FindClose (Var F : TUnicodeSearchrec); overload; inline;
Procedure FindClose (Var F : TRawByteSearchrec); overload; inline;
Function FileSearch (Const Name, DirList : UnicodeString; Options : TFileSearchoptions = [sfoImplicitCurrentDir]) : UnicodeString; overload; inline;
Function FileSearch (Const Name, DirList : UnicodeString; ImplicitCurrentDir : Boolean) : UnicodeString; overload; inline;
Function FileSearch (Const Name, DirList : RawByteString; Options : TFileSearchoptions = [sfoImplicitCurrentDir]) : RawByteString; overload; inline;
Function FileSearch (Const Name, DirList : RawByteString; ImplicitCurrentDir : Boolean) : RawByteString; overload; inline;
Function ExeSearch (Const Name : UnicodeString; Const DirList : UnicodeString = '') : UnicodeString; overload; inline;
Function ExeSearch (Const Name : RawByteString; Const DirList : RawByteString = '') : RawByteString; overload; inline;
Function FileIsReadOnly(const FileName : UnicodeString): Boolean; overload; inline;
Function FileIsReadOnly(const FileName: RawByteString): Boolean; overload; inline;
function FileGetSymLinkTarget(const FileName: UnicodeString; out SymLinkRec: TUnicodeSymLinkRec): Boolean; overload; inline;
function FileGetSymLinkTarget(const FileName: UnicodeString; out TargetName: UnicodeString): Boolean; overload; inline;
function FileGetSymLinkTarget(const FileName: RawByteString; out SymLinkRec: TRawbyteSymLinkRec): Boolean; overload; inline;
function FileGetSymLinkTarget(const FileName: RawByteString; out TargetName: RawByteString): Boolean; overload; inline;
Function FileRead (Handle : THandle; out Buffer; Count : longint) : Longint; inline;
Function FileWrite (Handle : THandle; const Buffer; Count : Longint) : Longint; inline;
Function FileSeek (Handle : THandle; FOffset, Origin: Longint) : Longint; overload; inline;
Function FileSeek (Handle : THandle; FOffset: Int64; Origin: Longint) : Int64; overload; inline;
function FileFlush(Handle: THandle): Boolean; inline;
Procedure FileClose (Handle : THandle); inline;
Function FileTruncate (Handle : THandle;Size: Int64) : boolean; inline;
Function FileGetDate (Handle : THandle) : Longint; inline;
Function GetFileHandle(var f : File):THandle; overload; inline;
Function GetFileHandle(var f : Text):THandle; overload; inline;
Function GetFileContents(Const aFileName : RawByteString) : TBytes; overload; inline;
Function GetFileContents(Const aFileName : UnicodeString) : TBytes; overload; inline;
Function GetFileContents(Const aHandle : THandle) : TBytes; overload; inline;
Function GetFileAsString(Const aFileName : RawByteString) : RawByteString; overload; inline;
Function GetFileAsString(Const aFileName : RawByteString; aEncoding : TEncoding) : RawByteString; overload; inline;
Function GetFileAsString(Const aFileName : UnicodeString) : UnicodeString; overload; inline;
Function GetFileAsString(Const aFileName : UnicodeString; aEncoding : TEncoding) : UnicodeString; overload; inline;
Function DiskFree(drive: byte) : int64; inline;
Function DiskSize(drive: byte) : int64; inline;
Function GetCurrentDir : AnsiString; inline;
Function SetCurrentDir (Const NewDir : RawByteString) : Boolean; overload; inline;
Function SetCurrentDir (Const NewDir : UnicodeString) : Boolean; overload; inline;
Function CreateDir (Const NewDir : RawByteString) : Boolean; overload; inline;
Function CreateDir (Const NewDir : UnicodeString) : Boolean; overload; inline;
Function RemoveDir (Const Dir : RawByteString) : Boolean; overload; inline;
Function RemoveDir (Const Dir : UnicodeString) : Boolean; overload; inline;
Function ForceDirectories(Const Dir: RawByteString): Boolean; overload; inline;
Function ForceDirectories(Const Dir: UnicodeString): Boolean; overload; inline;
Function GetDriveIDFromLetter(Const ADrive : RawByteString) : Byte; overload; inline;
Function GetDriveIDFromLetter(Const ADrive : UnicodeString) : Byte; overload; inline;
procedure FreeAndNil(var obj); inline;
procedure FreeMemAndNil(var p); inline;
function Supports(const Instance: IInterface; const AClass: TClass; out Obj): Boolean; overload; inline;
function Supports(const Instance: IInterface; const IID: TGUID; out Intf): Boolean; overload; inline;
function Supports(const Instance: TObject; const IID: TGUID; out Intf): Boolean; overload; inline;
function Supports(const Instance: TObject; const IID: Shortstring; out Intf): Boolean; overload; inline;
function Supports(const Instance: IInterface; const AClass: TClass): Boolean; overload; inline;
function Supports(const Instance: IInterface; const IID: TGUID): Boolean; overload; inline;
function Supports(const Instance: TObject; const IID: TGUID): Boolean; overload; inline;
function Supports(const Instance: TObject; const IID: Shortstring): Boolean; overload; inline;
function Supports(const AClass: TClass; const IID: TGUID): Boolean; overload; inline;
function Supports(const AClass: TClass; const IID: Shortstring): Boolean; overload; inline;
function TryStringToGUID(const S: string; out Guid: TGUID): Boolean; inline;
function StringToGUID(const S: string): TGUID; inline;
function GUIDToString(const GUID: TGUID): string; inline;
function IsEqualGUID(const guid1, guid2: TGUID): Boolean; inline;
function GuidCase(const GUID: TGUID; const List: array of TGuid): Integer; inline;
function GetModuleName(Module: HMODULE): string; inline;

implementation

Function GetLastOSError : Integer;
begin
  Result := SysUtils.GetLastOSError;
end;

Procedure RaiseLastOSError;
begin
  SysUtils.RaiseLastOSError;
end;

Procedure RaiseLastOSError(LastError: Integer);
begin
  SysUtils.RaiseLastOSError(LastError);
end;

procedure CheckOSError(LastError: Integer);
begin
  SysUtils.CheckOSError(LastError);
end;

Function GetEnvironmentVariable(Const EnvVar : AnsiString) : AnsiString;
begin
  Result := SysUtils.GetEnvironmentVariable(EnvVar);
end;

Function GetEnvironmentVariable(Const EnvVar : UnicodeString) : UnicodeString;
begin
  Result := SysUtils.GetEnvironmentVariable(EnvVar);
end;

Function GetEnvironmentString(Index : Integer) : AnsiString;
begin
  Result := SysUtils.GetEnvironmentString(Index);
end;

Function GetEnvironmentVariableCount : Integer;
begin
  Result := SysUtils.GetEnvironmentVariableCount;
end;

procedure Sleep(milliseconds: Cardinal);
begin
  SysUtils.Sleep(milliseconds);
end;

function ExecuteProcess(Const Path: RawByteString; Const ComLine: RawByteString;Flags:TExecuteFlags=[]):integer;
begin
  Result := SysUtils.ExecuteProcess(Path, ComLine, Flags);
end;

function ExecuteProcess(Const Path: RawByteString; Const ComLine: Array of RawByteString;Flags:TExecuteFlags=[]):integer;
begin
  Result := SysUtils.ExecuteProcess(Path, ComLine, Flags);
end;

function ExecuteProcess(Const Path: UnicodeString; Const ComLine: UnicodeString;Flags:TExecuteFlags=[]):integer;
begin
  Result := SysUtils.ExecuteProcess(Path, ComLine, Flags);
end;

function ExecuteProcess(Const Path: UnicodeString; Const ComLine: Array of UnicodeString;Flags:TExecuteFlags=[]):integer;
begin
  Result := SysUtils.ExecuteProcess(Path, ComLine, Flags);
end;

Function GetTempDir(Global : Boolean) : String;
begin
  Result := SysUtils.GetTempDir(Global);
end;

Function GetTempDir : String;
begin
  Result := SysUtils.GetTempDir;
end;

Function GetTempFileName(Const Dir,Prefix : String) : String;
begin
  Result := SysUtils.GetTempFileName(Dir, Prefix);
end;

Function GetTempFileName : String;
begin
  Result := SysUtils.GetTempFileName;
end;

function GetTempFileName(Dir,Prefix: PChar; uUnique: DWORD; TempFileName: PChar):DWORD;
begin
  Result := SysUtils.GetTempFileName(Dir, Prefix, uUnique, TempFileName);
end;

Function GetAppConfigDir(Global : Boolean) : String;
begin
  Result := SysUtils.GetAppConfigDir(Global);
end;

Function GetAppConfigFile(Global : Boolean) : String;
begin
  Result := SysUtils.GetAppConfigFile(Global);
end;

Function GetAppConfigFile(Global : Boolean; SubDir : Boolean) : String;
begin
  Result := SysUtils.GetAppConfigFile(Global, SubDir);
end;

Function GetUserDir : String;
begin
  Result := SysUtils.GetUserDir;
end;

Function VendorName : String;
begin
  Result := SysUtils.VendorName;
end;

Function ApplicationName : String;
begin
  Result := SysUtils.ApplicationName;
end;

function DateTimeToTimeStamp(DateTime: TDateTime): TTimeStamp;
begin
  Result := SysUtils.DateTimeToTimeStamp(DateTime);
end;

function TimeStampToDateTime(const TimeStamp: TTimeStamp): TDateTime;
begin
  Result := SysUtils.TimeStampToDateTime(TimeStamp);
end;

function MSecsToTimeStamp(MSecs: Comp): TTimeStamp;
begin
  Result := SysUtils.MSecsToTimeStamp(MSecs);
end;

function TimeStampToMSecs(const TimeStamp: TTimeStamp): comp;
begin
  Result := SysUtils.TimeStampToMSecs(TimeStamp);
end;

function TryEncodeDate(Year, Month, Day: Word; out Date: TDateTime): Boolean;
begin
  Result := SysUtils.TryEncodeDate(Year, Month, Day, Date);
end;

function TryEncodeTime(Hour, Min, Sec, MSec: Word; out Time: TDateTime): Boolean;
begin
  Result := SysUtils.TryEncodeTime(Hour, Min, Sec, MSec, Time);
end;

function EncodeDate(Year, Month, Day :word): TDateTime;
begin
  Result := SysUtils.EncodeDate(Year, Month, Day);
end;

function EncodeTime(Hour, Minute, Second, MilliSecond:word): TDateTime;
begin
  Result := SysUtils.EncodeTime(Hour, Minute, Second, MilliSecond);
end;

function ComposeDateTime(Date,Time : TDateTime) : TDateTime;
begin
  Result := SysUtils.ComposeDateTime(Date, Time);
end;

procedure DecodeDate(Date: TDateTime; out Year, Month, Day: word);
begin
  SysUtils.DecodeDate(Date, Year, Month, Day);
end;

function DecodeDateFully(const DateTime: TDateTime; out Year, Month, Day, DOW: Word): Boolean;
begin
  Result := SysUtils.DecodeDateFully(DateTime, Year, Month, Day, DOW);
end;

procedure DecodeTime(Time: TDateTime; out Hour, Minute, Second, MilliSecond: word);
begin
  SysUtils.DecodeTime(Time, Hour, Minute, Second, MilliSecond);
end;

procedure DateTimeToSystemTime(DateTime: TDateTime; out SystemTime: TSystemTime);
begin
  SysUtils.DateTimeToSystemTime(DateTime, SystemTime);
end;

function SystemTimeToDateTime(const SystemTime: TSystemTime): TDateTime;
begin
  Result := SysUtils.SystemTimeToDateTime(SystemTime);
end;

function DayOfWeek(DateTime: TDateTime): integer;
begin
  Result := SysUtils.DayOfWeek(DateTime);
end;

function Date: TDateTime;
begin
  Result := SysUtils.Date;
end;

function Time: TDateTime;
begin
  Result := SysUtils.Time;
end;

function Now: TDateTime;
begin
  Result := SysUtils.Now;
end;

function IncMonth(const DateTime: TDateTime; NumberOfMonths: integer = 1 ): TDateTime;
begin
  Result := SysUtils.IncMonth(DateTime, NumberOfMonths);
end;

procedure IncAMonth(var Year, Month, Day: Word; NumberOfMonths: Integer = 1);
begin
  SysUtils.IncAMonth(Year, Month, Day, NumberOfMonths);
end;

function IsLeapYear(Year: Word): boolean;
begin
  Result := SysUtils.IsLeapYear(Year);
end;

function DateToStr(Date: TDateTime): string;
begin
  Result := SysUtils.DateToStr(Date);
end;

function DateToStr(Date: TDateTime; const FormatSettings: TFormatSettings): string;
begin
  Result := SysUtils.DateToStr(Date, FormatSettings);
end;

function TimeToStr(Time: TDateTime): string;
begin
  Result := SysUtils.TimeToStr(Time);
end;

function TimeToStr(Time: TDateTime; const FormatSettings: TFormatSettings): string;
begin
  Result := SysUtils.TimeToStr(Time, FormatSettings);
end;

function DateTimeToStr(DateTime: TDateTime; ForceTimeIfZero : Boolean = False): string;
begin
  Result := SysUtils.DateTimeToStr(DateTime, ForceTimeIfZero);
end;

function DateTimeToStr(DateTime: TDateTime; const FormatSettings: TFormatSettings; ForceTimeIfZero : Boolean = False): string;
begin
  Result := SysUtils.DateTimeToStr(DateTime, FormatSettings, ForceTimeIfZero);
end;

function StrToDate(const S: ShortString): TDateTime;
begin
  Result := SysUtils.StrToDate(S);
end;

function StrToDate(const S: Ansistring): TDateTime;
begin
  Result := SysUtils.StrToDate(S);
end;

function StrToDate(const S: ShortString; separator : char): TDateTime;
begin
  Result := SysUtils.StrToDate(S, separator);
end;

function StrToDate(const S: AnsiString; separator : char): TDateTime;
begin
  Result := SysUtils.StrToDate(S, separator);
end;

function StrToDate(const S: string; FormatSettings : TFormatSettings): TDateTime;
begin
  Result := SysUtils.StrToDate(S, FormatSettings);
end;

function StrToDate(const S: ShortString; const useformat : string; separator : char = #0): TDateTime;
begin
  Result := SysUtils.StrToDate(S, useformat, separator);
end;

function StrToDate(const S: AnsiString; const useformat : string; separator : char = #0): TDateTime;
begin
  Result := SysUtils.StrToDate(S, useformat, separator);
end;

function StrToDate(const S: PChar; Len : integer; const useformat : string; separator : char = #0): TDateTime;
begin
  Result := SysUtils.StrToDate(S, Len, useformat, separator);
end;

function StrToTime(const S: Shortstring): TDateTime;
begin
  Result := SysUtils.StrToTime(S);
end;

function StrToTime(const S: Ansistring): TDateTime;
begin
  Result := SysUtils.StrToTime(S);
end;

function StrToTime(const S: ShortString; separator : char): TDateTime;
begin
  Result := SysUtils.StrToTime(S, separator);
end;

function StrToTime(const S: AnsiString; separator : char): TDateTime;
begin
  Result := SysUtils.StrToTime(S, separator);
end;

function StrToTime(const S: string; FormatSettings : TFormatSettings): TDateTime;
begin
  Result := SysUtils.StrToTime(S, FormatSettings);
end;

function StrToTime(const S: PChar; Len : integer; separator : char = #0): TDateTime;
begin
  Result := SysUtils.StrToTime(S, Len, separator);
end;

function StrToDateTime(const S: AnsiString): TDateTime;
begin
  Result := SysUtils.StrToDateTime(S);
end;

function StrToDateTime(const s: ShortString; const FormatSettings : TFormatSettings): TDateTime;
begin
  Result := SysUtils.StrToDateTime(s, FormatSettings);
end;

function StrToDateTime(const s: AnsiString; const FormatSettings : TFormatSettings): TDateTime;
begin
  Result := SysUtils.StrToDateTime(s, FormatSettings);
end;

function FormatDateTime(const FormatStr: string; DateTime: TDateTime; Options : TFormatDateTimeOptions = []): string;
begin
  Result := SysUtils.FormatDateTime(FormatStr, DateTime, Options);
end;

function FormatDateTime(const FormatStr: string; DateTime: TDateTime; const FormatSettings: TFormatSettings; Options : TFormatDateTimeOptions = []): string;
begin
  Result := SysUtils.FormatDateTime(FormatStr, DateTime, FormatSettings, Options);
end;

procedure DateTimeToString(out Result: string; const FormatStr: string; const DateTime: TDateTime; Options : TFormatDateTimeOptions = []);
begin
  SysUtils.DateTimeToString(Result, FormatStr, DateTime, Options);
end;

procedure DateTimeToString(out Result: string; const FormatStr: string; const DateTime: TDateTime; const FormatSettings: TFormatSettings; Options : TFormatDateTimeOptions = []);
begin
  SysUtils.DateTimeToString(Result, FormatStr, DateTime, FormatSettings, Options);
end;

Function DateTimeToFileDate(DateTime : TDateTime) : Longint;
begin
  Result := SysUtils.DateTimeToFileDate(DateTime);
end;

Function FileDateToDateTime (Filedate : Longint) :TDateTime;
begin
  Result := SysUtils.FileDateToDateTime(Filedate);
end;

function TryStrToDate(const S: ShortString; out Value: TDateTime): Boolean;
begin
  Result := SysUtils.TryStrToDate(S, Value);
end;

function TryStrToDate(const S: AnsiString; out Value: TDateTime): Boolean;
begin
  Result := SysUtils.TryStrToDate(S, Value);
end;

function TryStrToDate(const S: ShortString; out Value: TDateTime; separator : char): Boolean;
begin
  Result := SysUtils.TryStrToDate(S, Value, separator);
end;

function TryStrToDate(const S: AnsiString; out Value: TDateTime; separator : char): Boolean;
begin
  Result := SysUtils.TryStrToDate(S, Value, separator);
end;

function TryStrToDate(const S: ShortString; out Value: TDateTime; const useformat : string; separator : char = #0): Boolean;
begin
  Result := SysUtils.TryStrToDate(S, Value, useformat, separator);
end;

function TryStrToDate(const S: AnsiString; out Value: TDateTime; const useformat : string; separator : char = #0): Boolean;
begin
  Result := SysUtils.TryStrToDate(S, Value, useformat, separator);
end;

function TryStrToDate(const S: string; out Value: TDateTime; const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TryStrToDate(S, Value, FormatSettings);
end;

function TryStrToTime(const S: ShortString; out Value: TDateTime): Boolean;
begin
  Result := SysUtils.TryStrToTime(S, Value);
end;

function TryStrToTime(const S: AnsiString; out Value: TDateTime): Boolean;
begin
  Result := SysUtils.TryStrToTime(S, Value);
end;

function TryStrToTime(const S: ShortString; out Value: TDateTime; separator : char): Boolean;
begin
  Result := SysUtils.TryStrToTime(S, Value, separator);
end;

function TryStrToTime(const S: AnsiString; out Value: TDateTime; separator : char): Boolean;
begin
  Result := SysUtils.TryStrToTime(S, Value, separator);
end;

function TryStrToTime(const S: string; out Value: TDateTime; const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TryStrToTime(S, Value, FormatSettings);
end;

function TryStrToDateTime(const S: ShortString; out Value: TDateTime): Boolean;
begin
  Result := SysUtils.TryStrToDateTime(S, Value);
end;

function TryStrToDateTime(const S: AnsiString; out Value: TDateTime): Boolean;
begin
  Result := SysUtils.TryStrToDateTime(S, Value);
end;

function TryStrToDateTime(const S: string; out Value: TDateTime; const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TryStrToDateTime(S, Value, FormatSettings);
end;

function StrToDateDef(const S: ShortString; const Defvalue : TDateTime): TDateTime;
begin
  Result := SysUtils.StrToDateDef(S, Defvalue);
end;

function StrToDateDef(const S: ShortString; const Defvalue : TDateTime; separator : char): TDateTime;
begin
  Result := SysUtils.StrToDateDef(S, Defvalue, separator);
end;

function StrToDateDef(const S: AnsiString; const Defvalue : TDateTime): TDateTime;
begin
  Result := SysUtils.StrToDateDef(S, Defvalue);
end;

function StrToDateDef(const S: AnsiString; const Defvalue : TDateTime; separator : char): TDateTime;
begin
  Result := SysUtils.StrToDateDef(S, Defvalue, separator);
end;

function StrToTimeDef(const S: ShortString; const Defvalue : TDateTime): TDateTime;
begin
  Result := SysUtils.StrToTimeDef(S, Defvalue);
end;

function StrToTimeDef(const S: ShortString; const Defvalue : TDateTime; separator : char): TDateTime;
begin
  Result := SysUtils.StrToTimeDef(S, Defvalue, separator);
end;

function StrToTimeDef(const S: AnsiString; const Defvalue : TDateTime): TDateTime;
begin
  Result := SysUtils.StrToTimeDef(S, Defvalue);
end;

function StrToTimeDef(const S: AnsiString; const Defvalue : TDateTime; separator : char): TDateTime;
begin
  Result := SysUtils.StrToTimeDef(S, Defvalue, separator);
end;

function StrToDateTimeDef(const S: ShortString; const Defvalue : TDateTime): TDateTime;
begin
  Result := SysUtils.StrToDateTimeDef(S, Defvalue);
end;

function StrToDateTimeDef(const S: AnsiString; const Defvalue : TDateTime): TDateTime;
begin
  Result := SysUtils.StrToDateTimeDef(S, Defvalue);
end;

function StrToDateTimeDef(const S: AnsiString; const Defvalue : TDateTime; const FormatSettings: TFormatSettings): TDateTime;
begin
  Result := SysUtils.StrToDateTimeDef(S, Defvalue, FormatSettings);
end;

function CurrentYear:Word;
begin
  Result := SysUtils.CurrentYear;
end;

Procedure GetLocalTime(var SystemTime: TSystemTime);
begin
  SysUtils.GetLocalTime(SystemTime);
end;

procedure ReplaceTime(var dati:TDateTime; NewTime : TDateTime);
begin
  SysUtils.ReplaceTime(dati, NewTime);
end;

procedure ReplaceDate(var DateTime: TDateTime; const NewDate: TDateTime);
begin
  SysUtils.ReplaceDate(DateTime, NewDate);
end;

function GetLocalTimeOffset: Integer;
begin
  Result := SysUtils.GetLocalTimeOffset;
end;

function GetTickCount: LongWord;
begin
  Result := SysUtils.GetTickCount;
end;

function GetTickCount64: QWord;
begin
  Result := SysUtils.GetTickCount64;
end;

function NewStr(const S: string): PString;
begin
  Result := SysUtils.NewStr(S);
end;

procedure DisposeStr(S: PString);
begin
  SysUtils.DisposeStr(S);
end;

procedure DisposeStr(S: PShortString);
begin
  SysUtils.DisposeStr(S);
end;

procedure AssignStr(var P: PString; const S: string);
begin
  SysUtils.AssignStr(P, S);
end;

procedure AppendStr(var Dest: String; const S: string);
begin
  SysUtils.AppendStr(Dest, S);
end;

function UpperCase(const s: string): string;
begin
  Result := SysUtils.UpperCase(s);
end;

function UpperCase(const s: string; LocaleOptions: TLocaleOptions): string;
begin
  Result := SysUtils.UpperCase(s, LocaleOptions);
end;

function LowerCase(const s: string): string;
begin
  Result := SysUtils.LowerCase(s);
end;

function LowerCase(const s: string; LocaleOptions: TLocaleOptions): string;
begin
  Result := SysUtils.LowerCase(s, LocaleOptions);
end;

function LowerCase(const V: variant): string;
begin
  Result := SysUtils.LowerCase(V);
end;

function CompareStr(const S1, S2: string): Integer;
begin
  Result := SysUtils.CompareStr(S1, S2);
end;

function CompareStr(const S1, S2: string; LocaleOptions: TLocaleOptions): Integer;
begin
  Result := SysUtils.CompareStr(S1, S2, LocaleOptions);
end;

function CompareMemRange(P1, P2: Pointer; Length: PtrUInt): integer;
begin
  Result := SysUtils.CompareMemRange(P1, P2, Length);
end;

function CompareMem(P1, P2: Pointer; Length: PtrUInt): Boolean;
begin
  Result := SysUtils.CompareMem(P1, P2, Length);
end;

function CompareText(const S1, S2: string): Integer;
begin
  Result := SysUtils.CompareText(S1, S2);
end;

function CompareText(const S1, S2: string; LocaleOptions: TLocaleOptions): Integer;
begin
  Result := SysUtils.CompareText(S1, S2, LocaleOptions);
end;

function SameText(const s1,s2:String):Boolean;
begin
  Result := SysUtils.SameText(s1, s2);
end;

function SameText(const s1,s2:String; LocaleOptions: TLocaleOptions):Boolean;
begin
  Result := SysUtils.SameText(s1, s2, LocaleOptions);
end;

function SameStr(const s1,s2:String):Boolean;
begin
  Result := SysUtils.SameStr(s1, s2);
end;

function SameStr(const s1,s2:String; LocaleOptions: TLocaleOptions):Boolean;
begin
  Result := SysUtils.SameStr(s1, s2, LocaleOptions);
end;

function AnsiUpperCase(const s: string): string;
begin
  Result := SysUtils.AnsiUpperCase(s);
end;

function AnsiLowerCase(const s: string): string;
begin
  Result := SysUtils.AnsiLowerCase(s);
end;

function AnsiCompareStr(const S1, S2: string): Integer;
begin
  Result := SysUtils.AnsiCompareStr(S1, S2);
end;

function AnsiCompareText(const S1, S2: string): Integer;
begin
  Result := SysUtils.AnsiCompareText(S1, S2);
end;

function AnsiSameText(const s1,s2:String):Boolean;
begin
  Result := SysUtils.AnsiSameText(s1, s2);
end;

function AnsiSameStr(const s1,s2:String):Boolean;
begin
  Result := SysUtils.AnsiSameStr(s1, s2);
end;

function AnsiStrComp(S1, S2: PChar): Integer;
begin
  Result := SysUtils.AnsiStrComp(S1, S2);
end;

function AnsiStrIComp(S1, S2: PChar): Integer;
begin
  Result := SysUtils.AnsiStrIComp(S1, S2);
end;

function AnsiStrLComp(S1, S2: PChar; MaxLen: SizeUInt): Integer;
begin
  Result := SysUtils.AnsiStrLComp(S1, S2, MaxLen);
end;

function AnsiStrLIComp(S1, S2: PChar; MaxLen: SizeUInt): Integer;
begin
  Result := SysUtils.AnsiStrLIComp(S1, S2, MaxLen);
end;

function AnsiStrLower(Str: PChar): PChar;
begin
  Result := SysUtils.AnsiStrLower(Str);
end;

function AnsiStrUpper(Str: PChar): PChar;
begin
  Result := SysUtils.AnsiStrUpper(Str);
end;

function AnsiLastChar(const S: string): PChar;
begin
  Result := SysUtils.AnsiLastChar(S);
end;

function AnsiStrLastChar(Str: PChar): PChar;
begin
  Result := SysUtils.AnsiStrLastChar(Str);
end;

function Trim(const S: string): string;
begin
  Result := SysUtils.Trim(S);
end;

function TrimLeft(const S: string): string;
begin
  Result := SysUtils.TrimLeft(S);
end;

function TrimRight(const S: string): string;
begin
  Result := SysUtils.TrimRight(S);
end;

function QuotedStr(const S: string): string;
begin
  Result := SysUtils.QuotedStr(S);
end;

function AnsiQuotedStr(const S: string; Quote: char): string;
begin
  Result := SysUtils.AnsiQuotedStr(S, Quote);
end;

function AnsiDequotedStr(const S: string; AQuote: Char): string;
begin
  Result := SysUtils.AnsiDequotedStr(S, AQuote);
end;

function AnsiExtractQuotedStr(var Src: PChar; Quote: Char): string;
begin
  Result := SysUtils.AnsiExtractQuotedStr(Src, Quote);
end;

function AdjustLineBreaks(const S: string): string;
begin
  Result := SysUtils.AdjustLineBreaks(S);
end;

function AdjustLineBreaks(const S: string; Style: TTextLineBreakStyle): string;
begin
  Result := SysUtils.AdjustLineBreaks(S, Style);
end;

function IsValidIdent(const Ident: string; AllowDots: Boolean = False; StrictDots: Boolean = False): Boolean;
begin
  Result := SysUtils.IsValidIdent(Ident, AllowDots, StrictDots);
end;

function IntToStr(Value: Longint): string;
begin
  Result := SysUtils.IntToStr(Value);
end;

function IntToStr(Value: Int64): string;
begin
  Result := SysUtils.IntToStr(Value);
end;

function IntToStr(Value: QWord): string;
begin
  Result := SysUtils.IntToStr(Value);
end;

function UIntToStr(Value: QWord): string;
begin
  Result := SysUtils.UIntToStr(Value);
end;

function UIntToStr(Value: Cardinal): string;
begin
  Result := SysUtils.UIntToStr(Value);
end;

function IntToHex(Value: Longint; Digits: integer): string;
begin
  Result := SysUtils.IntToHex(Value, Digits);
end;

function IntToHex(Value: Int64; Digits: integer): string;
begin
  Result := SysUtils.IntToHex(Value, Digits);
end;

function IntToHex(Value: QWord; Digits: integer): string;
begin
  Result := SysUtils.IntToHex(Value, Digits);
end;

function IntToHex(Value: Int8): string;
begin
  Result := SysUtils.IntToHex(Value);
end;

function IntToHex(Value: UInt8): string;
begin
  Result := SysUtils.IntToHex(Value);
end;

function IntToHex(Value: Int16): string;
begin
  Result := SysUtils.IntToHex(Value);
end;

function IntToHex(Value: UInt16): string;
begin
  Result := SysUtils.IntToHex(Value);
end;

function IntToHex(Value: Int32): string;
begin
  Result := SysUtils.IntToHex(Value);
end;

function IntToHex(Value: UInt32): string;
begin
  Result := SysUtils.IntToHex(Value);
end;

function IntToHex(Value: Int64): string;
begin
  Result := SysUtils.IntToHex(Value);
end;

function IntToHex(Value: UInt64): string;
begin
  Result := SysUtils.IntToHex(Value);
end;

function StrToInt(const s: string): Longint;
begin
  Result := SysUtils.StrToInt(s);
end;

function StrToDWord(const s: string): DWord;
begin
  Result := SysUtils.StrToDWord(s);
end;

function StrToUInt(const s: string): Cardinal;
begin
  Result := SysUtils.StrToUInt(s);
end;

function StrToInt64(const s: string): int64;
begin
  Result := SysUtils.StrToInt64(s);
end;

function StrToQWord(const s: string): QWord;
begin
  Result := SysUtils.StrToQWord(s);
end;

function StrToUInt64(const s: string): UInt64;
begin
  Result := SysUtils.StrToUInt64(s);
end;

function TryStrToInt(const s: string; Out i : Longint) : boolean;
begin
  Result := SysUtils.TryStrToInt(s, i);
end;

function TryStrToDWord(const s: string; Out D : DWord) : boolean;
begin
  Result := SysUtils.TryStrToDWord(s, D);
end;

function TryStrToUInt(const s: string; out C: Cardinal): Boolean;
begin
  Result := SysUtils.TryStrToUInt(s, C);
end;

function TryStrToInt64(const s: string; Out i : int64) : boolean;
begin
  Result := SysUtils.TryStrToInt64(s, i);
end;

function TryStrToQWord(const s: string; Out Q : QWord) : boolean;
begin
  Result := SysUtils.TryStrToQWord(s, Q);
end;

function TryStrToUInt64(const s: string; Out u : UInt64) : boolean;
begin
  Result := SysUtils.TryStrToUInt64(s, u);
end;

function StrToIntDef(const S: string; Default: Longint): Longint;
begin
  Result := SysUtils.StrToIntDef(S, Default);
end;

function StrToDWordDef(const S: string; Default: DWord): DWord;
begin
  Result := SysUtils.StrToDWordDef(S, Default);
end;

function StrToUIntDef(const S: string; Default: Cardinal): Cardinal;
begin
  Result := SysUtils.StrToUIntDef(S, Default);
end;

function StrToInt64Def(const S: string; Default: int64): int64;
begin
  Result := SysUtils.StrToInt64Def(S, Default);
end;

function StrToQWordDef(const S: string; Default: QWord): QWord;
begin
  Result := SysUtils.StrToQWordDef(S, Default);
end;

function StrToUInt64Def(const S: string; Default: UInt64): UInt64;
begin
  Result := SysUtils.StrToUInt64Def(S, Default);
end;

function LoadStr(Ident: integer): string;
begin
  Result := SysUtils.LoadStr(Ident);
end;

Function Format (Const Fmt : String; const Args : Array of const) : String;
begin
  Result := SysUtils.Format(Fmt, Args);
end;

Function Format (Const Fmt: string; const Args: array of const; const FormatSettings: TFormatSettings): string;
begin
  Result := SysUtils.Format(Fmt, Args, FormatSettings);
end;

Function FormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const) : Cardinal;
begin
  Result := SysUtils.FormatBuf(Buffer, BufLen, Fmt, fmtLen, Args);
end;

Function FormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const; Const FormatSettings: TFormatSettings) : Cardinal;
begin
  Result := SysUtils.FormatBuf(Buffer, BufLen, Fmt, fmtLen, Args, FormatSettings);
end;

Function StrFmt(Buffer,Fmt : PChar; Const args: Array of const) : Pchar;
begin
  Result := SysUtils.StrFmt(Buffer, Fmt, args);
end;

Function StrFmt(Buffer,Fmt : PChar; Const Args: Array of const; Const FormatSettings: TFormatSettings): PChar;
begin
  Result := SysUtils.StrFmt(Buffer, Fmt, Args, FormatSettings);
end;

Function StrLFmt(Buffer : PCHar; Maxlen : Cardinal;Fmt : PChar; Const args: Array of const) : Pchar;
begin
  Result := SysUtils.StrLFmt(Buffer, Maxlen, Fmt, args);
end;

Function StrLFmt(Buffer : PCHar; Maxlen : Cardinal;Fmt : PChar; Const args: Array of const; Const FormatSettings: TFormatSettings) : Pchar;
begin
  Result := SysUtils.StrLFmt(Buffer, Maxlen, Fmt, args, FormatSettings);
end;

Procedure FmtStr(Var Res: String; Const Fmt : String; Const args: Array of const);
begin
  SysUtils.FmtStr(Res, Fmt, args);
end;

Procedure FmtStr(Var Res: string; const Fmt : string; Const args: Array of const; Const FormatSettings: TFormatSettings);
begin
  SysUtils.FmtStr(Res, Fmt, args, FormatSettings);
end;

{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function FloatToStrF(Value: Extended; format: TFloatFormat; Precision, Digits: Integer): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function FloatToStrF(Value: Extended; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits, FormatSettings);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Double; format: TFloatFormat; Precision, Digits: Integer): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Double; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Single; format: TFloatFormat; Precision, Digits: Integer): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Single; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Comp; format: TFloatFormat; Precision, Digits: Integer): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Comp; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Currency; format: TFloatFormat; Precision, Digits: Integer): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStrF(Value: Currency; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (not defined(FPC_COMP_IS_INT64))}
Function FloatToStrF(Value: Int64; format: TFloatFormat; Precision, Digits: Integer): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (not defined(FPC_COMP_IS_INT64))}
Function FloatToStrF(Value: Int64; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStrF(Value, format, Precision, Digits, FormatSettings);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function CurrToStrF(Value: Currency; Format: TFloatFormat; Digits: Integer): string;
begin
  Result := SysUtils.CurrToStrF(Value, Format, Digits);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function CurrToStrF(Value: Currency; Format: TFloatFormat; Digits: Integer; Const FormatSettings: TFormatSettings): string;
begin
  Result := SysUtils.CurrToStrF(Value, Format, Digits, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function FloatToStr(Value: Extended): String;
begin
  Result := SysUtils.FloatToStr(Value);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function FloatToStr(Value: Extended; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStr(Value, FormatSettings);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Double): String;
begin
  Result := SysUtils.FloatToStr(Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Double; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStr(Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Single): String;
begin
  Result := SysUtils.FloatToStr(Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Single; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStr(Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Currency): String;
begin
  Result := SysUtils.FloatToStr(Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Currency; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStr(Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Comp): String;
begin
  Result := SysUtils.FloatToStr(Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToStr(Value: Comp; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStr(Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (not defined(FPC_COMP_IS_INT64))}
Function FloatToStr(Value: Int64): String;
begin
  Result := SysUtils.FloatToStr(Value);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (not defined(FPC_COMP_IS_INT64))}
Function FloatToStr(Value: Int64; Const FormatSettings: TFormatSettings): String;
begin
  Result := SysUtils.FloatToStr(Value, FormatSettings);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function StrToFloat(Const S : String) : Extended;
begin
  Result := SysUtils.StrToFloat(S);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StrToFloat(Const S : String; Const FormatSettings: TFormatSettings) : Extended;
begin
  Result := SysUtils.StrToFloat(S, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StrToFloatDef(Const S: String; Const Default: Extended): Extended;
begin
  Result := SysUtils.StrToFloatDef(S, Default);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StrToFloatDef(Const S: String; Const Default: Extended; Const FormatSettings: TFormatSettings): Extended;
begin
  Result := SysUtils.StrToFloatDef(S, Default, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryStrToFloat(Const S : String; Out Value: Single): Boolean;
begin
  Result := SysUtils.TryStrToFloat(S, Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryStrToFloat(Const S : String; Out Value: Single; Const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TryStrToFloat(S, Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryStrToFloat(Const S : String; Out Value: Double): Boolean;
begin
  Result := SysUtils.TryStrToFloat(S, Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryStrToFloat(Const S : String; Out Value: Double; Const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TryStrToFloat(S, Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function TryStrToFloat(Const S : String; Out Value: Extended): Boolean;
begin
  Result := SysUtils.TryStrToFloat(S, Value);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function TryStrToFloat(Const S : String; Out Value: Extended; Const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TryStrToFloat(S, Value, FormatSettings);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
Function TextToFloat(Buffer: PChar; Out Value: Extended): Boolean;
begin
  Result := SysUtils.TextToFloat(Buffer, Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TextToFloat(Buffer: PChar; Out Value: Extended; Const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TextToFloat(Buffer, Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TextToFloat(Buffer: PChar; Out Value; ValueType: TFloatValue): Boolean;
begin
  Result := SysUtils.TextToFloat(Buffer, Value, ValueType);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TextToFloat(Buffer: PChar; Out Value; ValueType: TFloatValue; Const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TextToFloat(Buffer, Value, ValueType, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToText(Buffer: PChar; Value: Extended; format: TFloatFormat; Precision, Digits: Integer): Longint;
begin
  Result := SysUtils.FloatToText(Buffer, Value, format, Precision, Digits);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToText(Buffer: PChar; Value: Extended; format: TFloatFormat; Precision, Digits: Integer; Const FormatSettings: TFormatSettings): Longint;
begin
  Result := SysUtils.FloatToText(Buffer, Value, format, Precision, Digits, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToDateTime (Const Value : Extended) : TDateTime;
begin
  Result := SysUtils.FloatToDateTime(Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloattoCurr (Const Value : Extended) : Currency;
begin
  Result := SysUtils.FloattoCurr(Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
function TryFloatToCurr(const Value: Extended; var AResult: Currency): Boolean;
begin
  Result := SysUtils.TryFloatToCurr(Value, AResult);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function CurrToStr(Value: Currency): string;
begin
  Result := SysUtils.CurrToStr(Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function CurrToStr(Value: Currency; Const FormatSettings: TFormatSettings): string;
begin
  Result := SysUtils.CurrToStr(Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
function StrToCurr(const S: string): Currency;
begin
  Result := SysUtils.StrToCurr(S);
end;

{$endif}
{$if (not defined(FPUNONE))}
function StrToCurr(const S: string; Const FormatSettings: TFormatSettings): Currency;
begin
  Result := SysUtils.StrToCurr(S, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
function TryStrToCurr(const S: string;Out Value : Currency): Boolean;
begin
  Result := SysUtils.TryStrToCurr(S, Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
function TryStrToCurr(const S: string;Out Value : Currency; Const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TryStrToCurr(S, Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
function StrToCurrDef(const S: string; Default : Currency): Currency;
begin
  Result := SysUtils.StrToCurrDef(S, Default);
end;

{$endif}
{$if (not defined(FPUNONE))}
function StrToCurrDef(const S: string; Default : Currency; Const FormatSettings: TFormatSettings): Currency;
begin
  Result := SysUtils.StrToCurrDef(S, Default, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToTextFmt(Buffer: PChar; Value: Extended; format: PChar; FormatSettings : TFormatSettings): Integer;
begin
  Result := SysUtils.FloatToTextFmt(Buffer, Value, format, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FloatToTextFmt(Buffer: PChar; Value: Extended; format: PChar): Integer;
begin
  Result := SysUtils.FloatToTextFmt(Buffer, Value, format);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure FloatToDecimal(Out Result: TFloatRec; const Value; ValueType: TFloatValue; Precision, Decimals : integer);
begin
  SysUtils.FloatToDecimal(Result, Value, ValueType, Precision, Decimals);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure FloatToDecimal(Out Result: TFloatRec; Value: Extended; Precision, Decimals : integer);
begin
  SysUtils.FloatToDecimal(Result, Value, Precision, Decimals);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FormatFloat(Const Format : String; Value : Extended) : String;
begin
  Result := SysUtils.FormatFloat(Format, Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FormatFloat(Const Format : String; Value : Extended; Const FormatSettings: TFormatSettings) : String;
begin
  Result := SysUtils.FormatFloat(Format, Value, FormatSettings);
end;

{$endif}
{$if (not defined(FPUNONE))}
function FormatCurr(const Format: string; Value: Currency): string;
begin
  Result := SysUtils.FormatCurr(Format, Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function FormatCurr(const Format: string; Value: Currency; Const FormatSettings: TFormatSettings): string;
begin
  Result := SysUtils.FormatCurr(Format, Value, FormatSettings);
end;

{$endif}
function StrToBool(const S: string): Boolean;
begin
  Result := SysUtils.StrToBool(S);
end;

function StrToBool(const S: string; Const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.StrToBool(S, FormatSettings);
end;

function BoolToStr(B: Boolean;UseBoolStrs:Boolean=False): string;
begin
  Result := SysUtils.BoolToStr(B, UseBoolStrs);
end;

function BoolToStr(B: Boolean;const TrueS,FalseS:string): string;
begin
  Result := SysUtils.BoolToStr(B, TrueS, FalseS);
end;

function StrToBoolDef(const S: string; Default: Boolean): Boolean;
begin
  Result := SysUtils.StrToBoolDef(S, Default);
end;

function StrToBoolDef(const S: string; Default: Boolean; Const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.StrToBoolDef(S, Default, FormatSettings);
end;

function TryStrToBool(const S: string; out Value: Boolean): Boolean;
begin
  Result := SysUtils.TryStrToBool(S, Value);
end;

function TryStrToBool(const S: string; out Value: Boolean; Const FormatSettings: TFormatSettings): Boolean;
begin
  Result := SysUtils.TryStrToBool(S, Value, FormatSettings);
end;

function LastDelimiter(const Delimiters, S: string): SizeInt;
begin
  Result := SysUtils.LastDelimiter(Delimiters, S);
end;

function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags; Out aCount : Integer): string;
begin
  Result := SysUtils.StringReplace(S, OldPattern, NewPattern, Flags, aCount);
end;

function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags): string;
begin
  Result := SysUtils.StringReplace(S, OldPattern, NewPattern, Flags);
end;

Function IsDelimiter(const Delimiters, S: string; Index: SizeInt): Boolean;
begin
  Result := SysUtils.IsDelimiter(Delimiters, S, Index);
end;

function SScanf(const s: string; const fmt : string;const Pointers : array of Pointer) : Integer;
begin
  Result := SysUtils.SScanf(s, fmt, Pointers);
end;

Function ByteType(const S: string; Index: SizeUInt): TMbcsByteType;
begin
  Result := SysUtils.ByteType(S, Index);
end;

Function StrByteType(Str: PChar; Index: SizeUInt): TMbcsByteType;
begin
  Result := SysUtils.StrByteType(Str, Index);
end;

Function ByteToCharLen(const S: string; MaxLen: SizeInt): SizeInt;
begin
  Result := SysUtils.ByteToCharLen(S, MaxLen);
end;

Function CharToByteLen(const S: string; MaxLen: SizeInt): SizeInt;
begin
  Result := SysUtils.CharToByteLen(S, MaxLen);
end;

Function ByteToCharIndex(const S: string; Index: SizeInt): SizeInt;
begin
  Result := SysUtils.ByteToCharIndex(S, Index);
end;

Function StrCharLength(const Str: PChar): SizeInt;
begin
  Result := SysUtils.StrCharLength(Str);
end;

function StrNextChar(const Str: PChar): PChar;
begin
  Result := SysUtils.StrNextChar(Str);
end;

function IsLeadChar(C: AnsiChar): Boolean;
begin
  Result := SysUtils.IsLeadChar(C);
end;

function IsLeadChar(B: Byte): Boolean;
begin
  Result := SysUtils.IsLeadChar(B);
end;

Function FindCmdLineSwitch(const Switch: string; const Chars: TSysCharSet;IgnoreCase: Boolean): Boolean;
begin
  Result := SysUtils.FindCmdLineSwitch(Switch, Chars, IgnoreCase);
end;

Function FindCmdLineSwitch(const Switch: string; IgnoreCase: Boolean): Boolean;
begin
  Result := SysUtils.FindCmdLineSwitch(Switch, IgnoreCase);
end;

Function FindCmdLineSwitch(const Switch: string): Boolean;
begin
  Result := SysUtils.FindCmdLineSwitch(Switch);
end;

function WrapText(const Line, BreakStr: string; const BreakChars: TSysCharSet; MaxCol: Integer): string;
begin
  Result := SysUtils.WrapText(Line, BreakStr, BreakChars, MaxCol);
end;

function WrapText(const Line: string; MaxCol: Integer): string;
begin
  Result := SysUtils.WrapText(Line, MaxCol);
end;

function LeftStr(const S: string; Count: integer): string;
begin
  Result := SysUtils.LeftStr(S, Count);
end;

function RightStr(const S: string; Count: integer): string;
begin
  Result := SysUtils.RightStr(S, Count);
end;

function BCDToInt(Value: integer): integer;
begin
  Result := SysUtils.BCDToInt(Value);
end;

function ExceptObject: TObject;
begin
  Result := SysUtils.ExceptObject;
end;

function ExceptAddr: CodePointer;
begin
  Result := SysUtils.ExceptAddr;
end;

function ExceptFrameCount: Longint;
begin
  Result := SysUtils.ExceptFrameCount;
end;

function ExceptFrames: PCodePointer;
begin
  Result := SysUtils.ExceptFrames;
end;

function ExceptionErrorMessage(ExceptObject: TObject; ExceptAddr: Pointer; Buffer: PChar; Size: Integer): Integer;
begin
  Result := SysUtils.ExceptionErrorMessage(ExceptObject, ExceptAddr, Buffer, Size);
end;

procedure ShowException(ExceptObject: TObject; ExceptAddr: Pointer);
begin
  SysUtils.ShowException(ExceptObject, ExceptAddr);
end;

procedure Abort;
begin
  SysUtils.Abort;
end;

procedure OutOfMemoryError;
begin
  SysUtils.OutOfMemoryError;
end;

procedure Beep;
begin
  SysUtils.Beep;
end;

function SysErrorMessage(ErrorCode: Integer): String;
begin
  Result := SysUtils.SysErrorMessage(ErrorCode);
end;

Function CreateGUID(out GUID : TGUID) : Integer;
begin
  Result := SysUtils.CreateGUID(GUID);
end;

procedure AddTerminateProc(TermProc: TTerminateProc);
begin
  SysUtils.AddTerminateProc(TermProc);
end;

function CallTerminateProcs: Boolean;
begin
  Result := SysUtils.CallTerminateProcs;
end;

function strlen(p:pchar):sizeint;
begin
  Result := SysUtils.strlen(p);
end;

function strcopy(dest,source : pchar) : pchar;
begin
  Result := SysUtils.strcopy(dest, source);
end;

function strlcopy(dest,source : pchar;maxlen : SizeInt) : pchar;
begin
  Result := SysUtils.strlcopy(dest, source, maxlen);
end;

function strecopy(dest,source : pchar) : pchar;
begin
  Result := SysUtils.strecopy(dest, source);
end;

function strend(p : pchar) : pchar;
begin
  Result := SysUtils.strend(p);
end;

function strcat(dest,source : pchar) : pchar;
begin
  Result := SysUtils.strcat(dest, source);
end;

function strcomp(str1,str2 : pchar) : SizeInt;
begin
  Result := SysUtils.strcomp(str1, str2);
end;

function strlcomp(str1,str2 : pchar;l : SizeInt) : SizeInt;
begin
  Result := SysUtils.strlcomp(str1, str2, l);
end;

function stricomp(str1,str2 : pchar) : SizeInt;
begin
  Result := SysUtils.stricomp(str1, str2);
end;

function strmove(dest,source : pchar;l : SizeInt) : pchar;
begin
  Result := SysUtils.strmove(dest, source, l);
end;

function strlcat(dest,source : pchar;l : SizeInt) : pchar;
begin
  Result := SysUtils.strlcat(dest, source, l);
end;

function strscan(p : pchar;c : char) : pchar;
begin
  Result := SysUtils.strscan(p, c);
end;

function strrscan(p : pchar;c : char) : pchar;
begin
  Result := SysUtils.strrscan(p, c);
end;

function strlower(p : pchar) : pchar;
begin
  Result := SysUtils.strlower(p);
end;

function strupper(p : pchar) : pchar;
begin
  Result := SysUtils.strupper(p);
end;

function strlicomp(str1,str2 : pchar;l : SizeInt) : SizeInt;
begin
  Result := SysUtils.strlicomp(str1, str2, l);
end;

function strpos(str1,str2 : pchar) : pchar;
begin
  Result := SysUtils.strpos(str1, str2);
end;

function strnew(p : pchar) : pchar;
begin
  Result := SysUtils.strnew(p);
end;

function StrPas(Str: PChar): string;
begin
  Result := SysUtils.StrPas(Str);
end;

function StrPCopy(Dest: PChar; Const Source: string): PChar;
begin
  Result := SysUtils.StrPCopy(Dest, Source);
end;

function StrPLCopy(Dest: PChar; Const Source: string; MaxLen: SizeUInt): PChar;
begin
  Result := SysUtils.StrPLCopy(Dest, Source, MaxLen);
end;

function StrAlloc(Size: cardinal): PChar;
begin
  Result := SysUtils.StrAlloc(Size);
end;

function StrBufSize(Str: PChar): Cardinal;
begin
  Result := SysUtils.StrBufSize(Str);
end;

procedure StrDispose(Str: PChar);
begin
  SysUtils.StrDispose(Str);
end;

function AnsiCompareFileName(const S1, S2 : string) : SizeInt;
begin
  Result := SysUtils.AnsiCompareFileName(S1, S2);
end;

Function SameFileName(const S1, S2: string): Boolean;
begin
  Result := SysUtils.SameFileName(S1, S2);
end;

function AnsiLowerCaseFileName(const s : string) : string;
begin
  Result := SysUtils.AnsiLowerCaseFileName(s);
end;

function AnsiUpperCaseFileName(const s : string) : string;
begin
  Result := SysUtils.AnsiUpperCaseFileName(s);
end;

function AnsiPos(const substr,s : string) : SizeInt;
begin
  Result := SysUtils.AnsiPos(substr, s);
end;

function AnsiStrPos(str,substr : PChar) : PChar;
begin
  Result := SysUtils.AnsiStrPos(str, substr);
end;

function AnsiStrRScan(Str : PChar;Chr : Char) : PChar;
begin
  Result := SysUtils.AnsiStrRScan(Str, Chr);
end;

function AnsiStrScan(Str : PChar;Chr: Char) : PChar;
begin
  Result := SysUtils.AnsiStrScan(Str, Chr);
end;

function HashName(Name: PAnsiChar): LongWord;
begin
  Result := SysUtils.HashName(Name);
end;

function BytesOf(const Val: RawByteString): TBytes;
begin
  Result := SysUtils.BytesOf(Val);
end;

function BytesOf(const Val: AnsiChar): TBytes;
begin
  Result := SysUtils.BytesOf(Val);
end;

Function CharInSet(Ch: AnsiChar;Const CSet : TSysCharSet) : Boolean;
begin
  Result := SysUtils.CharInSet(Ch, CSet);
end;

function CodePageToCodePageName(cp: TSystemCodePage): AnsiString;
begin
  Result := SysUtils.CodePageToCodePageName(cp);
end;

function CodePageNameToCodePage(const cpname: AnsiString): TSystemCodePage;
begin
  Result := SysUtils.CodePageNameToCodePage(cpname);
end;

function WideUpperCase(const s : WideString) : WideString;
begin
  Result := SysUtils.WideUpperCase(s);
end;

function WideLowerCase(const s : WideString) : WideString;
begin
  Result := SysUtils.WideLowerCase(s);
end;

function WideCompareStr(const s1, s2 : WideString) : PtrInt;
begin
  Result := SysUtils.WideCompareStr(s1, s2);
end;

function WideSameStr(const s1, s2 : WideString) : Boolean;
begin
  Result := SysUtils.WideSameStr(s1, s2);
end;

function WideCompareText(const s1, s2 : WideString) : PtrInt;
begin
  Result := SysUtils.WideCompareText(s1, s2);
end;

function WideSameText(const s1, s2 : WideString) : Boolean;
begin
  Result := SysUtils.WideSameText(s1, s2);
end;

Function WideFormat (Const Fmt : WideString; const Args : Array of const) : WideString;
begin
  Result := SysUtils.WideFormat(Fmt, Args);
end;

Function WideFormat (Const Fmt : WideString; const Args : Array of const; Const FormatSettings: TFormatSettings) : WideString;
begin
  Result := SysUtils.WideFormat(Fmt, Args, FormatSettings);
end;

Function WideFormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const) : Cardinal;
begin
  Result := SysUtils.WideFormatBuf(Buffer, BufLen, Fmt, fmtLen, Args);
end;

Function WideFormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const; Const FormatSettings: TFormatSettings) : Cardinal;
begin
  Result := SysUtils.WideFormatBuf(Buffer, BufLen, Fmt, fmtLen, Args, FormatSettings);
end;

Procedure WideFmtStr(Var Res: WideString; Const Fmt : WideString; Const args: Array of const);
begin
  SysUtils.WideFmtStr(Res, Fmt, args);
end;

Procedure WideFmtStr(Var Res: WideString; Const Fmt : WideString; Const args: Array of const; Const FormatSettings: TFormatSettings);
begin
  SysUtils.WideFmtStr(Res, Fmt, args, FormatSettings);
end;

function WideStringReplace(const S, OldPattern, NewPattern: WideString; Flags: TReplaceFlags): WideString;
begin
  Result := SysUtils.WideStringReplace(S, OldPattern, NewPattern, Flags);
end;

function WideStringReplace(const S, OldPattern, NewPattern: WideString; Flags: TReplaceFlags; Out aCount : Integer): WideString;
begin
  Result := SysUtils.WideStringReplace(S, OldPattern, NewPattern, Flags, aCount);
end;

function UnicodeUpperCase(const s : UnicodeString) : UnicodeString;
begin
  Result := SysUtils.UnicodeUpperCase(s);
end;

function UnicodeLowerCase(const s : UnicodeString) : UnicodeString;
begin
  Result := SysUtils.UnicodeLowerCase(s);
end;

function UnicodeCompareStr(const s1, s2 : UnicodeString) : PtrInt;
begin
  Result := SysUtils.UnicodeCompareStr(s1, s2);
end;

function UnicodeSameStr(const s1, s2 : UnicodeString) : Boolean;
begin
  Result := SysUtils.UnicodeSameStr(s1, s2);
end;

function UnicodeCompareText(const s1, s2 : UnicodeString) : PtrInt;
begin
  Result := SysUtils.UnicodeCompareText(s1, s2);
end;

function UnicodeSameText(const s1, s2 : UnicodeString) : Boolean;
begin
  Result := SysUtils.UnicodeSameText(s1, s2);
end;

Function UnicodeFormat (Const Fmt : UnicodeString; const Args : Array of const) : UnicodeString;
begin
  Result := SysUtils.UnicodeFormat(Fmt, Args);
end;

Function UnicodeFormat (Const Fmt : UnicodeString; const Args : Array of const; Const FormatSettings: TFormatSettings) : UnicodeString;
begin
  Result := SysUtils.UnicodeFormat(Fmt, Args, FormatSettings);
end;

Function UnicodeFormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const) : Cardinal;
begin
  Result := SysUtils.UnicodeFormatBuf(Buffer, BufLen, Fmt, fmtLen, Args);
end;

Function UnicodeFormatBuf (Var Buffer; BufLen : Cardinal; Const Fmt; fmtLen : Cardinal; Const Args : Array of const; Const FormatSettings: TFormatSettings) : Cardinal;
begin
  Result := SysUtils.UnicodeFormatBuf(Buffer, BufLen, Fmt, fmtLen, Args, FormatSettings);
end;

Procedure UnicodeFmtStr(Var Res: UnicodeString; Const Fmt : UnicodeString; Const args: Array of const);
begin
  SysUtils.UnicodeFmtStr(Res, Fmt, args);
end;

Procedure UnicodeFmtStr(Var Res: UnicodeString; Const Fmt : UnicodeString; Const args: Array of const; Const FormatSettings: TFormatSettings);
begin
  SysUtils.UnicodeFmtStr(Res, Fmt, args, FormatSettings);
end;

function WideStrAlloc(size: cardinal): pwidechar;
begin
  Result := SysUtils.WideStrAlloc(size);
end;

function StringOf(const Bytes: TBytes): UnicodeString;
begin
  Result := SysUtils.StringOf(Bytes);
end;

function WideBytesOf(const Value: UnicodeString): TBytes;
begin
  Result := SysUtils.WideBytesOf(Value);
end;

function WideStringOf(const Value: TBytes): UnicodeString;
begin
  Result := SysUtils.WideStringOf(Value);
end;

function ByteLength(const S: UnicodeString): Integer;
begin
  Result := SysUtils.ByteLength(S);
end;

function UnicodeStringReplace(const S, OldPattern, NewPattern: UnicodeString; Flags: TReplaceFlags): UnicodeString;
begin
  Result := SysUtils.UnicodeStringReplace(S, OldPattern, NewPattern, Flags);
end;

function UnicodeStringReplace(const S, OldPattern, NewPattern: UnicodeString; Flags: TReplaceFlags; Out aCount : Integer): UnicodeString;
begin
  Result := SysUtils.UnicodeStringReplace(S, OldPattern, NewPattern, Flags, aCount);
end;

function ChangeFileExt(const FileName, Extension: UnicodeString): UnicodeString;
begin
  Result := SysUtils.ChangeFileExt(FileName, Extension);
end;

function ExtractFilePath(const FileName: UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExtractFilePath(FileName);
end;

function ExtractFileDrive(const FileName: UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExtractFileDrive(FileName);
end;

function ExtractFileName(const FileName: UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExtractFileName(FileName);
end;

function ExtractFileExt(const FileName: UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExtractFileExt(FileName);
end;

function ExtractFileDir(Const FileName : UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExtractFileDir(FileName);
end;

function ExtractShortPathName(Const FileName : UnicodeString) : UnicodeString;
begin
  Result := SysUtils.ExtractShortPathName(FileName);
end;

function ExpandFileName (Const FileName : UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExpandFileName(FileName);
end;

function ExpandFileNameCase (const FileName: UnicodeString; out MatchFound: TFilenameCaseMatch): UnicodeString;
begin
  Result := SysUtils.ExpandFileNameCase(FileName, MatchFound);
end;

function ExpandUNCFileName (Const FileName : UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExpandUNCFileName(FileName);
end;

function ExtractRelativePath (Const BaseName,DestName : UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExtractRelativePath(BaseName, DestName);
end;

function IncludeTrailingPathDelimiter(Const Path : UnicodeString) : UnicodeString;
begin
  Result := SysUtils.IncludeTrailingPathDelimiter(Path);
end;

function IncludeTrailingBackslash(Const Path : UnicodeString) : UnicodeString;
begin
  Result := SysUtils.IncludeTrailingBackslash(Path);
end;

function ExcludeTrailingBackslash(Const Path: UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExcludeTrailingBackslash(Path);
end;

function ExcludeTrailingPathDelimiter(Const Path: UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExcludeTrailingPathDelimiter(Path);
end;

function IncludeLeadingPathDelimiter(Const Path : UnicodeString) : UnicodeString;
begin
  Result := SysUtils.IncludeLeadingPathDelimiter(Path);
end;

function ExcludeLeadingPathDelimiter(Const Path: UnicodeString): UnicodeString;
begin
  Result := SysUtils.ExcludeLeadingPathDelimiter(Path);
end;

function IsPathDelimiter(Const Path: UnicodeString; Index: Integer): Boolean;
begin
  Result := SysUtils.IsPathDelimiter(Path, Index);
end;

Procedure DoDirSeparators (Var FileName : UnicodeString);
begin
  SysUtils.DoDirSeparators(FileName);
end;

Function SetDirSeparators (Const FileName : UnicodeString) : UnicodeString;
begin
  Result := SysUtils.SetDirSeparators(FileName);
end;

Function GetDirs (Var DirName : UnicodeString; Var Dirs : Array of PUnicodeChar) : Longint;
begin
  Result := SysUtils.GetDirs(DirName, Dirs);
end;

function ConcatPaths(const Paths: array of UnicodeString): UnicodeString;
begin
  Result := SysUtils.ConcatPaths(Paths);
end;

Function FileOpen (Const FileName : unicodestring; Mode : Integer) : THandle;
begin
  Result := SysUtils.FileOpen(FileName, Mode);
end;

Function FileOpen (Const FileName : RawByteString; Mode : Integer) : THandle;
begin
  Result := SysUtils.FileOpen(FileName, Mode);
end;

Function FileCreate (Const FileName : UnicodeString) : THandle;
begin
  Result := SysUtils.FileCreate(FileName);
end;

Function FileCreate (Const FileName : UnicodeString; Rights : Integer) : THandle;
begin
  Result := SysUtils.FileCreate(FileName, Rights);
end;

Function FileCreate (Const FileName : UnicodeString; ShareMode : Integer; Rights : Integer) : THandle;
begin
  Result := SysUtils.FileCreate(FileName, ShareMode, Rights);
end;

Function FileCreate (Const FileName : RawByteString) : THandle;
begin
  Result := SysUtils.FileCreate(FileName);
end;

Function FileCreate (Const FileName : RawByteString; Rights : Integer) : THandle;
begin
  Result := SysUtils.FileCreate(FileName, Rights);
end;

Function FileCreate (Const FileName : RawByteString; ShareMode : Integer; Rights : Integer) : THandle;
begin
  Result := SysUtils.FileCreate(FileName, ShareMode, Rights);
end;

{$if (not defined(FPUNONE))}
Function FileAge (Const FileName : UnicodeString): Longint;
begin
  Result := SysUtils.FileAge(FileName);
end;

{$endif}
function FileAge(const FileName: UnicodeString; out FileDateTime: TDateTime; FollowLink: Boolean = True): Boolean;
begin
  Result := SysUtils.FileAge(FileName, FileDateTime, FollowLink);
end;

function FileAge(const FileName: RawByteString; out FileDateTime: TDateTime; FollowLink: Boolean = True): Boolean;
begin
  Result := SysUtils.FileAge(FileName, FileDateTime, FollowLink);
end;

{$if (not defined(FPUNONE))}
Function FileAge (Const FileName : RawByteString): Longint;
begin
  Result := SysUtils.FileAge(FileName);
end;

{$endif}
Function FileExists (Const FileName : UnicodeString; FollowLink : Boolean = True) : Boolean;
begin
  Result := SysUtils.FileExists(FileName, FollowLink);
end;

Function FileExists (Const FileName : RawByteString; FollowLink : Boolean = True) : Boolean;
begin
  Result := SysUtils.FileExists(FileName, FollowLink);
end;

Function DirectoryExists (Const Directory : UnicodeString; FollowLink : Boolean = True) : Boolean;
begin
  Result := SysUtils.DirectoryExists(Directory, FollowLink);
end;

Function DirectoryExists (Const Directory : RawByteString; FollowLink: Boolean = True) : Boolean;
begin
  Result := SysUtils.DirectoryExists(Directory, FollowLink);
end;

Function FileSetDate (Const FileName : UnicodeString;Age : Longint) : Longint;
begin
  Result := SysUtils.FileSetDate(FileName, Age);
end;

Function FileSetDate (Const FileName : RawByteString;Age : Longint) : Longint;
begin
  Result := SysUtils.FileSetDate(FileName, Age);
end;

Function FileSetDate (Handle : THandle;Age : Longint) : Longint;
begin
  Result := SysUtils.FileSetDate(Handle, Age);
end;

Function FileGetAttr (Const FileName : UnicodeString) : Longint;
begin
  Result := SysUtils.FileGetAttr(FileName);
end;

Function FileGetAttr (Const FileName : RawByteString) : Longint;
begin
  Result := SysUtils.FileGetAttr(FileName);
end;

Function FileSetAttr (Const Filename : UnicodeString; Attr: longint) : Longint;
begin
  Result := SysUtils.FileSetAttr(Filename, Attr);
end;

Function FileSetAttr (Const Filename : RawByteString; Attr: longint) : Longint;
begin
  Result := SysUtils.FileSetAttr(Filename, Attr);
end;

Function DeleteFile (Const FileName : UnicodeString) : Boolean;
begin
  Result := SysUtils.DeleteFile(FileName);
end;

Function DeleteFile (Const FileName : RawByteString) : Boolean;
begin
  Result := SysUtils.DeleteFile(FileName);
end;

Function RenameFile (Const OldName, NewName : UnicodeString) : Boolean;
begin
  Result := SysUtils.RenameFile(OldName, NewName);
end;

Function RenameFile (Const OldName, NewName : RawByteString) : Boolean;
begin
  Result := SysUtils.RenameFile(OldName, NewName);
end;

Function FindFirst (Const Path : UnicodeString; Attr : Longint; out Rslt : TUnicodeSearchRec) : Longint;
begin
  Result := SysUtils.FindFirst(Path, Attr, Rslt);
end;

Function FindFirst (Const Path : RawByteString; Attr : Longint; out Rslt : TRawByteSearchRec) : Longint;
begin
  Result := SysUtils.FindFirst(Path, Attr, Rslt);
end;

Function FindNext (Var Rslt : TUnicodeSearchRec) : Longint;
begin
  Result := SysUtils.FindNext(Rslt);
end;

Function FindNext (Var Rslt : TRawByteSearchRec) : Longint;
begin
  Result := SysUtils.FindNext(Rslt);
end;

Procedure FindClose (Var F : TUnicodeSearchrec);
begin
  SysUtils.FindClose(F);
end;

Procedure FindClose (Var F : TRawByteSearchrec);
begin
  SysUtils.FindClose(F);
end;

Function FileSearch (Const Name, DirList : UnicodeString; Options : TFileSearchoptions = [sfoImplicitCurrentDir]) : UnicodeString;
begin
  Result := SysUtils.FileSearch(Name, DirList, Options);
end;

Function FileSearch (Const Name, DirList : UnicodeString; ImplicitCurrentDir : Boolean) : UnicodeString;
begin
  Result := SysUtils.FileSearch(Name, DirList, ImplicitCurrentDir);
end;

Function FileSearch (Const Name, DirList : RawByteString; Options : TFileSearchoptions = [sfoImplicitCurrentDir]) : RawByteString;
begin
  Result := SysUtils.FileSearch(Name, DirList, Options);
end;

Function FileSearch (Const Name, DirList : RawByteString; ImplicitCurrentDir : Boolean) : RawByteString;
begin
  Result := SysUtils.FileSearch(Name, DirList, ImplicitCurrentDir);
end;

Function ExeSearch (Const Name : UnicodeString; Const DirList : UnicodeString = '') : UnicodeString;
begin
  Result := SysUtils.ExeSearch(Name, DirList);
end;

Function ExeSearch (Const Name : RawByteString; Const DirList : RawByteString = '') : RawByteString;
begin
  Result := SysUtils.ExeSearch(Name, DirList);
end;

Function FileIsReadOnly(const FileName : UnicodeString): Boolean;
begin
  Result := SysUtils.FileIsReadOnly(FileName);
end;

Function FileIsReadOnly(const FileName: RawByteString): Boolean;
begin
  Result := SysUtils.FileIsReadOnly(FileName);
end;

function FileGetSymLinkTarget(const FileName: UnicodeString; out SymLinkRec: TUnicodeSymLinkRec): Boolean;
begin
  Result := SysUtils.FileGetSymLinkTarget(FileName, SymLinkRec);
end;

function FileGetSymLinkTarget(const FileName: UnicodeString; out TargetName: UnicodeString): Boolean;
begin
  Result := SysUtils.FileGetSymLinkTarget(FileName, TargetName);
end;

function FileGetSymLinkTarget(const FileName: RawByteString; out SymLinkRec: TRawbyteSymLinkRec): Boolean;
begin
  Result := SysUtils.FileGetSymLinkTarget(FileName, SymLinkRec);
end;

function FileGetSymLinkTarget(const FileName: RawByteString; out TargetName: RawByteString): Boolean;
begin
  Result := SysUtils.FileGetSymLinkTarget(FileName, TargetName);
end;

Function FileRead (Handle : THandle; out Buffer; Count : longint) : Longint;
begin
  Result := SysUtils.FileRead(Handle, Buffer, Count);
end;

Function FileWrite (Handle : THandle; const Buffer; Count : Longint) : Longint;
begin
  Result := SysUtils.FileWrite(Handle, Buffer, Count);
end;

Function FileSeek (Handle : THandle; FOffset, Origin: Longint) : Longint;
begin
  Result := SysUtils.FileSeek(Handle, FOffset, Origin);
end;

Function FileSeek (Handle : THandle; FOffset: Int64; Origin: Longint) : Int64;
begin
  Result := SysUtils.FileSeek(Handle, FOffset, Origin);
end;

function FileFlush(Handle: THandle): Boolean;
begin
  Result := SysUtils.FileFlush(Handle);
end;

Procedure FileClose (Handle : THandle);
begin
  SysUtils.FileClose(Handle);
end;

Function FileTruncate (Handle : THandle;Size: Int64) : boolean;
begin
  Result := SysUtils.FileTruncate(Handle, Size);
end;

Function FileGetDate (Handle : THandle) : Longint;
begin
  Result := SysUtils.FileGetDate(Handle);
end;

Function GetFileHandle(var f : File):THandle;
begin
  Result := SysUtils.GetFileHandle(f);
end;

Function GetFileHandle(var f : Text):THandle;
begin
  Result := SysUtils.GetFileHandle(f);
end;

Function GetFileContents(Const aFileName : RawByteString) : TBytes;
begin
  Result := SysUtils.GetFileContents(aFileName);
end;

Function GetFileContents(Const aFileName : UnicodeString) : TBytes;
begin
  Result := SysUtils.GetFileContents(aFileName);
end;

Function GetFileContents(Const aHandle : THandle) : TBytes;
begin
  Result := SysUtils.GetFileContents(aHandle);
end;

Function GetFileAsString(Const aFileName : RawByteString) : RawByteString;
begin
  Result := SysUtils.GetFileAsString(aFileName);
end;

Function GetFileAsString(Const aFileName : RawByteString; aEncoding : TEncoding) : RawByteString;
begin
  Result := SysUtils.GetFileAsString(aFileName, aEncoding);
end;

Function GetFileAsString(Const aFileName : UnicodeString) : UnicodeString;
begin
  Result := SysUtils.GetFileAsString(aFileName);
end;

Function GetFileAsString(Const aFileName : UnicodeString; aEncoding : TEncoding) : UnicodeString;
begin
  Result := SysUtils.GetFileAsString(aFileName, aEncoding);
end;

Function DiskFree(drive: byte) : int64;
begin
  Result := SysUtils.DiskFree(drive);
end;

Function DiskSize(drive: byte) : int64;
begin
  Result := SysUtils.DiskSize(drive);
end;

Function GetCurrentDir : AnsiString;
begin
  Result := SysUtils.GetCurrentDir;
end;

Function SetCurrentDir (Const NewDir : RawByteString) : Boolean;
begin
  Result := SysUtils.SetCurrentDir(NewDir);
end;

Function SetCurrentDir (Const NewDir : UnicodeString) : Boolean;
begin
  Result := SysUtils.SetCurrentDir(NewDir);
end;

Function CreateDir (Const NewDir : RawByteString) : Boolean;
begin
  Result := SysUtils.CreateDir(NewDir);
end;

Function CreateDir (Const NewDir : UnicodeString) : Boolean;
begin
  Result := SysUtils.CreateDir(NewDir);
end;

Function RemoveDir (Const Dir : RawByteString) : Boolean;
begin
  Result := SysUtils.RemoveDir(Dir);
end;

Function RemoveDir (Const Dir : UnicodeString) : Boolean;
begin
  Result := SysUtils.RemoveDir(Dir);
end;

Function ForceDirectories(Const Dir: RawByteString): Boolean;
begin
  Result := SysUtils.ForceDirectories(Dir);
end;

Function ForceDirectories(Const Dir: UnicodeString): Boolean;
begin
  Result := SysUtils.ForceDirectories(Dir);
end;

Function GetDriveIDFromLetter(Const ADrive : RawByteString) : Byte;
begin
  Result := SysUtils.GetDriveIDFromLetter(ADrive);
end;

Function GetDriveIDFromLetter(Const ADrive : UnicodeString) : Byte;
begin
  Result := SysUtils.GetDriveIDFromLetter(ADrive);
end;

procedure FreeAndNil(var obj);
begin
  SysUtils.FreeAndNil(obj);
end;

procedure FreeMemAndNil(var p);
begin
  SysUtils.FreeMemAndNil(p);
end;

function Supports(const Instance: IInterface; const AClass: TClass; out Obj): Boolean;
begin
  Result := SysUtils.Supports(Instance, AClass, Obj);
end;

function Supports(const Instance: IInterface; const IID: TGUID; out Intf): Boolean;
begin
  Result := SysUtils.Supports(Instance, IID, Intf);
end;

function Supports(const Instance: TObject; const IID: TGUID; out Intf): Boolean;
begin
  Result := SysUtils.Supports(Instance, IID, Intf);
end;

function Supports(const Instance: TObject; const IID: Shortstring; out Intf): Boolean;
begin
  Result := SysUtils.Supports(Instance, IID, Intf);
end;

function Supports(const Instance: IInterface; const AClass: TClass): Boolean;
begin
  Result := SysUtils.Supports(Instance, AClass);
end;

function Supports(const Instance: IInterface; const IID: TGUID): Boolean;
begin
  Result := SysUtils.Supports(Instance, IID);
end;

function Supports(const Instance: TObject; const IID: TGUID): Boolean;
begin
  Result := SysUtils.Supports(Instance, IID);
end;

function Supports(const Instance: TObject; const IID: Shortstring): Boolean;
begin
  Result := SysUtils.Supports(Instance, IID);
end;

function Supports(const AClass: TClass; const IID: TGUID): Boolean;
begin
  Result := SysUtils.Supports(AClass, IID);
end;

function Supports(const AClass: TClass; const IID: Shortstring): Boolean;
begin
  Result := SysUtils.Supports(AClass, IID);
end;

function TryStringToGUID(const S: string; out Guid: TGUID): Boolean;
begin
  Result := SysUtils.TryStringToGUID(S, Guid);
end;

function StringToGUID(const S: string): TGUID;
begin
  Result := SysUtils.StringToGUID(S);
end;

function GUIDToString(const GUID: TGUID): string;
begin
  Result := SysUtils.GUIDToString(GUID);
end;

function IsEqualGUID(const guid1, guid2: TGUID): Boolean;
begin
  Result := SysUtils.IsEqualGUID(guid1, guid2);
end;

function GuidCase(const GUID: TGUID; const List: array of TGuid): Integer;
begin
  Result := SysUtils.GuidCase(GUID, List);
end;

function GetModuleName(Module: HMODULE): string;
begin
  Result := SysUtils.GetModuleName(Module);
end;

end.
