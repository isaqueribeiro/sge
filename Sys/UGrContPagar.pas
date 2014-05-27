unit UGrContPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin, Grids, DBGrids, ExtCtrls,
  DB, IBCustomDataSet, ActnList;

type
  TfrmGrContPagar = class(TForm)
    Panel1: TPanel;
    dbgrdContPag: TDBGrid;
    tlbrGridFornec: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    pnlBotaoGrid: TPanel;
    IBDataSetFornec: TIBDataSet;
    dtsrcContPag: TDataSource;
    ibdtstContPag: TIBDataSet;
    ibdtstContPagNUMLANC: TLargeintField;
    ibdtstContPagCODFORN: TSmallintField;
    ibdtstContPagTIPPAG: TIBStringField;
    ibdtstContPagHISTORIC: TMemoField;
    ibdtstContPagNOTFISC: TIBStringField;
    ibdtstContPagDTEMISS: TDateField;
    ibdtstContPagDTVENC: TDateField;
    ibdtstContPagDTPAG: TDateField;
    ibdtstContPagDOCBAIX: TIBStringField;
    ibdtstContPagVALORPAG: TIBBCDField;
    ibdtstContPagFornLok: TStringField;
    BitBtn1: TBitBtn;
    ToolButton3: TToolButton;
    ibdtstBanco: TIBDataSet;
    ibdtstContPagTIPOCATEG: TSmallintField;
    ibdtstContPagBANCO: TSmallintField;
    ibdtstContPagNUMCHQ: TIBStringField;
    ibdtstContPagBancoLok: TStringField;
    dsDataSetFornec: TDataSource;
    dsBanco: TDataSource;
    ibdtstContPagNOMEFORN: TIBStringField;
    SpeedButton1: TSpeedButton;
    ToolButton5: TToolButton;
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbgrdContPagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrContPagar: TfrmGrContPagar;

implementation

uses UCdContPagar, UBxCP, U_SenhaBaixa, UDMBusiness;

{$R *.dfm}

procedure TfrmGrContPagar.btbtnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCdContPagar, frmCdContPagar);
  ibdtstContPag.Insert;
  frmCdContPagar.ShowModal;
  frmCdContPagar.Destroy
end;

procedure TfrmGrContPagar.btbtnFecharClick(Sender: TObject);
begin
  Close
end;

procedure TfrmGrContPagar.FormShow(Sender: TObject);
begin
 ibdtstContPag.Open;
 
end;

procedure TfrmGrContPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstContPag.Close
end;

procedure TfrmGrContPagar.btbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja EXCLUIR esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON1) = idYes then
     begin
       ibdtstContPag.Delete;
       DMBusiness.ibtrnsctnBusiness.Commit;
       ShowMessage('Registro excluído com sucesso!');
     end
end;

procedure TfrmGrContPagar.btbtnAlterarClick(Sender: TObject);
begin
   if ibdtstContPagdtpag.IsNull=false
       then begin

      // if MessageDlg('Disponível apenas para consulta. Voce deseja alterar assim mesmo? REQUER AUTORIZAÇÃO RESTRITA',
       //mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       //begin
       showmessage(' Lançamento Baixado. Alterável apenas com senha restrita!');
       Application.CreateForm(TfrmCdContPagar, frmCdContPagar);
       ibdtstContPag.Edit;
       frmcdcontpagar.btbtnGrav.Enabled:=false;
       TRY
       frmcdcontpagar.DBEdit1.Enabled:=false;
       frmcdcontpagar.DBEdit4.Enabled:=false;
       frmcdcontpagar.DBEdit9.Enabled:=false;
       frmcdcontpagar.DBEdit3.Enabled:=false;
       frmcdcontpagar.DBEdit5.Enabled:=false;
       frmcdcontpagar.DBEdit6.Enabled:=false;
       frmcdcontpagar.DBEdit7.Enabled:=false;
       frmcdcontpagar.DBmemo1.Enabled:=false;
       frmcdcontpagar.DBcombobox1.Enabled:=false;
       frmcdcontpagar.DBlookupcombobox1.Enabled:=false;

       frmcdcontpagar.DBlookupcombobox3.Enabled:=false;
       frmcdcontpagar.btbtnGrav.Enabled:=false;
       frmCdContPagar.btbtnAtual.Enabled := false;
//       frmcdcontpagar.btbtnatu.Enabled:=false;

       //frmcdcontpagar.btbtnaltbx.Enabled:=true;
        frmCdContPagar.ShowModal;
        frmCdContPagar.Destroy;
        //ibdtstContPag.post;
        except
        end;
        end;
      if ibdtstContPagdtpag.IsNull<>false
       then begin
        Application.CreateForm(TfrmCdContPagar, frmCdContPagar);
       ibdtstContPag.Edit;
//        frmcdcontpagar.btbtndesb.Enabled:=false;
//        frmcdcontpagar.maskedit1.Enabled:=false;
        frmcdcontpagar.btbtnGrav.Enabled:=false;
        frmCdContPagar.ShowModal;
        frmCdContPagar.Destroy;
        //ibdtstContPag.post;
        end;

end;

procedure TfrmGrContPagar.BitBtn1Click(Sender: TObject);
begin

  if ibdtstContPagdtpag.IsNull
  then begin
  F_SENHABAIXA.SHOWMODAL;

  end

  else showmessage('Lançamento já baixado!!');
end;

procedure TfrmGrContPagar.SpeedButton1Click(Sender: TObject);
begin
  f_senhaBaixa.Show;
end;

procedure TfrmGrContPagar.dbgrdContPagKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;
end;

end.
