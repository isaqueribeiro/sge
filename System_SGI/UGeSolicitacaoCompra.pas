unit UGeSolicitacaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, DB, IBX.IBCustomDataSet, IBX.IBUpdateSQL,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, cxButtons,
  ToolWin, IBTable, Menus, IBStoredProc, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  JvToolEdit, JvDBControls, JvExMask, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmGeSolicitacaoCompra = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    RdgStatusSolicitacao: TRadioGroup;
    lblSolicitacaoAberta: TLabel;
    lblSolicitacaoCancelada: TLabel;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataEmissao: TLabel;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblAprovador: TLabel;
    dbAprovador: TDBEdit;
    Bevel12: TBevel;
    DtSrcTabelaItens: TDataSource;
    pgcMaisDados: TPageControl;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblUnidade: TLabel;
    Bevel7: TBevel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    ppImprimir: TPopupMenu;
    nmImprimirSolicitacao: TMenuItem;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    dtsTipoSolicitacao: TDataSource;
    lblDataValidade: TLabel;
    tbsEventoLOG: TTabSheet;
    lblSolicitacaoEmEdicao: TLabel;
    PgcTextoSolicitacao: TPageControl;
    TbsSolicitacaoObjeto: TTabSheet;
    TbsSolicitacaoObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    TbsSolicitacaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblNomeSolicitante: TLabel;
    dbNomeSolicitante: TDBEdit;
    dbEventoLOG: TDBMemo;
    btnFinalizarSolicitacao: TcxButton;
    btnAprovarSolicitacao: TcxButton;
    btnCancelarSolicitacao: TcxButton;
    lblCentroCustoSolicitacao: TLabel;
    lblProdutoNome: TLabel;
    dtsUnidade: TDataSource;
    dbUnidade: TDBLookupComboBox;
    TbsSolicitacaoMotivo: TTabSheet;
    dbObjeto: TDBMemo;
    dbMotivo: TDBMemo;
    lblCentroCustoItem: TLabel;
    lblProdutoNaoCadastrado: TLabel;
    dbDataEmissao: TJvDBDateEdit;
    dbDataValidade: TJvDBDateEdit;
    dbCentroCustoSolicitacao: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbCentroCustoItem: TJvDBComboEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    fdQryEmpresa: TFDQuery;
    fdQryTipoSolicitacao: TFDQuery;
    fdQryUnidade: TFDQuery;
    fdQryTabelaANO: TSmallintField;
    fdQryTabelaCODIGO: TIntegerField;
    fdQryTabelaNUMERO: TStringField;
    fdQryTabelaTIPO: TSmallintField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaCENTRO_CUSTO: TIntegerField;
    fdQryTabelaNOME_SOLICITANTE: TStringField;
    fdQryTabelaOBJETO_SOLICITACAO: TMemoField;
    fdQryTabelaMOVITO: TMemoField;
    fdQryTabelaOBSERVACAO: TMemoField;
    fdQryTabelaDATA_EMISSAO: TDateField;
    fdQryTabelaVALIDADE: TDateField;
    fdQryTabelaCOMPETENCIA: TIntegerField;
    fdQryTabelaINSERCAO_DATA: TSQLTimeStampField;
    fdQryTabelaINSERCAO_USUARIO: TStringField;
    fdQryTabelaSTATUS: TSmallintField;
    fdQryTabelaAPROVACAO_DATA: TDateField;
    fdQryTabelaAPROVACAO_USUARIO: TStringField;
    fdQryTabelaCANCELADO_DATA: TDateField;
    fdQryTabelaCANCELADO_USUARIO: TStringField;
    fdQryTabelaCANCELADO_MOTIVO: TMemoField;
    fdQryTabelaLOG_EVENTO: TMemoField;
    fdQryTabelaITENS: TIntegerField;
    fdQryTabelaCENTRO_CUSTO_NOME: TStringField;
    cdsTabelaItens: TFDQuery;
    updTabelaItens: TFDUpdateSQL;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODIGO: TIntegerField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensCENTRO_CUSTO: TIntegerField;
    cdsTabelaItensITEM_CODIGO: TStringField;
    cdsTabelaItensITEM_DESCRICAO: TStringField;
    cdsTabelaItensITEM_CADASTRADO: TSmallintField;
    cdsTabelaItensQUANTIDADE: TBCDField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensUSUARIO: TStringField;
    cdsTabelaItensUNP_DESCRICAO: TStringField;
    cdsTabelaItensCENTRO_CUSTO_NOME: TStringField;
    fdQryProduto: TFDQuery;
    procedure dbCentroCustoSelecionar(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btnAprovarSolicitacaoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirSolicitacaoClick(Sender: TObject);
    procedure btnCancelarSolicitacaoClick(Sender: TObject);
    procedure btnFinalizarSolicitacaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure qryFornecedorVENCEDORGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    iCentroCusto    : Integer;
    procedure AbrirTabelaItens(const AnoCotacao : Smallint; const CodigoCotacao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure SetEventoLOG(sEvento : String);

    function GetRotinaFinalizarID : String;
    function GetRotinaAprovarID : String;
    function GetRotinaCancelarSolicitacaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaAprovarID   : String read GetRotinaAprovarID;
    property RotinaCancelarSolicitacaoID : String read GetRotinaCancelarSolicitacaoID;
  end;

(*
  Tabelas:
  - TBSOLICITACAO
  - TBSOLICITACAO_ITEM
  - TBCENTRO_CUSTO
  - TBUNIDADEPROD

  Views:
  - VW_EMPRESA
  - VW_TIPO_SOLICITACAO

  Procedures:

*)

var
  frmGeSolicitacaoCompra: TfrmGeSolicitacaoCompra;

  procedure MostrarControleSolicitacao(const AOwner : TComponent);

  function SelecionarSolicitacao(const AOwner : TComponent; CentroCusto : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeProduto,
  UGeCentroCusto, UGeSolicitacaoCompraCancelar;

{$R *.dfm}

procedure MostrarControleSolicitacao(const AOwner : TComponent);
var
  frm : TfrmGeSolicitacaoCompra;
  whr : String;
begin
  frm := TfrmGeSolicitacaoCompra.Create(AOwner);
  try
    whr := '(cast(s.data_emissao as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) ) + ')';

    if (frm.RdgStatusSolicitacao.ItemIndex > 0) then
      whr := whr + ' and (s.status = ' + IntToStr(frm.RdgStatusSolicitacao.ItemIndex - 1) + ')';

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + whr);
      SQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarSolicitacao(const AOwner : TComponent; CentroCusto : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  frm : TfrmGeSolicitacaoCompra;
  sNome : String;
  I : Integer;
begin
  frm := TfrmGeSolicitacaoCompra.Create(AOwner);
  try
    frm.btbtnIncluir.Visible            := False;
    frm.btnFinalizarSolicitacao.Visible := False;
    frm.btnAprovarSolicitacao.Visible   := False;
    frm.btnCancelarSolicitacao.Visible  := False;

    frm.RdgStatusSolicitacao.ItemIndex := STATUS_SOLICITACAO_FIN + 1;

    frm.RdgStatusSolicitacao.Enabled := False;
    //for I := 0 to frm.RdgStatusSolicitacao.Items.Count - 1 do
    //  frm.RdgStatusSolicitacao.Controls[I].Enabled := False;

    frm.iCentroCusto := 0;
    frm.e1Data.Date  := DataInicial;
    frm.WhereAdditional := //'(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
            'cast(s.data_emissao as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusSolicitacao.ItemIndex > 0) then
      frm.WhereAdditional := frm.WhereAdditional + ' and (s.status = ' + IntToStr(frm.RdgStatusSolicitacao.ItemIndex - 1) + ')';

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + WhereAdditional);
      SQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, sNome, frm.WhereAdditional);

    if ( Result ) then
      with frm.DtSrcTabela.DataSet do
      begin
        Ano     := FieldByName('ANO').AsInteger;
        Codigo  := FieldByName('CODIGO').AsInteger;
        Empresa := FieldByName('EMPRESA').AsString;
      end;
  finally
    frm.Destroy;
  end;

