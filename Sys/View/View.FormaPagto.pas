unit View.FormaPagto;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,

  Data.DB,
  Datasnap.DBClient,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela;

type
  TViewFormaPagto = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblAcrescimo: TLabel;
    dbAcrescimo: TDBEdit;
    dbDecrementarLimite: TDBCheckBox;
    lblFormaPagtoNCFe: TLabel;
    dbFormaPagtoNCFe: TDBLookupComboBox;
    dtsFormaPagtoNCFe: TDataSource;
    dbFormaPagtoPDV: TDBCheckBox;
    dtsContaCorrente: TDataSource;
    dbFormaPagtoPDVRelatorio: TDBCheckBox;
    dbAtiva: TDBCheckBox;
    lblRegistroDesativado: TLabel;
    cdsContaCorrente: TClientDataSet;
    pnlDicas: TPanel;
    dbgContaCorrente: TDBGrid;
    pnlContaCorrente: TPanel;
    lblDicasTitulo: TLabel;
    lblDicasTexto: TLabel;
    imgGrid: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure dbgContaCorrenteDblClick(Sender: TObject);
    procedure dbgContaCorrenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    FControllerFormaPagtoContaCorrente,
    FControllerFormaPagtoNFCEView     : IControllerCustom;
    procedure CarregarContaCorrente;
  public
    { Public declarations }
    procedure GravarRelacaoFormaConta;
  end;

(*
  Tabelas:
  - TBFORMPAGTO
  - TBCONTA_CORRENTE
  - TBEMPRESA
  - TBFORMPAGTO_CONTACOR

  Views:
  - VW_FORMA_PAGTO_NFC_E

  Procedures:

*)

var
  ViewFormaPagto: TViewFormaPagto;

  procedure MostrarTabelaFormaPagtos(const AOwner : TComponent);

  function SelecionarFormaPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
  function SelecionarFormaPagtoPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness,
  UConstantesDGE,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper;

{$R *.dfm}

procedure MostrarTabelaFormaPagtos(const AOwner : TComponent);
var
  frm : TViewFormaPagto;
begin
  frm := TViewFormaPagto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarFormaPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewFormaPagto;
begin
  frm := TViewFormaPagto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarFormaPagtoPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewFormaPagto;
begin
  frm := TViewFormaPagto.Create(AOwner);
  try
    frm.btbtnIncluir.Visible  := False;
    frm.btbtnAlterar.Visible  := False;
    frm.btbtnExcluir.Visible  := False;
    frm.btbtnCancelar.Visible := False;
    frm.btbtnSalvar.Visible   := False;
    frm.btbtnLista.Visible    := False;

    frm.WhereAdditional := '(p.FormaPagto_PDV = 1) and ' +
      '(p.cod in (Select fc.forma_pagto from TBFORMPAGTO_CONTACOR fc inner join TBCONTA_CORRENTE c on (c.codigo = fc.conta_corrente) where c.tipo = 1))'; // Conta Corrente do tipo Caixa Diário


    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(frm.WhereAdditional);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);
  finally
    frm.Destroy;
  end;
end;

