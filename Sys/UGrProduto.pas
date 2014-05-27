unit UGrProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin, Grids, DBGrids, ExtCtrls,
  DB, IBCustomDataSet, Mask, DBCtrls, IBQuery, EUserAcs;

type
  TfrmGrProdutos = class(TForm)
    tlbrGridFornec: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    pnlBotaoGrid: TPanel;
    PageControl1: TPageControl;
    TabSheetLista: TTabSheet;
    TabSheetDados: TTabSheet;
    DBGrid1: TDBGrid;
    ibdtstProd: TIBDataSet;
    dtsrcProd: TDataSource;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    edt: TEdit;
    SpeedButton1: TSpeedButton;
    spdbtnSoma: TSpeedButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ibqryTotProd: TIBQuery;
    ibqryTotProdCOUNT: TIntegerField;
    ibdtstProdDESCRI: TIBStringField;
    ibdtstProdMODELO: TIBStringField;
    ibdtstProdPRECO: TIBBCDField;
    ibdtstProdREFERENCIA: TIBStringField;
    ibdtstProdSECAO: TIBStringField;
    ibdtstProdQTDE: TSmallintField;
    ibdtstProdUNIDADE: TIBStringField;
    ibdtstProdESTOQMIN: TSmallintField;
    ibdtstProdCODGRUPO: TSmallintField;
    ibdtstProdCUSTOMEDIO: TIBBCDField;
    ibdtstGrupoProd: TIBDataSet;
    ibdtstProdLookGrupProd: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    ibdtstProdCOD: TIBStringField;
    ibdtstEmp: TIBDataSet;
    ibdtstProdCODEMP: TIBStringField;
    ibdtstProdLookEmp: TStringField;
    Label10: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    EvUserAccess1: TEvUserAccess;
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure TabSheetListaShow(Sender: TObject);
    procedure btbtnGravClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure spdbtnSomaClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrProdutos: TfrmGrProdutos;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure TfrmGrProdutos.btbtnIncluirClick(Sender: TObject);
begin
 ibdtstProd.Insert;
 btbtnIncluir.Enabled := False;
 btbtnAlterar.Enabled := False;
 btbtnExcluir.Enabled := False;
 btbtnGrav.Enabled := True;
 btbtnCancel.Enabled := True;
 PageControl1.ActivePage := TabSheetDados;
 DBEdit1.ReadOnly := False;
 DBEdit1.SetFocus;
 DBEdit7.Text := '0';
end;

procedure TfrmGrProdutos.btbtnFecharClick(Sender: TObject);
begin
  ibdtstProd.Cancel;
  Close;
end;

procedure TfrmGrProdutos.FormShow(Sender: TObject);
begin
 ibdtstProd.Open;
 btbtnIncluir.Enabled := True;
 btbtnAlterar.Enabled := True;
 btbtnExcluir.Enabled := True;
 btbtnGrav.Enabled := False;
 btbtnCancel.Enabled := False;
 PageControl1.ActivePage := TabSheetLista;
end;

procedure TfrmGrProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstProd.Cancel;
  ibdtstProd.Close;

end;

procedure TfrmGrProdutos.btbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja EXCLUIR esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON1) = idYes then
     begin
       ibdtstProd.Delete;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro excluído com sucesso!');
     end
end;

procedure TfrmGrProdutos.btbtnAlterarClick(Sender: TObject);
begin
 ibdtstProd.Edit;
 btbtnIncluir.Enabled := False;
 btbtnAlterar.Enabled := False;
 btbtnExcluir.Enabled := False;
 btbtnGrav.Enabled := True;
 btbtnCancel.Enabled := True;
 PageControl1.ActivePage := TabSheetDados;
 DBEdit1.ReadOnly := True;
 DBEdit2.SetFocus;
end;

procedure TfrmGrProdutos.TabSheetListaShow(Sender: TObject);
begin
 btbtnIncluir.Enabled := True;
 btbtnAlterar.Enabled := True;
 btbtnExcluir.Enabled := True;
 btbtnGrav.Enabled := False;
 btbtnCancel.Enabled := False;

end;

procedure TfrmGrProdutos.btbtnGravClick(Sender: TObject);
begin
if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       ibdtstProd.Post;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro gravado com sucesso!');
       PageControl1.ActivePage := TabSheetLista;
     end
end;

procedure TfrmGrProdutos.SpeedButton1Click(Sender: TObject);
begin

 if not (edt.Text = '') then
  begin
   with ibdtstProd do
     begin
       SelectSQL.Clear;
       Close;
       SelectSQL.Add(' select * from TBPRODUTO where descri like :nome');
       SelectSQL.Add('order by DESCRI');
       Params[0].AsString := edt.Text + '%';
       Open;
     end;
   end
  else ShowMessage('Digite uma palavra-chave!');

end;

procedure TfrmGrProdutos.btbtnCancelClick(Sender: TObject);
begin
 ibdtstProd.CAncel;
 btbtnIncluir.Enabled := True;
 btbtnAlterar.Enabled := True;
 btbtnExcluir.Enabled := True;
 btbtnGrav.Enabled := False;
 btbtnCancel.Enabled := False;
 PageControl1.ActivePage := TabSheetLista;
end;

procedure TfrmGrProdutos.spdbtnSomaClick(Sender: TObject);
begin
ibqryTotProd.Open;
    ShowMessage('Total de Produtos = '+ibqryTotProdCOUNT.DisplayText);
    ibqryTotProd.Close;
end;

procedure TfrmGrProdutos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;

end;

procedure TfrmGrProdutos.DBGrid1TitleClick(Column: TColumn);
var
campo:string;

begin
 campo:=column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
 application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
 ibdtstProd.SelectSQL.Clear; // LIMPA A QUERY
 ibdtstProd.SelectSQL.Add('select * from tbproduto order by '+campo); // ESCREVE O SELECT COM O ORDER BY
 if not ibdtstProd.Prepared then
   ibdtstProd.Prepare;
   ibdtstProd.Open; // ABRE A QUERY COM A ORDEM ESCOLHIDA.
  // column.Font.color:=clblue; // COLOCAR A COLUNA NA COR DESEJADA
end;

end.
