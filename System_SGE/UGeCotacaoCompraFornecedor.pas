unit UGeCotacaoCompraFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBUpdateSQL, rxToolEdit, RXDBCtrl, IBTable;

type
  TCotacaoFornecedorOpercao = (cfoInserir, cfoEditar, cfoVisualizar);
  TfrmGeCotacaoCompraFornecedor = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDescricaoResumo: TLabel;
    lblEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbDescricaoResumo: TDBEdit;
    dbEmissao: TDBEdit;
    lblValidade: TLabel;
    dbValidade: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    btnSalvar: TBitBtn;
    btFechar: TBitBtn;
    lblFornecedor: TLabel;
    dbFornecedor: TRxDBComboEdit;
    qryFornecedor: TIBDataSet;
    qryFornecedorANO: TSmallintField;
    qryFornecedorCODIGO: TIntegerField;
    qryFornecedorEMPRESA: TIBStringField;
    qryFornecedorFORNECEDOR: TIntegerField;
    qryFornecedorNOME_CONTATO: TIBStringField;
    qryFornecedorEMAIL_ENVIO: TIBStringField;
    qryFornecedorFORMA_PAGTO: TSmallintField;
    qryFornecedorCONDICAO_PAGTO: TSmallintField;
    qryFornecedorPRAZO_ENTREGA_DATA: TDateField;
    qryFornecedorPRAZO_ENTREDA_DIA: TSmallintField;
    qryFornecedorOBSERVACAO: TMemoField;
    qryFornecedorATIVO: TSmallintField;
    qryFornecedorUSUARIO: TIBStringField;
    qryFornecedorNOMEFORN: TIBStringField;
    qryFornecedorCNPJ: TIBStringField;
    qryFornecedorEMAIL: TIBStringField;
    qryFornecedorFORMA_PAGTO_DESC: TIBStringField;
    qryFornecedorCONDICAP_PAGTO_DESC: TIBStringField;
    updFornecedor: TIBUpdateSQL;
    dtsFornecedor: TDataSource;
    qryFornecedorDESCRICAO_RESUMO: TIBStringField;
    qryFornecedorEMISSAO_DATA: TDateField;
    qryFornecedorVALIDADE: TDateField;
    qryFornecedorNUMERO: TIBStringField;
    lblNomeContato: TLabel;
    dbNomeContato: TDBEdit;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    lblDataEntrega: TLabel;
    dbDataEntrega: TDBDateEdit;
    lblObservacoes: TLabel;
    dbObservacoes: TDBMemo;
    qryFornecedorDATA_RESPOSTA: TDateField;
    qryFornecedorVALOR_TOTAL_BRUTO: TIBBCDField;
    qryFornecedorVALOR_TOTAL_DESCONTO: TIBBCDField;
    qryFornecedorVALOR_TOTAL_LIQUIDO: TIBBCDField;
    qryFornecedorVENCEDOR: TSmallintField;
    procedure btFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure qryFornecedorNewRecord(DataSet: TDataSet);
    procedure dtsFornecedorStateChange(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryFornecedorBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FEmpresa : String;
    FAno       ,
    FCotacao   ,
    FFornecedor: Integer;
    FDescricao : String;
    FEmissao  ,
    FValidade : TDateTime;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function CotacaoFornecedor(const AOwer : TComponent; const TipoOperacao : TCotacaoFornecedorOpercao;
    Empresa : String; Ano : Smallint; Numero, Fornecedor : Integer;
    const Descricao : String; const Emissao, Validade : TDateTime) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes, UGeFornecedor, DateUtils;

{$R *.dfm}

function CotacaoFornecedor(const AOwer : TComponent; const TipoOperacao : TCotacaoFornecedorOpercao;
  Empresa : String; Ano : Smallint; Numero, Fornecedor : Integer;
  const Descricao : String; const Emissao, Validade : TDateTime) : Boolean;
var
  frm : TfrmGeCotacaoCompraFornecedor;
begin
  frm := TfrmGeCotacaoCompraFornecedor.Create(AOwer);
  try
    with frm, qryFornecedor do
    begin
      FEmpresa    := Empresa;
      FAno        := Ano;
      FCotacao    := Numero;
      FFornecedor := Fornecedor;
      FDescricao  := Descricao;
      FEmissao    := Emissao;
      FValidade   := Validade;

      qryFornecedor.Close;
      ParamByName('ano').AsShort   := Ano;
      ParamByName('cod').AsInteger := Numero;
      ParamByName('for').AsInteger := Fornecedor;
      qryFornecedor.Open;

      Case TipoOperacao of
        cfoInserir: Append;
        cfoEditar : Edit;
        cfoVisualizar : dtsFornecedor.AutoEdit := False;
      end;

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeCotacaoCompraFornecedor.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeCotacaoCompraFornecedor.btnSalvarClick(
  Sender: TObject);
var
  Cont : Boolean;
begin
  if ( qryFornecedor.IsEmpty ) then
    Exit;

  Cont := ShowConfirm('Confirma os dados inseridos referente ao fornecedor na cotação?');

  if ( Cont ) then
    with qryFornecedor do
      if ( State in [dsEdit, dsInsert] ) then
      begin
        if not GetEmailValido(Trim(dbEmail.Text), False) then
        begin
          ShowWarning('E-mail', 'O e-mail informado é inválido!');
          Abort;
        end;

        Post;
        ApplyUpdates;
        CommitTransaction;

        ModalResult := mrOk;
      end;
end;

procedure TfrmGeCotacaoCompraFornecedor.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeCotacaoCompraFornecedor.qryFornecedorNewRecord(
  DataSet: TDataSet);
begin
  qryFornecedorANO.Value     := FAno;
  qryFornecedorCODIGO.Value  := FCotacao;
  qryFornecedorEMPRESA.Value := FEmpresa;
  qryFornecedorFORNECEDOR.Value    := FFornecedor;
  qryFornecedorATIVO.Value         := 1;
  qryFornecedorUSUARIO.Value       := gUsuarioLogado.Login;
  qryFornecedorDATA_RESPOSTA.Value      := Date;
  qryFornecedorPRAZO_ENTREGA_DATA.Value := Date + GetPrazoValidadeCotacaoCompra(FEmpresa);
  qryFornecedorVENCEDOR.Value      := 0;

  qryFornecedorVALOR_TOTAL_BRUTO.Value    := 0.0;
  qryFornecedorVALOR_TOTAL_DESCONTO.Value := 0.0;
  qryFornecedorVALOR_TOTAL_LIQUIDO.Value  := 0.0;

  qryFornecedorNOMEFORN.Value     := GetFornecedorRazao(FFornecedor);
  qryFornecedorNOME_CONTATO.Value := GetFornecedorContato(FFornecedor);
  qryFornecedorEMAIL_ENVIO.Value  := GetFornecedorEmail(FFornecedor);

  qryFornecedorNUMERO.Value           := FormatFloat('##0000000', qryFornecedorCODIGO.Value) + '/' + Copy(qryFornecedorANO.AsString, 3, 2);
  qryFornecedorDESCRICAO_RESUMO.Value := FDescricao;
  qryFornecedorEMISSAO_DATA.Value     := FEmissao;
  qryFornecedorVALIDADE.Value         := FValidade;
end;

procedure TfrmGeCotacaoCompraFornecedor.dtsFornecedorStateChange(
  Sender: TObject);
begin
  dbFornecedor.Button.Enabled := (qryFornecedor.State = dsInsert);
end;

procedure TfrmGeCotacaoCompraFornecedor.dbFornecedorButtonClick(
  Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if ( qryFornecedor.State = dsInsert ) then
    if SelecionarFornecedor(Self, iCodigo, sNome) then
    begin
      FFornecedor := iCodigo;

      qryFornecedorFORNECEDOR.Value   := FFornecedor;
      qryFornecedorNOMEFORN.Value     := sNome;
      qryFornecedorNOME_CONTATO.Value := GetFornecedorContato(FFornecedor);
      qryFornecedorEMAIL_ENVIO.Value  := GetFornecedorEmail(FFornecedor);
    end;
end;

procedure TfrmGeCotacaoCompraFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
end;

procedure TfrmGeCotacaoCompraFornecedor.qryFornecedorBeforePost(
  DataSet: TDataSet);
begin
  qryFornecedorEMAIL.Value             := Trim(qryFornecedorEMAIL.Value);
  qryFornecedorPRAZO_ENTREDA_DIA.Value := DaysBetween(qryFornecedorPRAZO_ENTREGA_DATA.Value, qryFornecedorDATA_RESPOSTA.Value);
  qryFornecedorUSUARIO.Value           := gUsuarioLogado.Login;
end;

end.
