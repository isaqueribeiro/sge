unit UGrMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, StdCtrls, cxButtons, ExtCtrls, ToolWin, ComCtrls, dxSkinsCore,
  dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGrMemo = class(TfrmGrPadrao)
    Bevel1: TBevel;
    Bevel3: TBevel;
    edObservacao: TMemo;
    tlbBotoes: TPanel;
    Bevel2: TBevel;
    BtnConfirmar: TcxButton;
    bvlTool4: TBevel;
    BtnCancelar: TcxButton;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function SetMemoObservacao(const AOnwer : TComponent; var sObservacao : TStringList) : Boolean;
  function SetMemoMotivo(const AOnwer : TComponent; var sMotivo : TStringList) : Boolean;
  function SetDadosEntrega(const AOnwer : TComponent; var sDadosEntrega : TStringList) : Boolean;

implementation

uses
  UDMBusiness;

{$R *.dfm}

function SetMemoObservacao(const AOnwer : TComponent; var sObservacao : TStringList) : Boolean;
var
  AForm : TfrmGrMemo;
begin
  AForm := TfrmGrMemo.Create(AOnwer);
  try
    AForm.Caption := 'Observações:';
    AForm.edObservacao.Clear;
    AForm.edObservacao.Lines.AddStrings( sObservacao );

    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      sObservacao.Clear;
      sObservacao.AddStrings( AForm.edObservacao.Lines );
    end;
  finally
    AForm.Free;
  end;
end;

function SetMemoMotivo(const AOnwer : TComponent; var sMotivo : TStringList) : Boolean;
var
  AForm : TfrmGrMemo;
begin
  AForm := TfrmGrMemo.Create(AOnwer);
  try
    AForm.Caption := 'Motivo:';
    AForm.edObservacao.Clear;
    AForm.edObservacao.Lines.AddStrings( sMotivo );

    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      sMotivo.Clear;
      sMotivo.AddStrings( AForm.edObservacao.Lines );
    end;
  finally
    AForm.Free;
  end;
end;

function SetDadosEntrega(const AOnwer : TComponent; var sDadosEntrega : TStringList) : Boolean;
var
  AForm : TfrmGrMemo;
begin
  AForm := TfrmGrMemo.Create(AOnwer);
  try
    AForm.Caption := 'Dados de Entrega:';
    AForm.edObservacao.Clear;
    AForm.edObservacao.MaxLength := 1024;
    AForm.edObservacao.Lines.AddStrings( sDadosEntrega );
    AForm.edObservacao.Font.Name := 'Lucida Console';

    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      sDadosEntrega.Clear;
      sDadosEntrega.AddStrings( AForm.edObservacao.Lines );
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGrMemo.BtnConfirmarClick(Sender: TObject);
begin
  if ( Length(Trim(edObservacao.Lines.Text)) < 15 ) then
    ShowWarning('Favor informar texto com, no mínimo, 15 caracteres!')
  else
    ModalResult := mrOk;  
end;

procedure TfrmGrMemo.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGrMemo.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
