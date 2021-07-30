unit SGE.Controller.Factory;

interface

uses
  SGE.Controller.Interfaces,
  SGE.Controller.UF,
  SGE.Controller.Cidade,
  SGE.Controller.Distrito,
  SGE.Controller.Bairro,
  SGE.Controller.TipoLogradouro,
  SGE.Controller.Logradouro,
  SGE.Controller.CST,
  SGE.Controller.CFOP,
  SGE.Controller.IBPT,
  SGE.Controller.Empresa,
  SGE.Controller.ContaCorrente,
  SGE.Controller.FormaPagto,
  SGE.Controller.CondicaoPagto;

type
  TControllerFactory = class(TInterfacedObject, IControllerFactory)
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
      FTabelaIBPT   ,
      FNivelIBPT    ,
      FEmpresa      ,
      FEmpresaView  ,
      FContaCorrente,
      FContaCorrenteView,
      FFormaPagto       : IControllerCustom;
      FFormaPagtoContaCorrente,
      FFormaPagtoNFCEView     : IControllerCustom;
      FCondicaoPagto     ,
      FCondicaoPagtoForma,
      FCondicaoPagtoView : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerFactory;

      function UF : IControllerCustom;
      function Cidade   : IControllerCustom;
      function Distrito : IControllerCustom;
      function Bairro   : IControllerCustom;
      function TipoLogradouro : IControllerCustom;
      function Logradouro : IControllerCustom;
      function CST : IControllerCustom;
      function CFOP : IControllerCustom;
      function IBPT : IControllerCustom;
      function TabelaIBPT : IControllerCustom;
      function NivelIBPT : IControllerCustom;
      function Empresa : IControllerCustom;
      function EmpresaView : IControllerCustom;
      function ContaCorrente : IControllerCustom;
      function ContaCorrenteView : IControllerCustom;
      function FormaPagto : IControllerCustom;
      function FormaPagtoContaCorrente : IControllerCustom;
      function FormaPagtoNFCEView : IControllerCustom;
      function CondicaoPagto : IControllerCustom;
      function CondicaoPagtoForma : IControllerCustom;
      function CondicaoPagtoView : IControllerCustom;
  end;

implementation

{ TControllerFactory }

constructor TControllerFactory.Create;
begin
  ;
end;

destructor TControllerFactory.Destroy;
begin
  inherited;
end;

class function TControllerFactory.New: IControllerFactory;
begin
  Result := Self.Create;
end;

function TControllerFactory.NivelIBPT: IControllerCustom;
begin
  if not Assigned(FNivelIBPT) then
    FNivelIBPT := TControllerNivelIBPT.New;

  Result := FNivelIBPT;
end;

function TControllerFactory.CST: IControllerCustom;
begin
  if not Assigned(FCST) then
    FCST := TControllerCST.New;

  Result := FCST;
end;

function TControllerFactory.Bairro: IControllerCustom;
begin
  if not Assigned(FBairro) then
    FBairro := TControllerBairro.New;

  Result := FBairro;
end;

function TControllerFactory.CFOP: IControllerCustom;
begin
  if not Assigned(FCFOP) then
    FCFOP := TControllerCFOP.New;

  Result := FCFOP;
end;

function TControllerFactory.Cidade: IControllerCustom;
begin
  if not Assigned(FCidade) then
    FCidade := TControllerCidade.New;

  Result := FCidade;
end;

function TControllerFactory.CondicaoPagto: IControllerCustom;
begin
  if not Assigned(FCondicaoPagto) then
    FCondicaoPagto := TControllerCondicaoPagto.New;

  Result := FCondicaoPagto;
end;

function TControllerFactory.CondicaoPagtoForma: IControllerCustom;
begin
  if not Assigned(FCondicaoPagtoForma) then
    FCondicaoPagtoForma := TControllerCondicaoPagtoForma.New;

  Result := FCondicaoPagtoForma;
end;

function TControllerFactory.CondicaoPagtoView: IControllerCustom;
begin
  if not Assigned(FCondicaoPagtoView) then
    FCondicaoPagtoView := TControllerCondicaoPagtoView.New;

  Result := FCondicaoPagtoView;
end;

function TControllerFactory.ContaCorrente: IControllerCustom;
begin
  if not Assigned(FContaCorrente) then
    FContaCorrente := TControllerContaCorrente.New;

  Result := FContaCorrente;
end;

function TControllerFactory.ContaCorrenteView: IControllerCustom;
begin
  if not Assigned(FContaCorrenteView) then
    FContaCorrenteView := TControllerContaCorrenteView.New;

  Result := FContaCorrenteView;
end;

function TControllerFactory.Distrito: IControllerCustom;
begin
  if not Assigned(FDistrito) then
    FDistrito := TControllerDistrito.New;

  Result := FDistrito;
end;

function TControllerFactory.Empresa: IControllerCustom;
begin
  if not Assigned(FEmpresa) then
    FEmpresa := TControllerEmpresa.New;

  Result := FEmpresa;
end;

function TControllerFactory.EmpresaView: IControllerCustom;
begin
  if not Assigned(FEmpresaView) then
    FEmpresaView := TControllerEmpresaView.New;

  Result := FEmpresaView;
end;

function TControllerFactory.FormaPagto: IControllerCustom;
begin
  if not Assigned(FFormaPagto) then
    FFormaPagto := TControllerFormaPagto.New;

  Result := FFormaPagto;
end;

function TControllerFactory.FormaPagtoContaCorrente: IControllerCustom;
begin
  if not Assigned(FFormaPagtoContaCorrente) then
    FFormaPagtoContaCorrente := TControllerFormaPagtoContaCorrente.New;

  Result := FFormaPagtoContaCorrente;
end;

function TControllerFactory.FormaPagtoNFCEView: IControllerCustom;
begin
  if not Assigned(FFormaPagtoNFCEView) then
    FFormaPagtoNFCEView := TControllerFormaPagtoNFCEView.New;

  Result := FFormaPagtoNFCEView;
end;

function TControllerFactory.IBPT: IControllerCustom;
begin
  if not Assigned(FIBPT) then
    FIBPT := TControllerIBPT.New;

  Result := FIBPT;
end;

function TControllerFactory.Logradouro: IControllerCustom;
begin
  if not Assigned(FLogradouro) then
    FLogradouro := TControllerLogradouro.New;

  Result := FLogradouro;
end;

function TControllerFactory.TabelaIBPT: IControllerCustom;
begin
  if not Assigned(FTabelaIBPT) then
    FTabelaIBPT := TControllerTabelaIBPT.New;

  Result := FTabelaIBPT;
end;

function TControllerFactory.TipoLogradouro: IControllerCustom;
begin
  if not Assigned(FTipoLogradouro) then
    FTipoLogradouro := TControllerTipoLogradouro.New;

  Result := FTipoLogradouro;
end;

function TControllerFactory.UF: IControllerCustom;
begin
  if not Assigned(FUF) then
    FUF := TControllerUF.New;

  Result := FUF;
end;

end.
