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
      FListaNFePendente : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerXML_NFeEnviada;

      function ListaNFePendente(aCNPJEmissor : String) : IModelDAOCustom;
      function EmissaoNFePendente(aCNPJEmissor : String) : Boolean;
  end;

implementation

uses
  System.SysUtils;

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

function TControllerXML_NFeEnviada.ListaNFePendente(aCNPJEmissor: String): IModelDAOCustom;
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
    .SQL('where v.codemp      = :empresa')
    .SQL('  and v.status      = 3') // -- Finalizada
    .SQL('  and v.nfe_enviada = 0') // -- NF-e nao enviada
    .SQL('  and v.dtvenda between (current_timestamp - 60) and current_timestamp')
    .SQL('  and v.lote_nfe_numero is not null')
    .SQL('  and v.lote_nfe_recibo is not null')
    .SQL('  and v.nfe is null                ')
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
    .SQL('where c.codemp      = :empresa')
    .SQL('  and c.status      = 2') // -- Finalizada
    .SQL('  and c.nfe_enviada = 0') // -- NF-e nao enviada
    .SQL('  and c.dtemiss between (current_timestamp - 60) and current_timestamp')
    .SQL('  and c.lote_nfe_numero is not null')
    .SQL('  and c.lote_nfe_recibo is not null')
    .SQL('  and c.nf is null')
    .SQL('  ')
    .SQL('order by  ')
    .SQL('    1 desc')
    .SQL('  , 3 desc')
    .SQL('  , 7 asc ')
    .ParamsByName('empresa', aCNPJEmissor.Trim)
    .Open;

  Result := FListaNFePendente;
end;

class function TControllerXML_NFeEnviada.New: IControllerXML_NFeEnviada;
begin
  Result := Self.Create;
end;

end.
