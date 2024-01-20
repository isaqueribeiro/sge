unit SGE.Controller.Impressao.Contrato;

interface

uses
  System.SysUtils,
  System.Classes,
  UConstantesDGE,
  SGE.Controller.Impressao.DataModule.Contrato;

type
  IImpressaoContrato = interface
    ['{7BB03DFC-3FAB-477C-9DDA-6F79338783B7}']
    procedure VisualizarContrato(aControle : Int64; aModelo: TModeloPapel; const aHeader : Boolean = TRUE);
    procedure VIsualizarRelacaoContratos(aEmpresa : String; aDataInicial, aDataFinal : TDateTime);
  end;

  TImpressaoContrato = class(TInterfacedObject, IImpressaoContrato)
    private
      FDataModule : TDataModuleContrato;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IImpressaoContrato;

      procedure VisualizarContrato(aControle : Int64; aModelo: TModeloPapel; const aHeader : Boolean = TRUE);
      procedure VIsualizarRelacaoContratos(aEmpresa : String; aDataInicial, aDataFinal : TDateTime);
  end;

implementation

{ TImpressaoContrato }

constructor TImpressaoContrato.Create;
begin
  FDataModule := TDataModuleContrato.Create(nil);
end;

destructor TImpressaoContrato.Destroy;
begin
  FDataModule.DisposeOf;
  inherited;
end;

class function TImpressaoContrato.New: IImpressaoContrato;
begin
  Result := Self.Create;
end;

procedure TImpressaoContrato.VisualizarContrato(aControle: Int64; aModelo: TModeloPapel; const aHeader: Boolean);
begin
  if FDataModule.CarregarContrato(aControle) then
    FDataModule.VisualizarContrato(aModelo, aHeader);
end;

procedure TImpressaoContrato.VIsualizarRelacaoContratos(aEmpresa : String; aDataInicial, aDataFinal : TDateTime);
begin
  if FDataModule.CarregarRelacaoContratos(aEmpresa, aDataInicial, aDataFinal) then
    FDataModule.VIsualizarRelacaoContratos(aEmpresa, aDataInicial, aDataFinal);
end;

end.
