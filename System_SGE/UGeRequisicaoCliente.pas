unit UGeRequisicaoCliente;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, Menus, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  JvToolEdit, JvDBControls, JvExMask,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, System.ImageList;

type
  TfrmGeRequisicaoCliente = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    RdgStatusRequisicao: TRadioGroup;
    lblRequisicaoAberta: TLabel;
    lblRequisicaoCancelada: TLabel;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    lblCliente: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataMovimento: TLabel;
    lblResponsavel: TLabel;
    dbResponsavel: TDBEdit;
    dbResponsavelRG: TDBEdit;
    lblResponsavelRG: TLabel;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblAutorizador: TLabel;
    dbAutorizador: TDBEdit;
    Bevel12: TBevel;
    DtSrcTabelaItens: TDataSource;
    pgcMaisDados: TPageControl;
    tbsRecebimento: TTabSheet;
    pnlObservacao: TPanel;
    lblObservacao: TLabel;
    Bevel15: TBevel;
    dbObservacao: TDBMemo;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblUnidade: TLabel;
    Bevel7: TBevel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbUnidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    ppImprimir: TPopupMenu;
    nmImprimirRequisicao: TMenuItem;
    lblEstoqueSatelite: TLabel;
    dbEstoqueSatelite: TDBEdit;
    btnAutorizarRequisicao: TcxButton;
    btnCancelarRequisicao: TcxButton;
    dbCliente: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbDataMovimento: TJvDBDateEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    fdQryTabelaANO: TSmallintField;
    fdQryTabelaNUMERO: TFDAutoIncField;
    fdQryTabelaCODEMPRESA: TStringField;
    fdQryTabelaCODCLIENTE: TIntegerField;
    fdQryTabelaDATA_MOVIMENTO: TDateField;
    fdQryTabelaINSERCAO_DATA: TDateField;
    fdQryTabelaINSERCAO_HORA: TTimeField;
    fdQryTabelaINSERCAO_USUARIO: TStringField;
    fdQryTabelaSITUACAO: TSmallintField;
    fdQryTabelaOBSERVACOES: TMemoField;
    fdQryTabelaAUTORIZACAO_DATA: TDateField;
    fdQryTabelaAUTORIZACAO_USUARIO: TStringField;
    fdQryTabelaRECEBEDOR_NOME: TStringField;
    fdQryTabelaRECEBEDOR_RG: TStringField;
    fdQryTabelaCANCELADO_DATA: TDateField;
    fdQryTabelaCANCELADO_MOTIVO: TMemoField;
    fdQryTabelaNOME: TStringField;
    fdQryTabelaITENS: TIntegerField;
    cdsTabelaItens: TFDQuery;
    updTabelaItens: TFDUpdateSQL;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensNUMERO: TIntegerField;
    cdsTabelaItensITEM: TSmallintField;
    cdsTabelaItensCODEMPRESA: TStringField;
    cdsTabelaItensCODCLIENTE: TIntegerField;
    cdsTabelaItensCODPRODUTO: TStringField;
    cdsTabelaItensQUANTIDADE: TIntegerField;
    cdsTabelaItensQUANTIDADE_FINAL: TIntegerField;
    cdsTabelaItensVALOR_MEDIO: TBCDField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensUSUARIO: TStringField;
    cdsTabelaItensDESCRI: TStringField;
    cdsTabelaItensUNP_SIGLA: TStringField;
    cdsTabelaItensESTOQUE_SATELITE: TBCDField;
    fdQryEmpresa: TFDQuery;
    qryProduto: TFDQuery;
    fdQryTabelaVENDA_ANO: TSmallintField;
    fdQryTabelaVENDA_NUM: TIntegerField;
    cdsTabelaItensLOTE_ID: TStringField;
    fdQryLotes: TFDQuery;
    dtsLotes: TDataSource;
    lblLoteProduto: TLabel;
    dbLoteProduto: TDBLookupComboBox;
    cdsTabelaItensESTOQUE_APROP_LOTE: TSmallintField;
    cdsTabelaItensLOTE: TStringField;
    cdsTabelaItensFABRICACAO: TDateField;
    cdsTabelaItensVALIDADE: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btnAutorizarRequisicaoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirRequisicaoClick(Sender: TObject);
    procedure btnCancelarRequisicaoClick(Sender: TObject);
    procedure RdgStatusRequisicaoClick(Sender: TObject);
    procedure fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaSITUACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure cdsTabelaItensAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    procedure AbrirTabelaItens(const AnoRequisicao : Smallint; const NumeroRequisicao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure CarregarLotes(const aEmpresa, aProduto : String; const aCliente : Integer; const aTodos : Boolean);
    procedure HabilitarDesabilitar_Btns;
    procedure ControleCampoLote;
    procedure RecarregarRegistro;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCLIENTE_REQUISICAO
  - TBCLIENTE_REQUISICAO_ITEM
  - TBCLIENTE
  - TBCLIENTE_ESTOQUE
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBGRUPOPROD
  - TBSECAOPROD
  - TBCFOP
  - TBPRODUTO_CLIENTE

  Views:
  - VW_EMPRESA

  Procedures:

*)

