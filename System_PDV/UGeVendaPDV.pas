unit UGeVendaPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, dxGDIPlusClasses, StdCtrls, DBCtrls, Grids,
  DBGrids, DB, ActnList, IBCustomDataSet, IBUpdateSQL, IBTable, IBQuery,
  IBStoredProc;

type
  TTipoAlteraItem = (alterarQuantidade, alterarValor, excluirProduto);
  TfrmGeVendaPDV = class(TfrmGrPadrao)
    PnlInformeGeral: TPanel;
    imgEmpresa: TImage;
    PnlVendaCabecalho: TPanel;
    lblNomeVendedor: TLabel;
    imgNomeVendedor: TImage;
    imgNomeCliente: TImage;
    lblNomeCliente: TLabel;
    imgNomeFormaPagto: TImage;
    lblNomeFormaPagto: TLabel;
    PnlVendaProduto: TPanel;
    lblData: TLabel;
    lblHora: TLabel;
    tmrContador: TTimer;
    lblProdutoCodigo: TLabel;
    edProdutoCodigo: TEdit;
    dbNomeProduto: TDBText;
    dbValorProduto: TDBText;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    lblFinalizarVenda: TLabel;
    lblCancelar: TLabel;
    Label5: TLabel;
    dbgDados: TDBGrid;
    Label6: TLabel;
    dbValorTotal: TDBText;
    Bevel1: TBevel;
    Label7: TLabel;
    dbValorDesconto: TDBText;
    Bevel2: TBevel;
    Label8: TLabel;
    dbValorAPagar: TDBText;
    dbQuantidade: TDBText;
    dbUnidade: TDBText;
    dbTotalProduto: TDBText;
    Label9: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    dtsVenda: TDataSource;
    edNomeVendedor: TLabel;
    edNomeCliente: TLabel;
    edNomeFormaPagto: TLabel;
    actVenda: TActionList;
    actCarregarVendedor: TAction;
    actCarregarCliente: TAction;
    actCarregarFormaPagto: TAction;
    actSair: TAction;
    dtsItem: TDataSource;
    dtsFormaPagto: TDataSource;
    lblIniciarVenda: TLabel;
    actIniciarVenda: TAction;
    actCancelar: TAction;
    actCarregarProduto: TAction;
    dtsCFOP: TDataSource;
    dtsProduto: TDataSource;
    actDescontoCupom: TAction;
    actCarregarOrcamento: TAction;
    lblGravar: TLabel;
    pnlCaixaLivre: TPanel;
    actGravarOrcamento: TAction;
    ImgLogoCanto: TImage;
    actFinalizarVenda: TAction;
    tblFormaPagto: TIBTable;
    tblCondicaoPagto: TIBTable;
    qryTotalComprasAbertas: TIBQuery;
    qryTotalComprasAbertasVALOR_LIMITE: TIBBCDField;
    qryTotalComprasAbertasVALOR_COMPRAS_ABERTAS: TIBBCDField;
    qryTotalComprasAbertasVALOR_LIMITE_DISPONIVEL: TIBBCDField;
    cdsTotalComprasAbertas: TDataSource;
    IbStrPrcGerarTitulos: TIBStoredProc;
    dtsTitulos: TDataSource;
    actCancelarProduto: TAction;
    actProdutoValor: TAction;
    actProdutoQuantidade: TAction;
    actProdutoExcluir: TAction;
    dtsNotaFiscal: TDataSource;
    procedure tmrContadorTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edProdutoCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure actSairExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ControlEditEnter(Sender: TObject);
    procedure actCarregarClienteExecute(Sender: TObject);
    procedure actIniciarVendaExecute(Sender: TObject);
    procedure dtsVendaDataChange(Sender: TObject; Field: TField);
    procedure actCancelarExecute(Sender: TObject);
    procedure actCarregarVendedorExecute(Sender: TObject);
    procedure actCarregarProdutoExecute(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actDescontoCupomExecute(Sender: TObject);
    procedure actCarregarOrcamentoExecute(Sender: TObject);
    procedure actGravarOrcamentoExecute(Sender: TObject);
    procedure actCarregarFormaPagtoExecute(Sender: TObject);
    procedure actFinalizarVendaExecute(Sender: TObject);
    procedure actProdutoValorExecute(Sender: TObject);
    procedure actProdutoQuantidadeExecute(Sender: TObject);
    procedure actProdutoExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    sNomeTabela    ,
    sCampoCodigo   ,
    sGeneratorName : String;
    procedure IniciarCupomCabecalho;
    procedure IniciarCupomProduto;
    procedure CarregarVenda(const Empresa : String; const Ano, Controle : Integer);
    procedure CarregarItens(const Empresa : String; const Ano, Controle : Integer);
    procedure CarregarFormaPagto(const Empresa : String; const Ano, Controle : Integer);
    procedure CarregarTitulos(const Empresa : String; const Ano, Controle : Integer);
    procedure CarregarDadosCFOP( iCodigo : Integer );
    procedure CarregarNotaFiscal(const Empresa : String; const Ano : Smallint; const Controle : Integer);

    procedure ZerarFormaPagto;
    procedure InserirProduto;
    procedure GetComprasAbertas(iCodigoCliente : Integer);
    procedure GerarTitulos(const AnoVenda : Smallint; const ControleVenda : Integer);
    procedure ProdutoAlterar(const TipoAlteracao : TTipoAlteraItem);

    function GetPermissaoRotinaInterna(const Sender : TObject; const Alertar : Boolean = FALSE) : Boolean;
    function GetRotinaInternaID(const Sender : TObject) : String;
    function GetRotinaIniciarVendaID : String;
    function GetRotinaFinalizarID : String;
    function GetRotinaCancelarVendaID : String;

    function DataSetVenda : TDataSet;
    function DataSetItens : TDataSet;
    function DataSetFormaPagto : TDataSet;
    function DataSetTitulo : TDataSet;
    function DataSetNotaFiscal : TDataSet;
    function EstaEditando : Boolean;
    function VendaEstaAberta : Boolean;
    function VendaEstaFinalizada : Boolean;

    function GetTotalValorFormaPagto : Currency;
    function GetTotalValorFormaPagto_APrazo : Currency;
    function GetGerarEstoqueCliente(const Alertar : Boolean = TRUE) : Boolean;
  public
    { Public declarations }
    property RotinaIniciarVendaID  : String read GetRotinaIniciarVendaID;
    property RotinaFinalizarID     : String read GetRotinaFinalizarID;
    property RotinaCancelarVendaID : String read GetRotinaCancelarVendaID;

    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeVendaPDV: TfrmGeVendaPDV;

implementation

uses
  UConstantesDGE, UFuncoes, DateUtils, UDMBusiness, UDMCupom,
  UGeVendedor, UGeCliente, UGeFormaPagto, UGeProduto, UGeVendaPDVDesconto, UGeVendaPDVOrcamento, UGeVendaPDVFinalizar,
  UGeVendaPDVItem, UGeEfetuarPagtoREC, UGeVendaConfirmaTitulos, UDMNFe;

{$R *.dfm}

const
  COD_MLT = '*';
  TIMER_CAIXA_LIVRE = 5; //120;

{ TfrmGeVendaPDV }

procedure TfrmGeVendaPDV.RegistrarRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if lblIniciarVenda.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaIniciarVendaID, actIniciarVenda.Caption, RotinaID);

    if lblFinalizarVenda.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, actFinalizarVenda.Caption, RotinaID);

    if lblCancelar.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarVendaID, actCancelar.Caption, RotinaID);
  end;
end;

procedure TfrmGeVendaPDV.IniciarCupomCabecalho;
begin
  Self.Caption := 'Vendas PDV';

  if (gUsuarioLogado.Vendedor = 0) then
  begin
    edNomeVendedor.Tag     := GetVendedorIDDefault;
    edNomeVendedor.Caption := GetVendedorNomeDefault;
  end
  else
  begin
    edNomeVendedor.Tag     := gUsuarioLogado.Vendedor;
    edNomeVendedor.Caption := GetVendedorNome( edNomeVendedor.Tag );
  end;

  edNomeCliente.Tag     := CONSUMIDOR_FINAL_CODIGO;
  edNomeCliente.Caption := CONSUMIDOR_FINAL_NOME;
  edNomeCliente.Hint    := CONSUMIDOR_FINAL_CNPJ;

  edNomeFormaPagto.Tag     := GetFormaPagtoIDDefault;
  edNomeFormaPagto.Caption := GetFormaPagtoNomeDefault;

  CarregarVenda(GetEmpresaIDDefault, 0, 0);
end;

procedure TfrmGeVendaPDV.tmrContadorTimer(Sender: TObject);
begin
  lblData.Caption := FormatDateTime('dd/mm/yyyy', Date);
  lblHora.Caption := FormatDateTime('hh:mm:ss', Time) + ' (' + IntToStr(pnlCaixaLivre.Tag) + ')';

  Case pnlCaixaLivre.Font.Color of
    clBlack : pnlCaixaLivre.Font.Color := clBlue;
    clBlue  : pnlCaixaLivre.Font.Color := clRed;
    clRed   : pnlCaixaLivre.Font.Color := clBlack;
  end;

  pnlCaixaLivre.Visible := (pnlCaixaLivre.Tag > TIMER_CAIXA_LIVRE) and dtsVenda.DataSet.IsEmpty and (not VendaEstaAberta);

  if not pnlCaixaLivre.Visible then
    pnlCaixaLivre.Tag := (pnlCaixaLivre.Tag + 1);
end;

procedure TfrmGeVendaPDV.IniciarCupomProduto;
begin
  edProdutoCodigo.Text := EmptyStr; // '1' + COD_MLT;

  if edProdutoCodigo.Visible and edProdutoCodigo.Enabled then
  begin
    edProdutoCodigo.SetFocus;
    edProdutoCodigo.SelStart := Length(edProdutoCodigo.Text);
  end;
