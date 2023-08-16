unit SGE.Model.DAO.Factory;

interface

uses
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.AutorizacaoCompra,
  SGE.Model.DAO.Bairro,
  SGE.Model.DAO.Banco,
  SGE.Model.DAO.Busca,
  SGE.Model.DAO.Caixa,
  SGE.Model.DAO.CentroCusto,
  SGE.Model.DAO.CFOP,
  SGE.Model.DAO.Cheque,
  SGE.Model.DAO.Cidade,
  SGE.Model.DAO.Cliente,
  SGE.Model.DAO.CondicaoPagto,
  SGE.Model.DAO.ContaAPagar,
  SGE.Model.DAO.ContaAReceber,
  SGE.Model.DAO.ContaCorrente,
  SGE.Model.DAO.Contrato,
  SGE.Model.DAO.Config,
  SGE.Model.DAO.CST,
  SGE.Model.DAO.Distrito,
  SGE.Model.DAO.Empresa,
  SGE.Model.DAO.Entrada,
  SGE.Model.DAO.Estado,
  SGE.Model.DAO.FormaPagto,
  SGE.Model.DAO.Fornecedor,
  SGE.Model.DAO.IBPT,
  SGE.Model.DAO.Logradouro,
  SGE.Model.DAO.LogTransacao,
  SGE.Model.DAO.Perfil,
  SGE.Model.DAO.PlanoConta,
  SGE.Model.DAO.Produto,
  SGI.Model.DAO.ProdutoAlmoxarifado,
  SGE.Model.DAO.Promocao,
  SGI.Model.DAO.RequisicaoAlmoxarifado,
  SGE.Model.DAO.RequisicaoCompra,
  SGE.Model.DAO.Tabelas,
  SGE.Model.DAO.TipoDespesa,
  SGE.Model.DAO.TipoLogradouro,
  SGE.Model.DAO.TipoReceita,
  SGE.Model.DAO.UF,
  SGE.Model.DAO.Usuario,
  SGE.Model.DAO.Vendedor,
  SGE.Model.DAO.XML_NFeEnviada,
  SGE.Model.DAO.XML_NFeImportada;

