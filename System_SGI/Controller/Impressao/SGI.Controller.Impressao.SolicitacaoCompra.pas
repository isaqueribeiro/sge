unit SGI.Controller.Impressao.SolicitacaoCompra;

interface

uses
  SGI.Controller.Impressao.DataModule.SolicitacaoCompra;

type
  IImpressaoSolicitacaoCompra = interface
    ['{B6CE5FA2-B6AB-460C-9841-BC1000165815}']
    procedure VisualizarSolicitacao(aEmpresa : String; aAno, aControle : Integer);
  end;

  TImpressaoSolicitacaoCompra = class(TInterfacedObject, IImpressaoSolicitacaoCompra)
    private
      FDataModule : TDataModuleSolicitacaoCompra;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IImpressaoSolicitacaoCompra;

      procedure VisualizarSolicitacao(aEmpresa : String; aAno, aControle : Integer);
  end;

implementation

{ TImpressaoSolicitacaoCompra }

constructor TImpressaoSolicitacaoCompra.Create;
begin
  FDataModule := TDataModuleSolicitacaoCompra.Create(nil);
end;

destructor TImpressaoSolicitacaoCompra.Destroy;
begin
  FDataModule.DisposeOf;
  inherited;
end;

class function TImpressaoSolicitacaoCompra.New: IImpressaoSolicitacaoCompra;
begin
  Result := Self.Create;
end;

procedure TImpressaoSolicitacaoCompra.VisualizarSolicitacao(aEmpresa: String; aAno, aControle: Integer);
begin
  if FDataModule.CarregarSolicitacaoCompra(aEmpresa, aAno, aControle) then
    FDataModule.VisualizarSolicitacaoCompra;
end;

end.
