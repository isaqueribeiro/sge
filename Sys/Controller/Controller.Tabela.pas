unit Controller.Tabela;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Interacao.Tabela;

type
  TAlignmentList = Array of TAlignment;
  TTabelaController = class(TInterfacedObject, ITabela)
    private
      FNomesCampos  : TStringList;
      FAlinhamentos : TAlignmentList;
      FFormatos     : TStringList;
    protected
      constructor Create;
    public
      destructor Destroy; override;

      function Display(aKey, aValue : String) : ITabela; overload;
      function Display(aKey, aValue, aFormato : String) : ITabela; overload;
      function Display(aKey, aValue, aFormato : String; aAlinhamento : TAlignment) : ITabela; overload;
      function Display(aKey, aValue : String; aAlinhamento : TAlignment) : ITabela; overload;
      function Tabela(aDataSet : TFDDataSet) : ITabela;

      procedure Configurar(aDataSet : TFDDataSet);

      class function New : ITabela;
  end;

implementation

{ TControllerTabela }

procedure TTabelaController.Configurar(aDataSet: TFDDataSet);
var
  I : Integer;
begin
  with aDataSet do
  begin
    for I := 0 to FNomesCampos.Count - 1 do
      if Assigned(Fields.FindField( FNomesCampos.KeyNames[I] )) then
      begin
        FieldByName( FNomesCampos.KeyNames[I] ).ReadOnly := False; // Recurso para liberar manipulação dos campos

        // Configurar DisplayName
        FieldByName( FNomesCampos.KeyNames[I] ).DisplayLabel := FNomesCampos.Values[ FNomesCampos.KeyNames[I] ];
        // Configurar Alinhamento
        FieldByName( FNomesCampos.KeyNames[I] ).Alignment    := FAlinhamentos[I];

        // Configurar Formato
        // .. Inteiro
        if (FieldByName( FNomesCampos.KeyNames[I] ) is TSmallintField) then
          TSmallintField( FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
        else
        if (FieldByName( FNomesCampos.KeyNames[I] ) is TIntegerField) then
          TIntegerField( FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
        else
        if (FieldByName( FNomesCampos.KeyNames[I] ) is TLargeintField) then
          TLargeintField( FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
        // .. Ponto flutuante
        else
        if (FieldByName( FNomesCampos.KeyNames[I] ) is TCurrencyField) then
          TCurrencyField( FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
        else
        if (FieldByName( FNomesCampos.KeyNames[I] ) is TBCDField) then
          TBCDField( FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
        else
        if (FieldByName( FNomesCampos.KeyNames[I] ) is TFMTBCDField) then
          TFMTBCDField( FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
        // .. Data e hora
        else
        if (FieldByName( FNomesCampos.KeyNames[I] ) is TTimeField) then
          TTimeField( FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
        else
        if (FieldByName( FNomesCampos.KeyNames[I] ) is TDateField) then
          TDateField( FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '')
        else
        if (FieldByName( FNomesCampos.KeyNames[I] ) is TDateTimeField) then
          TDateTimeField( FieldByName( FNomesCampos.KeyNames[I] ) ).DisplayFormat := FFormatos.Values[ FNomesCampos.KeyNames[I] ].Replace('vazio', '');
      end;
  end;
end;

constructor TTabelaController.Create;
begin
  FNomesCampos := TStringList.Create;
  FNomesCampos.Clear;

  FFormatos := TStringList.Create;
  FFormatos.Clear;
end;

destructor TTabelaController.Destroy;
begin
  FNomesCampos.Free;
  FFormatos.Free;
  inherited;
end;

function TTabelaController.Display(aKey, aValue, aFormato: String; aAlinhamento: TAlignment): ITabela;
var
  I : Integer;
begin
  Result := Self.Display(aKey, aValue, aFormato);
  I := FNomesCampos.IndexOfName( LowerCase(aKey.Trim) );
  if (I > -1) then
    FAlinhamentos[I] := aAlinhamento;
end;

function TTabelaController.Display(aKey, aValue, aFormato: String): ITabela;
var
  I : Integer;
begin
  Result := Self.Display(aKey, aValue);
  FFormatos.Values[ LowerCase(aKey.Trim) ] := aFormato;
end;

function TTabelaController.Display(aKey, aValue: String; aAlinhamento: TAlignment): ITabela;
var
  I : Integer;
begin
  Result := Self.Display(aKey, aValue);
  I := FNomesCampos.IndexOfName( LowerCase(aKey.Trim) );
  if (I > -1) then
    FAlinhamentos[I] := aAlinhamento;
end;

function TTabelaController.Display(aKey, aValue: String): ITabela;
begin
  Result := Self;
  FNomesCampos.Values[ LowerCase(aKey.Trim) ] := aValue.Trim;
end;

class function TTabelaController.New: ITabela;
begin
  Result := Self.Create;
end;

function TTabelaController.Tabela(aDataSet: TFDDataSet): ITabela;
var
  I : Integer;
begin
  Result := Self;

  FNomesCampos.BeginUpdate;
  FNomesCampos.Clear;

  FFormatos.BeginUpdate;
  FFormatos.Clear;

  SetLength(FAlinhamentos, aDataSet.FieldCount);

  for I := 0 to aDataSet.FieldCount - 1 do
  begin
    FNomesCampos
      .Add( LowerCase(aDataSet.Fields[I].FieldName) + '=' + aDataSet.Fields[I].DisplayLabel);

    FFormatos
      .Add( LowerCase(aDataSet.Fields[I].FieldName) + '=vazio');

    FAlinhamentos[I] := aDataSet.Fields[I].Alignment;
  end;

  FNomesCampos.EndUpdate;
  FFormatos.EndUpdate;
end;

end.
