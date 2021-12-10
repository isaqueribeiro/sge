unit SGE.Controller.Logradouro;

interface

uses
  System.SysUtils,
  System.Classes,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerLogradouro = class(TController, IControllerLogradouro)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerLogradouro;

      function SetLogradouro(const iCidade : Integer; const sNome : String; var Tipo : Smallint) : Integer;
  end;

implementation

uses
  Service.Utils;

{ TControllerLogradouro }

constructor TControllerLogradouro.Create;
begin
  inherited Create(TModelDAOFactory.New.Logradouro);
end;

destructor TControllerLogradouro.Destroy;
begin
  inherited;
end;

class function TControllerLogradouro.New: IControllerLogradouro;
begin
  Result := Self.Create;
end;

function TControllerLogradouro.SetLogradouro(const iCidade: Integer; const sNome: String; var Tipo: Smallint): Integer;
var
  sTipo ,
  sDesc : String;
  sLogr : TStringList;
  IDAO  : IModelDAOCustom;
begin
  sLogr := TStringList.Create;
  try
    sDesc := sNome.Trim.ToUpper;
    sTipo := EmptyStr;

    TServicesUtils.Split('.', sDesc, sLogr);
    if (sLogr.Count > 1) then
    begin
      sTipo := sLogr.Strings[0];
      if Length(sTipo) > 25 then
        sTipo := EmptyStr;
    end;

    if ( sTipo = EmptyStr ) then
    begin
      TServicesUtils.Split(' ', sDesc, sLogr);
      if (sLogr.Count > 1) then
        sTipo := sLogr.Strings[0];
    end;

    if ( sTipo <> EmptyStr ) then
      sDesc := Trim(Copy(sDesc, Length(sTipo) + 1, Length(sDesc)));

    IDAO := TModelDAOFactory.New.Busca;

    IDAO
      .Close
      .Clear
      .SQL('Select')
      .SQL('    g.cod_logradouro')
      .SQL('  , g.cod_tipo')
      .SQL('from SET_LOGRADOURO(' + QuotedStr(sDesc) + ', ' + QuotedStr(sTipo) + ', ' + IntToStr(iCidade) + ') g')
      .Open;

    Tipo   := IDAO.DataSet.FieldByName('cod_tipo').AsInteger;
    Result := IDAO.DataSet.FieldByName('cod_logradouro').AsInteger;

    IDAO.CommitTransaction;
  finally
    sLogr.DisposeOf;
  end;
end;

end.
