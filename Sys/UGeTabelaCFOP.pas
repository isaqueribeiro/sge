unit UGeTabelaCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient, Provider, IBQuery;

type
  TfrmGeTabelaCFOP = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCFOP_COD: TIntegerField;
    IbDtstTabelaCFOP_DESCRICAO: TIBStringField;
    IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField;
    lblEspecificacao: TLabel;
    dbEspecificacao: TDBMemo;
    GrpBxParametros: TGroupBox;
    dbCustoOperacional: TDBCheckBox;
    IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO: TSmallintField;
    QryCST: TIBQuery;
    DspCST: TDataSetProvider;
    CdsCST: TClientDataSet;
    DtsCST: TDataSource;
    lblCSTEntrada: TLabel;
    dbCSTEntrada: TDBLookupComboBox;
    IbDtstTabelaCFOP_CST_PADRAO_ENTRADA: TIBStringField;
    IbDtstTabelaCFOP_CST_PADRAO_SAIDA: TIBStringField;
    lblCSTSaida: TLabel;
    dbCSTSaida: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeTabelaCFOP: TfrmGeTabelaCFOP;

  procedure MostrarTabelaCFOP(const AOwner : TComponent);
  function SelecionarCFOP(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaCFOP(const AOwner : TComponent);
var
  frm : TfrmGeTabelaCFOP;
begin
  frm := TfrmGeTabelaCFOP.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCFOP(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeTabelaCFOP;
begin
  frm := TfrmGeTabelaCFOP.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTabelaCFOP.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_CFOP_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBCFOP';
  CampoCodigo    := 'CFOP_COD';
  CampoDescricao := 'CFOP_DESCRICAO';

  CdsCST.Open;
end;

procedure TfrmGeTabelaCFOP.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.AsInteger := 1;
  IbDtstTabelaCFOP_CST_PADRAO_ENTRADA.Clear;
  IbDtstTabelaCFOP_CST_PADRAO_SAIDA.Clear;
end;

procedure TfrmGeTabelaCFOP.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not btbtnAlterar.Enabled then
    if IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.IsNull then
      IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.AsInteger := 1;
end;

procedure TfrmGeTabelaCFOP.btbtnSalvarClick(Sender: TObject);
begin
  if IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.IsNull then
    IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.AsInteger := 1;

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeTabelaCFOP', TfrmGeTabelaCFOP);

end.
