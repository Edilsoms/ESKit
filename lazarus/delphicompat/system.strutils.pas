{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.StrUtils
  Gerado por tools/genvclcompat.py a partir de StrUtils.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.StrUtils;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  SysUtils, Types, StrUtils;
type
  TStringSearchOption = StrUtils.TStringSearchOption;
  TStringSearchOptions = StrUtils.TStringSearchOptions;
  TSoundexLength = StrUtils.TSoundexLength;
  TSoundexIntLength = StrUtils.TSoundexIntLength;
  TCompareTextProc = StrUtils.TCompareTextProc;
  TRomanConversionStrictness = StrUtils.TRomanConversionStrictness;
  SizeIntArray = StrUtils.SizeIntArray;
  TStringReplaceAlgorithm = StrUtils.TStringReplaceAlgorithm;
  TRawByteStringArray = StrUtils.TRawByteStringArray;
  TUnicodeStringArray = StrUtils.TUnicodeStringArray;
  TStringSeachOption = StrUtils.TStringSeachOption;
const
  soDown = StrUtils.soDown;
  soMatchCase = StrUtils.soMatchCase;
  soWholeWord = StrUtils.soWholeWord;
  rcsStrict = StrUtils.rcsStrict;
  rcsRelaxed = StrUtils.rcsRelaxed;
  rcsDontCare = StrUtils.rcsDontCare;
  sraDefault = StrUtils.sraDefault;
  sraManySmall = StrUtils.sraManySmall;
  sraBoyerMoore = StrUtils.sraBoyerMoore;
  DigitChars = StrUtils.DigitChars;
  Brackets = StrUtils.Brackets;
  StdWordDelims = StrUtils.StdWordDelims;
  StdSwitchChars = StrUtils.StdSwitchChars;
var
  AnsiResemblesProc: TCompareTextProc absolute StrUtils.AnsiResemblesProc;
  ResemblesProc: TCompareTextProc absolute StrUtils.ResemblesProc;
Function AnsiResemblesText(const AText, AOther: string): Boolean; inline;
Function AnsiContainsText(const AText, ASubText: string): Boolean; inline;
Function AnsiStartsText(const ASubText, AText: string): Boolean; inline;
Function AnsiEndsText(const ASubText, AText: string): Boolean; inline;
Function AnsiReplaceText(const AText, AFromText, AToText: string): string; inline;
Function AnsiMatchText(const AText: string; const AValues: array of string): Boolean; inline;
Function AnsiIndexText(const AText: string; const AValues: array of string): Integer; inline;
Function StartsText(const ASubText, AText: string): Boolean; inline;
Function EndsText(const ASubText, AText: string): Boolean; inline;
function ResemblesText(const AText, AOther: string): Boolean; inline;
function ContainsText(const AText, ASubText: string): Boolean; inline;
function MatchText(const AText: string; const AValues: array of string): Boolean; overload; inline;
Function MatchText(const AText: UnicodeString; const AValues: array of UnicodeString): Boolean; overload; inline;
function IndexText(const AText: string; const AValues: array of string): Integer; overload; inline;
Function IndexText(const AText: UnicodeString; const AValues: array of UnicodeString): Integer; overload; inline;
Function AnsiContainsStr(const AText, ASubText: string): Boolean; inline;
Function AnsiStartsStr(const ASubText, AText: string): Boolean; inline;
Function AnsiEndsStr(const ASubText, AText: string): Boolean; inline;
Function AnsiReplaceStr(const AText, AFromText, AToText: string): string; inline;
Function AnsiMatchStr(const AText: string; const AValues: array of string): Boolean; inline;
Function AnsiIndexStr(const AText: string; const AValues: array of string): Integer; inline;
Function StartsStr(const ASubText, AText: string): Boolean; inline;
Function EndsStr(const ASubText, AText: string): Boolean; inline;
Function MatchStr(const AText: UnicodeString; const AValues: array of UnicodeString): Boolean; overload; inline;
function MatchStr(const AText: string; const AValues: array of string): Boolean; overload; inline;
Function IndexStr(const AText: UnicodeString; const AValues: array of UnicodeString): Integer; overload; inline;
function IndexStr(const AText: string; const AValues: array of string): Integer; overload; inline;
function ContainsStr(const AText, ASubText: string): Boolean; inline;
Function DupeString(const AText: string; ACount: Integer): string; inline;
Function ReverseString(const AText: string): string; inline;
Function AnsiReverseString(const AText: AnsiString): AnsiString; inline;
Function StuffString(const AText: string; AStart, ALength: Cardinal; const ASubText: string): string; inline;
Function RandomFrom(const AValues: array of string): string; overload; inline;
Function IfThen(AValue: Boolean; const ATrue: string; const AFalse: string = ''): string; overload; inline;
function NaturalCompareText (const S1 , S2 : string ): Integer; overload; inline;
function NaturalCompareText(const Str1, Str2: string; const ADecSeparator, AThousandSeparator: Char): Integer; overload; inline;
function SplitString(const S, Delimiters: string): TStringDynArray; inline;
Function LeftStr(const AText: AnsiString; const ACount: SizeInt): AnsiString; overload; inline;
Function LeftStr(const AText: WideString; const ACount: SizeInt): WideString; overload; inline;
Function RightStr(const AText: AnsiString; const ACount: SizeInt): AnsiString; overload; inline;
Function RightStr(const AText: WideString; const ACount: SizeInt): WideString; overload; inline;
Function MidStr(const AText: AnsiString; const AStart, ACount: SizeInt): AnsiString; overload; inline;
Function MidStr(const AText: WideString; const AStart, ACount: SizeInt): WideString; overload; inline;
Function RightBStr(const AText: AnsiString; const AByteCount: SizeInt): AnsiString; inline;
Function MidBStr(const AText: AnsiString; const AByteStart, AByteCount: SizeInt): AnsiString; inline;
Function AnsiLeftStr(const AText: AnsiString; const ACount: SizeInt): AnsiString; inline;
Function AnsiRightStr(const AText: AnsiString; const ACount: SizeInt): AnsiString; inline;
Function AnsiMidStr(const AText: AnsiString; const AStart, ACount: SizeInt): AnsiString; inline;
Function LeftBStr(const AText: AnsiString; const AByteCount: SizeInt): AnsiString; inline;
Function SearchBuf(Buf: PChar; BufLen: SizeInt; SelStart, SelLength: SizeInt; SearchString: String; Options: TStringSearchOptions): PChar; overload; inline;
Function SearchBuf(Buf: PChar; BufLen: SizeInt; SelStart, SelLength: SizeInt; SearchString: String): PChar; overload; inline;
Function PosEx(const SubStr, S: string; Offset: SizeUint): SizeInt; overload; inline;
Function PosEx(const SubStr, S: string): SizeInt; overload; inline;
Function PosEx(c:char; const S: string; Offset: SizeUint): SizeInt; overload; inline;
Function PosEx(const SubStr, S: UnicodeString; Offset: SizeUint): SizeInt; overload; inline;
Function PosEx(c: WideChar; const S: UnicodeString; Offset: SizeUint): SizeInt; overload; inline;
Function PosEx(const SubStr, S: UnicodeString): Sizeint; overload; inline;
function StringsReplace(const S: string; OldPattern, NewPattern: array of string; Flags: TReplaceFlags): string; inline;
Function ReplaceStr(const AText, AFromText, AToText: string): string; inline;
Function ReplaceText(const AText, AFromText, AToText: string): string; inline;
Function Soundex(const AText: string; ALength: TSoundexLength): string; overload; inline;
Function Soundex(const AText: string): string; overload; inline;
Function SoundexInt(const AText: string; ALength: TSoundexIntLength): Integer; overload; inline;
Function SoundexInt(const AText: string): Integer; overload; inline;
Function DecodeSoundexInt(AValue: Integer): string; inline;
Function SoundexWord(const AText: string): Word; inline;
Function DecodeSoundexWord(AValue: Word): string; inline;
Function SoundexSimilar(const AText, AOther: string; ALength: TSoundexLength): Boolean; overload; inline;
Function SoundexSimilar(const AText, AOther: string): Boolean; overload; inline;
Function SoundexCompare(const AText, AOther: string; ALength: TSoundexLength): Integer; overload; inline;
Function SoundexCompare(const AText, AOther: string): Integer; overload; inline;
Function SoundexProc(const AText, AOther: string): Boolean; inline;
function IsEmptyStr(const S: string; const EmptyChars: TSysCharSet): Boolean; inline;
function DelSpace(const S: string): string; inline;
function DelChars(const S: string; Chr: Char): string; inline;
function DelSpace1(const S: string): string; inline;
function Tab2Space(const S: string; Numb: Byte): string; inline;
function NPos(const C: string; S: string; N: Integer): SizeInt; inline;
Function RPosEx(C:char;const S : AnsiString;offs:cardinal):SizeInt; overload; inline;
Function RPosEx(C:Unicodechar;const S : UnicodeString;offs:cardinal):SizeInt; overload; inline;
Function RPosEx(Const Substr : AnsiString; Const Source : AnsiString;offs:cardinal) : SizeInt; overload; inline;
Function RPosEx(Const Substr : UnicodeString; Const Source : UnicodeString;offs:cardinal) : SizeInt; overload; inline;
Function RPos(c:char;const S : AnsiString):SizeInt; overload; inline;
Function RPos(c:Unicodechar;const S : UnicodeString):SizeInt; overload; inline;
Function RPos(Const Substr : AnsiString; Const Source : AnsiString) : SizeInt; overload; inline;
Function RPos(Const Substr : UnicodeString; Const Source : UnicodeString) : SizeInt; overload; inline;
function AddChar(C: Char; const S: string; N: Integer): string; inline;
function AddCharR(C: Char; const S: string; N: Integer): string; inline;
function PadLeft(const S: string; N: Integer): string; inline;
function PadRight(const S: string; N: Integer): string; inline;
function PadCenter(const S: string; Len: SizeInt): string; inline;
function Copy2Symb(const S: string; Symb: Char): string; inline;
function Copy2SymbDel(var S: string; Symb: Char): string; inline;
function Copy2Space(const S: string): string; inline;
function Copy2SpaceDel(var S: string): string; inline;
function AnsiProperCase(const S: string; const WordDelims: TSysCharSet): string; inline;
function WordCount(const S: string; const WordDelims: TSysCharSet): SizeInt; inline;
function WordPosition(const N: Integer; const S: string; const WordDelims: TSysCharSet): SizeInt; inline;
function ExtractWord(N: Integer; const S: string; const WordDelims: TSysCharSet): string; inline;
function ExtractWordPos(N: Integer; const S: string; const WordDelims: TSysCharSet; out Pos: Integer): string; overload; inline;
function ExtractDelimited(N: Integer; const S: string; const Delims: TSysCharSet): string; inline;
function ExtractSubstr(const S: string; var Pos: Integer; const Delims: TSysCharSet): string; overload; inline;
function IsWordPresent(const W, S: string; const WordDelims: TSysCharSet): Boolean; inline;
function FindPart(const HelpWilds, InputStr: string): SizeInt; inline;
function IsWild(InputStr, Wilds: string; IgnoreCase: Boolean): Boolean; inline;
function XorString(const Key, Src: ShortString): ShortString; inline;
function XorEncode(const Key, Source: string): string; inline;
function XorDecode(const Key, Source: string): string; inline;
function GetCmdLineArg(const Switch: string; SwitchChars: TSysCharSet): string; inline;
function Numb2USA(const S: string): string; inline;
function Hex2Dec(const S: string): Longint; inline;
function Hex2Dec64(const S: string): int64; inline;
function Dec2Numb(N: Longint; Len, Base: Byte): string; inline;
function Numb2Dec(S: string; Base: Byte): Longint; inline;
function IntToBin(Value: Longint; Digits, Spaces: Integer): string; overload; inline;
function IntToBin(Value: Longint; Digits: Integer): string; overload; inline;
function intToBin(Value: int64; Digits:integer): string; overload; inline;
function IntToRoman(Value: Longint): string; inline;
function TryRomanToInt(S: String; out N: LongInt; Strictness: TRomanConversionStrictness = rcsRelaxed): Boolean; inline;
function RomanToInt(const S: string; Strictness: TRomanConversionStrictness = rcsRelaxed): Longint; inline;
function RomanToIntDef(Const S : String; const ADefault: Longint = 0; Strictness: TRomanConversionStrictness = rcsRelaxed): Longint; inline;
procedure BinToHex(const BinBuffer: TBytes; BinBufOffset: Integer; var HexBuffer: TBytes; HexBufOffset: Integer; Count: Integer); overload; inline;
procedure BinToHex(BinValue: Pointer; HexValue: PWideChar; BinBufSize: Integer); overload; inline;
procedure BinToHex(const BinValue; HexValue: PWideChar; BinBufSize: Integer); overload; inline;
procedure BinToHex(BinValue: PAnsiChar; HexValue: PAnsiChar; BinBufSize: Integer); overload; inline;
procedure BinToHex(BinValue: PAnsiChar; HexValue: PWideChar; BinBufSize: Integer); overload; inline;
procedure BinToHex(const BinValue; HexValue: PAnsiChar; BinBufSize: Integer); overload; inline;
procedure BinToHex(BinValue: Pointer; HexValue: PAnsiChar; BinBufSize: Integer); overload; inline;
function HexToBin(HexValue, BinValue: PChar; BinBufSize: Integer): Integer; inline;
function PosSet (const c:TSysCharSet;const s : ansistring ):SizeInt; overload; inline;
function PosSet (const c:string;const s : ansistring ):SizeInt; overload; inline;
function PosSetEx (const c:TSysCharSet;const s : ansistring;count:Integer ):SizeInt; overload; inline;
function PosSetEx (const c:string;const s : ansistring;count:Integer ):SizeInt; overload; inline;
Procedure Removeleadingchars(VAR S : AnsiString; Const CSet:TSysCharset); inline;
Procedure RemoveTrailingChars(VAR S : AnsiString;Const CSet:TSysCharset); inline;
Procedure RemovePadChars(VAR S : AnsiString;Const CSet:TSysCharset); inline;
function TrimLeftSet(const S: String;const CSet:TSysCharSet): String; inline;
Function TrimRightSet(const S: String;const CSet:TSysCharSet): String; inline;
function TrimSet(const S: String;const CSet:TSysCharSet): String; inline;
Function FindMatchesBoyerMooreCaseSensitive(const S,OldPattern: PChar; const SSize, OldPatternSize: SizeInt; out aMatches: SizeIntArray; const aMatchAll: Boolean) : Boolean; overload; inline;
Function FindMatchesBoyerMooreCaseSensitive(const S,OldPattern: String; out aMatches: SizeIntArray; const aMatchAll: Boolean) : Boolean; overload; inline;
Function FindMatchesBoyerMooreCaseInSensitive(const S, OldPattern: PChar; const SSize, OldPatternSize: SizeInt; out aMatches: SizeIntArray; const aMatchAll: Boolean) : Boolean; overload; inline;
Function FindMatchesBoyerMooreCaseInSensitive(const S, OldPattern: String; out aMatches: SizeIntArray; const aMatchAll: Boolean) : Boolean; overload; inline;
Function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags; out aCount : Integer; Algorithm : TStringReplaceAlgorithm = sraDefault): string; overload; inline;
Function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags; Algorithm : TStringReplaceAlgorithm = sraDefault): string; overload; inline;
Function StringReplace(const S, OldPattern, NewPattern: unicodestring; Flags: TReplaceFlags): unicodestring; overload; inline;
Function StringReplace(const S, OldPattern, NewPattern: widestring; Flags: TReplaceFlags): widestring; overload; inline;
Function SplitCommandLine(S : RawByteString) : TRawByteStringArray; overload; inline;
Function SplitCommandLine(S : UnicodeString) : TUnicodeStringArray; overload; inline;
function SErrAmountStrings: string; inline;
function SInvalidRomanNumeral: string; inline;

