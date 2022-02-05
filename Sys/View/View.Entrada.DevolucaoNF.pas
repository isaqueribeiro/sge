unit View.Entrada.DevolucaoNF;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  UGrPadrao,
  SGE.Controller.Interfaces, dxSkinsDefaultPainters;

type
  TViewEntradaDevolucaoNF = class(TfrmGrPadrao)
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
    procedure FormCreate(Sender: TObject);
    procedure dtsCompraDataChange(Sender: TObject; Field: TField);
    procedure btFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbEntradaButtonClick(Sender: TObject);
  private
    { Private declarations }
    FAno,
    FControle : Integer;
    FEmpresa  : String;

    procedure CarregarEntrada;
  public
    { Public declarations }
    FControllerFormaDevolucaoView,
    FControllerEstado      ,
    FControllerCompetencia ,
    FControllerModeloCupomFiscal,
    FControllerEntradaDevolucao : IControllerCustom;
    procedure RegistrarRotinaSistema; override;
  end;

  function InformarDocumentoReferenciado(const AOwer : TComponent; Ano : Smallint; Numero : Integer; Empresa : String) : Boolean;

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
  SYstem.DateUtils,
  UConstantesDGE,
  UFuncoes,
  UDMRecursos,
  Controller.Tabela,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  Service.Message,
  View.NFE.Pesquisa,
  View.CampoRequisitado;

{$R *.dfm}

function InformarDocumentoReferenciado(const AOwer : TComponent; Ano : Smallint; Numero : Integer; Empresa : String) : Boolean;
var
  AForm : TViewEntradaDevolucaoNF;
begin
  AForm := TViewEntradaDevolucaoNF.Create(AOwer);
  try
    with AForm do
    begin
      FAno      := Ano;
      FControle := Numero;
      FEmpresa  := Empresa.Trim;

      CarregarEntrada;

      if dtsCompra.DataSet.FieldByName('DNFE_ENTRADA_COD').AsInteger > 0 then
        dbEntrada.DataField := dtsCompra.DataSet.FieldByName('DNFE_ENTRADA_COD').FieldName
      else
      if dtsCompra.DataSet.FieldByName('DNFE_SAIDA_COD').AsInteger > 0 then
        dbEntrada.DataField := dtsCompra.DataSet.FieldByName('DNFE_SAIDA_COD').FieldName;

      if not dtsCompra.DataSet.IsEmpty then
      begin
        dtsCompra.DataSet.Edit;
        if dtsCompra.DataSet.FieldByName('DNFE_FORMA').IsNull then
          dtsCompra.DataSet.FieldByName('DNFE_FORMA').AsInteger := Ord(TFormaNFDevolucao.fdNFeEletronica);
      end;

      Result := (ShowModal = mrOk);
    end;
  finally
    AForm.Free;
  end;
end;

procedure TViewEntradaDevolucaoNF.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewEntradaDevolucaoNF.btnConfirmarClick(Sender: TObject);
begin
  dtsCompra.DataSet.FieldByName('DNFE_CHAVE').Required  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeEletronica]);

  dtsCompra.DataSet.FieldByName('DNFE_SERIE').Required  := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  dtsCompra.DataSet.FieldByName('DNFE_NUMERO').Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  dtsCompra.DataSet.FieldByName('DNFE_MODELO').Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  dtsCompra.DataSet.FieldByName('DNFE_UF').Required     := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  dtsCompra.DataSet.FieldByName('DNFE_COMPETENCIA').Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  dtsCompra.DataSet.FieldByName('DNFE_CNPJ_CPF').Required    := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFeModelo1_1A, fdNFProdutorRural]);
  dtsCompra.DataSet.FieldByName('DNFE_IE').Required          := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdNFProdutorRural]);

  dtsCompra.DataSet.FieldByName('DECF_MODELO').Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
  dtsCompra.DataSet.FieldByName('DECF_NUMERO').Required := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);
  dtsCompra.DataSet.FieldByName('DECF_COO').Required    := (TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) in [fdCupomFiscal]);

  if not CamposRequiridos(Self, TClientDataSet(dtsCompra.DataSet), GrpBxDados.Caption) then
    if TServiceMessage.ShowConfirmation('Confirmar', 'Confirma os dados do documento referenciado para devolução?') then
    begin
      dtsCompra.DataSet.Post;

      FControllerEntradaDevolucao.DAO.ApplyUpdates;
      FControllerEntradaDevolucao.DAO.CommitUpdates;
      FControllerEntradaDevolucao.DAO.CommitTransaction;

      ModalResult := mrOk;
    end;
end;

procedure TViewEntradaDevolucaoNF.CarregarEntrada;
begin
  if not Assigned(FControllerEntradaDevolucao) then
    FControllerEntradaDevolucao := TControllerFactory.New.EntradaDevolucao;

  dtsCompra.DataSet := FControllerEntradaDevolucao.DAO.DataSet;

  FControllerEntradaDevolucao
    .DAO
    .Close
    .ParamsByName('ano',      FAno)
    .ParamsByName('controle', FControle)
    .ParamsByName('empresa',  FEmpresa)
    .Open;

  // Configurar tabela dos lotes
  TTabelaController
    .New
    .Tabela(dtsCompra.DataSet)
    .Display('DNFE_CHAVE',  'Chave de acesso')
    .Display('DNFE_SERIE',  'Série')
    .Display('DNFE_NUMERO', 'Número')
    .Display('DNFE_MODELO', 'Modelo')
    .Display('DNFE_UF',     'UF')
    .Display('DNFE_COMPETENCIA', 'Competência')
    .Display('DNFE_CNPJ_CPF',    'CPF/CNPJ')
    .Display('DNFE_IE',          'Inscrição Estadual')
    .Display('DECF_MODELO', 'Modelo do Cupom Fiscal')
    .Display('DECF_NUMERO', 'Número do Cupom Fiscal')
    .Display('DECF_COO',    'COO do Cupom Fiscal')
    .Configurar;
