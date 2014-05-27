unit UGridFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin, Grids, DBGrids, ExtCtrls,
  DB, IBCustomDataSet;

type
  TfrmGridFornec = class(TForm)
    Panel1: TPanel;
    dbgrdFornec: TDBGrid;
    tlbrGridFornec: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    pnlBotaoGrid: TPanel;
    ibdtstFornec: TIBDataSet;
    dtsrcFornec: TDataSource;
    ibdtstFornecCODFORN: TSmallintField;
    ibdtstFornecNOMEFORN: TIBStringField;
    ibdtstFornecCONTATO: TIBStringField;
    ibdtstFornecENDER: TIBStringField;
    ibdtstFornecFONE: TIBStringField;
    ibdtstFornecCNPJ: TIBStringField;
    ibdtstFornecEMAIL: TIBStringField;
    ibdtstFornecCIDADE: TIBStringField;
    ibdtstFornecUF: TIBStringField;
    ibdtstFornecSITE: TIBStringField;
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbgrdFornecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridFornec: TfrmGridFornec;

implementation

uses UCdFornecedor, UDMBusiness;

{$R *.dfm}

procedure TfrmGridFornec.btbtnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCdFornecedor, frmCdFornecedor);
  ibdtstFornec.Insert;
  frmCdFornecedor.ShowModal;
  frmCdFornecedor.Destroy
end;

procedure TfrmGridFornec.btbtnFecharClick(Sender: TObject);
begin
  Close
end;

procedure TfrmGridFornec.FormShow(Sender: TObject);
begin
 ibdtstFornec.Open
end;

procedure TfrmGridFornec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstFornec.Close
end;

procedure TfrmGridFornec.btbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja EXCLUIR esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON1) = idYes then
     begin
       ibdtstFornec.Delete;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro excluído com sucesso!');
     end
end;

procedure TfrmGridFornec.btbtnAlterarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCdFornecedor, frmCdFornecedor);
  ibdtstFornec.Edit;
  frmCdFornecedor.ShowModal;
  frmCdFornecedor.Destroy
end;

procedure TfrmGridFornec.dbgrdFornecKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;

end;

end.