end;

procedure TfrmGeSolicitacaoCompra.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_SOLICITACAO_' + FormatFloat('0000', YearOf(GetDateDB));
  fdQryTabela.UpdateOptions.GeneratorName := sGeneratorName;
  CriarGenerator(fdQryTabela.UpdateOptions.GeneratorName, 0);

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SQL );

  e1Data.Date      := GetDateDB - 30;
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;
  iCentroCusto     := 0;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryTipoSolicitacao);
  CarregarLista(fdQryUnidade);

  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_SOLICITACAO_ID;
  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBSOLICITACAO';
  CampoCodigo    := 'c.codigo';
  CampoDescricao := 'c.descricao';
  CampoOrdenacao := 's.numero';

  WhereAdditional :=  '(cast(s.data_emissao as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';
end;

procedure TfrmGeSolicitacaoCompra.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;

  if ( not OcorreuErro ) then
    with DtSrcTabela.DataSet do
    begin
      FieldByName('ANO').AsInteger    := iAno;
      FieldByName('CODIGO').AsInteger := iNum;
      FieldByName('NUMERO').AsString  := FormatFloat('##0000000', FieldByName('CODIGO').AsInteger) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);

      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
    end;
end;

procedure TfrmGeSolicitacaoCompra.AbrirTabelaItens(
  const AnoCotacao: Smallint; const CodigoCotacao: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano    = ' + IntToStr(AnoCotacao));
    Add('  and i.codigo = ' + IntToStr(CodigoCotacao));
    Add('order by i.ano, i.codigo, i.seq');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeSolicitacaoCompra.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btnFinalizarSolicitacao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_EDC, STATUS_SOLICITACAO_ABR]) and (not cdsTabelaItens.IsEmpty);
      btnAprovarSolicitacao.Enabled   := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN]) and (not cdsTabelaItens.IsEmpty);
      btnCancelarSolicitacao.Enabled  := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]);

      nmImprimirSolicitacao.Enabled   := (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]);
    end
    else
    begin
      btnFinalizarSolicitacao.Enabled := False;
      btnAprovarSolicitacao.Enabled   := False;
      btnCancelarSolicitacao.Enabled  := False;

      nmImprimirSolicitacao.Enabled   := (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]);
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    Exit;

  fdQryTabela.RefreshRecord;
