unit UGrUsuarioAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, ExtCtrls, Buttons, DB, dxGDIPlusClasses;

type
  TfrmGrUsuarioAcesso = class(TfrmGrPadrao)
    lblNome: TLabel;
    lblSenha: TLabel;
    imgLogo: TImage;
    edNome: TEdit;
    edSenha: TEdit;
    pnlMensagem: TPanel;
    Bevel1: TBevel;
    btbtnEntrar: TBitBtn;
    procedure btbtnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGrUsuarioAcesso: TfrmGrUsuarioAcesso;

implementation

uses
  UPrinc, UDMBusiness, UGrUsuario;

var Contador : Integer;

{$R *.dfm}

procedure TfrmGrUsuarioAcesso.btbtnEntrarClick(Sender: TObject);
var
  vSenha : TStringField;
  sSenha : String;
begin
  inherited;

  if not DMBusiness.ibdtstUsers.Active then
    DMBusiness.ibdtstUsers.Open;
    
  if not DMBusiness.ibdtstUsers.Locate('NOME', Trim(edNome.Text), []) then
  begin
    pnlMensagem.Caption:='Entrada recusada ... USUÁRIO DESCONHECIDO!';
    inc(Contador);

    if contador = 3 then
      frmPrinc.close;

    edNome.setfocus;
    Exit;
  end;

  vSenha := DMBusiness.ibdtstUsersSENHA as TStringField;
  sSenha := GetSenhaFormatada(edSenha.Text);

  if (vSenha.Value = edSenha.Text) or (vSenha.Value = sSenha) then
  begin
    frmPrinc.Enabled := True;
    frmPrinc.stbMain.Panels[1].Text := AnsiLowerCase(edNome.Text + '@' + DMBusiness.ibdtbsBusiness.DatabaseName);

    Release;
  end
  else
  begin

    pnlMensagem.Caption := 'Entrada recusada ... SENHA INVÁLIDA!';
    inc(Contador);

    if Contador = 3 then
      frmPrinc.close;

    edSenha.setfocus;
    Exit;

  end;
end;

procedure TfrmGrUsuarioAcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmGrUsuarioAcesso.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btbtnEntrarClick(Sender);
end;

procedure TfrmGrUsuarioAcesso.FormShow(Sender: TObject);
begin
  inherited;
  if ( DelphiIsRunning ) then
  begin
    edNome.Text  := 'ISAQUE';
    edSenha.Text := '123x';

    btbtnEntrar.Click;
  end;
end;

procedure TfrmGrUsuarioAcesso.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGrUsuarioAcesso', TfrmGrUsuarioAcesso);

end.
