unit UGeControleCheque;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, cxGraphics, cxLookAndFeels, System.ImageList,
  cxLookAndFeelPainters, Menus, cxButtons, JvToolEdit, JvExMask,
  JvDBControls, Datasnap.DBClient, Datasnap.Provider, IBX.IBQuery, ACBrBase,
  ACBrExtenso, frxClass, frxDBSet, cxControls, cxContainer, cxEdit, cxImage, cxDBEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinsDefaultPainters;

type
  TChequeBaixa = record
    Codigo : Integer;
    Numero ,
    Banco  ,
    Agencia,
    Conta  : String;
    Valor  : Currency;
    Data   : TDateTime;
  end;

  TfrmGeControleCheque = class(TfrmGrPadraoCadastro)
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    dbStatus: TDBEdit;
    lblValor: TLabel;
    dbValor: TDBEdit;
    dtsEmpresa: TDataSource;
    lblBanco: TLabel;
    dbBanco: TDBLookupComboBox;
    pgcMaisDados: TPageControl;
    tbsObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    lblStatus: TLabel;
    bvlBaixas: TBevel;
    dbgBaixas: TDBGrid;
    Bevel7: TBevel;
    dtsBaixas: TDataSource;
    lblAgencia: TLabel;
    dbAgencia: TDBEdit;
    lblEmissorCnpj: TLabel;
    dbEmissorCnpj: TDBEdit;
    dtsBanco: TDataSource;
    lblData: TLabel;
    btbtnAlterarSituacao: TcxButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    FrChequeA5: TfrxReport;
    FrdCheque: TfrxDBDataset;
    ACBrExtenso: TACBrExtenso;
    DspCheque: TDataSetProvider;
    CdsCheque: TClientDataSet;
    popImprimir: TPopupMenu;
    popGerarEspelhoChequeA4: TMenuItem;
    lblEmissao: TLabel;
    dbEmissao: TJvDBDateEdit;
    lblApresentacao: TLabel;
    dbApresentacao: TJvDBDateEdit;
    dtsTipoCheque: TDataSource;
    FrChequeA4: TfrxReport;
    popGerarEspelhoChequeA5: TMenuItem;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    lblEmissorNome: TLabel;
    dbEmissorNome: TJvDBComboEdit;
    lblDataCadastro: TLabel;
    dbDataCadastro: TDBEdit;
    lblCompensacao: TLabel;
    dbCompensacao: TJvDBDateEdit;
    dbConta: TDBEdit;
    lblConta: TLabel;
    lblNominalA: TLabel;
    dbNominalA: TDBEdit;
    popMudarSituacao: TPopupMenu;
    ppmApresentar: TMenuItem;
    ppmCompensado: TMenuItem;
    ppmDevolvido: TMenuItem;
    ppmCancelar: TMenuItem;
    N1: TMenuItem;
    popRelacaoCheques: TMenuItem;
    N2: TMenuItem;
    DspRelacaoCheque: TDataSetProvider;
    CdsRelacaoCheque: TClientDataSet;
    frdsRelacaoCheque: TfrxDBDataset;
    frRelacaoCheque: TfrxReport;
    fdQryEmpresa: TFDQuery;
    fdQryTipoCheque: TFDQuery;
    fdQryBanco: TFDQuery;
    fdQryTabelaCONTROLE: TIntegerField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaTIPO: TSmallintField;
    fdQryTabelaBANCO: TStringField;
    fdQryTabelaAGENCIA: TStringField;
    fdQryTabelaCONTA: TStringField;
    fdQryTabelaNUMERO: TStringField;
    fdQryTabelaFORNECEDOR: TIntegerField;
    fdQryTabelaCLIENTE: TIntegerField;
    fdQryTabelaDATA_EMISSAO: TDateField;
    fdQryTabelaDATA_APRESENTACAO: TDateField;
    fdQryTabelaDATA_DEVOLUCAO: TDateField;
    fdQryTabelaDATA_COMPENSACAO: TDateField;
    fdQryTabelaNOMINAL_A: TStringField;
    fdQryTabelaDATA_CADASTRO: TDateField;
    fdQryTabelaUSUARIO_CADASTRO: TStringField;
    fdQryTabelaSTATUS: TSmallintField;
    fdQryTabelaOBS: TMemoField;
    fdQryTabelaSTATUS_DESCRICAO: TStringField;
    fdQryTabelaBANCO_NOME: TStringField;
    fdQryTabelaEMISSOR_NOME: TStringField;
    fdQryTabelaEMISSOR_CNPJ: TStringField;
    fdQryTabelaEMISSOR_PF: TSmallintField;
    fdQryTabelaCLIENTE_NOME: TStringField;
    fdQryTabelaCLIENTE_CNPJ: TStringField;
    fdQryTabelaCLIENTE_PF: TSmallintField;
    fdQryTabelaFORNECEDOR_NOME: TStringField;
    fdQryTabelaFORNECEDOR_CNPJ: TStringField;
    fdQryTabelaFORNECEDOR_PF: TSmallintField;
    qryBaixas: TFDQuery;
    qryBaixasTIPO: TStringField;
    qryBaixasLANCAMENTO: TStringField;
    qryBaixasANOLANC: TSmallintField;
    qryBaixasNUMLANC: TIntegerField;
    qryBaixasSEQ: TSmallintField;
    qryBaixasDATA_PAGTO: TDateField;
    qryBaixasDOCUMENTO_BAIXA: TStringField;
    qryBaixasUSUARIO: TStringField;
    qryBaixasNOME: TStringField;
    qryBaixasNOME_CNPJ: TStringField;
    qryBaixasNOME_PF: TSmallintField;
    QryCheque: TFDQuery;
    CdsChequeCONTROLE: TIntegerField;
    CdsChequeEMPRESA: TStringField;
    CdsChequeTIPO: TSmallintField;
    CdsChequeBANCO: TStringField;
    CdsChequeBANCO_LOGO: TBlobField;
    CdsChequeAGENCIA: TStringField;
    CdsChequeCONTA: TStringField;
    CdsChequeNUMERO: TStringField;
    CdsChequeFORNECEDOR: TIntegerField;
    CdsChequeCLIENTE: TIntegerField;
    CdsChequeDATA_EMISSAO: TDateField;
    CdsChequeDATA_APRESENTACAO: TDateField;
    CdsChequeDATA_COMPENSACAO: TDateField;
    CdsChequeNOMINAL_A: TStringField;
    CdsChequeDATA_CADASTRO: TDateField;
    CdsChequeUSUARIO_CADASTRO: TStringField;
    CdsChequeSTATUS: TSmallintField;
    CdsChequeOBS: TMemoField;
    CdsChequeSTATUS_DESCRICAO: TStringField;
    CdsChequeBANCO_NOME: TStringField;
    CdsChequeEMISSOR_NOME: TStringField;
    CdsChequeEMISSOR_CNPJ: TStringField;
    CdsChequeEMISSOR_PF: TSmallintField;
    CdsChequeVALOR_EXTENSO: TStringField;
    QryRelacaoCheque: TFDQuery;
    QryChequeCONTROLE: TIntegerField;
    QryChequeEMPRESA: TStringField;
    QryChequeTIPO: TSmallintField;
    QryChequeBANCO: TStringField;
    QryChequeBANCO_LOGO: TBlobField;
    QryChequeAGENCIA: TStringField;
    QryChequeCONTA: TStringField;
    QryChequeNUMERO: TStringField;
    QryChequeFORNECEDOR: TIntegerField;
    QryChequeCLIENTE: TIntegerField;
    QryChequeDATA_EMISSAO: TDateField;
    QryChequeDATA_APRESENTACAO: TDateField;
    QryChequeDATA_COMPENSACAO: TDateField;
    QryChequeNOMINAL_A: TStringField;
    QryChequeDATA_CADASTRO: TDateField;
    QryChequeUSUARIO_CADASTRO: TStringField;
    QryChequeSTATUS: TSmallintField;
    QryChequeOBS: TMemoField;
    QryChequeSTATUS_DESCRICAO: TStringField;
    QryChequeBANCO_NOME: TStringField;
    QryChequeEMISSOR_NOME: TStringField;
    QryChequeEMISSOR_CNPJ: TStringField;
    QryChequeEMISSOR_PF: TSmallintField;
    fdQryTabelaVALOR: TFMTBCDField;
    QryChequeVALOR: TFMTBCDField;
    CdsChequeVALOR: TFMTBCDField;
    qryBaixasVALOR_BAIXA: TFMTBCDField;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpOperacaoCancelado: TShape;
    shpOperacaoACompensar: TShape;
    shpOperacaoPedente: TShape;
    pnlStatusText: TPanel;
    lblOperacaoPendente: TLabel;
    lblOperacaoACompensar: TLabel;
    lblOperacaoCancelado: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dbEmissorNomeButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FrReciboGetValue(const VarName: string; var Value: Variant);
    procedure popGerarReciboClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure CdsChequeCalcFields(DataSet: TDataSet);
    procedure ppmApresentarClick(Sender: TObject);
    procedure ppmDevolvidoClick(Sender: TObject);
    procedure ppmCompensadoClick(Sender: TObject);
    procedure ppmCancelarClick(Sender: TObject);
    procedure popRelacaoChequesClick(Sender: TObject);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaEMISSOR_CNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryBaixasNOME_CNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    FDataAtual    : TDateTime;
    FLoteParcelas : String;
    SQL_Relacao : TStringList;
    FImprimirCabecalho,
    FChequeParaBaixa  : Boolean;
    procedure AbrirBaixas(const Controle : Integer);
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure AddWhereAdditional;

    function GetRotinaAlterarSituacaoID : String;
    function GetRotinaApresentarChequeID : String;
    function GetRotinaDevolverChequeID : String;
    function GetRotinaCompensarChequeID : String;
    function GetRotinaCancelarChequeID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaAlterarSituacaoID  : String read GetRotinaAlterarSituacaoID;
    property RotinaApresentarChequeID : String read GetRotinaApresentarChequeID;
    property RotinaDevolverChequeID   : String read GetRotinaDevolverChequeID;
    property RotinaCompensarChequeID  : String read GetRotinaCompensarChequeID;
    property RotinaCancelarChequeID   : String read GetRotinaCancelarChequeID;
    property DataAtual : TDateTime read FDataAtual;
  end;