var
  frmGeRequisicaoCliente: TfrmGeRequisicaoCliente;

  procedure MostrarControleRequisicaoCliente(const AOwner : TComponent);

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeCliente;

{$R *.dfm}

procedure MostrarControleRequisicaoCliente(const AOwner : TComponent);
var
  frm : TfrmGeRequisicaoCliente;
  whr : String;
begin
  frm := TfrmGeRequisicaoCliente.Create(AOwner);
  try
    whr := 'cast(r.data_movimento as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

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

procedure TfrmGeRequisicaoCliente.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_REQUISICAO_' + FormatFloat('0000', YearOf(GetDateDB));

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SQL );

  e1Data.Date      := Date;
  e2Data.Date      := Date;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  CarregarLista(fdQryEmpresa);

  pgcMaisDados.Height := 150;
  RotinaID            := ROTINA_MOV_REQUISICAO_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBCLIENTE_REQUISICAO';
  CampoCodigo    := 'numero';
  CampoDescricao := 'c.nOME';
  CampoOrdenacao := 'r.data_movimento, c.nome';

  WhereAdditional :=  'cast(r.data_movimento as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  UpdateGenerator( 'where ano = ' + FormatFloat('0000', YearOf(Date)) );
end;

procedure TfrmGeRequisicaoCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Desistir na inserção de um novo produto/serviço
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (cdsTabelaItens.State in [dsEdit, dsInsert]) ) then
    cdsTabelaItens.Cancel
  else
    inherited;
end;

procedure TfrmGeRequisicaoCliente.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( not OcorreuErro ) then
    begin
      FieldByName('ANO').AsInteger    := iAno;
      FieldByName('NUMERO').AsInteger := iNum;

      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('NUMERO').AsInteger );
    end;
  end;
end;

procedure TfrmGeRequisicaoCliente.AbrirTabelaItens(
  const AnoRequisicao: Smallint; const NumeroRequisicao: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano    = ' + IntToStr(AnoRequisicao));
    Add('  and i.numero = ' + IntToStr(NumeroRequisicao));
    Add('order by i.ano, i.numero, i.item');
  end;

  cdsTabelaItens.Open;

  ControleCampoLote;
  CarregarLotes(
      cdsTabelaItensCODEMPRESA.AsString
    , cdsTabelaItensCODPRODUTO.AsString
    , cdsTabelaItensCODCLIENTE.AsInteger
    , True);

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoCliente.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btnAutorizarRequisicao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('SITUACAO').AsInteger < STATUS_REQ_AUT) and (not cdsTabelaItens.IsEmpty);
      btnCancelarRequisicao.Enabled  := (not (State in [dsEdit, dsInsert])) and (FieldByName('SITUACAO').AsInteger = STATUS_REQ_AUT);

      nmImprimirRequisicao.Enabled   := (FieldByName('SITUACAO').AsInteger = STATUS_REQ_AUT) or (FieldByName('SITUACAO').AsInteger = STATUS_REQ_FCH);
    end
    else
    begin
      btnAutorizarRequisicao.Enabled := False;
      btnCancelarRequisicao.Enabled  := False;

      nmImprimirRequisicao.Enabled   := (FieldByName('SITUACAO').AsInteger = STATUS_REQ_AUT) or (FieldByName('SITUACAO').AsInteger = STATUS_REQ_FCH);
    end;
  end;
