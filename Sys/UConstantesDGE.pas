unit UConstantesDGE;

interface

const
  VERSION_NUMBER = '1.0.5.1';

  SISTEMA_GESTAO = 0;
  SISTEMA_PDV    = 1;

  ROTINA_LENGTH_ID     = 10;
  ROTINA_TIPO_MENU     = 0;
  ROTINA_TIPO_TELA     = 1;
  ROTINA_TIPO_FUNCAO   = 2;
  ROTINA_TIPO_PROCESSO = 3;

  // Constantes FR3

  CATEGORY_VAR = 'Local';
  VAR_TITLE    = 'Titulo';
  VAR_SUBTITLE = 'SubTitulo';
  VAR_PERIODO  = 'Periodo';
  VAR_TODOS    = 'Todos';
  VAR_APENASCONSOLIDADO = 'ApenasConsolidado';
  VAR_SYSTEM            = 'Sistema';
  VAR_USER              = 'Usuario';
  VAR_EMPRESA           = 'Entidade';
  VAR_DEPARTAMENTO      = 'Depto';
  VAR_FILTROS           = 'Filtros';

  // Identificacores de rotinas no sistema

  ROTINA_MENU_CADASTRO_ID     = '0010000000';
  ROTINA_MENU_ESTOQUE_ID      = '0020000000';
  ROTINA_MENU_MOVIMENTO_ID    = '0030000000';
  ROTINA_MENU_NOTAFISCAL_ID   = '0040000000';
  ROTINA_MENU_CONSULTA_ID     = '0050000000';
  ROTINA_MENU_FINANCEIRO_ID   = '0060000000';
  ROTINA_MENU_RELATORIO_ID    = '0070000000';
  ROTINA_MENU_TAB_AUXILIAR_ID    = '0080000000';
  ROTINA_MENU_REL_ESTOQUE_ID     = '0090000000';
  ROTINA_MENU_REL_FATURAMENTO_ID = '0100000000';
  ROTINA_MENU_REL_FINANCEIRO_ID  = '0110000000';

  // Menu Cadastro -> Tabelas Auxiliares

  ROTINA_CAD_ESTADO_ID     = '0080010000';
  ROTINA_CAD_CIDADE_ID     = '0080020000';
  ROTINA_CAD_DISTRITO_ID   = '0080030000';
  ROTINA_CAD_BAIRRO_ID     = '0080040000';
  ROTINA_CAD_TIPO_LOG_ID   = '0080050000';
  ROTINA_CAD_LOGRADOURO_ID = '0080060000';
  ROTINA_CAD_CFOP_ID       = '0080070000';

  // Relação de TAG'S FEET

  NFE_TAG_PROTNFE_ERROR = '</protNFe></protNFe>';
  NFE_TAG_PROTNFE_FEET  = '</protNFe>';

  NFE_TAMANHO_NUMERO_RECIBO = 15;
  NFE_TAMANHO_NUMERO_CHAVE  = 44;

  MODELO_NFE  = 55; // NF-e  (Nota Fiscal Eletrônica de Venda)
  MODELO_NFCE = 65; // NFC-e (Nota Fiscal Eletrônica de Venda ao Consumidor Final)

  { DONE -oIsaque -cEmpresa : 22/05/2014 - Inserção do segmento INDÚSTRIA para atender meu novo cliente }

  SEGMENTO_PADRAO_ID          = 0;
  SEGMENTO_VAREJO_ATACADO_ID  = 1;
  SEGMENTO_MERCADO_CARRO_ID   = 2;
  SEGMENTO_SERVICOS_ID        = 3;
  SEGMENTO_VAREJO_SERVICOS_ID = 4;
  SEGMENTO_INDUSTRIA_METAL_ID = 8;
  SEGMENTO_INDUSTRIA_GERAL_ID = 9;

  SEGMENTO_PADRAO_DS          = 'Padrão';
  SEGMENTO_VAREJO_ATACADO_DS  = 'Produtos a Varejo e Atacado';
  SEGMENTO_MERCADO_CARRO_DS   = 'Comércio de Veículos';
  SEGMENTO_SERVICOS_DS        = 'Serviços';
  SEGMENTO_VAREJO_SERVICOS_DS = 'Produtos a Varejo e Serviços';
  SEGMENTO_INDUSTRIA_METAL_DS = 'Indústria Metalúrgica';
  SEGMENTO_INDUSTRIA_GERAL_DS = 'Indústria';

  TIPO_LOG_TRANS_NOTIFIC = 0;
  TIPO_LOG_TRANS_SEFA    = 1;
  TIPO_LOG_TRANS_SISTEMA = 2;

  DESC_LOG_EVENTO_CANCELAR_NFE_SD = 'Cancelar NF-e de Saída';
  DESC_LOG_EVENTO_CANCELAR_NFE_ET = 'Cancelar NF-e de Entrada';
  DESC_LOG_INUTILIZA_NRO_NFE      = 'Inutilização de numerão para NF-e';
  DESC_LOG_CONSULTAR_NRO_LOTE_NFE = 'Consultar retorno do Lote/Recibo de NF-e';

  CONTA_CORRENTE_TIPO_CAIXA = 1;
  CONTA_CORRENTE_TIPO_BANCO = 2;

  BOLETO_ARQUIVO_LOGOTIPO = 'Imagens\Emitente.gif';
  BOLETO_IMAGENS          = 'Imagens\';
  BOLETO_LICENCAS         = 'Licencas\';

  LAYOUT_BOLETO_ENTREGA = 'Boleto\Boleto.fr3';
  LAYOUT_BOLETO_CARNE   = 'Boleto\BoletoCarne.fr3';

  FILE_WALLPAPER = 'PapelDeParede.jpg';

  CODIGO_BANCO_BRASIL    = 1;
  CODIGO_BANCO_BRADESCO  = 237;
  CODIGO_BANCO_CAIXA     = 104;
  CODIGO_BANCO_HSBC      = 399;
  CODIGO_BANCO_ITAU      = 341;
  CODIGO_BANCO_SANTANDER = 33;

  CONSUMIDOR_FINAL_CODIGO = 1;
  CONSUMIDOR_FINAL_CNPJ   = '99999999999999';
  CONSUMIDOR_FINAL_NOME   = 'CONSUMIDOR FINAL';

  EMPRESA_LICENCA_PADRAO  = 1;

  TRIBUTO_NCM_SH_PADRAO    = '00000000';
  TRIBUTO_ORIGEM_NACIONAL  = '0';
  TRIBUTO_TRIBUTADA_INTEG  = '00';
  TRIBUTO_NAO_TRIBUTADA_SN = '400';

  PORTA_SMTP_PADRAO = 587;

  STR_TAMANHO_NCMSH = 8;

  // Identificacores de rotinas no sistema

  MENU_CADASTRO        = '01';
  MENU_ESTOQUE         = '02';
  MENU_MOVIMENTACAO    = '03';
  MENU_NOTA_FISCAL     = '04';
  MENU_CONSULTA        = '05';
  MENU_FINANCEIRO_CAIX = '06';
  MENU_RELATORIO       = '07';
  MENU_TABELA_AUX      = '08';
  MENU_REL_ESTOQUE     = '09';
  MENU_REL_FATURAMENTO = '10';
  MENU_REL_FINANCEIRO  = '11';

  // Menu Cadastro

  CAD_EMPRESA    = '0100100';
  CAD_CLIENTE    = '0100200';
  CAD_FORNECEDOR = '0100300';
  CAD_VENDEDOR   = '0100400';
  CAD_BANCO      = '0100500';
  CAD_GRUPO_PROD = '0100600';
  CAD_SECAO_PROD = '0100700';
  CAD_FABRICANTE = '0100800';
  CAD_UNIDADE    = '0100900';
  CAD_PRODUTO    = '0101000';
  CAD_PROMOCAO   = '0101100';
  CONFIG_EMPRESA = '0101200';
  CONFIG_NFE     = '0101300';
  GERAR_SENHA    = '0101400';
  CAD_USUARIO    = '0101500';

  // Menu Cadastro -> Tabelas Auxiliares

  TAB_ESTADO     = '0800100';
  TAB_CIDADE     = '0800200';
  TAB_DISTRITO   = '0800300';
  TAB_BAIRRO     = '0800400';
  TAB_TIPO_LOG   = '0800500';
  TAB_LOGRADOURO = '0800600';
  TAB_CFOP       = '0800700';
  TAB_TRIBUTACAO = '0800800';
  TAB_CONTA_CORR = '0800900';
  TAB_FORMA_PGTO = '0801000';
  TAB_COND_PGTO  = '0801100';

  // Menu Estoque

  EST_ENTRADA      = '0200100';
  EST_AJUSTE_ESTOQ = '0200200';
  EST_KARDEX       = '0200300';

  // Menu Movimentações

  MOV_VENDA      = '0300100';
  MOV_ORCAMENTO  = '0300200';
  MOV_ORDEM_SERV = '0300300';
  MOV_REQUISICAO = '0300400';

  // Menu Nota Fiscal

  NFE_INUTILIZAR_NUM_NFE = '0400100';
  NFE_CONSULTAR_NFE      = '0400200';
  NFE_EXPORTAR_NFE_GERAD = '0400300';
  NFE_EXPORTAR_CHV_NFE   = '0400400';

  // Chaves e campos de controle do arquivo INI
  
  INI_SECAO_DEFAULT = 'Default';
  INI_KEY_PAIS      = 'PaisID';
  INI_KEY_ESTADO    = 'EstadoID';
  INI_KEY_CIDADE    = 'CidadeID';
  INI_KEY_PAIS_VALUE   = '01058';
  INI_KEY_ESTADO_VALUE = '15';
  INI_KEY_CIDADE_VALUE = '170';

  SYS_PATH_REGISTER = {$IFDEF DGE}'MasterDados\'{$ELSE}'Ágil Soluções em Softwares\'{$ENDIF};
  SYS_PASSWD_KEY    = 'TheLordIsGod';
  
  KEY_REG_VERSAO    = 'Versão';
  KEY_REG_DATA      = 'Data acesso';

implementation

end.
