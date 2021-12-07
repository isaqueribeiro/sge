unit SGE.Controller.XML_NFeImportada;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // XML das Notas Fiscais Eletrônicas importadas
  TControllerXML_NFeImportada = class(TController, IControllerXML_NFeImportada)
    private
//      FListaLotePendente,
//      FListaNFePendente : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerXML_NFeImportada;

      function GetUltimoNSUImportado(const aEmpresa: String): Int64;
      function GetArrayNSUImportados(const aEmpresa: String): String;
//
//      function ListaNFePendente(aCNPJEmissor : String) : IModelDAOCustom; overload;
//      function ListaNFePendente(aCNPJEmissor, aRecibo : String) : IModelDAOCustom; overload;
//      function EmissaoNFePendente(aCNPJEmissor : String) : Boolean;
//      function PesquisarLote(aCNPJEmissor, aRecibo : String; aLoteEnvioNFE : TLoteEnvioNFE) : IModelDAOCustom;
  end;

  // Pesquisa de Notas Fiscais Eletrônicas importadas
  TControllerNFeImportada = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils;

{ TControllerXML_NFeImportada }

constructor TControllerXML_NFeImportada.Create;
begin
  inherited Create(TModelDAOFactory.New.XML_NFeEnviada);
end;

destructor TControllerXML_NFeImportada.Destroy;
begin
  inherited;
end;

function TControllerXML_NFeImportada.GetArrayNSUImportados(const aEmpresa: String): String;
Var
  aBusca : IModelDAOCustom;
begin
  aBusca := TModelDAOFactory.New.Busca;
  aBusca
    .Clear
    .SQL('Select')
    .SQL('  list(n.nsu) as lista')
    .SQL('from TBNFE_IMPORTADA n')
    .SQL('where (n.empresa = :empresa)')
    .SQL('  and (n.emissao between (current_date - 30) and (current_date + 1))')
    .ParamsByName('empresa', aEmpresa.Trim)
    .Open;

  if (aBusca.DataSet.FieldByName('lista').AsString = EmptyStr) then
    Result := EmptyStr
  else
    Result := aBusca.DataSet.FieldByName('lista').AsString;
end;

function TControllerXML_NFeImportada.GetUltimoNSUImportado(const aEmpresa: String): Int64;
Var
  aBusca : IModelDAOCustom;
begin
  aBusca := TModelDAOFactory.New.Busca;
  aBusca
    .Clear
    .SQL('Select')
    .SQL('  max(nsu) as nsu')
    .SQL('from TBNFE_IMPORTADA')
    .SQL('where (empresa = :empresa)')
    .ParamsByName('empresa', aEmpresa.Trim)
    .Open;

  Result := aBusca.DataSet.FieldByName('nsu').AsLargeInt;
end;

//function TControllerXML_NFeImportada.EmissaoNFePendente(aCNPJEmissor: String): Boolean;
//begin
//  Result := not Self.ListaNFePendente(aCNPJEmissor).DataSet.IsEmpty;
//end;
//
//function TControllerXML_NFeImportada.ListaNFePendente(aCNPJEmissor, aRecibo: String): IModelDAOCustom;
//begin
//  if not Assigned(FListaNFePendente) then
//    FListaNFePendente := TModelDAOFactory.New.Busca;
//
//  FListaNFePendente
//    .Clear
//    .SQL('Select')
//    .SQL('    v.ano        as Ano   ')
//    .SQL('  , v.codcontrol as Numero')
//    .SQL('  , cast(v.dtvenda as date) as Data')
//    .SQL('  , 1            as TipoNFE') // -- Saida
//    .SQL('  , ''Saída/Venda''   as Tipo')
//    .SQL('  , v.lote_nfe_numero as Lote  ')
//    .SQL('  , v.lote_nfe_recibo as Recibo')
//    .SQL('from TBVENDAS v')
//    .SQL('where (v.codemp      = :empresa)')
//    .SQL('  and (v.status      = 3)') // -- Finalizada
//    .SQL('  and (v.nfe_enviada = 0)') // -- NF-e nao enviada
//    .SQL('  and (v.dtvenda between (current_timestamp - 60) and current_timestamp)')
//    .SQL('  and (v.lote_nfe_numero is not null)')
//    .SQL('  and (v.lote_nfe_recibo is not null)')
//    .SQL('  and (v.nfe is null)                ')
//    .SQL('  and ((v.lote_nfe_recibo = :recibo) or (:todos = 1))')
//    .SQL('  ')
//    .SQL('union')
//    .SQL('  ')
//    .SQL('Select')
//    .SQL('    c.ano        as Ano    ')
//    .SQL('  , c.codcontrol as Numero ')
//    .SQL('  , c.dtent      as Data   ')
//    .SQL('  , 0            as TipoNFE') // -- Entrada
//    .SQL('  , ''Entrada/Compra'' as Tipo')
//    .SQL('  , c.lote_nfe_numero  as Lote  ')
//    .SQL('  , c.lote_nfe_recibo  as Recibo')
//    .SQL('from TBCOMPRAS c')
//    .SQL('where (c.codemp      = :empresa)')
//    .SQL('  and (c.status      = 2)') // -- Finalizada
//    .SQL('  and (c.nfe_enviada = 0)') // -- NF-e nao enviada
//    .SQL('  and (c.dtemiss between (current_timestamp - 60) and current_timestamp)')
//    .SQL('  and (c.lote_nfe_numero is not null)')
//    .SQL('  and (c.lote_nfe_recibo is not null)')
//    .SQL('  and (c.nf is null)')
//    .SQL('  and ((c.lote_nfe_recibo = :recibo) or (:todos = 1))')
//    .SQL('  ')
//    .SQL('order by  ')
//    .SQL('    1 desc')
//    .SQL('  , 3 desc')
//    .SQL('  , 7 asc ')
//    .ParamsByName('empresa', aCNPJEmissor.Trim)
//    .ParamsByName('recibo',  aRecibo.Trim)
//    .ParamsByName('todos',   IfThen(aRecibo.Trim = EmptyStr, '1', '0').ToInteger)
//    .Open;
//
//  Result := FListaNFePendente;
//end;
//
//function TControllerXML_NFeImportada.ListaNFePendente(aCNPJEmissor: String): IModelDAOCustom;
//begin
//  Result := Self.ListaNFePendente(aCNPJEmissor, EmptyStr);
//end;
//
class function TControllerXML_NFeImportada.New: IControllerXML_NFeImportada;
begin
  Result := Self.Create;
