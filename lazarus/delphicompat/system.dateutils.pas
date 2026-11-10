{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.DateUtils
  Gerado por tools/genvclcompat.py a partir de DateUtils.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.DateUtils;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  sysutils, Math, DateUtils;
const
{$if (not defined(FPUNONE))}
  DaysPerWeek = DateUtils.DaysPerWeek;
{$endif}
{$if (not defined(FPUNONE))}
  WeeksPerFortnight = DateUtils.WeeksPerFortnight;
{$endif}
{$if (not defined(FPUNONE))}
  MonthsPerYear = DateUtils.MonthsPerYear;
{$endif}
{$if (not defined(FPUNONE))}
  YearsPerDecade = DateUtils.YearsPerDecade;
{$endif}
{$if (not defined(FPUNONE))}
  YearsPerCentury = DateUtils.YearsPerCentury;
{$endif}
{$if (not defined(FPUNONE))}
  YearsPerMillennium = DateUtils.YearsPerMillennium;
{$endif}
{$if (not defined(FPUNONE))}
  DayMonday = DateUtils.DayMonday;
{$endif}
{$if (not defined(FPUNONE))}
  DayTuesday = DateUtils.DayTuesday;
{$endif}
{$if (not defined(FPUNONE))}
  DayWednesday = DateUtils.DayWednesday;
{$endif}
{$if (not defined(FPUNONE))}
  DayThursday = DateUtils.DayThursday;
{$endif}
{$if (not defined(FPUNONE))}
  DayFriday = DateUtils.DayFriday;
{$endif}
{$if (not defined(FPUNONE))}
  DaySaturday = DateUtils.DaySaturday;
{$endif}
{$if (not defined(FPUNONE))}
  DaySunday = DateUtils.DaySunday;
{$endif}
{$if (not defined(FPUNONE))}
  MonthJanuary = DateUtils.MonthJanuary;
{$endif}
{$if (not defined(FPUNONE))}
  MonthFebruary = DateUtils.MonthFebruary;
{$endif}
{$if (not defined(FPUNONE))}
  MonthMarch = DateUtils.MonthMarch;
{$endif}
{$if (not defined(FPUNONE))}
  MonthApril = DateUtils.MonthApril;
{$endif}
{$if (not defined(FPUNONE))}
  MonthMay = DateUtils.MonthMay;
{$endif}
{$if (not defined(FPUNONE))}
  MonthJune = DateUtils.MonthJune;
{$endif}
{$if (not defined(FPUNONE))}
  MonthJuly = DateUtils.MonthJuly;
{$endif}
{$if (not defined(FPUNONE))}
  MonthAugust = DateUtils.MonthAugust;
{$endif}
{$if (not defined(FPUNONE))}
  MonthSeptember = DateUtils.MonthSeptember;
{$endif}
{$if (not defined(FPUNONE))}
  MonthOctober = DateUtils.MonthOctober;
{$endif}
{$if (not defined(FPUNONE))}
  MonthNovember = DateUtils.MonthNovember;
{$endif}
{$if (not defined(FPUNONE))}
  MonthDecember = DateUtils.MonthDecember;
{$endif}
{$if (not defined(FPUNONE))}
  OneHour = DateUtils.OneHour;
{$endif}
{$if (not defined(FPUNONE))}
  OneMinute = DateUtils.OneMinute;
{$endif}
{$if (not defined(FPUNONE))}
  OneSecond = DateUtils.OneSecond;
{$endif}
{$if (not defined(FPUNONE))}
  OneMillisecond = DateUtils.OneMillisecond;
{$endif}
{$if (not defined(FPUNONE))}
  RecodeLeaveFieldAsIs = DateUtils.RecodeLeaveFieldAsIs;
{$endif}
var
{$if (not defined(FPUNONE))}
  ApproxDaysPerMonth: Double absolute DateUtils.ApproxDaysPerMonth;
{$endif}
{$if (not defined(FPUNONE))}
  ApproxDaysPerYear: Double absolute DateUtils.ApproxDaysPerYear;
{$endif}
{$if (not defined(FPUNONE))}
Function DateOf(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TimeOf(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsInLeapYear(const AValue: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsPM(const AValue: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDate(const AYear, AMonth, ADay: Word): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsValidTime(const AHour, AMinute, ASecond, AMilliSecond: Word): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDateDay(const AYear, ADayOfYear: Word): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDateWeek(const AYear, AWeekOfYear, ADayOfWeek: Word): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDateMonthWeek(const AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WeeksInYear(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WeeksInAYear(const AYear: Word): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DaysInYear(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DaysInAYear(const AYear: Word): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DaysInMonth(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DaysInAMonth(const AYear, AMonth: Word): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function Today: TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function Yesterday: TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function Tomorrow: TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsToday(const AValue: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IsSameDay(const AValue, ABasis: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
function IsSameMonth(const Avalue, ABasis: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function PreviousDayOfWeek (DayOfWeek : Word) : Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function YearOf(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MonthOf(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WeekOf(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DayOf(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function HourOf(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOf(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SecondOf(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOf(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfTheYear(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfTheYear(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfAYear(const AYear: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfAYear(const AYear: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfTheMonth(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfTheMonth(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfAMonth(const AYear, AMonth: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfAMonth(const AYear, AMonth: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfTheWeek(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfTheWeek(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfAWeek(const AYear, AWeekOfYear: Word; const ADayOfWeek: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfAWeek(const AYear, AWeekOfYear: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfAWeek(const AYear, AWeekOfYear: Word; const ADayOfWeek: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfAWeek(const AYear, AWeekOfYear: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfTheDay(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfTheDay(const AValue: TDateTime): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfADay(const AYear, AMonth, ADay: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function StartOfADay(const AYear, ADayOfYear: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfADay(const AYear, AMonth, ADay: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EndOfADay(const AYear, ADayOfYear: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MonthOfTheYear(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WeekOfTheYear(const AValue: TDateTime): Word; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WeekOfTheYear(const AValue: TDateTime; out AYear: Word): Word; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DayOfTheYear(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function HourOfTheYear(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheYear(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheYear(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheYear(const AValue: TDateTime): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WeekOfTheMonth(const AValue: TDateTime): Word; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WeekOfTheMonth(const AValue: TDateTime; out AYear, AMonth: Word): Word; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DayOfTheMonth(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function HourOfTheMonth(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheMonth(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheMonth(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheMonth(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DayOfTheWeek(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function HourOfTheWeek(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheWeek(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheWeek(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheWeek(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function HourOfTheDay(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheDay(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheDay(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheDay(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheHour(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheHour(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheHour(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheMinute(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheMinute(const AValue: TDateTime): LongWord; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheSecond(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastYears(const ANow, AThen: TDateTime; const AYears: Integer): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastMonths(const ANow, AThen: TDateTime; const AMonths: Integer): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastWeeks(const ANow, AThen: TDateTime; const AWeeks: Integer): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastDays(const ANow, AThen: TDateTime; const ADays: Integer): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastHours(const ANow, AThen: TDateTime; const AHours: Int64): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastMinutes(const ANow, AThen: TDateTime; const AMinutes: Int64): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastSeconds(const ANow, AThen: TDateTime; const ASeconds: Int64): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastMilliSeconds(const ANow, AThen: TDateTime; const AMilliSeconds: Int64): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function YearsBetween(const ANow, AThen: TDateTime; AExact : Boolean = False): Integer; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MonthsBetween(const ANow, AThen: TDateTime; AExact : Boolean = False): Integer; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WeeksBetween(const ANow, AThen: TDateTime): Integer; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DaysBetween(const ANow, AThen: TDateTime): Integer; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function HoursBetween(const ANow, AThen: TDateTime): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MinutesBetween(const ANow, AThen: TDateTime): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SecondsBetween(const ANow, AThen: TDateTime): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondsBetween(const ANow, AThen: TDateTime): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure PeriodBetween(const ANow, AThen: TDateTime; Out Years, months, days : Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Function YearSpan(const ANow, AThen: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MonthSpan(const ANow, AThen: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function WeekSpan(const ANow, AThen: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DaySpan(const ANow, AThen: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function HourSpan(const ANow, AThen: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MinuteSpan(const ANow, AThen: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SecondSpan(const ANow, AThen: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondSpan(const ANow, AThen: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncYear(const AValue: TDateTime; const ANumberOfYears: Integer ): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncYear(const AValue: TDateTime): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncWeek(const AValue: TDateTime; const ANumberOfWeeks: Integer): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncWeek(const AValue: TDateTime): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncDay(const AValue: TDateTime; const ANumberOfDays: Integer): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncDay(const AValue: TDateTime): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncHour(const AValue: TDateTime; const ANumberOfHours: Int64): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncHour(const AValue: TDateTime): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncMinute(const AValue: TDateTime; const ANumberOfMinutes: Int64): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncMinute(const AValue: TDateTime): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncSecond(const AValue: TDateTime; const ANumberOfSeconds: Int64): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncSecond(const AValue: TDateTime): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncMilliSecond(const AValue: TDateTime; const ANumberOfMilliSeconds: Int64): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function IncMilliSecond(const AValue: TDateTime): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDateTime(const AValue: TDateTime; out AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word; out AValue: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateWeek(const AYear, AWeekOfYear: Word; const ADayOfWeek: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateWeek(const AYear, AWeekOfYear: Word): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDateWeek(const AValue: TDateTime; out AYear, AWeekOfYear, ADayOfWeek: Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateWeek(const AYear, AWeekOfYear: Word; out AValue: TDateTime; const ADayOfWeek: Word): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateWeek(const AYear, AWeekOfYear: Word; out AValue: TDateTime): Boolean; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateDay(const AYear, ADayOfYear: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDateDay(const AValue: TDateTime; out AYear, ADayOfYear: Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateDay(const AYear, ADayOfYear: Word; out AValue: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateMonthWeek(const AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDateMonthWeek(const AValue: TDateTime; out AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateMonthWeek(const AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word; out AValue: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
function TryEncodeTimeInterval(Hour, Min, Sec, MSec:word; Out Time : TDateTime) : boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
function EncodeTimeInterval(Hour, Minute, Second, MilliSecond:word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeYear(const AValue: TDateTime; const AYear: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeMonth(const AValue: TDateTime; const AMonth: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeDay(const AValue: TDateTime; const ADay: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeHour(const AValue: TDateTime; const AHour: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeMinute(const AValue: TDateTime; const AMinute: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeSecond(const AValue: TDateTime; const ASecond: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeMilliSecond(const AValue: TDateTime; const AMilliSecond: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeDate(const AValue: TDateTime; const AYear, AMonth, ADay: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeTime(const AValue: TDateTime; const AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function RecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryRecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word; out AResult: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function CompareDateTime(const A, B: TDateTime): TValueRelationship; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function CompareDate(const A, B: TDateTime): TValueRelationship; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function CompareTime(const A, B: TDateTime): TValueRelationship; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SameDateTime(const A, B: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SameDate(const A, B: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function SameTime(const A, B: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
function DateTimeInRange(ADateTime: TDateTime; AStartDateTime, AEndDateTime: TDateTime; aInclusive: Boolean = True): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
function TimeInRange(ATime: TTime; AStartTime, AEndTime: TTime; AInclusive: Boolean = True): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
function DateInRange(ADate: TDate; AStartDate, AEndDate: TDate; AInclusive: Boolean = True): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function NthDayOfWeek(const AValue: TDateTime): Word; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDayOfWeekInMonth(const AValue: TDateTime; out AYear, AMonth, ANthDayOfWeek, ADayOfWeek: Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDayOfWeekInMonth(const AYear, AMonth, ANthDayOfWeek, ADayOfWeek: Word): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDayOfWeekInMonth(const AYear, AMonth, ANthDayOfWeek, ADayOfWeek: Word; out AValue: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateTimeError(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word; const ABaseDate: TDateTime); overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateTimeError(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word); overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateWeekError(const AYear, AWeekOfYear, ADayOfWeek: Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateDayError(const AYear, ADayOfYear: Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateMonthWeekError(const AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDayOfWeekInMonthError(const AYear, AMonth, ANthDayOfWeek, ADayOfWeek: Word); inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToJulianDate(const AValue: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function JulianDateToDateTime(const AValue: Double): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryJulianDateToDateTime(const AValue: Double; out ADateTime: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToModifiedJulianDate(const AValue: TDateTime): Double; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function ModifiedJulianDateToDateTime(const AValue: Double): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryModifiedJulianDateToDateTime(const AValue: Double; out ADateTime: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToUnix(const AValue: TDateTime; AInputIsUTC: Boolean = True): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function UnixToDateTime(const AValue: Int64; aReturnUTC : Boolean = true): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function UnixTimeStampToMac(const AValue: Int64): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToMac(const AValue: TDateTime): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MacToDateTime(const AValue: Int64): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function MacTimeStampToUnix(const AValue: Int64): Int64; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToDosDateTime(const AValue: TDateTime): longint; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function DosDateTimeToDateTime( AValue: longint): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function UniversalTimeToLocal(UT: TDateTime): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function UniversalTimeToLocal(UT: TDateTime; TZOffset : Integer): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function LocalTimeToUniversal(LT: TDateTime): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function LocalTimeToUniversal(LT: TDateTime; TZOffset: Integer): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ScanDateTime(const Pattern:string;const s:string;const fmt:TFormatSettings;startpos:integer=1) : tdatetime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function ScanDateTime(const Pattern:string;const s:string;startpos:integer=1) : tdatetime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
function TryISOStrToDate(const aString: string; out outDate: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
function TryISOStrToTime(const aString: string; Out outTime: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
function TryISOStrToDateTime(const aString: string; out outDateTime: TDateTime): Boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryISOTZStrToTZOffset(const TZ : String; Out TZOffset : Integer) : boolean; inline;
{$endif}
{$if (not defined(FPUNONE))}
function DateToISO8601(const ADate: TDateTime; AInputIsUTC: Boolean = True): string; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function ISO8601ToDate(const DateString: string; ReturnUTC : Boolean = True): TDateTime; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function ISO8601ToDateDef(const DateString: string; ReturnUTC : Boolean; aDefault : TDateTime ): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function ISO8601ToDateDef(const DateString: string; aDefault : TDateTime; ReturnUTC : Boolean = True ): TDateTime; overload; inline;
{$endif}
{$if (not defined(FPUNONE))}
Function TryISO8601ToDate(const DateString: string; out ADateTime: TDateTime; ReturnUTC : Boolean = True) : Boolean; inline;
{$endif}

implementation

{$if (not defined(FPUNONE))}
Function DateOf(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.DateOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TimeOf(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.TimeOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsInLeapYear(const AValue: TDateTime): Boolean;
begin
  Result := DateUtils.IsInLeapYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsPM(const AValue: TDateTime): Boolean;
begin
  Result := DateUtils.IsPM(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDate(const AYear, AMonth, ADay: Word): Boolean;
begin
  Result := DateUtils.IsValidDate(AYear, AMonth, ADay);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsValidTime(const AHour, AMinute, ASecond, AMilliSecond: Word): Boolean;
begin
  Result := DateUtils.IsValidTime(AHour, AMinute, ASecond, AMilliSecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word): Boolean;
begin
  Result := DateUtils.IsValidDateTime(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDateDay(const AYear, ADayOfYear: Word): Boolean;
begin
  Result := DateUtils.IsValidDateDay(AYear, ADayOfYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDateWeek(const AYear, AWeekOfYear, ADayOfWeek: Word): Boolean;
begin
  Result := DateUtils.IsValidDateWeek(AYear, AWeekOfYear, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsValidDateMonthWeek(const AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word): Boolean;
begin
  Result := DateUtils.IsValidDateMonthWeek(AYear, AMonth, AWeekOfMonth, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WeeksInYear(const AValue: TDateTime): Word;
begin
  Result := DateUtils.WeeksInYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WeeksInAYear(const AYear: Word): Word;
begin
  Result := DateUtils.WeeksInAYear(AYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DaysInYear(const AValue: TDateTime): Word;
begin
  Result := DateUtils.DaysInYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DaysInAYear(const AYear: Word): Word;
begin
  Result := DateUtils.DaysInAYear(AYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DaysInMonth(const AValue: TDateTime): Word;
begin
  Result := DateUtils.DaysInMonth(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DaysInAMonth(const AYear, AMonth: Word): Word;
begin
  Result := DateUtils.DaysInAMonth(AYear, AMonth);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function Today: TDateTime;
begin
  Result := DateUtils.Today;
end;

{$endif}
{$if (not defined(FPUNONE))}
Function Yesterday: TDateTime;
begin
  Result := DateUtils.Yesterday;
end;

{$endif}
{$if (not defined(FPUNONE))}
Function Tomorrow: TDateTime;
begin
  Result := DateUtils.Tomorrow;
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsToday(const AValue: TDateTime): Boolean;
begin
  Result := DateUtils.IsToday(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IsSameDay(const AValue, ABasis: TDateTime): Boolean;
begin
  Result := DateUtils.IsSameDay(AValue, ABasis);
end;

{$endif}
{$if (not defined(FPUNONE))}
function IsSameMonth(const Avalue, ABasis: TDateTime): Boolean;
begin
  Result := DateUtils.IsSameMonth(Avalue, ABasis);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function PreviousDayOfWeek (DayOfWeek : Word) : Word;
begin
  Result := DateUtils.PreviousDayOfWeek(DayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function YearOf(const AValue: TDateTime): Word;
begin
  Result := DateUtils.YearOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MonthOf(const AValue: TDateTime): Word;
begin
  Result := DateUtils.MonthOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WeekOf(const AValue: TDateTime): Word;
begin
  Result := DateUtils.WeekOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DayOf(const AValue: TDateTime): Word;
begin
  Result := DateUtils.DayOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function HourOf(const AValue: TDateTime): Word;
begin
  Result := DateUtils.HourOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOf(const AValue: TDateTime): Word;
begin
  Result := DateUtils.MinuteOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SecondOf(const AValue: TDateTime): Word;
begin
  Result := DateUtils.SecondOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOf(const AValue: TDateTime): Word;
begin
  Result := DateUtils.MilliSecondOf(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfTheYear(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.StartOfTheYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfTheYear(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.EndOfTheYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfAYear(const AYear: Word): TDateTime;
begin
  Result := DateUtils.StartOfAYear(AYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfAYear(const AYear: Word): TDateTime;
begin
  Result := DateUtils.EndOfAYear(AYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfTheMonth(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.StartOfTheMonth(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfTheMonth(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.EndOfTheMonth(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfAMonth(const AYear, AMonth: Word): TDateTime;
begin
  Result := DateUtils.StartOfAMonth(AYear, AMonth);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfAMonth(const AYear, AMonth: Word): TDateTime;
begin
  Result := DateUtils.EndOfAMonth(AYear, AMonth);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfTheWeek(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.StartOfTheWeek(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfTheWeek(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.EndOfTheWeek(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfAWeek(const AYear, AWeekOfYear: Word; const ADayOfWeek: Word): TDateTime;
begin
  Result := DateUtils.StartOfAWeek(AYear, AWeekOfYear, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfAWeek(const AYear, AWeekOfYear: Word): TDateTime;
begin
  Result := DateUtils.StartOfAWeek(AYear, AWeekOfYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfAWeek(const AYear, AWeekOfYear: Word; const ADayOfWeek: Word): TDateTime;
begin
  Result := DateUtils.EndOfAWeek(AYear, AWeekOfYear, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfAWeek(const AYear, AWeekOfYear: Word): TDateTime;
begin
  Result := DateUtils.EndOfAWeek(AYear, AWeekOfYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfTheDay(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.StartOfTheDay(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfTheDay(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.EndOfTheDay(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfADay(const AYear, AMonth, ADay: Word): TDateTime;
begin
  Result := DateUtils.StartOfADay(AYear, AMonth, ADay);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function StartOfADay(const AYear, ADayOfYear: Word): TDateTime;
begin
  Result := DateUtils.StartOfADay(AYear, ADayOfYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfADay(const AYear, AMonth, ADay: Word): TDateTime;
begin
  Result := DateUtils.EndOfADay(AYear, AMonth, ADay);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EndOfADay(const AYear, ADayOfYear: Word): TDateTime;
begin
  Result := DateUtils.EndOfADay(AYear, ADayOfYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MonthOfTheYear(const AValue: TDateTime): Word;
begin
  Result := DateUtils.MonthOfTheYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WeekOfTheYear(const AValue: TDateTime): Word;
begin
  Result := DateUtils.WeekOfTheYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WeekOfTheYear(const AValue: TDateTime; out AYear: Word): Word;
begin
  Result := DateUtils.WeekOfTheYear(AValue, AYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DayOfTheYear(const AValue: TDateTime): Word;
begin
  Result := DateUtils.DayOfTheYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function HourOfTheYear(const AValue: TDateTime): Word;
begin
  Result := DateUtils.HourOfTheYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheYear(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.MinuteOfTheYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheYear(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.SecondOfTheYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheYear(const AValue: TDateTime): Int64;
begin
  Result := DateUtils.MilliSecondOfTheYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WeekOfTheMonth(const AValue: TDateTime): Word;
begin
  Result := DateUtils.WeekOfTheMonth(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WeekOfTheMonth(const AValue: TDateTime; out AYear, AMonth: Word): Word;
begin
  Result := DateUtils.WeekOfTheMonth(AValue, AYear, AMonth);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DayOfTheMonth(const AValue: TDateTime): Word;
begin
  Result := DateUtils.DayOfTheMonth(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function HourOfTheMonth(const AValue: TDateTime): Word;
begin
  Result := DateUtils.HourOfTheMonth(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheMonth(const AValue: TDateTime): Word;
begin
  Result := DateUtils.MinuteOfTheMonth(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheMonth(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.SecondOfTheMonth(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheMonth(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.MilliSecondOfTheMonth(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DayOfTheWeek(const AValue: TDateTime): Word;
begin
  Result := DateUtils.DayOfTheWeek(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function HourOfTheWeek(const AValue: TDateTime): Word;
begin
  Result := DateUtils.HourOfTheWeek(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheWeek(const AValue: TDateTime): Word;
begin
  Result := DateUtils.MinuteOfTheWeek(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheWeek(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.SecondOfTheWeek(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheWeek(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.MilliSecondOfTheWeek(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function HourOfTheDay(const AValue: TDateTime): Word;
begin
  Result := DateUtils.HourOfTheDay(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheDay(const AValue: TDateTime): Word;
begin
  Result := DateUtils.MinuteOfTheDay(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheDay(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.SecondOfTheDay(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheDay(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.MilliSecondOfTheDay(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MinuteOfTheHour(const AValue: TDateTime): Word;
begin
  Result := DateUtils.MinuteOfTheHour(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheHour(const AValue: TDateTime): Word;
begin
  Result := DateUtils.SecondOfTheHour(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheHour(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.MilliSecondOfTheHour(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SecondOfTheMinute(const AValue: TDateTime): Word;
begin
  Result := DateUtils.SecondOfTheMinute(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheMinute(const AValue: TDateTime): LongWord;
begin
  Result := DateUtils.MilliSecondOfTheMinute(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondOfTheSecond(const AValue: TDateTime): Word;
begin
  Result := DateUtils.MilliSecondOfTheSecond(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastYears(const ANow, AThen: TDateTime; const AYears: Integer): Boolean;
begin
  Result := DateUtils.WithinPastYears(ANow, AThen, AYears);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastMonths(const ANow, AThen: TDateTime; const AMonths: Integer): Boolean;
begin
  Result := DateUtils.WithinPastMonths(ANow, AThen, AMonths);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastWeeks(const ANow, AThen: TDateTime; const AWeeks: Integer): Boolean;
begin
  Result := DateUtils.WithinPastWeeks(ANow, AThen, AWeeks);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastDays(const ANow, AThen: TDateTime; const ADays: Integer): Boolean;
begin
  Result := DateUtils.WithinPastDays(ANow, AThen, ADays);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastHours(const ANow, AThen: TDateTime; const AHours: Int64): Boolean;
begin
  Result := DateUtils.WithinPastHours(ANow, AThen, AHours);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastMinutes(const ANow, AThen: TDateTime; const AMinutes: Int64): Boolean;
begin
  Result := DateUtils.WithinPastMinutes(ANow, AThen, AMinutes);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastSeconds(const ANow, AThen: TDateTime; const ASeconds: Int64): Boolean;
begin
  Result := DateUtils.WithinPastSeconds(ANow, AThen, ASeconds);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WithinPastMilliSeconds(const ANow, AThen: TDateTime; const AMilliSeconds: Int64): Boolean;
begin
  Result := DateUtils.WithinPastMilliSeconds(ANow, AThen, AMilliSeconds);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function YearsBetween(const ANow, AThen: TDateTime; AExact : Boolean = False): Integer;
begin
  Result := DateUtils.YearsBetween(ANow, AThen, AExact);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MonthsBetween(const ANow, AThen: TDateTime; AExact : Boolean = False): Integer;
begin
  Result := DateUtils.MonthsBetween(ANow, AThen, AExact);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WeeksBetween(const ANow, AThen: TDateTime): Integer;
begin
  Result := DateUtils.WeeksBetween(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DaysBetween(const ANow, AThen: TDateTime): Integer;
begin
  Result := DateUtils.DaysBetween(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function HoursBetween(const ANow, AThen: TDateTime): Int64;
begin
  Result := DateUtils.HoursBetween(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MinutesBetween(const ANow, AThen: TDateTime): Int64;
begin
  Result := DateUtils.MinutesBetween(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SecondsBetween(const ANow, AThen: TDateTime): Int64;
begin
  Result := DateUtils.SecondsBetween(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondsBetween(const ANow, AThen: TDateTime): Int64;
begin
  Result := DateUtils.MilliSecondsBetween(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure PeriodBetween(const ANow, AThen: TDateTime; Out Years, months, days : Word);
begin
  DateUtils.PeriodBetween(ANow, AThen, Years, months, days);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function YearSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DateUtils.YearSpan(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MonthSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DateUtils.MonthSpan(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function WeekSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DateUtils.WeekSpan(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DaySpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DateUtils.DaySpan(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function HourSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DateUtils.HourSpan(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MinuteSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DateUtils.MinuteSpan(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SecondSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DateUtils.SecondSpan(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MilliSecondSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DateUtils.MilliSecondSpan(ANow, AThen);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncYear(const AValue: TDateTime; const ANumberOfYears: Integer ): TDateTime;
begin
  Result := DateUtils.IncYear(AValue, ANumberOfYears);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncYear(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.IncYear(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncWeek(const AValue: TDateTime; const ANumberOfWeeks: Integer): TDateTime;
begin
  Result := DateUtils.IncWeek(AValue, ANumberOfWeeks);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncWeek(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.IncWeek(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncDay(const AValue: TDateTime; const ANumberOfDays: Integer): TDateTime;
begin
  Result := DateUtils.IncDay(AValue, ANumberOfDays);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncDay(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.IncDay(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncHour(const AValue: TDateTime; const ANumberOfHours: Int64): TDateTime;
begin
  Result := DateUtils.IncHour(AValue, ANumberOfHours);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncHour(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.IncHour(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncMinute(const AValue: TDateTime; const ANumberOfMinutes: Int64): TDateTime;
begin
  Result := DateUtils.IncMinute(AValue, ANumberOfMinutes);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncMinute(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.IncMinute(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncSecond(const AValue: TDateTime; const ANumberOfSeconds: Int64): TDateTime;
begin
  Result := DateUtils.IncSecond(AValue, ANumberOfSeconds);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncSecond(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.IncSecond(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncMilliSecond(const AValue: TDateTime; const ANumberOfMilliSeconds: Int64): TDateTime;
begin
  Result := DateUtils.IncMilliSecond(AValue, ANumberOfMilliSeconds);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function IncMilliSecond(const AValue: TDateTime): TDateTime;
begin
  Result := DateUtils.IncMilliSecond(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime;
begin
  Result := DateUtils.EncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDateTime(const AValue: TDateTime; out AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word);
begin
  DateUtils.DecodeDateTime(AValue, AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word; out AValue: TDateTime): Boolean;
begin
  Result := DateUtils.TryEncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond, AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateWeek(const AYear, AWeekOfYear: Word; const ADayOfWeek: Word): TDateTime;
begin
  Result := DateUtils.EncodeDateWeek(AYear, AWeekOfYear, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateWeek(const AYear, AWeekOfYear: Word): TDateTime;
begin
  Result := DateUtils.EncodeDateWeek(AYear, AWeekOfYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDateWeek(const AValue: TDateTime; out AYear, AWeekOfYear, ADayOfWeek: Word);
begin
  DateUtils.DecodeDateWeek(AValue, AYear, AWeekOfYear, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateWeek(const AYear, AWeekOfYear: Word; out AValue: TDateTime; const ADayOfWeek: Word): Boolean;
begin
  Result := DateUtils.TryEncodeDateWeek(AYear, AWeekOfYear, AValue, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateWeek(const AYear, AWeekOfYear: Word; out AValue: TDateTime): Boolean;
begin
  Result := DateUtils.TryEncodeDateWeek(AYear, AWeekOfYear, AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateDay(const AYear, ADayOfYear: Word): TDateTime;
begin
  Result := DateUtils.EncodeDateDay(AYear, ADayOfYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDateDay(const AValue: TDateTime; out AYear, ADayOfYear: Word);
begin
  DateUtils.DecodeDateDay(AValue, AYear, ADayOfYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateDay(const AYear, ADayOfYear: Word; out AValue: TDateTime): Boolean;
begin
  Result := DateUtils.TryEncodeDateDay(AYear, ADayOfYear, AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDateMonthWeek(const AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word): TDateTime;
begin
  Result := DateUtils.EncodeDateMonthWeek(AYear, AMonth, AWeekOfMonth, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDateMonthWeek(const AValue: TDateTime; out AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word);
begin
  DateUtils.DecodeDateMonthWeek(AValue, AYear, AMonth, AWeekOfMonth, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDateMonthWeek(const AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word; out AValue: TDateTime): Boolean;
begin
  Result := DateUtils.TryEncodeDateMonthWeek(AYear, AMonth, AWeekOfMonth, ADayOfWeek, AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
function TryEncodeTimeInterval(Hour, Min, Sec, MSec:word; Out Time : TDateTime) : boolean;
begin
  Result := DateUtils.TryEncodeTimeInterval(Hour, Min, Sec, MSec, Time);
end;

{$endif}
{$if (not defined(FPUNONE))}
function EncodeTimeInterval(Hour, Minute, Second, MilliSecond:word): TDateTime;
begin
  Result := DateUtils.EncodeTimeInterval(Hour, Minute, Second, MilliSecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeYear(const AValue: TDateTime; const AYear: Word): TDateTime;
begin
  Result := DateUtils.RecodeYear(AValue, AYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeMonth(const AValue: TDateTime; const AMonth: Word): TDateTime;
begin
  Result := DateUtils.RecodeMonth(AValue, AMonth);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeDay(const AValue: TDateTime; const ADay: Word): TDateTime;
begin
  Result := DateUtils.RecodeDay(AValue, ADay);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeHour(const AValue: TDateTime; const AHour: Word): TDateTime;
begin
  Result := DateUtils.RecodeHour(AValue, AHour);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeMinute(const AValue: TDateTime; const AMinute: Word): TDateTime;
begin
  Result := DateUtils.RecodeMinute(AValue, AMinute);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeSecond(const AValue: TDateTime; const ASecond: Word): TDateTime;
begin
  Result := DateUtils.RecodeSecond(AValue, ASecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeMilliSecond(const AValue: TDateTime; const AMilliSecond: Word): TDateTime;
begin
  Result := DateUtils.RecodeMilliSecond(AValue, AMilliSecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeDate(const AValue: TDateTime; const AYear, AMonth, ADay: Word): TDateTime;
begin
  Result := DateUtils.RecodeDate(AValue, AYear, AMonth, ADay);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeTime(const AValue: TDateTime; const AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime;
begin
  Result := DateUtils.RecodeTime(AValue, AHour, AMinute, ASecond, AMilliSecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function RecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime;
begin
  Result := DateUtils.RecodeDateTime(AValue, AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryRecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word; out AResult: TDateTime): Boolean;
begin
  Result := DateUtils.TryRecodeDateTime(AValue, AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond, AResult);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function CompareDateTime(const A, B: TDateTime): TValueRelationship;
begin
  Result := DateUtils.CompareDateTime(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function CompareDate(const A, B: TDateTime): TValueRelationship;
begin
  Result := DateUtils.CompareDate(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function CompareTime(const A, B: TDateTime): TValueRelationship;
begin
  Result := DateUtils.CompareTime(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SameDateTime(const A, B: TDateTime): Boolean;
begin
  Result := DateUtils.SameDateTime(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SameDate(const A, B: TDateTime): Boolean;
begin
  Result := DateUtils.SameDate(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function SameTime(const A, B: TDateTime): Boolean;
begin
  Result := DateUtils.SameTime(A, B);
end;

{$endif}
{$if (not defined(FPUNONE))}
function DateTimeInRange(ADateTime: TDateTime; AStartDateTime, AEndDateTime: TDateTime; aInclusive: Boolean = True): Boolean;
begin
  Result := DateUtils.DateTimeInRange(ADateTime, AStartDateTime, AEndDateTime, aInclusive);
end;

{$endif}
{$if (not defined(FPUNONE))}
function TimeInRange(ATime: TTime; AStartTime, AEndTime: TTime; AInclusive: Boolean = True): Boolean;
begin
  Result := DateUtils.TimeInRange(ATime, AStartTime, AEndTime, AInclusive);
end;

{$endif}
{$if (not defined(FPUNONE))}
function DateInRange(ADate: TDate; AStartDate, AEndDate: TDate; AInclusive: Boolean = True): Boolean;
begin
  Result := DateUtils.DateInRange(ADate, AStartDate, AEndDate, AInclusive);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function NthDayOfWeek(const AValue: TDateTime): Word;
begin
  Result := DateUtils.NthDayOfWeek(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure DecodeDayOfWeekInMonth(const AValue: TDateTime; out AYear, AMonth, ANthDayOfWeek, ADayOfWeek: Word);
begin
  DateUtils.DecodeDayOfWeekInMonth(AValue, AYear, AMonth, ANthDayOfWeek, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function EncodeDayOfWeekInMonth(const AYear, AMonth, ANthDayOfWeek, ADayOfWeek: Word): TDateTime;
begin
  Result := DateUtils.EncodeDayOfWeekInMonth(AYear, AMonth, ANthDayOfWeek, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryEncodeDayOfWeekInMonth(const AYear, AMonth, ANthDayOfWeek, ADayOfWeek: Word; out AValue: TDateTime): Boolean;
begin
  Result := DateUtils.TryEncodeDayOfWeekInMonth(AYear, AMonth, ANthDayOfWeek, ADayOfWeek, AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateTimeError(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word; const ABaseDate: TDateTime);
begin
  DateUtils.InvalidDateTimeError(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond, ABaseDate);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateTimeError(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word);
begin
  DateUtils.InvalidDateTimeError(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateWeekError(const AYear, AWeekOfYear, ADayOfWeek: Word);
begin
  DateUtils.InvalidDateWeekError(AYear, AWeekOfYear, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateDayError(const AYear, ADayOfYear: Word);
begin
  DateUtils.InvalidDateDayError(AYear, ADayOfYear);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDateMonthWeekError(const AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word);
begin
  DateUtils.InvalidDateMonthWeekError(AYear, AMonth, AWeekOfMonth, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Procedure InvalidDayOfWeekInMonthError(const AYear, AMonth, ANthDayOfWeek, ADayOfWeek: Word);
begin
  DateUtils.InvalidDayOfWeekInMonthError(AYear, AMonth, ANthDayOfWeek, ADayOfWeek);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToJulianDate(const AValue: TDateTime): Double;
begin
  Result := DateUtils.DateTimeToJulianDate(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function JulianDateToDateTime(const AValue: Double): TDateTime;
begin
  Result := DateUtils.JulianDateToDateTime(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryJulianDateToDateTime(const AValue: Double; out ADateTime: TDateTime): Boolean;
begin
  Result := DateUtils.TryJulianDateToDateTime(AValue, ADateTime);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToModifiedJulianDate(const AValue: TDateTime): Double;
begin
  Result := DateUtils.DateTimeToModifiedJulianDate(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function ModifiedJulianDateToDateTime(const AValue: Double): TDateTime;
begin
  Result := DateUtils.ModifiedJulianDateToDateTime(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryModifiedJulianDateToDateTime(const AValue: Double; out ADateTime: TDateTime): Boolean;
begin
  Result := DateUtils.TryModifiedJulianDateToDateTime(AValue, ADateTime);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToUnix(const AValue: TDateTime; AInputIsUTC: Boolean = True): Int64;
begin
  Result := DateUtils.DateTimeToUnix(AValue, AInputIsUTC);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function UnixToDateTime(const AValue: Int64; aReturnUTC : Boolean = true): TDateTime;
begin
  Result := DateUtils.UnixToDateTime(AValue, aReturnUTC);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function UnixTimeStampToMac(const AValue: Int64): Int64;
begin
  Result := DateUtils.UnixTimeStampToMac(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToMac(const AValue: TDateTime): Int64;
begin
  Result := DateUtils.DateTimeToMac(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MacToDateTime(const AValue: Int64): TDateTime;
begin
  Result := DateUtils.MacToDateTime(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function MacTimeStampToUnix(const AValue: Int64): Int64;
begin
  Result := DateUtils.MacTimeStampToUnix(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DateTimeToDosDateTime(const AValue: TDateTime): longint;
begin
  Result := DateUtils.DateTimeToDosDateTime(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function DosDateTimeToDateTime( AValue: longint): TDateTime;
begin
  Result := DateUtils.DosDateTimeToDateTime(AValue);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function UniversalTimeToLocal(UT: TDateTime): TDateTime;
begin
  Result := DateUtils.UniversalTimeToLocal(UT);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function UniversalTimeToLocal(UT: TDateTime; TZOffset : Integer): TDateTime;
begin
  Result := DateUtils.UniversalTimeToLocal(UT, TZOffset);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function LocalTimeToUniversal(LT: TDateTime): TDateTime;
begin
  Result := DateUtils.LocalTimeToUniversal(LT);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function LocalTimeToUniversal(LT: TDateTime; TZOffset: Integer): TDateTime;
begin
  Result := DateUtils.LocalTimeToUniversal(LT, TZOffset);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ScanDateTime(const Pattern:string;const s:string;const fmt:TFormatSettings;startpos:integer=1) : tdatetime;
begin
  Result := DateUtils.ScanDateTime(Pattern, s, fmt, startpos);
end;

{$endif}
{$if (not defined(FPUNONE))}
function ScanDateTime(const Pattern:string;const s:string;startpos:integer=1) : tdatetime;
begin
  Result := DateUtils.ScanDateTime(Pattern, s, startpos);
end;

{$endif}
{$if (not defined(FPUNONE))}
function TryISOStrToDate(const aString: string; out outDate: TDateTime): Boolean;
begin
  Result := DateUtils.TryISOStrToDate(aString, outDate);
end;

{$endif}
{$if (not defined(FPUNONE))}
function TryISOStrToTime(const aString: string; Out outTime: TDateTime): Boolean;
begin
  Result := DateUtils.TryISOStrToTime(aString, outTime);
end;

{$endif}
{$if (not defined(FPUNONE))}
function TryISOStrToDateTime(const aString: string; out outDateTime: TDateTime): Boolean;
begin
  Result := DateUtils.TryISOStrToDateTime(aString, outDateTime);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryISOTZStrToTZOffset(const TZ : String; Out TZOffset : Integer) : boolean;
begin
  Result := DateUtils.TryISOTZStrToTZOffset(TZ, TZOffset);
end;

{$endif}
{$if (not defined(FPUNONE))}
function DateToISO8601(const ADate: TDateTime; AInputIsUTC: Boolean = True): string;
begin
  Result := DateUtils.DateToISO8601(ADate, AInputIsUTC);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function ISO8601ToDate(const DateString: string; ReturnUTC : Boolean = True): TDateTime;
begin
  Result := DateUtils.ISO8601ToDate(DateString, ReturnUTC);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function ISO8601ToDateDef(const DateString: string; ReturnUTC : Boolean; aDefault : TDateTime ): TDateTime;
begin
  Result := DateUtils.ISO8601ToDateDef(DateString, ReturnUTC, aDefault);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function ISO8601ToDateDef(const DateString: string; aDefault : TDateTime; ReturnUTC : Boolean = True ): TDateTime;
begin
  Result := DateUtils.ISO8601ToDateDef(DateString, aDefault, ReturnUTC);
end;

{$endif}
{$if (not defined(FPUNONE))}
Function TryISO8601ToDate(const DateString: string; out ADateTime: TDateTime; ReturnUTC : Boolean = True) : Boolean;
begin
  Result := DateUtils.TryISO8601ToDate(DateString, ADateTime, ReturnUTC);
end;

{$endif}
end.
