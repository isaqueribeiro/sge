unit SGE.Model.DAO.XML_NFeEnviada;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // XML das Notas Fiscais Eletrônicas enviadas (Compras/Vendas)
  TModelDAOXML_NFeEnviada = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

{ TModelDAOXML_NFeEnviada }

uses
  UConstantesDGE;

constructor TModelDAOXML_NFeEnviada.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBNFE_ENVIADA')
      .AliasTableName('n')
      .KeyFields('empresa;serie;numero;modelo')
      .SQL
        .Clear
        .Add('Select              ')
        .Add('  n.empresa,        ')
        .Add('  n.serie,          ')
        .Add('  n.numero,         ')
        .Add('  n.modelo,         ')
        .Add('  n.versao,         ')
        .Add('  n.anovenda,       ')
        .Add('  n.numvenda,       ')
        .Add('  n.anocompra,      ')
        .Add('  n.numcompra,      ')
        .Add('  n.nfc_numero,     ')
        .Add('  n.dataemissao,    ')
        .Add('  n.horaemissao,    ')
        .Add('  n.chave,          ')
        .Add('  n.protocolo,      ')
        .Add('  n.recibo,         ')
        .Add('  n.xml_filename,   ')
        //.Add('  n.xml_file,       ')
        .Add('  n.lote_ano,       ')
        .Add('  n.lote_num,       ')
        .Add('  n.cancelada       ')
        .Add('from TBNFE_ENVIADA n')
      .&End
      .Where('n.empresa = :empresa')
      .Where('n.serie   = :serie')
      .Where('n.numero  = :numero')
      .Where('n.modelo  = :modelo')
      .ParamByName('empresa', EmptyStr)
      .ParamByName('serie',   EmptyStr)
      .ParamByName('numero',  0)
      .ParamByName('modelo',  0)
    .Open;

  FConn.Query.DataSet.AfterOpen    := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord  := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost   := DataSetBeforePost;
end;

destructor TModelDAOXML_NFeEnviada.Destroy;
begin
  inherited;
end;

class function TModelDAOXML_NFeEnviada.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOXML_NFeEnviada.SetProviderFlags;
begin
  ;
end;

procedure TModelDAOXML_NFeEnviada.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOXML_NFeEnviada.DataSetBeforePost(DataSet: TDataSet);
begin
  ;
end;

procedure TModelDAOXML_NFeEnviada.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('empresa').Clear;
    FieldByName('serie').Clear;
    FieldByName('numero').Clear;
    FieldByName('modelo').Clear;
    FieldByName('versao').Clear;
    FieldByName('anovenda').Clear;
    FieldByName('numvenda').Clear;
    FieldByName('anocompra').Clear;
    FieldByName('numcompra').Clear;
    FieldByName('nfc_numero').Clear;
    FieldByName('dataemissao').Clear;
    FieldByName('horaemissao').Clear;
    FieldByName('chave').Clear;
    FieldByName('protocolo').Clear;
    FieldByName('recibo').Clear;
    FieldByName('xml_filename').Clear;
    //FieldByName('xml_file').Clear;
    FieldByName('lote_ano').Clear;
    FieldByName('lote_num').Clear;
    FieldByName('cancelada').AsInteger := FLAG_NAO;
  end;
end;

end.
