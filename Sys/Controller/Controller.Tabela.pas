unit Controller.Tabela;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Interacao.Tabela;

type
  TAlignmentList = Array of TAlignment;
  TTabelaController = class(TInterfacedObject, ITabela)
    private
      [weak]
      FDataSet      : TDataSet;
      FNomesCampos  : TStringList;
      FAlinhamentos : TAlignmentList;
      FFormatos     : TStringList;
      FRequired     : TDictionary<String, Boolean>;
    protected
      constructor Create;
    public
      destructor Destroy; override;

      function Display(aKey, aValue : String; const aRequired : Boolean = False) : ITabela; overload;
      function Display(aKey, aValue, aFormato : String; const aRequired : Boolean = False) : ITabela; overload;
      function Display(aKey, aValue, aFormato : String; aAlinhamento : TAlignment; const aRequired : Boolean = False) : ITabela; overload;
      function Display(aKey, aValue : String; aAlinhamento : TAlignment; const aRequired : Boolean = False) : ITabela; overload;

      function Tabela(aDataSet : TDataSet) : ITabela; overload;
      function Tabela(aDataSet : TFDDataSet) : ITabela; overload;

      procedure Configurar; overload;
      procedure Configurar(aDataSet : TDataSet); overload;
      procedure Configurar(aDataSet : TFDDataSet); overload;

      class function New : ITabela;
  end;

implementation

{ TControllerTabela }

procedure TTabelaController.Configurar(aDataSet: TFDDataSet);
begin
  FDataSet := aDataSet as TDataSet;
  Configurar;
end;

procedure TTabelaController.Configurar(aDataSet: TDataSet);
begin
  FDataSet := aDataSet;
  Configurar;
end;

procedure TTabelaController.Configurar;
var
  I : Integer;
begin
  for I := 0 to FNomesCampos.Count - 1 do
  begin
    if Assigned(FDataSet.Fields.FindField( FNomesCampos.KeyNames[I] )) then
      FDataSet.FieldByName( FNomesCampos.KeyNames[I] ).ReadOnly := False; // Recurso para liberar manipulação dos campos

    if Assigned(FDataSet.Fields.FindField( FNomesCampos.KeyNames[I] )) then
    begin
      // Configurar DisplayName
      FDataSet.FieldByName( FNomesCampos.KeyNames[I] ).DisplayLabel := FNomesCampos.Values[ FNomesCampos.KeyNames[I] ];
      // Configurar Alinhamento
      FDataSet.FieldByName( FNomesCampos.KeyNames[I] ).Alignment    := FAlinhamentos[I];
      // Configurar campos requiridos
      if FRequired.ContainsKey(FNomesCampos.KeyNames[I]) then
        FDataSet.FieldByName( FNomesCampos.KeyNames[I] ).Required     := FRequired.Items[ FNomesCampos.KeyNames[I] ];

      // Configurar Formato
      // .. Inteiro
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TSmallintField) then
        TSmallintField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
      else
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TIntegerField) then
        TIntegerField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
      else
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TLargeintField) then
        TLargeintField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
      // .. Ponto flutuante
      else
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TCurrencyField) then
        TCurrencyField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
      else
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TBCDField) then
        TBCDField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
      else
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TFMTBCDField) then
        TFMTBCDField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
      else
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TNumericField) then
        TNumericField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
      // .. Data e hora
      else
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TTimeField) then
        TTimeField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
      else
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TDateField) then
        TDateField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
      else
      if (FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) is TDateTimeField) then
        TDateTimeField( FDataSet.FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '');
    end;
  end;
end;

constructor TTabelaController.Create;
begin
  FNomesCampos := TStringList.Create;
  FNomesCampos.Clear;

  FFormatos := TStringList.Create;
  FFormatos.Clear;

  FRequired := TDictionary<String, Boolean>.Create;
end;

destructor TTabelaController.Destroy;
begin
  FNomesCampos.DisposeOf;
  FFormatos.DisposeOf;
  FRequired.DisposeOf;
  inherited;
end;

function TTabelaController.Display(aKey, aValue, aFormato: String; aAlinhamento: TAlignment; const aRequired : Boolean = False): ITabela;
var
  I : Integer;
begin
  Result := Self.Display(LowerCase(aKey.Trim), aValue, aFormato, aRequired);
  I := FNomesCampos.IndexOfName( LowerCase(aKey.Trim) );
  if (I > -1) then
    FAlinhamentos[I] := aAlinhamento;
end;

function TTabelaController.Display(aKey, aValue, aFormato: String; const aRequired : Boolean = False): ITabela;
var
  I : Integer;
begin
  Result := Self.Display(aKey, aValue, aRequired);
  FFormatos.Values[ LowerCase(aKey.Trim) ] := aFormato;
end;

function TTabelaController.Display(aKey, aValue: String; aAlinhamento: TAlignment; const aRequired : Boolean = False): ITabela;
var
  I : Integer;
begin
  Result := Self.Display(LowerCase(aKey.Trim), aValue, aRequired);
  I := FNomesCampos.IndexOfName( LowerCase(aKey.Trim) );
  if (I > -1) then
    FAlinhamentos[I] := aAlinhamento;
end;

function TTabelaController.Display(aKey, aValue: String; const aRequired : Boolean = False): ITabela;
begin
  Result := Self;
  FNomesCampos.Values[ LowerCase(aKey.Trim) ] := aValue.Trim;
  FRequired.AddOrSetValue(LowerCase(aKey.Trim), aRequired);
end;

class function TTabelaController.New: ITabela;
begin
  Result := Self.Create;
end;

function TTabelaController.Tabela(aDataSet: TDataSet): ITabela;
var
  I : Integer;
begin
  Result   := Self;
  FDataSet := aDataSet;

  FNomesCampos.BeginUpdate;
  FNomesCampos.Clear;

  FFormatos.BeginUpdate;
  FFormatos.Clear;

  SetLength(FAlinhamentos, FDataSet.FieldCount);

  for I := 0 to aDataSet.FieldCount - 1 do
  begin
    aDataSet.Fields[I].ReadOnly := False; // Recurso para liberar manipulação dos campos

    FNomesCampos
      .Add( LowerCase(aDataSet.Fields[I].FieldName) + '=' + aDataSet.Fields[I].DisplayLabel);

    FFormatos
      .Add( LowerCase(aDataSet.Fields[I].FieldName) + '=vazio');

    FAlinhamentos[I] := aDataSet.Fields[I].Alignment;

    FRequired.AddOrSetValue(LowerCase(aDataSet.Fields[I].FieldName), aDataSet.Fields[I].Required);
  end;

  FNomesCampos.EndUpdate;
  FFormatos.EndUpdate;
end;

function TTabelaController.Tabela(aDataSet: TFDDataSet): ITabela;
begin
  Result := Self.Tabela(aDataSet as TDataSet);
end;

end.
