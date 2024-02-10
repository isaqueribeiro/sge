unit SGE.Model.DAO.Query.Caixa;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  Data.DB,
  Model.Constantes,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOQueryCaixa = class(TModelDAO, IModelDAOQuery)
    private
      FDataInicial,
      FDataFinal  : TDateTime;
      procedure CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOQuery;

      function DataIncial(aValue : TDateTime) : IModelDAOQuery;
      function DataFinal(aValue : TDateTime) : IModelDAOQuery;
      function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IModelDAOQuery;
  end;

  TModelDAOQueryCaixaMovimento = class(TModelDAO, IModelDAOQuery, IModelDAOQueryCaixaMovimento)
    private
      FDataInicial,
      FDataFinal  : TDateTime;
      FContaCorrente,
      FAnoCaixa     ,
      FNumeroCaixa  : Integer;
      FConferirLista : TDictionary<String, Smallint>;
      procedure CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOQuery;

      function DataIncial(aValue : TDateTime) : IModelDAOQuery;
      function DataFinal(aValue : TDateTime) : IModelDAOQuery;
      function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IModelDAOQuery;

      function ContaCorrente(aValue : Integer) : IModelDAOQueryCaixaMovimento;
      function AnoCaixa(aValue : Integer) : IModelDAOQueryCaixaMovimento;
      function NumeroCaixa(aValue : Integer) : IModelDAOQueryCaixaMovimento;
      function ExecuteCustom(aTipo : TTipoPesquisa; aFiltro : String) : IModelDAOQueryCaixaMovimento;
  end;

implementation

{ TModelDAOQueryCaixa }

uses
  UConstantesDGE,
  Service.Utils;

constructor TModelDAOQueryCaixa.Create;
begin
  inherited Create;

  FDataInicial := Date;
  FDataFinal   := Date;

//  FConn
//    .Query
//      .SQL
//        .Clear
//        .Add('Select')
//        .Add('    c.anolanc')
//        .Add('  , c.numlanc')
//        .Add('  , cast(c.anolanc || ''/'' || right(''0000000'' || c.numlanc, 7) as varchar(30)) as lancamento')
//        .Add('  , c.empresa    ')
//        .Add('  , c.parcela    ')
//        .Add('  , c.tippag     ')
//        .Add('  , c.dtemiss    ')
//        .Add('  , c.dtvenc     ')
//        .Add('  , c.dtpag      ')
//        .Add('  , c.valorpag   ')
//        .Add('  , c.valormulta ')
//        .Add('  , c.valorpagtot')
//        .Add('  , c.valorsaldo ')
//        .Add('  , c.valorsaldo as valor_apagar')
//        .Add('  ')
//        .Add('  , cast(c.anocompra || ''/'' || right(''0000000'' || c.numcompra, 7) as varchar(30)) as entrada')
//        .Add('  , c.anocompra     as entrada_ano     ')
//        .Add('  , c.numcompra     as entrada_numero  ')
//        .Add('  , d.tpd_descricao as entrada_doc_tipo')
//        .Add('  , cast(right(''0000000'' || e.nf, 7) || coalesce(''-'' || nullif(trim(e.nfserie), ''''), '''') as varchar(30)) as entrada_doc')
//        .Add('  , e.nf            as entrada_doc_numero     ')
//        .Add('  , e.nfserie       as entrada_doc_serie      ')
//        .Add('  , f.nomeforn      as entrada_fornecedor     ')
//        .Add('  , f.cnpj          as entrada_fornecedor_cnpj')
//        .Add('  ')
//        .Add('  , c.situacao')
//        .Add('  , c.quitado as selecionar')
//        .Add('from TBCONTPAG c')
//        .Add('  left join TBFORNECEDOR f on (f.codforn = c.codforn)')
//        .Add('  left join TBCOMPRAS e on (e.ano = c.anocompra and c.numcompra = e.codcontrol)')
//        .Add('  left join VW_TIPO_DOCUMENTO_ENTRADA d on (d.tpd_codigo = e.tipo_documento)   ')
//        .Add('where (c.empresa  = :empresa) ')
//        .Add('  and (c.situacao = :situacao) ')
//        .Add('  and (c.quitado  = :quitado) ')
//        .Add('  and (c.dtvenc between :data_inicial and :data_final) ')
//        .Add('  and ((c.codforn = :codigo) or (:sem_codigo = 1)) ')
//        .Add('  and ((f.cnpj    = :cnpj)   or (:sem_cnpj = 1)) ')
//        .Add('  and (( (f.nomeforn like :nome) or (f.nomefant like :nome) ) or (:sem_nome = 1)) ')
//      .&End
//      .ParamByName('empresa',  Usuario.Empresa.CNPJ)
//      .ParamByName('situacao', 1) // 1. Ativa
//      .ParamByName('quitado',  0) // 0. Pendente de pagamento
//      .ParamByName('data_inicial', FDataInicial)
//      .ParamByName('data_final',   FDataFinal)
//      .ParamByName('codigo',   0)
//      .ParamByName('cnpj',     'xxxx')
//      .ParamByName('nome',     'xxxx')
//      .ParamByName('sem_codigo', 0)
//      .ParamByName('sem_cnpj',   0)
//      .ParamByName('sem_nome',   0)
//      .OrderBy('c.dtvenc')
//      .OrderBy('f.nomeforn')
//    .Open;
//
//  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAOQueryCaixa.Destroy;
begin
  inherited;