type
  TModelDAOFactory = class(TInterfacedObject, IModelDAOFactory)
    private
      FAliquotaCOFINSView,
      FAliquotaICMS      ,
      FAliquotaPISView   ,
      FAutorizacaoCompra ,
      FAutorizacaoCompraProdutoServico,
      FBairro,
      FBanco ,
      FBancoFebrabanView ,
      FBusca ,
      FCaixa ,
      FCentroCusto       ,
      FCentroCustoEmpresa,
      FCFOP          ,
      FCheque        ,
      FCidade        ,
      FClasseDespesa ,
      FClasseReceita ,
      FCliente       ,
      FClienteEstoque,
      FClienteTitulos     ,
      FClienteTotalCompras,
      FCombustivelVeiculo ,
      FCompetencia        ,
      FCondicaoPagto      ,
      FCondicaoPagtoForma ,
      FCondicaoPagtoView  ,
      FConfigSystem       ,
      FConfiguracaoEmpresa,
      FContaAPagar      ,
      FContaAReceber    ,
      FContaCorrente    ,
      FContaCorrenteView,
      FContrato    ,
      FContratoItem,
      FCorVeiculo ,
      FCST        ,
      FDistrito   ,
      FEmpresa    ,
      FEmpresaView,
      FEntrada    ,
      FEntradaDevolucao  ,
      FEntradaLoteProduto,
      FEntradaProduto    ,
      FEstado            ,
      FFabricanteProduto ,
      FFormaDevolucao,
      FFormaPagto    ,
      FFormaPagtoContaCorrente,
      FFormaPagtoNFCEView     ,
      FFornecedor     ,
      FFornecedorProduto,
      FGrupoFornecedor,
      FGrupoProduto   ,
      FIBPT           ,
      FItensAutorizadosParaEntrada,
      FLayoutRemessaBancoView,
      FLogradouro     ,
      FLogTransacao   ,
      FLoteProduto    ,
      FModeloCupomFiscalView,
      FNFeEnviada  ,
      FNFeImportada,
      FNivelIBPT   ,
      FOrigemProdutoView,
      FPagamento   ,
      FPerfil      ,
      FPlanoConta       ,
      FPlanoContaNivel  ,
      FPlanoContaTipo   ,
      FProduto          ,
      FProdutoAlmoxarifado,
      FProdutoAlmoxarifadoReservado,
      FPromocao         ,
      FPromocaoProduto  ,
      FSecaoProduto     ,
      FSegmento         ,
      FRecebimento      ,
      FRequisicaoAlmoxarifado       ,
      FRequisicaoAlmoxarifadoProduto,
      FRequisicaoAlmoxarifadoProdutoReserva,
      FRequisicaoCompra ,
      FRequisicaoCompraProdutoServico,
      FTabelaIBPT         ,
      FTipoAliquotaView   ,
      FTipoAutorizacaoView,
      FTipoChequeView  ,
      FTipoCNPJView    ,
      FTipoComissaoView,
      FTipoContratoView,
      FTipoDescontoView,
      FTipoDespesa     ,
      FTipoDespesaPlanoConta   ,
      FTipoDocumentoEntradaView,
      FTipoEntradaView,
      FTipoLogradouro ,
      FTipoProduto    ,
      FTipoReceita    ,
      FTipoReceitaPlanoConta,
      FTipoRegimeView,
      FTipoRequisicaoAlmoxView,
      FTipoRequisicaoView,
      FTipoTributacao ,
      FTipoVeiculo    ,
      FTransportadora ,
      FUF ,
      FUsuario ,
      FUnidadeProduto ,
      FVendedor       ,
      FXML_NFeEnviada ,
      FXML_NFeImportada : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOFactory;

      function AliquotaCOFINSView : IModelDAOCustom;
      function AliquotaICMS : IModelDAOCustom;
      function AliquotaPISView : IModelDAOCustom;
      function AutorizacaoCompra : IModelDAOCustom;
      function AutorizacaoCompraProdutoServico : IModelDAOCustom;
      function Bairro : IModelDAOCustom;
      function Banco : IModelDAOCustom;
      function BancoFebrabanView : IModelDAOCustom;
      function Busca : IModelDAOCustom;
      function Caixa : IModelDAOCustom;
      function CentroCusto : IModelDAOCustom;
      function CentroCustoEmpresa : IModelDAOCustom;
      function CFOP : IModelDAOCustom;
      function Cheque : IModelDAOCustom;
      function Cidade   : IModelDAOCustom;
      function ClasseDespesa : IModelDAOCustom;
      function ClasseReceita : IModelDAOCustom;
      function Cliente : IModelDAOCustom;
      function ClienteEstoque : IModelDAOCustom;
      function ClienteTitulos : IModelDAOCustom;
      function ClienteTotalCompras : IModelDAOCustom;
      function CombustivelVeiculo : IModelDAOCustom;
      function Competencia : IModelDAOCustom;
      function CondicaoPagto : IModelDAOCustom;
      function CondicaoPagtoForma : IModelDAOCustom;
      function CondicaoPagtoView : IModelDAOCustom;
      function ConfigSystem : IModelDAOCustom;
      function ConfiguracaoEmpresa : IModelDAOCustom;
      function ContaAPagar : IModelDAOCustom;
      function ContaAReceber : IModelDAOCustom;
      function ContaCorrente : IModelDAOCustom;
      function ContaCorrenteView : IModelDAOCustom;
      function Contrato : IModelDAOCustom;
      function ContratoItem : IModelDAOCustom;
      function CorVeiculo : IModelDAOCustom;
      function CST : IModelDAOCustom;
      function Distrito : IModelDAOCustom;
      function Empresa : IModelDAOCustom;
      function EmpresaView : IModelDAOCustom;
      function Entrada : IModelDAOCustom;
      function EntradaDevolucao : IModelDAOCustom;
      function EntradaLoteProduto : IModelDAOCustom;
      function EntradaProduto : IModelDAOCustom;
      function Estado : IModelDAOCustom;
      function FabricanteProduto : IModelDAOCustom;
      function FormaDevolucao : IModelDAOCustom;
      function FormaPagto : IModelDAOCustom;
      function FormaPagtoContaCorrente : IModelDAOCustom;
      function FormaPagtoNFCEView : IModelDAOCustom;
      function Fornecedor : IModelDAOCustom;
      function FornecedorProduto : IModelDAOCustom;
      function GrupoFornecedor : IModelDAOCustom;
      function GrupoProduto : IModelDAOCustom;
      function IBPT : IModelDAOCustom;
      function ItensAutorizadosParaEntrada : IModelDAOCustom;
      function LayoutRemessaBancoView : IModelDAOCustom;
      function Logradouro : IModelDAOCustom;
      function LogTransacao : IModelDAOCustom;
      function LoteProduto : IModelDAOCustom;
      function ModeloCupomFiscalView : IModelDAOCustom;
      function NFeEnviada : IModelDAOCustom;
      function NFeImportada : IModelDAOCustom;
      function NivelIBPT : IModelDAOCustom;
      function OrigemProdutoView : IModelDAOCustom;
      function Pagamento : IModelDAOCustom;
      function Perfil : IModelDAOCustom;
      function PlanoConta : IModelDAOCustom;
      function PlanoContaNivel : IModelDAOCustom;
      function PlanoContaTipo : IModelDAOCustom;
      function Produto : IModelDAOCustom;
      function ProdutoAlmoxarifado : IModelDAOCustom;
      function ProdutoAlmoxarifadoReservado : IModelDAOCustom;
      function Promocao : IModelDAOCustom;
      function PromocaoProduto : IModelDAOCustom;
      function SecaoProduto : IModelDAOCustom;
      function Segmento : IModelDAOCustom;
      function Recebimento : IModelDAOCustom;
      function RequisicaoAlmoxarifado : IModelDAOCustom;
      function RequisicaoAlmoxarifadoProduto : IModelDAOCustom;
      function RequisicaoAlmoxarifadoProdutoReserva : IModelDAOCustom;
      function RequisicaoCompra : IModelDAOCustom;
      function RequisicaoCompraProdutoServico : IModelDAOCustom;
      function TabelaIBPT : IModelDAOCustom;
      function TipoAliquotaView : IModelDAOCustom;
      function TipoAutorizacaoView : IModelDAOCustom;
      function TipoChequeView : IModelDAOCustom;
      function TipoCNPJView : IModelDAOCustom;
      function TipoComissaoView : IModelDAOCustom;
      function TipoContratoView : IModelDAOCustom;
      function TipoDescontoView : IModelDAOCustom;
      function TipoDespesa : IModelDAOCustom;
      function TipoDespesaPlanoConta : IModelDAOCustom;
      function TipoDocumentoEntradaView : IModelDAOCustom;
      function TipoEntradaView : IModelDAOCustom;
      function TipoLogradouro : IModelDAOCustom;
      function TipoProduto : IModelDAOCustom;
      function TipoReceita : IModelDAOCustom;
      function TipoReceitaPlanoConta : IModelDAOCustom;
      function TipoRegimeView : IModelDAOCustom;
      function TipoRequisicaoAlmoxView : IModelDAOCustom;
      function TipoRequisicaoView : IModelDAOCustom;
      function TipoTributacao : IModelDAOCustom;
      function TipoVeiculo : IModelDAOCustom;
      function Transportadora : IModelDAOCustom;
      function UF      : IModelDAOCustom;
      function Usuario : IModelDAOCustom;
      function UnidadeProduto : IModelDAOCustom;
      function Vendedor : IModelDAOCustom;
      function XML_NFeEnviada : IModelDAOCustom;
      function XML_NFeImportada : IModelDAOCustom;
  end;

