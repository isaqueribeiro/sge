inherited frmGePlanoContas: TfrmGePlanoContas
  Left = 403
  Top = 194
  Width = 812
  Height = 521
  ActiveControl = dbExercicio
  Caption = 'Tabela de Planos de Contas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 479
    Width = 796
  end
  inherited Bevel3: TBevel
    Top = 440
    Width = 796
  end
  inherited tlbBotoes: TToolBar
    Top = 444
    Width = 796
  end
  inherited pgcGuias: TPageControl
    Width = 796
    Height = 440
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 345
        Width = 788
      end
      inherited dbgDados: TDBGrid
        Width = 788
        Height = 345
        Columns = <
          item
            Expanded = False
            FieldName = 'BCO_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCO_NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCO_AGENCIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCO_CC'
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 349
        Width = 788
        inherited grpBxFiltro: TGroupBox
          Left = 384
          Width = 400
          inherited lbltFiltrar: TLabel
            Width = 58
            Caption = 'Descri'#231#227'o:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 355
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 279
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 185
        Width = 788
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 788
        Height = 185
        object lblDescricaoResumida: TLabel [1]
          Left = 416
          Top = 24
          Width = 99
          Height = 13
          Caption = 'Descri'#231#227'o Resumida:'
        end
        object lblGrupo: TLabel [2]
          Left = 288
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Grupo:'
          FocusControl = dbGrupo
        end
        object lblExercicio: TLabel [3]
          Left = 88
          Top = 24
          Width = 46
          Height = 13
          Caption = 'Exerc'#237'cio:'
          FocusControl = dbExercicio
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCodigoContabil: TLabel [4]
          Left = 160
          Top = 24
          Width = 79
          Height = 13
          Caption = 'C'#243'digo Cont'#225'bil:'
          FocusControl = dbCodigoContabil
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCodigoResumido: TLabel [5]
          Left = 288
          Top = 24
          Width = 86
          Height = 13
          Caption = 'C'#243'digo Resumido:'
          FocusControl = dbCodigoResumido
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDescricaoCompleta: TLabel [6]
          Left = 16
          Top = 104
          Width = 98
          Height = 13
          Caption = 'Descri'#231#227'o Completa:'
        end
        object lblTipo: TLabel [7]
          Left = 16
          Top = 64
          Width = 24
          Height = 13
          Caption = 'Tipo:'
          FocusControl = dbTipo
        end
        inherited dbCodigo: TDBEdit
          TabStop = False
          Color = clMoneyGreen
        end
        object dbDescricaoResumida: TDBEdit
          Left = 416
          Top = 40
          Width = 353
          Height = 21
          CharCase = ecUpperCase
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbSituacao: TDBCheckBox
          Left = 16
          Top = 152
          Width = 65
          Height = 17
          Caption = 'Ativo'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbGrupo: TDBLookupComboBox
          Left = 288
          Top = 80
          Width = 481
          Height = 21
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsGrupo
          ParentFont = False
          TabOrder = 6
        end
        object dbExercicio: TDBEdit
          Left = 88
          Top = 40
          Width = 65
          Height = 21
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbCodigoContabil: TDBEdit
          Left = 160
          Top = 40
          Width = 121
          Height = 21
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbCodigoResumido: TDBEdit
          Left = 288
          Top = 40
          Width = 121
          Height = 21
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbDescricaoCompleta: TDBEdit
          Left = 16
          Top = 120
          Width = 753
          Height = 21
          CharCase = ecUpperCase
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbTipo: TDBLookupComboBox
          Left = 16
          Top = 80
          Width = 265
          Height = 21
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsGrupo
          ParentFont = False
          TabOrder = 5
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    SelectSQL.Strings = (
      'Select'
      '    b.bco_cod'
      '  , b.empresa'
      '  , b.bco_carteira'
      '  , b.bco_nome'
      '  , b.bco_agencia'
      '  , b.bco_cc'
      '  , b.bco_codigo_cedente'
      '  , b.bco_chave'
      '  , b.bco_gerar_boleto'
      '  , b.bco_nosso_num_inicio'
      '  , b.bco_nosso_num_final'
      '  , b.bco_nosso_num_proximo'
      '  , b.bco_confg_1'
      '  , b.bco_confg_2'
      '  , b.bco_diretorio_remessa'
      '  , b.bco_diretorio_retorno'
      '  , b.bco_sequencial_rem'
      '  , b.bco_percentual_juros'
      '  , b.bco_percentual_mora'
      '  , b.bco_dia_protesto'
      '  , b.bco_msg_instrucao'
      '  , b.bco_layout_remessa'
      '  , b.bco_layout_retorno'
      'from TBBANCO_BOLETO b')
    Left = 56
    Top = 376
    object IbDtstTabelaBCO_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'BCO_COD'
      Origin = 'TBBANCO_BOLETO.BCO_COD'
      Required = True
    end
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = '"TBBANCO_BOLETO"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 18
    end
    object IbDtstTabelaBCO_CARTEIRA: TIBStringField
      DisplayLabel = 'Carteira'
      FieldName = 'BCO_CARTEIRA'
      Origin = 'TBBANCO_BOLETO.BCO_CARTEIRA'
      Required = True
      Size = 10
    end
    object IbDtstTabelaBCO_NOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'BCO_NOME'
      Origin = 'TBBANCO_BOLETO.BCO_NOME'
      Size = 50
    end
    object IbDtstTabelaBCO_AGENCIA: TIBStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'BCO_AGENCIA'
      Origin = 'TBBANCO_BOLETO.BCO_AGENCIA'
      Size = 10
    end
    object IbDtstTabelaBCO_CC: TIBStringField
      DisplayLabel = 'C/C'
      FieldName = 'BCO_CC'
      Origin = 'TBBANCO_BOLETO.BCO_CC'
      Size = 10
    end
    object IbDtstTabelaBCO_CODIGO_CEDENTE: TIBStringField
      DisplayLabel = 'C'#243'digo Cedente'
      FieldName = 'BCO_CODIGO_CEDENTE'
      Origin = '"TBBANCO_BOLETO"."BCO_CODIGO_CEDENTE"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object IbDtstTabelaBCO_CHAVE: TIBStringField
      DisplayLabel = 'Conv'#234'nio / Contrato'
      FieldName = 'BCO_CHAVE'
      Origin = 'TBBANCO_BOLETO.BCO_CHAVE'
      Size = 10
    end
    object IbDtstTabelaBCO_GERAR_BOLETO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'BCO_GERAR_BOLETO'
      Origin = '"TBBANCO_BOLETO"."BCO_GERAR_BOLETO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaBCO_NOSSO_NUM_INICIO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_INICIO'
      Origin = 'TBBANCO_BOLETO.BCO_NOSSO_NUM_INICIO'
      Size = 10
    end
    object IbDtstTabelaBCO_NOSSO_NUM_FINAL: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_FINAL'
      Origin = 'TBBANCO_BOLETO.BCO_NOSSO_NUM_FINAL'
      Size = 10
    end
    object IbDtstTabelaBCO_NOSSO_NUM_PROXIMO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_PROXIMO'
      Origin = 'TBBANCO_BOLETO.BCO_NOSSO_NUM_PROXIMO'
      Size = 10
    end
    object IbDtstTabelaBCO_CONFG_1: TIBStringField
      FieldName = 'BCO_CONFG_1'
      Origin = 'TBBANCO_BOLETO.BCO_CONFG_1'
    end
    object IbDtstTabelaBCO_CONFG_2: TIBStringField
      FieldName = 'BCO_CONFG_2'
      Origin = 'TBBANCO_BOLETO.BCO_CONFG_2'
    end
    object IbDtstTabelaBCO_DIRETORIO_REMESSA: TIBStringField
      FieldName = 'BCO_DIRETORIO_REMESSA'
      Origin = 'TBBANCO_BOLETO.BCO_DIRETORIO_REMESSA'
      Size = 100
    end
    object IbDtstTabelaBCO_DIRETORIO_RETORNO: TIBStringField
      FieldName = 'BCO_DIRETORIO_RETORNO'
      Origin = 'TBBANCO_BOLETO.BCO_DIRETORIO_RETORNO'
      Size = 100
    end
    object IbDtstTabelaBCO_SEQUENCIAL_REM: TIntegerField
      FieldName = 'BCO_SEQUENCIAL_REM'
      Origin = 'TBBANCO_BOLETO.BCO_SEQUENCIAL_REM'
      Required = True
    end
    object IbDtstTabelaBCO_PERCENTUAL_JUROS: TIBBCDField
      FieldName = 'BCO_PERCENTUAL_JUROS'
      Origin = '"TBBANCO_BOLETO"."BCO_PERCENTUAL_JUROS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaBCO_PERCENTUAL_MORA: TIBBCDField
      FieldName = 'BCO_PERCENTUAL_MORA'
      Origin = '"TBBANCO_BOLETO"."BCO_PERCENTUAL_MORA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaBCO_DIA_PROTESTO: TSmallintField
      FieldName = 'BCO_DIA_PROTESTO'
      Origin = '"TBBANCO_BOLETO"."BCO_DIA_PROTESTO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaBCO_MSG_INSTRUCAO: TIBStringField
      FieldName = 'BCO_MSG_INSTRUCAO'
      Origin = '"TBBANCO_BOLETO"."BCO_MSG_INSTRUCAO"'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object IbDtstTabelaBCO_LAYOUT_REMESSA: TSmallintField
      DisplayLabel = 'Layout de Remessa'
      FieldName = 'BCO_LAYOUT_REMESSA'
      Origin = '"TBBANCO_BOLETO"."BCO_LAYOUT_REMESSA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaBCO_LAYOUT_RETORNO: TSmallintField
      DisplayLabel = 'Layout de Retorno'
      FieldName = 'BCO_LAYOUT_RETORNO'
      Origin = '"TBBANCO_BOLETO"."BCO_LAYOUT_RETORNO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 120
    Top = 376
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  BCO_COD,'
      '  EMPRESA,'
      '  BCO_CARTEIRA,'
      '  BCO_NOME,'
      '  BCO_AGENCIA,'
      '  BCO_CC,'
      '  BCO_CODIGO_CEDENTE,'
      '  BCO_CHAVE,'
      '  BCO_GERAR_BOLETO,'
      '  BCO_NOSSO_NUM_INICIO,'
      '  BCO_NOSSO_NUM_FINAL,'
      '  BCO_NOSSO_NUM_PROXIMO,'
      '  BCO_CONFG_1,'
      '  BCO_CONFG_2,'
      '  BCO_SEQUENCIAL_REM,'
      '  BCO_DIRETORIO_REMESSA,'
      '  BCO_DIRETORIO_RETORNO,'
      '  BCO_PERCENTUAL_JUROS,'
      '  BCO_PERCENTUAL_MORA,'
      '  BCO_DIA_PROTESTO,'
      '  BCO_MSG_INSTRUCAO,'
      '  BCO_LAYOUT_REMESSA,'
      '  BCO_LAYOUT_RETORNO'
      'from TBBANCO_BOLETO '
      'where'
      '  BCO_COD = :BCO_COD and'
      '  EMPRESA = :EMPRESA')
    ModifySQL.Strings = (
      'update TBBANCO_BOLETO'
      'set'
      '  BCO_AGENCIA = :BCO_AGENCIA,'
      '  BCO_CARTEIRA = :BCO_CARTEIRA,'
      '  BCO_CC = :BCO_CC,'
      '  BCO_CHAVE = :BCO_CHAVE,'
      '  BCO_COD = :BCO_COD,'
      '  BCO_CODIGO_CEDENTE = :BCO_CODIGO_CEDENTE,'
      '  BCO_CONFG_1 = :BCO_CONFG_1,'
      '  BCO_CONFG_2 = :BCO_CONFG_2,'
      '  BCO_DIA_PROTESTO = :BCO_DIA_PROTESTO,'
      '  BCO_DIRETORIO_REMESSA = :BCO_DIRETORIO_REMESSA,'
      '  BCO_DIRETORIO_RETORNO = :BCO_DIRETORIO_RETORNO,'
      '  BCO_GERAR_BOLETO = :BCO_GERAR_BOLETO,'
      '  BCO_LAYOUT_REMESSA = :BCO_LAYOUT_REMESSA,'
      '  BCO_LAYOUT_RETORNO = :BCO_LAYOUT_RETORNO,'
      '  BCO_MSG_INSTRUCAO = :BCO_MSG_INSTRUCAO,'
      '  BCO_NOME = :BCO_NOME,'
      '  BCO_NOSSO_NUM_FINAL = :BCO_NOSSO_NUM_FINAL,'
      '  BCO_NOSSO_NUM_INICIO = :BCO_NOSSO_NUM_INICIO,'
      '  BCO_NOSSO_NUM_PROXIMO = :BCO_NOSSO_NUM_PROXIMO,'
      '  BCO_PERCENTUAL_JUROS = :BCO_PERCENTUAL_JUROS,'
      '  BCO_PERCENTUAL_MORA = :BCO_PERCENTUAL_MORA,'
      '  BCO_SEQUENCIAL_REM = :BCO_SEQUENCIAL_REM,'
      '  EMPRESA = :EMPRESA'
      'where'
      '  BCO_COD = :OLD_BCO_COD and'
      '  EMPRESA = :OLD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TBBANCO_BOLETO'
      
        '  (BCO_AGENCIA, BCO_CARTEIRA, BCO_CC, BCO_CHAVE, BCO_COD, BCO_CO' +
        'DIGO_CEDENTE, '
      
        '   BCO_CONFG_1, BCO_CONFG_2, BCO_DIA_PROTESTO, BCO_DIRETORIO_REM' +
        'ESSA, BCO_DIRETORIO_RETORNO, '
      
        '   BCO_GERAR_BOLETO, BCO_LAYOUT_REMESSA, BCO_LAYOUT_RETORNO, BCO' +
        '_MSG_INSTRUCAO, '
      
        '   BCO_NOME, BCO_NOSSO_NUM_FINAL, BCO_NOSSO_NUM_INICIO, BCO_NOSS' +
        'O_NUM_PROXIMO, '
      
        '   BCO_PERCENTUAL_JUROS, BCO_PERCENTUAL_MORA, BCO_SEQUENCIAL_REM' +
        ', EMPRESA)'
      'values'
      
        '  (:BCO_AGENCIA, :BCO_CARTEIRA, :BCO_CC, :BCO_CHAVE, :BCO_COD, :' +
        'BCO_CODIGO_CEDENTE, '
      
        '   :BCO_CONFG_1, :BCO_CONFG_2, :BCO_DIA_PROTESTO, :BCO_DIRETORIO' +
        '_REMESSA, '
      
        '   :BCO_DIRETORIO_RETORNO, :BCO_GERAR_BOLETO, :BCO_LAYOUT_REMESS' +
        'A, :BCO_LAYOUT_RETORNO, '
      
        '   :BCO_MSG_INSTRUCAO, :BCO_NOME, :BCO_NOSSO_NUM_FINAL, :BCO_NOS' +
        'SO_NUM_INICIO, '
      
        '   :BCO_NOSSO_NUM_PROXIMO, :BCO_PERCENTUAL_JUROS, :BCO_PERCENTUA' +
        'L_MORA, '
      '   :BCO_SEQUENCIAL_REM, :EMPRESA)')
    DeleteSQL.Strings = (
      'delete from TBBANCO_BOLETO'
      'where'
      '  BCO_COD = :OLD_BCO_COD and'
      '  EMPRESA = :OLD_EMPRESA')
    Left = 88
    Top = 376
  end
  inherited ImgList: TImageList
    Left = 24
    Top = 376
  end
  object dtsGrupo: TDataSource
    DataSet = qryGrupo
    Left = 344
    Top = 272
  end
  object qryGrupo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    Left = 312
    Top = 272
  end
end
