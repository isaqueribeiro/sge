unit SGE.Controller.Impressao.AutorizacaoCompra;

interface

uses
  SGE.Controller.Impressao.DataModule.AutorizacaoCompra;

type
  IImpressaoAutorizacaoCompra = interface
    ['{E64E5312-6670-4A72-BD19-5F8B78C74F4C}']
    procedure VisualizarAutorizacao(aEmpresa : String; aFornecedor, aAno, aControle : Integer);
  end;

  TImpressaoAutorizacaoCompra = class(TInterfacedObject, IImpressaoAutorizacaoCompra)
    private
      FDataModule : TDataModuleAutorizacaoCompra;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IImpressaoAutorizacaoCompra;

      procedure VisualizarAutorizacao(aEmpresa : String; aFornecedor, aAno, aControle : Integer);
  end;

implementation

{ TImpressaoAutorizacaoCompra }

constructor TImpressaoAutorizacaoCompra.Create;
begin
  FDataModule := TDataModuleAutorizacaoCompra.Create(nil);
end;

destructor TImpressaoAutorizacaoCompra.Destroy;
begin
  FDataModule.DisposeOf;
  inherited;
end;

class function TImpressaoAutorizacaoCompra.New: IImpressaoAutorizacaoCompra;
begin
  Result := Self.Create;
end;

procedure TImpressaoAutorizacaoCompra.VisualizarAutorizacao(aEmpresa: String; aFornecedor, aAno, aControle: Integer);
begin
  if FDataModule.CarregarAutorizacaoCompra(aEmpresa, aFornecedor, aAno, aControle) then
    FDataModule.VisualizarAutorizacaoCompra;
end;

end.
