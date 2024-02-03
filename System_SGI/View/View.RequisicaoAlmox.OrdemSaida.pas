unit View.RequisicaoAlmox.OrdemSaida;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.Mask,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  Data.DB,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  UGrPadrao,
  Interacao.Usuario,
  SGE.Controller.Interfaces,
  SGE.Controller.Factory, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinsDefaultPainters;

type
  TViewRequisicaoAlmoxOrdemSaida = class(TfrmGrPadrao)
    GrpBxLancamento: TGroupBox;
    lblControle: TLabel;
    lblRequisitante: TLabel;
    edControle: TEdit;
    edRequisitante: TEdit;
    edCliente: TEdit;
    lblCliente: TLabel;
    lblCNPJ: TLabel;
    edCNPJ: TEdit;
    GrpBxTransporte: TGroupBox;
    pnlFooter: TPanel;
    Bevel2: TBevel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    lblVeiculo: TLabel;
    dbVeiculo: TJvDBComboEdit;
    lblMotorista: TLabel;
    dbMotorista: TJvDBComboEdit;
    dtsRequisicao: TDataSource;
    procedure dbVeiculoButtonClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FRequisitante : IControllerCentroCusto;
    FRequisicao   : IControllerRequisicaoAlmoxarifado;
  public
    { Public declarations }
    procedure CarregarDados(aAno, aControle, aRequisitante : Integer);
    procedure RegistrarRotinaSistema; override;

    function UsuarioLogado : IUsuarioModel; override;
    function Requisitante : IControllerCentroCusto;
    function Requisicao : IControllerRequisicaoAlmoxarifado;
  end;

  function OrdemEntrega(const AOwner : TComponent; aAno, aControle, aRequisitante : Integer) : Boolean;

implementation

{$R *.dfm}

uses
  Service.Utils,
  Service.Message,
  UDMRecursos;

{ TViewRequisicaoAlmoxOrdemSaida }

function OrdemEntrega(const AOwner : TComponent; aAno, aControle, aRequisitante : Integer) : Boolean;
var
  AForm : TViewRequisicaoAlmoxOrdemSaida;
begin
  AForm := TViewRequisicaoAlmoxOrdemSaida.Create(AOwner);
  try
    AForm.CarregarDados(aAno, aControle, aRequisitante);
    Result := (AForm.ShowModal = mrOk);
  finally
    AForm.DisposeOf;
  end;
end;

procedure TViewRequisicaoAlmoxOrdemSaida.btnCancelarClick(Sender: TObject);
begin
  if (dtsRequisicao.DataSet.State = TDataSetState.dsEdit) then
    dtsRequisicao.DataSet.Cancel;

  ModalResult := mrCancel;
end;

procedure TViewRequisicaoAlmoxOrdemSaida.btnConfirmarClick(Sender: TObject);
begin
  if (dtsRequisicao.DataSet.State = TDataSetState.dsEdit) then
  begin
    dtsRequisicao.DataSet.Post;

    Requisicao.DAO.ApplyUpdates;
    Requisicao.DAO.CommitUpdates;
    Requisicao.DAO.CommitTransaction;
  end;

  ModalResult := mrOk;
end;

procedure TViewRequisicaoAlmoxOrdemSaida.CarregarDados(aAno, aControle, aRequisitante: Integer);
begin
  // Carregar dados do Centro de Custo Requisitante
  Requisitante.Carregar(aRequisitante);

  edRequisitante.Tag  := Requisitante.DAO.DataSet.FieldByName('codigo').AsInteger;
  edRequisitante.Text := Requisitante.DAO.DataSet.FieldByName('descricao').AsString;

  edCliente.Tag  := Requisitante.DAO.DataSet.FieldByName('codcliente').AsInteger;
  edCliente.Text := Requisitante.DAO.DataSet.FieldByName('nome').AsString;

  if TServicesUtils.StrIsCNPJ(Requisitante.DAO.DataSet.FieldByName('cnpj').AsString) then
    edCNPJ.Text := TServicesUtils.StrFormatarCnpj(Requisitante.DAO.DataSet.FieldByName('cnpj').AsString)
  else
  if TServicesUtils.StrIsCPF(Requisitante.DAO.DataSet.FieldByName('cnpj').AsString) then
    edCNPJ.Text := TServicesUtils.StrFormatarCpf(Requisitante.DAO.DataSet.FieldByName('cnpj').AsString);

  // Carregar dados da Requisição
  Requisicao.Carregar(aAno, aControle);
  edControle.Text := aAno.ToString + '/' + FormatFloat('###00000', aControle);

  if (not dtsRequisicao.DataSet.IsEmpty) then
    dtsRequisicao.DataSet.Edit;
end;

procedure TViewRequisicaoAlmoxOrdemSaida.dbVeiculoButtonClick(Sender: TObject);
begin
  TServiceMessage.ShowInformation('Este recurso ainda não está disponível nesta versão');
end;

procedure TViewRequisicaoAlmoxOrdemSaida.RegistrarRotinaSistema;
begin
  ;
end;

function TViewRequisicaoAlmoxOrdemSaida.Requisicao: IControllerRequisicaoAlmoxarifado;
begin
  if not Assigned(FRequisicao) then
  begin
    FRequisicao := TControllerFactory.New.RequisicaoAlmoxarifado;
    dtsRequisicao.DataSet := FRequisicao.DAO.DataSet;
  end;

  Result := (FRequisicao as IControllerRequisicaoAlmoxarifado);
end;

function TViewRequisicaoAlmoxOrdemSaida.Requisitante: IControllerCentroCusto;
begin
  if not Assigned(FRequisitante) then
    FRequisitante := TControllerFactory.New.CentroCusto;

  Result := (FRequisitante as IControllerCentroCusto);
end;

function TViewRequisicaoAlmoxOrdemSaida.UsuarioLogado: IUsuarioModel;
begin
  Result := Requisicao.DAO.Usuario;
end;

end.
