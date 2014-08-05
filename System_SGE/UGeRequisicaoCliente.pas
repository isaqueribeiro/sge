unit UGeRequisicaoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, IBTable, RXDBCtrl, Menus;

type
  TfrmGeRequisicaoCliente = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    RdgStatusRequisicao: TRadioGroup;
    lblRequisicaoAberta: TLabel;
    lblRequisicaoCancelada: TLabel;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaNUMERO: TIntegerField;
    IbDtstTabelaCODEMPRESA: TIBStringField;
    IbDtstTabelaDATA_MOVIMENTO: TDateField;
    IbDtstTabelaINSERCAO_DATA: TDateField;
    IbDtstTabelaINSERCAO_HORA: TTimeField;
    IbDtstTabelaINSERCAO_USUARIO: TIBStringField;
    IbDtstTabelaSITUACAO: TSmallintField;
    IbDtstTabelaOBSERVACOES: TMemoField;
    IbDtstTabelaAUTORIZACAO_DATA: TDateField;
    IbDtstTabelaAUTORIZACAO_USUARIO: TIBStringField;
    IbDtstTabelaRECEBEDOR_NOME: TIBStringField;
    IbDtstTabelaCANCELADO_DATA: TDateField;
    IbDtstTabelaCANCELADO_MOTIVO: TMemoField;
    IbDtstTabelaNOME: TIBStringField;
    IbDtstTabelaITENS: TIntegerField;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    dbCliente: TRxDBComboEdit;
    lblCliente: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataMovimento: TLabel;
    dbDataMovimento: TDBDateEdit;
    lblResponsavel: TLabel;
    dbResponsavel: TDBEdit;
    dbResponsavelRG: TDBEdit;
    lblResponsavelRG: TLabel;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblAutorizador: TLabel;
    dbAutorizador: TDBEdit;
    btnAutorizarRequisicao: TBitBtn;
    btnCancelarRequisicao: TBitBtn;
    Bevel12: TBevel;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
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
    dbProduto: TRxDBComboEdit;
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
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensNUMERO: TIntegerField;
    cdsTabelaItensITEM: TSmallintField;
    cdsTabelaItensCODEMPRESA: TIBStringField;
    cdsTabelaItensCODPRODUTO: TIBStringField;
    cdsTabelaItensQUANTIDADE: TIntegerField;
    cdsTabelaItensQUANTIDADE_FINAL: TIntegerField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensUSUARIO: TIBStringField;
    cdsTabelaItensDESCRI: TIBStringField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    ppImprimir: TPopupMenu;
    nmImprimirRequisicao: TMenuItem;
    qryProduto: TIBDataSet;
    lblEstoqueSatelite: TLabel;
    dbEstoqueSatelite: TDBEdit;
    cdsTabelaItensVALOR_MEDIO: TIBBCDField;
    IbDtstTabelaRECEBEDOR_RG: TIBStringField;
    IbDtstTabelaCODCLIENTE: TIntegerField;
    cdsTabelaItensCODCLIENTE: TIntegerField;
    cdsTabelaItensESTOQUE_SATELITE: TIBBCDField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaINSERCAO_DATAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure IbDtstTabelaSITUACAOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure btnAutorizarRequisicaoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirRequisicaoClick(Sender: TObject);
    procedure btnCancelarRequisicaoClick(Sender: TObject);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    procedure AbrirTabelaItens(const AnoRequisicao : Smallint; const NumeroRequisicao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
  public
    { Public declarations }
  end;

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

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
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
  IbDtstTabela.GeneratorField.Generator := sGeneratorName;
  IbDtstTabela.GeneratorField.Field     := 'numero';

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  e1Data.Date      := Date;
  e2Data.Date      := Date;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  tblEmpresa.Open;

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

  RdgStatusRequisicao.Controls[3].Enabled := False;
end;

procedure TfrmGeRequisicaoCliente.IbDtstTabelaINSERCAO_DATAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy', Sender.AsDateTime) + ' '+ FormatDateTime('hh:mm', IbDtstTabelaINSERCAO_HORA.AsDateTime);  
end;

procedure TfrmGeRequisicaoCliente.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaINSERCAO_DATA.Value    := GetDateDB;
  IbDtstTabelaINSERCAO_HORA.Value    := GetTimeDB;
  IbDtstTabelaINSERCAO_USUARIO.Value := GetUserApp;
  IbDtstTabelaCODEMPRESA.Value       := GetEmpresaIDDefault;
  IbDtstTabelaDATA_MOVIMENTO.Value   := GetDateDB;
  IbDtstTabelaSITUACAO.AsInteger     := STATUS_REQ_ABR;

  IbDtstTabelaCODCLIENTE.Clear;
  IbDtstTabelaNOME.Clear;
  IbDtstTabelaRECEBEDOR_NOME.Clear;
  IbDtstTabelaRECEBEDOR_RG.Clear;
  IbDtstTabelaAUTORIZACAO_DATA.Clear;
  IbDtstTabelaAUTORIZACAO_USUARIO.Clear;
end;

procedure TfrmGeRequisicaoCliente.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;
  if ( not OcorreuErro ) then
  begin
    IbDtstTabelaANO.AsInteger    := iAno;
    IbDtstTabelaNUMERO.AsInteger := iNum;

    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
  end;
end;

procedure TfrmGeRequisicaoCliente.AbrirTabelaItens(
  const AnoRequisicao: Smallint; const NumeroRequisicao: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano    = ' + IntToStr(AnoRequisicao));
    Add('  and i.numero = ' + IntToStr(NumeroRequisicao));
    Add('order by i.ano, i.numero, i.item');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoCliente.IbDtstTabelaSITUACAOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
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

procedure TfrmGeRequisicaoCliente.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btnAutorizarRequisicao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSITUACAO.AsInteger < STATUS_REQ_AUT) and (not cdsTabelaItens.IsEmpty);
    btnCancelarRequisicao.Enabled  := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSITUACAO.AsInteger = STATUS_REQ_AUT);

    nmImprimirRequisicao.Enabled   := (IbDtstTabelaSITUACAO.AsInteger = STATUS_REQ_AUT) or (IbDtstTabelaSITUACAO.AsInteger = STATUS_REQ_FCH);
  end
  else
  begin
    btnAutorizarRequisicao.Enabled := False;
    btnCancelarRequisicao.Enabled  := False;

    nmImprimirRequisicao.Enabled   := (IbDtstTabelaSITUACAO.AsInteger = STATUS_REQ_AUT) or (IbDtstTabelaSITUACAO.AsInteger = STATUS_REQ_FCH);
  end;
