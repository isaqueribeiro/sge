unit View.InputQuery;

interface

uses
  System.Classes, System.SysUtils, System.UITypes, Winapi.Windows, Vcl.StdCtrls, Vcl.Controls, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.Buttons, Interfaces.InputQuery;

type
  TViewInputQuery = class(TForm, IViewInputQuery)
    lblPrompt: TLabel;
    edtPrompt: TEdit;
    PanelButton: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    Bevel: TBevel;
    procedure edtPromptChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPromptKeyPress(Sender: TObject; var Key: Char);
  strict private
    class var _instance : IViewInputQuery;
  private
    { Private declarations }
    FProcedureValidationPrompt : TProcedureValidationPrompt;
    FProcedureConfirmationPrompt : TProcedureConfirmationPrompt;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;

    function CaptionForm(aCaption : String) : IViewInputQuery;
    function LabelPrompt(aTexto : String) : IViewInputQuery;
    function AlignmentPrompt(aAlinhamento : TAlignment) : IViewInputQuery;
    function ProcedureValidationPrompt(aEvent : TProcedureValidationPrompt) : IViewInputQuery;
    function ProcedureConfirmationPrompt(aEvent : TProcedureConfirmationPrompt) : IViewInputQuery;
    function ShowForm(var aRetorno : String) : Boolean; overload;
    function ShowForm(var aRetorno : Integer) : Boolean; overload;

    class function New(AOwner : TComponent) : IViewInputQuery;
  end;

implementation

{$R *.dfm}

const
  CARACTER_POR_LINHA = 80;
  ALTURA_POR_LINHA   = 18;

class function TViewInputQuery.New(AOwner: TComponent): IViewInputQuery;
begin
  if not Assigned(_instance) then
    _instance := TViewInputQuery.Create(AOwner);

  Result := _instance;
end;

function TViewInputQuery.ProcedureConfirmationPrompt(aEvent: TProcedureConfirmationPrompt): IViewInputQuery;
begin
  Result := Self;
  FProcedureConfirmationPrompt := aEvent;
end;

function TViewInputQuery.ProcedureValidationPrompt(aEvent: TProcedureValidationPrompt): IViewInputQuery;
begin
  Result := Self;
  FProcedureValidationPrompt := aEvent;
end;

function TViewInputQuery.ShowForm(var aRetorno: Integer): Boolean;
var
  aTexto : String;
begin
  aTexto := aRetorno.ToString;
  Result := Self.ShowForm(aTexto);

  if Result then
    aRetorno := StrToIntDef(Trim(Self.edtPrompt.Text), 0);
end;

function TViewInputQuery.ShowForm(var aRetorno : String): Boolean;
begin
  edtPrompt.Text := aRetorno.Trim();
  edtPromptChange( edtPrompt );

  Result := (ShowModal = System.UITypes.mrOk);

  if Result then
    aRetorno := edtPrompt.Text;
end;

function TViewInputQuery.AlignmentPrompt(aAlinhamento: TAlignment): IViewInputQuery;
begin
  Result := Self;
  edtPrompt.Alignment := aAlinhamento;
end;

procedure TViewInputQuery.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewInputQuery.btnOkClick(Sender: TObject);
begin
  if btnOk.Default then
  begin
    if Assigned(FProcedureConfirmationPrompt) then
      FProcedureConfirmationPrompt(Sender);

    ModalResult := mrOk;
  end;
end;

function TViewInputQuery.CaptionForm(aCaption: String): IViewInputQuery;
begin
  Result := Self;
  Self.Caption := aCaption.Trim;
end;

constructor TViewInputQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Position := TPosition.poMainFormCenter;
end;

destructor TViewInputQuery.Destroy;
begin
  inherited;
end;

procedure TViewInputQuery.edtPromptChange(Sender: TObject);
var
  aTexto : String;
begin
  aTexto := edtPrompt.Text;

  btnOk.Enabled := not aTexto.Trim.IsEmpty;
  btnOk.Default := not aTexto.Trim.IsEmpty;
end;

procedure TViewInputQuery.edtPromptKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(FProcedureValidationPrompt) then
    FProcedureValidationPrompt(Sender, Key);

  // Remover o som de Beep ao pressionar a tecla Enter
  if (Key = #13) then
    Key := #0;
end;

procedure TViewInputQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  _instance := nil;
end;

procedure TViewInputQuery.FormCreate(Sender: TObject);
begin
  lblPrompt.Transparent := False;
  FProcedureValidationPrompt   := nil;
  FProcedureConfirmationPrompt := nil;
end;

procedure TViewInputQuery.FormShow(Sender: TObject);
begin
  lblPrompt.Transparent := True;
end;

function TViewInputQuery.LabelPrompt(aTexto: String): IViewInputQuery;
var
  aLinhas : Integer;
begin
  Result := Self;
  lblPrompt.Caption := aTexto.Trim;

  aLinhas := Trunc( (aTexto.Trim.Length + CARACTER_POR_LINHA) / CARACTER_POR_LINHA );

  if (aLinhas < 1) then
    aLinhas := 1;

  // Ajustar altura do Form
  Self.Height := 54 + (aLinhas * ALTURA_POR_LINHA) + PanelButton.Height + edtPrompt.Height;
end;

end.
