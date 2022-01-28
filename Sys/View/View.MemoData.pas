unit View.MemoData;

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
  Vcl.Mask,

  JvExMask,
  JvToolEdit,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,

  dxSkinsCore,
  dxSkinsDefaultPainters,
  View.Memo;

type
  TViewMemoData = class(TViewMemo)
    pnlData: TPanel;
    lblData: TLabel;
    edData: TJvDateEdit;
    lblObservacao: TLabel;
    procedure BtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function SetMemoTextoData(const AOnwer : TComponent;
    var pData : TDateTime; var pObservacao : TStringList;
    const pTitulo, pDescricao : String) : Boolean;
  function SetMemoObservacaoData(const AOnwer : TComponent;
    var pData : TDateTime; var pObservacao : TStringList;
    const pDescricao : String = '') : Boolean;
  function SetMemoFaturaData(const AOnwer : TComponent;
    var pData : TDateTime; var pObservacao : TStringList;
    const pDescricao : String = '') : Boolean;

implementation

{$R *.dfm}

uses
  Service.Message;

function SetMemoTextoData(const AOnwer : TComponent;
  var pData : TDateTime; var pObservacao : TStringList;
  const pTitulo, pDescricao : String) : Boolean;
var
  AForm : TViewMemoData;
begin
  AForm := TViewMemoData.Create(AOnwer);
  try
    AForm.Caption := pTitulo;

    AForm.edData.Date := pData;

    AForm.lblObservacao.Caption := pDescricao;
    AForm.lblObservacao.Visible := (Trim(AForm.lblObservacao.Caption) <> EmptyStr);

    AForm.edObservacao.Clear;
    AForm.edObservacao.MaxLength := 1024;
    AForm.edObservacao.Lines.AddStrings( pObservacao );
    AForm.edObservacao.Font.Name := 'Lucida Console';

    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      pData := AForm.edData.Date;
      pObservacao.Clear;
      pObservacao.AddStrings( AForm.edObservacao.Lines );
    end;
  finally
    AForm.Free;
  end;
end;

function SetMemoObservacaoData(const AOnwer : TComponent;
  var pData : TDateTime; var pObservacao : TStringList;
  const pDescricao : String = '') : Boolean;
var
  AForm : TViewMemoData;
begin
  AForm := TViewMemoData.Create(AOnwer);
  try
    AForm.Caption := 'Observações:';

    AForm.edData.Date := pData;
    AForm.lblObservacao.Caption := pDescricao;
    AForm.lblObservacao.Visible := (Trim(AForm.lblObservacao.Caption) <> EmptyStr);
    AForm.edObservacao.Clear;
    AForm.edObservacao.Lines.AddStrings( pObservacao );

    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      pData := AForm.edData.Date;
      pObservacao.Clear;
      pObservacao.AddStrings( AForm.edObservacao.Lines );
    end;
  finally
    AForm.Free;
  end;
end;

function SetMemoFaturaData(const AOnwer : TComponent;
  var pData : TDateTime; var pObservacao : TStringList;
  const pDescricao : String = '') : Boolean;
var
  AForm : TViewMemoData;
begin
  AForm := TViewMemoData.Create(AOnwer);
  try
    AForm.Caption := 'Confirmar Faturamento:';

    AForm.edData.Date     := pData;
    AForm.lblData.Caption := 'Data da Fatura . . . . . . . :';

    AForm.lblObservacao.Caption := pDescricao;
    AForm.lblObservacao.Visible := (Trim(AForm.lblObservacao.Caption) <> EmptyStr);

    AForm.edObservacao.Clear;
    AForm.edObservacao.MaxLength := 1024;
    AForm.edObservacao.Lines.AddStrings( pObservacao );
    AForm.edObservacao.Font.Name := 'Lucida Console';

    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      pData := AForm.edData.Date;
      pObservacao.Clear;
      pObservacao.AddStrings( AForm.edObservacao.Lines );
    end;
  finally
    AForm.Free;
  end;
end;

procedure TViewMemoData.BtnConfirmarClick(Sender: TObject);
begin
  if ( Length(Trim(edData.Text)) < 10 ) then
    TServiceMessage.ShowWarning('Favor informar data!')
  else
    inherited;
end;

end.