procedure TViewFormaPagto.CarregarContaCorrente;
begin
  FControllerFormaPagtoContaCorrente.DAO.DataSet.Close;

  FControllerFormaPagtoContaCorrente.DAO
    .ParamsByName('forma_pagto', DtSrcTabela.DataSet.FieldByName('cod').AsInteger)
    .Open;

  if not cdsContaCorrente.Active then
  begin
    cdsContaCorrente.CreateDataSet;

    // Preparar DataSet para a configuração dos campos
    TTabelaController.New
      .Tabela(cdsContaCorrente)
      .Display('selecionar', 'S', TAlignment.taCenter)
      .Display('codigo', 'Código', '00', TAlignment.taCenter)
      .Display('descricao', 'Conta Corrente')
      .Configurar;
  end
  else
    cdsContaCorrente.EmptyDataSet;

  with FControllerFormaPagtoContaCorrente do
  begin
    cdsContaCorrente.DisableControls;
    DAO.DataSet.DisableControls;
    try
      while not DAO.DataSet.Eof do
      begin
        cdsContaCorrente.Append;
        cdsContaCorrente.FieldByName('selecionar').Assign( DAO.DataSet.FieldByName('selecionar') );
        cdsContaCorrente.FieldByName('codigo').Assign( DAO.DataSet.FieldByName('conta_corrente') );
        cdsContaCorrente.FieldByName('descricao').Assign( DAO.DataSet.FieldByName('descricao') );
        cdsContaCorrente.FieldByName('tipo').Assign( DAO.DataSet.FieldByName('tipo') );
        cdsContaCorrente.FieldByName('empresa').Assign( DAO.DataSet.FieldByName('empresa') );
        cdsContaCorrente.Post;

        DAO.DataSet.Next;
      end;
    finally
      cdsContaCorrente.First;
      cdsContaCorrente.EnableControls;
      DAO.DataSet.EnableControls;
    end;
  end;
end;

