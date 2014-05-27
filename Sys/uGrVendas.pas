unit uGrVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBQuery, IBCustomDataSet, StdCtrls, DBCtrls, rxToolEdit,
  RXDBCtrl, Mask, Grids, DBGrids, ComCtrls, ExtCtrls, Buttons, ToolWin;

type
  TfrmGrVendas = class(TForm)
    tlbrGridFornec: TToolBar;
    btbtnIncluir: TBitBtn;
    BitBtn1: TBitBtn;
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
    ibdtstVendas: TIBDataSet;
    dtsrcVendas: TDataSource;
    ibqryTotal: TIBQuery;
    ibqryTotalCOUNT: TIntegerField;
    ibdtstEmp: TIBDataSet;
    ibdtstVendasItens: TIBDataSet;
    ibdtstClient: TIBDataSet;
    ibdtstProduto: TIBDataSet;
    ibdtstProdutoCOD: TIBStringField;
    ibdtstProdutoQTDE: TSmallintField;
    ibdtstProdutoDESCRI: TIBStringField;
    ibdtstProdutoMODELO: TIBStringField;
    ibdtstProdutoREFERENCIA: TIBStringField;
    dtsrcVendasItens: TDataSource;
    ibdtstVendasCODCONTROL: TIntegerField;
    ibdtstVendasCODEMP: TIBStringField;
    ibdtstVendasCODCLI: TIBStringField;
    ibdtstVendasDTVENDA: TDateTimeField;
    ibdtstVendasSTATUS: TIBStringField;
    ibdtstVendasDESCONTO: TIBBCDField;
    ibdtstVendasLookemp: TStringField;
    ibdtstVendasItensCODCONTROL: TIntegerField;
    ibdtstVendasItensCODEMP: TIBStringField;
    ibdtstVendasItensCODCLI: TIBStringField;
    ibdtstVendasItensDTVENDA: TDateTimeField;
    ibdtstVendasItensCODPROD: TIBStringField;
    ibdtstVendasItensQTDE: TIntegerField;
    ibdtstVendasItensPUNIT: TIBBCDField;
    ibdtstVendasItensDESCONTO: TIBBCDField;
    ibdtstVendasItensPFINAL: TIBBCDField;
    ibdtstVendasItensLookProd: TStringField;
    ibdtstProdutoPRECO: TIBBCDField;
    ibdtstVendasItensLookProdPreco: TCurrencyField;
    ibdtstVendasItensQTDEFINAL: TIntegerField;
    ibdtstVendasItensLookProdQtde: TIntegerField;
    ibdtstVendasOBS: TMemoField;
    ibdtstVendasLookClient: TStringField;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    ibdtstVendasFORMAPAG: TIBStringField;
    ibdtstVendasTOTALVENDA: TIBBCDField;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    ibdtstVendasFATDIAS: TSmallintField;
    procedure btbtnIncluirClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spdbtnSomaClick(Sender: TObject);
    procedure btbtnFecharClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrVendas: TfrmGrVendas;

implementation

uses UDMBusiness, uVenda, uRelVenda;

{$R *.dfm}

procedure TfrmGrVendas.btbtnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmVenda, frmVenda);
  frmVenda.ShowModal;
  frmVenda.Destroy;
end;

procedure TfrmGrVendas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;
end;

procedure TfrmGrVendas.spdbtnSomaClick(Sender: TObject);
begin
  ibqryTotal.Open;
  ShowMessage('Total de Vendas = '+ibqryTotalCOUNT.DisplayText);
  ibqryTotal.Close;
end;

procedure TfrmGrVendas.btbtnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmGrVendas.SpeedButton1Click(Sender: TObject);
begin
if not (edt.Text = '') then
  begin
   with ibdtstVendas do
     begin
       SelectSQL.Clear;
       Close;
       SelectSQL.Add('select * from TBVENDAS where CODCONTROL like :controle');
       Params[0].AsString := edt.Text;
       Open;
     end;
   ibdtstVendasItens.Open;
   end
  else ShowMessage('Digite uma palavra-chave!');
end;

procedure TfrmGrVendas.FormShow(Sender: TObject);
begin
 ibdtstVendas.Open;
 ibdtstVendasItens.Open;
 PageControl1.ActivePage := TabSheetLista;
end;

procedure TfrmGrVendas.BitBtn1Click(Sender: TObject);
begin
  ibdtstVendas.Open;
  ibdtstVendasItens.Open;
  frmRelVenda.qckrp.Preview;
//  ibdtstVendas.Close;
//  ibdtstVendasItens.Close;

end;

procedure TfrmGrVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstVendas.Close;
 ibdtstVendasItens.Close;
end;

end.
