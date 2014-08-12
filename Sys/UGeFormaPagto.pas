unit UGeFormaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable;

type
  TfrmGeFormaPagto = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblAcrescimo: TLabel;
    dbAcrescimo: TDBEdit;
    IbDtstTabelaCOD: TSmallintField;
    IbDtstTabelaDESCRI: TIBStringField;
    IbDtstTabelaACRESCIMO: TFloatField;
    lblContaCorrente: TLabel;
    dbContaCorrente: TDBLookupComboBox;
    tblContaCorrente: TIBTable;
    dtsContaCorrente: TDataSource;
    IbDtstTabelaCONTA_CORRENTE: TIntegerField;
    IbDtstTabelaLkp_ContaCorrente: TStringField;
    dbDecrementarLimite: TDBCheckBox;
    IbDtstTabelaDEBITAR_LIMITE_CLIENTE: TSmallintField;
    lblFormaPagtoNCFe: TLabel;
    dbFormaPagtoNCFe: TDBLookupComboBox;
    tblFormaPagtoNCFe: TIBTable;
    dtsFormaPagtoNCFe: TDataSource;
    IbDtstTabelaFORMAPAGTO_NFCE: TIBStringField;
    IbDtstTabelaFORMAPAGTO_PDV: TSmallintField;
    dbFormaPagtoPDV: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeFormaPagto: TfrmGeFormaPagto;

  procedure MostrarTabelaFormaPagtos(const AOwner : TComponent);

  function SelecionarFormaPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
  function SelecionarFormaPagtoPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaFormaPagtos(const AOwner : TComponent);
var
  frm : TfrmGeFormaPagto;
begin
  frm := TfrmGeFormaPagto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarFormaPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeFormaPagto;
begin
  frm := TfrmGeFormaPagto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarFormaPagtoPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeFormaPagto;
begin
  frm := TfrmGeFormaPagto.Create(AOwner);
  try
    frm.btbtnIncluir.Visible  := False;
    frm.btbtnAlterar.Visible  := False;
    frm.btbtnExcluir.Visible  := False;
    frm.btbtnCancelar.Visible := False;
    frm.btbtnSalvar.Visible   := False;
    frm.btbtnLista.Visible    := False;

    frm.WhereAdditional := '(p.FormaPagto_PDV = 1)';
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
  tblContaCorrente.Open;
  tblFormaPagtoNCFe.Open;

  RotinaID         := ROTINA_CAD_FORMA_PAGTO_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '00';
  NomeTabela     := 'TBFORMPAGTO';
  CampoCodigo    := 'COD';
  CampoDescricao := 'DESCRI';

  dbDecrementarLimite.Enabled := (GetUserFunctionID in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_GERENTE_ADM, FUNCTION_USER_ID_GERENTE_VND,
    FUNCTION_USER_ID_GERENTE_FIN, FUNCTION_USER_ID_AUX_FINANC1, FUNCTION_USER_ID_AUX_FINANC2, FUNCTION_USER_ID_SYSTEM_ADM]);
end;

procedure TfrmGeFormaPagto.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCOD.Value       := GetNextID(NomeTabela, CampoCodigo);
  IbDtstTabelaACRESCIMO.Value := 0;
  IbDtstTabelaDEBITAR_LIMITE_CLIENTE.Value := 1;
  IbDtstTabelaFORMAPAGTO_PDV.Value         := 1;
  IbDtstTabelaFORMAPAGTO_NFCE.Clear;
end;

initialization
  FormFunction.RegisterForm('frmGeFormaPagto', TfrmGeFormaPagto);

end.
