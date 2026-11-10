{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.Variants
  Gerado por tools/genvclcompat.py a partir de Variants.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.Variants;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  typinfo, Variants;
type
  EVariantParamNotFoundError = Variants.EVariantParamNotFoundError;
  EVariantInvalidOpError = Variants.EVariantInvalidOpError;
  EVariantTypeCastError = Variants.EVariantTypeCastError;
  EVariantOverflowError = Variants.EVariantOverflowError;
  EVariantInvalidArgError = Variants.EVariantInvalidArgError;
  EVariantBadVarTypeError = Variants.EVariantBadVarTypeError;
  EVariantBadIndexError = Variants.EVariantBadIndexError;
  EVariantArrayLockedError = Variants.EVariantArrayLockedError;
  EVariantNotAnArrayError = Variants.EVariantNotAnArrayError;
  EVariantArrayCreateError = Variants.EVariantArrayCreateError;
  EVariantNotImplError = Variants.EVariantNotImplError;
  EVariantOutOfMemoryError = Variants.EVariantOutOfMemoryError;
  EVariantUnexpectedError = Variants.EVariantUnexpectedError;
  EVariantDispatchError = Variants.EVariantDispatchError;
  EVariantRangeCheckError = Variants.EVariantRangeCheckError;
  EVariantInvalidNullOpError = Variants.EVariantInvalidNullOpError;
  TVariantRelationship = Variants.TVariantRelationship;
  TNullCompareRule = Variants.TNullCompareRule;
  TBooleanToStringRule = Variants.TBooleanToStringRule;
  TVarCompareResult = Variants.TVarCompareResult;
  TCustomVariantType = Variants.TCustomVariantType;
  TCustomVariantTypeClass = Variants.TCustomVariantTypeClass;
  TVarDataArray = Variants.TVarDataArray;
  IVarInvokeable = Variants.IVarInvokeable;
  TInvokeableVariantType = Variants.TInvokeableVariantType;
  IVarInstanceReference = Variants.IVarInstanceReference;
  TPublishableVariantType = Variants.TPublishableVariantType;
  TAnyProc = Variants.TAnyProc;
  TVarDispProc = Variants.TVarDispProc;
const
  vrEqual = Variants.vrEqual;
  vrLessThan = Variants.vrLessThan;
  vrGreaterThan = Variants.vrGreaterThan;
  vrNotEqual = Variants.vrNotEqual;
  ncrError = Variants.ncrError;
  ncrStrict = Variants.ncrStrict;
  ncrLoose = Variants.ncrLoose;
  bsrAsIs = Variants.bsrAsIs;
  bsrLower = Variants.bsrLower;
  bsrUpper = Variants.bsrUpper;
  crLessThan = Variants.crLessThan;
  crEqual = Variants.crEqual;
  crGreaterThan = Variants.crGreaterThan;
  OrdinalVarTypes = Variants.OrdinalVarTypes;
  FloatVarTypes = Variants.FloatVarTypes;
  CMaxNumberOfCustomVarTypes = Variants.CMaxNumberOfCustomVarTypes;
  CMinVarType = Variants.CMinVarType;
  CMaxVarType = Variants.CMaxVarType;
  CIncVarType = Variants.CIncVarType;
  CFirstUserType = Variants.CFirstUserType;
var
  EmptyParam: OleVariant absolute Variants.EmptyParam;
  NullEqualityRule: TNullCompareRule absolute Variants.NullEqualityRule;
  NullMagnitudeRule: TNullCompareRule absolute Variants.NullMagnitudeRule;
  NullStrictConvert: Boolean absolute Variants.NullStrictConvert;
  NullAsStringValue: string absolute Variants.NullAsStringValue;
  PackVarCreation: Boolean absolute Variants.PackVarCreation;
{$if (not defined(FPUNONE))}
  OleVariantInt64AsDouble: Boolean absolute Variants.OleVariantInt64AsDouble;
{$endif}
  VarDispProc: TVarDispProc absolute Variants.VarDispProc;
  ClearAnyProc: TAnyProc absolute Variants.ClearAnyProc;
  ChangeAnyProc: TAnyProc absolute Variants.ChangeAnyProc;
  RefAnyProc: TAnyProc absolute Variants.RefAnyProc;
  InvalidCustomVariantType: TCustomVariantType absolute Variants.InvalidCustomVariantType;
function VarType(const V: Variant): TVarType; inline;
function VarTypeDeRef(const V: Variant): TVarType; overload; inline;
function VarTypeDeRef(const V: TVarData): TVarType; overload; inline;
function VarAsType(const V: Variant; aVarType: TVarType): Variant; inline;
function VarIsType(const V: Variant; aVarType: TVarType): Boolean; overload; inline;
function VarIsType(const V: Variant; const AVarTypes: array of TVarType): Boolean; overload; inline;
function VarIsByRef(const V: Variant): Boolean; inline;
function VarIsEmpty(const V: Variant): Boolean; inline;
procedure VarCheckEmpty(const V: Variant); inline;
function VarIsNull(const V: Variant): Boolean; inline;
function VarIsClear(const V: Variant): Boolean; inline;
function VarIsCustom(const V: Variant): Boolean; inline;
function VarIsOrdinal(const V: Variant): Boolean; inline;
function VarIsFloat(const V: Variant): Boolean; inline;
function VarIsNumeric(const V: Variant): Boolean; inline;
function VarIsStr(const V: Variant): Boolean; inline;
function VarIsBool(const V: Variant): Boolean; inline;
function VarToStr(const V: Variant): string; inline;
function VarToStrDef(const V: Variant; const ADefault: string): string; inline;
function VarToWideStr(const V: Variant): WideString; inline;
function VarToWideStrDef(const V: Variant; const ADefault: WideString): WideString; inline;
function VarToUnicodeStr(const V: Variant): UnicodeString; inline;
function VarToUnicodeStrDef(const V: Variant; const ADefault: UnicodeString): UnicodeString; inline;
{$if (not defined(FPUNONE))}
function VarToDateTime(const V: Variant): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
function VarFromDateTime(const DateTime: TDateTime): Variant; inline;
{$endif}
function VarInRange(const AValue, AMin, AMax: Variant): Boolean; inline;
function VarEnsureRange(const AValue, AMin, AMax: Variant): Variant; inline;
function VarSameValue(const A, B: Variant): Boolean; inline;
function VarCompareValue(const A, B: Variant): TVariantRelationship; inline;
function VarIsEmptyParam(const V: Variant): Boolean; inline;
procedure VarClear(var V: Variant); overload; inline;
procedure VarClear(var V: OleVariant); overload; inline;
procedure SetClearVarToEmptyParam(var V: TVarData); inline;
function VarIsError(const V: Variant; out AResult: HRESULT): Boolean; overload; inline;
function VarIsError(const V: Variant): Boolean; overload; inline;
function VarAsError(AResult: HRESULT): Variant; inline;
function VarSupports(const V: Variant; const IID: TGUID; out Intf): Boolean; overload; inline;
function VarSupports(const V: Variant; const IID: TGUID): Boolean; overload; inline;
procedure VarCopyNoInd(var Dest: Variant; const Source: Variant); inline;
function VarArrayCreate(const Bounds: array of SizeInt; aVarType: TVarType): Variant; overload; inline;
function VarArrayCreate(const Bounds: PVarArrayBoundArray; Dims : SizeInt; aVarType: TVarType): Variant; overload; inline;
function VarArrayOf(const Values: array of Variant): Variant; inline;
function VarArrayAsPSafeArray(const A: Variant): PVarArray; inline;
function VarArrayDimCount(const A: Variant) : LongInt; inline;
function VarArrayLowBound(const A: Variant; Dim : LongInt) : LongInt; inline;
function VarArrayHighBound(const A: Variant; Dim : LongInt) : LongInt; inline;
function VarArrayLock(const A: Variant): Pointer; inline;
procedure VarArrayUnlock(const A: Variant); inline;
function VarArrayRef(const A: Variant): Variant; inline;
function VarIsArray(const A: Variant): Boolean; overload; inline;
function VarIsArray(const A: Variant; AResolveByRef: Boolean): Boolean; overload; inline;
function VarTypeIsValidArrayType(const aVarType: TVarType): Boolean; inline;
function VarTypeIsValidElementType(const aVarType: TVarType): Boolean; inline;
procedure DynArrayToVariant(var V: Variant; const DynArray: Pointer; TypeInfo: Pointer); inline;
procedure DynArrayFromVariant(var DynArray: Pointer; const V: Variant; TypeInfo: Pointer); inline;
function Unassigned: Variant; inline;
function Null: Variant; inline;
function FindCustomVariantType(const aVarType: TVarType; out CustomVariantType: TCustomVariantType): Boolean; overload; inline;
function FindCustomVariantType(const TypeName: string; out CustomVariantType: TCustomVariantType): Boolean; overload; inline;
procedure VarCastError; overload; inline;
procedure VarCastError(const ASourceType, ADestType: TVarType); overload; inline;
procedure VarCastErrorOle(const ASourceType: TVarType); inline;
procedure VarInvalidOp; overload; inline;
procedure VarInvalidOp(const aLeft, aRight: TVarType; aOpCode: TVarOp); overload; inline;
procedure VarInvalidOp(const aRight: TVarType; aOpCode: TVarOp); overload; inline;
procedure VarInvalidNullOp; inline;
procedure VarBadTypeError; inline;
procedure VarOverflowError; overload; inline;
procedure VarOverflowError(const ASourceType, ADestType: TVarType); overload; inline;
procedure VarBadIndexError; inline;
procedure VarArrayLockedError; inline;
procedure VarNotImplError; inline;
procedure VarOutOfMemoryError; inline;
procedure VarInvalidArgError; overload; inline;
procedure VarInvalidArgError(AType: TVarType); overload; inline;
procedure VarUnexpectedError; inline;
procedure VarRangeCheckError(const AType: TVarType); overload; inline;
procedure VarRangeCheckError(const ASourceType, ADestType: TVarType); overload; inline;
procedure VarArrayCreateError; inline;
procedure VarResultCheck(AResult: HRESULT); overload; inline;
procedure VarResultCheck(AResult: HRESULT; ASourceType, ADestType: TVarType); overload; inline;
procedure HandleConversionException(const ASourceType, ADestType: TVarType); inline;
function VarTypeAsText(const AType: TVarType): string; inline;
function FindVarData(const V: Variant): PVarData; inline;
Function GetPropValue(Instance: TObject; PropInfo: PPropInfo; PreferStrings: Boolean): Variant; overload; inline;
Procedure SetPropValue(Instance: TObject; PropInfo: PPropInfo; const Value: Variant); overload; inline;
Function GetVariantProp(Instance: TObject; PropInfo : PPropInfo): Variant; overload; inline;
Function GetVariantProp(Instance: TObject; const PropName: string): Variant; overload; inline;
Procedure SetVariantProp(Instance: TObject; const PropName: string; const Value: Variant); overload; inline;
Procedure SetVariantProp(Instance: TObject; PropInfo : PPropInfo; const Value: Variant); overload; inline;

implementation

function VarType(const V: Variant): TVarType;
begin
  Result := Variants.VarType(V);
end;

function VarTypeDeRef(const V: Variant): TVarType;
begin
  Result := Variants.VarTypeDeRef(V);
end;

function VarTypeDeRef(const V: TVarData): TVarType;
begin
  Result := Variants.VarTypeDeRef(V);
end;

function VarAsType(const V: Variant; aVarType: TVarType): Variant;
begin
  Result := Variants.VarAsType(V, aVarType);
end;

function VarIsType(const V: Variant; aVarType: TVarType): Boolean;
begin
  Result := Variants.VarIsType(V, aVarType);
end;

function VarIsType(const V: Variant; const AVarTypes: array of TVarType): Boolean;
begin
  Result := Variants.VarIsType(V, AVarTypes);
end;

function VarIsByRef(const V: Variant): Boolean;
begin
  Result := Variants.VarIsByRef(V);
end;

function VarIsEmpty(const V: Variant): Boolean;
begin
  Result := Variants.VarIsEmpty(V);
end;

procedure VarCheckEmpty(const V: Variant);
begin
  Variants.VarCheckEmpty(V);
end;

function VarIsNull(const V: Variant): Boolean;
begin
  Result := Variants.VarIsNull(V);
end;

function VarIsClear(const V: Variant): Boolean;
begin
  Result := Variants.VarIsClear(V);
end;

function VarIsCustom(const V: Variant): Boolean;
begin
  Result := Variants.VarIsCustom(V);
end;

function VarIsOrdinal(const V: Variant): Boolean;
begin
  Result := Variants.VarIsOrdinal(V);
end;

function VarIsFloat(const V: Variant): Boolean;
begin
  Result := Variants.VarIsFloat(V);
end;

function VarIsNumeric(const V: Variant): Boolean;
begin
  Result := Variants.VarIsNumeric(V);
end;

function VarIsStr(const V: Variant): Boolean;
begin
  Result := Variants.VarIsStr(V);
end;

function VarIsBool(const V: Variant): Boolean;
begin
  Result := Variants.VarIsBool(V);
end;

function VarToStr(const V: Variant): string;
begin
  Result := Variants.VarToStr(V);
end;

function VarToStrDef(const V: Variant; const ADefault: string): string;
begin
  Result := Variants.VarToStrDef(V, ADefault);
end;

function VarToWideStr(const V: Variant): WideString;
begin
  Result := Variants.VarToWideStr(V);
end;

function VarToWideStrDef(const V: Variant; const ADefault: WideString): WideString;
begin
  Result := Variants.VarToWideStrDef(V, ADefault);
end;

function VarToUnicodeStr(const V: Variant): UnicodeString;
begin
  Result := Variants.VarToUnicodeStr(V);
end;

function VarToUnicodeStrDef(const V: Variant; const ADefault: UnicodeString): UnicodeString;
begin
  Result := Variants.VarToUnicodeStrDef(V, ADefault);
end;

{$if (not defined(FPUNONE))}
function VarToDateTime(const V: Variant): TDateTime;
begin
  Result := Variants.VarToDateTime(V);
end;

{$endif}
{$if (not defined(FPUNONE))}
function VarFromDateTime(const DateTime: TDateTime): Variant;
begin
  Result := Variants.VarFromDateTime(DateTime);
end;

{$endif}
function VarInRange(const AValue, AMin, AMax: Variant): Boolean;
begin
  Result := Variants.VarInRange(AValue, AMin, AMax);
end;

function VarEnsureRange(const AValue, AMin, AMax: Variant): Variant;
begin
  Result := Variants.VarEnsureRange(AValue, AMin, AMax);
end;

function VarSameValue(const A, B: Variant): Boolean;
begin
  Result := Variants.VarSameValue(A, B);
end;

function VarCompareValue(const A, B: Variant): TVariantRelationship;
begin
  Result := Variants.VarCompareValue(A, B);
end;

function VarIsEmptyParam(const V: Variant): Boolean;
begin
  Result := Variants.VarIsEmptyParam(V);
end;

procedure VarClear(var V: Variant);
begin
  Variants.VarClear(V);
end;

procedure VarClear(var V: OleVariant);
begin
  Variants.VarClear(V);
end;

procedure SetClearVarToEmptyParam(var V: TVarData);
begin
  Variants.SetClearVarToEmptyParam(V);
end;

function VarIsError(const V: Variant; out AResult: HRESULT): Boolean;
begin
  Result := Variants.VarIsError(V, AResult);
end;

function VarIsError(const V: Variant): Boolean;
begin
  Result := Variants.VarIsError(V);
end;

function VarAsError(AResult: HRESULT): Variant;
begin
  Result := Variants.VarAsError(AResult);
end;

function VarSupports(const V: Variant; const IID: TGUID; out Intf): Boolean;
begin
  Result := Variants.VarSupports(V, IID, Intf);
end;

function VarSupports(const V: Variant; const IID: TGUID): Boolean;
begin
  Result := Variants.VarSupports(V, IID);
end;

procedure VarCopyNoInd(var Dest: Variant; const Source: Variant);
begin
  Variants.VarCopyNoInd(Dest, Source);
end;

function VarArrayCreate(const Bounds: array of SizeInt; aVarType: TVarType): Variant;
begin
  Result := Variants.VarArrayCreate(Bounds, aVarType);
end;

function VarArrayCreate(const Bounds: PVarArrayBoundArray; Dims : SizeInt; aVarType: TVarType): Variant;
begin
  Result := Variants.VarArrayCreate(Bounds, Dims, aVarType);
end;

function VarArrayOf(const Values: array of Variant): Variant;
begin
  Result := Variants.VarArrayOf(Values);
end;

function VarArrayAsPSafeArray(const A: Variant): PVarArray;
begin
  Result := Variants.VarArrayAsPSafeArray(A);
end;

function VarArrayDimCount(const A: Variant) : LongInt;
begin
  Result := Variants.VarArrayDimCount(A);
end;

function VarArrayLowBound(const A: Variant; Dim : LongInt) : LongInt;
begin
  Result := Variants.VarArrayLowBound(A, Dim);
end;

function VarArrayHighBound(const A: Variant; Dim : LongInt) : LongInt;
begin
  Result := Variants.VarArrayHighBound(A, Dim);
end;

function VarArrayLock(const A: Variant): Pointer;
begin
  Result := Variants.VarArrayLock(A);
end;

procedure VarArrayUnlock(const A: Variant);
begin
  Variants.VarArrayUnlock(A);
end;

function VarArrayRef(const A: Variant): Variant;
begin
  Result := Variants.VarArrayRef(A);
end;

function VarIsArray(const A: Variant): Boolean;
begin
  Result := Variants.VarIsArray(A);
end;

function VarIsArray(const A: Variant; AResolveByRef: Boolean): Boolean;
begin
  Result := Variants.VarIsArray(A, AResolveByRef);
end;

function VarTypeIsValidArrayType(const aVarType: TVarType): Boolean;
begin
  Result := Variants.VarTypeIsValidArrayType(aVarType);
end;

function VarTypeIsValidElementType(const aVarType: TVarType): Boolean;
begin
  Result := Variants.VarTypeIsValidElementType(aVarType);
end;

procedure DynArrayToVariant(var V: Variant; const DynArray: Pointer; TypeInfo: Pointer);
begin
  Variants.DynArrayToVariant(V, DynArray, TypeInfo);
end;

procedure DynArrayFromVariant(var DynArray: Pointer; const V: Variant; TypeInfo: Pointer);
begin
  Variants.DynArrayFromVariant(DynArray, V, TypeInfo);
end;

function Unassigned: Variant;
begin
  Result := Variants.Unassigned;
end;

function Null: Variant;
begin
  Result := Variants.Null;
end;

function FindCustomVariantType(const aVarType: TVarType; out CustomVariantType: TCustomVariantType): Boolean;
begin
  Result := Variants.FindCustomVariantType(aVarType, CustomVariantType);
end;

function FindCustomVariantType(const TypeName: string; out CustomVariantType: TCustomVariantType): Boolean;
begin
  Result := Variants.FindCustomVariantType(TypeName, CustomVariantType);
end;

procedure VarCastError;
begin
  Variants.VarCastError;
end;

procedure VarCastError(const ASourceType, ADestType: TVarType);
begin
  Variants.VarCastError(ASourceType, ADestType);
end;

procedure VarCastErrorOle(const ASourceType: TVarType);
begin
  Variants.VarCastErrorOle(ASourceType);
end;

procedure VarInvalidOp;
begin
  Variants.VarInvalidOp;
end;

procedure VarInvalidOp(const aLeft, aRight: TVarType; aOpCode: TVarOp);
begin
  Variants.VarInvalidOp(aLeft, aRight, aOpCode);
end;

procedure VarInvalidOp(const aRight: TVarType; aOpCode: TVarOp);
begin
  Variants.VarInvalidOp(aRight, aOpCode);
end;

procedure VarInvalidNullOp;
begin
  Variants.VarInvalidNullOp;
end;

procedure VarBadTypeError;
begin
  Variants.VarBadTypeError;
end;

procedure VarOverflowError;
begin
  Variants.VarOverflowError;
end;

procedure VarOverflowError(const ASourceType, ADestType: TVarType);
begin
  Variants.VarOverflowError(ASourceType, ADestType);
end;

procedure VarBadIndexError;
begin
  Variants.VarBadIndexError;
end;

procedure VarArrayLockedError;
begin
  Variants.VarArrayLockedError;
end;

procedure VarNotImplError;
begin
  Variants.VarNotImplError;
end;

procedure VarOutOfMemoryError;
begin
  Variants.VarOutOfMemoryError;
end;

procedure VarInvalidArgError;
begin
  Variants.VarInvalidArgError;
end;

procedure VarInvalidArgError(AType: TVarType);
begin
  Variants.VarInvalidArgError(AType);
end;

procedure VarUnexpectedError;
begin
  Variants.VarUnexpectedError;
end;

procedure VarRangeCheckError(const AType: TVarType);
begin
  Variants.VarRangeCheckError(AType);
end;

procedure VarRangeCheckError(const ASourceType, ADestType: TVarType);
begin
  Variants.VarRangeCheckError(ASourceType, ADestType);
end;

procedure VarArrayCreateError;
begin
  Variants.VarArrayCreateError;
end;

procedure VarResultCheck(AResult: HRESULT);
begin
  Variants.VarResultCheck(AResult);
end;

procedure VarResultCheck(AResult: HRESULT; ASourceType, ADestType: TVarType);
begin
  Variants.VarResultCheck(AResult, ASourceType, ADestType);
end;

procedure HandleConversionException(const ASourceType, ADestType: TVarType);
begin
  Variants.HandleConversionException(ASourceType, ADestType);
end;

function VarTypeAsText(const AType: TVarType): string;
begin
  Result := Variants.VarTypeAsText(AType);
end;

function FindVarData(const V: Variant): PVarData;
begin
  Result := Variants.FindVarData(V);
end;

Function GetPropValue(Instance: TObject; PropInfo: PPropInfo; PreferStrings: Boolean): Variant;
begin
  Result := Variants.GetPropValue(Instance, PropInfo, PreferStrings);
end;

Procedure SetPropValue(Instance: TObject; PropInfo: PPropInfo; const Value: Variant);
begin
  Variants.SetPropValue(Instance, PropInfo, Value);
end;

Function GetVariantProp(Instance: TObject; PropInfo : PPropInfo): Variant;
begin
  Result := Variants.GetVariantProp(Instance, PropInfo);
end;

Function GetVariantProp(Instance: TObject; const PropName: string): Variant;
begin
  Result := Variants.GetVariantProp(Instance, PropName);
end;

Procedure SetVariantProp(Instance: TObject; const PropName: string; const Value: Variant);
begin
  Variants.SetVariantProp(Instance, PropName, Value);
end;

Procedure SetVariantProp(Instance: TObject; PropInfo : PPropInfo; const Value: Variant);
begin
  Variants.SetVariantProp(Instance, PropInfo, Value);
end;

end.
