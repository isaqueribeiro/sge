unit SGE.Model.DAO.XML_NFeImportada;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // XML das Notas Fiscais Eletrônicas importadas
  TModelDAOXML_NFeImportada = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure HoraGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

  // Pesquisa de Notas Fiscais Eletrônicas importadas
  TModelDAONFeImportada = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetDestinatarioCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

{ TModelDAOXML_NFeImportada }

uses
  UConstantesDGE,
  Service.Utils;

constructor TModelDAOXML_NFeImportada.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBNFE_IMPORTADA')
      .AliasTableName('n')
      .KeyFields('empresa;nsu')
      .SQL
        .Clear
        .Add(' Select')
        .Add('    n.empresa')
        .Add('  , n.nsu    ')
        .Add('  , n.emissor_cnpj  ')
        .Add('  , n.emissor_codigo')
        .Add('  , n.serie    ')
        .Add('  , n.numero   ')
        .Add('  , n.emissao  ')
        .Add('  , n.valor    ')
        .Add('  , n.protocolo')
        .Add('  , n.chave    ')
        .Add('  , n.xml_filename')
        .Add('  , n.xml_file    ')
        .Add('  , n.usuario     ')
        .Add('  , n.datahora_importacao')
        .Add('  , c.ano        as compra_ano')
        .Add('  , c.codcontrol as compra_num')
        .Add('from TBNFE_IMPORTADA n        ')
        .Add('  left join TBCOMPRAS c on (c.codemp = n.empresa and c.nfnsu = n.nsu)')
      .&End
      .Where('n.chave = :chave')
      .WhereOr('(n.empresa = :empresa) and (n.nsu = :nsu)')
      .ParamByName('chave',   EmptyStr)
      .ParamByName('empresa', EmptyStr)
      .ParamByName('nsu',     0)
    .Open;

  FConn.Query.DataSet.AfterOpen    := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord  := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost   := DataSetBeforePost;
end;

destructor TModelDAOXML_NFeImportada.Destroy;
begin
  inherited;
end;

procedure TModelDAOXML_NFeImportada.HoraGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := EmptyStr
  else
    Text := FormatDateTime('hh:nn', Sender.AsDateTime);
end;

class function TModelDAOXML_NFeImportada.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOXML_NFeImportada.SetProviderFlags;
begin
  ;
end;

procedure TModelDAOXML_NFeImportada.DataGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := EmptyStr
  else
    Text := FormatDateTime('dd/mm/yyyy', Sender.AsDateTime);
end;

procedure TModelDAOXML_NFeImportada.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('datahora_importacao').OnGetText := DataGetText;
  FConn.Query.DataSet.FieldByName('datahora_importacao').OnGetText := HoraGetText;
end;

procedure TModelDAOXML_NFeImportada.DataSetBeforePost(DataSet: TDataSet);
begin
  ;
end;

procedure TModelDAOXML_NFeImportada.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('empresa').Clear;
    FieldByName('nsu').Clear;
    FieldByName('emissor_cnpj').Clear;
    FieldByName('emissor_codigo').Clear;
//    FieldByName('versao').Clear;
//    FieldByName('anovenda').Clear;
//    FieldByName('numvenda').Clear;
//    FieldByName('anocompra').Clear;
//    FieldByName('numcompra').Clear;
//    FieldByName('nfc_numero').Clear;
//    FieldByName('dataemissao').Clear;
//    FieldByName('horaemissao').Clear;
//    FieldByName('chave').Clear;
//    FieldByName('protocolo').Clear;
//    FieldByName('recibo').Clear;
//    FieldByName('xml_filename').Clear;
//    FieldByName('xml_file').Clear;
//    FieldByName('lote_ano').Clear;
//    FieldByName('lote_num').Clear;
//    FieldByName('cancelada').AsInteger := FLAG_NAO;
  end;
end;

{ TModelDAONFeImportada }

constructor TModelDAONFeImportada.Create;
begin
//  inherited Create;
//  FConn
//    .Query
//      .TableName('TBNFE_ENVIADA')
//      .AliasTableName('n')
//      .KeyFields('empresa;serie;numero;modelo')
//      .SQL
//        .Clear
//        .Add('Select')
//        .Add('    coalesce(lpad(nf.numero, 7, ''0'') || ''-'' || nf.serie, '''') as nfe_destinatario')
//        .Add('  , coalesce(cl.codigo, fn.codforn) as nfe_destinatario_codigo      ')
//        .Add('  , coalesce(cl.nome, fn.nomeforn)  as nfe_destinatario_razao       ')
//        .Add('  , coalesce(cl.cnpj, fn.cnpj) as nfe_destinatario_cnpj             ')
//        .Add('  , coalesce(cl.inscest, fn.inscest) as nfe_destinatario_inscest    ')
//        .Add('  , coalesce(cl.uf, fn.uf) as nfe_destinatario_uf                   ')
//        .Add('  , coalesce(vn.nfe_valor_total_nota, cp.totalnf) as nfe_valor_total')
//        .Add('  , nf.empresa       ')
//        .Add('  , nf.serie         ')
//        .Add('  , nf.numero        ')
//        .Add('  , nf.modelo        ')
//        .Add('  , nf.dataemissao   ')
//        .Add('  , nf.horaemissao   ')
//        .Add('  , nf.versao        ')
//        .Add('  , nf.recibo        ')
//        .Add('  , nf.protocolo     ')
//        .Add('  , nf.chave         ')
//        .Add('  , nf.anovenda      ')
//        .Add('  , nf.numvenda      ')
//        .Add('  , nf.anocompra     ')
//        .Add('  , nf.numcompra     ')
//        .Add('  , nf.xml_filename  ')
//        .Add('  , nf.xml_file      ')
//        .Add('  , nf.cancelada     ')
//        .Add('from TBNFE_ENVIADA nf')
//        .Add('  left join TBVENDAS vn on (vn.ano = nf.anovenda and vn.codcontrol = nf.numvenda) ')
//        .Add('  left join TBCLIENTE cl on (cl.codigo = vn.codcliente) ')
//        .Add('  left join TBCOMPRAS cp on (cp.ano = nf.anocompra and cp.codcontrol = nf.numcompra) ')
//        .Add('  left join TBFORNECEDOR fn on (fn.codforn = cp.codforn) ')
//      .&End
//    .OpenEmpty
//    .CloseEmpty;
//
  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAONFeImportada.Destroy;
begin
  inherited;
end;

class function TModelDAONFeImportada.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAONFeImportada.DataSetDestinatarioCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if TServicesUtils.StrIsCNPJ(Sender.AsString) then
      Text := TServicesUtils.StrFormatarCnpj(Sender.AsString)
    else
    if TServicesUtils.StrIsCPF(Sender.AsString) then
      Text := TServicesUtils.StrFormatarCpf(Sender.AsString);
end;

procedure TModelDAONFeImportada.DataSetAfterOpen(DataSet: TDataSet);
begin
  FConn.Query.DataSet.FieldByName('nfe_destinatario_cnpj').OnGetText := DataSetDestinatarioCNPJGetText;
end;

end.
