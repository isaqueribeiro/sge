unit UGrAguarde;

interface

uses
  UConstantesDGE,
  uBaseObject,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxLookupEdit,
  cxDBEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLookAndFeelPainters, cxClasses,
  cxLabel, Vcl.ExtCtrls, Vcl.ImgList, dxRibbonBackstageView, dxSkinsCore,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfrmAguarde = class(TForm)
    lbDesc: TcxLabel;
    imgAppIco: TImage;
    ImgAguarde: TcxImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbGradient1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAguarde : TfrmAguarde;
  

const
  strDeleting      = 'Excluindo registros inseridos anteriormente...';
  strInserting     = 'Inserindo registros...';
  strEditing       = 'Editando registros...';
  strLoadData      = 'Pesquisando base de dados ...';
  strCloneTable    = 'Duplicando tabela';
  strPrintPrepare  = 'Preparando impressão...';
  strMakerConsulta = 'Gerando consulta médica...';
  strProcess       = 'Processando registros...';
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
    else
      lbDesc.Caption := 'Preparando visualização...';
  end;

  if ( Tag > 0 ) then
    ImgAguarde.GetIcon(Tag, imgAppIco.Picture.Icon);
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

procedure TfrmAguarde.FormDestroy(Sender: TObject);
begin
  FrmAguarde := nil; 
end;

procedure TfrmAguarde.FormActivate(Sender: TObject);
begin
  FrmAguarde.Update;
end;

end.
