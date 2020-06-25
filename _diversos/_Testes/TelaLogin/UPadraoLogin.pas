unit UPadraoLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoAbertura, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,

  Interacao.Conexao, Interacao.Usuario;

type
  TFrmPadraoLogin = class(TFrmPadraoAbertura)
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    lblEmpresa: TLabel;
    cmbEmpresa: TComboBox;
    btnEntrar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
    FConexao   : IConexao;
    shpUsuario : TShape;
    FController: IUsuario;
    procedure Destacar(const aDestaque : Boolean);
    procedure SetController(const Value: IUsuario);

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
  Controller.Usuario, Classe.Conexao;

function TFrmPadraoLogin.Autenticar: Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;

  try
    try
      aRetorno := FController
        .Conexao(FConexao)
        .Load(edtUsuario.Text)
        .Autenticar(edtUsuario.Text, edtSenha.Text, cmbEmpresa.Text);
    except
      On E : Exception do
      begin
        Result := False;
        ShowMessage(E.Message);
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
    ModalResult := mrOk;
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
begin
  CriarMoldura := True;
  CriarLinhasInferiores := False;
  inherited;
  ReportMemoryLeaksOnShutdown := True; // Evitar vazamento de memória

  FConexao := TConexao
    .New
    .Configuracao( ExtractFilePath(ParamStr(0)) + 'Conexao.ini' );

  FController := TUsuarioController.Instance();
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
end;

procedure TFrmPadraoLogin.SetController(const Value: IUsuario);
begin
  FController := Value;
end;

end.