(*
  Tabelas:
  - TBCHEQUE
  - TBBANCO
  - TBCLIENTE
  - TBFORNECEDOR
  - TBEMPRESA

  Views:
  - VW_EMPRESA
  - VW_STATUS_CHEQUE

  Procedures:

*)

  function SelecionarChequeBaixa(const AOnwer : TComponent;
    var pCheque : TChequeBaixa) : Boolean;

implementation

uses
    System.StrUtils
  , System.DateUtils
  , Model.Constantes
  , Controller.Tabela
  , UConstantesDGE
  , UDMBusiness
  , UDMRecursos
  , UDMNFe
  , View.Cliente
  , View.MemoData
  , UGeFornecedorClientePesquisa;

{$R *.dfm}

function SelecionarChequeBaixa(const AOnwer : TComponent;
  var pCheque : TChequeBaixa) : Boolean;
var
  AForm : TfrmGeControleCheque;
begin
  AForm := TfrmGeControleCheque.Create(AOnwer);
  try
    AForm.btbtnIncluir.Visible  := False;
    AForm.btbtnAlterar.Visible  := False;
    AForm.btbtnExcluir.Visible  := False;
    AForm.btbtnCancelar.Visible := False;
    AForm.btbtnSalvar.Visible   := False;
    AForm.btbtnLista.Visible    := False;

    AForm.btbtnSelecionar.Visible := True;
    AForm.FChequeParaBaixa        := True;

    AForm.btbtnAlterarSituacao.Visible := False;
    AForm.AddWhereAdditional;

    Result := (AForm.ShowModal = mrOk);

    if Result then
      with AForm, DtSrcTabela.DataSet do
      begin
        pCheque.Codigo  := FieldByName('CONTROLE').AsInteger;
        pCheque.Numero  := FieldByName('NUMERO').AsString;
        pCheque.Banco   := FieldByName('BANCO').AsString;
        pCheque.Agencia := FieldByName('AGENCIA').AsString;
        pCheque.Conta   := FieldByName('CONTA').AsString;
        pCheque.Valor   := FieldByName('VALOR').AsCurrency;
        pCheque.Data    := FieldByName('DATA_COMPENSACAO').AsDateTime;
      end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeControleCheque.FormCreate(Sender: TObject);