end;

//function TControllerXML_NFeImportada.PesquisarLote(aCNPJEmissor, aRecibo : String; aLoteEnvioNFE : TLoteEnvioNFE): IModelDAOCustom;
//begin
//  if not Assigned(FListaLotePendente) then
//    FListaLotePendente := TModelDAOFactory.New.Busca;
//
//  FListaNFePendente
//    .Clear
//    .SQL('Select')
//    .SQL('    v.ano        as Ano')
//    .SQL('  , v.codcontrol as Numero')
//    .SQL('  , 1            as TipoNFE')
//    .SQL('  , ''Saída/Venda''   as Tipo')
//    .SQL('  , v.lote_nfe_numero as Lote')
//    .SQL('  , v.lote_nfe_recibo as Recibo')
//    .SQL('  , v.codcli          as Destinatario')
//    .SQL('from TBVENDAS v')
//    .SQL('where (v.codemp = :empresa)');
//
//  if (aLoteEnvioNFE.Ano > 0) and (aLoteEnvioNFE.Numero > 0) then
//    FListaNFePendente
//      .SQL('  and (v.lote_nfe_ano    = :ano_lote)')
//      .SQL('  and (v.lote_nfe_numero = :numero_lote)');
//
//  if (not aRecibo.IsEmpty) then
//    FListaNFePendente
//      .SQL('  and (v.lote_nfe_recibo = :recibo)');
//
//  FListaNFePendente
//    .SQL('')
//    .SQL('union')
//    .SQL('')
//    .SQL('Select')
//    .SQL('    c.ano        as Ano')
//    .SQL('  , c.codcontrol as Numero')
//    .SQL('  , 0            as TipoNFE')
//    .SQL('  , ''Entrada/Compra'' as Tipo')
//    .SQL('  , c.lote_nfe_numero  as Lote')
//    .SQL('  , c.lote_nfe_recibo  as Recibo')
//    .SQL('  , f.cnpj             as Destinatario')
//    .SQL('from TBCOMPRAS c')
//    .SQL('  left join TBFORNECEDOR f on (f.codforn = c.codforn)')
//    .SQL('where (c.codemp = :empresa)');
//
//  if (aLoteEnvioNFE.Ano > 0) and (aLoteEnvioNFE.Numero > 0) then
//    FListaNFePendente
//      .SQL('  and (c.lote_nfe_ano    = :ano_lote)')
//      .SQL('  and (c.lote_nfe_numero = :numero_lote)');
//
//  if (not aRecibo.IsEmpty) then
//    FListaNFePendente
//      .SQL('  and (c.lote_nfe_recibo = :recibo)');
//
//  FListaNFePendente
//    .ParamsByName('empresa',     aCNPJEmissor.Trim)
//    .ParamsByName('ano_lote',    aLoteEnvioNFE.Ano)
//    .ParamsByName('numero_lote', aLoteEnvioNFE.Numero)
//    .ParamsByName('recibo',      aRecibo.Trim)
//    .Open;
//
//  Result := FListaNFePendente;
//end;
//
{ TControllerNFeImportada }

constructor TControllerNFeImportada.Create;
begin
  inherited Create(TModelDAOFactory.New.NFeImportada);
end;

destructor TControllerNFeImportada.Destroy;
begin
  inherited;
end;

class function TControllerNFeImportada.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
