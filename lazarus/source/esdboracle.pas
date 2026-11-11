{
 *****************************************************************************
  ESKit - esdboracle.pas
  Oracle no TEsConnection (DriverID 'Ora').

  No Lazarus o driver já vem com a EsDB (conector OracleConnection do SQLDB,
  que carrega a OCI só ao conectar); esta unit existe para o mesmo código
  compilar no Lazarus e no Delphi, onde ela liga o driver Oracle do FireDAC.

    uses EsDB, EsDBOracle;
    EsSetOracleVendorLib('C:\instantclient_21\oci.dll'); // opcional
    Conn.DriverID := 'Ora';
    Conn.DatabaseName := 'servidor:1521/servico';       // ou um nome do TNS
    Conn.UserName := 'scott';
    Conn.Password := 'tiger';
    Conn.Connected := True;

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsDBOracle;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, EsDB;

{ caminho (ou nome) da biblioteca cliente do Oracle: oci.dll no Windows,
  libclntsh.so no Linux. Chame antes da primeira conexão Oracle. }
procedure EsSetOracleVendorLib(const ALibrary: string);

implementation

procedure EsSetOracleVendorLib(const ALibrary: string);
begin
  EsOracleVendorLib := ALibrary;
end;

end.