begin
  popRelacaoCheques.Caption := Format(popRelacaoCheques.Caption, [GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa)]);

  inherited;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryTipoCheque);
  CarregarLista(fdQryBanco);

  SQL_Relacao := TStringList.Create;
  SQL_Relacao.AddStrings( QryRelacaoCheque.SQL );

  FDataAtual      := GetDateTimeDB;
  e1Data.Date     := GetMenorDataChequePendente;
  e2Data.Date     := GetDateLastMonth;

  if (e1Data.Date > GetDateDB) then
    e1Data.Date   := GetDateDB;

  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  RotinaID            := ROTINA_FIN_CONTROLE_CHEQUE_ID;
  DisplayFormatCodigo := '###0000000';

  NomeTabela       := 'TBCHEQUE';
  CampoCodigo      := 'c.controle';
  CampoDescricao   := 'coalesce(cc.nome, fc.nomeforn)';
  CampoOrdenacao   := 'c.data_apresentacao, coalesce(cc.nome, fc.nomeforn)';
  FChequeParaBaixa := False;

  AddWhereAdditional;

  Tabela
    .Display('CONTROLE', 'Controle', '###0000000', TAlignment.taCenter)
    .Display('DATA_CADASTRO', 'Cadastrado em:', 'dd/mm/yyyy')
    .Display('VALOR', 'Valor (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );

  TTabelaController
    .New
    .Tabela( qryBaixas )
    .Display('VALOR_BAIXA', 'Valor (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( qryBaixas );
end;

procedure TfrmGeControleCheque.dbEmissorNomeButtonClick(Sender: TObject);
var
  aTipoEmissor : TTipoEmissorCheque;
  aCodigo      : Integer;
  aNome ,
  aCnpj : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
    begin
      if FieldByName('TIPO').IsNull then
        ShowWarning('Favor selecionar o Tipo de Origem do Cheque')
      else
      if ( SelecionarFornecedorCliente(Self, aTipoEmissor, aCodigo, aNome, aCnpj) ) then
      begin
        FieldByName('EMISSOR_NOME').AsString  := aNome;
        FieldByName('EMISSOR_CNPJ').AsString  := aCnpj;
        FieldByName('EMISSOR_PF').AsInteger   := IfThen(StrIsCPF(aCnpj), 1, 0);

        if ( aTipoEmissor = tecFornecedor ) then
        begin
          FieldByName('FORNECEDOR').AsInteger     := aCodigo;
          FieldByName('FORNECEDOR_NOME').AsString := aNome;
          FieldByName('FORNECEDOR_CNPJ').AsString := aCnpj;
          FieldByName('FORNECEDOR_PF').AsInteger  := IfThen(StrIsCPF(aCnpj), 1, 0);
          FieldByName('CLIENTE').Clear;
          FieldByName('CLIENTE_NOME').Clear;
          FieldByName('CLIENTE_CNPJ').Clear;
          FieldByName('CLIENTE_PF').Clear;
        end
        else
        if ( aTipoEmissor = tecCliente ) then
        begin
          FieldByName('FORNECEDOR').Clear;
          FieldByName('FORNECEDOR_NOME').Clear;
          FieldByName('FORNECEDOR_CNPJ').Clear;
          FieldByName('FORNECEDOR_PF').Clear;
          FieldByName('CLIENTE').AsInteger     := aCodigo;
          FieldByName('CLIENTE_NOME').AsString := aNome;
          FieldByName('CLIENTE_CNPJ').AsString := aCnpj;
          FieldByName('CLIENTE_PF').AsInteger  := IfThen(StrIsCPF(aCnpj), 1, 0);
        end;
      end;
    end;
  end;
end;

procedure TfrmGeControleCheque.btnFiltrarClick(Sender: TObject);
begin
  AddWhereAdditional;
  inherited;
end;

procedure TfrmGeControleCheque.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    with DtSrcTabela.DataSet do
    begin
      btbtnAlterarSituacao.Enabled := (FieldByName('CONTROLE').AsCurrency > 0) and (not (State in [dsEdit, dsInsert]));

      ppmApresentar.Enabled := (FieldByName('CONTROLE').AsCurrency > 0) and (FieldByName('STATUS').AsInteger in [STATUS_CHEQUE_PENDENTE, STATUS_CHEQUE_DEVOLVIDO]);
      ppmDevolvido.Enabled  := (FieldByName('CONTROLE').AsCurrency > 0) and (FieldByName('STATUS').AsInteger in [STATUS_CHEQUE_APRESENTADO]);
      ppmCompensado.Enabled := (FieldByName('CONTROLE').AsCurrency > 0) and (FieldByName('STATUS').AsInteger in [STATUS_CHEQUE_APRESENTADO]);
      ppmCancelar.Enabled   := (FieldByName('CONTROLE').AsCurrency > 0) and (FieldByName('STATUS').AsInteger in [STATUS_CHEQUE_PENDENTE, STATUS_CHEQUE_APRESENTADO, STATUS_CHEQUE_DEVOLVIDO]);

      popGerarEspelhoChequeA4.Enabled := True;
      popGerarEspelhoChequeA5.Enabled := True;
    end;
  end
  else
  begin
    btbtnAlterarSituacao.Enabled := False;

    ppmApresentar.Enabled := False;
    ppmDevolvido.Enabled  := False;
    ppmCompensado.Enabled := False;
    ppmCancelar.Enabled   := False;

    popGerarEspelhoChequeA4.Enabled := False;
    popGerarEspelhoChequeA5.Enabled := False;
  end;

  popRelacaoCheques.Enabled := (DtSrcTabela.DataSet.RecordCount > 0);
end;

procedure TfrmGeControleCheque.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    RecarregarRegistro;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeControleCheque.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirBaixas( DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger );
end;

procedure TfrmGeControleCheque.popGerarReciboClick(Sender: TObject);
var
  sLogo : String;
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  SetVariablesDefault(FrChequeA4);
  SetVariablesDefault(FrChequeA5);

  with CdsCheque, Params do
  begin
    Close;
    ParamByName('cheque').AsCurrency := DtSrcTabela.DataSet.FieldByName('CONTROLE').AsCurrency;
    Open;

    if IsEmpty then
      Exit;
  end;

  sLogo := ExtractFilePath(ParamStr(0)) + 'Imagens\' + CdsChequeBANCO.AsString + '.jpg';

  if not FileExists(sLogo) then
    sLogo := ExtractFilePath(ParamStr(0)) + 'Imagens\Colorido\' + CdsChequeBANCO.AsString + '.bmp';

  if FileExists(sLogo) then
  begin
    CdsCheque.Edit;
    CdsChequeBANCO_LOGO.LoadFromFile( sLogo );
    CdsCheque.Post;
  end;

  FImprimirCabecalho := ShowConfirmation('Espelho Cheque', 'Deseja imprimir no espelho o Cabe�alho com informa��es da empresa?');

  if ( Sender = popGerarEspelhoChequeA4 )  then
    frReport := FrChequeA4
  else
  if ( Sender = popGerarEspelhoChequeA5 )  then
    frReport := FrChequeA5;

  SetVariablesDefault(frReport);

  frReport.PrepareReport;
  frReport.ShowReport;
end;

procedure TfrmGeControleCheque.popRelacaoChequesClick(Sender: TObject);
var
  sWhr : String;
begin
  WaitAMoment(WAIT_AMOMENT_PrintPrepare);
  try
    DMNFe.AbrirEmitente(gUsuarioLogado.Empresa);
    DMBusiness.ConfigurarEmail(gUsuarioLogado.Empresa, EmptyStr, 'Rela��o de Cheques', EmptyStr);

    with CdsRelacaoCheque, Params do
    begin
      Close;
      ParamByName('empresa').AsString        := gUsuarioLogado.Empresa;
      ParamByName('data_inicial').AsDateTime := e1Data.Date;
      ParamByName('data_final').AsDateTime   := e2Data.Date;
      Open;
    end;

    WaitAMomentFree;

    frReport := frRelacaoCheque;
    SetVariablesDefault(frReport);

    frReport.PrepareReport;
    frReport.ShowReport;
  finally
    WaitAMomentFree;
  end;
end;

procedure TfrmGeControleCheque.ppmApresentarClick(Sender: TObject);
var
  aDataApresn : TDateTime;
  aObservacao : TStringList;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaSistema(RotinaApresentarChequeID, True) then
    Exit;

  aDataApresn := GetDateDB;
  aObservacao := TStringList.Create;

  if ppmApresentar.Enabled then
    if SetMemoTextoData(Self, aDataApresn, aObservacao, 'Apresenta��o do Cheque', 'Informe observa��o sobre a apresenta do cheque:') then
      try
        DtSrcTabela.DataSet.DisableControls;
        DtSrcTabela.DataSet.Edit;

        DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger             := STATUS_CHEQUE_APRESENTADO;
        DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime := aDataApresn;
        DtSrcTabela.DataSet.FieldByName('OBS').AsString :=
          DtSrcTabela.DataSet.FieldByName('OBS').AsString + #13 +
          '* Cheque marcado como "Apresentado" por ' + gUsuarioLogado.Login + ' em ' + FormatDateTime('dd/mm/yyyy', GetDateDB) + #13 +
          aObservacao.Text;

        fdQryTabela.Post;
        fdQryTabela.ApplyUpdates;
        fdQryTabela.CommitUpdates;

        CommitTransaction;
      finally
        DtSrcTabela.DataSet.EnableControls;
        RecarregarRegistro;
        HabilitarDesabilitar_Btns;
      end;
end;

procedure TfrmGeControleCheque.ppmCancelarClick(Sender: TObject);
var
  aDataCancel : TDateTime;
  aObservacao : TStringList;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaSistema(RotinaCancelarChequeID, True) then
    Exit;

  aDataCancel := GetDateDB;
  aObservacao := TStringList.Create;

  if ppmCancelar.Enabled then
    if SetMemoTextoData(Self, aDataCancel, aObservacao, 'Cancelamento do Cheque', 'Informe o motivo do cancelamento do cheque:') then
      try
        DtSrcTabela.DataSet.DisableControls;
        DtSrcTabela.DataSet.Edit;

        DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger := STATUS_CHEQUE_CANCELADO;
        DtSrcTabela.DataSet.FieldByName('OBS').AsString :=
          DtSrcTabela.DataSet.FieldByName('OBS').AsString + #13 +
          '* Cheque marcado como "Cancelado" por ' + gUsuarioLogado.Login + ' em ' + FormatDateTime('dd/mm/yyyy', GetDateDB) + #13 +
          'Data  : ' + FormatDateTime('dd/mm/yyyy', aDataCancel) + #13 +
          'Motivo: ' + aObservacao.Text;


        fdQryTabela.Post;
        fdQryTabela.ApplyUpdates;
        fdQryTabela.CommitUpdates;

        CommitTransaction;
      finally
        DtSrcTabela.DataSet.EnableControls;
        RecarregarRegistro;
        HabilitarDesabilitar_Btns;
      end;
end;

procedure TfrmGeControleCheque.ppmCompensadoClick(Sender: TObject);
var
  aDataCompen : TDateTime;
  aObservacao : TStringList;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaSistema(RotinaCompensarChequeID, True) then
    Exit;

  aDataCompen := GetDateDB;
  aObservacao := TStringList.Create;

  if ppmCompensado.Enabled then
    if SetMemoTextoData(Self, aDataCompen, aObservacao, 'Compensa��o do Cheque', 'Informe observa��o sobre a compensa��o do cheque:') then
      try
        DtSrcTabela.DataSet.DisableControls;
        DtSrcTabela.DataSet.Edit;

        DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger            := STATUS_CHEQUE_COMPENSADO;
        DtSrcTabela.DataSet.FieldByName('DATA_COMPENSACAO').AsDateTime := aDataCompen;
        DtSrcTabela.DataSet.FieldByName('OBS').AsString :=
          DtSrcTabela.DataSet.FieldByName('OBS').AsString + #13 +
          '* Cheque marcado como "Compensado" por ' + gUsuarioLogado.Login + ' em ' + FormatDateTime('dd/mm/yyyy', GetDateDB) + #13 +
          aObservacao.Text;


        fdQryTabela.Post;
        fdQryTabela.ApplyUpdates;
        fdQryTabela.CommitUpdates;

        CommitTransaction;
      finally
        DtSrcTabela.DataSet.EnableControls;
        RecarregarRegistro;
        HabilitarDesabilitar_Btns;
      end;
end;

procedure TfrmGeControleCheque.ppmDevolvidoClick(Sender: TObject);
var
  aDataDevolv : TDateTime;
  aObservacao : TStringList;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaSistema(RotinaDevolverChequeID, True) then
    Exit;

  aDataDevolv := GetDateDB;
  aObservacao := TStringList.Create;

  if ppmDevolvido.Enabled then
    if SetMemoTextoData(Self, aDataDevolv, aObservacao, 'Devolu��o do Cheque', 'Informe o motivo da devolu��o do cheque:') then
      try
        DtSrcTabela.DataSet.DisableControls;
        DtSrcTabela.DataSet.Edit;

        DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger          := STATUS_CHEQUE_DEVOLVIDO;
        DtSrcTabela.DataSet.FieldByName('DATA_DEVOLUCAO').AsDateTime := aDataDevolv;
        DtSrcTabela.DataSet.FieldByName('OBS').AsString :=
          DtSrcTabela.DataSet.FieldByName('OBS').AsString + #13 +
          '* Cheque marcado como "Devolvimento" por ' + gUsuarioLogado.Login + ' em ' + FormatDateTime('dd/mm/yyyy', GetDateDB) + #13 +
          'Data  : ' + FormatDateTime('dd/mm/yyyy', aDataDevolv) + #13 +
          'Motivo: ' + aObservacao.Text;


        fdQryTabela.Post;
        fdQryTabela.ApplyUpdates;
        fdQryTabela.CommitUpdates;

        CommitTransaction;
      finally
        DtSrcTabela.DataSet.EnableControls;
        RecarregarRegistro;
        HabilitarDesabilitar_Btns;
      end;
end;

procedure TfrmGeControleCheque.qryBaixasNOME_CNPJGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if ( Sender.DataSet.FieldByName('nome_pf').AsInteger = 1 ) then
      Text := StrFormatarCpf(Trim(Sender.AsString))
    else
      Text := StrFormatarCnpj(Trim(Sender.AsString));
  end;
end;

procedure TfrmGeControleCheque.AbrirBaixas(const Controle: Integer);
begin
  qryBaixas.Close;
  qryBaixas.ParamByName('cheque').AsInteger := Controle;
  qryBaixas.Open;
//
//  with qryBaixas, SQL do
//  begin
//    Clear;
//    AddStrings( SQL_Baixas );
//    SQL.Text := StringReplace(SQL.Text, ':cheque', IntToStr(Controle), [rfReplaceAll]);
//  end;
//
//  qryBaixas.Open;

  HabilitarDesabilitar_Btns;

  dbgBaixas.Visible := (qryBaixas.RecordCount > 0);
  bvlBaixas.Visible := (qryBaixas.RecordCount > 0);
end;

procedure TfrmGeControleCheque.AddWhereAdditional;
var
  sChequeBaixa : String;
begin
  sChequeBaixa :=
    // Cheques emitidos que foram apresentados e/ou compensados
    '((c.tipo = 1) and (c.status in (' + IntToSTr(STATUS_CHEQUE_APRESENTADO) + ', ' + IntToSTr(STATUS_CHEQUE_COMPENSADO) + ')))' +
    ' or ' +
    // Cheques recebidos que foram compensados
    '((c.tipo = 2) and (c.status = ' + IntToSTr(STATUS_CHEQUE_COMPENSADO) + '))';

  WhereAdditional :=
    IfThen(not FChequeParaBaixa, '(c.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ') and ', EmptyStr) +
    '(c.data_apresentacao between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')' +
    IfThen(not FChequeParaBaixa, EmptyStr, ' and (' + sChequeBaixa + ')');
end;

procedure TfrmGeControleCheque.btbtnAlterarClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger >= STATUS_CHEQUE_COMPENSADO ) then
  begin
    ShowWarning('O cheque selecionado est� em situa��o de "' + dbStatus.Text + '" e n�o poder� ser alterado!');
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirBaixas( DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger );
  end;