implementation

{ TModelDAOFactory }

constructor TModelDAOFactory.Create;
begin
  ;
end;

destructor TModelDAOFactory.Destroy;
begin
  inherited;
end;

class function TModelDAOFactory.New: IModelDAOFactory;
begin
  Result := Self.Create;
end;

function TModelDAOFactory.NFeEnviada: IModelDAOCustom;
begin
  if not Assigned(FNFeEnviada) then
    FNFeEnviada := TModelDAONFeEnviada.New;

  Result := FNFeEnviada;
end;

function TModelDAOFactory.NFeImportada: IModelDAOCustom;
begin
  if not Assigned(FNFeImportada) then
    FNFeImportada := TModelDAONFeImportada.New;

  Result := FNFeImportada;
end;

function TModelDAOFactory.NivelIBPT: IModelDAOCustom;
begin
  if not Assigned(FNivelIBPT) then
    FNivelIBPT := TModelDAONivelIBPT.New;

  Result := FNivelIBPT;
end;

function TModelDAOFactory.OrigemProdutoView: IModelDAOCustom;
begin
  if not Assigned(FOrigemProdutoView) then
    FOrigemProdutoView := TModelDAOOrigemProdutoView.New;

  Result := FOrigemProdutoView;
end;

function TModelDAOFactory.Pagamento: IModelDAOCustom;
begin
  if not Assigned(FPagamento) then
    FPagamento := TModelDAOPagamento.New;

  Result := FPagamento;
end;

function TModelDAOFactory.Perfil: IModelDAOCustom;
begin
  if not Assigned(FPerfil) then
    FPerfil := TModelDAOPerfil.New;

  Result := FPerfil;
end;

function TModelDAOFactory.PlanoConta: IModelDAOCustom;
begin
  if not Assigned(FPlanoConta) then
    FPlanoConta := TModelDAOPlanoConta.New;

  Result := FPlanoConta;
end;

function TModelDAOFactory.PlanoContaNivel: IModelDAOCustom;
begin
  if not Assigned(FPlanoContaNivel) then
    FPlanoContaNivel := TModelDAOPlanoContaNivel.New;

  Result := FPlanoContaNivel;
end;

function TModelDAOFactory.PlanoContaTipo: IModelDAOCustom;
begin
  if not Assigned(FPlanoContaTipo) then
    FPlanoContaTipo := TModelDAOPlanoContaTipo.New;

  Result := FPlanoContaTipo;
end;

function TModelDAOFactory.Produto: IModelDAOCustom;
begin
  if not Assigned(FProduto) then
    FProduto := TModelDAOProduto.New;

  Result := FProduto;
end;

function TModelDAOFactory.ProdutoAlmoxarifado: IModelDAOCustom;
begin
  if not Assigned(FProdutoAlmoxarifado) then
    FProdutoAlmoxarifado := TModelDAOProdutoAlmoxarifado.New;

  Result := FProdutoAlmoxarifado;
end;

