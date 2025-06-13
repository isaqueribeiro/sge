unit SGI.Controller.Impressao.CotacaoCompra;

interface

uses
  SGI.Controller.Impressao.DataModule.CotacaoCompra;

type
  IImpressaoCotacaoCompra = interface
    ['{7ED0B84A-CD27-4754-BEE6-013A516BA3E8}']
    procedure VisualizarCotacao(aEmpresa : String; aAno, aControle : Integer);
    procedure VisualizarMapaCotacao(aEmpresa : String; aAno, aControle : Integer);
  end;

  TImpressaoCotacaoCompra = class(TInterfacedObject, IImpressaoCotacaoCompra)
    private
      FDataModule : TDataModuleCotacaoCompra;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IImpressaoCotacaoCompra;

      procedure VisualizarCotacao(aEmpresa : String; aAno, aControle : Integer);
      procedure VisualizarMapaCotacao(aEmpresa : String; aAno, aControle : Integer);
  end;

implementation

{ TImpressaoCotacaoCompra }

constructor TImpressaoCotacaoCompra.Create;
begin
  FDataModule := TDataModuleCotacaoCompra.Create(nil);
end;

destructor TImpressaoCotacaoCompra.Destroy;
begin
  FDataModule.DisposeOf;
  inherited;
end;

class function TImpressaoCotacaoCompra.New: IImpressaoCotacaoCompra;
begin
  Result := Self.Create;
end;

procedure TImpressaoCotacaoCompra.VisualizarCotacao(aEmpresa: String; aAno, aControle: Integer);
begin
  if FDataModule.CarregarCotacaoCompraServico(aEmpresa, aAno, aControle) then
    FDataModule.VisualizarCotacaoCompraServico;
end;

procedure TImpressaoCotacaoCompra.VisualizarMapaCotacao(aEmpresa: String; aAno, aControle: Integer);
begin
  if FDataModule.CarregarMapaCotacaoCompraServico(aEmpresa, aAno, aControle) then
    FDataModule.VisualizarMapaCotacaoCompraServico;
end;

end.
