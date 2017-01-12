unit UGeVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, IBX.IBTable,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

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
    dtsTipoComissao: TDataSource;
    lblTipoComissao: TLabel;
    dbTipoComissao: TDBLookupComboBox;
    IbDtstTabelaCOMISSAO_TIPO: TSmallintField;
    fdQryTipoComissao: TFDQuery;
    IbDtstTabelaCOMISSAO_TIPO_FLAG: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure ControleCampos;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBVENDEDOR

  Views:
  - VW_TIPO_COMISSAO

  Procedures:

*)

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
    frm.WhereAdditional := '(v.ativo = 1)';

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

    frm.WhereAdditional := '(v.ativo = 1)';
    frm.AbrirTabelaAuto := True;

    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeVendedor.ControleCampos;
begin
  lblComissao.Enabled      := (IbDtstTabelaCOMISSAO_TIPO.AsInteger = 0);
  dbComissao.Enabled       := (IbDtstTabelaCOMISSAO_TIPO.AsInteger = 0);
  lblComissaoValor.Enabled := (IbDtstTabelaCOMISSAO_TIPO.AsInteger = 0);
  dbComissaoValor.Enabled  := (IbDtstTabelaCOMISSAO_TIPO.AsInteger = 0);
end;

procedure TfrmGeVendedor.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if ( IbDtstTabelaATIVO.AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := clRed;
    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeVendedor.DtSrcTabelaDataChange(Sender: TObject; Field: TField);
begin
  if (Field = IbDtstTabelaCOMISSAO_TIPO) then
    ControleCampos;
end;

procedure TfrmGeVendedor.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarLista(fdQryTipoComissao);

  RotinaID            := ROTINA_CAD_VENDEDOR_ID;
  ControlFirstEdit    := dbNome;
  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBVENDEDOR';
  CampoCodigo    := 'v.COD';
  CampoDescricao := 'v.NOME';
end;

procedure TfrmGeVendedor.btbtnSalvarClick(Sender: TObject);
begin
  if ( not FuncoesString.StrIsCPF(IbDtstTabelaCPF.AsString) ) then
  begin
    ShowWarning('Favor informar um CPF válido.');
    Abort;
  end;

  if (IbDtstTabelaCOMISSAO.AsCurrency < 0) or (IbDtstTabelaCOMISSAO.AsCurrency > 100) then
    ShowWarning('Favor informar um percentual válido de comissão!')
  else
    inherited;
end;

procedure TfrmGeVendedor.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCOD.Value   := GetNextID(NomeTabela, GetCampoCodigoLimpo);
  IbDtstTabelaATIVO.Value := 1;
  IbDtstTabelaCOMISSAO_TIPO.Value := 0;
end;

procedure TfrmGeVendedor.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ControleCampos;
end;

procedure TfrmGeVendedor.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  if ( IbDtstTabelaATIVO.IsNull ) then
    IbDtstTabelaATIVO.Value := 1;

  if ( IbDtstTabelaCOMISSAO_TIPO.AsInteger = 1 ) then
  begin
    IbDtstTabelaCOMISSAO.AsCurrency    := 0.0;
    IbDtstTabelaCOMISSAO_VL.AsCurrency := 0.0;
  end;

  IbDtstTabelaCOMISSAO_TIPO_FLAG.AsString := Copy(AnsiUpperCase(Trim(dbTipoComissao.Text)), 1, 1);

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeVendedor', TfrmGeVendedor);

end.
