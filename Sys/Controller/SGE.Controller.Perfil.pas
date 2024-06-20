unit SGE.Controller.Perfil;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,

  Data.DB,

  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Table
  TControllerPerfil = class(TController, IControllerPerfil)
    private
      FBusca : IModelDAOCustom;
      FPermissoes : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerPerfil;

      function CarregarPermissoes(aSistema : Integer; aPerfil : Integer) : IControllerPerfil;
      function GravarPermissao(aSistema : Integer; aPerfil : Integer; aRotina : String; aPermissao : Boolean) : IControllerPerfil;
      function Permissoes : TDataSet;
  end;

  // View
  TControllerPerfilParaCopia = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerTipoDescontoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerPerfil }

function TControllerPerfil.CarregarPermissoes(aSistema, aPerfil: Integer): IControllerPerfil;
begin
  Result := Self;
  if not Assigned(FPermissoes) then
    FPermissoes := TModelDAOFactory.New.PerfilPermissao;

  FPermissoes
    .Close
    .ParamsByName('sistema', aSistema)
    .ParamsByName('perfil', aPerfil)
    .Open;
end;

constructor TControllerPerfil.Create;
begin
  inherited Create(TModelDAOFactory.New.Perfil);
end;

destructor TControllerPerfil.Destroy;
begin
  inherited;
end;

function TControllerPerfil.GravarPermissao(aSistema, aPerfil: Integer; aRotina: String;
  aPermissao: Boolean): IControllerPerfil;
begin
  Result := Self;
  try
    FDAO.ExecuteScriptSQL('Execute procedure SET_FUNCAO_PERMISSAO(' +
      aSistema.ToString    + ', ' +
      aPerfil.ToString     + ', ' +
      aRotina.QuotedString + ', ' +
      IfThen(aPermissao, '1', '0') + ')'
    );
  finally
    FDAO.CommitTransaction;
  end;
end;

class function TControllerPerfil.New: IControllerPerfil;
begin
  Result := Self.Create;
end;

function TControllerPerfil.Permissoes: TDataSet;
begin
  if not Assigned(FPermissoes) then
    Self.CarregarPermissoes(-1, -1);

  Result := FPermissoes.DataSet;
end;

{ TControllerPerfilParaCopia }

constructor TControllerPerfilParaCopia.Create;
begin
  inherited Create(TModelDAOFactory.New.PerfilParaCopia);
end;

destructor TControllerPerfilParaCopia.Destroy;
begin
  inherited;
end;

class function TControllerPerfilParaCopia.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoDescontoView }

constructor TControllerTipoDescontoView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoDescontoView);
end;

destructor TControllerTipoDescontoView.Destroy;
begin
  inherited;
end;

class function TControllerTipoDescontoView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
