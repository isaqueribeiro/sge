unit UGeEntradaEstoqueDevolucaoNF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, cxButtons, Data.DB,  JvExMask, JvToolEdit, JvDBControls, DBClient,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeEntradaEstoqueDevolucaoNF = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    Bevel1: TBevel;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    dtsCompra: TDataSource;
    lblEntrada: TLabel;
    dbEntrada: TJvDBComboEdit;
    dtsFormaDevolucao: TDataSource;
    dbFormaDevolucao: TDBLookupComboBox;
    lblFormaDevolucao: TLabel;
    GrpBxDados: TGroupBox;
    lblNFeChave: TLabel;
    dbNFeChave: TDBEdit;
    lblNFSerie: TLabel;
    dbNFSerie: TDBEdit;
    lblNF: TLabel;
    lblNFNumero: TLabel;
    dbNFNumero: TDBEdit;
    lblNFModelo: TLabel;
    dbNFModelo: TDBEdit;
    lblNFe: TLabel;
    dtsUF: TDataSource;
    lblNFUF: TLabel;
    dbNFUF: TDBLookupComboBox;
    dtsCompetencia: TDataSource;
    lblNFCompetencia: TLabel;
    dbNFCompetencia: TDBLookupComboBox;
    lblNFCnpjCpf: TLabel;
    dbNFCnpjCpf: TDBEdit;
    lblCupomFiscal: TLabel;
    lblCPModelo: TLabel;
    dbCPModelo: TDBLookupComboBox;
    lblCPNumeroECF: TLabel;
    dbCPNumeroECF: TDBEdit;
    lblCPNumeroCOO: TLabel;
    dbCPNumeroCOO: TDBEdit;
    lblNFIE: TLabel;
    dbNFIE: TDBEdit;
    dtsModeloCupom: TDataSource;
    fdQryFormaDevolucao: TFDQuery;
    fdQryUF: TFDQuery;
    fdQryCompetencia: TFDQuery;
    fdQryModeloCupom: TFDQuery;
    cdsCompra: TFDQuery;
    updCompra: TFDUpdateSQL;
    cdsCompraANO: TSmallintField;
    cdsCompraCODCONTROL: TIntegerField;
    cdsCompraCODEMP: TStringField;
    cdsCompraDNFE_ENTRADA_ANO: TSmallintField;
    cdsCompraDNFE_ENTRADA_COD: TIntegerField;
    cdsCompraDNFE_SAIDA_ANO: TSmallintField;
    cdsCompraDNFE_SAIDA_COD: TIntegerField;
    cdsCompraDNFE_FORMA: TSmallintField;
    cdsCompraDNFE_CHAVE: TStringField;
    cdsCompraDNFE_UF: TStringField;
    cdsCompraDNFE_CNPJ_CPF: TStringField;
    cdsCompraDNFE_IE: TStringField;
    cdsCompraDNFE_COMPETENCIA: TStringField;
    cdsCompraDNFE_SERIE: TStringField;
    cdsCompraDNFE_NUMERO: TIntegerField;
    cdsCompraDNFE_MODELO: TSmallintField;
    cdsCompraDECF_MODELO: TSmallintField;
    cdsCompraDECF_NUMERO: TIntegerField;
    cdsCompraDECF_COO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure cdsCompraCODCONTROLGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dtsCompraDataChange(Sender: TObject; Field: TField);
    procedure btFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbEntradaButtonClick(Sender: TObject);
    procedure cdsCompraDNFE_ENTRADA_CODGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsCompraDNFE_SAIDA_CODGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function InformarDocumentoReferenciado(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

(*
  Tabelas:
  - TBCOMPRAS
  - TBESTADO
  - TBCOMPETENCIA

  Views:
  - VW_FORMA_DEVOLUCAO
  - VW_MODELO_CUPOM_FISCAL

  Procedures:

*)

implementation

uses
  UDMBusiness, UDMRecursos, UDMNFe, UFuncoes, UGrCampoRequisitado, UGeNFEmitida, UConstantesDGE;

{$R *.dfm}

function InformarDocumentoReferenciado(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  AForm : TfrmGeEntradaEstoqueDevolucaoNF;
begin
  AForm := TfrmGeEntradaEstoqueDevolucaoNF.Create(AOwer);
  try
    with AForm do
    begin
      cdsCompra.Close;
      cdsCompra.ParamByName('anocompra').AsInteger := Ano;
      cdsCompra.ParamByName('numcompra').AsInteger := Numero;
      cdsCompra.Open;

      if cdsCompraDNFE_ENTRADA_COD.AsInteger > 0 then
        dbEntrada.DataField := cdsCompraDNFE_ENTRADA_COD.FieldName
      else
      if cdsCompraDNFE_SAIDA_COD.AsInteger > 0 then
        dbEntrada.DataField := cdsCompraDNFE_SAIDA_COD.FieldName;

      if not cdsCompra.IsEmpty then
      begin
        cdsCompra.Edit;
        if cdsCompraDNFE_FORMA.IsNull then
          cdsCompraDNFE_FORMA.AsInteger := Ord(fdNFeEletronica);
      end;

      Result := (ShowModal = mrOk);
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeEntradaEstoqueDevolucaoNF.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeEntradaEstoqueDevolucaoNF.btnConfirmarClick(Sender: TObject);
begin
  cdsCompraDNFE_CHAVE.Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeEletronica]);

  cdsCompraDNFE_SERIE.Required  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  cdsCompraDNFE_NUMERO.Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  cdsCompraDNFE_MODELO.Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  cdsCompraDNFE_UF.Required     := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  cdsCompraDNFE_COMPETENCIA.Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  cdsCompraDNFE_CNPJ_CPF.Required    := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  cdsCompraDNFE_IE.Required          := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFProdutorRural]);

  cdsCompraDECF_MODELO.Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
  cdsCompraDECF_NUMERO.Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
  cdsCompraDECF_COO.Required    := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);

  if not CamposRequiridos(Self, TClientDataSet(dtsCompra.DataSet), GrpBxDados.Caption) then
    if ShowConfirmation('Confirmar', 'Confirma os dados do documento referenciado para devolu��o?') then
      with cdsCompra do
      begin
        Post;
        ApplyUpdates;
        CommitUpdates;

        CommitTransaction;

        ModalResult := mrOk;
      end;
