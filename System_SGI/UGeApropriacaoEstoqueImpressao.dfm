inherited frmGeApropriacaoEstoqueImpressao: TfrmGeApropriacaoEstoqueImpressao
  Left = 410
  Top = 229
  Caption = 'Relat'#243'rios de Apropria'#231#227'o de Estoque'
  ClientHeight = 328
  ClientWidth = 562
  ExplicitWidth = 574
  ExplicitHeight = 366
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 324
    Width = 562
    ExplicitTop = 324
    ExplicitWidth = 562
  end
  inherited Bevel3: TBevel
    Top = 285
    Width = 562
    ExplicitTop = 285
    ExplicitWidth = 562
  end
  inherited pnlBanner: TPanel
    Height = 285
    ExplicitHeight = 284
    inherited imgBanner: TImage
      Height = 285
      ExplicitHeight = 285
    end
  end
  inherited pnlRelatorio: TPanel
    Width = 465
    Height = 285
    ExplicitWidth = 461
    ExplicitHeight = 284
    inherited Bevel4: TBevel
      Width = 457
      ExplicitWidth = 457
    end
    inherited GrpBxRelatorio: TGroupBox
      Width = 457
      ExplicitWidth = 453
      DesignSize = (
        457
        69)
      inherited edRelatorio: TComboBox
        Width = 423
        Items.Strings = (
          'Estoque Apropriado por Centro de Custo (Sint'#233'tico)'
          'Estoque Apropriado por Centro de Custo (Anal'#237'tico)'
          'Estoque Apropriado por Produtos'
          'Relat'#243'rio Geral de Apropria'#231#227'o por Tipo (Sint'#233'tico)'
          'Relat'#243'rio Geral de Apropria'#231#227'o por Tipo (Anal'#237'tico)'
          'Rela'#231#227'o de Produtos nas Apropria'#231#245'es de Estoque'
          'Extrado de Movimenta'#231#227'o do Produto')
        ExplicitWidth = 419
      end
    end
    inherited GrpBxFiltro: TGroupBox
      Width = 457
      Height = 204
      ExplicitWidth = 453
      ExplicitHeight = 203
      object lblEmpresa: TLabel
        Left = 55
        Top = 28
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Empresa:'
        FocusControl = edEmpresa
      end
      object lblData: TLabel
        Left = 61
        Top = 123
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo:'
        Enabled = False
        FocusControl = e1Data
      end
      object lblSituacao: TLabel
        Left = 55
        Top = 148
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        Enabled = False
        FocusControl = edSituacao
      end
      object lblCentroCusto: TLabel
        Left = 14
        Top = 52
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = 'Centro de Custo:'
        FocusControl = edCentroCusto
      end
      object lblTipoApropriacao: TLabel
        Left = 80
        Top = 172
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo:'
        Enabled = False
        FocusControl = edTipoApropriacao
      end
      object lblGrupo: TLabel
        Left = 70
        Top = 76
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo:'
        FocusControl = edGrupo
      end
      object lblFabricante: TLabel
        Left = 44
        Top = 100
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fabricante:'
        FocusControl = edFabricante
      end
      object lblProduto: TLabel
        Left = 59
        Top = 148
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Produto:'
        FocusControl = edProduto
        Visible = False
      end
      object edEmpresa: TComboBox
        Left = 112
        Top = 24
        Width = 329
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = edEmpresaChange
      end
      object edSituacao: TComboBox
        Left = 112
        Top = 144
        Width = 329
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemIndex = 2
        TabOrder = 6
        Text = 'Encerrada'
        Items.Strings = (
          '(Todas)'
          'Aberta'
          'Encerrada'
          'Cancelada')
      end
      object edCentroCusto: TComboBox
        Left = 112
        Top = 48
        Width = 329
        Height = 21
        Style = csDropDownList
        TabOrder = 1
      end
      object edTipoApropriacao: TComboBox
        Left = 112
        Top = 168
        Width = 329
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemIndex = 0
        TabOrder = 7
        Text = '(Todas)'
        Items.Strings = (
          '(Todas)'
          'Apropria'#231#227'o Geral'
          'Apropria'#231#227'o Por Entrada'
          'Apropria'#231#227'o Por Autoriza'#231#227'o')
      end
      object edGrupo: TComboBox
        Left = 112
        Top = 72
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        ItemIndex = 0
        TabOrder = 2
        Text = '(TODOS)'
        Items.Strings = (
          '(TODOS)'
          'PESSOA F'#205'SICA'
          'PESSOA JUR'#205'DICA')
      end
      object edFabricante: TComboBox
        Left = 112
        Top = 96
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        ItemIndex = 0
        TabOrder = 3
        Text = '(TODOS)'
        Items.Strings = (
          '(TODOS)'
          'PESSOA F'#205'SICA'
          'PESSOA JUR'#205'DICA')
      end
      object e1Data: TJvDateEdit
        Left = 112
        Top = 119
        Width = 98
        Height = 21
        Date = 40909.000000000000000000
        Enabled = False
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
        PopupColor = clBtnFace
        ShowNullDate = False
        TabOrder = 4
      end
      object e2Data: TJvDateEdit
        Left = 216
        Top = 119
        Width = 103
        Height = 21
        Date = 40909.000000000000000000
        Enabled = False
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
        PopupColor = clBtnFace
        ShowNullDate = False
        TabOrder = 5
      end
      object edProduto: TJvComboEdit
        Left = 112
        Top = 144
        Width = 329
        Height = 21
        ButtonHint = 'Pesquisar Produto (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
        ClickKey = 16464
        Color = clMoneyGreen
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
        NumGlyphs = 2
        TabOrder = 8
        Text = ''
        Visible = False
        OnButtonClick = edProdutoButtonClick
        OnKeyPress = edProdutoKeyPress
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 289
    Width = 562
    ExplicitTop = 288
    ExplicitWidth = 558
  end
  object FrRelacaoEstoqueAprop: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 41557.397184305600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Top = 40
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoEstoqueAprop
        DataSetName = 'FrdsRelacaoEstoqueAprop'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'TESTE'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 933.543910000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."HOME_PAGE"][IIF(Trim(<frdEmpresa."HOME_PAGE">)='#39#39',<' +
              'frdEmpresa."EMAIL">,IIF(Trim(<frdEmpresa."EMAIL">)='#39#39','#39#39','#39' / '#39'+<' +
              'frdEmpresa."EMAIL">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 650.079160000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 910.866730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 910.866730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderEmpresa: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEstoqueAprop."EMPRESA_CNPJ"'
        ReprintOnNewPage = True
        StartNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 990.236860000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            
              ' [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoEstoqueApro' +
              'p."EMPRESA_CNPJ">)] - [FrdsRelacaoEstoqueAprop."EMPRESA_RAZAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            ' Empresa')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 374.173470000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoEstoqueAprop
        DataSetName = 'FrdsRelacaoEstoqueAprop'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 820.158010000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueAprop."COD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueAprop."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueAprop."FABRICANTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueAprop."MODELO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueAprop."UNIDADE_CONSUMO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 706.772110000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE_INT' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 771.024120000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueAprop."UNIDADE_COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueAprop."SECAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 933.543910000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE_CUS' +
              'TO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 510.236550000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Width = 910.866730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            
              ' [COUNT(BndMasterData)] produto(s) relacionado(s) para a empresa' +
              ' [FrdsRelacaoEstoqueAprop."EMPRESA_RAZAO"].')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE' +
              '_CUSTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderGrupo: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 294.803340000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEstoqueAprop."GRUPO_COD"'
        ReprintOnNewPage = True
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 820.158010000000000000
          Top = 37.795300000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' C'#243'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Top = 18.897650000000000000
          Width = 321.260050000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Descri'#231#227'o / Apresenta'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Fabricante')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 990.236860000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueAprop."GRUPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Grupo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Top = 37.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Unid.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 820.158010000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Estoque Fracionado')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 706.772110000000000000
          Top = 18.897650000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Estoque Inteiro')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 706.772110000000000000
          Top = 37.795300000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Modelo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 18.897650000000000000
          Width = 117.165430000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Se'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 771.024120000000000000
          Top = 37.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Unid.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 933.543910000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Total '
            'Apropriado (R$)')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterGrupo: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 415.748300000000000000
        Width = 1046.929810000000000000
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Width = 910.866730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            
              ' [COUNT(BndMasterData)] produto(s) relacionado(s) para o grupo [' +
              'FrdsRelacaoEstoqueAprop."GRUPO_DESC"].')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE' +
              '_CUSTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 593.386210000000000000
        Width = 1046.929810000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 1046.929810000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Produto(s) sem apropria'#231#227'o de estoque')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 910.866730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [COUNT(BndMasterData, 2)] produto(s) relacionado(s).')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE' +
              '_CUSTO">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderCentroCusto: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEstoqueAprop."CENTRO_CUSTO"'
        ReprintOnNewPage = True
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            ' C. Custo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 990.236860000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueAprop."CENTRO_CUSTO_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCentroCusto: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 461.102660000000000000
        Width = 1046.929810000000000000
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 910.866730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            
              ' [COUNT(BndMasterData)] produto(s) relacionado(s) para o centro ' +
              'de custo [FrdsRelacaoEstoqueAprop."CENTRO_CUSTO_NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Top = 3.779530000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueAprop."APROP_ESTOQUE' +
              '_CUSTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object DspRelacaoEstoqueAprop: TDataSetProvider
    DataSet = QryRelacaoEstoqueAprop
    Left = 64
    Top = 40
  end
  object CdsRelacaoEstoqueAprop: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoEstoqueAprop'
    Left = 96
    Top = 40
  end
  object FrdsRelacaoEstoqueAprop: TfrxDBDataset
    UserName = 'FrdsRelacaoEstoqueAprop'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'CENTRO_CUSTO=CENTRO_CUSTO'
      'CENTRO_CUSTO_NOME=CENTRO_CUSTO_NOME'
      'COD=COD'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
      'REFERENCIA=REFERENCIA'
      'GRUPO_COD=GRUPO_COD'
      'GRUPO_DESC=GRUPO_DESC'
      'SECAO_COD=SECAO_COD'
      'SECAO_DESC=SECAO_DESC'
      'FABRICANTE_COD=FABRICANTE_COD'
      'FABRICANTE_NOME=FABRICANTE_NOME'
      'ESPECIFICACAO=ESPECIFICACAO'
      'MOVIMENTA_ESTOQUE=MOVIMENTA_ESTOQUE'
      'CADASTRO_ATIVO=CADASTRO_ATIVO'
      'APROP_ESTOQUE=APROP_ESTOQUE'
      'APROP_ESTOQUE_INT=APROP_ESTOQUE_INT'
      'APROP_ESTOQUE_CUSTO=APROP_ESTOQUE_CUSTO'
      'UNIDADE_COMPRA=UNIDADE_COMPRA'
      'UNIDADE_CONSUMO=UNIDADE_CONSUMO')
    DataSet = CdsRelacaoEstoqueAprop
    BCDToCurrency = True
    DataSetOptions = []
    Left = 128
    Top = 40
  end
  object FrRelacaoEstoqueResumo: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 41557.397184305600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Top = 8
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoEstoqueResumo
        DataSetName = 'FrdsRelacaoEstoqueResumo'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'TESTE'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 604.724800000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559059999999999000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 56.692949999999990000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."HOME_PAGE"][IIF(Trim(<frdEmpresa."HOME_PAGE">)='#39#39',<' +
              'frdEmpresa."EMAIL">,IIF(Trim(<frdEmpresa."EMAIL">)='#39#39','#39#39','#39' / '#39'+<' +
              'frdEmpresa."EMAIL">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118119999999980000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderEmpresa: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoEstoqueResumo."EMPRESA_CNPJ"'
        ReprintOnNewPage = True
        StartNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 631.181510000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            
              ' [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoEstoqueResu' +
              'mo."EMPRESA_CNPJ">)] - [FrdsRelacaoEstoqueResumo."EMPRESA_RAZAO"' +
              ']')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            ' Empresa')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoEstoqueResumo
        DataSetName = 'FrdsRelacaoEstoqueResumo'
        RowCount = 0
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueResumo."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueResumo."FABRICANTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueResumo."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEstoqueResumo."APROP_ESTOQUE_CU' +
              'STO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueResumo."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.##'#39',<FrdsRelacaoEstoqueResumo."ITENS">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueResumo."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueResumo."GRUPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            
              ' [COUNT(BndMasterData)] grupo(s) relacionado(s) para a empresa [' +
              'FrdsRelacaoEstoqueResumo."EMPRESA_RAZAO"].')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueResumo."APROP_ESTOQU' +
              'E_CUSTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 483.779840000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Grupo(s) sem apropria'#231#227'o de estoque')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [COUNT(BndMasterData, 2)] grupo(s) relacionado(s).')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueResumo."APROP_ESTOQU' +
              'E_CUSTO">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderCentroCusto: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoEstoqueResumo."CENTRO_CUSTO"'
        ReprintOnNewPage = True
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            ' Centro de Custo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 631.181510000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueResumo."CENTRO_CUSTO_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 18.897650000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            ' Fabricante')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          HAlign = haRight
          Memo.UTF8W = (
            'Apropriado (R$) ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          HAlign = haRight
          Memo.UTF8W = (
            'Itens ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            ' Grupo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCentroCusto: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            
              ' [COUNT(BndMasterData)] grupo(s) relacionado(s) para o centro de' +
              ' custo [FrdsRelacaoEstoqueResumo."CENTRO_CUSTO_NOME"].')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueResumo."APROP_ESTOQU' +
              'E_CUSTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object DspRelacaoEstoqueResumo: TDataSetProvider
    DataSet = QryRelacaoEstoqueResumo
    Left = 64
    Top = 8
  end
  object CdsRelacaoEstoqueResumo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoEstoqueResumo'
    Left = 96
    Top = 8
  end
  object FrdsRelacaoEstoqueResumo: TfrxDBDataset
    UserName = 'FrdsRelacaoEstoqueResumo'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'CENTRO_CUSTO=CENTRO_CUSTO'
      'CENTRO_CUSTO_NOME=CENTRO_CUSTO_NOME'
      'GRUPO_COD=GRUPO_COD'
      'GRUPO_DESC=GRUPO_DESC'
      'FABRICANTE_COD=FABRICANTE_COD'
      'FABRICANTE_NOME=FABRICANTE_NOME'
      'ITENS=ITENS'
      'APROP_LOTE=APROP_LOTE'
      'APROP_ESTOQUE=APROP_ESTOQUE'
      'APROP_ESTOQUE_INT=APROP_ESTOQUE_INT'
      'APROP_ESTOQUE_CUSTO=APROP_ESTOQUE_CUSTO')
    DataSet = CdsRelacaoEstoqueResumo
    BCDToCurrency = True
    DataSetOptions = []
    Left = 128
    Top = 8
  end
  object frRelacaoApropriacaoSintetico: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 41557.397184305600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Top = 104
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdsRelacaoApropriacaoSintetico
        DataSetName = 'frdsRelacaoApropriacaoSintetico'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'TESTE'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end
      item
        Name = 'Periodo'
        Value = #39#39
      end
      item
        Name = 'SubTitulo'
        Value = #39#39
      end
      item
        Name = 'TotalLiquidoReal'
        Value = 
          'IIF(<frdsRelacaoEntradaGeralSintetico."STATUS">=3,<StatusCancela' +
          'do>,<frdsRelacaoEntradaGeralSintetico."TOTAL_NOTA">)'
      end
      item
        Name = 'StatusCancelado'
        Value = '3'
      end
      item
        Name = 'TotalOutros'
        Value = 
          '(<frdsRelacaoEntradaGeralSintetico."TOTAL_IPI">+<frdsRelacaoEntr' +
          'adaGeralSintetico."TOTAL_FRETE">+<frdsRelacaoEntradaGeralSinteti' +
          'co."TOTAL_OUTROS">+<frdsRelacaoEntradaGeralSintetico."TOTAL_SEGU' +
          'RO">)'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 604.724800000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559059999999999000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 56.692949999999990000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Situa'#231#227'o apropria'#231#227'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 483.779840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118119999999980000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderTipoMov: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'frdsRelacaoApropriacaoSintetico."TIPO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdsRelacaoApropriacaoSintetico."TIPO_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Tipo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 506.457020000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Departamento / Centro de Custo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 18.897650000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 506.457020000000000000
          Top = 18.897650000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Situa'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        DataSet = frdsRelacaoApropriacaoSintetico
        DataSetName = 'frdsRelacaoApropriacaoSintetico'
        RowCount = 0
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoApropriacaoSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdsRelacaoApropriacaoSintetico."VALOR_TOT' +
              'AL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Width = 506.457020000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoApropriacaoSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [frdsRelacaoApropriacaoSintetico."CENTRO_CUSTO_DESCRICAO"] [IIF' +
              '(Trim(<frdsRelacaoApropriacaoSintetico."CNPJ">)='#39#39','#39#39','#39'('#39' + <frd' +
              'sRelacaoApropriacaoSintetico."NOME"> + '#39')'#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 506.457020000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoApropriacaoSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdsRelacaoApropriacaoSintetico."STATUS_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoMov: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoApropriacaoSintetico."VALO' +
              'R_TOTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 423.307360000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' * Os valores totais apresentados est'#227'o de acordo com o per'#237'odo ' +
              'e a situa'#231#227'o da apropria'#231#227'o informados')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 37.795300000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoApropriacaoSintetico."VALO' +
              'R_TOTAL">,BndMasterData, 2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 37.795300000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Produto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 18.897650000000000000
          Width = 279.685156540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL GERAL (R$)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 75.590600000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Total L'#237'quido Real:  ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 75.590600000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoApropriacaoSintetico."VALO' +
              'R_TOTAL_REAL">,BndMasterData, 2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 438.425480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Apropria'#231#245'es Canceladas')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 56.692949999999990000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Total Canelado: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo12: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 56.692949999999990000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoApropriacaoSintetico."VALO' +
              'R_TOTAL">-<frdsRelacaoApropriacaoSintetico."VALOR_TOTAL_REAL">,B' +
              'ndMasterData, 2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object dspRelacaoApropriacaoSintetico: TDataSetProvider
    DataSet = qryRelacaoApropriacaoSintetico
    Left = 64
    Top = 104
  end
  object cdsRelacaoApropriacaoSintetico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelacaoApropriacaoSintetico'
    Left = 96
    Top = 104
  end
  object frdsRelacaoApropriacaoSintetico: TfrxDBDataset
    UserName = 'frdsRelacaoApropriacaoSintetico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA=EMPRESA'
      'RZSOC=RZSOC'
      'TIPO=TIPO'
      'TIPO_DESCRICAO=TIPO_DESCRICAO'
      'CENTRO_CUSTO=CENTRO_CUSTO'
      'CENTRO_CUSTO_DESCRICAO=CENTRO_CUSTO_DESCRICAO'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'CODCLIENTE=CODCLIENTE'
      'NOME=NOME'
      'NOMEFANT=NOMEFANT'
      'CNPJ=CNPJ'
      'VALOR_TOTAL=VALOR_TOTAL'
      'VALOR_TOTAL_REAL=VALOR_TOTAL_REAL')
    DataSet = cdsRelacaoApropriacaoSintetico
    BCDToCurrency = True
    DataSetOptions = []
    Left = 128
    Top = 104
  end
  object frRelacaoApropriacaoAnalitico: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 41557.397184305600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Top = 136
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoApropriacaoAnalitico
        DataSetName = 'FrdsRelacaoApropriacaoAnalitico'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'TESTE'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end
      item
        Name = 'Periodo'
        Value = #39#39
      end
      item
        Name = 'SubTitulo'
        Value = #39#39
      end
      item
        Name = 'ValorLiquidoReal'
        Value = 
          'IIF(<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCa' +
          'ncelada>,0.0,<FrdsRelacaoEntradaGeralAnalitico."TOTAL_NOTA">)'
      end
      item
        Name = 'StatusCancelada'
        Value = '3'
      end
      item
        Name = 'Filtros'
        Value = #39#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 933.543910000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Situa'#231#227'o apropria'#231#227'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 812.598950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 631.181510000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 910.866730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 910.866730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderTipoMov: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoApropriacaoAnalitico."TIPO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Width = 948.662030000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdsRelacaoApropriacaoAnalitico."TIPO_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Tipo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoApropriacaoAnalitico
        DataSetName = 'FrdsRelacaoApropriacaoAnalitico'
        RowCount = 0
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoApropriacaoAnalitico."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoApropriacaoAnalitico."CENTRO_CUSTO_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoApropriacaoAnalitico."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoApropriacaoAnalitico."VALOR_TOT' +
              'AL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoApropriacaoAnalitico."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoApropriacaoAnalitico."APROPRIACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoApropriacaoAnalitico."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoApropriacaoAnalitico.' +
              '"DATA_APROPRIACAO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoApropriacaoAnalitico."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoApropriacaoAnalitico."DOCUMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoApropriacaoAnalitico."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoApropriacaoAnalitico."COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoApropriacaoAnalitico."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoApropriacaoAnalitico."AUTORIZACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoApropriacaoAnalitico."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoApropriacaoAnalitico."STATUS_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoApropriacaoAnalitico."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoApropriacaoAnalitico."COMPETENCIA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoMov: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 302.362336540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FrdsRelacaoApropriacaoAnalitico."TIPO_DESCRICAO"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo10: TfrxSysMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoApropriacaoAnalitico."VALOR' +
              '_TOTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 79.370130000000000000
        Top = 529.134200000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 767.244590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Apropria'#231#245'es Canceladas.')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 880.630490000000000000
          Top = 18.897650000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsRelacaoApropriacaoAnalitico."VALO' +
              'R_TOTAL">,BndMasterData, 2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244590000000000000
          Top = 18.897650000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Produto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244590000000000000
          Width = 279.685156540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL GERAL (R$)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244590000000000000
          Top = 56.692950000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Total L'#237'quido Real:  ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 880.630490000000000000
          Top = 56.692950000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsRelacaoApropriacaoAnalitico."VALO' +
              'R_TOTAL_REAL">,BndMasterData, 2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244590000000000000
          Top = 37.795300000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Total Canelado: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo12: TfrxSysMemoView
          AllowVectorExport = True
          Left = 880.630490000000000000
          Top = 37.795300000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsRelacaoApropriacaoAnalitico."VALO' +
              'R_TOTAL">-<FrdsRelacaoApropriacaoAnalitico."VALOR_TOTAL_REAL">,B' +
              'ndMasterData, 2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderForn: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoApropriacaoAnalitico."FORN_COD"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 661.417750000000000000
          Width = 385.511996540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [IIF(<FrdsRelacaoApropriacaoAnalitico."FORN_PF">=1,FormatMaskTe' +
              'xt('#39'###.###.###-##;0;'#39',<FrdsRelacaoApropriacaoAnalitico."FORN_CN' +
              'PJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoApropri' +
              'acaoAnalitico."FORN_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
          Top = 18.897650000000000000
          Width = 98.267716540000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' No. Apropria'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Emiss'#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Dados da Aproria'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Width = 98.267780000000000000
          Height = 18.897637800000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Fornecedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Width = 563.149970000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdsRelacaoApropriacaoAnalitico."FORN_RAZAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 37.795300000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' No. Documento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 37.795300000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' No. Entrada')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Top = 37.795300000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' No. Autoriza'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Situa'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 18.897650000000000000
          Width = 483.779776540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Outras Informa'#231#245'es')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Compet'#234'ncia')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 37.795300000000000000
          Width = 302.362336540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Centro de Custo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterForn: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 302.362336540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<FrdsRelacaoApropriacaoAnalitico."FORN_PF">=1,FormatMaskTex' +
              't('#39'###.###.###-##;0;'#39',<FrdsRelacaoApropriacaoAnalitico."FORN_CNP' +
              'J">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoApropria' +
              'caoAnalitico."FORN_CNPJ">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoApropriacaoAnalitico."VALOR' +
              '_TOTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object DspRelacaoApropriacaoAnalitico: TDataSetProvider
    DataSet = QryRelacaoApropriacaoAnalitico
    Left = 64
    Top = 136
  end
  object CdsRelacaoApropriacaoAnalitico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoApropriacaoAnalitico'
    Left = 96
    Top = 136
  end
  object FrdsRelacaoApropriacaoAnalitico: TfrxDBDataset
    UserName = 'FrdsRelacaoApropriacaoAnalitico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ANO=ANO'
      'CONTROLE=CONTROLE'
      'NUMERO=NUMERO'
      'EMPRESA=EMPRESA'
      'APROPRIACAO=APROPRIACAO'
      'COMPRA_ANO=COMPRA_ANO'
      'COMPRA_NUM=COMPRA_NUM'
      'COMPRA_EMP=COMPRA_EMP'
      'COMPRA=COMPRA'
      'AUTORIZACAO_ANO=AUTORIZACAO_ANO'
      'AUTORIZACAO_NUM=AUTORIZACAO_NUM'
      'AUTORIZACAO_EMP=AUTORIZACAO_EMP'
      'AUTORIZACAO=AUTORIZACAO'
      'TIPO=TIPO'
      'TIPO_DESCRICAO=TIPO_DESCRICAO'
      'COMPETENCIA=COMPETENCIA'
      'COMPETENCIA_DESC=COMPETENCIA_DESC'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'FORN_COD=FORN_COD'
      'FORN_RAZAO=FORN_RAZAO'
      'FORN_FANTASIA=FORN_FANTASIA'
      'FORN_PF=FORN_PF'
      'FORN_CNPJ=FORN_CNPJ'
      'DOCUMENTO=DOCUMENTO'
      'DOCUMENTO_NUMERO=DOCUMENTO_NUMERO'
      'DOCUMENTO_SERIE=DOCUMENTO_SERIE'
      'CENTRO_CUSTO=CENTRO_CUSTO'
      'CENTRO_CUSTO_DESCRICAO=CENTRO_CUSTO_DESCRICAO'
      'CODCLIENTE=CODCLIENTE'
      'NOME=NOME'
      'NOMEFANT=NOMEFANT'
      'CNPJ=CNPJ'
      'DATA_APROPRIACAO=DATA_APROPRIACAO'
      'DATA_INSERCAO=DATA_INSERCAO'
      'DATA_CANCELAMENTO=DATA_CANCELAMENTO'
      'CANCEL_MOTIVO=CANCEL_MOTIVO'
      'VALOR_TOTAL=VALOR_TOTAL'
      'VALOR_TOTAL_REAL=VALOR_TOTAL_REAL')
    DataSet = CdsRelacaoApropriacaoAnalitico
    BCDToCurrency = True
    DataSetOptions = []
    Left = 128
    Top = 136
  end
  object QryRelacaoEstoqueResumo: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    coalesce(xx.empresa, p.codemp) as empresa_cnpj'
      '  , e.rzsoc  as empresa_razao'
      '  , xx.centro_custo'
      '  , c.descricao as centro_custo_nome'
      ''
      '  , coalesce(p.codgrupo, 0) as grupo_cod'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')   as grupo_desc'
      '  , coalesce(p.codfabricante, 0)     as fabricante_cod'
      '  , coalesce(f.nome, '#39'* Indefinido'#39') as fabricante_nome'
      ''
      '  , count( p.cod ) as itens'
      ''
      '  , sum( xx.aprop_lote )          as aprop_lote'
      '  , sum( xx.aprop_estoque )       as aprop_estoque'
      '  , sum( xx.aprop_estoque_int )   as aprop_estoque_int'
      '  , sum( xx.aprop_estoque_custo ) as aprop_estoque_custo'
      'from TBPRODUTO p'
      '  inner join ('
      '    Select'
      '        pe.empresa'
      '      , pe.centro_custo'
      '      , pe.produto'
      '      , count(pe.lote) as aprop_lote'
      '      , sum(pe.qtde) as aprop_estoque'
      '      , sum(pe.qtde / pe.fracionador) as aprop_estoque_int'
      '      , sum(pe.qtde * pe.custo_medio) as aprop_estoque_custo'
      '    from TBESTOQUE_ALMOX pe'
      '    where (coalesce(pe.qtde, 0) > 0)'
      '    group by'
      '        pe.empresa'
      '      , pe.centro_custo'
      '      , pe.produto'
      '  ) xx on (xx.empresa = p.codemp and xx.produto = p.cod)'
      ''
      
        '  left join TBEMPRESA e on (e.cnpj = coalesce(xx.empresa, p.code' +
        'mp))'
      '  left join TBCENTRO_CUSTO c on (c.codigo = xx.centro_custo)'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      ''
      '/*'
      'group by'
      '    coalesce(xx.empresa, p.codemp)'
      '  , e.rzsoc'
      '  , xx.centro_custo'
      '  , c.descricao'
      ''
      '  , coalesce(p.codgrupo, 0)'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')'
      '  , coalesce(p.codfabricante, 0)'
      '  , coalesce(f.nome, '#39'* Indefinido'#39')'
      ''
      'order by'
      '    e.rzsoc'
      '  , c.descricao'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')'
      '  , coalesce(f.nome, '#39'* Indefinido'#39')'
      ''
      '*/')
    Left = 32
    Top = 8
  end
  object fdQryEmpresas: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    e.cnpj'
      '  , e.codigo'
      '  , e.razao'
      '  , e.fantasia'
      'from VW_EMPRESA e'
      'order by'
      '    e.razao')
    Left = 448
    Top = 8
  end
  object DspEmpresas: TDataSetProvider
    DataSet = fdQryEmpresas
    Left = 480
    Top = 8
  end
  object CdsEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpresas'
    Left = 512
    Top = 8
  end
  object fdQryCentroCusto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select distinct'
      '    c.codigo'
      '  , c.descricao'
      '  , ci.nome'
      'from TBCENTRO_CUSTO c'
      
        '  left join TBCENTRO_CUSTO_EMPRESA e on (e.centro_custo = c.codi' +
        'go)'
      '  left join TBCLIENTE ci on (ci.codigo = c.codcliente)'
      ''
      'where ((e.empresa = :empresa) or (:todas = 1))'
      '  or (c.codcliente is not null)'
      ''
      'order by'
      '    2')
    Left = 448
    Top = 40
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'TODAS'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DspCentroCusto: TDataSetProvider
    DataSet = fdQryCentroCusto
    Left = 480
    Top = 40
  end
  object CdsCentroCusto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftInteger
        Name = 'TODAS'
        ParamType = ptInput
      end>
    ProviderName = 'DspCentroCusto'
    Left = 512
    Top = 40
  end
  object fdQryGrupo: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    g.cod'
      '  , g.descri'
      'from TBGRUPOPROD g'
      'order by'
      '    g.descri')
    Left = 448
    Top = 72
  end
  object DspGrupo: TDataSetProvider
    DataSet = fdQryGrupo
    Left = 480
    Top = 72
  end
  object CdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGrupo'
    Left = 512
    Top = 72
  end
  object fdQryFabricante: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    f.cod'
      '  , f.nome'
      'from TBFABRICANTE f'
      'order by'
      '    f.nome')
    Left = 448
    Top = 104
  end
  object DspFabricante: TDataSetProvider
    DataSet = fdQryFabricante
    Left = 480
    Top = 104
  end
  object CdsFabricante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFabricante'
    Left = 512
    Top = 104
  end
  object fdQryTipoApropriacao: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from VW_TIPO_APROPRIACAO')
    Left = 448
    Top = 136
  end
  object DspTipoApropriacao: TDataSetProvider
    DataSet = fdQryTipoApropriacao
    Left = 480
    Top = 136
  end
  object CdsTipoApropriacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTipoApropriacao'
    Left = 512
    Top = 136
  end
  object QryRelacaoEstoqueAprop: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    coalesce(xx.empresa, p.codemp) as empresa_cnpj'
      '  , e.rzsoc  as empresa_razao'
      '  , xx.centro_custo'
      '  , c.descricao as centro_custo_nome'
      '  , p.cod'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.modelo'
      '  , p.referencia'
      '  , coalesce(p.codgrupo, 0) as grupo_cod'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')   as grupo_desc'
      '  , coalesce(p.codsecao, 0)                     as secao_cod'
      '  , coalesce(s.scp_descricao, '#39'* Indefinida'#39')   as secao_desc'
      '  , coalesce(p.codfabricante, 0)     as fabricante_cod'
      '  , coalesce(f.nome, '#39'* Indefinido'#39') as fabricante_nome'
      '  , p.especificacao'
      ''
      '  , p.movimenta_estoque'
      '  , p.cadastro_ativo'
      ''
      '  , xx.aprop_estoque'
      '  , xx.aprop_estoque_int'
      '  , xx.aprop_estoque_custo'
      ''
      
        '  , substring( coalesce(nullif(trim(uc.unp_sigla), '#39#39'), uc.unp_d' +
        'escricao) from 1 for 3) as unidade_compra'
      
        '  , substring( coalesce(nullif(trim(uf.unp_sigla), '#39#39'), uf.unp_d' +
        'escricao) from 1 for 3) as unidade_consumo'
      'from TBPRODUTO p'
      '  inner join ('
      '    Select'
      '        pe.empresa'
      '      , pe.centro_custo'
      '      , pe.produto'
      '      , pe.unidade'
      '      , sum(pe.qtde) as aprop_estoque'
      '      , sum(pe.qtde / pe.fracionador) as aprop_estoque_int'
      '      , sum(pe.qtde * pe.custo_medio) as aprop_estoque_custo'
      '    from TBESTOQUE_ALMOX pe'
      '    where (coalesce(pe.qtde, 0) > 0)'
      '    group by'
      '        pe.empresa'
      '      , pe.centro_custo'
      '      , pe.produto'
      '      , pe.unidade'
      '  ) xx on (xx.empresa = p.codemp and xx.produto = p.cod)'
      ''
      
        '  left join TBEMPRESA e on (e.cnpj = coalesce(xx.empresa, p.code' +
        'mp))'
      '  left join TBCENTRO_CUSTO c on (c.codigo = xx.centro_custo)'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)'
      '  left join TBUNIDADEPROD uf on (uf.unp_cod = xx.unidade)'
      ''
      '/*'
      'order by'
      '    e.rzsoc'
      '  , c.descricao'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')'
      '  , p.descri_apresentacao'
      '*/')
    Left = 32
    Top = 40
  end
  object qryRelacaoApropriacaoSintetico: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    a.empresa'
      '  , e.rzsoc'
      '  , a.tipo'
      '  , ta.descricao as tipo_descricao'
      '  , a.centro_custo'
      '  , c.descricao as centro_custo_descricao'
      '  , a.status'
      '  , Case a.status'
      '      when 0 then '#39'Editando'#39
      '      when 1 then '#39'Aberto'#39
      '      when 2 then '#39'Encerrada'#39
      '      when 3 then '#39'Cancelado'#39
      '    end as status_desc'
      '  , c.codcliente'
      '  , cc.nome'
      '  , cc.nomefant'
      '  , cc.cnpj'
      '  , sum( coalesce(a.valor_total, 0.0)  ) as valor_total'
      
        '  , sum( coalesce(Case when a.status = 3 then 0.0 else a.valor_t' +
        'otal end, 0.0)  ) as valor_total_real'
      'from TBAPROPRIACAO_ALMOX a'
      '  left join VW_TIPO_APROPRIACAO ta on (ta.codigo = a.tipo)'
      '  left join TBEMPRESA e on (e.cnpj = a.empresa)'
      '  left join TBCENTRO_CUSTO c on (c.codigo = a.centro_custo)'
      '  left join TBCLIENTE cc on (cc.codigo = c.codcliente)'
      ''
      '/*'
      'where a.empresa = '#39'03041377000187'#39
      '  and a.status > 1 -- 1. Aberto'
      ''
      'group by'
      '    a.empresa'
      '  , e.rzsoc'
      '  , a.tipo'
      '  , ta.descricao'
      '  , a.centro_custo'
      '  , c.descricao'
      '  , a.status'
      '  , c.codcliente'
      '  , cc.nome'
      '  , cc.nomefant'
      '  , cc.cnpj'
      ''
      'order by'
      '    e.rzsoc'
      '  , a.tipo'
      '  , c.descricao'
      '*/')
    Left = 32
    Top = 104
  end
  object QryRelacaoApropriacaoAnalitico: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.controle'
      '  , a.numero'
      '  , a.empresa'
      
        '  , a.ano || '#39'/'#39' || right('#39'000000'#39' || a.controle, 7) as apropria' +
        'cao'
      '  , a.compra_ano'
      '  , a.compra_num'
      '  , a.compra_emp'
      
        '  , a.compra_ano || '#39'/'#39' || right('#39'000000'#39' || a.compra_num, 7) as' +
        ' compra'
      '  , a.autorizacao_ano'
      '  , a.autorizacao_num'
      '  , a.autorizacao_emp'
      
        '  , a.autorizacao_ano || '#39'/'#39' || right('#39'000000'#39' || a.autorizacao_' +
        'num, 7) as autorizacao'
      '  , a.tipo'
      '  , ta.descricao as tipo_descricao'
      
        '  , (extract(year from a.data_apropriacao) || right('#39'00'#39' || extr' +
        'act(month from a.data_apropriacao), 2)) as competencia'
      '  , ca.cmp_desc as competencia_desc'
      '  , a.status'
      '  , Case a.status'
      '      when 0 then '#39'Editando'#39
      '      when 1 then '#39'Aberto'#39
      '      when 2 then '#39'Encerrada'#39
      '      when 3 then '#39'Cancelado'#39
      '    end as status_desc'
      ''
      '  , coalesce(aa.fornecedor, ac.codforn)  as forn_cod'
      '  , f.nomeforn as forn_razao'
      '  , f.nomefant as forn_fantasia'
      '  , f.pessoa_fisica as forn_pf'
      '  , f.cnpj          as forn_cnpj'
      
        '  , right('#39'000000'#39' || ac.nf, 7) || (Case when ac.tipo_documento ' +
        '= 0 then '#39#39' else '#39'-'#39' || ac.nfserie end) as documento'
      '  , ac.nf             as documento_numero'
      '  , ac.nfserie        as documento_serie'
      ''
      '  , a.centro_custo'
      '  , c.descricao as centro_custo_descricao'
      '  , c.codcliente'
      '  , cc.nome'
      '  , cc.nomefant'
      '  , cc.cnpj'
      ''
      '  , a.data_apropriacao'
      '  , a.insercao_data   as data_insercao'
      '  , a.cancel_datahora as data_cancelamento'
      '  , a.cancel_motivo'
      ''
      '  , coalesce(a.valor_total, 0.0) as valor_total'
      
        '  , coalesce(Case when a.status = 3 then 0.0 else a.valor_total ' +
        'end, 0.0) as valor_total_real'
      ''
      'from TBAPROPRIACAO_ALMOX a'
      '  left join TBEMPRESA e on (e.cnpj = a.empresa)'
      '  left join VW_TIPO_APROPRIACAO ta on (ta.codigo = a.tipo)'
      '  left join TBCENTRO_CUSTO c on (c.codigo = a.centro_custo)'
      '  left join TBCLIENTE cc on (cc.codigo = c.codcliente)'
      
        '  left join TBCOMPETENCIA ca on (ca.cmp_num = (extract(year from' +
        ' a.data_apropriacao) || right('#39'00'#39' || extract(month from a.data_' +
        'apropriacao), 2)))'
      
        '  left join TBCOMPRAS ac on (ac.ano = a.compra_ano and ac.codcon' +
        'trol = a.compra_num and ac.codemp = a.compra_emp)'
      
        '  left join TBAUTORIZA_COMPRA aa on (aa.ano = a.autorizacao_ano ' +
        'and aa.codigo = a.autorizacao_num and aa.empresa = a.autorizacao' +
        '_emp)'
      
        '  left join TBFORNECEDOR f on (f.codforn = coalesce(aa.fornecedo' +
        'r, ac.codforn))'
      ''
      '/*'
      'where a.empresa = '#39'03041377000187'#39
      '  and a.status  > 0 -- 0. Editando'
      ''
      'order by'
      '    a.empresa'
      '  , a.tipo'
      '  , f.nomeforn'
      '  , f.nomefant'
      '  , a.data_apropriacao'
      '*/')
    Left = 32
    Top = 136
  end
  object frRelacaoProdutoApropriacao: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 45162.717197314810000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Top = 168
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoProdutoApropriacao
        DataSetName = 'FrdsRelacaoProdutoApropriacao'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'TESTE'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end
      item
        Name = 'Periodo'
        Value = #39#39
      end
      item
        Name = 'SubTitulo'
        Value = #39#39
      end
      item
        Name = 'ValorLiquidoReal'
        Value = 
          'IIF(<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCa' +
          'ncelada>,0.0,<FrdsRelacaoEntradaGeralAnalitico."TOTAL_NOTA">)'
      end
      item
        Name = 'StatusCancelada'
        Value = '3'
      end
      item
        Name = 'Filtros'
        Value = #39#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 604.724800000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Situa'#231#227'o apropria'#231#227'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 483.779840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 657.638220000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 910.866730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 910.866730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderTipoMov: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoProdutoApropriacao."TIPO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Width = 619.842920000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14342874
          Memo.UTF8W = (
            ' [FrdsRelacaoProdutoApropriacao."TIPO_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14342874
          Memo.UTF8W = (
            ' Tipo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 415.748300000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoProdutoApropriacao
        DataSetName = 'FrdsRelacaoProdutoApropriacao'
        RowCount = 0
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Width = 64.251946540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FrdsRelacaoProdutoApropriacao."PRODUTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Width = 404.409646540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoProdutoApropriacao."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 60.472416540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.##'#39', <FrdsRelacaoProdutoApropriacao."QTDE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Width = 60.472416540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39', <FrdsRelacaoProdutoApropriacao."CUSTO_UNIT' +
              'ARIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 60.472416540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoProdutoApropriacao."UNIDADE_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 650.079160000000000000
          Width = 68.031476540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39', <FrdsRelacaoProdutoApropriacao."CUSTO_TOTA' +
              'L">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoMov: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456695350000000000
        Top = 502.677490000000000000
        Width = 718.110700000000000000
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 589.606616540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14342874
          HAlign = haRight
          Memo.UTF8W = (
            '[FrdsRelacaoProdutoApropriacao."TIPO_DESCRICAO"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo10: TfrxSysMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14342874
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoProdutoApropriacao."CUSTO_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 589.606680000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 589.606680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Apropria'#231#245'es Canceladas.')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 18.897650000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsRelacaoProdutoApropriacao."CUSTO_' +
              'TOTAL">,BndMasterData, 2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Width = 128.503956540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL GERAL (R$)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderAprop: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 113.385900000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoProdutoApropriacao."NUMERO"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 18.897650000000000000
          Width = 253.228446540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [IIF(<FrdsRelacaoProdutoApropriacao."FORN_PF">=1,FormatMaskText' +
              '('#39'###.###.###-##;0;'#39',<FrdsRelacaoProdutoApropriacao."FORN_CNPJ">' +
              '),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoProdutoApro' +
              'priacao."FORN_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' No. Apropria'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Emiss'#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Dados da Aproria'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897637800000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Fornecedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 18.897650000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdsRelacaoProdutoApropriacao."FORN_RAZAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 37.795300000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' No. Documento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 37.795300000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' No. Entrada')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Top = 37.795300000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' No. Autoriza'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 37.795300000000000000
          Width = 253.228446540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Centro de Custo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 56.692950000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoProdutoApropriacao."CENTRO_CUSTO_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoProdutoApropriacao."APROPRIACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 56.692950000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoProdutoApropriacao."D' +
              'ATA_APROPRIACAO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 56.692950000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoProdutoApropriacao."DOCUMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 56.692950000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoProdutoApropriacao."COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Top = 56.692950000000000000
          Width = 94.488186540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoProdutoApropriacao."STATUS">=<StatusCancelada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoProdutoApropriacao."AUTORIZACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            ' Produto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 94.488250000000000000
          Width = 404.409710000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 94.488250000000000000
          Width = 60.472440940000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 94.488250000000000000
          Width = 60.472440940000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 94.488250000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Valor ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 650.079160000000000000
          Top = 94.488250000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Total ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Top = 75.590600000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Produtos')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterAprop: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 457.323130000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 650.079160000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoProdutoApropriacao."CUSTO_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Width = 650.079160000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object QryRelacaoProdutoApropriacao: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.controle'
      '  , a.numero'
      '  , a.empresa'
      
        '  , a.ano || '#39'/'#39' || right('#39'000000'#39' || a.controle, 7) as apropria' +
        'cao'
      '  , a.compra_ano'
      '  , a.compra_num'
      '  , a.compra_emp'
      
        '  , a.compra_ano || '#39'/'#39' || right('#39'000000'#39' || a.compra_num, 7) as' +
        ' compra'
      '  , a.autorizacao_ano'
      '  , a.autorizacao_num'
      '  , a.autorizacao_emp'
      
        '  , a.autorizacao_ano || '#39'/'#39' || right('#39'000000'#39' || a.autorizacao_' +
        'num, 7) as autorizacao'
      '  , a.tipo'
      '  , ta.descricao as tipo_descricao'
      
        '  , (extract(year from a.data_apropriacao) || right('#39'00'#39' || extr' +
        'act(month from a.data_apropriacao), 2)) as competencia'
      '  , ca.cmp_desc as competencia_desc'
      '  , a.status'
      '  , Case a.status'
      '      when 0 then '#39'Editando'#39
      '      when 1 then '#39'Aberto'#39
      '      when 2 then '#39'Encerrada'#39
      '      when 3 then '#39'Cancelado'#39
      '    end as status_desc'
      ''
      '  , coalesce(aa.fornecedor, ac.codforn)  as forn_cod'
      '  , f.nomeforn as forn_razao'
      '  , f.nomefant as forn_fantasia'
      '  , f.pessoa_fisica as forn_pf'
      '  , f.cnpj          as forn_cnpj'
      
        '  , right('#39'000000'#39' || ac.nf, 7) || (Case when ac.tipo_documento ' +
        '= 0 then '#39#39' else '#39'-'#39' || ac.nfserie end) as documento'
      '  , ac.nf             as documento_numero'
      '  , ac.nfserie        as documento_serie'
      ''
      '  , a.centro_custo'
      '  , c.descricao as centro_custo_descricao'
      '  , c.codcliente'
      '  , cc.nome'
      '  , cc.nomefant'
      '  , cc.cnpj'
      ''
      '  , a.data_apropriacao'
      '  , a.insercao_data   as data_insercao'
      '  , a.cancel_datahora as data_cancelamento'
      '  , a.cancel_motivo'
      ''
      '  , coalesce(a.valor_total, 0.0) as valor_total'
      
        '  , coalesce(Case when a.status = 3 then 0.0 else a.valor_total ' +
        'end, 0.0) as valor_total_real'
      ''
      '  , ai.produto'
      '  , pd.descri_apresentacao'
      '  , ai.qtde'
      '  , ai.unidade'
      
        '  , coalesce(nullif(trim(un.unp_sigla), '#39#39'), un.unp_descricao) a' +
        's unidade_sigla'
      '  , ai.custo_unitario'
      '  , ai.custo_total'
      'from TBAPROPRIACAO_ALMOX a'
      
        '  inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ' +
        'ai.controle = a.controle)'
      '  inner join TBPRODUTO pd on (pd.cod = ai.produto)'
      '  left join TBEMPRESA e on (e.cnpj = a.empresa)'
      '  left join VW_TIPO_APROPRIACAO ta on (ta.codigo = a.tipo)'
      '  left join TBCENTRO_CUSTO c on (c.codigo = a.centro_custo)'
      '  left join TBCLIENTE cc on (cc.codigo = c.codcliente)'
      
        '  left join TBCOMPETENCIA ca on (ca.cmp_num = (extract(year from' +
        ' a.data_apropriacao) || right('#39'00'#39' || extract(month from a.data_' +
        'apropriacao), 2)))'
      
        '  left join TBCOMPRAS ac on (ac.ano = a.compra_ano and ac.codcon' +
        'trol = a.compra_num and ac.codemp = a.compra_emp)'
      
        '  left join TBAUTORIZA_COMPRA aa on (aa.ano = a.autorizacao_ano ' +
        'and aa.codigo = a.autorizacao_num and aa.empresa = a.autorizacao' +
        '_emp)'
      
        '  left join TBFORNECEDOR f on (f.codforn = coalesce(aa.fornecedo' +
        'r, ac.codforn))'
      '  left join TBUNIDADEPROD un on (un.unp_cod = ai.unidade)'
      ''
      '/*'
      'where a.empresa = '#39'03041377000187'#39
      '  and a.status  > 0 -- 0. Editando'
      ''
      'order by'
      '    a.empresa'
      '  , a.tipo'
      '  , f.nomeforn'
      '  , f.nomefant'
      '  , a.data_apropriacao'
      '  , a.ano'
      '  , a.controle'
      '*/')
    Left = 32
    Top = 168
  end
  object DspRelacaoProdutoApropriacao: TDataSetProvider
    DataSet = QryRelacaoProdutoApropriacao
    Left = 64
    Top = 168
  end
  object CdsRelacaoProdutoApropriacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoProdutoApropriacao'
    Left = 96
    Top = 168
  end
  object FrdsRelacaoProdutoApropriacao: TfrxDBDataset
    UserName = 'FrdsRelacaoProdutoApropriacao'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ANO=ANO'
      'CONTROLE=CONTROLE'
      'NUMERO=NUMERO'
      'EMPRESA=EMPRESA'
      'APROPRIACAO=APROPRIACAO'
      'COMPRA_ANO=COMPRA_ANO'
      'COMPRA_NUM=COMPRA_NUM'
      'COMPRA_EMP=COMPRA_EMP'
      'COMPRA=COMPRA'
      'AUTORIZACAO_ANO=AUTORIZACAO_ANO'
      'AUTORIZACAO_NUM=AUTORIZACAO_NUM'
      'AUTORIZACAO_EMP=AUTORIZACAO_EMP'
      'AUTORIZACAO=AUTORIZACAO'
      'TIPO=TIPO'
      'TIPO_DESCRICAO=TIPO_DESCRICAO'
      'COMPETENCIA=COMPETENCIA'
      'COMPETENCIA_DESC=COMPETENCIA_DESC'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'FORN_COD=FORN_COD'
      'FORN_RAZAO=FORN_RAZAO'
      'FORN_FANTASIA=FORN_FANTASIA'
      'FORN_PF=FORN_PF'
      'FORN_CNPJ=FORN_CNPJ'
      'DOCUMENTO=DOCUMENTO'
      'DOCUMENTO_NUMERO=DOCUMENTO_NUMERO'
      'DOCUMENTO_SERIE=DOCUMENTO_SERIE'
      'CENTRO_CUSTO=CENTRO_CUSTO'
      'CENTRO_CUSTO_DESCRICAO=CENTRO_CUSTO_DESCRICAO'
      'CODCLIENTE=CODCLIENTE'
      'NOME=NOME'
      'NOMEFANT=NOMEFANT'
      'CNPJ=CNPJ'
      'DATA_APROPRIACAO=DATA_APROPRIACAO'
      'DATA_INSERCAO=DATA_INSERCAO'
      'DATA_CANCELAMENTO=DATA_CANCELAMENTO'
      'CANCEL_MOTIVO=CANCEL_MOTIVO'
      'VALOR_TOTAL=VALOR_TOTAL'
      'VALOR_TOTAL_REAL=VALOR_TOTAL_REAL'
      'PRODUTO=PRODUTO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'QTDE=QTDE'
      'UNIDADE=UNIDADE'
      'UNIDADE_SIGLA=UNIDADE_SIGLA'
      'CUSTO_UNITARIO=CUSTO_UNITARIO'
      'CUSTO_TOTAL=CUSTO_TOTAL')
    DataSet = CdsRelacaoProdutoApropriacao
    BCDToCurrency = True
    DataSetOptions = []
    Left = 128
    Top = 168
  end
  object FrRelacaoEstoqueProdutos: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 45162.762979652780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Top = 72
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoEstoqueProdutos
        DataSetName = 'FrdsRelacaoEstoqueProdutos'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'TESTE'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 933.543910000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."HOME_PAGE"][IIF(Trim(<frdEmpresa."HOME_PAGE">)='#39#39',<' +
              'frdEmpresa."EMAIL">,IIF(Trim(<frdEmpresa."EMAIL">)='#39#39','#39#39','#39' / '#39'+<' +
              'frdEmpresa."EMAIL">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 468.661720000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 910.866730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 910.866730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderEmpresa: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 204.094620000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEstoqueProdutos."EMPRESA_CNPJ"'
        ReprintOnNewPage = True
        StartNewPage = True
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            ' Centro de Custo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708720000000000000
          Width = 956.221090000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14671839
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutos."CENTRO_CUSTO_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 820.158010000000000000
          Top = 37.795300000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' C'#243'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Top = 18.897650000000000000
          Width = 321.260050000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Descri'#231#227'o / Apresenta'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Fabricante')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Top = 37.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Unid.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 820.158010000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Estoque Fracionado')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 706.772110000000000000
          Top = 18.897650000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Estoque Inteiro')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 706.772110000000000000
          Top = 37.795300000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 18.897650000000000000
          Width = 192.756030000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Grupo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 771.024120000000000000
          Top = 37.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Unid.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 933.543910000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 37.795300000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Total '
            'Apropriado (R$)')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 283.464750000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoEstoqueProdutos
        DataSetName = 'FrdsRelacaoEstoqueProdutos'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 820.158010000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE"' +
              '>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutos."COD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutos."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutos."FABRICANTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutos."UNIDADE_CONSUMO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 706.772110000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE_' +
              'INT">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 771.024120000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutos."UNIDADE_COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutos."GRUPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 933.543910000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEstoqueProdutos."APROP_ESTOQUE_' +
              'CUSTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 325.039580000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Width = 933.543910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 933.543910000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueProdutos."APROP_ESTO' +
              'QUE_CUSTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 411.968770000000000000
        Width = 1046.929810000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 1046.929810000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Produto(s) sem apropria'#231#227'o de estoque')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 933.543910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [COUNT(BndMasterData, 2)] produto(s) relacionado(s).')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 933.543910000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueProdutos."APROP_ESTO' +
              'QUE_CUSTO">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object QryRelacaoEstoqueProdutos: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    coalesce(xx.empresa, p.codemp) as empresa_cnpj'
      '  , e.rzsoc  as empresa_razao'
      '  , xx.centro_custo'
      '  , c.descricao as centro_custo_nome'
      '  , p.cod'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.modelo'
      '  , p.referencia'
      '  , coalesce(p.codgrupo, 0) as grupo_cod'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')   as grupo_desc'
      '  , coalesce(p.codsecao, 0)                     as secao_cod'
      '  , coalesce(s.scp_descricao, '#39'* Indefinida'#39')   as secao_desc'
      '  , coalesce(p.codfabricante, 0)     as fabricante_cod'
      '  , coalesce(f.nome, '#39'* Indefinido'#39') as fabricante_nome'
      '  , p.especificacao'
      ''
      '  , p.movimenta_estoque'
      '  , p.cadastro_ativo'
      ''
      '  , xx.aprop_estoque'
      '  , xx.aprop_estoque_int'
      '  , xx.aprop_estoque_custo'
      ''
      
        '  , substring( coalesce(nullif(trim(uc.unp_sigla), '#39#39'), uc.unp_d' +
        'escricao) from 1 for 3) as unidade_compra'
      
        '  , substring( coalesce(nullif(trim(uf.unp_sigla), '#39#39'), uf.unp_d' +
        'escricao) from 1 for 3) as unidade_consumo'
      'from TBPRODUTO p'
      '  inner join ('
      '    Select'
      '        pe.empresa'
      '      , pe.centro_custo'
      '      , pe.produto'
      '      , pe.unidade'
      '      , sum(pe.qtde) as aprop_estoque'
      '      , sum(pe.qtde / pe.fracionador) as aprop_estoque_int'
      '      , sum(pe.qtde * pe.custo_medio) as aprop_estoque_custo'
      '    from TBESTOQUE_ALMOX pe'
      '    where (coalesce(pe.qtde, 0) > 0)'
      '    group by'
      '        pe.empresa'
      '      , pe.centro_custo'
      '      , pe.produto'
      '      , pe.unidade'
      '  ) xx on (xx.empresa = p.codemp and xx.produto = p.cod)'
      ''
      
        '  left join TBEMPRESA e on (e.cnpj = coalesce(xx.empresa, p.code' +
        'mp))'
      '  left join TBCENTRO_CUSTO c on (c.codigo = xx.centro_custo)'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)'
      '  left join TBUNIDADEPROD uf on (uf.unp_cod = xx.unidade)'
      ''
      '/*'
      'order by'
      '    e.rzsoc'
      '  , c.descricao'
      '  , p.descri_apresentacao'
      '*/')
    Left = 32
    Top = 72
  end
  object DspRelacaoEstoqueProdutos: TDataSetProvider
    DataSet = QryRelacaoEstoqueProdutos
    Left = 64
    Top = 72
  end
  object CdsRelacaoEstoqueProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoEstoqueProdutos'
    Left = 96
    Top = 72
  end
  object FrdsRelacaoEstoqueProdutos: TfrxDBDataset
    UserName = 'FrdsRelacaoEstoqueProdutos'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'CENTRO_CUSTO=CENTRO_CUSTO'
      'CENTRO_CUSTO_NOME=CENTRO_CUSTO_NOME'
      'COD=COD'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
      'REFERENCIA=REFERENCIA'
      'GRUPO_COD=GRUPO_COD'
      'GRUPO_DESC=GRUPO_DESC'
      'SECAO_COD=SECAO_COD'
      'SECAO_DESC=SECAO_DESC'
      'FABRICANTE_COD=FABRICANTE_COD'
      'FABRICANTE_NOME=FABRICANTE_NOME'
      'ESPECIFICACAO=ESPECIFICACAO'
      'MOVIMENTA_ESTOQUE=MOVIMENTA_ESTOQUE'
      'CADASTRO_ATIVO=CADASTRO_ATIVO'
      'APROP_ESTOQUE=APROP_ESTOQUE'
      'APROP_ESTOQUE_INT=APROP_ESTOQUE_INT'
      'APROP_ESTOQUE_CUSTO=APROP_ESTOQUE_CUSTO'
      'UNIDADE_COMPRA=UNIDADE_COMPRA'
      'UNIDADE_CONSUMO=UNIDADE_CONSUMO')
    DataSet = CdsRelacaoEstoqueProdutos
    BCDToCurrency = True
    DataSetOptions = []
    Left = 128
    Top = 72
  end
  object QryExtratoMovimentoProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.codigo'
      '  , p.cod'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , uc.unp_descricao as und_compra'
      '  , uc.unp_sigla     as und_compra_sigla'
      '  , coalesce(ep.estoque_almox, 0) as estoque_almox'
      ''
      '  , ex.empresa'
      '  , e.rzsoc as empresa_razao'
      '  , ex.data'
      '  , ex.local'
      '  , ex.responsavel'
      '  , ex.tipo'
      '  , ex.quant'
      '  , ex.valor_total'
      ''
      
        '  , Case when ex.tipo = 3 then ex.quant else 0 end as quant_apro' +
        'priacao'
      
        '  , Case when ex.tipo = 4 then ex.quant else 0 end as quant_requ' +
        'isicao'
      ''
      '  , Case when ex.tipo = 3 then ex.quant else 0 end +'
      '    Case when ex.tipo = 2 then ex.quant else 0 end -'
      
        '    Case when ex.tipo = 4 then ex.quant else 0 end as quant_sald' +
        'o_almox'
      ''
      
        '  , Case when ex.tipo = 3 then ex.valor_total else 0 end as valo' +
        'r_total_apropriacao'
      
        '  , Case when ex.tipo = 4 then ex.valor_total else 0 end as valo' +
        'r_total_requisicao'
      ''
      '  , Case when ex.tipo = 3 then ex.valor_total else 0 end +'
      '    Case when ex.tipo = 2 then ex.valor_total else 0 end -'
      
        '    Case when ex.tipo = 4 then ex.valor_total else 0 end as valo' +
        'r_total_saldo_almox'
      ''
      '  , ep.valor_estoque_almox'
      '  , ue.unp_descricao as und_almox'
      '  , ue.unp_sigla     as und_almox_sigla'
      'from TBEMPRESA e'
      '  inner join ('
      ''
      '    /* Apropria'#231#245'es */'
      '    select'
      '        a.empresa'
      '      , ai.produto'
      '      , a.data_apropriacao  as data'
      
        '      , Case when a.tipo = 0 then '#39'ENTRADA MANUAL NO ESTOQUE'#39' el' +
        'se '#39'ESTOQUE'#39' end as local'
      '      , coalesce(a.usuario, '#39#39') as responsavel'
      '      , sum(ai.qtde)        as quant'
      '      , sum(ai.custo_total) as valor_total'
      '      , 3 as tipo'
      '    from TBAPROPRIACAO_ALMOX a'
      
        '      inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano ' +
        'and ai.controle = a.controle)'
      '    where a.status   = 2 -- Encerrada'
      '      and a.empresa  = :empresa'
      '      and ai.produto = :produto'
      '    group by'
      '        a.empresa'
      '      , ai.produto'
      '      , a.data_apropriacao'
      
        '      , Case when a.tipo = 0 then '#39'ENTRADA MANUAL NO ESTOQUE'#39' el' +
        'se '#39'ESTOQUE'#39' end'
      '      , coalesce(a.usuario, '#39#39')'
      ''
      '    union'
      ''
      '    /* Requisi'#231#245'es */'
      '    select'
      '        r.empresa'
      '      , ri.produto'
      '      , r.data_emissao as data'
      '      , cc.descricao   as local'
      '      , coalesce(r.responsavel_retirada, '#39#39') as responsavel'
      '      , sum(ri.qtde / ri.fracionador) as quant'
      '      , sum(ri.total) as valor_total'
      '      , 4 as tipo'
      '    from TBREQUISICAO_ALMOX r'
      
        '      inner join TBCENTRO_CUSTO cc on (cc.codigo = r.ccusto_orig' +
        'em)'
      
        '      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano a' +
        'nd ri.controle = r.controle)'
      '    where r.status   = 4 -- Atendida'
      '      and r.empresa  = :empresa'
      '      and ri.produto = :produto'
      '    group by'
      '        r.empresa'
      '      , ri.produto'
      '      , cc.descricao'
      '      , r.data_emissao'
      '      , coalesce(r.responsavel_retirada, '#39#39')'
      ''
      '  ) ex on (ex.empresa = e.cnpj)'
      ''
      '  inner join TBPRODUTO p on (p.cod = ex.produto)'
      ''
      '  /* Estoque Apropriado */'
      '  left join ('
      '    Select'
      '        ae.empresa'
      '      , ae.produto'
      
        '      , (case when ae.qtde > 0 then ae.fracionador else 0 end) a' +
        's unidade'
      
        '      , sum( (ae.qtde / coalesce(nullif(ae.fracionador, 0), 1)) ' +
        ') as estoque_almox'
      '      , sum( (ae.qtde * ae.custo_medio) ) as valor_estoque_almox'
      '    from TBESTOQUE_ALMOX ae'
      
        '      inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo' +
        ' and c.codcliente is null)'
      '    where coalesce(ae.qtde, 0) > 0'
      '      and ae.empresa = :empresa'
      '      and ae.produto = :produto'
      '    group by'
      '        ae.empresa'
      '      , ae.produto'
      '      , (case when ae.qtde > 0 then ae.fracionador else 0 end)'
      '  ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)'
      ''
      '  left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)'
      '  left join TBUNIDADEPROD ue on (ue.unp_cod = ep.unidade)'
      ''
      'where (e.cnpj = :empresa)'
      '  and (ex.produto = :produto)'
      '  and (ex.data between :data_inicial and :data_final)'
      ''
      'order by'
      '    ex.empresa'
      '  , p.descri_apresentacao'
      '  , p.cod'
      '  , ex.data'
      '  , ex.tipo'
      '  , ex.local')
    Left = 32
    Top = 200
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object DspExtratoMovimentoProduto: TDataSetProvider
    DataSet = QryExtratoMovimentoProduto
    Left = 64
    Top = 200
  end
  object CdsExtratoMovimentoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspExtratoMovimentoProduto'
    Left = 96
    Top = 200
  end
  object FrdsExtratoMovimentoProduto: TfrxDBDataset
    UserName = 'FrdsExtratoMovimentoProduto'
    CloseDataSource = True
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'COD=COD'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'UND_COMPRA=UND_COMPRA'
      'UND_COMPRA_SIGLA=UND_COMPRA_SIGLA'
      'ESTOQUE_ALMOX=ESTOQUE_ALMOX'
      'EMPRESA=EMPRESA'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'DATA=DATA'
      'LOCAL=LOCAL'
      'RESPONSAVEL=RESPONSAVEL'
      'TIPO=TIPO'
      'QUANT=QUANT'
      'VALOR_TOTAL=VALOR_TOTAL'
      'QUANT_APROPRIACAO=QUANT_APROPRIACAO'
      'QUANT_REQUISICAO=QUANT_REQUISICAO'
      'QUANT_SALDO_ALMOX=QUANT_SALDO_ALMOX'
      'VALOR_TOTAL_APROPRIACAO=VALOR_TOTAL_APROPRIACAO'
      'VALOR_TOTAL_REQUISICAO=VALOR_TOTAL_REQUISICAO'
      'VALOR_TOTAL_SALDO_ALMOX=VALOR_TOTAL_SALDO_ALMOX'
      'VALOR_ESTOQUE_ALMOX=VALOR_ESTOQUE_ALMOX'
      'UND_ALMOX=UND_ALMOX'
      'UND_ALMOX_SIGLA=UND_ALMOX_SIGLA')
    DataSet = CdsExtratoMovimentoProduto
    BCDToCurrency = True
    DataSetOptions = []
    Left = 128
    Top = 200
  end
  object frExtratoMovimentoProduto: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 45441.726118611110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Top = 200
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsExtratoMovimentoProduto
        DataSetName = 'FrdsExtratoMovimentoProduto'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'TESTE'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end
      item
        Name = 'Periodo'
        Value = #39#39
      end
      item
        Name = 'QuantidadeSaldo'
        Value = 
          '(<FrdsExtratoMovimentoProduto."QUANT_APROPRIACAO"> - <FrdsExtrat' +
          'oMovimentoProduto."QUANT_REQUISICAO">)'
      end
      item
        Name = 'Estoque'
        Value = '<FrdsExtratoMovimentoProduto."ESTOQUE_ALMOX">'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 139.842610000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 604.724800000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frdEmpresa."HOME_PAGE"][IIF(Trim(<frdEmpresa."HOME_PAGE">)='#39#39',<' +
              'frdEmpresa."EMAIL">,IIF(Trim(<frdEmpresa."EMAIL">)='#39#39','#39#39','#39' / '#39'+<' +
              'frdEmpresa."EMAIL">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 578.268090000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderEmpresa: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsExtratoMovimentoProduto."EMPRESA"'
        ReprintOnNewPage = True
        StartNewPage = True
        Stretched = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FrdsExtratoMovimentoProduto."COD"] - [FrdsExtratoMovimentoProdu' +
              'to."DESCRI_APRESENTACAO"]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = 13816530
          HAlign = haCenter
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = 13816530
          HAlign = haCenter
          Memo.UTF8W = (
            'Estoque')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39', <FrdsExtratoMovimentoProduto."ESTOQUE_ALMO' +
              'X">)] [FrdsExtratoMovimentoProduto."UND_COMPRA_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        DataSet = FrdsExtratoMovimentoProduto
        DataSetName = 'FrdsExtratoMovimentoProduto'
        RowCount = 0
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsExtratoMovimentoProduto."DAT' +
              'A">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Width = 64.251968503937010000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<FrdsExtratoMovimentoProduto."QUANT_APROPRIACAO">=0,'#39#39',Form' +
              'atFloat('#39',0.###'#39', <FrdsExtratoMovimentoProduto."QUANT_APROPRIACA' +
              'O">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 64.251968500000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<FrdsExtratoMovimentoProduto."QUANT_REQUISICAO">=0,'#39#39',Forma' +
              'tFloat('#39',0.###'#39', <FrdsExtratoMovimentoProduto."QUANT_REQUISICAO"' +
              '>))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Width = 56.692903620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = 13434879
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<QuantidadeSaldo>=0,'#39#39',FormatFloat('#39',0.###'#39', <QuantidadeSal' +
              'do>))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<FrdsExtratoMovimentoProduto."VALOR_TOTAL_APROPRIACAO">=0,'#39 +
              #39',FormatFloat('#39',0.00'#39', <FrdsExtratoMovimentoProduto."VALOR_TOTAL' +
              '_APROPRIACAO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<FrdsExtratoMovimentoProduto."VALOR_TOTAL_REQUISICAO">=0,'#39#39 +
              ',FormatFloat('#39',0.00'#39', <FrdsExtratoMovimentoProduto."VALOR_TOTAL_' +
              'REQUISICAO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 192.756030000000000000
          Width = 204.094573620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            ' [FrdsExtratoMovimentoProduto."LOCAL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Width = 113.385853620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            ' [FrdsExtratoMovimentoProduto."RESPONSAVEL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 438.425480000000000000
        Width = 718.110700000000000000
      end
      object BndFooter: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 483.779840000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            
              ' [FormatFloat('#39',0'#39', COUNT(BndMasterData, 2))] movimento(s) relac' +
              'ionado(s).')
          ParentFont = False
        end
      end
      object BndGrpHeaderProduto: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsExtratoMovimentoProduto."COD"'
        ReprintOnNewPage = True
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Data')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          CharSpacing = 1.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            'Movimenta'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 18.897650000000000000
          Width = 64.251968503937010000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Entrada')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 18.897650000000000000
          Width = 64.251968500000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Saida')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 18.897650000000000000
          Width = 56.692903620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clYellow
          HAlign = haCenter
          Memo.UTF8W = (
            'E/S')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          CharSpacing = 1.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Valores (R$)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Entrada')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Sa'#237'da')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 192.756030000000000000
          Top = 18.897650000000000000
          Width = 204.094573620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Local')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Top = 18.897650000000000000
          Width = 113.385853620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Respons'#225'vel')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterProduto: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 385.512060000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Width = 64.251968503937010000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.###'#39', SUM(<FrdsExtratoMovimentoProduto."QUANT_A' +
              'PROPRIACAO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 64.251968500000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.###'#39', SUM(<FrdsExtratoMovimentoProduto."QUANT_R' +
              'EQUISICAO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 75.590553620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM((<FrdsExtratoMovimentoProduto."VALOR_T' +
              'OTAL_APROPRIACAO">)))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590553620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsExtratoMovimentoProduto."VALOR_TO' +
              'TAL_REQUISICAO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 192.756030000000000000
          Width = 374.173423620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Width = 64.251963620000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Width = 56.692903620000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Fill.BackColor = 10027007
          HAlign = haCenter
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '(SUM(<QuantidadeSaldo>) <> <Estoque>)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.###'#39', SUM(<QuantidadeSaldo>))] [FrdsExtratoMovi' +
              'mentoProduto."UND_ALMOX_SIGLA"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
end
