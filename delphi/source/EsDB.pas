{
 *****************************************************************************
  ESKit para Delphi (VCL) - EsDB.pas
  Componentes de banco com a mesma API da versão Lazarus, construídos sobre
  o FireDAC (que já é o padrão do Delphi):

    TEsConnection   = TFDConnection  + DriverID/DatabaseName/HostName/UserName/
                                       Password/Port como propriedades,
                                       StorePassword e parâmetros por nome
    TEsTransaction  = TFDTransaction
    TEsQuery        = TFDQuery       + ApplyAndCommit, FetchAll e parâmetros
                                       por nome
    TEsTable        = TFDTable
    TEsCommand      executa SQL sem retorno (CommandText + Params, Execute)
    TEsMemTable     = TFDMemTable    + CopyDataSet(Origem, ComDados)

  Drivers: esta unit já registra o SQLite (linkado no executável, sem DLL a
  partir do Delphi 10.4). Para outros bancos adicione ao projeto a unit do
  driver FireDAC, por exemplo FireDAC.Phys.PG, FireDAC.Phys.FB,
  FireDAC.Phys.MySQL, FireDAC.Phys.MSSQL ou FireDAC.Phys.ODBC. Para o Oracle
  (DriverID 'Ora') use a unit EsDBOracle, que existe também no Lazarus.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsDB;

interface

uses
  System.SysUtils, System.Classes, System.Variants, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.Intf, FireDAC.Phys, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.DatS,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef
  {$IF CompilerVersion >= 34.0}, FireDAC.Phys.SQLiteWrapper.Stat{$IFEND};

type
  EEsDBError = class(EDatabaseError);

  { TEsConnection }

  TEsConnection = class(TFDConnection)
  private
    FOnConnected: TNotifyEvent;
    FOnDisconnected: TNotifyEvent;
    FStorePassword: Boolean;
    procedure ReadConnParams(Reader: TReader);
    procedure WriteConnParams(Writer: TWriter);
    function GetDriverID: string;
    procedure SetDriverID(const AValue: string);
    function GetParam(const AName: string): string;
    procedure SetParam(const AName, AValue: string);
    function GetDatabaseName: string;
    procedure SetDatabaseName(const AValue: string);
    function GetHostName: string;
    procedure SetHostName(const AValue: string);
    function GetUserName: string;
    procedure SetUserName(const AValue: string);
    function GetPassword: string;
    procedure SetPassword(const AValue: string);
    function GetPort: Integer;
    procedure SetPort(AValue: Integer);
  protected
    procedure DoConnect; override;
    procedure DoDisconnect; override;
    procedure DefineProperties(Filer: TFiler); override;
  public
    constructor Create(AOwner: TComponent); override;
    { parâmetros por nome: ExecSQL('... where id = :id', ['id'], [10]) }
    function ExecSQL(const ASQL: string; const ANames: array of string;
      const AValues: array of Variant): LongInt; overload;
    function ExecSQLScalar(const ASQL: string; const ANames: array of string;
      const AValues: array of Variant): Variant; overload;
    { mesmos nomes da versão Lazarus (gravados em Params no .dfm) }
    property DatabaseName: string read GetDatabaseName write SetDatabaseName;
    property HostName: string read GetHostName write SetHostName;
    property UserName: string read GetUserName write SetUserName;
    property Password: string read GetPassword write SetPassword;
    property Port: Integer read GetPort write SetPort;
    class procedure GetDriverIDs(AList: TStrings);
  published
    { SQLite, PG, FB, IB, MySQL, MSSQL, ODBC... (o DriverName do FireDAC) }
    property DriverID: string read GetDriverID write SetDriverID stored False;
    { False (padrão): a senha não é gravada no .dfm - defina-a em código (ou
      em OnLogin). True: grava, como o TFDConnection. Os parâmetros vão para
      o .dfm em ConnectionParams. }
    property StorePassword: Boolean read FStorePassword write FStorePassword default False;
    property Params stored False;
    property OnConnected: TNotifyEvent read FOnConnected write FOnConnected;
    property OnDisconnected: TNotifyEvent read FOnDisconnected write FOnDisconnected;
  end;

  { Compatibilidade com a primeira versão (Lazarus) }
  TEsDatabase = TEsConnection;

  { TEsTransaction }

  TEsTransaction = class(TFDTransaction);

  { TEsQuery - Post/Delete gravam na hora (CachedUpdates = False, padrão) }

  TEsQuery = class(TFDQuery)
  private
    function GetFetchAll: Boolean;
    procedure SetFetchAll(AValue: Boolean);
  public
    { grava as alterações pendentes (CachedUpdates) e faz commit }
    procedure ApplyAndCommit;
    { parâmetros por nome }
    function ExecSQL(const ASQL: string; const ANames: array of string;
      const AValues: array of Variant): LongInt; overload;
    procedure Open(const ASQL: string; const ANames: array of string;
      const AValues: array of Variant); overload;
  published
    { True: traz todos os registros na abertura (FetchOptions.Mode = fmAll).
      False: busca sob demanda (fmOnDemand, o padrão do FireDAC). }
    property FetchAll: Boolean read GetFetchAll write SetFetchAll stored False;
  end;

  TEsTable = class(TFDTable)
  public
    procedure ApplyAndCommit;
  end;

  { TEsCommand }

  TEsCommand = class(TComponent)
  private
    FConnection: TFDCustomConnection;
    FTransaction: TFDCustomTransaction;
    FCommandText: TStringList;
    FParams: TParams;
    FRowsAffected: Integer;
    FBeforeExecute: TNotifyEvent;
    FAfterExecute: TNotifyEvent;
    procedure SetConnection(AValue: TFDCustomConnection);
    procedure SetTransaction(AValue: TFDCustomTransaction);
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
    property Connection: TFDCustomConnection read FConnection write SetConnection;
    property Transaction: TFDCustomTransaction read FTransaction write SetTransaction;
    property CommandText: TStrings read GetCommandText write SetCommandText;
    property Params: TParams read FParams write SetParams;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
  end;

  { TEsMemTable }

  TEsMemTable = class(TFDMemTable)
  public
    { copia a estrutura e (opcionalmente) os registros de outro dataset }
    procedure CopyDataSet(ASource: TDataSet; AWithData: Boolean = True); reintroduce;
  end;

  { Compatibilidade com a primeira versão (Lazarus) }
  TEsDataSet = TEsMemTable;

function EsDriverIDToConnectorType(const ADriverID: string): string;
function EsConnectorTypeToDriverID(const AConnectorType: string): string;

implementation

resourcestring
  SEsNoConnection = '"%s" não tem Connection atribuída.';
  SEsNoSQL = '"%s" não tem CommandText.';

{ no FireDAC o DriverID já é o nome usado pelo ESKit; as funções existem para
  manter a mesma API da versão Lazarus }
function EsDriverIDToConnectorType(const ADriverID: string): string;
begin
  Result := ADriverID;
end;

function EsConnectorTypeToDriverID(const AConnectorType: string): string;
begin
  Result := AConnectorType;
end;

procedure AssignNamedParams(AParams: TFDParams; const ANames: array of string;
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
end;

procedure TEsConnection.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('ConnectionParams', ReadConnParams, WriteConnParams,
    Params.Count > 0);
end;

procedure TEsConnection.ReadConnParams(Reader: TReader);
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    Reader.ReadListBegin;
    while not Reader.EndOfList do
      L.Add(Reader.ReadString);
    Reader.ReadListEnd;
    Params.Assign(L);
  finally
    L.Free;
  end;
end;

procedure TEsConnection.WriteConnParams(Writer: TWriter);
var
  I: Integer;
begin
  Writer.WriteListBegin;
  for I := 0 to Params.Count - 1 do
    if FStorePassword or not SameText(Params.Names[I], 'Password') then
      Writer.WriteString(Params[I]);
  Writer.WriteListEnd;
end;

function TEsConnection.ExecSQL(const ASQL: string; const ANames: array of string;
  const AValues: array of Variant): LongInt;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := Self;
    Q.SQL.Text := ASQL;
    AssignNamedParams(Q.Params, ANames, AValues);
    Q.ExecSQL;
    Result := Q.RowsAffected;
  finally
    Q.Free;
  end;
end;

function TEsConnection.ExecSQLScalar(const ASQL: string; const ANames: array of string;
  const AValues: array of Variant): Variant;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := Self;
    Q.SQL.Text := ASQL;
    AssignNamedParams(Q.Params, ANames, AValues);
    Q.Open;
    if Q.IsEmpty or (Q.FieldCount = 0) then
      Result := Null
    else
      Result := Q.Fields[0].Value;
  finally
    Q.Free;
  end;
end;

function TEsConnection.GetDriverID: string;
begin
  Result := DriverName;
end;

procedure TEsConnection.SetDriverID(const AValue: string);
begin
  DriverName := Trim(AValue);
end;

function TEsConnection.GetParam(const AName: string): string;
begin
  Result := Params.Values[AName];
end;

procedure TEsConnection.SetParam(const AName, AValue: string);
begin
  Params.Values[AName] := AValue;
end;

function TEsConnection.GetDatabaseName: string;
begin
  Result := GetParam('Database');
end;

procedure TEsConnection.SetDatabaseName(const AValue: string);
begin
  SetParam('Database', AValue);
end;

function TEsConnection.GetHostName: string;
begin
  Result := GetParam('Server');
end;

procedure TEsConnection.SetHostName(const AValue: string);
begin
  SetParam('Server', AValue);
end;

function TEsConnection.GetUserName: string;
begin
  Result := GetParam('User_Name');
end;

procedure TEsConnection.SetUserName(const AValue: string);
begin
  SetParam('User_Name', AValue);
end;

function TEsConnection.GetPassword: string;
begin
  Result := GetParam('Password');
end;

procedure TEsConnection.SetPassword(const AValue: string);
begin
  SetParam('Password', AValue);
end;

function TEsConnection.GetPort: Integer;
begin
  Result := StrToIntDef(GetParam('Port'), 0);
end;

procedure TEsConnection.SetPort(AValue: Integer);
begin
  if AValue <= 0 then
    SetParam('Port', '')
  else
    SetParam('Port', IntToStr(AValue));
end;

procedure TEsConnection.DoConnect;
var
  L: TStringList;
begin
  if SameText(DriverName, 'Ora') then
  begin
    // driver não ligado: o erro do FireDAC não diz o que fazer
    L := TStringList.Create;
    try
      FDManager.GetDriverNames(L);
      if L.IndexOf('Ora') < 0 then
        raise EEsDBError.Create('Driver Oracle (DriverID Ora) não registrado: '
          + 'adicione a unit EsDBOracle ao uses do projeto.');
    finally
      L.Free;
    end;
    // o driver Oracle do FireDAC lê só Database; Server/Port seriam ignorados
    if (GetParam('Server') <> '') or (GetParam('Port') <> '') then
      raise EEsDBError.Create('No Oracle informe servidor, porta e serviço em '
        + 'DatabaseName (''servidor:1521/servico'') ou um nome do TNS, e deixe '
        + 'HostName e Port vazios.');
  end;
  inherited DoConnect;
  if Assigned(FOnConnected) then
    FOnConnected(Self);
end;

procedure TEsConnection.DoDisconnect;
begin
  inherited DoDisconnect;
  if Assigned(FOnDisconnected) then
    FOnDisconnected(Self);
end;

class procedure TEsConnection.GetDriverIDs(AList: TStrings);
begin
  FDManager.GetDriverNames(AList);
end;

{ TEsQuery }

function TEsQuery.GetFetchAll: Boolean;
begin
  Result := FetchOptions.Mode = fmAll;
end;

procedure TEsQuery.SetFetchAll(AValue: Boolean);
begin
  if AValue then
    FetchOptions.Mode := fmAll
  else
    FetchOptions.Mode := fmOnDemand;
end;

function TEsQuery.ExecSQL(const ASQL: string; const ANames: array of string;
  const AValues: array of Variant): LongInt;
begin
  Close;
  SQL.Text := ASQL;
  AssignNamedParams(Params, ANames, AValues);
  inherited ExecSQL;
  Result := RowsAffected;
end;

procedure TEsQuery.Open(const ASQL: string; const ANames: array of string;
  const AValues: array of Variant);
begin
  Close;
  SQL.Text := ASQL;
  AssignNamedParams(Params, ANames, AValues);
  inherited Open;
end;

procedure TEsQuery.ApplyAndCommit;
begin
  if State in dsEditModes then
    Post;
  if CachedUpdates then
  begin
    ApplyUpdates(0);
    CommitUpdates;
  end;
  if (Connection <> nil) and Connection.InTransaction then
    Connection.Commit;
end;

{ TEsTable }

procedure TEsTable.ApplyAndCommit;
begin
  if State in dsEditModes then
    Post;
  if CachedUpdates then
  begin
    ApplyUpdates(0);
    CommitUpdates;
  end;
  if (Connection <> nil) and Connection.InTransaction then
    Connection.Commit;
end;

{ TEsCommand }

constructor TEsCommand.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCommandText := TStringList.Create;
  FCommandText.OnChange := CommandTextChanged;
  FParams := TParams.Create(Self);
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

procedure TEsCommand.SetConnection(AValue: TFDCustomConnection);
begin
  if FConnection = AValue then Exit;
  if Assigned(FConnection) then
    FConnection.RemoveFreeNotification(Self);
  FConnection := AValue;
  if Assigned(FConnection) then
    FConnection.FreeNotification(Self);
end;

procedure TEsCommand.SetTransaction(AValue: TFDCustomTransaction);
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
  NewParams := TParams.Create(nil);
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
  Q: TFDQuery;
  I: Integer;
  P: TFDParam;
begin
  if FConnection = nil then
    raise EEsDBError.CreateFmt(SEsNoConnection, [Name]);
  if Trim(FCommandText.Text) = '' then
    raise EEsDBError.CreateFmt(SEsNoSQL, [Name]);
  if Assigned(FBeforeExecute) then
    FBeforeExecute(Self);
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConnection;
    if FTransaction <> nil then
      Q.Transaction := FTransaction;
    Q.SQL.Assign(FCommandText);
    for I := 0 to FParams.Count - 1 do
    begin
      P := Q.Params.FindParam(FParams[I].Name);
      if P = nil then Continue;
      if FParams[I].DataType <> ftUnknown then
        P.DataType := FParams[I].DataType;
      P.Value := FParams[I].Value;
    end;
    Q.ExecSQL;
    FRowsAffected := Q.RowsAffected;
  finally
    Q.Free;
  end;
  Result := FRowsAffected;
  if Assigned(FAfterExecute) then
    FAfterExecute(Self);
end;

{ TEsMemTable }

procedure TEsMemTable.CopyDataSet(ASource: TDataSet; AWithData: Boolean);
begin
  Close;
  FieldDefs.Clear;
  Fields.Clear;
  if AWithData and ASource.Active then
    inherited CopyDataSet(ASource, [coStructure, coRestart, coAppend])
  else
  begin
    FieldDefs.Assign(ASource.FieldDefs);
    CreateDataSet;
  end;
end;

end.
