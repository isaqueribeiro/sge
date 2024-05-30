unit View.Servico.ConsultarCNPJ;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Mask,
  Vcl.Menus,
  Vcl.Imaging.jpeg,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,

  dxSkinsCore,
  dxSkinOffice2019Black,
  dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray,
  dxSkinOffice2019White,
  dxSkinsDefaultPainters,

  Service.Request.CNPJ;

type
  TViewServicoConsultarCNPJ = class(TForm)
    pnlBody: TPanel;
    lblRazaoSocial: TLabel;
    lblAbertura: TLabel;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    lblCEP: TLabel;
    lblSituacao: TLabel;
    edRazaoSocial: TEdit;
    edAbertura: TEdit;
    edEndereco: TEdit;
    edNumero: TEdit;
    edComplemento: TEdit;
    edBairro: TEdit;
    edCidade: TEdit;
    edUF: TEdit;
    edCEP: TEdit;
    edSituacao: TEdit;
    pnlFind: TPanel;
    lblCNPJ: TLabel;
    edFantasia: TEdit;
    lblFantasia: TLabel;
    edCNPJ: TMaskEdit;
    btnBuscar: TcxButton;
    lblCNAE: TLabel;
    lblCNAEList: TLabel;
    ltCNAE: TListBox;
    edCNAE: TEdit;
    lblExecutando: TLabel;
    pnlFooter: TPanel;
    bvlFooter: TBevel;
    btnFechar: TcxButton;
    btnConfirmar: TcxButton;
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnFecharClick(Sender: TObject);
    procedure edCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FCliente  : TPessoaJuridica;
    FService : TServiceRequestCNPJ;
    procedure LabelTransparente;
    procedure BuscarCNPJ(aRetorno : TPessoaJuridica);
  public
    { Public declarations }
  end;

  function SelecionarCNPJ(const AOwner : TComponent; var Cliente : TPessoaJuridica) : Boolean;

implementation

uses
  Service.Message,
  Service.Utils,
  Service.Format.VCL,
  UDMRecursos;

{$R *.dfm}

function SelecionarCNPJ(const AOwner : TComponent; var Cliente : TPessoaJuridica) : Boolean;
var
  AForm : TViewServicoConsultarCNPJ;
begin
  AForm := TViewServicoConsultarCNPJ.Create(AOwner);
  try
    AForm.edCNPJ.Text := TServiceFormat.Mask('##.###.###/####-##', Cliente.CNPJ);
    AForm.btnConfirmar.Visible := True;
    Result := (AForm.ShowModal = mrOk);

    if Result then
      Cliente := AForm.FCliente;
  finally
    AForm.Destroy;
  end;
end;

procedure TViewServicoConsultarCNPJ.btnBuscarClick(Sender: TObject);
var
  aCnpj : String;
begin
  aCnpj := TServicesUtils.StrOnlyNumbers(edCNPJ.Text);
  if aCnpj.IsEmpty then
    TServiceMessage.ShowWarning('Informe o CNPJ para consulta!')
  else
  if (not TServicesUtils.StrIsCNPJ(aCnpj)) then
    TServiceMessage.ShowWarning('O número de CNPJ informado é inválido!')
  else
  begin
    lblExecutando.Visible := True;
    FService.Consultar(aCnpj, BuscarCNPJ);
  end;
end;

procedure TViewServicoConsultarCNPJ.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TViewServicoConsultarCNPJ.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewServicoConsultarCNPJ.BuscarCNPJ(aRetorno: TPessoaJuridica);
begin
  lblExecutando.Visible := False;

  if FService.Error.IsEmpty then
  begin
    FCliente := aRetorno;

    // Identificação
    edRazaoSocial.Text := aRetorno.RazaoSocial;
    edFantasia.Text    := aRetorno.Fantasia;
    edAbertura.Text    := aRetorno.DataAbertura;
    edCNAE.Text     := aRetorno.Cnae.Codigo + ' - ' + aRetorno.Cnae.Descricao;
    edSituacao.Text := aRetorno.Status;

    // Endereço
    edEndereco.Text := Trim(aRetorno.Endereco.Tipo + ' ' + aRetorno.Endereco.Logradouro);
    edNumero.Text   := aRetorno.Endereco.Numero;
    edComplemento.Text := aRetorno.Endereco.Complemento;
    edBairro.Text := aRetorno.Endereco.Bairro;
    edCidade.Text := aRetorno.Endereco.Municipio;
    edUF.Text  := aRetorno.Endereco.UF;
    edCEP.Text := TServiceFormat.Mask('##.###-###', TServicesUtils.StrOnlyNumbers(aRetorno.Endereco.CEP));
  end
  else
    TServiceMessage.ShowError(FService.Error);
end;

procedure TViewServicoConsultarCNPJ.edCNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    btnBuscar.SetFocus;
  end;
end;

procedure TViewServicoConsultarCNPJ.FormShow(Sender: TObject);
begin
  LabelTransparente;
end;

procedure TfrViewServicoConsultarCNPJabAtualizarCaptchaClick(Sender: TObject);
begin
end;

procedure TViewServicoConsultarCNPJ.labelTransparente;
var
  I : Integer;
begin
  for I := 0 to Pred(Self.ComponentCount) do
    if (Components[I] is TLabel) then
    begin
      TLabel(Components[I]).Transparent := False;
      TLabel(Components[I]).Transparent := True;
    end;
end;

procedure TfrViewServicoConsultarCNPJmrCaptchaTimer(Sender: TObject);
begin
end;

procedure TViewServicoConsultarCNPJ.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not lblExecutando.Visible;
end;

procedure TViewServicoConsultarCNPJ.FormCreate(Sender: TObject);
begin
  FService := TServiceRequestCNPJ.Create;
end;

procedure TViewServicoConsultarCNPJ.FormDestroy(Sender: TObject);
begin
  FService.Free;
end;

initialization
  FormFunction.RegisterForm('ViewServicoConsultarCNPJ', TViewServicoConsultarCNPJ);

end.
