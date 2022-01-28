unit SGE.Controller.Impressao.Cheque;

interface

uses
  System.SysUtils,
  System.Classes,
  UConstantesDGE,
  SGE.Controller.Impressao.DataModule.Cheque;

type
  IImpressaoCheque = interface
    ['{E64E5312-6670-4A72-BD19-5F8B78C74F4C}']
    procedure VisualizarCheque(aControle : Integer; aModelo: TModeloPapel; const aHeader : Boolean = TRUE);
    procedure VIsualizarRelacaoCheques(aEmpresa : String; aDataInicial, aDataFinal : TDateTime);
  end;

  TImpressaoCheque = class(TInterfacedObject, IImpressaoCheque)
    private
      FDataModule : TDataModuleCheque;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IImpressaoCheque;

      procedure VisualizarCheque(aControle : Integer; aModelo: TModeloPapel; const aHeader : Boolean = TRUE);
      procedure VIsualizarRelacaoCheques(aEmpresa : String; aDataInicial, aDataFinal : TDateTime);
  end;

implementation

{ TImpressaoCheque }

constructor TImpressaoCheque.Create;
begin
  FDataModule := TDataModuleCheque.Create(nil);
end;

destructor TImpressaoCheque.Destroy;
begin
  FDataModule.DisposeOf;
  inherited;
end;

class function TImpressaoCheque.New: IImpressaoCheque;
begin
  Result := Self.Create;
end;

procedure TImpressaoCheque.VisualizarCheque(aControle: Integer; aModelo: TModeloPapel; const aHeader: Boolean);
begin
  if FDataModule.CarregarCheque(aControle) then
    FDataModule.VisualizarCheque(aModelo, aHeader);
end;

procedure TImpressaoCheque.VIsualizarRelacaoCheques(aEmpresa : String; aDataInicial, aDataFinal : TDateTime);
begin
  if FDataModule.CarregarRelacaoCheques(aEmpresa, aDataInicial, aDataFinal) then
    FDataModule.VisualizarRelacaoCheques(aEmpresa, aDataInicial, aDataFinal);
end;

end.