implementation

Function AnsiResemblesText(const AText, AOther: string): Boolean;
begin
  Result := StrUtils.AnsiResemblesText(AText, AOther);
end;

Function AnsiContainsText(const AText, ASubText: string): Boolean;
begin
  Result := StrUtils.AnsiContainsText(AText, ASubText);
end;

Function AnsiStartsText(const ASubText, AText: string): Boolean;
begin
  Result := StrUtils.AnsiStartsText(ASubText, AText);
end;

Function AnsiEndsText(const ASubText, AText: string): Boolean;
begin
  Result := StrUtils.AnsiEndsText(ASubText, AText);
end;

Function AnsiReplaceText(const AText, AFromText, AToText: string): string;
begin
  Result := StrUtils.AnsiReplaceText(AText, AFromText, AToText);
end;

Function AnsiMatchText(const AText: string; const AValues: array of string): Boolean;
begin
  Result := StrUtils.AnsiMatchText(AText, AValues);
end;

Function AnsiIndexText(const AText: string; const AValues: array of string): Integer;
begin
  Result := StrUtils.AnsiIndexText(AText, AValues);
end;

Function StartsText(const ASubText, AText: string): Boolean;
begin
  Result := StrUtils.StartsText(ASubText, AText);
end;

Function EndsText(const ASubText, AText: string): Boolean;
begin
  Result := StrUtils.EndsText(ASubText, AText);
