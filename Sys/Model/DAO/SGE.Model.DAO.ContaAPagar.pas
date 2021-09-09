unit SGE.Model.DAO.ContaAPagar;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Contas A Pagar
  TModelDAOContaAPagar = class(TModelDAO, IModelDAOCustom)
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

implementation

{ TModelDAOContaAPagar }

uses
  System.DateUtils,
  UConstantesDGE;

constructor TModelDAOContaAPagar.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_CONTAPAG_NUM', FormatDateTime('yyyy', Date).ToInteger);
  FConn
    .Query
      .TableName('TBCONTPAG')
      .AliasTableName('p')
      .KeyFields('Anolanc;Numlanc')
      .AutoIncFields('Numlanc')
      .GeneratorName('GEN_CONTAPAG_NUM_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Select          ')
        .Add('    p.Anolanc   ')
        .Add('  , p.Numlanc   ')
        .Add('  , p.Empresa   ')
        .Add('  , p.Parcela   ')
        .Add('  , p.Codforn   ')
        .Add('  , p.Nomeemp   ')
        .Add('  , p.Notfisc   ')
        .Add('  , p.Tippag    ')
        .Add('  , p.Dtemiss   ')
        .Add('  , p.Dtvenc    ')
        .Add('  , p.Dtpag     ')
        .Add('  , p.Valorpag  ')
        .Add('  , p.ValorSaldo')
        .Add('  , p.Banco         ')
        .Add('  , p.Numchq        ')
        .Add('  , p.Historic      ')
        .Add('  , p.Forma_pagto   ')
        .Add('  , p.Condicao_pagto')
        .Add('  , p.Docbaix  ')
        .Add('  , p.Quitado  ')
        .Add('  , p.Situacao ')
        .Add('  , p.Codtpdesp')
        .Add('  , p.Lote     ')
        .Add('  , p.Competencia_apuracao')
        .Add('  , p.anocompra ')
        .Add('  , p.numcompra ')
        .Add('  , lpad(p.Anolanc, 4, ''0'') || lpad(p.Numlanc, 6, ''0'') as Lancamento')
        .Add('  , Case when p.situacao = 1 then ''Ativa'' else ''Cancelada'' end as situacao_desc')
        .Add('  , Case when p.Quitado  = 1 then ''X'' else ''.'' end as Pago_')
        .Add('  , f.Nomeforn  ')
        .Add('  , f.Cnpj      ')
        .Add('  , b.Bco_nome  ')
        .Add('from TBCONTPAG p')
        .Add('  left join TBFORNECEDOR f on (f.Codforn = p.Codforn)')
        .Add('  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco and b.empresa = p.empresa)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOContaAPagar.Destroy;
begin
  inherited;
end;

class function TModelDAOContaAPagar.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOContaAPagar.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Lancamento').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('situacao_desc').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Pago_').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('Nomeforn').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Cnpj').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('Bco_nome').ProviderFlags   := [];
end;

procedure TModelDAOContaAPagar.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOContaAPagar.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('COMPETENCIA_APURACAO').AsInteger := FormatDateTime('yyyymm', FieldByName('DTEMISS').AsDateTime).ToInteger;

    if ( (FieldByName('ANOCOMPRA').AsInteger = 0) and (FieldByName('PARCELA').AsInteger <= 0) ) then
      FieldByName('PARCELA').AsInteger := 1;

    FieldByName('VALORSALDO').AsCurrency := FieldByName('VALORPAG').AsCurrency;
  end;
end;

procedure TModelDAOContaAPagar.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANOLANC').AsInteger  := YearOf(Date);
    FieldByName('EMPRESA').AsString   := Usuario.Empresa.CNPJ;
    FieldByName('NOMEEMP').AsString   := Copy(Usuario.Empresa.RazaoSocial, 1, FieldByName('NOMEEMP').Size);
    FieldByName('PARCELA').AsInteger  := 1;
    FieldByName('DTEMISS').AsDateTime := Date;
    FieldByName('COMPETENCIA_APURACAO').AsInteger := FormatDateTime('yyyymm', Date).ToInteger;
    FieldByName('QUITADO').AsInteger  := STATUS_APAGAR_PENDENTE;
    FieldByName('SITUACAO').AsInteger := 1; // Ativa
    FieldByName('LOTE').AsString      := EmptyStr;
    FieldByName('FORMA_PAGTO').AsInteger    := Configuracao.Padrao.FormaPagtoID;
    FieldByName('CONDICAO_PAGTO').AsInteger := Configuracao.Padrao.CondicaoPagtoID;
    FieldByName('HISTORIC').AsString        := '...';
    FieldByName('CODTPDESP').Clear;
    FieldByName('ANOCOMPRA').Clear;
    FieldByName('NUMCOMPRA').Clear;
  end;
end;

end.
