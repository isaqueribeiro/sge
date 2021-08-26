unit SGE.Model.DAO.CondicaoPagto;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOCondicaoPagto = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet : TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Table Detail
  TModelDAOCondicaoPagtoForma = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // View
  TModelDAOCondicaoPagtoView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

uses
  UConstantesDGE;

{ TModelDAOCondicaoPagto }

constructor TModelDAOCondicaoPagto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCONDICAOPAGTO')
      .KeyFields('Cond_cod')
      .AutoIncFields('Cond_cod')
      .GeneratorName('GEN_CONDICAOPAGTO_COD')
      .SQL
        .Clear
        .Add('Select')
        .Add('    c.Cond_cod          ')
        .Add('  , c.Cond_descricao    ')
        .Add('  , c.Cond_prazo        ')
        .Add('  , c.Cond_pdv          ')
        .Add('  , c.Cond_qtde_parcelas')
        .Add('  , c.Cond_prazo_01     ')
        .Add('  , c.Cond_prazo_02     ')
        .Add('  , c.Cond_prazo_03     ')
        .Add('  , c.Cond_prazo_04     ')
        .Add('  , c.Cond_prazo_05     ')
        .Add('  , c.Cond_prazo_06     ')
        .Add('  , c.Cond_prazo_07     ')
        .Add('  , c.Cond_prazo_08     ')
        .Add('  , c.Cond_prazo_09     ')
        .Add('  , c.Cond_prazo_10     ')
        .Add('  , c.Cond_prazo_11     ')
        .Add('  , c.Cond_prazo_12     ')
        .Add('  , c.Ativa             ')
        .Add('  , c.Cond_descricao || '' ['' || ')
        .Add('      case when c.Cond_prazo_01 is not Null then c.Cond_prazo_01 else '''' end ||                 ')
        .Add('      case when c.Cond_prazo_02 is not Null then '', '' || c.Cond_prazo_02 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_03 is not Null then '', '' || c.Cond_prazo_03 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_04 is not Null then '', '' || c.Cond_prazo_04 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_05 is not Null then '', '' || c.Cond_prazo_05 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_06 is not Null then '', '' || c.Cond_prazo_06 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_07 is not Null then '', '' || c.Cond_prazo_07 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_08 is not Null then '', '' || c.Cond_prazo_08 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_09 is not Null then '', '' || c.Cond_prazo_09 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_10 is not Null then '', '' || c.Cond_prazo_10 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_11 is not Null then '', '' || c.Cond_prazo_11 else '''' end ||       ')
        .Add('      case when c.Cond_prazo_12 is not Null then '', '' || c.Cond_prazo_12 else '''' end || '']'' ')
        .Add('    as Cond_descricao_full')
        .Add('  , Case when c.Cond_prazo = 1 then ''X'' else ''.'' end as Aprazo')
        .Add('from TBCONDICAOPAGTO c    ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOCondicaoPagto.Destroy;
begin
  inherited;
end;

class function TModelDAOCondicaoPagto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCondicaoPagto.SetProviderFlags;
begin
  // Configurar campos para a geração de Insert e Update
  FConn.Query.DataSet.FieldByName('Cond_descricao_full').ProviderFlags := [];
end;

function TModelDAOCondicaoPagto.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
end;

procedure TModelDAOCondicaoPagto.DataSetBeforePost(DataSet: TDataSet);
var
  I     ,
  iQtde : Integer;
  sCmp  ,
  Str   : String;
begin
  SetProviderFlags;
  iQtde := 0;

  // limpar campos de prazos vazios
  with FConn.Query.DataSet do
  begin
    for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
    begin
      sCmp := 'COND_PRAZO_' + FormatFloat('00', I);
      if Fields.FindField(sCmp) <> nil then
        if Trim(FieldByName(sCmp).AsString) = EmptyStr then
          FieldByName(sCmp).Clear;
    end;

    if ( FieldByName('COND_PRAZO').AsInteger = 0 ) then
      Str := Trim(FieldByName('COND_DESCRICAO').AsString)
    else
    begin
      Str := Trim(FieldByName('COND_DESCRICAO').AsString) + ' [';

      if ( not FieldByName('COND_PRAZO_01').IsNull ) then
      begin
        Str   := Str + FieldByName('COND_PRAZO_01').AsString;
        iQtde := 1;
      end;

      if ( not FieldByName('COND_PRAZO_02').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_02').AsString;
        iQtde := 2;
      end;

      if ( not FieldByName('COND_PRAZO_03').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_03').AsString;
        iQtde := 3;
      end;

      if ( not FieldByName('COND_PRAZO_04').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_04').AsString;
        iQtde := 4;
      end;

      if ( not FieldByName('COND_PRAZO_05').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_05').AsString;
        iQtde := 5;
      end;

      if ( not FieldByName('COND_PRAZO_06').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_06').AsString;
        iQtde := 6;
      end;

      if ( not FieldByName('COND_PRAZO_07').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_07').AsString;
        iQtde := 7;
      end;

      if ( not FieldByName('COND_PRAZO_08').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_08').AsString;
        iQtde := 8;
      end;

      if ( not FieldByName('COND_PRAZO_09').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_09').AsString;
        iQtde := 9;
      end;

      if ( not FieldByName('COND_PRAZO_10').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_10').AsString;
        iQtde := 10;
      end;

      if ( not FieldByName('COND_PRAZO_11').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_11').AsString;
        iQtde := 11;
      end;

      if ( not FieldByName('COND_PRAZO_12').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_12').AsString;
        iQtde := 12;
      end;

      Str := Str + ']';
    end;

    FieldByName('COND_QTDE_PARCELAS').AsInteger := iQtde;
    FieldByName('COND_DESCRICAO_FULL').AsString := Str;
  end;
end;

procedure TModelDAOCondicaoPagto.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('COND_PRAZO').AsInteger := 0;
    FieldByName('COND_PDV').AsInteger   := 0;
    FieldByName('ATIVA').AsInteger      := FLAG_SIM;
    FieldByName('COND_QTDE_PARCELAS').AsInteger := 0;
    FieldByName('COND_PRAZO_01').Clear;
    FieldByName('COND_PRAZO_02').Clear;
    FieldByName('COND_PRAZO_03').Clear;
    FieldByName('COND_PRAZO_04').Clear;
    FieldByName('COND_PRAZO_05').Clear;
    FieldByName('COND_PRAZO_06').Clear;
    FieldByName('COND_PRAZO_07').Clear;
    FieldByName('COND_PRAZO_08').Clear;
    FieldByName('COND_PRAZO_09').Clear;
    FieldByName('COND_PRAZO_10').Clear;
    FieldByName('COND_PRAZO_11').Clear;
    FieldByName('COND_PRAZO_12').Clear;
  end;
end;

{ TModelDAOCondicaoPagtoForma }

constructor TModelDAOCondicaoPagtoForma.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBFORMPAGTO_CONTACOR')
      .KeyFields('forma_pagto;conta_corrente')
      .SQL
        .Clear
        .Add('Select')
        .Add('    cast(:condicao_pagto as Integer) as condicao_pagto')
        .Add('  , f.cod                            as forma_pagto   ')
        .Add('  , coalesce(c.selecionar, 0)        as selecionar    ')
        .Add('  , f.cod    as codigo                                ')
        .Add('  , f.descri as descricao                             ')
        .Add('  , Case when f.formapagto_pdv = 1 then ''X'' else ''.'' end pdv ')
        .Add('from TBFORMPAGTO f ')
        .Add('  left join TBFORMPAGTO_CONDICAO c on (c.forma_pagto = f.cod and c.condicao_pagto = :condicao_pagto) ')
        .Add('order by  ')
        .Add('    f.cod ')
      .&End
      .ParamByName('condicao_pagto', 0)
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

procedure TModelDAOCondicaoPagtoForma.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

destructor TModelDAOCondicaoPagtoForma.Destroy;
begin
  inherited;
end;

class function TModelDAOCondicaoPagtoForma.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCondicaoPagtoForma.SetProviderFlags;
var
  I : Integer;
begin
  // Ignorar campos no Insert e Update
  for I := 0 to Pred(FConn.Query.DataSet.Fields.Count) do
  begin
    FConn.Query.DataSet.Fields[I].ReadOnly      := False; // Liberar edição dos campos
    FConn.Query.DataSet.Fields[I].ProviderFlags := [];
  end;

  // Configurar campos para a geração de Insert e Update
  FConn.Query.DataSet.FieldByName('condicao_pagto').ProviderFlags := [pfInUpdate, pfInWhere, pfInKey];
  FConn.Query.DataSet.FieldByName('forma_pagto').ProviderFlags    := [pfInUpdate, pfInWhere, pfInKey];
  FConn.Query.DataSet.FieldByName('selecionar').ProviderFlags     := [pfInUpdate];
end;

{ TModelDAOCondicaoPagtoView }

constructor TModelDAOCondicaoPagtoView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('   cond_cod      ')
        .Add(' , cond_descricao')
        .Add(' , cond_prazo    ')
        .Add(' , cond_qtde_parcelas ')
        .Add(' , cond_prazo_01      ')
        .Add(' , cond_prazo_02      ')
        .Add(' , cond_prazo_03      ')
        .Add(' , cond_prazo_04      ')
        .Add(' , cond_prazo_05      ')
        .Add(' , cond_prazo_06      ')
        .Add(' , cond_prazo_07      ')
        .Add(' , cond_prazo_08      ')
        .Add(' , cond_prazo_09      ')
        .Add(' , cond_prazo_10      ')
        .Add(' , cond_prazo_11      ')
        .Add(' , cond_prazo_12      ')
        .Add(' , cond_descricao_full')
        .Add(' , cond_descricao_pdv ')
        .Add(' , cond_pdv           ')
        .Add(' , ativa              ')
        .Add('from VW_CONDICAOPAGTO ')
      .&End
    .Open;

  FConn.Query.DataSet.Filter := '(ativa = 1)';
end;

destructor TModelDAOCondicaoPagtoView.Destroy;
begin
  inherited;
end;

class function TModelDAOCondicaoPagtoView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOCondicaoPagtoView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

end.