end;

function ResemblesText(const AText, AOther: string): Boolean;
begin
  Result := StrUtils.ResemblesText(AText, AOther);
end;

function ContainsText(const AText, ASubText: string): Boolean;
begin
  Result := StrUtils.ContainsText(AText, ASubText);
end;

function MatchText(const AText: string; const AValues: array of string): Boolean;
begin
  Result := StrUtils.MatchText(AText, AValues);
end;

Function MatchText(const AText: UnicodeString; const AValues: array of UnicodeString): Boolean;
begin
  Result := StrUtils.MatchText(AText, AValues);
end;

function IndexText(const AText: string; const AValues: array of string): Integer;
begin
  Result := StrUtils.IndexText(AText, AValues);
end;

Function IndexText(const AText: UnicodeString; const AValues: array of UnicodeString): Integer;
begin
  Result := StrUtils.IndexText(AText, AValues);
end;

Function AnsiContainsStr(const AText, ASubText: string): Boolean;
begin
  Result := StrUtils.AnsiContainsStr(AText, ASubText);
end;

Function AnsiStartsStr(const ASubText, AText: string): Boolean;
begin
  Result := StrUtils.AnsiStartsStr(ASubText, AText);
end;

Function AnsiEndsStr(const ASubText, AText: string): Boolean;
begin
  Result := StrUtils.AnsiEndsStr(ASubText, AText);
