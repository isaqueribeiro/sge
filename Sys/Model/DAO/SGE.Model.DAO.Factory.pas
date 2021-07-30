unit SGE.Model.DAO.Factory;

interface

uses
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.UF,
  SGE.Model.DAO.Cidade,
  SGE.Model.DAO.Distrito,
  SGE.Model.DAO.Bairro,
  SGE.Model.DAO.TipoLogradouro,
  SGE.Model.DAO.Logradouro,
  SGE.Model.DAO.CST,
  SGE.Model.DAO.CFOP,
  SGE.Model.DAO.IBPT,
  SGE.Model.DAO.Empresa,
  SGE.Model.DAO.ContaCorrente,
  SGE.Model.DAO.FormaPagto,
  SGE.Model.DAO.CondicaoPagto;

type
  TModelDAOFactory = class(TInterfacedObject, IModelDAOFactory)
    private
      FUF       ,
      FCidade   ,
      FDistrito ,
      FBairro   ,
      FTipoLogradouro,
      FLogradouro    ,
      FCST  ,
      FCFOP ,
      FIBPT ,
      FTabelaIBPT,
      FNivelIBPT ,
      FEmpresaView,
      FEmpresa    ,
      FContaCorrente     ,
      FContaCorrenteView : IModelDAOCustom;
      FFormaPagto ,
      FFormaPagtoContaCorrente,
      FFormaPagtoNFCEView     ,
      FCondicaoPagto     ,
      FCondicaoPagtoForma,
      FCondicaoPagtoView : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOFactory;

      function UF       : IModelDAOCustom;
      function Cidade   : IModelDAOCustom;
      function Distrito : IModelDAOCustom;
      function Bairro   : IModelDAOCustom;
      function TipoLogradouro : IModelDAOCustom;
      function Logradouro : IModelDAOCustom;
      function CST : IModelDAOCustom;
      function CFOP : IModelDAOCustom;
      function IBPT : IModelDAOCustom;
      function TabelaIBPT : IModelDAOCustom;
      function NivelIBPT : IModelDAOCustom;
      function Empresa : IModelDAOCustom;
      function EmpresaView : IModelDAOCustom;
      function ContaCorrente : IModelDAOCustom;
      function ContaCorrenteView : IModelDAOCustom;
      function FormaPagto : IModelDAOCustom;
      function FormaPagtoContaCorrente : IModelDAOCustom;
      function FormaPagtoNFCEView : IModelDAOCustom;
      function CondicaoPagto : IModelDAOCustom;
      function CondicaoPagtoForma : IModelDAOCustom;
      function CondicaoPagtoView : IModelDAOCustom;
  end;

implementation

{ TModelDAOFactory }

constructor TModelDAOFactory.Create;
begin
  ;
end;

destructor TModelDAOFactory.Destroy;
begin
  inherited;
end;

class function TModelDAOFactory.New: IModelDAOFactory;
begin
  Result := Self.Create;
end;

function TModelDAOFactory.NivelIBPT: IModelDAOCustom;
begin
  if not Assigned(FNivelIBPT) then
    FNivelIBPT := TModelDAONivelIBPT.New;

  Result := FNivelIBPT;
end;

function TModelDAOFactory.CST: IModelDAOCustom;
begin
  if not Assigned(FCST) then
    FCST := TModelDAOCST.New;

  Result := FCST;
end;

function TModelDAOFactory.TabelaIBPT: IModelDAOCustom;
begin
  if not Assigned(FTabelaIBPT) then
    FTabelaIBPT := TModelDAOTabelaIBPT.New;

  Result := FTabelaIBPT;
end;

function TModelDAOFactory.TipoLogradouro: IModelDAOCustom;
begin
  if not Assigned(FTipoLogradouro) then
    FTipoLogradouro := TModelDAOTipoLogradouro.New;

  Result := FTipoLogradouro;
end;

