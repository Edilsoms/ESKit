{
 *****************************************************************************
  ESKit para Delphi (VCL) - EsDBOracle.pas
  Oracle no TEsConnection (DriverID 'Ora'): liga o driver Oracle do FireDAC
  (disponível nas edições Enterprise e Architect do Delphi).

    uses EsDB, EsDBOracle;
    EsSetOracleVendorLib('C:\instantclient_21\oci.dll'); // opcional
    Conn.DriverID := 'Ora';
    Conn.DatabaseName := 'servidor:1521/servico';       // ou um nome do TNS
    Conn.UserName := 'scott';
    Conn.Password := 'tiger';
    Conn.Connected := True;

  O mesmo código compila no Lazarus (lá a unit EsDBOracle também existe).
  A oci.dll (cliente Oracle ou Instant Client, com a mesma arquitetura do
  programa: 32 ou 64 bits) só é carregada ao conectar.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsDBOracle;

interface

uses
  System.SysUtils, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, EsDB;

{ caminho (ou nome) da oci.dll. Chame antes da primeira conexão Oracle. }
procedure EsSetOracleVendorLib(const ALibrary: string);

implementation

var
  OracleLink: TFDPhysOracleDriverLink = nil;

procedure EsSetOracleVendorLib(const ALibrary: string);
begin
  if OracleLink = nil then
    OracleLink := TFDPhysOracleDriverLink.Create(nil);
  OracleLink.VendorLib := ALibrary;
end;

initialization

finalization
  FreeAndNil(OracleLink);
end.