end;

function TModelDAOQueryCaixa.Execute(aTipo: TTipoPesquisa; aFiltro: String): IModelDAOQuery;
var
  aStr : String;
begin
  Result := Self;
//  aStr := aFiltro.Trim.Replace(' ', '%', [rfReplaceAll]);
//
//  FConn.Query.Close;
//  FConn
//    .Query
//      .ParamByName('empresa',  Usuario.Empresa.CNPJ)
//      .ParamByName('situacao', 1) // 1. Ativa
//      .ParamByName('quitado',  0) // 0. Pendente de pagamento
//      .ParamByName('data_inicial', FDataInicial)
//      .ParamByName('data_final',   FDataFinal)
//      .ParamByName('codigo', 0)
//      .ParamByName('cnpj',   EmptyStr)
//      .ParamByName('nome',   EmptyStr)
//      .ParamByName('sem_codigo', 0)
//      .ParamByName('sem_cnpj',   0)
//      .ParamByName('sem_nome',   0);
//
//  if (StrToIntDef(aStr, 0) > 0) and (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpCodigo]) then
//  begin
//    FConn
//      .Query
//        .ParamByName('codigo', StrToIntDef(aStr, 0))
//        .ParamByName('cnpj',   EmptyStr)
//        .ParamByName('nome',   EmptyStr)
//        .ParamByName('sem_codigo', 0)
//        .ParamByName('sem_cnpj',   1)
//        .ParamByName('sem_nome',   1);
//  end
//  else
//  if (TServicesUtils.StrIsCPF(aStr) or TServicesUtils.StrIsCNPJ(aStr)) then
//  begin
//    FConn
//      .Query
//        .ParamByName('codigo', 0)
//        .ParamByName('cnpj',   aStr)
//        .ParamByName('nome',   EmptyStr)
//        .ParamByName('sem_codigo', 1)
//        .ParamByName('sem_cnpj',   0)
//        .ParamByName('sem_nome',   1);
//  end
//  else
//  if (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpDescricao]) then
//  begin
//    FConn
//      .Query
//        .ParamByName('codigo', 0)
//        .ParamByName('cnpj',   EmptyStr)
//        .ParamByName('nome',   aStr + '%')
//        .ParamByName('sem_codigo', 1)
//        .ParamByName('sem_cnpj',   1)
//        .ParamByName('sem_nome',   0);
//  end;
//
//  FConn.Query.Open;
end;

class function TModelDAOQueryCaixa.New: IModelDAOQuery;
begin
  Result := Self.Create;
end;

procedure TModelDAOQueryCaixa.CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
  begin
    if TServicesUtils.StrIsCPF(Sender.AsString) then
      Text := TServicesUtils.StrFormatarCpf(Sender.AsString)
    else
    if TServicesUtils.StrIsCNPJ(Sender.AsString) then
      Text := TServicesUtils.StrFormatarCnpj(Sender.AsString)
    else
      Text := Sender.AsString;
  end;
end;