end;

procedure TViewEntradaDevolucaoNF.dbEntradaButtonClick(Sender: TObject);
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
  sEmpresa  := dtsCompra.DataSet.FieldByName('CODEMP').AsString;
  if ( dtsCompra.DataSet.State = dsEdit ) then
    if SelecionarNFe(Self, sEmpresa, sSerie, sChave, iNumero, iModelo, dEmissao, fDestinatario, iAno, iControle) then
    begin
      if (fDestinatario.Tipo = dtFornecedor) then
      begin
        dtsCompra.DataSet.FieldByName('DNFE_ENTRADA_ANO').AsInteger := iAno;
        dtsCompra.DataSet.FieldByName('DNFE_ENTRADA_COD').AsInteger := iControle;
      end
      else
      begin
        dtsCompra.DataSet.FieldByName('DNFE_ENTRADA_ANO').Clear;
        dtsCompra.DataSet.FieldByName('DNFE_ENTRADA_COD').Clear;
      end;

      if (fDestinatario.Tipo = dtCliente) then
      begin
        dtsCompra.DataSet.FieldByName('DNFE_SAIDA_ANO').AsInteger := iAno;
        dtsCompra.DataSet.FieldByName('DNFE_SAIDA_COD').AsInteger := iControle;
      end
      else
      begin
        dtsCompra.DataSet.FieldByName('DNFE_SAIDA_ANO').Clear;
        dtsCompra.DataSet.FieldByName('DNFE_SAIDA_COD').Clear;
      end;

      dtsCompra.DataSet.FieldByName('DNFE_COMPETENCIA').AsString  := FormatDateTime('yymm', dEmissao);
      dtsCompra.DataSet.FieldByName('DNFE_SERIE').AsString    := sSerie;
      dtsCompra.DataSet.FieldByName('DNFE_NUMERO').AsInteger  := iNumero;
      dtsCompra.DataSet.FieldByName('DNFE_CHAVE').AsString    := sChave;
      dtsCompra.DataSet.FieldByName('DNFE_UF').AsString       := fDestinatario.UF;
      dtsCompra.DataSet.FieldByName('DNFE_CNPJ_CPF').AsString := fDestinatario.CpfCnpj;
      dtsCompra.DataSet.FieldByName('DNFE_IE').AsString       := fDestinatario.InsEstadual;
    end;
end;

procedure TViewEntradaDevolucaoNF.dtsCompraDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = dbFormaDevolucao.Field ) then
  begin
    // Títulos principais
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
    if ( dtsCompra.DataSet.State = dsEdit ) then
      Case TFormaNFDevolucao(dbFormaDevolucao.Field.AsInteger) of
        fdNFeModelo1_1A  : dbNFModelo.Field.AsInteger := 1;
        fdNFProdutorRural: dbNFModelo.Field.AsInteger := 4;
        else
          dbNFModelo.Field.Clear;
      end;

  end
  else
  if ( (Field = dtsCompra.DataSet.FieldByName('DNFE_ENTRADA_COD')) or (Field = dtsCompra.DataSet.FieldByName('DNFE_SAIDA_COD')) ) then
  begin
    if dtsCompra.DataSet.FieldByName('DNFE_ENTRADA_COD').AsInteger > 0 then
      dbEntrada.DataField := dtsCompra.DataSet.FieldByName('DNFE_ENTRADA_COD').FieldName
    else
    if dtsCompra.DataSet.FieldByName('DNFE_SAIDA_COD').AsInteger > 0 then
      dbEntrada.DataField := dtsCompra.DataSet.FieldByName('DNFE_SAIDA_COD').FieldName;
  end;
end;

procedure TViewEntradaDevolucaoNF.FormCreate(Sender: TObject);
begin
  FControllerFormaDevolucaoView := TControllerFactory.New.FormaDevolucao;
  FControllerEstado      := TControllerFactory.New.Estado;
  FControllerCompetencia := TControllerFactory.New.Competencia;
  FControllerModeloCupomFiscal := TControllerFactory.New.ModeloCupomFiscalView;

  inherited;

  FAno      := 0;
  FControle := 0;
  FEmpresa  := EmptyStr;

  TController(FControllerFormaDevolucaoView)
    .LookupComboBox(dbFormaDevolucao, dtsFormaDevolucao, 'dnfe_forma', 'codigo', 'descricao');
  TController(FControllerEstado)
    .LookupComboBox(dbNFUF, dtsUF, 'dnfe_uf', 'est_sigla', 'est_sigla');
  TController(FControllerCompetencia)
    .LookupComboBox(dbNFUF, dtsCompetencia, 'dnfe_competencia', 'codigo_resumo', 'descricao_resumo');
  TController(FControllerModeloCupomFiscal)
    .LookupComboBox(dbCPModelo, dtsModeloCupom, 'dnfe_cmodelo', 'codigo', 'descricao');
end;

procedure TViewEntradaDevolucaoNF.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('ViewEntradaDevolucaoNF', TViewEntradaDevolucaoNF);

end.
