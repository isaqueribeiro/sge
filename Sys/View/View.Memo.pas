unit View.Memo;

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
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ToolWin,
  Vcl.ComCtrls,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,

  dxSkinsCore,
  dxSkinsDefaultPainters,
  UGrPadrao;

type
  TViewMemo = class(TfrmGrPadrao)
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
  function SetEvento(const AOnwer : TComponent; var sEvento : TStringList) : Boolean;

implementation

uses
  Service.Message;

{$R *.dfm}

function SetMemoObservacao(const AOnwer : TComponent; var sObservacao : TStringList) : Boolean;
var
  AForm : TViewMemo;
begin
  AForm := TViewMemo.Create(AOnwer);
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
    AForm.DisposeOf;
  end;
end;

function SetMemoMotivo(const AOnwer : TComponent; var sMotivo : TStringList) : Boolean;
var
  AForm : TViewMemo;
begin
  AForm := TViewMemo.Create(AOnwer);
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
    AForm.DisposeOf;
  end;
end;

function SetDadosEntrega(const AOnwer : TComponent; var sDadosEntrega : TStringList) : Boolean;
var
  AForm : TViewMemo;
begin
  AForm := TViewMemo.Create(AOnwer);
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
    AForm.DisposeOf;
  end;
end;

function SetEvento(const AOnwer : TComponent; var sEvento : TStringList) : Boolean;
var
  AForm : TViewMemo;
begin
  AForm := TViewMemo.Create(AOnwer);
  try
    AForm.Caption := 'Histórico do Evento:';
    AForm.edObservacao.Clear;
    AForm.edObservacao.MaxLength := 1024;
    AForm.edObservacao.Lines.AddStrings( sEvento );
    AForm.edObservacao.Font.Name := 'Lucida Console';

    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      sEvento.Clear;
      sEvento.AddStrings( AForm.edObservacao.Lines );
    end;
  finally
    AForm.DisposeOf;
  end;
end;

procedure TViewMemo.BtnConfirmarClick(Sender: TObject);
begin
  if ( Length(Trim(edObservacao.Lines.Text)) < 15 ) then
    TServiceMessage.ShowWarning('Favor informar texto com, no mínimo, 15 caracteres!')
  else
    ModalResult := mrOk;
end;

procedure TViewMemo.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewMemo.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
