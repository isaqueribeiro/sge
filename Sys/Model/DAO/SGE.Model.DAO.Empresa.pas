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
    .OpenEmpty;

  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Logradouro').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Cid_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Est_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Pais_nome').ProviderFlags  := [];

  FConn.Query.CloseEmpty;

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
//  with FConn.Query.DataSet do
//  begin
//    FieldByName('EX_IBPT').AsString := '0';
//    FieldByName('ALIQNACIONAL_IBPT').AsCurrency      := 0.0;
//    FieldByName('ALIQINTERNACIONAL_IBPT').AsCurrency := 0.0;
//    FieldByName('ALIQESTADUAL_IBPT').AsCurrency      := 0.0;
//    FieldByName('ALIQMUNICIPAL_IBPT').AsCurrency     := 0.0;
//    FieldByName('ATIVO').AsInteger                   := 1;
//    FieldByName('TABELA_IBPT').Clear;
//    FieldByName('DESCRICAO_IBPT').Clear;
//  end;
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
        .Add('    e.cnpj')
        .Add('  , e.codigo')
        .Add('  , e.razao')
        .Add('  , e.fantasia')
        .Add('from VW_EMPRESA e')
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
