{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Data.DB
  Gerado por tools/genvclcompat.py a partir de DB.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Data.DB;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Classes, DB;
type
  PLargeInt = DB.PLargeInt;
  TStringFieldBuffer = DB.TStringFieldBuffer;
  TDataSetState = DB.TDataSetState;
  TDataEvent = DB.TDataEvent;
  TUpdateStatus = DB.TUpdateStatus;
  TUpdateStatusSet = DB.TUpdateStatusSet;
  TUpdateMode = DB.TUpdateMode;
  TResolverResponse = DB.TResolverResponse;
  TProviderFlag = DB.TProviderFlag;
  TProviderFlags = DB.TProviderFlags;
  TFieldDef = DB.TFieldDef;
  TFieldDefs = DB.TFieldDefs;
  TField = DB.TField;
  TFields = DB.TFields;
  TDataSet = DB.TDataSet;
  TDataBase = DB.TDataBase;
  TDataSource = DB.TDataSource;
  TDataLink = DB.TDataLink;
  TDBTransaction = DB.TDBTransaction;
  EDatabaseError = DB.EDatabaseError;
  EUpdateError = DB.EUpdateError;
  TFieldClass = DB.TFieldClass;
  TFieldType = DB.TFieldType;
  TFieldMap = DB.TFieldMap;
  TDateTimeAlias = DB.TDateTimeAlias;
  PDateTimeRec = DB.PDateTimeRec;
  TDateTimeRec = DB.TDateTimeRec;
  TFieldAttribute = DB.TFieldAttribute;
  TFieldAttributes = DB.TFieldAttributes;
  TNamedItem = DB.TNamedItem;
  TDefCollection = DB.TDefCollection;
  TFieldDefClass = DB.TFieldDefClass;
  TFieldDefsClass = DB.TFieldDefsClass;
  TFieldKind = DB.TFieldKind;
  TFieldKinds = DB.TFieldKinds;
  TFieldNotifyEvent = DB.TFieldNotifyEvent;
  TFieldGetTextEvent = DB.TFieldGetTextEvent;
  TFieldSetTextEvent = DB.TFieldSetTextEvent;
  TFieldRef = DB.TFieldRef;
  TFieldChars = DB.TFieldChars;
  PLookupListRec = DB.PLookupListRec;
  TLookupListRec = DB.TLookupListRec;
  TLookupList = DB.TLookupList;
  TStringField = DB.TStringField;
  TWideStringField = DB.TWideStringField;
  TNumericField = DB.TNumericField;
  TLongintField = DB.TLongintField;
  TIntegerField = DB.TIntegerField;
  TLargeintField = DB.TLargeintField;
  TSmallintField = DB.TSmallintField;
  TWordField = DB.TWordField;
  TAutoIncField = DB.TAutoIncField;
  TFloatField = DB.TFloatField;
  TCurrencyField = DB.TCurrencyField;
  TBooleanField = DB.TBooleanField;
  TDateTimeField = DB.TDateTimeField;
  TDateField = DB.TDateField;
  TTimeField = DB.TTimeField;
  TBinaryField = DB.TBinaryField;
  TBytesField = DB.TBytesField;
  TVarBytesField = DB.TVarBytesField;
  TBCDField = DB.TBCDField;
  TFMTBCDField = DB.TFMTBCDField;
  TBlobStreamMode = DB.TBlobStreamMode;
  TBlobType = DB.TBlobType;
  TBlobField = DB.TBlobField;
  TMemoField = DB.TMemoField;
  TWideMemoField = DB.TWideMemoField;
  TGraphicField = DB.TGraphicField;
  TVariantField = DB.TVariantField;
  TGuidField = DB.TGuidField;
  TIndexDefs = DB.TIndexDefs;
  TIndexOption = DB.TIndexOption;
  TIndexOptions = DB.TIndexOptions;
  TIndexDef = DB.TIndexDef;
  TCheckConstraint = DB.TCheckConstraint;
  TCheckConstraints = DB.TCheckConstraints;
  TFieldsEnumerator = DB.TFieldsEnumerator;
  TFieldsClass = DB.TFieldsClass;
  TParamBinding = DB.TParamBinding;
  TParamType = DB.TParamType;
  TParamTypes = DB.TParamTypes;
  TParamStyle = DB.TParamStyle;
  TParams = DB.TParams;
  TParam = DB.TParam;
  TParamClass = DB.TParamClass;
  TParamsEnumerator = DB.TParamsEnumerator;
  TSQLParseOption = DB.TSQLParseOption;
  TSQLParseOptions = DB.TSQLParseOptions;
  PBookmarkFlag = DB.PBookmarkFlag;
  TBookmarkFlag = DB.TBookmarkFlag;
  PBufferList = DB.PBufferList;
  TBufferList = DB.TBufferList;
  TBufferArray = DB.TBufferArray;
  TGetMode = DB.TGetMode;
  TGetResult = DB.TGetResult;
  TResyncMode = DB.TResyncMode;
  TDataAction = DB.TDataAction;
  TUpdateAction = DB.TUpdateAction;
  TUpdateKind = DB.TUpdateKind;
  TLocateOption = DB.TLocateOption;
  TLocateOptions = DB.TLocateOptions;
  TDataOperation = DB.TDataOperation;
  TDataSetNotifyEvent = DB.TDataSetNotifyEvent;
  TDataSetErrorEvent = DB.TDataSetErrorEvent;
  TFilterOption = DB.TFilterOption;
  TFilterOptions = DB.TFilterOptions;
  TFilterRecordEvent = DB.TFilterRecordEvent;
  TDatasetClass = DB.TDatasetClass;
  TPSCommandType = DB.TPSCommandType;
  IProviderSupport = DB.IProviderSupport;
  TDataSetEnumerator = DB.TDataSetEnumerator;
  TDetailDataLink = DB.TDetailDataLink;
  TMasterDataLink = DB.TMasterDataLink;
  TMasterParamsDataLink = DB.TMasterParamsDataLink;
  TDataChangeEvent = DB.TDataChangeEvent;
  TDBDatasetClass = DB.TDBDatasetClass;
  TDBDataset = DB.TDBDataset;
  TDBTransactionClass = DB.TDBTransactionClass;
  TLoginEvent = DB.TLoginEvent;
  TCustomConnection = DB.TCustomConnection;
  TDatabaseClass = DB.TDatabaseClass;
  LargeInt = DB.LargeInt;
  TBlobData = DB.TBlobData;
  TBookMark = DB.TBookMark;
  TBookmarkStr = DB.TBookmarkStr;
  TRecordBufferBaseType = DB.TRecordBufferBaseType;
  TRecordBuffer = DB.TRecordBuffer;
const
  dsInactive = DB.dsInactive;
  dsBrowse = DB.dsBrowse;
  dsEdit = DB.dsEdit;
  dsInsert = DB.dsInsert;
  dsSetKey = DB.dsSetKey;
  dsCalcFields = DB.dsCalcFields;
  dsFilter = DB.dsFilter;
  dsNewValue = DB.dsNewValue;
  dsOldValue = DB.dsOldValue;
  dsCurValue = DB.dsCurValue;
  dsBlockRead = DB.dsBlockRead;
  dsInternalCalc = DB.dsInternalCalc;
  dsOpening = DB.dsOpening;
  dsRefreshFields = DB.dsRefreshFields;
  deFieldChange = DB.deFieldChange;
  deRecordChange = DB.deRecordChange;
  deDataSetChange = DB.deDataSetChange;
  deDataSetScroll = DB.deDataSetScroll;
  deLayoutChange = DB.deLayoutChange;
  deUpdateRecord = DB.deUpdateRecord;
  deUpdateState = DB.deUpdateState;
  deCheckBrowseMode = DB.deCheckBrowseMode;
  dePropertyChange = DB.dePropertyChange;
  deFieldListChange = DB.deFieldListChange;
  deFocusControl = DB.deFocusControl;
  deParentScroll = DB.deParentScroll;
  deConnectChange = DB.deConnectChange;
  deReconcileError = DB.deReconcileError;
  deDisabledStateChange = DB.deDisabledStateChange;
  usUnmodified = DB.usUnmodified;
  usModified = DB.usModified;
  usInserted = DB.usInserted;
  usDeleted = DB.usDeleted;
  upWhereAll = DB.upWhereAll;
  upWhereChanged = DB.upWhereChanged;
  upWhereKeyOnly = DB.upWhereKeyOnly;
  rrSkip = DB.rrSkip;
  rrAbort = DB.rrAbort;
  rrMerge = DB.rrMerge;
  rrApply = DB.rrApply;
  rrIgnore = DB.rrIgnore;
  pfInUpdate = DB.pfInUpdate;
  pfInWhere = DB.pfInWhere;
  pfInKey = DB.pfInKey;
  pfHidden = DB.pfHidden;
  pfRefreshOnInsert = DB.pfRefreshOnInsert;
  pfRefreshOnUpdate = DB.pfRefreshOnUpdate;
  ftUnknown = DB.ftUnknown;
  ftString = DB.ftString;
  ftSmallint = DB.ftSmallint;
  ftInteger = DB.ftInteger;
  ftWord = DB.ftWord;
  ftBoolean = DB.ftBoolean;
  ftFloat = DB.ftFloat;
  ftCurrency = DB.ftCurrency;
  ftBCD = DB.ftBCD;
  ftDate = DB.ftDate;
  ftTime = DB.ftTime;
  ftDateTime = DB.ftDateTime;
  ftBytes = DB.ftBytes;
  ftVarBytes = DB.ftVarBytes;
  ftAutoInc = DB.ftAutoInc;
  ftBlob = DB.ftBlob;
  ftMemo = DB.ftMemo;
  ftGraphic = DB.ftGraphic;
  ftFmtMemo = DB.ftFmtMemo;
  ftParadoxOle = DB.ftParadoxOle;
  ftDBaseOle = DB.ftDBaseOle;
  ftTypedBinary = DB.ftTypedBinary;
  ftCursor = DB.ftCursor;
  ftFixedChar = DB.ftFixedChar;
  ftWideString = DB.ftWideString;
  ftLargeint = DB.ftLargeint;
  ftADT = DB.ftADT;
  ftArray = DB.ftArray;
  ftReference = DB.ftReference;
  ftDataSet = DB.ftDataSet;
  ftOraBlob = DB.ftOraBlob;
  ftOraClob = DB.ftOraClob;
  ftVariant = DB.ftVariant;
  ftInterface = DB.ftInterface;
  ftIDispatch = DB.ftIDispatch;
  ftGuid = DB.ftGuid;
  ftTimeStamp = DB.ftTimeStamp;
  ftFMTBcd = DB.ftFMTBcd;
  ftFixedWideChar = DB.ftFixedWideChar;
  ftWideMemo = DB.ftWideMemo;
  faHiddenCol = DB.faHiddenCol;
  faReadonly = DB.faReadonly;
  faRequired = DB.faRequired;
  faLink = DB.faLink;
  faUnNamed = DB.faUnNamed;
  faFixed = DB.faFixed;
  fkData = DB.fkData;
  fkCalculated = DB.fkCalculated;
  fkLookup = DB.fkLookup;
  fkInternalCalc = DB.fkInternalCalc;
  bmRead = DB.bmRead;
  bmWrite = DB.bmWrite;
  bmReadWrite = DB.bmReadWrite;
  ixPrimary = DB.ixPrimary;
  ixUnique = DB.ixUnique;
  ixDescending = DB.ixDescending;
  ixCaseInsensitive = DB.ixCaseInsensitive;
  ixExpression = DB.ixExpression;
  ixNonMaintained = DB.ixNonMaintained;
  ptUnknown = DB.ptUnknown;
  ptInput = DB.ptInput;
  ptOutput = DB.ptOutput;
  ptInputOutput = DB.ptInputOutput;
  ptResult = DB.ptResult;
  psInterbase = DB.psInterbase;
  psPostgreSQL = DB.psPostgreSQL;
  psSimulated = DB.psSimulated;
  spoCreate = DB.spoCreate;
  spoEscapeSlash = DB.spoEscapeSlash;
  spoEscapeRepeat = DB.spoEscapeRepeat;
  spoUseMacro = DB.spoUseMacro;
  bfCurrent = DB.bfCurrent;
  bfBOF = DB.bfBOF;
  bfEOF = DB.bfEOF;
  bfInserted = DB.bfInserted;
  gmCurrent = DB.gmCurrent;
  gmNext = DB.gmNext;
  gmPrior = DB.gmPrior;
  grOK = DB.grOK;
  grBOF = DB.grBOF;
  grEOF = DB.grEOF;
  grError = DB.grError;
  daFail = DB.daFail;
  daAbort = DB.daAbort;
  daRetry = DB.daRetry;
  uaFail = DB.uaFail;
  uaAbort = DB.uaAbort;
  uaSkip = DB.uaSkip;
  uaRetry = DB.uaRetry;
  uaApplied = DB.uaApplied;
  ukModify = DB.ukModify;
  ukInsert = DB.ukInsert;
  ukDelete = DB.ukDelete;
  loCaseInsensitive = DB.loCaseInsensitive;
  loPartialKey = DB.loPartialKey;
  foCaseInsensitive = DB.foCaseInsensitive;
  foNoPartialCompare = DB.foNoPartialCompare;
  ctUnknown = DB.ctUnknown;
  ctQuery = DB.ctQuery;
  ctTable = DB.ctTable;
  ctStoredProc = DB.ctStoredProc;
  ctSelect = DB.ctSelect;
  ctInsert = DB.ctInsert;
  ctUpdate = DB.ctUpdate;
  ctDelete = DB.ctDelete;
  ctDDL = DB.ctDDL;
  dsMaxBufferCount = DB.dsMaxBufferCount;
  dsMaxStringSize = DB.dsMaxStringSize;
  SQLDelimiterCharacters = DB.SQLDelimiterCharacters;
  dsEditModes = DB.dsEditModes;
  dsWriteModes = DB.dsWriteModes;
  ftBlobTypes = DB.ftBlobTypes;
Procedure DatabaseError (Const Msg : String); overload; inline;
Procedure DatabaseError (Const Msg : String; Comp : TComponent); overload; inline;
Procedure DatabaseErrorFmt (Const Fmt : String; Const Args : Array Of Const); overload; inline;
Procedure DatabaseErrorFmt (Const Fmt : String; Const Args : Array Of Const; Comp : TComponent); overload; inline;
Function ExtractFieldName(Const Fields: String; var Pos: Integer): String; inline;
Function DateTimeRecToDateTime(DT: TFieldType; Data: TDateTimeRec): TDateTime; inline;
Function DateTimeToDateTimeRec(DT: TFieldType; Data: TDateTime): TDateTimeRec; inline;
procedure DisposeMem(var Buffer; Size: Integer); inline;
function BuffersEqual(Buf1, Buf2: Pointer; Size: Integer): Boolean; inline;
function SkipComments(var p: PChar; EscapeSlash, EscapeRepeat : Boolean) : boolean; inline;

implementation

Procedure DatabaseError (Const Msg : String);
begin
  DB.DatabaseError(Msg);
end;

Procedure DatabaseError (Const Msg : String; Comp : TComponent);
begin
  DB.DatabaseError(Msg, Comp);
end;

Procedure DatabaseErrorFmt (Const Fmt : String; Const Args : Array Of Const);
begin
  DB.DatabaseErrorFmt(Fmt, Args);
end;

Procedure DatabaseErrorFmt (Const Fmt : String; Const Args : Array Of Const; Comp : TComponent);
begin
  DB.DatabaseErrorFmt(Fmt, Args, Comp);
end;

Function ExtractFieldName(Const Fields: String; var Pos: Integer): String;
begin
  Result := DB.ExtractFieldName(Fields, Pos);
end;

Function DateTimeRecToDateTime(DT: TFieldType; Data: TDateTimeRec): TDateTime;
begin
  Result := DB.DateTimeRecToDateTime(DT, Data);
end;

Function DateTimeToDateTimeRec(DT: TFieldType; Data: TDateTime): TDateTimeRec;
begin
  Result := DB.DateTimeToDateTimeRec(DT, Data);
end;

procedure DisposeMem(var Buffer; Size: Integer);
begin
  DB.DisposeMem(Buffer, Size);
end;

function BuffersEqual(Buf1, Buf2: Pointer; Size: Integer): Boolean;
begin
  Result := DB.BuffersEqual(Buf1, Buf2, Size);
end;

function SkipComments(var p: PChar; EscapeSlash, EscapeRepeat : Boolean) : boolean;
begin
  Result := DB.SkipComments(p, EscapeSlash, EscapeRepeat);
end;

end.
