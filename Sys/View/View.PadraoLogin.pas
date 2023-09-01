unit View.PadraoLogin;

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
  Vcl.Buttons,
  Vcl.ExtCtrls,

  Interacao.Factory,
  Interacao.Usuario,
  Interacao.Empresa,
  View.PadraoAbertura;

type
  // Injetando novos métodos em uma classe existente
  TEditHelper = class Helper for TEdit
    private
    public
      function getText() : String;
  end;

  TFrmPadraoLogin = class(TFrmPadraoAbertura)
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    lblEmpresa: TLabel;
    cmbEmpresa: TComboBox;
    btnEntrar: TButton;procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FController: IUsuario;
    FEmpresa   : IEmpresa;
    shpUsuario : TShape;

    procedure Destacar(const aDestaque : Boolean);
    procedure SetController(const Value: IUsuario);
    procedure CarregarEmpresa; virtual;
    procedure SelecionarEmpresa;

    function Autenticar : Boolean; virtual;
  public
    { Public declarations }
    property Controller : IUsuario read FController write SetController;
  end;

var
  FrmPadraoLogin: TFrmPadraoLogin;

implementation

{$R *.dfm}

Uses
  Service.Utils,
  Classe.Empresa,
  Controller.Factory,
  UDMBusiness;

function TFrmPadraoLogin.Autenticar: Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;

  try
    if (cmbEmpresa.ItemIndex > -1) then
      try
        aRetorno := FController
          .Load(DMBusiness.fdConexao, edtUsuario.Text)
          .Autenticar(nil
            , edtUsuario.getText()
            , edtSenha.getText()
            , cmbEmpresa.Items.Objects[cmbEmpresa.ItemIndex]);

        if not aRetorno then
          MessageDlg('Usuário e/ou senha inválido!', TMsgDlgType.mtInformation, [mbOK], 0);
      except
        On E : Exception do
        begin
          MessageDlg(PChar(E.Message), TMsgDlgType.mtError, [mbOK], 0);
          Result := False;
        end;
      end;
  finally
    Result := aRetorno;
  end;
end;

procedure TFrmPadraoLogin.btnEntrarClick(Sender: TObject);
begin
  Destacar(True);

  if Autenticar then
  begin
    gUsuarioLogado := TFactoryController.getInstance().getUsuarioController();
    ModalResult    := mrOk;
  end;
end;

procedure TFrmPadraoLogin.CarregarEmpresa;
begin
  FEmpresa.ListarEmpresas(DMBusiness.fdConexao, cmbEmpresa.Items);
end;

procedure TFrmPadraoLogin.Destacar(const aDestaque: Boolean);
var
  aUsuario ,
  aSenha   : String;
begin
  aUsuario := edtUsuario.Text;
  aSenha   := edtSenha.Text;

  lblUsuario.Font.Color := $000E4C28;
  lblSenha.Font.Color   := $000E4C28;
  lblEmpresa.Font.Color := $000E4C28;

  if aDestaque then
  begin
    if (aUsuario.Trim() = EmptyStr) then lblUsuario.Font.Color := clRed;
    if (aSenha.Trim() = EmptyStr) then lblSenha.Font.Color := clRed;
    if (cmbEmpresa.ItemIndex < 0) then lblEmpresa.Font.Color := clRed;
  end;
end;

procedure TFrmPadraoLogin.FormActivate(Sender: TObject);
begin
  inherited;
  edtUsuario.SetFocus;
end;

procedure TFrmPadraoLogin.FormCreate(Sender: TObject);
var
  aFactory : IFactory;
begin
  CriarMoldura := True;
  CriarLinhasInferiores := False;

  inherited;

  ReportMemoryLeaksOnShutdown := DelphiIsRunning; // Notificar vazamento de memória

  aFactory := TFactoryController.getInstance();
  try
    FController := aFactory.getUsuarioController();
    FEmpresa    := aFactory.getEmpresaController();

    CarregarEmpresa;
  except
    ;
  end;
end;

procedure TFrmPadraoLogin.FormDestroy(Sender: TObject);
var
  I : Integer;
begin
  // Destruit objetos Empresa
  for I := 0 to cmbEmpresa.Items.Count - 1 do
    TObject(cmbEmpresa.Items.Objects[I]).DisposeOf;
end;

procedure TFrmPadraoLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
end;

procedure TFrmPadraoLogin.FormShow(Sender: TObject);
begin
  inherited;

  Self.BringToFront;
  Self.Activate;

  {$IFDEF DEBUG}
  edtUsuario.Text := 'admin';
  edtSenha.Text   := 'Elohim';
  cmbEmpresa.ItemIndex := 0;
  {$ENDIF}

  SelecionarEmpresa;
end;

procedure TFrmPadraoLogin.SelecionarEmpresa;
var
  I : Integer;
begin
  for I := 0 to Pred(cmbEmpresa.Items.Count) do
  begin
    if (TEmpresaObject(cmbEmpresa.Items.Objects[I]).CNPJ = TServicesUtils.StrOnlyNumbers(Licenca.CNPJ)) then
    begin
      cmbEmpresa.ItemIndex := I;
      Break;
    end;
  end;
end;

procedure TFrmPadraoLogin.SetController(const Value: IUsuario);
begin
  FController := Value;
end;

{ TEditHelper }

function TEditHelper.getText: String;
var
  aTexto : String;
begin
  aTexto := Self.Text;
  Result := aTexto.Trim();
end;

end.