end;

Function AnsiReplaceStr(const AText, AFromText, AToText: string): string;
begin
  Result := StrUtils.AnsiReplaceStr(AText, AFromText, AToText);
end;

Function AnsiMatchStr(const AText: string; const AValues: array of string): Boolean;
begin
  Result := StrUtils.AnsiMatchStr(AText, AValues);
end;

Function AnsiIndexStr(const AText: string; const AValues: array of string): Integer;
begin
  Result := StrUtils.AnsiIndexStr(AText, AValues);
end;

Function StartsStr(const ASubText, AText: string): Boolean;
begin
  Result := StrUtils.StartsStr(ASubText, AText);
end;

Function EndsStr(const ASubText, AText: string): Boolean;
begin
  Result := StrUtils.EndsStr(ASubText, AText);
end;

Function MatchStr(const AText: UnicodeString; const AValues: array of UnicodeString): Boolean;
begin
  Result := StrUtils.MatchStr(AText, AValues);
end;

function MatchStr(const AText: string; const AValues: array of string): Boolean;
begin
  Result := StrUtils.MatchStr(AText, AValues);
end;

Function IndexStr(const AText: UnicodeString; const AValues: array of UnicodeString): Integer;
begin
  Result := StrUtils.IndexStr(AText, AValues);
end;

function IndexStr(const AText: string; const AValues: array of string): Integer;
begin
  Result := StrUtils.IndexStr(AText, AValues);
end;

function ContainsStr(const AText, ASubText: string): Boolean;
begin
  Result := StrUtils.ContainsStr(AText, ASubText);
end;

Function DupeString(const AText: string; ACount: Integer): string;
begin
  Result := StrUtils.DupeString(AText, ACount);
end;

