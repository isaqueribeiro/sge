unit SGE.Model.DAO.FormaPagto;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOFormaPagto = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Table Detail
  TModelDAOFormaPagtoContaCorrente = class(TModelDAO, IModelDAOCustom)
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

  // View
  TModelDAOFormaPagtoNFCEView = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOFormaPagto }

constructor TModelDAOFormaPagto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBFORMPAGTO')
      .KeyFields('Cod')
      .AutoIncFields('Cod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    p.Cod')
        .Add('  , p.Descri')
        .Add('  , p.Acrescimo')
        .Add('  , p.FormaPagto_NFCe')
        .Add('  , p.FormaPagto_PDV')
        .Add('  , p.Formapagto_PDV_Cupom_Extra')
        .Add('  , p.Debitar_limite_cliente')
        .Add('  , p.Ativa')
        .Add('  , count(x.conta_corrente) as conta_corrente')
        .Add('from TBFORMPAGTO p')
        .Add('  left join ( ')
        .Add('    Select ')
        .Add('        fc.forma_pagto')
        .Add('      , fc.conta_corrente')
        .Add('      , c.descricao')
        .Add('    from TBFORMPAGTO_CONTACOR fc')
        .Add('      inner join TBCONTA_CORRENTE c on (c.codigo = fc.conta_corrente and c.empresa = :empresa)')
        .Add('    where c.tipo = 1')
        .Add('  ) x on (x.forma_pagto = p.cod)')
        .Add('group by')
        .Add('    p.Cod')
        .Add('  , p.Descri')
        .Add('  , p.Acrescimo')
        .Add('  , p.FormaPagto_NFCe')
        .Add('  , p.FormaPagto_PDV')
        .Add('  , p.Formapagto_PDV_Cupom_Extra')
        .Add('  , p.Debitar_limite_cliente')
        .Add('  , p.Ativa')
      .&End
      .ParamByName('empresa', EmptyStr)
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

destructor TModelDAOFormaPagto.Destroy;
begin
  inherited;
end;

class function TModelDAOFormaPagto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOFormaPagto.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    f.cod          as codigo')
        .Add('  , trim(f.descri) as descricao ')
        .Add('  , lpad(f.cod, 2, ''0'') || '' - '' || trim(f.descri) as codigo_descricao ')
        .Add('  , f.Ativa')
        .Add('from TBFORMPAGTO f ')
      .&End
    .Open;

  FConn.Query.DataSet.Filter := '(ativa = 1)';
end;

procedure TModelDAOFormaPagto.DataSetAfterOpen(DataSet: TDataSet);
begin
  FConn.Query.DataSet.FieldByName('conta_corrente').ProviderFlags := [];
end;

procedure TModelDAOFormaPagto.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('COD').AsInteger        := FConn.Query.NewID;
    FieldByName('ACRESCIMO').AsCurrency := 0;
    FieldByName('ATIVA').AsInteger      := 1;
    FieldByName('DEBITAR_LIMITE_CLIENTE').AsInteger     := 1;
    FieldByName('FORMAPAGTO_PDV').AsInteger             := 0;
    FieldByName('FORMAPAGTO_PDV_CUPOM_EXTRA').AsInteger := 0;
    FieldByName('FORMAPAGTO_NFCE').Clear;
  end;
end;

{ TModelDAOFormaPagtoContaCorrente }

constructor TModelDAOFormaPagtoContaCorrente.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBFORMPAGTO_CONTACOR')
      .KeyFields('forma_pagto;conta_corrente')
      .SQL
        .Clear
        .Add('Select')
        .Add('    cast(:forma_pagto as Integer) as forma_pagto')
        .Add('  , c.codigo                      as conta_corrente')
        .Add('  , coalesce(f.selecionar, 0)     as selecionar')
        .Add('  , c.codigo')
        .Add('  , c.descricao')
        .Add('  , Case c.tipo')
        .Add('      when 1 then ''Caixa'' ')
        .Add('      when 2 then ''Banco'' ')
        .Add('    end as tipo             ')
        .Add('  , e.rzsoc as empresa      ')
        .Add('from TBCONTA_CORRENTE c     ')
        .Add('  left join TBEMPRESA e on (e.cnpj = c.empresa)')
        .Add('  left join TBFORMPAGTO_CONTACOR f on (f.conta_corrente = c.codigo and f.forma_pagto = :forma_pagto)')
        .Add('order by')
        .Add('    c.descricao')
      .&End
      .ParamByName('forma_pagto', 0)
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

procedure TModelDAOFormaPagtoContaCorrente.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

destructor TModelDAOFormaPagtoContaCorrente.Destroy;
begin
  inherited;
end;

class function TModelDAOFormaPagtoContaCorrente.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOFormaPagtoContaCorrente.SetProviderFlags;
var
  I : Integer;
begin
  // Ignorar campos no Insert e Update
  for I := 0 to Pred(FConn.Query.DataSet.Fields.Count) do
  begin
    FConn.Query.DataSet.Fields[I].ReadOnly      := False; // Liberar edição dos campos
    FConn.Query.DataSet.Fields[I].ProviderFlags := [];
  end;

  // Configurar campos para a geração de Insert e Update 
  FConn.Query.DataSet.FieldByName('forma_pagto').ProviderFlags    := [pfInUpdate, pfInWhere, pfInKey];  
  FConn.Query.DataSet.FieldByName('conta_corrente').ProviderFlags := [pfInUpdate, pfInWhere, pfInKey];  
  FConn.Query.DataSet.FieldByName('selecionar').ProviderFlags     := [pfInUpdate];
end;

{ TModelDAOFormaPagtoNFCEView }

constructor TModelDAOFormaPagtoNFCEView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    f.codigo')
        .Add('  , f.descricao')
        .Add('from VW_FORMA_PAGTO_NFC_E f')
      .&End
    .Open;
end;

destructor TModelDAOFormaPagtoNFCEView.Destroy;
begin
  inherited;
end;

class function TModelDAOFormaPagtoNFCEView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOFormaPagtoNFCEView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

end.