end;

procedure TfrmGeSolicitacaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger > STATUS_SOLICITACAO_FIN ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_SOLICITACAO_APR : sMsg := 'Esta solicitação não pode ser alterada por já está aprovada/encerrada.';
        STATUS_SOLICITACAO_CAN : sMsg := 'Esta solicitação não pode ser alterada porque está cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      if (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN]) then
        if not ShowConfirm('A análise da solicitação selecionada está em andamento (Aberta).' + #13 + 'Deseja colocá-la em edição novamente?') then
          Abort;

      inherited;

      if ( not OcorreuErro ) then
      begin
        FieldByName('STATUS').AsInteger := STATUS_SOLICITACAO_EDC;
        dbEventoLOG.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', GetDateTimeDB) + 'Solicitação reaberta para edição por ' + gUsuarioLogado.Login);
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
      end;
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSRcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger > STATUS_SOLICITACAO_FIN ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_SOLICITACAO_APR : sMsg := 'Esta solicitação não pode ser excluída por já está aprovada/encerrada.';
        STATUS_SOLICITACAO_CAN : sMsg := 'Esta solicitação não pode ser excluída porque está cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeSolicitacaoCompra.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( Trim(DtSRcTabela.DataSet.FieldByName('OBJETO_SOLICITACAO').AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma breve descrição sobre o objeto da solicitação!');
    PgcTextoSolicitacao.ActivePage := TbsSolicitacaoObjeto;
    dbObjeto.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensSEQ.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnProdutoExcluirClick(Sender: TObject);
var
  cTotalReferencia ,
  cTotalMaxBruto   ,
  cTotalMinBruto   ,
  cTotalMediaBruto : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;