function TModelDAOFactory.ProdutoAlmoxarifadoReservado: IModelDAOCustom;
begin
  if not Assigned(FProdutoAlmoxarifadoReservado) then
    FProdutoAlmoxarifadoReservado := TModelDAORequisicaoAlmoxarifadoProdutoReserva.New;

  Result := FProdutoAlmoxarifadoReservado;
end;

function TModelDAOFactory.Promocao: IModelDAOCustom;
begin
  if not Assigned(FPromocao) then
    FPromocao := TModelDAOPromocao.New;

  Result := FPromocao;
end;

function TModelDAOFactory.PromocaoProduto: IModelDAOCustom;
begin
  if not Assigned(FPromocaoProduto) then
    FPromocaoProduto := TModelDAOPromocaoProduto.New;

  Result := FPromocaoProduto;
end;

function TModelDAOFactory.Recebimento: IModelDAOCustom;
begin
  if not Assigned(FRecebimento) then
    FRecebimento := TModelDAORecebimento.New;

  Result := FRecebimento;
end;

function TModelDAOFactory.RequisicaoAlmoxarifado: IModelDAOCustom;
begin
  if not Assigned(FRequisicaoAlmoxarifado) then
    FRequisicaoAlmoxarifado := TModelDAORequisicaoAlmoxarifado.New;

  Result := FRequisicaoAlmoxarifado;
end;

function TModelDAOFactory.RequisicaoAlmoxarifadoProduto: IModelDAOCustom;
begin
  if not Assigned(FRequisicaoAlmoxarifadoProduto) then
    FRequisicaoAlmoxarifadoProduto := TModelDAORequisicaoAlmoxarifadoProduto.New;

  Result := FRequisicaoAlmoxarifadoProduto;
end;

function TModelDAOFactory.RequisicaoAlmoxarifadoProdutoReserva: IModelDAOCustom;
begin
  if not Assigned(FRequisicaoAlmoxarifadoProdutoReserva) then
    FRequisicaoAlmoxarifadoProdutoReserva := TModelDAORequisicaoAlmoxarifadoProdutoReserva.New;

  Result := FRequisicaoAlmoxarifadoProdutoReserva;
end;

function TModelDAOFactory.RequisicaoCompra: IModelDAOCustom;
begin
  if not Assigned(FRequisicaoCompra) then
    FRequisicaoCompra := TModelDAORequisicaoCompra.New;

  Result := FRequisicaoCompra;
end;

function TModelDAOFactory.RequisicaoCompraProdutoServico: IModelDAOCustom;
begin
  if not Assigned(FRequisicaoCompraProdutoServico) then
    FRequisicaoCompraProdutoServico := TModelDAORequisicaoCompraProdutoServico.New;

  Result := FRequisicaoCompraProdutoServico;
end;

function TModelDAOFactory.SecaoProduto: IModelDAOCustom;
begin
  if not Assigned(FSecaoProduto) then
    FSecaoProduto := TModelDAOSecaoProduto.New;

  Result := FSecaoProduto;
end;

function TModelDAOFactory.Segmento: IModelDAOCustom;
begin
  if not Assigned(FSegmento) then
    FSegmento := TModelDAOSegmento.New;

  Result := FSegmento;
end;

function TModelDAOFactory.CST: IModelDAOCustom;
begin
  if not Assigned(FCST) then
    FCST := TModelDAOCST.New;

  Result := FCST;
end;

function TModelDAOFactory.TabelaIBPT: IModelDAOCustom;
begin
  if not Assigned(FTabelaIBPT) then
    FTabelaIBPT := TModelDAOTabelaIBPT.New;

  Result := FTabelaIBPT;
end;

function TModelDAOFactory.TipoAliquotaView: IModelDAOCustom;
begin
  if not Assigned(FTipoAliquotaView) then
    FTipoAliquotaView := TModelDAOTipoAliquotaView.New;

  Result := FTipoAliquotaView;
end;

function TModelDAOFactory.TipoAutorizacaoView: IModelDAOCustom;
begin
  if not Assigned(FTipoAutorizacaoView) then
    FTipoAutorizacaoView := TModelDAOTipoAutorizacaoView.New;

  Result := FTipoAutorizacaoView;
end;

function TModelDAOFactory.TipoChequeView: IModelDAOCustom;
begin
  if not Assigned(FTipoChequeView) then
    FTipoChequeView := TModelDAOTipoChequeView.New;

  Result := FTipoChequeView;
end;

function TModelDAOFactory.TipoCNPJView: IModelDAOCustom;
begin
  if not Assigned(FTipoCNPJView) then
    FTipoCNPJView := TModelDAOTipoCNPJView.New;

  Result := FTipoCNPJView;
end;

function TModelDAOFactory.TipoComissaoView: IModelDAOCustom;
begin
  if not Assigned(FTipoComissaoView) then
    FTipoComissaoView := TModelDAOTipoComissaoView.New;

  Result := FTipoComissaoView;
end;

function TModelDAOFactory.TipoContratoView: IModelDAOCustom;
begin
  if not Assigned(FTipoContratoView) then
    FTipoContratoView := TModelDAOTipoContratoView.New;

  Result := FTipoContratoView;
