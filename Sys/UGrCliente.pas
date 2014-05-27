unit UGrCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin, Grids, DBGrids, ExtCtrls,
  DB, IBCustomDataSet, Mask, DBCtrls, IBQuery;

type
  TfrmGrCliente = class(TForm)
    Panel1: TPanel;
    dbgrdClientes: TDBGrid;
    tlbrGridFornec: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    ibdtstCliente: TIBDataSet;
    dtsrcCliente: TDataSource;
    spdbtnSoma: TSpeedButton;
    ibqryTotCli: TIBQuery;
    ibqryTotCliCOUNT: TIntegerField;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    pnlBotaoGrid: TPanel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    SpeedButton1: TSpeedButton;
    edt: TEdit;
    ibdtstClienteCNPJ: TIBStringField;
    ibdtstClienteNOME: TIBStringField;
    ibdtstClienteINSCEST: TIBStringField;
    ibdtstClienteFONE: TIBStringField;
    ibdtstClienteENDER: TIBStringField;
    ibdtstClienteCEP: TIBStringField;
    ibdtstClienteBAIRRO: TIBStringField;
    ibdtstClienteCIDADE: TIBStringField;
    ibdtstClienteUF: TIBStringField;
    ibdtstClienteSITE: TIBStringField;
    ibdtstClienteEMAIL: TIBStringField;
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure spdbtnSomaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbgrdClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdClientesTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrCliente: TfrmGrCliente;

implementation

uses UCdCliente, UDMBusiness;



{$R *.dfm}

procedure TfrmGrCliente.btbtnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCdCliente, frmCdCliente);
  ibdtstCliente.Insert;
  frmCdCliente.ShowModal;
  frmCdCliente.Destroy
end;

procedure TfrmGrCliente.btbtnFecharClick(Sender: TObject);
begin
  Close
end;

procedure TfrmGrCliente.FormShow(Sender: TObject);
begin
 ibdtstCliente.Open
end;

procedure TfrmGrCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstCliente.Close
end;

procedure TfrmGrCliente.btbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja EXCLUIR esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON1) = idYes then
     begin
       ibdtstCliente.Delete;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro excluído com sucesso!');
     end
end;

procedure TfrmGrCliente.btbtnAlterarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCdCliente, frmCdCliente);
  ibdtstCliente.Edit;
  frmCdCliente.ShowModal;
  frmCdCliente.Destroy
end;

procedure TfrmGrCliente.spdbtnSomaClick(Sender: TObject);
begin
  ibqryTotCli.Open;
  ShowMessage('Total de Clientes = '+ibqryTotCliCOUNT.DisplayText);
  ibqryTotCli.Close;
end;

procedure TfrmGrCliente.SpeedButton1Click(Sender: TObject);
begin
 
 if not (edt.Text = '') then
  begin
   with ibdtstCliente do
     begin
       SelectSQL.Clear;
       Close;
       SelectSQL.Add('select * from TBCLIENTE where NOME like :nome');
       SelectSQL.Add('order by NOME');
       Params[0].AsString := edt.Text + '%';
       Open;
     end;
   end
  else ShowMessage('Digite uma palavra-chave!');

end;

procedure TfrmGrCliente.dbgrdClientesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;

end;

procedure TfrmGrCliente.dbgrdClientesTitleClick(Column: TColumn);
var
campo:string;

begin
 campo:=column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
 application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
 ibdtstCliente.SelectSQL.Clear; // LIMPA A QUERY
 ibdtstCliente.SelectSQL.Add('select * from tbcliente order by '+campo); // ESCREVE O SELECT COM O ORDER BY
 if not ibdtstCliente.Prepared then
   ibdtstCliente.Prepare;
   ibdtstCliente.Open; // ABRE A QUERY COM A ORDEM ESCOLHIDA.
  // column.Font.color:=clblue; // COLOCAR A COLUNA NA COR DESEJADA
end;

end.
