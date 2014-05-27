unit UGrEntradaEstoq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, Grids, DBGrids, ComCtrls,
  StdCtrls, ExtCtrls, Buttons, ToolWin, DBCtrls, ToolEdit, RXDBCtrl, Mask;

type
  TfrmGrEntradaEstoq = class(TForm)
    tlbrGridFornec: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    spdbtnSoma: TSpeedButton;
    pnlBotaoGrid: TPanel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    SpeedButton1: TSpeedButton;
    edt: TEdit;
    PageControl1: TPageControl;
    TabSheetLista: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheetDados: TTabSheet;
    ibdtstCompras: TIBDataSet;
    dtsrcCompras: TDataSource;
    ibqryTotal: TIBQuery;
    ibqryTotalCOUNT: TIntegerField;
    ibdtstEmp: TIBDataSet;
    TabSheetItens: TTabSheet;
    ibdtstComprasItens: TIBDataSet;
    BitBtn1: TBitBtn;
    ibdtstComprasCODCONTROL: TIntegerField;
    ibdtstComprasCODEMP: TIBStringField;
    ibdtstComprasCODFORN: TIntegerField;
    ibdtstComprasNFSERIE: TIBStringField;
    ibdtstComprasDTEMISS: TDateField;
    ibdtstComprasNATUREZA: TIBStringField;
    ibdtstComprasSTATUS: TIBStringField;
    ibdtstComprasIPI: TIBBCDField;
    ibdtstComprasICMSBASE: TIBBCDField;
    ibdtstComprasICMSVALOR: TIBBCDField;
    ibdtstComprasICMSSUBSTBASE: TIBBCDField;
    ibdtstComprasICMSSUBSTVALOR: TIBBCDField;
    ibdtstComprasFRETE: TIBBCDField;
    ibdtstComprasOUTROSCUSTOS: TIBBCDField;
    ibdtstComprasDESCONTO: TIBBCDField;
    ibdtstComprasTOTALNF: TIBBCDField;
    ibdtstComprasTOTALPROD: TIBBCDField;
    ibdtstComprasOBS: TMemoField;
    ibdtstFornec: TIBDataSet;
    ibdtstProduto: TIBDataSet;
    ibdtstComprasItensCODCONTROL: TIntegerField;
    ibdtstComprasItensCODEMP: TIBStringField;
    ibdtstComprasItensCODFORN: TIntegerField;
    ibdtstComprasItensCODPROD: TIBStringField;
    ibdtstComprasItensPRECOUNIT: TIBBCDField;
    ibdtstComprasItensCUSTOMEDIO: TIntegerField;
    dtsrcComprasItens: TDataSource;
    ibdtstComprasItensLookEmp: TStringField;
    ibdtstComprasLookEmp: TStringField;
    ibdtstComprasItensLookProduto: TStringField;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RxDBComboEdit1: TRxDBComboEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    GroupBox6: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    ibdtstComprasLookFornec: TStringField;
    DBEdit4: TDBEdit;
    ibdtstProdutoCOD: TIBStringField;
    ibdtstProdutoQTDE: TSmallintField;
    ibdtstProdutoDESCRI: TIBStringField;
    ibdtstProdutoMODELO: TIBStringField;
    ibdtstProdutoREFERENCIA: TIBStringField;
    ibdtstComprasNF: TIntegerField;
    ibdtstComprasItensNF: TIntegerField;
    ibdtstComprasItensQTDEANTES: TIntegerField;
    ibdtstComprasItensQTDEFINAL: TIntegerField;
    ibdtstComprasItensQTDE: TIntegerField;
    ibdtstComprasItensLookProdQtde: TIntegerField;
    ibdtstComprasItensDTENT: TDateTimeField;
    ibdtstComprasDTENT: TDateTimeField;
    procedure btbtnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure btbtnFecharClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spdbtnSomaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrEntradaEstoq: TfrmGrEntradaEstoq;

implementation

uses UDMBusiness, UEntradaEstoq;

{$R *.dfm}

procedure TfrmGrEntradaEstoq.btbtnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmEntradaEstoq, frmEntradaEstoq);
  ibdtstCompras.Open;
  ibdtstCompras.Insert;
  frmEntradaEstoq.ShowModal;
  frmEntradaEstoq.Destroy;
end;

procedure TfrmGrEntradaEstoq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 ibdtstCompras.Close;
 ibdtstComprasItens.Close;
end;

procedure TfrmGrEntradaEstoq.FormShow(Sender: TObject);
begin
 ibdtstCompras.Open;
 ibdtstComprasItens.Open;
 PageControl1.ActivePage := TabSheetLista;
end;

procedure TfrmGrEntradaEstoq.btbtnCancelClick(Sender: TObject);
begin
 ibdtstCompras.Cancel;
end;

procedure TfrmGrEntradaEstoq.btbtnFecharClick(Sender: TObject);
begin
 ibdtstCompras.Cancel;
 Close;
end;

procedure TfrmGrEntradaEstoq.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;

end;

procedure TfrmGrEntradaEstoq.DBGrid1TitleClick(Column: TColumn);
var
campo:string;
begin
 campo:=column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
 application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
 ibdtstCompras.SelectSQL.Clear; // LIMPA A QUERY
 ibdtstCompras.SelectSQL.Add('select * from tbcompras order by '+campo); // ESCREVE O SELECT COM O ORDER BY
 if not ibdtstCompras.Prepared then
   ibdtstCompras.Prepare;
   ibdtstCompras.Open; // ABRE A QUERY COM A ORDEM ESCOLHIDA.
  // column.Font.color:=clblue; // COLOCAR A COLUNA NA COR DESEJADA
end;

procedure TfrmGrEntradaEstoq.SpeedButton1Click(Sender: TObject);
begin
if not (edt.Text = '') then
  begin
   with ibdtstCompras do
     begin
       SelectSQL.Clear;
       Close;
       SelectSQL.Add('select * from TBCOMPRAS where NF like :numnf');
       Params[0].AsInteger := StrToInt(edt.Text);
       Open;
     end;
   end
  else ShowMessage('Digite uma palavra-chave!');
end;

procedure TfrmGrEntradaEstoq.spdbtnSomaClick(Sender: TObject);
begin
  ibqryTotal.Open;
  ShowMessage('Total de Notas Fiscais = '+ibqryTotalCOUNT.DisplayText);
  ibqryTotal.Close;
end;

end.