end;

function TModelDAOFactory.TipoDescontoView: IModelDAOCustom;
begin
  if not Assigned(FTipoDescontoView) then
    FTipoDescontoView := TModelDAOTipoDescontoView.New;

  Result := FTipoDescontoView;
end;

function TModelDAOFactory.TipoDespesa: IModelDAOCustom;
begin
  if not Assigned(FTipoDespesa) then
    FTipoDespesa := TModelDAOTipoDespesa.New;

  Result := FTipoDespesa;
end;

function TModelDAOFactory.TipoDespesaPlanoConta: IModelDAOCustom;
begin
  if not Assigned(FTipoDespesaPlanoConta) then
    FTipoDespesaPlanoConta := TModelDAOTipoDespesaPlanoConta.New;

  Result := FTipoDespesaPlanoConta;
end;

function TModelDAOFactory.TipoDocumentoEntradaView: IModelDAOCustom;
begin
  if not Assigned(FTipoDocumentoEntradaView) then
    FTipoDocumentoEntradaView := TModelDAOTipoDocumentoEntradaView.New;

  Result := FTipoDocumentoEntradaView;
end;

function TModelDAOFactory.TipoEntradaView: IModelDAOCustom;
begin
  if not Assigned(FTipoEntradaView) then
    FTipoEntradaView := TModelDAOTipoEntradaView.New;

  Result := FTipoEntradaView;
end;

function TModelDAOFactory.TipoLogradouro: IModelDAOCustom;
begin
  if not Assigned(FTipoLogradouro) then
    FTipoLogradouro := TModelDAOTipoLogradouro.New;

  Result := FTipoLogradouro;
end;

function TModelDAOFactory.TipoProduto: IModelDAOCustom;
begin
  if not Assigned(FTipoProduto) then
    FTipoProduto := TModelDAOTipoProduto.New;

  Result := FTipoProduto;
end;

function TModelDAOFactory.TipoReceita: IModelDAOCustom;
begin
  if not Assigned(FTipoReceita) then
    FTipoReceita := TModelDAOTipoReceita.New;

  Result := FTipoReceita;
end;

function TModelDAOFactory.TipoReceitaPlanoConta: IModelDAOCustom;
begin
  if not Assigned(FTipoReceitaPlanoConta) then
    FTipoReceitaPlanoConta := TModelDAOTipoReceitaPlanoConta.New;

  Result := FTipoReceitaPlanoConta;
end;

function TModelDAOFactory.TipoRegimeView: IModelDAOCustom;
begin
  if not Assigned(FTipoRegimeView) then
    FTipoRegimeView := TModelDAOTipoRegimeView.New;

  Result := FTipoRegimeView;
end;

function TModelDAOFactory.TipoRequisicaoAlmoxView: IModelDAOCustom;
begin
  if not Assigned(FTipoRequisicaoAlmoxView) then
    FTipoRequisicaoAlmoxView := TModelDAOTipoRequisicaoAlmoxView.New;

  Result := FTipoRequisicaoAlmoxView;
end;

function TModelDAOFactory.TipoRequisicaoView: IModelDAOCustom;
begin
  if not Assigned(FTipoRequisicaoView) then
    FTipoRequisicaoView := TModelDAOTipoRequisicaoView.New;

  Result := FTipoRequisicaoView;
end;

function TModelDAOFactory.TipoTributacao: IModelDAOCustom;
begin
  if not Assigned(FTipoTributacao) then
    FTipoTributacao := TModelDAOTipoTributacao.New;

  Result := FTipoTributacao;
end;

function TModelDAOFactory.TipoVeiculo: IModelDAOCustom;
begin
  if not Assigned(FTipoVeiculo) then
    FTipoVeiculo := TModelDAOTipoVeiculo.New;

  Result := FTipoVeiculo;
end;

function TModelDAOFactory.Transportadora: IModelDAOCustom;
begin
  if not Assigned(FTransportadora) then
    FTransportadora := TModelDAOTransportadora.New;

  Result := FTransportadora;
end;

function TModelDAOFactory.AliquotaCOFINSView: IModelDAOCustom;
begin
  if not Assigned(FAliquotaCOFINSView) then
    FAliquotaCOFINSView := TModelDAOAliquotaCOFINSView.New;

  Result := FAliquotaCOFINSView;
end;

function TModelDAOFactory.AliquotaICMS: IModelDAOCustom;
begin
  if not Assigned(FAliquotaICMS) then
    FAliquotaICMS := TModelDAOAliquotaICMS.New;

  Result := FAliquotaICMS;
end;

function TModelDAOFactory.AliquotaPISView: IModelDAOCustom;
begin
  if not Assigned(FAliquotaPISView) then
    FAliquotaPISView := TModelDAOAliquotaPISView.New;

  Result := FAliquotaPISView;
end;

