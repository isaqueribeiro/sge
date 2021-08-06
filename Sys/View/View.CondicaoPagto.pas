unit View.CondicaoPagto;

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
  TViewCondicaoPagto = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    dbPrazo: TDBCheckBox;
    lblPrazo01: TLabel;
    dbPrazo01: TDBEdit;
    lblPrazo02: TLabel;
    dbPrazo02: TDBEdit;
    lblPrazo03: TLabel;
    dbPrazo03: TDBEdit;
    dbPrazo04: TDBEdit;
    lblPrazo04: TLabel;
    lblPrazo05: TLabel;
    dbPrazo05: TDBEdit;
    dbPrazo06: TDBEdit;
    lblPrazo06: TLabel;
    dbPrazo07: TDBEdit;
    lblPrazo07: TLabel;
    dbPrazo08: TDBEdit;
    lblPrazo08: TLabel;
    lblPrazo09: TLabel;
    dbPrazo09: TDBEdit;
    dbPrazo10: TDBEdit;
    lblPrazo10: TLabel;
    dbPrazo11: TDBEdit;
    lblPrazo11: TLabel;
    dbPrazo12: TDBEdit;
    lblPrazo12: TLabel;
    dbCondicaoPagtoPDV: TDBCheckBox;
    dtsFormaPagto: TDataSource;
    lblRegistroDesativado: TLabel;
    dbAtiva: TDBCheckBox;
    pnlFormaPagto: TPanel;
    pnlDicas: TPanel;
    lblDicasTitulo: TLabel;
    lblDicasTexto: TLabel;
    dbgFormaPagto: TDBGrid;
    cdsFormaPagto: TClientDataSet;
    imgGrid: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbgFormaPagtoDblClick(Sender: TObject);
    procedure dbgFormaPagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure cdsFormaPagtoSelecionarGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
    procedure DtSrcTabelaAPrazoGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    FControllerCondicaoPagtoForma : IControllerCustom;
    procedure CarregarFormaPagto;
  public
    { Public declarations }
    procedure GravarRelacaoFormaCondicao;
  end;

(*
  Tabelas:
  - TBCONDICAOPAGTO
  - TBFORMPAGTO
  - TBFORMPAGTO_CONDICAO

  Views:

  Procedures:

*)

var
  ViewCondicaoPagto: TViewCondicaoPagto;

  procedure MostrarTabelaCondicoesPagto(const AOwner : TComponent);
  function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String; var Prazos : IntegerArray) : Boolean; overload;

implementation

uses
  UDMBusiness,
  UConstantesDGE,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaCondicoesPagto(const AOwner : TComponent);
var
  frm : TViewCondicaoPagto;
begin
  frm := TViewCondicaoPagto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewCondicaoPagto;
begin
  frm := TViewCondicaoPagto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String; var Prazos : IntegerArray) : Boolean;
var
  frm : TViewCondicaoPagto;
  I : Integer;
begin
  frm := TViewCondicaoPagto.Create(AOwner);
  try
    with frm, DtSrcTabela.DataSet do
    begin
      Result := SelecionarRegistro(Codigo, Nome);

      if ( Result ) then
      begin
        for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
          if ( not FieldByName('COND_PRAZO_' + FormatFloat('00', I)).IsNull ) then
          begin
            //SetLength(Prazos, Length(Prazos) + I);;
            Prazos[I] := FieldByName('COND_PRAZO_' + FormatFloat('00', I)).AsInteger;
          end;
      end;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TViewCondicaoPagto.FormCreate(Sender: TObject);
var
  I ,
  X : SmallInt;
begin
  FController := TControllerFactory.New.CondicaoPagto;
  FControllerCondicaoPagtoForma := TControllerFactory.New.CondicaoPagtoForma;

  inherited;
  RotinaID            := ROTINA_CAD_CONDICAO_PAGTO_ID;
  ControlFirstEdit    := dbNome;
  DisplayFormatCodigo := '000';

  NomeTabela     := 'TBCONDICAOPAGTO';
  CampoCodigo    := 'Cond_cod';
  CampoDescricao := 'Cond_descricao';
  CampoOrdenacao := '3, 19'; // Cond_prazo, Cond_descricao_full
  CampoCadastroAtivo := 'ATIVA';

  if (gSistema.Codigo = SISTEMA_PDV) then
    WhereAdditional := '(c.Cond_pdv = 1)';

  btbtnIncluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnAlterar.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnExcluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnCancelar.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnSalvar.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  dbgFormaPagto.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_OPME]);

  dbCondicaoPagtoPDV.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV]);
  if not dbCondicaoPagtoPDV.Visible then
    GrpBxDadosNominais.Height := 153;

  for I := -1 to 1 do
  begin
    X := StrToInt(FormatDateTime('YYYY', Date)) + I;
    GerarCompetencias( X );
  end;

  Tabela
    .Display('COND_COD', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('COND_DESCRICAO', 'Descrição', True)
    .Display('APrazo', 'A Prazo?', TAlignment.taCenter);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);

  DtSrcTabela.DataSet.AfterScroll := DtSrcTabelaAfterScroll;
end;

procedure TViewCondicaoPagto.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( Field = FieldByName('COND_PRAZO') ) then
    begin
      dbPrazo01.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo02.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo03.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo04.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo05.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo06.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo07.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo08.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo09.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo10.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo11.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo12.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
    end;
  end;
end;

