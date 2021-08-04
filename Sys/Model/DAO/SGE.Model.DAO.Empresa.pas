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
