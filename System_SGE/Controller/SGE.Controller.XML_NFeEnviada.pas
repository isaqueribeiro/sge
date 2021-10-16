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
      function PesquisarLote(const aRecibo : String; var aAno, aControle : Integer; var aDestinaratio : String) : IModelDAOCustom;
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

function TControllerXML_NFeEnviada.PesquisarLote(const aRecibo: String; var aAno, aControle: Integer;
  var aDestinaratio: String): IModelDAOCustom;
begin
  if not Assigned(FListaLotePendente) then
    FListaLotePendente := TModelDAOFactory.New.Busca;

    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('    v.ano        as Ano');
      SQL.Add('  , v.codcontrol as Numero');
      SQL.Add('  , 1            as TipoNFE');
      SQL.Add('  , ''Saída/Venda''   as Tipo');
      SQL.Add('  , v.lote_nfe_numero as Lote');
      SQL.Add('  , v.lote_nfe_recibo as Recibo');
      SQL.Add('  , v.codcli          as Destinatario');
      SQL.Add('from TBVENDAS v');
      SQL.Add('where v.codemp = ' + QuotedStr(dbCNPJ.Field.AsString));

      if (StrToIntDef(Trim(edAno.Text), 0) > 0) and (StrToIntDef(Trim(edNumeroLote.Text), 0) > 0) then
        SQL.Add('  and v.lote_nfe_ano = ' + Trim(edAno.Text) + ' and v.lote_nfe_numero = ' + Trim(edNumeroLote.Text));

      if (Trim(edNumeroRecibo.Text) <> EmptyStr) then
        SQL.Add('  and v.lote_nfe_recibo = ' + QuotedStr(Trim(edNumeroRecibo.Text)));

      SQL.Add('');
      SQL.Add('union');
      SQL.Add('');
      SQL.Add('Select');
      SQL.Add('    c.ano        as Ano');
      SQL.Add('  , c.codcontrol as Numero');
      SQL.Add('  , 0            as TipoNFE');
      SQL.Add('  , ''Entrada/Compra'' as Tipo');
      SQL.Add('  , c.lote_nfe_numero  as Lote');
      SQL.Add('  , c.lote_nfe_recibo  as Recibo');
      SQL.Add('  , f.cnpj             as Destinatario');
      SQL.Add('from TBCOMPRAS c');
      SQL.Add('  left join TBFORNECEDOR f on (f.codforn = c.codforn)');
      SQL.Add('where c.codemp = ' + QuotedStr(dbCNPJ.Field.AsString));

      if (StrToIntDef(Trim(edAno.Text), 0) > 0) and (StrToIntDef(Trim(edNumeroLote.Text), 0) > 0) then
        SQL.Add('  and c.lote_nfe_ano = ' + Trim(edAno.Text) + ' and c.lote_nfe_numero = ' + Trim(edNumeroLote.Text));

      if (Trim(edNumeroRecibo.Text) <> EmptyStr) then
        SQL.Add('  and c.lote_nfe_recibo = ' + QuotedStr(Trim(edNumeroRecibo.Text)));

      Open;


  Result := FListaLotePendente;
end;

end.
