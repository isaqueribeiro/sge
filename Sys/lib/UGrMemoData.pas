unit UGrMemoData;

interface

uses
  UGrMemo,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  Vcl.Mask, JvExMask, JvToolEdit,

  dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGrMemoData = class(TfrmGrMemo)
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

uses
  UDMBusiness;

{$R *.dfm}

function SetMemoTextoData(const AOnwer : TComponent;
  var pData : TDateTime; var pObservacao : TStringList;
  const pTitulo, pDescricao : String) : Boolean;
var
  AForm : TfrmGrMemoData;
begin
  AForm := TfrmGrMemoData.Create(AOnwer);
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
  AForm : TfrmGrMemoData;
begin
  AForm := TfrmGrMemoData.Create(AOnwer);
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
  AForm : TfrmGrMemoData;
begin
  AForm := TfrmGrMemoData.Create(AOnwer);
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

procedure TfrmGrMemoData.BtnConfirmarClick(Sender: TObject);
begin
  if ( Length(Trim(edData.Text)) < 10 ) then
    ShowWarning('Favor informar data!')
  else
    inherited;
end;

end.
