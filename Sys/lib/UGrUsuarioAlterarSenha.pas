unit UGrUsuarioAlterarSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UGrPadrao, Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, IBCustomDataSet, Buttons,
  IBUpdateSQL, DBClient;

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
    btbtnSalvar: TBitBtn;
    tblUsersNOME: TIBStringField;
    tblUsersSENHA: TIBStringField;
    tblUsersNOMECOMPLETO: TIBStringField;
    tblUsersCODFUNCAO: TSmallintField;
    tblUsersLIMIDESC: TIBBCDField;
    btbtnFechar: TBitBtn;
    BvlBotoes: TBevel;
    tblUsersSENHA_ATUAL: TIBStringField;
    tblUsersSENHA_NOVA: TIBStringField;
    tblUsersSENHA_CONFIRMAR: TIBStringField;
    dbSenhaConfirmar: TDBEdit;
    updUsers: TIBUpdateSQL;
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

uses UDMBusiness, UGrCampoRequisitado;

{$R *.dfm}

procedure TfrmGrUsuarioAlterarSenha.btbtnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGrUsuarioAlterarSenha.btbtnSalvarClick(Sender: TObject);
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
    if ( AnsiCompareStr(tblUsersSENHA.AsString, tblUsersSENHA_ATUAL.AsString) <> 0  ) then
      ShowWarning('Senha atual inválida!')
    else
    if ( AnsiCompareStr(tblUsersSENHA.AsString, tblUsersSENHA_NOVA.AsString) = 0  ) then
      ShowWarning('Nova Senha não pode ser igual a senha atual!')
    else
    if ( AnsiCompareStr(tblUsersSENHA_NOVA.AsString, tblUsersSENHA_CONFIRMAR.AsString) <> 0  ) then
      ShowWarning('Nova Senha não confirmada!')
    else
    begin
      tblUsersSENHA.AsString := tblUsersSENHA_NOVA.AsString;
      
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
  if tblUsersNOME.AsString <> GetUserApp then
    tblUsers.Close
  else
    tblUsers.Edit;
end;

procedure TfrmGrUsuarioAlterarSenha.FormCreate(Sender: TObject);
begin
  inherited;
  tblUsers.Close;
  tblUsers.ParamByName('nome').AsString := GetUserApp;
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
