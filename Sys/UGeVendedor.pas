unit UGeVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeVendedor = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblCPF: TLabel;
    dbCPF: TDBEdit;
    IbDtstTabelaCOD: TIntegerField;
    IbDtstTabelaNOME: TIBStringField;
    IbDtstTabelaCPF: TIBStringField;
    dbComissao: TDBEdit;
    lblComissao: TLabel;
    IbDtstTabelaCOMISSAO: TIBBCDField;
    IbDtstTabelaATIVO: TSmallintField;
    IbDtstTabelaCOMISSAO_VL: TIBBCDField;
    dbComissaoValor: TDBEdit;
    lblComissaoValor: TLabel;
    chkbxAtivo: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeVendedor: TfrmGeVendedor;

  procedure MostrarTabelaVendedores(const AOwner : TComponent);

  function SelecionarVendedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
  function SelecionarVendedorPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaVendedores(const AOwner : TComponent);
var
  frm : TfrmGeVendedor;
begin
  frm := TfrmGeVendedor.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarVendedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeVendedor;
begin
  frm := TfrmGeVendedor.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarVendedorPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeVendedor;
begin
  frm := TfrmGeVendedor.Create(AOwner);
  try
    frm.btbtnIncluir.Visible  := False;
    frm.btbtnAlterar.Visible  := False;
    frm.btbtnExcluir.Visible  := False;
    frm.btbtnCancelar.Visible := False;
    frm.btbtnSalvar.Visible   := False;
    frm.btbtnLista.Visible    := False;
    frm.btbtnFechar.Visible   := False;

    frm.AbrirTabelaAuto := True;

    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeVendedor.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID            := ROTINA_CAD_VENDEDOR_ID;
  ControlFirstEdit    := dbNome;
  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBVENDEDOR';
  CampoCodigo    := 'COD';
  CampoDescricao := 'NOME';
end;

procedure TfrmGeVendedor.btbtnSalvarClick(Sender: TObject);
begin
  if ( not FuncoesString.StrIsCPF(IbDtstTabelaCPF.AsString) ) then
  begin
    ShowWarning('Favor informar um CPF válido.');
    Abort;
  end;

  inherited;

end;

procedure TfrmGeVendedor.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCOD.Value   := GetNextID(NomeTabela, CampoCodigo);
  IbDtstTabelaATIVO.Value := 1;
end;

procedure TfrmGeVendedor.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  if ( IbDtstTabelaATIVO.IsNull ) then
    IbDtstTabelaATIVO.Value := 1;
    
  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeVendedor', TfrmGeVendedor);

end.
