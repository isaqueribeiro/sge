unit SGE.Controller.Impressao.ContaAPagar;

interface

uses
  System.SysUtils,
  System.Classes,
  UConstantesDGE,
  SGE.Controller.Impressao.DataModule.ContaAPagar;

type
  IImpressaoContaAPagar = interface
    ['{12845377-9DCA-43E9-B9BA-EB87CB9D9BAF}']
    procedure VisualizarReciboPagamento(aAno, aControle, aBaixa : Integer; aModelo: TModeloRecibo;
      const aHeader : Boolean = TRUE);
  end;

  TImpressaoContaAPagar = class(TInterfacedObject, IImpressaoContaAPagar)
    private
      FDataModule : TDataModuleContaAPagar;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IImpressaoContaAPagar;

      procedure VisualizarReciboPagamento(aAno, aControle, aBaixa : Integer; aModelo: TModeloRecibo;
        const aHeader : Boolean = TRUE);
  end;

implementation

{ TImpressaoContaAPagar }

constructor TImpressaoContaAPagar.Create;
begin
  FDataModule := TDataModuleContaAPagar.Create(nil);
end;

destructor TImpressaoContaAPagar.Destroy;
begin
  FDataModule.DisposeOf;
  inherited;
end;

class function TImpressaoContaAPagar.New: IImpressaoContaAPagar;
begin
  Result := Self.Create;
end;

procedure TImpressaoContaAPagar.VisualizarReciboPagamento(aAno, aControle, aBaixa: Integer; aModelo: TModeloRecibo;
  const aHeader : Boolean);
begin
  if FDataModule.CarregarReciboPagamento(aAno, aControle, aBaixa) then
    FDataModule.VisualizarReciboPagamento(aModelo, aHeader);
end;


end.
