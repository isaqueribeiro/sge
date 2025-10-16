inherited ViewCotacaoCompraFornecedor: TViewCotacaoCompraFornecedor
  Left = 389
  BorderIcons = [biSystemMenu]
  BorderWidth = 4
  Caption = 'Cota'#231#227'o de Compra/Servi'#231'o'
  ClientHeight = 498
  ClientWidth = 750
  ExplicitWidth = 774
  ExplicitHeight = 545
  DesignSize = (
    750
    498)
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 121
    Width = 750
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 756
  end
  object Bevel2: TBevel
    Left = 0
    Top = 460
    Width = 750
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 423
    ExplicitWidth = 756
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 750
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
      750
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
      Width = 614
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
    Width = 750
    Height = 335
    ActivePage = TbsFornecedor
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TbsFornecedor: TTabSheet
      Caption = '&Fornecedor'
      DesignSize = (
        742
        307)
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
        Width = 424
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
        Width = 528
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
        Width = 704
        Height = 138
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
      end
      object dbFornecedor: TJvDBComboEdit
        Left = 16
        Top = 21
        Width = 704
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
    Top = 465
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
  end
  object btnSalvar: TcxButton
    Left = 558
    Top = 465
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Salvar'
    OptionsImage.ImageIndex = 22
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    TabOrder = 3
    OnClick = btnSalvarClick
    ExplicitLeft = 562
  end
  object btFechar: TcxButton
    Left = 654
    Top = 465
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
  end
  object dtsFornecedor: TDataSource
    AutoEdit = False
    OnStateChange = dtsFornecedorStateChange
    Left = 384
  end
  object dtsFormaPagto: TDataSource
    Left = 632
  end
  object dtsCondicaoPagto: TDataSource
    Left = 664
  end
  object dtsItem: TDataSource
    AutoEdit = False
    OnStateChange = dtsFornecedorStateChange
    Left = 416
  end
end
