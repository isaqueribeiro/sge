unit UFormPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, ExtCtrls, DBCtrls, StdCtrls, RXToolEdit,
  RXDBCtrl, Mask, Grids, DBGrids, ComCtrls, Buttons, ToolWin;

type
  TfrmFormPagto = class(TForm)
    tlbrGridFornec: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    btbtnGrav: TBitBtn;
    btbtnAtualiza: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    PageControl1: TPageControl;
    TabSheetLista: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheetDados: TTabSheet;
    lblNomeCli: TLabel;
    ibdtstFPagto: TIBDataSet;
    dtsrcFPagto: TDataSource;
    ibdtstFPagtoCOD: TSmallintField;
    ibdtstFPagtoDESCRI: TIBStringField;
    ibdtstFPagtoACRESCIMO: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormPagto: TfrmFormPagto;

implementation

uses UDMBusiness;

{$R *.dfm}

end.
