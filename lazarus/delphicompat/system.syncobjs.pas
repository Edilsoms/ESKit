{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.SyncObjs
  Gerado por tools/genvclcompat.py a partir de SyncObjs.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.SyncObjs;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  SyncObjs;
type
  ESyncObjectException = SyncObjs.ESyncObjectException;
  ELockException = SyncObjs.ELockException;
  ELockRecursionException = SyncObjs.ELockRecursionException;
  TWaitResult = SyncObjs.TWaitResult;
  TSynchroObject = SyncObjs.TSynchroObject;
  TCriticalSection = SyncObjs.TCriticalSection;
  THandleObject = SyncObjs.THandleObject;
  TEventObject = SyncObjs.TEventObject;
  TSimpleEvent = SyncObjs.TSimpleEvent;
  PSecurityAttributes = SyncObjs.PSecurityAttributes;
  TEventHandle = SyncObjs.TEventHandle;
  TEvent = SyncObjs.TEvent;
const
  wrSignaled = SyncObjs.wrSignaled;
  wrTimeout = SyncObjs.wrTimeout;
  wrAbandoned = SyncObjs.wrAbandoned;
  wrError = SyncObjs.wrError;
  INFINITE = SyncObjs.INFINITE;


implementation


end.
