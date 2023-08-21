unit SGE.Controller.Impressao.RequisicaoAlmox;

interface

uses
  SGE.Controller.Impressao.DataModule.RequisicaoAlmox;

type
  IImpressaoRequisicaoAlmox = interface
    ['{04254E10-7563-4D4B-892D-C93B1947E3CE}']
    procedure VisualizarRequisicao(aEmpresa : String; aAno, aCodigo, aCliente : Integer; const aTodosItens: Boolean = True);
    procedure VisualizarManifesto(aEmpresa : String; aAno, aCodigo, aCliente: Integer; const aTodosItens: Boolean = True);
    procedure VisualizarOrdemEntrega(aEmpresa : String; aAno, aCodigo, aCliente: Integer; const aTodosItens: Boolean = True);
  end;

  TImpressaoRequisicaoAlmox = class(TInterfacedObject, IImpressaoRequisicaoAlmox)
    private
      FDataModule : TDataModuleRequisicaoAlmox;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IImpressaoRequisicaoAlmox;

      procedure VisualizarRequisicao(aEmpresa : String; aAno, aCodigo, aCliente : Integer; const aTodosItens: Boolean = True);
      procedure VisualizarManifesto(aEmpresa : String; aAno, aCodigo, aCliente: Integer; const aTodosItens: Boolean = True);
      procedure VisualizarOrdemEntrega(aEmpresa : String; aAno, aCodigo, aCliente: Integer; const aTodosItens: Boolean = True);
  end;

implementation

{ TImpressaoRequisicaoAlmox }

constructor TImpressaoRequisicaoAlmox.Create;
begin
  FDataModule := TDataModuleRequisicaoAlmox.Create(nil);
end;

destructor TImpressaoRequisicaoAlmox.Destroy;
begin
  FDataModule.DisposeOf;
  inherited;
end;

class function TImpressaoRequisicaoAlmox.New: IImpressaoRequisicaoAlmox;
begin
  Result := Self.Create;
end;

procedure TImpressaoRequisicaoAlmox.VisualizarManifesto(aEmpresa: String; aAno, aCodigo, aCliente: Integer;
  const aTodosItens: Boolean);
begin
  if FDataModule.CarregarManifestoAlmox(aEmpresa, aAno, aCodigo, aCliente, aTodosItens) then
    FDataModule.VisualizarManifestoAlmox;
end;

procedure TImpressaoRequisicaoAlmox.VisualizarOrdemEntrega(aEmpresa: String; aAno, aCodigo, aCliente: Integer;
  const aTodosItens: Boolean);
begin
  if FDataModule.CarregarOrdemEntrega(aEmpresa, aAno, aCodigo, aCliente, aTodosItens) then
    FDataModule.VisualizarOrdemEntrega;
end;

procedure TImpressaoRequisicaoAlmox.VisualizarRequisicao(aEmpresa: String; aAno, aCodigo, aCliente: Integer;
  const aTodosItens: Boolean);
begin
  if FDataModule.CarregarRequisicaoAlmox(aEmpresa, aAno, aCodigo, aCliente, aTodosItens) then
    FDataModule.VisualizarRequisicaoAlmox;
end;

end.
