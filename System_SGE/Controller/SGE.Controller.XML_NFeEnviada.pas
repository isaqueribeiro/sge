unit SGE.Controller.XML_NFeEnviada;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // XML das Notas Fiscais Eletrônicas enviadas (Compras/Vendas)
  TControllerXML_NFeEnviada = class(TController, IControllerXML_NFeEnviada)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerXML_NFeEnviada;

      function ListaNFePendente(aCNPJEmissor : String) : IControllerCustom; virtual; abstract;
      function EmissaoNFePendente(aCNPJEmissor : String) : Boolean; virtual; abstract;
  end;

implementation

{ TControllerXML_NFeEnviada }

constructor TControllerXML_NFeEnviada.Create;
begin
  inherited Create(TModelDAOFactory.New.XML_NFeEnviada);
end;

destructor TControllerXML_NFeEnviada.Destroy;
begin
  inherited;
end;

class function TControllerXML_NFeEnviada.New: IControllerXML_NFeEnviada;
begin
  Result := Self.Create;
end;

end.
