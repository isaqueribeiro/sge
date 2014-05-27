unit UCdVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, StdCtrls, Buttons, ToolWin, Mask, ExtCtrls,
  DB, IBCustomDataSet;

type
  TfrmCdVendedor = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    tlbarForn: TToolBar;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFech: TBitBtn;
    DBNavigator1: TDBNavigator;
    ToolButton2: TToolButton;
    ibdtstVendedor: TIBDataSet;
    dtsrcVendedor: TDataSource;
    ibdtstVendedorCOD: TIntegerField;
    ibdtstVendedorNOME: TIBStringField;
    ibdtstVendedorCPF: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure btbtnFechClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCdVendedor: TfrmCdVendedor;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure TfrmCdVendedor.btbtnGravClick(Sender: TObject);
begin
   if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       ibdtstVendedor.Post;
       DMBusiness.ibtrnsctnBusiness.Commit;
       ShowMessage('Registro gravado com sucesso!');
       ibdtstVendedor.Insert;
       DBEdit2.SetFocus;
     end
end;

procedure TfrmCdVendedor.btbtnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       ibdtstVendedor.Cancel;
       ShowMessage('Registro cancelado com sucesso!');
       frmCdVendedor.Close;
     end
end;

procedure TfrmCdVendedor.btbtnFechClick(Sender: TObject);
begin
  ibdtstVendedor.Cancel;
  Close
end;

procedure TfrmCdVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ibdtstVendedor.Cancel;
  ibdtstVendedor.Close
end;

procedure TfrmCdVendedor.FormShow(Sender: TObject);
begin
  ibdtstVendedor.Open;
  ibdtstVendedor.Insert;
end;

procedure TfrmCdVendedor.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then perform(WM_NEXTDLGCTL,0,0);
end;

end.
