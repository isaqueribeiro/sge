unit SGE.Model.DAO.Empresa;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOEmpresa = class(TModelDAO, IModelDAOCustom)
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
  TModelDAOConfiguracaoEmpresa = class(TModelDAO, IModelDAOCustom)
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

  // View
  TModelDAOEmpresaView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

uses
  UConstantesDGE;

{ TModelDAOEmpresa }

constructor TModelDAOEmpresa.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBEMPRESA')
      .KeyFields('Cnpj')
      .AutoIncFields('Codigo')
      .GeneratorName('GEN_EMPRESA_ID')
      .SQL
        .Clear
        .Add('Select')
        .Add('    e.Codigo       ')
        .Add('  , e.Pessoa_fisica')
        .Add('  , e.Cnpj         ')
        .Add('  , e.Rzsoc        ')
        .Add('  , e.Nmfant       ')
        .Add('  , e.Ie           ')
        .Add('  , e.Im           ')
        .Add('  , e.Cnae         ')
        .Add('  , e.Segmento     ')
        .Add('  , e.Ender        ')
        .Add('  , e.Complemento  ')
        .Add('  , e.Numero_end   ')
        .Add('  , e.Bairro       ')
        .Add('  , e.Cep          ')
        .Add('  , e.Cidade       ')
        .Add('  , e.Uf           ')
        .Add('  , e.Fone         ')
        .Add('  , e.Fone2        ')
        .Add('  , e.Logo         ')
        .Add('  , e.Tlg_tipo     ')
        .Add('  , e.Log_cod      ')
        .Add('  , e.Bai_cod      ')
        .Add('  , e.Cid_cod      ')
        .Add('  , e.Est_cod      ')
        .Add('  , e.Email        ')
        .Add('  , e.Home_page    ')
        .Add('  , e.Chave_acesso_nfe')
        .Add('  , e.Tipo_Regime_nfe ')
        .Add('  , e.Serie_nfe       ')
        .Add('  , e.Numero_nfe      ')
        .Add('  , e.Lote_Ano_nfe    ')
        .Add('  , e.Lote_Num_nfe    ')
        .Add('  , e.Carta_correcao_nfe')
        .Add('  , e.Serie_nfce        ')
        .Add('  , e.Numero_nfce       ')
        .Add('  , e.Pais_id           ')
        .Add('  , e.Usuario           ')
        .Add('  , e.Ativa             ')
        .Add('  , cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '' '', '''') || l.Log_nome as varchar(250)) as Logradouro')
        .Add('  , c.Cid_nome ')
        .Add('  , u.Est_nome ')
        .Add('  , p.Pais_nome')
        .Add('from TBEMPRESA e ')
        .Add('  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = e.Tlg_tipo)')
        .Add('  left join TBLOGRADOURO l on (l.Log_cod = e.Log_cod)      ')
        .Add('  left join TBCIDADE c on (c.Cid_cod = e.Cid_cod)          ')
        .Add('  left join TBESTADO u on (u.Est_cod = e.Est_cod)          ')
        .Add('  left join TBPAIS p on (p.Pais_id = e.Pais_id)            ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen    := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord  := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost   := DataSetBeforePost;
end;

destructor TModelDAOEmpresa.Destroy;
begin
  inherited;
end;

class function TModelDAOEmpresa.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOEmpresa.SetProviderFlags;
var
  I : Integer;
begin
  for I := 0 to Pred(FConn.Query.DataSet.Fields.Count) do
    FConn.Query.DataSet.Fields[I].ReadOnly := False; // Liberar edição dos campos

  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Logradouro').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Cid_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Est_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Pais_nome').ProviderFlags  := [];
end;

procedure TModelDAOEmpresa.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOEmpresa.DataSetBeforePost(DataSet: TDataSet);
begin
//  with FConn.Query.DataSet do
//  begin
//    if FieldByName('ATIVO').IsNull then
//      FieldByName('ATIVO').AsInteger := 1;
//  end;
end;

procedure TModelDAOEmpresa.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('PESSOA_FISICA').AsInteger := 0;
    FieldByName('SERIE_NFE').AsInteger     := 1;
    FieldByName('NUMERO_NFE').AsInteger    := 0;
    FieldByName('SERIE_NFCE').AsInteger    := 1;
    FieldByName('NUMERO_NFCE').AsInteger   := 0;
    FieldByName('LOTE_ANO_NFE').AsInteger  := FormatDateTime('yyyy', Date).ToInteger;
    FieldByName('LOTE_NUM_NFE').AsInteger  := 0;
    FieldByName('CARTA_CORRECAO_NFE').AsInteger := 0;
    FieldByName('SEGMENTO').AsInteger     := SEGMENTO_PADRAO_ID;
    FieldByName('ATIVA').AsInteger        := FLAG_SIM;
  end;
end;

{ TModelDAOConfiguracaoEmpresa }

constructor TModelDAOConfiguracaoEmpresa.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCONFIGURACAO')
      .KeyFields('empresa')
      .SQL
        .Clear
        .Add('Select                              ')
        .Add('    c.empresa                       ')
        .Add('  , c.email_conta                   ')
        .Add('  , c.email_senha                   ')
        .Add('  , c.email_pop                     ')
        .Add('  , c.email_smtp                    ')
        .Add('  , c.email_smtp_porta              ')
        .Add('  , c.email_requer_autenticacao     ')
        .Add('  , c.email_conexao_ssl             ')
        .Add('  , c.email_assunto_padrao          ')
        .Add('  , c.email_mensagem_padrao         ')
        .Add('  , c.cliente_permitir_duplicar_cnpj')
        .Add('  , c.cliente_permitir_vf_cnpj      ')
        .Add('  , c.custo_oper_calcular           ')
        .Add('  , c.permitir_venda_estoque_ins    ')
        .Add('  , c.venda_carrega_produto_ean     ')
        .Add('  , c.venda_forma_pagto_cartacredito')
        .Add('  , c.estoque_unico_empresas        ')
        .Add('  , c.estoque_satelite_cliente      ')
        .Add('  , c.autoriza_informa_cliente      ')
        .Add('  , c.usuario                       ')
        .Add('  , c.nfe_emitir                    ')
        .Add('  , c.nfe_serie                     ')
        .Add('  , c.nfe_numero                    ')
        .Add('  , c.nfe_lote                      ')
        .Add('  , c.nfe_carta_correcao            ')
        .Add('  , c.nfe_emitir_entrada            ')
        .Add('  , c.nfe_aceitar_nota_denegada     ')
        .Add('  , c.nfe_solicita_dh_saida         ')
        .Add('  , c.nfe_imprimir_cod_cliente      ')
        .Add('  , c.nfe_imprimir_cod_referencia   ')
        .Add('  , c.nfce_emitir                   ')
        .Add('  , c.nfce_serie                    ')
        .Add('  , c.nfce_numero                   ')
        .Add('  , c.nfce_token_id                 ')
        .Add('  , c.nfce_token                    ')
        .Add('  , c.rps_serie                     ')
        .Add('  , c.rps_numero                    ')
        .Add('  , c.nfse_emitir                   ')
        .Add('  , c.nfse_serie                    ')
        .Add('  , c.nfse_numero                   ')
        .Add('  , c.nfse_percentual_pis           ')
        .Add('  , c.nfse_percentual_cofins        ')
        .Add('  , c.nfse_percentual_csll          ')
        .Add('  , c.nfse_percentual_issqn         ')
        .Add('  , c.contador_codigo               ')
        .Add('  , c.contador_cnpjcpf              ')
        .Add('  , e.rzsoc                         ')
        .Add('  , e.nmfant                        ')
        .Add('  , f.nomeforn as contador_nome     ')
        .Add('from TBCONFIGURACAO c               ')
        .Add('  inner join TBEMPRESA e on (e.cnpj = c.empresa)')
        .Add('  left join TBFORNECEDOR f on (f.codforn = c.contador_codigo)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen    := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord  := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost   := DataSetBeforePost;
end;

destructor TModelDAOConfiguracaoEmpresa.Destroy;
begin
  inherited;
end;

class function TModelDAOConfiguracaoEmpresa.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOConfiguracaoEmpresa.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOConfiguracaoEmpresa.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (FieldByName('CONTADOR_CODIGO').AsInteger = 0) then
      FieldByName('CONTADOR_CODIGO').Clear;

    if (Trim(FieldByName('CONTADOR_CNPJCPF').AsString) = EmptyStr) then
      FieldByName('CONTADOR_CNPJCPF').Clear;

    if (Trim(FieldByName('CONTADOR_NOME').AsString) = EmptyStr) then
      FieldByName('CONTADOR_NOME').Clear;
  end;
end;

procedure TModelDAOConfiguracaoEmpresa.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    //FieldByName('EMPRESA').AsString            := Usuario.Empresa.CNPJ;
    FieldByName('EMPRESA').Clear;
    FieldByName('EMAIL_SMTP_PORTA').AsInteger  := PORTA_SMTP_PADRAO;
    FieldByName('EMAIL_REQUER_AUTENTICACAO').AsInteger := 0;
    FieldByName('EMAIL_CONEXAO_SSL').AsInteger         := 0;

    FieldByName('VENDA_CARREGA_PRODUTO_EAN').AsInteger := 0;

    FieldByName('NFE_EMITIR').AsInteger                := 0;
    FieldByName('NFE_EMITIR_ENTRADA').AsInteger        := 0;
    FieldByName('NFCE_EMITIR').AsInteger               := 0;
    FieldByName('NFSE_EMITIR').AsInteger               := 0;
    FieldByName('NFE_ACEITAR_NOTA_DENEGADA').AsInteger := 1;
    FieldByName('NFE_SOLICITA_DH_SAIDA').AsInteger     := 0;
    FieldByName('NFE_IMPRIMIR_COD_CLIENTE').AsInteger  := 0;
    FieldByName('NFE_IMPRIMIR_COD_REFERENCIA').AsInteger    := 0;
    FieldByName('CLIENTE_PERMITIR_DUPLICAR_CNPJ').AsInteger := 0;
    FieldByName('CLIENTE_PERMITIR_VF_CNPJ').AsInteger       := 0;
    FieldByName('CUSTO_OPER_CALCULAR').AsInteger            := 0;
    FieldByName('PERMITIR_VENDA_ESTOQUE_INS').AsInteger := 0;
    FieldByName('ESTOQUE_UNICO_EMPRESAS').AsInteger     := 0;
    FieldByName('ESTOQUE_SATELITE_CLIENTE').AsInteger   := 0;
    FieldByName('AUTORIZA_INFORMA_CLIENTE').AsInteger   := 0;

    FieldByName('RPS_SERIE').AsString                := '99';
    FieldByName('RPS_NUMERO').AsCurrency             := 0;
    FieldByName('NFSE_SERIE').AsString               := '99';
    FieldByName('NFSE_NUMERO').AsCurrency            := 0;
    FieldByName('NFSE_PERCENTUAL_PIS').AsCurrency    := 0.0;
    FieldByName('NFSE_PERCENTUAL_COFINS').AsCurrency := 0.0;
    FieldByName('NFSE_PERCENTUAL_CSLL').AsCurrency   := 0.0;
    FieldByName('NFSE_PERCENTUAL_ISSQN').AsCurrency  := 0.0;

    FieldByName('VENDA_FORMA_PAGTO_CARTACREDITO').Clear;

    FieldByName('NFE_SERIE').Clear;
    FieldByName('NFE_NUMERO').Clear;
    FieldByName('NFE_LOTE').Clear;
    FieldByName('NFE_CARTA_CORRECAO').Clear;

    FieldByName('NFCE_SERIE').Clear;
    FieldByName('NFCE_NUMERO').Clear;
    FieldByName('NFCE_TOKEN_ID').Clear;
    FieldByName('NFCE_TOKEN').Clear;

    FieldByName('CONTADOR_CODIGO').Clear;
    FieldByName('CONTADOR_CNPJCPF').Clear;
    FieldByName('CONTADOR_NOME').Clear;
  end;
end;

procedure TModelDAOConfiguracaoEmpresa.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('rzsoc').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('nmfant').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('contador_nome').ProviderFlags := [];
end;

{ TModelDAOEmpresaView }

constructor TModelDAOEmpresaView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    e.cnpj     ')
        .Add('  , e.codigo   ')
        .Add('  , e.razao    ')
        .Add('  , e.fantasia ')
        .Add('  , c.uf       ')
        .Add('  , c.segmento ')
        .Add('  , c.ender    ')
        .Add('  , c.numero_end ')
        .Add('  , c.complemento')
        .Add('  , c.bairro')
        .Add('  , c.cidade')
        .Add('  , c.uf    ')
        .Add('  , c.cep   ')
        .Add('  , coalesce(s.estoque_unico_empresas, 0)     as estoque_unico ')
        .Add('  , coalesce(s.permitir_venda_estoque_ins, 0) as permitir_venda_estoque_ins')
        .Add('  , coalesce(c.tipo_regime_nfe, 0)            as regime')
        .Add('  , coalesce(s.nfe_emitir, 0)                 as nfe_emitir')
        .Add('  , coalesce(s.nfe_emitir_entrada, 0)         as nfe_emitir_entrada')
        .Add('  , coalesce(s.autoriza_informa_cliente, 0)   as autoriza_informa_cliente')
        .Add('from VW_EMPRESA e')
        .Add('  inner join TBEMPRESA c on (c.cnpj = e.cnpj)')
        .Add('  left join TBCONFIGURACAO s on (s.empresa = e.cnpj)')
        .Add('order by')
        .Add('    e.razao')
      .&End
    .Open;
end;

destructor TModelDAOEmpresaView.Destroy;
begin
  inherited;
end;

class function TModelDAOEmpresaView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOEmpresaView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

end.
