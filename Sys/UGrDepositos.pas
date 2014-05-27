unit UGrDepositos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, ComCtrls, StdCtrls, Buttons, ToolWin,
  Grids, DBGrids, ExtCtrls;

type
  TfrmGrDepositos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dbgrdLocat: TDBGrid;
    pnlBotaoGrid: TPanel;
    tlbrGridLocat: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    btbtnLocalizar: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    ibdtstLancDepos: TIBDataSet;
    ibdtstLancDeposNUMLANC: TIntegerField;
    ibdtstLancDeposCODBANCO: TSmallintField;
    ibdtstLancDeposESPECIE: TIBStringField;
    ibdtstLancDeposVALORDEP: TIBBCDField;
    ibdtstLancDeposDATADEP: TDateField;
    ibdtstLancDeposCOMPRDEP: TIBStringField;
    ibdtstLancDeposBancoLook: TStringField;
    dtsrcLancDepos: TDataSource;
    ibdtstBanco: TIBDataSet;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrDepositos: TfrmGrDepositos;

implementation

uses UCdDeposito, UDMBusiness;

{$R *.dfm}

procedure TfrmGrDepositos.FormShow(Sender: TObject);
begin
  ibdtstLancDepos.Open;
  ibdtstBanco.Open;
end;

procedure TfrmGrDepositos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstLancDepos.Close;
  ibdtstBanco.Close;
end;

procedure TfrmGrDepositos.btbtnIncluirClick(Sender: TObject);
begin
  ibdtstLancDepos.Insert;
  frmCdDeposito.ShowModal;
end;

procedure TfrmGrDepositos.btbtnAlterarClick(Sender: TObject);
begin
  ibdtstLancDepos.Edit;
  frmCdDeposito.ShowModal;
end;

procedure TfrmGrDepositos.btbtnExcluirClick(Sender: TObject);
begin
  ibdtstLancDepos.Delete
end;

procedure TfrmGrDepositos.btbtnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
