inherited frmGeVendaImpressao: TfrmGeVendaImpressao
  Left = 532
  Top = 279
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 320
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
          'Relat'#243'rio de Vendas por Vendedor (Sint'#233'tico)'
          'Relat'#243'rio de Vendas por Vendedor / Compet'#234'ncia (Anal'#237'tico)'
          'Relat'#243'rio de Vendas por Vendedor (Comparativo Sint'#233'tico)'
          'Relat'#243'rio de Vendas por Cliente (Sint'#233'tico)'
          'Relat'#243'rio de Vendas por Cliente / Compet'#234'ncia (Anal'#237'tico)'
          'Relat'#243'rio de Vendas por Cliente (Comparativo Sint'#233'tico)')
      end
    end
    inherited GrpBxFiltro: TGroupBox
      Height = 196
      ExplicitHeight = 196
      object lblSituacao: TLabel
        Left = 41
        Top = 76
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        FocusControl = edSituacao
      end
      object lblData: TLabel
        Left = 47
        Top = 51
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo:'
        FocusControl = e1Data
      end
      object lblVendedor: TLabel
        Left = 36
        Top = 100
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vendedor:'
        FocusControl = edVendedor
      end
      object lblCidade: TLabel
        Left = 52
        Top = 124
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cidade:'
        FocusControl = edCidade
      end
      object lblCliente: TLabel
        Left = 51
        Top = 148
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente:'
        FocusControl = edCliente
        Visible = False
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
      object edSituacao: TComboBox
        Left = 104
        Top = 72
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 3
        Text = '(Todas)'
        OnChange = edSituacaoChange
        Items.Strings = (
          '(Todas)'
          'Finalizada'
          'NF-e Emitida'
          'Finalizada / NF-e Emitida'
          'Cancelada')
      end
      object edVendedor: TComboBox
        Left = 104
        Top = 96
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = '(Todos)'
        Items.Strings = (
          '(Todos)')
      end
      object edCidade: TComboBox
        Left = 104
        Top = 120
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 5
        Text = '(Todos)'
        Items.Strings = (
          '(Todos)')
      end
      object edCliente: TComboBox
        Left = 104
        Top = 144
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 6
        Text = '(Todos)'
        Visible = False
        Items.Strings = (
          '(Todos)')
      end
      object chkNFeEmitida: TCheckBox
        Left = 104
        Top = 168
        Width = 185
        Height = 17
        Caption = 'Apenas com NF-e emitida(s)'
        TabOrder = 7
        Visible = False
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
        Width = 100
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
    end
  end
  inherited tlbBotoes: TPanel
    Top = 281
    ExplicitTop = 281
  end
  object QryCidades: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    c.cid_cod'
      '  , c.cid_nome || '#39' ('#39' || e.est_sigla || '#39')'#39' as cid_nome'
      'from TBCIDADE c'
      '  inner join TBESTADO e on (e.est_cod = c.est_cod)'
      'order by 2')
    Left = 360
  end
  object DpsCidades: TDataSetProvider
    DataSet = QryCidades
    Left = 392
  end
  object CdsCidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpsCidades'
    Left = 424
  end
  object frRelacaoVendaSintetico: TfrxReport
    Version = '5.1.9'
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
        DataSet = FrdsRelacaoVendaSintetico
        DataSetName = 'FrdsRelacaoVendaSintetico'
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
        Name = 'ValorComissao'
        Value = 
          '(<FrdsRelacaoVendaSintetico."VENDA_COMISSAO">-<FrdsRelacaoVendaS' +
          'intetico."VENDA_COMISSAO_CANCEL">)'
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
        FillType = ftBrush
        Height = 154.960730000000000000
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
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
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
          Memo.UTF8W = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o das vendas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 483.779840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 589.606680000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
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
          Top = 15.118120000000000000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
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
      object BndGrpHeaderVend: TfrxGroupHeader
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoVendaSintetico."VENDEDOR_COD"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 544.252320000000000000
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
            ' [FrdsRelacaoVendaSintetico."VENDEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
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
            ' Vendedor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 83.149660000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            'Compet'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 83.149660000000000000
          Top = 18.897650000000000000
          Width = 294.803340000000000000
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
            'Totais das Vendas *')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 83.149660000000000000
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
            'Bruto (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 181.417440000000000000
          Top = 37.795300000000000000
          Width = 98.267780000000000000
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
          Left = 279.685220000000000000
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
            'L'#237'quido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 377.953000000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
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
            'Totais das Vendas Canceladas *')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 627.401980000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
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
            'Comiss'#227'o (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.0##"%"'#39',<FrdsRelacaoVendaSintetico."COMISSAO">)' +
              '] de com. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 377.953000000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Bruto (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 461.102660000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Desc. (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 544.252320000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'L'#237'quido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoVendaSintetico
        DataSetName = 'FrdsRelacaoVendaSintetico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
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
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<ValorComissao>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 83.149660000000000000
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
          Memo.UTF8W = (
            ' [FrdsRelacaoVendaSintetico."COMPETENCIA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 83.149660000000000000
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
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaSintetico."VENDA_BRUTA">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 181.417440000000000000
          Width = 98.267780000000000000
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
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaSintetico."VENDA_DESCONTOS' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 279.685220000000000000
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
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaSintetico."VENDA_LIQUIDO">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 377.953000000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaSintetico."VENDA_BRUTA_CAN' +
              'CEL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 461.102660000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaSintetico."VENDA_DESCONTOS' +
              '_CANCEL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 544.252320000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaSintetico."VENDA_LIQUIDO_C' +
              'ANCEL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterVend: TfrxGroupFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 544.252320000000000000
          Width = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaSintetico."VENDA_LIQUI' +
              'DO_CANCEL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 461.102660000000000000
          Width = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaSintetico."VENDA_DESCO' +
              'NTOS_CANCEL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 377.953000000000000000
          Width = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaSintetico."VENDA_BRUTA' +
              '_CANCEL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 279.685220000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaSintetico."VENDA_LIQUI' +
              'DO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 181.417440000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaSintetico."VENDA_DESCO' +
              'NTOS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaSintetico."VENDA_BRUTA' +
              '">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Height = 124.724490000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
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
              'e a situa'#231#227'o da vendas informados')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 45.354360000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaSintetico."VENDA_BRUT' +
              'A">-<FrdsRelacaoVendaSintetico."VENDA_BRUTA_CANCEL">),BndMasterD' +
              'ata,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 464.882190000000000000
          Top = 45.354360000000000000
          Width = 79.370066540000000000
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
            'Bruto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 464.882190000000000000
          Top = 26.456710000000000000
          Width = 253.228446540000000000
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
          Left = 464.882190000000000000
          Top = 64.252010000000000000
          Width = 79.370066540000000000
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
            'Descontos: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 464.882190000000000000
          Top = 83.149660000000000000
          Width = 79.370066540000000000
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
            'L'#237'quido: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 64.252010000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaSintetico."VENDA_DESC' +
              'ONTOS">-<FrdsRelacaoVendaSintetico."VENDA_DESCONTOS_CANCEL">),Bn' +
              'dMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 83.149660000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaSintetico."VENDA_LIQU' +
              'IDO">-<FrdsRelacaoVendaSintetico."VENDA_LIQUIDO_CANCEL">),BndMas' +
              'terData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 464.882190000000000000
          Top = 102.047310000000000000
          Width = 79.370066540000000000
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
            'Comiss'#245'es: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 102.047310000000000000
          Width = 173.858380000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object QryRelacaoVendaSintetico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    v.competencia'
      '  , m.cmp_desc    as competencia_desc'
      '  , v.vendedor_cod'
      '  , d.nome as vendedor_nome'
      '  , d.cpf  as vendedor_cpf'
      '  , d.comissao'
      '  , sum( v.totalvenda_bruta )  as venda_bruta'
      '  , sum( v.desconto )          as venda_descontos'
      '  , sum( v.totalvenda )        as venda_liquido'
      '  , sum( v.totalcusto )        as venda_custo'
      
        '  , sum( v.totalvenda * coalesce(d.comissao, 0) / 100 )  as vend' +
        'a_comissao'
      ''
      
        '  , sum( case when v.status = 5 then v.totalvenda_bruta else 0 e' +
        'nd )  as venda_bruta_cancel'
      
        '  , sum( case when v.status = 5 then v.desconto else 0 end )    ' +
        '      as venda_descontos_cancel'
      
        '  , sum( case when v.status = 5 then v.totalvenda else 0 end )  ' +
        '      as venda_liquido_cancel'
      
        '  , sum( case when v.status = 5 then v.totalcusto else 0 end )  ' +
        '      as venda_custo_cancel'
      
        '  , sum( case when v.status = 5 then v.totalvenda * coalesce(d.c' +
        'omissao, 0) / 100 else 0 end )  as venda_comissao_cancel'
      'from TBVENDAS v'
      '  left join TBCLIENTE c on (c.codigo = v.codcliente)'
      '  left join TBCOMPETENCIA m on (m.cmp_num = v.competencia)'
      '  left join TBVENDEDOR d on (d.cod = v.vendedor_cod)'
      '  left join VW_STATUS_VENDA s on (s.codigo = v.status)'
      ''
      '/*'
      'where v.codemp = '#39'17429064000105'#39
      '  and v.status > 1 -- 1. Em andamento'
      ''
      'group by'
      '    v.competencia'
      '  , m.cmp_desc'
      '  , v.vendedor_cod'
      '  , d.nome'
      '  , d.cpf'
      '  , d.comissao'
      ''
      'order by'
      '    d.nome'
      '  , v.competencia'
      ''
      '*/')
    Left = 40
    Top = 8
  end
  object DspRelacaoVendaSintetico: TDataSetProvider
    DataSet = QryRelacaoVendaSintetico
    Left = 72
    Top = 8
  end
  object CdsRelacaoVendaSintetico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoVendaSintetico'
    Left = 104
    Top = 8
  end
  object FrdsRelacaoVendaSintetico: TfrxDBDataset
    UserName = 'FrdsRelacaoVendaSintetico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COMPETENCIA=COMPETENCIA'
      'COMPETENCIA_DESC=COMPETENCIA_DESC'
      'VENDEDOR_COD=VENDEDOR_COD'
      'VENDEDOR_NOME=VENDEDOR_NOME'
      'VENDEDOR_CPF=VENDEDOR_CPF'
      'COMISSAO=COMISSAO'
      'VENDA_BRUTA=VENDA_BRUTA'
      'VENDA_DESCONTOS=VENDA_DESCONTOS'
      'VENDA_LIQUIDO=VENDA_LIQUIDO'
      'VENDA_CUSTO=VENDA_CUSTO'
      'VENDA_COMISSAO=VENDA_COMISSAO'
      'VENDA_BRUTA_CANCEL=VENDA_BRUTA_CANCEL'
      'VENDA_DESCONTOS_CANCEL=VENDA_DESCONTOS_CANCEL'
      'VENDA_LIQUIDO_CANCEL=VENDA_LIQUIDO_CANCEL'
      'VENDA_CUSTO_CANCEL=VENDA_CUSTO_CANCEL'
      'VENDA_COMISSAO_CANCEL=VENDA_COMISSAO_CANCEL')
    DataSet = CdsRelacaoVendaSintetico
    BCDToCurrency = True
    Left = 136
    Top = 8
  end
  object QryVendedores: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    v.cod'
      '  , v.nome'
      '  , v.cpf'
      'from TBVENDEDOR v'
      'order by 2')
    Left = 360
    Top = 32
  end
  object DspVendedores: TDataSetProvider
    DataSet = QryVendedores
    Left = 392
    Top = 32
  end
  object CdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspVendedores'
    Left = 424
    Top = 32
  end
  object frRelacaoVendaAnalitico: TfrxReport
    Version = '5.1.9'
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
        DataSet = FrdsRelacaoVendaAnalitico
        DataSetName = 'FrdsRelacaoVendaAnalitico'
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
        Name = 'ValorComissao'
        Value = 
          '(<FrdsRelacaoVendaAnalitico."VENDA_COMISSAO">-<FrdsRelacaoVendaA' +
          'nalitico."VENDA_COMISSAO_CANCEL">)'
      end
      item
        Name = 'StatusVendaCancelada'
        Value = '5'
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
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Height = 154.960730000000000000
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
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
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
          Memo.UTF8W = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o das vendas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 812.598950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 646.299630000000000000
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
      object BndGrpHeaderVend: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677165354330710000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoVendaAnalitico."VENDEDOR_COD"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 873.071430000000000000
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
            ' [FrdsRelacaoVendaAnalitico."VENDEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
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
            ' Vendedor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 956.221090000000000000
          Width = 90.708720000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.0##"%"'#39',<FrdsRelacaoVendaAnalitico."COMISSAO">)' +
              '] de com. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoVendaAnalitico
        DataSetName = 'FrdsRelacaoVendaAnalitico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 956.221090000000000000
          Width = 90.708720000000000000
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
          Highlight.Condition = '<FrdsRelacaoVendaAnalitico."STATUS">=5'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<ValorComissao>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 661.417750000000000000
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
          Highlight.Condition = '<FrdsRelacaoVendaAnalitico."STATUS">=<StatusVendaCancelada>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaAnalitico."VENDA_BRUTA">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 759.685530000000000000
          Width = 98.267780000000000000
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
          Highlight.Condition = '<FrdsRelacaoVendaAnalitico."STATUS">=5'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaAnalitico."VENDA_DESCONTOS' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 857.953310000000000000
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
          Highlight.Condition = '<FrdsRelacaoVendaAnalitico."STATUS">=5'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaAnalitico."VENDA_LIQUIDO">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
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
          Highlight.Condition = '<FrdsRelacaoVendaAnalitico."STATUS">=<StatusVendaCancelada>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              ' [FrdsRelacaoVendaAnalitico."ANO"]/[FormatFloat('#39'0000000'#39',<FrdsR' +
              'elacaoVendaAnalitico."CODCONTROL">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 83.149660000000000000
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
          Highlight.Condition = '<FrdsRelacaoVendaAnalitico."STATUS">=<StatusVendaCancelada>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoVendaAnalitico."DTVEN' +
              'DA">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
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
          Highlight.Condition = '<FrdsRelacaoVendaAnalitico."STATUS">=<StatusVendaCancelada>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              ' [IIF(<FrdsRelacaoVendaAnalitico."NFE">>0,FormatFloat('#39'0000000'#39',' +
              '<FrdsRelacaoVendaAnalitico."NFE">),'#39#39')][IIF(<FrdsRelacaoVendaAna' +
              'litico."NFE">>0,'#39'-'#39'+<FrdsRelacaoVendaAnalitico."SERIE">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 249.448980000000000000
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
          Highlight.Condition = '<FrdsRelacaoVendaAnalitico."STATUS">=<StatusVendaCancelada>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              ' [IIF(<FrdsRelacaoVendaAnalitico."CLIENTE_TIPO">=1,FormatMaskTex' +
              't('#39'###.###.###-##;0;'#39',<FrdsRelacaoVendaAnalitico."CLIENTE_COD">)' +
              ',FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoVendaAnaliti' +
              'co."CLIENTE_COD">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 362.834880000000000000
          Width = 298.582806540000000000
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
          Highlight.Condition = '<FrdsRelacaoVendaAnalitico."STATUS">=<StatusVendaCancelada>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            ' [FrdsRelacaoVendaAnalitico."CLIENTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterVend: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677165354330710000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 956.221090000000000000
          Width = 90.708720000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 857.953310000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaAnalitico."VENDA_LIQUI' +
              'DO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 759.685530000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaAnalitico."VENDA_DESCO' +
              'NTOS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 661.417750000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaAnalitico."VENDA_BRUTA' +
              '">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 362.834880000000000000
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
            '[FrdsRelacaoVendaAnalitico."VENDEDOR_NOME"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 529.134200000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Venda(s) Cancelada(s).')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaAnalitico."VENDA_BRUT' +
              'A">-<FrdsRelacaoVendaAnalitico."VENDA_BRUTA_CANCEL">),BndMasterD' +
              'ata,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 793.701300000000000000
          Top = 18.897650000000000000
          Width = 79.370066540000000000
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
            'Bruto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 793.701300000000000000
          Width = 253.228446540000000000
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
          Left = 793.701300000000000000
          Top = 37.795300000000000000
          Width = 79.370066540000000000
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
            'Descontos: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 793.701300000000000000
          Top = 56.692950000000000000
          Width = 79.370066540000000000
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
            'L'#237'quido: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 37.795300000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaAnalitico."VENDA_DESC' +
              'ONTOS">-<FrdsRelacaoVendaAnalitico."VENDA_DESCONTOS_CANCEL">),Bn' +
              'dMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 56.692950000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaAnalitico."VENDA_LIQU' +
              'IDO">-<FrdsRelacaoVendaAnalitico."VENDA_LIQUIDO_CANCEL">),BndMas' +
              'terData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 793.701300000000000000
          Top = 75.590600000000000000
          Width = 79.370066540000000000
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
            'Comiss'#245'es: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 75.590600000000000000
          Width = 173.858380000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Top = 18.897650000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' * O TOTAL GERAL do relat'#243'rio leva em considera'#231#227'o apenas as ven' +
              'das n'#227'o canceladas.')
          ParentFont = False
        end
      end
      object BndGrpHeaderComp: TfrxGroupHeader
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoVendaAnalitico."COMPETENCIA"'
        ReprintOnNewPage = True
        object Memo8: TfrxMemoView
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
          HAlign = haCenter
          Memo.UTF8W = (
            'Compet'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 661.417750000000000000
          Top = 18.897650000000000000
          Width = 294.803340000000000000
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
            'Totais das Vendas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 661.417750000000000000
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
            'Bruto (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 759.685530000000000000
          Top = 37.795300000000000000
          Width = 98.267780000000000000
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
          Left = 857.953310000000000000
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
            'L'#237'quido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 956.221090000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
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
            'Comiss'#227'o (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
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
            
              ' [FrdsRelacaoVendaAnalitico."COMPETENCIA"] - [FrdsRelacaoVendaAn' +
              'alitico."COMPETENCIA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
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
            ' No. Venda')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 249.448980000000000000
          Top = 18.897650000000000000
          Width = 411.968706540000000000
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
            'Cliente')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 83.149660000000000000
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
            ' Data')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
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
            ' NF-e')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Top = 18.897650000000000000
          Width = 249.448980000000000000
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
            'Dados da Venda')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 249.448980000000000000
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
          Memo.UTF8W = (
            ' CPF/CNPJ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 362.834880000000000000
          Top = 37.795300000000000000
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
          Memo.UTF8W = (
            ' Nome')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterComp: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 956.221090000000000000
          Width = 90.708720000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 857.953310000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaAnalitico."VENDA_LIQUI' +
              'DO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 759.685530000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaAnalitico."VENDA_DESCO' +
              'NTOS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo12: TfrxSysMemoView
          Left = 661.417750000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaAnalitico."VENDA_BRUTA' +
              '">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 362.834880000000000000
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
            '[FrdsRelacaoVendaAnalitico."COMPETENCIA_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object QryRelacaoVendaAnalitico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    v.competencia'
      '  , m.cmp_desc    as competencia_desc'
      '  , v.vendedor_cod'
      '  , d.nome as vendedor_nome'
      '  , d.cpf  as vendedor_cpf'
      '  , d.comissao'
      '  , v.ano'
      '  , v.codcontrol'
      '  , v.dtvenda'
      '  , v.nfe'
      '  , v.serie'
      '  , v.status'
      '  , c.cnpj          as cliente_cod'
      '  , c.nome          as cliente_nome'
      '  , c.pessoa_fisica as cliente_tipo'
      '  , v.totalvenda_bruta   as venda_bruta'
      '  , v.desconto           as venda_descontos'
      '  , v.totalvenda         as venda_liquido'
      '  , v.totalcusto         as venda_custo'
      
        '  , ( v.totalvenda * coalesce(d.comissao, 0) / 100 )  as venda_c' +
        'omissao'
      ''
      
        '  , ( case when v.status = 5 then v.totalvenda_bruta else 0 end ' +
        ')  as venda_bruta_cancel'
      
        '  , ( case when v.status = 5 then v.desconto else 0 end )       ' +
        '   as venda_descontos_cancel'
      
        '  , ( case when v.status = 5 then v.totalvenda else 0 end )     ' +
        '   as venda_liquido_cancel'
      
        '  , ( case when v.status = 5 then v.totalcusto else 0 end )     ' +
        '   as venda_custo_cancel'
      
        '  , ( case when v.status = 5 then v.totalvenda * coalesce(d.comi' +
        'ssao, 0) / 100 else 0 end )  as venda_comissao_cancel'
      'from TBVENDAS v'
      '  inner join TBCLIENTE c on (c.codigo = v.codcliente)'
      '  inner join TBVENDEDOR d on (d.cod = v.vendedor_cod)'
      ''
      '  left join TBCOMPETENCIA m on (m.cmp_num = v.competencia)'
      '  left join VW_STATUS_VENDA s on (s.codigo = v.status)'
      ''
      '/*'
      'where v.codemp = '#39'17429064000105'#39
      '  and v.status > 1 -- 1. Em andamento'
      ''
      'order by'
      '    d.nome'
      '  , v.vendedor_cod'
      '  , v.competencia'
      '  , v.dtvenda'
      '  , c.nome'
      '  , c.cnpj'
      '*/')
    Left = 40
    Top = 40
  end
  object DspRelacaoVendaAnalitico: TDataSetProvider
    DataSet = QryRelacaoVendaAnalitico
    Left = 72
    Top = 40
  end
  object CdsRelacaoVendaAnalitico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoVendaAnalitico'
    Left = 104
    Top = 40
  end
  object FrdsRelacaoVendaAnalitico: TfrxDBDataset
    UserName = 'FrdsRelacaoVendaAnalitico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COMPETENCIA=COMPETENCIA'
      'COMPETENCIA_DESC=COMPETENCIA_DESC'
      'VENDEDOR_COD=VENDEDOR_COD'
      'VENDEDOR_NOME=VENDEDOR_NOME'
      'VENDEDOR_CPF=VENDEDOR_CPF'
      'COMISSAO=COMISSAO'
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'DTVENDA=DTVENDA'
      'NFE=NFE'
      'SERIE=SERIE'
      'STATUS=STATUS'
      'CLIENTE_COD=CLIENTE_COD'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_TIPO=CLIENTE_TIPO'
      'VENDA_BRUTA=VENDA_BRUTA'
      'VENDA_DESCONTOS=VENDA_DESCONTOS'
      'VENDA_LIQUIDO=VENDA_LIQUIDO'
      'VENDA_CUSTO=VENDA_CUSTO'
      'VENDA_COMISSAO=VENDA_COMISSAO'
      'VENDA_BRUTA_CANCEL=VENDA_BRUTA_CANCEL'
      'VENDA_DESCONTOS_CANCEL=VENDA_DESCONTOS_CANCEL'
      'VENDA_LIQUIDO_CANCEL=VENDA_LIQUIDO_CANCEL'
      'VENDA_CUSTO_CANCEL=VENDA_CUSTO_CANCEL'
      'VENDA_COMISSAO_CANCEL=VENDA_COMISSAO_CANCEL')
    DataSet = CdsRelacaoVendaAnalitico
    BCDToCurrency = True
    Left = 136
    Top = 40
  end
  object frRelacaoVendaComparativo: TfrxReport
    Version = '5.1.9'
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
        DataSet = FrdsRelacaoVendaSintetico
        DataSetName = 'FrdsRelacaoVendaSintetico'
      end
      item
        DataSet = FrdsVendaCompetencia
        DataSetName = 'FrdsVendaCompetencia'
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
        Name = 'ValorComissao'
        Value = 
          '(<FrdsRelacaoVendaSintetico."VENDA_COMISSAO">-<FrdsRelacaoVendaS' +
          'intetico."VENDA_COMISSAO_CANCEL">)'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object PageMapa: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Height = 154.960730000000000000
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
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
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
          Memo.UTF8W = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o das vendas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 812.598950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 408.189240000000000000
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
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Height = 112.000000000000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoVendaSintetico
        DataSetName = 'FrdsRelacaoVendaSintetico'
        RowCount = 0
        object DBCross1: TfrxDBCrossView
          Width = 421.000000000000000000
          Height = 112.000000000000000000
          CellLevels = 2
          DownThenAcross = False
          PlainCells = True
          ShowTitle = False
          CellFields.Strings = (
            'VENDA_LIQUIDO'
            'VENDA_COMISSAO')
          ColumnFields.Strings = (
            'COMPETENCIA')
          DataSet = FrdsRelacaoVendaSintetico
          DataSetName = 'FrdsRelacaoVendaSintetico'
          RowFields.Strings = (
            'VENDEDOR_NOME')
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
            6C6C6D656D6F733E3C546672784D656D6F56696577204C6566743D2231323322
            20546F703D223239302C3333303836222057696474683D223730222048656967
            68743D22313822205265737472696374696F6E733D2232342220416C6C6F7745
            787072657373696F6E733D2246616C73652220446973706C6179466F726D6174
            2E466F726D61745374723D2225322E326E2220446973706C6179466F726D6174
            2E4B696E643D22666B4E756D657269632220466F6E742E436861727365743D22
            312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D
            31312220466F6E742E4E616D653D225461686F6D612220466F6E742E5374796C
            653D223022204672616D652E5479703D22313522204672616D652E5769647468
            3D22302C312220476170583D22332220476170593D2233222048416C69676E3D
            22686152696768742220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D22302C3030222F3E3C546672
            784D656D6F56696577204C6566743D223139332220546F703D223239302C3333
            303836222057696474683D22383122204865696768743D223138222052657374
            72696374696F6E733D2232342220416C6C6F7745787072657373696F6E733D22
            46616C73652220446973706C6179466F726D61742E466F726D61745374723D22
            25322E326E2220446973706C6179466F726D61742E4B696E643D22666B4E756D
            657269632220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D22302220466F6E742E4865696768743D222D31312220466F6E742E4E616D
            653D225461686F6D612220466F6E742E5374796C653D223022204672616D652E
            5479703D22313522204672616D652E57696474683D22302C312220476170583D
            22332220476170593D2233222048416C69676E3D226861526967687422205061
            72656E74466F6E743D2246616C7365222056416C69676E3D22766143656E7465
            722220546578743D22302C3030222F3E3C546672784D656D6F56696577204C65
            66743D223132332220546F703D223330382C3333303836222057696474683D22
            373022204865696768743D22313822205265737472696374696F6E733D223234
            2220416C6C6F7745787072657373696F6E733D2246616C73652220446973706C
            6179466F726D61742E466F726D61745374723D2225322E326E2220446973706C
            6179466F726D61742E4B696E643D22666B4E756D657269632220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48
            65696768743D222D31312220466F6E742E4E616D653D225461686F6D61222046
            6F6E742E5374796C653D223122204672616D652E5479703D2231352220467261
            6D652E57696474683D22302C31222046696C6C2E4261636B436F6C6F723D222D
            31363737373230312220476170583D22332220476170593D2233222048416C69
            676E3D22686152696768742220506172656E74466F6E743D2246616C73652220
            56416C69676E3D22766143656E7465722220546578743D22302C3030222F3E3C
            546672784D656D6F56696577204C6566743D223139332220546F703D22333038
            2C3333303836222057696474683D22383122204865696768743D223138222052
            65737472696374696F6E733D2232342220416C6C6F7745787072657373696F6E
            733D2246616C73652220446973706C6179466F726D61742E466F726D61745374
            723D2225322E326E2220446973706C6179466F726D61742E4B696E643D22666B
            4E756D657269632220466F6E742E436861727365743D22312220466F6E742E43
            6F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E742E
            4E616D653D225461686F6D612220466F6E742E5374796C653D22312220467261
            6D652E5479703D22313522204672616D652E57696474683D22302C3122204669
            6C6C2E4261636B436F6C6F723D222D31363737373230312220476170583D2233
            2220476170593D2233222048416C69676E3D2268615269676874222050617265
            6E74466F6E743D2246616C7365222056416C69676E3D22766143656E74657222
            20546578743D22302C3030222F3E3C546672784D656D6F56696577204C656674
            3D223237342220546F703D223239302C3333303836222057696474683D223730
            22204865696768743D22313822205265737472696374696F6E733D2232342220
            416C6C6F7745787072657373696F6E733D2246616C73652220446973706C6179
            466F726D61742E466F726D61745374723D2225322E326E2220446973706C6179
            466F726D61742E4B696E643D22666B4E756D657269632220466F6E742E436861
            727365743D22312220466F6E742E436F6C6F723D223136373131363830222046
            6F6E742E4865696768743D222D31312220466F6E742E4E616D653D225461686F
            6D612220466F6E742E5374796C653D223022204672616D652E5479703D223135
            22204672616D652E57696474683D22302C312220476170583D22332220476170
            593D2233222048416C69676E3D22686152696768742220506172656E74466F6E
            743D2246616C7365222056416C69676E3D22766143656E746572222054657874
            3D22302C3030222F3E3C546672784D656D6F56696577204C6566743D22333434
            2220546F703D223239302C3333303836222057696474683D2235372220486569
            6768743D22313822205265737472696374696F6E733D2232342220416C6C6F77
            45787072657373696F6E733D2246616C73652220446973706C6179466F726D61
            742E466F726D61745374723D2225322E326E2220446973706C6179466F726D61
            742E4B696E643D22666B4E756D657269632220466F6E742E436861727365743D
            22312220466F6E742E436F6C6F723D2231363731313638302220466F6E742E48
            65696768743D222D31312220466F6E742E4E616D653D225461686F6D61222046
            6F6E742E5374796C653D223022204672616D652E5479703D2231352220467261
            6D652E57696474683D22302C312220476170583D22332220476170593D223322
            2048416C69676E3D22686152696768742220506172656E74466F6E743D224661
            6C7365222056416C69676E3D22766143656E7465722220546578743D22302C30
            30222F3E3C546672784D656D6F56696577204C6566743D223237342220546F70
            3D223330382C3333303836222057696474683D22373022204865696768743D22
            313822205265737472696374696F6E733D2232342220416C6C6F774578707265
            7373696F6E733D2246616C73652220446973706C6179466F726D61742E466F72
            6D61745374723D2225322E326E2220446973706C6179466F726D61742E4B696E
            643D22666B4E756D657269632220466F6E742E436861727365743D2231222046
            6F6E742E436F6C6F723D2231363731313638302220466F6E742E486569676874
            3D222D31312220466F6E742E4E616D653D225461686F6D612220466F6E742E53
            74796C653D223122204672616D652E5479703D22313522204672616D652E5769
            6474683D22302C31222046696C6C2E4261636B436F6C6F723D222D3136373737
            3230312220476170583D22332220476170593D2233222048416C69676E3D2268
            6152696768742220506172656E74466F6E743D2246616C7365222056416C6967
            6E3D22766143656E7465722220546578743D22302C3030222F3E3C546672784D
            656D6F56696577204C6566743D223334342220546F703D223330382C33333038
            36222057696474683D22353722204865696768743D2231382220526573747269
            6374696F6E733D2232342220416C6C6F7745787072657373696F6E733D224661
            6C73652220446973706C6179466F726D61742E466F726D61745374723D222532
            2E326E2220446973706C6179466F726D61742E4B696E643D22666B4E756D6572
            69632220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D
            2231363731313638302220466F6E742E4865696768743D222D31312220466F6E
            742E4E616D653D225461686F6D612220466F6E742E5374796C653D2231222046
            72616D652E5479703D22313522204672616D652E57696474683D22302C312220
            46696C6C2E4261636B436F6C6F723D222D31363737373230312220476170583D
            22332220476170593D2233222048416C69676E3D226861526967687422205061
            72656E74466F6E743D2246616C7365222056416C69676E3D22766143656E7465
            722220546578743D22302C3030222F3E3C2F63656C6C6D656D6F733E3C63656C
            6C6865616465726D656D6F733E3C546672784D656D6F56696577204C6566743D
            223132332220546F703D223237322C3333303836222057696474683D22373022
            204865696768743D22313822205265737472696374696F6E733D22382220416C
            6C6F7745787072657373696F6E733D2246616C73652220466F6E742E43686172
            7365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48656967
            68743D222D31312220466F6E742E4E616D653D225461686F6D612220466F6E74
            2E5374796C653D223022204672616D652E5479703D22313522204672616D652E
            57696474683D22302C31222046696C6C2E4261636B436F6C6F723D222D313637
            37373230312220476170583D22332220476170593D22332220506172656E7446
            6F6E743D2246616C7365222056416C69676E3D22766143656E74657222205465
            78743D22204CC3AD717569646F202852242920222F3E3C546672784D656D6F56
            696577204C6566743D223139332220546F703D223237322C3333303836222057
            696474683D22383122204865696768743D22313822205265737472696374696F
            6E733D22382220416C6C6F7745787072657373696F6E733D2246616C73652220
            466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220
            466F6E742E4865696768743D222D31312220466F6E742E4E616D653D22546168
            6F6D612220466F6E742E5374796C653D223022204672616D652E5479703D2231
            3522204672616D652E57696474683D22302C31222046696C6C2E4261636B436F
            6C6F723D222D31363737373230312220476170583D22332220476170593D2233
            2220506172656E74466F6E743D2246616C7365222056416C69676E3D22766143
            656E7465722220546578743D2220436F6D697373C3A36F202852242920222F3E
            3C546672784D656D6F56696577204C6566743D223237342220546F703D223237
            322C3333303836222057696474683D22373022204865696768743D2231382220
            5265737472696374696F6E733D22382220416C6C6F7745787072657373696F6E
            733D2246616C73652220466F6E742E436861727365743D22312220466F6E742E
            436F6C6F723D2231363731313638302220466F6E742E4865696768743D222D31
            312220466F6E742E4E616D653D225461686F6D612220466F6E742E5374796C65
            3D223022204672616D652E5479703D22313522204672616D652E57696474683D
            22302C31222046696C6C2E4261636B436F6C6F723D222D313637373732303122
            20476170583D22332220476170593D22332220506172656E74466F6E743D2246
            616C7365222056416C69676E3D22766143656E7465722220546578743D22204C
            C3AD717569646F202852242920222F3E3C546672784D656D6F56696577204C65
            66743D223334342220546F703D223237322C3333303836222057696474683D22
            353722204865696768743D22313822205265737472696374696F6E733D223822
            20416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22313637313136383022
            20466F6E742E4865696768743D222D31312220466F6E742E4E616D653D225461
            686F6D612220466F6E742E5374796C653D223022204672616D652E5479703D22
            313522204672616D652E57696474683D22302C31222046696C6C2E4261636B43
            6F6C6F723D222D31363737373230312220476170583D22332220476170593D22
            332220506172656E74466F6E743D2246616C7365222056416C69676E3D227661
            43656E7465722220546578743D2220436F6D697373C3A36F20222F3E3C2F6365
            6C6C6865616465726D656D6F733E3C636F6C756D6E6D656D6F733E3C54667278
            4D656D6F56696577204C6566743D223132332220546F703D223235342C333330
            3836222057696474683D2231353122204865696768743D223138222052657374
            72696374696F6E733D2232342220416C6C6F7745787072657373696F6E733D22
            46616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C
            6F723D22302220466F6E742E4865696768743D222D31312220466F6E742E4E61
            6D653D225461686F6D612220466F6E742E5374796C653D223122204672616D65
            2E5479703D22313522204672616D652E57696474683D22302C31222046696C6C
            2E4261636B436F6C6F723D222D31363737373230312220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E7465722220506172656E
            74466F6E743D2246616C7365222056416C69676E3D22766143656E7465722220
            546578743D22222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F
            74616C6D656D6F733E3C546672784D656D6F56696577204C6566743D22323734
            2220546F703D223235342C3333303836222057696474683D2231323722204865
            696768743D22313822205265737472696374696F6E733D22382220416C6C6F77
            45787072657373696F6E733D2246616C73652220466F6E742E43686172736574
            3D22312220466F6E742E436F6C6F723D2231363731313638302220466F6E742E
            4865696768743D222D31312220466F6E742E4E616D653D225461686F6D612220
            466F6E742E5374796C653D223122204672616D652E5479703D22313522204672
            616D652E57696474683D22302C31222046696C6C2E4261636B436F6C6F723D22
            2D31363737373230312220476170583D22332220476170593D2233222048416C
            69676E3D22686143656E7465722220506172656E74466F6E743D2246616C7365
            222056416C69676E3D22766143656E7465722220546578743D22544F54414C22
            2F3E3C2F636F6C756D6E746F74616C6D656D6F733E3C636F726E65726D656D6F
            733E3C546672784D656D6F56696577204C6566743D2232302220546F703D2232
            35342C3333303836222057696474683D2231303322204865696768743D223022
            205265737472696374696F6E733D2238222056697369626C653D2246616C7365
            2220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E
            436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E
            4865696768743D222D31312220466F6E742E4E616D653D225461686F6D612220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204761
            70583D22332220476170593D2233222048416C69676E3D22686143656E746572
            2220506172656E74466F6E743D2246616C7365222056416C69676E3D22766143
            656E7465722220546578743D2256454E44415F4C49515549444F222F3E3C5466
            72784D656D6F56696577204C6566743D223132332220546F703D223235342C33
            33303836222057696474683D2232373822204865696768743D22302220526573
            7472696374696F6E733D2238222056697369626C653D2246616C73652220416C
            6C6F7745787072657373696F6E733D2246616C73652220466F6E742E43686172
            7365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48656967
            68743D222D31312220466F6E742E4E616D653D225461686F6D612220466F6E74
            2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222048416C69676E3D22686143656E74657222205061
            72656E74466F6E743D2246616C7365222056416C69676E3D22766143656E7465
            722220546578743D22434F4D504554454E434941222F3E3C546672784D656D6F
            56696577204C6566743D223133362220546F703D223232222057696474683D22
            31333122204865696768743D22323222205265737472696374696F6E733D2238
            222056697369626C653D2246616C73652220416C6C6F7745787072657373696F
            6E733D2246616C736522204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222048416C69676E3D22686143656E74657222205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D65
            6D6F56696577204C6566743D2232302220546F703D223235342C333330383622
            2057696474683D2231303322204865696768743D223336222052657374726963
            74696F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C73
            652220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22
            302220466F6E742E4865696768743D222D31312220466F6E742E4E616D653D22
            5461686F6D612220466F6E742E5374796C653D223122204672616D652E547970
            3D22313522204672616D652E57696474683D22302C31222046696C6C2E426163
            6B436F6C6F723D222D31363737373230312220476170583D2233222047617059
            3D2233222048416C69676E3D22686143656E7465722220506172656E74466F6E
            743D2246616C7365222056416C69676E3D22766143656E746572222054657874
            3D2256656E6465646F72222F3E3C2F636F726E65726D656D6F733E3C726F776D
            656D6F733E3C546672784D656D6F56696577204C6566743D2232302220546F70
            3D223239302C3333303836222057696474683D2231303322204865696768743D
            22313822205265737472696374696F6E733D2232342220416C6C6F7745787072
            657373696F6E733D2246616C73652220466F6E742E436861727365743D223122
            20466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D3131
            2220466F6E742E4E616D653D225461686F6D612220466F6E742E5374796C653D
            223022204672616D652E5479703D22313522204672616D652E57696474683D22
            302C312220476170583D22332220476170593D22332220506172656E74466F6E
            743D2246616C7365222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C2F726F776D656D6F733E3C726F77746F74616C6D656D6F733E3C
            546672784D656D6F56696577204C6566743D2232302220546F703D223330382C
            3333303836222057696474683D2231303322204865696768743D223138222052
            65737472696374696F6E733D22382220416C6C6F7745787072657373696F6E73
            3D2246616C73652220466F6E742E436861727365743D22312220466F6E742E43
            6F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E742E
            4E616D653D225461686F6D612220466F6E742E5374796C653D22312220467261
            6D652E5479703D22313522204672616D652E57696474683D22302C3122204669
            6C6C2E4261636B436F6C6F723D222D31363737373230312220476170583D2233
            2220476170593D2233222048416C69676E3D22686143656E7465722220506172
            656E74466F6E743D2246616C7365222056416C69676E3D22766143656E746572
            2220546578743D22544F54414C222F3E3C2F726F77746F74616C6D656D6F733E
            3C63656C6C66756E6374696F6E733E3C6974656D20312F3E3C6974656D20312F
            3E3C2F63656C6C66756E6374696F6E733E3C636F6C756D6E736F72743E3C6974
            656D20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72743E3C697465
            6D20302F3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
    end
  end
  object frRelacaoVendaClienteSintetico: TfrxReport
    Version = '5.1.9'
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
        DataSet = FrdsRelacaoVendaClienteSintetico
        DataSetName = 'FrdsRelacaoVendaClienteSintetico'
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
        Name = 'ValorComissao'
        Value = 
          '(<FrdsRelacaoVendaClienteSintetico."VENDA_COMISSAO">-<FrdsRelaca' +
          'oVendaClienteSintetico."VENDA_COMISSAO_CANCEL">)'
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
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Height = 154.960730000000000000
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
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
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
          Memo.UTF8W = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o das vendas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 483.779840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 589.606680000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
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
          Top = 15.118120000000000000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
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
      object BndGrpHeaderVend: TfrxGroupHeader
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoVendaClienteSintetico."CLIENTE_CPF_CNPJ"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
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
            
              ' [IIF(<FrdsRelacaoVendaClienteSintetico."CLIENTE_PF">=1,FormatMa' +
              'skText('#39'###.###.###-##;0;'#39',<FrdsRelacaoVendaClienteSintetico."CL' +
              'IENTE_CPF_CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRe' +
              'lacaoVendaClienteSintetico."CLIENTE_CPF_CNPJ">))] - [FrdsRelacao' +
              'VendaClienteSintetico."CLIENTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
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
            ' Cliente')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 83.149660000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            'Compet'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 83.149660000000000000
          Top = 18.897650000000000000
          Width = 294.803340000000000000
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
            'Totais das Vendas *')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 83.149660000000000000
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
            'Bruto (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 181.417440000000000000
          Top = 37.795300000000000000
          Width = 98.267780000000000000
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
          Left = 279.685220000000000000
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
            'L'#237'quido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 377.953000000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
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
            'Totais das Vendas Canceladas *')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 627.401980000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
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
            'Comiss'#227'o (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 377.953000000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Bruto (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 461.102660000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Desc. (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 544.252320000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'L'#237'quido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoVendaClienteSintetico
        DataSetName = 'FrdsRelacaoVendaClienteSintetico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
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
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<ValorComissao>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 83.149660000000000000
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
          Memo.UTF8W = (
            ' [FrdsRelacaoVendaClienteSintetico."COMPETENCIA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 83.149660000000000000
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
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaClienteSintetico."VENDA_BR' +
              'UTA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 181.417440000000000000
          Width = 98.267780000000000000
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
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaClienteSintetico."VENDA_DE' +
              'SCONTOS">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 279.685220000000000000
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
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaClienteSintetico."VENDA_LI' +
              'QUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 377.953000000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaClienteSintetico."VENDA_BR' +
              'UTA_CANCEL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 461.102660000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaClienteSintetico."VENDA_DE' +
              'SCONTOS_CANCEL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 544.252320000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaClienteSintetico."VENDA_LI' +
              'QUIDO_CANCEL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterVend: TfrxGroupFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 544.252320000000000000
          Width = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteSintetico."VEND' +
              'A_LIQUIDO_CANCEL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 461.102660000000000000
          Width = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteSintetico."VEND' +
              'A_DESCONTOS_CANCEL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 377.953000000000000000
          Width = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteSintetico."VEND' +
              'A_BRUTA_CANCEL">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 279.685220000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteSintetico."VEND' +
              'A_LIQUIDO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 181.417440000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteSintetico."VEND' +
              'A_DESCONTOS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteSintetico."VEND' +
              'A_BRUTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Height = 124.724490000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
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
              'e a situa'#231#227'o da vendas informados')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 45.354360000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaClienteSintetico."VEN' +
              'DA_BRUTA">-<FrdsRelacaoVendaClienteSintetico."VENDA_BRUTA_CANCEL' +
              '">),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 464.882190000000000000
          Top = 45.354360000000000000
          Width = 79.370066540000000000
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
            'Bruto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 464.882190000000000000
          Top = 26.456710000000000000
          Width = 253.228446540000000000
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
          Left = 464.882190000000000000
          Top = 64.252010000000000000
          Width = 79.370066540000000000
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
            'Descontos: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 464.882190000000000000
          Top = 83.149660000000000000
          Width = 79.370066540000000000
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
            'L'#237'quido: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 64.252010000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaClienteSintetico."VEN' +
              'DA_DESCONTOS">-<FrdsRelacaoVendaClienteSintetico."VENDA_DESCONTO' +
              'S_CANCEL">),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 83.149660000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaClienteSintetico."VEN' +
              'DA_LIQUIDO">-<FrdsRelacaoVendaClienteSintetico."VENDA_LIQUIDO_CA' +
              'NCEL">),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 464.882190000000000000
          Top = 102.047310000000000000
          Width = 79.370066540000000000
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
            'Comiss'#245'es: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 102.047310000000000000
          Width = 173.858380000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object QryRelacaoVendaClienteSintetico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    v.competencia'
      '  , m.cmp_desc    as competencia_desc'
      '  , v.codcli as cliente_cod'
      '  , trim(c.nome)   as cliente_nome'
      '  , c.cnpj   as cliente_cpf_cnpj'
      '  , c.pessoa_fisica as cliente_pf'
      '  , sum( v.totalvenda_bruta )  as venda_bruta'
      '  , sum( v.desconto )          as venda_descontos'
      '  , sum( v.totalvenda )        as venda_liquido'
      '  , sum( v.totalcusto )        as venda_custo'
      
        '  , sum( v.totalvenda * coalesce(d.comissao, 0) / 100 )  as vend' +
        'a_comissao'
      ''
      
        '  , sum( case when v.status = 5 then v.totalvenda_bruta else 0 e' +
        'nd )  as venda_bruta_cancel'
      
        '  , sum( case when v.status = 5 then v.desconto else 0 end )    ' +
        '      as venda_descontos_cancel'
      
        '  , sum( case when v.status = 5 then v.totalvenda else 0 end )  ' +
        '      as venda_liquido_cancel'
      
        '  , sum( case when v.status = 5 then v.totalcusto else 0 end )  ' +
        '      as venda_custo_cancel'
      
        '  , sum( case when v.status = 5 then v.totalvenda * coalesce(d.c' +
        'omissao, 0) / 100 else 0 end )  as venda_comissao_cancel'
      'from TBVENDAS v'
      '  left join TBCLIENTE c on (c.codigo = v.codcliente)'
      '  left join TBCOMPETENCIA m on (m.cmp_num = v.competencia)'
      '  left join VW_STATUS_VENDA s on (s.codigo = v.status)'
      '  left join TBVENDEDOR d on (d.cod = v.vendedor_cod)'
      ''
      '/*'
      'where v.codemp = '#39'17429064000105'#39
      '  and v.status > 1 -- 1. Em andamento'
      ''
      'group by'
      '    v.competencia'
      '  , m.cmp_desc'
      '  , v.codcli'
      '  , c.nome'
      '  , c.cnpj'
      '  , c.pessoa_fisica'
      ''
      'order by'
      '    c.nome'
      '  , c.cnpj'
      '  , v.competencia'
      '*/')
    Left = 39
    Top = 112
  end
  object DspRelacaoVendaClienteSintetico: TDataSetProvider
    DataSet = QryRelacaoVendaClienteSintetico
    Left = 72
    Top = 112
  end
  object CdsRelacaoVendaClienteSintetico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoVendaClienteSintetico'
    Left = 104
    Top = 112
  end
  object FrdsRelacaoVendaClienteSintetico: TfrxDBDataset
    UserName = 'FrdsRelacaoVendaClienteSintetico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COMPETENCIA=COMPETENCIA'
      'COMPETENCIA_DESC=COMPETENCIA_DESC'
      'CLIENTE_COD=CLIENTE_COD'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_CPF_CNPJ=CLIENTE_CPF_CNPJ'
      'CLIENTE_PF=CLIENTE_PF'
      'VENDA_BRUTA=VENDA_BRUTA'
      'VENDA_DESCONTOS=VENDA_DESCONTOS'
      'VENDA_LIQUIDO=VENDA_LIQUIDO'
      'VENDA_CUSTO=VENDA_CUSTO'
      'VENDA_COMISSAO=VENDA_COMISSAO'
      'VENDA_BRUTA_CANCEL=VENDA_BRUTA_CANCEL'
      'VENDA_DESCONTOS_CANCEL=VENDA_DESCONTOS_CANCEL'
      'VENDA_LIQUIDO_CANCEL=VENDA_LIQUIDO_CANCEL'
      'VENDA_CUSTO_CANCEL=VENDA_CUSTO_CANCEL'
      'VENDA_COMISSAO_CANCEL=VENDA_COMISSAO_CANCEL')
    DataSet = CdsRelacaoVendaClienteSintetico
    BCDToCurrency = True
    Left = 136
    Top = 112
  end
  object frRelacaoVendaClienteAnalitico: TfrxReport
    Version = '5.1.9'
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
    Top = 160
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoVendaClienteAnalitico
        DataSetName = 'FrdsRelacaoVendaClienteAnalitico'
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
        Name = 'ValorComissao'
        Value = 
          '(<FrdsRelacaoVendaClienteAnalitico."VENDA_COMISSAO">-<FrdsRelaca' +
          'oVendaClienteAnalitico."VENDA_COMISSAO_CANCEL">)'
      end
      item
        Name = 'StatusVendaCancelada'
        Value = '5'
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
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Height = 154.960730000000000000
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
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
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
          Memo.UTF8W = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o das vendas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 812.598950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 646.299630000000000000
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
      object BndGrpHeaderVend: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677165350000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoVendaClienteAnalitico."CLIENTE_COD"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
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
            
              ' [IIF(<FrdsRelacaoVendaClienteAnalitico."CLIENTE_PF">=1,FormatMa' +
              'skText('#39'###.###.###-##;0;'#39',<FrdsRelacaoVendaClienteAnalitico."CL' +
              'IENTE_COD">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacao' +
              'VendaClienteAnalitico."CLIENTE_COD">))] - [FrdsRelacaoVendaClien' +
              'teAnalitico."CLIENTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
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
            ' Cliente')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoVendaClienteAnalitico
        DataSetName = 'FrdsRelacaoVendaClienteAnalitico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 956.221090000000000000
          Width = 90.708720000000000000
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
            '<FrdsRelacaoVendaClienteAnalitico."STATUS">=<StatusVendaCancelad' +
            'a>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<ValorComissao>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 661.417750000000000000
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
            '<FrdsRelacaoVendaClienteAnalitico."STATUS">=<StatusVendaCancelad' +
            'a>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaClienteAnalitico."VENDA_BR' +
              'UTA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 759.685530000000000000
          Width = 98.267780000000000000
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
            '<FrdsRelacaoVendaClienteAnalitico."STATUS">=<StatusVendaCancelad' +
            'a>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaClienteAnalitico."VENDA_DE' +
              'SCONTOS">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 857.953310000000000000
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
            '<FrdsRelacaoVendaClienteAnalitico."STATUS">=<StatusVendaCancelad' +
            'a>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoVendaClienteAnalitico."VENDA_LI' +
              'QUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
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
            '<FrdsRelacaoVendaClienteAnalitico."STATUS">=<StatusVendaCancelad' +
            'a>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              ' [FrdsRelacaoVendaClienteAnalitico."ANO"]/[FormatFloat('#39'0000000'#39 +
              ',<FrdsRelacaoVendaClienteAnalitico."CODCONTROL">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 83.149660000000000000
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
            '<FrdsRelacaoVendaClienteAnalitico."STATUS">=<StatusVendaCancelad' +
            'a>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoVendaClienteAnalitico' +
              '."DTVENDA">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
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
            '<FrdsRelacaoVendaClienteAnalitico."STATUS">=<StatusVendaCancelad' +
            'a>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              ' [IIF(<FrdsRelacaoVendaClienteAnalitico."NFE">>0,FormatFloat('#39'00' +
              '00000'#39',<FrdsRelacaoVendaClienteAnalitico."NFE">),'#39#39')][IIF(<FrdsR' +
              'elacaoVendaClienteAnalitico."NFE">>0,'#39'-'#39'+<FrdsRelacaoVendaClient' +
              'eAnalitico."SERIE">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 249.448980000000000000
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
          Highlight.Condition = 
            '<FrdsRelacaoVendaClienteAnalitico."STATUS">=<StatusVendaCancelad' +
            'a>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            
              ' [FormatMaskText('#39'###.###.###-##;0;'#39',<FrdsRelacaoVendaClienteAna' +
              'litico."VENDEDOR_CPF">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 362.834880000000000000
          Width = 298.582806540000000000
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
            '<FrdsRelacaoVendaClienteAnalitico."STATUS">=<StatusVendaCancelad' +
            'a>'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            ' [FrdsRelacaoVendaClienteAnalitico."VENDEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterVend: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677165354330710000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 956.221090000000000000
          Width = 90.708720000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 857.953310000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteAnalitico."VEND' +
              'A_LIQUIDO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 759.685530000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteAnalitico."VEND' +
              'A_DESCONTOS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 661.417750000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteAnalitico."VEND' +
              'A_BRUTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 362.834880000000000000
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
            '[FrdsRelacaoVendaClienteAnalitico."CLIENTE_NOME"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 529.134200000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' * Venda(s) Cancelada(s).')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaClienteAnalitico."VEN' +
              'DA_BRUTA">-<FrdsRelacaoVendaClienteAnalitico."VENDA_BRUTA_CANCEL' +
              '">),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 793.701300000000000000
          Top = 18.897650000000000000
          Width = 79.370066540000000000
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
            'Bruto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 793.701300000000000000
          Width = 253.228446540000000000
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
          Left = 793.701300000000000000
          Top = 37.795300000000000000
          Width = 79.370066540000000000
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
            'Descontos: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 793.701300000000000000
          Top = 56.692950000000000000
          Width = 79.370066540000000000
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
            'L'#237'quido: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 37.795300000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaClienteAnalitico."VEN' +
              'DA_DESCONTOS">-<FrdsRelacaoVendaClienteAnalitico."VENDA_DESCONTO' +
              'S_CANCEL">),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 56.692950000000000000
          Width = 173.858380000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoVendaClienteAnalitico."VEN' +
              'DA_LIQUIDO">-<FrdsRelacaoVendaClienteAnalitico."VENDA_LIQUIDO_CA' +
              'NCEL">),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 793.701300000000000000
          Top = 75.590600000000000000
          Width = 79.370066540000000000
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
            'Comiss'#245'es: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 75.590600000000000000
          Width = 173.858380000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Top = 18.897650000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' * O TOTAL GERAL do relat'#243'rio leva em considera'#231#227'o apenas as ven' +
              'das n'#227'o canceladas.')
          ParentFont = False
        end
      end
      object BndGrpHeaderComp: TfrxGroupHeader
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoVendaClienteAnalitico."COMPETENCIA"'
        ReprintOnNewPage = True
        object Memo8: TfrxMemoView
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
          HAlign = haCenter
          Memo.UTF8W = (
            'Compet'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 661.417750000000000000
          Top = 18.897650000000000000
          Width = 294.803340000000000000
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
            'Totais das Vendas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 661.417750000000000000
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
            'Bruto (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 759.685530000000000000
          Top = 37.795300000000000000
          Width = 98.267780000000000000
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
          Left = 857.953310000000000000
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
            'L'#237'quido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 956.221090000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
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
            'Comiss'#227'o (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
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
            
              ' [FrdsRelacaoVendaClienteAnalitico."COMPETENCIA"] - [FrdsRelacao' +
              'VendaClienteAnalitico."COMPETENCIA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
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
            ' No. Venda')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 249.448980000000000000
          Top = 18.897650000000000000
          Width = 411.968706540000000000
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
            'Vendedor')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 83.149660000000000000
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
            ' Data')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
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
            ' NF-e')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Top = 18.897650000000000000
          Width = 249.448980000000000000
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
            'Dados da Venda')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 249.448980000000000000
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
          Memo.UTF8W = (
            ' CPF')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 362.834880000000000000
          Top = 37.795300000000000000
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
          Memo.UTF8W = (
            ' Nome')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterComp: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 956.221090000000000000
          Width = 90.708720000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 857.953310000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteAnalitico."VEND' +
              'A_LIQUIDO">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 759.685530000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteAnalitico."VEND' +
              'A_DESCONTOS">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo12: TfrxSysMemoView
          Left = 661.417750000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoVendaClienteAnalitico."VEND' +
              'A_BRUTA">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 362.834880000000000000
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
            '[FrdsRelacaoVendaClienteAnalitico."COMPETENCIA_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object QryRelacaoVendaClienteAnalitico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    v.competencia'
      '  , m.cmp_desc    as competencia_desc'
      '  , v.vendedor_cod'
      '  , d.nome as vendedor_nome'
      '  , d.cpf  as vendedor_cpf'
      '  , d.comissao'
      '  , v.ano'
      '  , v.codcontrol'
      '  , v.dtvenda'
      '  , v.nfe'
      '  , v.serie'
      '  , v.status'
      '  , c.cnpj          as cliente_cod'
      '  , c.nome          as cliente_nome'
      '  , c.pessoa_fisica as cliente_pf'
      '  , v.totalvenda_bruta   as venda_bruta'
      '  , v.desconto           as venda_descontos'
      '  , v.totalvenda         as venda_liquido'
      '  , v.totalcusto         as venda_custo'
      
        '  , ( v.totalvenda * coalesce(d.comissao, 0) / 100 )  as venda_c' +
        'omissao'
      ''
      
        '  , ( case when v.status = 5 then v.totalvenda_bruta else 0 end ' +
        ')  as venda_bruta_cancel'
      
        '  , ( case when v.status = 5 then v.desconto else 0 end )       ' +
        '   as venda_descontos_cancel'
      
        '  , ( case when v.status = 5 then v.totalvenda else 0 end )     ' +
        '   as venda_liquido_cancel'
      
        '  , ( case when v.status = 5 then v.totalcusto else 0 end )     ' +
        '   as venda_custo_cancel'
      
        '  , ( case when v.status = 5 then v.totalvenda * coalesce(d.comi' +
        'ssao, 0) / 100 else 0 end )  as venda_comissao_cancel'
      'from TBVENDAS v'
      '  inner join TBCLIENTE c on (c.codigo = v.codcliente)'
      '  inner join TBVENDEDOR d on (d.cod = v.vendedor_cod)'
      ''
      '  left join TBCOMPETENCIA m on (m.cmp_num = v.competencia)'
      '  left join VW_STATUS_VENDA s on (s.codigo = v.status)'
      ''
      '/*'
      'where v.codemp = '#39'17429064000105'#39
      '  and v.status > 1 -- 1. Em andamento'
      ''
      'order by'
      '    c.nome'
      '  , c.cnpj'
      '  , v.competencia'
      '  , v.dtvenda'
      '*/')
    Left = 40
    Top = 160
  end
  object DspRelacaoVendaClienteAnalitico: TDataSetProvider
    DataSet = QryRelacaoVendaClienteAnalitico
    Left = 72
    Top = 160
  end
  object CdsRelacaoVendaClienteAnalitico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoVendaClienteAnalitico'
    Left = 104
    Top = 160
  end
  object FrdsRelacaoVendaClienteAnalitico: TfrxDBDataset
    UserName = 'FrdsRelacaoVendaClienteAnalitico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COMPETENCIA=COMPETENCIA'
      'COMPETENCIA_DESC=COMPETENCIA_DESC'
      'VENDEDOR_COD=VENDEDOR_COD'
      'VENDEDOR_NOME=VENDEDOR_NOME'
      'VENDEDOR_CPF=VENDEDOR_CPF'
      'COMISSAO=COMISSAO'
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'DTVENDA=DTVENDA'
      'NFE=NFE'
      'SERIE=SERIE'
      'STATUS=STATUS'
      'CLIENTE_COD=CLIENTE_COD'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_PF=CLIENTE_PF'
      'VENDA_BRUTA=VENDA_BRUTA'
      'VENDA_DESCONTOS=VENDA_DESCONTOS'
      'VENDA_LIQUIDO=VENDA_LIQUIDO'
      'VENDA_CUSTO=VENDA_CUSTO'
      'VENDA_COMISSAO=VENDA_COMISSAO'
      'VENDA_BRUTA_CANCEL=VENDA_BRUTA_CANCEL'
      'VENDA_DESCONTOS_CANCEL=VENDA_DESCONTOS_CANCEL'
      'VENDA_LIQUIDO_CANCEL=VENDA_LIQUIDO_CANCEL'
      'VENDA_CUSTO_CANCEL=VENDA_CUSTO_CANCEL'
      'VENDA_COMISSAO_CANCEL=VENDA_COMISSAO_CANCEL')
    DataSet = CdsRelacaoVendaClienteAnalitico
    BCDToCurrency = True
    Left = 136
    Top = 160
  end
  object frRelacaoVendaClienteComparativo: TfrxReport
    Version = '5.1.9'
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
    Top = 208
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoVendaClienteSintetico
        DataSetName = 'FrdsRelacaoVendaClienteSintetico'
      end
      item
        DataSet = FrdsVendaCompetencia
        DataSetName = 'FrdsVendaCompetencia'
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
        Name = 'ValorComissao'
        Value = 
          '(<FrdsVendaCompetencia."VENDA_COMISSAO">-<FrdsVendaCompetencia."' +
          'VENDA_COMISSAO_CANCEL">)'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object PageMapa: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Height = 154.960730000000000000
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
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
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
          Memo.UTF8W = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o das vendas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 812.598950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 468.661720000000000000
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
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Height = 112.000000000000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoVendaClienteSintetico
        DataSetName = 'FrdsRelacaoVendaClienteSintetico'
        RowCount = 0
        object DBCross1: TfrxDBCrossView
          Width = 374.000000000000000000
          Height = 112.000000000000000000
          DownThenAcross = False
          PlainCells = True
          RowLevels = 2
          ShowTitle = False
          CellFields.Strings = (
            'VENDA_LIQUIDO')
          ColumnFields.Strings = (
            'COMPETENCIA')
          DataSet = FrdsRelacaoVendaClienteSintetico
          DataSetName = 'FrdsRelacaoVendaClienteSintetico'
          RowFields.Strings = (
            'CLIENTE_NOME'
            'CLIENTE_CPF_CNPJ')
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
            6C6C6D656D6F733E3C546672784D656D6F56696577204C6566743D2232313922
            20546F703D223237322C3333303836222057696474683D223935222048656967
            68743D22313822205265737472696374696F6E733D2232342220416C6C6F7745
            787072657373696F6E733D2246616C73652220446973706C6179466F726D6174
            2E466F726D61745374723D2225322E326E2220446973706C6179466F726D6174
            2E4B696E643D22666B4E756D657269632220466F6E742E436861727365743D22
            312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D
            31312220466F6E742E4E616D653D225461686F6D612220466F6E742E5374796C
            653D223022204672616D652E5479703D22313522204672616D652E5769647468
            3D22302C312220476170583D22332220476170593D2233222048416C69676E3D
            22686152696768742220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D22302C3030222F3E3C546672
            784D656D6F56696577204C6566743D223231392220546F703D223239302C3333
            303836222057696474683D22393522204865696768743D223138222052657374
            72696374696F6E733D2232342220416C6C6F7745787072657373696F6E733D22
            46616C73652220446973706C6179466F726D61742E466F726D61745374723D22
            25322E326E2220446973706C6179466F726D61742E4B696E643D22666B4E756D
            657269632220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D2231363731313638302220466F6E742E4865696768743D222D3131222046
            6F6E742E4E616D653D225461686F6D612220466F6E742E5374796C653D223122
            204672616D652E5479703D22313522204672616D652E57696474683D22302C31
            222046696C6C2E4261636B436F6C6F723D222D31363737373230312220476170
            583D22332220476170593D2233222048416C69676E3D22686152696768742220
            506172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E
            7465722220546578743D22302C3030222F3E3C546672784D656D6F5669657720
            4C6566743D223231392220546F703D223330382C333330383622205769647468
            3D22393522204865696768743D22313822205265737472696374696F6E733D22
            32342220416C6C6F7745787072657373696F6E733D2246616C73652220446973
            706C6179466F726D61742E466F726D61745374723D2225322E326E2220446973
            706C6179466F726D61742E4B696E643D22666B4E756D657269632220466F6E74
            2E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E74
            2E4865696768743D222D31312220466F6E742E4E616D653D225461686F6D6122
            20466F6E742E5374796C653D223122204672616D652E5479703D223135222046
            72616D652E57696474683D22302C31222046696C6C2E4261636B436F6C6F723D
            2231343231313238382220476170583D22332220476170593D2233222048416C
            69676E3D22686152696768742220506172656E74466F6E743D2246616C736522
            2056416C69676E3D22766143656E7465722220546578743D22302C3030222F3E
            3C546672784D656D6F56696577204C6566743D223331342220546F703D223237
            322C3333303836222057696474683D22343022204865696768743D2231382220
            5265737472696374696F6E733D2232342220416C6C6F7745787072657373696F
            6E733D2246616C73652220446973706C6179466F726D61742E466F726D617453
            74723D2225322E326E2220446973706C6179466F726D61742E4B696E643D2266
            6B4E756D657269632220466F6E742E436861727365743D22312220466F6E742E
            436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E74
            2E4E616D653D225461686F6D612220466F6E742E5374796C653D223122204672
            616D652E5479703D22313522204672616D652E57696474683D22302C31222046
            696C6C2E4261636B436F6C6F723D2231343231313238382220476170583D2233
            2220476170593D2233222048416C69676E3D2268615269676874222050617265
            6E74466F6E743D2246616C7365222056416C69676E3D22766143656E74657222
            20546578743D22302C3030222F3E3C546672784D656D6F56696577204C656674
            3D223331342220546F703D223239302C3333303836222057696474683D223430
            22204865696768743D22313822205265737472696374696F6E733D2232342220
            416C6C6F7745787072657373696F6E733D2246616C73652220446973706C6179
            466F726D61742E466F726D61745374723D2225322E326E2220446973706C6179
            466F726D61742E4B696E643D22666B4E756D657269632220466F6E742E436861
            727365743D22312220466F6E742E436F6C6F723D223136373131363830222046
            6F6E742E4865696768743D222D31312220466F6E742E4E616D653D225461686F
            6D612220466F6E742E5374796C653D223122204672616D652E5479703D223135
            22204672616D652E57696474683D22302C31222046696C6C2E4261636B436F6C
            6F723D222D31363737373230312220476170583D22332220476170593D223322
            2048416C69676E3D22686152696768742220506172656E74466F6E743D224661
            6C7365222056416C69676E3D22766143656E7465722220546578743D22302C30
            30222F3E3C546672784D656D6F56696577204C6566743D223331342220546F70
            3D223330382C3333303836222057696474683D22343022204865696768743D22
            313822205265737472696374696F6E733D2232342220416C6C6F774578707265
            7373696F6E733D2246616C73652220446973706C6179466F726D61742E466F72
            6D61745374723D2225322E326E2220446973706C6179466F726D61742E4B696E
            643D22666B4E756D657269632220466F6E742E436861727365743D2231222046
            6F6E742E436F6C6F723D2231363731313638302220466F6E742E486569676874
            3D222D31312220466F6E742E4E616D653D225461686F6D612220466F6E742E53
            74796C653D223122204672616D652E5479703D22313522204672616D652E5769
            6474683D22302C31222046696C6C2E4261636B436F6C6F723D22313432313132
            38382220476170583D22332220476170593D2233222048416C69676E3D226861
            52696768742220506172656E74466F6E743D2246616C7365222056416C69676E
            3D22766143656E7465722220546578743D22302C3030222F3E3C2F63656C6C6D
            656D6F733E3C63656C6C6865616465726D656D6F733E3C546672784D656D6F56
            696577204C6566743D2239322220546F703D223138222057696474683D223837
            22204865696768743D22313822205265737472696374696F6E733D2238222041
            6C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E436861
            727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E486569
            6768743D222D31312220466F6E742E4E616D653D225461686F6D612220466F6E
            742E5374796C653D223022204672616D652E5479703D22313522204672616D65
            2E57696474683D22302C31222046696C6C2E4261636B436F6C6F723D222D3136
            3737373230312220476170583D22332220476170593D22332220506172656E74
            466F6E743D2246616C7365222056416C69676E3D22766143656E746572222054
            6578743D2256454E44415F4C49515549444F222F3E3C546672784D656D6F5669
            6577204C6566743D223137392220546F703D223138222057696474683D223134
            3822204865696768743D22313822205265737472696374696F6E733D22382220
            416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E4368
            61727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865
            696768743D222D31312220466F6E742E4E616D653D225461686F6D612220466F
            6E742E5374796C653D223022204672616D652E5479703D22313522204672616D
            652E57696474683D22302C31222046696C6C2E4261636B436F6C6F723D222D31
            363737373230312220476170583D22332220476170593D22332220506172656E
            74466F6E743D2246616C7365222056416C69676E3D22766143656E7465722220
            546578743D2256454E44415F4C49515549444F222F3E3C546672784D656D6F56
            696577204C6566743D223332372220546F703D223138222057696474683D2238
            3722204865696768743D22313822205265737472696374696F6E733D22382220
            416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E4368
            61727365743D22312220466F6E742E436F6C6F723D2231363731313638302220
            466F6E742E4865696768743D222D31312220466F6E742E4E616D653D22546168
            6F6D612220466F6E742E5374796C653D223022204672616D652E5479703D2231
            3522204672616D652E57696474683D22302C31222046696C6C2E4261636B436F
            6C6F723D222D31363737373230312220476170583D22332220476170593D2233
            2220506172656E74466F6E743D2246616C7365222056416C69676E3D22766143
            656E7465722220546578743D2256454E44415F4C49515549444F222F3E3C2F63
            656C6C6865616465726D656D6F733E3C636F6C756D6E6D656D6F733E3C546672
            784D656D6F56696577204C6566743D223231392220546F703D223235342C3333
            303836222057696474683D22393522204865696768743D223138222052657374
            72696374696F6E733D2232342220416C6C6F7745787072657373696F6E733D22
            46616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C
            6F723D22302220466F6E742E4865696768743D222D31312220466F6E742E4E61
            6D653D225461686F6D612220466F6E742E5374796C653D223122204672616D65
            2E5479703D22313522204672616D652E57696474683D22302C31222046696C6C
            2E4261636B436F6C6F723D2231343231313238382220476170583D2233222047
            6170593D2233222048416C69676E3D22686143656E7465722220506172656E74
            466F6E743D2246616C7365222056416C69676E3D22766143656E746572222054
            6578743D22222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F74
            616C6D656D6F733E3C546672784D656D6F56696577204C6566743D2233313422
            20546F703D223235342C3333303836222057696474683D223430222048656967
            68743D22313822205265737472696374696F6E733D22382220416C6C6F774578
            7072657373696F6E733D2246616C73652220466F6E742E436861727365743D22
            312220466F6E742E436F6C6F723D2231363731313638302220466F6E742E4865
            696768743D222D31312220466F6E742E4E616D653D225461686F6D612220466F
            6E742E5374796C653D223122204672616D652E5479703D22313522204672616D
            652E57696474683D22302C31222046696C6C2E4261636B436F6C6F723D223134
            3231313238382220476170583D22332220476170593D2233222048416C69676E
            3D22686143656E7465722220506172656E74466F6E743D2246616C7365222056
            416C69676E3D22766143656E7465722220546578743D22544F54414C222F3E3C
            2F636F6C756D6E746F74616C6D656D6F733E3C636F726E65726D656D6F733E3C
            546672784D656D6F56696577204C6566743D2232302220546F703D223235342C
            3333303836222057696474683D2231393922204865696768743D223022205265
            737472696374696F6E733D2238222056697369626C653D2246616C7365222041
            6C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E436861
            727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E486569
            6768743D222D31312220466F6E742E4E616D653D225461686F6D612220466F6E
            742E5374796C653D223022204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D22686143656E746572222050
            6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
            65722220546578743D2256454E44415F4C49515549444F222F3E3C546672784D
            656D6F56696577204C6566743D223231392220546F703D223235342C33333038
            36222057696474683D2231333522204865696768743D22302220526573747269
            6374696F6E733D2238222056697369626C653D2246616C73652220416C6C6F77
            45787072657373696F6E733D2246616C73652220466F6E742E43686172736574
            3D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D
            222D31312220466F6E742E4E616D653D225461686F6D612220466F6E742E5374
            796C653D223022204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E7465722220506172656E
            74466F6E743D2246616C7365222056416C69676E3D22766143656E7465722220
            546578743D22434F4D504554454E434941222F3E3C546672784D656D6F566965
            77204C6566743D223133362220546F703D223232222057696474683D22313331
            22204865696768743D22323222205265737472696374696F6E733D2238222056
            697369626C653D2246616C73652220416C6C6F7745787072657373696F6E733D
            2246616C736522204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E746572222056416C6967
            6E3D22766143656E7465722220546578743D22222F3E3C546672784D656D6F56
            696577204C6566743D2232302220546F703D223235342C333330383622205769
            6474683D22393022204865696768743D22313822205265737472696374696F6E
            733D22382220416C6C6F7745787072657373696F6E733D2246616C7365222046
            6F6E742E436861727365743D22312220466F6E742E436F6C6F723D2230222046
            6F6E742E4865696768743D222D31312220466F6E742E4E616D653D225461686F
            6D612220466F6E742E5374796C653D223122204672616D652E5479703D223135
            22204672616D652E57696474683D22302C31222046696C6C2E4261636B436F6C
            6F723D2231343231313238382220476170583D22332220476170593D22332220
            48416C69676E3D22686143656E7465722220506172656E74466F6E743D224661
            6C7365222056416C69676E3D22766143656E7465722220546578743D22436C69
            656E7465222F3E3C546672784D656D6F56696577204C6566743D223131302220
            546F703D223235342C3333303836222057696474683D22313039222048656967
            68743D22313822205265737472696374696F6E733D22382220416C6C6F774578
            7072657373696F6E733D2246616C73652220466F6E742E436861727365743D22
            312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D
            31312220466F6E742E4E616D653D225461686F6D612220466F6E742E5374796C
            653D223122204672616D652E5479703D22313522204672616D652E5769647468
            3D22302C31222046696C6C2E4261636B436F6C6F723D22313432313132383822
            20476170583D22332220476170593D2233222048416C69676E3D22686143656E
            7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D22
            766143656E7465722220546578743D224350462F434E504A222F3E3C2F636F72
            6E65726D656D6F733E3C726F776D656D6F733E3C546672784D656D6F56696577
            204C6566743D2232302220546F703D223237322C333330383622205769647468
            3D22393022204865696768743D22333622205265737472696374696F6E733D22
            32342220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E
            742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E
            742E4865696768743D222D31312220466F6E742E4E616D653D225461686F6D61
            2220466F6E742E5374796C653D223022204672616D652E5479703D2231352220
            4672616D652E57696474683D22302C312220476170583D22332220476170593D
            22332220506172656E74466F6E743D2246616C7365222056416C69676E3D2276
            6143656E7465722220546578743D22222F3E3C546672784D656D6F5669657720
            4C6566743D223131302220546F703D223237322C333330383622205769647468
            3D2231303922204865696768743D22313822205265737472696374696F6E733D
            2232342220416C6C6F7745787072657373696F6E733D2246616C73652220466F
            6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F
            6E742E4865696768743D222D31312220466F6E742E4E616D653D225461686F6D
            612220466F6E742E5374796C653D223022204672616D652E5479703D22313522
            204672616D652E57696474683D22302C312220476170583D2233222047617059
            3D2233222048416C69676E3D22686143656E7465722220506172656E74466F6E
            743D2246616C7365222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C2F726F776D656D6F733E3C726F77746F74616C6D656D6F733E3C
            546672784D656D6F56696577204C6566743D2232302220546F703D223330382C
            3333303836222057696474683D2231393922204865696768743D223138222052
            65737472696374696F6E733D22382220416C6C6F7745787072657373696F6E73
            3D2246616C73652220466F6E742E436861727365743D22312220466F6E742E43
            6F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E742E
            4E616D653D225461686F6D612220466F6E742E5374796C653D22312220467261
            6D652E5479703D22313522204672616D652E57696474683D22302C3122204669
            6C6C2E4261636B436F6C6F723D2231343231313238382220476170583D223322
            20476170593D2233222048416C69676E3D22686143656E746572222050617265
            6E74466F6E743D2246616C7365222056416C69676E3D22766143656E74657222
            20546578743D22544F54414C222F3E3C546672784D656D6F56696577204C6566
            743D223131302220546F703D223239302C3333303836222057696474683D2231
            303922204865696768743D22313822205265737472696374696F6E733D223822
            20416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22313637313136383022
            20466F6E742E4865696768743D222D31312220466F6E742E4E616D653D225461
            686F6D612220466F6E742E5374796C653D223122204672616D652E5479703D22
            313522204672616D652E57696474683D22302C31222046696C6C2E4261636B43
            6F6C6F723D222D31363737373230312220476170583D22332220476170593D22
            33222048416C69676E3D22686143656E7465722220506172656E74466F6E743D
            2246616C7365222056416C69676E3D22766143656E7465722220546578743D22
            546F74616C20436C69656E7465222F3E3C2F726F77746F74616C6D656D6F733E
            3C63656C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63656C6C6675
            6E6374696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E3C2F63
            6F6C756D6E736F72743E3C726F77736F72743E3C6974656D20302F3E3C697465
            6D20302F3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
      object BndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 408.189240000000000000
        Width = 1046.929810000000000000
        object SubReport_Competencia: TfrxSubreport
          Top = 18.897650000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Page = frRelacaoVendaClienteComparativo.pgReport_Competencia
        end
      end
    end
    object pgReport_Competencia: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object BndMasterDataC: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 79.370130000000000000
        Width = 718.110700000000000000
        DataSet = FrdsVendaCompetencia
        DataSetName = 'FrdsVendaCompetencia'
        RowCount = 0
        object Memo15: TfrxMemoView
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
          Memo.UTF8W = (
            ' [FrdsVendaCompetencia."COMPETENCIA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Visible = False
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
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<ValorComissao>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 83.149660000000000000
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
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<FrdsVendaCompetencia."VENDA_BRUTA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 181.417440000000000000
          Width = 98.267780000000000000
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
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<FrdsVendaCompetencia."VENDA_DESCONTOS">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 279.685220000000000000
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
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<FrdsVendaCompetencia."VENDA_LIQUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 377.953000000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsVendaCompetencia."VENDA_BRUTA_CANCEL">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 461.102660000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsVendaCompetencia."VENDA_DESCONTOS_CANC' +
              'EL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 544.252320000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsVendaCompetencia."VENDA_LIQUIDO_CANCEL' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndHeaderCompetencia: TfrxHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Width = 83.149660000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            'Compet'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 83.149660000000000000
          Width = 294.803340000000000000
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
            'Totais das Vendas *')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 83.149660000000000000
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
            'Bruto (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 181.417440000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
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
          Left = 279.685220000000000000
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
            'L'#237'quido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 377.953000000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Visible = False
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
            'Totais das Vendas Canceladas *')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
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
            'Comiss'#227'o (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 377.953000000000000000
          Top = 18.897650000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          Visible = False
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
            'Bruto (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 461.102660000000000000
          Top = 18.897650000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          Visible = False
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
        object Memo29: TfrxMemoView
          Left = 544.252320000000000000
          Top = 18.897650000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          Visible = False
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
            'L'#237'quido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 120.944960000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 627.401980000000000000
          Top = -0.000000000000000007
          Width = 90.708720000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM(<ValorComissao>,BndMasterDataC))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = -0.000000000000000007
          Width = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsVendaCompetencia."VENDA_LIQUIDO_CA' +
              'NCEL">,BndMasterDataC))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 461.102660000000000000
          Top = -0.000000000000000007
          Width = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsVendaCompetencia."VENDA_DESCONTOS_' +
              'CANCEL">,BndMasterDataC))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 377.953000000000000000
          Top = -0.000000000000000007
          Width = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsVendaCompetencia."VENDA_BRUTA_CANC' +
              'EL">,BndMasterDataC))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 279.685220000000000000
          Top = -0.000000000000000007
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsVendaCompetencia."VENDA_LIQUIDO">,' +
              'BndMasterDataC))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 181.417440000000000000
          Top = -0.000000000000000007
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsVendaCompetencia."VENDA_DESCONTOS"' +
              '>,BndMasterDataC))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 83.149660000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsVendaCompetencia."VENDA_BRUTA">,Bn' +
              'dMasterDataC))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
    end
  end
  object QryVendaCompetencia: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    v.competencia'
      '  , m.cmp_desc as competencia_desc'
      '  , v.competencia || '#39' - '#39' || m.cmp_desc as competencia_nro_desc'
      '  , sum( v.totalvenda_bruta )  as venda_bruta'
      '  , sum( v.desconto )          as venda_descontos'
      '  , sum( v.totalvenda )        as venda_liquido'
      '  , sum( v.totalcusto )        as venda_custo'
      
        '  , sum( v.totalvenda * coalesce(d.comissao, 0) / 100 )  as vend' +
        'a_comissao'
      ''
      
        '  , sum( case when v.status = 5 then v.totalvenda_bruta else 0 e' +
        'nd )  as venda_bruta_cancel'
      
        '  , sum( case when v.status = 5 then v.desconto else 0 end )    ' +
        '      as venda_descontos_cancel'
      
        '  , sum( case when v.status = 5 then v.totalvenda else 0 end )  ' +
        '      as venda_liquido_cancel'
      
        '  , sum( case when v.status = 5 then v.totalcusto else 0 end )  ' +
        '      as venda_custo_cancel'
      
        '  , sum( case when v.status = 5 then v.totalvenda * coalesce(d.c' +
        'omissao, 0) / 100 else 0 end )  as venda_comissao_cancel'
      'from TBVENDAS v'
      '  left join TBCLIENTE c on (c.cnpj = v.codcli)'
      '  left join TBCOMPETENCIA m on (m.cmp_num = v.competencia)'
      '  left join VW_STATUS_VENDA s on (s.codigo = v.status)'
      '  left join TBVENDEDOR d on (d.cod = v.vendedor_cod)'
      ''
      '/*'
      'where v.codemp = '#39'17429064000105'#39
      '  and v.status > 1 -- 1. Em andamento'
      ''
      'group by'
      '    v.competencia'
      '  , m.cmp_desc'
      ''
      'order by'
      '    v.competencia'
      '*/')
    Left = 304
    Top = 248
  end
  object DspVendaCompetencia: TDataSetProvider
    DataSet = QryVendaCompetencia
    Left = 336
    Top = 248
  end
  object CdsVendaCompetencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspVendaCompetencia'
    Left = 368
    Top = 248
  end
  object FrdsVendaCompetencia: TfrxDBDataset
    UserName = 'FrdsVendaCompetencia'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COMPETENCIA=COMPETENCIA'
      'COMPETENCIA_DESC=COMPETENCIA_DESC'
      'COMPETENCIA_NRO_DESC=COMPETENCIA_NRO_DESC'
      'VENDA_BRUTA=VENDA_BRUTA'
      'VENDA_DESCONTOS=VENDA_DESCONTOS'
      'VENDA_LIQUIDO=VENDA_LIQUIDO'
      'VENDA_CUSTO=VENDA_CUSTO'
      'VENDA_COMISSAO=VENDA_COMISSAO'
      'VENDA_BRUTA_CANCEL=VENDA_BRUTA_CANCEL'
      'VENDA_DESCONTOS_CANCEL=VENDA_DESCONTOS_CANCEL'
      'VENDA_LIQUIDO_CANCEL=VENDA_LIQUIDO_CANCEL'
      'VENDA_CUSTO_CANCEL=VENDA_CUSTO_CANCEL'
      'VENDA_COMISSAO_CANCEL=VENDA_COMISSAO_CANCEL')
    DataSet = CdsVendaCompetencia
    BCDToCurrency = True
    Left = 400
    Top = 248
  end
  object QryEmpresas: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    e.codigo'
      '  , e.rzsoc'
      '  , e.cnpj'
      'from TBEMPRESA e'
      'order by 2')
    Left = 360
    Top = 64
  end
  object DspEmpresas: TDataSetProvider
    DataSet = QryEmpresas
    Left = 392
    Top = 64
  end
  object CdsEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpresas'
    Left = 424
    Top = 64
  end
end
