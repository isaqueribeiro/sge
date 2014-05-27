unit UCdEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, StdCtrls, Buttons, ToolWin, Mask, ExtCtrls,
  DB, IBCustomDataSet;

type
  TfrmCadEmpresa = class(TForm)
    Panel2: TPanel;
    grpbxProd: TGroupBox;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    tlbrCadProd: TToolBar;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFech: TBitBtn;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label9: TLabel;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    Label1: TLabel;
    procedure btbtnFechClick(Sender: TObject);
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

uses UGrEmpresa, UDMBusiness;

{$R *.dfm}

procedure TfrmCadEmpresa.btbtnFechClick(Sender: TObject);
begin
  frmGridEmpresa.ibdtstEmpresa.Cancel;
  Close;
end;

procedure TfrmCadEmpresa.btbtnGravClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGridEmpresa.ibdtstEmpresa.Post;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro gravado com sucesso!');
       Close;
     end;
end;

procedure TfrmCadEmpresa.btbtnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGridEmpresa.ibdtstEmpresa.Cancel;
       ShowMessage('Registro cancelado com sucesso!');
       Close;
     end;
end;

procedure TfrmCadEmpresa.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCadEmpresa.FormShow(Sender: TObject);
begin
 DBEdit1.SetFocus;
end;

end.
