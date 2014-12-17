unit UGrConfigurarAmbiente;

interface

uses
  UEcfFactory,
  
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, ComCtrls, IniFiles, DB,
  DBClient, Printers, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, TypInfo;

type
  TfrmGrConfigurarAmbiente = class(TfrmGrPadrao)
    PnlBotoes: TPanel;
    Bevel3: TBevel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    PgcConfiguracao: TPageControl;
    TbsGeral: TTabSheet;
    GrpBxPadrao: TGroupBox;
    lblPais: TLabel;
    edPais: TEdit;
    edPaisNome: TEdit;
    lblEstado: TLabel;
    edEstado: TEdit;
    edEstadoNome: TEdit;
    lblCidade: TLabel;
    edCidade: TEdit;
    edCidadeNome: TEdit;
    TbsPDV: TTabSheet;
    GrpBxImpressaoCupomNFiscal: TGroupBox;
    lblCupomNaoFiscalTipo: TLabel;
    chkCupomNaoFiscal: TCheckBox;
    edCupomNaoFiscalTipo: TComboBox;
    lblFormaPagto: TLabel;
    edFormaPagto: TEdit;
    edFormaPagtoNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblCondicaoPagto: TLabel;
    edCondicaoPagto: TEdit;
    edCondicaoPagtoNome: TEdit;
    PnlCupom: TPanel;
    chkCupomAutomatico: TCheckBox;
    chkCupomEmitir: TCheckBox;
    lblVendedor: TLabel;
    edVendedor: TEdit;
    edVendedorNome: TEdit;
    Label1: TLabel;
    lblCFOPEntrada: TLabel;
    edCFOPEntrada: TEdit;
    edCFOPEntradaNome: TEdit;
    lblCFOPSaida: TLabel;
    edCFOPSaida: TEdit;
    edCFOPSaidaNome: TEdit;
    Label6: TLabel;
    chkCarregarPeloEAN: TCheckBox;
    lblCupomNaoFiscalImpressora: TLabel;
    edCupomNaoFiscalImpressora: TComboBox;
    chkOrcamentoEmitir: TCheckBox;
    edNumeroCaixa: TEdit;
    lblNumeroCaixa: TLabel;
    ACBrNFeDANFeESCPOS: TACBrNFeDANFeESCPOS;
    lblCupomNaoFiscalModelo: TLabel;
    edCupomNaoFiscalModelo: TComboBox;
    lblCupomNaoFiscalPorta: TLabel;
    edCupomNaoFiscalPorta: TComboBox;
    lblCupomNaoFiscalModeloEsp: TLabel;
    edCupomNaoFiscalModeloEsp: TComboBox;
    procedure ApenasNumerosKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkCupomNaoFiscalClick(Sender: TObject);
    procedure chkCupomEmitirClick(Sender: TObject);
    procedure edCupomNaoFiscalTipoChange(Sender: TObject);
    procedure chkOrcamentoEmitirClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarDadosINI;
    procedure GravarDadosINI;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGrConfigurarAmbiente: TfrmGrConfigurarAmbiente;

implementation

uses UDMBusiness, UConstantesDGE, UFuncoes;

{$R *.dfm}

{ TfrmGrConfigurarAmbiente }

procedure TfrmGrConfigurarAmbiente.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGrConfigurarAmbiente.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGrConfigurarAmbiente.FormCreate(Sender: TObject);
var
  ModeloImpressora : TACBrNFeMarcaImpressora;
  postasCOM : TStringList;
  I : Integer;
