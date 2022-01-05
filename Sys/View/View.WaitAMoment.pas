unit View.WaitAMoment;

interface

uses
  System.SysUtils,
  System.ImageList,
  System.Classes,
  System.Variants,

  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.Graphics,
  Vcl.Controls,

  Winapi.Windows,
  Winapi.Messages,

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
  TViewWaitAMoment = class(TForm)
    lbDesc: TcxLabel;
    imgAppIco: TImage;
    ImgAguarde: TcxImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbGradient1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
  strict private
    class var _instance : TViewWaitAMoment;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowView;
    procedure HideView;

    function Tipo(Value : NativeInt) : TViewWaitAMoment;
    function Mensagem(Value : String) : TViewWaitAMoment;
  end;

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

procedure TViewWaitAMoment.FormShow(Sender: TObject);
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

procedure TViewWaitAMoment.HideView;
begin
  Self.Close;
end;

function TViewWaitAMoment.Mensagem(Value: String): TViewWaitAMoment;
begin
  Result := Self;
  lbDesc.Caption := Value.Trim;
end;

procedure TViewWaitAMoment.ShowView;
begin
  Self.Show;
end;

function TViewWaitAMoment.Tipo(Value: NativeInt): TViewWaitAMoment;
begin
  Result := Self;
  Self.Tag := Value;
end;

procedure TViewWaitAMoment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Screen.Cursor := crDefault;
  Action := caFree;
end;

procedure TViewWaitAMoment.AbGradient1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F011, 0);
end;

procedure TViewWaitAMoment.FormActivate(Sender: TObject);
begin
  Self.Update;
end;

end.
