unit UGrUsuarioAlterarSenha_v2;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, Buttons, DBClient, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGrUsuarioAlterarSenha = class(TfrmGrPadrao)
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
  frmGrUsuarioAlterarSenha: TfrmGrUsuarioAlterarSenha;

implementation

uses
  UDMBusiness, UGrCampoRequisitado, UDMRecursos, View.Usuario;

{$R *.dfm}

procedure TfrmGrUsuarioAlterarSenha.btbtnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGrUsuarioAlterarSenha.btbtnSalvarClick(Sender: TObject);

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

procedure TfrmGrUsuarioAlterarSenha.FormShow(Sender: TObject);
begin
  if ( fdQryUserNOME.AsString <> gUsuarioLogado.Login ) then
    fdQryUser.Close
  else
    fdQryUser.Edit;
end;

procedure TfrmGrUsuarioAlterarSenha.FormCreate(Sender: TObject);
begin
  inherited;
  fdQryUser.Close;
  fdQryUser.ParamByName('nome').AsString := gUsuarioLogado.Login;
  fdQryUser.Open;
end;

procedure TfrmGrUsuarioAlterarSenha.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  ;
end;

procedure TfrmGrUsuarioAlterarSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmGrUsuarioAlterarSenha.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGrUsuarioAlterarSenha', TfrmGrUsuarioAlterarSenha);

end.
