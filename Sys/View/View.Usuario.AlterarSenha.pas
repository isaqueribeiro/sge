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
  SGE.Controller.Interfaces,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

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
    fdQryUser: TFDQuery;
    fdUpdUser: TFDUpdateSQL;
    fdQryUserNOME: TStringField;
    fdQryUserSENHA: TStringField;
    fdQryUserALTERAR_SENHA: TSmallintField;
    fdQryUserSENHA_ATUAL: TStringField;
    fdQryUserSENHA_NOVA: TStringField;
    fdQryUserSENHA_CONFIRMAR: TStringField;
    procedure btbtnFecharClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
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

var
  ViewUsuarioAlterarSenha: TViewUsuarioAlterarSenha;

implementation

uses
  UDMBusiness, UGrCampoRequisitado, UDMRecursos, View.Usuario;

{$R *.dfm}

procedure TViewUsuarioAlterarSenha.btbtnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewUsuarioAlterarSenha.btbtnSalvarClick(Sender: TObject);

  function SenhaValida(const Senha : String) : Boolean;
  begin
    Result := (AnsiCompareStr(fdQryUserSENHA.AsString, Senha) = 0)
      or (AnsiCompareStr(fdQryUserSENHA.AsString, GetSenhaFormatada(Senha, False)) = 0);
  end;

var
  sSenha : String;
begin
  if fdQryUser.State <> dsEdit then
    fdQryUser.Edit;

  if Trim(fdQryUserSENHA_ATUAL.AsString) = EmptyStr then
    fdQryUserSENHA_ATUAL.Clear;

  if Trim(fdQryUserSENHA_NOVA.AsString) = EmptyStr then
    fdQryUserSENHA_NOVA.Clear;

  if Trim(fdQryUserSENHA_CONFIRMAR.AsString) = EmptyStr then
    fdQryUserSENHA_CONFIRMAR.Clear;

  if not CamposRequiridos(Self, TClientDataSet(dtsUsers.DataSet), 'Alterar Senha') then
  begin
    if ( not SenhaValida(fdQryUserSENHA_ATUAL.AsString)  ) then
      ShowWarning('Senha atual inválida!')
    else
    if ( SenhaValida(fdQryUserSENHA_NOVA.AsString)  ) then
      ShowWarning('Nova Senha não pode ser igual a senha atual!')
    else
    if ( AnsiCompareStr(fdQryUserSENHA_NOVA.AsString, fdQryUserSENHA_CONFIRMAR.AsString) <> 0  ) then
      ShowWarning('Nova Senha não confirmada!')
    else
    begin
      fdQryUserALTERAR_SENHA.AsInteger := 0; // Não
      fdQryUserSENHA.AsString          := GetSenhaFormatada(fdQryUserSENHA_NOVA.AsString, False);

      fdQryUser.Post;
      fdQryUser.ApplyUpdates;
      CommitTransaction;

      ShowInformation('Senha do usuário ' + QuotedStr(fdQryUserNOME.AsString) + ' alterada com sucesso!');

      ModalResult := mrOk;
    end;
  end;
end;

procedure TViewUsuarioAlterarSenha.FormShow(Sender: TObject);
begin
  if ( fdQryUserNOME.AsString <> gUsuarioLogado.Login ) then
    fdQryUser.Close
  else
    fdQryUser.Edit;
end;

procedure TViewUsuarioAlterarSenha.FormCreate(Sender: TObject);
begin
  inherited;
  fdQryUser.Close;
  fdQryUser.ParamByName('nome').AsString := gUsuarioLogado.Login;
  fdQryUser.Open;
end;

procedure TViewUsuarioAlterarSenha.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  ;
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
