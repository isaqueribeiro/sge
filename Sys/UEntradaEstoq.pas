unit UEntradaEstoq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, Grids, DBGrids, ExtCtrls,
  ComCtrls, DBCtrls, StdCtrls, Buttons, ToolEdit, RXDBCtrl, Mask, ToolWin,
  IBSQL;

type
  TfrmEntradaEstoq = class(TForm)
    Bevel1: TBevel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    PageControl1: TPageControl;
    TabSheetNota: TTabSheet;
    TabSheetItens: TTabSheet;
    TabSheetFatura: TTabSheet;
    GroupBox1: TGroupBox;
    tlbarForn: TToolBar;
    btnGravar: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    RxDBComboEdit1: TRxDBComboEdit;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    DBEdit18: TDBEdit;
    Label18: TLabel;
    DBEdit19: TDBEdit;
    GroupBox6: TGroupBox;
    DBMemo1: TDBMemo;
    Label19: TLabel;
    DBEdit20: TDBEdit;
    Label20: TLabel;
    DBEdit21: TDBEdit;
    Label21: TLabel;
    DBEdit22: TDBEdit;
    Label22: TLabel;
    DBEdit23: TDBEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label15: TLabel;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label23: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit16: TDBEdit;
    procedure btbtnCancelClick(Sender: TObject);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit21Exit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaEstoq: TfrmEntradaEstoq;

implementation

uses UGrEntradaEstoq, UDMBusiness, UPesq;

{$R *.dfm}

procedure TfrmEntradaEstoq.btbtnCancelClick(Sender: TObject);
begin
// frmGrEntradaEstoq.ibdtstCompras.Cancel;
 DMBusiness.ibtrnsctnBusiness.RollbackRetaining;
 frmGrEntradaEstoq.ibdtstCompras.Close;
 Close;
end;

procedure TfrmEntradaEstoq.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesq, frmPesq);
  frmPesq.ShowModal;
  frmPesq.Destroy;
end;

procedure TfrmEntradaEstoq.SpeedButton1Click(Sender: TObject);
begin
 if not frmGrEntradaEstoq.ibdtstProduto.Locate('cod', DBEdit20.Text,[loPartialKey])
   then ShowMessage('Produto não encontrado!')
  else
  begin
    frmGrEntradaEstoq.ibdtstComprasItens.Last;
    frmGrEntradaEstoq.ibdtstComprasItens.Insert;
    DBEdit20.SetFocus;
  end;
end;

procedure TfrmEntradaEstoq.btnGravarClick(Sender: TObject);
begin
if not frmGrEntradaEstoq.ibdtstProduto.Locate('cod', DBEdit20.Text,[loPartialKey])
   then ShowMessage('Produto não encontrado!')
 else
   begin
    frmGrEntradaEstoq.ibdtstCompras.Post;
    DMBusiness.ibtrnsctnBusiness.Commit;
    Close;
   end;

end;

procedure TfrmEntradaEstoq.FormShow(Sender: TObject);
begin
 PageControl1.ActivePage := TabSheetNota;
 DBLookupComboBox1.SetFocus;

end;

procedure TfrmEntradaEstoq.DBEdit20Exit(Sender: TObject);
begin
if not frmGrEntradaEstoq.ibdtstProduto.Locate('cod', DBEdit20.Text,[loPartialKey])
   then ShowMessage('Produto não encontrado!') else begin

 frmGrEntradaEstoq.ibdtstComprasItensCODCONTROL.Value := frmGrEntradaEstoq.ibdtstComprasCODCONTROL.Value;
 frmGrEntradaEstoq.ibdtstComprasItensCODEMP.Value := frmGrEntradaEstoq.ibdtstComprasCODEMP.Value;
 frmGrEntradaEstoq.ibdtstComprasItensCODFORN.Value := frmGrEntradaEstoq.ibdtstComprasCODFORN.Value;
 frmGrEntradaEstoq.ibdtstComprasItensDTENT.Value := frmGrEntradaEstoq.ibdtstComprasDTENT.Value;
 frmGrEntradaEstoq.ibdtstComprasItensNF.Value := frmGrEntradaEstoq.ibdtstComprasNF.Value;
 end;

end;

procedure TfrmEntradaEstoq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// DMBusiness.ibtrnsctnBusiness.Rollback;
end;

procedure TfrmEntradaEstoq.DBEdit21Exit(Sender: TObject);
begin
  with frmGrEntradaEstoq do
  begin
    ibdtstComprasItensQTDEANTES.Value := ibdtstComprasItensLookProdQtde.Value;
    ibdtstComprasItensQTDEFINAL.Value := ibdtstComprasItensQTDEANTES.Value + ibdtstComprasItensQTDE.Value; 
  end;

end;

procedure TfrmEntradaEstoq.PageControl1Change(Sender: TObject);
begin
 if (DBEdit1.Text='') or (DBLookupComboBox1.Text ='') or (RxDBComboEdit1.Text='') or (DBEdit19.Text='')
 then
   begin
     MessageDlg('Preencha os campos (Empresa - Número NF - Data de Entrada - Fornecedor - Total Nota Fiscal) da Nota!',mtInformation, [mbOk],0);
     PageControl1.ActivePage := TabSheetNota;
   end
 else
  begin
    DBEdit9.Text := 'ATIVA';
    frmGrEntradaEstoq.ibdtstCompras.Post;
    frmGrEntradaEstoq.ibdtstCompras.Edit;
    PageControl1.ActivePage := TabSheetItens;
  end;  
end;

procedure TfrmEntradaEstoq.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;

end;

procedure TfrmEntradaEstoq.DBEdit1Exit(Sender: TObject);
begin
 frmGrEntradaEstoq.ibdtstComprasDTENT.Value := DATE + TIME;
end;

end.