end;

procedure TfrmGeRequisicaoCliente.RdgStatusRequisicaoClick(Sender: TObject);
begin
  if RdgStatusRequisicao.ItemIndex = 3 then
    RdgStatusRequisicao.ItemIndex := RdgStatusRequisicao.ItemIndex - 1;
end;

procedure TfrmGeRequisicaoCliente.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
//  with DtSrcTabela.DataSet do
//  begin
//    if ( State in [dsEdit, dsInsert] ) then
//      Exit;
//
//    if IsEmpty then
//      sID := EmptyStr
//    else
//      sID := FieldByName('NUMERO').AsString;
//
//    if ( sID <> EmptyStr ) then
//    begin
//      iAno := FieldByName('ANO').AsInteger;
//      iCod := FieldByName('NUMERO').AsInteger;
//
//      IbDtstTabela.Close;
//      IbDtstTabela.Open;
//      IbDtstTabela.Locate('NUMERO', sID, []);
//    end;
//  end;
  fdQryTabela.RefreshRecord;
end;

procedure TfrmGeRequisicaoCliente.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('SITUACAO').AsInteger > STATUS_REQ_ABR ) then
    begin
      Case FieldByName('SITUACAO').AsInteger of
        STATUS_REQ_AUT : sMsg := 'Esta requisição não pode ser alterada porque está autorizada/finalizada.';
        STATUS_REQ_FCH : sMsg := 'Esta requisição não pode ser alterada porque está fechada.';
        STATUS_REQ_CAN : sMsg := 'Esta requisição não pode ser alterada porque está cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    if ( FieldByName('VENDA_ANO').AsInteger > 0 ) then
      ShowWarning('Requisições geradas de forma automática não podem ser alteradas.')
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('NUMERO').AsInteger );
    end;
  end;
end;

procedure TfrmGeRequisicaoCliente.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;
  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('SITUACAO').AsInteger > STATUS_REQ_ABR ) then
    begin
      Case FieldByName('SITUACAO').AsInteger of
        STATUS_REQ_AUT : sMsg := 'Esta requisição não pode ser excluída porque está autorizada/finalizada.';
        STATUS_REQ_FCH : sMsg := 'Esta requisição não pode ser excluída porque está fechada.';
        STATUS_REQ_CAN : sMsg := 'Esta requisição não pode ser excluída porque está cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    if ( FieldByName('VENDA_ANO').AsInteger > 0 ) then
      ShowWarning('Requisições geradas de forma automática não podem ser excluídas.')
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('NUMERO').AsInteger );
    end;
  end;
end;