(*
      GetToTais(cTotalReferencia);

      IbDtstTabelaVALOR_REF_TOTAL.AsCurrency := cTotalReferencia;
*)
    end;
end;

procedure TfrmGeSolicitacaoCompra.btnProdutoSalvarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensITEM_CODIGO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto/serviço.');
      dbProduto.SetFocus;
    end
    else
    if ( Trim(cdsTabelaItensITEM_DESCRICAO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar a descrição do produto/serviço.');
      dbProdutoNome.SetFocus;
    end
    else
    if ( cdsTabelaItensUNIDADE.AsInteger = 0 ) then
    begin
      ShowWarning('Favor selecionar a unidade de medida do produto/serviço.');
      dbUnidade.SetFocus;
    end
    else
    if ( cdsTabelaItensQUANTIDADE.AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  cdsTabelaItensANO.Assign( DtSrcTabela.DataSet.FieldByName('ANO') );
  cdsTabelaItensCODIGO.Assign( DtSrcTabela.DataSet.FieldByName('CODIGO') );
  cdsTabelaItensQUANTIDADE.Value := 1;
  cdsTabelaItensUSUARIO.Value    := gUsuarioLogado.Login;
  cdsTabelaItensITEM_CADASTRADO.Value := 0;

  cdsTabelaItensCENTRO_CUSTO.Assign( DtSrcTabela.DataSet.FieldByName('CENTRO_CUSTO') );
  cdsTabelaItensCENTRO_CUSTO_NOME.Assign( DtSrcTabela.DataSet.FieldByName('CENTRO_CUSTO_NOME') );

  cdsTabelaItensITEM_CODIGO.Clear;
  cdsTabelaItensITEM_DESCRICAO.Clear;
end;

procedure TfrmGeSolicitacaoCompra.btnAprovarSolicitacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;

    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);

    if not (FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_FIN) then
      ShowInformation('Apenas solicitações finalizadas/encerradas podem sem aprovadas!')
    else
    if ( ShowConfirm('Confirma a aprovação do solicitação selecionada?') ) then
    begin
      Edit;

      dbEventoLOG.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', GetDateTimeDB) + 'Solicitação aprovada por ' + gUsuarioLogado.Login);
      FieldByName('STATUS').Value            := STATUS_SOLICITACAO_APR;
      FieldByName('APROVACAO_DATA').Value    := GetDateDB;
      FieldByName('APROVACAO_USUARIO').Value := gUsuarioLogado.Login;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Solicitação aprovada realizada com sucesso !' + #13#13 +
        'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusSolicitacao.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex   := 0;
  PgcTextoSolicitacao.ActivePage := TbsSolicitacaoObjeto;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_SOLICITACAO_APR );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeSolicitacaoCompra.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
end;

procedure TfrmGeSolicitacaoCompra.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  TbsSolicitacaoCancelado.TabVisible := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_CAN);
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeSolicitacaoCompra.fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeSolicitacaoCompra.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EMPRESA').Value             := gUsuarioLogado.Empresa;
    FieldByName('TIPO').Value                := TIPO_SOLICITACAO_COMPRA;
    FieldByName('INSERCAO_DATA').Value       := GetDateTimeDB;
    FieldByName('INSERCAO_USUARIO').Value    := gUsuarioLogado.Login;
    FieldByName('DATA_EMISSAO').Value        := GetDateDB;
    FieldByName('VALIDADE').Value            := FieldByName('DATA_EMISSAO').Value + GetPrazoValidadeCotacaoCompra(FieldByName('EMPRESA').AsString);
    FieldByName('STATUS').AsInteger          := STATUS_SOLICITACAO_EDC;
    FieldByName('NOME_SOLICITANTE').AsString := gUsuarioLogado.Nome;

    FieldByName('CENTRO_CUSTO').Clear;
    FieldByName('CENTRO_CUSTO_NOME').Clear;
    FieldByName('APROVACAO_DATA').Clear;
    FieldByName('APROVACAO_USUARIO').Clear;
    FieldByName('CANCELADO_DATA').Clear;
    FieldByName('CANCELADO_USUARIO').Clear;
    FieldByName('CANCELADO_MOTIVO').Clear;
  end;
