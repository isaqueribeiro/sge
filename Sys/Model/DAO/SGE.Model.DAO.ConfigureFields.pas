unit SGE.Model.DAO.ConfigureFields;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO.Interfaces;

type
  TAlignmentList   = Array of TAlignment;
  TConfigureFields = class(TInterfacedObject, IConfigureFields)
    private
      [weak]
      FDataSet : TDataSet;
      FNomesCampos  : TStringList;
      FAlinhamentos : TAlignmentList;
      FFormatos     : TStringList;
    protected
      constructor Create(aDataSet : TDataSet);
    public
      destructor Destroy; override;
      class function New(aDataSet : TDataSet) : IConfigureFields;

      function Table(aDataSet : TDataSet) : IConfigureFields;
      function Display(aKey, aValue : String) : IConfigureFields; overload;
      function Display(aKey, aValue, aFormato : String) : IConfigureFields; overload;
      function Display(aKey, aValue, aFormato : String; aAlinhamento : TAlignment) : IConfigureFields; overload;
      function Display(aKey, aValue : String; aAlinhamento : TAlignment) : IConfigureFields; overload;

      procedure Setup; overload;
      procedure Setup(aDataSet : TDataSet); overload;
  end;

implementation

{ TConfigureFields }

constructor TConfigureFields.Create(aDataSet : TDataSet);
begin
  FDataSet := aDataSet;

  FNomesCampos := TStringList.Create;
  FNomesCampos.Clear;

  FFormatos := TStringList.Create;
  FFormatos.Clear;
end;

destructor TConfigureFields.Destroy;
begin
  FNomesCampos.DisposeOf;
  FFormatos.DisposeOf;
  inherited;
end;

class function TConfigureFields.New(aDataSet: TDataSet): IConfigureFields;
begin
  Result := Self.Create(aDataSet);
end;

function TConfigureFields.Display(aKey, aValue: String): IConfigureFields;
begin
  Result := Self;
  FNomesCampos.Values[ LowerCase(aKey.Trim) ] := aValue.Trim;
end;

function TConfigureFields.Display(aKey, aValue, aFormato: String): IConfigureFields;
var
  I : Integer;
begin
  Result := Self.Display(aKey, aValue);
  FFormatos.Values[ LowerCase(aKey.Trim) ] := aFormato;
end;

function TConfigureFields.Display(aKey, aValue: String; aAlinhamento: TAlignment): IConfigureFields;
var
  I : Integer;
begin
  Result := Self.Display(aKey, aValue);
  I := FNomesCampos.IndexOfName( LowerCase(aKey.Trim) );
  if (I > -1) then
    FAlinhamentos[I] := aAlinhamento;
end;

function TConfigureFields.Display(aKey, aValue, aFormato: String; aAlinhamento: TAlignment): IConfigureFields;
var
  I : Integer;
begin
  Result := Self.Display(aKey, aValue, aFormato);
  I := FNomesCampos.IndexOfName( LowerCase(aKey.Trim) );
  if (I > -1) then
    FAlinhamentos[I] := aAlinhamento;
end;

procedure TConfigureFields.Setup(aDataSet: TDataSet);
begin
  FDataSet := aDataSet;
  Setup;
end;

procedure TConfigureFields.Setup;
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

function TConfigureFields.Table(aDataSet: TDataSet): IConfigureFields;
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
  end;

  FNomesCampos.EndUpdate;
  FFormatos.EndUpdate;
end;

end.
