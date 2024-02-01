unit UConstantesDGE;

interface

Uses
  SysUtils, Classes, ExtCtrls;

  Type
    TArrayInteger      = Array of Integer;
    TTipoAlertaSistema = (tpaLicenca, tpaBackup);

    TAliquota   = (taICMS, taISS);
    TTipoItem   = TAliquota;
    TTipoRegime = (trSimplesNacional, trSimplesExcessoReceita, trRegimeNormal);
    TTipoDANFE = (tipoDANFEFast, tipoDANFE_ESCPOS);

    TTipoProduto = (tpMaterialGeral, tpMaterialMedicoHosp, tpMedicamento, tpSolucao, tpOPME);
    TTipoCFOP    = (tcfopADefinir, tcfopEntrada, tcfopSaida);
    TTipoTabelaIBPT  = (tIbptGeral, tIbptProdutos, tIbptServicos);
    TGrupoFornecedor = (gpFornecedorADefinir = 1, gpFornecedorProduto = 2, gpFornecedorServico = 3, gpFornecedorProdutoServico = 4, gpFornecedorColaborador = 5);
    TTipoPlanoConta  = (tpNull = -1, tpAgrupador = 0, tpLancamento = 1);
    TTipoMovimentoEntrada = (tmeProduto, tmeServico);
    TFormaNFDevolucao = (fdNFeEletronica, fdNFeModelo1_1A, fdNFProdutorRural, fdCupomFiscal);
    TTipoMovimentoCaixa = (tmcxCredito, tmcxDebito);
    TTipoContrato = (tpContratoNull = -1, tpContratoCliente = 0, tpContratoFornecedor = 1);

    TTipoAlertaSistemaCollection = Set of TTipoAlertaSistema;
    TTipoProdutoCollection       = Set of TTipoProduto;

    TTipoAlertaSistemaLista = Array[Low(TTipoAlertaSistema)..High(TTipoAlertaSistema)] of String;
    TTipoProdutoLista       = Array[Low(TTipoProduto)..High(TTipoProduto)] of String;
    TGrupoFornecedorLista   = Array[Low(TGrupoFornecedor)..High(TGrupoFornecedor)] of String;
    TPermissaoLista         = Array [0..45] of String;

    TModeloPapel = (mrPapelA4, mrPapelA5);

  TSistema = record
    Codigo : Integer;
    Nome   : String;
  end;

  TUsuarioLogado = record
    Login    : String;
    Nome     : String;
    Funcao   : Integer;
    Empresa  : String;
    Vendedor : Integer;
    Logado   : Boolean;
    AlterarValorVenda : Boolean;
  end;

  TLancamentoEntrada = record
    Ano      : Smallint;
    Controle : Integer;
    Emissao  : TDateTime;
  end;

  TDocumentoEntrada = record
    Fornecedor : Integer;
    Tipo       : Smallint;
    Numero     : Integer;
  end;

  TContrato = record
    Empresa    : String;
    Controle   : Int64;
    Destino    : Smallint;
    Cliente    : Integer;
    Fornecedor : Integer;
    Numero : String;
    Nome   : String;
    Cnpj   : String;
  end;

  TLoteEnvioNFE = record
    Ano    : Integer;
    Numero : Integer;
  end;

  TChequeBaixa = record
    Codigo : Integer;
    Numero ,
    Banco  ,
    Agencia,
    Conta  : String;
    Valor  : Currency;
    Data   : TDateTime;
  end;

