inherited frmGeConfiguracaoEmpresa: TfrmGeConfiguracaoEmpresa
  Left = 420
  Top = 178
  Width = 767
  Height = 495
  ActiveControl = nil
  Caption = 'Configura'#231#245'es da Empresa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 453
    Width = 751
  end
  inherited Bevel3: TBevel
    Top = 414
    Width = 751
  end
  inherited tlbBotoes: TToolBar
    Top = 418
    Width = 751
  end
  inherited pgcGuias: TPageControl
    Width = 751
    Height = 414
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 319
        Width = 743
      end
      inherited dbgDados: TDBGrid
        Width = 743
        Height = 319
        Columns = <
          item
            Expanded = False
            FieldName = 'EMPRESA'
            Title.Caption = 'CNPJ'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RZSOC'
            Title.Caption = 'Raz'#227'o Social'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            Visible = False
          end
          item
            Expanded = False
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 323
        Width = 743
        inherited grpBxFiltro: TGroupBox
          Left = 417
          Width = 322
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 52
            Caption = 'Empresa:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 277
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 201
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
        Width = 743
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 743
        Height = 81
        Caption = 'Empresa'
        inherited lblCodigo: TLabel
          Width = 30
          Caption = 'CNPJ:'
        end
        object lblEmpresa: TLabel [1]
          Left = 240
          Top = 24
          Width = 64
          Height = 13
          Caption = 'Raz'#227'o Social:'
          FocusControl = dbEmpresa
        end
        inherited dbCodigo: TDBEdit
          Width = 217
          Color = clMoneyGreen
          DataField = 'EMPRESA'
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 240
          Top = 40
          Width = 489
          Height = 21
          DataField = 'EMPRESA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 1
        end
      end
      object pgcConfigurar: TPageControl
        Left = 0
        Top = 85
        Width = 743
        Height = 300
        ActivePage = TbsNFe
        Align = alClient
        TabOrder = 1
        object tbsContaEmail: TTabSheet
          Caption = 'Conta de E-mail'
          object lblEmailConta: TLabel
            Left = 16
            Top = 8
            Width = 32
            Height = 13
            Caption = 'E-mail:'
            FocusControl = dbEmailConta
          end
          object lblEmailSenha: TLabel
            Left = 312
            Top = 8
            Width = 34
            Height = 13
            Caption = 'Senha:'
            FocusControl = dbEmailSenha
          end
          object lblEmailPOP: TLabel
            Left = 16
            Top = 48
            Width = 67
            Height = 13
            Caption = 'Servidor POP:'
            FocusControl = dbEmailPOP
          end
          object lblEmailSMTP: TLabel
            Left = 224
            Top = 48
            Width = 73
            Height = 13
            Caption = 'Servidor SMTP:'
            FocusControl = dbEmailSMTP
          end
          object lblEmailPorta: TLabel
            Left = 432
            Top = 48
            Width = 30
            Height = 13
            Caption = 'Porta:'
            FocusControl = dbEmailPorta
          end
          object dbEmailConta: TDBEdit
            Left = 16
            Top = 24
            Width = 289
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL_CONTA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbEmailSenha: TDBEdit
            Left = 312
            Top = 24
            Width = 177
            Height = 21
            DataField = 'EMAIL_SENHA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 1
          end
          object dbEmailPOP: TDBEdit
            Left = 16
            Top = 64
            Width = 201
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL_POP'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object dbEmailSMTP: TDBEdit
            Left = 224
            Top = 64
            Width = 201
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL_SMTP'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object dbEmailPorta: TDBEdit
            Left = 432
            Top = 64
            Width = 57
            Height = 21
            DataField = 'EMAIL_SMTP_PORTA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object dbEmailAutentica: TDBCheckBox
            Left = 16
            Top = 88
            Width = 201
            Height = 17
            Caption = 'Servidor requer autentica'#231#227'o'
            DataField = 'EMAIL_REQUER_AUTENTICACAO'
            DataSource = DtSrcTabela
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbEmailConexaoSSL: TDBCheckBox
            Left = 16
            Top = 112
            Width = 201
            Height = 17
            Caption = 'Conex'#227'o Segura (SSL)'
            DataField = 'EMAIL_CONEXAO_SSL'
            DataSource = DtSrcTabela
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object TbsNFe: TTabSheet
          Caption = 'NF-e'
          ImageIndex = 1
          object chkNFE_SolicitaDHSaida: TDBCheckBox
            Left = 16
            Top = 64
            Width = 377
            Height = 17
            Caption = 'Solicitar Data/Hora de sa'#237'da da NF-e para impress'#227'o no DANFE'
            DataField = 'NFE_SOLICITA_DH_SAIDA'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object chkImprimirCodCliente: TDBCheckBox
            Left = 16
            Top = 88
            Width = 377
            Height = 17
            Caption = 'Imprimir C'#243'digo Interno do Cliente no DANFE da NF-e'
            DataField = 'NFE_IMPRIMIR_COD_CLIENTE'
            DataSource = DtSrcTabela
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object chkNFE_Emitir: TDBCheckBox
            Left = 16
            Top = 16
            Width = 169
            Height = 17
            Caption = 'Permitir Emiss'#227'o de NF-e'
            DataField = 'NFE_EMITIR'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object chkNFE_SalvarNotaDenegada: TDBCheckBox
            Left = 16
            Top = 40
            Width = 193
            Height = 17
            Caption = 'Aceitar/Salvar NF-e Denegada'
            DataField = 'NFE_ACEITAR_NOTA_DENEGADA'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Outras Configura'#231#245'es'
          ImageIndex = 2
          object dbCustoOperacional: TDBCheckBox
            Left = 16
            Top = 16
            Width = 313
            Height = 17
            Caption = 'Calcular Custo Operacional nas vendas por Cliente'
            DataField = 'CUSTO_OPER_CALCULAR'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 16
            Top = 40
            Width = 321
            Height = 17
            Caption = 'Permitir venda de produtos com estoque insuficiente'
            DataField = 'PERMITIR_VENDA_ESTOQUE_INS'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbEstoqueUnico: TDBCheckBox
            Left = 16
            Top = 64
            Width = 257
            Height = 17
            Caption = 'Trabalhar com estoque '#250'nico de produtos'
            DataField = 'ESTOQUE_UNICO_EMPRESAS'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 16
            Top = 112
            Width = 321
            Height = 17
            Caption = 'Permitir duplicar CPF/CNPJ no cadastro dos clientes'
            DataField = 'CLIENTE_PERMITIR_DUPLICAR_CNPJ'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 16
            Top = 88
            Width = 241
            Height = 17
            Caption = 'Habilitar estoque satelite para clientes'
            DataField = 'ESTOQUE_SATELITE_CLIENTE'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbAutorizacaoInformaCliente: TDBCheckBox
            Left = 16
            Top = 136
            Width = 321
            Height = 17
            Caption = 'Informar Cliente nas Autoriza'#231#245'es de Compras/Servi'#231'os'
            DataField = 'AUTORIZA_INFORMA_CLIENTE'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    c.empresa'
      '  , c.email_conta'
      '  , c.email_senha'
      '  , c.email_pop'
      '  , c.email_smtp'
      '  , c.email_smtp_porta'
      '  , c.email_requer_autenticacao'
      '  , c.email_conexao_ssl'
      '  , c.email_assunto_padrao'
      '  , c.email_mensagem_padrao'
      '  , c.nfe_emitir'
      '  , c.nfe_aceitar_nota_denegada'
      '  , c.nfe_solicita_dh_saida'
      '  , c.nfe_imprimir_cod_cliente'
      '  , c.cliente_permitir_duplicar_cnpj'
      '  , c.custo_oper_calcular'
      '  , c.permitir_venda_estoque_ins'
      '  , c.estoque_unico_empresas'
      '  , c.estoque_satelite_cliente'
      '  , c.autoriza_informa_cliente'
      '  , c.usuario'
      '  , e.rzsoc'
      '  , e.nmfant'
      'from TBCONFIGURACAO c'
      '  inner join TBEMPRESA e on (e.cnpj = c.empresa)'
      '')
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = '"TBCONFIGURACAO"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnGetText = IbDtstTabelaEMPRESAGetText
      Size = 18
    end
    object IbDtstTabelaEMAIL_CONTA: TIBStringField
      DisplayLabel = 'Conta de E-mail'
      FieldName = 'EMAIL_CONTA'
      Origin = '"TBCONFIGURACAO"."EMAIL_CONTA"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_SENHA: TIBStringField
      DisplayLabel = 'Senha da Conta de e-mail'
      FieldName = 'EMAIL_SENHA'
      Origin = '"TBCONFIGURACAO"."EMAIL_SENHA"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_POP: TIBStringField
      DisplayLabel = 'Servidor POP'
      FieldName = 'EMAIL_POP'
      Origin = '"TBCONFIGURACAO"."EMAIL_POP"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_SMTP: TIBStringField
      DisplayLabel = 'Servidor SMTP'
      FieldName = 'EMAIL_SMTP'
      Origin = '"TBCONFIGURACAO"."EMAIL_SMTP"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_SMTP_PORTA: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'EMAIL_SMTP_PORTA'
      Origin = '"TBCONFIGURACAO"."EMAIL_SMTP_PORTA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaEMAIL_REQUER_AUTENTICACAO: TSmallintField
      FieldName = 'EMAIL_REQUER_AUTENTICACAO'
      Origin = '"TBCONFIGURACAO"."EMAIL_REQUER_AUTENTICACAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaEMAIL_CONEXAO_SSL: TSmallintField
      FieldName = 'EMAIL_CONEXAO_SSL'
      Origin = '"TBCONFIGURACAO"."EMAIL_CONEXAO_SSL"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaEMAIL_ASSUNTO_PADRAO: TIBStringField
      FieldName = 'EMAIL_ASSUNTO_PADRAO'
      Origin = '"TBCONFIGURACAO"."EMAIL_ASSUNTO_PADRAO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_MENSAGEM_PADRAO: TIBStringField
      FieldName = 'EMAIL_MENSAGEM_PADRAO'
      Origin = '"TBCONFIGURACAO"."EMAIL_MENSAGEM_PADRAO"'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object IbDtstTabelaNFE_EMITIR: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'NFE_EMITIR'
      Origin = '"TBCONFIGURACAO"."NFE_EMITIR"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFE_ACEITAR_NOTA_DENEGADA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'NFE_ACEITAR_NOTA_DENEGADA'
      Origin = '"TBCONFIGURACAO"."NFE_ACEITAR_NOTA_DENEGADA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFE_SOLICITA_DH_SAIDA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'NFE_SOLICITA_DH_SAIDA'
      Origin = '"TBCONFIGURACAO"."NFE_SOLICITA_DH_SAIDA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFE_IMPRIMIR_COD_CLIENTE: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'NFE_IMPRIMIR_COD_CLIENTE'
      Origin = '"TBCONFIGURACAO"."NFE_IMPRIMIR_COD_CLIENTE"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCLIENTE_PERMITIR_DUPLICAR_CNPJ: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CLIENTE_PERMITIR_DUPLICAR_CNPJ'
      Origin = '"TBCONFIGURACAO"."CLIENTE_PERMITIR_DUPLICAR_CNPJ"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCUSTO_OPER_CALCULAR: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CUSTO_OPER_CALCULAR'
      Origin = '"TBCONFIGURACAO"."CUSTO_OPER_CALCULAR"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaPERMITIR_VENDA_ESTOQUE_INS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'PERMITIR_VENDA_ESTOQUE_INS'
      Origin = '"TBCONFIGURACAO"."PERMITIR_VENDA_ESTOQUE_INS"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaESTOQUE_UNICO_EMPRESAS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ESTOQUE_UNICO_EMPRESAS'
      Origin = '"TBCONFIGURACAO"."ESTOQUE_UNICO_EMPRESAS"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaESTOQUE_SATELITE_CLIENTE: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ESTOQUE_SATELITE_CLIENTE'
      Origin = '"TBCONFIGURACAO"."ESTOQUE_SATELITE_CLIENTE"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaAUTORIZA_INFORMA_CLIENTE: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'AUTORIZA_INFORMA_CLIENTE'
      Origin = '"TBCONFIGURACAO"."AUTORIZA_INFORMA_CLIENTE"'
    end
    object IbDtstTabelaUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBCONFIGURACAO"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object IbDtstTabelaRZSOC: TIBStringField
      FieldName = 'RZSOC'
      Origin = '"TBEMPRESA"."RZSOC"'
      ProviderFlags = []
      Size = 60
    end
    object IbDtstTabelaNMFANT: TIBStringField
      FieldName = 'NMFANT'
      Origin = '"TBEMPRESA"."NMFANT"'
      ProviderFlags = []
      Size = 25
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  EMPRESA,'
      '  EMAIL_CONTA,'
      '  EMAIL_SENHA,'
      '  EMAIL_POP,'
      '  EMAIL_SMTP,'
      '  EMAIL_SMTP_PORTA,'
      '  EMAIL_REQUER_AUTENTICACAO,'
      '  EMAIL_CONEXAO_SSL,'
      '  EMAIL_ASSUNTO_PADRAO,'
      '  EMAIL_MENSAGEM_PADRAO,'
      '  NFE_EMITIR,'
      '  NFE_ACEITAR_NOTA_DENEGADA,'
      '  NFE_SOLICITA_DH_SAIDA,'
      '  NFE_IMPRIMIR_COD_CLIENTE,'
      '  CLIENTE_PERMITIR_DUPLICAR_CNPJ,'
      '  CUSTO_OPER_CALCULAR,'
      '  PERMITIR_VENDA_ESTOQUE_INS,'
      '  VENDA_CARREGA_PRODUTO_EAN,'
      '  ESTOQUE_UNICO_EMPRESAS,'
      '  ESTOQUE_SATELITE_CLIENTE,'
      '  AUTORIZA_INFORMA_CLIENTE,'
      '  USUARIO'
      'from TBCONFIGURACAO '
      'where'
      '  EMPRESA = :EMPRESA')
    ModifySQL.Strings = (
      'update TBCONFIGURACAO'
      'set'
      '  AUTORIZA_INFORMA_CLIENTE = :AUTORIZA_INFORMA_CLIENTE,'
      
        '  CLIENTE_PERMITIR_DUPLICAR_CNPJ = :CLIENTE_PERMITIR_DUPLICAR_CN' +
        'PJ,'
      '  CUSTO_OPER_CALCULAR = :CUSTO_OPER_CALCULAR,'
      '  EMAIL_ASSUNTO_PADRAO = :EMAIL_ASSUNTO_PADRAO,'
      '  EMAIL_CONEXAO_SSL = :EMAIL_CONEXAO_SSL,'
      '  EMAIL_CONTA = :EMAIL_CONTA,'
      '  EMAIL_MENSAGEM_PADRAO = :EMAIL_MENSAGEM_PADRAO,'
      '  EMAIL_POP = :EMAIL_POP,'
      '  EMAIL_REQUER_AUTENTICACAO = :EMAIL_REQUER_AUTENTICACAO,'
      '  EMAIL_SENHA = :EMAIL_SENHA,'
      '  EMAIL_SMTP = :EMAIL_SMTP,'
      '  EMAIL_SMTP_PORTA = :EMAIL_SMTP_PORTA,'
      '  EMPRESA = :EMPRESA,'
      '  ESTOQUE_SATELITE_CLIENTE = :ESTOQUE_SATELITE_CLIENTE,'
      '  ESTOQUE_UNICO_EMPRESAS = :ESTOQUE_UNICO_EMPRESAS,'
      '  NFE_ACEITAR_NOTA_DENEGADA = :NFE_ACEITAR_NOTA_DENEGADA,'
      '  NFE_EMITIR = :NFE_EMITIR,'
      '  NFE_IMPRIMIR_COD_CLIENTE = :NFE_IMPRIMIR_COD_CLIENTE,'
      '  NFE_SOLICITA_DH_SAIDA = :NFE_SOLICITA_DH_SAIDA,'
      '  PERMITIR_VENDA_ESTOQUE_INS = :PERMITIR_VENDA_ESTOQUE_INS,'
      '  USUARIO = :USUARIO'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TBCONFIGURACAO'
      
        '  (AUTORIZA_INFORMA_CLIENTE, CLIENTE_PERMITIR_DUPLICAR_CNPJ, CUS' +
        'TO_OPER_CALCULAR, '
      
        '   EMAIL_ASSUNTO_PADRAO, EMAIL_CONEXAO_SSL, EMAIL_CONTA, EMAIL_M' +
        'ENSAGEM_PADRAO, '
      
        '   EMAIL_POP, EMAIL_REQUER_AUTENTICACAO, EMAIL_SENHA, EMAIL_SMTP' +
        ', EMAIL_SMTP_PORTA, '
      
        '   EMPRESA, ESTOQUE_SATELITE_CLIENTE, ESTOQUE_UNICO_EMPRESAS, NF' +
        'E_ACEITAR_NOTA_DENEGADA, '
      
        '   NFE_EMITIR, NFE_IMPRIMIR_COD_CLIENTE, NFE_SOLICITA_DH_SAIDA, ' +
        'PERMITIR_VENDA_ESTOQUE_INS, '
      '   USUARIO)'
      'values'
      
        '  (:AUTORIZA_INFORMA_CLIENTE, :CLIENTE_PERMITIR_DUPLICAR_CNPJ, :' +
        'CUSTO_OPER_CALCULAR, '
      
        '   :EMAIL_ASSUNTO_PADRAO, :EMAIL_CONEXAO_SSL, :EMAIL_CONTA, :EMA' +
        'IL_MENSAGEM_PADRAO, '
      
        '   :EMAIL_POP, :EMAIL_REQUER_AUTENTICACAO, :EMAIL_SENHA, :EMAIL_' +
        'SMTP, :EMAIL_SMTP_PORTA, '
      
        '   :EMPRESA, :ESTOQUE_SATELITE_CLIENTE, :ESTOQUE_UNICO_EMPRESAS,' +
        ' :NFE_ACEITAR_NOTA_DENEGADA, '
      
        '   :NFE_EMITIR, :NFE_IMPRIMIR_COD_CLIENTE, :NFE_SOLICITA_DH_SAID' +
        'A, :PERMITIR_VENDA_ESTOQUE_INS, '
      '   :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBCONFIGURACAO'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBEMPRESA'
    Left = 656
    Top = 208
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 688
    Top = 208
  end
  object qryConfiguracoes: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '  c.Empresa'
      'from TBCONFIGURACAO c'
      'where c.empresa = :empresa')
    Left = 656
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
  end
end
