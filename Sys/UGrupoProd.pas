unit UGrupoProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls, Buttons, ToolWin;

type
  TfrmGrupoProd = class(TForm)
    tlbrGridFornec: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    PageControl1: TPageControl;
    TabSheetLista: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheetDados: TTabSheet;
    lblNomeCli: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ibdtstGrupoProd: TIBDataSet;
    dtsrcGrupoProd: TDataSource;
    procedure btbtnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure btbtnFecharClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupoProd: TfrmGrupoProd;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure TfrmGrupoProd.btbtnIncluirClick(Sender: TObject);
begin
 ibdtstGrupoProd.Insert;
 btbtnIncluir.Enabled := False;
 btbtnAlterar.Enabled := False;
 btbtnExcluir.Enabled := False;
 btbtnGrav.Enabled := True;
 btbtnCancel.Enabled := True;
 PageControl1.ActivePage := TabSheetDados;
 DBEdit2.SetFocus;
end;

procedure TfrmGrupoProd.FormShow(Sender: TObject);
begin
 ibdtstGrupoProd.Open;
 btbtnIncluir.Enabled := True;
 btbtnAlterar.Enabled := True;
 btbtnExcluir.Enabled := True;
 btbtnGrav.Enabled := False;
 btbtnCancel.Enabled := False;
 PageControl1.ActivePage := TabSheetLista;
end;

procedure TfrmGrupoProd.btbtnAlterarClick(Sender: TObject);
begin
 ibdtstGrupoProd.Edit;
 btbtnIncluir.Enabled := False;
 btbtnAlterar.Enabled := False;
 btbtnExcluir.Enabled := False;
 btbtnGrav.Enabled := true;
 btbtnCancel.Enabled := True;
 PageControl1.ActivePage := TabSheetDados;
 DBEdit2.SetFocus;
end;

procedure TfrmGrupoProd.btbtnExcluirClick(Sender: TObject);
begin
if Application.MessageBox('Deseja EXCLUIR esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON2) = idYes then
     begin
       ibdtstGrupoProd.Delete;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro excluído com sucesso!');
     end

end;

procedure TfrmGrupoProd.btbtnGravClick(Sender: TObject);
begin
if Application.MessageBox('Deseja GRAVAR esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
    begin
     ibdtstGrupoProd.Post;
     DMBusiness.ibtrnsctnBusiness.CommitRetaining;
     ShowMessage('Registro gravado com sucesso!');
     PageControl1.ActivePage := TabSheetLista;
    end
else
  begin
    ibdtstGrupoProd.Cancel;
    PageControl1.ActivePage := TabSheetLista;
  end;

 btbtnIncluir.Enabled := True;
 btbtnAlterar.Enabled := True;
 btbtnExcluir.Enabled := True;
 btbtnGrav.Enabled := False;
 btbtnCancel.Enabled := False;
 PageControl1.ActivePage := TabSheetLista;

end;

procedure TfrmGrupoProd.btbtnCancelClick(Sender: TObject);
begin
 ibdtstGrupoProd.CAncel;
 btbtnIncluir.Enabled := True;
 btbtnAlterar.Enabled := True;
 btbtnExcluir.Enabled := True;
 btbtnGrav.Enabled := False;
 btbtnCancel.Enabled := False;
 PageControl1.ActivePage := TabSheetLista;

end;

procedure TfrmGrupoProd.btbtnFecharClick(Sender: TObject);
begin
 ibdtstGrupoProd.Cancel;
 Close;
end;

procedure TfrmGrupoProd.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) Then
  KEY := 0;
end;

procedure TfrmGrupoProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstGrupoProd.Cancel;
  ibdtstGrupoProd.Close;
  
end;

end.