function TModelDAOFactory.AutorizacaoCompra: IModelDAOCustom;
begin
  if not Assigned(FAutorizacaoCompra) then
    FAutorizacaoCompra := TModelDAOAutorizacaoCompra.New;

  Result := FAutorizacaoCompra;
end;

function TModelDAOFactory.AutorizacaoCompraProdutoServico: IModelDAOCustom;
begin
  if not Assigned(FAutorizacaoCompraProdutoServico) then
    FAutorizacaoCompraProdutoServico := TModelDAOAutorizacaoCompraProdutoServico.New;

  Result := FAutorizacaoCompraProdutoServico;
end;

function TModelDAOFactory.Bairro: IModelDAOCustom;
begin
  if not Assigned(FBairro) then
    FBairro := TModelDAOBairro.New;

  Result := FBairro;
end;

function TModelDAOFactory.Banco: IModelDAOCustom;
begin
  if not Assigned(FBanco) then
    FBanco := TModelDAOBanco.New;

  Result := FBanco;
end;

function TModelDAOFactory.BancoFebrabanView: IModelDAOCustom;
begin
  if not Assigned(FBancoFebrabanView) then
    FBancoFebrabanView := TModelDAOBancoFebrabanView.New;

  Result := FBancoFebrabanView;
end;

function TModelDAOFactory.Busca: IModelDAOCustom;
begin
  if not Assigned(FBusca) then
    FBusca := TModelDAOBusca.New;

  Result := FBusca;
end;

function TModelDAOFactory.Caixa: IModelDAOCustom;
begin
  if not Assigned(FCaixa) then
    FCaixa := TModelDAOCaixa.New;

  Result := FCaixa;
end;

function TModelDAOFactory.CentroCusto: IModelDAOCustom;
begin
  if not Assigned(FCentroCusto) then
    FCentroCusto := TModelDAOCentroCusto.New;

  Result := FCentroCusto;
end;

function TModelDAOFactory.CentroCustoEmpresa: IModelDAOCustom;
begin
  if not Assigned(FCentroCustoEmpresa) then
    FCentroCustoEmpresa := TModelDAOCentroCustoEmpresa.New;

  Result := FCentroCustoEmpresa;
end;

function TModelDAOFactory.CFOP: IModelDAOCustom;
begin
  if not Assigned(FCFOP) then
    FCFOP := TModelDAOCFOP.New;

  Result := FCFOP;
end;

function TModelDAOFactory.Cheque: IModelDAOCustom;
begin
  if not Assigned(FCheque) then
    FCheque := TModelDAOCheque.New;

  Result := FCheque;
end;

function TModelDAOFactory.Cidade: IModelDAOCustom;
begin
  if not Assigned(FCidade) then
    FCidade := TModelDAOCidade.New;

  Result := FCidade;
end;

function TModelDAOFactory.ClasseDespesa: IModelDAOCustom;
begin
  if not Assigned(FClasseDespesa) then
    FClasseDespesa := TModelDAOClasseDespesa.New;

  Result := FClasseDespesa;
end;

function TModelDAOFactory.ClasseReceita: IModelDAOCustom;
begin
  if not Assigned(FClasseReceita) then
    FClasseReceita := TModelDAOClasseReceita.New;

  Result := FClasseReceita;
end;

function TModelDAOFactory.Cliente: IModelDAOCustom;
begin
  if not Assigned(FCliente) then
    FCliente := TModelDAOCliente.New;

  Result := FCliente;
end;

function TModelDAOFactory.ClienteEstoque: IModelDAOCustom;
begin
  if not Assigned(FClienteEstoque) then
    FClienteEstoque := TModelDAOClienteEstoque.New;

  Result := FClienteEstoque;
end;

function TModelDAOFactory.ClienteTitulos: IModelDAOCustom;
begin
  if not Assigned(FClienteTitulos) then
    FClienteTitulos := TModelDAOClienteTitulos.New;

  Result := FClienteTitulos;
end;

function TModelDAOFactory.ClienteTotalCompras: IModelDAOCustom;
begin
  if not Assigned(FClienteTotalCompras) then
    FClienteTotalCompras := TModelDAOClienteTotalCompras.New;

  Result := FClienteTotalCompras;
end;

function TModelDAOFactory.CombustivelVeiculo: IModelDAOCustom;
begin
  if not Assigned(FCombustivelVeiculo) then
    FCombustivelVeiculo := TModelDAOCombustivelVeiculo.New;

  Result := FCombustivelVeiculo;
end;

function TModelDAOFactory.Competencia: IModelDAOCustom;
begin
  if not Assigned(FCompetencia) then
    FCompetencia := TModelDAOCompetencia.New;

  Result := FCompetencia;
end;

function TModelDAOFactory.CondicaoPagto: IModelDAOCustom;
begin
  if not Assigned(FCondicaoPagto) then
    FCondicaoPagto := TModelDAOCondicaoPagto.New;

  Result := FCondicaoPagto;
end;

