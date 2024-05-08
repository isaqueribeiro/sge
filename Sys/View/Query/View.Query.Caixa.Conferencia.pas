unit View.Query.Caixa.Conferencia;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Generics.Collections,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  cxGraphics,
  cxLookAndFeels,
  cxButtons,
  cxLookAndFeelPainters,

  dxSkinsCore,
  dxSkinBasic,
  dxSkinsDefaultPainters,
  dxSkinOffice2019Black,
  dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray,
  dxSkinOffice2019White,
  dxSkinMcSkin,
  dxSkinOffice2007Green,
  dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray,
  dxSkinOffice2013White,
  dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark,
  dxSkinTheBezier,
  dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light,

  View.PadraoPesquisa,
  Model.Constantes,
  SGE.Controller.Interfaces, dxSkinWXI;

type
  TViewQueryCaixaConferencia = class(TViewPadraoPesquisa)
    lblData: TLabel;
    e1Data: TJvDateEdit;
    edContaCorrente: TComboBox;
    lblContaCorrente: TLabel;
    dtsContaCorrente: TDataSource;
    DspPesquisa: TDataSetProvider;
    CdsPesquisa: TClientDataSet;
    BtnConferir: TcxButton;
    PnlControleQuitacao: TPanel;
    GrpBxDados: TGroupBox;
    pnlDicas: TPanel;
    lblDicasTitulo: TLabel;
    lblDicasTexto: TLabel;
    lblHistorico: TLabel;
    dbHistorico: TDBMemo;
    lblFormaPagamento: TLabel;
    dbFormaPagamento: TDBEdit;
    lblResponsavel: TLabel;
    dbResponsavel: TDBEdit;
    lblLancamento: TLabel;
    dbLancamento: TDBEdit;
    lblCaixa: TLabel;
    dbCaixa: TDBEdit;
    GrpBxTotais: TGroupBox;
    lblContaAPagar: TLabel;
    dbContaAPagar: TDBEdit;
    lblContaAReceber: TLabel;
    dbContaAReceber: TDBEdit;
    lblValorTotalCredito: TLabel;
    edValorTotalCredito: TEdit;
    edValorTotalDebito: TEdit;
    lblValorTotalDebito: TLabel;
    lblValorTotalSaldo: TLabel;
    edValorTotalSaldo: TEdit;
    lblConfereCredito: TLabel;
    edConfereCredito: TEdit;
    lblConfereDebito: TLabel;
    edConfereDebito: TEdit;
    lblConfereSaldo: TLabel;
    edConfereSaldo: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnConferirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerContaCorrente : IControllerContaCorrente;

    procedure ExibirTotais;
    procedure ConferirMovimentos;

    function ControllerCaixaMovimento : IControllerQueryCaixaMovimento;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

implementation

{$R *.dfm}

uses
    System.DateUtils
  , UDMRecursos
  , UConstantesDGE
  , Service.Message
  , SGE.Controller
  , SGE.Controller.Helper
  , SGE.Controller.Factory
  , SGE.Controller.Query.Factory
  , Controller.Tabela;

procedure TViewQueryCaixaConferencia.BtnConferirClick(Sender: TObject);
begin
  if TServiceMessage.ShowConfirmation('Conferência', 'Confirma a conferência dos lançamentos selecionados?') then
    ConferirMovimentos;
end;

procedure TViewQueryCaixaConferencia.BtnPesquisarClick(Sender: TObject);
begin
  BtnConferir.Enabled := False;

  if (edContaCorrente.ItemIndex = -1) then
    TServiceMessage.ShowWarning('Selecione a Conta Corrente')
  else
    inherited;
end;

procedure TViewQueryCaixaConferencia.ConferirMovimentos;
begin
  ControllerCaixaMovimento.DataSet.DisableControls;
  ControllerCaixaMovimento.DataSet.First;
  try
    while not ControllerCaixaMovimento.DataSet.Eof do
    begin
      if (ControllerCaixaMovimento.DataSet.FieldByName('selecionar').AsInteger = 1) then
      begin
        ControllerCaixaMovimento.DataSet.Edit;
        ControllerCaixaMovimento.DataSet.FieldByName('conferido').AsInteger := 1;
        ControllerCaixaMovimento.DataSet.Post;
      end;

      ControllerCaixaMovimento.DataSet.Next;
    end;

    ControllerCaixaMovimento.GravarDados;
  finally
    ControllerCaixaMovimento.DataSet.First;
    ControllerCaixaMovimento.DataSet.EnableControls;

    BtnConferir.Enabled := False;
    ExecutarPesquisa;
  end;
end;

function TViewQueryCaixaConferencia.ControllerCaixaMovimento: IControllerQueryCaixaMovimento;
begin
  Result := (FController as IControllerQueryCaixaMovimento);
end;

procedure TViewQueryCaixaConferencia.dbgDadosDblClick(Sender: TObject);
var
  aCreditos,
  aDebitos ,
  aSaldo   : Currency;