end;

procedure TfrmGeControleCheque.btbtnExcluirClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger >= STATUS_CHEQUE_COMPENSADO ) then
  begin
    ShowWarning('O cheque selecionado est� em situa��o de "' + dbStatus.Text + '" e n�o poder� ser exclu�do!');
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirBaixas( DtSrcTabela.DataSet.FieldByName('CONTROLE').Value );
  end;
end;

procedure TfrmGeControleCheque.CdsChequeCalcFields(DataSet: TDataSet);
begin
  CdsChequeVALOR_EXTENSO.AsString := AnsiUpperCase(ACBrExtenso.ValorToTexto(CdsChequeVALOR.AsCurrency, ACBrExtenso.Formato));
end;

procedure TfrmGeControleCheque.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Cheques Pendentes
    if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_CHEQUE_PENDENTE ) then
      dbgDados.Canvas.Font.Color := shpOperacaoPedente.Brush.Color
    else
    // Destacar Cheques A Compensar
    if ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_CHEQUE_APRESENTADO) and (DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime <= DataAtual) ) then
    begin
      dbgDados.Canvas.Font.Color  := clBlue;
      dbgDados.Canvas.Brush.Color := shpOperacaoACompensar.Brush.Color;
    end;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
end;

procedure TfrmGeControleCheque.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbValor.ReadOnly      := (not qryBaixas.IsEmpty);
  dbObservacao.ReadOnly := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger > STATUS_CHEQUE_PENDENTE); //(DtSrcTabela.DataSet.State = dsEdit);
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeControleCheque.fdQryTabelaEMISSOR_CNPJGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if ( Sender.DataSet.FieldByName('emissor_pf').AsInteger = 1 ) then
      Text := StrFormatarCpf(Trim(Sender.AsString))
    else
      Text := StrFormatarCnpj(Trim(Sender.AsString));
  end;
