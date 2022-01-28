unit SGE.Controller;

interface

uses
  Data.DB,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces;

type
  TController = class(TInterfacedObject, IController)
    private
    protected
      FDAO : IModelDAOCustom;
      constructor Create(aDAO : IModelDAOCustom);
    public
      destructor Destroy; override;
      class function New(aDAO : IModelDAOCustom) : IController;

      function DAO : IModelDAOCustom;
      function GerarSequencial(const aDataSet : TDataSet; const aCampo : String; var aSequencial : Integer) : IController;
  end;

implementation

uses
  System.SysUtils;

{ TController }

constructor TController.Create(aDAO : IModelDAOCustom);
begin
  FDAO := aDAO;
end;

function TController.DAO: IModelDAOCustom;
begin
  Result := FDAO;
end;

destructor TController.Destroy;
begin
  inherited;
end;

function TController.GerarSequencial(const aDataSet: TDataSet; const aCampo: String;
  var aSequencial: Integer): IController;
begin
  Result := Self;
  aSequencial := aDataSet.RecordCount + 1;

  if (aDataSet.RecordCount > 0) then
    if ( Trim(aCampo) <> EmptyStr ) then
      while aDataSet.Locate(aCampo, aSequencial, []) do
        aSequencial := aSequencial + 1;
end;

class function TController.New(aDAO : IModelDAOCustom): IController;
begin
  Result := Self.Create(aDAO);
end;

end.