begin
  if dtsPesquisa.AutoEdit then
  begin
    if (not dtsPesquisa.DataSet.IsEmpty) then
    begin
      aCreditos := StrToCurr(Trim(edConfereCredito.Text).Replace('.', '').Replace(',', '')) / 100.0;
      aDebitos  := StrToCurr(Trim(edConfereDebito.Text).Replace('.', '').Replace(',', '')) / 100.0;

      dtsPesquisa.DataSet.Edit;
      if (dtsPesquisa.DataSet.FieldByName('selecionar').AsInteger = 0) then
      begin
        dtsPesquisa.DataSet.FieldByName('selecionar').AsInteger := 1;

        if Trim(dtsPesquisa.DataSet.FieldByName('tipo').AsString).ToUpper.Equals(TIPO_MOVIMENTO_CREDITO) then
          aCreditos := aCreditos + dtsPesquisa.DataSet.FieldByName('valor').AsCurrency
        else
        if Trim(dtsPesquisa.DataSet.FieldByName('tipo').AsString).ToUpper.Equals(TIPO_MOVIMENTO_DEBITO) then
          aDebitos := aDebitos + dtsPesquisa.DataSet.FieldByName('valor').AsCurrency
      end
      else
      begin
        dtsPesquisa.DataSet.FieldByName('selecionar').AsInteger := 0;

        if Trim(dtsPesquisa.DataSet.FieldByName('tipo').AsString).ToUpper.Equals(TIPO_MOVIMENTO_CREDITO) then
          aCreditos := aCreditos - dtsPesquisa.DataSet.FieldByName('valor').AsCurrency
        else
        if Trim(dtsPesquisa.DataSet.FieldByName('tipo').AsString).ToUpper.Equals(TIPO_MOVIMENTO_DEBITO) then
          aDebitos := aDebitos - dtsPesquisa.DataSet.FieldByName('valor').AsCurrency
      end;

      dtsPesquisa.DataSet.Post;

      aSaldo := (aCreditos - aDebitos);

      edConfereCredito.Text := FormatFloat(',0.00', aCreditos);
      edConfereDebito.Text  := FormatFloat(',0.00', aDebitos);
      edConfereSaldo.Text   := FormatFloat(',0.00', aSaldo);

      if (aSaldo > 0) then
        edConfereSaldo.Font.Color := $00004000
      else
        edConfereSaldo.Font.Color := clRed;

      BtnConferir.Enabled := (aCreditos <> 0) or (aDebitos <> 0) or (aSaldo <> 0);
    end;
  end;
end;

procedure TViewQueryCaixaConferencia.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #32) and (not dtsPesquisa.DataSet.IsEmpty) then
    dbgDadosDblClick(Sender)
  else
    inherited;
end;

function TViewQueryCaixaConferencia.ExecutarPesquisa: Boolean;
begin
  Result := False;
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    try
      Controller
        .DataIncial(e1Data.Date)
        .DataIncial(e1Data.Date);

      Result := not
        ControllerCaixaMovimento
          .MovimentoConferencia(edTipoPesquisa.ItemIndex)
          .ContaCorrente(TSimpleObjectList(edContaCorrente.Items.Objects[edContaCorrente.ItemIndex]).Code.ToInteger)
          .Execute(TTipoPesquisa.tpAutomatico, edPesquisar.Text)
          .DataSet
            .IsEmpty;

      Tabela.Configurar;

      ExibirTotais;
    except
      On E : Exception do
      begin
        WaitAMomentFree;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewQueryCaixaConferencia.ExibirTotais;
var
  aSaldo : Currency;
begin
  edValorTotalCredito.Text := FormatFloat(',0.00', ControllerCaixaMovimento.ValorTotalPesquisadoCredito);
  edValorTotalDebito.Text  := FormatFloat(',0.00', ControllerCaixaMovimento.ValorTotalPesquisadoDebito);

  aSaldo := ControllerCaixaMovimento.ValorTotalPesquisadoCredito - ControllerCaixaMovimento.ValorTotalPesquisadoDebito;
  edValorTotalSaldo.Text := FormatFloat(',0.00', aSaldo);

  if (aSaldo > 0) then
    edValorTotalSaldo.Font.Color := clBlack
  else
    edValorTotalSaldo.Font.Color := clRed;

  edConfereCredito.Text := '0,00';
  edConfereDebito.Text  := '0,00';
  edConfereSaldo.Text   := '0,00';
  edConfereSaldo.Font.Color := $00004000;
end;

procedure TViewQueryCaixaConferencia.FormCreate(Sender: TObject);
var
  aEmpresa : IControllerEmpresa;
begin
  FController := TControllerQueryFactory.Instance.CaixaMovimento;
  FControllerContaCorrente := TControllerFactory.New.ContaCorrente.CarregarLista(UsuarioLogado.Empresa.CNPJ);

  inherited;

  e1Data.Date := Date;
  BtnConferir.Enabled   := False;
  btnSelecionar.Visible := False;
  edTipoPesquisa.ItemIndex := 1;

  DspPesquisa.DataSet := Controller.DataSet;

  CampoAtivo := 'selecionar';

  // Configurar tabela de pesquisa
  Tabela
    .Display('numero', 'Número', '###0000000', TAlignment.taCenter)
    .Display('tipo', 'Tipo', TAlignment.taCenter)
    .Display('Valor_Credito', 'Crédito (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('Valor_Debito',  'Débito (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('valor',  'Valor (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('selecionar', 'Quitar', TAlignment.taCenter, False);

  TController(FControllerContaCorrente).PopuleComboBox(edContaCorrente, dtsContaCorrente, 'codigo', 'descricao');

  aEmpresa := TControllerFactory.New.EmpresaView;
  Self.Caption := Self.Caption + ' - ' + aEmpresa.GetEmpresaFantasia(aEmpresa.DAO.Usuario.Empresa.CNPJ);
end;

procedure TViewQueryCaixaConferencia.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
    Self.Close
end;

initialization
  FormFunction.RegisterForm('ViewQueryCaixaConferencia', TViewQueryCaixaConferencia);

end.