end;

procedure TfrmGeControleCheque.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EMPRESA').AsString := gUsuarioLogado.Empresa;
    FieldByName('STATUS').AsInteger := STATUS_CHEQUE_PENDENTE;
    FieldByName('OBS').AsString     := '...';
    FieldByName('DATA_CADASTRO').AsDateTime  := GetDateDB;
    FieldByName('USUARIO_CADASTRO').AsString := gUsuarioLogado.Login;
    FieldByName('TIPO').Clear;
    FieldByName('BANCO').Clear;
    FieldByName('AGENCIA').Clear;
    FieldByName('CONTA').Clear;
    FieldByName('NUMERO').Clear;
    FieldByName('VALOR').Clear;
    FieldByName('DATA_EMISSAO').Clear;
    FieldByName('DATA_APRESENTACAO').Clear;
    FieldByName('DATA_DEVOLUCAO').Clear;
    FieldByName('DATA_COMPENSACAO').Clear;
    FieldByName('NOMINAL_A').Clear;
  end;
end;

procedure TfrmGeControleCheque.fdQryTabelaSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      STATUS_CHEQUE_PENDENTE    : Text := 'Pendente';
      STATUS_CHEQUE_APRESENTADO : Text := 'Apresentado';
      STATUS_CHEQUE_DEVOLVIDO   : Text := 'Devolvido';
      STATUS_CHEQUE_COMPENSADO  : Text := 'Compensado';
      STATUS_CHEQUE_CANCELADO   : Text := 'Cancelado';
      else
        Text := Sender.AsString;
    end;