end;

procedure TfrmGeSolicitacaoCompra.fdQryTabelaSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_SOLICITACAO_EDC : Text := 'Em Edição';
    STATUS_SOLICITACAO_ABR : Text := 'Aberta';
    STATUS_SOLICITACAO_FIN : Text := 'Finalizada';
    STATUS_SOLICITACAO_APR : Text := 'Aprovada';
    STATUS_SOLICITACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TfrmGeSolicitacaoCompra.fdQryTabelaTIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_SOLICITACAO_COMPRA :
        Text := 'Compra';

      TIPO_SOLICITACAO_SERVICO:
        Text := 'Serviço';

      TIPO_SOLICITACAO_COMPRA_SERVICO:
        Text := 'Compra/Serviço';
    end;
end;

procedure TfrmGeSolicitacaoCompra.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeSolicitacaoCompra.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  with DtSRcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );

  pgcMaisDados.ActivePage := tbsEventoLOG;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeSolicitacaoCompra.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := IfThen(iCentroCusto = 0, '', '(s.centro_custo = ' + IntToStr(iCentroCusto) + ') and ') +
    'cast(s.data_emissao as date) between ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if ( RdgStatusSolicitacao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (s.status = ' + IntToStr(RdgStatusSolicitacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TfrmGeSolicitacaoCompra.CarregarDadosProduto(Codigo: Integer);
begin
  if ( Codigo = 0 ) then
  begin
    ShowWarning('Favor informar o código do produto');
    Exit;
  end;

  if ( not cdsTabelaItens.Active ) then
    Exit
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    with fdQryProduto do
    begin
      Close;
      ParamByName('produto').AsInteger := Codigo;
      Open;

      if not IsEmpty then
      begin
        cdsTabelaItensITEM_CODIGO.AsString      := FieldByName('cod').AsString;
        cdsTabelaItensITEM_DESCRICAO.AsString   := FieldByName('descri_apresentacao').AsString;
        cdsTabelaItensUNP_DESCRICAO.AsString    := FieldByName('Unp_descricao').AsString;
        cdsTabelaItensITEM_CADASTRADO.AsInteger := 1;


        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        ShowWarning('Código de produto não cadastrado!');
        cdsTabelaItensITEM_CODIGO.Clear;
      end;
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btbtnSalvarClick(Sender: TObject);
var
  sControle : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( cdsTabelaItens.IsEmpty ) then
      ShowWarning('Favor informar o(s) produto(s) da autorização.')
    else
    if ( btnProdutoSalvar.Enabled ) then
    begin
      ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da solicitação!');
      btnProdutoSalvar.SetFocus;
    end
    else
    begin

      if Trim(FieldByName('NUMERO').AsString) = EmptyStr then
        FieldByName('NUMERO').AsString := FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger);

      if GetExisteNumeroSolicitacao(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('NUMERO').AsString, sControle) then
      begin
        ShowWarning('Número de solicitação já existe!');
        Abort;
      end;

      FieldByName('STATUS').AsInteger            := STATUS_SOLICITACAO_ABR;
      FieldByName('OBJETO_SOLICITACAO').AsString := Trim(AnsiUpperCase(FieldByName('OBJETO_SOLICITACAO').AsString));
      FieldByName('MOVITO').AsString             := Trim(AnsiUpperCase(FieldByName('MOVITO').AsString));
      FieldByName('OBSERVACAO').AsString         := Trim(AnsiUpperCase(FieldByName('OBSERVACAO').AsString));

      inherited;

      if ( not OcorreuErro ) then
      begin

        // Salvar Itens

        if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
          cdsTabelaItens.Post;

        cdsTabelaItens.ApplyUpdates;
        cdsTabelaItens.CommitUpdates;

        RecarregarRegistro;
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
      end;

      HabilitarDesabilitar_Btns;
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( Sender = dbDataEmissao ) then
      if ( State in [dsEdit, dsInsert] ) then
        FieldByName('VALIDADE').Value := FieldByName('DATA_EMISSAO').Value + GetPrazoValidadeCotacaoCompra(FieldByName('EMPRESA').AsString);

    if ( Sender = dbProduto ) then
      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        CarregarDadosProduto( StrToIntDef(cdsTabelaItensITEM_CODIGO.AsString, 0) );

    if ( Sender = dbQuantidade ) then
      if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
        btnProdutoSalvar.SetFocus;
  end;
