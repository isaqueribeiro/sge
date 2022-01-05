unit UGrAguarde;

interface

uses
  System.SysUtils,
  System.ImageList,
  System.Classes,
  System.Variants,

  Windows,
  Messages,
  Graphics,
  Controls,

  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ImgList,

  cxLabel,
  cxLookAndFeelPainters,
  cxImageList,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxContainer,
  cxEdit,

  dxSkinsCore,

  uBaseObject,
  UConstantesDGE;

type
  IViewWait = interface
    ['{42297DA0-354A-4B17-8852-5FBFCCD57147}']
    procedure ShowView;

    function Tipo(Value : NativeInt) : IViewWait;
    function Mensagem(Value : String) : IViewWait;
  end;

  TfrmAguarde = class(TForm, IViewWait)
    lbDesc: TcxLabel;
    imgAppIco: TImage;
    ImgAguarde: TcxImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbGradient1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  protected
    constructor Create(aOwner: TComponent; aTipo : NativeInt); overload;
  public
    { Public declarations }
    destructor Destroy; override;
    class function New(aOwner: TComponent; aTipo : NativeInt) : IViewWait;

    procedure ShowView;

    function Tipo(Value : NativeInt) : IViewWait;
    function Mensagem(Value : String) : IViewWait;
  end;

//var
//  frmAguarde : TfrmAguarde;
//
//
const
  strDeleting      = 'Excluindo registro(s) inserido(s) anteriormente...';
  strInserting     = 'Inserindo registro(s)...';
  strEditing       = 'Editando registro(s)...';
  strLoadData      = 'Pesquisando base de dados ...';
  strCloneTable    = 'Duplicando tabela';
  strPrintPrepare  = 'Preparando impressão...';
  strMakerConsulta = 'Executando consulta(s)...';
  strProcess       = 'Processando registro(s)...';
  strAutorizacao   = 'Aguardando autorização...';

implementation

{$R *.dfm}

procedure TfrmAguarde.FormShow(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  case Tag of
    WAIT_AMOMENT_Deleting      : lbDesc.Caption := strDeleting;
    WAIT_AMOMENT_Inserting     : lbDesc.Caption := strInserting;
    WAIT_AMOMENT_Editing       : lbDesc.Caption := strEditing;
    WAIT_AMOMENT_LoadData      : lbDesc.Caption := strLoadData;
    WAIT_AMOMENT_CloneTable    : lbDesc.Caption := strCloneTable;
    WAIT_AMOMENT_PrintPrepare  : lbDesc.Caption := strPrintPrepare;
    WAIT_AMOMENT_MakerConsulta : lbDesc.Caption := strMakerConsulta;
    WAIT_AMOMENT_Process       : lbDesc.Caption := strProcess;
    WAIT_AMOMENT_Autorizacao   : lbDesc.Caption := strAutorizacao;
    WAIT_AMOMENT_TextoLivre    : ; // Texto definido na chamada "Wait()"
    else
      lbDesc.Caption := 'Preparando visualização...';
  end;

  if ( Tag > 0 ) then
    ImgAguarde.GetIcon(Tag, imgAppIco.Picture.Icon);
end;

function TfrmAguarde.Mensagem(Value: String): IViewWait;
begin
  Result := Self;
  lbDesc.Caption := Value.Trim;
end;

class function TfrmAguarde.New(aOwner: TComponent; aTipo: NativeInt): IViewWait;
begin
  Result := Self.Create(aOwner, aTipo);
end;

procedure TfrmAguarde.ShowView;
begin
  Self.Show;
end;

function TfrmAguarde.Tipo(Value: NativeInt): IViewWait;
begin
  Result := Self;
  Self.Tag := Value;
end;

procedure TfrmAguarde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Screen.Cursor := crDefault;
  Action := caFree;
end;

procedure TfrmAguarde.AbGradient1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F011, 0);
end;

constructor TfrmAguarde.Create(aOwner: TComponent; aTipo : NativeInt);
begin
  Create(aOwner);
  Self.Tag := aTipo;
end;

destructor TfrmAguarde.Destroy;
begin
  inherited;
end;

procedure TfrmAguarde.FormActivate(Sender: TObject);
begin
  Self.Update;
end;

end.
