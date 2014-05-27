unit UfrmAcessoSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, ExtCtrls, Buttons, DB;

type
  TfrmAcessoSistema = class(TfrmGrPadrao)
    lblNome: TLabel;
    lblSenha: TLabel;
    imgLogo: TImage;
    edNome: TEdit;
    edSenha: TEdit;
    pnlMensagem: TPanel;
    Bevel1: TBevel;
    btbtnEntrar: TBitBtn;
    procedure edNomeExit(Sender: TObject);
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
  frmAcessoSistema: TfrmAcessoSistema;

implementation

uses UPrinc, UDMBusiness;

var Contador : Integer;

{$R *.dfm}

procedure TfrmAcessoSistema.edNomeExit(Sender: TObject);
begin
  inherited;
  pnlMensagem.Caption := EmptyStr;
end;

procedure TfrmAcessoSistema.btbtnEntrarClick(Sender: TObject);
var
  vSenha : TStringField;
begin
  inherited;

  if not DMBusiness.ibdtstUsers.Locate('NOME',edNome.Text,[]) then
  begin
    pnlMensagem.Caption:='Entrada recusada ... USUÁRIO DESCONHECIDO!';
    inc(Contador);

    if contador = 3 then
      frmPrinc.close;

    edNome.setfocus;
    Exit;
  end;

  vSenha := DMBusiness.ibdtstUsersSENHA as tStringfield;

  if vSenha.Value<>edSenha.Text then
  begin
    pnlMensagem.Caption:='Entrada recusada ... SENHA INVÁLIDA!';
    inc(Contador);

    if Contador = 3 then
      frmPrinc.close;
      
    edSenha.setfocus;
    Exit;
  end;
  
  frmPrinc.Enabled := True;
  frmPrinc.stbMain.Panels[1].Text := 'Usuário: ' + edNome.Text;

  Release;
end;

procedure TfrmAcessoSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmAcessoSistema.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btbtnEntrarClick(Sender);
end;

procedure TfrmAcessoSistema.FormShow(Sender: TObject);
begin
  inherited;
  if ( DelphiIsRunning ) then
  begin
//    edNome.Text  := 'FERREIRA';
//    edSenha.Text := 'PONTOLUZ';
    edNome.Text  := 'VIEIRA';
    edSenha.Text := '12345';

    btbtnEntrar.Click;
  end;
end;

procedure TfrmAcessoSistema.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmAcessoSistema', TfrmAcessoSistema);

end.
