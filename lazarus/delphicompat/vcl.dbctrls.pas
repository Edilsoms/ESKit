{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.DBCtrls
  Gerado por tools/genvclcompat.py a partir de DBCtrls.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.DBCtrls;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  DB, Controls, DBCtrls;
type
{$if declared(TFieldDataLink)}
  TFieldDataLink = DBCtrls.TFieldDataLink;
{$endif}
{$if declared(TDBLookup)}
  TDBLookup = DBCtrls.TDBLookup;
{$endif}
{$if declared(TDBEdit)}
  TDBEdit = DBCtrls.TDBEdit;
{$endif}
{$if declared(TDBText)}
  TDBText = DBCtrls.TDBText;
{$endif}
{$if declared(TCustomDBListBox)}
  TCustomDBListBox = DBCtrls.TCustomDBListBox;
{$endif}
{$if declared(TDBListBox)}
  TDBListBox = DBCtrls.TDBListBox;
{$endif}
{$if declared(TDBLookupListBox)}
  TDBLookupListBox = DBCtrls.TDBLookupListBox;
{$endif}
{$if declared(TDBRadioGroup)}
  TDBRadioGroup = DBCtrls.TDBRadioGroup;
{$endif}
{$if declared(TDBCheckBox)}
  TDBCheckBox = DBCtrls.TDBCheckBox;
{$endif}
{$if declared(TCustomDBComboBox)}
  TCustomDBComboBox = DBCtrls.TCustomDBComboBox;
{$endif}
{$if declared(TDBComboBox)}
  TDBComboBox = DBCtrls.TDBComboBox;
{$endif}
{$if declared(TDBLookupComboBox)}
  TDBLookupComboBox = DBCtrls.TDBLookupComboBox;
{$endif}
{$if declared(TDBMemo)}
  TDBMemo = DBCtrls.TDBMemo;
{$endif}
{$if declared(TDBGroupBox)}
  TDBGroupBox = DBCtrls.TDBGroupBox;
{$endif}
{$if declared(TOnDBImageRead)}
  TOnDBImageRead = DBCtrls.TOnDBImageRead;
{$endif}
{$if declared(TOnDBImageWrite)}
  TOnDBImageWrite = DBCtrls.TOnDBImageWrite;
{$endif}
{$if declared(TDBImage)}
  TDBImage = DBCtrls.TDBImage;
{$endif}
{$if declared(TDBCalendar)}
  TDBCalendar = DBCtrls.TDBCalendar;
{$endif}
{$if declared(TDBNavButton)}
  TDBNavButton = DBCtrls.TDBNavButton;
{$endif}
{$if declared(TDBNavFocusableButton)}
  TDBNavFocusableButton = DBCtrls.TDBNavFocusableButton;
{$endif}
{$if declared(TDBNavDataLink)}
  TDBNavDataLink = DBCtrls.TDBNavDataLink;
{$endif}
{$if declared(TDBNavGlyph)}
  TDBNavGlyph = DBCtrls.TDBNavGlyph;
{$endif}
{$if declared(TDBNavButtonType)}
  TDBNavButtonType = DBCtrls.TDBNavButtonType;
{$endif}
{$if declared(TDBNavButtonSet)}
  TDBNavButtonSet = DBCtrls.TDBNavButtonSet;
{$endif}
{$if declared(TDBNavButtonStyle)}
  TDBNavButtonStyle = DBCtrls.TDBNavButtonStyle;
{$endif}
{$if declared(TDBNavButtonDirection)}
  TDBNavButtonDirection = DBCtrls.TDBNavButtonDirection;
{$endif}
{$if declared(TDBNavigatorOption)}
  TDBNavigatorOption = DBCtrls.TDBNavigatorOption;
{$endif}
{$if declared(TDBNavigatorOptions)}
  TDBNavigatorOptions = DBCtrls.TDBNavigatorOptions;
{$endif}
{$if declared(TDBNavClickEvent)}
  TDBNavClickEvent = DBCtrls.TDBNavClickEvent;
{$endif}
{$if declared(TDBCustomNavigator)}
  TDBCustomNavigator = DBCtrls.TDBCustomNavigator;
{$endif}
{$if declared(TDBNavigator)}
  TDBNavigator = DBCtrls.TDBNavigator;
{$endif}
{$if declared(TNavigateBtn)}
  TNavigateBtn = DBCtrls.TNavigateBtn;
{$endif}
const
{$if declared(ngEnabled)}
  ngEnabled = DBCtrls.ngEnabled;
{$endif}
{$if declared(ngDisabled)}
  ngDisabled = DBCtrls.ngDisabled;
{$endif}
{$if declared(nbFirst)}
  nbFirst = DBCtrls.nbFirst;
{$endif}
{$if declared(nbPrior)}
  nbPrior = DBCtrls.nbPrior;
{$endif}
{$if declared(nbNext)}
  nbNext = DBCtrls.nbNext;
{$endif}
{$if declared(nbLast)}
  nbLast = DBCtrls.nbLast;
{$endif}
{$if declared(nbInsert)}
  nbInsert = DBCtrls.nbInsert;
{$endif}
{$if declared(nbDelete)}
  nbDelete = DBCtrls.nbDelete;
{$endif}
{$if declared(nbEdit)}
  nbEdit = DBCtrls.nbEdit;
{$endif}
{$if declared(nbPost)}
  nbPost = DBCtrls.nbPost;
{$endif}
{$if declared(nbCancel)}
  nbCancel = DBCtrls.nbCancel;
{$endif}
{$if declared(nbRefresh)}
  nbRefresh = DBCtrls.nbRefresh;
{$endif}
{$if declared(nbdHorizontal)}
  nbdHorizontal = DBCtrls.nbdHorizontal;
{$endif}
{$if declared(nbdVertical)}
  nbdVertical = DBCtrls.nbdVertical;
{$endif}
{$if declared(navFocusableButtons)}
  navFocusableButtons = DBCtrls.navFocusableButtons;
{$endif}
{$if declared(DefaultDBNavigatorButtons)}
  DefaultDBNavigatorButtons = DBCtrls.DefaultDBNavigatorButtons;
{$endif}
{$if declared(ChangeDataSource)}
procedure ChangeDataSource(AControl: TControl; Link: TDataLink; NewDataSource: TDataSource); inline;
{$endif}

implementation

{$if declared(ChangeDataSource)}
procedure ChangeDataSource(AControl: TControl; Link: TDataLink; NewDataSource: TDataSource);
begin
  DBCtrls.ChangeDataSource(AControl, Link, NewDataSource);
end;

{$endif}
end.