begin
  inherited;
  PgcConfiguracao.ActivePage := TbsGeral;

  // Listar Tipo de Emissões

  edCupomNaoFiscalTipo.Items.Clear;
  For I := Ord(Low(TEcfTipo)) to Ord(High(TEcfTipo)) do
    edCupomNaoFiscalTipo.Items.Add(GetEnumName(TypeInfo(TEcfTipo), I));

  edCupomNaoFiscalImpressora.Items     := Printer.Printers;
  edCupomNaoFiscalImpressora.ItemIndex := Printer.PrinterIndex;

  // Portas COM disponíveis

  postasCOM := TStringList.Create;
  postasCOM.BeginUpdate;
  postasCOM.Clear;
  try
    ACBrNFeDANFeESCPOS.Device.AcharPortasSeriais(postasCOM);
    for I := 0 to postasCOM.Count - 1 do
      edCupomNaoFiscalPorta.Items.Add( postasCOM.Strings[I] );
  finally
    postasCOM.EndUpdate;
  end;

  // Listar de Impressoras suportadas para o ESC POS (NFC-e)

  edCupomNaoFiscalModelo.Items.Clear ;
  For ModeloImpressora := Low(TACBrNFeMarcaImpressora) to High(TACBrNFeMarcaImpressora) do
    edCupomNaoFiscalModelo.Items.Add(GetEnumName(TypeInfo(TACBrNFeMarcaImpressora), Integer(ModeloImpressora)));

  // Listar Modelos Específicos

  edCupomNaoFiscalModeloEsp.Items.Clear;
  For I := Ord(Low(TEcfBematech)) to Ord(High(TEcfBematech)) do
    edCupomNaoFiscalModeloEsp.Items.Add(GetEnumName(TypeInfo(TEcfBematech), I));

  TbsPDV.TabVisible := gSistema.Codigo in [SISTEMA_GESTAO, SISTEMA_PDV];
end;

procedure TfrmGrConfigurarAmbiente.CarregarDadosINI;
begin
  // Geral
  
  edPais.Text   := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_PAIS,   INI_KEY_PAIS_VALUE);
  edEstado.Text := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_ESTADO, INI_KEY_ESTADO_VALUE);
  edCidade.Text := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_CIDADE, INI_KEY_CIDADE_VALUE);

  edPaisNome.Text   := GetPaisNomeDefault;
  edEstadoNome.Text := GetEstadoNome( StrToIntDef(edEstado.Text, 0) );
  edCidadeNome.Text := GetCidadeNome( StrToIntDef(edCidade.Text, 0) );

  edFormaPagto.Text    := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_FORMA_PGTO, INI_KEY_FORMA_PGTO_VALUE);
  edCondicaoPagto.Text := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_COND_PGTO,  INI_KEY_COND_PGTO_VALUE);
  edVendedor.Text      := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_VENDEDOR,   INI_KEY_VENDEDOR_VALUE);

  edFormaPagtoNome.Text    := GetFormaPagtoNome   ( StrToIntDef(edFormaPagto.Text, 0) );
  edCondicaoPagtoNome.Text := GetCondicaoPagtoNome( StrToIntDef(edCondicaoPagto.Text, 0) );
  edVendedorNome.Text      := GetVendedorNome     ( StrToIntDef(edVendedor.Text, 0) );

  edCFOPEntrada.Text := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_CFOP_ENT, INI_KEY_CFOP_ENT_VALUE);
  edCFOPSaida.Text   := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_CFOP_SAI, INI_KEY_CFOP_SAI_VALUE);

  edCFOPEntradaNome.Text := GetCfopNome( StrToIntDef(edCFOPEntrada.Text, 0) );
  edCFOPSaidaNome.Text   := GetCfopNome( StrToIntDef(edCFOPSaida.Text, 0) );

  chkCarregarPeloEAN.Checked := FileINI.ReadBool  (INI_SECAO_VENDA, INI_KEY_CODIGO_EAN, GetCarregarProdutoCodigoBarra(GetEmpresaIDDefault));
  edNumeroCaixa.Text         := FileINI.ReadString(INI_SECAO_VENDA, INI_KEY_NUMERO_CAIXA, '1');

  // PDV

  chkOrcamentoEmitir.Checked       := FileINI.ReadBool   (INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_ORCAM, False);
  chkCupomEmitir.Checked           := FileINI.ReadBool   (INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM, False);
  chkCupomAutomatico.Checked       := FileINI.ReadBool   (INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM_AUTOMAT, False);
  chkCupomNaoFiscal.Checked        := FileINI.ReadBool   (INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM_NFISCAL, False);
  edCupomNaoFiscalTipo.ItemIndex   := FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_TP', 0);
  edCupomNaoFiscalPorta.ItemIndex  := FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_ID', 0);
  edCupomNaoFiscalPorta.Text       := FileINI.ReadString (INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_DS', 'Nenhum');
  edCupomNaoFiscalImpressora.Text  := FileINI.ReadString (INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_NM', Printer.Printers.Strings[Printer.PrinterIndex]);
  edCupomNaoFiscalModelo.ItemIndex    := FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL_MOD + '_ID', 0);
  edCupomNaoFiscalModelo.Text         := FileINI.ReadString (INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL_MOD + '_DS', 'Nenhum');
  edCupomNaoFiscalModeloEsp.ItemIndex := FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL_MOD + '_ES', 0);

  edCupomNaoFiscalTipoChange( edCupomNaoFiscalTipo );
