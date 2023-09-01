inherited frmGeEntradaImpressao: TfrmGeEntradaImpressao
  Left = 388
  Top = 219
  Caption = 'Relat'#243'rio de Entradas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBanner: TPanel
    inherited imgBanner: TImage
      ExplicitLeft = -2
      ExplicitHeight = 260
    end
  end
  inherited pnlRelatorio: TPanel
    inherited GrpBxRelatorio: TGroupBox
      inherited edRelatorio: TComboBox
        Items.Strings = (
          'Relat'#243'rio Geral de Entradas por Tipo de Movimento (Sint'#233'tico)'
          'Relat'#243'rio Geral de Entradas por Tipo de Movimento (Anal'#237'tico)'
          'Relat'#243'rio Geral de Entradas por CFOP (Sint'#233'tico)'
          'Rela'#231#227'o de Notas Fiscais de Entrada'
          'Hist'#243'rico de Entradas e Sa'#237'das do Produto')
      end
    end
    inherited GrpBxFiltro: TGroupBox
      object lblData: TLabel
        Left = 52
        Top = 50
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo:'
        FocusControl = e1Data
      end
      object lblTipoEntrada: TLabel
        Left = 24
        Top = 99
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Entrada:'
        FocusControl = edTipoEntrada
      end
      object lblTipoDocumento: TLabel
        Left = 30
        Top = 123
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Documento:'
        FocusControl = edTipoDocumento
      end
      object lblEmpresa: TLabel
        Left = 46
        Top = 27
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Empresa:'
        FocusControl = edEmpresa
      end
      object lblSituacao: TLabel
        Left = 46
        Top = 74
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        FocusControl = edSituacao
      end
      object lblProduto: TLabel
        Left = 50
        Top = 74
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Produto:'
        FocusControl = edProduto
        Visible = False
      end
      object edSituacao: TComboBox
        Left = 104
        Top = 72
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 3
        Text = 'Finalizado'
        Items.Strings = (
          '(Todas)'
          'Finalizado'
          'NF Emitida'
          'Finalizada / NF Emitida'
          'Cancelado')
      end
      object edTipoEntrada: TComboBox
        Left = 104
        Top = 96
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 4
        Text = 'Finalizado'
        Items.Strings = (
          '(Todas)'
          'Finalizado'
          'NF Emitida'
          'Finalizada / NF Emitida'
          'Cancelado')
      end
      object edTipoDocumento: TComboBox
        Left = 104
        Top = 120
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 5
        Text = 'Finalizado'
        Items.Strings = (
          '(Todas)'
          'Finalizado'
          'NF Emitida'
          'Finalizada / NF Emitida'
          'Cancelado')
      end
      object chkDFInformada: TCheckBox
        Left = 104
        Top = 144
        Width = 313
        Height = 17
        Caption = 'Apenas com Documentos Fiscais informados'
        TabOrder = 7
        OnClick = chkDFInformadaClick
      end
      object edEmpresa: TComboBox
        Left = 104
        Top = 24
        Width = 313
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
      object e1Data: TJvDateEdit
        Left = 104
        Top = 47
        Width = 99
        Height = 21
        Date = 40909.000000000000000000
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
        TabOrder = 1
      end
      object e2Data: TJvDateEdit
        Left = 208
        Top = 47
        Width = 103
        Height = 21
        Date = 40909.000000000000000000
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
        TabOrder = 2
      end
      object edProduto: TJvComboEdit
        Left = 104
        Top = 71
        Width = 313
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
        TabOrder = 6
        Text = ''
        Visible = False
        OnButtonClick = edProdutoButtonClick
        OnKeyPress = edProdutoKeyPress
      end
    end
  end
  object frRelacaoEntradaGeralSintetico: TfrxReport
    Version = '6.3.7'
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
    Left = 8
    Top = 8
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdsRelacaoEntradaGeralSintetico
        DataSetName = 'frdsRelacaoEntradaGeralSintetico'
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
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Situa'#231#227'o entradas:')
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
          Left = 226.771800000000000000
          Top = 120.944960000000000000
          Width = 491.338900000000000000
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
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 665.197280000000000000
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
      object BndGrpHeaderTipoMov: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'frdsRelacaoEntradaGeralSintetico."TIPO_MOVIMENTO"'
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
            ' [frdsRelacaoEntradaGeralSintetico."TIPO_MOVIMENTO_DESC"]')
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
            ' Movimento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 370.393940000000000000
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
            'Classifica'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 37.795300000000000000
          Width = 185.196970000000000000
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
            'Tipo Entrada / Documento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
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
            'Desc. (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Top = 18.897650000000000000
          Width = 347.716760000000000000
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
            'Total Entrada')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 185.196970000000000000
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
            ' Tipo Despesa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<frdsRelacaoEntradaGeralSintetico."TIPO_MOVIMENTO">=0,'#39'Prod' +
              'utos'#39','#39'Servi'#231'os'#39')] (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 37.795300000000000000
          Width = 75.590551180000000000
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
            'IPI (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = frdsRelacaoEntradaGeralSintetico
        DataSetName = 'frdsRelacaoEntradaGeralSintetico'
        RowCount = 0
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 185.196970000000000000
          Width = 185.196970000000000000
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
          Highlight.Condition = '<frdsRelacaoEntradaGeralSintetico."STATUS">=3'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [Trim(<frdsRelacaoEntradaGeralSintetico."TIPO_ENTRADA_DESC">)] ' +
              '/ [Trim(<frdsRelacaoEntradaGeralSintetico."TIPO_DOCUMENTO_DESC">' +
              ')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = '<frdsRelacaoEntradaGeralSintetico."STATUS">=3'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdsRelacaoEntradaGeralSintetico."TOTAL_DE' +
              'SCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
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
          Highlight.Condition = '<frdsRelacaoEntradaGeralSintetico."STATUS">=3'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdsRelacaoEntradaGeralSintetico."TOTAL_NO' +
              'TA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Width = 185.196970000000000000
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
          Highlight.Condition = '<frdsRelacaoEntradaGeralSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [Trim(<frdsRelacaoEntradaGeralSintetico."TIPO_DESPESA_DESC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
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
          Highlight.Condition = '<frdsRelacaoEntradaGeralSintetico."STATUS">=3'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdsRelacaoEntradaGeralSintetico."TOTAL_PR' +
              'ODUTO_SERVICO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = '<frdsRelacaoEntradaGeralSintetico."STATUS">=3'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdsRelacaoEntradaGeralSintetico."TOTAL_IP' +
              'I">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoMov: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 355.275820000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_NOTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_DESCONTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_PRODUTO_SERVICO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_IPI">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 200.315090000000000000
        Top = 442.205010000000000000
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
              'e a situa'#231#227'o da compras informados')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 45.354360000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_PRODUTO_SERVICO">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 45.354360000000000000
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
            'Produto/Servi'#231'o: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 26.456710000000000000
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
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 120.944960000000000000
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
            'Total Descontos: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 139.842610000000000000
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
            'Total L'#237'quido: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 120.944960000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_DESCONTO">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 139.842610000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_NOTA">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 177.637910000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          Visible = False
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
          Top = 177.637910000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39', SUM(<TotalLiquidoReal>,BndMasterData,2))] ')
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
            ' * Entrada(s) Cancelada(s)')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 64.252010000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_IPI">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 64.252010000000000000
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
            'IPI: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_FRETE">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 83.149660000000000000
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
            'Frete: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 102.047310000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaGeralSintetico."TOT' +
              'AL_OUTROS">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 102.047310000000000000
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
            'Outros: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 158.740260000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          Visible = False
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
          Top = 158.740260000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM((<frdsRelacaoEntradaGeralSintetico."TO' +
              'TAL_NOTA">-<TotalLiquidoReal>),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object dspRelacaoEntradaGeralSintetico: TDataSetProvider
    DataSet = qryRelacaoEntradaGeralSintetico
    Left = 72
    Top = 8
  end
  object cdsRelacaoEntradaGeralSintetico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelacaoEntradaGeralSintetico'
    Left = 104
    Top = 8
  end
  object frdsRelacaoEntradaGeralSintetico: TfrxDBDataset
    UserName = 'frdsRelacaoEntradaGeralSintetico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'TIPO_MOVIMENTO=TIPO_MOVIMENTO'
      'TIPO_MOVIMENTO_DESC=TIPO_MOVIMENTO_DESC'
      'TIPO_ENTRADA=TIPO_ENTRADA'
      'TIPO_ENTRADA_DESC=TIPO_ENTRADA_DESC'
      'TIPO_DOCUMENTO=TIPO_DOCUMENTO'
      'TIPO_DOCUMENTO_DESC=TIPO_DOCUMENTO_DESC'
      'TIPO_DESPESA=TIPO_DESPESA'
      'TIPO_DESPESA_DESC=TIPO_DESPESA_DESC'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'TOTAL_ALIQUOTA_BASE=TOTAL_ALIQUOTA_BASE'
      'TOTAL_ALIQUOTA=TOTAL_ALIQUOTA'
      'TOTAL_ALIQUOTA_BASE_SUBS=TOTAL_ALIQUOTA_BASE_SUBS'
      'TOTAL_ALIQUOTA_SUBS=TOTAL_ALIQUOTA_SUBS'
      'TOTAL_IPI=TOTAL_IPI'
      'TOTAL_FRETE=TOTAL_FRETE'
      'TOTAL_OUTROS=TOTAL_OUTROS'
      'TOTAL_SEGURO=TOTAL_SEGURO'
      'TOTAL_PIS=TOTAL_PIS'
      'TOTAL_COFINS=TOTAL_COFINS'
      'TOTAL_DESCONTO=TOTAL_DESCONTO'
      'TOTAL_PRODUTO_SERVICO=TOTAL_PRODUTO_SERVICO'
      'TOTAL_NOTA=TOTAL_NOTA')
    DataSet = cdsRelacaoEntradaGeralSintetico
    BCDToCurrency = True
    Left = 136
    Top = 8
  end
  object frRelacaoEntradaGeralAnalitico: TfrxReport
    Version = '6.3.7'
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
    Left = 8
    Top = 40
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdsRelacaoEntradaGeralAnalitico
        DataSetName = 'FrdsRelacaoEntradaGeralAnalitico'
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
        Name = 'StatusEntradaCancelada'
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
            'Situa'#231#227'o entradas:')
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
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 665.197280000000000000
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
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 963.780150000000000000
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
            ' [FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO_DESC"]')
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
            ' Movimento')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 404.409710000000000000
        Width = 1046.929810000000000000
        DataSet = frdsRelacaoEntradaGeralAnalitico
        DataSetName = 'FrdsRelacaoEntradaGeralAnalitico'
        RowCount = 0
        object Memo13: TfrxMemoView
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
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_PR' +
              'ODUTO_SERVICO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_IP' +
              'I">)] ')
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_NO' +
              'TA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."ENTRADA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoEntradaGeralAnalitico' +
              '."DTEMISS">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."DOCUMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."TIPO_DOCUMENTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299320000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoEntradaGeralAnalitico' +
              '."DTENT">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Width = 132.283486540000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."TIPO_ENTRADA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_DE' +
              'SCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_FR' +
              'ETE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_OU' +
              'TROS">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoMov: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 521.575140000000000000
        Width = 1046.929810000000000000
        object SysMemo7: TfrxSysMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_PRODUTO_SERVICO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Width = 298.582806540000000000
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
            '[FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_FRETE">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_OUTROS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_IPI">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_DESCONTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_NOTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 604.724800000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Entrada(s) Cancelada(s).')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Width = 498.897896540000000000
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
        object SysMemo13: TfrxSysMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Top = 18.897650000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoEntradaGeralAnalitico."TOT' +
              'AL_PRODUTO_SERVICO">),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo14: TfrxSysMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_FRETE">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo15: TfrxSysMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_OUTROS">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo16: TfrxSysMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_IPI">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo17: TfrxSysMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_DESCONTO">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo18: TfrxSysMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
          Top = 18.897650000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_NOTA">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderTipoDesp: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEntradaGeralAnalitico."TIPO_DESPESA"'
        ReprintOnNewPage = True
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Width = 83.149660000000000000
          Height = 18.897637800000000000
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
            ' Tipo Despesa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 963.780150000000000000
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
            ' [FrdsRelacaoEntradaGeralAnalitico."TIPO_DESPESA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoDesp: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 476.220780000000000000
        Width = 1046.929810000000000000
        object SysMemo12: TfrxSysMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_PRODUTO_SERVICO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Width = 298.582806540000000000
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
            '[FrdsRelacaoEntradaGeralAnalitico."TIPO_DESPESA_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_FRETE">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_OUTROS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_IPI">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo9: TfrxSysMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_DESCONTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_NOTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderForn: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 325.039580000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEntradaGeralAnalitico."FORN_COD"'
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
            
              ' [IIF(<FrdsRelacaoEntradaGeralAnalitico."FORN_PF">=1,FormatMaskT' +
              'ext('#39'###.###.###-##;0;'#39',<FrdsRelacaoEntradaGeralAnalitico."FORN_' +
              'CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoEntra' +
              'daGeralAnalitico."FORN_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 498.897960000000000000
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
            'Totais Entradas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
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
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO">=0,'#39'Prod' +
              'utos'#39', '#39'Servi'#231'os'#39')] (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
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
            ' No. Entrada')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
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
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
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
            ' Documento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 548.031850000000000000
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
            'Dados da Entrada')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Width = 83.149660000000000000
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
          Left = 83.149660000000000000
          Width = 578.268090000000000000
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
            ' [FrdsRelacaoEntradaGeralAnalitico."FORN_RAZAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
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
            ' No.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299320000000000000
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
            ' Entrada')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 37.795300000000000000
          Width = 132.283486540000000000
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
            ' Tipo Entrada')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
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
            'Desc. (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Top = 37.795300000000000000
          Width = 75.590551180000000000
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
            'IPI (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Top = 37.795300000000000000
          Width = 75.590551180000000000
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
            'Outros (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 37.795300000000000000
          Width = 75.590551180000000000
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
            'Frete (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterForn: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 7.559060000000000000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  object dspRelacaoEntradaGeralAnalitico: TDataSetProvider
    DataSet = qryRelacaoEntradaGeralAnalitico
    Left = 72
    Top = 40
  end
  object cdsRelacaoEntradaGeralAnalitico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelacaoEntradaGeralAnalitico'
    Left = 104
    Top = 40
  end
  object frdsRelacaoEntradaGeralAnalitico: TfrxDBDataset
    UserName = 'FrdsRelacaoEntradaGeralAnalitico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'CODEMP=CODEMP'
      'ENTRADA=ENTRADA'
      'TIPO_MOVIMENTO=TIPO_MOVIMENTO'
      'TIPO_MOVIMENTO_DESC=TIPO_MOVIMENTO_DESC'
      'COMPETENCIA=COMPETENCIA'
      'COMPETENCIA_DESC=COMPETENCIA_DESC'
      'TIPO_ENTRADA=TIPO_ENTRADA'
      'TIPO_ENTRADA_DESC=TIPO_ENTRADA_DESC'
      'TIPO_DESPESA=TIPO_DESPESA'
      'TIPO_DESPESA_DESC=TIPO_DESPESA_DESC'
      'CFOP=CFOP'
      'CFOP_DESCRICAO=CFOP_DESCRICAO'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'FORN_COD=FORN_COD'
      'FORN_RAZAO=FORN_RAZAO'
      'FORN_FANTASIA=FORN_FANTASIA'
      'FORN_PF=FORN_PF'
      'FORN_CNPJ=FORN_CNPJ'
      'TIPO_DOCUMENTO=TIPO_DOCUMENTO'
      'TIPO_DOCUMENTO_DESC=TIPO_DOCUMENTO_DESC'
      'DOCUMENTO=DOCUMENTO'
      'DOCUMENTO_NUMERO=DOCUMENTO_NUMERO'
      'DOCUMENTO_SERIE=DOCUMENTO_SERIE'
      'DTLANCAMENTO=DTLANCAMENTO'
      'DTEMISS=DTEMISS'
      'DTENT=DTENT'
      'TOTAL_ALIQUOTA_BASE=TOTAL_ALIQUOTA_BASE'
      'TOTAL_ALIQUOTA=TOTAL_ALIQUOTA'
      'TOTAL_ALIQUOTA_BASE_SUBS=TOTAL_ALIQUOTA_BASE_SUBS'
      'TOTAL_ALIQUOTA_SUBS=TOTAL_ALIQUOTA_SUBS'
      'TOTAL_IPI=TOTAL_IPI'
      'TOTAL_FRETE=TOTAL_FRETE'
      'TOTAL_OUTROS=TOTAL_OUTROS'
      'TOTAL_SEGURO=TOTAL_SEGURO'
      'TOTAL_PIS=TOTAL_PIS'
      'TOTAL_COFINS=TOTAL_COFINS'
      'TOTAL_DESCONTO=TOTAL_DESCONTO'
      'TOTAL_PRODUTO_SERVICO=TOTAL_PRODUTO_SERVICO'
      'TOTAL_NOTA=TOTAL_NOTA')
    DataSet = cdsRelacaoEntradaGeralAnalitico
    BCDToCurrency = True
    Left = 136
    Top = 40
  end
  object frRelacaoEntradaNotaFiscal: TfrxReport
    Version = '6.3.7'
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
    Left = 8
    Top = 80
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdsRelacaoEntradaGeralAnalitico
        DataSetName = 'FrdsRelacaoEntradaGeralAnalitico'
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
        Name = 'StatusEntradaCancelada'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
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
            'Situa'#231#227'o entradas:')
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
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 597.165740000000000000
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
      object BndGrpHeaderTipoMov: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO"'
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
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO_DESC"]')
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
            ' Movimento')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        DataSet = frdsRelacaoEntradaGeralAnalitico
        DataSetName = 'FrdsRelacaoEntradaGeralAnalitico'
        RowCount = 0
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 98.267716540000000000
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
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_NO' +
              'TA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."ENTRADA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 68.031476540000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoEntradaGeralAnalitico' +
              '."DTEMISS">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181200000000000000
          Width = 393.071056540000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FrdsRelacaoEntradaGeralAnalitico."FORN_RAZAO"] -  [IIF(<FrdsRe' +
              'lacaoEntradaGeralAnalitico."FORN_PF">=1,FormatMaskText('#39'###.###.' +
              '###-##;0;'#39',<FrdsRelacaoEntradaGeralAnalitico."FORN_CNPJ">),Forma' +
              'tMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoEntradaGeralAnalit' +
              'ico."FORN_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 75.590536540000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatFloat('#39'###0000000'#39', <FrdsRelacaoEntradaGeralAnalitico."D' +
              'OCUMENTO_NUMERO">)]-[FrdsRelacaoEntradaGeralAnalitico."DOCUMENTO' +
              '_SERIE"][IIF(<FrdsRelacaoEntradaGeralAnalitico."TIPO_DOCUMENTO">' +
              '=0,'#39'*'#39',IIF(<FrdsRelacaoEntradaGeralAnalitico."TIPO_DOCUMENTO">=4' +
              ','#39'*'#39','#39#39'))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoMov: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 453.543600000000000000
        Width = 718.110700000000000000
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
          Width = 204.094556540000000000
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
            '[FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo10: TfrxSysMemoView
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_NOTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 75.590600000000000000
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
            '[FormatFloat('#39',0'#39',COUNT(BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 536.693260000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 544.252320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Entrada(s) Cancelada(s).')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 173.858316540000000000
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
        object SysMemo18: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 18.897650000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_NOTA">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
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
            '[FormatFloat('#39',0'#39',COUNT(BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 544.252320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * N'#250'mero de documento n'#227'o corresponde a uma Nota Fiscal')
          ParentFont = False
        end
      end
      object BndGrpHeaderComp: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoEntradaGeralAnalitico."COMPETENCIA"'
        ReprintOnNewPage = True
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
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
            'Nota Fiscal')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
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
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
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
            ' No. Entrada')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Top = 37.795300000000000000
          Width = 68.031476540000000000
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
          Width = 544.252320000000000000
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
            'Dados da Entrada')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181200000000000000
          Top = 37.795300000000000000
          Width = 393.071056540000000000
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
            ' Fornecedor')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 37.795300000000000000
          Width = 75.590536540000000000
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
            ' N'#250'mero')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Width = 83.149660000000000000
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
            ' Compet'#234'ncia:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
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
            ' [FrdsRelacaoEntradaGeralAnalitico."COMPETENCIA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterComp: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 3.779530000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_NOTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
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
            '[FormatFloat('#39',0'#39',COUNT(BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 3.779530000000000000
          Width = 204.094556540000000000
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
            '[FrdsRelacaoEntradaGeralAnalitico."COMPETENCIA_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
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
  object fdQryTipoEntrada: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    te.tpe_codigo'
      '  , te.tpe_descricao'
      'from VW_TIPO_ENTRADA te')
    Left = 448
    Top = 40
  end
  object fdQryTipoDocumento: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    tde.tpd_codigo'
      '  , tde.tpd_descricao'
      'from VW_TIPO_DOCUMENTO_ENTRADA tde')
    Left = 448
    Top = 72
  end
  object qryRelacaoEntradaGeralSintetico: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.tipo_movimento'
      '  , Case c.tipo_movimento'
      '      when 0 then '#39'Entradas de Produtos'#39
      '      when 1 then '#39'Entradas de Servi'#231'os'#39
      '    end as tipo_movimento_desc'
      '  , c.tipo_entrada'
      '  , te.tpe_descricao as tipo_entrada_desc'
      '  , c.tipo_documento'
      '  , tn.tpd_descricao as tipo_documento_desc'
      '  , c.tipo_despesa'
      '  , td.tipodesp      as tipo_despesa_desc'
      '  , c.status'
      '  , Case c.status'
      '      when 1 then '#39'Aberto'#39
      '      when 2 then '#39'Finalizado'#39
      '      when 3 then '#39'Cancelado'#39
      '      when 4 then '#39'NF-e Emitida'#39
      '    end as status_desc'
      '  , sum( coalesce(c.icmsbase, 0.0)  ) as total_aliquota_base'
      '  , sum( coalesce(c.icmsvalor, 0.0) ) as total_aliquota'
      
        '  , sum( coalesce(c.icmssubstbase, 0.0)  ) as total_aliquota_bas' +
        'e_subs'
      
        '  , sum( coalesce(c.icmssubstvalor, 0.0) ) as total_aliquota_sub' +
        's'
      '  , sum( coalesce(c.ipi, 0.0)   ) as total_ipi'
      '  , sum( coalesce(c.frete, 0.0) ) as total_frete'
      '  , sum( coalesce(c.outroscustos, 0.0) ) as total_outros'
      '  , sum( coalesce(c.valorseguro, 0.0)  ) as total_seguro'
      '  , sum( coalesce(c.valorpis, 0.0)     ) as total_pis'
      '  , sum( coalesce(c.valorcofins, 0.0)  ) as total_cofins'
      '  , sum( coalesce(c.desconto, 0.0)     ) as total_desconto'
      
        '  , sum( coalesce(c.totalprod, 0.0)    ) as total_produto_servic' +
        'o'
      '  , sum( coalesce(c.totalnf, 0.0)      ) as total_nota'
      'from TBCOMPRAS c'
      
        '  left join VW_TIPO_ENTRADA te on (te.tpe_codigo = c.tipo_entrad' +
        'a)'
      
        '  left join VW_TIPO_DOCUMENTO_ENTRADA tn on (tn.tpd_codigo = c.t' +
        'ipo_documento)'
      '  left join TBTPDESPESA td on (td.cod = c.tipo_despesa)'
      ''
      '/*'
      'where c.codemp = '#39'03041377000187'#39
      '  and c.status > 1 -- 1. Aberto'
      ''
      'group by'
      '    c.tipo_movimento'
      '  , c.tipo_entrada'
      '  , te.tpe_descricao'
      '  , c.tipo_documento'
      '  , tn.tpd_descricao'
      '  , c.tipo_despesa'
      '  , td.tipodesp'
      '  , c.status'
      ''
      'order by'
      '    c.tipo_movimento'
      '  , td.tipodesp'
      '  , te.tpe_descricao'
      '*/')
    Left = 40
    Top = 8
  end
  object qryRelacaoEntradaGeralAnalitico: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codcontrol'
      '  , c.codemp'
      
        '  , c.ano || '#39'/'#39' || right('#39'000000'#39' || c.codcontrol, 7) as entrad' +
        'a'
      '  , c.tipo_movimento'
      '  , Case c.tipo_movimento'
      '      when 0 then '#39'Entradas de Produtos'#39
      '      when 1 then '#39'Entradas de Servi'#231'os'#39
      '    end as tipo_movimento_desc'
      
        '  , (extract(year from c.dtemiss) || right('#39'00'#39' || extract(month' +
        ' from c.dtemiss), 2)) as competencia'
      '  , ce.cmp_desc as competencia_desc'
      '  , c.tipo_entrada'
      '  , te.tpe_descricao as tipo_entrada_desc'
      '  , c.tipo_despesa'
      '  , td.tipodesp      as tipo_despesa_desc'
      
        '  , case when c.tipo_movimento = 0 then c.nfcfop          else '#39 +
        #39' end as cfop'
      
        '  , case when c.tipo_movimento = 0 then cc.cfop_descricao else '#39 +
        'Servi'#231'os'#39' end as cfop_descricao'
      '  , c.status'
      '  , Case c.status'
      '      when 1 then '#39'Aberto'#39
      '      when 2 then '#39'Finalizado'#39
      '      when 3 then '#39'Cancelado'#39
      '      when 4 then '#39'NF-e Emitida'#39
      '    end as status_desc'
      ''
      '  , c.codforn  as forn_cod'
      '  , f.nomeforn as forn_razao'
      '  , f.nomefant as forn_fantasia'
      '  , f.pessoa_fisica as forn_pf'
      '  , f.cnpj          as forn_cnpj'
      '  , c.tipo_documento'
      '  , tn.tpd_descricao as tipo_documento_desc'
      
        '  , right('#39'000000'#39' || c.nf, 7) || (Case when c.tipo_documento = ' +
        '0 then '#39#39' else '#39'-'#39' || c.nfserie end) as documento'
      '  , c.nf             as documento_numero'
      '  , c.nfserie        as documento_serie'
      ''
      '  , c.dtlancamento'
      '  , c.dtemiss'
      '  , c.dtent'
      ''
      '  , coalesce(c.icmsbase, 0.0)  as total_aliquota_base'
      '  , coalesce(c.icmsvalor, 0.0) as total_aliquota'
      '  , coalesce(c.icmssubstbase, 0.0)  as total_aliquota_base_subs'
      '  , coalesce(c.icmssubstvalor, 0.0) as total_aliquota_subs'
      '  , coalesce(c.ipi, 0.0)   as total_ipi'
      '  , coalesce(c.frete, 0.0) as total_frete'
      '  , coalesce(c.outroscustos, 0.0) as total_outros'
      '  , coalesce(c.valorseguro, 0.0)  as total_seguro'
      '  , coalesce(c.valorpis, 0.0)     as total_pis'
      '  , coalesce(c.valorcofins, 0.0)  as total_cofins'
      '  , coalesce(c.desconto, 0.0)     as total_desconto'
      '  , coalesce(c.totalprod, 0.0)    as total_produto_servico'
      '  , coalesce(c.totalnf, 0.0)      as total_nota'
      'from TBCOMPRAS c'
      
        '  left join VW_TIPO_ENTRADA te on (te.tpe_codigo = c.tipo_entrad' +
        'a)'
      
        '  left join VW_TIPO_DOCUMENTO_ENTRADA tn on (tn.tpd_codigo = c.t' +
        'ipo_documento)'
      '  left join TBTPDESPESA td on (td.cod = c.tipo_despesa)'
      '  left join TBCFOP cc on (cc.cfop_cod = c.nfcfop)'
      '  left join TBFORNECEDOR f on (f.codforn = c.codforn)'
      
        '  left join TBCOMPETENCIA ce on (ce.cmp_num = (extract(year from' +
        ' c.dtemiss) || right('#39'00'#39' || extract(month from c.dtemiss), 2)))'
      ''
      '/*'
      'where c.codemp = '#39'26352874000100'#39
      '  and c.status > 1 -- 1. Aberto'
      ''
      'order by'
      '    c.tipo_movimento'
      '  , td.tipodesp'
      '  , te.tpe_descricao'
      '  , c.nfcfop'
      '  , f.nomeforn'
      '  , f.nomefant'
      '  , c.codforn'
      '  , c.dtemiss'
      '*/')
    Left = 40
    Top = 40
  end
  object frRelacaoEntradaCFOPAnalitico: TfrxReport
    Version = '6.3.7'
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
    Left = 168
    Top = 40
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdsRelacaoEntradaGeralAnalitico
        DataSetName = 'FrdsRelacaoEntradaGeralAnalitico'
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
        Name = 'StatusEntradaCancelada'
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
            'Situa'#231#227'o entradas:')
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
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 665.197280000000000000
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
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 963.780150000000000000
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
            ' [FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO_DESC"]')
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
            ' Movimento')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 404.409710000000000000
        Width = 1046.929810000000000000
        DataSet = frdsRelacaoEntradaGeralAnalitico
        DataSetName = 'FrdsRelacaoEntradaGeralAnalitico'
        RowCount = 0
        object Memo13: TfrxMemoView
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
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_PR' +
              'ODUTO_SERVICO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_IP' +
              'I">)] ')
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_NO' +
              'TA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."ENTRADA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoEntradaGeralAnalitico' +
              '."DTEMISS">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."DOCUMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."TIPO_DOCUMENTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299320000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoEntradaGeralAnalitico' +
              '."DTENT">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Width = 132.283486540000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEntradaGeralAnalitico."TIPO_ENTRADA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_DE' +
              'SCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_FR' +
              'ETE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Width = 75.590600000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoEntradaGeralAnalitico."STATUS">=<StatusEntradaCancel' +
            'ada>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEntradaGeralAnalitico."TOTAL_OU' +
              'TROS">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoMov: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 521.575140000000000000
        Width = 1046.929810000000000000
        object SysMemo7: TfrxSysMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_PRODUTO_SERVICO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Width = 298.582806540000000000
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
            '[FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_FRETE">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_OUTROS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_IPI">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_DESCONTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_NOTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 604.724800000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Entrada(s) Cancelada(s).')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Width = 498.897896540000000000
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
        object SysMemo13: TfrxSysMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Top = 18.897650000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoEntradaGeralAnalitico."TOT' +
              'AL_PRODUTO_SERVICO">),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo14: TfrxSysMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_FRETE">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo15: TfrxSysMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_OUTROS">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo16: TfrxSysMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_IPI">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo17: TfrxSysMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_DESCONTO">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo18: TfrxSysMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
          Top = 18.897650000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_NOTA">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderTipoDesp: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEntradaGeralAnalitico."TIPO_DESPESA"'
        ReprintOnNewPage = True
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Width = 83.149660000000000000
          Height = 18.897637800000000000
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
            ' Tipo Despesa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 963.780150000000000000
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
            ' [FrdsRelacaoEntradaGeralAnalitico."TIPO_DESPESA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoDesp: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 476.220780000000000000
        Width = 1046.929810000000000000
        object SysMemo12: TfrxSysMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_PRODUTO_SERVICO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Width = 298.582806540000000000
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
            '[FrdsRelacaoEntradaGeralAnalitico."TIPO_DESPESA_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_FRETE">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_OUTROS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_IPI">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo9: TfrxSysMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_DESCONTO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEntradaGeralAnalitico."TOTA' +
              'L_NOTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderForn: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 325.039580000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEntradaGeralAnalitico."FORN_COD"'
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
            
              ' [IIF(<FrdsRelacaoEntradaGeralAnalitico."FORN_PF">=1,FormatMaskT' +
              'ext('#39'###.###.###-##;0;'#39',<FrdsRelacaoEntradaGeralAnalitico."FORN_' +
              'CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoEntra' +
              'daGeralAnalitico."FORN_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 498.897960000000000000
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
            'Totais Entradas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
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
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<FrdsRelacaoEntradaGeralAnalitico."TIPO_MOVIMENTO">=0,'#39'Prod' +
              'utos'#39', '#39'Servi'#231'os'#39')] (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
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
            ' No. Entrada')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
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
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
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
            ' Documento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 548.031850000000000000
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
            'Dados da Entrada')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Width = 83.149660000000000000
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
          Left = 83.149660000000000000
          Width = 578.268090000000000000
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
            ' [FrdsRelacaoEntradaGeralAnalitico."FORN_RAZAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
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
            ' No.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299320000000000000
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
            ' Entrada')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 37.795300000000000000
          Width = 132.283486540000000000
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
            ' Tipo Entrada')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
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
            'Desc. (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 797.480830000000000000
          Top = 37.795300000000000000
          Width = 75.590551180000000000
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
            'IPI (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Top = 37.795300000000000000
          Width = 75.590551180000000000
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
            'Outros (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 37.795300000000000000
          Width = 75.590551180000000000
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
            'Frete (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterForn: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 7.559060000000000000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  object frRelacaoEntradaCFOPSintetico: TfrxReport
    Version = '6.3.7'
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
    Left = 8
    Top = 112
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdsRelacaoEntradaCFOPSintetico
        DataSetName = 'frdsRelacaoEntradaCFOPSintetico'
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
          'IIF(<frdsRelacaoEntradaCFOPSintetico."STATUS">=3,<StatusCancelad' +
          'o>,<frdsRelacaoEntradaCFOPSintetico."TOTAL_NOTA">)'
      end
      item
        Name = 'StatusCancelado'
        Value = '3'
      end
      item
        Name = 'TotalOutros'
        Value = 
          '(<frdsRelacaoEntradaCFOPSintetico."TOTAL_IPI">+<frdsRelacaoEntra' +
          'daCFOPSintetico."TOTAL_FRETE">+<frdsRelacaoEntradaCFOPSintetico.' +
          '"TOTAL_OUTROS">+<frdsRelacaoEntradaCFOPSintetico."TOTAL_SEGURO">' +
          ')'
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
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Situa'#231#227'o entradas:')
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
          Left = 226.771800000000000000
          Top = 120.944960000000000000
          Width = 491.338900000000000000
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
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 684.094930000000000000
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
      object BndGrpHeaderTipoMov: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'frdsRelacaoEntradaCFOPSintetico."TIPO_MOVIMENTO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Width = 646.299630000000000000
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
            ' [frdsRelacaoEntradaCFOPSintetico."TIPO_MOVIMENTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 71.811070000000000000
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
            ' Movimento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 370.393940000000000000
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
            'CFOP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 37.795300000000000000
          Width = 238.110390000000000000
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
            'Descri'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Top = 18.897650000000000000
          Width = 347.716760000000000000
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
            'Total Entrada')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 71.811070000000000000
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
            ' C'#243'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<frdsRelacaoEntradaCFOPSintetico."TIPO_MOVIMENTO">=0,'#39'Produ' +
              'tos'#39','#39'Servi'#231'os'#39')] (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 37.795300000000000000
          Width = 75.590551180000000000
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
            'IPI (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 37.795300000000000000
          Width = 75.590536540000000000
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
            
              '[IIF(<frdsRelacaoEntradaCFOPSintetico."TIPO_MOVIMENTO">=0,'#39'ICMS'#39 +
              ','#39'ISS'#39')] (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 309.921460000000000000
          Top = 37.795300000000000000
          Width = 60.472416540000000000
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
            'Entradas ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = frdsRelacaoEntradaCFOPSintetico
        DataSetName = 'frdsRelacaoEntradaCFOPSintetico'
        RowCount = 0
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Width = 238.110390000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoEntradaCFOPSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdsRelacaoEntradaCFOPSintetico."CFOP_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoEntradaCFOPSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdsRelacaoEntradaCFOPSintetico."TOTAL_NOT' +
              'A">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Width = 71.811070000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoEntradaCFOPSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdsRelacaoEntradaCFOPSintetico."CFOP_CODIGO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoEntradaCFOPSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdsRelacaoEntradaCFOPSintetico."TOTAL_PRO' +
              'DUTO_SERVICO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 75.590600000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoEntradaCFOPSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdsRelacaoEntradaCFOPSintetico."TOTAL_IPI' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 75.590600000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoEntradaCFOPSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdsRelacaoEntradaCFOPSintetico."TOTAL_ALI' +
              'QUOTA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 309.921460000000000000
          Width = 60.472416540000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoEntradaCFOPSintetico."STATUS">=<StatusCancelado>'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0'#39',<frdsRelacaoEntradaCFOPSintetico."QTDE_COMPRAS' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTipoMov: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 355.275820000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_NOTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_PRODUTO_SERVICO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_IPI">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo13: TfrxSysMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 75.590600000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_ALIQUOTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 219.212740000000000000
        Top = 442.205010000000000000
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
              'e a situa'#231#227'o da compras informados')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 45.354360000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_PRODUTO_SERVICO">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 45.354360000000000000
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
            'Produto / Servi'#231'o: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 26.456710000000000000
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
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 139.842610000000000000
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
            'Total Descontos: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 158.740260000000000000
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
            'Total L'#237'quido: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 139.842610000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_DESCONTO">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 158.740260000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_NOTA">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 196.535560000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          Visible = False
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
          Top = 196.535560000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39', SUM(<TotalLiquidoReal>,BndMasterData,2))] ')
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
            ' * Entrada(s) Cancelada(s)')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_IPI">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 83.149660000000000000
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
            'IPI: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 102.047310000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_FRETE">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 102.047310000000000000
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
            'Frete: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 120.944960000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_OUTROS">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 120.944960000000000000
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
            'Outros: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 177.637910000000000000
          Width = 113.385836540000000000
          Height = 18.897650000000000000
          Visible = False
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
          Top = 177.637910000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM((<frdsRelacaoEntradaCFOPSintetico."TOT' +
              'AL_NOTA">-<TotalLiquidoReal>),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo14: TfrxSysMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 64.252010000000000000
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
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdsRelacaoEntradaCFOPSintetico."TOTA' +
              'L_ALIQUOTA">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 64.252010000000000000
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
            'ICMS / ISS: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qryRelacaoEntradaCFOPSintetico: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.tipo_movimento'
      '  , Case c.tipo_movimento'
      '      when 0 then '#39'Entradas de Produtos'#39
      '      when 1 then '#39'Entradas de Servi'#231'os'#39
      '    end as tipo_movimento_desc'
      '  , c.status'
      '  , Case c.status'
      '      when 1 then '#39'Aberto'#39
      '      when 2 then '#39'Finalizado'#39
      '      when 3 then '#39'Cancelado'#39
      '      when 4 then '#39'NF-e Emitida'#39
      '    end as status_desc'
      '  , coalesce(c.nfcfop, '#39#39') as cfop_codigo'
      '  , coalesce(f.cfop_descricao, '#39'Servi'#231'os'#39') as cfop_descricao'
      '  , count( c.codcontrol ) as qtde_compras'
      '  , sum( c.nfe_enviada  ) as qtde_notas_emitidas'
      '  , sum( coalesce(c.icmsbase, 0.0)  ) as total_aliquota_base'
      '  , sum( coalesce(c.icmsvalor, 0.0) ) as total_aliquota'
      
        '  , sum( coalesce(c.icmssubstbase, 0.0)  ) as total_aliquota_bas' +
        'e_subs'
      
        '  , sum( coalesce(c.icmssubstvalor, 0.0) ) as total_aliquota_sub' +
        's'
      '  , sum( coalesce(c.ipi, 0.0)   ) as total_ipi'
      '  , sum( coalesce(c.frete, 0.0) ) as total_frete'
      '  , sum( coalesce(c.outroscustos, 0.0) ) as total_outros'
      '  , sum( coalesce(c.valorseguro, 0.0)  ) as total_seguro'
      '  , sum( coalesce(c.valorpis, 0.0)     ) as total_pis'
      '  , sum( coalesce(c.valorcofins, 0.0)  ) as total_cofins'
      '  , sum( coalesce(c.desconto, 0.0)     ) as total_desconto'
      
        '  , sum( coalesce(c.totalprod, 0.0)    ) as total_produto_servic' +
        'o'
      '  , sum( coalesce(c.totalnf, 0.0)      ) as total_nota'
      'from TBCOMPRAS c'
      
        '  left join VW_TIPO_DOCUMENTO_ENTRADA tn on (tn.tpd_codigo = c.t' +
        'ipo_documento)'
      '  left join TBCFOP f on (f.cfop_cod = c.nfcfop)'
      ''
      '/*'
      'where c.codemp = '#39'03041377000187'#39
      '  and c.status > 1 -- 1. Aberto'
      ''
      'group by'
      '    c.tipo_movimento'
      '  , c.status'
      '  , coalesce(c.nfcfop, '#39#39') '
      '  , coalesce(f.cfop_descricao, '#39'Servi'#231'os'#39')'
      ''
      'order by'
      '    c.tipo_movimento'
      '  , c.status'
      '  , coalesce(c.nfcfop, '#39#39') '
      '*/')
    Left = 40
    Top = 112
  end
  object dspRelacaoEntradaCFOPSintetico: TDataSetProvider
    DataSet = qryRelacaoEntradaCFOPSintetico
    Left = 72
    Top = 112
  end
  object cdsRelacaoEntradaCFOPSintetico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelacaoEntradaCFOPSintetico'
    Left = 104
    Top = 112
  end
  object frdsRelacaoEntradaCFOPSintetico: TfrxDBDataset
    UserName = 'frdsRelacaoEntradaCFOPSintetico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'TIPO_MOVIMENTO=TIPO_MOVIMENTO'
      'TIPO_MOVIMENTO_DESC=TIPO_MOVIMENTO_DESC'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'CFOP_CODIGO=CFOP_CODIGO'
      'CFOP_DESCRICAO=CFOP_DESCRICAO'
      'QTDE_COMPRAS=QTDE_COMPRAS'
      'QTDE_NOTAS_EMITIDAS=QTDE_NOTAS_EMITIDAS'
      'TOTAL_ALIQUOTA_BASE=TOTAL_ALIQUOTA_BASE'
      'TOTAL_ALIQUOTA=TOTAL_ALIQUOTA'
      'TOTAL_ALIQUOTA_BASE_SUBS=TOTAL_ALIQUOTA_BASE_SUBS'
      'TOTAL_ALIQUOTA_SUBS=TOTAL_ALIQUOTA_SUBS'
      'TOTAL_IPI=TOTAL_IPI'
      'TOTAL_FRETE=TOTAL_FRETE'
      'TOTAL_OUTROS=TOTAL_OUTROS'
      'TOTAL_SEGURO=TOTAL_SEGURO'
      'TOTAL_PIS=TOTAL_PIS'
      'TOTAL_COFINS=TOTAL_COFINS'
      'TOTAL_DESCONTO=TOTAL_DESCONTO'
      'TOTAL_PRODUTO_SERVICO=TOTAL_PRODUTO_SERVICO'
      'TOTAL_NOTA=TOTAL_NOTA')
    DataSet = cdsRelacaoEntradaCFOPSintetico
    BCDToCurrency = True
    Left = 136
    Top = 112
  end
  object frrHistoricoEntradaProduto: TfrxReport
    Version = '6.3.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 45169.674135185190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 8
    Top = 152
    Datasets = <
      item
        DataSet = FrdsHistoricoEntradaProduto
        DataSetName = 'ExtratoProduto'
      end
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
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
          '(<ExtratoProduto."QUANT_COMPRA"> - <ExtratoProduto."QUANT_REQUIS' +
          'ICAO">)'
      end
      item
        Name = 'Estoque'
        Value = '<ExtratoProduto."ESTOQUE_ALMOX">'
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
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        Condition = 'ExtratoProduto."EMPRESA"'
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
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[ExtratoProduto."COD"] - [ExtratoProduto."DESCRI_APRESENTACAO"]')
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
          Frame.Width = 0.100000000000000000
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
          Frame.Width = 0.100000000000000000
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
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39', <ExtratoProduto."ESTOQUE_ALMOX">)] [Extrat' +
              'oProduto."UND_COMPRA_SIGLA"]')
          ParentFont = False
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
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        DataSet = FrdsHistoricoEntradaProduto
        DataSetName = 'ExtratoProduto'
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
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FormatDateTime('#39'dd/mm/yyyy'#39', <ExtratoProduto."DATA">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Width = 71.811023620000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<ExtratoProduto."QUANT_COMPRA">=0,'#39#39',FormatFloat('#39',0.###'#39', ' +
              '<ExtratoProduto."QUANT_COMPRA">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Width = 71.811023620000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<ExtratoProduto."QUANT_REQUISICAO">=0,'#39#39',FormatFloat('#39',0.##' +
              '#'#39', <ExtratoProduto."QUANT_REQUISICAO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Width = 71.811023620000000000
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
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<ExtratoProduto."VALOR_TOTAL_COMPRA">=0,'#39#39',FormatFloat('#39',0.' +
              '00'#39', <ExtratoProduto."VALOR_TOTAL_COMPRA">))] ')
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
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<ExtratoProduto."VALOR_TOTAL_REQUISICAO">=0,'#39#39',FormatFloat(' +
              #39',0.00'#39', <ExtratoProduto."VALOR_TOTAL_REQUISICAO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Width = 287.244233620000000000
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
          Memo.UTF8W = (
            ' [ExtratoProduto."LOCAL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 438.425480000000000000
        Width = 718.110700000000000000
      end
      object BndFooter: TfrxFooter
        FillType = ftBrush
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
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [FormatFloat('#39',0'#39', COUNT(BndMasterData, 2))] movimento(s) relac' +
              'ionado(s).')
          ParentFont = False
        end
      end
      object BndGrpHeaderProduto: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        Condition = 'ExtratoProduto."COD"'
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
          Frame.Width = 0.100000000000000000
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
          Frame.Width = 0.100000000000000000
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
          Width = 71.811070000000000000
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
            'Entrada')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 18.897650000000000000
          Width = 71.811023620000000000
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
            'Saida')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 18.897650000000000000
          Width = 71.811023620000000000
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
          Frame.Width = 0.100000000000000000
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
          Frame.Width = 0.100000000000000000
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
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Sa'#237'da')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 18.897650000000000000
          Width = 287.244233620000000000
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
            ' Local')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterProduto: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 385.512060000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Width = 71.811023620000000000
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
            '[FormatFloat('#39',0.###'#39', SUM(<ExtratoProduto."QUANT_COMPRA">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Width = 71.811023620000000000
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
            
              '[FormatFloat('#39',0.###'#39', SUM(<ExtratoProduto."QUANT_REQUISICAO">))' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Width = 71.811023620000000000
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
            
              '[FormatFloat('#39',0.###'#39', SUM(<QuantidadeSaldo>))] [ExtratoProduto.' +
              '"UND_COMPRA_SIGLA"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
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
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM((<ExtratoProduto."VALOR_TOTAL_COMPRA">' +
              ')))] ')
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
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<ExtratoProduto."VALOR_TOTAL_REQUISICA' +
              'O">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Width = 287.244233620000000000
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
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object QryHistoricoEntradaProduto: TFDQuery
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
      
        '  , coalesce(nullif(trim(uc.unp_sigla), '#39#39'), uc.unp_descricao) a' +
        's und_compra_sigla'
      '  , p.fracionador'
      '  , uf.unp_descricao as und_fracao'
      
        '  , coalesce(nullif(trim(uf.unp_sigla), '#39#39'), uf.unp_descricao) a' +
        's und_fracao_sigla'
      '  , coalesce(ep.estoque_almox, 0) as estoque_almox'
      ''
      '  , ex.empresa'
      '  , e.rzsoc as empresa_razao'
      '  , ex.data'
      '  , ex.local'
      '  , ex.tipo'
      '  , ex.quant'
      '  , ex.valor_total'
      ''
      
        '  , Case when ex.tipo = 1 then ex.quant else 0 end as quant_comp' +
        'ra'
      
        '  , Case when ex.tipo = 3 then ex.quant else 0 end as quant_apro' +
        'priacao'
      
        '  , Case when ex.tipo = 4 then ex.quant else 0 end as quant_requ' +
        'isicao'
      ''
      '  , Case when ex.tipo = 1 then ex.quant else 0 end +'
      '    Case when ex.tipo = 2 then ex.quant else 0 end -'
      
        '    Case when ex.tipo = 4 then ex.quant else 0 end as quant_sald' +
        'o_almox'
      ''
      
        '  , Case when ex.tipo = 1 then ex.valor_total else 0 end as valo' +
        'r_total_compra'
      
        '  , Case when ex.tipo = 3 then ex.valor_total else 0 end as valo' +
        'r_total_apropriacao'
      
        '  , Case when ex.tipo = 4 then ex.valor_total else 0 end as valo' +
        'r_total_requisicao'
      ''
      '  , Case when ex.tipo = 1 then ex.valor_total else 0 end +'
      '    Case when ex.tipo = 2 then ex.valor_total else 0 end -'
      
        '    Case when ex.tipo = 4 then ex.valor_total else 0 end as valo' +
        'r_total_saldo_almox'
      ''
      '  , ep.valor_estoque_almox'
      '  , ue.unp_descricao as und_almox'
      
        '  , coalesce(nullif(trim(ue.unp_sigla), '#39#39'), ue.unp_descricao) a' +
        's und_almox_sigla'
      'from TBEMPRESA e'
      '  inner join ('
      ''
      '    /* Compras */'
      '    select'
      '        c.codemp   as empresa'
      '      , ci.codprod as produto'
      '      , c.dtent    as data'
      '      , '#39'ESTOQUE'#39'  as local'
      '      --, fn.nomeforn as local'
      '      , sum(ci.qtde)        as quant'
      '      , sum(ci.total_liquido) as valor_total'
      '      , 1 as tipo'
      '    from TBCOMPRAS c'
      
        '      inner join TBCOMPRASITENS ci on (ci.ano = c.ano and ci.cod' +
        'control = c.codcontrol and ci.codemp = c.codemp)'
      '      --left join TBFORNECEDOR fn on (fn.codforn = c.codforn)'
      '    where c.status in (2, 4) -- Finalizada e NF Emitida'
      '      and c.codemp   = :empresa'
      '      and ci.codprod = :produto'
      '    group by'
      '        c.codemp'
      '      , ci.codprod'
      '      , c.dtent'
      '      --, fn.nomeforn'
      ''
      '    union'
      ''
      '    /* Requisi'#231#245'es */'
      '    select'
      '        r.empresa'
      '      , ri.produto'
      '      , r.data_emissao as data'
      '      , cc.descricao   as local'
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
      
        '  left join TBUNIDADEPROD uf on (uf.unp_cod = p.codunidade_fraci' +
        'onada)'
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
    Left = 40
    Top = 152
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
  object DspHistoricoEntradaProduto: TDataSetProvider
    DataSet = QryHistoricoEntradaProduto
    Left = 72
    Top = 152
  end
  object CdsHistoricoEntradaProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspHistoricoEntradaProduto'
    Left = 104
    Top = 152
  end
  object FrdsHistoricoEntradaProduto: TfrxDBDataset
    UserName = 'ExtratoProduto'
    CloseDataSource = True
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'COD=COD'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'UND_COMPRA=UND_COMPRA'
      'UND_COMPRA_SIGLA=UND_COMPRA_SIGLA'
      'FRACIONADOR=FRACIONADOR'
      'UND_FRACAO=UND_FRACAO'
      'UND_FRACAO_SIGLA=UND_FRACAO_SIGLA'
      'ESTOQUE_ALMOX=ESTOQUE_ALMOX'
      'EMPRESA=EMPRESA'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'DATA=DATA'
      'LOCAL=LOCAL'
      'TIPO=TIPO'
      'QUANT=QUANT'
      'VALOR_TOTAL=VALOR_TOTAL'
      'QUANT_COMPRA=QUANT_COMPRA'
      'QUANT_APROPRIACAO=QUANT_APROPRIACAO'
      'QUANT_REQUISICAO=QUANT_REQUISICAO'
      'QUANT_SALDO_ALMOX=QUANT_SALDO_ALMOX'
      'VALOR_TOTAL_COMPRA=VALOR_TOTAL_COMPRA'
      'VALOR_TOTAL_APROPRIACAO=VALOR_TOTAL_APROPRIACAO'
      'VALOR_TOTAL_REQUISICAO=VALOR_TOTAL_REQUISICAO'
      'VALOR_TOTAL_SALDO_ALMOX=VALOR_TOTAL_SALDO_ALMOX'
      'VALOR_ESTOQUE_ALMOX=VALOR_ESTOQUE_ALMOX'
      'UND_ALMOX=UND_ALMOX'
      'UND_ALMOX_SIGLA=UND_ALMOX_SIGLA')
    DataSet = CdsHistoricoEntradaProduto
    BCDToCurrency = True
    Left = 136
    Top = 152
  end
end
