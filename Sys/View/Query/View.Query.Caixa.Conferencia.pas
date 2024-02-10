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
  dxSkinsDefaultPainters,
  dxSkinOffice2019Black,
  dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray,
  dxSkinOffice2019White,

  View.PadraoPesquisa,
  Model.Constantes,
  SGE.Controller.Interfaces;

type
  TViewQueryCaixaConferencia = class(TViewPadraoPesquisa)
    lblData: TLabel;
    e1Data: TJvDateEdit;
    edContaCorrente: TComboBox;
    lblContaCorrente: TLabel;
    dtsContaCorrente: TDataSource;
    DspPesquisa: TDataSetProvider;
    CdsPesquisa: TClientDataSet;
    CdsPesquisaSelecionados: TAggregateField;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure dtsPesquisaStateChange(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnConferirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerContaCorrente : IControllerContaCorrente;

    procedure ConferirMovimentos; virtual; abstract;
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
  if (edContaCorrente.ItemIndex = -1) then
    TServiceMessage.ShowWarning('Selecione a Conta Conrrente')
  else
    inherited;
end;

function TViewQueryCaixaConferencia.ControllerCaixaMovimento: IControllerQueryCaixaMovimento;
begin
  Result := (FController as IControllerQueryCaixaMovimento);
end;

procedure TViewQueryCaixaConferencia.dbgDadosDblClick(Sender: TObject);
begin
  if dtsPesquisa.AutoEdit then
    if (not dtsPesquisa.DataSet.IsEmpty) then
    begin
      dtsPesquisa.DataSet.Edit;
      if ( dtsPesquisa.DataSet.FieldByName('selecionar').AsInteger = 0 ) then
        dtsPesquisa.DataSet.FieldByName('selecionar').AsInteger := 1
      else
        dtsPesquisa.DataSet.FieldByName('selecionar').AsInteger := 0;

      dtsPesquisa.DataSet.Post;
    end;
end;

procedure TViewQueryCaixaConferencia.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #32) and (not dtsPesquisa.DataSet.IsEmpty) then
    dbgDadosDblClick(Sender)
  else
    inherited;
end;

procedure TViewQueryCaixaConferencia.dtsPesquisaStateChange(Sender: TObject);
begin
  inherited;
  BtnConferir.Enabled := (not dtsPesquisa.DataSet.IsEmpty) and (StrToIntDef(CdsPesquisaSelecionados.AsString, 0) > 0);
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
          .ContaCorrente(TSimpleObjectList(edContaCorrente.Items.Objects[edContaCorrente.ItemIndex]).Code.ToInteger)
          .Execute(TTipoPesquisa.tpAutomatico, edPesquisar.Text)
          .DataSet
            .IsEmpty;

      Tabela.Configurar;
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