end;

procedure TfrmGrConfigurarAmbiente.FormShow(Sender: TObject);
begin
  inherited;
  CarregarDadosINI;
end;

procedure TfrmGrConfigurarAmbiente.GravarDadosINI;
begin
  // Geral

  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_PAIS,   edPais.Text);
  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_ESTADO, edEstado.Text);
  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_CIDADE, edCidade.Text);

  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_FORMA_PGTO, edFormaPagto.Text);
  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_COND_PGTO,  edCondicaoPagto.Text);
  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_VENDEDOR,   edVendedor.Text);

  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_CFOP_ENT, edCFOPEntrada.Text);
  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_CFOP_SAI, edCFOPSaida.Text);

  FileINI.WriteBool (INI_SECAO_VENDA, INI_KEY_CODIGO_EAN,   chkCarregarPeloEAN.Checked);
  FileINI.ReadString(INI_SECAO_VENDA, INI_KEY_NUMERO_CAIXA, edNumeroCaixa.Text);

  // PDV

  FileINI.WriteBool   (INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_ORCAM, chkOrcamentoEmitir.Checked);
  FileINI.WriteBool   (INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM, chkCupomEmitir.Checked);
  FileINI.WriteBool   (INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM_AUTOMAT, chkCupomAutomatico.Checked);
  FileINI.WriteBool   (INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM_NFISCAL, chkCupomNaoFiscal.Checked);
  FileINI.WriteInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_TP', edCupomNaoFiscalTipo.ItemIndex);
  FileINI.WriteInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_ID', edCupomNaoFiscalPorta.ItemIndex);
  FileINI.WriteString (INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_DS', edCupomNaoFiscalPorta.Text);
  FileINI.WriteString (INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_NM', edCupomNaoFiscalImpressora.Text);
  FileINI.WriteInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL_MOD + '_ID', edCupomNaoFiscalModelo.ItemIndex);
  FileINI.WriteString (INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL_MOD + '_DS', edCupomNaoFiscalModelo.Text);
  FileINI.WriteInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL_MOD + '_ES', edCupomNaoFiscalModeloEsp.ItemIndex);
end;

procedure TfrmGrConfigurarAmbiente.btnSalvarClick(Sender: TObject);
begin
  if ShowConfirm('Confirma a gravação das alterações informadas no ambinte de configuração da estação?', 'Salvar Configurações') then
  begin
    GravarDadosINI;
    ModalResult := mrOk;
  end;
end;

procedure TfrmGrConfigurarAmbiente.ApenasNumerosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #9, #13]) then
    Key := #0;
end;

procedure TfrmGrConfigurarAmbiente.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [VK_RETURN, VK_TAB] ) then
  begin
    // Endereços

    if edEstado.Focused then
    begin
      edEstadoNome.Text := GetEstadoNome( StrToIntDef(edEstado.Text, 0) );
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else
    if edCidade.Focused then
    begin
      edCidadeNome.Text := GetCidadeNome( StrToIntDef(edCidade.Text, 0) );
      Perform(WM_NEXTDLGCTL, 0, 0);
    end

    // Pagamentos
    
    else
    if edFormaPagto.Focused then
    begin
      edFormaPagtoNome.Text := GetFormaPagtoNome( StrToIntDef(edFormaPagto.Text, 0) );
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else
    if edCondicaoPagto.Focused then
    begin
      edCondicaoPagtoNome.Text := GetCondicaoPagtoNome( StrToIntDef(edCondicaoPagto.Text, 0) );
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else
    if edVendedor.Focused then
    begin
      edVendedorNome.Text := GetVendedorNome( StrToIntDef(edVendedor.Text, 0) );
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;

  inherited;