end;

procedure TfrmGeEntradaEstoqueDevolucaoNF.cdsCompraCODCONTROLGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := cdsCompraANO.AsString + '/' + FormatFloat('0000000', Sender.AsInteger);
end;

procedure TfrmGeEntradaEstoqueDevolucaoNF.cdsCompraDNFE_ENTRADA_CODGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := Sender.DataSet.FieldByName('DNFE_ENTRADA_ANO').AsString + '/' +
      FormatFloat('0000000', Sender.AsInteger);
end;

procedure TfrmGeEntradaEstoqueDevolucaoNF.cdsCompraDNFE_SAIDA_CODGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := Sender.DataSet.FieldByName('DNFE_SAIDA_ANO').AsString + '/' +
      FormatFloat('0000000', Sender.AsInteger);
end;

procedure TfrmGeEntradaEstoqueDevolucaoNF.dbEntradaButtonClick(Sender: TObject);
var
  iAno      ,
  iControle : Integer;
  sEmpresa,
  sSerie  ,
  sChave  : String;
  dEmissao  : TDateTime;
  iNumero   ,
  iModelo   : Integer;
  fDestinatario : TDestinatarioNF;
begin
  iAno      := 0;
  iControle := 0;
  sEmpresa  := cdsCompraCODEMP.AsString;
  if ( cdsCompra.State = dsEdit ) then
    if SelecionarNFe(Self, sEmpresa, sSerie, sChave, iNumero, iModelo, dEmissao, fDestinatario, iAno, iControle) then
    begin
      if (fDestinatario.Tipo = dtFornecedor) then
      begin
        cdsCompraDNFE_ENTRADA_ANO.AsInteger := iAno;
        cdsCompraDNFE_ENTRADA_COD.AsInteger := iControle;
      end
      else
      begin
        cdsCompraDNFE_ENTRADA_ANO.Clear;
        cdsCompraDNFE_ENTRADA_COD.Clear;
      end;

      if (fDestinatario.Tipo = dtCliente) then
      begin
        cdsCompraDNFE_SAIDA_ANO.AsInteger := iAno;
        cdsCompraDNFE_SAIDA_COD.AsInteger := iControle;
      end
      else
      begin
        cdsCompraDNFE_SAIDA_ANO.Clear;
        cdsCompraDNFE_SAIDA_COD.Clear;
      end;

      cdsCompraDNFE_COMPETENCIA.AsString  := FormatDateTime('yymm', dEmissao);
      cdsCompraDNFE_SERIE.AsString    := sSerie;
      cdsCompraDNFE_NUMERO.AsInteger  := iNumero;
      cdsCompraDNFE_CHAVE.AsString    := sChave;
      cdsCompraDNFE_UF.AsString       := fDestinatario.UF;
      cdsCompraDNFE_CNPJ_CPF.AsString := fDestinatario.CpfCnpj;
      cdsCompraDNFE_IE.AsString       := fDestinatario.InsEstadual;
    end;
