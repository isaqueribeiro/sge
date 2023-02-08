unit SGE.Controller.XML_NFeEnviada;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // XML das Notas Fiscais Eletrônicas enviadas (Compras/Vendas)
  TControllerXML_NFeEnviada = class(TController, IControllerXML_NFeEnviada)
    private
      FListaLotePendente,
      FListaNFePendente : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerXML_NFeEnviada;

      function ListaNFePendente(aCNPJEmissor : String) : IModelDAOCustom; overload;
      function ListaNFePendente(aCNPJEmissor, aRecibo : String) : IModelDAOCustom; overload;
      function EmissaoNFePendente(aCNPJEmissor : String) : Boolean;
      function PesquisarLote(aCNPJEmissor, aRecibo : String; aLoteEnvioNFE : TLoteEnvioNFE) : IModelDAOCustom;
  end;

  // Pesquisa de Notas Fiscais Eletrônicas enviadas (Compras/Vendas)
  TControllerNFeEnviada = class(TController, IControllerCustom)
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

{ TControllerXML_NFeEnviada }

constructor TControllerXML_NFeEnviada.Create;
begin
  inherited Create(TModelDAOFactory.New.XML_NFeEnviada);
end;

destructor TControllerXML_NFeEnviada.Destroy;
begin
  inherited;
end;

function TControllerXML_NFeEnviada.EmissaoNFePendente(aCNPJEmissor: String): Boolean;
begin
  Result := not Self.ListaNFePendente(aCNPJEmissor).DataSet.IsEmpty;
end;

function TControllerXML_NFeEnviada.ListaNFePendente(aCNPJEmissor, aRecibo: String): IModelDAOCustom;
begin
  if not Assigned(FListaNFePendente) then
    FListaNFePendente := TModelDAOFactory.New.Busca;

  FListaNFePendente
    .Clear
    .SQL('Select')
    .SQL('    v.ano        as Ano   ')
    .SQL('  , v.codcontrol as Numero')
    .SQL('  , cast(v.dtvenda as date) as Data')
    .SQL('  , 1            as TipoNFE') // -- Saida
    .SQL('  , ''Saída/Venda''   as Tipo')
    .SQL('  , v.lote_nfe_numero as Lote  ')
    .SQL('  , v.lote_nfe_recibo as Recibo')
    .SQL('from TBVENDAS v')
    .SQL('where (v.codemp      = :empresa)')
    .SQL('  and (v.status      = 3)') // -- Finalizada
    .SQL('  and (v.nfe_enviada = 0)') // -- NF-e nao enviada
    .SQL('  and (v.dtvenda between (current_timestamp - 60) and current_timestamp)')
    .SQL('  and (v.lote_nfe_numero is not null)')
    .SQL('  and (v.lote_nfe_recibo is not null)')
    .SQL('  and (v.nfe is null)                ')
    .SQL('  and ((v.lote_nfe_recibo = :recibo) or (:todos = 1))')
    .SQL('  ')
    .SQL('union')
    .SQL('  ')
    .SQL('Select')
    .SQL('    c.ano        as Ano    ')
    .SQL('  , c.codcontrol as Numero ')
    .SQL('  , c.dtent      as Data   ')
    .SQL('  , 0            as TipoNFE') // -- Entrada
    .SQL('  , ''Entrada/Compra'' as Tipo')
    .SQL('  , c.lote_nfe_numero  as Lote  ')
    .SQL('  , c.lote_nfe_recibo  as Recibo')
    .SQL('from TBCOMPRAS c')
    .SQL('where (c.codemp      = :empresa)')
    .SQL('  and (c.status      = 2)') // -- Finalizada
    .SQL('  and (c.nfe_enviada = 0)') // -- NF-e nao enviada
    .SQL('  and (c.dtemiss between (current_timestamp - 60) and current_timestamp)')
    .SQL('  and (c.lote_nfe_numero is not null)')
    .SQL('  and (c.lote_nfe_recibo is not null)')
    .SQL('  and (c.nf is null)')
    .SQL('  and ((c.lote_nfe_recibo = :recibo) or (:todos = 1))')
    .SQL('  ')
    .SQL('order by  ')
    .SQL('    1 desc')
    .SQL('  , 3 desc')
    .SQL('  , 7 asc ')
    .ParamsByName('empresa', aCNPJEmissor.Trim)
    .ParamsByName('recibo',  aRecibo.Trim)
    .ParamsByName('todos',   IfThen(aRecibo.Trim = EmptyStr, '1', '0').ToInteger)
    .Open;

  Result := FListaNFePendente;
