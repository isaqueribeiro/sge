unit SGE.Model.DAO.Cliente;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOCliente = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Table
  TModelDAOClienteTotalCompras = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Table
  TModelDAOClienteTitulos = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Table
  TModelDAOClienteEstoque = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

uses
  UConstantesDGE;

{ TModelDAOCliente }

constructor TModelDAOCliente.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCLIENTE')
      .KeyFields('codigo')
      .AutoIncFields('codigo')
      .GeneratorName('GEN_CLIENTE_ID')
      .SQL
        .Clear
        .Add('Select                         ')
        .Add('    cl.Codigo                  ')
        .Add('  , cl.Pessoa_fisica           ')
        .Add('  , cl.Cnpj                    ')
        .Add('  , cl.Tipo                    ')
        .Add('  , cl.Nome                    ')
        .Add('  , cl.NomeFant                ')
        .Add('  , cl.Inscest                 ')
        .Add('  , cl.Inscmun                 ')
        .Add('  , cl.Ender                   ')
        .Add('  , cl.Complemento             ')
        .Add('  , cl.Numero_end              ')
        .Add('  , cl.Bairro                  ')
        .Add('  , cl.Cep                     ')
        .Add('  , cl.Cidade                  ')
        .Add('  , cl.Uf                      ')
        .Add('  , cl.Fone                    ')
        .Add('  , cl.FoneCel                 ')
        .Add('  , cl.FoneComerc              ')
        .Add('  , cl.Tlg_tipo                ')
        .Add('  , cl.Log_cod                 ')
        .Add('  , cl.Bai_cod                 ')
        .Add('  , cl.Cid_cod                 ')
        .Add('  , cl.Est_cod                 ')
        .Add('  , cl.Email                   ')
        .Add('  , cl.Site                    ')
        .Add('  , cl.Pais_id                 ')
        .Add('  , cl.Valor_limite_compra     ')
        .Add('  , cl.Vendedor_cod            ')
        .Add('  , cl.DtCad                   ')
        .Add('  , cl.Bloqueado               ')
        .Add('  , cl.Bloqueado_data          ')
        .Add('  , cl.Bloqueado_motivo        ')
        .Add('  , cl.Bloqueado_usuario       ')
        .Add('  , cl.Bloqueado_automatico    ')
        .Add('  , cl.DesBloqueado_data       ')
        .Add('  , cl.Usuario                 ')
        .Add('  , cl.emitir_nfe_devolucao    ')
        .Add('  , cl.custo_oper_percentual   ')
        .Add('  , cl.custo_oper_frete        ')
        .Add('  , cl.custo_oper_outros       ')
        .Add('  , cl.entrega_fracionada_venda')
        .Add('  , cl.banco					         ')
        .Add('  , cl.agencia                 ')
        .Add('  , cl.cc                      ')
        .Add('  , cl.praca                   ')
        .Add('  , cl.banco_2                 ')
        .Add('  , cl.agencia_2               ')
        .Add('  , cl.cc_2                    ')
        .Add('  , cl.praca_2                 ')
        .Add('  , cl.banco_3                 ')
        .Add('  , cl.agencia_3               ')
        .Add('  , cl.cc_3                    ')
        .Add('  , cl.praca_3                 ')
        .Add('  , cl.observacao              ')
        .Add('  , cl.ativo                   ')
        .Add('  , coalesce( cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '' '', '''') || l.Log_nome as varchar(250)), cl.Ender ) as Logradouro')
        .Add('  , coalesce(c.Cid_nome, cl.Cidade) as Cid_nome')
        .Add('  , coalesce(u.Est_nome, cl.Uf) as Est_nome    ')
        .Add('  , p.Pais_nome                                ')
        .Add('  , coalesce(est.produtos,  0) as produtos     ')
        .Add('  , coalesce(est.valores, 0.0) as valores      ')
        .Add('from TBCLIENTE cl                              ')
        .Add('  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = cl.Tlg_tipo)')
        .Add('  left join TBLOGRADOURO l on (l.Log_cod = cl.Log_cod)      ')
        .Add('  left join TBCIDADE c on (c.Cid_cod = cl.Cid_cod)          ')
        .Add('  left join TBESTADO u on (u.Est_cod = cl.Est_cod)          ')
        .Add('  left join TBPAIS p on (p.Pais_id = cl.Pais_id)            ')
        .Add('  left join (                                               ')
        .Add('    Select                                                  ')
        .Add('        x.cod_cliente                                       ')
        .Add('      , count(x.cod_produto) as produtos                    ')
        .Add('      , sum(x.quantidade * x.valor_medio) as valores        ')
        .Add('    from TBCLIENTE_ESTOQUE x                                ')
        .Add('    where (x.cod_cliente <> 1)                              ')
        .Add('      and (x.quantidade > 0.0)                              ')
        .Add('    group by                                                ')
        .Add('        x.cod_cliente                                       ')
        .Add('  ) est on (est.cod_cliente = cl.codigo)                    ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen    := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord  := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost   := DataSetBeforePost;
end;

destructor TModelDAOCliente.Destroy;
begin
  inherited;
end;

class function TModelDAOCliente.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCliente.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Logradouro').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Cid_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Est_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Pais_nome').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('produtos').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('valores').ProviderFlags    := [];
end;

procedure TModelDAOCliente.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOCliente.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if FieldByName('DTCAD').IsNull then
      FieldByName('DTCAD').AsDateTime := Now;

    if (Trim(FieldByName('USUARIO').AsString) = EmptyStr) then
      FieldByName('USUARIO').AsString := Usuario.Login;

    if (Trim(FieldByName('BANCO').AsString) = EmptyStr) then
      FieldByName('BANCO').Clear;

    if (Trim(FieldByName('BANCO_2').AsString) = EmptyStr) then
      FieldByName('BANCO_2').Clear;

    if (Trim(FieldByName('BANCO_3').AsString) = EmptyStr) then
      FieldByName('BANCO_3').Clear;
  end;
end;

procedure TModelDAOCliente.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('NUMERO_END').AsString        := 'S/N';
    FieldByName('COMPLEMENTO').AsString       := EmptyStr;
    FieldByName('DTCAD').AsDateTime           := Now;
    FieldByName('ATIVO').AsInteger            := 1;
    FieldByName('BLOQUEADO').AsInteger                := 0; // Ord(False);
    FieldByName('BLOQUEADO_AUTOMATICO').AsInteger     := 0;
    FieldByName('EMITIR_NFE_DEVOLUCAO').AsInteger     := 0; // Ord(False);
    FieldByName('CUSTO_OPER_PERCENTUAL').AsInteger    := 0; // Ord(False);

    FieldByName('VENDEDOR_COD').Clear;
    FieldByName('BLOQUEADO_DATA').Clear;
    FieldByName('BLOQUEADO_MOTIVO').Clear;
    FieldByName('BLOQUEADO_USUARIO').Clear;
    FieldByName('BANCO').Clear;
    FieldByName('AGENCIA').Clear;
    FieldByName('CC').Clear;
    FieldByName('PRACA').Clear;
    FieldByName('BANCO_2').Clear;
    FieldByName('AGENCIA_2').Clear;
    FieldByName('CC_2').Clear;
    FieldByName('PRACA_2').Clear;
    FieldByName('BANCO_3').Clear;
    FieldByName('AGENCIA_3').Clear;
    FieldByName('CC_3').Clear;
    FieldByName('PRACA_3').Clear;
    FieldByName('OBSERVACAO').Clear;
  end;
end;

{ TModelDAOClienteTotalCompras }

constructor TModelDAOClienteTotalCompras.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select ')
        .Add('    g.Valor_limite           ')
        .Add('  , g.Valor_compras_abertas  ')
        .Add('  , g.Valor_limite_disponivel')
        .Add('from GET_LIMITE_DISPONIVEL_CLIENTE(:cliente) g')
      .&End
    .ParamByName('cliente',0)
    .Open;
end;

destructor TModelDAOClienteTotalCompras.Destroy;
begin
  inherited;
end;

class function TModelDAOClienteTotalCompras.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAOClienteTitulos }

constructor TModelDAOClienteTitulos.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select        ')
        .Add('    1 as tipo ') //-- Títulos em aberto
        .Add('  , r.Anolanc ')
        .Add('  , r.Numlanc ')
        .Add('  , r.Anolanc || ''/'' || right(''0000000'' || r.Numlanc, 7) as Lancamento')
        .Add('  , r.Parcela    ')
        .Add('  , r.Dtemiss    ')
        .Add('  , r.Dtvenc     ')
        .Add('  , r.Forma_pagto')
        .Add('  , f.Descri as Forma_pagto_Desc')
        .Add('  , r.Nossonumero')
        .Add('  , r.Valorrec   ')
        .Add('  , r.Valormulta ')
        .Add('  , r.Valorrectot')
        .Add('  , r.Valorsaldo ')
        .Add('  , bx.valor_pago')
        .Add('  , r.Status     ')
        .Add('  , r.Situacao   ')
        .Add('  , r.Anovenda   ')
        .Add('  , r.Numvenda   ')
        .Add('  , r.Anovenda || ''/'' || right(''0000000'' || r.Numvenda, 7) as Venda')
        .Add('  , v.Serie')
        .Add('  , v.Nfe  ')
        .Add('  , ''S'' || v.Serie || ''/'' || right(''0000000'' || v.Nfe, 7) as NFE_Serie')
        .Add('from TBCONTREC r')
        .Add('  inner join TBFORMPAGTO f on (f.Cod = r.Forma_pagto)')
        .Add('  left join (    ')
        .Add('    Select       ')
        .Add('        b.anolanc')
        .Add('      , b.numlanc')
        .Add('      , sum(b.valor_baixa) as valor_pago')
        .Add('    from TBCONTREC_BAIXA b')
        .Add('    group by              ')
        .Add('        b.anolanc         ')
        .Add('      , b.numlanc         ')
        .Add('  ) bx on (bx.anolanc = r.anolanc and bx.numlanc = r.numlanc)')
        .Add('  left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)')
        .Add('where r.Baixado = 0       ')
        .Add('  and r.Parcela > 0       ')
        .Add('  and r.Situacao = 1      ')
        .Add('  and r.Cliente = :cliente')
        .Add('     ')
        .Add('Union')
        .Add('     ')
        .Add('Select first 12')
        .Add('    0 as tipo  ') // -- Títulos quitados
        .Add('  , r.Anolanc  ')
        .Add('  , r.Numlanc  ')
        .Add('  , r.Anolanc || ''/'' || right(''0000000'' || r.Numlanc, 7) as Lancamento')
        .Add('  , r.Parcela    ')
        .Add('  , r.Dtemiss    ')
        .Add('  , r.Dtvenc     ')
        .Add('  , r.Forma_pagto')
        .Add('  , f.Descri as Forma_pagto_Desc')
        .Add('  , r.Nossonumero')
        .Add('  , r.Valorrec   ')
        .Add('  , r.Valormulta ')
        .Add('  , r.Valorrectot')
        .Add('  , r.Valorsaldo ')
        .Add('  , bx.valor_pago')
        .Add('  , r.Status     ')
        .Add('  , r.Situacao   ')
        .Add('  , r.Anovenda   ')
        .Add('  , r.Numvenda   ')
        .Add('  , r.Anovenda || ''/'' || right(''0000000'' || r.Numvenda, 7) as Venda')
        .Add('  , v.Serie')
        .Add('  , v.Nfe  ')
        .Add('  , ''S'' || v.Serie || ''/'' || right(''0000000'' || v.Nfe, 7) as NFE_Serie')
        .Add('from TBCONTREC r')
        .Add('  inner join TBFORMPAGTO f on (f.Cod = r.Forma_pagto)')
        .Add('  left join (    ')
        .Add('    Select       ')
        .Add('        b.anolanc')
        .Add('      , b.numlanc')
        .Add('      , sum(b.valor_baixa) as valor_pago')
        .Add('    from TBCONTREC_BAIXA b')
        .Add('    group by     ')
        .Add('        b.anolanc')
        .Add('      , b.numlanc')
        .Add('  ) bx on (bx.anolanc = r.anolanc and bx.numlanc = r.numlanc)')
        .Add('  left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)')
        .Add('where r.Baixado  = 1       ')
        .Add('  and r.Situacao = 1       ')
        .Add('  and r.Cliente  = :cliente')
        .Add('  ')
        .Add('order by')
        .Add('    1 desc, 4 desc, 7 desc') //-- Tipo, Lancamentos, Vencimentos
      .&End
    .ParamByName('cliente',0)
    .Open;
end;

destructor TModelDAOClienteTitulos.Destroy;
begin
  inherited;
end;

class function TModelDAOClienteTitulos.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAOClienteEstoque }

constructor TModelDAOClienteEstoque.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCLIENTE_ESTOQUE')
      .KeyFields('cod_cliente;cod_produto;sequencial')
      .SQL
        .Clear
        .Add('Select                   ')
        .Add('    e.cod_cliente        ')
        .Add('  , e.cod_produto        ')
        .Add('  , e.sequencial         ')
        .Add('  , e.quantidade         ')
        .Add('  , e.valor_medio        ')
        .Add('  , e.usuario            ')
        .Add('  , e.ano_venda_ult      ')
        .Add('  , e.cod_venda_ult      ')
        .Add('  , e.lote_id            ')
        .Add('                         ')
        .Add('  , p.Codigo             ')
        .Add('  , p.Descri             ')
        .Add('  , p.Apresentacao       ')
        .Add('  , p.Descri_apresentacao')
        .Add('  , p.Modelo             ')
        .Add('  , p.Referencia         ')
        .Add('  , p.Secao              ')
        .Add('  , p.Preco              ')
        .Add('  , p.Unidade            ')
        .Add('  , g.Descri as Descricao_Grupo')
        .Add('  , f.Nome   as Nome_Fabricante')
        .Add('  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao    ')
        .Add('  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade')
        .Add('  , u.Unp_sigla                    ')
        .Add('  , a.descricao       as lote      ')
        .Add('  , a.data_fabricacao as fabricacao')
        .Add('  , a.data_validade   as validade  ')
        .Add('from TBCLIENTE_ESTOQUE e           ')
        .Add('  inner join TBPRODUTO p on (p.cod = e.cod_produto)      ')
        .Add('  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)        ')
        .Add('  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)    ')
        .Add('  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)')
        .Add('  left join TBFABRICANTE f on (f.Cod = p.Codfabricante)  ')
        .Add('  left join TBESTOQUE_ALMOX a on (a.id = e.lote_id)      ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen    := DataSetAfterOpen;
//  FConn.Query.DataSet.OnNewRecord  := DataSetNewRecord;
//  FConn.Query.DataSet.BeforePost   := DataSetBeforePost;
end;

destructor TModelDAOClienteEstoque.Destroy;
begin
  inherited;
end;

class function TModelDAOClienteEstoque.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOClienteEstoque.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Codigo').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Descri').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Apresentacao').ProviderFlags        := [];
  FConn.Query.DataSet.FieldByName('Descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Modelo').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('Referencia').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Secao').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('Preco').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('Unidade').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('Descricao_Grupo').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Nome_Fabricante').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Descricao_Secao').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Descricao_Unidade').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Unp_sigla').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('lote').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('fabricacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('validade  ').ProviderFlags := [];
end;

procedure TModelDAOClienteEstoque.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

end.
