{
 *****************************************************************************
  ESKit - esdb.pas
  Componentes de acesso a banco de dados inspirados no FireDAC do Delphi,
  construídos sobre o SQLDB do Free Pascal (fcl-db).

    TEsConnection   ~ TFDConnection   (TSQLConnector + DriverID estilo FireDAC
                                       + transação interna automática)
    TEsTransaction  ~ TFDTransaction  (TSQLTransaction)
    TEsQuery        ~ TFDQuery        (TSQLQuery; Post/Delete gravam e fazem
                                       commit automaticamente, como no FireDAC)
    TEsTable        ~ TFDTable        (TEsQuery com TableName)
    TEsCommand      ~ TFDCommand      (executa SQL sem retorno de dados)
    TEsMemTable     ~ TFDMemTable     (dataset em memória - TBufDataset)

  Drivers (DriverID): SQLite, PG, FB/IB, MySQL, MSSQL, Sybase, Ora, ODBC.
  As bibliotecas cliente (sqlite3.dll, libpq.dll, fbclient.dll,
  libmysql.dll, oci.dll...) são carregadas dinamicamente somente ao conectar.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsDB;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Variants, DB, BufDataset, SQLDB,
  // drivers registrados no TSQLConnector (carregamento dinâmico)
  SQLite3Conn, PQConnection, IBConnection, MySQL80Conn, MSSQLConn, ODBCConn,
  OracleConnection;

type
  EEsDBError = class(EDatabaseError);

var
  { biblioteca cliente do Oracle (caminho completo ou nome); vazio = padrão:
    oci.dll no Windows (pelo PATH), libclntsh.so no Linux. Defina antes da
    primeira conexão (ou use EsSetOracleVendorLib, da unit EsDBOracle). }
  EsOracleVendorLib: string = '';

type

  { TEsConnection }

  TEsConnection = class(TSQLConnector)
  private
    FDefaultTransaction: TSQLTransaction;
    FOnConnected: TNotifyEvent;
    FOnDisconnected: TNotifyEvent;
    FStorePassword: Boolean;
    FExplicitTx: Boolean;
    FHoldCount: Integer;
    function GetDriverID: string;
    procedure SetDriverID(const AValue: string);
    function GetActiveTransaction: TSQLTransaction;
    function NewCommand(const ASQL: string): TSQLQuery;
    function DoExecSQL(Q: TSQLQuery): Integer;
    function DoExecSQLScalar(Q: TSQLQuery): Variant;
    function IsPasswordStored: Boolean;
  protected
    procedure DoInternalConnect; override;
    procedure DoInternalDisconnect; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { estilo FireDAC }
    function ExecSQL(const ASQL: string): Integer; overload;
    function ExecSQL(const ASQL: string; const AParams: array of Variant): Integer; overload;
    function ExecSQLScalar(const ASQL: string): Variant; overload;
    function ExecSQLScalar(const ASQL: string; const AParams: array of Variant): Variant; overload;
    { parâmetros por nome: ExecSQL('... where id = :id', ['id'], [10]) }
    function ExecSQL(const ASQL: string; const ANames: array of string;
      const AValues: array of Variant): Integer; overload;
    function ExecSQLScalar(const ASQL: string; const ANames: array of string;
      const AValues: array of Variant): Variant; overload;
    { uso interno de TEsQuery: commit automático depois de uma gravação e
      transações de leitura mantidas abertas para busca sob demanda }
    procedure FinishAutoWrite(ATransaction: TSQLTransaction; AWasActive: Boolean);
    procedure HoldAutoTransaction;
    procedure ReleaseAutoTransaction(ATransaction: TSQLTransaction);
    procedure StartTransaction; override;
    procedure EndTransaction; override;
    procedure Commit; overload;
    procedure Rollback; overload;
    function InTransaction: Boolean;
    class procedure GetDriverIDs(AList: TStrings);
    { Transaction quando atribuída; senão a transação interna da conexão. }
    property ActiveTransaction: TSQLTransaction read GetActiveTransaction;
  published
    { SQLite, PG, FB, IB, MySQL, MSSQL, Sybase, ODBC (ou o nome SQLDB do driver) }
    property DriverID: string read GetDriverID write SetDriverID;
    property ConnectorType stored False;
    { False (padrão): a senha não é gravada no .lfm - defina-a em código
      (ou em OnLogin). True: grava, como o TSQLConnector. }
    property StorePassword: Boolean read FStorePassword write FStorePassword default False;
    property Password stored IsPasswordStored;
    property OnConnected: TNotifyEvent read FOnConnected write FOnConnected;
    property OnDisconnected: TNotifyEvent read FOnDisconnected write FOnDisconnected;
  end;

  { Compatibilidade: nome usado na primeira versão desta unit. }
  TEsDatabase = TEsConnection;

  { TEsTransaction }

  TEsTransaction = class(TSQLTransaction)
  private
    function GetConnection: TEsConnection;
    procedure SetConnection(AValue: TEsConnection);
  public
    property Connection: TEsConnection read GetConnection write SetConnection;
  end;

  { TEsQuery }

  TEsQuery = class(TSQLQuery)
  private
    FCachedUpdates: Boolean;
    FAutoCommit: Boolean;
    FAutoStarted: Boolean;
    FFetchAll: Boolean;
    FHolding: Boolean;
    function GetConnection: TEsConnection;
    procedure SetConnection(AValue: TEsConnection);
    procedure SetCachedUpdates(AValue: Boolean);
    procedure SetFetchAll(AValue: Boolean);
    procedure FinishWrite(AWasActive: Boolean);
    function IsTransactionStored: Boolean;
    function IsOptionsStored: Boolean;
    procedure EnsureTransaction;
  protected
    procedure DoBeforeOpen; override;
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
    procedure DoBeforeRefresh; override;
    procedure DoAfterRefresh; override;
    procedure EndAutoRead;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExecSQL; overload; override;
    procedure ApplyUpdates(MaxErrors: Integer); overload; override;
    function ExecSQL(const ASQL: string): Integer; overload;
    function ExecSQL(const ASQL: string; const AParams: array of Variant): Integer; overload;
    procedure Open; overload;
    procedure Open(const ASQL: string); overload;
    procedure Open(const ASQL: string; const AParams: array of Variant); overload;
    { parâmetros por nome }
    function ExecSQL(const ASQL: string; const ANames: array of string;
      const AValues: array of Variant): Integer; overload;
    procedure Open(const ASQL: string; const ANames: array of string;
      const AValues: array of Variant); overload;
    { grava as alterações pendentes (CachedUpdates) e faz commit }
    procedure ApplyAndCommit;
  published
    property Connection: TEsConnection read GetConnection write SetConnection stored False;
    property Transaction stored IsTransactionStored;
    { False (padrão, como no FireDAC): Post/Delete gravam no banco na hora. }
    property CachedUpdates: Boolean read FCachedUpdates write SetCachedUpdates default False;
    { True (padrão): ExecSQL, Open e ApplyUpdates fora de uma transação
      explícita fazem commit sozinhos. }
    property AutoCommit: Boolean read FAutoCommit write FAutoCommit default True;
    { True (padrão): com AutoCommit, a leitura traz todos os registros e encerra
      a transação na abertura. False: busca sob demanda (PacketRecords por vez);
      a transação de leitura fica aberta até o dataset ser fechado - gravações
      automáticas nesse meio tempo usam CommitRetaining. }
    property FetchAll: Boolean read FFetchAll write SetFetchAll default True;
    property Options stored IsOptionsStored;
  end;

  { TEsTable }

  TEsTable = class(TEsQuery)
  private
    FTableName: string;
    procedure SetTableName(const AValue: string);
    function IsSQLStored: Boolean;
  published
    property TableName: string read FTableName write SetTableName;
    property SQL stored IsSQLStored;
  end;

  { TEsCommand }

  TEsCommand = class(TComponent)
  private
    FConnection: TEsConnection;
    FTransaction: TSQLTransaction;
    FCommandText: TStringList;
    FParams: TParams;
    FRowsAffected: Integer;
    FBeforeExecute: TNotifyEvent;
    FAfterExecute: TNotifyEvent;
    procedure SetConnection(AValue: TEsConnection);
    procedure SetTransaction(AValue: TSQLTransaction);
    function GetCommandText: TStrings;
    procedure SetCommandText(AValue: TStrings);
    procedure SetParams(AValue: TParams);
    procedure CommandTextChanged(Sender: TObject);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { executa o comando e devolve o número de linhas afetadas }
    function Execute: Integer;
    function ParamByName(const AName: string): TParam;
    property RowsAffected: Integer read FRowsAffected;
  published
    property Connection: TEsConnection read FConnection write SetConnection;
    property Transaction: TSQLTransaction read FTransaction write SetTransaction;
    property CommandText: TStrings read GetCommandText write SetCommandText;
    property Params: TParams read FParams write SetParams;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
  end;

  { TEsMemTable }

  TEsMemTable = class(TBufDataset)
  public
    { copia estrutura e registros de outro dataset }
    procedure CopyDataSet(ASource: TDataSet; AWithData: Boolean = True);
  end;

  { Compatibilidade: nome usado na primeira versão desta unit. }
  TEsDataSet = TEsMemTable;

function EsDriverIDToConnectorType(const ADriverID: string): string;
function EsConnectorTypeToDriverID(const AConnectorType: string): string;

implementation

uses
  DynLibs; // SharedSuffix

resourcestring
  SEsNoDriver = 'DriverID não definido em "%s". Use SQLite, PG, FB, MySQL, MSSQL, Ora ou ODBC.';
  SEsClientLib = 'Não foi possível carregar a biblioteca cliente do banco (DriverID %s). '
    + 'Instale o cliente do banco ou informe o caminho da biblioteca. Detalhe: %s';
  SEsUnknownDriver = 'DriverID "%s" desconhecido.';
  SEsNoConnection = '"%s" não tem Connection atribuída.';
  SEsNoSQL = '"%s" não tem CommandText.';

const
  DriverMap: array[0..8, 0..1] of string = (
    ('SQLite', 'SQLite3'),
    ('PG', 'PostgreSQL'),
    ('FB', 'Firebird'),
    ('IB', 'Firebird'),
    ('MySQL', 'MySQL 8.0'),
    ('MSSQL', 'MSSQLServer'),
    ('Sybase', 'Sybase'),
    ('Ora', 'Oracle'),
    ('ODBC', 'ODBC'));

var
  OracleLibHeld: Boolean = False;

{ carrega a OCI pelo caminho escolhido antes que o conector a carregue pelo
  nome padrão (o conector reaproveita a biblioteca já carregada) }
procedure LoadOracleClient;
var
  Lib: string;
begin
  if OracleLibHeld or (TOracleConnectionDef.LoadedLibraryName <> '') then
    Exit;
  Lib := EsOracleVendorLib;
  {$IFDEF UNIX}
  // o padrão do FPC (libociei) é só o arquivo de dados do Instant Client
  if Lib = '' then
    Lib := 'libclntsh.' + SharedSuffix;
  {$ENDIF}
  if Lib = '' then
    Exit; // Windows: oci.dll pelo PATH, carregada pelo próprio conector
  try
    TOracleConnectionDef.LoadFunction()(Lib);
  except
    on E: EInOutError do
      raise EEsDBError.CreateFmt(SEsClientLib, ['Ora', E.Message]);
  end;
  OracleLibHeld := True;
end;

const

  // o commit automático é feito pelos próprios componentes (ver AutoCommit),
  // para nunca encerrar uma transação aberta explicitamente pelo usuário
  DefaultQueryOptions = [sqoKeepOpenOnCommit, sqoAutoApplyUpdates];

function EsDriverIDToConnectorType(const ADriverID: string): string;
var
  I: Integer;
begin
  for I := Low(DriverMap) to High(DriverMap) do
    if SameText(ADriverID, DriverMap[I, 0]) then
      Exit(DriverMap[I, 1]);
  Result := ADriverID; // já é um nome SQLDB (ex.: 'MySQL 5.7')
end;

function EsConnectorTypeToDriverID(const AConnectorType: string): string;
var
  I: Integer;
begin
  for I := Low(DriverMap) to High(DriverMap) do
    if SameText(AConnectorType, DriverMap[I, 1]) then
      Exit(DriverMap[I, 0]);
  Result := AConnectorType;
end;

{ por posição: na ordem em que cada nome aparece pela primeira vez no SQL
  (um nome repetido é um único parâmetro) }
procedure AssignParamValues(AParams: TParams; const AValues: array of Variant);
var
  I: Integer;
begin
  if Length(AValues) > AParams.Count then
    raise EEsDBError.CreateFmt('%d valores para %d parâmetros', [Length(AValues), AParams.Count]);
  for I := 0 to High(AValues) do
    AParams[I].Value := AValues[I];
end;

procedure AssignNamedParams(AParams: TParams; const ANames: array of string;
  const AValues: array of Variant);
var
  I: Integer;
begin
  if Length(ANames) <> Length(AValues) then
    raise EEsDBError.Create('a quantidade de nomes e de valores dos parâmetros difere');
  for I := 0 to High(ANames) do
    AParams.ParamByName(ANames[I]).Value := AValues[I];
end;

{ TEsConnection }

constructor TEsConnection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  LoginPrompt := False;
  FDefaultTransaction := TSQLTransaction.Create(Self);
  FDefaultTransaction.DataBase := Self;
end;

destructor TEsConnection.Destroy;
begin
  Connected := False;
  inherited Destroy; // libera FDefaultTransaction (owned)
end;

function TEsConnection.GetDriverID: string;
begin
  Result := EsConnectorTypeToDriverID(ConnectorType);
end;

procedure TEsConnection.SetDriverID(const AValue: string);
var
  CT: string;
begin
  CT := EsDriverIDToConnectorType(Trim(AValue));
  if (CT <> '') and (GetConnectionDef(CT) = nil) then
    raise EEsDBError.CreateFmt(SEsUnknownDriver, [AValue]);
  ConnectorType := CT;
end;

function TEsConnection.GetActiveTransaction: TSQLTransaction;
begin
  if Assigned(Transaction) then
    Result := Transaction
  else
    Result := FDefaultTransaction;
end;

procedure TEsConnection.DoInternalConnect;
begin
  if ConnectorType = '' then
    raise EEsDBError.CreateFmt(SEsNoDriver, [Name]);
  if SameText(ConnectorType, 'Oracle') then
    LoadOracleClient;
  try
    inherited DoInternalConnect;
  except
    // biblioteca cliente ausente: mensagem clara em vez de 'Can not load...'
    on E: EInOutError do
      raise EEsDBError.CreateFmt(SEsClientLib, [DriverID, E.Message]);
  end;
  if Assigned(FOnConnected) then
    FOnConnected(Self);
end;

procedure TEsConnection.DoInternalDisconnect;
begin
  inherited DoInternalDisconnect;
  if Assigned(FOnDisconnected) then
    FOnDisconnected(Self);
end;

function TEsConnection.IsPasswordStored: Boolean;
begin
  Result := FStorePassword and (Password <> '');
end;

function TEsConnection.NewCommand(const ASQL: string): TSQLQuery;
begin
  Result := TSQLQuery.Create(nil);
  try
    Result.DataBase := Self;
    Result.Transaction := ActiveTransaction;
    Result.Options := [sqoKeepOpenOnCommit];
    Result.SQL.Text := ASQL;
  except
    Result.Free;
    raise;
  end;
end;

procedure TEsConnection.FinishAutoWrite(ATransaction: TSQLTransaction; AWasActive: Boolean);
begin
  if (ATransaction = nil) or not ATransaction.Active or FExplicitTx then Exit;
  if not AWasActive then
    ATransaction.Commit // transação automática
  else if FHoldCount > 0 then
    // a transação só estava aberta por leituras sob demanda: grava sem
    // fechar os cursores
    ATransaction.CommitRetaining;
end;

procedure TEsConnection.HoldAutoTransaction;
begin
  Inc(FHoldCount);
end;

procedure TEsConnection.ReleaseAutoTransaction(ATransaction: TSQLTransaction);
begin
  if FHoldCount > 0 then Dec(FHoldCount);
  if (FHoldCount = 0) and not FExplicitTx and (ATransaction <> nil) and ATransaction.Active then
    ATransaction.Commit;
end;

function TEsConnection.DoExecSQL(Q: TSQLQuery): Integer;
var
  WasActive: Boolean;
begin
  try
    WasActive := ActiveTransaction.Active;
    Q.ExecSQL;
    Result := Q.RowsAffected;
    FinishAutoWrite(ActiveTransaction, WasActive);
  finally
    Q.Free;
  end;
end;

function TEsConnection.DoExecSQLScalar(Q: TSQLQuery): Variant;
var
  WasActive: Boolean;
begin
  try
    WasActive := ActiveTransaction.Active;
    Q.Open;
    if Q.IsEmpty or (Q.FieldCount = 0) then
      Result := Null
    else
      Result := Q.Fields[0].Value;
    Q.Close;
    if not WasActive and not FExplicitTx and ActiveTransaction.Active then
      ActiveTransaction.Commit; // leitura em transação automática
  finally
    Q.Free;
  end;
end;

function TEsConnection.ExecSQL(const ASQL: string): Integer;
begin
  Result := DoExecSQL(NewCommand(ASQL));
end;

function TEsConnection.ExecSQL(const ASQL: string;
  const AParams: array of Variant): Integer;
var
  Q: TSQLQuery;
begin
  Q := NewCommand(ASQL);
  try
    AssignParamValues(Q.Params, AParams);
  except
    Q.Free;
    raise;
  end;
  Result := DoExecSQL(Q);
end;

function TEsConnection.ExecSQL(const ASQL: string; const ANames: array of string;
  const AValues: array of Variant): Integer;
var
  Q: TSQLQuery;
begin
  Q := NewCommand(ASQL);
  try
    AssignNamedParams(Q.Params, ANames, AValues);
  except
    Q.Free;
    raise;
  end;
  Result := DoExecSQL(Q);
end;

function TEsConnection.ExecSQLScalar(const ASQL: string): Variant;
begin
  Result := DoExecSQLScalar(NewCommand(ASQL));
end;

function TEsConnection.ExecSQLScalar(const ASQL: string;
  const AParams: array of Variant): Variant;
var
  Q: TSQLQuery;
begin
  Q := NewCommand(ASQL);
  try
    AssignParamValues(Q.Params, AParams);
  except
    Q.Free;
    raise;
  end;
  Result := DoExecSQLScalar(Q);
end;

function TEsConnection.ExecSQLScalar(const ASQL: string; const ANames: array of string;
  const AValues: array of Variant): Variant;
var
  Q: TSQLQuery;
begin
  Q := NewCommand(ASQL);
  try
    AssignNamedParams(Q.Params, ANames, AValues);
  except
    Q.Free;
    raise;
  end;
  Result := DoExecSQLScalar(Q);
end;

procedure TEsConnection.StartTransaction;
begin
  if not Connected then
    Open;
  if ActiveTransaction.Active and (FHoldCount > 0) then
    ActiveTransaction.CommitRetaining  // já aberta por leituras sob demanda
  else
    ActiveTransaction.StartTransaction;
  FExplicitTx := True;
end;

procedure TEsConnection.EndTransaction;
begin
  FExplicitTx := False;
  ActiveTransaction.EndTransaction;
end;

procedure TEsConnection.Commit;
begin
  FExplicitTx := False;
  if FHoldCount > 0 then
    ActiveTransaction.CommitRetaining
  else
    ActiveTransaction.Commit;
end;

procedure TEsConnection.Rollback;
begin
  FExplicitTx := False;
  if FHoldCount > 0 then
    ActiveTransaction.RollbackRetaining
  else
    ActiveTransaction.Rollback;
end;

function TEsConnection.InTransaction: Boolean;
begin
  Result := ActiveTransaction.Active;
end;

class procedure TEsConnection.GetDriverIDs(AList: TStrings);
var
  I: Integer;
begin
  AList.BeginUpdate;
  try
    AList.Clear;
    for I := Low(DriverMap) to High(DriverMap) do
      if GetConnectionDef(DriverMap[I, 1]) <> nil then
        AList.Add(DriverMap[I, 0]);
  finally
    AList.EndUpdate;
  end;
end;

{ TEsTransaction }

function TEsTransaction.GetConnection: TEsConnection;
begin
  if DataBase is TEsConnection then
    Result := TEsConnection(DataBase)
  else
    Result := nil;
end;

procedure TEsTransaction.SetConnection(AValue: TEsConnection);
begin
  DataBase := AValue;
end;

{ TEsQuery }

constructor TEsQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAutoCommit := True;
  FFetchAll := True;
  Options := DefaultQueryOptions;
end;

destructor TEsQuery.Destroy;
begin
  if FHolding then
  begin
    FHolding := False;
    if Connection <> nil then
      Connection.ReleaseAutoTransaction(TSQLTransaction(Transaction));
  end;
  inherited Destroy;
end;

procedure TEsQuery.SetFetchAll(AValue: Boolean);
begin
  if FFetchAll = AValue then Exit;
  FFetchAll := AValue;
  if FFetchAll then
    Options := Options + [sqoKeepOpenOnCommit]
  else
    Options := Options - [sqoKeepOpenOnCommit];
end;

procedure TEsQuery.FinishWrite(AWasActive: Boolean);
begin
  if not FAutoCommit or not Assigned(Transaction) then Exit;
  if Connection <> nil then
    Connection.FinishAutoWrite(TSQLTransaction(Transaction), AWasActive)
  else if not AWasActive and Transaction.Active then
    TSQLTransaction(Transaction).Commit;
end;

function TEsQuery.GetConnection: TEsConnection;
begin
  if DataBase is TEsConnection then
    Result := TEsConnection(DataBase)
  else
    Result := nil;
end;

procedure TEsQuery.SetConnection(AValue: TEsConnection);
begin
  DataBase := AValue;
end;

procedure TEsQuery.SetCachedUpdates(AValue: Boolean);
begin
  if FCachedUpdates = AValue then Exit;
  FCachedUpdates := AValue;
  if FCachedUpdates then
    Options := Options - [sqoAutoApplyUpdates]
  else
    Options := Options + [sqoAutoApplyUpdates];
end;

function TEsQuery.IsTransactionStored: Boolean;
begin
  // a transação interna da conexão não tem nome e não pode ir para o .lfm
  Result := Assigned(Transaction) and (Transaction.Name <> '');
end;

function TEsQuery.IsOptionsStored: Boolean;
var
  Def: TSQLQueryOptions;
begin
  Def := DefaultQueryOptions;
  if FCachedUpdates then
    Def := Def - [sqoAutoApplyUpdates];
  if not FFetchAll then
    Def := Def - [sqoKeepOpenOnCommit];
  Result := Options <> Def;
end;

procedure TEsQuery.EnsureTransaction;
begin
  if (Transaction = nil) and (Connection <> nil) then
    Transaction := Connection.ActiveTransaction;
end;

procedure TEsQuery.DoBeforeOpen;
begin
  EnsureTransaction;
  FAutoStarted := Assigned(Transaction) and not Transaction.Active;
  inherited DoBeforeOpen;
end;

procedure TEsQuery.EndAutoRead;
begin
  // Como no FireDAC: a leitura abriu uma transação automática; encerra-a para
  // não prender o banco (os registros ficam em memória - sqoKeepOpenOnCommit).
  if FAutoStarted and FAutoCommit and Assigned(Transaction) and Transaction.Active then
  begin
    if sqoKeepOpenOnCommit in Options then
    begin
      if (Connection <> nil) and (Connection.FHoldCount > 0) then
        TSQLTransaction(Transaction).CommitRetaining
      else
        TSQLTransaction(Transaction).Commit;
    end
    else if (Connection <> nil) and not FHolding then
    begin
      // busca sob demanda: a transação fica aberta até o Close
      FHolding := True;
      Connection.HoldAutoTransaction;
    end;
  end;
  FAutoStarted := False;
end;

procedure TEsQuery.DoAfterOpen;
begin
  EndAutoRead;
  inherited DoAfterOpen;
end;

procedure TEsQuery.DoBeforeRefresh;
begin
  EnsureTransaction;
  FAutoStarted := Assigned(Transaction) and not Transaction.Active;
  inherited DoBeforeRefresh;
end;

procedure TEsQuery.DoAfterRefresh;
begin
  EndAutoRead;
  inherited DoAfterRefresh;
end;

procedure TEsQuery.DoAfterClose;
begin
  if FHolding then
  begin
    FHolding := False;
    if Connection <> nil then
      Connection.ReleaseAutoTransaction(TSQLTransaction(Transaction));
  end;
  inherited DoAfterClose;
end;

procedure TEsQuery.ExecSQL;
var
  WasActive: Boolean;
begin
  EnsureTransaction;
  WasActive := Assigned(Transaction) and Transaction.Active;
  inherited ExecSQL;
  FinishWrite(WasActive);
end;

procedure TEsQuery.ApplyUpdates(MaxErrors: Integer);
var
  WasActive: Boolean;
begin
  EnsureTransaction;
  WasActive := Assigned(Transaction) and Transaction.Active;
  inherited ApplyUpdates(MaxErrors);
  FinishWrite(WasActive);
end;

function TEsQuery.ExecSQL(const ASQL: string): Integer;
begin
  Result := ExecSQL(ASQL, []);
end;

function TEsQuery.ExecSQL(const ASQL: string;
  const AParams: array of Variant): Integer;
begin
  Close;
  SQL.Text := ASQL;
  AssignParamValues(Params, AParams);
  Self.ExecSQL; // "ExecSQL" sozinho aqui seria o Result da função
  Result := RowsAffected;
end;

function TEsQuery.ExecSQL(const ASQL: string; const ANames: array of string;
  const AValues: array of Variant): Integer;
begin
  Close;
  SQL.Text := ASQL;
  AssignNamedParams(Params, ANames, AValues);
  Self.ExecSQL;
  Result := RowsAffected;
end;

procedure TEsQuery.Open(const ASQL: string; const ANames: array of string;
  const AValues: array of Variant);
begin
  Close;
  SQL.Text := ASQL;
  AssignNamedParams(Params, ANames, AValues);
  Open;
end;

procedure TEsQuery.Open;
begin
  inherited Open;
end;

procedure TEsQuery.Open(const ASQL: string);
begin
  Open(ASQL, []);
end;

procedure TEsQuery.Open(const ASQL: string; const AParams: array of Variant);
begin
  Close;
  SQL.Text := ASQL;
  AssignParamValues(Params, AParams);
  Open;
end;

procedure TEsQuery.ApplyAndCommit;
begin
  if State in dsEditModes then
    Post;
  ApplyUpdates;
  if Assigned(Transaction) and Transaction.Active then
  begin
    if Connection <> nil then
      Connection.FExplicitTx := False;
    // com leituras sob demanda abertas, grava sem fechar os cursores
    if FHolding or ((Connection <> nil) and (Connection.FHoldCount > 0)) then
      TSQLTransaction(Transaction).CommitRetaining
    else
      TSQLTransaction(Transaction).Commit;
  end;
end;

{ TEsTable }

procedure TEsTable.SetTableName(const AValue: string);
begin
  if FTableName = AValue then Exit;
  Close;
  FTableName := Trim(AValue);
  if FTableName = '' then
    SQL.Clear
  else
    SQL.Text := 'SELECT * FROM ' + FTableName;
end;

function TEsTable.IsSQLStored: Boolean;
begin
  Result := FTableName = '';
end;

{ TEsCommand }

constructor TEsCommand.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCommandText := TStringList.Create;
  FCommandText.OnChange := @CommandTextChanged;
  FParams := TParams.Create(TParam);
end;

destructor TEsCommand.Destroy;
begin
  FParams.Free;
  FCommandText.Free;
  inherited Destroy;
end;

procedure TEsCommand.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = FConnection then
      FConnection := nil;
    if AComponent = FTransaction then
      FTransaction := nil;
  end;
end;

procedure TEsCommand.SetConnection(AValue: TEsConnection);
begin
  if FConnection = AValue then Exit;
  if Assigned(FConnection) then
    FConnection.RemoveFreeNotification(Self);
  FConnection := AValue;
  if Assigned(FConnection) then
    FConnection.FreeNotification(Self);
end;

procedure TEsCommand.SetTransaction(AValue: TSQLTransaction);
begin
  if FTransaction = AValue then Exit;
  if Assigned(FTransaction) then
    FTransaction.RemoveFreeNotification(Self);
  FTransaction := AValue;
  if Assigned(FTransaction) then
    FTransaction.FreeNotification(Self);
end;

function TEsCommand.GetCommandText: TStrings;
begin
  Result := FCommandText;
end;

procedure TEsCommand.SetCommandText(AValue: TStrings);
begin
  FCommandText.Assign(AValue);
end;

procedure TEsCommand.SetParams(AValue: TParams);
begin
  FParams.Assign(AValue);
end;

procedure TEsCommand.CommandTextChanged(Sender: TObject);
var
  NewParams: TParams;
begin
  // recria a lista de parâmetros (:nome) preservando os valores já definidos
  NewParams := TParams.Create(TParam);
  try
    NewParams.ParseSQL(FCommandText.Text, True);
    NewParams.AssignValues(FParams);
    FParams.Assign(NewParams);
  finally
    NewParams.Free;
  end;
end;

function TEsCommand.ParamByName(const AName: string): TParam;
begin
  Result := FParams.ParamByName(AName);
end;

function TEsCommand.Execute: Integer;
var
  Q: TSQLQuery;
  Tr: TSQLTransaction;
  WasActive: Boolean;
begin
  if FConnection = nil then
    raise EEsDBError.CreateFmt(SEsNoConnection, [Name]);
  if Trim(FCommandText.Text) = '' then
    raise EEsDBError.CreateFmt(SEsNoSQL, [Name]);
  if Assigned(FBeforeExecute) then
    FBeforeExecute(Self);
  if Assigned(FTransaction) then
    Tr := FTransaction
  else
    Tr := FConnection.ActiveTransaction;
  WasActive := Tr.Active;
  Q := TSQLQuery.Create(nil);
  try
    Q.DataBase := FConnection;
    Q.Transaction := Tr;
    Q.Options := [sqoKeepOpenOnCommit];
    Q.SQL.Assign(FCommandText);
    Q.Params.AssignValues(FParams);
    Q.ExecSQL;
    FRowsAffected := Q.RowsAffected;
    if not WasActive and Tr.Active then
      Tr.Commit; // transação automática
  finally
    Q.Free;
  end;
  Result := FRowsAffected;
  if Assigned(FAfterExecute) then
    FAfterExecute(Self);
end;

{ TEsMemTable }

procedure TEsMemTable.CopyDataSet(ASource: TDataSet; AWithData: Boolean);
var
  I: Integer;
  F: TField;
  Bm: TBookmark;
begin
  Close;
  FieldDefs.Clear;
  Fields.Clear;
  for I := 0 to ASource.FieldDefs.Count - 1 do
    with ASource.FieldDefs[I] do
      if DataType = ftAutoInc then
        Self.FieldDefs.Add(Name, ftInteger, 0, False)
      else
        Self.FieldDefs.Add(Name, DataType, Size, False);
  CreateDataset;
  if not (AWithData and ASource.Active) then Exit;
  DisableControls;
  ASource.DisableControls;
  Bm := ASource.GetBookmark;
  try
    ASource.First;
    while not ASource.EOF do
    begin
      Append;
      for I := 0 to ASource.FieldCount - 1 do
      begin
        F := FindField(ASource.Fields[I].FieldName);
        if Assigned(F) then
          F.Value := ASource.Fields[I].Value;
      end;
      Post;
      ASource.Next;
    end;
    First;
  finally
    if ASource.BookmarkValid(Bm) then
      ASource.GotoBookmark(Bm);
    ASource.FreeBookmark(Bm);
    ASource.EnableControls;
    EnableControls;
  end;
end;

finalization
  if OracleLibHeld then
    TOracleConnectionDef.UnLoadFunction()();
end.