end;

procedure TfrmGeVendaPDV.FormShow(Sender: TObject);
begin
  if ( (sGeneratorName <> EmptyStr) and (sNomeTabela <> EmptyStr) and (sCampoCodigo <> EmptyStr) ) then
    UpdateSequence(sGeneratorName, sNomeTabela, sCampoCodigo, 'where Ano = ' + FormatFloat('0000', YearOf(GetDateDB)) );

  inherited;

  IniciarCupomCabecalho;
  IniciarCupomProduto;
end;

procedure TfrmGeVendaPDV.edProdutoCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not VendaEstaAberta then
    Abort
  else  
  if not (Key in [',', '0'..'9', COD_MLT, #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeVendaPDV.actSairExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmGeVendaPDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_F2 ) then
    actCarregarVendedor.Execute
  else
  if ( Key = VK_F3 ) then
    actCarregarCliente.Execute
  else
  if ( Key = VK_F4 ) then
    actCarregarFormaPagto.Execute
  else
  if ( Key = VK_F6 ) then
    actCarregarProduto.Execute
  else
  if ( Key = VK_F7 ) then
    actIniciarVenda.Execute
  else
  if ( Key = VK_F8 ) then
    actCarregarOrcamento.Execute
  else
  if ( Key = VK_F9 ) then
    actDescontoCupom.Execute
  else
  if ( Key = VK_F10 ) then
    actFinalizarVenda.Execute
  else
  if ( Key = VK_F11 ) then
    actCancelar.Execute
  else
  if ( Key = VK_F12 ) then
    actGravarOrcamento.Execute
  else
  if ( (Key = VK_RETURN) and edProdutoCodigo.Focused ) then
    InserirProduto
  else
  if ( (Key = VK_UP) and VendaEstaAberta ) then
  begin
    Key := 0;
    DataSetItens.Prior;
  end
  else
  if ( (Key = VK_DOWN) and VendaEstaAberta ) then
  begin
    Key := 0;
    DataSetItens.Next;
  end
  else
  if ( Key = SYS_KEY_S ) then // Tela S
    actSair.Execute
  else
    inherited;
end;

procedure TfrmGeVendaPDV.FormCreate(Sender: TObject);
var
  sFileImageLogotipo : String;
begin
  if not Assigned(DMCupom) then
    DMCupom := TDMCupom.Create(Application);

  RotinaID       := ROTINA_MOV_VENDA_PDV_ID;
  sNomeTabela    := 'TBVENDAS';
  sCampoCodigo   := 'Codcontrol';
  sGeneratorName := 'GEN_VENDAS_CONTROLE_' + FormatFloat('0000', YearOf(GetDateDB));

  inherited;

  lblFinalizarVenda.Visible := not GetEmitirApenasOrcamento;
  lblGravar.Visible         := GetEmitirApenasOrcamento or (GetEmitirCupom and GetCupomNaoFiscalEmitir);

  if not lblFinalizarVenda.Visible then
  begin
    lblGravar.Top  := lblFinalizarVenda.Top;
    lblGravar.Left := lblFinalizarVenda.Left;
  end;

  sFileImageLogotipo := ExtractFilePath(Application.ExeName) + FILE_COMPANY_LOGO;
  if FileExists(sFileImageLogotipo) then
    imgEmpresa.Picture.LoadFromFile( sFileImageLogotipo );
end;

function TfrmGeVendaPDV.DataSetVenda: TDataSet;
begin
  Result := dtsVenda.DataSet;
end;

procedure TfrmGeVendaPDV.CarregarVenda(const Empresa: String; const Ano,
  Controle: Integer);
begin
  with TIBDataSet(DataSetVenda) do
  begin
    Close;
    ParamByName('empresa').AsString   := Empresa;
    ParamByName('ano').AsInteger      := Ano;
    ParamByName('controle').AsInteger := Controle;
    Open;
  end;

  CarregarItens(Empresa, Ano, Controle);
  CarregarFormaPagto(Empresa, Ano, Controle);
  CarregarTitulos(Empresa, Ano, Controle);
  CarregarNotaFiscal(Empresa, Ano, Controle);

  if ( DataSetVenda.FieldByName('ano').AsInteger > 0 ) then
  begin
    edNomeVendedor.Tag     := DataSetVenda.FieldByName('VENDEDOR_COD').AsInteger;
    edNomeVendedor.Caption := GetVendedorNome( edNomeVendedor.Tag );

    edNomeCliente.Tag     := DataSetVenda.FieldByName('CODCLIENTE').AsInteger;
    edNomeCliente.Caption := GetClienteNome( edNomeCliente.Tag );
    edNomeCliente.Hint    := DataSetVenda.FieldByName('CODCLI').AsString;

    edNomeFormaPagto.Tag     := DataSetFormaPagto.FieldByName('FORMAPAGTO_COD').AsInteger;
    edNomeFormaPagto.Caption := GetFormaPagtoNome( edNomeFormaPagto.Tag );

    CarregarDadosCFOP( DataSetVenda.FieldByName('CFOP').AsInteger );
  end;

  if ( DataSetVenda.FieldByName('CODCONTROL').AsInteger > 0 ) then
    Self.Caption := 'Vendas PDV | No. ' + DataSetVenda.FieldByName('ANO').AsString + '/' + FormatFloat('###00000', DataSetVenda.FieldByName('CODCONTROL').AsInteger)
  else
    Self.Caption := 'Vendas PDV';
end;

procedure TfrmGeVendaPDV.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := not EstaEditando;

  if not CanClose then
    ShowWarning('Venda em aberto!!!');
end;

procedure TfrmGeVendaPDV.ControlEditEnter(Sender: TObject);
begin
  inherited;
  if ( Sender = edProdutoCodigo ) then
    edProdutoCodigo.SelStart := Length(edProdutoCodigo.Text);
end;

procedure TfrmGeVendaPDV.actCarregarClienteExecute(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sNome : String;
  bBloqueado : Boolean;
  sBloqueado : String;
begin
  if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome, bBloqueado, sBloqueado) ) then
  begin
    if bBloqueado then
      ShowWarning('Cliente selecionado se encontra bloqueado!' + #13#13 + 'Motivo:' + #13 + sBloqueado);

    edNomeCliente.Tag     := iCodigo;
    edNomeCliente.Caption := sNome;
    edNomeCliente.Hint    := sCNPJ;
    edNomeCliente.Enabled := not bBloqueado;

    if VendaEstaAberta then
    begin
      if not EstaEditando then
        DataSetVenda.Edit;
      
      with DataSetVenda do
      begin
        if bBloqueado then
        begin
          FieldByName('BLOQUEADO').AsInteger       := 1;
          FieldByName('BLOQUEADO_MOTIVO').AsString := sBloqueado;
        end
        else
        begin
          FieldByName('BLOQUEADO').AsInteger       := 0;
          FieldByName('BLOQUEADO_MOTIVO').AsString := EmptyStr;
        end;

        FieldByName('CODCLIENTE').AsInteger := iCodigo;
        FieldByName('CODCLI').AsString      := sCNPJ;
        FieldByName('NOME').AsString        := sNome;
      end;
    end;

  end;
end;

function TfrmGeVendaPDV.EstaEditando: Boolean;
begin
  Result := (DataSetVenda.State in [dsEdit, dsInsert]);
end;

procedure TfrmGeVendaPDV.actIniciarVendaExecute(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  if ( EstaEditando ) then
    ShowWarning('Já existe uma venda iniciada!' + #13 + 'Favor finalizá-la.')
  else
    with DataSetVenda do
    begin
      CarregarVenda(GetEmpresaIDDefault, 0, 0);
      
      pnlCaixaLivre.Visible := False;
      pnlCaixaLivre.Tag     := 0;

      iAno := YearOf(GetDateDB);
      iNum := GetGeneratorID(sGeneratorName);

      Append;

      FieldByName('CODEMP').Value         := GetEmpresaIDDefault;
      FieldByName('ANO').AsInteger        := iAno;
      FieldByName('CODCONTROL').AsInteger := iNum;

      FieldByName('DTVENDA').Value        := GetDateTimeDB;
      FieldByName('CFOP').Value           := GetCfopIDDefault;
      FieldByName('STATUS').Value         := STATUS_VND_AND;
      FieldByName('TOTALVENDA_BRUTA').Value  := 0;
      FieldByName('DESCONTO').Value          := 0;
      FieldByName('DESCONTO_CUPOM').Value    := 0;
      FieldByName('TOTALVENDA').Value        := 0;
      FieldByName('GERAR_ESTOQUE_CLIENTE').Value := 0;
      FieldByName('NFE_ENVIADA').Value           := 0;
      FieldByName('NFE_DENEGADA').AsInteger      := 0;
      FieldByName('NFE_MODALIDADE_FRETE').Value  := MODALIDADE_FRETE_SEMFRETE;
      FieldByName('USUARIO').Value               := GetUserApp;

      FieldByName('VENDEDOR_COD').Value   := edNomeVendedor.Tag;
      FieldByName('FORMAPAG').Value       := edNomeFormaPagto.Caption;
      FieldByName('VENDA_PRAZO').Value    := 0;

      FieldByName('CODCLIENTE').Value := edNomeCliente.Tag;
      FieldByName('CODCLI').Value     := edNomeCliente.Hint;
      FieldByName('NOME').Value       := edNomeCliente.Caption;

      if (AnsiUpperCase(Trim(FieldByName('NOME').AsString)) <> CONSUMIDOR_FINAL_NOME) then
      begin
        FieldByName('CODCLIENTE').Clear;
        FieldByName('CODCLI').Clear;
        FieldByName('NOME').Clear;
      end;

      FieldByName('FORMAPAGTO_COD').Clear;
      FieldByName('CONDICAOPAGTO_COD').Clear;
      FieldByName('SERIE').Clear;
      FieldByName('NFE').Clear;
      FieldByName('LOTE_NFE_ANO').Clear;
      FieldByName('LOTE_NFE_NUMERO').Clear;
      FieldByName('NFE_TRANSPORTADORA').Clear;
      FieldByName('NFE_DENEGADA_MOTIVO').Clear;

      CarregarDadosCFOP( FieldByName('CFOP').AsInteger );

      CarregarItens(
        FieldByName('CODEMP').AsString,
        FieldByName('ANO').AsInteger,
        FieldByName('CODCONTROL').AsInteger );
      CarregarFormaPagto(
        FieldByName('CODEMP').AsString,
        FieldByName('ANO').AsInteger,
        FieldByName('CODCONTROL').AsInteger );

      ZerarFormaPagto;
      IniciarCupomProduto;
    end;
end;

procedure TfrmGeVendaPDV.ZerarFormaPagto;
var
  I : Integer;
begin
  with DataSetFormaPagto do
  begin
    First;

    while not Eof do
      Delete;

    // Adicionar forma de pagamento inicial

    Append;

    FieldByName('ANO_VENDA').Value         := DataSetVenda.FieldByName('ANO').Value;
    FieldByName('CONTROLE_VENDA').Value    := DataSetVenda.FieldByName('CODCONTROL').Value;
    FieldByName('FORMAPAGTO_COD').Value    := edNomeFormaPagto.Tag;
    FieldByName('CONDICAOPAGTO_COD').Value := GetCondicaoPagtoIDDefault;
    FieldByName('VALOR_FPAGTO').Value      := dbValorAPagar.Field.AsCurrency;
    FieldByName('VALOR_RECEBIDO').Value    := dbValorAPagar.Field.AsCurrency;
    FieldByName('VENDA_PRAZO').Value       := 0;

    for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
      FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;

    if not EstaEditando then
      DataSetVenda.Edit;

    DataSetVenda.FieldByName('VENDA_PRAZO').AsInteger := 0;
  end;
end;

function TfrmGeVendaPDV.DataSetFormaPagto: TDataSet;
begin
  Result := dtsFormaPagto.DataSet;
end;

function TfrmGeVendaPDV.DataSetItens: TDataSet;
begin
  Result := dtsItem.DataSet;
end;

function TfrmGeVendaPDV.DataSetTitulo: TDataSet;
begin
  Result := dtsTitulos.DataSet;
end;

procedure TfrmGeVendaPDV.dtsVendaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = DataSetVenda.FieldByName('CODCONTROL') ) then
    Self.Caption := 'Vendas PDV | No. ' + DataSetVenda.FieldByName('ANO').AsString + '/' + FormatFloat('###00000', DataSetVenda.FieldByName('CODCONTROL').AsInteger);
end;

procedure TfrmGeVendaPDV.CarregarItens(const Empresa: String; const Ano,
  Controle: Integer);
begin
  with TIBDataSet(DataSetItens) do
  begin
    Close;
    ParamByName('empresa').AsString   := Empresa;
    ParamByName('ano').AsInteger      := Ano;
    ParamByName('controle').AsInteger := Controle;
    Open;
  end;
end;

procedure TfrmGeVendaPDV.CarregarFormaPagto(const Empresa: String;
  const Ano, Controle: Integer);
begin
  with TIBDataSet(DataSetFormaPagto) do
  begin
    Close;
    ParamByName('ano').AsInteger      := Ano;
    ParamByName('controle').AsInteger := Controle;
    Open;
  end;

  tblFormaPagto.Close;
  tblFormaPagto.Open;
  tblFormaPagto.Locate('COD', DataSetFormaPagto.FieldByName('FORMAPAGTO_COD').AsInteger, []);

  tblCondicaoPagto.Close;
  tblCondicaoPagto.Open;
  tblCondicaoPagto.Locate('COND_COD', DataSetFormaPagto.FieldByName('CONDICAOPAGTO_COD').AsInteger, []);
end;

procedure TfrmGeVendaPDV.actCancelarExecute(Sender: TObject);
begin
  if EstaEditando then
    DataSetVenda.Cancel;

  with DataSetVenda do
    if ( RecordCount = 0 ) then
    begin
      CarregarVenda(GetEmpresaIDDefault, 0, 0);
      IniciarCupomCabecalho;
      IniciarCupomProduto;
    end
    else
    begin
      if VendaEstaAberta then
        if ShowConfirmation('Confirma o cancelamento do orçamento?') then
        begin
          TIBDataSet(DataSetVenda).Delete;
          TIBDataSet(DataSetVenda).ApplyUpdates;
          CommitTransaction;
        end;

      CarregarVenda(GetEmpresaIDDefault, 0, 0);
      IniciarCupomCabecalho;
      IniciarCupomProduto;
    end;
end;

procedure TfrmGeVendaPDV.actCarregarVendedorExecute(Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if SelecionarVendedorPDV(Self, iCodigo, sNome) then
  begin
    edNomeVendedor.Tag     := iCodigo;
    edNomeVendedor.Caption := sNome;

    if VendaEstaAberta then
    begin
      if not EstaEditando then
        DataSetVenda.Edit;
        
      DataSetVenda.FieldByName('VENDEDOR_COD').AsInteger := iCodigo;
    end;  
  end;
end;

procedure TfrmGeVendaPDV.actCarregarProdutoExecute(Sender: TObject);
var
  iCodigo    : Integer;
  sCodigoAlfa,
  sCodigoEAN ,
  sNome      ,
  sUnidade   : String;
  cQuantidade ,
  cValorVenda : Currency;
begin
  if not EstaEditando then
    ShowWarning('Favor iniciar o processo de venda!')
  else
    if SelecionarProduto(Self, iCodigo, sCodigoAlfa, sCodigoEAN, sNome, sUnidade, cValorVenda) then
    begin
      if ( Pos(COD_MLT, edProdutoCodigo.Text) = 0 ) then
        cQuantidade := 1
      else
        cQuantidade := StrToCurrDef(Copy(edProdutoCodigo.Text, 1, Pos(COD_MLT, edProdutoCodigo.Text) - 1), 1);

      edProdutoCodigo.Text := Trim(Copy(edProdutoCodigo.Text, 1, Pos(COD_MLT, edProdutoCodigo.Text))) + Trim(IfThen(sCodigoEAN = EmptyStr, sCodigoAlfa, sCodigoEAN));
      edProdutoCodigo.SetFocus;
      edProdutoCodigo.SelStart := Length(edProdutoCodigo.Text);
      dbNomeProduto.Caption    := sNome;
      dbUnidade.Caption        := sUnidade;
      dbQuantidade.Caption     := FormatFloat(',0.###', cQuantidade);
      dbValorProduto.Caption   := FormatFloat(',0.00', cValorVenda);
      dbTotalProduto.Caption   := FormatFloat(',0.00', cValorVenda * cQuantidade);
    end;
end;

procedure TfrmGeVendaPDV.CarregarDadosCFOP(iCodigo: Integer);
begin
  with TIBDataSet(dtsCFOP.DataSet) do
  begin
    Close;
    ParamByName('Cfop_cod').AsInteger := iCodigo;
    Open;
  end;
end;

procedure TfrmGeVendaPDV.InserirProduto;

  procedure GerarSequencial(var Seq : Integer);
  begin
    if (DataSetItens.State in [dsEdit, dsInsert]) then
      DataSetItens.Cancel;

    Seq := DataSetItens.RecordCount + 1;
    if ( DataSetItens.Locate('SEQ', Seq, []) ) then
      Seq := Seq + 1;
  end;


  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item := DataSetItens.FieldByName('SEQ').AsInteger;
    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_Liquido  := 0.0;

    DataSetItens.First;

    while not DataSetItens.Eof do
    begin
      Total_Bruto    := Total_Bruto    + DataSetItens.FieldByName('TOTAL_BRUTO').AsCurrency;
      Total_desconto := Total_desconto + DataSetItens.FieldByName('TOTAL_DESCONTO').AsCurrency;

      DataSetItens.Next;
    end;

    Total_Liquido  := Total_Bruto - Total_desconto;

    DataSetItens.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalDesconto,
  cTotalLiquido : Currency;

  Sequencial,
  iCodigo   : Integer;
  sCodigo   : String;
  cQuantidade,
  cPrecoVND  : Currency;
begin
  if VendaEstaAberta then
    if not EstaEditando then
      DataSetVenda.Edit;

  if EstaEditando then
    with DataSetItens do
    begin

      // Iniciar Csmpos com valores padrões

      GerarSequencial(Sequencial);
      Append;

      FieldByName('SEQ').Value := Sequencial;

      FieldByName('ANO').Value        := DataSetVenda.FieldByName('ANO').Value;
      FieldByName('CODCONTROL').Value := DataSetVenda.FieldByName('CODCONTROL').Value;
      FieldByName('DTVENDA').Value    := DataSetVenda.FieldByName('DTVENDA').Value;
      FieldByName('CODEMP').Value     := DataSetVenda.FieldByName('CODEMP').Value;
      FieldByName('CODCLI').Value     := DataSetVenda.FieldByName('CODCLI').Value;
      FieldByName('CODCLIENTE').Value := DataSetVenda.FieldByName('CODCLIENTE').Value;

      if ( DataSetVenda.FieldByName('CFOP').IsNull ) then
      begin
        FieldByName('CFOP_COD').Value        := GetCfopIDDefault;
        FieldByName('CFOP_DESCRICAO').Value  := GetCfopNomeDefault;
      end
      else
      begin
        FieldByName('CFOP_COD').Assign( DataSetVenda.FieldByName('CFOP') );
        FieldByName('CFOP_DESCRICAO').Assign( dtsCFOP.DataSet.FieldByName('CFOP_DESCRICAO') );
      end;

      FieldByName('CST').Value             := '000';
      FieldByName('PUNIT_PROMOCAO').Value  := 0.0;
      FieldByName('ALIQUOTA').Value        := 0;
      FieldByName('ALIQUOTA_PIS').Value    := 0.0;
      FieldByName('ALIQUOTA_COFINS').Value := 0.0;
      FieldByName('QTDE').Value            := 1;
      FieldByName('QTDEFINAL').Value       := 0;
      FieldByName('DESCONTO').Value        := 0;
      FieldByName('DESCONTO_VALOR').Value  := 0;
      FieldByName('PERCENTUAL_REDUCAO_BC').Value := 0.0;

      // Carregar dados do Produto

      try
        if Length(Trim(Copy(edProdutoCodigo.Text, Pos(COD_MLT, edProdutoCodigo.Text) + 1, Length(edProdutoCodigo.Text)))) <= 7 then
        begin
          iCodigo := StrToInt( Copy(edProdutoCodigo.Text, Pos(COD_MLT, edProdutoCodigo.Text) + 1, Length(edProdutoCodigo.Text)) );
          sCodigo := 'XXXXXXXXXXXXX'
        end
        else
        begin
          iCodigo := 0;
          sCodigo := Copy(edProdutoCodigo.Text, Pos(COD_MLT, edProdutoCodigo.Text) + 1, Length(edProdutoCodigo.Text));
        end;
      except
        if (DataSetItens.State in [dsEdit, dsInsert]) then
          DataSetItens.Cancel;
          
        ShowWarning('Favor informar código do produto!');
        Abort;
      end;

      TIBDataSet(dtsProduto.DataSet).Close;
      TIBDataSet(dtsProduto.DataSet).ParamByName('Codigo').AsInteger     := iCodigo;
      TIBDataSet(dtsProduto.DataSet).ParamByName('CodigoBarra').AsString := sCodigo;
      TIBDataSet(dtsProduto.DataSet).Open;

      if TIBDataSet(dtsProduto.DataSet).IsEmpty then
      begin
        Cancel;
        ShowWarning('Código do produto não cadastrado!');
        Exit;
      end;

      if ( Pos(COD_MLT, edProdutoCodigo.Text) = 0 ) then
        cQuantidade := 1
      else
        cQuantidade := StrToCurrDef( StringReplace(Copy(edProdutoCodigo.Text, 1, Pos(COD_MLT, edProdutoCodigo.Text) - 1), ',', '.', [rfReplaceAll]), 1 );

      // Inserir dados do Produto encontrado

      FieldByName('CODPROD').AsString     := dtsProduto.DataSet.FieldByName('Cod').AsString;
      FieldByName('DESCRI').AsString      := dtsProduto.DataSet.FieldByName('Descri').AsString;
      FieldByName('UNP_SIGLA').AsString   := dtsProduto.DataSet.FieldByName('Unp_sigla').AsString;
      FieldByName('QTDE').Value           := cQuantidade;

      if ( dtsProduto.DataSet.FieldByName('Codunidade').AsInteger > 0 ) then
        FieldByName('UNID_COD').AsInteger   := dtsProduto.DataSet.FieldByName('Codunidade').AsInteger;

      if ( dtsProduto.DataSet.FieldByName('Codcfop').AsInteger > 0 ) then
        FieldByName('CFOP_COD').AsInteger := dtsProduto.DataSet.FieldByName('Codcfop').AsInteger;

      FieldByName('ALIQUOTA').AsCurrency              := dtsProduto.DataSet.FieldByName('Aliquota').AsCurrency;
      FieldByName('ALIQUOTA_CSOSN').AsCurrency        := dtsProduto.DataSet.FieldByName('Aliquota_csosn').AsCurrency;
      FieldByName('ALIQUOTA_PIS').AsCurrency          := dtsProduto.DataSet.FieldByName('Aliquota_pis').AsCurrency;
      FieldByName('ALIQUOTA_COFINS').AsCurrency       := dtsProduto.DataSet.FieldByName('Aliquota_cofins').AsCurrency;
      FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency := dtsProduto.DataSet.FieldByName('Percentual_reducao_BC').AsCurrency;

      if ( Trim(dtsProduto.DataSet.FieldByName('Cst').AsString) <> EmptyStr ) then
        FieldByName('CST').AsString       := dtsProduto.DataSet.FieldByName('Cst').AsString;

      if ( Trim(dtsProduto.DataSet.FieldByName('Csosn').AsString) <> EmptyStr ) then
        FieldByName('CSOSN').AsString     := dtsProduto.DataSet.FieldByName('Csosn').AsString;

      FieldByName('PUNIT').AsCurrency          := dtsProduto.DataSet.FieldByName('Preco').AsCurrency;
      FieldByName('PUNIT_PROMOCAO').AsCurrency := dtsProduto.DataSet.FieldByName('Preco_Promocao').AsCurrency;
      FieldByName('VALOR_IPI').AsCurrency      := dtsProduto.DataSet.FieldByName('Valor_ipi').AsCurrency;

      FieldByName('ESTOQUE').AsCurrency          := dtsProduto.DataSet.FieldByName('Qtde').AsCurrency;
      FieldByName('RESERVA').AsCurrency          := dtsProduto.DataSet.FieldByName('Reserva').AsCurrency;
      FieldByName('MOVIMENTA_ESTOQUE').AsInteger := dtsProduto.DataSet.FieldByName('Movimenta_Estoque').AsInteger;

      if ( FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
      begin
        FieldByName('DESCONTO_VALOR').AsCurrency := FieldByName('PUNIT').AsCurrency - FieldByName('PUNIT_PROMOCAO').AsCurrency;
        FieldByName('DESCONTO').AsCurrency       := FieldByName('DESCONTO_VALOR').AsCurrency / FieldByName('PUNIT').AsCurrency * 100;
      end;

      CarregarDadosCFOP( FieldByName('CFOP_COD').AsInteger );

      if ( Trim(dtsCFOP.DataSet.FieldByName('Cfop_cst_padrao_saida').AsString) <> EmptyStr ) then
        FieldByName('CST').AsString := Trim(dtsCFOP.DataSet.FieldByName('Cfop_cst_padrao_saida').AsString);

      cPrecoVND := FieldByName('PUNIT').AsCurrency;

      FieldByName('DESCONTO_VALOR').AsCurrency := cPrecoVND * FieldByName('DESCONTO').AsCurrency / 100;
      FieldByName('PFINAL').AsCurrency         := cPrecoVND - FieldByName('DESCONTO_VALOR').AsCurrency;
      FieldByName('TOTAL_BRUTO').AsCurrency    := FieldByName('QTDE').AsCurrency * cPrecoVND;
      FieldByName('TOTAL_DESCONTO').AsCurrency := FieldByName('QTDE').AsCurrency * FieldByName('DESCONTO_VALOR').AsCurrency;
      FieldByName('TOTAL_LIQUIDO').AsCurrency  := FieldByName('TOTAL_BRUTO').AsCurrency - FieldByName('TOTAL_DESCONTO').AsCurrency;

      Post;

      IniciarCupomProduto;

      GetToTais(cTotalBruto, cTotalDesconto, cTotalLiquido);

      DataSetVenda.FieldByName('TOTALVENDA_BRUTA').AsCurrency := cTotalBruto;
      DataSetVenda.FieldByName('DESCONTO').AsCurrency         := cTotalDesconto;
      DataSetVenda.FieldByName('TOTALVENDA').AsCurrency       := cTotalLiquido - DataSetVenda.FieldByName('DESCONTO_CUPOM').AsCurrency;

      if ( DataSetFormaPagto.RecordCount <= 1 ) then
      begin
        if ( not (DataSetFormaPagto.State in [dsEdit, dsInsert]) ) then
          DataSetFormaPagto.Edit;

        DataSetFormaPagto.FieldByName('VALOR_FPAGTO').Value   := cTotalLiquido;
        DataSetFormaPagto.FieldByName('VALOR_RECEBIDO').Value := cTotalLiquido;
      end;
    end;
end;

procedure TfrmGeVendaPDV.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(TDbGrid(Sender).DataSource.DataSet.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGeVendaPDV.actDescontoCupomExecute(Sender: TObject);
var
  AForm : TfrmGeVendaPDVDesconto;
begin
  if not VendaEstaAberta then
    Exit;

  if not EstaEditando then
    DataSetVenda.Edit;

  if ( DataSetVenda.FieldByName('TOTALVENDA_BRUTA').AsCurrency = 0 ) then
  begin
    ShowWarning('Venda ainda não possui ítens para poder se aplicar descontos!');
    Exit;
  end;

  AForm := TfrmGeVendaPDVDesconto.Create(Self);
  try
    AForm.DescontoCupomOLD := DataSetVenda.FieldByName('DESCONTO_CUPOM').AsCurrency;

    if (AForm.ShowModal = mrOk) then
      DataSetVenda.FieldByName('DESCONTO_CUPOM').AsCurrency := AForm.DescontoAcrestimo
    else
      DataSetVenda.FieldByName('DESCONTO_CUPOM').AsCurrency := AForm.DescontoCupomOLD;

    DataSetVenda.FieldByName('TOTALVENDA').AsCurrency := DataSetVenda.FieldByName('TOTALVENDA_BRUTA').AsCurrency +
      DataSetVenda.FieldByName('DESCONTO').AsCurrency -
      DataSetVenda.FieldByName('DESCONTO_CUPOM').AsCurrency;

    if not (DataSetFormaPagto.State in [dsEdit, dsINsert]) then
      DataSetFormaPagto.Edit;

    DataSetFormaPagto.FieldByName('VALOR_FPAGTO').AsCurrency   := dbValorAPagar.Field.AsCurrency;
    DataSetFormaPagto.FieldByName('VALOR_RECEBIDO').AsCurrency := dbValorAPagar.Field.AsCurrency;
  finally
    AForm.Free;
  end;
end;

function TfrmGeVendaPDV.VendaEstaAberta: Boolean;
begin
  Result := (DataSetVenda.FieldByName('STATUS').AsInteger in [STATUS_VND_AND, STATUS_VND_ABR]);
end;

procedure TfrmGeVendaPDV.actCarregarOrcamentoExecute(Sender: TObject);
var
  AForm : TfrmGeVendaPDVOrcamento;
begin
  if EstaEditando then
  begin
    ShowWarning('Existe uma venda iniciada!' + #13 + 'Favor finalizá-la.');
    Exit;
  end;

  pnlCaixaLivre.Visible := False;
  pnlCaixaLivre.Tag     := 0;

  AForm := TfrmGeVendaPDVOrcamento.Create(Self);
  try
    AForm.OrcamentoCod := DMCupom.GetUltimaVenda(GetEmpresaIDDefault
      , gUsuarioLogado.Login
      , AForm.OrcamentoAno
      , STATUS_VND_ABR);

    if AForm.OrcamentoCod = 0 then
      AForm.e2NumeroOrcamento.Text := EmptyStr;

    if ( AForm.ShowModal = mrOk ) then
      CarregarVenda(GetEmpresaIDDefault, AForm.OrcamentoAno, AForm.OrcamentoCod);
  finally
    AForm.Free;
  end;
end;

function TfrmGeVendaPDV.VendaEstaFinalizada: Boolean;
begin
  Result := (DataSetVenda.FieldByName('STATUS').AsInteger in [STATUS_VND_FIN, STATUS_VND_NFE]);
end;

procedure TfrmGeVendaPDV.actGravarOrcamentoExecute(Sender: TObject);
begin
  if not lblGravar.Visible then
    Exit;
    
  if VendaEstaAberta then
    if not EstaEditando then
      DataSetVenda.Edit;
    
  if not EstaEditando then
    Exit;

  if ( DataSetItens.RecordCount = 0 ) then
  begin
    ShowWarning('Orçamento sem ítens não pode ser gravado!!!');
    Exit;
  end;

  if VendaEstaAberta then
    if ShowConfirmation('Gravar', 'Deseja gravar o orçamento para carregá-lo futuramente?') then
    begin
      with DataSetVenda do
      begin
        if ( FieldByName('STATUS').AsInteger = STATUS_VND_AND ) then
          FieldByName('STATUS').Value := STATUS_VND_ABR;

        FieldByName('CODCLIENTE').Value := edNomeCliente.Tag;
        FieldByName('CODCLI').Value     := edNomeCliente.Hint;
        FieldByName('NOME').Value       := edNomeCliente.Caption;
      end;

      // Grava Venda

      TIBDataSet(DataSetVenda).Post;
      TIBDataSet(DataSetVenda).ApplyUpdates;

      // Gravar Itens da Venda

      if (DataSetItens.State in [dsEdit, dsInsert]) then
        TIBDataSet(DataSetItens).Post;

      TIBDataSet(DataSetItens).ApplyUpdates;

      // Gravar Forma de Pagamento da Venda

      if (DataSetFormaPagto.State in [dsEdit, dsInsert]) then
        TIBDataSet(DataSetFormaPagto).Post;

      TIBDataSet(DataSetFormaPagto).ApplyUpdates;

      CommitTransaction;

      ShowInformation('Orçamento gravado com sucesso. Favor anotar número:' + #13#13 +
        'No. ' + DataSetVenda.FieldByName('ANO').AsString + '/' + FormatFloat('###00000', DataSetVenda.FieldByName('CODCONTROL').AsInteger));

      if GetEmitirApenasOrcamento then
        if ShowConfirmation('Orçamento', 'Deseja imprimir cupom de orçamento?') then
          DMNFe.ImprimirCupomOrcamento(
              DataSetVenda.FieldByName('CODEMP').AsString
            , DataSetVenda.FieldByName('CODCLIENTE').AsInteger
            , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
            , DataSetVenda.FieldByName('ANO').AsInteger
            , DataSetVenda.FieldByName('CODCONTROL').AsInteger);

      // Limpar Tela
      
      CarregarVenda(GetEmpresaIDDefault, 0, 0);
      IniciarCupomCabecalho;
      IniciarCupomProduto;
    end;
end;

procedure TfrmGeVendaPDV.actCarregarFormaPagtoExecute(Sender: TObject);
var
  I ,
  iCodigo : Integer;
  sNome   : String;
begin
  if SelecionarFormaPagtoPDV(Self, iCodigo, sNome) then
  begin
    edNomeFormaPagto.Tag     := iCodigo;
    edNomeFormaPagto.Caption := sNome;

    if VendaEstaAberta then
    begin
      if not EstaEditando then
        DataSetVenda.Edit;

      DataSetFormaPagto.Edit;
      DataSetFormaPagto.FieldByName('FORMAPAGTO_COD').AsInteger := iCodigo;
      DataSetFormaPagto.Post;
    end;
  end;
end;

procedure TfrmGeVendaPDV.actFinalizarVendaExecute(Sender: TObject);

  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    try
      Return := not GetPermitirVendaEstoqueInsEmpresa(dtsVenda.DataSet.FieldByName('CODEMP').AsString); // Permitir vendas de produtos com estoque insuficiente

      if Return then
      begin

        with DataSetItens do
        begin
          First;
          DisableControls;
          while not Eof do
          begin
            if ( FieldByName('MOVIMENTA_ESTOQUE').AsInteger = 0 ) then // Produto não movimenta estoque
              Return := False
            else
              Return := ( (FieldByName('QTDE').AsCurrency > (FieldByName('ESTOQUE').AsCurrency - FieldByName('RESERVA').AsCurrency)) or (FieldByName('ESTOQUE').AsCurrency <= 0) );

            if ( Return ) then
              Break;
            Next;
          end;
        end;

      end;
    finally
      dtsItem.DataSet.EnableControls;
      Result := Return;
    end;
  end;

var
  AForm : TfrmGeVendaPDVFinalizar;
  bConfirmado : Boolean;

  iGerarEstoqueCliente,
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;

  iNumero     ,
  iSerieNFCe  ,
  iNumeroNFCe : Integer;
  sFileNameXML ,
  sChaveNFE    ,
  sProtocoloNFE,
  sReciboNFE   ,
  sMensagem    ,
  sDenegadaMotivo : String;
  iNumeroLote  : Int64;
  bDenegada    : Boolean;
begin
  if ( dtsVenda.DataSet.IsEmpty or dtsItem.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  CxAno    := 0;
  CxNumero := 0;
  CxContaCorrente := 0;

  with DataSetVenda do
  begin
    // Verificar se cliente está bloqueado, caso a venda seja a prazo

    if ( FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
      if ( FieldByName('BLOQUEADO').AsInteger = 1 ) then
      begin
        ShowWarning('Cliente bloqueado!' + #13#13 + 'Motivo:' + #13 + FieldByName('BLOQUEADO_MOTIVO').AsString);
        Exit;
      end;
  end;

  // Verificar se existe caixa aberto para o usuário do sistema

  if DataSetFormaPagto.Locate('VENDA_PRAZO', 0, []) then
    if ( not CaixaAberto(DataSetVenda.FieldByName('CODEMP').AsString
      , GetUserApp
      , GetDateDB
      , DataSetFormaPagto.FieldByName('FORMAPAGTO_COD').AsInteger
      , CxAno
      , CxNumero
      , CxContaCorrente) ) then
    begin
      ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento ' + QuotedStr(edNomeFormaPagto.Caption) + '.');
      Exit;
    end;

  DataSetVenda.Edit;

  if ( DataSetVenda.FieldByName('VENDEDOR_COD').AsInteger = 0 ) then
    ShowWarning('Favor informar o vendedor')
  else
  if ( QuantidadeInvalida ) then
  begin
    ShowWarning('Quantidade informada para o ítem ' + FormatFloat('#00', DataSetItens.FieldByName('SEQ').AsInteger) + ' está acima da quantidade disponível no estoque.');
    if ( dbgDados.Visible and dbgDados.Enabled ) then
      dbgDados.SetFocus;
  end
  else

  // Chamar tela para inserir dados de Finalização de Venda

  AForm := TfrmGeVendaPDVFinalizar.Create(Self);
  try
    if not (DataSetFormaPagto.State in [dsEdit, dsINsert]) then
      DataSetFormaPagto.Edit;

    if (DataSetFormaPagto.RecordCount = 1) then
    begin
      DataSetFormaPagto.FieldByName('VALOR_FPAGTO').AsCurrency   := dbValorAPagar.Field.AsCurrency;
      DataSetFormaPagto.FieldByName('VALOR_RECEBIDO').AsCurrency := dbValorAPagar.Field.AsCurrency;
    end;

    AForm.TotalAPagar := dbValorAPagar.Field.AsCurrency;

    bConfirmado := (AForm.ShowModal = mrOk);

    if not bConfirmado then
      Exit;
  finally
    AForm.Free;

    if bConfirmado then
    begin
      tblFormaPagto.Locate('COD', DataSetFormaPagto.FieldByName('FORMAPAGTO_COD').AsInteger, []);
      tblCondicaoPagto.Locate('COND_COD', DataSetFormaPagto.FieldByName('CONDICAOPAGTO_COD').AsInteger, []);

      edNomeFormaPagto.Tag     := DataSetFormaPagto.FieldByName('FORMAPAGTO_COD').AsInteger;
      edNomeFormaPagto.Caption := GetFormaPagtoNome( edNomeFormaPagto.Tag );
    end;
  end;

  // Verificar dados da(s) Forma(s) de Pagamento(s)

  if ( DataSetFormaPagto.RecordCount = 0 ) then
    ShowWarning('Favor informar a forma e/ou condição de pagamento')
  else
  if ( GetTotalValorFormaPagto <= 0 ) then
    ShowWarning('Favor informar corretamente o valor de cada forma/condição de pagamento')
  else
  if ( GetTotalValorFormaPagto > dbValorAPagar.Field.AsCurrency ) then
    ShowWarning('O Total A Pagar informado na forma/condição de pagamento é MAIOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.')
  else
  if ( GetTotalValorFormaPagto < dbValorAPagar.Field.AsCurrency ) then
    ShowWarning('O Total A Pagar informado na forma/condição de pagamento é MENOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.')
  else
  begin

    if ( DataSetVenda.FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
    begin
      GetComprasAbertas( DataSetVenda.FieldByName('CODCLIENTE').AsInteger );
      if ( GetTotalValorFormaPagto_APrazo > qryTotalComprasAbertasVALOR_LIMITE_DISPONIVEL.AsCurrency ) then
      begin
        ShowWarning('O Valor Total A Prazo da venda está acima do Valor Limite disponível para o cliente.' + #13#13 + 'Favor comunicar ao setor financeiro.');
        Exit;
      end;
    end;

    if GetGerarEstoqueCliente then
      iGerarEstoqueCliente := 1
    else
      iGerarEstoqueCliente := 0;

    DataSetVenda.Edit;

    DataSetVenda.FieldByName('STATUS').Value                := STATUS_VND_FIN;
    DataSetVenda.FieldByName('DTVENDA').Value               := GetDateTimeDB;
    DataSetVenda.FieldByName('DTFINALIZACAO_VENDA').Value   := GetDateTimeDB;
    DataSetVenda.FieldByName('GERAR_ESTOQUE_CLIENTE').Value := iGerarEstoqueCliente;

    DataSetVenda.FieldByName('NFE_VALOR_TOTAL_PRODUTO').AsCurrency := dbValorTotal.Field.AsCurrency;
    DataSetVenda.FieldByName('NFE_VALOR_DESCONTO').AsCurrency      := dbValorDesconto.Field.AsCurrency;
    DataSetVenda.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency    := dbValorAPagar.Field.AsCurrency;

    TIBDataSet(DataSetVenda).Post;
    TIBDataSet(DataSetVenda).ApplyUpdates;

    // Gravar Itens da Venda

    if (DataSetItens.State in [dsEdit, dsInsert]) then
      TIBDataSet(DataSetItens).Post;

    TIBDataSet(DataSetItens).ApplyUpdates;

    // Gravar Forma de Pagamento

    if (DataSetFormaPagto.State in [dsEdit, dsInsert]) then
      TIBDataSet(DataSetFormaPagto).Post;

    TIBDataSet(DataSetFormaPagto).ApplyUpdates;

    CommitTransaction;

    GerarTitulos( DataSetVenda.FieldByName('ANO').AsInteger, DataSetVenda.FieldByName('CODCONTROL').AsInteger );
    CarregarTitulos( DataSetVenda.FieldByName('CODEMP').AsString, DataSetVenda.FieldByName('ANO').AsInteger, DataSetVenda.FieldByName('CODCONTROL').AsInteger );

    ShowInformation('Venda finalizada com sucesso !' + #13#13 + 'Ano/Controle: ' + DataSetVenda.FieldByName('ANO').AsString + '/' +
      FormatFloat('##0000000', DataSetVenda.FieldByName('CODCONTROL').AsInteger));

    // Confirmar vencimentos de cada parcela

    if ( gSistema.Codigo = SISTEMA_GESTAO_COM ) then
      if ( DataSetVenda.FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
        if ( TitulosConfirmados(Self, DataSetVenda.FieldByName('ANO').AsInteger, DataSetVenda.FieldByName('CODCONTROL').AsInteger, GetTotalValorFormaPagto_APrazo) ) then
          CarregarTitulos( DataSetVenda.FieldByName('CODEMP').AsString, DataSetVenda.FieldByName('ANO').AsInteger, DataSetVenda.FieldByName('CODCONTROL').AsInteger );

    // Formas de Pagamento que nao seja a prazo

    DataSetFormaPagto.First;
    while not DataSetFormaPagto.Eof do
    begin
      if ( DataSetFormaPagto.FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
        DataSetVenda.FieldByName('VENDA_PRAZO').AsInteger := 1
      else
      if ( DataSetFormaPagto.FieldByName('VENDA_PRAZO').AsInteger = 0 ) then
        if ( DataSetTitulo.Locate('FORMA_PAGTO', DataSetFormaPagto.FieldByName('FORMAPAGTO_COD').AsInteger, []) ) then
          RegistrarPagamento(
              DataSetTitulo.FieldByName('ANOLANC').AsInteger
            , DataSetTitulo.FieldByName('NUMLANC').AsInteger
            , GetDateDB
            , DataSetFormaPagto.FieldByName('FORMAPAGTO_COD').AsInteger
            , DataSetFormaPagto.FieldByName('VALOR_FPAGTO').AsCurrency
            , DataSetVenda.FieldByName('ANO').AsInteger
            , DataSetVenda.FieldByName('CODCONTROL').AsInteger);

      DataSetFormaPagto.Next;
    end;

    if ( CxContaCorrente > 0 ) then
      GerarSaldoContaCorrente(CxContaCorrente, GetDateDB);

    // Imprimir Cupom

    if GetEmitirCupom then
      if GetEmitirCupomAutomatico then
        if DMNFe.IsEstacaoEmiteNFCe then
        begin
          // (INICIO) - Emissão de NFC-e

          bConfirmado := not DataSetNotaFiscal.IsEmpty;
          bDenegada   := False;

          // -- 1. Gerar e enviar para SEFA o arquivo XML da NFC-e

          if not bConfirmado then
            bConfirmado := DMNFe.GerarNFCeOnLineACBr(
                DataSetVenda.FieldByName('CODEMP').AsString
              , DataSetVenda.FieldByName('CODCLIENTE').AsInteger
              , FormatDateTime('dd/mm/yyyy hh:mm:ss', GetDateTimeDB)
              , DataSetVenda.FieldByName('ANO').AsInteger
              , DataSetVenda.FieldByName('CODCONTROL').AsInteger
              , iSerieNFCe
              , iNumeroNFCe
              , sFileNameXML
              , sChaveNFE
              , sProtocoloNFE
              , sReciboNFE
              , iNumeroLote
              , bDenegada
              , sDenegadaMotivo
              , False);

          if bDenegada then
          begin
            DataSetVenda.Edit;

            DataSetVenda.FieldByName('NFE_DENEGADA').AsInteger       := 1;
            DataSetVenda.FieldByName('NFE_DENEGADA_MOTIVO').AsString := AnsiUpperCase(Trim(sDenegadaMotivo));

            TIBDataSet(DataSetVenda).Post;
            TIBDataSet(DataSetVenda).ApplyUpdates;

            CommitTransaction;
          end;

          CarregarNotaFiscal(
              DataSetVenda.FieldByName('CODEMP').AsString
            , DataSetVenda.FieldByName('ANO').AsInteger
            , DataSetVenda.FieldByName('CODCONTROL').AsInteger);

          // -- 2. Salvar na base o arquivo XML da NFC-e

          if bConfirmado and DataSetNotaFiscal.IsEmpty then
          begin
            DataSetNotaFiscal.Append;

            DataSetNotaFiscal.FieldByName('EMPRESA').Value     := DataSetVenda.FieldByName('CODEMP').AsString;
            DataSetNotaFiscal.FieldByName('ANOVENDA').Value    := DataSetVenda.FieldByName('ANO').Value;
            DataSetNotaFiscal.FieldByName('NUMVENDA').Value    := DataSetVenda.FieldByName('CODCONTROL').Value;
            DataSetNotaFiscal.FieldByName('SERIE').Value       := FormatFloat('#00', iSerieNFCe);
            DataSetNotaFiscal.FieldByName('NUMERO').Value      := iNumeroNFCe;
            DataSetNotaFiscal.FieldByName('MODELO').Value      := DMNFe.GetModeloDF;
            DataSetNotaFiscal.FieldByName('VERSAO').Value      := DMNFe.GetVersaoDF;
            DataSetNotaFiscal.FieldByName('DATAEMISSAO').Value := GetDateDB;
            DataSetNotaFiscal.FieldByName('HORAEMISSAO').Value := GetTimeDB;
            DataSetNotaFiscal.FieldByName('CHAVE').Value     := sChaveNFE;
            DataSetNotaFiscal.FieldByName('PROTOCOLO').Value := sProtocoloNFE;
            DataSetNotaFiscal.FieldByName('RECIBO').Value    := sReciboNFE;
            DataSetNotaFiscal.FieldByName('LOTE_ANO').Clear;
            DataSetNotaFiscal.FieldByName('LOTE_NUM').Clear;

            if ( FileExists(sFileNameXML) ) then
            begin
              CorrigirXML_NFe(sFileNameXML);

              DataSetNotaFiscal.FieldByName('XML_FILENAME').Value := ExtractFileName( sFileNameXML );
              TMemoField(DataSetNotaFiscal.FieldByName('XML_FILE')).LoadFromFile( sFileNameXML );
            end;

            TIBDataSet(DataSetNotaFiscal).Post;
            TIBDataSet(DataSetNotaFiscal).ApplyUpdates;

            CommitTransaction;
          end;

          // -- 3. Carregar o arquivo XML da NFC-e para impressão

          if bConfirmado then
            DMNFe.ImprimirDANFE_ESCPOSACBr(
                DataSetVenda.FieldByName('CODEMP').AsString
              , DataSetVenda.FieldByName('CODCLIENTE').AsInteger
              , DataSetVenda.FieldByName('ANO').AsInteger
              , DataSetVenda.FieldByName('CODCONTROL').AsInteger);

          // (FINAL) - Emissão de NFC-e    
        end
        else
        if GetCupomNaoFiscalEmitir then
        begin
          DMNFe.ImprimirCupomNaoFiscal(
              DataSetVenda.FieldByName('CODEMP').AsString
            , DataSetVenda.FieldByName('CODCLIENTE').AsInteger
            , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
            , DataSetVenda.FieldByName('ANO').AsInteger
            , DataSetVenda.FieldByName('CODCONTROL').AsInteger);

          if DMNFe.IsEstacaoEmiteNFCeResumido then
            ;
        end
        else
          ; // Emitir Cupom Fiscal

    // Limpar Tela
    
    CarregarVenda(GetEmpresaIDDefault, 0, 0);
    IniciarCupomCabecalho;
    IniciarCupomProduto;

  end;
end;

function TfrmGeVendaPDV.GetPermissaoRotinaInterna(const Sender: TObject;
  const Alertar: Boolean): Boolean;
var
  sRotinaInternaID : String;
begin
  sRotinaInternaID := GetRotinaInternaID(Sender);

  if Trim(sRotinaInternaID) = EmptyStr then
    Result := True
  else
    Result := GetPermissaoRotinaSistema(sRotinaInternaID, Alertar);
end;

function TfrmGeVendaPDV.GetRotinaCancelarVendaID: String;
begin
  Result := GetRotinaInternaID(actVenda);
end;

function TfrmGeVendaPDV.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(actFinalizarVenda);
end;

function TfrmGeVendaPDV.GetRotinaInternaID(const Sender: TObject): String;
var
  sComplemento : String;
begin
  sComplemento := StringOfChar('0', ROTINA_LENGTH_ID);

  if ( Trim(RotinaID) = EmptyStr ) then
    Result := EmptyStr
  else
    Result := Copy(Copy(RotinaID, 1, 6) + FormatFloat('00', TComponent(Sender).Tag) + sComplemento, 1, ROTINA_LENGTH_ID);
end;

function TfrmGeVendaPDV.GetRotinaIniciarVendaID: String;
begin
  Result := GetRotinaInternaID(actIniciarVenda);
end;

function TfrmGeVendaPDV.GetTotalValorFormaPagto: Currency;
var
  cReturn : Currency;
begin
  cReturn := 0;

  with DataSetFormaPagto do
  begin
    DisableControls;

    if (State in [dsEdit, dsInsert]) then
      Post;


    First;
    while not Eof do
    begin
      cReturn := cReturn + FieldByName('VALOR_FPAGTO').AsCurrency;
      Next;
    end;
    First;

    EnableControls;
  end;
  Result := cReturn;
end;

procedure TfrmGeVendaPDV.GetComprasAbertas(iCodigoCliente: Integer);
begin
  with qryTotalComprasAbertas do
  begin
    Close;
    ParamByName('codigo').AsInteger := iCodigoCliente;
    Open;
  end;
end;

function TfrmGeVendaPDV.GetTotalValorFormaPagto_APrazo: Currency;
var
  cReturn : Currency;
begin
  cReturn := 0;

  with DataSetFormaPagto do
  begin
    DisableControls;

    if (State in [dsEdit, dsInsert]) then
      Post;

    First;
    while not Eof do
    begin
      if ( FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
        cReturn := cReturn + FieldByName('VALOR_FPAGTO').AsCurrency;
      Next;
    end;
    First;

    EnableControls;
  end;
  Result := cReturn;
end;

function TfrmGeVendaPDV.GetGerarEstoqueCliente(
  const Alertar: Boolean): Boolean;
var
  iReturn : Boolean;
begin
  iReturn := False;
  try
    if GetEstoqueSateliteEmpresa(GetEmpresaIDDefault) then
      with DMBusiness, qryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select');
        SQL.Add('  coalesce(entrega_fracionada_venda, 0) as gerar_estoque');
        SQL.Add('from TBCLIENTE');
        SQL.Add('where Codigo = ' + DataSetVenda.FieldByName('CODCLIENTE').AsString);
        Open;

        iReturn := (FieldByName('gerar_estoque').AsInteger = 1);

        if iReturn and Alertar then
          if not ShowConfirm('Cliente trabalha com recebimento fracionado de produtos comprados nesta empresa.' + #13#13 +
            'Deseja gerar um estoque satélite para o cliente para entregas fracionadas a partir de requisições e geração de Cartas de Créditos?', 'Estoque Cliente') then
            iReturn := False;

        Close;
      end;
  finally
    Result := iReturn;
  end;
end;

procedure TfrmGeVendaPDV.GerarTitulos(const AnoVenda: Smallint;
  const ControleVenda: Integer);
begin
  try

    try

      UpdateSequence('GEN_CONTAREC_NUM_' + IntToStr(AnoVenda), 'TBCONTREC', 'NUMLANC', 'where ANOLANC = ' + IntToStr(AnoVenda));

      with IbStrPrcGerarTitulos do
      begin
        ParamByName('anovenda').AsInteger := AnoVenda;
        ParamByName('numvenda').AsInteger := ControleVenda;
        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar gerar títulos de recebimento.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure TfrmGeVendaPDV.CarregarTitulos(const Empresa: String; const Ano,
  Controle: Integer);
begin
  with TIBDataSet(DataSetTitulo) do
  begin
    Close;
    ParamByName('anovenda').AsInteger := Ano;
    ParamByName('numvenda').AsInteger := Controle;
    Open;
  end;
end;

procedure TfrmGeVendaPDV.actProdutoValorExecute(Sender: TObject);
(*
  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item := DataSetItens.FieldByName('SEQ').AsInteger;
    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_Liquido  := 0.0;

    DataSetItens.First;

    while not DataSetItens.Eof do
    begin
      Total_Bruto    := Total_Bruto    + DataSetItens.FieldByName('TOTAL_BRUTO').AsCurrency;
      Total_desconto := Total_desconto + DataSetItens.FieldByName('TOTAL_DESCONTO').AsCurrency;

      DataSetItens.Next;
    end;

    Total_Liquido  := Total_Bruto - Total_desconto;

    DataSetItens.Locate('SEQ', Item, []);
  end;

var
  AForm : TfrmGeVendaPDVItem;

  cPrecoVND     ,
  cTotalBruto   ,
  cTotalDesconto,
  cTotalLiquido : Currency;
*)
begin
  if ( dtsVenda.DataSet.IsEmpty or dtsItem.DataSet.IsEmpty ) then
    Exit;

  ProdutoAlterar( alterarValor );  
(*
  if VendaEstaAberta then
  begin
    if not GetUserPermitirAlterarValorVenda then
    begin
      ShowWarning('Usuário sem permissão para alterar valor unitário de venda!');
      Exit;
    end;

    try
      with DataSetItens do
      begin
        AForm := TfrmGeVendaPDVItem.Create(Self);
        AForm.Titulo  := 'Valor Unitário (R$):';
        AForm.Formato := ',0.00';
        AForm.ValorAterar := DataSetItens.FieldByName('PUNIT').AsCurrency;

        if ( AForm.ShowModal = mrOk ) then
        begin

          if not (State in [dsEdit, dsInsert]) then
            DataSetItens.Edit;

          FieldByName('PUNIT').AsCurrency := AForm.ValorAterar;

          if ( FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
          begin
            FieldByName('DESCONTO_VALOR').AsCurrency := FieldByName('PUNIT').AsCurrency - FieldByName('PUNIT_PROMOCAO').AsCurrency;
            FieldByName('DESCONTO').AsCurrency       := FieldByName('DESCONTO_VALOR').AsCurrency / FieldByName('PUNIT').AsCurrency * 100;
          end;

          cPrecoVND := FieldByName('PUNIT').AsCurrency;

          FieldByName('DESCONTO_VALOR').AsCurrency := cPrecoVND * FieldByName('DESCONTO').AsCurrency / 100;
          FieldByName('PFINAL').AsCurrency         := cPrecoVND - FieldByName('DESCONTO_VALOR').AsCurrency;
          FieldByName('TOTAL_BRUTO').AsCurrency    := FieldByName('QTDE').AsCurrency * cPrecoVND;
          FieldByName('TOTAL_DESCONTO').AsCurrency := FieldByName('QTDE').AsCurrency * FieldByName('DESCONTO_VALOR').AsCurrency;
          FieldByName('TOTAL_LIQUIDO').AsCurrency  := FieldByName('TOTAL_BRUTO').AsCurrency - FieldByName('TOTAL_DESCONTO').AsCurrency;

          DataSetItens.Post;

          GetToTais(cTotalBruto, cTotalDesconto, cTotalLiquido);

          if not (DataSetVenda.State in [dsEdit, dsInsert]) then
            DataSetVenda.Edit;

          DataSetVenda.FieldByName('TOTALVENDA_BRUTA').AsCurrency := cTotalBruto;
          DataSetVenda.FieldByName('DESCONTO').AsCurrency         := cTotalDesconto;
          DataSetVenda.FieldByName('TOTALVENDA').AsCurrency       := cTotalLiquido - DataSetVenda.FieldByName('DESCONTO_CUPOM').AsCurrency;

          if ( DataSetFormaPagto.RecordCount <= 1 ) then
          begin
            if ( not (DataSetFormaPagto.State in [dsEdit, dsInsert]) ) then
              DataSetFormaPagto.Edit;

            DataSetFormaPagto.FieldByName('VALOR_FPAGTO').Value := cTotalLiquido;
          end;
        end;
      end;
    finally
      AForm.Free;
      IniciarCupomProduto;
    end;

  end;
*)  
end;

procedure TfrmGeVendaPDV.actProdutoQuantidadeExecute(Sender: TObject);
(*
  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item := DataSetItens.FieldByName('SEQ').AsInteger;
    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_Liquido  := 0.0;

    DataSetItens.First;

    while not DataSetItens.Eof do
    begin
      Total_Bruto    := Total_Bruto    + DataSetItens.FieldByName('TOTAL_BRUTO').AsCurrency;
      Total_desconto := Total_desconto + DataSetItens.FieldByName('TOTAL_DESCONTO').AsCurrency;

      DataSetItens.Next;
    end;

    Total_Liquido  := Total_Bruto - Total_desconto;

    DataSetItens.Locate('SEQ', Item, []);
  end;

var
  AForm : TfrmGeVendaPDVItem;

  cPrecoVND     ,
  cTotalBruto   ,
  cTotalDesconto,
  cTotalLiquido : Currency;
*)
begin
  if ( dtsVenda.DataSet.IsEmpty or dtsItem.DataSet.IsEmpty ) then
    Exit;

  ProdutoAlterar( alterarQuantidade );
(*
  if VendaEstaAberta then
  begin

    try
      with DataSetItens do
      begin
        AForm := TfrmGeVendaPDVItem.Create(Self);
        AForm.Titulo  := 'Quantidade:';
        AForm.Formato := ',0.###';
        AForm.ValorAterar := DataSetItens.FieldByName('QTDE').AsCurrency;

        if ( AForm.ShowModal = mrOk ) then
        begin

          if not (State in [dsEdit, dsInsert]) then
            DataSetItens.Edit;

          FieldByName('QTDE').AsCurrency := AForm.ValorAterar;

          if ( FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
          begin
            FieldByName('DESCONTO_VALOR').AsCurrency := FieldByName('PUNIT').AsCurrency - FieldByName('PUNIT_PROMOCAO').AsCurrency;
            FieldByName('DESCONTO').AsCurrency       := FieldByName('DESCONTO_VALOR').AsCurrency / FieldByName('PUNIT').AsCurrency * 100;
          end;

          cPrecoVND := FieldByName('PUNIT').AsCurrency;

          FieldByName('DESCONTO_VALOR').AsCurrency := cPrecoVND * FieldByName('DESCONTO').AsCurrency / 100;
          FieldByName('PFINAL').AsCurrency         := cPrecoVND - FieldByName('DESCONTO_VALOR').AsCurrency;
          FieldByName('TOTAL_BRUTO').AsCurrency    := FieldByName('QTDE').AsCurrency * cPrecoVND;
          FieldByName('TOTAL_DESCONTO').AsCurrency := FieldByName('QTDE').AsCurrency * FieldByName('DESCONTO_VALOR').AsCurrency;
          FieldByName('TOTAL_LIQUIDO').AsCurrency  := FieldByName('TOTAL_BRUTO').AsCurrency - FieldByName('TOTAL_DESCONTO').AsCurrency;

          DataSetItens.Post;

          GetToTais(cTotalBruto, cTotalDesconto, cTotalLiquido);

          if not (DataSetVenda.State in [dsEdit, dsInsert]) then
            DataSetVenda.Edit;

          DataSetVenda.FieldByName('TOTALVENDA_BRUTA').AsCurrency := cTotalBruto;
          DataSetVenda.FieldByName('DESCONTO').AsCurrency         := cTotalDesconto;
          DataSetVenda.FieldByName('TOTALVENDA').AsCurrency       := cTotalLiquido - DataSetVenda.FieldByName('DESCONTO_CUPOM').AsCurrency;

          if ( DataSetFormaPagto.RecordCount <= 1 ) then
          begin
            if ( not (DataSetFormaPagto.State in [dsEdit, dsInsert]) ) then
              DataSetFormaPagto.Edit;

            DataSetFormaPagto.FieldByName('VALOR_FPAGTO').Value := cTotalLiquido;
          end;
        end;
      end;
    finally
      AForm.Free;
      IniciarCupomProduto;
    end;

  end;
*)  
end;

procedure TfrmGeVendaPDV.ProdutoAlterar(
  const TipoAlteracao: TTipoAlteraItem);

  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item := DataSetItens.FieldByName('SEQ').AsInteger;
    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_Liquido  := 0.0;

    DataSetItens.First;

    while not DataSetItens.Eof do
    begin
      Total_Bruto    := Total_Bruto    + DataSetItens.FieldByName('TOTAL_BRUTO').AsCurrency;
      Total_desconto := Total_desconto + DataSetItens.FieldByName('TOTAL_DESCONTO').AsCurrency;

      DataSetItens.Next;
    end;

    Total_Liquido  := Total_Bruto - Total_desconto;

    DataSetItens.Locate('SEQ', Item, []);
  end;

var
  AForm : TfrmGeVendaPDVItem;

  cPrecoVND     ,
  cTotalBruto   ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( dtsVenda.DataSet.IsEmpty or dtsItem.DataSet.IsEmpty ) then
    Exit;

  if VendaEstaAberta then
  begin

    try
      with DataSetItens do
      begin
        AForm := TfrmGeVendaPDVItem.Create(Self);

        Case TipoAlteracao of
          alterarQuantidade:
            begin
              AForm.Titulo  := 'Quantidade:';
              AForm.Formato := ',0.###';
              AForm.ValorAterar := DataSetItens.FieldByName('QTDE').AsCurrency;
            end;

          alterarValor:
            begin
              AForm.Titulo  := 'Valor Unitário (R$):';
              AForm.Formato := ',0.00';
              AForm.ValorAterar := DataSetItens.FieldByName('PUNIT').AsCurrency;
            end;

          excluirProduto:
            if ShowConfirmation('Excluir Item', 'Confirma a exclusão do item selecionado?') then
            begin
              DataSetItens.Delete;

              GetToTais(cTotalBruto, cTotalDesconto, cTotalLiquido);

              if not (DataSetVenda.State in [dsEdit, dsInsert]) then
                DataSetVenda.Edit;

              DataSetVenda.FieldByName('TOTALVENDA_BRUTA').AsCurrency := cTotalBruto;
              DataSetVenda.FieldByName('DESCONTO').AsCurrency         := cTotalDesconto;
              DataSetVenda.FieldByName('TOTALVENDA').AsCurrency       := cTotalLiquido - DataSetVenda.FieldByName('DESCONTO_CUPOM').AsCurrency;

              if ( DataSetFormaPagto.RecordCount <= 1 ) then
              begin
                if ( not (DataSetFormaPagto.State in [dsEdit, dsInsert]) ) then
                  DataSetFormaPagto.Edit;

                DataSetFormaPagto.FieldByName('VALOR_FPAGTO').Value   := cTotalLiquido;
                DataSetFormaPagto.FieldByName('VALOR_RECEBIDO').Value := cTotalLiquido;
              end;

              Exit;
            end;

        end;

        if ( AForm.ShowModal = mrOk ) then
        begin

          if not (State in [dsEdit, dsInsert]) then
            DataSetItens.Edit;

          Case TipoAlteracao of
            alterarQuantidade : FieldByName('QTDE').AsCurrency  := AForm.ValorAterar;
            alterarValor      : FieldByName('PUNIT').AsCurrency := AForm.ValorAterar;
          end;

          if ( FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
          begin
            FieldByName('DESCONTO_VALOR').AsCurrency := FieldByName('PUNIT').AsCurrency - FieldByName('PUNIT_PROMOCAO').AsCurrency;
            FieldByName('DESCONTO').AsCurrency       := FieldByName('DESCONTO_VALOR').AsCurrency / FieldByName('PUNIT').AsCurrency * 100;
          end;

          cPrecoVND := FieldByName('PUNIT').AsCurrency;

          FieldByName('DESCONTO_VALOR').AsCurrency := cPrecoVND * FieldByName('DESCONTO').AsCurrency / 100;
          FieldByName('PFINAL').AsCurrency         := cPrecoVND - FieldByName('DESCONTO_VALOR').AsCurrency;
          FieldByName('TOTAL_BRUTO').AsCurrency    := FieldByName('QTDE').AsCurrency * cPrecoVND;
          FieldByName('TOTAL_DESCONTO').AsCurrency := FieldByName('QTDE').AsCurrency * FieldByName('DESCONTO_VALOR').AsCurrency;
          FieldByName('TOTAL_LIQUIDO').AsCurrency  := FieldByName('TOTAL_BRUTO').AsCurrency - FieldByName('TOTAL_DESCONTO').AsCurrency;

          DataSetItens.Post;

          GetToTais(cTotalBruto, cTotalDesconto, cTotalLiquido);

          if not (DataSetVenda.State in [dsEdit, dsInsert]) then
            DataSetVenda.Edit;

          DataSetVenda.FieldByName('TOTALVENDA_BRUTA').AsCurrency := cTotalBruto;
          DataSetVenda.FieldByName('DESCONTO').AsCurrency         := cTotalDesconto;
          DataSetVenda.FieldByName('TOTALVENDA').AsCurrency       := cTotalLiquido - DataSetVenda.FieldByName('DESCONTO_CUPOM').AsCurrency;

          if ( DataSetFormaPagto.RecordCount <= 1 ) then
          begin
            if ( not (DataSetFormaPagto.State in [dsEdit, dsInsert]) ) then
              DataSetFormaPagto.Edit;

            DataSetFormaPagto.FieldByName('VALOR_FPAGTO').Value   := cTotalLiquido;
            DataSetFormaPagto.FieldByName('VALOR_RECEBIDO').Value := cTotalLiquido;
          end;
        end;
      end;
    finally
      AForm.Free;
      IniciarCupomProduto;
    end;

  end;
end;

procedure TfrmGeVendaPDV.actProdutoExcluirExecute(Sender: TObject);
begin
  if ( dtsVenda.DataSet.IsEmpty or dtsItem.DataSet.IsEmpty ) then
    Exit;

  ProdutoAlterar( excluirProduto );
end;

procedure TfrmGeVendaPDV.CarregarNotaFiscal(const Empresa: String;
  const Ano: Smallint; const Controle: Integer);
begin
  with TIBDataSet(DataSetNotaFiscal) do
  begin
    Close;
    ParamByName('empresa').AsString   := Empresa;
    ParamByName('ano').AsInteger      := Ano;
    ParamByName('controle').AsInteger := Controle;
    Open;
  end;
end;

function TfrmGeVendaPDV.DataSetNotaFiscal: TDataSet;
begin
  Result := dtsNotaFiscal.DataSet;
end;

initialization
  FormFunction.RegisterForm('frmGeVendaPDV', TfrmGeVendaPDV);

end.
