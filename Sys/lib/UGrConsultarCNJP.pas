unit UGrConsultarCNJP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ACBrBase, ACBrSocket, ACBrConsultaCNPJ, JPEG, Mask,
  UObserverInterface, UCliente;


type
  TfrmGrConsultarCNJP = class(TForm, IObservable)  // Observado
    pnlRetorno: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditTipo: TEdit;
    EditRazaoSocial: TEdit;
    EditAbertura: TEdit;
    EditEndereco: TEdit;
    EditNumero: TEdit;
    EditComplemento: TEdit;
    EditBairro: TEdit;
    EditCidade: TEdit;
    EditUF: TEdit;
    EditCEP: TEdit;
    EditSituacao: TEdit;
    pnlConsultar: TPanel;
    lblCNPJ: TLabel;
    edCaptcha: TEdit;
    lblCaptcha: TLabel;
    tmrCaptcha: TTimer;
    EditFantasia: TEdit;
    Label13: TLabel;
    ACBrConsultaCNPJ: TACBrConsultaCNPJ;
    edCNPJ: TMaskEdit;
    pnlCaptcha: TPanel;
    ImgCaptcha: TImage;
    LabAtualizarCaptcha: TLabel;
    ckRemoverEspacosDuplos: TCheckBox;
    BvlConsultar: TBevel;
    btnBuscar: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure tmrCaptchaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edCaptchaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FObservers: TInterfaceList;
    FCliente : TCliente;
  public
    { Public declarations }
    procedure addObserver(Observer: IObserver);
    procedure removeObserver(Observer: IObserver);
    procedure Notify; overload;
    procedure Notify(sMessage: string); overload;
  end;

  function SelecionarCNPJ(const AOwner : TComponent; var Cliente : TCliente) : Boolean;

implementation

uses
  UDMBusiness;

{$R *.dfm}

function SelecionarCNPJ(const AOwner : TComponent; var Cliente : TCliente) : Boolean;
var
  AForm : TfrmGrConsultarCNJP;
begin
  AForm := TfrmGrConsultarCNJP.Create(AOwner);
  try
    AForm.FCliente := Cliente;
    Result := (AForm.ShowModal = mrOk);

    if Result then
      Cliente := AForm.FCliente;
  finally
    AForm.Destroy;
  end;
end;

procedure TfrmGrConsultarCNJP.btnBuscarClick(Sender: TObject);
begin
  if Trim(edCaptcha.Text) <> EmptyStr then
  begin
    if ACBrConsultaCNPJ.Consulta(edCNPJ.Text, Trim(edCaptcha.Text), ckRemoverEspacosDuplos.Checked) then
    begin
      EditTipo.Text        := ACBrConsultaCNPJ.EmpresaTipo;
      EditRazaoSocial.Text := ACBrConsultaCNPJ.RazaoSocial;
      EditAbertura.Text    := DateToStr( ACBrConsultaCNPJ.Abertura );
      EditFantasia.Text    := ACBrConsultaCNPJ.Fantasia;
      EditEndereco.Text    := ACBrConsultaCNPJ.Endereco;
      EditNumero.Text      := ACBrConsultaCNPJ.Numero;
      EditComplemento.Text := ACBrConsultaCNPJ.Complemento;
      EditBairro.Text      := ACBrConsultaCNPJ.Bairro;
      EditComplemento.Text := ACBrConsultaCNPJ.Complemento;
      EditCidade.Text      := ACBrConsultaCNPJ.Cidade;
      EditUF.Text          := ACBrConsultaCNPJ.UF;
      EditCEP.Text         := ACBrConsultaCNPJ.CEP;
      EditSituacao.Text    := ACBrConsultaCNPJ.Situacao;
//
//      btnRecuperar.Enabled := True;
    end;
  end
  else
  begin
    ShowWarning('É necessário digitar o captcha.');
    edCaptcha.SetFocus;
//
//    btnRecuperar.Enabled := False;
  end;
end;

procedure TfrmGrConsultarCNJP.edCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnBuscarClick( btnBuscar );
end;

procedure TfrmGrConsultarCNJP.FormShow(Sender: TObject);
begin
  tmrCaptcha.Enabled := True;

  if Trim(FCliente.CpfCnpj) <> EmptyStr then
    edCNPJ.Text := StrFormatarCnpj(FCliente.CpfCnpj);
end;

procedure TfrmGrConsultarCNJP.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream : TMemoryStream;
  Jpg : TJPEGImage;
begin
  Stream := TMemoryStream.Create;
  Jpg    := TJPEGImage.Create;
  try
    ACBrConsultaCNPJ.Captcha(Stream);
    Jpg.LoadFromStream(Stream);
    ImgCaptcha.Picture.Assign(Jpg);

    edCaptcha.Clear;
    edCaptcha.SetFocus;
  finally
    Stream.Free;
    Jpg.Free;
  end;
end;

procedure TfrmGrConsultarCNJP.tmrCaptchaTimer(Sender: TObject);
begin
  tmrCaptcha.Enabled := False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
end;

procedure TfrmGrConsultarCNJP.FormCreate(Sender: TObject);
begin
  FObservers := TInterfaceList.Create;
  FCliente   := TCliente.GetInstance();
end;

procedure TfrmGrConsultarCNJP.addObserver(Observer: IObserver);
var
  I : Integer;
begin
  if (Observer = nil) then
    Exit;

  I := FObservers.IndexOf(Observer);
  if (I < 0) then
    FObservers.Add(Observer);
end;

procedure TfrmGrConsultarCNJP.Notify;
var
  I : Integer;
  Observer : IInterface;
begin
  for I := 0 to FObservers.Count - 1 do
  begin
    Observer := FObservers.Items[I];
    if ( Observer <> nil ) then
      IObserver(Observer).Update(Self);
  end;
end;

procedure TfrmGrConsultarCNJP.Notify(sMessage: string);
//var
//  I : Integer;
//  Observer: IInterface;
begin
  Self.Notify;
//  Self.FMessageBaseObject := sMessage;
//  for I := 0 to FObservers.Count - 1 do
//  begin
//    Observer := FObservers.Items[I];
//    IObserver(Observer).Update(Self, Self.FMessageBaseObject);
//  end;
end;

procedure TfrmGrConsultarCNJP.removeObserver(Observer: IObserver);
var
  I : Integer;
begin
  I := FObservers.IndexOf(Observer);
  if (I > - 1) then
    if ( Observer <> nil ) then
      FObservers.Remove(Observer);
end;

procedure TfrmGrConsultarCNJP.FormDestroy(Sender: TObject);
begin
  if ( FObservers <> nil ) then
    FreeAndNil(FObservers);
end;

initialization
  FormFunction.RegisterForm('frmGrConsultarCNJP', TfrmGrConsultarCNJP);

end.
