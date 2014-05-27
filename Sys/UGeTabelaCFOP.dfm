inherited frmGeTabelaCFOP: TfrmGeTabelaCFOP
  Left = 554
  Top = 267
  Width = 744
  Height = 485
  ActiveControl = dbCodigo
  Caption = 'Tabela CFOP (C'#243'digo Fiscal de Opera'#231#245'es e Presta'#231#245'es)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 443
    Width = 728
  end
  inherited Bevel3: TBevel
    Top = 404
    Width = 728
  end
  inherited tlbBotoes: TToolBar
    Top = 408
    Width = 728
  end
  inherited pgcGuias: TPageControl
    Width = 728
    Height = 404
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 309
        Width = 720
      end
      inherited dbgDados: TDBGrid
        Width = 720
        Height = 309
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
        Top = 313
        Width = 720
        inherited grpBxFiltro: TGroupBox
          Left = 464
          inherited lbltFiltrar: TLabel
            Width = 31
            Caption = 'CFOP:'
          end
          inherited edtFiltrar: TEdit
            Left = 48
            Width = 155
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 225
        Width = 720
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 720
        Height = 225
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
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
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
          Height = 129
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
      end
      object GrpBxParametros: TGroupBox
        Left = 0
        Top = 229
        Width = 720
        Height = 146
        Align = alClient
        Caption = 'Par'#226'metros'
        TabOrder = 1
        object lblCSTEntrada: TLabel
          Left = 16
          Top = 48
          Width = 187
          Height = 13
          Caption = 'CST Padr'#227'o para Entrada de Produtos:'
          FocusControl = dbCSTEntrada
        end
        object lblCSTSaida: TLabel
          Left = 16
          Top = 88
          Width = 175
          Height = 13
          Caption = 'CST Padr'#227'o para Sa'#237'da de Produtos:'
          FocusControl = dbCSTSaida
        end
        object dbCustoOperacional: TDBCheckBox
          Left = 16
          Top = 24
          Width = 265
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
          Left = 16
          Top = 64
          Width = 689
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
          TabOrder = 1
        end
        object dbCSTSaida: TDBLookupComboBox
          Left = 16
          Top = 104
          Width = 689
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
          TabOrder = 2
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    c.Cfop_cod'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      '  , c.Cfop_altera_custo_produto'
      '  , c.Cfop_cst_padrao_entrada'
      '  , c.Cfop_cst_padrao_saida'
      'from TBCFOP c')
    object IbDtstTabelaCFOP_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CFOP_COD'
      Origin = 'TBCFOP.CFOP_COD'
      Required = True
    end
    object IbDtstTabelaCFOP_DESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'TBCFOP.CFOP_DESCRICAO'
      Size = 250
    end
    object IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldName = 'CFOP_ESPECIFICACAO'
      Origin = 'TBCFOP.CFOP_ESPECIFICACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'CFOP_ALTERA_CUSTO_PRODUTO'
      Origin = '"TBCFOP"."CFOP_ALTERA_CUSTO_PRODUTO"'
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
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CFOP_COD,'
      '  CFOP_DESCRICAO,'
      '  CFOP_ESPECIFICACAO,'
      '  CFOP_ALTERA_CUSTO_PRODUTO,'
      '  CFOP_CST_PADRAO_ENTRADA,'
      '  CFOP_CST_PADRAO_SAIDA'
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
      '  CFOP_ESPECIFICACAO = :CFOP_ESPECIFICACAO'
      'where'
      '  CFOP_COD = :OLD_CFOP_COD')
    InsertSQL.Strings = (
      'insert into TBCFOP'
      
        '  (CFOP_ALTERA_CUSTO_PRODUTO, CFOP_COD, CFOP_CST_PADRAO_ENTRADA,' +
        ' CFOP_CST_PADRAO_SAIDA, '
      '   CFOP_DESCRICAO, CFOP_ESPECIFICACAO)'
      'values'
      
        '  (:CFOP_ALTERA_CUSTO_PRODUTO, :CFOP_COD, :CFOP_CST_PADRAO_ENTRA' +
        'DA, :CFOP_CST_PADRAO_SAIDA, '
      '   :CFOP_DESCRICAO, :CFOP_ESPECIFICACAO)')
    DeleteSQL.Strings = (
      'delete from TBCFOP'
      'where'
      '  CFOP_COD = :OLD_CFOP_COD')
  end
  object QryCST: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
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