end;

procedure TfrmGeEntradaEstoqueDevolucaoNF.dtsCompraDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = dbFormaDevolucao.Field ) then
  begin
    // T�tulos principais
    lblNFe.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeEletronica]);
    lblNF.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    lblCupomFiscal.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);

    if TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) = fdNFProdutorRural then
      lblNF.Caption := 'Nota Fiscal do Produtor Rural:'
    else
      lblNF.Caption := 'Nota Fiscal Modelo 1/1A:';

    // Campos
    lblNFeChave.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeEletronica]);
    dbNFeChave.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeEletronica]);

    lblNFSerie.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    dbNFSerie.Enabled   := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    lblNFNumero.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    dbNFNumero.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    lblNFUF.Enabled     := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    dbNFUF.Enabled      := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    lblNFCompetencia.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    dbNFCompetencia.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    lblNFCnpjCpf.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    dbNFCnpjCpf.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
    lblNFIE.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFProdutorRural]);
    dbNFIE.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFProdutorRural]);

    lblCPModelo.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
    dbCPModelo.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
    lblCPNumeroECF.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
    dbCPNumeroECF.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
    lblCPNumeroCOO.Enabled := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
    dbCPNumeroCOO.Enabled  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);

    // Definir modelo de Nota Fiscal
    if ( cdsCompra.State = dsEdit ) then
      Case TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) of
        fdNFeModelo1_1A  : dbNFModelo.Field.AsInteger := 1;
        fdNFProdutorRural: dbNFModelo.Field.AsInteger := 4;
        else
          dbNFModelo.Field.Clear;
      end;

  end
  else
  if ( (Field = cdsCompraDNFE_ENTRADA_COD) or (Field = cdsCompraDNFE_SAIDA_COD) ) then
  begin
    if cdsCompraDNFE_ENTRADA_COD.AsInteger > 0 then
      dbEntrada.DataField := cdsCompraDNFE_ENTRADA_COD.FieldName
    else
    if cdsCompraDNFE_SAIDA_COD.AsInteger > 0 then
      dbEntrada.DataField := cdsCompraDNFE_SAIDA_COD.FieldName;
  end;
end;

procedure TfrmGeEntradaEstoqueDevolucaoNF.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarListaDB(fdQryFormaDevolucao);
  CarregarListaDB(fdQryUF);
  CarregarListaDB(fdQryCompetencia);
  CarregarListaDB(fdQryModeloCupom);
end;

procedure TfrmGeEntradaEstoqueDevolucaoNF.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeEntradaEstoqueDevolucaoNF', TfrmGeEntradaEstoqueDevolucaoNF);

end.
