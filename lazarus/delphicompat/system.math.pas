{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.Math
  Gerado por tools/genvclcompat.py a partir de Math.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.Math;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  sysutils, Math;
type
{$if (not defined(FPUNONE))}
  PFloat = Math.PFloat;
{$endif}
{$if (not defined(FPUNONE))}
  TPaymentTime = Math.TPaymentTime;
{$endif}
{$if (not defined(FPUNONE))}
  EInvalidArgument = Math.EInvalidArgument;
{$endif}
{$if (not defined(FPUNONE))}
  TValueRelationship = Math.TValueRelationship;
{$endif}
{$if (not defined(FPUNONE))}
  TValueSign = Math.TValueSign;
{$endif}
{$if (not defined(FPUNONE))}
  TRoundToRange = Math.TRoundToRange;
{$endif}
{$if (not defined(FPUNONE))}
  Float = Math.Float;
{$endif}
{$if (not defined(FPUNONE))}
  PInteger = Math.PInteger;
{$endif}
{$if (not defined(FPUNONE))}
  TFPURoundingMode = Math.TFPURoundingMode;
{$endif}
{$if (not defined(FPUNONE))}
  TFPUPrecisionMode = Math.TFPUPrecisionMode;
{$endif}
{$if (not defined(FPUNONE))}
  TFPUException = Math.TFPUException;
{$endif}
{$if (not defined(FPUNONE))}
  TFPUExceptionMask = Math.TFPUExceptionMask;
{$endif}
const
{$if (not defined(FPUNONE))}
  ptEndOfPeriod = Math.ptEndOfPeriod;
{$endif}
{$if (not defined(FPUNONE))}
  ptStartOfPeriod = Math.ptStartOfPeriod;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
  MinSingle = Math.MinSingle;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
  MaxSingle = Math.MaxSingle;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
  MinDouble = Math.MinDouble;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
  MaxDouble = Math.MaxDouble;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
  MinExtended = Math.MinExtended;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
  MaxExtended = Math.MaxExtended;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
  MinFloat = Math.MinFloat;
{$endif}
{$if (not defined(FPUNONE))}
  MaxFloat = Math.MaxFloat;
{$endif}
{$if (not defined(FPUNONE))}
  EqualsValue = Math.EqualsValue;
{$endif}
{$if (not defined(FPUNONE))}
  LessThanValue = Math.LessThanValue;
{$endif}
{$if (not defined(FPUNONE))}
  GreaterThanValue = Math.GreaterThanValue;
{$endif}
{$if (not defined(FPUNONE))}
  NaN = Math.NaN;
{$endif}
{$if (not defined(FPUNONE))}
  Infinity = Math.Infinity;
{$endif}
{$if (not defined(FPUNONE))}
  NegInfinity = Math.NegInfinity;
{$endif}
{$if (not defined(FPUNONE))}
  NegativeValue = Math.NegativeValue;
{$endif}
{$if (not defined(FPUNONE))}
  ZeroValue = Math.ZeroValue;
{$endif}
{$if (not defined(FPUNONE))}
  PositiveValue = Math.PositiveValue;
{$endif}
{$if (not defined(FPUNONE))}
function MinIntValue(const Data: array of Integer): Integer; inline;
{$endif}
{$if (not defined(FPUNONE))}
function MaxIntValue(const Data: array of Integer): Integer; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Min(a, b: Integer): Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Min(a, b: Cardinal): Cardinal; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Min(a, b: Int64): Int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Min(a, b: QWord): QWord; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Min(a, b: Single): Single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Min(a, b: Double): Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Min(a, b: Extended): Extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Max(a, b: Integer): Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Max(a, b: Cardinal): Cardinal; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Max(a, b: Int64): Int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Max(a, b: QWord): QWord; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Max(a, b: Single): Single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Max(a, b: Double): Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Max(a, b: Extended): Extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function InRange(const AValue, AMin, AMax: Integer): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function InRange(const AValue, AMin, AMax: Int64): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function InRange(const AValue, AMin, AMax: Double): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function EnsureRange(const AValue, AMin, AMax: Integer): Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function EnsureRange(const AValue, AMin, AMax: Int64): Int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function EnsureRange(const AValue, AMin, AMax: Double): Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
procedure DivMod(Dividend: LongInt; Divisor: Word; var Result, Remainder: Word); overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
procedure DivMod(Dividend: LongInt; Divisor: Word; var Result, Remainder: SmallInt); overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
procedure DivMod(Dividend: DWord; Divisor: DWord; var Result, Remainder: DWord); overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
procedure DivMod(Dividend: LongInt; Divisor: LongInt; var Result, Remainder: LongInt); overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function FMod(const a, b: Single): Single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function FMod(const a, b: Double): Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function FMod(const a, b: Extended): Extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Sign(const AValue: Integer): TValueSign; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Sign(const AValue: Int64): TValueSign; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Sign(const AValue: Single): TValueSign; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Sign(const AValue: Double): TValueSign; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Sign(const AValue: Extended): TValueSign; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function IsZero(const A: Single; Epsilon: Single): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function IsZero(const A: Single): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function IsZero(const A: Double; Epsilon: Double): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function IsZero(const A: Double): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function IsZero(const A: Extended; Epsilon: Extended): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function IsZero(const A: Extended): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function IsNan(const d : Single): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function IsNan(const d : Double): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function IsNan(const d : Extended): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function IsInfinite(const d : Single): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function IsInfinite(const d : Double): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function IsInfinite(const d : Extended): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SameValue(const A, B: Extended): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SameValue(const A, B: Double): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function SameValue(const A, B: Single): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SameValue(const A, B: Extended; Epsilon: Extended): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SameValue(const A, B: Double; Epsilon: Double): Boolean; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function SameValue(const A, B: Single; Epsilon: Single): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function RoundTo(const AValue: Double; const Digits: TRoundToRange): Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function RoundTo(const AVAlue: Extended; const Digits: TRoundToRange): Extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function RoundTo(const AValue: Single; const Digits: TRoundToRange): Single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function SimpleRoundTo(const AValue: Single; const Digits: TRoundToRange = -2): Single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SimpleRoundTo(const AValue: Double; const Digits: TRoundToRange = -2): Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SimpleRoundTo(const AValue: Extended; const Digits: TRoundToRange = -2): Extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function DegToRad(deg : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function RadToDeg(rad : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function GradToRad(grad : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function RadToGrad(rad : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function DegToGrad(deg : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function GradToDeg(grad : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function CycleToRad(cycle : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function RadToCycle(rad : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
Function DegNormalize(deg : single) : single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
Function DegNormalize(deg : double) : double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function DegNormalize(deg : extended) : extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Tan(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Cotan(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Cot(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure SinCos(theta : single;out sinus,cosinus : single); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure SinCos(theta : double;out sinus,cosinus : double); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure SinCos(theta : extended;out sinus,cosinus : extended); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Secant(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Cosecant(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Sec(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Csc(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ArcCos(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ArcSin(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ArcTan2(y,x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function CosH(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function SinH(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function TanH(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ArcCosH(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ArcSinH(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ArcTanH(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ArCosH(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ArSinH(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ArTanH(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Hypot(x,y : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Log10(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Log2(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function LogN(n,x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function LnXP1(x : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Power(base,exponent : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function IntPower(base : float;const exponent : Integer) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Ceil(x : float) : Integer; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Ceil64(x: float): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Floor(x : float) : Integer; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Floor64(x: float): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
procedure Frexp(X: float; var Mantissa: float; var Exponent: integer); inline;
{$endif}
{$if (not defined(FPUNONE))}
function Ldexp(x : float; const p : Integer) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Mean(const data : array of Single) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Mean(const data : PSingle; Const N : longint) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Mean(const data : array of double) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Mean(const data : PDouble; Const N : longint) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Mean(const data : array of Extended) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Mean(const data : PExtended; Const N : longint) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Mean(const data : PInt64; const N : Longint):Float; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Mean(const data: array of Int64):Float; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Mean(const data : PInteger; const N : Longint):Float; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Mean(const data: array of Integer):Float; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Sum(const data : array of Single) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Sum(const data : PSingle; Const N : Longint) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Sum(const data : array of double) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Sum(const data : PDouble; Const N : Longint) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Sum(const data : array of Extended) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Sum(const data : PExtended; Const N : Longint) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function SumInt(const data : PInt64;Const N : longint) : Int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function SumInt(const data : array of Int64) : Int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function SumInt(const data : PInteger; Const N : longint) : Int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function SumInt(const data : array of Integer) : Int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function SumOfSquares(const data : array of Single) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function SumOfSquares(const data : PSingle; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SumOfSquares(const data : array of double) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SumOfSquares(const data : PDouble; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SumOfSquares(const data : array of Extended) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SumOfSquares(const data : PExtended; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure SumsAndSquares(const data : array of Single; var sum,sumofsquares : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure SumsAndSquares(const data : PSingle; Const N : Integer; var sum,sumofsquares : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure SumsAndSquares(const data : array of Double; var sum,sumofsquares : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure SumsAndSquares(const data : PDouble; Const N : Integer; var sum,sumofsquares : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure SumsAndSquares(const data : array of Extended; var sum,sumofsquares : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure SumsAndSquares(const data : PExtended; Const N : Integer; var sum,sumofsquares : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function MinValue(const data : array of Single) : Single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function MinValue(const data : PSingle; Const N : Integer) : Single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function MinValue(const data : array of Double) : Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function MinValue(const data : PDouble; Const N : Integer) : Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function MinValue(const data : array of Extended) : Extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function MinValue(const data : PExtended; Const N : Integer) : Extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function MinValue(const data : array of integer) : Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function MinValue(const Data : PInteger; Const N : Integer): Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function MaxValue(const data : array of Single) : Single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function MaxValue(const data : PSingle; Const N : Integer) : Single; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function MaxValue(const data : array of Double) : Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function MaxValue(const data : PDouble; Const N : Integer) : Double; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function MaxValue(const data : array of Extended) : Extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function MaxValue(const data : PExtended; Const N : Integer) : Extended; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function MaxValue(const data : array of integer) : Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function MaxValue(const data : PInteger; Const N : Integer) : Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function RandG(mean,stddev : float) : float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function RandomRange(const aFrom, aTo: Integer): Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function RandomRange(const aFrom, aTo: Int64): Int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function StdDev(const data : array of Single) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function StdDev(const data : PSingle; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function StdDev(const data : array of Double) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function StdDev(const data : PDouble; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function StdDev(const data : array of Extended) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function StdDev(const data : PExtended; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure MeanAndStdDev(const data : array of Single; var mean,stddev : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure MeanAndStdDev(const data : PSingle; Const N : Longint;var mean,stddev : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure MeanAndStdDev(const data : array of Double; var mean,stddev : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure MeanAndStdDev(const data : PDouble; Const N : Longint;var mean,stddev : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure MeanAndStdDev(const data : array of Extended; var mean,stddev : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure MeanAndStdDev(const data : PExtended; Const N : Longint;var mean,stddev : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Variance(const data : array of Single) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Variance(const data : PSingle; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Variance(const data : array of Double) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Variance(const data : PDouble; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Variance(const data : array of Extended) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Variance(const data : PExtended; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function TotalVariance(const data : array of Single) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function TotalVariance(const data : PSingle; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function TotalVariance(const data : array of Double) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function TotalVariance(const data : PDouble; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function TotalVariance(const data : array of Extended) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function TotalVariance(const data : PExtended; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function PopnStdDev(const data : array of Single) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function PopnStdDev(const data : PSingle; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function PopnStdDev(const data : array of Double) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function PopnStdDev(const data : PDouble; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function PopnStdDev(const data : array of Extended) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function PopnStdDev(const data : PExtended; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function PopnVariance(const data : PSingle; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function PopnVariance(const data : array of Single) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function PopnVariance(const data : PDouble; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function PopnVariance(const data : array of Double) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function PopnVariance(const data : PExtended; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function PopnVariance(const data : array of Extended) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure MomentSkewKurtosis(const data : array of Single; out m1,m2,m3,m4,skew,kurtosis : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure MomentSkewKurtosis(const data : PSingle; Const N : Integer; out m1,m2,m3,m4,skew,kurtosis : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure MomentSkewKurtosis(const data : array of Double; out m1,m2,m3,m4,skew,kurtosis : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure MomentSkewKurtosis(const data : PDouble; Const N : Integer; out m1,m2,m3,m4,skew,kurtosis : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure MomentSkewKurtosis(const data : array of Extended; out m1,m2,m3,m4,skew,kurtosis : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure MomentSkewKurtosis(const data : PExtended; Const N : Integer; out m1,m2,m3,m4,skew,kurtosis : float); overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Norm(const data : array of Single) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Norm(const data : PSingle; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Norm(const data : array of double) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Norm(const data : PDouble; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Norm(const data : array of Extended) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Norm(const data : PExtended; Const N : Integer) : float; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function FutureValue(ARate: Float; NPeriods: Integer; APayment, APresentValue: Float; APaymentTime: TPaymentTime): Float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function InterestRate(NPeriods: Integer; APayment, APresentValue, AFutureValue: Float; APaymentTime: TPaymentTime): Float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function NumberOfPeriods(ARate, APayment, APresentValue, AFutureValue: Float; APaymentTime: TPaymentTime): Float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function Payment(ARate: Float; NPeriods: Integer; APresentValue, AFutureValue: Float; APaymentTime: TPaymentTime): Float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function PresentValue(ARate: Float; NPeriods: Integer; APayment, AFutureValue: Float; APaymentTime: TPaymentTime): Float; inline;
{$endif}
{$if (not defined(FPUNONE))}
function IfThen(val:boolean;const iftrue:integer; const iffalse:integer= 0) :integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function IfThen(val:boolean;const iftrue:int64 ; const iffalse:int64 = 0) :int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function IfThen(val:boolean;const iftrue:double ; const iffalse:double =0.0):double; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function CompareValue ( const A, B : Integer) : TValueRelationship; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function CompareValue ( const A, B : Int64) : TValueRelationship; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function CompareValue ( const A, B : QWord) : TValueRelationship; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function CompareValue ( const A, B : Single; delta : Single = 0.0 ) : TValueRelationship; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function CompareValue ( const A, B : Double; delta : Double = 0.0) : TValueRelationship; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function CompareValue ( const A, B : Extended; delta : Extended = 0.0 ) : TValueRelationship; overload; inline;
{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function RandomFrom(const AValues: array of Double): Double; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function RandomFrom(const AValues: array of Integer): Integer; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function RandomFrom(const AValues: array of Int64): Int64; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function GetRoundMode: TFPURoundingMode; inline;
{$endif}
{$if (not defined(FPUNONE))}
function SetRoundMode(const RoundMode: TFPURoundingMode): TFPURoundingMode; inline;
{$endif}
{$if (not defined(FPUNONE))}
function GetPrecisionMode: TFPUPrecisionMode; inline;
{$endif}
{$if (not defined(FPUNONE))}
function SetPrecisionMode(const Precision: TFPUPrecisionMode): TFPUPrecisionMode; inline;
{$endif}
{$if (not defined(FPUNONE))}
function GetExceptionMask: TFPUExceptionMask; inline;
{$endif}
{$if (not defined(FPUNONE))}
function SetExceptionMask(const Mask: TFPUExceptionMask): TFPUExceptionMask; inline;
{$endif}
{$if (not defined(FPUNONE))}
procedure ClearExceptions(RaisePending: Boolean =true); inline;
{$endif}

implementation

{$if (not defined(FPUNONE))}
function MinIntValue(const Data: array of Integer): Integer;
begin
  Result := Math.MinIntValue(Data);
end;

{$endif}
{$if (not defined(FPUNONE))}
function MaxIntValue(const Data: array of Integer): Integer;
begin
  Result := Math.MaxIntValue(Data);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Min(a, b: Integer): Integer;
begin
  Result := Math.Min(a, b);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Min(a, b: Cardinal): Cardinal;
begin
  Result := Math.Min(a, b);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Min(a, b: Int64): Int64;
begin
  Result := Math.Min(a, b);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Min(a, b: QWord): QWord;
begin
  Result := Math.Min(a, b);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Min(a, b: Single): Single;
begin
  Result := Math.Min(a, b);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Min(a, b: Double): Double;
begin
  Result := Math.Min(a, b);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Min(a, b: Extended): Extended;
begin
  Result := Math.Min(a, b);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Max(a, b: Integer): Integer;
begin
  Result := Math.Max(a, b);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Max(a, b: Cardinal): Cardinal;
begin
  Result := Math.Max(a, b);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Max(a, b: Int64): Int64;
begin
  Result := Math.Max(a, b);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Max(a, b: QWord): QWord;
begin
  Result := Math.Max(a, b);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Max(a, b: Single): Single;
begin
  Result := Math.Max(a, b);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Max(a, b: Double): Double;
begin
  Result := Math.Max(a, b);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Max(a, b: Extended): Extended;
begin
  Result := Math.Max(a, b);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function InRange(const AValue, AMin, AMax: Integer): Boolean;
begin
  Result := Math.InRange(AValue, AMin, AMax);
end;

{$endif}
{$if (not defined(FPUNONE))}
function InRange(const AValue, AMin, AMax: Int64): Boolean;
begin
  Result := Math.InRange(AValue, AMin, AMax);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function InRange(const AValue, AMin, AMax: Double): Boolean;
begin
  Result := Math.InRange(AValue, AMin, AMax);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function EnsureRange(const AValue, AMin, AMax: Integer): Integer;
begin
  Result := Math.EnsureRange(AValue, AMin, AMax);
end;

{$endif}
{$if (not defined(FPUNONE))}
function EnsureRange(const AValue, AMin, AMax: Int64): Int64;
begin
  Result := Math.EnsureRange(AValue, AMin, AMax);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function EnsureRange(const AValue, AMin, AMax: Double): Double;
begin
  Result := Math.EnsureRange(AValue, AMin, AMax);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
procedure DivMod(Dividend: LongInt; Divisor: Word; var Result, Remainder: Word);
begin
  Math.DivMod(Dividend, Divisor, Result, Remainder);
end;

{$endif}
{$if (not defined(FPUNONE))}
procedure DivMod(Dividend: LongInt; Divisor: Word; var Result, Remainder: SmallInt);
begin
  Math.DivMod(Dividend, Divisor, Result, Remainder);
end;

{$endif}
{$if (not defined(FPUNONE))}
procedure DivMod(Dividend: DWord; Divisor: DWord; var Result, Remainder: DWord);
begin
  Math.DivMod(Dividend, Divisor, Result, Remainder);
end;

{$endif}
{$if (not defined(FPUNONE))}
procedure DivMod(Dividend: LongInt; Divisor: LongInt; var Result, Remainder: LongInt);
begin
  Math.DivMod(Dividend, Divisor, Result, Remainder);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function FMod(const a, b: Single): Single;
begin
  Result := Math.FMod(a, b);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function FMod(const a, b: Double): Double;
begin
  Result := Math.FMod(a, b);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function FMod(const a, b: Extended): Extended;
begin
  Result := Math.FMod(a, b);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Sign(const AValue: Integer): TValueSign;
begin
  Result := Math.Sign(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Sign(const AValue: Int64): TValueSign;
begin
  Result := Math.Sign(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Sign(const AValue: Single): TValueSign;
begin
  Result := Math.Sign(AValue);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Sign(const AValue: Double): TValueSign;
begin
  Result := Math.Sign(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Sign(const AValue: Extended): TValueSign;
begin
  Result := Math.Sign(AValue);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function IsZero(const A: Single; Epsilon: Single): Boolean;
begin
  Result := Math.IsZero(A, Epsilon);
end;

{$endif}
{$if (not defined(FPUNONE))}
function IsZero(const A: Single): Boolean;
begin
  Result := Math.IsZero(A);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function IsZero(const A: Double; Epsilon: Double): Boolean;
begin
  Result := Math.IsZero(A, Epsilon);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function IsZero(const A: Double): Boolean;
begin
  Result := Math.IsZero(A);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function IsZero(const A: Extended; Epsilon: Extended): Boolean;
begin
  Result := Math.IsZero(A, Epsilon);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function IsZero(const A: Extended): Boolean;
begin
  Result := Math.IsZero(A);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function IsNan(const d : Single): Boolean;
begin
  Result := Math.IsNan(d);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function IsNan(const d : Double): Boolean;
begin
  Result := Math.IsNan(d);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function IsNan(const d : Extended): Boolean;
begin
  Result := Math.IsNan(d);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function IsInfinite(const d : Single): Boolean;
begin
  Result := Math.IsInfinite(d);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function IsInfinite(const d : Double): Boolean;
begin
  Result := Math.IsInfinite(d);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function IsInfinite(const d : Extended): Boolean;
begin
  Result := Math.IsInfinite(d);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SameValue(const A, B: Extended): Boolean;
begin
  Result := Math.SameValue(A, B);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SameValue(const A, B: Double): Boolean;
begin
  Result := Math.SameValue(A, B);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function SameValue(const A, B: Single): Boolean;
begin
  Result := Math.SameValue(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SameValue(const A, B: Extended; Epsilon: Extended): Boolean;
begin
  Result := Math.SameValue(A, B, Epsilon);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SameValue(const A, B: Double; Epsilon: Double): Boolean;
begin
  Result := Math.SameValue(A, B, Epsilon);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function SameValue(const A, B: Single; Epsilon: Single): Boolean;
begin
  Result := Math.SameValue(A, B, Epsilon);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function RoundTo(const AValue: Double; const Digits: TRoundToRange): Double;
begin
  Result := Math.RoundTo(AValue, Digits);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function RoundTo(const AVAlue: Extended; const Digits: TRoundToRange): Extended;
begin
  Result := Math.RoundTo(AVAlue, Digits);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function RoundTo(const AValue: Single; const Digits: TRoundToRange): Single;
begin
  Result := Math.RoundTo(AValue, Digits);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function SimpleRoundTo(const AValue: Single; const Digits: TRoundToRange = -2): Single;
begin
  Result := Math.SimpleRoundTo(AValue, Digits);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SimpleRoundTo(const AValue: Double; const Digits: TRoundToRange = -2): Double;
begin
  Result := Math.SimpleRoundTo(AValue, Digits);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SimpleRoundTo(const AValue: Extended; const Digits: TRoundToRange = -2): Extended;
begin
  Result := Math.SimpleRoundTo(AValue, Digits);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function DegToRad(deg : float) : float;
begin
  Result := Math.DegToRad(deg);
end;

{$endif}
{$if (not defined(FPUNONE))}
function RadToDeg(rad : float) : float;
begin
  Result := Math.RadToDeg(rad);
end;

{$endif}
{$if (not defined(FPUNONE))}
function GradToRad(grad : float) : float;
begin
  Result := Math.GradToRad(grad);
end;

{$endif}
{$if (not defined(FPUNONE))}
function RadToGrad(rad : float) : float;
begin
  Result := Math.RadToGrad(rad);
end;

{$endif}
{$if (not defined(FPUNONE))}
function DegToGrad(deg : float) : float;
begin
  Result := Math.DegToGrad(deg);
end;

{$endif}
{$if (not defined(FPUNONE))}
function GradToDeg(grad : float) : float;
begin
  Result := Math.GradToDeg(grad);
end;

{$endif}
{$if (not defined(FPUNONE))}
function CycleToRad(cycle : float) : float;
begin
  Result := Math.CycleToRad(cycle);
end;

{$endif}
{$if (not defined(FPUNONE))}
function RadToCycle(rad : float) : float;
begin
  Result := Math.RadToCycle(rad);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
Function DegNormalize(deg : single) : single;
begin
  Result := Math.DegNormalize(deg);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
Function DegNormalize(deg : double) : double;
begin
  Result := Math.DegNormalize(deg);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
Function DegNormalize(deg : extended) : extended;
begin
  Result := Math.DegNormalize(deg);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Tan(x : float) : float;
begin
  Result := Math.Tan(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Cotan(x : float) : float;
begin
  Result := Math.Cotan(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Cot(x : float) : float;
begin
  Result := Math.Cot(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure SinCos(theta : single;out sinus,cosinus : single);
begin
  Math.SinCos(theta, sinus, cosinus);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure SinCos(theta : double;out sinus,cosinus : double);
begin
  Math.SinCos(theta, sinus, cosinus);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure SinCos(theta : extended;out sinus,cosinus : extended);
begin
  Math.SinCos(theta, sinus, cosinus);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Secant(x : float) : float;
begin
  Result := Math.Secant(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Cosecant(x : float) : float;
begin
  Result := Math.Cosecant(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Sec(x : float) : float;
begin
  Result := Math.Sec(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Csc(x : float) : float;
begin
  Result := Math.Csc(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ArcCos(x : float) : float;
begin
  Result := Math.ArcCos(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ArcSin(x : float) : float;
begin
  Result := Math.ArcSin(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ArcTan2(y,x : float) : float;
begin
  Result := Math.ArcTan2(y, x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function CosH(x : float) : float;
begin
  Result := Math.CosH(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function SinH(x : float) : float;
begin
  Result := Math.SinH(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function TanH(x : float) : float;
begin
  Result := Math.TanH(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ArcCosH(x : float) : float;
begin
  Result := Math.ArcCosH(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ArcSinH(x : float) : float;
begin
  Result := Math.ArcSinH(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ArcTanH(x : float) : float;
begin
  Result := Math.ArcTanH(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ArCosH(x : float) : float;
begin
  Result := Math.ArCosH(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ArSinH(x : float) : float;
begin
  Result := Math.ArSinH(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ArTanH(x : float) : float;
begin
  Result := Math.ArTanH(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Hypot(x,y : float) : float;
begin
  Result := Math.Hypot(x, y);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Log10(x : float) : float;
begin
  Result := Math.Log10(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Log2(x : float) : float;
begin
  Result := Math.Log2(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function LogN(n,x : float) : float;
begin
  Result := Math.LogN(n, x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function LnXP1(x : float) : float;
begin
  Result := Math.LnXP1(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Power(base,exponent : float) : float;
begin
  Result := Math.Power(base, exponent);
end;

{$endif}
{$if (not defined(FPUNONE))}
function IntPower(base : float;const exponent : Integer) : float;
begin
  Result := Math.IntPower(base, exponent);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Ceil(x : float) : Integer;
begin
  Result := Math.Ceil(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Ceil64(x: float): Int64;
begin
  Result := Math.Ceil64(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Floor(x : float) : Integer;
begin
  Result := Math.Floor(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Floor64(x: float): Int64;
begin
  Result := Math.Floor64(x);
end;

{$endif}
{$if (not defined(FPUNONE))}
procedure Frexp(X: float; var Mantissa: float; var Exponent: integer);
begin
  Math.Frexp(X, Mantissa, Exponent);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Ldexp(x : float; const p : Integer) : float;
begin
  Result := Math.Ldexp(x, p);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Mean(const data : array of Single) : float;
begin
  Result := Math.Mean(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Mean(const data : PSingle; Const N : longint) : float;
begin
  Result := Math.Mean(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Mean(const data : array of double) : float;
begin
  Result := Math.Mean(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Mean(const data : PDouble; Const N : longint) : float;
begin
  Result := Math.Mean(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Mean(const data : array of Extended) : float;
begin
  Result := Math.Mean(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Mean(const data : PExtended; Const N : longint) : float;
begin
  Result := Math.Mean(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function Mean(const data : PInt64; const N : Longint):Float;
begin
  Result := Math.Mean(data, N);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Mean(const data: array of Int64):Float;
begin
  Result := Math.Mean(data);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Mean(const data : PInteger; const N : Longint):Float;
begin
  Result := Math.Mean(data, N);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Mean(const data: array of Integer):Float;
begin
  Result := Math.Mean(data);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Sum(const data : array of Single) : float;
begin
  Result := Math.Sum(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Sum(const data : PSingle; Const N : Longint) : float;
begin
  Result := Math.Sum(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Sum(const data : array of double) : float;
begin
  Result := Math.Sum(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Sum(const data : PDouble; Const N : Longint) : float;
begin
  Result := Math.Sum(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Sum(const data : array of Extended) : float;
begin
  Result := Math.Sum(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Sum(const data : PExtended; Const N : Longint) : float;
begin
  Result := Math.Sum(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function SumInt(const data : PInt64;Const N : longint) : Int64;
begin
  Result := Math.SumInt(data, N);
end;

{$endif}
{$if (not defined(FPUNONE))}
function SumInt(const data : array of Int64) : Int64;
begin
  Result := Math.SumInt(data);
end;

{$endif}
{$if (not defined(FPUNONE))}
function SumInt(const data : PInteger; Const N : longint) : Int64;
begin
  Result := Math.SumInt(data, N);
end;

{$endif}
{$if (not defined(FPUNONE))}
function SumInt(const data : array of Integer) : Int64;
begin
  Result := Math.SumInt(data);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function SumOfSquares(const data : array of Single) : float;
begin
  Result := Math.SumOfSquares(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function SumOfSquares(const data : PSingle; Const N : Integer) : float;
begin
  Result := Math.SumOfSquares(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SumOfSquares(const data : array of double) : float;
begin
  Result := Math.SumOfSquares(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function SumOfSquares(const data : PDouble; Const N : Integer) : float;
begin
  Result := Math.SumOfSquares(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SumOfSquares(const data : array of Extended) : float;
begin
  Result := Math.SumOfSquares(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function SumOfSquares(const data : PExtended; Const N : Integer) : float;
begin
  Result := Math.SumOfSquares(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure SumsAndSquares(const data : array of Single; var sum,sumofsquares : float);
begin
  Math.SumsAndSquares(data, sum, sumofsquares);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure SumsAndSquares(const data : PSingle; Const N : Integer; var sum,sumofsquares : float);
begin
  Math.SumsAndSquares(data, N, sum, sumofsquares);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure SumsAndSquares(const data : array of Double; var sum,sumofsquares : float);
begin
  Math.SumsAndSquares(data, sum, sumofsquares);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure SumsAndSquares(const data : PDouble; Const N : Integer; var sum,sumofsquares : float);
begin
  Math.SumsAndSquares(data, N, sum, sumofsquares);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure SumsAndSquares(const data : array of Extended; var sum,sumofsquares : float);
begin
  Math.SumsAndSquares(data, sum, sumofsquares);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure SumsAndSquares(const data : PExtended; Const N : Integer; var sum,sumofsquares : float);
begin
  Math.SumsAndSquares(data, N, sum, sumofsquares);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function MinValue(const data : array of Single) : Single;
begin
  Result := Math.MinValue(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function MinValue(const data : PSingle; Const N : Integer) : Single;
begin
  Result := Math.MinValue(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function MinValue(const data : array of Double) : Double;
begin
  Result := Math.MinValue(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function MinValue(const data : PDouble; Const N : Integer) : Double;
begin
  Result := Math.MinValue(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function MinValue(const data : array of Extended) : Extended;
begin
  Result := Math.MinValue(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function MinValue(const data : PExtended; Const N : Integer) : Extended;
begin
  Result := Math.MinValue(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function MinValue(const data : array of integer) : Integer;
begin
  Result := Math.MinValue(data);
end;

{$endif}
{$if (not defined(FPUNONE))}
function MinValue(const Data : PInteger; Const N : Integer): Integer;
begin
  Result := Math.MinValue(Data, N);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function MaxValue(const data : array of Single) : Single;
begin
  Result := Math.MaxValue(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function MaxValue(const data : PSingle; Const N : Integer) : Single;
begin
  Result := Math.MaxValue(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function MaxValue(const data : array of Double) : Double;
begin
  Result := Math.MaxValue(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function MaxValue(const data : PDouble; Const N : Integer) : Double;
begin
  Result := Math.MaxValue(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function MaxValue(const data : array of Extended) : Extended;
begin
  Result := Math.MaxValue(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function MaxValue(const data : PExtended; Const N : Integer) : Extended;
begin
  Result := Math.MaxValue(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function MaxValue(const data : array of integer) : Integer;
begin
  Result := Math.MaxValue(data);
end;

{$endif}
{$if (not defined(FPUNONE))}
function MaxValue(const data : PInteger; Const N : Integer) : Integer;
begin
  Result := Math.MaxValue(data, N);
end;

{$endif}
{$if (not defined(FPUNONE))}
function RandG(mean,stddev : float) : float;
begin
  Result := Math.RandG(mean, stddev);
end;

{$endif}
{$if (not defined(FPUNONE))}
function RandomRange(const aFrom, aTo: Integer): Integer;
begin
  Result := Math.RandomRange(aFrom, aTo);
end;

{$endif}
{$if (not defined(FPUNONE))}
function RandomRange(const aFrom, aTo: Int64): Int64;
begin
  Result := Math.RandomRange(aFrom, aTo);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function StdDev(const data : array of Single) : float;
begin
  Result := Math.StdDev(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function StdDev(const data : PSingle; Const N : Integer) : float;
begin
  Result := Math.StdDev(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function StdDev(const data : array of Double) : float;
begin
  Result := Math.StdDev(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function StdDev(const data : PDouble; Const N : Integer) : float;
begin
  Result := Math.StdDev(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function StdDev(const data : array of Extended) : float;
begin
  Result := Math.StdDev(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function StdDev(const data : PExtended; Const N : Integer) : float;
begin
  Result := Math.StdDev(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure MeanAndStdDev(const data : array of Single; var mean,stddev : float);
begin
  Math.MeanAndStdDev(data, mean, stddev);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure MeanAndStdDev(const data : PSingle; Const N : Longint;var mean,stddev : float);
begin
  Math.MeanAndStdDev(data, N, mean, stddev);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure MeanAndStdDev(const data : array of Double; var mean,stddev : float);
begin
  Math.MeanAndStdDev(data, mean, stddev);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure MeanAndStdDev(const data : PDouble; Const N : Longint;var mean,stddev : float);
begin
  Math.MeanAndStdDev(data, N, mean, stddev);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure MeanAndStdDev(const data : array of Extended; var mean,stddev : float);
begin
  Math.MeanAndStdDev(data, mean, stddev);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure MeanAndStdDev(const data : PExtended; Const N : Longint;var mean,stddev : float);
begin
  Math.MeanAndStdDev(data, N, mean, stddev);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Variance(const data : array of Single) : float;
begin
  Result := Math.Variance(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Variance(const data : PSingle; Const N : Integer) : float;
begin
  Result := Math.Variance(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Variance(const data : array of Double) : float;
begin
  Result := Math.Variance(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Variance(const data : PDouble; Const N : Integer) : float;
begin
  Result := Math.Variance(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Variance(const data : array of Extended) : float;
begin
  Result := Math.Variance(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Variance(const data : PExtended; Const N : Integer) : float;
begin
  Result := Math.Variance(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function TotalVariance(const data : array of Single) : float;
begin
  Result := Math.TotalVariance(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function TotalVariance(const data : PSingle; Const N : Integer) : float;
begin
  Result := Math.TotalVariance(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function TotalVariance(const data : array of Double) : float;
begin
  Result := Math.TotalVariance(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function TotalVariance(const data : PDouble; Const N : Integer) : float;
begin
  Result := Math.TotalVariance(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function TotalVariance(const data : array of Extended) : float;
begin
  Result := Math.TotalVariance(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function TotalVariance(const data : PExtended; Const N : Integer) : float;
begin
  Result := Math.TotalVariance(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function PopnStdDev(const data : array of Single) : float;
begin
  Result := Math.PopnStdDev(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function PopnStdDev(const data : PSingle; Const N : Integer) : float;
begin
  Result := Math.PopnStdDev(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function PopnStdDev(const data : array of Double) : float;
begin
  Result := Math.PopnStdDev(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function PopnStdDev(const data : PDouble; Const N : Integer) : float;
begin
  Result := Math.PopnStdDev(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function PopnStdDev(const data : array of Extended) : float;
begin
  Result := Math.PopnStdDev(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function PopnStdDev(const data : PExtended; Const N : Integer) : float;
begin
  Result := Math.PopnStdDev(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function PopnVariance(const data : PSingle; Const N : Integer) : float;
begin
  Result := Math.PopnVariance(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function PopnVariance(const data : array of Single) : float;
begin
  Result := Math.PopnVariance(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function PopnVariance(const data : PDouble; Const N : Integer) : float;
begin
  Result := Math.PopnVariance(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function PopnVariance(const data : array of Double) : float;
begin
  Result := Math.PopnVariance(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function PopnVariance(const data : PExtended; Const N : Integer) : float;
begin
  Result := Math.PopnVariance(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function PopnVariance(const data : array of Extended) : float;
begin
  Result := Math.PopnVariance(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure MomentSkewKurtosis(const data : array of Single; out m1,m2,m3,m4,skew,kurtosis : float);
begin
  Math.MomentSkewKurtosis(data, m1, m2, m3, m4, skew, kurtosis);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
procedure MomentSkewKurtosis(const data : PSingle; Const N : Integer; out m1,m2,m3,m4,skew,kurtosis : float);
begin
  Math.MomentSkewKurtosis(data, N, m1, m2, m3, m4, skew, kurtosis);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure MomentSkewKurtosis(const data : array of Double; out m1,m2,m3,m4,skew,kurtosis : float);
begin
  Math.MomentSkewKurtosis(data, m1, m2, m3, m4, skew, kurtosis);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
procedure MomentSkewKurtosis(const data : PDouble; Const N : Integer; out m1,m2,m3,m4,skew,kurtosis : float);
begin
  Math.MomentSkewKurtosis(data, N, m1, m2, m3, m4, skew, kurtosis);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure MomentSkewKurtosis(const data : array of Extended; out m1,m2,m3,m4,skew,kurtosis : float);
begin
  Math.MomentSkewKurtosis(data, m1, m2, m3, m4, skew, kurtosis);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
procedure MomentSkewKurtosis(const data : PExtended; Const N : Integer; out m1,m2,m3,m4,skew,kurtosis : float);
begin
  Math.MomentSkewKurtosis(data, N, m1, m2, m3, m4, skew, kurtosis);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Norm(const data : array of Single) : float;
begin
  Result := Math.Norm(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function Norm(const data : PSingle; Const N : Integer) : float;
begin
  Result := Math.Norm(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Norm(const data : array of double) : float;
begin
  Result := Math.Norm(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function Norm(const data : PDouble; Const N : Integer) : float;
begin
  Result := Math.Norm(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Norm(const data : array of Extended) : float;
begin
  Result := Math.Norm(data);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function Norm(const data : PExtended; Const N : Integer) : float;
begin
  Result := Math.Norm(data, N);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function FutureValue(ARate: Float; NPeriods: Integer; APayment, APresentValue: Float; APaymentTime: TPaymentTime): Float;
begin
  Result := Math.FutureValue(ARate, NPeriods, APayment, APresentValue, APaymentTime);
end;

{$endif}
{$if (not defined(FPUNONE))}
function InterestRate(NPeriods: Integer; APayment, APresentValue, AFutureValue: Float; APaymentTime: TPaymentTime): Float;
begin
  Result := Math.InterestRate(NPeriods, APayment, APresentValue, AFutureValue, APaymentTime);
end;

{$endif}
{$if (not defined(FPUNONE))}
function NumberOfPeriods(ARate, APayment, APresentValue, AFutureValue: Float; APaymentTime: TPaymentTime): Float;
begin
  Result := Math.NumberOfPeriods(ARate, APayment, APresentValue, AFutureValue, APaymentTime);
end;

{$endif}
{$if (not defined(FPUNONE))}
function Payment(ARate: Float; NPeriods: Integer; APresentValue, AFutureValue: Float; APaymentTime: TPaymentTime): Float;
begin
  Result := Math.Payment(ARate, NPeriods, APresentValue, AFutureValue, APaymentTime);
end;

{$endif}
{$if (not defined(FPUNONE))}
function PresentValue(ARate: Float; NPeriods: Integer; APayment, AFutureValue: Float; APaymentTime: TPaymentTime): Float;
begin
  Result := Math.PresentValue(ARate, NPeriods, APayment, AFutureValue, APaymentTime);
end;

{$endif}
{$if (not defined(FPUNONE))}
function IfThen(val:boolean;const iftrue:integer; const iffalse:integer= 0) :integer;
begin
  Result := Math.IfThen(val, iftrue, iffalse);
end;

{$endif}
{$if (not defined(FPUNONE))}
function IfThen(val:boolean;const iftrue:int64 ; const iffalse:int64 = 0) :int64;
begin
  Result := Math.IfThen(val, iftrue, iffalse);
end;

{$endif}
{$if (not defined(FPUNONE))}
function IfThen(val:boolean;const iftrue:double ; const iffalse:double =0.0):double;
begin
  Result := Math.IfThen(val, iftrue, iffalse);
end;

{$endif}
{$if (not defined(FPUNONE))}
function CompareValue ( const A, B : Integer) : TValueRelationship;
begin
  Result := Math.CompareValue(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
function CompareValue ( const A, B : Int64) : TValueRelationship;
begin
  Result := Math.CompareValue(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
function CompareValue ( const A, B : QWord) : TValueRelationship;
begin
  Result := Math.CompareValue(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_SINGLE))}
function CompareValue ( const A, B : Single; delta : Single = 0.0 ) : TValueRelationship;
begin
  Result := Math.CompareValue(A, B, delta);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_DOUBLE))}
function CompareValue ( const A, B : Double; delta : Double = 0.0) : TValueRelationship;
begin
  Result := Math.CompareValue(A, B, delta);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
{$if (defined(FPC_HAS_TYPE_EXTENDED))}
function CompareValue ( const A, B : Extended; delta : Extended = 0.0 ) : TValueRelationship;
begin
  Result := Math.CompareValue(A, B, delta);
end;

{$endif}
{$endif}
{$if (not defined(FPUNONE))}
function RandomFrom(const AValues: array of Double): Double;
begin
  Result := Math.RandomFrom(AValues);
end;

{$endif}
{$if (not defined(FPUNONE))}
function RandomFrom(const AValues: array of Integer): Integer;
begin
  Result := Math.RandomFrom(AValues);
end;

{$endif}
{$if (not defined(FPUNONE))}
function RandomFrom(const AValues: array of Int64): Int64;
begin
  Result := Math.RandomFrom(AValues);
end;

{$endif}
{$if (not defined(FPUNONE))}
function GetRoundMode: TFPURoundingMode;
begin
  Result := Math.GetRoundMode;
end;

{$endif}
{$if (not defined(FPUNONE))}
function SetRoundMode(const RoundMode: TFPURoundingMode): TFPURoundingMode;
begin
  Result := Math.SetRoundMode(RoundMode);
end;

{$endif}
{$if (not defined(FPUNONE))}
function GetPrecisionMode: TFPUPrecisionMode;
begin
  Result := Math.GetPrecisionMode;
end;

{$endif}
{$if (not defined(FPUNONE))}
function SetPrecisionMode(const Precision: TFPUPrecisionMode): TFPUPrecisionMode;
begin
  Result := Math.SetPrecisionMode(Precision);
end;

{$endif}
{$if (not defined(FPUNONE))}
function GetExceptionMask: TFPUExceptionMask;
begin
  Result := Math.GetExceptionMask;
end;

{$endif}
{$if (not defined(FPUNONE))}
function SetExceptionMask(const Mask: TFPUExceptionMask): TFPUExceptionMask;
begin
  Result := Math.SetExceptionMask(Mask);
end;

{$endif}
{$if (not defined(FPUNONE))}
procedure ClearExceptions(RaisePending: Boolean =true);
begin
  Math.ClearExceptions(RaisePending);
end;

{$endif}
end.
