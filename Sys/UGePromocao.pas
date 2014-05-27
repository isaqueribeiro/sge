unit UGePromocao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, RXDBCtrl;

type
  TfrmGePromocao = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaDESCRICAO: TIBStringField;
    IbDtstTabelaDATA_INICIO: TDateField;
    IbDtstTabelaDATA_FINAL: TDateField;
    IbDtstTabelaPERCENTUAL_DESCONTO: TIBBCDField;
    dbDataInicio: TDBDateEdit;
    lblDataInicio: TLabel;
    lblDataFinal: TLabel;
    dbDataFinal: TDBDateEdit;
    lblDescontoProm: TLabel;
    dbDescontoProm: TDBEdit;
    cdsProdutos: TIBDataSet;
    IbUpdProdutos: TIBUpdateSQL;
    DtSrcProdutos: TDataSource;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblValorUnit: TLabel;
    lblDesconto: TLabel;
    lblUnidade: TLabel;
    Bevel5: TBevel;
    lblValorPromocao: TLabel;
    dbProduto: TRxDBComboEdit;
    dbProdutoNome: TDBEdit;
    dbValorUnit: TDBEdit;
    dbDesconto: TDBEdit;
    dbUnidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    dbValorPromocao: TRxDBComboEdit;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    cdsProdutosCODIGO_PROM: TIntegerField;
    cdsProdutosCODIGO_PROD: TIBStringField;
    cdsProdutosPRECO_VENDA: TIBBCDField;
    cdsProdutosDESCONTO: TIBBCDField;
    cdsProdutosPRECO_PROMOCAO: TIBBCDField;
    cdsProdutosUSUARIO: TIBStringField;
    cdsProdutosDESCRI: TIBStringField;
    cdsProdutosUNIDADE: TIBStringField;
    IbDtstTabelaATIVA: TSmallintField;
    dbAtiva: TDBCheckBox;
    qryProduto: TIBDataSet;
    cdsProdutosSequencial: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure DtSrcProdutosStateChange(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure cdsProdutosNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure dbValorPromocaoButtonClick(Sender: TObject);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    SQL_Produtos : TStringList;
    procedure AbrirTabelaProdutos(const PromocaoID : Integer);
    procedure CarregarDadosProduto(const ProdutoID : Integer);
  public
    { Public declarations }
  end;

var
  frmGePromocao: TfrmGePromocao;

  procedure MostrarTabelaPromocoes(const AOwner : TComponent);

  function SelecionarPromocao(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness, UGeProduto;

{$R *.dfm}

procedure MostrarTabelaPromocoes(const AOwner : TComponent);
var
  frm : TfrmGePromocao;
begin
  frm := TfrmGePromocao.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarPromocao(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGePromocao;
begin
  frm := TfrmGePromocao.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGePromocao.AbrirTabelaProdutos(const PromocaoID: Integer);
begin
  cdsProdutos.Close;

  with cdsProdutos, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Produtos );
    Add('where p.Codigo_prom = ' + IntToStr(PromocaoID));
  end;

  cdsProdutos.Open;
end;

procedure TfrmGePromocao.FormCreate(Sender: TObject);
begin
  inherited;
  Desativar_Promocoes;
  
  DisplayFormatCodigo := '0000';
  ControlFirstEdit    := dbNome;

  NomeTabela     := 'TBPROMOCAO';
  CampoCodigo    := 'CODIGO';
  CampoDescricao := 'DESCRICAO';

  UpdateGenerator;

  SQL_Produtos := TStringList.Create;
  SQL_Produtos.AddStrings( cdsProdutos.SelectSQL );
end;

procedure TfrmGePromocao.IbDtstTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaProdutos( IbDtstTabelaCODIGO.AsInteger );
end;

procedure TfrmGePromocao.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirTabelaProdutos( IbDtstTabelaCODIGO.AsInteger );
end;

procedure TfrmGePromocao.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaProdutos( IbDtstTabelaCODIGO.Value );
end;

procedure TfrmGePromocao.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirTabelaProdutos( IbDtstTabelaCODIGO.AsInteger );
end;

procedure TfrmGePromocao.DtSrcProdutosStateChange(Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcProdutos.AutoEdit and (cdsProdutos.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcProdutos.AutoEdit and (cdsProdutos.State = dsBrowse) and (not cdsProdutos.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcProdutos.AutoEdit and (cdsProdutos.State = dsBrowse) and (not cdsProdutos.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsProdutos.State in [dsEdit, dsInsert] );

  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGePromocao.dbProdutoButtonClick(Sender: TObject);
var
  iCodigo     : Integer;
  sCodigoAlfa ,
  sDescricao  ,
  sUnidade    : String;
  cValorVenda   ,
  cValorPromocao: Currency;
begin
  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
    if ( SelecionarProduto(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, cValorVenda, cValorPromocao) ) then
    begin
      cdsProdutosCODIGO_PROD.AsString   := sCodigoAlfa;
      cdsProdutosDESCRI.AsString        := sDescricao;
      cdsProdutosUNIDADE.AsString       := sUnidade;
      cdsProdutosPRECO_VENDA.AsCurrency := cValorVenda;
    end;
end;

procedure TfrmGePromocao.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbAtiva.ReadOnly       := ( IbDtstTabela.State in [dsInsert] );
  DtSrcProdutos.AutoEdit := ( IbDtstTabela.State in [dsEdit, dsInsert] );
  DtSrcProdutosStateChange( DtSrcProdutos );
end;

procedure TfrmGePromocao.cdsProdutosNewRecord(DataSet: TDataSet);
begin
  cdsProdutosCODIGO_PROM.Value := IbDtstTabelaCODIGO.Value;
  cdsProdutosDESCONTO.Value    := 0.0;
end;

procedure TfrmGePromocao.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaATIVA.Value               := 0;
  IbDtstTabelaDATA_INICIO.Value         := GetDateDB;
  IbDtstTabelaPERCENTUAL_DESCONTO.Value := 0;
  AbrirTabelaProdutos( IbDtstTabelaCODIGO.AsInteger );
end;

procedure TfrmGePromocao.btnProdutoInserirClick(Sender: TObject);
begin
  if ( cdsProdutos.Active ) then
  begin
    cdsProdutos.Append;
    cdsProdutosCODIGO_PROM.AsInteger := IbDtstTabelaCODIGO.AsInteger;
    cdsProdutosDESCONTO.AsCurrency   := IbDtstTabelaPERCENTUAL_DESCONTO.AsCurrency;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGePromocao.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsProdutos.IsEmpty ) then
  begin
    cdsProdutos.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGePromocao.btnProdutoExcluirClick(Sender: TObject);
begin
  if ( not cdsProdutos.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      cdsProdutos.Delete;
end;

procedure TfrmGePromocao.btnProdutoSalvarClick(Sender: TObject);
begin
  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsProdutosCODIGO_PROD.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( (cdsProdutosDESCONTO.AsCurrency < 0) or (cdsProdutosDESCONTO.AsCurrency > 100) ) then
    begin
      ShowWarning('Percentual de desconto inválido.');
      dbDesconto.SetFocus;
    end
    else
    begin

      cdsProdutos.Post;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGePromocao.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbProduto ) then
    if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsProdutosCODIGO_PROD.AsString, 0) );

  if ( Sender = dbDesconto ) then
    if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
    begin
      if ( cdsProdutosPRECO_VENDA.IsNull ) then
        cdsProdutosPRECO_VENDA.AsCurrency := 0;

      if ( cdsProdutosDESCONTO.IsNull ) then
        cdsProdutosDESCONTO.AsCurrency := 0;

      cdsProdutosPRECO_PROMOCAO.Value := cdsProdutosPRECO_VENDA.AsCurrency - (cdsProdutosPRECO_VENDA.AsCurrency * cdsProdutosDESCONTO.AsCurrency / 100);
    end;

  if ( Sender = dbValorPromocao ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
      
end;

procedure TfrmGePromocao.CarregarDadosProduto(const ProdutoID: Integer);
begin
  if ( ProdutoID = 0 ) then
  begin
    ShowWarning('Favor informar o código do produto');
    Exit;
  end;

  if ( not cdsProdutos.Active ) then
    Exit
  else
  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('Codigo').AsInteger := ProdutoID;
      Open;

      if not IsEmpty then
      begin
        cdsProdutosCODIGO_PROD.AsString   := FieldByName('Cod').AsString;
        cdsProdutosDESCRI.AsString        := FieldByName('Descri').AsString;
        cdsProdutosPRECO_VENDA.AsCurrency := FieldByName('Preco').AsCurrency;
      end
      else
      begin
        ShowWarning('Código de produto não cadastrado');

        cdsProdutosCODIGO_PROD.Clear;

        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGePromocao.dbValorPromocaoButtonClick(Sender: TObject);
var
  sValor : String;
  cValor : Currency;
begin
  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
  begin
    sValor := InputBox('VALOR PROMOÇÃO (R$)', 'Favor informar o Valor Promocional:', FormatFloat(',0.00', dbValorPromocao.Field.AsCurrency));
    sValor := Trim(StringReplace(sValor, '.', '', [rfReplaceAll]));
    cValor := StrToCurrDef(sValor, 0);
    
    if ( cValor > 0 ) then
    begin
      cdsProdutosPRECO_PROMOCAO.AsCurrency := cValor;
      cdsProdutosDESCONTO.AsCurrency       := (1 - (cdsProdutosPRECO_PROMOCAO.Value / cdsProdutosPRECO_VENDA.AsCurrency)) * 100;
    end;
  end;
end;

procedure TfrmGePromocao.cdsProdutosCalcFields(DataSet: TDataSet);
begin
  cdsProdutosSequencial.Value := cdsProdutos.RecNo;
end;

procedure TfrmGePromocao.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
      cdsProdutos.Post;

    cdsProdutos.ApplyUpdates;
    CommitTransaction;
  end;
end;

procedure TfrmGePromocao.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if ( IbDtstTabelaATIVA.AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := clRed;
    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGePromocao', TfrmGePromocao);

end.