end;

procedure TfrmGeRequisicaoCliente.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaNUMERO.AsString;

  if ( sID <> EmptyStr ) then
  begin
    iAno := IbDtstTabelaANO.AsInteger;
    iCod := IbDtstTabelaNUMERO.AsInteger;

    IbDtstTabela.Close;
    IbDtstTabela.Open;
    IbDtstTabela.Locate('NUMERO', sID, []);
  end;
end;

procedure TfrmGeRequisicaoCliente.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSITUACAO.AsInteger > STATUS_REQ_ABR ) then
  begin
    Case IbDtstTabelaSITUACAO.AsInteger of
      STATUS_REQ_AUT : sMsg := 'Esta requisição não pode ser alterada porque está autorizada/finalizada.';
      STATUS_REQ_FCH : sMsg := 'Esta requisição não pode ser alterada porque está fechada.';
      STATUS_REQ_CAN : sMsg := 'Esta requisição não pode ser alterada porque está cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
  end;
end;

procedure TfrmGeRequisicaoCliente.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSITUACAO.AsInteger > STATUS_REQ_ABR ) then
  begin
    Case IbDtstTabelaSITUACAO.AsInteger of
      STATUS_REQ_AUT : sMsg := 'Esta requisição não pode ser excluída porque está autorizada/finalizada.';
      STATUS_REQ_FCH : sMsg := 'Esta requisição não pode ser excluída porque está fechada.';
      STATUS_REQ_CAN : sMsg := 'Esta requisição não pode ser excluída porque está cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
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
    if ( cdsTabelaItens.Locate('ITEM', Seq, []) ) then
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( IbDtstTabelaCODCLIENTE.AsInteger = 0 ) then
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

      IbDtstTabelaDESCONTO.AsCurrency   := cDescontos;
      IbDtstTabelaTOTALVENDA.AsCurrency := cTotalLiquido;

      if ( IbDtstTabelaDESCONTO.AsCurrency < 0 ) then
        IbDtstTabelaDESCONTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTALVENDA.AsCurrency < 0 ) then
        IbDtstTabelaTOTALVENDA.AsCurrency := 0;
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

      IbDtstTabelaTOTALVENDA_BRUTA.AsCurrency := cTotalBruto;
      IbDtstTabelaDESCONTO.AsCurrency         := cTotalDesconto;
      IbDtstTabelaTOTALVENDA.AsCurrency       := cTotalLiquido;
*)
      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeRequisicaoCliente.cdsTabelaItensNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  cdsTabelaItensANO.Value        := IbDtstTabelaANO.Value;
  cdsTabelaItensNUMERO.Value     := IbDtstTabelaNUMERO.Value;
  cdsTabelaItensCODEMPRESA.Value := IbDtstTabelaCODEMPRESA.Value;
  cdsTabelaItensCODCLIENTE.Value := IbDtstTabelaCODCLIENTE.Value;
  cdsTabelaItensQUANTIDADE.Value := 1;
  cdsTabelaItensUSUARIO.Value    := GetUserApp;
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
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger);