function TModelDAOFactory.CondicaoPagtoForma: IModelDAOCustom;
begin
  if not Assigned(FCondicaoPagtoForma) then
    FCondicaoPagtoForma := TModelDAOCondicaoPagtoForma.New;

  Result := FCondicaoPagtoForma;
end;

function TModelDAOFactory.CondicaoPagtoView: IModelDAOCustom;
begin
  if not Assigned(FCondicaoPagtoView) then
    FCondicaoPagtoView := TModelDAOCondicaoPagtoView.New;

  Result := FCondicaoPagtoView;
end;

function TModelDAOFactory.ConfigSystem: IModelDAOCustom;
begin
  if not Assigned(FConfigSystem) then
    FConfigSystem := TModelDAOConfigSystem.New;

  Result := FConfigSystem;
end;

function TModelDAOFactory.ConfiguracaoEmpresa: IModelDAOCustom;
begin
  if not Assigned(FConfiguracaoEmpresa) then
    FConfiguracaoEmpresa := TModelDAOConfiguracaoEmpresa.New;

  Result := FConfiguracaoEmpresa;
end;

function TModelDAOFactory.ContaAPagar: IModelDAOCustom;
begin
  if not Assigned(FContaAPagar) then
    FContaAPagar := TModelDAOContaAPagar.New;

  Result := FContaAPagar;
end;

function TModelDAOFactory.ContaAReceber: IModelDAOCustom;
begin
  if not Assigned(FContaAReceber) then
    FContaAReceber := TModelDAOContaAReceber.New;

  Result := FContaAReceber;
end;

function TModelDAOFactory.ContaCorrente: IModelDAOCustom;
begin
  if not Assigned(FContaCorrente) then
    FContaCorrente := TModelDAOContaCorrente.New;

  Result := FContaCorrente;
end;

function TModelDAOFactory.ContaCorrenteView: IModelDAOCustom;
begin
  if not Assigned(FContaCorrenteView) then
    FContaCorrenteView := TModelDAOContaCorrenteView.New;

  Result := FContaCorrenteView;
end;

function TModelDAOFactory.Contrato: IModelDAOCustom;
begin
  if not Assigned(FContrato) then
    FContrato := TModelDAOContrato.New;

  Result := FContrato;
end;

function TModelDAOFactory.ContratoItem: IModelDAOCustom;
begin
  if not Assigned(FContratoItem) then
    FContratoItem := TModelDAOContratoItem.New;

  Result := FContratoItem;
end;

function TModelDAOFactory.CorVeiculo: IModelDAOCustom;
begin
  if not Assigned(FCorVeiculo) then
    FCorVeiculo := TModelDAOCorVeiculo.New;

  Result := FCorVeiculo;
end;

function TModelDAOFactory.Distrito: IModelDAOCustom;
begin
  if not Assigned(FDistrito) then
    FDistrito := TModelDAODistrito.New;

  Result := FDistrito;
end;

function TModelDAOFactory.Empresa: IModelDAOCustom;
begin
  if not Assigned(FEmpresa) then
    FEmpresa := TModelDAOEmpresa.New;

  Result := FEmpresa;
end;

function TModelDAOFactory.EmpresaView: IModelDAOCustom;
begin
  if not Assigned(FEmpresaView) then
    FEmpresaView := TModelDAOEmpresaView.New;

  Result := FEmpresaView;
end;

function TModelDAOFactory.Entrada: IModelDAOCustom;
begin
  if not Assigned(FEntrada) then
    FEntrada := TModelDAOEntrada.New;

  Result := FEntrada;
end;

function TModelDAOFactory.EntradaDevolucao: IModelDAOCustom;
begin
  if not Assigned(FEntradaDevolucao) then
    FEntradaDevolucao := TModelDAOEntradaDevolucao.New;

  Result := FEntradaDevolucao;
end;

function TModelDAOFactory.EntradaLoteProduto: IModelDAOCustom;
begin
  if not Assigned(FEntradaLoteProduto) then
    FEntradaLoteProduto := TModelDAOEntradaProdutoLote.New;

  Result := FEntradaLoteProduto;
end;

function TModelDAOFactory.EntradaProduto: IModelDAOCustom;
begin
  if not Assigned(FEntradaProduto) then
    FEntradaProduto := TModelDAOEntradaProduto.New;

  Result := FEntradaProduto;
end;

function TModelDAOFactory.Estado: IModelDAOCustom;
begin
  if not Assigned(FEstado) then
    FEstado := TModelDAOEstado.New;

  Result := FEstado;
end;

function TModelDAOFactory.FabricanteProduto: IModelDAOCustom;
begin
  if not Assigned(FFabricanteProduto) then
    FFabricanteProduto := TModelDAOFabricanteProduto.New;

  Result := FFabricanteProduto;
end;

function TModelDAOFactory.FormaDevolucao: IModelDAOCustom;
begin
  if not Assigned(FFormaDevolucao) then
    FFormaDevolucao := TModelDAOFormaDevolucao.New;

  Result := FFormaDevolucao;
end;