Function ReverseString(const AText: string): string;
begin
  Result := StrUtils.ReverseString(AText);
end;

Function AnsiReverseString(const AText: AnsiString): AnsiString;
begin
  Result := StrUtils.AnsiReverseString(AText);
end;

Function StuffString(const AText: string; AStart, ALength: Cardinal; const ASubText: string): string;
begin
  Result := StrUtils.StuffString(AText, AStart, ALength, ASubText);
end;

Function RandomFrom(const AValues: array of string): string;
begin
  Result := StrUtils.RandomFrom(AValues);
end;

Function IfThen(AValue: Boolean; const ATrue: string; const AFalse: string = ''): string;
begin
  Result := StrUtils.IfThen(AValue, ATrue, AFalse);
end;

function NaturalCompareText (const S1 , S2 : string ): Integer;
begin
  Result := StrUtils.NaturalCompareText(S1, S2);
end;

function NaturalCompareText(const Str1, Str2: string; const ADecSeparator, AThousandSeparator: Char): Integer;
begin
  Result := StrUtils.NaturalCompareText(Str1, Str2, ADecSeparator, AThousandSeparator);
end;

function SplitString(const S, Delimiters: string): TStringDynArray;
begin
  Result := StrUtils.SplitString(S, Delimiters);
end;

Function LeftStr(const AText: AnsiString; const ACount: SizeInt): AnsiString;
begin
  Result := StrUtils.LeftStr(AText, ACount);
end;

Function LeftStr(const AText: WideString; const ACount: SizeInt): WideString;
begin
  Result := StrUtils.LeftStr(AText, ACount);
end;

Function RightStr(const AText: AnsiString; const ACount: SizeInt): AnsiString;
begin
  Result := StrUtils.RightStr(AText, ACount);
end;

Function RightStr(const AText: WideString; const ACount: SizeInt): WideString;
begin
  Result := StrUtils.RightStr(AText, ACount);
end;

Function MidStr(const AText: AnsiString; const AStart, ACount: SizeInt): AnsiString;
begin
  Result := StrUtils.MidStr(AText, AStart, ACount);
end;

Function MidStr(const AText: WideString; const AStart, ACount: SizeInt): WideString;
begin
  Result := StrUtils.MidStr(AText, AStart, ACount);
end;

Function RightBStr(const AText: AnsiString; const AByteCount: SizeInt): AnsiString;
begin
  Result := StrUtils.RightBStr(AText, AByteCount);
end;

Function MidBStr(const AText: AnsiString; const AByteStart, AByteCount: SizeInt): AnsiString;
begin
  Result := StrUtils.MidBStr(AText, AByteStart, AByteCount);
end;

Function AnsiLeftStr(const AText: AnsiString; const ACount: SizeInt): AnsiString;
begin
  Result := StrUtils.AnsiLeftStr(AText, ACount);
end;

Function AnsiRightStr(const AText: AnsiString; const ACount: SizeInt): AnsiString;
begin
  Result := StrUtils.AnsiRightStr(AText, ACount);
end;

Function AnsiMidStr(const AText: AnsiString; const AStart, ACount: SizeInt): AnsiString;
begin
  Result := StrUtils.AnsiMidStr(AText, AStart, ACount);
end;

Function LeftBStr(const AText: AnsiString; const AByteCount: SizeInt): AnsiString;
begin
  Result := StrUtils.LeftBStr(AText, AByteCount);
end;

Function SearchBuf(Buf: PChar; BufLen: SizeInt; SelStart, SelLength: SizeInt; SearchString: String; Options: TStringSearchOptions): PChar;
begin
  Result := StrUtils.SearchBuf(Buf, BufLen, SelStart, SelLength, SearchString, Options);
end;

Function SearchBuf(Buf: PChar; BufLen: SizeInt; SelStart, SelLength: SizeInt; SearchString: String): PChar;
begin
  Result := StrUtils.SearchBuf(Buf, BufLen, SelStart, SelLength, SearchString);
end;

Function PosEx(const SubStr, S: string; Offset: SizeUint): SizeInt;
begin
  Result := StrUtils.PosEx(SubStr, S, Offset);
end;

Function PosEx(const SubStr, S: string): SizeInt;
begin
  Result := StrUtils.PosEx(SubStr, S);
end;

Function PosEx(c:char; const S: string; Offset: SizeUint): SizeInt;
begin
  Result := StrUtils.PosEx(c, S, Offset);
end;

Function PosEx(const SubStr, S: UnicodeString; Offset: SizeUint): SizeInt;
begin
  Result := StrUtils.PosEx(SubStr, S, Offset);
end;

Function PosEx(c: WideChar; const S: UnicodeString; Offset: SizeUint): SizeInt;
begin
  Result := StrUtils.PosEx(c, S, Offset);
end;

Function PosEx(const SubStr, S: UnicodeString): Sizeint;
begin
  Result := StrUtils.PosEx(SubStr, S);
end;

function StringsReplace(const S: string; OldPattern, NewPattern: array of string; Flags: TReplaceFlags): string;
begin
  Result := StrUtils.StringsReplace(S, OldPattern, NewPattern, Flags);
end;

Function ReplaceStr(const AText, AFromText, AToText: string): string;
begin
  Result := StrUtils.ReplaceStr(AText, AFromText, AToText);