end;

procedure TfrmGeSolicitacaoCompra.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeSolicitacaoCompra.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar solicitação em edição
    if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_EDC ) then
      dbgDados.Canvas.Brush.Color := lblSolicitacaoEmEdicao.Color
    else
    // Destacar solicitação aberta
    if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_ABR ) then
      dbgDados.Canvas.Font.Color := lblSolicitacaoAberta.Font.Color
    else
    // Destacar solicitação cancelada
    if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_CAN ) then
      dbgDados.Canvas.Font.Color := lblSolicitacaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos já não cadastrados
  if ( Sender = dbgProdutos ) then
  begin
    if ( cdsTabelaItensITEM_CADASTRADO.AsInteger = 0 ) then
      dbgProdutos.Canvas.Font.Color := lblProdutoNaoCadastrado.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeSolicitacaoCompra.dbProdutoButtonClick(Sender: TObject);
var
  bSelecionado : Boolean;
  iCodigo    ,
  iCFOP_CNAE ,
  iUnidade   : Integer;
  iEstoque ,
  iReserva : Currency;
  sCodigoAlfa,
  sDescricao ,
  sUnidade   ,
  sNCM_SH    ,
  sCST       : String;
  cAliquota      ,
  cAliquotaPIS   ,
  cAliquotaCOFINS,
  cValorCusto   ,
  cValorVenda   ,
  cValorPromocao,
  cValorIPI     ,
  cPercRedBC    : Currency;
begin
  if ( Trim(DtSrcTabela.DataSet.FieldByName('OBJETO_SOLICITACAO').AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma breve descrição sobre o objeto da solicitação!');
    PgcTextoSolicitacao.ActivePage := TbsSolicitacaoObjeto;
    dbObjeto.SetFocus;
  end
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin

    cAliquota       := 0.0;
    cAliquotaPIS    := 0.0;
    cAliquotaCOFINS := 0.0;
    cValorVenda     := 0.0;
    cValorPromocao  := 0.0;
    cValorIPI       := 0.0;
    cPercRedBC      := 0.0;

    Case DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger of
      TIPO_SOLICITACAO_COMPRA:
        bSelecionado := SelecionarProdutoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      TIPO_SOLICITACAO_SERVICO:
        bSelecionado := SelecionarServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao);

      TIPO_SOLICITACAO_COMPRA_SERVICO:
        bSelecionado := SelecionarProdutoServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      else
        bSelecionado := False;
    end;

    if ( bSelecionado ) then
    begin
      cdsTabelaItensITEM_CODIGO.AsString      := sCodigoAlfa;
      cdsTabelaItensITEM_DESCRICAO.AsString   := sDescricao;
      cdsTabelaItensITEM_CADASTRADO.AsInteger := 1;
      cdsTabelaItensUNP_DESCRICAO.AsString    := sUnidade;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNIDADE.AsInteger := iUnidade;
    end;

  end;
end;

procedure TfrmGeSolicitacaoCompra.nmImprimirSolicitacaoClick(
  Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa
        , GetEmailEmpresa(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString)
        , dbTipo.Text
        , EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Open;
    end;

    with qrySolicitacaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('cod').AsInteger := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      ParamByName('emp').AsString  := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Open;
    end;

    frrSolicitacaoCompra.ShowReport;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnCancelarSolicitacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;
    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);

    if ( not (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]) ) then
      ShowInformation('Apenas registros finalizados e/ou aprovados podem ser cancelados!')
    else
    if ( CancelarCOT(Self, FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger) ) then
    begin
      RecarregarRegistro;

      ShowInformation('Solicitação cancelada com sucesso.' + #13#13 +
        'Ano/Controle: ' +
        FieldByName('ANO').AsString + '/' +
        FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));
      HabilitarDesabilitar_Btns;
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.btnFinalizarSolicitacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;

    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);

    if ( ShowConfirm('Confirma a finalização da solicitação?') ) then
    begin
      Edit;

      dbEventoLOG.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', GetDateTimeDB) + 'Solicitação finalizada por ' + gUsuarioLogado.Login);

      FieldByName('STATUS').AsInteger := STATUS_SOLICITACAO_FIN;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Solicitação finalizada com sucesso !' + #13#13 +
        'Ano/Número: ' +
        FieldByName('ANO').AsString + '/' +
        FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusSolicitacao.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmGeSolicitacaoCompra.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  if (Key = VK_RETURN) then
  begin

    with DtSrcTabela.DataSet do
      if (State in [dsEdit, dsInsert])  then
      begin

        if dbNumero.Focused then
          if ( Length(Trim(dbNumero.Text)) > 0 ) then
            if GetExisteNumeroSolicitacao(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, Trim(dbNumero.Text), sControle) then
              ShowWarning('Número de solicitação já existe!' + #13 + 'Controle: ' + sControle);

        if dbDataEmissao.Focused then
          if ( dbDataEmissao.Date > GetDateTimeDB ) then
              ShowWarning('A Data de Emissão da solicitação está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

      end;

  end;

  inherited;
end;

function TfrmGeSolicitacaoCompra.GetRotinaAprovarID: String;
begin
  Result := GetRotinaInternaID(btnAprovarSolicitacao);
end;

function TfrmGeSolicitacaoCompra.GetRotinaCancelarSolicitacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarSolicitacao);
end;

function TfrmGeSolicitacaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarSolicitacao);
end;

