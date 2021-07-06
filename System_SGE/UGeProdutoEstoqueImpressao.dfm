inherited frmGeProdutoEstoqueImpressao: TfrmGeProdutoEstoqueImpressao
  Left = 690
  Top = 295
  Caption = 'Relat'#243'rio de Estoque de Produtos'
  ClientHeight = 320
  ExplicitHeight = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 316
    ExplicitTop = 316
  end
  inherited Bevel3: TBevel
    Top = 277
    ExplicitTop = 277
  end
  inherited pnlBanner: TPanel
    Height = 277
    ExplicitHeight = 277
    inherited imgBanner: TImage
      Height = 277
      ExplicitHeight = 277
    end
  end
  inherited pnlRelatorio: TPanel
    Height = 277
    ExplicitHeight = 277
    inherited GrpBxRelatorio: TGroupBox
      inherited edRelatorio: TComboBox
        Items.Strings = (
          'Rela'#231#227'o de Produtos em Estoque'
          'Rela'#231#227'o de Produtos em Estoque (Por Lote)'
          'Rela'#231#227'o de Lotes dos Produtos em Estoque'
          'Demanda Consolidada de Produtos em Estoque')
      end
    end
    inherited GrpBxFiltro: TGroupBox
      Height = 196
      ExplicitHeight = 196
      object lblEmpresa: TLabel
        Left = 46
        Top = 27
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Empresa:'
        FocusControl = edEmpresa
      end
      object lblGrupo: TLabel
        Left = 61
        Top = 76
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo:'
        FocusControl = edGrupo
      end
      object lblFabricante: TLabel
        Left = 35
        Top = 100
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fabricante:'
        FocusControl = edFabricante
      end
      object lblAno: TLabel
        Left = 73
        Top = 124
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ano:'
        Enabled = False
        FocusControl = edAno
      end
      object lblCentroCusto: TLabel
        Left = 5
        Top = 52
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = 'Centro de Custo:'
        FocusControl = edCentroCusto
      end
      object edEmpresa: TComboBox
        Left = 104
        Top = 24
        Width = 313
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = edEmpresaChange
      end
      object edGrupo: TComboBox
        Left = 104
        Top = 73
        Width = 313
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
        Left = 104
        Top = 97
        Width = 313
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
      object edAno: TComboBox
        Left = 104
        Top = 121
        Width = 65
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        Enabled = False
        ItemIndex = 0
        TabOrder = 4
        Text = '2014'
        Items.Strings = (
          '2014')
      end
      object ckSemEstoqueVenda: TCheckBox
        Left = 104
        Top = 148
        Width = 313
        Height = 17
        Caption = 'Apenas produtos SEM Estoque de Venda'
        TabOrder = 5
        OnClick = ckSemEstoqueVendaClick
      end
      object ckComEstoqueVenda: TCheckBox
        Left = 104
        Top = 171
        Width = 313
        Height = 17
        Caption = 'Apenas produtos COM Estoque de Venda'
        TabOrder = 6
        OnClick = ckComEstoqueVendaClick
      end
      object edCentroCusto: TComboBox
        Left = 104
        Top = 49
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = '(TODOS)'
        Items.Strings = (
          '(TODOS)')
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 281
    ExplicitTop = 281
  end
  object FrRelacaoEstoqueProduto: TfrxReport
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
    Top = 8
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoEstoqueProduto
        DataSetName = 'FrdsRelacaoEstoqueProduto'
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
        Name = 'SistemaCodigo'
        Value = '0'
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
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 555.590910000000000000
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
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEstoqueProduto."EMPRESA_CNPJ"'
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
          Memo.UTF8W = (
            
              ' [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoEstoqueProd' +
              'uto."EMPRESA_CNPJ">)] - [FrdsRelacaoEstoqueProduto."EMPRESA_RAZA' +
              'O"]')
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
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 328.819110000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoEstoqueProduto
        DataSetName = 'FrdsRelacaoEstoqueProduto'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsRelacaoEstoqueProduto."ESTOQUE_VND">)]' +
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProduto."COD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 283.464750000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProduto."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProduto."REFERENCIA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProduto."FABRICANTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 744.567410000000000000
          Width = 30.236240000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FrdsRelacaoEstoqueProduto."UND_COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<SistemaCodigo> = 3, <FrdsRelacaoEstoqueProduto."ANVISA">,' +
              ' <FrdsRelacaoEstoqueProduto."MODELO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 839.055660000000000000
          Width = 71.811070000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEstoqueProduto."CUSTO_VNV_TOTAL' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsRelacaoEstoqueProduto."ESTOQUE_APR">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 975.118740000000000000
          Width = 71.811070000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoEstoqueProduto."CUSTO_APR_TOTAL' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 627.401980000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsRelacaoEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProduto."SECAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 415.748300000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Width = 774.803650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            
              ' [COUNT(BndMasterData)] produto(s) relacionado(s) para a empresa' +
              ' [FrdsRelacaoEstoqueProduto."EMPRESA_RAZAO"].')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
          Width = 136.063080000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueProduto."CUSTO_VNV_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueProduto."CUSTO_APR_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderGrupo: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 249.448980000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoEstoqueProduto."GRUPO_COD"'
        ReprintOnNewPage = True
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
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
          Width = 283.464750000000000000
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
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
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
            ' Refer'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
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
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 744.567410000000000000
          Top = 18.897650000000000000
          Width = 30.236240000000000000
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
            'UN')
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
            ' [FrdsRelacaoEstoqueProduto."GRUPO_DESC"]')
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
          Left = 839.055660000000000000
          Top = 37.795300000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Custo (R$) ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
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
            
              '[IIF(<SistemaCodigo> = 3, '#39'Estoque p/ Venda'#39', '#39'Estoque sem Apror' +
              'ia'#231#227'o'#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 975.118740000000000000
          Top = 37.795300000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Custo (R$) ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
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
            
              '[IIF(<SistemaCodigo> = 3, '#39'Estoque Lote(s)'#39', '#39'Estoque com Aprori' +
              'a'#231#227'o'#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
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
          Left = 551.811380000000000000
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
            ' [IIF(<SistemaCodigo> = 3, '#39'Anvisa'#39', '#39'Modelo'#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 627.401980000000000000
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
      end
      object BndGrpFooterGrupo: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 370.393940000000000000
        Width = 1046.929810000000000000
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Width = 774.803650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            
              ' [COUNT(BndMasterData)] produto(s) relacionado(s) para o grupo [' +
              'FrdsRelacaoEstoqueProduto."GRUPO_DESC"].')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
          Width = 136.063080000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueProduto."CUSTO_VNV_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueProduto."CUSTO_APR_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 498.897960000000000000
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
            ' * Produto(s) sem estoque para apropria'#231#227'o')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 774.803650000000000000
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
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueProduto."CUSTO_VNV_T' +
              'OTAL">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoEstoqueProduto."CUSTO_APR_T' +
              'OTAL">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object DspRelacaoEstoqueProduto: TDataSetProvider
    DataSet = QryRelacaoEstoqueProduto
    Left = 64
    Top = 8
  end
  object CdsRelacaoEstoqueProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoEstoqueProduto'
    Left = 96
    Top = 8
  end
  object FrdsRelacaoEstoqueProduto: TfrxDBDataset
    UserName = 'FrdsRelacaoEstoqueProduto'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'COD=COD'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
      'REFERENCIA=REFERENCIA'
      'ANVISA=ANVISA'
      'GRUPO_COD=GRUPO_COD'
      'GRUPO_DESC=GRUPO_DESC'
      'SECAO_COD=SECAO_COD'
      'SECAO_DESC=SECAO_DESC'
      'FABRICANTE_COD=FABRICANTE_COD'
      'FABRICANTE_NOME=FABRICANTE_NOME'
      'ESPECIFICACAO=ESPECIFICACAO'
      'UND_COMPRA=UND_COMPRA'
      'PERCENTUAL_MARCKUP=PERCENTUAL_MARCKUP'
      'PERCENTUAL_MARGEM=PERCENTUAL_MARGEM'
      'COMPOR_FATURAMENTO=COMPOR_FATURAMENTO'
      'PRODUTO_NOVO=PRODUTO_NOVO'
      'MOVIMENTA_ESTOQUE=MOVIMENTA_ESTOQUE'
      'CADASTRO_ATIVO=CADASTRO_ATIVO'
      'ESTOQUE_VND_MINIMO=ESTOQUE_VND_MINIMO'
      'ESTOQUE_VND=ESTOQUE_VND'
      'CUSTO_VNV_UNITARIO=CUSTO_VNV_UNITARIO'
      'VENDA_VNV_UNITARIO=VENDA_VNV_UNITARIO'
      'CUSTO_VNV_TOTAL=CUSTO_VNV_TOTAL'
      'VENDA_VNV_TOTAL=VENDA_VNV_TOTAL'
      'ESTOQUE_APR=ESTOQUE_APR'
      'CUSTO_APR_TOTAL=CUSTO_APR_TOTAL')
    DataSet = CdsRelacaoEstoqueProduto
    BCDToCurrency = True
    Left = 128
    Top = 8
  end
  object DspDemandaEstoqueProduto: TDataSetProvider
    DataSet = QryDemandaEstoqueProduto
    Left = 64
    Top = 136
  end
  object CdsDemandaEstoqueProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftSmallint
        Name = 'ANO'
        ParamType = ptInput
      end>
    ProviderName = 'DspDemandaEstoqueProduto'
    Left = 96
    Top = 136
  end
  object FrdsDemandaEstoqueProduto: TfrxDBDataset
    UserName = 'FrdsDemandaEstoqueProduto'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'COD=COD'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
      'REFERENCIA=REFERENCIA'
      'ANVISA=ANVISA'
      'GRUPO_COD=GRUPO_COD'
      'GRUPO_DESC=GRUPO_DESC'
      'SECAO_COD=SECAO_COD'
      'SECAO_DESC=SECAO_DESC'
      'FABRICANTE_COD=FABRICANTE_COD'
      'FABRICANTE_NOME=FABRICANTE_NOME'
      'ESPECIFICACAO=ESPECIFICACAO'
      'UND_COMPRA=UND_COMPRA'
      'PERCENTUAL_MARCKUP=PERCENTUAL_MARCKUP'
      'PERCENTUAL_MARGEM=PERCENTUAL_MARGEM'
      'COMPOR_FATURAMENTO=COMPOR_FATURAMENTO'
      'PRODUTO_NOVO=PRODUTO_NOVO'
      'MOVIMENTA_ESTOQUE=MOVIMENTA_ESTOQUE'
      'CADASTRO_ATIVO=CADASTRO_ATIVO'
      'ESTOQUE_VND_MINIMO=ESTOQUE_VND_MINIMO'
      'ESTOQUE_VND=ESTOQUE_VND'
      'CUSTO_VNV_UNITARIO=CUSTO_VNV_UNITARIO'
      'VENDA_VNV_UNITARIO=VENDA_VNV_UNITARIO'
      'CUSTO_VNV_TOTAL=CUSTO_VNV_TOTAL'
      'VENDA_VNV_TOTAL=VENDA_VNV_TOTAL'
      'ESTOQUE_APR=ESTOQUE_APR'
      'CUSTO_APR_TOTAL=CUSTO_APR_TOTAL'
      'ESTOQUE_CMP=ESTOQUE_CMP'
      'CUSTO_CMP_TOTAL=CUSTO_CMP_TOTAL')
    DataSet = CdsDemandaEstoqueProduto
    BCDToCurrency = True
    Left = 128
    Top = 136
  end
  object FrDemandaEstoqueProduto: TfrxReport
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
    Top = 136
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsDemandaEstoqueProduto
        DataSetName = 'FrdsDemandaEstoqueProduto'
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
        Value = '2015'
      end
      item
        Name = 'SubTitulo'
        Value = #39#39
      end
      item
        Name = 'SistemaCodigo'
        Value = '0'
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
            '[Titulo] [SubTitulo]')
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
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 555.590910000000000000
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
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsDemandaEstoqueProduto."EMPRESA_CNPJ"'
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
          Memo.UTF8W = (
            
              ' [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsDemandaEstoqueProd' +
              'uto."EMPRESA_CNPJ">)] - [FrdsDemandaEstoqueProduto."EMPRESA_RAZA' +
              'O"]')
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
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 328.819110000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsDemandaEstoqueProduto
        DataSetName = 'FrdsDemandaEstoqueProduto'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsDemandaEstoqueProduto."ESTOQUE_VND">)]' +
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsDemandaEstoqueProduto."COD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 340.157700000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsDemandaEstoqueProduto."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913730000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsDemandaEstoqueProduto."REFERENCIA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsDemandaEstoqueProduto."FABRICANTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 608.504330000000000000
          Width = 30.236240000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FrdsDemandaEstoqueProduto."UND_COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 839.055660000000000000
          Width = 71.811070000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsDemandaEstoqueProduto."CUSTO_VNV_TOTAL' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsDemandaEstoqueProduto."ESTOQUE_APR">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 975.118740000000000000
          Width = 71.811070000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsDemandaEstoqueProduto."CUSTO_APR_TOTAL' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsDemandaEstoqueProduto."ESTOQUE_CMP">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 702.992580000000000000
          Width = 71.811070000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<FrdsDemandaEstoqueProduto."ESTOQUE_VND"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsDemandaEstoqueProduto."CUSTO_CMP_TOTAL' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 415.748300000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Width = 638.740570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            
              ' [COUNT(BndMasterData)] produto(s) relacionado(s) para a empresa' +
              ' [FrdsDemandaEstoqueProduto."EMPRESA_RAZAO"].')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
          Width = 136.063080000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsDemandaEstoqueProduto."CUSTO_VNV_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsDemandaEstoqueProduto."CUSTO_APR_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 136.063080000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsDemandaEstoqueProduto."CUSTO_CMP_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderGrupo: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 249.448980000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsDemandaEstoqueProduto."GRUPO_COD"'
        ReprintOnNewPage = True
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
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
          Width = 340.157700000000000000
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
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913730000000000000
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
            ' Refer'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
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
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 608.504330000000000000
          Top = 18.897650000000000000
          Width = 30.236240000000000000
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
            'UN')
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
            ' [FrdsDemandaEstoqueProduto."GRUPO_DESC"]')
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
          Left = 839.055660000000000000
          Top = 37.795300000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Custo (R$) ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
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
            
              '[IIF(<SistemaCodigo> = 3, '#39'Estoque p/ Venda'#39', '#39'Estoque sem Apror' +
              'ia'#231#227'o'#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 975.118740000000000000
          Top = 37.795300000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Custo (R$) ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
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
            
              '[IIF(<SistemaCodigo> = 3, '#39'Estoque Lote(s)'#39', '#39'Estoque com Aprori' +
              'a'#231#227'o'#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 910.866730000000000000
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
          Left = 638.740570000000000000
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
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 702.992580000000000000
          Top = 37.795300000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Custo (R$) ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
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
            'Compras em [Periodo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterGrupo: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 370.393940000000000000
        Width = 1046.929810000000000000
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Width = 638.740570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            
              ' [COUNT(BndMasterData)] produto(s) relacionado(s) para o grupo [' +
              'FrdsDemandaEstoqueProduto."GRUPO_DESC"].')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
          Width = 136.063080000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsDemandaEstoqueProduto."CUSTO_VNV_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsDemandaEstoqueProduto."CUSTO_APR_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 136.063080000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsDemandaEstoqueProduto."CUSTO_CMP_T' +
              'OTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 498.897960000000000000
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
            ' * Produto(s) sem estoque para apropria'#231#227'o')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 638.740570000000000000
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
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 774.803650000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsDemandaEstoqueProduto."CUSTO_VNV_T' +
              'OTAL">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsDemandaEstoqueProduto."CUSTO_APR_T' +
              'OTAL">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo9: TfrxSysMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsDemandaEstoqueProduto."CUSTO_CMP_T' +
              'OTAL">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
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
    Left = 416
    Top = 8
  end
  object DspGrupo: TDataSetProvider
    DataSet = fdQryGrupo
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
    Left = 416
    Top = 48
  end
  object DspFabricante: TDataSetProvider
    DataSet = fdQryFabricante
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
  object CdsAno: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAno'
    Left = 480
    Top = 80
  end
  object DspAno: TDataSetProvider
    DataSet = fdQryAno
    Left = 448
    Top = 80
  end
  object fdQryAno: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select distinct'
      '  substring(c.cmp_num from 1 for 4) as ano'
      'from TBCOMPETENCIA c'
      'order by'
      '  1 desc')
    Left = 416
    Top = 80
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
    Left = 416
    Top = 112
  end
  object DspEmpresas: TDataSetProvider
    DataSet = fdQryEmpresas
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
  object QryRelacaoEstoqueProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    coalesce(xx.empresa, p.codemp) as empresa_cnpj'
      '  , e.rzsoc  as empresa_razao'
      '  , p.cod'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.modelo'
      '  , p.referencia'
      '  , p.anvisa'
      '  , coalesce(p.codgrupo, 0) as grupo_cod'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')   as grupo_desc'
      '  , coalesce(p.codsecao, 0)                     as secao_cod'
      '  , coalesce(s.scp_descricao, '#39'* Indefinida'#39')   as secao_desc'
      '  , coalesce(p.codfabricante, 0)     as fabricante_cod'
      '  , coalesce(f.nome, '#39'* Indefinido'#39') as fabricante_nome'
      '  , p.especificacao'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), trim(u.unp' +
        '_descricao)) from 1 for 3) as und_compra'
      ''
      '  , p.percentual_marckup'
      '  , p.percentual_margem'
      '  , p.compor_faturamento'
      '  , p.produto_novo'
      '  , p.movimenta_estoque'
      '  , p.cadastro_ativo'
      ''
      '  , p.estoqmin as estoque_vnd_minimo'
      '  , p.qtde     as estoque_vnd'
      '  , p.customedio as custo_vnv_unitario'
      '  , p.preco      as venda_vnv_unitario'
      '  , p.qtde * p.customedio as custo_vnv_total'
      '  , p.qtde * p.preco      as venda_vnv_total'
      ''
      '  , coalesce(xx.apropriacao_qtde, 0.0)  as estoque_apr'
      '  , coalesce(xx.apropriacao_custo, 0.0) as custo_apr_total'
      'from TBPRODUTO p'
      '  left join ('
      '    Select'
      '        pe.empresa'
      '      , pe.produto'
      '      , sum(pe.qtde / pe.fracionador) as apropriacao_qtde'
      '      , sum(pe.qtde * pe.custo_medio) as apropriacao_custo'
      '    from TBESTOQUE_ALMOX pe'
      '    group by'
      '        pe.empresa'
      '      , pe.produto'
      '  ) xx on (xx.empresa = p.codemp and xx.produto = p.cod)'
      
        '  left join TBEMPRESA e on (e.cnpj = coalesce(xx.empresa, p.code' +
        'mp))'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)'
      '')
    Left = 32
    Top = 8
  end
  object QryDemandaEstoqueProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    coalesce(xx.empresa, p.codemp) as empresa_cnpj'
      '  , e.rzsoc  as empresa_razao'
      '  , p.cod'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.modelo'
      '  , p.referencia'
      '  , p.anvisa'
      '  , coalesce(p.codgrupo, 0) as grupo_cod'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')   as grupo_desc'
      '  , coalesce(p.codsecao, 0)                     as secao_cod'
      '  , coalesce(s.scp_descricao, '#39'* Indefinida'#39')   as secao_desc'
      '  , coalesce(p.codfabricante, 0)     as fabricante_cod'
      '  , coalesce(f.nome, '#39'* Indefinido'#39') as fabricante_nome'
      '  , p.especificacao'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), trim(u.unp' +
        '_descricao)) from 1 for 3) as und_compra'
      ''
      '  , p.percentual_marckup'
      '  , p.percentual_margem'
      '  , p.compor_faturamento'
      '  , p.produto_novo'
      '  , p.movimenta_estoque'
      '  , p.cadastro_ativo'
      ''
      '  , p.estoqmin as estoque_vnd_minimo'
      '  , p.qtde     as estoque_vnd'
      '  , p.customedio as custo_vnv_unitario'
      '  , p.preco      as venda_vnv_unitario'
      '  , p.qtde * p.customedio as custo_vnv_total'
      '  , p.qtde * p.preco      as venda_vnv_total'
      ''
      '  , coalesce(xx.apropriacao_qtde, 0.0)  as estoque_apr'
      '  , coalesce(xx.apropriacao_custo, 0.0) as custo_apr_total'
      ''
      '  , coalesce(yy.compras_qtde, 0.0)  as estoque_cmp'
      
        '  , cast( coalesce(yy.compras_custo, 0.0) as DMN_MONEY_4 ) as cu' +
        'sto_cmp_total'
      'from TBPRODUTO p'
      ''
      '  left join ('
      '    Select'
      '        pe.empresa'
      '      , pe.produto'
      '      , sum(pe.qtde / pe.fracionador) as apropriacao_qtde'
      '      , sum(pe.qtde * pe.custo_medio) as apropriacao_custo'
      '    from TBESTOQUE_ALMOX pe'
      '    group by'
      '        pe.empresa'
      '      , pe.produto'
      '  ) xx on (xx.empresa = p.codemp and xx.produto = p.cod)'
      ''
      '  left join ('
      '    Select'
      '        ci.codemp  as empresa'
      '      , ci.codprod as produto'
      '      , sum(ci.qtde) as compras_qtde'
      '      , sum(ci.qtde * ci.customedio) as compras_custo'
      '    from TBCOMPRAS cc'
      
        '      inner join TBCOMPRASITENS ci on (cc.ano = ci.ano and cc.co' +
        'dcontrol = ci.codcontrol and cc.codemp = ci.codemp)'
      '    where cc.ano = :ano'
      '      and cc.status <> 3 -- Cancelada'
      '    group by'
      '        ci.codemp'
      '      , ci.codprod'
      '  ) yy on (yy.empresa = p.codemp and yy.produto = p.cod)'
      ''
      
        '  left join TBEMPRESA e on (e.cnpj = coalesce(xx.empresa, yy.emp' +
        'resa, p.codemp))'
      ''
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)')
    Left = 32
    Top = 136
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object FrRelacaoEstoqueProdutoLote: TfrxReport
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
    Top = 48
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoEstoqueProdutoLote
        DataSetName = 'FrdsRelacaoEstoqueProdutoLote'
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
        Name = 'SistemaCodigo'
        Value = '0'
      end
      item
        Name = ' Valores'
        Value = Null
      end
      item
        Name = 'CustoVND_Total'
        Value = 
          '(<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND"> * <FrdsRelacaoEst' +
          'oqueProdutoLote."CUSTO_UNT">)'
      end
      item
        Name = 'CustoAPR_Total'
        Value = 
          'IIF(<FrdsRelacaoEstoqueProdutoLote."CUSTO_TOTAL_APR"> <> 0.0,<Fr' +
          'dsRelacaoEstoqueProdutoLote."CUSTO_TOTAL_APR">, (<FrdsRelacaoEst' +
          'oqueProdutoLote."ESTOQUE_APR"> * <FrdsRelacaoEstoqueProdutoLote.' +
          '"CUSTO_UNT">))'
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
          Width = 604.724800000000000000
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
          Width = 604.724800000000000000
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
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 582.047620000000000000
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
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        Columns = 2
        ColumnWidth = 359.055118110236000000
        DataSet = FrdsRelacaoEstoqueProdutoLote
        DataSetName = 'FrdsRelacaoEstoqueProdutoLote'
        RowCount = 0
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 30.236240000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutoLote."LOTE_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line]'#176'.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' Fab.: [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoEstoqueProdutoL' +
              'ote."LOTE_FABRICACAO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' Val.: [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoEstoqueProdutoL' +
              'ote."LOTE_VALIDADE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 313.700990000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39', <FrdsRelacaoEstoqueProdutoLote."LOTE_QTDE"' +
              '>)] [Lowercase(<FrdsRelacaoEstoqueProdutoLote."UND_COMPRA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderGrupo: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoEstoqueProdutoLote."GRUPO_COD"'
        ReprintOnNewPage = True
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 661.417750000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutoLote."GRUPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Grupo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterGrupo: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 404.409710000000000000
        Width = 718.110700000000000000
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 7.559060000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 79.370130000000000000
        Top = 480.000310000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' ('#185') Produto(s) marcado(s) para n'#227'o movimentar estoque.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            
              ' ('#178') Produto requer an'#225'lise de estoque para poss'#237'vel realiza'#231#227'o ' +
              'de ajuste.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GrpHeaderProduto: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoEstoqueProdutoLote."COD"'
        KeepTogether = True
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Top = 75.590600000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 30.236240000000000000
          Top = 75.590600000000000000
          Width = 687.874460000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13434879
          Memo.UTF8W = (
            ' Lote (s)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
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
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' C'#243'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 389.291590000000000000
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
            ' Descri'#231#227'o / Apresenta'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 325.039580000000000000
          Top = 37.795300000000000000
          Width = 90.708720000000000000
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
            ' [IIF(<SistemaCodigo> = 3, '#39'Anvisa'#39', '#39'Modelo'#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 325.039580000000000000
          Top = 56.692950000000000000
          Width = 90.708720000000000000
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
          Memo.UTF8W = (
            
              ' [IIF(<SistemaCodigo> = 3, <FrdsRelacaoEstoqueProdutoLote."ANVIS' +
              'A">, <FrdsRelacaoEstoqueProdutoLote."MODELO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 234.330860000000000000
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
            ' Fabricante')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 234.330860000000000000
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
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutoLote."FABRICANTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 37.795300000000000000
          Width = 90.708720000000000000
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
            ' Refer'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 56.692950000000000000
          Width = 90.708720000000000000
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
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutoLote."REFERENCIA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 56.692950000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 
            '(<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND"> <> <FrdsRelacaoEs' +
            'toqueProdutoLote."ESTOQUE_APR">)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutoLote."COD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Top = 18.897650000000000000
          Width = 661.417750000000000000
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 
            '(<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND"> <> <FrdsRelacaoEs' +
            'toqueProdutoLote."ESTOQUE_APR">)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FrdsRelacaoEstoqueProdutoLote."DESCRI_APRESENTACAO"] [IIF(<Frd' +
              'sRelacaoEstoqueProdutoLote."MOVIMENTA_ESTOQUE">=0, '#39' ('#185')'#39', '#39#39')] ' +
              '[IIF(<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND"> <> <FrdsRelac' +
              'aoEstoqueProdutoLote."ESTOQUE_APR">, '#39' ('#178')'#39', '#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984540000000000000
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
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Custo (R$) ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984540000000000000
          Top = 56.692950000000000000
          Width = 64.252010000000000000
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
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 582.047620000000000000
          Top = 56.692950000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_APR' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 582.047620000000000000
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
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Custo (R$) ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 56.692950000000000000
          Width = 30.236240000000000000
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
          Memo.UTF8W = (
            '[FrdsRelacaoEstoqueProdutoLote."UND_COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 56.692950000000000000
          Width = 71.811070000000000000
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
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<CustoVND_Total>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 56.692950000000000000
          Width = 71.811070000000000000
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
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<CustoAPR_Total>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 37.795300000000000000
          Width = 30.236240000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            'UN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984540000000000000
          Width = 136.063080000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<SistemaCodigo> = 3, '#39'Estoque p/ Venda'#39', '#39'Estoque sem Aprop' +
              'ria'#231#227'o'#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 582.047620000000000000
          Width = 136.063080000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<SistemaCodigo> = 3, '#39'Estoque Lote(s)'#39', '#39'Estoque com Apropr' +
              'ia'#231#227'o'#39')]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object QryRelacaoEstoqueProdutoLote: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.cod'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.modelo'
      '  , p.referencia'
      '  , p.anvisa'
      '  , coalesce(p.codgrupo, 0) as grupo_cod'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')   as grupo_desc'
      '  , coalesce(p.codsecao, 0)                     as secao_cod'
      '  , coalesce(s.scp_descricao, '#39'* Indefinida'#39')   as secao_desc'
      '  , coalesce(p.codfabricante, 0)     as fabricante_cod'
      '  , coalesce(f.nome, '#39'* Indefinido'#39') as fabricante_nome'
      '  , p.especificacao'
      ''
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), trim(u.unp' +
        '_descricao)) from 1 for 3) as und_compra'
      '  , coalesce(p.qtde, 0.0)               as estoque_vnd'
      '  , coalesce(xx.apropriacao_qtde, 0.0)  as estoque_apr'
      '  , p.customedio as custo_unt'
      '  , p.preco      as venda_unt'
      '  , coalesce(xx.apropriacao_custo, 0.0) as custo_total_apr'
      ''
      '  , p.movimenta_estoque'
      '  , a.lote'
      '  , a.id as lote_id'
      '  , a.descricao       as lote_desc'
      '  , a.data_fabricacao as lote_fabricacao'
      '  , a.data_validade   as lote_validade'
      '  , a.qtde            as lote_qtde'
      'from TBPRODUTO p'
      
        '  inner join TBESTOQUE_ALMOX a on (a.empresa = :empresa and a.ce' +
        'ntro_custo = :centro_custo and a.produto = p.cod)'
      '  inner join ('
      '    Select'
      '        pe.empresa'
      '      , pe.produto'
      '      , sum(pe.qtde / pe.fracionador) as apropriacao_qtde'
      '      , sum(pe.qtde * pe.custo_medio) as apropriacao_custo'
      '    from TBESTOQUE_ALMOX pe'
      '    group by'
      '        pe.empresa'
      '      , pe.produto'
      '  ) xx on (xx.empresa = a.empresa and a.produto = xx.produto)'
      ''
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)'
      ''
      'where (p.codigo > 0)'
      ''
      'order by'
      '    coalesce(g.descri, '#39'* Indefinido'#39')'
      '  , coalesce(p.codgrupo, 0)'
      '  , p.descri_apresentacao'
      '  , p.cod'
      '  , a.data_validade'
      '  , a.data_fabricacao'
      '')
    Left = 32
    Top = 48
    ParamData = <
      item
        Position = 1
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = '26352874000100'
      end
      item
        Position = 2
        Name = 'CENTRO_CUSTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object DspRelacaoEstoqueProdutoLote: TDataSetProvider
    DataSet = QryRelacaoEstoqueProdutoLote
    Left = 64
    Top = 48
  end
  object CdsRelacaoEstoqueProdutoLote: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 18
        Value = '26352874000100'
      end
      item
        DataType = ftInteger
        Name = 'CENTRO_CUSTO'
        ParamType = ptInput
        Value = 1
      end>
    ProviderName = 'DspRelacaoEstoqueProdutoLote'
    Left = 96
    Top = 48
  end
  object FrdsRelacaoEstoqueProdutoLote: TfrxDBDataset
    UserName = 'FrdsRelacaoEstoqueProdutoLote'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COD=COD'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
      'REFERENCIA=REFERENCIA'
      'ANVISA=ANVISA'
      'GRUPO_COD=GRUPO_COD'
      'GRUPO_DESC=GRUPO_DESC'
      'SECAO_COD=SECAO_COD'
      'SECAO_DESC=SECAO_DESC'
      'FABRICANTE_COD=FABRICANTE_COD'
      'FABRICANTE_NOME=FABRICANTE_NOME'
      'ESPECIFICACAO=ESPECIFICACAO'
      'UND_COMPRA=UND_COMPRA'
      'ESTOQUE_VND=ESTOQUE_VND'
      'ESTOQUE_APR=ESTOQUE_APR'
      'CUSTO_UNT=CUSTO_UNT'
      'VENDA_UNT=VENDA_UNT'
      'CUSTO_TOTAL_APR=CUSTO_TOTAL_APR'
      'MOVIMENTA_ESTOQUE=MOVIMENTA_ESTOQUE'
      'LOTE=LOTE'
      'LOTE_ID=LOTE_ID'
      'LOTE_DESC=LOTE_DESC'
      'LOTE_FABRICACAO=LOTE_FABRICACAO'
      'LOTE_VALIDADE=LOTE_VALIDADE'
      'LOTE_QTDE=LOTE_QTDE')
    DataSet = CdsRelacaoEstoqueProdutoLote
    BCDToCurrency = True
    Left = 128
    Top = 48
  end
  object qryCentroCusto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.codigo'
      '  , c.descricao'
      'from TBCENTRO_CUSTO c'
      
        '  inner join TBCENTRO_CUSTO_EMPRESA e on (e.empresa = :empresa a' +
        'nd e.centro_custo = c.codigo)'
      'order by'
      '  c.descricao')
    Left = 416
    Top = 144
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end>
  end
  object dspCentroCusto: TDataSetProvider
    DataSet = qryCentroCusto
    Left = 448
    Top = 144
  end
  object cdsCentroCusto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 18
      end>
    ProviderName = 'dspCentroCusto'
    Left = 480
    Top = 144
  end
  object FrRelacaoLoteProdutoEstoque: TfrxReport
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
    Top = 96
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoEstoqueProdutoLote
        DataSetName = 'FrdsRelacaoEstoqueProdutoLote'
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
        Name = 'SistemaCodigo'
        Value = '0'
      end
      item
        Name = ' Valores'
        Value = Null
      end
      item
        Name = 'CustoVND_Total'
        Value = 
          '(<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND"> * <FrdsRelacaoEst' +
          'oqueProdutoLote."CUSTO_UNT">)'
      end
      item
        Name = 'CustoAPR_Total'
        Value = 
          'IIF(<FrdsRelacaoEstoqueProdutoLote."CUSTO_TOTAL_APR"> <> 0.0,<Fr' +
          'dsRelacaoEstoqueProdutoLote."CUSTO_TOTAL_APR">, (<FrdsRelacaoEst' +
          'oqueProdutoLote."ESTOQUE_APR"> * <FrdsRelacaoEstoqueProdutoLote.' +
          '"CUSTO_UNT">))'
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
      Columns = 2
      ColumnWidth = 95.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '95')
      Frame.Typ = []
      MirrorMode = []
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
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
          Width = 604.724800000000000000
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
          Width = 604.724800000000000000
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
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 517.795610000000000000
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
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 306.141930000000000000
        Width = 359.055350000000000000
        DataSet = FrdsRelacaoEstoqueProdutoLote
        DataSetName = 'FrdsRelacaoEstoqueProdutoLote'
        RowCount = 0
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FrdsRelacaoEstoqueProdutoLote."LOTE_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            ' [Line]. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 241.889920000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoEstoqueProdutoLote."L' +
              'OTE_FABRICACAO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 170.078850000000000000
          Width = 71.811018740000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoEstoqueProdutoLote."L' +
              'OTE_VALIDADE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 313.700990000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39', <FrdsRelacaoEstoqueProdutoLote."LOTE_QTDE"' +
              '>)] ')
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
      object BndGrpHeaderGrupo: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 204.094620000000000000
        Width = 359.055350000000000000
        Condition = 'FrdsRelacaoEstoqueProdutoLote."GRUPO_COD"'
        ReprintOnNewPage = True
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clGray
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutoLote."GRUPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clGray
          Memo.UTF8W = (
            ' Grupo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' C'#243'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Top = 18.897650000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            'Descri'#231#227'o / Lote / Validade / Fabrica'#231#227'o / Qtde.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterGrupo: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 7.559060000000000000
        Top = 347.716760000000000000
        Width = 359.055350000000000000
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 79.370130000000000000
        Top = 415.748300000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' ('#185') Produto(s) marcado(s) para n'#227'o movimentar estoque.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            
              ' ('#178') Produto requer an'#225'lise de estoque para poss'#237'vel realiza'#231#227'o ' +
              'de ajuste.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GrpHeaderProduto: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 264.567100000000000000
        Width = 359.055350000000000000
        Condition = 'FrdsRelacaoEstoqueProdutoLote."COD"'
        KeepTogether = True
        Stretched = True
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 
            '(<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND"> <> <FrdsRelacaoEs' +
            'toqueProdutoLote."ESTOQUE_APR">)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [FrdsRelacaoEstoqueProdutoLote."COD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 313.700990000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 
            '(<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND"> <> <FrdsRelacaoEs' +
            'toqueProdutoLote."ESTOQUE_APR">)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FrdsRelacaoEstoqueProdutoLote."UND_COMPRA"] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 
            '(<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND"> <> <FrdsRelacaoEs' +
            'toqueProdutoLote."ESTOQUE_APR">)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FrdsRelacaoEstoqueProdutoLote."DESCRI_APRESENTACAO"] [IIF(<Frds' +
              'RelacaoEstoqueProdutoLote."MOVIMENTA_ESTOQUE">=0, '#39' ('#185')'#39', '#39#39')] [' +
              'IIF(<FrdsRelacaoEstoqueProdutoLote."ESTOQUE_VND"> <> <FrdsRelaca' +
              'oEstoqueProdutoLote."ESTOQUE_APR">, '#39' ('#178')'#39', '#39#39')]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
      end
    end
  end
end
