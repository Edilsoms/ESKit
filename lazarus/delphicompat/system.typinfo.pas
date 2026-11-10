{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.TypInfo
  Gerado por tools/genvclcompat.py a partir de TypInfo.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.TypInfo;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  TypInfo;
type
  TOrdType = TypInfo.TOrdType;
{$if (not defined(FPUNONE))}
  TFloatType = TypInfo.TFloatType;
{$endif}
  TMethodKind = TypInfo.TMethodKind;
  TParamFlag = TypInfo.TParamFlag;
  TParamFlags = TypInfo.TParamFlags;
  TIntfFlag = TypInfo.TIntfFlag;
  TIntfFlags = TypInfo.TIntfFlags;
  TIntfFlagsBase = TypInfo.TIntfFlagsBase;
  TCallConv = TypInfo.TCallConv;
  TSubRegister = TypInfo.TSubRegister;
  TRegisterType = TypInfo.TRegisterType;
  TTypeKinds = TypInfo.TTypeKinds;
  PParameterLocation = TypInfo.PParameterLocation;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TParameterLocation = TypInfo.TParameterLocation;
{$endif}
  PParameterLocations = TypInfo.PParameterLocations;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TParameterLocations = TypInfo.TParameterLocations;
{$endif}
  PVmtFieldClassTab = TypInfo.PVmtFieldClassTab;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TVmtFieldClassTab = TypInfo.TVmtFieldClassTab;
{$endif}
  PVmtFieldEntry = TypInfo.PVmtFieldEntry;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TVmtFieldEntry = TypInfo.TVmtFieldEntry;
{$endif}
  PVmtFieldTable = TypInfo.PVmtFieldTable;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TVmtFieldTable = TypInfo.TVmtFieldTable;
{$endif}
  TTypeInfo = TypInfo.TTypeInfo;
  PTypeInfo = TypInfo.PTypeInfo;
  PPTypeInfo = TypInfo.PPTypeInfo;
  PPropData = TypInfo.PPropData;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TArrayTypeData = TypInfo.TArrayTypeData;
{$endif}
  PManagedField = TypInfo.PManagedField;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TManagedField = TypInfo.TManagedField;
{$endif}
  PInitManagedField = TypInfo.PInitManagedField;
  PProcedureParam = TypInfo.PProcedureParam;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TProcedureParam = TypInfo.TProcedureParam;
{$endif}
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TProcedureSignature = TypInfo.TProcedureSignature;
{$endif}
  PVmtMethodParam = TypInfo.PVmtMethodParam;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TVmtMethodParam = TypInfo.TVmtMethodParam;
{$endif}
  PIntfMethodEntry = TypInfo.PIntfMethodEntry;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TIntfMethodEntry = TypInfo.TIntfMethodEntry;
{$endif}
  PIntfMethodTable = TypInfo.PIntfMethodTable;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TIntfMethodTable = TypInfo.TIntfMethodTable;
{$endif}
  PVmtMethodEntry = TypInfo.PVmtMethodEntry;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TVmtMethodEntry = TypInfo.TVmtMethodEntry;
{$endif}
  PVmtMethodTable = TypInfo.PVmtMethodTable;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TVmtMethodTable = TypInfo.TVmtMethodTable;
{$endif}
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TRecOpOffsetEntry = TypInfo.TRecOpOffsetEntry;
{$endif}
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TRecOpOffsetTable = TypInfo.TRecOpOffsetTable;
{$endif}
  PRecOpOffsetTable = TypInfo.PRecOpOffsetTable;
  PRecInitData = TypInfo.PRecInitData;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TRecInitData = TypInfo.TRecInitData;
{$endif}
  PInterfaceData = TypInfo.PInterfaceData;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TInterfaceData = TypInfo.TInterfaceData;
{$endif}
  PInterfaceRawData = TypInfo.PInterfaceRawData;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TInterfaceRawData = TypInfo.TInterfaceRawData;
{$endif}
  PClassData = TypInfo.PClassData;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TClassData = TypInfo.TClassData;
{$endif}
  PTypeData = TypInfo.PTypeData;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TTypeData = TypInfo.TTypeData;
{$endif}
  PPropInfo = TypInfo.PPropInfo;
{$if (not defined(FPC_REQUIRES_PROPER_ALIGNMENT))}
  TPropData = TypInfo.TPropData;
{$endif}
  TPropInfo = TypInfo.TPropInfo;
  TProcInfoProc = TypInfo.TProcInfoProc;
  PPropList = TypInfo.PPropList;
  TPropList = TypInfo.TPropList;
  EPropertyError = TypInfo.EPropertyError;
  TGetPropValue = TypInfo.TGetPropValue;
  TSetPropValue = TypInfo.TSetPropValue;
  TGetVariantProp = TypInfo.TGetVariantProp;
  TSetVariantProp = TypInfo.TSetVariantProp;
  EPropertyConvertError = TypInfo.EPropertyConvertError;
  TTypeKind = TypInfo.TTypeKind;
  ShortStringBase = TypInfo.ShortStringBase;
  TInitManagedField = TypInfo.TInitManagedField;
const
  otSByte = TypInfo.otSByte;
  otUByte = TypInfo.otUByte;
  otSWord = TypInfo.otSWord;
  otUWord = TypInfo.otUWord;
  otSLong = TypInfo.otSLong;
  otULong = TypInfo.otULong;
  otSQWord = TypInfo.otSQWord;
  otUQWord = TypInfo.otUQWord;
{$if (not defined(FPUNONE))}
  ftSingle = TypInfo.ftSingle;
{$endif}
{$if (not defined(FPUNONE))}
  ftDouble = TypInfo.ftDouble;
{$endif}
{$if (not defined(FPUNONE))}
  ftExtended = TypInfo.ftExtended;
{$endif}
{$if (not defined(FPUNONE))}
  ftComp = TypInfo.ftComp;
{$endif}
{$if (not defined(FPUNONE))}
  ftCurr = TypInfo.ftCurr;
{$endif}
  mkProcedure = TypInfo.mkProcedure;
  mkFunction = TypInfo.mkFunction;
  mkConstructor = TypInfo.mkConstructor;
  mkDestructor = TypInfo.mkDestructor;
  mkClassProcedure = TypInfo.mkClassProcedure;
  mkClassFunction = TypInfo.mkClassFunction;
  mkClassConstructor = TypInfo.mkClassConstructor;
  mkClassDestructor = TypInfo.mkClassDestructor;
  mkOperatorOverload = TypInfo.mkOperatorOverload;
  pfVar = TypInfo.pfVar;
  pfConst = TypInfo.pfConst;
  pfArray = TypInfo.pfArray;
  pfAddress = TypInfo.pfAddress;
  pfReference = TypInfo.pfReference;
  pfOut = TypInfo.pfOut;
  pfConstRef = TypInfo.pfConstRef;
  pfHidden = TypInfo.pfHidden;
  pfHigh = TypInfo.pfHigh;
  pfSelf = TypInfo.pfSelf;
  pfVmt = TypInfo.pfVmt;
  pfResult = TypInfo.pfResult;
  ifHasGuid = TypInfo.ifHasGuid;
  ifDispInterface = TypInfo.ifDispInterface;
  ifDispatch = TypInfo.ifDispatch;
  ifHasStrGUID = TypInfo.ifHasStrGUID;
  ccReg = TypInfo.ccReg;
  ccCdecl = TypInfo.ccCdecl;
  ccPascal = TypInfo.ccPascal;
  ccStdCall = TypInfo.ccStdCall;
  ccSafeCall = TypInfo.ccSafeCall;
  ccCppdecl = TypInfo.ccCppdecl;
  ccFar16 = TypInfo.ccFar16;
  ccOldFPCCall = TypInfo.ccOldFPCCall;
  ccInternProc = TypInfo.ccInternProc;
  ccSysCall = TypInfo.ccSysCall;
  ccSoftFloat = TypInfo.ccSoftFloat;
  ccMWPascal = TypInfo.ccMWPascal;
  tkUnknown = TypInfo.tkUnknown;
  tkInteger = TypInfo.tkInteger;
  tkChar = TypInfo.tkChar;
  tkEnumeration = TypInfo.tkEnumeration;
  tkFloat = TypInfo.tkFloat;
  tkSet = TypInfo.tkSet;
  tkMethod = TypInfo.tkMethod;
  tkSString = TypInfo.tkSString;
  tkLString = TypInfo.tkLString;
  tkAString = TypInfo.tkAString;
  tkWString = TypInfo.tkWString;
  tkVariant = TypInfo.tkVariant;
  tkArray = TypInfo.tkArray;
  tkRecord = TypInfo.tkRecord;
  tkInterface = TypInfo.tkInterface;
  tkClass = TypInfo.tkClass;
  tkObject = TypInfo.tkObject;
  tkWChar = TypInfo.tkWChar;
  tkBool = TypInfo.tkBool;
  tkInt64 = TypInfo.tkInt64;
  tkQWord = TypInfo.tkQWord;
  tkDynArray = TypInfo.tkDynArray;
  tkInterfaceRaw = TypInfo.tkInterfaceRaw;
  tkProcVar = TypInfo.tkProcVar;
  tkUString = TypInfo.tkUString;
  tkUChar = TypInfo.tkUChar;
  tkHelper = TypInfo.tkHelper;
  tkFile = TypInfo.tkFile;
  tkClassRef = TypInfo.tkClassRef;
  tkPointer = TypInfo.tkPointer;
  ptField = TypInfo.ptField;
  ptStatic = TypInfo.ptStatic;
  ptVirtual = TypInfo.ptVirtual;
  ptConst = TypInfo.ptConst;
  tkString = TypInfo.tkString;
  tkProcedure = TypInfo.tkProcedure;
  tkAny = TypInfo.tkAny;
  tkMethods = TypInfo.tkMethods;
  tkProperties = TypInfo.tkProperties;
var
  DotSep: String absolute TypInfo.DotSep;
  OnGetPropValue: TGetPropValue absolute TypInfo.OnGetPropValue;
  OnSetPropValue: TSetPropValue absolute TypInfo.OnSetPropValue;
  OnGetVariantprop: TGetVariantProp absolute TypInfo.OnGetVariantprop;
  OnSetVariantprop: TSetVariantProp absolute TypInfo.OnSetVariantprop;
Function GetTypeData(TypeInfo : PTypeInfo) : PTypeData; inline;
Function AlignTypeData(p : Pointer) : Pointer; inline;
Function AlignTParamFlags(p : Pointer) : Pointer; inline;
Function AlignPTypeInfo(p : Pointer) : Pointer; inline;
Function GetPropInfo(TypeInfo: PTypeInfo;const PropName: string): PPropInfo; overload; inline;
Function GetPropInfo(TypeInfo: PTypeInfo;const PropName: string; AKinds: TTypeKinds): PPropInfo; overload; inline;
Function GetPropInfo(Instance: TObject; const PropName: string): PPropInfo; overload; inline;
Function GetPropInfo(Instance: TObject; const PropName: string; AKinds: TTypeKinds): PPropInfo; overload; inline;
Function GetPropInfo(AClass: TClass; const PropName: string): PPropInfo; overload; inline;
Function GetPropInfo(AClass: TClass; const PropName: string; AKinds: TTypeKinds): PPropInfo; overload; inline;
Function FindPropInfo(Instance: TObject; const PropName: string): PPropInfo; overload; inline;
Function FindPropInfo(Instance: TObject; const PropName: string; AKinds: TTypeKinds): PPropInfo; overload; inline;
Function FindPropInfo(AClass: TClass; const PropName: string): PPropInfo; overload; inline;
Function FindPropInfo(AClass: TClass; const PropName: string; AKinds: TTypeKinds): PPropInfo; overload; inline;
Procedure GetPropInfos(TypeInfo: PTypeInfo; PropList: PPropList); inline;
Function GetPropList(TypeInfo: PTypeInfo; TypeKinds: TTypeKinds; PropList: PPropList; Sorted: boolean = true): longint; overload; inline;
Function GetPropList(TypeInfo: PTypeInfo; out PropList: PPropList): SizeInt; overload; inline;
function GetPropList(AClass: TClass; out PropList: PPropList): Integer; overload; inline;
function GetPropList(Instance: TObject; out PropList: PPropList): Integer; overload; inline;
Function IsReadableProp(PropInfo : PPropInfo) : Boolean; overload; inline;
Function IsReadableProp(Instance: TObject; const PropName: string): Boolean; overload; inline;
Function IsReadableProp(AClass: TClass; const PropName: string): Boolean; overload; inline;
Function IsWriteableProp(PropInfo : PPropInfo) : Boolean; overload; inline;
Function IsWriteableProp(Instance: TObject; const PropName: string): Boolean; overload; inline;
Function IsWriteableProp(AClass: TClass; const PropName: string): Boolean; overload; inline;
Function IsStoredProp(Instance: TObject;PropInfo : PPropInfo) : Boolean; overload; inline;
Function IsStoredProp(Instance: TObject; const PropName: string): Boolean; overload; inline;
Function IsPublishedProp(Instance: TObject; const PropName: string): Boolean; overload; inline;
Function IsPublishedProp(AClass: TClass; const PropName: string): Boolean; overload; inline;
Function PropType(Instance: TObject; const PropName: string): TTypeKind; overload; inline;
Function PropType(AClass: TClass; const PropName: string): TTypeKind; overload; inline;
Function PropIsType(Instance: TObject; const PropName: string; TypeKind: TTypeKind): Boolean; overload; inline;
Function PropIsType(AClass: TClass; const PropName: string; TypeKind: TTypeKind): Boolean; overload; inline;
Function GetOrdProp(Instance: TObject; PropInfo : PPropInfo) : Int64; overload; inline;
Function GetOrdProp(Instance: TObject; const PropName: string): Int64; overload; inline;
Procedure SetOrdProp(Instance: TObject; PropInfo : PPropInfo; Value : Int64); overload; inline;
Procedure SetOrdProp(Instance: TObject; const PropName: string; Value: Int64); overload; inline;
Function GetEnumProp(Instance: TObject; const PropName: string): string; overload; inline;
Function GetEnumProp(Instance: TObject; const PropInfo: PPropInfo): string; overload; inline;
Procedure SetEnumProp(Instance: TObject; const PropName: string;const Value: string); overload; inline;
Procedure SetEnumProp(Instance: TObject; const PropInfo: PPropInfo;const Value: string); overload; inline;
Function GetSetProp(Instance: TObject; const PropName: string): string; overload; inline;
Function GetSetProp(Instance: TObject; const PropName: string; Brackets: Boolean): string; overload; inline;
Function GetSetProp(Instance: TObject; const PropInfo: PPropInfo; Brackets: Boolean): string; overload; inline;
Procedure SetSetProp(Instance: TObject; const PropName: string; const Value: string); overload; inline;
Procedure SetSetProp(Instance: TObject; const PropInfo: PPropInfo; const Value: string); overload; inline;
Function GetStrProp(Instance: TObject; PropInfo : PPropInfo) : Ansistring; overload; inline;
Function GetStrProp(Instance: TObject; const PropName: string): string; overload; inline;
Procedure SetStrProp(Instance: TObject; const PropName: string; const Value: AnsiString); overload; inline;
Procedure SetStrProp(Instance: TObject; PropInfo : PPropInfo; const Value : Ansistring); overload; inline;
Function GetWideStrProp(Instance: TObject; PropInfo: PPropInfo): WideString; overload; inline;
Function GetWideStrProp(Instance: TObject; const PropName: string): WideString; overload; inline;
Procedure SetWideStrProp(Instance: TObject; const PropName: string; const Value: WideString); overload; inline;
Procedure SetWideStrProp(Instance: TObject; PropInfo: PPropInfo; const Value: WideString); overload; inline;
Function GetUnicodeStrProp(Instance: TObject; PropInfo: PPropInfo): UnicodeString; overload; inline;
Function GetUnicodeStrProp(Instance: TObject; const PropName: string): UnicodeString; overload; inline;
Procedure SetUnicodeStrProp(Instance: TObject; const PropName: string; const Value: UnicodeString); overload; inline;
Procedure SetUnicodeStrProp(Instance: TObject; PropInfo: PPropInfo; const Value: UnicodeString); overload; inline;
Function GetRawbyteStrProp(Instance: TObject; PropInfo: PPropInfo): RawByteString; overload; inline;
Function GetRawByteStrProp(Instance: TObject; const PropName: string): RawByteString; overload; inline;
Procedure SetRawByteStrProp(Instance: TObject; const PropName: string; const Value: RawByteString); overload; inline;
Procedure SetRawByteStrProp(Instance: TObject; PropInfo: PPropInfo; const Value: RawByteString); overload; inline;
{$if (not defined(FPUNONE))}
Function GetFloatProp(Instance: TObject; PropInfo : PPropInfo) : Extended; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function GetFloatProp(Instance: TObject; const PropName: string): Extended; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure SetFloatProp(Instance: TObject; const PropName: string; Value: Extended); overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure SetFloatProp(Instance: TObject; PropInfo : PPropInfo; Value : Extended); overload; inline;
{$endif}
Function GetObjectProp(Instance: TObject; const PropName: string): TObject; overload; inline;
Function GetObjectProp(Instance: TObject; const PropName: string; MinClass: TClass): TObject; overload; inline;
Function GetObjectProp(Instance: TObject; PropInfo: PPropInfo): TObject; overload; inline;
Function GetObjectProp(Instance: TObject; PropInfo: PPropInfo; MinClass: TClass): TObject; overload; inline;
Procedure SetObjectProp(Instance: TObject; const PropName: string; Value: TObject); overload; inline;
Procedure SetObjectProp(Instance: TObject; PropInfo: PPropInfo; Value: TObject); overload; inline;
Function GetObjectPropClass(Instance: TObject; const PropName: string): TClass; overload; inline;
Function GetObjectPropClass(AClass: TClass; const PropName: string): TClass; overload; inline;
Function GetMethodProp(Instance: TObject; PropInfo: PPropInfo) : TMethod; overload; inline;
Function GetMethodProp(Instance: TObject; const PropName: string): TMethod; overload; inline;
Procedure SetMethodProp(Instance: TObject; PropInfo: PPropInfo; const Value : TMethod); overload; inline;
Procedure SetMethodProp(Instance: TObject; const PropName: string; const Value: TMethod); overload; inline;
Function GetInt64Prop(Instance: TObject; PropInfo: PPropInfo): Int64; overload; inline;
Function GetInt64Prop(Instance: TObject; const PropName: string): Int64; overload; inline;
Procedure SetInt64Prop(Instance: TObject; PropInfo: PPropInfo; const Value: Int64); overload; inline;
Procedure SetInt64Prop(Instance: TObject; const PropName: string; const Value: Int64); overload; inline;
Function GetPropValue(Instance: TObject; const PropName: string): Variant; overload; inline;
Function GetPropValue(Instance: TObject; const PropName: string; PreferStrings: Boolean): Variant; overload; inline;
Function GetPropValue(Instance: TObject; PropInfo: PPropInfo): Variant; overload; inline;
Function GetPropValue(Instance: TObject; PropInfo: PPropInfo; PreferStrings: Boolean): Variant; overload; inline;
Procedure SetPropValue(Instance: TObject; const PropName: string; const Value: Variant); overload; inline;
Procedure SetPropValue(Instance: TObject; PropInfo: PPropInfo; const Value: Variant); overload; inline;
Function GetVariantProp(Instance: TObject; PropInfo : PPropInfo): Variant; overload; inline;
Function GetVariantProp(Instance: TObject; const PropName: string): Variant; overload; inline;
Procedure SetVariantProp(Instance: TObject; const PropName: string; const Value: Variant); overload; inline;
Procedure SetVariantProp(Instance: TObject; PropInfo : PPropInfo; const Value: Variant); overload; inline;
function GetInterfaceProp(Instance: TObject; const PropName: string): IInterface; overload; inline;
function GetInterfaceProp(Instance: TObject; PropInfo: PPropInfo): IInterface; overload; inline;
procedure SetInterfaceProp(Instance: TObject; const PropName: string; const Value: IInterface); overload; inline;
procedure SetInterfaceProp(Instance: TObject; PropInfo: PPropInfo; const Value: IInterface); overload; inline;
function GetRawInterfaceProp(Instance: TObject; const PropName: string): Pointer; overload; inline;
function GetRawInterfaceProp(Instance: TObject; PropInfo: PPropInfo): Pointer; overload; inline;
procedure SetRawInterfaceProp(Instance: TObject; const PropName: string; const Value: Pointer); overload; inline;
procedure SetRawInterfaceProp(Instance: TObject; PropInfo: PPropInfo; const Value: Pointer); overload; inline;
function GetDynArrayProp(Instance: TObject; const PropName: string): Pointer; overload; inline;
function GetDynArrayProp(Instance: TObject; PropInfo: PPropInfo): Pointer; overload; inline;
procedure SetDynArrayProp(Instance: TObject; const PropName: string; const Value: Pointer); overload; inline;
procedure SetDynArrayProp(Instance: TObject; PropInfo: PPropInfo; const Value: Pointer); overload; inline;
Function GetEnumName(TypeInfo : PTypeInfo;Value : Integer) : string; inline;
Function GetEnumValue(TypeInfo : PTypeInfo;const Name : string) : Integer; inline;
function GetEnumNameCount(enum1: PTypeInfo): SizeInt; inline;
procedure AddEnumElementAliases(aTypeInfo: PTypeInfo; const aNames: array of string; aStartValue: Integer = 0); inline;
procedure RemoveEnumElementAliases(aTypeInfo: PTypeInfo); inline;
function GetEnumeratedAliasValue(aTypeInfo: PTypeInfo; const aName: string): Integer; inline;
function SetToString(TypeInfo: PTypeInfo; Value: LongInt; Brackets: Boolean) : String; overload; inline;
function SetToString(PropInfo: PPropInfo; Value: LongInt; Brackets: Boolean) : String; overload; inline;
function SetToString(PropInfo: PPropInfo; Value: LongInt) : String; overload; inline;
function SetToString(TypeInfo: PTypeInfo; Value: Pointer; Brackets: Boolean = False) : String; overload; inline;
function SetToString(PropInfo: PPropInfo; Value: Pointer; Brackets: Boolean = False) : String; overload; inline;
function StringToSet(PropInfo: PPropInfo; const Value: string): LongInt; overload; inline;
function StringToSet(TypeInfo: PTypeInfo; const Value: string): LongInt; overload; inline;
procedure StringToSet(PropInfo: PPropInfo; const Value: String; Result: Pointer); overload; inline;
procedure StringToSet(TypeInfo: PTypeInfo; const Value: String; Result: Pointer); overload; inline;
function DerefTypeInfoPtr(Info: PPTypeInfo): PTypeInfo; inline;

implementation

Function GetTypeData(TypeInfo : PTypeInfo) : PTypeData;
begin
  Result := TypInfo.GetTypeData(TypeInfo);
end;

Function AlignTypeData(p : Pointer) : Pointer;
begin
  Result := TypInfo.AlignTypeData(p);
end;

Function AlignTParamFlags(p : Pointer) : Pointer;
begin
  Result := TypInfo.AlignTParamFlags(p);
end;

Function AlignPTypeInfo(p : Pointer) : Pointer;
begin
  Result := TypInfo.AlignPTypeInfo(p);
end;

Function GetPropInfo(TypeInfo: PTypeInfo;const PropName: string): PPropInfo;
begin
  Result := TypInfo.GetPropInfo(TypeInfo, PropName);
end;

Function GetPropInfo(TypeInfo: PTypeInfo;const PropName: string; AKinds: TTypeKinds): PPropInfo;
begin
  Result := TypInfo.GetPropInfo(TypeInfo, PropName, AKinds);
end;

Function GetPropInfo(Instance: TObject; const PropName: string): PPropInfo;
begin
  Result := TypInfo.GetPropInfo(Instance, PropName);
end;

Function GetPropInfo(Instance: TObject; const PropName: string; AKinds: TTypeKinds): PPropInfo;
begin
  Result := TypInfo.GetPropInfo(Instance, PropName, AKinds);
end;

Function GetPropInfo(AClass: TClass; const PropName: string): PPropInfo;
begin
  Result := TypInfo.GetPropInfo(AClass, PropName);
end;

Function GetPropInfo(AClass: TClass; const PropName: string; AKinds: TTypeKinds): PPropInfo;
begin
  Result := TypInfo.GetPropInfo(AClass, PropName, AKinds);
end;

Function FindPropInfo(Instance: TObject; const PropName: string): PPropInfo;
begin
  Result := TypInfo.FindPropInfo(Instance, PropName);
end;

Function FindPropInfo(Instance: TObject; const PropName: string; AKinds: TTypeKinds): PPropInfo;
begin
  Result := TypInfo.FindPropInfo(Instance, PropName, AKinds);
end;

Function FindPropInfo(AClass: TClass; const PropName: string): PPropInfo;
begin
  Result := TypInfo.FindPropInfo(AClass, PropName);
end;

Function FindPropInfo(AClass: TClass; const PropName: string; AKinds: TTypeKinds): PPropInfo;
begin
  Result := TypInfo.FindPropInfo(AClass, PropName, AKinds);
end;

Procedure GetPropInfos(TypeInfo: PTypeInfo; PropList: PPropList);
begin
  TypInfo.GetPropInfos(TypeInfo, PropList);
end;

Function GetPropList(TypeInfo: PTypeInfo; TypeKinds: TTypeKinds; PropList: PPropList; Sorted: boolean = true): longint;
begin
  Result := TypInfo.GetPropList(TypeInfo, TypeKinds, PropList, Sorted);
end;

Function GetPropList(TypeInfo: PTypeInfo; out PropList: PPropList): SizeInt;
begin
  Result := TypInfo.GetPropList(TypeInfo, PropList);
end;

function GetPropList(AClass: TClass; out PropList: PPropList): Integer;
begin
  Result := TypInfo.GetPropList(AClass, PropList);
end;

function GetPropList(Instance: TObject; out PropList: PPropList): Integer;
begin
  Result := TypInfo.GetPropList(Instance, PropList);
end;

Function IsReadableProp(PropInfo : PPropInfo) : Boolean;
begin
  Result := TypInfo.IsReadableProp(PropInfo);
end;

Function IsReadableProp(Instance: TObject; const PropName: string): Boolean;
begin
  Result := TypInfo.IsReadableProp(Instance, PropName);
end;

Function IsReadableProp(AClass: TClass; const PropName: string): Boolean;
begin
  Result := TypInfo.IsReadableProp(AClass, PropName);
end;

Function IsWriteableProp(PropInfo : PPropInfo) : Boolean;
begin
  Result := TypInfo.IsWriteableProp(PropInfo);
end;

Function IsWriteableProp(Instance: TObject; const PropName: string): Boolean;
begin
  Result := TypInfo.IsWriteableProp(Instance, PropName);
end;

Function IsWriteableProp(AClass: TClass; const PropName: string): Boolean;
begin
  Result := TypInfo.IsWriteableProp(AClass, PropName);
end;

Function IsStoredProp(Instance: TObject;PropInfo : PPropInfo) : Boolean;
begin
  Result := TypInfo.IsStoredProp(Instance, PropInfo);
end;

Function IsStoredProp(Instance: TObject; const PropName: string): Boolean;
begin
  Result := TypInfo.IsStoredProp(Instance, PropName);
end;

Function IsPublishedProp(Instance: TObject; const PropName: string): Boolean;
begin
  Result := TypInfo.IsPublishedProp(Instance, PropName);
end;

Function IsPublishedProp(AClass: TClass; const PropName: string): Boolean;
begin
  Result := TypInfo.IsPublishedProp(AClass, PropName);
end;

Function PropType(Instance: TObject; const PropName: string): TTypeKind;
begin
  Result := TypInfo.PropType(Instance, PropName);
end;

Function PropType(AClass: TClass; const PropName: string): TTypeKind;
begin
  Result := TypInfo.PropType(AClass, PropName);
end;

Function PropIsType(Instance: TObject; const PropName: string; TypeKind: TTypeKind): Boolean;
begin
  Result := TypInfo.PropIsType(Instance, PropName, TypeKind);
end;

Function PropIsType(AClass: TClass; const PropName: string; TypeKind: TTypeKind): Boolean;
begin
  Result := TypInfo.PropIsType(AClass, PropName, TypeKind);
end;

Function GetOrdProp(Instance: TObject; PropInfo : PPropInfo) : Int64;
begin
  Result := TypInfo.GetOrdProp(Instance, PropInfo);
end;

Function GetOrdProp(Instance: TObject; const PropName: string): Int64;
begin
  Result := TypInfo.GetOrdProp(Instance, PropName);
end;

Procedure SetOrdProp(Instance: TObject; PropInfo : PPropInfo; Value : Int64);
begin
  TypInfo.SetOrdProp(Instance, PropInfo, Value);
end;

Procedure SetOrdProp(Instance: TObject; const PropName: string; Value: Int64);
begin
  TypInfo.SetOrdProp(Instance, PropName, Value);
end;

Function GetEnumProp(Instance: TObject; const PropName: string): string;
begin
  Result := TypInfo.GetEnumProp(Instance, PropName);
end;

Function GetEnumProp(Instance: TObject; const PropInfo: PPropInfo): string;
begin
  Result := TypInfo.GetEnumProp(Instance, PropInfo);
end;

Procedure SetEnumProp(Instance: TObject; const PropName: string;const Value: string);
begin
  TypInfo.SetEnumProp(Instance, PropName, Value);
end;

Procedure SetEnumProp(Instance: TObject; const PropInfo: PPropInfo;const Value: string);
begin
  TypInfo.SetEnumProp(Instance, PropInfo, Value);
end;

Function GetSetProp(Instance: TObject; const PropName: string): string;
begin
  Result := TypInfo.GetSetProp(Instance, PropName);
end;

Function GetSetProp(Instance: TObject; const PropName: string; Brackets: Boolean): string;
begin
  Result := TypInfo.GetSetProp(Instance, PropName, Brackets);
end;

Function GetSetProp(Instance: TObject; const PropInfo: PPropInfo; Brackets: Boolean): string;
begin
  Result := TypInfo.GetSetProp(Instance, PropInfo, Brackets);
end;

Procedure SetSetProp(Instance: TObject; const PropName: string; const Value: string);
begin
  TypInfo.SetSetProp(Instance, PropName, Value);
end;

Procedure SetSetProp(Instance: TObject; const PropInfo: PPropInfo; const Value: string);
begin
  TypInfo.SetSetProp(Instance, PropInfo, Value);
end;

Function GetStrProp(Instance: TObject; PropInfo : PPropInfo) : Ansistring;
begin
  Result := TypInfo.GetStrProp(Instance, PropInfo);
end;

Function GetStrProp(Instance: TObject; const PropName: string): string;
begin
  Result := TypInfo.GetStrProp(Instance, PropName);
end;

Procedure SetStrProp(Instance: TObject; const PropName: string; const Value: AnsiString);
begin
  TypInfo.SetStrProp(Instance, PropName, Value);
end;

Procedure SetStrProp(Instance: TObject; PropInfo : PPropInfo; const Value : Ansistring);
begin
  TypInfo.SetStrProp(Instance, PropInfo, Value);
end;

Function GetWideStrProp(Instance: TObject; PropInfo: PPropInfo): WideString;
begin
  Result := TypInfo.GetWideStrProp(Instance, PropInfo);
end;

Function GetWideStrProp(Instance: TObject; const PropName: string): WideString;
begin
  Result := TypInfo.GetWideStrProp(Instance, PropName);
end;

Procedure SetWideStrProp(Instance: TObject; const PropName: string; const Value: WideString);
begin
  TypInfo.SetWideStrProp(Instance, PropName, Value);
end;

Procedure SetWideStrProp(Instance: TObject; PropInfo: PPropInfo; const Value: WideString);
begin
  TypInfo.SetWideStrProp(Instance, PropInfo, Value);
end;

Function GetUnicodeStrProp(Instance: TObject; PropInfo: PPropInfo): UnicodeString;
begin
  Result := TypInfo.GetUnicodeStrProp(Instance, PropInfo);
end;

Function GetUnicodeStrProp(Instance: TObject; const PropName: string): UnicodeString;
begin
  Result := TypInfo.GetUnicodeStrProp(Instance, PropName);
end;

Procedure SetUnicodeStrProp(Instance: TObject; const PropName: string; const Value: UnicodeString);
begin
  TypInfo.SetUnicodeStrProp(Instance, PropName, Value);
end;

Procedure SetUnicodeStrProp(Instance: TObject; PropInfo: PPropInfo; const Value: UnicodeString);
begin
  TypInfo.SetUnicodeStrProp(Instance, PropInfo, Value);
end;

Function GetRawbyteStrProp(Instance: TObject; PropInfo: PPropInfo): RawByteString;
begin
  Result := TypInfo.GetRawbyteStrProp(Instance, PropInfo);
end;

Function GetRawByteStrProp(Instance: TObject; const PropName: string): RawByteString;
begin
  Result := TypInfo.GetRawbyteStrProp(Instance, PropName);
end;

Procedure SetRawByteStrProp(Instance: TObject; const PropName: string; const Value: RawByteString);
begin
  TypInfo.SetRawByteStrProp(Instance, PropName, Value);
end;

Procedure SetRawByteStrProp(Instance: TObject; PropInfo: PPropInfo; const Value: RawByteString);
begin
  TypInfo.SetRawByteStrProp(Instance, PropInfo, Value);
end;

{$if (not defined(FPUNONE))}
Function GetFloatProp(Instance: TObject; PropInfo : PPropInfo) : Extended;
begin
  Result := TypInfo.GetFloatProp(Instance, PropInfo);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function GetFloatProp(Instance: TObject; const PropName: string): Extended;
begin
  Result := TypInfo.GetFloatProp(Instance, PropName);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure SetFloatProp(Instance: TObject; const PropName: string; Value: Extended);
begin
  TypInfo.SetFloatProp(Instance, PropName, Value);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure SetFloatProp(Instance: TObject; PropInfo : PPropInfo; Value : Extended);
begin
  TypInfo.SetFloatProp(Instance, PropInfo, Value);
end;

{$endif}
Function GetObjectProp(Instance: TObject; const PropName: string): TObject;
begin
  Result := TypInfo.GetObjectProp(Instance, PropName);
end;

Function GetObjectProp(Instance: TObject; const PropName: string; MinClass: TClass): TObject;
begin
  Result := TypInfo.GetObjectProp(Instance, PropName, MinClass);
end;

Function GetObjectProp(Instance: TObject; PropInfo: PPropInfo): TObject;
begin
  Result := TypInfo.GetObjectProp(Instance, PropInfo);
end;

Function GetObjectProp(Instance: TObject; PropInfo: PPropInfo; MinClass: TClass): TObject;
begin
  Result := TypInfo.GetObjectProp(Instance, PropInfo, MinClass);
end;

Procedure SetObjectProp(Instance: TObject; const PropName: string; Value: TObject);
begin
  TypInfo.SetObjectProp(Instance, PropName, Value);
end;

Procedure SetObjectProp(Instance: TObject; PropInfo: PPropInfo; Value: TObject);
begin
  TypInfo.SetObjectProp(Instance, PropInfo, Value);
end;

Function GetObjectPropClass(Instance: TObject; const PropName: string): TClass;
begin
  Result := TypInfo.GetObjectPropClass(Instance, PropName);
end;

Function GetObjectPropClass(AClass: TClass; const PropName: string): TClass;
begin
  Result := TypInfo.GetObjectPropClass(AClass, PropName);
end;

Function GetMethodProp(Instance: TObject; PropInfo: PPropInfo) : TMethod;
begin
  Result := TypInfo.GetMethodProp(Instance, PropInfo);
end;

Function GetMethodProp(Instance: TObject; const PropName: string): TMethod;
begin
  Result := TypInfo.GetMethodProp(Instance, PropName);
end;

Procedure SetMethodProp(Instance: TObject; PropInfo: PPropInfo; const Value : TMethod);
begin
  TypInfo.SetMethodProp(Instance, PropInfo, Value);
end;

Procedure SetMethodProp(Instance: TObject; const PropName: string; const Value: TMethod);
begin
  TypInfo.SetMethodProp(Instance, PropName, Value);
end;

Function GetInt64Prop(Instance: TObject; PropInfo: PPropInfo): Int64;
begin
  Result := TypInfo.GetInt64Prop(Instance, PropInfo);
end;

Function GetInt64Prop(Instance: TObject; const PropName: string): Int64;
begin
  Result := TypInfo.GetInt64Prop(Instance, PropName);
end;

Procedure SetInt64Prop(Instance: TObject; PropInfo: PPropInfo; const Value: Int64);
begin
  TypInfo.SetInt64Prop(Instance, PropInfo, Value);
end;

Procedure SetInt64Prop(Instance: TObject; const PropName: string; const Value: Int64);
begin
  TypInfo.SetInt64Prop(Instance, PropName, Value);
end;

Function GetPropValue(Instance: TObject; const PropName: string): Variant;
begin
  Result := TypInfo.GetPropValue(Instance, PropName);
end;

Function GetPropValue(Instance: TObject; const PropName: string; PreferStrings: Boolean): Variant;
begin
  Result := TypInfo.GetPropValue(Instance, PropName, PreferStrings);
end;

Function GetPropValue(Instance: TObject; PropInfo: PPropInfo): Variant;
begin
  Result := TypInfo.GetPropValue(Instance, PropInfo);
end;

Function GetPropValue(Instance: TObject; PropInfo: PPropInfo; PreferStrings: Boolean): Variant;
begin
  Result := TypInfo.GetPropValue(Instance, PropInfo, PreferStrings);
end;

Procedure SetPropValue(Instance: TObject; const PropName: string; const Value: Variant);
begin
  TypInfo.SetPropValue(Instance, PropName, Value);
end;

Procedure SetPropValue(Instance: TObject; PropInfo: PPropInfo; const Value: Variant);
begin
  TypInfo.SetPropValue(Instance, PropInfo, Value);
end;

Function GetVariantProp(Instance: TObject; PropInfo : PPropInfo): Variant;
begin
  Result := TypInfo.GetVariantProp(Instance, PropInfo);
end;

Function GetVariantProp(Instance: TObject; const PropName: string): Variant;
begin
  Result := TypInfo.GetVariantProp(Instance, PropName);
end;

Procedure SetVariantProp(Instance: TObject; const PropName: string; const Value: Variant);
begin
  TypInfo.SetVariantProp(Instance, PropName, Value);
end;

Procedure SetVariantProp(Instance: TObject; PropInfo : PPropInfo; const Value: Variant);
begin
  TypInfo.SetVariantProp(Instance, PropInfo, Value);
end;

function GetInterfaceProp(Instance: TObject; const PropName: string): IInterface;
begin
  Result := TypInfo.GetInterfaceProp(Instance, PropName);
end;

function GetInterfaceProp(Instance: TObject; PropInfo: PPropInfo): IInterface;
begin
  Result := TypInfo.GetInterfaceProp(Instance, PropInfo);
end;

procedure SetInterfaceProp(Instance: TObject; const PropName: string; const Value: IInterface);
begin
  TypInfo.SetInterfaceProp(Instance, PropName, Value);
end;

procedure SetInterfaceProp(Instance: TObject; PropInfo: PPropInfo; const Value: IInterface);
begin
  TypInfo.SetInterfaceProp(Instance, PropInfo, Value);
end;

function GetRawInterfaceProp(Instance: TObject; const PropName: string): Pointer;
begin
  Result := TypInfo.GetRawInterfaceProp(Instance, PropName);
end;

function GetRawInterfaceProp(Instance: TObject; PropInfo: PPropInfo): Pointer;
begin
  Result := TypInfo.GetRawInterfaceProp(Instance, PropInfo);
end;

procedure SetRawInterfaceProp(Instance: TObject; const PropName: string; const Value: Pointer);
begin
  TypInfo.SetRawInterfaceProp(Instance, PropName, Value);
end;

procedure SetRawInterfaceProp(Instance: TObject; PropInfo: PPropInfo; const Value: Pointer);
begin
  TypInfo.SetRawInterfaceProp(Instance, PropInfo, Value);
end;

function GetDynArrayProp(Instance: TObject; const PropName: string): Pointer;
begin
  Result := TypInfo.GetDynArrayProp(Instance, PropName);
end;

function GetDynArrayProp(Instance: TObject; PropInfo: PPropInfo): Pointer;
begin
  Result := TypInfo.GetDynArrayProp(Instance, PropInfo);
end;

procedure SetDynArrayProp(Instance: TObject; const PropName: string; const Value: Pointer);
begin
  TypInfo.SetDynArrayProp(Instance, PropName, Value);
end;

procedure SetDynArrayProp(Instance: TObject; PropInfo: PPropInfo; const Value: Pointer);
begin
  TypInfo.SetDynArrayProp(Instance, PropInfo, Value);
end;

Function GetEnumName(TypeInfo : PTypeInfo;Value : Integer) : string;
begin
  Result := TypInfo.GetEnumName(TypeInfo, Value);
end;

Function GetEnumValue(TypeInfo : PTypeInfo;const Name : string) : Integer;
begin
  Result := TypInfo.GetEnumValue(TypeInfo, Name);
end;

function GetEnumNameCount(enum1: PTypeInfo): SizeInt;
begin
  Result := TypInfo.GetEnumNameCount(enum1);
end;

procedure AddEnumElementAliases(aTypeInfo: PTypeInfo; const aNames: array of string; aStartValue: Integer = 0);
begin
  TypInfo.AddEnumElementAliases(aTypeInfo, aNames, aStartValue);
end;

procedure RemoveEnumElementAliases(aTypeInfo: PTypeInfo);
begin
  TypInfo.RemoveEnumElementAliases(aTypeInfo);
end;

function GetEnumeratedAliasValue(aTypeInfo: PTypeInfo; const aName: string): Integer;
begin
  Result := TypInfo.GetEnumeratedAliasValue(aTypeInfo, aName);
end;

function SetToString(TypeInfo: PTypeInfo; Value: LongInt; Brackets: Boolean) : String;
begin
  Result := TypInfo.SetToString(TypeInfo, Value, Brackets);
end;

function SetToString(PropInfo: PPropInfo; Value: LongInt; Brackets: Boolean) : String;
begin
  Result := TypInfo.SetToString(PropInfo, Value, Brackets);
end;

function SetToString(PropInfo: PPropInfo; Value: LongInt) : String;
begin
  Result := TypInfo.SetToString(PropInfo, Value);
end;

function SetToString(TypeInfo: PTypeInfo; Value: Pointer; Brackets: Boolean = False) : String;
begin
  Result := TypInfo.SetToString(TypeInfo, Value, Brackets);
end;

function SetToString(PropInfo: PPropInfo; Value: Pointer; Brackets: Boolean = False) : String;
begin
  Result := TypInfo.SetToString(PropInfo, Value, Brackets);
end;

function StringToSet(PropInfo: PPropInfo; const Value: string): LongInt;
begin
  Result := TypInfo.StringToSet(PropInfo, Value);
end;

function StringToSet(TypeInfo: PTypeInfo; const Value: string): LongInt;
begin
  Result := TypInfo.StringToSet(TypeInfo, Value);
end;

procedure StringToSet(PropInfo: PPropInfo; const Value: String; Result: Pointer);
begin
  TypInfo.StringToSet(PropInfo, Value, Result);
end;

procedure StringToSet(TypeInfo: PTypeInfo; const Value: String; Result: Pointer);
begin
  TypInfo.StringToSet(TypeInfo, Value, Result);
end;

function DerefTypeInfoPtr(Info: PPTypeInfo): PTypeInfo;
begin
  Result := TypInfo.DerefTypeInfoPtr(Info);
end;

end.
