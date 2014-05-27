unit UGrConfigurarAmbiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, ComCtrls, IniFiles, DB,
  DBClient;

type
  TfrmGrConfigurarAmbiente = class(TfrmGrPadrao)
    PnlBotoes: TPanel;
    Bevel3: TBevel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    PgcConfiguracao: TPageControl;
    TbsGeral: TTabSheet;
    GrpBxPadrao: TGroupBox;
    lblPais: TLabel;
    edPais: TEdit;
    edPaisNome: TEdit;
    lblEstado: TLabel;
    edEstado: TEdit;
    edEstadoNome: TEdit;
    lblCidade: TLabel;
    edCidade: TEdit;
    edCidadeNome: TEdit;
    procedure ApenasNumerosKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CarregarDadosINI;
    procedure GravarDadosINI;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGrConfigurarAmbiente: TfrmGrConfigurarAmbiente;

implementation

uses UDMBusiness, UConstantesDGE, UFuncoes;

{$R *.dfm}

{ TfrmGrConfigurarAmbiente }

procedure TfrmGrConfigurarAmbiente.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGrConfigurarAmbiente.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGrConfigurarAmbiente.FormCreate(Sender: TObject);
begin
  inherited;
  PgcConfiguracao.ActivePage := TbsGeral;
end;

procedure TfrmGrConfigurarAmbiente.CarregarDadosINI;
begin
  edPais.Text   := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_PAIS,   INI_KEY_PAIS_VALUE);
  edEstado.Text := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_ESTADO, INI_KEY_ESTADO_VALUE);
  edCidade.Text := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_CIDADE, INI_KEY_CIDADE_VALUE);

  edPaisNome.Text   := GetPaisNomeDefault;
  edEstadoNome.Text := GetEstadoNome( StrToIntDef(edEstado.Text, 0) );
  edCidadeNome.Text := GetCidadeNome( StrToIntDef(edCidade.Text, 0) );
end;

procedure TfrmGrConfigurarAmbiente.FormShow(Sender: TObject);
begin
  inherited;
  CarregarDadosINI;
end;

procedure TfrmGrConfigurarAmbiente.GravarDadosINI;
begin
  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_PAIS,   edPais.Text);
  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_ESTADO, edEstado.Text);
  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_CIDADE, edCidade.Text);
end;

procedure TfrmGrConfigurarAmbiente.btnSalvarClick(Sender: TObject);
begin
  if ShowConfirm('Confirma a gravação das alterações informadas no ambinte de configuração da estação?', 'Salvar Configurações') then
  begin
    GravarDadosINI;
    ModalResult := mrOk;
  end;
end;

procedure TfrmGrConfigurarAmbiente.ApenasNumerosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #9, #13]) then
    Key := #0;
end;

procedure TfrmGrConfigurarAmbiente.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [VK_RETURN, VK_TAB] ) then
  begin
    if edEstado.Focused then
    begin
      edEstadoNome.Text := GetEstadoNome( StrToIntDef(edEstado.Text, 0) );
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else
    if edCidade.Focused then
    begin
      edCidadeNome.Text := GetCidadeNome( StrToIntDef(edCidade.Text, 0) );
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGrConfigurarAmbiente', TfrmGrConfigurarAmbiente);

end.
