inherited ViewCotacaoCompraFornecedor: TViewCotacaoCompraFornecedor
  Left = 389
  BorderIcons = [biSystemMenu]
  BorderWidth = 4
  Caption = 'Cota'#231#227'o de Compra/Servi'#231'o'
  ClientHeight = 499
  ClientWidth = 754
  ExplicitWidth = 774
  ExplicitHeight = 545
  DesignSize = (
    754
    499)
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 121
    Width = 754
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 756
  end
  object Bevel2: TBevel
    Left = 0
    Top = 461
    Width = 754
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 423
    ExplicitWidth = 756
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 754
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
    ExplicitWidth = 750
    DesignSize = (
      754
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
      Width = 622
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
      ExplicitWidth = 618
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
    Width = 754
    Height = 336
    ActivePage = TbsFornecedor
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 750
    ExplicitHeight = 335
    object TbsFornecedor: TTabSheet
      Caption = '&Fornecedor'
      DesignSize = (
        746
        308)
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
        Width = 432
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
        ExplicitWidth = 428
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
        Width = 536
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
        ExplicitWidth = 532
      end
      object dbObservacoes: TDBMemo
        Left = 16
        Top = 152
        Width = 712
        Height = 139
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
        ExplicitWidth = 708
        ExplicitHeight = 138
      end
      object dbFornecedor: TJvDBComboEdit
        Left = 16
        Top = 21
        Width = 712
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
        ExplicitWidth = 708
      end
    end
    object TbsFornecedorItem: TTabSheet
      Caption = '&Itens'
      ImageIndex = 1
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 0
        Width = 746
        Height = 308
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
            Title.Caption = '# '
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTO'
            ReadOnly = True
            Title.Caption = 'Codigo '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o + Apresenta'#231#227'o '
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            ReadOnly = True
            Title.Caption = 'Quantidade '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            ReadOnly = True
            Title.Caption = 'Und. '
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_UNITARIO'
            Title.Caption = 'Valor Un. (R$) '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Valor Total (R$) '
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object BtnCarregarXLS: TcxButton
    Left = 0
    Top = 466
    Width = 92
    Height = 33
    Hint = 'Carregar/Processar Retorno XLS (Planilha em Excel)'
    Anchors = [akLeft, akBottom]
    Caption = '&Carregar'
    OptionsImage.ImageIndex = 24
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    Visible = False
    ExplicitTop = 465
  end
  object btnSalvar: TcxButton
    Left = 566
    Top = 466
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Salvar'
    OptionsImage.ImageIndex = 22
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    TabOrder = 3
    OnClick = btnSalvarClick
    ExplicitLeft = 562
    ExplicitTop = 465
  end
  object btFechar: TcxButton
    Left = 662
    Top = 466
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    OptionsImage.ImageIndex = 15
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    TabOrder = 4
    OnClick = btFecharClick
    ExplicitLeft = 658
    ExplicitTop = 465
  end
  object dtsFornecedor: TDataSource
    AutoEdit = False
    DataSet = qryFornecedorXXX
    OnStateChange = dtsFornecedorStateChange
    Left = 320
    Top = 16
  end
  object dtsFormaPagto: TDataSource
    Left = 632
  end
  object dtsCondicaoPagto: TDataSource
    Left = 664
  end
  object dtsItem: TDataSource
    AutoEdit = False
    DataSet = qryItemXXX
    OnStateChange = dtsFornecedorStateChange
    Left = 320
    Top = 48
  end
  object spSetCotacaoFornecedorItem: TFDStoredProc
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    StoredProcName = 'SET_COTACAO_COMPRAFORN_ITEM'
    Left = 400
    Top = 321
    ParamData = <
      item
        Position = 1
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Position = 4
        Name = 'FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryFornecedorXXX: TFDQuery
    BeforePost = qryFornecedorXXXBeforePost
    OnNewRecord = qryFornecedorXXXNewRecord
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updFornecedor
    SQL.Strings = (
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
    Left = 256
    Top = 16
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'FOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryFornecedorXXXANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFornecedorXXXCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFornecedorXXXEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 18
    end
    object qryFornecedorXXXFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFornecedorXXXNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Origin = 'NOME_CONTATO'
      Size = 60
    end
    object qryFornecedorXXXEMAIL_ENVIO: TStringField
      FieldName = 'EMAIL_ENVIO'
      Origin = 'EMAIL_ENVIO'
      Size = 100
    end
    object qryFornecedorXXXDATA_RESPOSTA: TDateField
      FieldName = 'DATA_RESPOSTA'
      Origin = 'DATA_RESPOSTA'
    end
    object qryFornecedorXXXFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object qryFornecedorXXXCONDICAO_PAGTO: TSmallintField
      FieldName = 'CONDICAO_PAGTO'
      Origin = 'CONDICAO_PAGTO'
    end
    object qryFornecedorXXXPRAZO_ENTREGA_DATA: TDateField
      FieldName = 'PRAZO_ENTREGA_DATA'
      Origin = 'PRAZO_ENTREGA_DATA'
    end
    object qryFornecedorXXXPRAZO_ENTREDA_DIA: TSmallintField
      FieldName = 'PRAZO_ENTREDA_DIA'
      Origin = 'PRAZO_ENTREDA_DIA'
    end
    object qryFornecedorXXXOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object qryFornecedorXXXATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
    end
    object qryFornecedorXXXUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 12
    end
    object qryFornecedorXXXVENCEDOR: TSmallintField
      FieldName = 'VENCEDOR'
      Origin = 'VENCEDOR'
    end
    object qryFornecedorXXXNOMEFORN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEFORN'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      Size = 100
    end
    object qryFornecedorXXXCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object qryFornecedorXXXEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = []
      Size = 40
    end
    object qryFornecedorXXXFORMA_PAGTO_DESC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'DESCRI'
      ProviderFlags = []
      Size = 30
    end
    object qryFornecedorXXXCONDICAP_PAGTO_DESC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONDICAP_PAGTO_DESC'
      Origin = 'COND_DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object qryFornecedorXXXNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
    end
    object qryFornecedorXXXDESCRICAO_RESUMO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_RESUMO'
      Origin = 'DESCRICAO_RESUMO'
      ProviderFlags = []
      Size = 100
    end
    object qryFornecedorXXXEMISSAO_DATA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSAO_DATA'
      Origin = 'EMISSAO_DATA'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryFornecedorXXXVALIDADE: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'VALIDADE'
      Origin = 'VALIDADE'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryFornecedorXXXVALOR_TOTAL_BRUTO: TFMTBCDField
      FieldName = 'VALOR_TOTAL_BRUTO'
      Origin = 'VALOR_TOTAL_BRUTO'
      Precision = 18
      Size = 2
    end
    object qryFornecedorXXXVALOR_TOTAL_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_TOTAL_DESCONTO'
      Origin = 'VALOR_TOTAL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryFornecedorXXXVALOR_TOTAL_LIQUIDO: TFMTBCDField
      FieldName = 'VALOR_TOTAL_LIQUIDO'
      Origin = 'VALOR_TOTAL_LIQUIDO'
      Precision = 18
      Size = 2
    end
  end
  object updFornecedor: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCOTACAO_COMPRAFORN'
      '(ANO, CODIGO, EMPRESA, FORNECEDOR, NOME_CONTATO, '
      '  EMAIL_ENVIO, FORMA_PAGTO, CONDICAO_PAGTO, '
      '  VALOR_TOTAL_BRUTO, VALOR_TOTAL_DESCONTO, VALOR_TOTAL_LIQUIDO, '
      '  VENCEDOR, DATA_RESPOSTA, PRAZO_ENTREGA_DATA, '
      '  PRAZO_ENTREDA_DIA, OBSERVACAO, ATIVO, USUARIO)'
      
        'VALUES (:NEW_ANO, :NEW_CODIGO, :NEW_EMPRESA, :NEW_FORNECEDOR, :N' +
        'EW_NOME_CONTATO, '
      '  :NEW_EMAIL_ENVIO, :NEW_FORMA_PAGTO, :NEW_CONDICAO_PAGTO, '
      
        '  :NEW_VALOR_TOTAL_BRUTO, :NEW_VALOR_TOTAL_DESCONTO, :NEW_VALOR_' +
        'TOTAL_LIQUIDO, '
      '  :NEW_VENCEDOR, :NEW_DATA_RESPOSTA, :NEW_PRAZO_ENTREGA_DATA, '
      
        '  :NEW_PRAZO_ENTREDA_DIA, :NEW_OBSERVACAO, :NEW_ATIVO, :NEW_USUA' +
        'RIO)')
    ModifySQL.Strings = (
      'UPDATE TBCOTACAO_COMPRAFORN'
      
        'SET ANO = :NEW_ANO, CODIGO = :NEW_CODIGO, EMPRESA = :NEW_EMPRESA' +
        ', '
      
        '  FORNECEDOR = :NEW_FORNECEDOR, NOME_CONTATO = :NEW_NOME_CONTATO' +
        ', '
      
        '  EMAIL_ENVIO = :NEW_EMAIL_ENVIO, FORMA_PAGTO = :NEW_FORMA_PAGTO' +
        ', '
      
        '  CONDICAO_PAGTO = :NEW_CONDICAO_PAGTO, VALOR_TOTAL_BRUTO = :NEW' +
        '_VALOR_TOTAL_BRUTO, '
      
        '  VALOR_TOTAL_DESCONTO = :NEW_VALOR_TOTAL_DESCONTO, VALOR_TOTAL_' +
        'LIQUIDO = :NEW_VALOR_TOTAL_LIQUIDO, '
      '  VENCEDOR = :NEW_VENCEDOR, DATA_RESPOSTA = :NEW_DATA_RESPOSTA, '
      
        '  PRAZO_ENTREGA_DATA = :NEW_PRAZO_ENTREGA_DATA, PRAZO_ENTREDA_DI' +
        'A = :NEW_PRAZO_ENTREDA_DIA, '
      
        '  OBSERVACAO = :NEW_OBSERVACAO, ATIVO = :NEW_ATIVO, USUARIO = :N' +
        'EW_USUARIO'
      
        'WHERE ANO = :OLD_ANO AND CODIGO = :OLD_CODIGO AND EMPRESA = :OLD' +
        '_EMPRESA AND '
      '  FORNECEDOR = :OLD_FORNECEDOR')
    DeleteSQL.Strings = (
      'DELETE FROM TBCOTACAO_COMPRAFORN'
      
        'WHERE ANO = :OLD_ANO AND CODIGO = :OLD_CODIGO AND EMPRESA = :OLD' +
        '_EMPRESA AND '
      '  FORNECEDOR = :OLD_FORNECEDOR')
    FetchRowSQL.Strings = (
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
      
        'WHERE c.ANO = :ANO AND c.CODIGO = :CODIGO AND c.EMPRESA = :EMPRE' +
        'SA AND c.FORNECEDOR = :FORNECEDOR')
    Left = 288
    Top = 16
  end
  object qryItemXXX: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updItem
    SQL.Strings = (
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
    Left = 256
    Top = 48
    ParamData = <
      item
        Name = 'FOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryItemXXXANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemXXXCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemXXXEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryItemXXXSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemXXXPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 10
    end
    object qryItemXXXUNIDADE: TSmallintField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
    object qryItemXXXDESCRI_APRESENTACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = 'DESCRI_APRESENTACAO'
      ProviderFlags = []
      Size = 100
    end
    object qryItemXXXUNP_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNP_DESCRICAO'
      Origin = 'UNP_DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object qryItemXXXUNP_SIGLA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNP_SIGLA'
      Origin = 'UNP_SIGLA'
      ProviderFlags = []
      Size = 5
    end
    object qryItemXXXFORNECEDOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      ProviderFlags = []
    end
    object qryItemXXXITEM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'ITEM'
      ProviderFlags = []
    end
    object qryItemXXXQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      Precision = 18
      Size = 3
    end
    object qryItemXXXVALOR_UNITARIO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryItemXXXVALOR_TOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object updItem: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    ModifySQL.Strings = (
      'UPDATE TBCOTACAO_COMPRAFORN_ITEM'
      
        'SET VALOR_UNITARIO = :NEW_VALOR_UNITARIO, VALOR_TOTAL = :NEW_VAL' +
        'OR_TOTAL'
      
        'WHERE ANO = :OLD_ANO AND CODIGO = :OLD_CODIGO AND EMPRESA = :OLD' +
        '_EMPRESA AND '
      '  FORNECEDOR = :OLD_FORNECEDOR AND ITEM = :OLD_ITEM'
      'RETURNING VALOR_TOTAL')
    FetchRowSQL.Strings = (
      
        'SELECT ANO, CODIGO, EMPRESA, FORNECEDOR, ITEM, VALOR_UNITARIO, V' +
        'ALOR_TOTAL'
      'FROM TBCOTACAO_COMPRAFORN_ITEM'
      
        'WHERE ANO = :ANO AND CODIGO = :CODIGO AND EMPRESA = :EMPRESA AND' +
        ' FORNECEDOR = :FORNECEDOR AND '
      '  ITEM = :ITEM')
    Left = 288
    Top = 48
  end
end
