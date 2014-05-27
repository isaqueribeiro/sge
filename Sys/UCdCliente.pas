unit UCdCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  Buttons, ExtCtrls;

type
  TfrmCdCliente = class(TForm)
    Panel2: TPanel;
    tlbarForn: TToolBar;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFech: TBitBtn;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
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
    DBEdit3: TDBEdit;
    Label2: TLabel;
    DBEdit11: TDBEdit;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    procedure btbtnFechClick(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnGravClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCdCliente: TfrmCdCliente;

implementation

uses UGrCliente, UDMBusiness;


{$R *.dfm}

procedure TfrmCdCliente.btbtnFechClick(Sender: TObject);
begin
  frmGrCliente.ibdtstCliente.Cancel;
  Close
end;

procedure TfrmCdCliente.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCdCliente.btbtnGravClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrCliente.ibdtstCliente.Post;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro gravado com sucesso!');
       frmCdCliente.Close;
     end

end;

procedure TfrmCdCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmGrCliente.ibdtstCliente.Cancel
end;

procedure TfrmCdCliente.btbtnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrCliente.ibdtstCliente.Cancel;
       ShowMessage('Registro cancelado com sucesso!');
       frmCdCliente.Close;
     end
end;

procedure TfrmCdCliente.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus
end;

end.