end;

procedure TfrmGrConfigurarAmbiente.chkCupomNaoFiscalClick(Sender: TObject);
begin
  lblCupomNaoFiscalPorta.Enabled := chkCupomNaoFiscal.Checked;
  edCupomNaoFiscalPorta.Enabled  := chkCupomNaoFiscal.Checked;
  lblCupomNaoFiscalImpressora.Enabled :=  chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex = 0);
  edCupomNaoFiscalImpressora.Enabled  :=  chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex = 0);
  lblCupomNaoFiscalModelo.Enabled     :=  chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex > 0);
  edCupomNaoFiscalModelo.Enabled      :=  chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex > 0);
  lblCupomNaoFiscalModeloEsp.Enabled  :=  chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex > 0);
  edCupomNaoFiscalModeloEsp.Enabled   :=  chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex > 0);
end;

procedure TfrmGrConfigurarAmbiente.chkCupomEmitirClick(Sender: TObject);
begin
  if not chkCupomEmitir.Checked then
  begin
    chkCupomAutomatico.Checked := False;
    chkCupomNaoFiscal.Checked  := False;
  end;

  chkCupomAutomatico.Enabled := chkCupomEmitir.Checked;
  chkCupomNaoFiscal.Enabled  := chkCupomEmitir.Checked;
  lblCupomNaoFiscalPorta.Enabled  := chkCupomEmitir.Checked;
  edCupomNaoFiscalPorta.Enabled   := chkCupomEmitir.Checked;
  lblCupomNaoFiscalImpressora.Enabled :=  chkCupomEmitir.Checked and chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex = 0);
  edCupomNaoFiscalImpressora.Enabled  :=  chkCupomEmitir.Checked and chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex = 0);
  lblCupomNaoFiscalModelo.Enabled     :=  chkCupomEmitir.Checked and chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex > 0);
  edCupomNaoFiscalModelo.Enabled      :=  chkCupomEmitir.Checked and chkCupomNaoFiscal.Checked and (edCupomNaoFiscalTipo.ItemIndex > 0);
end;

procedure TfrmGrConfigurarAmbiente.edCupomNaoFiscalTipoChange(
  Sender: TObject);
begin
  lblCupomNaoFiscalImpressora.Enabled :=  (edCupomNaoFiscalTipo.ItemIndex = 0);
  edCupomNaoFiscalImpressora.Enabled  :=  (edCupomNaoFiscalTipo.ItemIndex = 0);
  lblCupomNaoFiscalModelo.Enabled     :=  (edCupomNaoFiscalTipo.ItemIndex > 0);
  edCupomNaoFiscalModelo.Enabled      :=  (edCupomNaoFiscalTipo.ItemIndex > 0);
  lblCupomNaoFiscalModeloEsp.Enabled  :=  (TEcfTipo(edCupomNaoFiscalTipo.ItemIndex) = ecfBematech);
  edCupomNaoFiscalModeloEsp.Enabled   :=  (TEcfTipo(edCupomNaoFiscalTipo.ItemIndex) = ecfBematech);
  lblCupomNaoFiscalPorta.Enabled      :=  (edCupomNaoFiscalTipo.ItemIndex > 0);
  edCupomNaoFiscalPorta.Enabled       :=  (edCupomNaoFiscalTipo.ItemIndex > 0);
end;

procedure TfrmGrConfigurarAmbiente.chkOrcamentoEmitirClick(
  Sender: TObject);
begin
  chkCupomEmitir.Checked := not chkOrcamentoEmitir.Checked;
  chkCupomEmitir.Enabled := not chkOrcamentoEmitir.Checked;
  chkCupomEmitirClick( chkCupomEmitir );
end;

initialization
  FormFunction.RegisterForm('frmGrConfigurarAmbiente', TfrmGrConfigurarAmbiente);

end.
