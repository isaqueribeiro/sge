unit UGrEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin, Grids, DBGrids, ExtCtrls,
  DB, IBCustomDataSet, IBQuery;

type
  TfrmGridEmpresa = class(TForm)
    Panel1: TPanel;
    dbgrdTipImov: TDBGrid;
    pnlBotaoGrid: TPanel;
    tlbrGridTipImov: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    ibdtstEmpresa: TIBDataSet;
    dtsrcEmpresa: TDataSource;
    ibdtstEmpresaCNPJ: TIBStringField;
    ibdtstEmpresaRZSOC: TIBStringField;
    ibdtstEmpresaNMFANT: TIBStringField;
    ibdtstEmpresaIE: TIBStringField;
    ibdtstEmpresaIM: TIBStringField;
    ibdtstEmpresaFONE: TIBStringField;
    ibdtstEmpresaLOGO: TBlobField;
    ibdtstEmpresaENDER: TIBStringField;
    ibdtstEmpresaBAIRRO: TIBStringField;
    ibdtstEmpresaCEP: TIBStringField;
    ibdtstEmpresaCIDADE: TIBStringField;
    ibdtstEmpresaUF: TIBStringField;
    procedure btbtnFecharClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbgrdTipImovDblClick(Sender: TObject);
    procedure dbgrdTipImovKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridEmpresa: TfrmGridEmpresa;

implementation

uses UCdEmpresa, UDMBusiness;

{$R *.dfm}

procedure TfrmGridEmpresa.btbtnFecharClick(Sender: TObject);
begin
  Close
end;

procedure TfrmGridEmpresa.btbtnIncluirClick(Sender: TObject);
begin
  //Application.CreateForm(TfrmCadTipImov, frmCadTipImov);
  ibdtstEmpresa.Insert;
  frmCadEmpresa.ShowModal;

end;

procedure TfrmGridEmpresa.btbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja EXCLUIR esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON1) = idYes then
     begin
       ibdtstEmpresa.Delete;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro excluído com sucesso!');
     end
end;

procedure TfrmGridEmpresa.FormShow(Sender: TObject);
begin
  ibdtstEmpresa.Open
end;

procedure TfrmGridEmpresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstEmpresa.Close
end;

procedure TfrmGridEmpresa.btbtnAlterarClick(Sender: TObject);
begin
  ibdtstEmpresa.Edit;
  frmCadEmpresa.ShowModal;
end;

procedure TfrmGridEmpresa.dbgrdTipImovDblClick(Sender: TObject);
begin
  ibdtstEmpresa.Edit;
  frmCadEmpresa.ShowModal;
end;

procedure TfrmGridEmpresa.dbgrdTipImovKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;

end;

end.
