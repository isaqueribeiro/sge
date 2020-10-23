unit UGeVendedor;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, IBX.IBTable,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeVendedor = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblCPF: TLabel;
    dbCPF: TDBEdit;
    dbComissao: TDBEdit;
    lblComissao: TLabel;
    dbComissaoValor: TDBEdit;
    lblComissaoValor: TLabel;
    chkbxAtivo: TDBCheckBox;
    dtsTipoComissao: TDataSource;
    lblTipoComissao: TLabel;
    dbTipoComissao: TDBLookupComboBox;
    fdQryTipoComissao: TFDQuery;
    fdQryTabelaCOD: TIntegerField;
    fdQryTabelaNOME: TStringField;
    fdQryTabelaCPF: TStringField;
    fdQryTabelaATIVO: TSmallintField;
    fdQryTabelaCOMISSAO_TIPO: TSmallintField;
    fdQryTabelaCOMISSAO: TCurrencyField;
    fdQryTabelaCOMISSAO_VL: TCurrencyField;
    fdQryTabelaCOMISSAO_TIPO_FLAG: TStringField;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    fdQryTabelaEMAIL: TStringField;
    fdQryTabelaTIPO: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
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
  with DtSrcTabela.DataSet do
  begin
    lblComissao.Enabled      := (FieldByName('COMISSAO_TIPO').AsInteger = 0);
    dbComissao.Enabled       := (FieldByName('COMISSAO_TIPO').AsInteger = 0);
    lblComissaoValor.Enabled := (FieldByName('COMISSAO_TIPO').AsInteger = 0);
    dbComissaoValor.Enabled  := (FieldByName('COMISSAO_TIPO').AsInteger = 0);
  end;
end;

procedure TfrmGeVendedor.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if ( DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := clRed;
    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeVendedor.DtSrcTabelaDataChange(Sender: TObject; Field: TField);
begin
  if (Field = DtSrcTabela.DataSet.FieldByName('COMISSAO_TIPO')) then
    ControleCampos;
end;

procedure TfrmGeVendedor.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ControleCampos;
end;

procedure TfrmGeVendedor.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('ATIVO').IsNull ) then
      FieldByName('ATIVO').AsInteger := 1;

    if ( FieldByName('TIPO').IsNull ) then
      FieldByName('TIPO').AsInteger := 1;

    if ( FieldByName('COMISSAO_TIPO').AsInteger = 1 ) then
    begin
      FieldByName('COMISSAO').AsCurrency    := 0.0;
      FieldByName('COMISSAO_VL').AsCurrency := 0.0;
    end;

    if (Length(Trim(FieldByName('CPF').AsString)) < 11) then
      FieldByName('CPF').Clear;

    if (Length(Trim(FieldByName('EMAIL').AsString)) <= 8) then
      FieldByName('EMAIL').Clear;

    FieldByName('COMISSAO_TIPO_FLAG').AsString := Copy(AnsiUpperCase(Trim(dbTipoComissao.Text)), 1, 1);
  end;
  inherited;
end;

procedure TfrmGeVendedor.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('COD').AsInteger   := GetNextID(NomeTabela, GetCampoCodigoLimpo);
    FieldByName('ATIVO').AsInteger := 1;
    FieldByName('TIPO').AsInteger  := 0;
    FieldByName('COMISSAO_TIPO').AsInteger := 0;
    FieldByName('COMISSAO').AsCurrency     := 0.0;
    FieldByName('COMISSAO_VL').AsCurrency  := 0.0;
    FieldByName('EMAIL').Clear;
  end;
end;

procedure TfrmGeVendedor.FormCreate(Sender: TObject);
begin
  inherited;
  SetVendedorPadrao;

  CarregarLista(fdQryTipoComissao);

  RotinaID            := ROTINA_CAD_VENDEDOR_ID;
  ControlFirstEdit    := dbNome;
  DisplayFormatCodigo := '000';
  AbrirTabelaAuto     := True;

  NomeTabela     := 'TBVENDEDOR';
  CampoCodigo    := 'v.COD';
  CampoDescricao := 'v.NOME';
  CampoOrdenacao := 'v.NOME';

  if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
    Self.Caption := 'Cadastro de Vendedores / Responsáveis';
end;

procedure TfrmGeVendedor.btbtnSalvarClick(Sender: TObject);
var
  aError : String;
begin
  if ( not FuncoesString.StrIsCPF(DtSrcTabela.DataSet.FieldByName('CPF').AsString) ) then
  begin
    ShowWarning('Favor informar um CPF válido.');
    Abort;
  end;

  if (DtSrcTabela.DataSet.FieldByName('EMAIL').AsString <> EmptyStr) then
    if StrIsEmail(DtSrcTabela.DataSet.FieldByName('EMAIL').AsString, aError) then
      DtSrcTabela.DataSet.FieldByName('EMAIL').AsString := Trim(DtSrcTabela.DataSet.FieldByName('EMAIL').AsString)
    else
    begin
      ShowWarning('Restrinção: ' + aError);
      Abort;
    end;

  if (DtSrcTabela.DataSet.FieldByName('COMISSAO').AsCurrency < 0) or (DtSrcTabela.DataSet.FieldByName('COMISSAO').AsCurrency > 100) then
    ShowWarning('Favor informar um percentual válido de comissão!')
  else
    inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeVendedor', TfrmGeVendedor);

end.
