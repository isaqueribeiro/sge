unit SGE.Controller.Endereco;

interface

uses
  System.SysUtils,
  System.Classes,

  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerEndereco = class(TController, IControllerEndereco)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerEndereco;

      function GetPaisIDDefault : String;
      function GetPaisNome(const sPais : String) : String;
      function GetEstadoIDDefault : Integer;
      function GetEstadoNome(const iEstado : Integer) : String; overload;
      function GetEstadoNome(const sSigla : String) : String; overload;
      function GetEstadoID(const sSigla : String) : Integer;
      function GetEstadoUF(const iEstado : Integer) : String;
      function GetCidadeIDDefault : Integer;
      function GetCidadeNome(const iCidade : Integer) : String;
      function GetCidadeCEP(const iCidade : Integer) : String;
      function GetCidadeID(const iEstado : Integer; const sNome : String) : Integer; overload;
      function GetCidadeID(const sCEP : String) : Integer; overload;
      function GetCidadeID(const aIBGE : Currency) : Integer; overload;
      function GetLogradouroNome(const iLogradouro : Integer) : String;
      function GetLogradouroTipo(const iLogradouro : Integer) : String;
      function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
      function SetLogradouro(const iCidade : Integer; const sNome : String; var Tipo : Smallint) : Integer;
  end;

implementation

uses
  Service.Utils;

{ TControllerEndereco }

constructor TControllerEndereco.Create;
begin
  inherited Create(TModelDAOFactory.New.Bairro);
end;

destructor TControllerEndereco.Destroy;
begin
  inherited;
end;

function TControllerEndereco.GetCidadeCEP(const iCidade: Integer): String;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select')
    .SQL('  cid_cep_inicial')
    .SQL('from TBCIDADE')
    .SQL('where (cid_cod = ' + iCidade.ToString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('cid_cep_inicial').AsString;
end;

function TControllerEndereco.GetCidadeID(const sCEP: String): Integer;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select')
    .SQL('  cid_cod ')
    .SQL('from TBCIDADE')
    .SQL('where (' + TServicesUtils.StrOnlyNumbers(sCEP) + ' between cid_cep_inicial and cid_cep_final)')
    .Open;

  Result := IDAO.DataSet.FieldByName('cid_cod').AsInteger;
end;

function TControllerEndereco.GetCidadeID(const iEstado: Integer; const sNome: String): Integer;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select')
    .SQL('  cid_cod ')
    .SQL('from TBCIDADE')
    .SQL('where (est_cod = ' + iEstado.ToString + ')')
    .SQL('  and (cid_nome like ' + QuotedStr('%' + Trim(sNome) + '%') + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('cid_cod').AsInteger;
end;

function TControllerEndereco.GetCidadeNome(const iCidade: Integer): String;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select     ')
    .SQL('  cid_nome ')
    .SQL('from TBCIDADE')
    .SQL('where (cid_cod = ' + iCidade.ToString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('cid_nome').AsString;
end;

function TControllerEndereco.GetEstadoID(const sSigla: String): Integer;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select       ')
    .SQL('  est_cod    ')
    .SQL('from TBESTADO')
    .SQL('where (est_sigla = ' + sSigla.Trim.QuotedString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('est_cod').AsInteger;
end;

function TControllerEndereco.GetEstadoIDDefault: Integer;
begin
  Result := FDAO.Configuracao.Padrao.EstadoID;
end;

function TControllerEndereco.GetEstadoNome(const sSigla: String): String;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select       ')
    .SQL('  est_nome   ')
    .SQL('from TBESTADO')
    .SQL('where (est_sigla = ' + sSigla.Trim.QuotedString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('est_nome').AsString;
end;

function TControllerEndereco.GetEstadoUF(const iEstado: Integer): String;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select       ')
    .SQL('  est_sigla  ')
    .SQL('from TBESTADO')
    .SQL('where (est_cod = ' + iEstado.ToString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('est_sigla').AsString;
end;

function TControllerEndereco.GetLogradouroNome(const iLogradouro: Integer): String;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select')
    .SQL('  log_nome')
    .SQL('from TBLOGRADOURO')
    .SQL('where (log_cod = ' + iLogradouro.ToString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('log_nome').AsString;
end;

function TControllerEndereco.GetLogradouroTipo(const iLogradouro: Integer): String;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select')
    .SQL('  coalesce(t.tlg_sigla, t.tlg_descricao) as tipo')
    .SQL('from TBLOGRADOURO l')
    .SQL('  inner join TBTIPO_LOGRADOURO t on (t.tlg_cod = l.tlg_cod)')
    .SQL('where (l.log_cod = ' + iLogradouro.ToString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('tipo').AsString;
end;

function TControllerEndereco.GetPaisIDDefault: String;
begin
  Result := FDAO.Configuracao.Padrao.PaisID;
end;

function TControllerEndereco.GetPaisNome(const sPais : String): String;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select       ')
    .SQL('  pais_nome   ')
    .SQL('from TBPAIS')
    .SQL('where (pais_id = ' + sPais.Trim.QuotedString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('pais_nome').AsString;
end;

function TControllerEndereco.GetEstadoNome(const iEstado: Integer): String;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select       ')
    .SQL('  est_nome   ')
    .SQL('from TBESTADO')
    .SQL('where (est_cod = ' + iEstado.ToString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('est_nome').AsString;
end;

class function TControllerEndereco.New: IControllerEndereco;
begin
  Result := Self.Create;
end;

function TControllerEndereco.SetBairro(const iCidade: Integer; const sNome: String): Integer;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select')
    .SQL('  g.cod_bairro ')
    .SQL('from SET_BAIRRO(' + QuotedStr(sNome.Trim.ToUpper) + ', ' + IntToStr(iCidade) + ', null) g')
    .Open;

  Result := IDAO.DataSet.FieldByName('cod_bairro').AsInteger;

  IDAO.CommitTransaction;
end;

function TControllerEndereco.SetLogradouro(const iCidade: Integer; const sNome: String; var Tipo: Smallint): Integer;
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

function TControllerEndereco.GetCidadeID(const aIBGE: Currency): Integer;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select')
    .SQL('  cid_cod ')
    .SQL('from TBCIDADE')
    .SQL('where (cid_ibge = ' + aIBGE.ToString + ')')
    .Open;

  Result := IDAO.DataSet.FieldByName('cid_cod').AsInteger;
end;

function TControllerEndereco.GetCidadeIDDefault: Integer;
begin
  Result := FDAO.Configuracao.Padrao.CidadeID;
end;

end.
