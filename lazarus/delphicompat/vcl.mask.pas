{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.Mask
  Gerado por tools/genvclcompat.py a partir de MaskEdit.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.Mask;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  MaskEdit;
type
{$if declared(tMaskedType)}
  tMaskedType = MaskEdit.tMaskedType;
{$endif}
{$if declared(TIntMaskRec)}
  TIntMaskRec = MaskEdit.TIntMaskRec;
{$endif}
{$if declared(TInternalMask)}
  TInternalMask = MaskEdit.TInternalMask;
{$endif}
{$if declared(TMaskeditTrimType)}
  TMaskeditTrimType = MaskEdit.TMaskeditTrimType;
{$endif}
{$if declared(TMaskEditValidationErrorMode)}
  TMaskEditValidationErrorMode = MaskEdit.TMaskEditValidationErrorMode;
{$endif}
{$if declared(EDBEditError)}
  EDBEditError = MaskEdit.EDBEditError;
{$endif}
{$if declared(EInvalidEditMask)}
  EInvalidEditMask = MaskEdit.EInvalidEditMask;
{$endif}
{$if declared(EInvalidUtf8)}
  EInvalidUtf8 = MaskEdit.EInvalidUtf8;
{$endif}
{$if declared(EInvalidCodePoint)}
  EInvalidCodePoint = MaskEdit.EInvalidCodePoint;
{$endif}
{$if declared(TCustomMaskEdit)}
  TCustomMaskEdit = MaskEdit.TCustomMaskEdit;
{$endif}
{$if declared(TMaskEdit)}
  TMaskEdit = MaskEdit.TMaskEdit;
{$endif}
const
{$if declared(Char_Invalid)}
  Char_Invalid = MaskEdit.Char_Invalid;
{$endif}
{$if declared(Char_IsLiteral)}
  Char_IsLiteral = MaskEdit.Char_IsLiteral;
{$endif}
{$if declared(Char_Number)}
  Char_Number = MaskEdit.Char_Number;
{$endif}
{$if declared(Char_NumberFixed)}
  Char_NumberFixed = MaskEdit.Char_NumberFixed;
{$endif}
{$if declared(Char_NumberPlusMin)}
  Char_NumberPlusMin = MaskEdit.Char_NumberPlusMin;
{$endif}
{$if declared(Char_Letter)}
  Char_Letter = MaskEdit.Char_Letter;
{$endif}
{$if declared(Char_LetterFixed)}
  Char_LetterFixed = MaskEdit.Char_LetterFixed;
{$endif}
{$if declared(Char_LetterUpCase)}
  Char_LetterUpCase = MaskEdit.Char_LetterUpCase;
{$endif}
{$if declared(Char_LetterDownCase)}
  Char_LetterDownCase = MaskEdit.Char_LetterDownCase;
{$endif}
{$if declared(Char_LetterFixedUpCase)}
  Char_LetterFixedUpCase = MaskEdit.Char_LetterFixedUpCase;
{$endif}
{$if declared(Char_LetterFixedDownCase)}
  Char_LetterFixedDownCase = MaskEdit.Char_LetterFixedDownCase;
{$endif}
{$if declared(Char_AlphaNum)}
  Char_AlphaNum = MaskEdit.Char_AlphaNum;
{$endif}
{$if declared(Char_AlphaNumFixed)}
  Char_AlphaNumFixed = MaskEdit.Char_AlphaNumFixed;
{$endif}
{$if declared(Char_AlphaNumUpCase)}
  Char_AlphaNumUpCase = MaskEdit.Char_AlphaNumUpCase;
{$endif}
{$if declared(Char_AlphaNumDownCase)}
  Char_AlphaNumDownCase = MaskEdit.Char_AlphaNumDownCase;
{$endif}
{$if declared(Char_AlphaNumFixedUpCase)}
  Char_AlphaNumFixedUpCase = MaskEdit.Char_AlphaNumFixedUpCase;
{$endif}
{$if declared(Char_AlphaNumFixedDownCase)}
  Char_AlphaNumFixedDownCase = MaskEdit.Char_AlphaNumFixedDownCase;
{$endif}
{$if declared(Char_All)}
  Char_All = MaskEdit.Char_All;
{$endif}
{$if declared(Char_AllFixed)}
  Char_AllFixed = MaskEdit.Char_AllFixed;
{$endif}
{$if declared(Char_AllUpCase)}
  Char_AllUpCase = MaskEdit.Char_AllUpCase;
{$endif}
{$if declared(Char_AllDownCase)}
  Char_AllDownCase = MaskEdit.Char_AllDownCase;
{$endif}
{$if declared(Char_AllFixedUpCase)}
  Char_AllFixedUpCase = MaskEdit.Char_AllFixedUpCase;
{$endif}
{$if declared(Char_AllFixedDownCase)}
  Char_AllFixedDownCase = MaskEdit.Char_AllFixedDownCase;
{$endif}
{$if declared(Char_HourSeparator)}
  Char_HourSeparator = MaskEdit.Char_HourSeparator;
{$endif}
{$if declared(Char_DateSeparator)}
  Char_DateSeparator = MaskEdit.Char_DateSeparator;
{$endif}
{$if declared(Char_Hex)}
  Char_Hex = MaskEdit.Char_Hex;
{$endif}
{$if declared(Char_HexFixed)}
  Char_HexFixed = MaskEdit.Char_HexFixed;
{$endif}
{$if declared(Char_HexUpCase)}
  Char_HexUpCase = MaskEdit.Char_HexUpCase;
{$endif}
{$if declared(Char_HexDownCase)}
  Char_HexDownCase = MaskEdit.Char_HexDownCase;
{$endif}
{$if declared(Char_HexFixedUpCase)}
  Char_HexFixedUpCase = MaskEdit.Char_HexFixedUpCase;
{$endif}
{$if declared(Char_HexFixedDownCase)}
  Char_HexFixedDownCase = MaskEdit.Char_HexFixedDownCase;
{$endif}
{$if declared(Char_Binary)}
  Char_Binary = MaskEdit.Char_Binary;
{$endif}
{$if declared(Char_BinaryFixed)}
  Char_BinaryFixed = MaskEdit.Char_BinaryFixed;
{$endif}
{$if declared(Char_Set)}
  Char_Set = MaskEdit.Char_Set;
{$endif}
{$if declared(Char_SetFixed)}
  Char_SetFixed = MaskEdit.Char_SetFixed;
{$endif}
{$if declared(Char_SetNegateFixed)}
  Char_SetNegateFixed = MaskEdit.Char_SetNegateFixed;
{$endif}
{$if declared(metTrimLeft)}
  metTrimLeft = MaskEdit.metTrimLeft;
{$endif}
{$if declared(metTrimRight)}
  metTrimRight = MaskEdit.metTrimRight;
{$endif}
{$if declared(mvemException)}
  mvemException = MaskEdit.mvemException;
{$endif}
{$if declared(mvemEvent)}
  mvemEvent = MaskEdit.mvemEvent;
{$endif}
{$if declared(cMask_SpecialChar)}
  cMask_SpecialChar = MaskEdit.cMask_SpecialChar;
{$endif}
{$if declared(cMask_UpperCase)}
  cMask_UpperCase = MaskEdit.cMask_UpperCase;
{$endif}
{$if declared(cMask_LowerCase)}
  cMask_LowerCase = MaskEdit.cMask_LowerCase;
{$endif}
{$if declared(cMask_Letter)}
  cMask_Letter = MaskEdit.cMask_Letter;
{$endif}
{$if declared(cMask_LetterFixed)}
  cMask_LetterFixed = MaskEdit.cMask_LetterFixed;
{$endif}
{$if declared(cMask_AlphaNum)}
  cMask_AlphaNum = MaskEdit.cMask_AlphaNum;
{$endif}
{$if declared(cMask_AlphaNumFixed)}
  cMask_AlphaNumFixed = MaskEdit.cMask_AlphaNumFixed;
{$endif}
{$if declared(cMask_AllChars)}
  cMask_AllChars = MaskEdit.cMask_AllChars;
{$endif}
{$if declared(cMask_AllCharsFixed)}
  cMask_AllCharsFixed = MaskEdit.cMask_AllCharsFixed;
{$endif}
{$if declared(cMask_Number)}
  cMask_Number = MaskEdit.cMask_Number;
{$endif}
{$if declared(cMask_NumberFixed)}
  cMask_NumberFixed = MaskEdit.cMask_NumberFixed;
{$endif}
{$if declared(cMask_NumberPlusMin)}
  cMask_NumberPlusMin = MaskEdit.cMask_NumberPlusMin;
{$endif}
{$if declared(cMask_HourSeparator)}
  cMask_HourSeparator = MaskEdit.cMask_HourSeparator;
{$endif}
{$if declared(cMask_DateSeparator)}
  cMask_DateSeparator = MaskEdit.cMask_DateSeparator;
{$endif}
{$if declared(cMask_Hex)}
  cMask_Hex = MaskEdit.cMask_Hex;
{$endif}
{$if declared(cMask_HexFixed)}
  cMask_HexFixed = MaskEdit.cMask_HexFixed;
{$endif}
{$if declared(cMask_Binary)}
  cMask_Binary = MaskEdit.cMask_Binary;
{$endif}
{$if declared(cMask_BinaryFixed)}
  cMask_BinaryFixed = MaskEdit.cMask_BinaryFixed;
{$endif}
{$if declared(cMask_NoLeadingBlanks)}
  cMask_NoLeadingBlanks = MaskEdit.cMask_NoLeadingBlanks;
{$endif}
{$if declared(cMask_SetStart)}
  cMask_SetStart = MaskEdit.cMask_SetStart;
{$endif}
{$if declared(cMask_SetEnd)}
  cMask_SetEnd = MaskEdit.cMask_SetEnd;
{$endif}
{$if declared(cMask_SetNegate)}
  cMask_SetNegate = MaskEdit.cMask_SetNegate;
{$endif}
{$if declared(cMask_SetOptional)}
  cMask_SetOptional = MaskEdit.cMask_SetOptional;
{$endif}
{$if declared(cMask_SetRange)}
  cMask_SetRange = MaskEdit.cMask_SetRange;
{$endif}
{$if declared(SInvalidCodePoint)}
  SInvalidCodePoint = MaskEdit.SInvalidCodePoint;
{$endif}
{$if declared(SIndexOutOfRangeForFMask)}
  SIndexOutOfRangeForFMask = MaskEdit.SIndexOutOfRangeForFMask;
{$endif}
{$if declared(SFoundChar_Invalid)}
  SFoundChar_Invalid = MaskEdit.SFoundChar_Invalid;
{$endif}
{$if declared(SUnclosedSet)}
  SUnclosedSet = MaskEdit.SUnclosedSet;
{$endif}
{$if declared(SIllegalCharInSet)}
  SIllegalCharInSet = MaskEdit.SIllegalCharInSet;
{$endif}
{$if declared(SEmptySet)}
  SEmptySet = MaskEdit.SEmptySet;
{$endif}
{$if declared(SIllegalRangeChar)}
  SIllegalRangeChar = MaskEdit.SIllegalRangeChar;
{$endif}
var
{$if declared(DefaultBlank)}
  DefaultBlank: Char absolute MaskEdit.DefaultBlank;
{$endif}
{$if declared(MaskFieldSeparator)}
  MaskFieldSeparator: Char absolute MaskEdit.MaskFieldSeparator;
{$endif}
{$if declared(MaskNoSave)}
  MaskNoSave: Char absolute MaskEdit.MaskNoSave;
{$endif}
{$if declared(FormatMaskText)}
function FormatMaskText(const AEditMask: string; const Value: string; EnableSets: Boolean = False): string; inline;
{$endif}
{$if declared(SplitEditMask)}
procedure SplitEditMask(AEditMask: String; out AMaskPart: String; out AMaskSave: Boolean; out ASpaceChar: Char); inline;
{$endif}

implementation

{$if declared(FormatMaskText)}
function FormatMaskText(const AEditMask: string; const Value: string; EnableSets: Boolean = False): string;
begin
  Result := MaskEdit.FormatMaskText(AEditMask, Value, EnableSets);
end;

{$endif}
{$if declared(SplitEditMask)}
procedure SplitEditMask(AEditMask: String; out AMaskPart: String; out AMaskSave: Boolean; out ASpaceChar: Char);
begin
  MaskEdit.SplitEditMask(AEditMask, AMaskPart, AMaskSave, ASpaceChar);
end;

{$endif}
end.
