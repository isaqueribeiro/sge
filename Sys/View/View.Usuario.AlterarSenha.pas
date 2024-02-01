unit View.Usuario.AlterarSenha;

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

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsDefaultPainters,
  dxSkinsCore,

  UObserverInterface,
  UConstantesDGE,
  UGrPadrao,
  SGE.Controller.Interfaces, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White;

type
  TViewUsuarioAlterarSenha = class(TfrmGrPadrao)
    Panel1: TPanel;
    dbNome: TDBEdit;
    lblNome: TLabel;
    lblSenhaNova: TLabel;
    dbSenhaAtual: TDBEdit;
    lblSenhaConfirmar: TLabel;
    lblSenhaAtual: TLabel;
    dbSenhaNova: TDBEdit;
    dtsUsers: TDataSource;
    pnlBotoes: TPanel;
    BvlBotoes: TBevel;
    dbSenhaConfirmar: TDBEdit;
    btbtnSalvar: TcxButton;
    btbtnFechar: TcxButton;
    procedure btbtnFecharClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FControllerUsuario  : IControllerUsuario;

    procedure CarregarUsuario;
    function Controller : IControllerUsuario;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBUSERS

  Views:

  Procedures:

*)

implementation

uses
  UDMRecursos,
  Service.Message,
  Controller.Tabela,
  SGE.Controller.Factory,
  View.CampoRequisitado;

{$R *.dfm}

procedure TViewUsuarioAlterarSenha.btbtnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewUsuarioAlterarSenha.btbtnSalvarClick(Sender: TObject);
var
  aNome  ,
  aSenha : String;
begin
  if (dtsUsers.DataSet.State = TDataSetState.dsEdit) then
  begin
    aNome  := dtsUsers.DataSet.FieldByName('NOME').AsString;
    aSenha := dtsUsers.DataSet.FieldByName('SENHA').AsString;

    if Trim(dtsUsers.DataSet.FieldByName('SENHA_ATUAL').AsString).IsEmpty then
      dtsUsers.DataSet.FieldByName('SENHA_ATUAL').Clear;

    if Trim(dtsUsers.DataSet.FieldByName('SENHA_NOVA').AsString).IsEmpty then
      dtsUsers.DataSet.FieldByName('SENHA_NOVA').Clear;

    if Trim(dtsUsers.DataSet.FieldByName('SENHA_CONFIRMAR').AsString).IsEmpty then
      dtsUsers.DataSet.FieldByName('SENHA_CONFIRMAR').Clear;

    if (not CamposRequiridos(Self, TClientDataSet(dtsUsers.DataSet), 'Alterar Senha')) then
    begin
      Controller.SalvarNovaSenha;

      if (aSenha <> dtsUsers.DataSet.FieldByName('SENHA').AsString) then
      begin
        TServiceMessage.ShowInformation('Senha do usuário ' + aNome.QuotedString + ' alterada com sucesso!');
        ModalResult := mrOk;
      end;
    end;
  end;
end;

procedure TViewUsuarioAlterarSenha.CarregarUsuario;
begin
  Controller.Carregar(Controller.DAO.Usuario.Login);
  dtsUsers.DataSet := Controller.DAO.DataSet;

  // Configurar tabela dos itens
  TTabelaController
    .New
    .Tabela( dtsUsers.DataSet )
    .Display('senha_atual', 'Senha atual', True)
    .Display('senha_nova',  'Nova senha', True)
    .Display('senha_confirmar', 'Confirmação da nova senha', True)
    .Configurar;
end;

function TViewUsuarioAlterarSenha.Controller: IControllerUsuario;
begin
  if not Assigned(FControllerUsuario) then
    FControllerUsuario := TControllerFactory.New.Usuario;

  Result := FControllerUsuario;
end;

procedure TViewUsuarioAlterarSenha.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarUsuario;
end;

procedure TViewUsuarioAlterarSenha.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  ;
end;

procedure TViewUsuarioAlterarSenha.FormActivate(Sender: TObject);
begin
  if (not dtsUsers.DataSet.IsEmpty) then
  begin
    dtsUsers.DataSet.Edit;

    if dbSenhaAtual.Visible and dbSenhaAtual.Enabled then
      dbSenhaAtual.SetFocus;
  end;
end;

procedure TViewUsuarioAlterarSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TViewUsuarioAlterarSenha.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('ViewUsuarioAlterarSenha', TViewUsuarioAlterarSenha);

end.
