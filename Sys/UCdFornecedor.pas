unit UCdFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  Buttons, ExtCtrls;

type
  TfrmCdFornecedor = class(TForm)
    Panel2: TPanel;
    tlbarForn: TToolBar;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFech: TBitBtn;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    procedure btbtnFechClick(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnGravClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCdFornecedor: TfrmCdFornecedor;

implementation

uses UGridFornec, UDMBusiness;


{$R *.dfm}

procedure TfrmCdFornecedor.btbtnFechClick(Sender: TObject);
begin
  frmGridFornec.ibdtstFornec.Cancel;
  Close
end;

procedure TfrmCdFornecedor.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCdFornecedor.btbtnGravClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGridFornec.ibdtstFornec.Post;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro gravado com sucesso!');
       Close;
     end

end;

procedure TfrmCdFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmGridFornec.ibdtstFornec.Cancel
end;

procedure TfrmCdFornecedor.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus
end;

procedure TfrmCdFornecedor.btbtnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGridFornec.ibdtstFornec.Cancel;
       ShowMessage('Registro cancelado com sucesso!');
       frmCdFornecedor.Close;
     end  
end;

end.
