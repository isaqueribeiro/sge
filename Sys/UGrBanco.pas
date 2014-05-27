unit UGrBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin, Grids, DBGrids, ExtCtrls,
  DB, IBCustomDataSet;

type
  TfrmGridBanco = class(TForm)
    Panel1: TPanel;
    dbgrdGridBancos: TDBGrid;
    tlbrGridBancos: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    btbtnLocalizar: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    pnlBotaoBancos: TPanel;
    ibdtstBancos: TIBDataSet;
    dtsrcBancos: TDataSource;
    ibdtstBancosDTCAD: TDateField;
    ibdtstBancosCOD: TSmallintField;
    ibdtstBancosNOME: TIBStringField;
    ibdtstBancosCONTA: TIBStringField;
    ibdtstBancosSITUACAO: TIBStringField;
    ibdtstBancosENDER: TIBStringField;
    ibdtstBancosFONE: TIBStringField;
    ibdtstBancosAGENCIA: TSmallintField;
    procedure btbtnFecharClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridBanco: TfrmGridBanco;

implementation

uses UCdBanco, UDMBusiness;


{$R *.dfm}

procedure TfrmGridBanco.btbtnFecharClick(Sender: TObject);
begin
  Close
end;

procedure TfrmGridBanco.btbtnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadBanco, frmCadBanco);
  ibdtstBancos.Insert;
  frmCadBanco.ShowModal;
  frmCadBanco.Destroy;
end;

procedure TfrmGridBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstBancos.Close
end;

procedure TfrmGridBanco.FormShow(Sender: TObject);
begin
  ibdtstBancos.Open
end;

procedure TfrmGridBanco.btbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja EXCLUIR esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON1) = idYes then
     begin
       frmGridBanco.ibdtstBancos.Delete;
       ShowMessage('Registro excluido com sucesso!');
     end
end;

procedure TfrmGridBanco.btbtnAlterarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadBanco, frmCadBanco);
  ibdtstBancos.Edit;
  frmCadBanco.ShowModal;
  frmCadBanco.Destroy;
end;

end.