procedure TViewFormaPagto.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.FormaPagto;
  FControllerFormaPagtoContaCorrente := TControllerFactory.New.FormaPagtoContaCorrente;
  FControllerFormaPagtoNFCEView  := TControllerFactory.New.FormaPagtoNFCEView;

  inherited;
  RotinaID         := ROTINA_CAD_FORMA_PAGTO_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '00';
  NomeTabela     := 'TBFORMPAGTO';
  CampoCodigo    := 'COD';
  CampoDescricao := 'DESCRI';
  CampoOrdenacao := 'COD';
  CampoCadastroAtivo := 'ATIVA';

  if (gSistema.Codigo = SISTEMA_PDV) then
    WhereAdditional := '(p.FormaPagto_PDV = 1) and ' +
      '(p.cod in (Select fc.forma_pagto from TBFORMPAGTO_CONTACOR fc inner join TBCONTA_CORRENTE c on (c.codigo = fc.conta_corrente) where c.tipo = 1))'; // Conta Corrente do tipo Caixa Diário

  dbFormaPagtoPDV.Visible          := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_OPME]);
  dbFormaPagtoPDVRelatorio.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_OPME]);
  if not dbFormaPagtoPDV.Visible then
    GrpBxDadosNominais.Height := 97;

  dbDecrementarLimite.Enabled := (GetUserFunctionID in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_GERENTE_ADM, FUNCTION_USER_ID_GERENTE_VND,
    FUNCTION_USER_ID_GERENTE_FIN, FUNCTION_USER_ID_AUX_FINANC1, FUNCTION_USER_ID_AUX_FINANC2, FUNCTION_USER_ID_SYSTEM_ADM]);

  Tabela
    .Display('COD', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('DESCRI', 'Descrição', True)
    .Display('ACRESCIMO',  '% Acréscimo',  ',0.00#', TAlignment.taRightJustify)
    .Display('FORMAPAGTO_NFCE', 'Forma de Pagamento NFC-e', True);

  AbrirTabelaAuto := True;
  TController(FControllerFormaPagtoNFCEView).LookupComboBox(dbFormaPagtoNCFe, dtsFormaPagtoNCFe, 'FormaPagto_NFCe', 'codigo', 'descricao');

  if (gSistema.Codigo = SISTEMA_PDV) then
  begin
    FController.DAO.Open;
    Tabela.Configurar;
  end;

  DtSrcTabela.DataSet.AfterScroll := DtSrcTabelaAfterScroll;
end;

procedure TViewFormaPagto.dbgContaCorrenteDblClick(Sender: TObject);
begin
  if dtsContaCorrente.AutoEdit then
    if ( not dtsContaCorrente.DataSet.IsEmpty ) then
    begin
      dtsContaCorrente.DataSet.Edit;
      if ( dtsContaCorrente.DataSet.FieldByName('selecionar').AsInteger = 0 ) then
        dtsContaCorrente.DataSet.FieldByName('selecionar').AsInteger := 1
      else
        dtsContaCorrente.DataSet.FieldByName('selecionar').AsInteger := 0;
      dtsContaCorrente.DataSet.Post;
    end;
end;

procedure TViewFormaPagto.dbgContaCorrenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgContaCorrenteDblClick(Sender);
end;

procedure TViewFormaPagto.dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  aImage : Byte;
begin
  inherited;
  if (Sender = dbgContaCorrente) then
  begin

    if (AnsiUpperCase(Column.Field.FieldName) = 'SELECIONAR') then
    begin
      aImage := Column.Field.AsInteger;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
    end
    else
    if (AnsiUpperCase(Column.Field.FieldName) = 'SELECIONAR') then
    begin
      aImage := Column.Field.AsInteger;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
    end
    else
    if (AnsiUpperCase(Column.Field.FieldName) = 'SELECIONAR') then
    begin
      aImage := Column.Field.AsInteger;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
    end;

  end;
end;

procedure TViewFormaPagto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dtsContaCorrente.AutoEdit := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TViewFormaPagto.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarContaCorrente;
end;

procedure TViewFormaPagto.GravarRelacaoFormaConta;
var
  sSQL : String;
const
  SQL_INSERT = 'Insert Into TBFORMPAGTO_CONTACOR (FORMA_PAGTO, CONTA_CORRENTE, SELECIONAR) values (%s, %s, 1)';
  SQL_DELETE = 'Delete from TBFORMPAGTO_CONTACOR where FORMA_PAGTO = %s and CONTA_CORRENTE = %s';
begin
  dtsContaCorrente.DataSet.First;
  dtsContaCorrente.DataSet.DisableControls;
  try
    while not dtsContaCorrente.DataSet.Eof do
    begin
      if dtsContaCorrente.DataSet.FieldByName('selecionar').AsInteger = 1 then
        sSQL := SQL_INSERT
      else
        sSQL := SQL_DELETE;

      FController.DAO.ExecuteScriptSQL(
        Format(SQL_DELETE,
          [DtSrcTabela.DataSet.FieldByName('cod').AsString, dtsContaCorrente.DataSet.FieldByName('codigo').AsString])
      );

      FController.DAO.ExecuteScriptSQL(
        Format(sSQL,
          [DtSrcTabela.DataSet.FieldByName('cod').AsString, dtsContaCorrente.DataSet.FieldByName('codigo').AsString])
      );

      dtsContaCorrente.DataSet.Next;
    end;

    FController.DAO.CommitTransaction;
  finally
    dtsContaCorrente.DataSet.First;
    dtsContaCorrente.DataSet.EnableControls;
  end;
end;

procedure TViewFormaPagto.pgcGuiasChange(Sender: TObject);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
    CarregarContaCorrente;
end;

procedure TViewFormaPagto.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    CarregarContaCorrente;
end;

procedure TViewFormaPagto.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    CarregarContaCorrente;
end;

procedure TViewFormaPagto.btbtnSalvarClick(Sender: TObject);
begin
  DtSrcTabela.DataSet.AfterScroll := nil;
  inherited;
  DtSrcTabela.DataSet.AfterScroll := DtSrcTabelaAfterScroll;

  if ( not OcorreuErro ) then
    GravarRelacaoFormaConta;
end;

procedure TViewFormaPagto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarContaCorrente;
end;

procedure TViewFormaPagto.btnFiltrarClick(Sender: TObject);
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
  begin
    CampoDescricao  := 'p.cod';
    WhereAdditional := '(p.FormaPagto_PDV = 1) and ' +
      '(p.cod in (Select fc.forma_pagto from TBFORMPAGTO_CONTACOR fc inner join TBCONTA_CORRENTE c on (c.codigo = fc.conta_corrente) where c.tipo = 1))'; // Conta Corrente do tipo Caixa Diário
  end;

  inherited;
end;

initialization
  FormFunction.RegisterForm('ViewFormaPagto', TViewFormaPagto);

end.
