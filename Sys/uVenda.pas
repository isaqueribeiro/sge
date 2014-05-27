unit uVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ToolWin, Grids, DBGrids, DBCtrls,
  ToolEdit, RXDBCtrl, Mask, ExtCtrls, DB, IBCustomDataSet;

type
  TfrmVenda = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    PageControl1: TPageControl;
    TabSheetItens: TTabSheet;
    Panel2: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    GroupBox4: TGroupBox;
    TabSheetFatura: TTabSheet;
    GroupBox1: TGroupBox;
    tlbarForn: TToolBar;
    ToolButton2: TToolButton;
    btnGravar: TBitBtn;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    btbtnCancel: TBitBtn;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    DBEdit8: TDBEdit;
    Label4: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBText1: TDBText;
    DBLookupComboBox2: TDBLookupComboBox;
    dbdtTotalVenda: TDBEdit;
    Label11: TLabel;
    dbcmbbxFormRec: TDBComboBox;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    ibdtstCR: TIBDataSet;
    ibdtstCRCNPJ: TIBStringField;
    ibdtstCRDOCNF: TIBStringField;
    ibdtstCRTIPPAG: TIBStringField;
    ibdtstCRVALORREC: TIBBCDField;
    ibdtstCRDTVENC: TDateField;
    ibdtstCRDTEMISS: TDateField;
    ibdtstCRNUMLANC: TLargeintField;
    procedure FormShow(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DBEdit23Exit(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit21Exit(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcmbbxFormRecChange(Sender: TObject);
  private
    { Private declarations }
  public
    fecha: Boolean;
    { Public declarations }
  end;

var
  frmVenda: TfrmVenda;
  var
     nvenda : integer;
     TotVenda : Double;

implementation

uses uGrVendas, UDMBusiness;

{$R *.dfm}

procedure TfrmVenda.FormShow(Sender: TObject);
begin
with frmGrVendas do
begin
 ibdtstVendas.Open;
 ibdtstVendasItens.Open;
 ibdtstProduto.Open;
 ibdtstVendas.Insert;
 ibdtstVendasDTVENDA.Value := Date + Time;
end;
nvenda := frmGrVendas.ibdtstVendasCODCONTROL.Value;
PageControl1.ActivePage := TabSheetItens;

end;

procedure TfrmVenda.DBEdit20Exit(Sender: TObject);
begin
if not frmGrVendas.ibdtstProduto.Locate('cod', DBEdit20.Text,[loPartialKey])
   then ShowMessage('Produto não encontrado!') else begin
 frmGrVendas.ibdtstVendasItensCODCONTROL.Value := frmGrVendas.ibdtstVendasCODCONTROL.Value;
 frmGrVendas.ibdtstVendasItensCODEMP.Value := frmGrVendas.ibdtstVendasCODEMP.Value;
 frmGrVendas.ibdtstVendasItensCODCLI.Value := frmGrVendas.ibdtstVendasCODCLI.Value;
 frmGrVendas.ibdtstVendasItensDTVENDA.Value := frmGrVendas.ibdtstVendasDTVENDA.Value;
 frmGrVendas.ibdtstVendasItensPUNIT.Value := frmGrVendas.ibdtstVendasItensLookProdPreco.Value;

 end;
end;

procedure TfrmVenda.SpeedButton1Click(Sender: TObject);
begin
if not frmGrVendas.ibdtstProduto.Locate('cod', DBEdit20.Text,[loPartialKey])
   then ShowMessage('Produto não encontrado!')
  else
  begin
    frmGrVendas.ibdtstVendasItens.Insert;
    DBEdit20.SetFocus;
  end;
end;

procedure TfrmVenda.btnGravarClick(Sender: TObject);
begin
if not frmGrVendas.ibdtstProduto.Locate('cod', DBEdit20.Text,[loPartialKey])
   then ShowMessage('Produto não encontrado!')
 else
   begin
      try
        ibdtstCR.Open;
        ibdtstCR.Insert;
        ibdtstCRDOCNF.Value := IntToStr(frmGrVendas.ibdtstVendasCODCONTROL.Value);
        ibdtstCRCNPJ.Value := frmGrVendas.ibdtstVendasCODCLI.Value;
        ibdtstCRTIPPAG.Value := frmGrVendas.ibdtstVendasFORMAPAG.Value;
        ibdtstCRDTEMISS.Value := frmGrVendas.ibdtstVendasDTVENDA.Value;
        ibdtstCRVALORREC.Value := StrToCurr(dbdtTotalVenda.Text);
        ibdtstCRDTVENC.Value := frmGrVendas.ibdtstVendasDTVENDA.Value + frmGrVendas.ibdtstVendasFATDIAS.Value;
        ibdtstCR.Post;
        ibdtstCR.Close;

        dbdtTotalVenda.Text :=  FloatToStr(TotVenda);
        frmGrVendas.ibdtstVendas.Post;
        DMBusiness.ibtrnsctnBusiness.CommitRetaining;
        ShowMessage('Venda efetuada Nº '+ IntToStr(nvenda));
        Close;
      except
        begin
          DMBusiness.ibtrnsctnBusiness.RollbackRetaining;
          ShowMessage('Não foi possivel efetuar a venda');
          Close;
        end
      end;
   end;
end;

procedure TfrmVenda.DBEdit23Exit(Sender: TObject);
//var
  //desconto : Double;
begin
// desconto :=  frmGrVendas.ibdtstVendasItensPUNIT.Value * (frmGrVendas.ibdtstVendasItensDESCONTO.Value/100);
 frmGrVendas.ibdtstVendasItensPFINAL.Value := (frmGrVendas.ibdtstVendasItensPUNIT.Value * frmGrVendas.ibdtstVendasItensQTDE.Value) - frmGrVendas.ibdtstVendasItensDESCONTO.Value;


 TotVenda := 0;
 frmGrVendas.ibdtstVendasItens.First;
 while not frmGrVendas.ibdtstVendasItens.Eof do
   begin
    TotVenda:= TotVenda + frmGrVendas.ibdtstVendasItensPFINAL.Value;
    frmGrVendas.ibdtstVendasItens.Next;
   end;
   //Label11.Caption:= 'Total da nota ' + FormatFloat('#,###,###,##0.00', TotVenda);
  //   dbdtTotalVenda.Text := FormatFloat('#,###,###,##0.00', TotVenda);
  dbdtTotalVenda.Text := FormatFloat('#,###,###,##0.00', TotVenda)
  
end;

procedure TfrmVenda.btbtnCancelClick(Sender: TObject);
begin
 frmGrVendas.ibdtstVendasItens.Cancel;
 DMBusiness.ibtrnsctnBusiness.RollbackRetaining;
 frmGrVendas.ibdtstVendas.Close;
 Close;
end;

procedure TfrmVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmGrVendas.ibdtstVendas.Cancel;
frmGrVendas.ibdtstVendasItens.Cancel;
DMBusiness.ibtrnsctnBusiness.RollbackRetaining;
with frmGrVendas do
begin
 ibdtstVendas.Close;
 ibdtstVendasItens.Close;
 ibdtstProduto.Close;
end;
end;

procedure TfrmVenda.DBEdit21Exit(Sender: TObject);
var qtdeantes : integer;
begin
 qtdeantes := frmGrVendas.ibdtstVendasItensLookProdQtde.Value;
 frmGrVendas.ibdtstVendasItensQTDEFINAL.Value := qtdeantes - frmGrVendas.ibdtstVendasItensQTDE.Value;

end;

procedure TfrmVenda.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;
end;

procedure TfrmVenda.dbcmbbxFormRecChange(Sender: TObject);
begin
 if (dbcmbbxFormRec.Text = 'CARTEIRA') then DBEdit1.Text := '0';
{  begin
    Label12.Visible := True;
    DBEdit1.Visible := True;
  end
 else
  begin
    Label12.Visible := False;
    DBEdit1.Visible := False;
  end
}
end;

end.
