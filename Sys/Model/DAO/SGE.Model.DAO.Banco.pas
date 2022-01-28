unit SGE.Model.DAO.Banco;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOBanco = class(TModelDAO, IModelDAOCustom)
    private
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

uses
  UConstantesDGE;

{ TModelDAOBanco }

constructor TModelDAOBanco.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBBANCO_BOLETO')
      .AliasTableName('b')
      .KeyFields('bco_codigo')
      .SQL
        .Clear
        .Add('Select                     ')
        .Add('    b.bco_codigo           ')
        .Add('  , b.bco_cod              ')
        .Add('  , b.empresa              ')
        .Add('  , b.bco_carteira         ')
        .Add('  , b.bco_nome             ')
        .Add('  , b.bco_agencia          ')
        .Add('  , b.bco_cc               ')
        .Add('  , b.bco_codigo_cedente   ')
        .Add('  , b.bco_chave            ')
        .Add('  , b.bco_gerar_boleto     ')
        .Add('  , b.bco_nosso_num_inicio ')
        .Add('  , b.bco_nosso_num_final  ')
        .Add('  , b.bco_nosso_num_proximo')
        .Add('  , b.bco_confg_1          ')
        .Add('  , b.bco_confg_2          ')
        .Add('  , b.bco_diretorio_remessa')
        .Add('  , b.bco_diretorio_retorno')
        .Add('  , b.bco_sequencial_rem   ')
        .Add('  , b.bco_percentual_juros ')
        .Add('  , b.bco_percentual_mora  ')
        .Add('  , b.bco_dia_protesto     ')
        .Add('  , b.bco_msg_instrucao    ')
        .Add('  , b.bco_layout_remessa   ')
        .Add('  , b.bco_layout_retorno   ')
        .Add('  , trim(b.bco_nome) ||    ')
        .Add('    coalesce('' - AG. ''  || nullif(trim(b.bco_agencia), ''''), '''') || ')
        .Add('    coalesce('' - C/C. '' || nullif(trim(b.bco_cc), ''''), '''')  as bco_nome_agencia_conta ')
        .Add('from TBBANCO_BOLETO b      ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOBanco.Destroy;
begin
  inherited;
end;

class function TModelDAOBanco.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOBanco.DataSetAfterOpen(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
    FieldByName('bco_nome_agencia_conta').ProviderFlags := [];
end;

procedure TModelDAOBanco.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('BCO_DIRETORIO_REMESSA').AsString := Trim(FieldByName('BCO_DIRETORIO_REMESSA').AsString);
    FieldByName('BCO_DIRETORIO_RETORNO').AsString := Trim(FieldByName('BCO_DIRETORIO_RETORNO').AsString);
  end;
end;

procedure TModelDAOBanco.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('BCO_CODIGO').AsInteger           := FConn.Query.NewID;
    FieldByName('EMPRESA').AsString               := Usuario.Empresa.CNPJ;
    FieldByName('BCO_GERAR_BOLETO').AsInteger     := 0;
    FieldByName('BCO_NOSSO_NUM_INICIO').AsString  := FormatFloat('0000000', 1);
    FieldByName('BCO_NOSSO_NUM_FINAL').AsString   := FormatFloat('0000000', 999999);
    FieldByName('BCO_NOSSO_NUM_PROXIMO').AsString := FormatFloat('0000000', 1);
    FieldByName('BCO_SEQUENCIAL_REM').AsInteger   := 1;
    FieldByName('BCO_CODIGO_CEDENTE').Clear;

    FieldByName('BCO_LAYOUT_REMESSA').AsInteger    := 400; // cnab400
    FieldByName('BCO_LAYOUT_RETORNO').AsInteger    := 400; // cnab400
    FieldByName('BCO_PERCENTUAL_JUROS').AsCurrency := 0.0;
    FieldByName('BCO_PERCENTUAL_MORA').AsCurrency  := 0.0;
    FieldByName('BCO_DIA_PROTESTO').AsInteger      := 0;
    FieldByName('BCO_MSG_INSTRUCAO').AsString      := 'Não receber pagamento após o vencimento.';
  end;
end;

end.