end;

Function ReplaceText(const AText, AFromText, AToText: string): string;
begin
  Result := StrUtils.ReplaceText(AText, AFromText, AToText);
end;

Function Soundex(const AText: string; ALength: TSoundexLength): string;
begin
  Result := StrUtils.Soundex(AText, ALength);
end;

Function Soundex(const AText: string): string;
begin
  Result := StrUtils.Soundex(AText);
end;

Function SoundexInt(const AText: string; ALength: TSoundexIntLength): Integer;
begin
  Result := StrUtils.SoundexInt(AText, ALength);
end;

Function SoundexInt(const AText: string): Integer;
begin
  Result := StrUtils.SoundexInt(AText);
end;

Function DecodeSoundexInt(AValue: Integer): string;
begin
  Result := StrUtils.DecodeSoundexInt(AValue);
end;

Function SoundexWord(const AText: string): Word;
begin
  Result := StrUtils.SoundexWord(AText);
end;

Function DecodeSoundexWord(AValue: Word): string;
begin
  Result := StrUtils.DecodeSoundexWord(AValue);
end;

Function SoundexSimilar(const AText, AOther: string; ALength: TSoundexLength): Boolean;
begin
  Result := StrUtils.SoundexSimilar(AText, AOther, ALength);
end;

Function SoundexSimilar(const AText, AOther: string): Boolean;
begin
  Result := StrUtils.SoundexSimilar(AText, AOther);
end;

Function SoundexCompare(const AText, AOther: string; ALength: TSoundexLength): Integer;
begin
  Result := StrUtils.SoundexCompare(AText, AOther, ALength);
end;

Function SoundexCompare(const AText, AOther: string): Integer;
begin
  Result := StrUtils.SoundexCompare(AText, AOther);
end;

Function SoundexProc(const AText, AOther: string): Boolean;
begin
  Result := StrUtils.SoundexProc(AText, AOther);
end;

function IsEmptyStr(const S: string; const EmptyChars: TSysCharSet): Boolean;
begin
  Result := StrUtils.IsEmptyStr(S, EmptyChars);
end;

function DelSpace(const S: string): string;
begin
  Result := StrUtils.DelSpace(S);
end;

function DelChars(const S: string; Chr: Char): string;
begin
  Result := StrUtils.DelChars(S, Chr);
end;

function DelSpace1(const S: string): string;
begin
  Result := StrUtils.DelSpace1(S);
end;

function Tab2Space(const S: string; Numb: Byte): string;
begin
  Result := StrUtils.Tab2Space(S, Numb);
end;

function NPos(const C: string; S: string; N: Integer): SizeInt;
begin
  Result := StrUtils.NPos(C, S, N);
end;

Function RPosEx(C:char;const S : AnsiString;offs:cardinal):SizeInt;
begin
  Result := StrUtils.RPosEx(C, S, offs);
end;

Function RPosEx(C:Unicodechar;const S : UnicodeString;offs:cardinal):SizeInt;
begin
  Result := StrUtils.RPosEx(C, S, offs);
end;

Function RPosEx(Const Substr : AnsiString; Const Source : AnsiString;offs:cardinal) : SizeInt;
begin
  Result := StrUtils.RPosEx(Substr, Source, offs);
end;

Function RPosEx(Const Substr : UnicodeString; Const Source : UnicodeString;offs:cardinal) : SizeInt;
begin
  Result := StrUtils.RPosEx(Substr, Source, offs);
end;

Function RPos(c:char;const S : AnsiString):SizeInt;
begin
  Result := StrUtils.RPos(c, S);
end;

Function RPos(c:Unicodechar;const S : UnicodeString):SizeInt;
begin
  Result := StrUtils.RPos(c, S);
end;

Function RPos(Const Substr : AnsiString; Const Source : AnsiString) : SizeInt;
begin
  Result := StrUtils.RPos(Substr, Source);
end;

Function RPos(Const Substr : UnicodeString; Const Source : UnicodeString) : SizeInt;
begin
  Result := StrUtils.RPos(Substr, Source);
end;

function AddChar(C: Char; const S: string; N: Integer): string;
begin
  Result := StrUtils.AddChar(C, S, N);
end;

function AddCharR(C: Char; const S: string; N: Integer): string;
begin
  Result := StrUtils.AddCharR(C, S, N);
end;

function PadLeft(const S: string; N: Integer): string;
begin
  Result := StrUtils.PadLeft(S, N);
end;

function PadRight(const S: string; N: Integer): string;
begin
  Result := StrUtils.PadRight(S, N);
end;

function PadCenter(const S: string; Len: SizeInt): string;
begin
  Result := StrUtils.PadCenter(S, Len);
end;

function Copy2Symb(const S: string; Symb: Char): string;
begin
  Result := StrUtils.Copy2Symb(S, Symb);
end;

function Copy2SymbDel(var S: string; Symb: Char): string;
begin
  Result := StrUtils.Copy2SymbDel(S, Symb);
end;

function Copy2Space(const S: string): string;
begin
  Result := StrUtils.Copy2Space(S);
end;

function Copy2SpaceDel(var S: string): string;
begin
  Result := StrUtils.Copy2SpaceDel(S);
