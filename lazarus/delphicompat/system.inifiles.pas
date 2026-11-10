{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.IniFiles
  Gerado por tools/genvclcompat.py a partir de IniFiles.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.IniFiles;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  IniFiles;
type
  TStringHash = IniFiles.TStringHash;
  THashedStringList = IniFiles.THashedStringList;
  TIniFileKey = IniFiles.TIniFileKey;
  TIniFileKeyList = IniFiles.TIniFileKeyList;
  TIniFileSection = IniFiles.TIniFileSection;
  TIniFileSectionList = IniFiles.TIniFileSectionList;
  TIniFileOption = IniFiles.TIniFileOption;
  TIniFileOptions = IniFiles.TIniFileOptions;
  TSectionValuesOption = IniFiles.TSectionValuesOption;
  TSectionValuesOptions = IniFiles.TSectionValuesOptions;
  TCustomIniFile = IniFiles.TCustomIniFile;
  TIniFile = IniFiles.TIniFile;
  TMemIniFile = IniFiles.TMemIniFile;
const
  ifoStripComments = IniFiles.ifoStripComments;
  ifoStripInvalid = IniFiles.ifoStripInvalid;
  ifoEscapeLineFeeds = IniFiles.ifoEscapeLineFeeds;
  ifoCaseSensitive = IniFiles.ifoCaseSensitive;
  ifoStripQuotes = IniFiles.ifoStripQuotes;
  ifoFormatSettingsActive = IniFiles.ifoFormatSettingsActive;
  ifoWriteStringBoolean = IniFiles.ifoWriteStringBoolean;
  svoIncludeComments = IniFiles.svoIncludeComments;
  svoIncludeInvalid = IniFiles.svoIncludeInvalid;
  svoIncludeQuotes = IniFiles.svoIncludeQuotes;


implementation


end.
