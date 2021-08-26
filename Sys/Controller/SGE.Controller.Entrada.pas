unit SGE.Controller.Entrada;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Entrada de Produtos/Serviços
  TControllerEntrada = class(TController, IControllerEntrada)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerEntrada;

      procedure CorrigirCFOP(aCFOP : String);

      function Busca : IModelDAOCustom;
      function DocumentoDuplicado(const aEntrada : TLancamentoEntrada; const aDocumento : TDocumentoEntrada) : Boolean;
  end;

  // Tipo de Entrada de Produtos/Serviços (View)
  TControllerTipoEntradaView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo de Documento para Entrada de Produtos/Serviços (View)
  TControllerTipoDocumentoEntradaView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerEntrada }

uses
  System.SysUtils,
  System.Classes;

function TControllerEntrada.Busca: IModelDAOCustom;
begin
  Result := FBusca;
end;

procedure TControllerEntrada.CorrigirCFOP(aCFOP: String);
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBCOMPRAS Set ');
    aScriptSQL.Add('    NFCFOP   = ' + aCFOP.Trim);
    aScriptSQL.Add('  , NATUREZA = ' + aCFOP.Trim.QuotedString);
    aScriptSQL.Add('where ANO        = ' + FDAO.DataSet.FieldByName('ANO').AsString);
    aScriptSQL.Add('  and CODCONTROL = ' + FDAO.DataSet.FieldByName('CODCONTROL').AsString);
    aScriptSQL.Add('  and CODEMP     = ' + QuotedStr(FDAO.DataSet.FieldByName('CODEMP').AsString));
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);

    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBCOMPRASITENS Set ');
    aScriptSQL.Add('  CFOP = ' + aCFOP.Trim);
    aScriptSQL.Add('where ANO        = ' + FDAO.DataSet.FieldByName('ANO').AsString);
    aScriptSQL.Add('  and CODCONTROL = ' + FDAO.DataSet.FieldByName('CODCONTROL').AsString);
    aScriptSQL.Add('  and CODEMP     = ' + QuotedStr(FDAO.DataSet.FieldByName('CODEMP').AsString));
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
  finally
    FDAO.CommitTransaction;
    aScriptSQL.DisposeOf;
  end;
end;

constructor TControllerEntrada.Create;
begin
  inherited Create(TModelDAOFactory.New.Entrada);
  FBusca := TModelDAOFactory.New.Busca;
end;

destructor TControllerEntrada.Destroy;
begin
  inherited;
end;

function TControllerEntrada.DocumentoDuplicado(const aEntrada: TLancamentoEntrada;
  const aDocumento: TDocumentoEntrada): Boolean;
begin
  try
    FBusca.DataSet.Close;
    FBusca
      .Clear
      .SQL('Select')
      .SQL('    c.ano')
      .SQL('  , c.codcontrol')
      .SQL('  , c.dtemiss')
      .SQL('  , t.tpd_descricao as tipo')
      .SQL('from TBCOMPRAS c')
      .SQL('  left join VW_TIPO_DOCUMENTO_ENTRADA t on (t.tpd_codigo = c.tipo_documento)')
      .Where('(c.status != ' + STATUS_CMP_CAN.ToString + ')')
      .Where('((c.ano = ' + aEntrada.Ano.ToString + ') and  (c.codcontrol <> ' + aEntrada.Controle.ToString + '))')
      .Where('((c.codforn = ' + aDocumento.Fornecedor.ToString + ') and  (c.tipo_documento = ' + aDocumento.Tipo.ToString  + ') and  (c.nf = ' + aDocumento.Numero.ToString + '))')
      .Open;
  finally
    Result := not FBusca.DataSet.IsEmpty;
  end;
end;

class function TControllerEntrada.New: IControllerEntrada;
begin
  Result := Self.Create;
end;

{ TControllerTipoEntradaView }

constructor TControllerTipoEntradaView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoEntradaView);
end;

destructor TControllerTipoEntradaView.Destroy;
begin
  inherited;
end;

class function TControllerTipoEntradaView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoDocumentoEntradaView }

constructor TControllerTipoDocumentoEntradaView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoDocumentoEntradaView);
end;

destructor TControllerTipoDocumentoEntradaView.Destroy;
begin
  inherited;
end;

class function TControllerTipoDocumentoEntradaView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
