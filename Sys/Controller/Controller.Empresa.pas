unit Controller.Empresa;

interface

uses
  System.Generics.Collections, System.Classes, FireDAC.Comp.Client, Interacao.Empresa, Classe.Empresa;

type
  TEmpresaController = class(TInterfacedObject, IEmpresa)
    strict private
      class var _instance : TEmpresaController;
    private
      [weak]
      FModel   : IEmpresaModel;
    protected
      constructor Create();
      destructor Destroy();
    public
      procedure ListarEmpresas(aConn : TFDConnection; aLista : TStrings);

      class function getInstance() : TEmpresaController;
  end;

implementation

{ TEmpresaController }

constructor TEmpresaController.Create;
begin
  inherited Create;
  FModel := TEmpresa.New;
end;

destructor TEmpresaController.Destroy;
begin
  TEmpresa(FModel).DisposeOf;
  inherited Destroy;
end;

class function TEmpresaController.getInstance: TEmpresaController;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

procedure TEmpresaController.ListarEmpresas(aConn: TFDConnection; aLista : TStrings);
var
  aQry : TFDQuery;
  aEmpresa : TEmpresa;
begin
  aLista.Clear;
  aQry := TFDQuery.Create(nil);
  try
    aQry.Connection  := aConn;
    aQry.Transaction := aConn.Transaction;

    with aQry do
    begin
      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('    codigo  ');
      SQL.Add('  , cnpj    ');
      SQL.Add('  , razao   ');
      SQL.Add('  , fantasia');
      SQL.Add('from VW_EMPRESA');
      SQL.EndUpdate;

      if OpenOrExecute then
        while not Eof do
        begin
          aEmpresa := TEmpresa.Create;

          aEmpresa
            .Codigo( FieldByName('codigo').AsInteger )
            .CNPJ( FieldByName('cnpj').AsString )
            .RazaoSocial( FieldByName('razao').AsString )
            .Fantasia( FieldByName('fantasia').AsString );

          aLista.AddObject(aEmpresa.Fantasia, aEmpresa);

          Next;
        end;
    end;
  finally
    aQry.DisposeOf;
  end;
end;

end.
