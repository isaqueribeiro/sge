inherited frmGeProdutoImpressao: TfrmGeProdutoImpressao
  Caption = 'Relat'#243'rio de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRelatorio: TPanel
    inherited GrpBxRelatorio: TGroupBox
      inherited edRelatorio: TComboBox
        Items.Strings = (
          'Rela'#231#227'o de %s Cadastrados'
          'Demanda anual de %s')
      end
    end
    inherited GrpBxFiltro: TGroupBox
      object lblTipoRegistro: TLabel
        Left = 15
        Top = 52
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Registro:'
        FocusControl = edTipoRegistro
      end
      object lblGrupo: TLabel
        Left = 56
        Top = 76
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo:'
        FocusControl = edGrupo
      end
      object lblFabricante: TLabel
        Left = 30
        Top = 100
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fabricante:'
        FocusControl = edFabricante
      end
      object lblAno: TLabel
        Left = 68
        Top = 124
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ano:'
        Enabled = False
        FocusControl = edAno
      end
      object lblEmpresa: TLabel
        Left = 49
        Top = 28
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Empresa:'
        FocusControl = edEmpresa
      end
      object edTipoRegistro: TComboBox
        Left = 104
        Top = 48
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = '(Todos)'
        Items.Strings = (
          '(Todos)'
          'Produtos'
          'Servi'#231'os')
      end
      object edGrupo: TComboBox
        Left = 104
        Top = 72
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = '(TODOS)'
        Items.Strings = (
          '(TODOS)'
          'PESSOA F'#205'SICA'
          'PESSOA JUR'#205'DICA')
      end
      object edFabricante: TComboBox
        Left = 104
        Top = 96
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = '(TODOS)'
        Items.Strings = (
          '(TODOS)'
          'PESSOA F'#205'SICA'
          'PESSOA JUR'#205'DICA')
      end
      object edAno: TComboBox
        Left = 104
        Top = 120
        Width = 65
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        Enabled = False
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = '2014'
        Items.Strings = (
          '2014')
      end
      object edEmpresa: TComboBox
        Left = 104
        Top = 24
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  object frRelacaoProduto: TfrxReport
    Version = '4.9.72'
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
        DataSet = FrdsRelacaoProduto
        DataSetName = 'FrdsRelacaoProduto'
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
      object BndPageHeader: TfrxPageHeader
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 604.724800000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 521.575140000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 15.118120000000000000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Impresso em [Date] '#195#160's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderEmpresa: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoProduto."EMPRESA_CNPJ"'
        ReprintOnNewPage = True
        StartNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 113.385900000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoProduto."EM' +
              'PRESA_CNPJ">)] - [FrdsRelacaoProduto."EMPRESA_RAZAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Empresa')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoProduto
        DataSetName = 'FrdsRelacaoProduto'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 623.622450000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            
              '[IIF(<FrdsRelacaoProduto."TIPO">='#39'S'#39','#39#39',FormatFloat('#39',0.##'#39',<Frd' +
              'sRelacaoProduto."ESTOQUE">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 56.692950000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."COD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 113.385900000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 548.031850000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."REFERENCIA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 411.968770000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."FABRICANTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."TIPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 687.874460000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            '[FrdsRelacaoProduto."UND_COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [COUNT(BndMasterData)] produto(s)/servi'#195#167'o(s) relacionado(s).')
          ParentFont = False
        end
      end
      object BndFooter: TfrxFooter
        Height = 34.015770000000000000
        Top = 427.086890000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' * Produto(s) sem estoque')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [COUNT(BndMasterData, 2)] produto(s)/servi'#195#167'o(s) relacionado(s)' +
              '.')
          ParentFont = False
        end
      end
      object BndGrpHeaderGrupo: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoProduto."GRUPO_COD"'
        ReprintOnNewPage = True
        object Memo6: TfrxMemoView
          Left = 623.622450000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
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
          Memo.UTF8 = (
            'Estoque ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 56.692950000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 113.385900000000000000
          Top = 18.897650000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o / Apresenta'#195#167#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Refer'#195#170'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 411.968770000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Fabricante')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Tipo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 687.874460000000000000
          Top = 18.897650000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'UN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 113.385900000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."GRUPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Grupo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterGrupo: TfrxGroupFooter
        Height = 7.559060000000000000
        Top = 351.496290000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object QryRelacaoProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    p.codemp as empresa_cnpj'
      '  , e.rzsoc  as empresa_razao'
      '  , Case when p.aliquota_tipo = 0 then '#39'P'#39' else '#39'S'#39' end as tipo'
      
        '  , Case when p.aliquota_tipo = 0 then '#39'Produto(s)'#39' else '#39'Servi'#231 +
        'o(s)'#39' end as tipo_desc'
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
      '  , p.estoqmin as estoque_minimo'
      '  , p.qtde     as estoque'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), trim(u.unp' +
        '_descricao)) from 1 for 3) as und_compra'
      '  , p.customedio as valor_customedio'
      '  , p.preco      as valor_venda'
      ''
      '  , p.percentual_marckup'
      '  , p.percentual_margem'
      '  , p.compor_faturamento'
      '  , p.produto_novo'
      '  , p.movimenta_estoque'
      'from TBPRODUTO p'
      '  left join TBEMPRESA e on (e.cnpj = p.codemp)'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)')
    Left = 40
    Top = 8
  end
  object DspRelacaoProduto: TDataSetProvider
    DataSet = QryRelacaoProduto
    Left = 72
    Top = 8
  end
  object CdsRelacaoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoProduto'
    Left = 104
    Top = 8
  end
  object FrdsRelacaoProduto: TfrxDBDataset
    UserName = 'FrdsRelacaoProduto'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'TIPO=TIPO'
      'TIPO_DESC=TIPO_DESC'
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
      'ESTOQUE_MINIMO=ESTOQUE_MINIMO'
      'ESTOQUE=ESTOQUE'
      'UND_COMPRA=UND_COMPRA'
      'VALOR_CUSTOMEDIO=VALOR_CUSTOMEDIO'
      'VALOR_VENDA=VALOR_VENDA'
      'PERCENTUAL_MARCKUP=PERCENTUAL_MARCKUP'
      'PERCENTUAL_MARGEM=PERCENTUAL_MARGEM'
      'COMPOR_FATURAMENTO=COMPOR_FATURAMENTO'
      'PRODUTO_NOVO=PRODUTO_NOVO'
      'MOVIMENTA_ESTOQUE=MOVIMENTA_ESTOQUE')
    DataSet = CdsRelacaoProduto
    BCDToCurrency = True
    Left = 136
    Top = 8
  end
  object QryGrupo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    g.cod'
      '  , g.descri'
      'from TBGRUPOPROD g'
      'order by'
      '    g.descri')
    Left = 416
    Top = 8
  end
  object DspGrupo: TDataSetProvider
    DataSet = QryGrupo
    Left = 448
    Top = 8
  end
  object CdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGrupo'
    Left = 480
    Top = 8
  end
  object QryFabricante: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    f.cod'
      '  , f.nome'
      'from TBFABRICANTE f'
      'order by'
      '    f.nome')
    Left = 416
    Top = 48
  end
  object DspFabricante: TDataSetProvider
    DataSet = QryFabricante
    Left = 448
    Top = 48
  end
  object CdsFabricante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFabricante'
    Left = 480
    Top = 48
  end
  object frDemandaProduto: TfrxReport
    Version = '4.9.72'
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
        DataSet = FrdsDemandaProduto
        DataSetName = 'FrdsDemandaProduto'
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
        Name = 'SubTitulo'
        Value = ''
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
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object BndPageHeader: TfrxPageHeader
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 971.339210000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Titulo] [SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 487.559370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 487.559055118110200000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 487.559055118110200000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 487.559055118110200000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 94.488250000000000000
          Width = 1084.725110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 487.559055118110200000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 566.929500000000000000
        Width = 1084.725110000000000000
        object Memo2: TfrxMemoView
          Width = 948.662030000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 15.118120000000000000
          Width = 948.662030000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Impresso em [Date] '#195#160's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 948.662030000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderEmpresa: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 1084.725110000000000000
        Condition = 'FrdsDemandaProduto."EMPRESA_CNPJ"'
        ReprintOnNewPage = True
        StartNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 41.574830000000000000
          Width = 1043.150280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsDemandaProduto."EM' +
              'PRESA_CNPJ">)] - [FrdsDemandaProduto."EMPRESA_RAZAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Empresa')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 15.118120000000000000
        Top = 340.157700000000000000
        Width = 1084.725110000000000000
        DataSet = FrdsDemandaProduto
        DataSetName = 'FrdsDemandaProduto'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Left = 294.803340000000000000
          Width = 41.574830000000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."TIPO">='#39'S'#39','#39#39',FormatFloat('#39',0.##'#39',<Frd' +
              'sDemandaProduto."ESTOQUE">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 41.574830000000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsDemandaProduto."COD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 41.574830000000000000
          Width = 253.228510000000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsDemandaProduto."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 336.378170000000000000
          Width = 22.677180000000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[FrdsDemandaProduto."UND_COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 359.055350000000000000
          Width = 30.236240000000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CJAN">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CJAN">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 389.291590000000000000
          Width = 30.236240000000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VJAN">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VJAN">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 419.527830000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CFEV">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CFEV">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 449.764070000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VFEV">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VFEV">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 480.000310000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CMAR">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CMAR">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 510.236550000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VMAR">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VMAR">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 540.472790000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CABR">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CABR">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 570.709030000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VABR">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VABR">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 600.945270000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CMAI">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CMAI">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 631.181510000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VMAI">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VMAI">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 661.417750000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CJUN">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CJUN">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 691.653990000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VJUN">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VJUN">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 721.890230000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CJUL">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CJUL">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 752.126470000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VJUL">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VJUL">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 782.362710000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CAGO">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CAGO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 812.598950000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VAGO">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VAGO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 842.835190000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CSET">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CSET">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 873.071430000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VSET">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VSET">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 903.307670000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."COUT">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."COUT">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 933.543910000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VOUT">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VOUT">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 963.780150000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CNOV">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CNOV">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 994.016390000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VNOV">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VNOV">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 1024.252630000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."CDEZ">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."CDEZ">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 1054.488870000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<FrdsDemandaProduto."VDEZ">=0, '#39#39', FormatFloat('#39',0.###'#39',<Fr' +
              'dsDemandaProduto."VDEZ">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 438.425480000000000000
        Width = 1084.725110000000000000
        object Memo10: TfrxMemoView
          Width = 1084.725110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [COUNT(BndMasterData)] produto(s)/servi'#195#167'o(s) relacionado(s).')
          ParentFont = False
        end
      end
      object BndFooter: TfrxFooter
        Height = 22.677180000000000000
        Top = 483.779840000000000000
        Width = 1084.725110000000000000
        object Memo19: TfrxMemoView
          Width = 1084.725110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [COUNT(BndMasterData, 2)] produto(s)/servi'#195#167'o(s) relacionado(s)' +
              '.')
          ParentFont = False
        end
      end
      object BndGrpHeaderGrupo: TfrxGroupHeader
        Height = 15.118120000000000000
        Top = 249.448980000000000000
        Width = 1084.725110000000000000
        Condition = 'FrdsDemandaProduto."GRUPO_COD"'
        ReprintOnNewPage = True
        object Memo24: TfrxMemoView
          Left = 41.574830000000000000
          Width = 1043.150280000000000000
          Height = 15.118110240000000000
          ShowHint = False
          CharSpacing = 1.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsDemandaProduto."GRUPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Width = 41.574830000000000000
          Height = 15.118110240000000000
          ShowHint = False
          CharSpacing = 1.000000000000000000
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Grupo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterGrupo: TfrxGroupFooter
        Height = 7.559060000000000000
        Top = 408.189240000000000000
        Width = 1084.725110000000000000
      end
      object BndGrpHeaderFabricante: TfrxGroupHeader
        Height = 30.236240000000000000
        Top = 287.244280000000000000
        Width = 1084.725110000000000000
        Condition = 'FrdsDemandaProduto."FABRICANTE_COD"'
        ReprintOnNewPage = True
        object Memo6: TfrxMemoView
          Left = 294.803340000000000000
          Top = 15.118120000000000000
          Width = 41.574830000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Qtde.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 15.118120000000000000
          Width = 41.574830000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 41.574830000000000000
          Top = 15.118120000000000000
          Width = 253.228510000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o / Apresenta'#195#167#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 336.378170000000000000
          Top = 15.118120000000000000
          Width = 22.677180000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'UN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 359.055350000000000000
          Top = 15.118120000000000000
          Width = 30.236240000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 389.291590000000000000
          Top = 15.118120000000000000
          Width = 30.236240000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 359.055350000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'JAN')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 419.527830000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 449.764070000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 419.527830000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'FEV')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 480.000310000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 510.236550000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 480.000310000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'MAR')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 540.472790000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 570.709030000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 540.472790000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'ABR')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 600.945270000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 631.181510000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 600.945270000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'MAI')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 661.417750000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 691.653990000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 661.417750000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'JUN')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 721.890230000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 752.126470000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 721.890230000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'JUL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 782.362710000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 812.598950000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 782.362710000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'AGO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Width = 294.803340000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsDemandaProduto."FABRICANTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 842.835190000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 873.071430000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 842.835190000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'SET')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 903.307670000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 933.543910000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 903.307670000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'OUT')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 963.780150000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 994.016390000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 963.780150000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = 13434879
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NOV')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 1024.252630000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 15.118120000000000000
          Width = 30.236220470000000000
          Height = 15.118110236220500000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vend.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 1024.252630000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DEZ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 294.803340000000000000
          Width = 64.251970940000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'ESTOQUE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterFabricante: TfrxGroupFooter
        Height = 7.559060000000000000
        Top = 377.953000000000000000
        Width = 1084.725110000000000000
      end
    end
  end
  object QryDemandaProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    p.*'
      'from VW_PRODUTO_DEMANDA_ANUAL p')
    Left = 40
    Top = 40
  end
  object DspDemandaProduto: TDataSetProvider
    DataSet = QryDemandaProduto
    Left = 72
    Top = 40
  end
  object CdsDemandaProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspDemandaProduto'
    Left = 104
    Top = 40
  end
  object FrdsDemandaProduto: TfrxDBDataset
    UserName = 'FrdsDemandaProduto'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'TIPO=TIPO'
      'TIPO_DESC=TIPO_DESC'
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
      'UND_COMPRA=UND_COMPRA'
      'VALOR_CUSTOMEDIO=VALOR_CUSTOMEDIO'
      'VALOR_VENDA=VALOR_VENDA'
      'PERCENTUAL_MARCKUP=PERCENTUAL_MARCKUP'
      'PERCENTUAL_MARGEM=PERCENTUAL_MARGEM'
      'COMPOR_FATURAMENTO=COMPOR_FATURAMENTO'
      'PRODUTO_NOVO=PRODUTO_NOVO'
      'MOVIMENTA_ESTOQUE=MOVIMENTA_ESTOQUE'
      'ESTOQUE_MINIMO=ESTOQUE_MINIMO'
      'ESTOQUE=ESTOQUE'
      'CJAN=CJAN'
      'VJAN=VJAN'
      'AJAN=AJAN'
      'SJAN=SJAN'
      'CFEV=CFEV'
      'VFEV=VFEV'
      'AFEV=AFEV'
      'SFEV=SFEV'
      'CMAR=CMAR'
      'VMAR=VMAR'
      'AMAR=AMAR'
      'SMAR=SMAR'
      'CABR=CABR'
      'VABR=VABR'
      'AABR=AABR'
      'SABR=SABR'
      'CMAI=CMAI'
      'VMAI=VMAI'
      'AMAI=AMAI'
      'SMAI=SMAI'
      'CJUN=CJUN'
      'VJUN=VJUN'
      'AJUN=AJUN'
      'SJUN=SJUN'
      'CJUL=CJUL'
      'VJUL=VJUL'
      'AJUL=AJUL'
      'SJUL=SJUL'
      'CAGO=CAGO'
      'VAGO=VAGO'
      'AAGO=AAGO'
      'SAGO=SAGO'
      'CSET=CSET'
      'VSET=VSET'
      'ASET=ASET'
      'SSET=SSET'
      'COUT=COUT'
      'VOUT=VOUT'
      'AOUT=AOUT'
      'SOUT=SOUT'
      'CNOV=CNOV'
      'VNOV=VNOV'
      'ANOV=ANOV'
      'SNOV=SNOV'
      'CDEZ=CDEZ'
      'VDEZ=VDEZ'
      'ADEZ=ADEZ'
      'SDEZ=SDEZ')
    DataSet = CdsDemandaProduto
    BCDToCurrency = True
    Left = 136
    Top = 40
  end
  object QryAno: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select distinct'
      '  substring(c.cmp_num from 1 for 4) as ano'
      'from TBCOMPETENCIA c'
      'order by'
      '  1 desc')
    Left = 416
    Top = 80
  end
  object DspAno: TDataSetProvider
    DataSet = QryAno
    Left = 448
    Top = 80
  end
  object CdsAno: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAno'
    Left = 480
    Top = 80
  end
  object QryEmpresas: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    e.codigo'
      '  , e.rzsoc'
      '  , e.cnpj'
      'from TBEMPRESA e'
      'order by 2')
    Left = 416
    Top = 112
  end
  object DspEmpresas: TDataSetProvider
    DataSet = QryEmpresas
    Left = 448
    Top = 112
  end
  object CdsEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpresas'
    Left = 480
    Top = 112
  end
end
