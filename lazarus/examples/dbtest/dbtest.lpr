program dbtest;
{$mode objfpc}{$H+}
uses Classes, SysUtils, Variants, DB, SQLDB, EsDB;

var
  Fails: Integer = 0;

procedure Check(Cond: Boolean; const Msg: string);
begin
  if Cond then WriteLn('OK   ', Msg) else begin WriteLn('FAIL ', Msg); Inc(Fails); end;
end;

type
  THolder = class(TComponent)
  published
    Conn: TEsConnection;
  end;

var
  Owner: TComponent;
  C: TEsConnection;
  T: TEsTable;
  Q: TEsQuery;
  Cmd: TEsCommand;
  M: TEsMemTable;
  Tr: TEsTransaction;
  MS: TMemoryStream;
  SS: TStringStream;
  DbFile: string;
  N: Integer;
  L: TStringList;
begin
  DbFile := GetTempDir + 'dkdbtest.db';
  DeleteFile(DbFile);
  Owner := TComponent.Create(nil);
  C := TEsConnection.Create(Owner);
  C.Name := 'Conn';
  // erro: sem driver
  try C.Connected := True; Check(False, 'connect sem DriverID deve falhar');
  except on E: Exception do Check(Pos('DriverID', E.Message) > 0, 'sem DriverID: ' + E.Message); end;
  try C.DriverID := 'Xyz'; Check(False, 'driver inválido');
  except on E: Exception do Check(True, 'driver inválido: ' + E.Message); end;
  C.DriverID := 'SQLite';
  Check(C.ConnectorType = 'SQLite3', 'DriverID SQLite -> ConnectorType ' + C.ConnectorType);
  Check(C.DriverID = 'SQLite', 'DriverID lido de volta');
  L := TStringList.Create; TEsConnection.GetDriverIDs(L); WriteLn('     drivers: ', L.CommaText); L.Free;
  C.DatabaseName := DbFile;
  C.Connected := True;
  Check(C.Connected, 'conectado');
  C.ExecSQL('create table cliente (id integer primary key, nome varchar(40), valor numeric(10,2))');
  N := C.ExecSQL('insert into cliente (id, nome, valor) values (:id, :nome, :valor)', [1, 'Ana', 10.5]);
  Check(N = 1, 'ExecSQL com parâmetros, linhas=' + IntToStr(N));
  C.ExecSQL('insert into cliente values (2, ''Bruno'', 20)');
  Check(C.ExecSQLScalar('select count(*) from cliente') = 2, 'ExecSQLScalar count=2');
  Check(not C.InTransaction, 'autocommit após ExecSQL');

  T := TEsTable.Create(Owner);
  T.Name := 'TabCli';
  T.Connection := C;
  T.TableName := 'cliente';
  T.Open;
  Check(T.RecordCount = 2, 'TEsTable abre 2 registros');
  T.Append; T.FieldByName('id').AsInteger := 3; T.FieldByName('nome').AsString := 'Carla';
  T.FieldByName('valor').AsFloat := 7; T.Post;
  T.First; T.Edit; T.FieldByName('nome').AsString := 'Ana Maria'; T.Post;
  Check(T.Active, 'tabela continua aberta após Post (KeepOpenOnCommit)');
  // outra conexão vê os dados = gravou e fez commit
  with TEsConnection.Create(nil) do
  try
    DriverID := 'SQLite'; DatabaseName := DbFile;
    Check(ExecSQLScalar('select count(*) from cliente') = 3, 'Post gravado e commitado (visível em outra conexão)');
    Check(ExecSQLScalar('select nome from cliente where id=1') = 'Ana Maria', 'Edit gravado');
  finally Free; end;
  T.Last; T.Delete;
  Check(C.ExecSQLScalar('select count(*) from cliente') = 2, 'Delete gravado');

  // CachedUpdates
  Q := TEsQuery.Create(Owner);
  Q.Name := 'Qry';
  Q.Connection := C;
  Q.CachedUpdates := True;
  Q.Open('select * from cliente where valor > :v', [5]);
  Check(Q.RecordCount = 2, 'Open(SQL, params)');
  Q.Edit; Q.FieldByName('valor').AsFloat := 99; Q.Post;
  Check(C.ExecSQLScalar('select max(valor) from cliente') <> 99, 'CachedUpdates não grava antes do ApplyUpdates');
  Q.ApplyAndCommit;
  Check(C.ExecSQLScalar('select max(valor) from cliente') = 99, 'ApplyAndCommit grava');
  Check(Q.ExecSQL('update cliente set valor = valor + 1') = 2, 'TEsQuery.ExecSQL(SQL) retorna linhas');

  // transação explícita + rollback
  C.StartTransaction;
  C.ExecSQL('delete from cliente');
  Check(C.InTransaction, 'transação explícita continua ativa');
  C.Rollback;
  Check(C.ExecSQLScalar('select count(*) from cliente') = 2, 'Rollback desfaz');

  // TEsTransaction própria
  Tr := TEsTransaction.Create(Owner);
  Tr.Name := 'Trans';
  Tr.Connection := C;
  Check(Tr.Connection = C, 'TEsTransaction.Connection');

  // TEsCommand
  Cmd := TEsCommand.Create(Owner);
  Cmd.Name := 'Cmd';
  Cmd.Connection := C;
  Cmd.CommandText.Text := 'insert into cliente values (:id, :nome, :valor)';
  Check(Cmd.Params.Count = 3, 'TEsCommand cria parâmetros do SQL');
  Cmd.ParamByName('id').AsInteger := 10;
  Cmd.ParamByName('nome').AsString := 'Davi';
  Cmd.ParamByName('valor').AsFloat := 1;
  Check(Cmd.Execute = 1, 'TEsCommand.Execute');
  Check(C.ExecSQLScalar('select nome from cliente where id=10') = 'Davi', 'TEsCommand gravou');

  // MemTable
  M := TEsMemTable.Create(Owner);
  T.Refresh;
  Check(not C.InTransaction, 'Refresh não deixa transação aberta');
  M.CopyDataSet(T);
  Check(M.RecordCount = T.RecordCount, 'TEsMemTable.CopyDataSet ' + IntToStr(M.RecordCount));

  // streaming: query usando a transação interna não deve gravar Transaction
  Q.Close; Q.Open('select * from cliente');
  SS := TStringStream.Create('');
  MS := TMemoryStream.Create;
  MS.WriteComponent(T);
  MS.Position := 0;
  ObjectBinaryToText(MS, SS);
  WriteLn(SS.DataString);
  Check(Pos('Transaction', SS.DataString) = 0, 'Transaction interna não é gravada');
  Check(Pos('SQL.Strings', SS.DataString) = 0, 'TEsTable não grava SQL');
  Check(Pos('Options', SS.DataString) = 0, 'Options padrão não gravado');
  SS.Free; MS.Free;
  SS := TStringStream.Create('');
  MS := TMemoryStream.Create;
  MS.WriteComponent(C);
  MS.Position := 0;
  ObjectBinaryToText(MS, SS);
  WriteLn(SS.DataString);
  Check((Pos('DriverID', SS.DataString) > 0) and (Pos('ConnectorType', SS.DataString) = 0), 'grava DriverID, não ConnectorType');
  SS.Free; MS.Free;

  // parâmetros por nome (ordem livre, nome repetido)
  N := C.ExecSQL('insert into cliente (id, nome, valor) values (:id, :nome, :id * 2)',
    ['nome', 'id'], ['Elisa', 20]);
  Check((N = 1) and (C.ExecSQLScalar('select valor from cliente where id = :id', ['id'], [20]) = 40),
    'parâmetros por nome (ordem livre, nome repetido)');
  Q.Close;
  Q.Open('select * from cliente where nome = :n or id = :i', ['i', 'n'], [10, 'Elisa']);
  Check(Q.RecordCount = 2, 'TEsQuery.Open com parâmetros por nome');
  try
    C.ExecSQL('select :a', ['a', 'b'], [1]);
    Check(False, 'nomes x valores diferentes deve falhar');
  except
    on E: EEsDBError do Check(True, 'nomes x valores diferentes: ' + E.Message);
  end;
  try
    C.ExecSQL('select :a', [1, 2]);
    Check(False, 'valores demais deve falhar');
  except
    on E: EEsDBError do Check(True, 'valores demais: ' + E.Message);
  end;

  // busca sob demanda (FetchAll = False)
  for N := 100 to 199 do
    C.ExecSQL('insert into cliente values (:id, :nome, 1)', [N, 'Lote ' + IntToStr(N)]);
  Q.Close;
  Q.CachedUpdates := False;
  Q.FetchAll := False;
  Q.PacketRecords := 10;
  Q.Open('select * from cliente order by id');
  Check(Q.RecordCount < 50, 'sob demanda: só o 1º lote carregado (' + IntToStr(Q.RecordCount) + ')');
  Check(C.InTransaction, 'sob demanda: transação de leitura aberta');
  // gravação automática com o cursor aberto: CommitRetaining
  C.ExecSQL('update cliente set valor = 5 where id = 150');
  with TEsConnection.Create(nil) do
  try
    DriverID := 'SQLite'; DatabaseName := DbFile;
    Check(ExecSQLScalar('select valor from cliente where id = 150') = 5,
      'gravação com cursor sob demanda aberto foi commitada');
  finally Free; end;
  Check(Q.Active, 'cursor sob demanda continua aberto após a gravação');
  Q.Last;
  Check(Q.RecordCount >= 100, 'sob demanda: Last busca o restante (' + IntToStr(Q.RecordCount) + ')');
  Q.Close;
  Check(not C.InTransaction, 'Close encerra a transação de leitura');
  SS := TStringStream.Create('');
  MS := TMemoryStream.Create;
  MS.WriteComponent(Q);
  MS.Position := 0;
  ObjectBinaryToText(MS, SS);
  Check((Pos('FetchAll = False', SS.DataString) > 0) and (Pos('Options', SS.DataString) = 0),
    'FetchAll gravado; Options derivado não');
  SS.Free; MS.Free;

  // senha
  C.Password := 'segredo';
  SS := TStringStream.Create('');
  MS := TMemoryStream.Create;
  MS.WriteComponent(C);
  MS.Position := 0;
  ObjectBinaryToText(MS, SS);
  Check(Pos('segredo', SS.DataString) = 0, 'senha não gravada por padrão');
  SS.Free; MS.Free;
  C.StorePassword := True;
  SS := TStringStream.Create('');
  MS := TMemoryStream.Create;
  MS.WriteComponent(C);
  MS.Position := 0;
  ObjectBinaryToText(MS, SS);
  Check(Pos('segredo', SS.DataString) > 0, 'StorePassword = True grava a senha');
  SS.Free; MS.Free;

  // liberar a conexão com datasets abertos
  Cmd.Free;
  C.Free;
  Check(T.Database = nil, 'referência limpa ao liberar conexão');
  Owner.Free;
  DeleteFile(DbFile);
  WriteLn('Falhas: ', Fails);
  Halt(Fails);
end.
