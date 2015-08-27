unit UGrUsuarioCopiarPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, DBClient, Provider, DB, IBCustomDataSet, IBQuery,
  StdCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGrUsuarioCopiarPerfil = class(TfrmGrPadrao)
    qryPerfil: TIBQuery;
    dspPerfil: TDataSetProvider;
    cdsPerfil: TClientDataSet;
    lblPerfil: TLabel;
    edPerfil: TComboBox;
    btnSelecionar: TcxButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
    IPerfil : Array of Integer;
    procedure CarregarPerfis;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function SelecionarPerfil(AOnwer : TComponent; PerfilIn : Integer; var PerfilOut : Integer) : Boolean;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMRecursos;

{$R *.dfm}

function SelecionarPerfil(AOnwer : TComponent; PerfilIn : Integer; var PerfilOut : Integer) : Boolean;
var
  AForm : TfrmGrUsuarioCopiarPerfil;
begin
  AForm := TfrmGrUsuarioCopiarPerfil.Create(AOnwer);
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

procedure TfrmGrUsuarioCopiarPerfil.CarregarPerfis;
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

procedure TfrmGrUsuarioCopiarPerfil.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_ESCAPE ) then
    Self.Close
  else
    inherited;
end;

procedure TfrmGrUsuarioCopiarPerfil.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGrUsuarioCopiarPerfil.btnSelecionarClick(Sender: TObject);
begin
  if ( edPerfil.ItemIndex > -1 ) then
    ModalResult := mrOk;
end;

end.
