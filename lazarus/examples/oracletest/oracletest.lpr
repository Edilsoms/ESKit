{ Teste do driver Oracle (DriverID 'Ora') sem cliente Oracle instalado:
  o programa precisa abrir normalmente e a conexão precisa falhar com uma
  mensagem clara. Com um servidor, passe: oracletest servidor:1521/servico
  usuario senha  (e, se precisar, o caminho da oci.dll/libclntsh.so). }
program oracletest;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils, DB, EsDB, EsDBOracle;

var
  Fails: Integer = 0;

procedure Check(ACond: Boolean; const AMsg: string);
begin
  if ACond then
    WriteLn('ok    ', AMsg)
  else
  begin
    WriteLn('FALHA ', AMsg);
    Inc(Fails);
  end;
end;

function TryConnect(C: TEsConnection; out AMsg: string): Boolean;
begin
  AMsg := '';
  try
    C.Connected := True;
    Result := True;
  except
    on E: Exception do
    begin
      AMsg := E.ClassName + ': ' + E.Message;
      Result := False;
    end;
  end;
end;

var
  L: TStringList;
  C: TEsConnection;
  Q: TEsQuery;
  Msg: string;
begin
  L := TStringList.Create;
  try
    TEsConnection.GetDriverIDs(L);
    Check(L.IndexOf('Ora') >= 0, 'Ora na lista de drivers: ' + L.CommaText);
  finally
    L.Free;
  end;

  C := TEsConnection.Create(nil);
  try
    C.DriverID := 'Ora';
    Check(C.DriverID = 'Ora', 'DriverID = Ora');
    Check(C.ConnectorType = 'Oracle', 'ConnectorType = Oracle');

    if ParamCount >= 3 then
    begin
      // conexão real
      if ParamCount >= 4 then
        EsSetOracleVendorLib(ParamStr(4));
      C.DatabaseName := ParamStr(1);
      C.UserName := ParamStr(2);
      C.Password := ParamStr(3);
      Check(TryConnect(C, Msg), 'conecta ' + Msg);
      if C.Connected then
      begin
        Q := TEsQuery.Create(nil);
        try
          Q.Connection := C;
          Q.SQL.Text := 'select 1 + :a as x, sysdate as d from dual';
          Q.ParamByName('a').AsInteger := 41;
          Q.Open;
          Check(Q.FieldByName('x').AsInteger = 42, 'select from dual: ' + Q.FieldByName('x').AsString);
          Check(Q.FieldByName('d').AsDateTime > 0, 'sysdate: ' + Q.FieldByName('d').AsString);
        finally
          Q.Free;
        end;
      end;
    end
    else
    begin
      // sem cliente: erro claro, citando a biblioteca
      C.DatabaseName := 'localhost:1521/XEPDB1';
      Check(not TryConnect(C, Msg), 'sem cliente, a conexão falha');
      Check(Pos('EEsDBError', Msg) = 1, 'erro do ESKit: ' + Msg);
      Check(Pos('biblioteca cliente', Msg) > 0, 'mensagem explica a biblioteca');
      {$IFDEF UNIX}
      Check(Pos('libclntsh', Msg) > 0, 'Linux procura libclntsh (não libociei)');
      {$ELSE}
      Check(Pos('oci.dll', Msg) > 0, 'Windows procura oci.dll');
      {$ENDIF}
      // caminho escolhido
      EsSetOracleVendorLib('/nao/existe/instantclient/libclntsh.so');
      Check(not TryConnect(C, Msg), 'com caminho inexistente, falha');
      Check(Pos('/nao/existe/instantclient', Msg) > 0, 'mensagem cita o caminho: ' + Msg);
      Check(not C.Connected, 'continua desconectado');
    end;
  finally
    C.Free;
  end;
  WriteLn('Falhas: ', Fails);
  ExitCode := Ord(Fails > 0);
end.
