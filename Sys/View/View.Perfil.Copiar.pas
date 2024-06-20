unit View.Perfil.Copiar;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,

  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,

  dxSkinsCore,
  dxSkinBasic,
  dxSkinMcSkin,
  dxSkinOffice2007Green,
  dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark,
  dxSkinOffice2019Black,
  dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray,
  dxSkinOffice2019White,
  dxSkinTheBezier,
  dxSkinsDefaultPainters,
  dxSkinWXI,

  UGrPadrao,
  SGE.Controller.Interfaces;

type
  TViewPerfilCopiar = class(TfrmGrPadrao)
    dspPerfil: TDataSetProvider;
    cdsPerfil: TClientDataSet;
    lblPerfil: TLabel;
    edPerfil: TComboBox;
    btnSelecionar: TcxButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FControllerPerfis : IControllerCustom;

    IPerfil : Array of Integer;

    procedure CarregarPerfis;
    function Controller : IControllerCustom;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBFUNCAO

  Views:

  Procedures:

*)

  function SelecionarPerfil(AOnwer : TComponent; PerfilIn : Integer; var PerfilOut : Integer) : Boolean;

implementation

uses
  UConstantesDGE,
  UDMRecursos,
  SGE.Controller.Factory;

{$R *.dfm}

function SelecionarPerfil(AOnwer : TComponent; PerfilIn : Integer; var PerfilOut : Integer) : Boolean;
var
  AForm : TViewPerfilCopiar;
begin
  AForm := TViewPerfilCopiar.Create(AOnwer);
  try
    with AForm, cdsPerfil, Params do
    begin
      ParamByName('perfil1').AsInteger := FUNCTION_USER_ID_SYSTEM_ADM;
      ParamByName('perfil2').AsInteger := PerfilIn;
      CarregarPerfis;

      Result := (ShowModal = mrOk);
      if Result then
        PerfilOut := IPerfil[edPerfil.ItemIndex];
    end;
  finally
    AForm.Free;
  end;
end;

procedure TViewPerfilCopiar.CarregarPerfis;
var
  I : Integer;
begin
  with cdsPerfil do
  begin
    Open;

    edPerfil.Clear;
    SetLength(IPerfil, RecordCount);

    I := 0;

    while not Eof do
    begin
      edPerfil.Items.Add( FieldByName('funcao').AsString );
      IPerfil[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edPerfil.ItemIndex := 0;
end;

procedure TViewPerfilCopiar.FormCreate(Sender: TObject);
begin
  inherited;
  Controller.DAO.Open;
end;

procedure TViewPerfilCopiar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_ESCAPE ) then
    Self.Close
  else
    inherited;
end;

function TViewPerfilCopiar.Controller: IControllerCustom;
begin
  if not Assigned(FControllerPerfis) then
  begin
    FControllerPerfis := TControllerFactory.New.PerfilParaCopia;
    dspPerfil.DataSet := FControllerPerfis.DAO.DataSet;
    cdsPerfil.FetchParams;
  end;

  Result := FControllerPerfis;
end;

procedure TViewPerfilCopiar.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewPerfilCopiar.btnSelecionarClick(Sender: TObject);
begin
  if ( edPerfil.ItemIndex > -1 ) then
    ModalResult := mrOk;
end;

end.