const
  VERSION_NUMBER     = '1.0.33.0';
  VERSION_NUMBER_ID  = 01003300;
  VERSION_NUMBER_STR = '01003300';

  MANIFESTO_AGIL =
     'Estamos descobrindo maneiras melhores de desenvolver software, '
   + 'fazendo-o nós mesmos e ajudando outros a fazerem o mesmo. '
   + 'Através deste trabalho, passamos a valorizar:'
   + #13#13
   + 'Indivíduos e interações mais que processos e ferramentas;'
   + #13
   + 'Software em funcionamento mais que documentação abrangente;'
   + #13
   + 'Colaboração com o cliente mais que negociação de contratos;'
   + #13
   + 'Responder a mudanças mais que seguir um plano.';

  SISTEMA_GESTAO_COM  = 0;
  SISTEMA_PDV         = 1;
  SISTEMA_GESTAO_IND  = 2;
  SISTEMA_GESTAO_OPME = 3;

  SYS_ALERTA_PERIODO_LICENCA = 5; // Dias
  SYS_ALERTA_ARQUIVO_LICENCA = 'AlertaLicenca.txt';
  SYS_ALERTA_ARQUIVO_BACKUP  = 'AlertaBackup.txt';
  SYS_ALERTA_ARQUIVOS : TTipoAlertaSistemaLista = (
      SYS_ALERTA_ARQUIVO_LICENCA
    , SYS_ALERTA_ARQUIVO_BACKUP
  );

  SYS_TIPOS_PRODUTO : TTipoProdutoLista = (
      'Material'
    , 'Material médico-hospitalar'
    , 'Medicamento'
    , 'Solução'
    , 'Opm'
  );

  SYS_GRUPOS_FORNECEDOR : TGrupoFornecedorLista = (
      'A Definir'
    , 'Produtos'
    , 'Serviços'
    , 'Produtos de Serviços'
    , 'Colaboradores'
  );

  LENGTH_QRCODE_150 = 150;
  LENGTH_QRCODE_160 = 160;
  LENGTH_QRCODE_175 = 175;
  LENGTH_QRCODE_180 = 180;
  LENGTH_QRCODE_200 = 200;
  LENGTH_QRCODE_300 = 300;

  ROTINA_LENGTH_ID     = 10;
  ROTINA_TIPO_MENU     = 0;
  ROTINA_TIPO_TELA     = 1;
  ROTINA_TIPO_FUNCAO   = 2;
  ROTINA_TIPO_PROCESSO = 3;

  // Códigos de Teclas

  SYS_KEY_DEL = 46;
  SYS_KEY_A   = 65;
  SYS_KEY_B   = 66;
  SYS_KEY_C   = 67;
  SYS_KEY_D   = 68;
  SYS_KEY_E   = 69;
  SYS_KEY_F   = 70;
  SYS_KEY_L   = 76;
  SYS_KEY_M   = 77;
  SYS_KEY_N   = 78;
  SYS_KEY_O   = 79;
  SYS_KEY_P   = 80;
  SYS_KEY_Q   = 81;
  SYS_KEY_R   = 82;
  SYS_KEY_S   = 83;
  SYS_KEY_T   = 84;

  // Fontes

  SYS_BAUHS93 = 'BAUHS93.TTF';
  SYS_BAUHS93_DESCRIPTION = 'Bauhaus 93';

  // Constantes Wait A Moment...

  WAIT_AMOMENT_Deleting      = 0;
  WAIT_AMOMENT_Inserting     = 1;
  WAIT_AMOMENT_Editing       = 2;
  WAIT_AMOMENT_LoadData      = 3;
  WAIT_AMOMENT_CloneTable    = 4;
  WAIT_AMOMENT_PrintPrepare  = 5;
  WAIT_AMOMENT_MakerConsulta = 6;
  WAIT_AMOMENT_Process       = 7;
  WAIT_AMOMENT_Autorizacao   = 8;
  WAIT_AMOMENT_TextoLivre    = 35;

  // Flags para Operação Lógica

  FLAG_NAO = 0;
  FLAG_SIM = 1;

  // Políticas para Senhas de Usuários

  USER_PASSWD_LIMITE  = 16;
  USER_PASSWD_ENCRIPT = 'x|';
  USER_PASSWD_DEFAULT = 'ABC123';
  USER_PASSWD_KEY     = 'ADONAI';


  // Indices de Imagens no ImageList de Recursos (ImgPrincipal16x16, ImgPrincipalEnabled, ...)

  IMG_IDX_USER_PERFIL_ACESSO   = 13;
  IMG_IDX_USER_CADASTRO        = 14;
  IMG_IDX_USER_ALTERAR_SENHA   = 26;
  IMG_IDX_USER_EFETURAR_LOGIN  = 25;
  IMG_IDX_USER_SENHA_AUTORIZA  = 70;
  IMG_IDX_CONFIGURAR_EMPRESA   = 12;
  IMG_IDX_CONFIGURAR_NFE       = 9;
  IMG_IDX_CONFIGURAR_AMBIENTE  = 10;
  IMG_IDX_CADASTRO_EMPRESA_COM = 0;
  IMG_IDX_BACKUP_EXECUTE       = 71;
  IMG_IDX_BACKUP_RESTORE       = 72;
  IMG_IDX_CADASTRO_EMPRESA_IND = 1;
  IMG_IDX_CADASTRO_TABELAS_AUX = 2;
  IMG_IDX_CADASTRO_CLIENTE     = 3;
  IMG_IDX_CADASTRO_FORNECEDOR  = 15;
  IMG_IDX_CADASTRO_VENDEDOR    = 4;
  IMG_IDX_CADASTRO_BANCO       = 5;
  IMG_IDX_CADASTRO_CONTA_CORR  = 6;
  IMG_IDX_CADASTRO_FORMA_PAGTO = 7;
  IMG_IDX_CADASTRO_COND_PAGTO  = 8;
  IMG_IDX_CADASTRO_MENU_PROD   = 33;
  IMG_IDX_CADASTRO_PRODUTO     = 19;
  IMG_IDX_CADASTRO_PROMOCAO    = 16;
  IMG_IDX_CADASTRO_FUNCIONARIO = 73;
  IMG_IDX_FATURAMENTO_VENDA    = 17;
  IMG_IDX_FATURAMENTO_OS       = 27;
  IMG_IDX_COTACAO_COMPRA       = 29;
  IMG_IDX_SOLICITACAO_COMPRA   = 30;
  IMG_IDX_REQUISICAO_COMPRA    = 31;
  IMG_IDX_AUTORIZACAO_COMPRA   = 32;
  IMG_IDX_SERVICO              = 33;
  IMG_IDX_REQUISICAO_ALMOX     = 34;
  IMG_IDX_REQUISICAO_MONITOR   = 35;
  IMG_IDX_INVENTARIO_PRODUTO   = 36;
  IMG_IDX_NFE_CARTA_CORRECAO   = 37;
  IMG_IDX_NFE_COMPLEMENTAR     = 69;
  IMG_IDX_NFE_CONSULTAR_RECIBO = 38;
  IMG_IDX_NFE_DOWNLOAD_XML     = 39;
  IMG_IDX_NFE_EXPORTAR_XML     = 40;
  IMG_IDX_NFE_INUTILIZAR       = 41;
  IMG_IDX_NFE_DANFE            = 74;
  IMG_IDX_CONS_CNPJ_RECEITA    = 42;
  IMG_IDX_CONS_VENDA_REALIZADA = 43;
  IMG_IDX_CONS_ROTATIV_PRODUTO = 44;
  IMG_IDX_CONS_ESTOQUE_MINIMO  = 45;
  IMG_IDX_CONS_ESTOQUE_APROP   = 46;
  IMG_IDX_FIN_ABRIR_CAIXA      = 51;
  IMG_IDX_FIN_ENCERRAR_CAIXA   = 52;
  IMG_IDX_FIN_GERENCIA_CAIXA   = 47;
  IMG_IDX_FIN_TESOURARIA       = 50;
  IMG_IDX_FIN_APAGAR           = 48;
  IMG_IDX_FIN_ARECEBER         = 49;
  IMG_IDX_FIN_GERAR_BOLETO1    = 53;
  IMG_IDX_FIN_GERAR_BOLETO2    = 54;
  IMG_IDX_FIN_REMESSA_BOLETO1  = 55;
  IMG_IDX_FIN_REMESSA_BOLETO2  = 56;
  IMG_IDX_FIN_RETORNO_BOLETO1  = 57;
  IMG_IDX_FIN_RETORNO_BOLETO2  = 58;
  IMG_IDX_FIN_QUITAR_CONTA     = 59;
  IMG_IDX_FIN_CONTROLE_CHEQUE  = 76;
  IMG_IDX_REL_CLIENTE          = 60;
  IMG_IDX_REL_FORNECEDOR       = 61;
  IMG_IDX_REL_PRODUTO          = 62;
  IMG_IDX_REL_FATURAMENTO      = 63;
  IMG_IDX_REL_FINANCEIRO       = 64;
  IMG_IDX_REL_AUTOTIZACAO      = 75;
  IMG_IDX_AJUDA_REGISTRO_ESTAC = 65;
  IMG_IDX_AJUDA_LICENCA_USO_1  = 66;
  IMG_IDX_AJUDA_LICENCA_USO_2  = 67;
  IMG_IDX_AJUDA_SOBRE          = 68;
  IMG_IDX_UPGRADE_SYSTEM       = 77;
  IMG_IDX_TEAM_VIEWER_REMOTE   = 78;
  IMG_IDX_RESULTADO_EXERCICIO  = 79;
  IMG_IDX_SERVICO_TAREFA       = 80;
  IMG_IDX_RELATORIO            = 81;

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

  // Perfis de Acesso ao Sistema

  FUNCTION_USER_ID_DIRETORIA   =  1;
  FUNCTION_USER_ID_GERENTE_VND =  2;
  FUNCTION_USER_ID_GERENTE_FIN =  3;
  FUNCTION_USER_ID_VENDEDOR    =  4;
  FUNCTION_USER_ID_GERENTE_ADM =  5;
  FUNCTION_USER_ID_CAIXA       =  6;
  FUNCTION_USER_ID_AUX_FINANC1 =  7;
  FUNCTION_USER_ID_AUX_FINANC2 =  8;
  FUNCTION_USER_ID_SUPERV_CX   =  9;
  FUNCTION_USER_ID_ESTOQUISTA  = 10;
  FUNCTION_USER_ID_SUPORTE_TI  = 11;
  FUNCTION_USER_ID_SYSTEM_ADM  = 12;
  FUNCTION_USER_ID_COMMON_USER = 13;

  // Menu Principal -> Identificacores de rotinas no sistema

  ROTINA_MENU_RIBBON_ID       = '0000000000';
  ROTINA_MENU_CADASTRO_ID     = '0010000000';
  ROTINA_MENU_ENTRADA_ID      = '0020000000';
  ROTINA_MENU_MOVIMENTO_ID    = '0030000000';
  ROTINA_MENU_NOTAFISCAL_ID   = '0040000000';
  ROTINA_MENU_CONSULTA_ID     = '0050000000';
  ROTINA_MENU_FINANCEIRO_ID   = '0060000000';
  ROTINA_MENU_RELATORIO_ID    = '0070000000';
  ROTINA_MENU_CAIXA_PDV_ID    = '0130000000';
  ROTINA_MENU_AJUDA_ID        = '0990000000';
  ROTINA_MENU_TAB_AUXILIAR_ID    = '0080000000';
  ROTINA_MENU_REL_ENTRADA_ID     = '0090000000';
  ROTINA_MENU_REL_ESTOQUE_ID     = '0100000000';
  ROTINA_MENU_REL_FATURAMENTO_ID = '0110000000';
  ROTINA_MENU_REL_FINANCEIRO_ID  = '0120000000';
  ROTINA_MENU_REL_GERENCIAL_ID   = '0140000000';  // '013' já está em uso pelo PDV

  // Menu Cadastro -> Tabelas Auxiliares

  ROTINA_CAD_ESTADO_ID     = '0080010000';
  ROTINA_CAD_CIDADE_ID     = '0080020000';
  ROTINA_CAD_DISTRITO_ID   = '0080030000';
  ROTINA_CAD_BAIRRO_ID     = '0080040000';
  ROTINA_CAD_TIPO_LOG_ID   = '0080050000';
  ROTINA_CAD_LOGRADOURO_ID = '0080060000';
  ROTINA_CAD_CFOP_ID           = '0080070000';
  ROTINA_CAD_TRIBUTACAO_IDXXXX = '0080080000';
  ROTINA_CAD_CONTA_CORRENTE_ID = '0080090000';
  ROTINA_CAD_PLANO_CONTAS_ID   = '0080100000';
  ROTINA_CAD_TIPO_DESPESA_ID   = '0080110000';
  ROTINA_CAD_CENTRO_CUSTO_ID   = '0080120000';
  ROTINA_CAD_FORMA_PAGTO_ID    = '0080130000';
  ROTINA_CAD_CONDICAO_PAGTO_ID = '0080140000';
  ROTINA_CAD_TABELA_IBPT_ID    = '0080150000';
  ROTINA_CAD_TIPO_RECEITA_ID   = '0080160000';
  ROTINA_CAD_CNAE_ID           = '0080170000';

  // Menu da Aplicação

  ROTINA_CAD_CONFIG_EMP_ID = '0000010000';
  ROTINA_CAD_CONFIG_NFE_ID = '0000020000';
  ROTINA_CAD_CONFIG_AMB_ID = '0000030000';
  ROTINA_CAD_PERFIL_ID     = '0000110000';
  ROTINA_CAD_USUARIO_ID    = '0000120000';
  ROTINA_CAD_GERAR_SENH_ID = '0000130000';

  // Menu Cadastro

  ROTINA_CAD_EMPRESA_ID     = '0010010000';
  ROTINA_CAD_CLIENTE_ID     = '0010020000';
  ROTINA_CAD_FORNECEDOR_ID  = '0010030000';
  ROTINA_CAD_VENDEDOR_ID    = '0010040000';
  ROTINA_CAD_BANCO_ID       = '0010050000';
  ROTINA_CAD_GRUPO_PROD_ID  = '0010060000';
  ROTINA_CAD_SECAO_PROD_ID  = '0010070000';
  ROTINA_CAD_FABRI_PROD_ID  = '0010080000';
  ROTINA_CAD_UNIDA_PROD_ID  = '0010090000';
  ROTINA_CAD_PRODUTO_ID     = '0010100000';
  ROTINA_CAD_PROMOCAO_ID    = '0010110000';
  ROTINA_CAD_FUNCIONARIO_ID = '0010120000';

  // Menu Entradas

  ROTINA_ENT_PRODUTO_ID           = '0020010000';
  ROTINA_ENT_AJUSTE_ID            = '0020020000';
  ROTINA_ENT_KARDEX_ID            = '0020030000';
  ROTINA_ENT_SERVICO_ID           = '0020040000';
  ROTINA_ENT_APROPRIACAO_ESTOQ_ID = '0020100000';

  // Menu Movimentos

  ROTINA_MOV_VENDA_ID             = '0030010000';
  ROTINA_MOV_ORDEM_SERV_ID        = '0030020000';
  ROTINA_MOV_REQUISICAO_ID        = '0030030000';
  ROTINA_MOV_COTACAO_ID           = '0030040000';
  ROTINA_MOV_AUTORIZACAO_ID       = '0030050000';
  ROTINA_MOV_VENDA_PDV_ID         = '0030060000';
  ROTINA_MOV_ORCAMENTO_PDV_ID     = '0030070000';
  ROTINA_MOV_REQUISICAO_CMP_ID    = '0030080000';
  ROTINA_MOV_CONVERT_REQ_AUT_ID   = '0030090000';
  ROTINA_MOV_REQUISICAO_ALMOX_ID  = '0030100000';
  ROTINA_MOV_MONITOR_REQ_ALMOX_ID = '0030110000';
  ROTINA_MOV_INVENTARIO_ESTOQU_ID = '0030120000';
  ROTINA_MOV_SOLICITACAO_ID       = '0030130000';
  ROTINA_MOV_VENDA_MOBILE_ID      = '0030140000';
  ROTINA_MOV_GESTAO_CONTRATO_ID   = '0030150000';

  // Menu Notas Fiscais

  ROTINA_NFE_INUTILIZAR_NRO_ID  = '0040010000';
  ROTINA_NFE_CONSULTA_RECIBO_ID = '0040020000';
  ROTINA_NFE_CARTA_CORRECAO_ID  = '0040030000';
  ROTINA_NFE_EXPORTAR_NFE_ID    = '0040040000';
  ROTINA_NFE_EXPORTAR_CHAVE_ID  = '0040050000';
  ROTINA_NFE_GERAR_ARQUI_NFC_ID = '0040060000';
  ROTINA_NFE_DOWNLOAD_NFE_ID    = '0040070000';
  ROTINA_NFE_COMPLEMENTAR_ID    = '0040080000';

  // Menu Consultas

  ROTINA_CNS_CONSULTA_CNPJ_ID        = '0050010000';
  ROTINA_CNS_CONSULTA_VENDA_ID       = '0050020000';
  ROTINA_CNS_CONSULTA_ROTATIVIDAD_ID = '0050030000';
  ROTINA_CNS_CONSULTA_ESTOQUE_MIN_ID = '0050040000';
  ROTINA_CNS_CONSULTA_ESTOQUE_APR_ID = '0050050000';

  // Menu Financeiro

  ROTINA_FIN_ABRIR_CAIXA_ID     = '0060010000';
  ROTINA_FIN_ENCERRAR_CAIXA_ID  = '0060020000';
  ROTINA_FIN_GERENCIAR_CAIXA_ID = '0060030000';
  ROTINA_FIN_CONTA_APAGAR_ID    = '0060040000';
  ROTINA_FIN_CONTA_ARECEBER_ID  = '0060050000';
  ROTINA_FIN_TESOURARIA_ID      = '0060060000';
  ROTINA_FIN_GERAR_BOLETO_ID    = '0060070000';
  ROTINA_FIN_GERAR_REMESSA_ID   = '0060080000';
  ROTINA_FIN_PROCESSA_RETORN_ID = '0060090000';
  ROTINA_FIN_QUITAR_APAGAR_ID   = '0060100000';
  ROTINA_FIN_QUITAR_ARECEBER_ID = '0060110000';
  ROTINA_FIN_CONTROLE_CHEQUE_ID = '0060120000';

  // Menu Relatórios

  ROTINA_REL_CLIENTE_ID      = '0070010000';
  ROTINA_REL_FORNECEDOR_ID   = '0070020000';
  ROTINA_REL_PRODUTO_ID      = '0070030000';
  ROTINA_REL_AUTORIZACAO_ID  = '0070040000';
  ROTINA_REL_ENTRADA_PROD_ID = '0090010000';
  ROTINA_REL_ESTOQUE_PROD_ID        = '0100010000';
  ROTINA_REL_ESTOQUE_APRO_ID        = '0100020000';
  ROTINA_REL_ESTOQUE_REQ_ID         = '0100030000';
  ROTINA_REL_ESTOQUE_PROD_CONSIG_ID = '0100040000';
  ROTINA_REL_FATURA_VENDA_ID = '0110010000';
  ROTINA_REL_FATURA_OS_ID    = '0110020000';
  ROTINA_REL_APAGAR_ID       = '0120010000';
  ROTINA_REL_ARECEBER_ID     = '0120020000';
  ROTINA_REL_MOV_FINANCE_ID  = '0120030000';
  ROTINA_REL_RESULT_EXERC_ID = '0140010000';
  ROTINA_REL_AUTOR_ENTRAD_ID = '0140020000';
  ROTINA_REL_ENTRAD_SAIDA_ID = '0140030000';
  ROTINA_REL_APAG_AREC_ID    = '0140040000';

  // Menu Caixa PDV

  ROTINA_FIN_ABRIR_CAIXA_PDV_ID     = '0130010000';
  ROTINA_FIN_ENCERRAR_CAIXA_PDV_ID  = '0130020000';
  ROTINA_FIN_GERENCIAR_CAIXA_PDV_ID = '0130030000';

  // Notificações de Sistema

  SGE_NOTIFICAR_LICENCA     = 'SGE - Licença';
  SGE_PDV_NOTIFICAR_LICENCA = 'SGE PDV - Licença';
  SGO_NOTIFICAR_LICENCA     = 'SGO - Licença';
  SGI_NOTIFICAR_LICENCA     = 'SGI - Licença';

  // Permissões

  PERMISSAO_SYSTEM_ADMINISTRATOR : TPermissaoLista =  (
    // Menus
      ROTINA_MENU_CADASTRO_ID
    , ROTINA_MENU_ENTRADA_ID
    , ROTINA_MENU_MOVIMENTO_ID
    , ROTINA_MENU_NOTAFISCAL_ID
    , ROTINA_MENU_CONSULTA_ID
    , ROTINA_MENU_FINANCEIRO_ID
    , ROTINA_MENU_RELATORIO_ID
    , ROTINA_MENU_TAB_AUXILIAR_ID
    , ROTINA_MENU_REL_ESTOQUE_ID
    , ROTINA_MENU_REL_FATURAMENTO_ID
    , ROTINA_MENU_REL_FINANCEIRO_ID

    // Menu Tabela Auxiliar
    , ROTINA_CAD_ESTADO_ID
    , ROTINA_CAD_CIDADE_ID
    , ROTINA_CAD_DISTRITO_ID
    , ROTINA_CAD_BAIRRO_ID
    , ROTINA_CAD_TIPO_LOG_ID
    , ROTINA_CAD_LOGRADOURO_ID
    , ROTINA_CAD_CFOP_ID
    , ROTINA_CAD_TRIBUTACAO_IDXXXX
    , ROTINA_CAD_CONTA_CORRENTE_ID
    , ROTINA_CAD_TIPO_DESPESA_ID
    , ROTINA_CAD_CENTRO_CUSTO_ID
    , ROTINA_CAD_FORMA_PAGTO_ID
    , ROTINA_CAD_CONDICAO_PAGTO_ID
    , ROTINA_CAD_TABELA_IBPT_ID

    // Menu Cadastro
    , ROTINA_CAD_EMPRESA_ID
    , ROTINA_CAD_CLIENTE_ID
    , ROTINA_CAD_FORNECEDOR_ID
    , ROTINA_CAD_VENDEDOR_ID
    , ROTINA_CAD_BANCO_ID
    , ROTINA_CAD_GRUPO_PROD_ID
    , ROTINA_CAD_SECAO_PROD_ID
    , ROTINA_CAD_FABRI_PROD_ID
    , ROTINA_CAD_UNIDA_PROD_ID
    , ROTINA_CAD_PRODUTO_ID
    , ROTINA_CAD_PROMOCAO_ID
    , ROTINA_CAD_CONFIG_EMP_ID
    , ROTINA_CAD_CONFIG_NFE_ID
    , ROTINA_CAD_CONFIG_AMB_ID
    , ROTINA_CAD_GERAR_SENH_ID
    , ROTINA_CAD_PERFIL_ID
    , ROTINA_CAD_USUARIO_ID

    // Menu Entradas
    , ROTINA_ENT_PRODUTO_ID
    , ROTINA_ENT_AJUSTE_ID
    , ROTINA_ENT_KARDEX_ID
    , ROTINA_ENT_SERVICO_ID

  );

  STATUS_REQ_ABR = 1;
  STATUS_REQ_AUT = 2;
  STATUS_REQ_FCH = 3;
  STATUS_REQ_CAN = 4;

  // Tipos Padrões

  TIPO_RECEITA_PADRAO = 1;
  TIPO_DESPESA_PADRAO = 1;
  VENDEDOR_PADRAO     = '1';

  // Status de Contas a Pagar (Financeiro)

  STATUS_APAGAR_PENDENTE = 0;
  STATUS_APAGAR_PAGO     = 1;

  // Status de Contas a Receber (Financeiro)

  STATUS_ARECEBER_PENDENTE = 0;
  STATUS_ARECEBER_PAGO     = 1;

  // Status de Entradas (Compras)

  STATUS_CMP_ABR = 1;
  STATUS_CMP_FIN = 2;
  STATUS_CMP_CAN = 3;
  STATUS_CMP_NFE = 4;

  // Status de Saídas (Vendas)

  STATUS_VND_AND = 1;
  STATUS_VND_ABR = 2;
  STATUS_VND_FIN = 3;
  STATUS_VND_NFE = 4;
  STATUS_VND_CAN = 5;

  // Status de Contratos (Vendas/Serviços)

  STATUS_CONTRATO_EDIT   = 0;
  STATUS_CONTRATO_DISPO  = 1;
  STATUS_CONTRATO_FINAL  = 2;
  STATUS_CONTRATO_CANCEL = 9;

  // Prazos padrões em dias (Fixos)

  PRAZO_VALIDADE_AUTORIZACAO_COMPRA = 5;
  PRAZO_VALIDADE_REQUISICAO_COMPRA  = 5;

  // Tipos de autorizações de compras/serviços

  TIPO_AUTORIZACAO_COMPRA         = 1;
  TIPO_AUTORIZACAO_SERVICO        = 2;
  TIPO_AUTORIZACAO_COMPRA_SERVICO = 3;

  // Status de autorizações de compras/serviços

  STATUS_AUTORIZACAO_EDC = 0;
  STATUS_AUTORIZACAO_ABR = 1;
  STATUS_AUTORIZACAO_AUT = 2;
  STATUS_AUTORIZACAO_FAT = 3;
  STATUS_AUTORIZACAO_CAN = 4;

  // Tipos de requisições de compras/serviços

  TIPO_REQUISICAO_COMPRA         = TIPO_AUTORIZACAO_COMPRA;
  TIPO_REQUISICAO_SERVICO        = TIPO_AUTORIZACAO_SERVICO;
  TIPO_REQUISICAO_COMPRA_SERVICO = TIPO_AUTORIZACAO_COMPRA_SERVICO;

  // Status de requisições de compras/serviços

  STATUS_REQUISICAO_EDC = STATUS_AUTORIZACAO_EDC;
  STATUS_REQUISICAO_ABR = STATUS_AUTORIZACAO_ABR;
  STATUS_REQUISICAO_REQ = STATUS_AUTORIZACAO_AUT;
  STATUS_REQUISICAO_FAT = STATUS_AUTORIZACAO_FAT;
  STATUS_REQUISICAO_CAN = STATUS_AUTORIZACAO_CAN;

  // Tipos de requisições de compras/serviços

  TIPO_REQUISICAO_ALMOX_CI = 0;
  TIPO_REQUISICAO_ALMOX_CP = 1;
  TIPO_REQUISICAO_ALMOX_TE = 2;

  // Status de requisições ao almoxarifado

  STATUS_REQUISICAO_ALMOX_EDC = 0;
  STATUS_REQUISICAO_ALMOX_ABR = 1;
  STATUS_REQUISICAO_ALMOX_ENV = 2;
  STATUS_REQUISICAO_ALMOX_REC = 3;
  STATUS_REQUISICAO_ALMOX_ATD = 4;
  STATUS_REQUISICAO_ALMOX_CAN = 5;

  // Status de Itens das requisições ao almoxarifado

  STATUS_ITEM_REQUISICAO_ALMOX_PEN = 0;
  STATUS_ITEM_REQUISICAO_ALMOX_AGU = 1;
  STATUS_ITEM_REQUISICAO_ALMOX_ATE = 2;
  STATUS_ITEM_REQUISICAO_ALMOX_ENT = 3;
  STATUS_ITEM_REQUISICAO_ALMOX_CAN = 4;

  // Tipos de Documentos de Entrada

  TIPO_DOCUMENTO_ENTRADA_AVULSA      = 0;
  TIPO_DOCUMENTO_ENTRADA_NOTA_FISCAL = 1;
  TIPO_DOCUMENTO_ENTRADA_CUPOM       = 2;
  TIPO_DOCUMENTO_ENTRADA_SERIED      = 3;
  TIPO_DOCUMENTO_ENTRADA_CONTRATO    = 4;
  TIPO_DOCUMENTO_ENTRADA_NFE         = 5;
  TIPO_DOCUMENTO_ENTRADA_NFCE        = 6;
  TIPO_DOCUMENTO_ENTRADA_NFSE        = 7;
  TIPO_DOCUMENTO_ENTRADA_CTE         = 8;
  TIPO_DOCUMENTO_SERIE_AVULSO        = '99';

  // Status do Caixa

  STATUS_CAIXA_ABERTO    = 0;
  STATUS_CAIXA_FECHADO   = 1;
  STATUS_CAIXA_CANCELADO = 2;

  // Status de Cheques

  STATUS_CHEQUE_PENDENTE    = 0;
  STATUS_CHEQUE_APRESENTADO = 1;
  STATUS_CHEQUE_DEVOLVIDO   = 2;
  STATUS_CHEQUE_COMPENSADO  = 8;
  STATUS_CHEQUE_CANCELADO   = 9;

  // Tipos de Cheques

  TIPO_CHEQUE_EMITIDO  = 1;
  TIPO_CHEQUE_RECEBIDO = 2;

  // Valores padrões para vendas

  MODALIDADE_FRETE_SEMFRETE = 3;

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
  SEGMENTO_VAREJO_DELIVERY_ID = 5;
  SEGMENTO_INDUSTRIA_METAL_ID = 8;
  SEGMENTO_INDUSTRIA_GERAL_ID = 9;

  SEGMENTO_PADRAO_DS          = 'Padrão';
  SEGMENTO_VAREJO_ATACADO_DS  = 'Produtos a Varejo e Atacado';
  SEGMENTO_MERCADO_CARRO_DS   = 'Comércio de Veículos';
  SEGMENTO_SERVICOS_DS        = 'Serviços';
  SEGMENTO_VAREJO_SERVICOS_DS = 'Produtos a Varejo e Serviços';
  SEGMENTO_VAREJO_DELIVERY_DS = 'Venda de Produtos Delivery';
  SEGMENTO_INDUSTRIA_METAL_DS = 'Indústria Metalúrgica';
  SEGMENTO_INDUSTRIA_GERAL_DS = 'Indústria';

  TIPO_LOG_TRANS_NOTIFIC = 0;
  TIPO_LOG_TRANS_SEFA    = 1;
  TIPO_LOG_TRANS_SISTEMA = 2;

  TIPO_EQUIPAMENTO_CARRO = 1;
  TIPO_EQUIPAMENTO_MOTO  = 2;

  DESC_LOG_EVENTO_CANCELAR_NFE_SD   = 'Cancelar NF-e de Saída';
  DESC_LOG_EVENTO_CANCELAR_NFE_ET   = 'Cancelar NF-e de Entrada';
  DESC_LOG_EVENTO_CCE_NFE           = 'Carta de Correcao Eletronica';
  DESC_LOG_EVENTO_MANIFESTO_DST_NFE = 'Manifesto Dest. de NF-e';
  DESC_LOG_INUTILIZA_NRO_NFE        = 'Inutilização de numerão para NF-e';
  DESC_LOG_CONSULTAR_NRO_LOTE_NFE   = 'Consultar retorno do Lote/Recibo de NF-e';
  DESC_LOG_EVENTO_ATUALIZAR_CUSTO   = 'Atualização de Custo de Produto';

  CENTRO_CUSTO_ESTOQUE_GERAL     = 1;
  CENTRO_CUSTO_ESTOQUE_GERAL_DSC = 'ESTOQUE GERAL';

  CONTA_CORRENTE_TIPO_CAIXA = 1;
  CONTA_CORRENTE_TIPO_BANCO = 2;

  BOLETO_ARQUIVO_LOGOTIPO = 'Imagens\Emitente.gif';
  BOLETO_IMAGENS          = 'Imagens\';
  BOLETO_LICENCAS         = 'Licencas\';

  // Arquivos padrões

  LAYOUT_BOLETO         = 'Boleto\Boleto.fr3';
  LAYOUT_BOLETO_ENTREGA = 'Boleto\BoletoEntrega.fr3';
  LAYOUT_BOLETO_FATURA  = 'Boleto\BoletoFatura.fr3';
  LAYOUT_BOLETO_CARNE   = 'Boleto\BoletoCarne.fr3';

  //FILE_WALLPAPER   = 'PapelDeParede.jpg';
  FILE_HISTORY_NET   = 'NetWorkActive.log';
  FILE_SETTINGS_INI  = 'Conexao.ini';
  FILE_COMPANY_LOGO  = 'LogotipoEmpresa.png';
  FILE_AUTOBACKUP    = 'AutoBackupGA.exe';
  FILE_REMOTE_ACCESS = 'TeamViewerQS_pt-idcn9zva8a.exe';

  DOWNLOAD_URL_COMPANY        = 'www.agilsoftwares.com.br/downloads/%s';
  DOWNLOAD_URL_AGIL_SOFTWARES = 'www.agilsoftwares.com.br';
  DOWNLOAD_URL_HOME_AUTOMACAO = 'www.homeautomacao.com/suporte/agil/';
  DOWNLOAD_URL_GERASYS_TI_DRH = 'www.drhtransparencia.com.br/agil/';
  DOWNLOAD_URL_GOOGLE_DRIVE   = 'https://drive.google.com/uc?export=download&id=%s';
  DOWNLOAD_URL_REMOTE_ACCESS  = 'https://get.teamviewer.com/n9zva8a';

  DOWNLOAD_URL_AGIL_SOFTWARES_UPGRADE  = DOWNLOAD_URL_AGIL_SOFTWARES + '/upgrade/';
  DOWNLOAD_URL_AGIL_SOFTWARES_DOWNLOAD = DOWNLOAD_URL_AGIL_SOFTWARES + '/downloads/';
  DOWNLOAD_URL_HOME_AUTOMACAO_UPGRADE  = DOWNLOAD_URL_HOME_AUTOMACAO + 'upgrade/';
  DOWNLOAD_URL_HOME_AUTOMACAO_DOWNLOAD = DOWNLOAD_URL_HOME_AUTOMACAO + 'downloads/';
  DOWNLOAD_URL_GERASYS_TI_DRH_UPGRADE  = DOWNLOAD_URL_GERASYS_TI_DRH + 'upgrade/';
  DOWNLOAD_URL_GERASYS_TI_DRH_DOWNLOAD = DOWNLOAD_URL_GERASYS_TI_DRH + 'downloads/';

  DOWNLOAD_IDFILE_TABELA_IBPT = '1-SknWUZQeUAYEB7FbkOvk5v-CgRy1xaJ';
  DOWNLOAD_NMFILE_TABELA_IBPT = 'TabelaIBPT_PA2023.03.csv';

  COND_PARCELA_MIN = 1;
  COND_PARCELA_MAX = 12;

  CODIGO_BANCO_BRASIL    = 1;
  CODIGO_BANCO_AMAZONIA  = 3;
  CODIGO_BANCO_BRADESCO  = 237;
  CODIGO_BANCO_CAIXA     = 104;
  CODIGO_BANCO_HSBC      = 399;
  CODIGO_BANCO_ITAU      = 341;
  CODIGO_BANCO_SANTANDER = 33;

  CONSUMIDOR_FINAL_CODIGO = 1;
  CONSUMIDOR_FINAL_CNPJ   = '99999999999999';
  CONSUMIDOR_FINAL_NOME   = 'CONSUMIDOR FINAL';

  AGIL_SOFTWARES_FANTASIA   = 'ÁGIL SOLUÇÕES EM SOFTWARES';
  AGIL_SOFTWARES_CNPJ       = '17327623000176';

  FORMA_PAGTO_DINHEIRO      = 'DINHEIRO';
  FORMA_PAGTO_CHEQUE        = 'CHEQUE';
  FORMA_PAGTO_CARTA_CREDITO = 'CARTA DE CRÉDITO';

  EMPRESA_LICENCA_PADRAO  = 1;

  TRIBUTO_NCM_SH_PADRAO    = '00000000'; // 10203000 -- Código descontinuado a partir de 2016
  TRIBUTO_ORIGEM_NACIONAL  = '0';
  TRIBUTO_TRIBUTADA_INTEG  = '00';
  TRIBUTO_TRIBUTADA_ISENTA = '40';
  TRIBUTO_NAO_TRIBUTADA_SN = '400';

  PORTA_SMTP_PADRAO = 587;

  STR_TAMANHO_NCMSH = 8;

  // Chaves e campos de controle do arquivo INI

  INI_SECAO_DEFAULT = 'Default';
  INI_KEY_EMPRESA   = 'EmpresaID';
  INI_KEY_CFOP_SAI  = 'CfopID';
  INI_KEY_CFOP_ENT  = 'CfopEntradaID';
  INI_KEY_PAIS      = 'PaisID';
  INI_KEY_ESTADO    = 'EstadoID';
  INI_KEY_CIDADE    = 'CidadeID';
  INI_KEY_FORMA_PGTO  = 'FormaPagtoID';
  INI_KEY_COND_PGTO   = 'CondicaoPagtoID';
  INI_KEY_VENDEDOR    = 'VendedorID';
  INI_KEY_CLIENTE     = 'ClienteID';
  INI_KEY_FILELICENSE = 'LicenseFile';
  INI_KEY_CFOP_SAI_VALUE = '5102';
  INI_KEY_CFOP_ENT_VALUE = '5102';
  INI_KEY_CFOP_ECF_SUBST = '5929';
  INI_KEY_PAIS_VALUE     = '01058';
  INI_KEY_ESTADO_VALUE   = '15';
  INI_KEY_CIDADE_VALUE   = '170';
  INI_KEY_FORMA_PGTO_VALUE = '1';
  INI_KEY_COND_PGTO_VALUE  = '1';
  INI_KEY_VENDEDOR_VALUE   = VENDEDOR_PADRAO;

  INI_SECAO_VENDA      = 'Venda';
  INI_KEY_CODIGO_EAN   = 'CarregarPeloCodigoEAN';
  INI_KEY_PAPEL_PAREDE = 'CarregarPapelDeParede';
  INI_KEY_AJUSTAR_DH   = 'AjustarDataHora';
  INI_KEY_NUMERO_CAIXA = 'NumeroCaixa';

  INI_SECAO_CUMPO_PDV          = 'Cupom';
  INI_KEY_EMITIR_ORCAM         = 'EmitirApenasOrcamento';
  INI_KEY_EMITIR_CUPOM         = 'EmitirCupom';
  INI_KEY_EMITIR_CUPOM_AUTOMAT = 'CupomAutomatico';
  INI_KEY_EMITIR_CUPOM_NFISCAL    = 'EmitirCupomNaoFiscal';
  INI_KEY_EMITIR_CUPOM_NFISCAL_FN = 'EmitirCupomNaoFiscalFonteNome';
  INI_KEY_EMITIR_CUPOM_NFISCAL_FT = 'EmitirCupomNaoFiscalFonteTamanho';
  INI_KEY_EMITIR_CUPOM_FISCAL  = 'EmitirCupomFiscal';
  INI_KEY_PORTA_CUPOM_NFISCAL     = 'PortaCupomNaoFiscal';
  INI_KEY_PORTA_CUPOM_NFISCAL_MOD = 'ModeloCupomNaoFiscal';
  INI_KEY_PORTA_CUPOM_FISCAL   = 'PortaCupomFiscal';
  INI_KEY_MODELO_CUPOM         = 'ModeloEmissaoCupom';
  INI_KEY_CUPOM_NFISCAL_QTDE   = 'CupomNaoFiscalQtde';

  INI_SECAO_CERTIFICADO = 'Certificado';
  INI_KEY_CERTIFICADO_NUMERO_SERIE ='NumSerie';
  INI_KEY_CERTIFICADO_CAMINHO      = 'Caminho';
  INI_KEY_CERTIFICADO_SENHA        = 'Senha';
  INI_KEY_CERTIFICADO_URL          = 'URL';

  INI_SECAO_GERAL       = 'Geral';
  INI_SECAO_EMITENTE    = 'Emitente';
  INI_SECAO_WEBSERVICE  = 'WebService';
  INI_SECAO_ARQUIVOS    = 'Arquivos';

  SYS_PATH_REGISTER = {$IFDEF DGE}'MasterDados\'{$ELSE}'Ágil Soluções em Softwares\'{$ENDIF};
  SYS_PASSWD_KEY    = 'TheLordIsGod';
  SYS_SYSDBA_LOGIN  = 'SYSDBA';
  SYS_SYSDBA_PWD    = 'masterkey';
  SYS_EMPTY_DATE    = '30/12/1899';

  KEY_REG_VERSAO    = 'Versão';
  KEY_REG_DATA      = 'Data acesso';

  // Mensagens padrões do sistema
  CLIENTE_BLOQUEADO_PORDEBITO = 'Cliente bloqueado automaticamente pelo sistema por se encontrar com títulos vencidos. Favor buscar mais informações junto ao FINANCEIRO.';

implementation

end.