end;

function TControllerXML_NFeEnviada.ListaNFePendente(aCNPJEmissor: String): IModelDAOCustom;
begin
  Result := Self.ListaNFePendente(aCNPJEmissor, EmptyStr);
end;

class function TControllerXML_NFeEnviada.New: IControllerXML_NFeEnviada;
begin
  Result := Self.Create;
end;

function TControllerXML_NFeEnviada.PesquisarLote(aCNPJEmissor, aRecibo : String; aLoteEnvioNFE : TLoteEnvioNFE): IModelDAOCustom;
begin
  if not Assigned(FListaLotePendente) then
    FListaLotePendente := TModelDAOFactory.New.Busca;

  FListaLotePendente
    .Clear
    .SQL('Select')
    .SQL('    v.ano        as Ano')
    .SQL('  , v.codcontrol as Numero')
    .SQL('  , 1            as TipoNFE')
    .SQL('  , ''Saída/Venda''   as Tipo')
    .SQL('  , v.lote_nfe_numero as Lote')
    .SQL('  , v.lote_nfe_recibo as Recibo')
    .SQL('  , v.codcli          as Destinatario')
    .SQL('from TBVENDAS v')
    .SQL('where (v.codemp = :empresa)');

  if (aLoteEnvioNFE.Ano > 0) and (aLoteEnvioNFE.Numero > 0) then
    FListaLotePendente
      .SQL('  and (v.lote_nfe_ano    = :ano_lote)')
      .SQL('  and (v.lote_nfe_numero = :numero_lote)');

  if (not aRecibo.IsEmpty) then
    FListaLotePendente
      .SQL('  and (v.lote_nfe_recibo = :recibo)');

  FListaLotePendente
    .SQL('')
    .SQL('union')
    .SQL('')
    .SQL('Select')
    .SQL('    c.ano        as Ano')
    .SQL('  , c.codcontrol as Numero')
    .SQL('  , 0            as TipoNFE')
    .SQL('  , ''Entrada/Compra'' as Tipo')
    .SQL('  , c.lote_nfe_numero  as Lote')
    .SQL('  , c.lote_nfe_recibo  as Recibo')
    .SQL('  , f.cnpj             as Destinatario')
    .SQL('from TBCOMPRAS c')
    .SQL('  left join TBFORNECEDOR f on (f.codforn = c.codforn)')
    .SQL('where (c.codemp = :empresa)');

  if (aLoteEnvioNFE.Ano > 0) and (aLoteEnvioNFE.Numero > 0) then
    FListaLotePendente
      .SQL('  and (c.lote_nfe_ano    = :ano_lote)')
      .SQL('  and (c.lote_nfe_numero = :numero_lote)');

  if (not aRecibo.IsEmpty) then
    FListaLotePendente
      .SQL('  and (c.lote_nfe_recibo = :recibo)');

  FListaLotePendente
    .ParamsByName('empresa',     aCNPJEmissor.Trim)
    .ParamsByName('ano_lote',    aLoteEnvioNFE.Ano)
    .ParamsByName('numero_lote', aLoteEnvioNFE.Numero)
    .ParamsByName('recibo',      aRecibo.Trim)
    .Open;

  Result := FListaLotePendente;
end;

{ TControllerNFeEnviada }

constructor TControllerNFeEnviada.Create;
begin
  inherited Create(TModelDAOFactory.New.NFeEnviada);
end;

destructor TControllerNFeEnviada.Destroy;
begin
  inherited;
end;

class function TControllerNFeEnviada.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
