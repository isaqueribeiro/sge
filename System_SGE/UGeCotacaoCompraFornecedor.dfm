inherited frmGeCotacaoCompraFornecedor: TfrmGeCotacaoCompraFornecedor
  Left = 389
  BorderIcons = [biSystemMenu]
  BorderWidth = 4
  Caption = 'Cota'#231#227'o de Compra/Servi'#231'o'
  ClientHeight = 461
  ClientWidth = 756
  ExplicitWidth = 780
  ExplicitHeight = 508
  DesignSize = (
    756
    461)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 121
    Width = 756
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 423
    Width = 756
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 756
    Height = 121
    Align = alTop
    Caption = 'Controle da Cota'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      756
      121)
    object lblCodigo: TLabel
      Left = 16
      Top = 24
      Width = 69
      Height = 13
      Caption = 'No. Cota'#231#227'o:'
      FocusControl = dbCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricaoResumo: TLabel
      Left = 112
      Top = 24
      Width = 104
      Height = 13
      Caption = 'Descri'#231#227'o resumo:'
      FocusControl = dbDescricaoResumo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEmissao: TLabel
      Left = 15
      Top = 64
      Width = 49
      Height = 13
      Caption = 'Emiss'#227'o:'
      FocusControl = dbEmissao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValidade: TLabel
      Left = 112
      Top = 64
      Width = 51
      Height = 13
      Caption = 'Validade:'
      FocusControl = dbValidade
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataResposta: TLabel
      Left = 208
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Data Resp.:'
      FocusControl = dbDataResposta
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NUMERO'
      DataSource = dtsFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbDescricaoResumo: TDBEdit
      Left = 112
      Top = 40
      Width = 628
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clMoneyGreen
      DataField = 'DESCRICAO_RESUMO'
      DataSource = dtsFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbEmissao: TDBEdit
      Left = 16
      Top = 80
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'EMISSAO_DATA'
      DataSource = dtsFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbValidade: TDBEdit
      Left = 112
      Top = 80
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'VALIDADE'
      DataSource = dtsFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbDataResposta: TJvDBDateEdit
      Left = 208
      Top = 80
      Width = 121
      Height = 21
      DataField = 'DATA_RESPOSTA'
      DataSource = dtsFornecedor
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
        0000800000008000000000000000800000000000000000000000800000008080
        8000FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
        0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
        80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
        C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      ImageKind = ikCustom
      NumGlyphs = 2
      ParentFont = False
      PopupColor = clBtnFace
      ShowNullDate = False
      TabOrder = 4
    end
  end
  object PgcResposta: TPageControl
    Left = 0
    Top = 125
    Width = 756
    Height = 298
    ActivePage = TbsFornecedor
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object TbsFornecedor: TTabSheet
      Caption = '&Fornecedor'
      DesignSize = (
        748
        270)
      object lblFornecedor: TLabel
        Left = 16
        Top = 8
        Width = 59
        Height = 13
        Caption = 'Fornecedor:'
        FocusControl = dbFornecedor
      end
      object lblNomeContato: TLabel
        Left = 16
        Top = 48
        Width = 130
        Height = 13
        Caption = 'Nome Contato (Vendedor):'
        FocusControl = dbNomeContato
      end
      object lblEmail: TLabel
        Left = 296
        Top = 48
        Width = 32
        Height = 13
        Caption = 'E-mail:'
        FocusControl = dbEmail
      end
      object lblFormaPagto: TLabel
        Left = 16
        Top = 91
        Width = 106
        Height = 13
        Caption = 'Forma de Pagamento:'
        FocusControl = dbFormaPagto
      end
      object lblCondicaoPagto: TLabel
        Left = 192
        Top = 91
        Width = 120
        Height = 13
        Caption = 'Condi'#231#227'o de Pagamento:'
        FocusControl = dbCondicaoPagto
      end
      object lblObservacoes: TLabel
        Left = 16
        Top = 136
        Width = 67
        Height = 13
        Caption = 'Observa'#231#245'es:'
        FocusControl = dbObservacoes
      end
      object dbNomeContato: TDBEdit
        Left = 16
        Top = 64
        Width = 273
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_CONTATO'
        DataSource = dtsFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dbEmail: TDBEdit
        Left = 296
        Top = 64
        Width = 438
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecLowerCase
        DataField = 'EMAIL_ENVIO'
        DataSource = dtsFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object dbFormaPagto: TDBLookupComboBox
        Left = 16
        Top = 107
        Width = 169
        Height = 21
        DataField = 'FORMA_PAGTO'
        DataSource = dtsFornecedor
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'COD'
        ListField = 'DESCRI'
        ListSource = dtsFormaPagto
        ParentFont = False
        TabOrder = 3
      end
      object dbCondicaoPagto: TDBLookupComboBox
        Left = 192
        Top = 107
        Width = 369
        Height = 21
        DataField = 'CONDICAO_PAGTO'
        DataSource = dtsFornecedor
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'COND_COD'
        ListField = 'COND_DESCRICAO'
        ListSource = dtsCondicaoPagto
        ParentFont = False
        TabOrder = 4
      end
      object dbObservacoes: TDBMemo
        Left = 16
        Top = 152
        Width = 718
        Height = 101
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataField = 'OBSERVACAO'
        DataSource = dtsFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 5
      end
      object dbFornecedor: TJvDBComboEdit
        Left = 16
        Top = 24
        Width = 718
        Height = 21
        ButtonHint = 'Pesquisar Fornecedor (Ctrl+P)'
        CharCase = ecUpperCase
        ClickKey = 16464
        Color = clMoneyGreen
        DataField = 'NOMEFORN'
        DataSource = dtsFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000000000000000000000000000000000001DE6B51DE6B5
          1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
          AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
          6048306048306048306048306048306048306048306048306048305048403050
          604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
          FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
          D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
          FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
          E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
          7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
          FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
          B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
          7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
          FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
          8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
          FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
          5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
          FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
          6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
          FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
          951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
          FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
          7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
          FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
          7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
          E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
          1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        OnButtonClick = dbFornecedorButtonClick
      end
    end
    object TbsFornecedorItem: TTabSheet
      Caption = '&Itens'
      ImageIndex = 1
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 0
        Width = 748
        Height = 270
        Align = alClient
        DataSource = dtsItem
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgProdutosDrawColumnCell
        OnEnter = dbgProdutosEnter
        OnExit = dbgProdutosExit
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEM'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = '#'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTO'
            ReadOnly = True
            Title.Caption = 'Codigo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o + Apresenta'#231#227'o'
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            ReadOnly = True
            Title.Caption = 'Quantidade'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            ReadOnly = True
            Title.Caption = 'Und.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_UNITARIO'
            Title.Caption = 'Valor Un. (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Valor Total (R$)'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object BtnCarregarXLS: TcxButton
    Left = 0
    Top = 428
    Width = 92
    Height = 33
    Hint = 'Carregar/Processar Retorno XLS (Planilha em Excel)'
    Anchors = [akLeft, akBottom]
    Caption = '&Carregar'
    OptionsImage.ImageIndex = 24
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
  end
  object btnSalvar: TcxButton
    Left = 567
    Top = 428
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Salvar'
    OptionsImage.ImageIndex = 22
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btFechar: TcxButton
    Left = 663
    Top = 428
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    OptionsImage.ImageIndex = 15
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    TabOrder = 2
    OnClick = btFecharClick
  end
  object qryFornecedor: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BeforePost = qryFornecedorBeforePost
    OnNewRecord = qryFornecedorNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codigo'
      '  , c.empresa'
      '  , c.fornecedor'
      '  , c.nome_contato'
      '  , c.email_envio'
      '  , c.data_resposta'
      '  , c.forma_pagto'
      '  , c.condicao_pagto'
      '  , c.prazo_entrega_data'
      '  , c.prazo_entreda_dia'
      '  , c.observacao'
      '  , c.ativo'
      '  , c.usuario'
      '  , c.valor_total_bruto'
      '  , c.valor_total_desconto'
      '  , c.valor_total_liquido'
      '  , c.vencedor'
      '  , f.nomeforn'
      '  , f.cnpj'
      '  , f.email'
      '  , fp.descri as forma_pagto_desc'
      '  , cp.cond_descricao as condicap_pagto_desc'
      '  , x.numero'
      '  , x.descricao_resumo'
      '  , x.emissao_data'
      '  , x.validade'
      'from TBCOTACAO_COMPRAFORN c'
      
        '  inner join TBCOTACAO_COMPRA x on (x.ano = c.ano and x.codigo =' +
        ' c.codigo and x.empresa = c.empresa)'
      ''
      '  left join TBFORNECEDOR f on (f.codforn = c.fornecedor)'
      '  left join TBFORMPAGTO fp on (fp.cod = c.forma_pagto)'
      
        '  left join VW_CONDICAOPAGTO cp on (cp.cond_cod = c.condicao_pag' +
        'to)'
      ''
      'where c.ano        = :ano'
      '  and c.codigo     = :cod'
      '  and c.fornecedor = :for')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updFornecedor
    Left = 256
    Top = 16
    object qryFornecedorANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBCOTACAO_COMPRAFORN"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFornecedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TBCOTACAO_COMPRAFORN"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFornecedorEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBCOTACAO_COMPRAFORN"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryFornecedorFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = '"TBCOTACAO_COMPRAFORN"."FORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFornecedorNOME_CONTATO: TIBStringField
      FieldName = 'NOME_CONTATO'
      Origin = '"TBCOTACAO_COMPRAFORN"."NOME_CONTATO"'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qryFornecedorEMAIL_ENVIO: TIBStringField
      FieldName = 'EMAIL_ENVIO'
      Origin = '"TBCOTACAO_COMPRAFORN"."EMAIL_ENVIO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryFornecedorDATA_RESPOSTA: TDateField
      FieldName = 'DATA_RESPOSTA'
      Origin = '"TBCOTACAO_COMPRAFORN"."DATA_RESPOSTA"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."FORMA_PAGTO"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorCONDICAO_PAGTO: TSmallintField
      FieldName = 'CONDICAO_PAGTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."CONDICAO_PAGTO"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorVALOR_TOTAL_BRUTO: TIBBCDField
      FieldName = 'VALOR_TOTAL_BRUTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."VALOR_TOTAL_BRUTO"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryFornecedorVALOR_TOTAL_DESCONTO: TIBBCDField
      FieldName = 'VALOR_TOTAL_DESCONTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."VALOR_TOTAL_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryFornecedorVALOR_TOTAL_LIQUIDO: TIBBCDField
      FieldName = 'VALOR_TOTAL_LIQUIDO'
      Origin = '"TBCOTACAO_COMPRAFORN"."VALOR_TOTAL_LIQUIDO"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryFornecedorVENCEDOR: TSmallintField
      FieldName = 'VENCEDOR'
      Origin = '"TBCOTACAO_COMPRAFORN"."VENCEDOR"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryFornecedorPRAZO_ENTREGA_DATA: TDateField
      FieldName = 'PRAZO_ENTREGA_DATA'
      Origin = '"TBCOTACAO_COMPRAFORN"."PRAZO_ENTREGA_DATA"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorPRAZO_ENTREDA_DIA: TSmallintField
      FieldName = 'PRAZO_ENTREDA_DIA'
      Origin = '"TBCOTACAO_COMPRAFORN"."PRAZO_ENTREDA_DIA"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = '"TBCOTACAO_COMPRAFORN"."OBSERVACAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryFornecedorATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = '"TBCOTACAO_COMPRAFORN"."ATIVO"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBCOTACAO_COMPRAFORN"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object qryFornecedorNOMEFORN: TIBStringField
      FieldName = 'NOMEFORN'
      Origin = '"TBFORNECEDOR"."NOMEFORN"'
      ProviderFlags = []
      Size = 100
    end
    object qryFornecedorCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"TBFORNECEDOR"."CNPJ"'
      ProviderFlags = []
      Size = 18
    end
    object qryFornecedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"TBFORNECEDOR"."EMAIL"'
      ProviderFlags = []
      Size = 40
    end
    object qryFornecedorFORMA_PAGTO_DESC: TIBStringField
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = '"TBFORMPAGTO"."DESCRI"'
      ProviderFlags = []
      Size = 30
    end
    object qryFornecedorCONDICAP_PAGTO_DESC: TIBStringField
      FieldName = 'CONDICAP_PAGTO_DESC'
      Origin = '"VW_CONDICAOPAGTO"."COND_DESCRICAO"'
      ProviderFlags = []
      Size = 80
    end
    object qryFornecedorNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"TBCOTACAO_COMPRA"."NUMERO"'
      ProviderFlags = []
      Required = True
    end
    object qryFornecedorDESCRICAO_RESUMO: TIBStringField
      FieldName = 'DESCRICAO_RESUMO'
      Origin = '"TBCOTACAO_COMPRA"."DESCRICAO_RESUMO"'
      ProviderFlags = []
      Size = 100
    end
    object qryFornecedorEMISSAO_DATA: TDateField
      FieldName = 'EMISSAO_DATA'
      Origin = '"TBCOTACAO_COMPRA"."EMISSAO_DATA"'
      ProviderFlags = []
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryFornecedorVALIDADE: TDateField
      FieldName = 'VALIDADE'
      Origin = '"TBCOTACAO_COMPRA"."VALIDADE"'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object updFornecedor: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODIGO,'
      '  EMPRESA,'
      '  FORNECEDOR,'
      '  NOME_CONTATO,'
      '  EMAIL_ENVIO,'
      '  FORMA_PAGTO,'
      '  CONDICAO_PAGTO,'
      '  VALOR_TOTAL_BRUTO,'
      '  VALOR_TOTAL_DESCONTO,'
      '  VALOR_TOTAL_LIQUIDO,'
      '  VENCEDOR,'
      '  DATA_RESPOSTA,'
      '  PRAZO_ENTREGA_DATA,'
      '  PRAZO_ENTREDA_DIA,'
      '  OBSERVACAO,'
      '  ATIVO,'
      '  USUARIO'
      'from TBCOTACAO_COMPRAFORN '
      'where'
      '  ANO = :ANO and'
      '  CODIGO = :CODIGO and'
      '  EMPRESA = :EMPRESA and'
      '  FORNECEDOR = :FORNECEDOR')
    ModifySQL.Strings = (
      'update TBCOTACAO_COMPRAFORN'
      'set'
      '  ANO = :ANO,'
      '  ATIVO = :ATIVO,'
      '  CODIGO = :CODIGO,'
      '  CONDICAO_PAGTO = :CONDICAO_PAGTO,'
      '  DATA_RESPOSTA = :DATA_RESPOSTA,'
      '  EMAIL_ENVIO = :EMAIL_ENVIO,'
      '  EMPRESA = :EMPRESA,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  NOME_CONTATO = :NOME_CONTATO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  PRAZO_ENTREDA_DIA = :PRAZO_ENTREDA_DIA,'
      '  PRAZO_ENTREGA_DATA = :PRAZO_ENTREGA_DATA,'
      '  USUARIO = :USUARIO,'
      '  VALOR_TOTAL_BRUTO = :VALOR_TOTAL_BRUTO,'
      '  VALOR_TOTAL_DESCONTO = :VALOR_TOTAL_DESCONTO,'
      '  VALOR_TOTAL_LIQUIDO = :VALOR_TOTAL_LIQUIDO,'
      '  VENCEDOR = :VENCEDOR'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  FORNECEDOR = :OLD_FORNECEDOR')
    InsertSQL.Strings = (
      'insert into TBCOTACAO_COMPRAFORN'
      
        '  (ANO, ATIVO, CODIGO, CONDICAO_PAGTO, DATA_RESPOSTA, EMAIL_ENVI' +
        'O, EMPRESA, '
      
        '   FORMA_PAGTO, FORNECEDOR, NOME_CONTATO, OBSERVACAO, PRAZO_ENTR' +
        'EDA_DIA, '
      
        '   PRAZO_ENTREGA_DATA, USUARIO, VALOR_TOTAL_BRUTO, VALOR_TOTAL_D' +
        'ESCONTO, '
      '   VALOR_TOTAL_LIQUIDO, VENCEDOR)'
      'values'
      
        '  (:ANO, :ATIVO, :CODIGO, :CONDICAO_PAGTO, :DATA_RESPOSTA, :EMAI' +
        'L_ENVIO, '
      
        '   :EMPRESA, :FORMA_PAGTO, :FORNECEDOR, :NOME_CONTATO, :OBSERVAC' +
        'AO, :PRAZO_ENTREDA_DIA, '
      
        '   :PRAZO_ENTREGA_DATA, :USUARIO, :VALOR_TOTAL_BRUTO, :VALOR_TOT' +
        'AL_DESCONTO, '
      '   :VALOR_TOTAL_LIQUIDO, :VENCEDOR)')
    DeleteSQL.Strings = (
      'delete from TBCOTACAO_COMPRAFORN'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  FORNECEDOR = :OLD_FORNECEDOR')
    Left = 288
    Top = 16
  end
  object dtsFornecedor: TDataSource
    AutoEdit = False
    DataSet = qryFornecedor
    OnStateChange = dtsFornecedorStateChange
    Left = 320
    Top = 16
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCRI'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ACRESCIMO'
        DataType = ftFloat
      end
      item
        Name = 'CONTA_CORRENTE'
        DataType = ftInteger
      end
      item
        Name = 'DEBITAR_LIMITE_CLIENTE'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_TBFORMPAGTO'
        Fields = 'COD'
        Options = [ixUnique]
      end
      item
        Name = 'FK_TBFORMPAGTO_CCORRENTE'
        Fields = 'CONTA_CORRENTE'
      end>
    StoreDefs = True
    TableName = 'TBFORMPAGTO'
    UniDirectional = False
    Left = 432
    Top = 32
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 464
    Top = 32
  end
  object tblCondicaoPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VW_CONDICAOPAGTO'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 432
    Top = 64
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = tblCondicaoPagto
    Left = 464
    Top = 64
  end
  object qryItem: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BeforePost = qryItemBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select'
      '    ci.ano'
      '  , ci.codigo'
      '  , ci.empresa'
      '  , ci.seq'
      '  , ci.produto'
      '  , ci.quantidade'
      '  , ci.unidade'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      '  , i.fornecedor'
      '  , i.item'
      '  , i.valor_unitario'
      '  , i.valor_total'
      'from TBCOTACAO_COMPRAITEM ci'
      '  left join TBPRODUTO p on (p.cod = ci.produto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = ci.unidade)'
      
        '  left join TBCOTACAO_COMPRAFORN_ITEM i on (i.ano = ci.ano and i' +
        '.codigo = ci.codigo and i.empresa = ci.empresa and i.item = ci.s' +
        'eq and i.fornecedor = :for)'
      ''
      'where ci.ano        = :ano'
      '  and ci.codigo     = :cod')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updItem
    Left = 256
    Top = 48
    object qryItemANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBCOTACAO_COMPRAITEM"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TBCOTACAO_COMPRAITEM"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBCOTACAO_COMPRAITEM"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryItemSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = '"TBCOTACAO_COMPRAITEM"."SEQ"'
      ProviderFlags = []
    end
    object qryItemPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = '"TBCOTACAO_COMPRAITEM"."PRODUTO"'
      ProviderFlags = []
      Size = 10
    end
    object qryItemQUANTIDADE: TIBBCDField
      FieldName = 'QUANTIDADE'
      Origin = '"TBCOTACAO_COMPRAITEM"."QUANTIDADE"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qryItemUNIDADE: TSmallintField
      FieldName = 'UNIDADE'
      Origin = '"TBCOTACAO_COMPRAITEM"."UNIDADE"'
      ProviderFlags = []
    end
    object qryItemDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = '"TBPRODUTO"."DESCRI_APRESENTACAO"'
      ProviderFlags = []
      Size = 100
    end
    object qryItemUNP_DESCRICAO: TIBStringField
      FieldName = 'UNP_DESCRICAO'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
    object qryItemUNP_SIGLA: TIBStringField
      FieldName = 'UNP_SIGLA'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      ProviderFlags = []
      Size = 5
    end
    object qryItemFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = '"TBCOTACAO_COMPRAFORN_ITEM"."FORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItemITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = '"TBCOTACAO_COMPRAFORN_ITEM"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItemVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"TBCOTACAO_COMPRAFORN_ITEM"."VALOR_UNITARIO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"TBCOTACAO_COMPRAFORN_ITEM"."VALOR_TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object updItem: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODIGO,'
      '  EMPRESA,'
      '  FORNECEDOR,'
      '  ITEM,'
      '  VALOR_UNITARIO,'
      '  VALOR_TOTAL'
      'from TBCOTACAO_COMPRAFORN_ITEM '
      'where'
      '  ANO = :ANO and'
      '  CODIGO = :CODIGO and'
      '  EMPRESA = :EMPRESA and'
      '  FORNECEDOR = :FORNECEDOR and'
      '  ITEM = :ITEM')
    ModifySQL.Strings = (
      'update TBCOTACAO_COMPRAFORN_ITEM'
      'set'
      '  ANO = :ANO,'
      '  CODIGO = :CODIGO,'
      '  EMPRESA = :EMPRESA,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  ITEM = :ITEM,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  FORNECEDOR = :OLD_FORNECEDOR and'
      '  ITEM = :OLD_ITEM')
    Left = 288
    Top = 48
  end
  object dtsItem: TDataSource
    AutoEdit = False
    DataSet = qryItem
    OnStateChange = dtsFornecedorStateChange
    Left = 320
    Top = 48
  end
  object stpSetCotacaoFornecedorItem: TIBStoredProc
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    StoredProcName = 'SET_COTACAO_COMPRAFORN_ITEM'
    Left = 240
    Top = 320
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FORNECEDOR'
        ParamType = ptInput
      end>
  end
end
