unit SGE.Controller.Impressao.ContaAReceber;

interface

uses
  System.SysUtils,
  System.Classes,
  UConstantesDGE,
  SGE.Controller.Impressao.DataModule.ContaAReceber;

type
  IImpressaoContaAReceber = interface
    ['{7316BCF3-2868-4470-A997-10AE0E89C492}']
    procedure VisualizarRecibo(aAno, aControle, aBaixa : Integer; aModelo: TModeloPapel;
      const aHeader : Boolean = TRUE);
  end;

  TImpressaoContaAReceber = class(TInterfacedObject, IImpressaoContaAReceber)
    private
      FDataModule : TDataModuleContaAReceber;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IImpressaoContaAReceber;

      procedure VisualizarRecibo(aAno, aControle, aBaixa : Integer; aModelo: TModeloPapel;
        const aHeader : Boolean = TRUE);
  end;

implementation

{ TImpressaoContaAReceber }

constructor TImpressaoContaAReceber.Create;
begin
  FDataModule := TDataModuleContaAReceber.Create(nil);
end;

destructor TImpressaoContaAReceber.Destroy;
begin
  FDataModule.DisposeOf;
  inherited;
end;

class function TImpressaoContaAReceber.New: IImpressaoContaAReceber;
begin
  Result := Self.Create;
end;

procedure TImpressaoContaAReceber.VisualizarRecibo(aAno, aControle, aBaixa: Integer; aModelo: TModeloPapel;
  const aHeader : Boolean);
begin
  if FDataModule.CarregarRecibo(aAno, aControle, aBaixa) then
    FDataModule.VisualizarRecibo(aModelo, aHeader);
end;


end.
