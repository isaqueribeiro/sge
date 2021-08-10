unit SGE.Model.DAO.Fornecedor;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOFornecedor = class(TModelDAO, IModelDAOCustom)
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

uses
  UConstantesDGE;

{ TModelDAOFornecedor }

constructor TModelDAOFornecedor.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBFORNECEDOR')
      .KeyFields('Codforn')
      .AutoIncFields('Codforn')
      .GeneratorName('GEN_FORNECEDOR_ID')
      .SQL
        .Clear
        .Add('Select              ')
        .Add('    f.Codforn       ')
        .Add('  , f.Pessoa_fisica ')
        .Add('  , f.Cnpj          ')
        .Add('  , f.Nomeforn      ')
        .Add('  , f.Nomefant      ')
        .Add('  , f.Inscest       ')
        .Add('  , f.Inscmun       ')
        .Add('  , f.Ender         ')
        .Add('  , f.Complemento   ')
        .Add('  , f.Numero_end    ')
        .Add('  , f.Cep           ')
        .Add('  , f.Cidade        ')
        .Add('  , f.Uf            ')
        .Add('  , f.Fone          ')
        .Add('  , f.FoneCel       ')
        .Add('  , f.FoneFax       ')
        .Add('  , f.Tlg_tipo      ')
        .Add('  , f.Log_cod       ')
        .Add('  , f.Bai_cod       ')
        .Add('  , f.Cid_cod       ')
        .Add('  , f.Est_cod       ')
        .Add('  , f.Email         ')
        .Add('  , f.Site          ')
        .Add('  , f.Contato       ')
        .Add('  , f.Pais_id       ')
        .Add('  , f.Grf_cod       ')
        .Add('  , f.Transportadora')
        .Add('  , f.banco         ')
        .Add('  , f.agencia       ')
        .Add('  , f.cc            ')
        .Add('  , f.praca         ')
        .Add('  , f.banco_2       ')
        .Add('  , f.agencia_2     ')
        .Add('  , f.cc_2          ')
        .Add('  , f.praca_2       ')
        .Add('  , f.banco_3       ')
        .Add('  , f.agencia_3     ')
        .Add('  , f.cc_3          ')
        .Add('  , f.praca_3       ')
        .Add('  , f.observacao    ')
        .Add('  , f.DtCad         ')
        .Add('  , f.Faturamento_minimo')
        .Add('  , f.ativo             ')
        .Add('  , coalesce( cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '' '', '''') || l.Log_nome as varchar(250)), f.Ender ) as Logradouro')
        .Add('  , b.Bai_nome')
        .Add('  , coalesce(c.Cid_nome, f.Cidade) as Cid_nome')
        .Add('  , coalesce(u.Est_nome, f.Uf) as Est_nome    ')
        .Add('  , p.Pais_nome                               ')
        .Add('from TBFORNECEDOR f                           ')
        .Add('  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = f.Tlg_tipo)')
        .Add('  left join TBLOGRADOURO l on (l.Log_cod = f.Log_cod)      ')
        .Add('  left join TBBAIRRO b on (b.Bai_cod = f.Bai_cod)          ')
        .Add('  left join TBCIDADE c on (c.Cid_cod = f.Cid_cod)          ')
        .Add('  left join TBESTADO u on (u.Est_cod = f.Est_cod)          ')
        .Add('  left join TBPAIS p on (p.Pais_id = f.Pais_id)            ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen    := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord  := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost   := DataSetBeforePost;
end;

destructor TModelDAOFornecedor.Destroy;
begin
  inherited;
end;

class function TModelDAOFornecedor.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOFornecedor.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Logradouro').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Bai_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Cid_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Est_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Pais_nome').ProviderFlags  := [];
end;

procedure TModelDAOFornecedor.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOFornecedor.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (Trim(FieldByName('BANCO').AsString) = EmptyStr) then
      FieldByName('BANCO').Clear;

    if (Trim(FieldByName('BANCO_2').AsString) = EmptyStr) then
      FieldByName('BANCO_2').Clear;

    if (Trim(FieldByName('BANCO_3').AsString) = EmptyStr) then
      FieldByName('BANCO_3').Clear;

    if ( FieldByName('DTCAD').IsNull ) then
      FieldByName('DTCAD').AsDateTime := Now;
  end;
end;

procedure TModelDAOFornecedor.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('PESSOA_FISICA').AsInteger  := 0;
//    FieldByName('PAIS_ID').AsString         := GetPaisIDDefault;
//    FieldByName('PAIS_NOME').AsString       := GetPaisNomeDefault;
//    FieldByName('EST_COD').AsInteger        := GetEstadoIDDefault;
//    FieldByName('EST_NOME').AsString        := GetEstadoNomeDefault;
//    FieldByName('UF').AsString              := GetEstadoUF(GetEstadoIDDefault);
//    FieldByName('CID_COD').AsInteger        := GetCidadeIDDefault;
//    FieldByName('CID_NOME').AsString        := GetCidadeNomeDefault;
//    FieldByName('CIDADE').AsString          := Copy(FieldByName('CID_NOME').AsString + ' (' + Trim(FieldByName('UF').AsString) + ')', 1, FieldByName('CIDADE').Size);
//    FieldByName('CEP').AsString             := GetCidadeCEP(GetCidadeIDDefault);
    FieldByName('NUMERO_END').AsString      := 'S/N';
    FieldByName('COMPLEMENTO').AsString     := EmptyStr;
    FieldByName('TRANSPORTADORA').AsInteger := 0;
    FieldByName('DTCAD').AsDateTime         := Now;
    FieldByName('FATURAMENTO_MINIMO').AsCurrency := 0.0;
    FieldByName('ATIVO').AsInteger          := 1;

//    if (fdQryGrupo.RecordCount > 0) then
//      FieldByName('GRF_COD').Value := fdQryGrupo.FieldByName('GRF_COD').AsInteger
//    else
//      FieldByName('GRF_COD').Clear;
//
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

end.