procedure TfrmGeSolicitacaoCompra.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarSolicitacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarSolicitacao.Caption, RotinaID);

    if btnAprovarSolicitacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAprovarID, btnAprovarSolicitacao.Caption, RotinaID);

    if btnCancelarSolicitacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarSolicitacaoID, btnCancelarSolicitacao.Caption, RotinaID);
  end;
end;

procedure TfrmGeSolicitacaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeSolicitacaoCompra.qryFornecedorVENCEDORGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( not Sender.IsNull ) then
    Case Sender.AsInteger of
      0 : Text := EmptyStr;
      1 : Text := 'X';
    end;
end;

procedure TfrmGeSolicitacaoCompra.SetEventoLOG(sEvento: String);
var
  sMensagem : String;
begin
  sMensagem := FormatDateTime('dd/mm/yyyy hh:mm', Now) + ' - ' + sEvento + ' (por ' + gUsuarioLogado.Login + ').';
  try
    if ( not DtSrcTabela.DataSet.IsEmpty ) then
    begin
      DtSrcTabela.DataSet.Edit;

      dbEventoLOG.Lines.Add(sMensagem);

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;
    end;
  finally
  end;
end;

procedure TfrmGeSolicitacaoCompra.dbCentroCustoSelecionar(Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if (Sender = dbCentroCustoSolicitacao) then
      if ( State in [dsInsert] ) then
        if ( SelecionarDepartamento(Self, 0, FieldByName('EMPRESA').AsString, iCodigo, sNome, iCliente) ) then
        begin
            FieldByName('CENTRO_CUSTO').AsInteger     := iCodigo;
            FieldByName('CENTRO_CUSTO_NOME').AsString := sNome;
        end;

    if (Sender = dbCentroCustoItem) then
      if ( cdsTabelaItens.State in [dsInsert] ) then
        if ( SelecionarDepartamento(Self, 0, FieldByName('EMPRESA').AsString, iCodigo, sNome, iCliente) ) then
        begin
            cdsTabelaItensCENTRO_CUSTO.AsInteger     := iCodigo;
            cdsTabelaItensCENTRO_CUSTO_NOME.AsString := sNome;
        end;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeSolicitacaoCompra', TfrmGeSolicitacaoCompra);

end.