end;

function AnsiProperCase(const S: string; const WordDelims: TSysCharSet): string;
begin
  Result := StrUtils.AnsiProperCase(S, WordDelims);
end;

function WordCount(const S: string; const WordDelims: TSysCharSet): SizeInt;
begin
  Result := StrUtils.WordCount(S, WordDelims);
end;

function WordPosition(const N: Integer; const S: string; const WordDelims: TSysCharSet): SizeInt;
begin
  Result := StrUtils.WordPosition(N, S, WordDelims);
end;

function ExtractWord(N: Integer; const S: string; const WordDelims: TSysCharSet): string;
begin
  Result := StrUtils.ExtractWord(N, S, WordDelims);
end;

function ExtractWordPos(N: Integer; const S: string; const WordDelims: TSysCharSet; out Pos: Integer): string;
begin
  Result := StrUtils.ExtractWordPos(N, S, WordDelims, Pos);
end;

function ExtractDelimited(N: Integer; const S: string; const Delims: TSysCharSet): string;
begin
  Result := StrUtils.ExtractDelimited(N, S, Delims);
end;

function ExtractSubstr(const S: string; var Pos: Integer; const Delims: TSysCharSet): string;
begin
  Result := StrUtils.ExtractSubstr(S, Pos, Delims);
end;

function IsWordPresent(const W, S: string; const WordDelims: TSysCharSet): Boolean;
begin
  Result := StrUtils.IsWordPresent(W, S, WordDelims);
end;

function FindPart(const HelpWilds, InputStr: string): SizeInt;
begin
  Result := StrUtils.FindPart(HelpWilds, InputStr);
end;

function IsWild(InputStr, Wilds: string; IgnoreCase: Boolean): Boolean;
begin
  Result := StrUtils.IsWild(InputStr, Wilds, IgnoreCase);
end;

function XorString(const Key, Src: ShortString): ShortString;
begin
  Result := StrUtils.XorString(Key, Src);
end;

function XorEncode(const Key, Source: string): string;
begin
  Result := StrUtils.XorEncode(Key, Source);
end;

function XorDecode(const Key, Source: string): string;
begin
  Result := StrUtils.XorDecode(Key, Source);
end;

function GetCmdLineArg(const Switch: string; SwitchChars: TSysCharSet): string;
begin
  Result := StrUtils.GetCmdLineArg(Switch, SwitchChars);
end;

function Numb2USA(const S: string): string;
begin
  Result := StrUtils.Numb2USA(S);
end;

function Hex2Dec(const S: string): Longint;
begin
  Result := StrUtils.Hex2Dec(S);
end;

function Hex2Dec64(const S: string): int64;
begin
  Result := StrUtils.Hex2Dec64(S);
end;

function Dec2Numb(N: Longint; Len, Base: Byte): string;
begin
  Result := StrUtils.Dec2Numb(N, Len, Base);
end;

function Numb2Dec(S: string; Base: Byte): Longint;
begin
  Result := StrUtils.Numb2Dec(S, Base);
end;

function IntToBin(Value: Longint; Digits, Spaces: Integer): string;
begin
  Result := StrUtils.IntToBin(Value, Digits, Spaces);
end;

function IntToBin(Value: Longint; Digits: Integer): string;
begin
  Result := StrUtils.IntToBin(Value, Digits);
end;

function intToBin(Value: int64; Digits:integer): string;
begin
  Result := StrUtils.IntToBin(Value, Digits);
end;

function IntToRoman(Value: Longint): string;
begin
  Result := StrUtils.IntToRoman(Value);
end;

function TryRomanToInt(S: String; out N: LongInt; Strictness: TRomanConversionStrictness = rcsRelaxed): Boolean;
begin
  Result := StrUtils.TryRomanToInt(S, N, Strictness);
end;

function RomanToInt(const S: string; Strictness: TRomanConversionStrictness = rcsRelaxed): Longint;
begin
  Result := StrUtils.RomanToInt(S, Strictness);
end;

function RomanToIntDef(Const S : String; const ADefault: Longint = 0; Strictness: TRomanConversionStrictness = rcsRelaxed): Longint;
begin
  Result := StrUtils.RomanToIntDef(S, ADefault, Strictness);
end;

procedure BinToHex(const BinBuffer: TBytes; BinBufOffset: Integer; var HexBuffer: TBytes; HexBufOffset: Integer; Count: Integer);
begin
  StrUtils.BinToHex(BinBuffer, BinBufOffset, HexBuffer, HexBufOffset, Count);
end;

procedure BinToHex(BinValue: Pointer; HexValue: PWideChar; BinBufSize: Integer);
begin
  StrUtils.BinToHex(BinValue, HexValue, BinBufSize);
end;

procedure BinToHex(const BinValue; HexValue: PWideChar; BinBufSize: Integer);
begin
  StrUtils.BinToHex(BinValue, HexValue, BinBufSize);
end;

procedure BinToHex(BinValue: PAnsiChar; HexValue: PAnsiChar; BinBufSize: Integer);
begin
  StrUtils.BinToHex(BinValue, HexValue, BinBufSize);
end;

