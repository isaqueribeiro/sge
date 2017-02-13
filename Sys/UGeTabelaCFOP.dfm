inherited frmGeTabelaCFOP: TfrmGeTabelaCFOP
  Left = 391
  Top = 217
  Caption = 'Tabela CFOP (C'#243'digo Fiscal de Opera'#231#245'es e Presta'#231#245'es)'
  ClientHeight = 488
  ClientWidth = 728
  OldCreateOrder = True
  ExplicitWidth = 744
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 484
    Width = 728
    ExplicitTop = 443
    ExplicitWidth = 728
  end
  inherited Bevel3: TBevel
    Top = 445
    Width = 728
    ExplicitTop = 404
    ExplicitWidth = 728
  end
  inherited pgcGuias: TPageControl
    Width = 728
    Height = 445
    ExplicitWidth = 728
    ExplicitHeight = 445
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 720
      ExplicitHeight = 416
      inherited Bevel4: TBevel
        Top = 350
        Width = 720
        ExplicitTop = 309
        ExplicitWidth = 720
      end
      inherited dbgDados: TDBGrid
        Width = 720
        Height = 350
        Columns = <
          item
            Expanded = False
            FieldName = 'CFOP_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP_DESCRICAO'
            Width = 600
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 354
        Width = 720
        ExplicitTop = 354
        ExplicitWidth = 720
        inherited grpBxFiltro: TGroupBox
          Left = 456
          Width = 260
          ExplicitLeft = 456
          ExplicitWidth = 260
          inherited lbltFiltrar: TLabel
            Left = 11
            Width = 31
            Caption = 'CFOP:'
            ExplicitLeft = 11
            ExplicitWidth = 31
          end
          inherited edtFiltrar: TEdit
            Left = 48
            Width = 163
            ExplicitLeft = 48
            ExplicitWidth = 163
          end
          inherited btnFiltrar: TcxButton
            Left = 215
            ExplicitLeft = 215
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 720
      ExplicitHeight = 416
      inherited Bevel8: TBevel
        Top = 225
        Width = 720
        ExplicitTop = 225
        ExplicitWidth = 720
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 720
        Height = 225
        ExplicitWidth = 720
        ExplicitHeight = 225
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lblEspecificacao: TLabel [2]
          Left = 16
          Top = 64
          Width = 68
          Height = 13
          Caption = 'Especifica'#231#227'o:'
        end
        object lblInformacaoFisco: TLabel [3]
          Left = 16
          Top = 176
          Width = 106
          Height = 13
          Caption = 'Informa'#231#245'es ao Fisco:'
          FocusControl = dbInformacaoFisco
        end
        inherited dbCodigo: TDBEdit
          DataField = 'CFOP_COD'
          ReadOnly = False
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 617
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CFOP_DESCRICAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbEspecificacao: TDBMemo
          Left = 16
          Top = 80
          Width = 689
          Height = 89
          DataField = 'CFOP_ESPECIFICACAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object dbInformacaoFisco: TDBEdit
          Left = 16
          Top = 192
          Width = 689
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CFOP_INFORMACAO_FISCO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object GrpBxParametros: TGroupBox
        Left = 0
        Top = 229
        Width = 720
        Height = 187
        Align = alClient
        Caption = 'Par'#226'metros'
        TabOrder = 1
        object lblCSTEntrada: TLabel
          Left = 304
          Top = 90
          Width = 187
          Height = 13
          Caption = 'CST Padr'#227'o para Entrada de Produtos:'
          FocusControl = dbCSTEntrada
        end
        object lblCSTSaida: TLabel
          Left = 304
          Top = 130
          Width = 175
          Height = 13
          Caption = 'CST Padr'#227'o para Sa'#237'da de Produtos:'
          FocusControl = dbCSTSaida
        end
        object dbCustoOperacional: TDBCheckBox
          Left = 16
          Top = 24
          Width = 257
          Height = 17
          Caption = 'CFOP altera o Custo do Produto na Entrada'
          DataField = 'CFOP_ALTERA_CUSTO_PRODUTO'
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
        object dbCSTEntrada: TDBLookupComboBox
          Left = 304
          Top = 109
          Width = 401
          Height = 21
          DataField = 'CFOP_CST_PADRAO_ENTRADA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = DtsCST
          ParentFont = False
          TabOrder = 6
        end
        object dbCSTSaida: TDBLookupComboBox
          Left = 304
          Top = 149
          Width = 401
          Height = 21
          DataField = 'CFOP_CST_PADRAO_SAIDA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = DtsCST
          ParentFont = False
          TabOrder = 7
        end
        object dbCfopDevolucao: TDBCheckBox
          Left = 16
          Top = 47
          Width = 154
          Height = 17
          Caption = 'CFOP de Devolu'#231#227'o'
          DataField = 'CFOP_DEVOLUCAO'
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
        object dbCfopGerarTitulo: TDBCheckBox
          Left = 304
          Top = 24
          Width = 184
          Height = 17
          Hint = 'Gerar t'#237'tulos A Pagar / A Receber'
          Caption = 'CFOP Gera T'#237'tulos A Receber'
          DataField = 'CFOP_GERAR_TITULO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbCfopGerarDuplicata: TDBCheckBox
          Left = 304
          Top = 47
          Width = 184
          Height = 17
          Hint = 'Gerar t'#237'tulos A Pagar / A Receber'
          Caption = 'CFOP Gera Duplicata A Pagar'
          DataField = 'CFOP_GERAR_DUPLICATA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbCfopRemessa: TDBCheckBox
          Left = 16
          Top = 70
          Width = 154
          Height = 17
          Caption = 'CFOP de Remessa'
          DataField = 'CFOP_REMESSA'
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
        object grpBxCfopRetorno: TGroupBox
          Left = 16
          Top = 93
          Width = 249
          Height = 76
          Caption = 'CFOPs de Retorno para:'
          Enabled = False
          TabOrder = 5
          object lblCfopRetornoDentro: TLabel
            Left = 16
            Top = 26
            Width = 88
            Height = 13
            Caption = 'Dentro do Estado:'
            FocusControl = dbCfopRetornoDentro
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCfopRetornoFora: TLabel
            Left = 127
            Top = 26
            Width = 77
            Height = 13
            Caption = 'Fora do Estado:'
            FocusControl = dbCfopRetornoFora
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object dbCfopRetornoDentro: TDBEdit
            Left = 16
            Top = 45
            Width = 105
            Height = 21
            DataField = 'CFOP_RETORNO_INTERNO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbCfopRetornoFora: TDBEdit
            Left = 127
            Top = 45
            Width = 105
            Height = 21
            DataField = 'CFOP_RETORNO_EXTERNO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 449
    Width = 728
    ExplicitTop = 449
    ExplicitWidth = 728
    inherited bvlTool3: TBevel
      Left = 645
      ExplicitLeft = 645
    end
    inherited bvlTool4: TBevel
      Left = 724
      ExplicitLeft = 724
    end
    inherited btbtnFechar: TcxButton
      Left = 649
      ExplicitLeft = 649
    end
    inherited btbtnSelecionar: TcxButton
      Left = 525
      ExplicitLeft = 525
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    c.Cfop_cod'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      '  , c.Cfop_informacao_fisco'
      '  , c.Cfop_devolucao'
      '  , c.Cfop_remessa'
      '  , c.Cfop_retorno_interno'
      '  , c.Cfop_retorno_externo'
      '  , c.Cfop_altera_custo_produto'
      '  , c.Cfop_cst_padrao_entrada'
      '  , c.Cfop_cst_padrao_saida'
      '  , c.Cfop_gerar_titulo'
      '  , c.Cfop_gerar_duplicata'
      'from TBCFOP c')
    object IbDtstTabelaCFOP_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CFOP_COD'
      Origin = 'TBCFOP.CFOP_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbDtstTabelaCFOP_DESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'TBCFOP.CFOP_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldName = 'CFOP_ESPECIFICACAO'
      Origin = 'TBCFOP.CFOP_ESPECIFICACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaCFOP_INFORMACAO_FISCO: TIBStringField
      DisplayLabel = 'Informa'#231#227'o ao Fisco'
      FieldName = 'CFOP_INFORMACAO_FISCO'
      Origin = '"TBCFOP"."CFOP_INFORMACAO_FISCO"'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CFOP_ALTERA_CUSTO_PRODUTO'
      Origin = '"TBCFOP"."CFOP_ALTERA_CUSTO_PRODUTO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCFOP_DEVOLUCAO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CFOP_DEVOLUCAO'
      Origin = '"TBCFOP"."CFOP_DEVOLUCAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCFOP_REMESSA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CFOP_REMESSA'
      Origin = '"TBCFOP"."CFOP_REMESSA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCFOP_RETORNO_INTERNO: TIntegerField
      DisplayLabel = 'CFOP de Retorno para Dentro do Estado'
      FieldName = 'CFOP_RETORNO_INTERNO'
      Origin = '"TBCFOP"."CFOP_RETORNO_INTERNO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCFOP_RETORNO_EXTERNO: TIntegerField
      DisplayLabel = 'CFOP de Retorno para Fora do Estado'
      FieldName = 'CFOP_RETORNO_EXTERNO'
      Origin = '"TBCFOP"."CFOP_RETORNO_EXTERNO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCFOP_CST_PADRAO_ENTRADA: TIBStringField
      FieldName = 'CFOP_CST_PADRAO_ENTRADA'
      Origin = '"TBCFOP"."CFOP_CST_PADRAO_ENTRADA"'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object IbDtstTabelaCFOP_CST_PADRAO_SAIDA: TIBStringField
      FieldName = 'CFOP_CST_PADRAO_SAIDA'
      Origin = '"TBCFOP"."CFOP_CST_PADRAO_SAIDA"'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object IbDtstTabelaCFOP_GERAR_TITULO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CFOP_GERAR_TITULO'
      Origin = '"TBCFOP"."CFOP_GERAR_TITULO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCFOP_GERAR_DUPLICATA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CFOP_GERAR_DUPLICATA'
      Origin = '"TBCFOP"."CFOP_GERAR_DUPLICATA"'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CFOP_COD,'
      '  CFOP_DESCRICAO,'
      '  CFOP_ESPECIFICACAO,'
      '  CFOP_INFORMACAO_FISCO,'
      '  CFOP_CST_PADRAO_ENTRADA,'
      '  CFOP_CST_PADRAO_SAIDA,'
      '  CFOP_DEVOLUCAO,'
      '  CFOP_REMESSA,'
      '  CFOP_RETORNO_INTERNO,'
      '  CFOP_RETORNO_EXTERNO,'
      '  CFOP_GERAR_TITULO,'
      '  CFOP_GERAR_DUPLICATA,'
      '  CFOP_ALTERA_CUSTO_PRODUTO'
      'from TBCFOP '
      'where'
      '  CFOP_COD = :CFOP_COD')
    ModifySQL.Strings = (
      'update TBCFOP'
      'set'
      '  CFOP_ALTERA_CUSTO_PRODUTO = :CFOP_ALTERA_CUSTO_PRODUTO,'
      '  CFOP_COD = :CFOP_COD,'
      '  CFOP_CST_PADRAO_ENTRADA = :CFOP_CST_PADRAO_ENTRADA,'
      '  CFOP_CST_PADRAO_SAIDA = :CFOP_CST_PADRAO_SAIDA,'
      '  CFOP_DESCRICAO = :CFOP_DESCRICAO,'
      '  CFOP_DEVOLUCAO = :CFOP_DEVOLUCAO,'
      '  CFOP_ESPECIFICACAO = :CFOP_ESPECIFICACAO,'
      '  CFOP_GERAR_DUPLICATA = :CFOP_GERAR_DUPLICATA,'
      '  CFOP_GERAR_TITULO = :CFOP_GERAR_TITULO,'
      '  CFOP_INFORMACAO_FISCO = :CFOP_INFORMACAO_FISCO,'
      '  CFOP_REMESSA = :CFOP_REMESSA,'
      '  CFOP_RETORNO_EXTERNO = :CFOP_RETORNO_EXTERNO,'
      '  CFOP_RETORNO_INTERNO = :CFOP_RETORNO_INTERNO'
      'where'
      '  CFOP_COD = :OLD_CFOP_COD')
    InsertSQL.Strings = (
      'insert into TBCFOP'
      
        '  (CFOP_ALTERA_CUSTO_PRODUTO, CFOP_COD, CFOP_CST_PADRAO_ENTRADA,' +
        ' CFOP_CST_PADRAO_SAIDA, '
      
        '   CFOP_DESCRICAO, CFOP_DEVOLUCAO, CFOP_ESPECIFICACAO, CFOP_GERA' +
        'R_DUPLICATA, '
      
        '   CFOP_GERAR_TITULO, CFOP_INFORMACAO_FISCO, CFOP_REMESSA, CFOP_' +
        'RETORNO_EXTERNO, '
      '   CFOP_RETORNO_INTERNO)'
      'values'
      
        '  (:CFOP_ALTERA_CUSTO_PRODUTO, :CFOP_COD, :CFOP_CST_PADRAO_ENTRA' +
        'DA, :CFOP_CST_PADRAO_SAIDA, '
      
        '   :CFOP_DESCRICAO, :CFOP_DEVOLUCAO, :CFOP_ESPECIFICACAO, :CFOP_' +
        'GERAR_DUPLICATA, '
      
        '   :CFOP_GERAR_TITULO, :CFOP_INFORMACAO_FISCO, :CFOP_REMESSA, :C' +
        'FOP_RETORNO_EXTERNO, '
      '   :CFOP_RETORNO_INTERNO)')
    DeleteSQL.Strings = (
      'delete from TBCFOP'
      'where'
      '  CFOP_COD = :OLD_CFOP_COD')
  end
  object QryCST: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    c.codigo'
      '  , c.descricao_full  as descricao'
      'from GET_CST_NORMAL c'
      'order by'
      '    c.descricao_full')
    Left = 380
    Top = 153
  end
  object DspCST: TDataSetProvider
    DataSet = QryCST
    Left = 412
    Top = 153
  end
  object CdsCST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCST'
    Left = 444
    Top = 153
  end
  object DtsCST: TDataSource
    DataSet = CdsCST
    Left = 476
    Top = 153
  end
end