end;

procedure TfrmGeControleCheque.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirBaixas( DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger );
end;

procedure TfrmGeControleCheque.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    AbrirBaixas( DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger );
    DtSrcTabelaStateChange( DtSrcTabela );
  end;
end;

procedure TfrmGeControleCheque.btbtnListaClick(Sender: TObject);
begin
  popImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

function TfrmGeControleCheque.GetRotinaAlterarSituacaoID: String;
begin
  Result := GetRotinaInternaID(btbtnAlterarSituacao);
end;

function TfrmGeControleCheque.GetRotinaApresentarChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmApresentar, RotinaAlterarSituacaoID);
end;

function TfrmGeControleCheque.GetRotinaCancelarChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmCancelar, RotinaAlterarSituacaoID);
end;

function TfrmGeControleCheque.GetRotinaCompensarChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmCompensado, RotinaAlterarSituacaoID);
end;

function TfrmGeControleCheque.GetRotinaDevolverChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmDevolvido, RotinaAlterarSituacaoID);
end;

procedure TfrmGeControleCheque.RecarregarRegistro;
var
  iControle : Integer;
begin
  iControle := DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger;

  if ( not DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').IsNull ) then
  begin
    if ( DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime < e1Data.Date ) then
      e1Data.Date := DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime;

    if ( DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime > e2Data.Date ) then
      e2Data.Date := DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime;
  end;
//
//  edtFiltrar.Text := EmptyStr;
//  AddWhereAdditional;
//  FiltarDados;
//
//  if not DtSrcTabela.DataSet.Locate('CONTROLE;EMPRESA', VarArrayOf([iControle, gUsuarioLogado.Empresa]), []) then
//  begin
//    DtSrcTabela.DataSet.Close;
//
//    ShowInformation('Favor pesquisar novamente o registro de despesa!');
//    pgcGuias.ActivePage := tbsTabela;
//    edtFiltrar.SetFocus;
//  end;
  fdQryTabela.RefreshRecord;
end;

procedure TfrmGeControleCheque.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    SetRotinaSistema(ROTINA_TIPO_PROCESSO, RotinaAlterarSituacaoID,  Trim(btbtnAlterarSituacao.Caption), RotinaID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaApresentarChequeID, Trim(ppmApresentar.Caption), RotinaAlterarSituacaoID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaDevolverChequeID,   Trim(ppmDevolvido.Caption),  RotinaAlterarSituacaoID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaCompensarChequeID,  Trim(ppmCompensado.Caption), RotinaAlterarSituacaoID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaCancelarChequeID,   Trim(ppmCancelar.Caption),   RotinaAlterarSituacaoID);
  end;
end;

procedure TfrmGeControleCheque.FormShow(Sender: TObject);
begin
  inherited;
  Self.Caption := Self.Caption + ' - (' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa) + ')';
  RegistrarNovaRotinaSistema;

  btbtnAlterarSituacao.Enabled := GetPermissaoRotinaSistema(RotinaAlterarSituacaoID, False);
end;

procedure TfrmGeControleCheque.FrReciboGetValue(const VarName: string;
  var Value: Variant);
begin
  if ( VarName = VAR_TITLE ) then
    Value := 'CHEQUE';

//  if ( VarName = VAR_TITLE ) then
//    Value := AnsiUpperCase(TituloRelario);
//
  if ( VarName = VAR_SUBTITLE ) then
    Value := '(Todas)';

  if ( VarName = VAR_PERIODO ) then
    Value := 'Per�odo de apresenta��o de ' +
      FormatDateTime('dd/mm/yyyy', e1Data.Date) + ' � ' +
      FormatDateTime('dd/mm/yyyy', e2Data.Date);

  if ( VarName = VAR_EMPRESA ) then
    Value := GetEmpresaNomeDefault;

  if ( VarName = VAR_USER ) then
    Value := gUsuarioLogado.Login;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - vers�o ' + ver.FileVersion;

  if ( VarName = 'Imprimir_Cabecalho' ) then
    Value := IfThen(FImprimirCabecalho, 1, 0);
end;

initialization
  FormFunction.RegisterForm('frmGeControleCheque', TfrmGeControleCheque);

end.
