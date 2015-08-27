unit UGrUsuarioAlterarSenha_v2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UGrPadrao, Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, IBCustomDataSet, Buttons,
  IBUpdateSQL, DBClient, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

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
    tblUsers: TIBDataSet;
    dtsUsers: TDataSource;
    pnlBotoes: TPanel;
    BvlBotoes: TBevel;
    dbSenhaConfirmar: TDBEdit;
    updUsers: TIBUpdateSQL;
    tblUsersNOME: TIBStringField;
    tblUsersSENHA: TIBStringField;
    tblUsersALTERAR_SENHA: TSmallintField;
    tblUsersSENHA_ATUAL: TIBStringField;
    tblUsersSENHA_NOVA: TIBStringField;
    tblUsersSENHA_CONFIRMAR: TIBStringField;
    btbtnSalvar: TcxButton;
    btbtnFechar: TcxButton;
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

var
  frmGrUsuarioAlterarSenha: TfrmGrUsuarioAlterarSenha;

implementation

uses
  UDMBusiness, UGrCampoRequisitado, UGrUsuario, UDMRecursos;

{$R *.dfm}

procedure TfrmGrUsuarioAlterarSenha.btbtnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGrUsuarioAlterarSenha.btbtnSalvarClick(Sender: TObject);

  function SenhaValida(const Senha : String) : Boolean;
  begin
    Result := (AnsiCompareStr(tblUsersSENHA.AsString, Senha) = 0)
      or (AnsiCompareStr(tblUsersSENHA.AsString, GetSenhaFormatada(Senha, False)) = 0);
  end;

var
  sSenha : String;
begin
  if tblUsers.State <> dsEdit then
    tblUsers.Edit;

  if Trim(tblUsersSENHA_ATUAL.AsString) = EmptyStr then
    tblUsersSENHA_ATUAL.Clear;

  if Trim(tblUsersSENHA_NOVA.AsString) = EmptyStr then
    tblUsersSENHA_NOVA.Clear;

  if Trim(tblUsersSENHA_CONFIRMAR.AsString) = EmptyStr then
    tblUsersSENHA_CONFIRMAR.Clear;

  if not CamposRequiridos(Self, tblUsers, 'Alterar Senha') then
  begin
    if ( not SenhaValida(tblUsersSENHA_ATUAL.AsString)  ) then
      ShowWarning('Senha atual inválida!')
    else
    if ( SenhaValida(tblUsersSENHA_NOVA.AsString)  ) then
      ShowWarning('Nova Senha não pode ser igual a senha atual!')
    else
    if ( AnsiCompareStr(tblUsersSENHA_NOVA.AsString, tblUsersSENHA_CONFIRMAR.AsString) <> 0  ) then
      ShowWarning('Nova Senha não confirmada!')
    else
    begin
      tblUsersALTERAR_SENHA.AsInteger := 0; // Não
      tblUsersSENHA.AsString          := GetSenhaFormatada(tblUsersSENHA_NOVA.AsString, False);

      tblUsers.Post;
      tblUsers.ApplyUpdates;
      CommitTransaction;

      ShowInformation('Senha do usuário ' + QuotedStr(tblUsersNOME.AsString) + ' alterada com sucesso!');

      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmGrUsuarioAlterarSenha.FormShow(Sender: TObject);
begin
  if ( tblUsersNOME.AsString <> gUsuarioLogado.Login ) then
    tblUsers.Close
  else
    tblUsers.Edit;
end;

procedure TfrmGrUsuarioAlterarSenha.FormCreate(Sender: TObject);
begin
  inherited;
  tblUsers.Close;
  tblUsers.ParamByName('nome').AsString := gUsuarioLogado.Login;
  tblUsers.Open;
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