function TModelDAOFactory.Bairro: IModelDAOCustom;
begin
  if not Assigned(FBairro) then
    FBairro := TModelDAOBairro.New;

  Result := FBairro;
end;

function TModelDAOFactory.CFOP: IModelDAOCustom;
begin
  if not Assigned(FCFOP) then
    FCFOP := TModelDAOCFOP.New;

  Result := FCFOP;
end;

function TModelDAOFactory.Cidade: IModelDAOCustom;
begin
  if not Assigned(FCidade) then
    FCidade := TModelDAOCidade.New;

  Result := FCidade;
end;

function TModelDAOFactory.CondicaoPagto: IModelDAOCustom;
begin
  if not Assigned(FCondicaoPagto) then
    FCondicaoPagto := TModelDAOCondicaoPagto.New;

  Result := FCondicaoPagto;
end;

function TModelDAOFactory.CondicaoPagtoForma: IModelDAOCustom;
begin
  if not Assigned(FCondicaoPagtoForma) then
    FCondicaoPagtoForma := TModelDAOCondicaoPagtoForma.New;

  Result := FCondicaoPagtoForma;
end;

function TModelDAOFactory.CondicaoPagtoView: IModelDAOCustom;
begin
  if not Assigned(FCondicaoPagtoView) then
    FCondicaoPagtoView := TModelDAOCondicaoPagtoView.New;

  Result := FCondicaoPagtoView;
end;

function TModelDAOFactory.ContaCorrente: IModelDAOCustom;
begin
  if not Assigned(FContaCorrente) then
    FContaCorrente := TModelDAOContaCorrente.New;

  Result := FContaCorrente;
end;

function TModelDAOFactory.ContaCorrenteView: IModelDAOCustom;
begin
  if not Assigned(FContaCorrenteView) then
    FContaCorrenteView := TModelDAOContaCorrenteView.New;

  Result := FContaCorrenteView;
end;

function TModelDAOFactory.Distrito: IModelDAOCustom;
begin
  if not Assigned(FDistrito) then
    FDistrito := TModelDAODistrito.New;

  Result := FDistrito;
end;

function TModelDAOFactory.Empresa: IModelDAOCustom;
begin
  if not Assigned(FEmpresa) then
    FEmpresa := TModelDAOEmpresa.New;

  Result := FEmpresa;
end;

function TModelDAOFactory.EmpresaView: IModelDAOCustom;
begin
  if not Assigned(FEmpresaView) then
    FEmpresaView := TModelDAOEmpresaView.New;

  Result := FEmpresaView;
end;

function TModelDAOFactory.FormaPagto: IModelDAOCustom;
begin
  if not Assigned(FFormaPagto) then
    FFormaPagto := TModelDAOFormaPagto.New;

  Result := FFormaPagto;
end;

function TModelDAOFactory.FormaPagtoContaCorrente: IModelDAOCustom;
begin
  if not Assigned(FFormaPagtoContaCorrente) then
    FFormaPagtoContaCorrente := TModelDAOFormaPagtoContaCorrente.New;

  Result := FFormaPagtoContaCorrente;
end;

function TModelDAOFactory.FormaPagtoNFCEView: IModelDAOCustom;
begin
  if not Assigned(FFormaPagtoNFCEView) then
    FFormaPagtoNFCEView := TModelDAOFormaPagtoNFCEView.New;

  Result := FFormaPagtoNFCEView;
end;

function TModelDAOFactory.IBPT: IModelDAOCustom;
begin
  if not Assigned(FIBPT) then
    FIBPT := TModelDAOIBPT.New;

  Result := FIBPT;
end;

function TModelDAOFactory.Logradouro: IModelDAOCustom;
begin
  if not Assigned(FLogradouro) then
    FLogradouro := TModelDAOLogradouro.New;

  Result := FLogradouro;
end;

function TModelDAOFactory.UF: IModelDAOCustom;
begin
  if not Assigned(FUF) then
    FUF := TModelDAOUF.New;

  Result := FUF;
end;

end.
