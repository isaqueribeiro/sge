unit Controller.Empresa;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.Generics.Collections,
  FireDAC.Comp.Client,
  Interacao.Empresa,
  Classe.Empresa,
  Service.Utils;

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
      procedure ListarEmpresas(aConn : TFDConnection; const aLista : TStrings);

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

procedure TEmpresaController.ListarEmpresas(aConn: TFDConnection; const aLista : TStrings);
var
  aQry : TFDQuery;
  aEmpresa : TEmpresaObject;
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
      SQL.Add('    e.codigo  ');
      SQL.Add('  , e.cnpj    ');
      SQL.Add('  , e.razao   ');
      SQL.Add('  , e.fantasia');
      SQL.Add('  , c.ender   ');
      SQL.Add('  , c.numero_end ');
      SQL.Add('  , c.complemento');
      SQL.Add('  , c.bairro');
      SQL.Add('  , c.cidade');
      SQL.Add('  , c.uf    ');
      SQL.Add('  , c.cep   ');
      SQL.Add('from VW_EMPRESA e');
      SQL.Add('  inner join TBEMPRESA c on (c.cnpj = e.cnpj)');
      SQL.EndUpdate;

      if OpenOrExecute then
      begin
        while not Eof do
        begin
          aEmpresa := TEmpresaObject.Create;

          with aEmpresa do
          begin
            Codigo := FieldByName('codigo').AsInteger;
            CNPJ   := FieldByName('cnpj').AsString;
            RazaoSocial := FieldByName('razao').AsString;
            Fantasia    := FieldByName('fantasia').AsString;

            Endereco := Trim(FieldByName('ender').AsString) + ', No. ' + Trim(FieldByName('numero_end').AsString) +
              IfThen(Trim(FieldByName('complemento').AsString) = EmptyStr, '', ' (' + Trim(FieldByName('complemento').AsString) + ')') + ', ' +
              'BAIRRO: ' + Trim(FieldByName('bairro').AsString) + ' - ' + Trim(FieldByName('cidade').AsString) + ' ' +
              'CEP: ' + TServicesUtils.StrFormatarCEP(Trim(FieldByName('cep').AsString));
          end;

          aLista.AddObject(aEmpresa.Fantasia, aEmpresa);

          Next;
        end
      end
      else
      begin
        // Empresa de demonstração
        aEmpresa := TEmpresaObject.Create;
        aLista.AddObject(aEmpresa.Fantasia, aEmpresa);
      end;
    end;
  finally
    aQry.DisposeOf;
  end;
end;

end.