procedure TViewCondicaoPagto.CarregarFormaPagto;
begin
  FControllerCondicaoPagtoForma.DAO.DataSet.Close;

  FControllerCondicaoPagtoForma.DAO
    .ParamsByName('condicao_pagto', DtSrcTabela.DataSet.FieldByName('Cond_cod').AsInteger)
    .Open;

  if not cdsFormaPagto.Active then
  begin
    cdsFormaPagto.CreateDataSet;
    cdsFormaPagto.FieldByName('selecionar').OnGetText := cdsFormaPagtoSelecionarGetText;

    // Preparar DataSet para a configuração dos campos
    TTabelaController.New
      .Tabela(cdsFormaPagto)
      .Display('selecionar', 'S', TAlignment.taCenter)
      .Display('codigo', 'Código', '00', TAlignment.taCenter)
      .Display('descricao', 'Forma de Pagamento')
      .Display('pdv', 'PDV', TAlignment.taCenter)
      .Configurar;
  end
  else
    cdsFormaPagto.EmptyDataSet;

  with FControllerCondicaoPagtoForma do
  begin
    cdsFormaPagto.DisableControls;
    DAO.DataSet.DisableControls;
    try
      while not DAO.DataSet.Eof do
      begin
        cdsFormaPagto.Append;
        cdsFormaPagto.FieldByName('selecionar').Assign( DAO.DataSet.FieldByName('selecionar') );
        cdsFormaPagto.FieldByName('codigo').Assign( DAO.DataSet.FieldByName('forma_pagto') );
        cdsFormaPagto.FieldByName('descricao').Assign( DAO.DataSet.FieldByName('descricao') );
        cdsFormaPagto.FieldByName('pdv').Assign( DAO.DataSet.FieldByName('pdv') );
        cdsFormaPagto.Post;

        DAO.DataSet.Next;
      end;
    finally
      cdsFormaPagto.First;
      cdsFormaPagto.EnableControls;
      DAO.DataSet.EnableControls;
    end;
  end;
end;

procedure TViewCondicaoPagto.GravarRelacaoFormaCondicao;
var
  sSQL : String;
const
  SQL_INSERT = 'Insert Into TBFORMPAGTO_CONDICAO (FORMA_PAGTO, CONDICAO_PAGTO, SELECIONAR) values (%s, %s, 1)';
  SQL_DELETE = 'Delete from TBFORMPAGTO_CONDICAO where FORMA_PAGTO = %s and CONDICAO_PAGTO = %s';
begin
  dtsFormaPagto.DataSet.First;
  dtsFormaPagto.DataSet.DisableControls;
  try
    while not dtsFormaPagto.DataSet.Eof do
    begin
      if dtsFormaPagto.DataSet.FieldByName('selecionar').AsInteger = 1 then
        sSQL := SQL_INSERT
      else
        sSQL := SQL_DELETE;

      FController.DAO.ExecuteScriptSQL(
        Format(SQL_DELETE,
          [dtsFormaPagto.DataSet.FieldByName('codigo').AsString, DtSrcTabela.DataSet.FieldByName('Cond_cod').AsString])
      );

      FController.DAO.ExecuteScriptSQL(
        Format(sSQL,
          [dtsFormaPagto.DataSet.FieldByName('codigo').AsString, DtSrcTabela.DataSet.FieldByName('Cond_cod').AsString])
      );

      dtsFormaPagto.DataSet.Next;
    end;

    FController.DAO.CommitTransaction;
  finally
    dtsFormaPagto.DataSet.First;
    dtsFormaPagto.DataSet.EnableControls;
  end;
end;

procedure TViewCondicaoPagto.pgcGuiasChange(Sender: TObject);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
    CarregarFormaPagto;
end;

procedure TViewCondicaoPagto.dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  aImage : Byte;
begin
  inherited;
  if (Sender = dbgFormaPagto) then
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

procedure TViewCondicaoPagto.dbgFormaPagtoDblClick(Sender: TObject);
begin
  if dtsFormaPagto.AutoEdit then
    if ( not dtsFormaPagto.DataSet.IsEmpty ) then
    begin
      dtsFormaPagto.DataSet.Edit;
      if ( dtsFormaPagto.DataSet.FieldByName('selecionar').AsInteger = 0 ) then
        dtsFormaPagto.DataSet.FieldByName('selecionar').AsInteger := 1
      else
        dtsFormaPagto.DataSet.FieldByName('selecionar').AsInteger := 0;
      dtsFormaPagto.DataSet.Post;
    end;
end;

procedure TViewCondicaoPagto.dbgFormaPagtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgFormaPagtoDblClick(Sender);
end;

procedure TViewCondicaoPagto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarFormaPagto;
end;

procedure TViewCondicaoPagto.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    CarregarFormaPagto;
end;

procedure TViewCondicaoPagto.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    CarregarFormaPagto;
end;

procedure TViewCondicaoPagto.btbtnSalvarClick(Sender: TObject);
begin
  DtSrcTabela.DataSet.AfterScroll := nil;
  inherited;
  DtSrcTabela.DataSet.AfterScroll := DtSrcTabelaAfterScroll;

  if ( not OcorreuErro ) then
    GravarRelacaoFormaCondicao;
end;

procedure TViewCondicaoPagto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dtsFormaPagto.AutoEdit := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TViewCondicaoPagto.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarFormaPagto;
end;

procedure TViewCondicaoPagto.DtSrcTabelaAPrazoGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TViewCondicaoPagto.cdsFormaPagtoSelecionarGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

initialization
  FormFunction.RegisterForm('ViewCondicaoPagto', TViewCondicaoPagto);

end.