procedure TfrmGeRequisicaoCliente.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeRequisicaoCliente.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('ITEM', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o cliente para a requisição!');
    dbCliente.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensITEM.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeRequisicaoCliente.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeRequisicaoCliente.btnProdutoExcluirClick(Sender: TObject);
(*
  procedure GetToTais(var Descontos, TotalLiquido: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Descontos    := 0.0;
    TotalLiquido := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Descontos    := Descontos    + cdsTabelaItensTOTAL_DESCONTO.AsCurrency;
      TotalLiquido := TotalLiquido + cdsTabelaItensTOTAL_LIQUIDO.AsCurrency;

      cdsTabelaItens.Next;
    end;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;
*)
var
  cDescontos    ,
  cTotalLiquido : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;
(*
      GetToTais(cDescontos, cTotalLiquido);

      FieldByName('DESCONTO.AsCurrency   := cDescontos;
      FieldByName('TOTALVENDA.AsCurrency := cTotalLiquido;

      if ( FieldByName('DESCONTO.AsCurrency < 0 ) then
        FieldByName('DESCONTO.AsCurrency := 0;

      if ( FieldByName('TOTALVENDA.AsCurrency < 0 ) then
        FieldByName('TOTALVENDA.AsCurrency := 0;
*)
    end;
end;

procedure TfrmGeRequisicaoCliente.btnProdutoSalvarClick(Sender: TObject);
(*
  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_Liquido  := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Bruto    := Total_Bruto    + cdsTabelaItensTOTAL_BRUTO.AsCurrency;
      Total_desconto := Total_desconto + cdsTabelaItensTOTAL_DESCONTO.AsCurrency;

      cdsTabelaItens.Next;
    end;

    Total_Liquido  := Total_Bruto - Total_desconto;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;
*)
var
  cDescontos    ,
  cTotalBruto   ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensCODPRODUTO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQUANTIDADE.Value < 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;
(*
      GetToTais(cTotalBruto, cTotalDesconto, cTotalLiquido);

      FieldByName('TOTALVENDA_BRUTA.AsCurrency := cTotalBruto;
      FieldByName('DESCONTO.AsCurrency         := cTotalDesconto;
      FieldByName('TOTALVENDA.AsCurrency       := cTotalLiquido;
*)
      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeRequisicaoCliente.cdsTabelaItensAfterScroll(DataSet: TDataSet);
begin
  ControleCampoLote;
  CarregarLotes(
      cdsTabelaItensCODEMPRESA.AsString
    , cdsTabelaItensCODPRODUTO.AsString
    , cdsTabelaItensCODCLIENTE.AsInteger
    , True);
end;

procedure TfrmGeRequisicaoCliente.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsTabelaItensANO.Value        := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
  cdsTabelaItensNUMERO.Value     := DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger;
  cdsTabelaItensCODEMPRESA.Value := DtSrcTabela.DataSet.FieldByName('CODEMPRESA').AsString;
  cdsTabelaItensCODCLIENTE.Value := DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger;
  cdsTabelaItensQUANTIDADE.Value := 1;
  cdsTabelaItensUSUARIO.Value    := gUsuarioLogado.Login;
  cdsTabelaItensLOTE_ID.Clear;
  cdsTabelaItensCODPRODUTO.Clear;
  cdsTabelaItensDESCRI.Clear;
  cdsTabelaItensUNIDADE.Clear;
  cdsTabelaItensUNP_SIGLA.Clear;
end;

procedure TfrmGeRequisicaoCliente.btnAutorizarRequisicaoClick(
  Sender: TObject);

  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    Return := False;

    cdsTabelaItens.First;
    while not cdsTabelaItens.Eof do
    begin
      Return := ( (cdsTabelaItensQUANTIDADE.AsInteger > cdsTabelaItensESTOQUE_SATELITE.AsInteger) or (cdsTabelaItensESTOQUE_SATELITE.AsInteger <= 0) );
      if ( Return ) then
        Break;
      cdsTabelaItens.Next;
    end;

    Result := Return;
  end;

begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('NUMERO').AsInteger);

    if ( QuantidadeInvalida ) then
    begin
      ShowWarning('Quantidade informada para o ítem ' + FormatFloat('#00', cdsTabelaItensITEM.AsInteger) + ' está acima da quantidade disponível no estoque satélite do cliente.');
      if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
        btnProdutoEditar.SetFocus;
    end
    else

    if ( ShowConfirm('Confirma a autorização da requisição selecionada?') ) then
    begin
      Edit;

      FieldByName('SITUACAO').AsInteger           := STATUS_REQ_AUT;
      FieldByName('AUTORIZACAO_DATA').AsDateTime  := GetDateDB;
      FieldByName('AUTORIZACAO_USUARIO').AsString := gUsuarioLogado.Login;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Requisição autorizada com sucesso !' + #13#13 + 'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('NUMERO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusRequisicao.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmGeRequisicaoCliente.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;

  with DtSrcTabela.DataSet do
  begin
    DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (FieldByName('SITUACAO').AsInteger < STATUS_REQ_AUT );
    DtSrcTabelaItensStateChange( DtSrcTabelaItens );
  end;
end;

procedure TfrmGeRequisicaoCliente.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('NUMERO').AsInteger );
end;

procedure TfrmGeRequisicaoCliente.fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy', Sender.AsDateTime) + ' '+
    FormatDateTime('hh:mm', DtSrcTabela.DataSet.FieldByName('INSERCAO_HORA').AsDateTime);
end;

procedure TfrmGeRequisicaoCliente.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('INSERCAO_DATA').AsDateTime  := GetDateDB;
    FieldByName('INSERCAO_HORA').AsDateTime  := GetTimeDB;
    FieldByName('INSERCAO_USUARIO').AsString := gUsuarioLogado.Login;
    FieldByName('CODEMPRESA').AsString       := gUsuarioLogado.Empresa;
    FieldByName('DATA_MOVIMENTO').AsDateTime := GetDateDB;
    FieldByName('SITUACAO').AsInteger        := STATUS_REQ_ABR;

    FieldByName('CODCLIENTE').Clear;
    FieldByName('NOME').Clear;
    FieldByName('RECEBEDOR_NOME').Clear;
    FieldByName('RECEBEDOR_RG').Clear;
    FieldByName('AUTORIZACAO_DATA').Clear;
    FieldByName('AUTORIZACAO_USUARIO').Clear;
  end;
end;

procedure TfrmGeRequisicaoCliente.fdQryTabelaSITUACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_REQ_ABR: Text := 'Aberta';
    STATUS_REQ_AUT: Text := 'Autorizada';
    STATUS_REQ_FCH: Text := 'Fechada';
    STATUS_REQ_CAN: Text := 'Cancelada';
  end;
end;

procedure TfrmGeRequisicaoCliente.DtSrcTabelaItensStateChange(
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

procedure TfrmGeRequisicaoCliente.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('NUMERO').AsInteger );

  pgcMaisDados.ActivePage := tbsRecebimento;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoCliente.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional :=  'cast(r.data_movimento as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );
  if ( RdgStatusRequisicao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (r.situacao = ' + IntToStr(RdgStatusRequisicao.ItemIndex) + ')';

  inherited; 
end;

procedure TfrmGeRequisicaoCliente.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
  aEstoque : Boolean;
begin
  with DtSrcTabela.DataSet do
  begin
    aEstoque := not (gSistema.Codigo = SISTEMA_GESTAO_OPME);
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome, aEstoque) ) then
      begin
        FieldByName('CODCLIENTE').AsInteger := iCodigo;
        FieldByName('NOME').AsString        := sNome;
      end;
  end;
end;

procedure TfrmGeRequisicaoCliente.CarregarDadosProduto(Codigo: Integer);
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
    with qryProduto do
    begin
      Close;
      ParamByName('cliente').AsInteger := DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger;
      ParamByName('produto').AsInteger := Codigo;
      Open;

      if not IsEmpty then
      begin
        cdsTabelaItensLOTE_ID.Assign( FieldByName('lote_id') );
        cdsTabelaItensESTOQUE_APROP_LOTE.Assign( FieldByName('estoque_aprop_lote') );

        cdsTabelaItensCODPRODUTO.AsString := FieldByName('cod_produto').AsString;
        cdsTabelaItensDESCRI.AsString     := FieldByName('Descri').AsString;
        cdsTabelaItensUNP_SIGLA.AsString  := FieldByName('Unp_sigla').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('Codunidade').AsInteger;

        cdsTabelaItensESTOQUE_SATELITE.AsInteger := FieldByName('estoque_satelite').AsInteger;

        ControleCampoLote;
        CarregarLotes(
            cdsTabelaItensCODEMPRESA.AsString
          , cdsTabelaItensCODPRODUTO.AsString
          , cdsTabelaItensCODCLIENTE.AsInteger
          , False);
      end
      else
      begin
        ShowWarning('Código de produto não cadastrado ou não está na relação de estoque satélite do cliente!');
        cdsTabelaItensCODPRODUTO.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeRequisicaoCliente.CarregarLotes(const aEmpresa, aProduto: String; const aCliente: Integer;
  const aTodos: Boolean);
begin
  with fdQryLotes do
  begin
    fdQryLotes.Close;

    ParamByName('empresa').AsString       := aEmpresa;
    ParamByName('centro_custo').AsInteger := CENTRO_CUSTO_ESTOQUE_GERAL;
    ParamByName('cliente').AsInteger      := aCliente;
    ParamByName('produto').AsString       := aProduto;
    ParamByName('todos').AsInteger        := IfThen(aTodos, 1, 0);

    fdQryLotes.OpenOrExecute;
    fdQryLotes.Last;
    fdQryLotes.First;
  end;
end;

procedure TfrmGeRequisicaoCliente.btbtnSalvarClick(Sender: TObject);
var
  iNumero : Integer;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da requisição.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da requisição!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    with DtSrcTabela.DataSet do
    begin
      FieldByName('OBSERVACOES').AsString := Trim(AnsiUpperCase(FieldByName('OBSERVACOES').AsString));

      inherited;

      if ( not OcorreuErro ) then
      begin

        // Salvar Itens

        if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
          cdsTabelaItens.Post;

        cdsTabelaItens.ApplyUpdates;
        RecarregarRegistro;

        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('NUMERO').AsInteger );
      end;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeRequisicaoCliente.ControleCampoLote;
begin
  lblLoteProduto.Visible := (cdsTabelaItensESTOQUE_APROP_LOTE.AsInteger = FLAG_SIM);
  dbLoteProduto.Visible  := (cdsTabelaItensESTOQUE_APROP_LOTE.AsInteger = FLAG_SIM);
end;

procedure TfrmGeRequisicaoCliente.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsTabelaItensCODPRODUTO.AsString, 0) );

  if ( Sender = dbEstoqueSatelite ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeRequisicaoCliente.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoCliente.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar requisição aberta
    if ( DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = STATUS_REQ_ABR ) then
      dbgDados.Canvas.Font.Color := lblRequisicaoAberta.Font.Color
    else
    // Destacar requisição cancelada
    if ( DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = STATUS_REQ_CAN ) then
      dbgDados.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos sem estoque satélite disponível
  if ( Sender = dbgProdutos ) then
  begin
    if ( (DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = STATUS_REQ_ABR) and (cdsTabelaItensQUANTIDADE.AsInteger > cdsTabelaItensESTOQUE_SATELITE.AsInteger) ) then
      dbgProdutos.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeRequisicaoCliente.dbProdutoButtonClick(Sender: TObject);
var
  sCodigo     ,
  sDescricao  ,
  sLote       : String;
  iEstoque    : Integer;
  cValorMedio : Currency;
begin
  if ( DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o cliente para a requisição!');
    dbCliente.SetFocus;
  end
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if SelecionarProdutoCliente(Self, DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger, sCodigo, sDescricao, sLote, iEstoque, cValorMedio) then
    begin
      cdsTabelaItensCODPRODUTO.Value       := sCodigo;
      cdsTabelaItensDESCRI.Value           := sDescricao;
      cdsTabelaItensESTOQUE_SATELITE.Value := iEstoque;
      cdsTabelaItensVALOR_MEDIO.AsCurrency := cValorMedio;

      ControleCampoLote;
      CarregarLotes(
          cdsTabelaItensCODEMPRESA.AsString
        , cdsTabelaItensCODPRODUTO.AsString
        , cdsTabelaItensCODCLIENTE.AsInteger
        , False);

      if (sLote = EmptyStr) then
        cdsTabelaItensLOTE_ID.Clear
      else
        cdsTabelaItensLOTE_ID.AsString := sLote;
    end;
end;

procedure TfrmGeRequisicaoCliente.nmImprimirRequisicaoClick(
  Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    AbrirEmitente(DtSrcTabela.DataSet.FieldByName('CODEMPRESA').AsString);
    AbrirDestinatario(DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger);

    with QryRequisicaoCliente do
    begin
      Close;
      ParamByName('ano').AsInteger := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('num').AsInteger := DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger;
      Open;
    end;

    if ( ShowConfirm('Deseja imprimir em formato CUPOM?', 'Impressão', MB_DEFBUTTON1) ) then
    begin
      if ( GetModeloEmissaoCupom = MODELO_CUPOM_POOLER ) then
      begin
        FrrECFPoolerRequisicaoCliente.PrepareReport;
        FrrECFPoolerRequisicaoCliente.Print;
      end;
    end
    else
      frrRequisicaoCliente.ShowReport;

  end;
end;

procedure TfrmGeRequisicaoCliente.btnCancelarRequisicaoClick(
  Sender: TObject);
begin
  ShowInformation('Rotina ainda não disponível nesta versão!');
end;

initialization
  FormFunction.RegisterForm('frmGeRequisicaoCliente', TfrmGeRequisicaoCliente);

end.