//  IbDtstTabela.Edit;
//
  if ( QuantidadeInvalida ) then
  begin
    ShowWarning('Quantidade informada para o ítem ' + FormatFloat('#00', cdsTabelaItensITEM.AsInteger) + ' está acima da quantidade disponível no estoque satélite do cliente.');
    if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
      btnProdutoEditar.SetFocus;
  end
  else

  if ( ShowConfirm('Confirma a autorização da requisição selecionada?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSITUACAO.Value            := STATUS_REQ_AUT;
    IbDtstTabelaAUTORIZACAO_DATA.Value    := GetDateDB;
    IbDtstTabelaAUTORIZACAO_USUARIO.Value := GetUserApp;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Requisição autorizada com sucesso !' + #13#13 + 'Ano/Número: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaNUMERO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusRequisicao.ItemIndex := 0;
  end;
end;

procedure TfrmGeRequisicaoCliente.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSITUACAO.AsInteger < STATUS_REQ_AUT );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
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
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );

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
  sCNPJ ,
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome, True) ) then
    begin
      IbDtstTabelaCODCLIENTE.AsInteger := iCodigo;
      IbDtstTabelaNOME.AsString        := sNome;
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
      ParamByName('cliente').AsInteger := IbDtstTabelaCODCLIENTE.AsInteger;
      ParamByName('produto').AsInteger := Codigo;
      Open;

      if not IsEmpty then
      begin
        cdsTabelaItensCODPRODUTO.AsString := FieldByName('cod_produto').AsString;
        cdsTabelaItensDESCRI.AsString     := FieldByName('Descri').AsString;
        cdsTabelaItensUNP_SIGLA.AsString  := FieldByName('Unp_sigla').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('Codunidade').AsInteger;

        cdsTabelaItensESTOQUE_SATELITE.AsInteger := FieldByName('estoque_satelite').AsInteger;
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

procedure TfrmGeRequisicaoCliente.IbDtstTabelaAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
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

    IbDtstTabelaOBSERVACOES.AsString := Trim(AnsiUpperCase(IbDtstTabelaOBSERVACOES.AsString));
    
    inherited;

    if ( not OcorreuErro ) then
    begin

      // Salvar Itens

      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;

      iNumero := IbDtstTabelaNUMERO.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(CampoCodigo, iNumero, []);

      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );

    end;

    HabilitarDesabilitar_Btns;
  end;
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
    if ( IbDtstTabelaSITUACAO.AsInteger = STATUS_REQ_ABR ) then
      dbgDados.Canvas.Font.Color := lblRequisicaoAberta.Font.Color
    else
    // Destacar requisição cancelada
    if ( IbDtstTabelaSITUACAO.AsInteger = STATUS_REQ_CAN ) then
      dbgDados.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos sem estoque satélite disponível
  if ( Sender = dbgProdutos ) then
  begin
    if ( (IbDtstTabelaSITUACAO.AsInteger = STATUS_REQ_ABR) and (cdsTabelaItensQUANTIDADE.AsInteger > cdsTabelaItensESTOQUE_SATELITE.AsInteger) ) then
      dbgProdutos.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeRequisicaoCliente.dbProdutoButtonClick(Sender: TObject);
var
  sCodigo     ,
  sDescricao  : String;
  iEstoque    : Integer;
  cValorMedio : Currency;
begin
  if ( IbDtstTabelaCODCLIENTE.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o cliente para a requisição!');
    dbCliente.SetFocus;
  end
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if SelecionarProdutoCliente(Self, IbDtstTabelaCODCLIENTE.AsInteger, sCodigo, sDescricao, iEstoque, cValorMedio) then
    begin
      cdsTabelaItensCODPRODUTO.Value       := sCodigo;
      cdsTabelaItensDESCRI.Value           := sDescricao;
      cdsTabelaItensESTOQUE_SATELITE.Value := iEstoque;
      cdsTabelaItensVALOR_MEDIO.AsCurrency := cValorMedio;
    end;
end;

procedure TfrmGeRequisicaoCliente.nmImprimirRequisicaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    AbrirEmitente(IbDtstTabelaCODEMPRESA.AsString);
    AbrirDestinatario(IbDtstTabelaCODCLIENTE.AsInteger);

    with QryRequisicaoCliente do
    begin
      Close;
      ParamByName('ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('num').AsInteger := IbDtstTabelaNUMERO.AsInteger;
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
