unit SGE.Model.DAO.ContaCorrente;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces,
  Interacao.Usuario,
  Controller.Factory;

type
  // Table
  TModelDAOContaCorrente = class(TModelDAO, IModelDAOCustom)
    private
      FUsuario : IUsuario;
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // View
  TModelDAOContaCorrenteView = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOContaCorrente }

constructor TModelDAOContaCorrente.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCONTA_CORRENTE')
      .KeyFields('Codigo')
      .AutoIncFields('Codigo')
      .SQL
        .Clear
        .Add('Select')
        .Add('    cc.Codigo')
        .Add('  , cc.Descricao')
        .Add('  , cc.Tipo')
        .Add('  , cc.bco_codigo_cc')
        .Add('  , cc.Empresa')
        .Add('  , cc.Conta_banco_boleto')
        .Add('  , cc.Codigo_contabil')
        .Add('  , Case when cc.Tipo = 1 then ''Caixa'' when cc.Tipo = 2 then ''Banco'' else '''' end as Tipo_Desc')
        .Add('  , cb.Bco_nome || '' AG.: '' || cb.Bco_agencia || '' C/C.: '' || cb.Bco_cc as Banco')
        .Add('from TBCONTA_CORRENTE cc')
        .Add('  left join TBBANCO_BOLETO cb on (cb.bco_codigo = cc.bco_codigo_cc)')
      .&End
    .OpenEmpty;

  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Tipo_Desc').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Banco').ProviderFlags     := [];

  FConn.Query.CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;

  FUsuario := TFactoryController.getInstance().getUsuarioController();
end;

destructor TModelDAOContaCorrente.Destroy;
begin
  inherited;
end;

class function TModelDAOContaCorrente.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOContaCorrente.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
end;

procedure TModelDAOContaCorrente.DataSetBeforePost(DataSet: TDataSet);
begin
  ;
end;

procedure TModelDAOContaCorrente.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('CODIGO').AsInteger := FConn.Query.NewID;
    FieldByName('TIPO').AsInteger   := CONTA_CORRENTE_TIPO_CAIXA;
    FieldByName('EMPRESA').AsString := FUsuario.Empresa;
    FieldByName('BCO_CODIGO_CC').Clear;
    FieldByName('CONTA_BANCO_BOLETO').Clear;
    FieldByName('CODIGO_CONTABIL').Clear;
  end;
end;

{ TModelDAOContaCorrenteView }

constructor TModelDAOContaCorrenteView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    c.codigo')
        .Add('  , c.descricao')
        .Add('  , c.tipo')
        .Add('  , c.tipo_desc')
        .Add('  , c.descricao_full')
        .Add('  , c.empresa')
        .Add('  , c.cnpj')
        .Add('from VW_CONTA_CORRENTE c')
      .&End
    .Open;
end;

destructor TModelDAOContaCorrenteView.Destroy;
begin
  inherited;
end;

class function TModelDAOContaCorrenteView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOContaCorrenteView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

end.
