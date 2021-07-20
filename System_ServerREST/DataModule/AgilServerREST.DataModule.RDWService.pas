unit AgilServerREST.DataModule.RDWService;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,

  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,

  uDWDataModule,
  uDWAbout,
  uDWConsts,
  uDWJSONObject,
  uSystemEvents,
  uRESTDWServerEvents,
  uRESTDWPoolerDB,
  uRestDWDriverFD;

type
  TRDWService = class(TServerMethodDataModule)
    DWServerEventsTest: TDWServerEvents;
    conn: TFDConnection;
    RDWDriverFD: TRESTDWDriverFD;
    RDWPoolerDB: TRESTDWPoolerDB;
    procedure DWServerEventsTestEventstestReplyEventByType(var Params: TDWParams; var Result: string;
      const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure RDWDriverFDPrepareConnection(var ConnectionDefs: TConnectionDefs);
    procedure ServerMethodDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabela de códigos de StatusCode HTTP/HTTPS:
  1. https://httpstatuses.com/
*)

var
  RDWService: TRDWService;

implementation

uses
  SYstem.JSON,
  AgilServerREST.Controller.Factory;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TRDWService.DWServerEventsTestEventstestReplyEventByType(var Params: TDWParams; var Result: string;
  const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  aJson : TJSONObject;
begin
  aJson := TJSONObject.Create;
  try
    if (RequestType = TRequestType.rtGet) then
    begin
      aJson.AddPair('success', 'true');
      aJson.AddPair('message', 'OK');

      StatusCode := 200;

    end
    else
    begin
      aJson.AddPair('success', 'false');
      aJson.AddPair('message', 'Forbidden');

      StatusCode := 403;
    end;

    Result := aJson.ToJSON;
  finally
    aJson.DisposeOf;
  end;
end;

procedure TRDWService.RDWDriverFDPrepareConnection(var ConnectionDefs: TConnectionDefs);
begin
  _ControllerFactory.Configuracao.Load;

  conn.Connected   := False;
  conn.LoginPrompt := False;

  conn.Params.BeginUpdate;
  conn.Params.Clear;
  conn.Params.Add('DriverID=FB');
  conn.Params.Add('Protocol=TCPIP');
  conn.Params.Add('Server='    + _ControllerFactory.Configuracao.Entity.Banco.servidor);
  conn.Params.Add('Port='      + _ControllerFactory.Configuracao.Entity.Banco.porta.ToString);
  conn.Params.Add('Database='  + _ControllerFactory.Configuracao.Entity.Banco.base);
  conn.Params.Add('User_Name=' + _ControllerFactory.Configuracao.Entity.Banco.usuario);
  conn.Params.Add('Password='  + _ControllerFactory.Configuracao.Entity.Banco.senha);
  conn.Params.Add('CharacterSet=UNICODE_FSS');
  conn.Params.EndUpdate;

  conn.Params.DriverID  := 'FB';
  conn.Params.Database  := _ControllerFactory.Configuracao.Entity.Banco.base;
  conn.Params.UserName  := _ControllerFactory.Configuracao.Entity.Banco.usuario;
  conn.Params.Password  := _ControllerFactory.Configuracao.Entity.Banco.senha;
end;

procedure TRDWService.ServerMethodDataModuleCreate(Sender: TObject);
begin
  RDWPoolerDB.Active := True;
end;

end.
