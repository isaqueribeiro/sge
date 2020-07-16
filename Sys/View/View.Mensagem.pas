unit View.Mensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UGrPadrao,
  ExtCtrls, StdCtrls, Buttons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  dxSkinsCore;

type
  TFrmMensagem = class(TfrmGrPadrao)
    ImgAlerta: TImage;
    memoMensagem: TMemo;
    ImgInforme: TImage;
    ImgErro: TImage;
    ImgConsulta: TImage;
    btnOk: TcxButton;
    btnSim: TcxButton;
    btnNao: TcxButton;
    shpColorPDV: TShape;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  strict private
    class var _instance : TFrmMensagem;
  private
    { Private declarations }
  protected
    constructor Create(AOnwer: TComponent);
  public
    { Public declarations }
    procedure Informe(sTitulo, sMensagem : String);
    procedure Alerta(sTitulo, sMensagem : String);
    procedure Erro(sTitulo, sMensagem : String);
    procedure Parar(sTitulo, sMensagem : String);
    procedure Confirmar(sTitulo, sMensagem : String);

    procedure RegistrarRotinaSistema; override;

    class function GetInstance(AOnwer : TComponent) : TFrmMensagem;
  end;

implementation

uses
  UConstantesDGE;

{$R *.dfm}

{ TfrmGeMessage }

class function TFrmMensagem.GetInstance(AOnwer: TComponent): TFrmMensagem;
begin
  if not Assigned(_instance) then
    _instance := TFrmMensagem.Create(AOnwer);

  Result := _instance;
end;

procedure TFrmMensagem.Alerta(sTitulo, sMensagem: String);
begin
  Caption := sTitulo;
  memoMensagem.Lines.Text := sMensagem;

  ImgAlerta.Visible := True;

  btnOk.Visible  := True;
  btnSim.Visible := False;
  btnNao.Visible := False;

  MessageBeep(MB_ICONWARNING);
end;

procedure TFrmMensagem.Confirmar(sTitulo, sMensagem: String);
begin
  Caption := sTitulo;
  memoMensagem.Lines.Text := sMensagem;

  ImgConsulta.Visible := True;

  btnOk.Visible  := False;
  btnSim.Visible := True;
  btnNao.Visible := True;

  Self.ActiveControl := btnNao;

  MessageBeep(MB_ICONQUESTION);
end;

constructor TFrmMensagem.Create(AOnwer: TComponent);
begin
  inherited Create(AOnwer);
end;

procedure TFrmMensagem.Erro(sTitulo, sMensagem: String);
begin
  Caption := sTitulo;
  memoMensagem.Lines.Text := sMensagem;

  ImgErro.Visible := True;

  btnOk.Visible  := True;
  btnSim.Visible := False;
  btnNao.Visible := False;

  MessageBeep(MB_ICONERROR);
end;

procedure TFrmMensagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action    := TCloseAction.caFree;
  _instance := nil;
end;

procedure TFrmMensagem.FormShow(Sender: TObject);
begin
  inherited;
  Self.Color := shpColorPDV.Brush.Color;
  memoMensagem.Color := shpColorPDV.Brush.Color;
end;

procedure TFrmMensagem.Informe(sTitulo, sMensagem: String);
begin
  Caption := sTitulo;
  memoMensagem.Lines.Text := sMensagem;

  ImgInforme.Visible := True;

  btnOk.Visible  := True;
  btnSim.Visible := False;
  btnNao.Visible := False;

  MessageBeep(MB_ICONINFORMATION);
end;

procedure TFrmMensagem.Parar(sTitulo, sMensagem: String);
begin
  Caption := sTitulo;
  memoMensagem.Lines.Text := sMensagem;

  ImgErro.Visible := True;

  btnOk.Visible  := True;
  btnSim.Visible := False;
  btnNao.Visible := False;

  MessageBeep(MB_ICONSTOP);
end;

procedure TFrmMensagem.RegistrarRotinaSistema;
begin
  ;
end;

end.