function TModelDAOFactory.FormaPagto: IModelDAOCustom;
begin
  if not Assigned(FFormaPagto) then
    FFormaPagto := TModelDAOFormaPagto.New;

  Result := FFormaPagto;
end;

function TModelDAOFactory.FormaPagtoContaCorrente: IModelDAOCustom;
begin
  if not Assigned(FFormaPagtoContaCorrente) then
    FFormaPagtoContaCorrente := TModelDAOFormaPagtoContaCorrente.New;

  Result := FFormaPagtoContaCorrente;
end;

function TModelDAOFactory.FormaPagtoNFCEView: IModelDAOCustom;
begin
  if not Assigned(FFormaPagtoNFCEView) then
    FFormaPagtoNFCEView := TModelDAOFormaPagtoNFCEView.New;

  Result := FFormaPagtoNFCEView;
end;

function TModelDAOFactory.Fornecedor: IModelDAOCustom;
begin
  if not Assigned(FFornecedor) then
    FFornecedor := TModelDAOFornecedor.New;

  Result := FFornecedor;
end;

function TModelDAOFactory.FornecedorProduto: IModelDAOCustom;
begin
  if not Assigned(FFornecedorProduto) then
    FFornecedorProduto := TModelDAOFornecedorProduto.New;

  Result := FFornecedorProduto;
end;

function TModelDAOFactory.GrupoFornecedor: IModelDAOCustom;
begin
  if not Assigned(FGrupoFornecedor) then
    FGrupoFornecedor := TModelDAOGrupoFornecedor.New;

  Result := FGrupoFornecedor;
end;

function TModelDAOFactory.GrupoProduto: IModelDAOCustom;
begin
  if not Assigned(FGrupoProduto) then
    FGrupoProduto := TModelDAOGrupoProduto.New;

  Result := FGrupoProduto;
end;

function TModelDAOFactory.IBPT: IModelDAOCustom;
begin
  if not Assigned(FIBPT) then
    FIBPT := TModelDAOIBPT.New;

  Result := FIBPT;
end;

function TModelDAOFactory.ItensAutorizadosParaEntrada: IModelDAOCustom;
begin
  if not Assigned(FItensAutorizadosParaEntrada) then
    FItensAutorizadosParaEntrada := TModelDAOItensAutorizadosParaEntrada.New;

  Result := FItensAutorizadosParaEntrada;
end;

function TModelDAOFactory.LayoutRemessaBancoView: IModelDAOCustom;
begin
  if not Assigned(FLayoutRemessaBancoView) then
    FLayoutRemessaBancoView := TModelDAOLayoutRemessaBancoView.New;

  Result := FLayoutRemessaBancoView;
end;

function TModelDAOFactory.Logradouro: IModelDAOCustom;
begin
  if not Assigned(FLogradouro) then
    FLogradouro := TModelDAOLogradouro.New;

  Result := FLogradouro;
end;

function TModelDAOFactory.LogTransacao: IModelDAOCustom;
begin
  if not Assigned(FLogTransacao) then
    FLogTransacao := TModelDAOLogTransacao.New;

  Result := FLogTransacao;
end;

function TModelDAOFactory.LoteProduto: IModelDAOCustom;
begin
  if not Assigned(FLoteProduto) then
    FLoteProduto := TModelDAOLoteProduto.New;

  Result := FLoteProduto;
end;

function TModelDAOFactory.ModeloCupomFiscalView: IModelDAOCustom;
begin
  if not Assigned(FModeloCupomFiscalView) then
    FModeloCupomFiscalView := TModelDAOModeloCupomFiscal.New;

  Result := FModeloCupomFiscalView;
end;

function TModelDAOFactory.UF: IModelDAOCustom;
begin
  if not Assigned(FUF) then
    FUF := TModelDAOUF.New;

  Result := FUF;
end;

function TModelDAOFactory.UnidadeProduto: IModelDAOCustom;
begin
  if not Assigned(FUnidadeProduto) then
    FUnidadeProduto := TModelDAOUnidadeProduto.New;

  Result := FUnidadeProduto;
end;

function TModelDAOFactory.Usuario: IModelDAOCustom;
begin
  if not Assigned(FUsuario) then
    FUsuario := TModelDAOUsuario.New;

  Result := FUsuario;
end;

function TModelDAOFactory.Vendedor: IModelDAOCustom;
begin
  if not Assigned(FVendedor) then
    FVendedor := TModelDAOVendedor.New;

  Result := FVendedor;
end;

function TModelDAOFactory.XML_NFeEnviada: IModelDAOCustom;
begin
  if not Assigned(FXML_NFeEnviada) then
    FXML_NFeEnviada := TModelDAOXML_NFeEnviada.New;

  Result := FXML_NFeEnviada;
end;

function TModelDAOFactory.XML_NFeImportada: IModelDAOCustom;
begin
  if not Assigned(FXML_NFeImportada) then
    FXML_NFeImportada := TModelDAOXML_NFeImportada.New;

  Result := FXML_NFeImportada;
end;

end.