procedure BinToHex(BinValue: PAnsiChar; HexValue: PWideChar; BinBufSize: Integer);
begin
  StrUtils.BinToHex(BinValue, HexValue, BinBufSize);
end;

procedure BinToHex(const BinValue; HexValue: PAnsiChar; BinBufSize: Integer);
begin
  StrUtils.BinToHex(BinValue, HexValue, BinBufSize);
end;

procedure BinToHex(BinValue: Pointer; HexValue: PAnsiChar; BinBufSize: Integer);
begin
  StrUtils.BinToHex(BinValue, HexValue, BinBufSize);
end;

function HexToBin(HexValue, BinValue: PChar; BinBufSize: Integer): Integer;
begin
  Result := StrUtils.HexToBin(HexValue, BinValue, BinBufSize);
end;

function PosSet (const c:TSysCharSet;const s : ansistring ):SizeInt;
begin
  Result := StrUtils.PosSet(c, s);
end;

function PosSet (const c:string;const s : ansistring ):SizeInt;
begin
  Result := StrUtils.PosSet(c, s);
end;

function PosSetEx (const c:TSysCharSet;const s : ansistring;count:Integer ):SizeInt;
begin
  Result := StrUtils.PosSetEx(c, s, count);
end;

function PosSetEx (const c:string;const s : ansistring;count:Integer ):SizeInt;
begin
  Result := StrUtils.PosSetEx(c, s, count);
end;

Procedure Removeleadingchars(VAR S : AnsiString; Const CSet:TSysCharset);
begin
  StrUtils.Removeleadingchars(S, CSet);
end;

Procedure RemoveTrailingChars(VAR S : AnsiString;Const CSet:TSysCharset);
begin
  StrUtils.RemoveTrailingChars(S, CSet);
end;

Procedure RemovePadChars(VAR S : AnsiString;Const CSet:TSysCharset);
begin
  StrUtils.RemovePadChars(S, CSet);
end;

function TrimLeftSet(const S: String;const CSet:TSysCharSet): String;
begin
  Result := StrUtils.TrimLeftSet(S, CSet);
end;

Function TrimRightSet(const S: String;const CSet:TSysCharSet): String;
begin
  Result := StrUtils.TrimRightSet(S, CSet);
end;

function TrimSet(const S: String;const CSet:TSysCharSet): String;
begin
  Result := StrUtils.TrimSet(S, CSet);
end;

Function FindMatchesBoyerMooreCaseSensitive(const S,OldPattern: PChar; const SSize, OldPatternSize: SizeInt; out aMatches: SizeIntArray; const aMatchAll: Boolean) : Boolean;
begin
  Result := StrUtils.FindMatchesBoyerMooreCaseSensitive(S, OldPattern, SSize, OldPatternSize, aMatches, aMatchAll);
end;

Function FindMatchesBoyerMooreCaseSensitive(const S,OldPattern: String; out aMatches: SizeIntArray; const aMatchAll: Boolean) : Boolean;
begin
  Result := StrUtils.FindMatchesBoyerMooreCaseSensitive(S, OldPattern, aMatches, aMatchAll);
end;

Function FindMatchesBoyerMooreCaseInSensitive(const S, OldPattern: PChar; const SSize, OldPatternSize: SizeInt; out aMatches: SizeIntArray; const aMatchAll: Boolean) : Boolean;
begin
  Result := StrUtils.FindMatchesBoyerMooreCaseInSensitive(S, OldPattern, SSize, OldPatternSize, aMatches, aMatchAll);
end;

Function FindMatchesBoyerMooreCaseInSensitive(const S, OldPattern: String; out aMatches: SizeIntArray; const aMatchAll: Boolean) : Boolean;
begin
  Result := StrUtils.FindMatchesBoyerMooreCaseInSensitive(S, OldPattern, aMatches, aMatchAll);
end;

Function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags; out aCount : Integer; Algorithm : TStringReplaceAlgorithm = sraDefault): string;
begin
  Result := StrUtils.StringReplace(S, OldPattern, NewPattern, Flags, aCount, Algorithm);
end;

Function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags; Algorithm : TStringReplaceAlgorithm = sraDefault): string;
begin
  Result := StrUtils.StringReplace(S, OldPattern, NewPattern, Flags, Algorithm);
end;

Function StringReplace(const S, OldPattern, NewPattern: unicodestring; Flags: TReplaceFlags): unicodestring;
begin
  Result := StrUtils.StringReplace(S, OldPattern, NewPattern, Flags);
end;

Function StringReplace(const S, OldPattern, NewPattern: widestring; Flags: TReplaceFlags): widestring;
begin
  Result := StrUtils.StringReplace(S, OldPattern, NewPattern, Flags);
end;

Function SplitCommandLine(S : RawByteString) : TRawByteStringArray;
begin
  Result := StrUtils.SplitCommandLine(S);
end;

Function SplitCommandLine(S : UnicodeString) : TUnicodeStringArray;
begin
  Result := StrUtils.SplitCommandLine(S);
end;

function SErrAmountStrings: string;
begin
  Result := StrUtils.SErrAmountStrings;
end;

function SInvalidRomanNumeral: string;
begin
  Result := StrUtils.SInvalidRomanNumeral;
end;

end.
