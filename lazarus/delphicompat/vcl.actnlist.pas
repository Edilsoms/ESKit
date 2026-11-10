{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.ActnList
  Gerado por tools/genvclcompat.py a partir de ActnList.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.ActnList;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Classes, ActnList;
type
{$if declared(TCustomActionList)}
  TCustomActionList = ActnList.TCustomActionList;
{$endif}
{$if declared(TContainedAction)}
  TContainedAction = ActnList.TContainedAction;
{$endif}
{$if declared(TContainedActionClass)}
  TContainedActionClass = ActnList.TContainedActionClass;
{$endif}
{$if declared(TActionListEnumerator)}
  TActionListEnumerator = ActnList.TActionListEnumerator;
{$endif}
{$if declared(TActionEvent)}
  TActionEvent = ActnList.TActionEvent;
{$endif}
{$if declared(TActionListState)}
  TActionListState = ActnList.TActionListState;
{$endif}
{$if declared(TActionList)}
  TActionList = ActnList.TActionList;
{$endif}
{$if declared(TShortCutList)}
  TShortCutList = ActnList.TShortCutList;
{$endif}
{$if declared(THintEvent)}
  THintEvent = ActnList.THintEvent;
{$endif}
{$if declared(TCustomAction)}
  TCustomAction = ActnList.TCustomAction;
{$endif}
{$if declared(TAction)}
  TAction = ActnList.TAction;
{$endif}
{$if declared(TActionLink)}
  TActionLink = ActnList.TActionLink;
{$endif}
{$if declared(TActionLinkClass)}
  TActionLinkClass = ActnList.TActionLinkClass;
{$endif}
{$if declared(TEnumActionProc)}
  TEnumActionProc = ActnList.TEnumActionProc;
{$endif}
const
{$if declared(asNormal)}
  asNormal = ActnList.asNormal;
{$endif}
{$if declared(asSuspended)}
  asSuspended = ActnList.asSuspended;
{$endif}
{$if declared(asSuspendedEnabled)}
  asSuspendedEnabled = ActnList.asSuspendedEnabled;
{$endif}
var
{$if declared(ApplicationActionComponent)}
  ApplicationActionComponent: TComponent absolute ActnList.ApplicationActionComponent;
{$endif}
{$if declared(RegisterActions)}
procedure RegisterActions(const CategoryName: string; const AClasses: array of TBasicActionClass; Resource: TComponentClass); inline;
{$endif}
{$if declared(UnRegisterActions)}
procedure UnRegisterActions(const AClasses: array of TBasicActionClass); inline;
{$endif}
{$if declared(EnumRegisteredActions)}
procedure EnumRegisteredActions(Proc: TEnumActionProc; Info: Pointer); inline;
{$endif}
{$if declared(CreateAction)}
function CreateAction(TheOwner: TComponent; ActionClass: TBasicActionClass): TBasicAction; inline;
{$endif}

implementation

{$if declared(RegisterActions)}
procedure RegisterActions(const CategoryName: string; const AClasses: array of TBasicActionClass; Resource: TComponentClass);
begin
  ActnList.RegisterActions(CategoryName, AClasses, Resource);
end;

{$endif}
{$if declared(UnRegisterActions)}
procedure UnRegisterActions(const AClasses: array of TBasicActionClass);
begin
  ActnList.UnRegisterActions(AClasses);
end;

{$endif}
{$if declared(EnumRegisteredActions)}
procedure EnumRegisteredActions(Proc: TEnumActionProc; Info: Pointer);
begin
  ActnList.EnumRegisteredActions(Proc, Info);
end;

{$endif}
{$if declared(CreateAction)}
function CreateAction(TheOwner: TComponent; ActionClass: TBasicActionClass): TBasicAction;
begin
  Result := ActnList.CreateAction(TheOwner, ActionClass);
end;

{$endif}
end.