function TModelDAOQueryCaixa.DataFinal(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataFinal := aValue;
end;

function TModelDAOQueryCaixa.DataIncial(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataInicial := aValue;
end;

procedure TModelDAOQueryCaixa.DataSetAfterOpen(DataSet: TDataSet);
begin
//  FConn.Query.DataSet.FieldByName('selecionar').ReadOnly      := False;
//  FConn.Query.DataSet.FieldByName('selecionar').Required      := False;
//  FConn.Query.DataSet.FieldByName('selecionar').ProviderFlags := [];
//
//  FConn.Query.DataSet.FieldByName('entrada_fornecedor_cnpj').OnGetText := CpfCnpjGetText;
end;

{ TModelDAOQueryCaixaMovimento }

constructor TModelDAOQueryCaixaMovimento.Create;
begin
  inherited Create;

  FDataInicial := Date;
  FDataFinal   := Date;
  FContaCorrente := 0;
  FAnoCaixa      := 0;
  FNumeroCaixa   := 0;

  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    m.ano')
        .Add('  , m.numero   ')
        .Add('  , m.caixa_ano')
        .Add('  , m.caixa_num')
        .Add('  , m.conta_corrente')
        .Add('  , m.forma_pagto')
        .Add('  , m.datahora   ')
        .Add('  , m.tipo       ')
        .Add('  , m.estorno    ')
        .Add('  , m.tipo_receita')
        .Add('  , m.tipo_despesa')
        .Add('  , m.historico')
        .Add('  , m.valor    ')
        .Add('  , m.situacao ')
        .Add('  , m.venda_ano')
        .Add('  , m.venda_num')
        .Add('  , m.os_ano   ')
        .Add('  , m.os_num   ')
        .Add('  , m.cliente_cod ')
        .Add('  , m.cliente     ')
        .Add('  , m.compra_ano  ')
        .Add('  , m.compra_num  ')
        .Add('  , m.empresa     ')
        .Add('  , m.fornecedor  ')
        .Add('  , m.usuario     ')
        .Add('  , m.apagar_ano  ')
        .Add('  , m.apagar_num  ')
        .Add('  , m.areceber_ano')
        .Add('  , m.areceber_num')
        .Add('  , m.conferido   ')
        .Add('  , m.conferido as selecionar ')
        .Add('  , fp.descri as forma_pagto_desc')
        .Add('  , Case when upper(m.tipo) = ' + QuotedStr(TIPO_MOVIMENTO_CREDITO) + ' then m.Valor else 0 end as Valor_Credito')
        .Add('  , Case when upper(m.tipo) = ' + QuotedStr(TIPO_MOVIMENTO_DEBITO)  + ' then m.Valor else 0 end as Valor_Debito ')
        .Add('  , cast(m.Datahora as DMN_DATE) as Data')
        .Add('  , cast(m.Datahora as DMN_TIME) as Hora')
        .Add('  , coalesce(cl.nome, fn.nomeforn) as nome')
        .Add('  , coalesce(cl.cnpj, fn.cnpj)     as cnpj')
        .Add('  , cast(lpad(m.venda_ano, 4, ''0'') || ''/'' || lpad(m.venda_num, 6, ''0'') as DMN_VCHAR_20)       as Venda    ')
        .Add('  , cast(lpad(m.areceber_ano, 4, ''0'') || ''/'' || lpad(m.areceber_num, 6, ''0'') as DMN_VCHAR_20) as Titulo   ')
        .Add('  , cl.nome as cliente_nome')
        .Add('  , cl.cnpj as cliente_cnpj')
        .Add('  , cast(lpad(m.compra_ano, 4, ''0'') || ''/'' || lpad(m.compra_num, 6, ''0'') as DMN_VCHAR_20)     as Compra   ')
        .Add('  , cast(lpad(m.apagar_ano, 4, ''0'') || ''/'' || lpad(m.apagar_num, 6, ''0'') as DMN_VCHAR_20)     as Duplicata')
        .Add('  , fn.nomeforn as fornecedor_nome')
        .Add('  , fn.cnpj     as fornecedor_cnpj')
        .Add('  , cast(lpad(m.ano, 4, ''0'') || ''/'' || lpad(m.numero, 6, ''0'') as DMN_VCHAR_20) as Lancamento')
        .Add('  , tr.tiporec ')
        .Add('  , td.tipodesp')
        .Add('  , us.nomecompleto as usuario_responsavel')
        .Add('  , cast(iif(coalesce(m.caixa_ano, 0) != 0, lpad(m.caixa_ano, 4, ''0'') || ''/'' || lpad(m.caixa_num, 6, ''0''), '''') as DMN_VCHAR_20) as Caixa')
        .Add('  , cm.Situacao as situacao_caixa')
        .Add('  , cm.Data_fech  ')
        .Add('  , cm.Data_cancel')
        .Add('from TBCAIXA_MOVIMENTO m')
        .Add('  left join TBCLIENTE cl on (cl.Codigo = m.Cliente_cod)   ')
        .Add('  left join TBFORNECEDOR fn on (fn.Codforn = m.Fornecedor)')
        .Add('  left join TBFORMPAGTO fp on (fp.Cod = m.Forma_pagto)    ')
        .Add('  left join TBCAIXA cm on (cm.Ano = m.Caixa_ano and cm.Numero = m.Caixa_num)')
        .Add('  left join TBTPRECEITA tr on (tr.cod = m.tipo_receita and upper(m.tipo) = ' + QuotedStr(TIPO_MOVIMENTO_CREDITO) + ')')
        .Add('  left join TBTPDESPESA td on (td.cod = m.tipo_despesa and upper(m.tipo) = ' + QuotedStr(TIPO_MOVIMENTO_DEBITO)  + ')')
        .Add('  left join TBUSERS us on (us.nome = m.usuario)')
        .Add('where (m.empresa = :empresa) ')
        .Add('  and (cast(m.datahora as DMN_DATE) between :data_inicial and :data_final) ')
        .Add('  and ((m.conta_corrente = :conta) or (:sem_conta = 1)) ')
        .Add('  and ((coalesce(m.caixa_ano, 0) = :ano_caixa and coalesce(m.caixa_num, 0) = :numero_caixa) or (:sem_caixa = 1)) ')
        .Add('  and (( (cl.cnpj like :cnpj) or (fn.cnpj like :cnpj) ) or (:sem_cnpj = 1)) ')
        .Add('  and (( (cl.nome like :nome) or (fn.nomeforn like :nome) ) or (:sem_nome = 1)) ')
      .&End
      .ParamByName('empresa',  Usuario.Empresa.CNPJ)
      .ParamByName('conta',  FContaCorrente)
      .ParamByName('data_inicial', FDataInicial)
      .ParamByName('data_final',   FDataFinal)
      .ParamByName('ano_caixa',    FAnoCaixa)
      .ParamByName('numero_caixa', FNumeroCaixa)
      .ParamByName('cnpj', 'xxxx')
      .ParamByName('nome', 'xxxx')
      .ParamByName('sem_conta', 0)
      .ParamByName('sem_caixa', 0)
      .ParamByName('sem_cnpj',  0)
      .ParamByName('sem_nome',  0)
      .OrderBy('m.tipo')
      .OrderBy('m.datahora')
      .OrderBy('cl.nome')
      .OrderBy('fn.nomeforn')
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAOQueryCaixaMovimento.Destroy;
begin
  inherited;
end;

function TModelDAOQueryCaixaMovimento.Execute(aTipo: TTipoPesquisa; aFiltro: String): IModelDAOQuery;
var
  aStr : String;
begin
  Result := Self;
  aStr := aFiltro.Trim.Replace(' ', '%', [rfReplaceAll]);

  FConn.Query.Close;
  FConn
    .Query
      .ParamByName('empresa',  Usuario.Empresa.CNPJ)
      .ParamByName('conta',  FContaCorrente)
      .ParamByName('data_inicial', FDataInicial)
      .ParamByName('data_final',   FDataFinal)
      .ParamByName('ano_caixa',    FAnoCaixa)
      .ParamByName('numero_caixa', FNumeroCaixa)
      .ParamByName('cnpj', EmptyStr)
      .ParamByName('nome', EmptyStr)
      .ParamByName('sem_conta', 0)
      .ParamByName('sem_caixa', 0)
      .ParamByName('sem_cnpj',  1)
      .ParamByName('sem_nome',  1);

  if (FAnoCaixa = 0) or (FNumeroCaixa = 0) then
    FConn
      .Query
        .ParamByName('sem_caixa', 1);

  if (TServicesUtils.StrIsCPF(aStr) or TServicesUtils.StrIsCNPJ(aStr)) then
    FConn
      .Query
        .ParamByName('cnpj', aStr)
        .ParamByName('sem_cnpj', 0);

//  if (StrToIntDef(aStr, 0) > 0) and (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpCodigo]) then
//  begin
//    FConn
//      .Query
//        .ParamByName('codigo', StrToIntDef(aStr, 0))
//        .ParamByName('cnpj',   EmptyStr)
//        .ParamByName('nome',   EmptyStr)
//        .ParamByName('sem_codigo', 0)
//        .ParamByName('sem_cnpj',   1)
//        .ParamByName('sem_nome',   1);
//  end
//  else
//  if (TServicesUtils.StrIsCPF(aStr) or TServicesUtils.StrIsCNPJ(aStr)) then
//  begin
//    FConn
//      .Query
//        .ParamByName('codigo', 0)
//        .ParamByName('cnpj',   aStr)
//        .ParamByName('nome',   EmptyStr)
//        .ParamByName('sem_codigo', 1)
//        .ParamByName('sem_cnpj',   0)
//        .ParamByName('sem_nome',   1);
//  end
//  else
//  if (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpDescricao]) then
//  begin
//    FConn
//      .Query
//        .ParamByName('codigo', 0)
//        .ParamByName('cnpj',   EmptyStr)
//        .ParamByName('nome',   aStr + '%')
//        .ParamByName('sem_codigo', 1)
//        .ParamByName('sem_cnpj',   1)
//        .ParamByName('sem_nome',   0);
//  end;

  FConn.Query.Open;
end;

function TModelDAOQueryCaixaMovimento.ExecuteCustom(aTipo: TTipoPesquisa;
  aFiltro: String): IModelDAOQueryCaixaMovimento;
begin
  Result := Self;


end;

class function TModelDAOQueryCaixaMovimento.New: IModelDAOQuery;
begin
  Result := Self.Create;
end;

function TModelDAOQueryCaixaMovimento.AnoCaixa(aValue: Integer): IModelDAOQueryCaixaMovimento;
begin
  Result := Self;
  FAnoCaixa := aValue;
end;

function TModelDAOQueryCaixaMovimento.ContaCorrente(aValue: Integer): IModelDAOQueryCaixaMovimento;
begin
  Result := Self;
  FContaCorrente := aValue;
end;

function TModelDAOQueryCaixaMovimento.NumeroCaixa(aValue: Integer): IModelDAOQueryCaixaMovimento;
begin
  Result := Self;
  FNumeroCaixa := aValue;
end;

procedure TModelDAOQueryCaixaMovimento.CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
  begin
    if TServicesUtils.StrIsCPF(Sender.AsString) then
      Text := TServicesUtils.StrFormatarCpf(Sender.AsString)
    else
    if TServicesUtils.StrIsCNPJ(Sender.AsString) then
      Text := TServicesUtils.StrFormatarCnpj(Sender.AsString)
    else
      Text := Sender.AsString;
  end;
end;

function TModelDAOQueryCaixaMovimento.DataFinal(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataFinal := aValue;
end;

function TModelDAOQueryCaixaMovimento.DataIncial(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataInicial := aValue;
end;

procedure TModelDAOQueryCaixaMovimento.DataSetAfterOpen(DataSet: TDataSet);
begin
  FConn.Query.DataSet.FieldByName('selecionar').ReadOnly      := False;
  FConn.Query.DataSet.FieldByName('selecionar').Required      := False;
  FConn.Query.DataSet.FieldByName('selecionar').ProviderFlags := [];

  FConn.Query.DataSet.FieldByName('empresa').OnGetText := CpfCnpjGetText;
  FConn.Query.DataSet.FieldByName('cnpj').OnGetText := CpfCnpjGetText;
  FConn.Query.DataSet.FieldByName('cliente_cnpj').OnGetText := CpfCnpjGetText;
  FConn.Query.DataSet.FieldByName('fornecedor_cnpj').OnGetText := CpfCnpjGetText;
end;

end.
