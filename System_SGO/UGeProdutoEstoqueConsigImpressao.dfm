inherited frmGeProdutoEstoqueConsigImpressao: TfrmGeProdutoEstoqueConsigImpressao
  Left = 410
  Top = 229
  Caption = 'Relat'#243'rio de Estoque de Produtos Consignados'
  ClientHeight = 328
  ClientWidth = 562
  ExplicitWidth = 568
  ExplicitHeight = 357
  PixelsPerInch = 96
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
    ExplicitHeight = 285
    inherited imgBanner: TImage
      Height = 285
      ExplicitHeight = 285
    end
  end
  inherited pnlRelatorio: TPanel
    Width = 465
    Height = 285
    ExplicitWidth = 465
    ExplicitHeight = 285
    inherited Bevel4: TBevel
      Width = 457
      ExplicitWidth = 457
    end
    inherited GrpBxRelatorio: TGroupBox
      Width = 457
      ExplicitWidth = 457
      DesignSize = (
        457
        69)
      inherited edRelatorio: TComboBox
        Width = 427
        Items.Strings = (
          'Estoque Consignado por Cliente (Sint'#233'tico)'
          'Estoque Consignado por Cliente (Anal'#237'tico)')
        ExplicitWidth = 427
      end
    end
    inherited GrpBxFiltro: TGroupBox
      Width = 457
      Height = 204
      ExplicitLeft = 6
      ExplicitTop = 75
      ExplicitWidth = 457
      ExplicitHeight = 204
      object lblEmpresa: TLabel
        Left = 55
        Top = 28
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Empresa:'
        FocusControl = edEmpresa
      end
      object lblSituacaoEstoque: TLabel
        Left = 55
        Top = 102
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        FocusControl = edSituacaoEstoque
      end
      object lblGrupo: TLabel
        Left = 70
        Top = 53
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo:'
        FocusControl = edGrupo
      end
      object lblFabricante: TLabel
        Left = 44
        Top = 77
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fabricante:'
        FocusControl = edFabricante
      end
      object lblCliente: TLabel
        Left = 64
        Top = 125
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente:'
        FocusControl = edCliente
      end
      object lblDicaDadosEntrega: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 149
        Width = 447
        Height = 50
        Align = alBottom
        Caption = 
          'Produtos consignados s'#227'o aqueles que foram movimentados sob os C' +
          'FOPs 5917 e/ou 6917 (Remessa de mercadoria em consigna'#231#227'o mercan' +
          'til ou industrial).'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object edEmpresa: TComboBox
        Left = 112
        Top = 24
        Width = 329
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
      object edSituacaoEstoque: TComboBox
        Left = 112
        Top = 98
        Width = 329
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 3
        Text = 'Produtos com Estoque'
        Items.Strings = (
          '(Todos)'
          'Produtos com Estoque'
          'Produtos sem Estoque')
      end
      object edGrupo: TComboBox
        Left = 112
        Top = 49
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        ItemIndex = 0
        TabOrder = 1
        Text = '(TODOS)'
        Items.Strings = (
          '(TODOS)'
          'PESSOA F'#205'SICA'
          'PESSOA JUR'#205'DICA')
      end
      object edFabricante: TComboBox
        Left = 112
        Top = 73
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
      object edCliente: TcxLookupComboBox
        Left = 112
        Top = 122
        Properties.KeyFieldNames = 'CODIGO'
        Properties.ListColumns = <
          item
            Caption = 'Nome Cliente'
            Width = 120
            FieldName = 'NOME'
          end
          item
            Caption = 'CFP / CNPJ'
            FieldName = 'CNPJ'
          end>
        Properties.ListSource = dtsCliente
        EditValue = 0
        TabOrder = 4
        Width = 329
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 289
    Width = 562
    ExplicitTop = 289
    ExplicitWidth = 562
  end
  object FrRelacaoEstoqueConsignado: TfrxReport
    Version = '6.0.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.Compressed = True
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
        DataSet = FrdsRelacaoEstoqueConsignado
        DataSetName = 'RelacaoEstoqueConsignado'
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
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
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
          Left = 113.385900000000000000
          Top = 7.559059999999999000
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
          Top = 94.488250000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
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
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 570.709030000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
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
      object BndGrpHeaderCliente: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 1046.929810000000000000
        Condition = 'RelacaoEstoqueConsignado."COD_CLIENTE"'
        ReprintOnNewPage = True
        StartNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 56.692950000000010000
          Width = 990.236860000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clGray
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [RelacaoEstoqueConsignado."CLIENTE_NOME"] - CPF/CNPJ: [IIF(<Rel' +
              'acaoEstoqueConsignado."CLIENTE_TIPO"> = 1, FormatMaskText('#39'###.#' +
              '##.###-##;0;'#39',<RelacaoEstoqueConsignado."CLIENTE_CNPJ">), Format' +
              'MaskText('#39'##.###.###/####-##;0;'#39',<RelacaoEstoqueConsignado."CLIE' +
              'NTE_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo5: TfrxMemoView
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clGray
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clGray
          Memo.UTF8W = (
            ' Cliente')
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
        DataSet = FrdsRelacaoEstoqueConsignado
        DataSetName = 'RelacaoEstoqueConsignado'
        RowCount = 0
        Stretched = True
        object mmLinhaProduto: TfrxMemoView
          Left = 56.692950000000010000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object mmLinhaFab: TfrxMemoView
          Left = 377.953000000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 820.158010000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.##'#39',<RelacaoEstoqueConsignado."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [RelacaoEstoqueConsignado."PRODUTO_CODIGO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 60.472480000000000000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[RelacaoEstoqueConsignado."PRODUTO_NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 381.732530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[RelacaoEstoqueConsignado."FAB_NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 491.338900000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [RelacaoEstoqueConsignado."LOTE_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 884.410020000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [RelacaoEstoqueConsignado."UNIDADE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 721.890230000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatDateTime('#39'dd/mm/yyyy'#39', <RelacaoEstoqueConsignado."VENDA_D' +
              'ATA">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 782.362710000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
            
              ' [RelacaoEstoqueConsignado."VENDA_CFOP"] [IIF(<RelacaoEstoqueCon' +
              'signado."CONSIGNADO"> = 0, '#39#185#39', '#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
          Highlights = <
            item
              ApplyFill = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
              FillType = ftBrush
              Frame.Typ = []
            end
            item
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Condition = '(<RelacaoEstoqueConsignado."CONSIGNADO"> = 0)'
              FillType = ftBrush
              Fill.ForeColor = 4643583
              Frame.Typ = []
            end>
        end
        object Memo15: TfrxMemoView
          Left = 933.543910000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<RelacaoEstoqueConsignado."VALOR_TOTAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 642.520100000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<RelacaoEstoqueConsignado."ANO_VENDA_ULT"> = 0, '#39#39', Format' +
              'Float('#39'###00000'#39', <RelacaoEstoqueConsignado."COD_VENDA_ULT">))][' +
              'IIF(<RelacaoEstoqueConsignado."ANO_VENDA_ULT"> = 0, '#39#39', '#39'/'#39')][II' +
              'F(<RelacaoEstoqueConsignado."ANO_VENDA_ULT"> = 0, '#39#39', <RelacaoEs' +
              'toqueConsignado."ANO_VENDA_ULT">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 582.047620000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Highlight.Condition = '<RelacaoEstoqueConsignado."QUANTIDADE"> <= 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[IIF(<RelacaoEstoqueConsignado."DATA_VALIDADE"> = 0, '#39#39', FormatD' +
              'ateTime('#39'dd/mm/yyyy'#39', <RelacaoEstoqueConsignado."DATA_VALIDADE">' +
              '))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCliente: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 415.748300000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          Width = 933.543910000000000000
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
            
              ' [COUNT(BndMasterData)] produto(s) relacionado(s) para o cliente' +
              ' [RelacaoEstoqueConsignado."CLIENTE_CNPJ"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object SysMemo2: TfrxSysMemoView
          Left = 933.543910000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<RelacaoEstoqueConsignado."VALOR_TOTAL"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndGrpHeaderGrupo: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000010000
        Top = 249.448980000000000000
        Width = 1046.929810000000000000
        Condition = 'RelacaoEstoqueConsignado."GRUPO_CODIGO"'
        ReprintOnNewPage = True
        object Memo6: TfrxMemoView
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
          Left = 377.953000000000000000
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
          Memo.UTF8W = (
            ' Fabricante')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 56.692950000000010000
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
            ' [RelacaoEstoqueConsignado."GRUPO_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
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
            'Estoque Consignado')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 642.520100000000000000
          Top = 18.897650000000000000
          Width = 177.637836770000000000
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
            #218'ltima Venda')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 721.890230000000000000
          Top = 37.795300000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 782.362710000000000000
          Top = 37.795300000000000000
          Width = 37.795300000000000000
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
            ' CFOP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
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
            '(R$)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 642.520100000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
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
            ' Controle')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 151.181126770000000000
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
            'Lote')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 582.047620000000000000
          Top = 37.795300000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            'Validade')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 491.338900000000000000
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
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Identifica'#231#227'o')
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
          Width = 933.543910000000000000
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
              'RelacaoEstoqueConsignado."GRUPO_DESCRICAO"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object SysMemo4: TfrxSysMemoView
          Left = 933.543910000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<RelacaoEstoqueConsignado."VALOR_TOTAL"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 498.897960000000000000
        Width = 1046.929810000000000000
        object Memo18: TfrxMemoView
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
            ' * Produto(s) sem estoque')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<RelacaoEstoqueConsignado."VALOR_TOTAL"' +
              '>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Top = 34.015769999999970000
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
            ' '#185' CFOP n'#227'o adequado para movimenta'#231#227'o de produtos consignados')
          ParentFont = False
        end
      end
    end
  end
  object DspRelacaoEstoqueConsignado: TDataSetProvider
    DataSet = QryRelacaoEstoqueConsignado
    Left = 64
    Top = 40
  end
  object CdsRelacaoEstoqueConsignado: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 18
        Value = '26352874000100'
      end>
    ProviderName = 'DspRelacaoEstoqueConsignado'
    Left = 96
    Top = 40
  end
  object FrdsRelacaoEstoqueConsignado: TfrxDBDataset
    UserName = 'RelacaoEstoqueConsignado'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COD_CLIENTE=COD_CLIENTE'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_CNPJ=CLIENTE_CNPJ'
      'CLIENTE_TIPO=CLIENTE_TIPO'
      'PRODUTO_CODIGO=PRODUTO_CODIGO'
      'PRODUTO_NOME=PRODUTO_NOME'
      'GRUPO_CODIGO=GRUPO_CODIGO'
      'GRUPO_DESCRICAO=GRUPO_DESCRICAO'
      'FAB_CODIGO=FAB_CODIGO'
      'FAB_NOME=FAB_NOME'
      'LOTE_CODIGO=LOTE_CODIGO'
      'LOTE_DESCRICAO=LOTE_DESCRICAO'
      'DATA_FABRICACAO=DATA_FABRICACAO'
      'DATA_VALIDADE=DATA_VALIDADE'
      'ANO_VENDA_ULT=ANO_VENDA_ULT'
      'COD_VENDA_ULT=COD_VENDA_ULT'
      'VENDA_DATA=VENDA_DATA'
      'VENDA_CFOP=VENDA_CFOP'
      'VENDA_EMP=VENDA_EMP'
      'CONSIGNADO=CONSIGNADO'
      'SEQUENCIAL=SEQUENCIAL'
      'QUANTIDADE=QUANTIDADE'
      'UNP_DESCRICAO=UNP_DESCRICAO'
      'UNP_SIGLA=UNP_SIGLA'
      'UNIDADE=UNIDADE'
      'VALOR_MEDIO=VALOR_MEDIO'
      'VALOR_TOTAL=VALOR_TOTAL')
    DataSet = CdsRelacaoEstoqueConsignado
    BCDToCurrency = True
    Left = 128
    Top = 40
  end
  object FrRelacaoEstoqueConsignadoResumo: TfrxReport
    Version = '6.0.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.Compressed = True
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
        DataSet = FrdsRelacaoEstoqueConsignadoResumo
        DataSetName = 'RelacaoEstoqueConsignadoResumo'
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
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
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
          Left = 113.385900000000000000
          Top = 7.559059999999999000
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
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
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
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
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
      object BndGrpHeaderCliente: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'RelacaoEstoqueConsignadoResumo."COD_CLIENTE"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 56.692950000000010000
          Width = 661.417750000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clGray
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [RelacaoEstoqueConsignadoResumo."CLIENTE_NOME"] - CPF/CNPJ: [II' +
              'F(<RelacaoEstoqueConsignadoResumo."CLIENTE_TIPO"> = 1, FormatMas' +
              'kText('#39'###.###.###-##;0;'#39',<RelacaoEstoqueConsignadoResumo."CLIEN' +
              'TE_CNPJ">), FormatMaskText('#39'##.###.###/####-##;0;'#39',<RelacaoEstoq' +
              'ueConsignadoResumo."CLIENTE_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo5: TfrxMemoView
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clGray
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clGray
          Memo.UTF8W = (
            ' Cliente')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
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
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            ' Grupo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
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
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            ' Fabricante')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
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
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
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
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            'Valor (R$) ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoEstoqueConsignadoResumo
        DataSetName = 'RelacaoEstoqueConsignadoResumo'
        RowCount = 0
        object Memo17: TfrxMemoView
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<RelacaoEstoqueConsignadoResumo."QUANTIDADE"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [RelacaoEstoqueConsignadoResumo."FAB_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<RelacaoEstoqueConsignadoResumo."QUANTIDADE"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<RelacaoEstoqueConsignadoResumo."VALOR_TOTA' +
              'L">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<RelacaoEstoqueConsignadoResumo."QUANTIDADE"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.##'#39',<RelacaoEstoqueConsignadoResumo."QUANTIDADE' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
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
          Highlight.ApplyFill = False
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '(<RelacaoEstoqueConsignadoResumo."QUANTIDADE"> <= 0)'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [RelacaoEstoqueConsignadoResumo."GRUPO_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCliente: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Width = 718.110700000000000000
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
            
              ' [COUNT(BndMasterData)] grupo(s) e fabricante(s) relacionado(s) ' +
              'para o cliente [RelacaoEstoqueConsignadoResumo."CLIENTE_NOME"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object SysMemo2: TfrxSysMemoView
          Left = 604.724800000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<RelacaoEstoqueConsignadoResumo."VALOR_' +
              'TOTAL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
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
            
              ' [COUNT(BndMasterData, 2)] grupo(s)/fabricante(s) relacionado(s)' +
              '.')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<RelacaoEstoqueConsignadoResumo."VALOR_' +
              'TOTAL">,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object DspRelacaoEstoqueConsignadoResumo: TDataSetProvider
    DataSet = QryRelacaoEstoqueConsignadoResumo
    Left = 64
    Top = 8
  end
  object CdsRelacaoEstoqueConsignadoResumo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoEstoqueConsignadoResumo'
    Left = 96
    Top = 8
  end
  object FrdsRelacaoEstoqueConsignadoResumo: TfrxDBDataset
    UserName = 'RelacaoEstoqueConsignadoResumo'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COD_CLIENTE=COD_CLIENTE'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_CNPJ=CLIENTE_CNPJ'
      'CLIENTE_TIPO=CLIENTE_TIPO'
      'GRUPO_CODIGO=GRUPO_CODIGO'
      'GRUPO_DESCRICAO=GRUPO_DESCRICAO'
      'FAB_CODIGO=FAB_CODIGO'
      'FAB_NOME=FAB_NOME'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_TOTAL=VALOR_TOTAL')
    DataSet = CdsRelacaoEstoqueConsignadoResumo
    BCDToCurrency = True
    Left = 128
    Top = 8
  end
  object QryRelacaoEstoqueConsignadoResumo: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    e.cod_cliente'
      '  , c.nome as cliente_nome'
      '  , c.cnpj as cliente_cnpj'
      '  , c.pessoa_fisica as cliente_tipo'
      '  , p.codgrupo as grupo_codigo'
      '  , g.descri   as grupo_descricao'
      '  , p.codfabricante as fab_codigo'
      '  , f.nome          as fab_nome'
      '  , sum(e.quantidade) as quantidade'
      
        '  , sum(coalesce(e.quantidade, 0.000) * coalesce(e.valor_medio, ' +
        '0.0000)) as valor_total'
      'from TBCLIENTE_ESTOQUE e'
      '  inner join TBCLIENTE c on (c.codigo = e.cod_cliente)'
      '  inner join TBPRODUTO p on (p.cod = e.cod_produto)'
      ''
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      ''
      '/*'
      'where (e.quantidade > 0)'
      ''
      'group by'
      '    e.cod_cliente'
      '  , c.nome'
      '  , c.cnpj'
      '  , c.pessoa_fisica'
      '  , p.codgrupo'
      '  , g.descri'
      '  , p.codfabricante'
      '  , f.nome'
      ''
      'order by'
      '    c.nome'
      '  , e.cod_cliente'
      '  , g.descri'
      '  , f.nome'
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
  object QryRelacaoEstoqueConsignado: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    e.cod_cliente'
      '  , c.nome as cliente_nome'
      '  , c.cnpj as cliente_cnpj'
      '  , c.pessoa_fisica as cliente_tipo'
      '  , e.cod_produto as produto_codigo'
      '  , p.descri_apresentacao as produto_nome'
      '  , p.codgrupo as grupo_codigo'
      '  , g.descri   as grupo_descricao'
      '  , p.codfabricante as fab_codigo'
      '  , f.nome          as fab_nome'
      '  , l.lote      as lote_codigo'
      '  , l.descricao as lote_descricao'
      '  , l.data_fabricacao'
      '  , l.data_validade'
      '  , e.ano_venda_ult'
      '  , e.cod_venda_ult'
      '  , v.dtvenda as venda_data'
      '  , v.cfop    as venda_cfop'
      '  , v.codemp  as venda_emp'
      '  , e.consignado'
      '  , e.sequencial'
      '  , e.quantidade'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      
        '  , coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_descricao) as ' +
        'unidade'
      '  , e.valor_medio'
      
        '  , (coalesce(e.quantidade, 0.000) * coalesce(e.valor_medio, 0.0' +
        '000)) as valor_total'
      'from TBCLIENTE_ESTOQUE e'
      '  inner join TBCLIENTE c on (c.codigo = e.cod_cliente)'
      '  inner join TBPRODUTO p on (p.cod = e.cod_produto)'
      ''
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)'
      
        '  left join TBVENDAS v on (v.ano = e.ano_venda_ult and v.codcont' +
        'rol = e.cod_venda_ult and v.codemp = :empresa)'
      '  left join TBESTOQUE_ALMOX l on (l.id = e.lote_id)'
      ''
      '/*'
      'where (e.quantidade > 0)'
      ''
      'order by'
      '    c.nome'
      '  , e.cod_cliente'
      '  , g.descri'
      '  , p.codgrupo'
      '  , p.descri_apresentacao'
      '*/')
    Left = 32
    Top = 40
    ParamData = <
      item
        Position = 1
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = '26352874000100'
      end>
  end
  object dtsCliente: TDataSource
    DataSet = CdsCliente
    Left = 416
    Top = 40
  end
  object fdQryCliente: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    0 as codigo'
      '  , '#39'(Todos)'#39' as nome'
      '  , 0 as pessoa_fisica'
      '  , '#39#39' as cnpj'
      'from RDB$DATABASE x'
      ''
      'union'
      ''
      'Select'
      '    c.codigo'
      '  , c.nome'
      '  , c.pessoa_fisica'
      '  , c.cnpj'
      'from TBCLIENTE c'
      ''
      'order by'
      '    2')
    Left = 448
    Top = 40
  end
  object DspCliente: TDataSetProvider
    DataSet = fdQryCliente
    Left = 480
    Top = 40
  end
  object CdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCliente'
    Left = 512
    Top = 40
  end
end
