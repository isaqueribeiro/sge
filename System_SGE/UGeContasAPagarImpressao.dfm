inherited frmGeContasAPagarImpressao: TfrmGeContasAPagarImpressao
  Caption = 'Relat'#243'rios de Contas A Pagar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRelatorio: TPanel
    inherited GrpBxRelatorio: TGroupBox
      inherited edRelatorio: TComboBox
        Items.Strings = (
          'Relat'#243'rio de Contas A Pagar por Vencimento (Sint'#233'tico)'
          'Relat'#243'rio de Contas A Pagar por Vencimento (Anal'#237'tico)'
          'Relat'#243'rio de Contas A Pagar por Emiss'#227'o (Sint'#233'tico)'
          'Relat'#243'rio de Contas A Pagar por Emiss'#227'o (Anal'#237'tico)'
          'Relat'#243'rio de Contas A Pagar por Baixa (Sint'#233'tico)'
          'Relat'#243'rio de Contas A Pagar por Baixa (Anal'#237'tico)'
          'Relat'#243'rio de Contas A Pagar por Tipo de Despesa (Sint'#233'tico)'
          'Relat'#243'rio de Contas A Pagar por Tipo de Despesa (Anal'#237'tico)')
      end
    end
    inherited GrpBxFiltro: TGroupBox
      object lblData: TLabel
        Left = 45
        Top = 27
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo:'
        FocusControl = e1Data
      end
      object lblSituacao: TLabel
        Left = 41
        Top = 52
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        FocusControl = edSituacao
      end
      object lblTipoDespesa: TLabel
        Left = 15
        Top = 76
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Despesa:'
        FocusControl = edTipoDespesa
      end
      object lblFornecedor: TLabel
        Left = 26
        Top = 100
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fornecedor:'
        FocusControl = edFornecedor
      end
      object e1Data: TDateEdit
        Left = 104
        Top = 23
        Width = 100
        Height = 21
        GlyphKind = gkCustom
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
        NumGlyphs = 2
        TabOrder = 0
        Text = '01/01/2012'
      end
      object e2Data: TDateEdit
        Left = 208
        Top = 23
        Width = 104
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        Text = '01/01/2012'
      end
      object edSituacao: TComboBox
        Left = 104
        Top = 48
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = '(Todos)'
        Items.Strings = (
          '(Todos)'
          'Quitados'
          'Pendentes'
          'Cancelados')
      end
      object edTipoDespesa: TComboBox
        Left = 104
        Top = 72
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = '(Todas)'
        Items.Strings = (
          '(Todas)'
          'Baixados'
          'Pendentes'
          'Cancelados')
      end
      object edFornecedor: TComboBox
        Left = 104
        Top = 96
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = '(Todos)'
        Items.Strings = (
          '(Todos)')
      end
    end
  end
  object frRelacaoAPagarVSintetico: TfrxReport
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
        DataSet = FrdsRelacaoAPagarVSintetico
        DataSetName = 'FrdsRelacaoAPagarVSintetico'
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
        Name = 'ValorAPagar'
        Value = 
          '(<FrdsRelacaoAPagarVSintetico."VALORSALDO">-<FrdsRelacaoAPagarVS' +
          'intetico."VALORSALDO_CANCEL">)'
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
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
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
          Width = 604.724800000000000000
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
          Width = 604.724409448818900000
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
          Width = 604.724409448818900000
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
          Width = 604.724409448818900000
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
          Width = 604.724409448818900000
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
            'Site / E-mail: [frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Situa'#195#167#195#163'o das despesas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 257.008040000000000000
          Top = 120.944960000000000000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 589.606680000000000000
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
      object BndGrpHeaderCompetencia: TfrxGroupHeader
        Height = 56.692950000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoAPagarVSintetico."COMPETENCIA_VENCIMENTO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 634.961040000000000000
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
            ' [FrdsRelacaoAPagarVSintetico."COMPETENCIA_VENCIMENTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 83.149660000000000000
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
            ' Compet'#195#170'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
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
            'Vencimentos')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 257.008040000000000000
          Top = 18.897650000000000000
          Width = 461.102660000000000000
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
            'Valores das Despesas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 309.921460000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 514.016080000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
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
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 616.063390000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 83.149660000000000000
          Top = 18.897650000000000000
          Width = 173.858316540000000000
          Height = 37.795300000000000000
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
            ' Forma de Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
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
            'Juros/Multa (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 257.008040000000000000
          Top = 37.795300000000000000
          Width = 52.913346770000000000
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
            'Quant. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoAPagarVSintetico
        DataSetName = 'FrdsRelacaoAPagarVSintetico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<ValorAPagar>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVSintetico."DTV' +
              'ENC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 309.921460000000000000
          Width = 102.047246540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVSintetico."VALORPAG">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 411.968770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVSintetico."VALORMULTA">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 514.016080000000000000
          Width = 102.047246540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVSintetico."VALORPAGTOT">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 83.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVSintetico."FORMA_PAGTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 257.008040000000000000
          Width = 52.913356540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0'#39',<FrdsRelacaoAPagarVSintetico."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCompetencia: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 514.016080000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVSintetico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 411.968770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVSintetico."VALORMULT' +
              'A">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 309.921460000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVSintetico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 257.008040000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0'#39',SUM(<FrdsRelacaoAPagarVSintetico."QUANTIDADE">' +
              ',BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 124.724490000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' * Os valores totais apresentados est'#195#163'o de acordo com o per'#195#173'od' +
              'o e a situa'#195#167#195#163'o das despesas informadas')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 45.354360000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVSintetico."VALORPAG' +
              '">-<FrdsRelacaoAPagarVSintetico."VALORPAG_CANCEL">),BndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 464.882190000000000000
          Top = 45.354360000000000000
          Width = 79.370066540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
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
            'Juros/Multa:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 464.882190000000000000
          Top = 83.149660000000000000
          Width = 79.370066540000000000
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
            'Pago: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 64.252010000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVSintetico."VALORMUL' +
              'TA">-<FrdsRelacaoAPagarVSintetico."VALORMULTA_CANCEL">),BndMaste' +
              'rData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 83.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVSintetico."VALORPAG' +
              'TOT">-<FrdsRelacaoAPagarVSintetico."VALORPAGTOT_CANCEL">),BndMas' +
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
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 102.047310000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Top = 18.897650000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' ** Valores de despesas canceladas')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
  object QryRelacaoAPagarVSintetico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      
        '    extract(year from cp.dtvenc)  || right('#39'00'#39' || extract(month' +
        ' from cp.dtvenc),  2) as competencia_vencimento'
      '  , cv.cmp_desc as competencia_vencimento_desc'
      '  , cp.dtvenc'
      '  , cp.codtpdesp'
      '  , d.tipodesp'
      '  , cp.situacao'
      '  , fp.descri as forma_pagto'
      ''
      '  --, cp.codforn       as fornecedor_codigo'
      '  --, fn.nomeforn      as fornecedor_nome'
      '  --, fn.cnpj          as fornecedor_cnpj'
      '  --, fn.pessoa_fisica as fornecedor_pf'
      ''
      '  , count( cp.anolanc ) as quantidade'
      '  , sum( coalesce(cp.valorpag, 0)    ) as valorpag'
      '  , sum( coalesce(cp.valormulta, 0)  ) as valormulta'
      '  , sum( coalesce(cp.valorpagtot, 0) ) as valorpagtot'
      '  , sum( coalesce(cp.valorsaldo, 0)  ) as valorsaldo'
      ''
      '  /* Totais Cancelados */'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valorpag, 0)'
      '      else 0'
      '    end ) as valorpag_cancel'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valormulta, 0)'
      '      else 0'
      '    end ) as valormulta_cancel'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valorpagtot, 0)'
      '      else 0'
      '    end ) as valorpagtot_cancel'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valorsaldo, 0)'
      '      else 0'
      '    end ) as valorsaldo_cancel'
      ''
      '  , sum( coalesce(cm.totalnf, 0) )               as nfe_valor'
      
        '  , sum( coalesce(cm.totalnf + cm.desconto, 0) ) as totalcompra_' +
        'bruta'
      '  , sum( coalesce(cm.totalnf, 0) )               as totalcompra'
      'from TBCONTPAG cp'
      '  left join TBFORNECEDOR fn on (fn.codforn = cp.codforn)'
      
        '  left join TBCOMPRAS cm on (cm.ano = cp.anocompra and cm.codcon' +
        'trol = cp.numcompra)'
      '  left join TBFORMPAGTO fp on (fp.cod = cp.forma_pagto)'
      '  left join TBTPDESPESA d on (d.cod = cp.codtpdesp)'
      
        '  left join TBCOMPETENCIA cv on (cv.cmp_num = extract(year from ' +
        'cp.dtvenc)  || right('#39'00'#39' || extract(month from cp.dtvenc),  2))'
      ''
      '/*'
      'where (cp.empresa = '#39'17429064000105'#39')'
      ''
      'group by'
      
        '    extract(year from cp.dtvenc)  || right('#39'00'#39' || extract(month' +
        ' from cp.dtvenc),  2)'
      '  , cv.cmp_desc'
      '  , cp.dtvenc'
      '  , cp.codtpdesp'
      '  , d.tipodesp'
      '  , cp.situacao'
      '  , fp.descri'
      ''
      '  --, cp.codforn'
      '  --, fn.nomeforn'
      '  --, fn.cnpj'
      '  --, fn.pessoa_fisica'
      ''
      'order by'
      
        '    extract(year from cp.dtvenc)  || right('#39'00'#39' || extract(month' +
        ' from cp.dtvenc),  2)'
      '  , cp.dtvenc'
      '  , d.tipodesp'
      '  --, fn.nomeforn'
      '  --, fn.cnpj'
      '*/')
    Left = 40
    Top = 8
  end
  object DspRelacaoAPagarVSintetico: TDataSetProvider
    DataSet = QryRelacaoAPagarVSintetico
    Left = 72
    Top = 8
  end
  object CdsRelacaoAPagarVSintetico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoAPagarVSintetico'
    Left = 104
    Top = 8
  end
  object FrdsRelacaoAPagarVSintetico: TfrxDBDataset
    UserName = 'FrdsRelacaoAPagarVSintetico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COMPETENCIA_VENCIMENTO=COMPETENCIA_VENCIMENTO'
      'COMPETENCIA_VENCIMENTO_DESC=COMPETENCIA_VENCIMENTO_DESC'
      'DTVENC=DTVENC'
      'CODTPDESP=CODTPDESP'
      'TIPODESP=TIPODESP'
      'SITUACAO=SITUACAO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'QUANTIDADE=QUANTIDADE'
      'VALORPAG=VALORPAG'
      'VALORMULTA=VALORMULTA'
      'VALORPAGTOT=VALORPAGTOT'
      'VALORSALDO=VALORSALDO'
      'VALORPAG_CANCEL=VALORPAG_CANCEL'
      'VALORMULTA_CANCEL=VALORMULTA_CANCEL'
      'VALORPAGTOT_CANCEL=VALORPAGTOT_CANCEL'
      'VALORSALDO_CANCEL=VALORSALDO_CANCEL'
      'NFE_VALOR=NFE_VALOR'
      'TOTALCOMPRA_BRUTA=TOTALCOMPRA_BRUTA'
      'TOTALCOMPRA=TOTALCOMPRA')
    DataSet = CdsRelacaoAPagarVSintetico
    BCDToCurrency = True
    Left = 136
    Top = 8
  end
  object QryRelacaoAPagarVAnalitico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    cp.anolanc'
      '  , cp.numlanc'
      
        '  , cp.anolanc || '#39'/'#39' || right('#39'0000000'#39' || cp.numlanc, 7) as la' +
        'ncamento'
      '  , cp.parcela'
      '  , cp.dtemiss'
      '  , cp.dtvenc'
      '  , cp.dtpag'
      '  , cp.codtpdesp'
      '  , d.tipodesp'
      '  , cp.quitado'
      '  , cp.situacao'
      '  , cp.forma_pagto'
      '  , fp.descri as forma_pagto_desc'
      ''
      
        '  , extract(year from cp.dtemiss) || right('#39'00'#39' || extract(month' +
        ' from cp.dtemiss), 2) as competencia_emissao'
      
        '  , extract(year from cp.dtvenc)  || right('#39'00'#39' || extract(month' +
        ' from cp.dtvenc),  2) as competencia_vencimento'
      
        '  , extract(year from cp.dtpag)   || right('#39'00'#39' || extract(month' +
        ' from cp.dtpag),   2) as competencia_pagamento'
      '  , me.cmp_desc as competencia_emissao_desc'
      '  , mv.cmp_desc as competencia_vencimento_desc'
      '  , mp.cmp_desc as competencia_pagamento_desc'
      ''
      '  , cp.codforn       as fornecedor_codigo'
      '  , fn.nomeforn      as fornecedor_nome'
      '  , fn.cnpj          as fornecedor_cnpj'
      '  , fn.pessoa_fisica as fornecedor_pf'
      ''
      '  , cp.valorpag'
      '  , cp.valormulta'
      '  , cp.valorpagtot'
      '  , cp.valorsaldo'
      ''
      '  /* Totais Cancelados */'
      ''
      '  , Case when cp.situacao = 0'
      '      then cp.valorpag'
      '      else 0'
      '    end as valorpag_cancel'
      ''
      '  , Case when cp.situacao = 0'
      '      then cp.valormulta'
      '      else 0'
      '    end as valormulta_cancel'
      ''
      '  , Case when cp.situacao = 0'
      '      then cp.valorpagtot'
      '      else 0'
      '    end as valorpagtot_cancel'
      ''
      '  , Case when cp.situacao = 0'
      '      then cp.valorsaldo'
      '      else 0'
      '    end as valorsaldo_cancel'
      ''
      
        '  , cp.anocompra || '#39'/'#39' || right('#39'0000000'#39' || cp.numcompra, 7) a' +
        's compra'
      '  , cm.dtent as compra_data'
      
        '  , right('#39'0000000'#39' || cm.nf, 7) || coalesce('#39'-'#39' || trim(cm.nfse' +
        'rie), '#39#39') as NFE'
      '  , cm.nfserie     as nfe_serie'
      '  , cm.nf          as nfe_numero'
      '  , cm.dtemiss     as nfe_emissao'
      '  , cm.totalnf as nfe_valor'
      '  , cm.totalnf + coalesce(cm.desconto, 0.0) as totalcompra_bruta'
      '  , cm.totalnf as totalcompra'
      'from TBCONTPAG cp'
      '  left join TBFORNECEDOR fn on (fn.codforn = cp.codforn)'
      
        '  left join TBCOMPRAS cm on (cm.ano = cp.anocompra and cm.codcon' +
        'trol = cp.numcompra)'
      '  left join TBFORMPAGTO fp on (fp.cod = cp.forma_pagto)'
      '  left join TBTPDESPESA d on (d.cod = cp.codtpdesp)'
      ''
      
        '  left join TBCOMPETENCIA me on (me.cmp_num = extract(year from ' +
        'cp.dtemiss) || right('#39'00'#39' || extract(month from cp.dtemiss), 2))'
      
        '  left join TBCOMPETENCIA mv on (mv.cmp_num = extract(year from ' +
        'cp.dtvenc)  || right('#39'00'#39' || extract(month from cp.dtvenc),  2))'
      
        '  left join TBCOMPETENCIA mp on (mp.cmp_num = extract(year from ' +
        'cp.dtpag)   || right('#39'00'#39' || extract(month from cp.dtpag),   2))'
      ''
      '/*'
      'where (cp.empresa = '#39'17429064000105'#39')'
      ''
      'order by'
      '    fn.nomeforn'
      '  , fn.cnpj'
      '  , cp.codforn'
      
        '  , extract(year from cp.dtemiss) || right('#39'00'#39' || extract(month' +
        ' from cp.dtemiss), 2)'
      '  , cp.dtemiss'
      '  , d.tipodesp'
      '*/')
    Left = 40
    Top = 56
  end
  object DspRelacaoAPagarVAnalitico: TDataSetProvider
    DataSet = QryRelacaoAPagarVAnalitico
    Left = 72
    Top = 56
  end
  object CdsRelacaoAPagarVAnalitico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoAPagarVAnalitico'
    Left = 104
    Top = 56
  end
  object FrdsRelacaoAPagarVAnalitico: TfrxDBDataset
    UserName = 'FrdsRelacaoAPagarVAnalitico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ANOLANC=ANOLANC'
      'NUMLANC=NUMLANC'
      'LANCAMENTO=LANCAMENTO'
      'PARCELA=PARCELA'
      'DTEMISS=DTEMISS'
      'DTVENC=DTVENC'
      'DTPAG=DTPAG'
      'CODTPDESP=CODTPDESP'
      'TIPODESP=TIPODESP'
      'QUITADO=QUITADO'
      'SITUACAO=SITUACAO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'COMPETENCIA_EMISSAO=COMPETENCIA_EMISSAO'
      'COMPETENCIA_VENCIMENTO=COMPETENCIA_VENCIMENTO'
      'COMPETENCIA_PAGAMENTO=COMPETENCIA_PAGAMENTO'
      'COMPETENCIA_EMISSAO_DESC=COMPETENCIA_EMISSAO_DESC'
      'COMPETENCIA_VENCIMENTO_DESC=COMPETENCIA_VENCIMENTO_DESC'
      'COMPETENCIA_PAGAMENTO_DESC=COMPETENCIA_PAGAMENTO_DESC'
      'FORNECEDOR_CODIGO=FORNECEDOR_CODIGO'
      'FORNECEDOR_NOME=FORNECEDOR_NOME'
      'FORNECEDOR_CNPJ=FORNECEDOR_CNPJ'
      'FORNECEDOR_PF=FORNECEDOR_PF'
      'VALORPAG=VALORPAG'
      'VALORMULTA=VALORMULTA'
      'VALORPAGTOT=VALORPAGTOT'
      'VALORSALDO=VALORSALDO'
      'VALORPAG_CANCEL=VALORPAG_CANCEL'
      'VALORMULTA_CANCEL=VALORMULTA_CANCEL'
      'VALORPAGTOT_CANCEL=VALORPAGTOT_CANCEL'
      'VALORSALDO_CANCEL=VALORSALDO_CANCEL'
      'COMPRA=COMPRA'
      'COMPRA_DATA=COMPRA_DATA'
      'NFE=NFE'
      'NFE_SERIE=NFE_SERIE'
      'NFE_NUMERO=NFE_NUMERO'
      'NFE_EMISSAO=NFE_EMISSAO'
      'NFE_VALOR=NFE_VALOR'
      'TOTALCOMPRA_BRUTA=TOTALCOMPRA_BRUTA'
      'TOTALCOMPRA=TOTALCOMPRA')
    DataSet = CdsRelacaoAPagarVAnalitico
    BCDToCurrency = True
    Left = 136
    Top = 56
  end
  object frRelacaoAPagarVAnalitico: TfrxReport
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
    Top = 56
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoAPagarVAnalitico
        DataSetName = 'FrdsRelacaoAPagarVAnalitico'
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
        Name = 'ValorAPagar'
        Value = 
          '(<FrdsRelacaoAPagarVAnalitico."VALORSALDO">-<FrdsRelacaoAPagarVA' +
          'nalitico."VALORSALDO_CANCEL">)'
      end
      item
        Name = 'StatusCompraCancelada'
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
      object BndPageHeader: TfrxPageHeader
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 933.543910000000000000
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
          Width = 604.724409448818900000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 1046.929810000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 604.724409450000000000
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
            'Site / E-mail: [frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Situa'#195#167#195#163'o das despesas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 253.228510000000000000
          Top = 120.944960000000000000
          Width = 793.701300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 646.299630000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Width = 910.866730000000000000
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
          Width = 910.866730000000000000
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
          Left = 910.866730000000000000
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
      object BndGrpHeaderCompetencia: TfrxGroupHeader
        Height = 22.677165350000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoAPagarVAnalitico."COMPETENCIA_VENCIMENTO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 963.780150000000000000
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
            ' [FrdsRelacaoAPagarVAnalitico."COMPETENCIA_VENCIMENTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 83.149660000000000000
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
            ' Compet'#195#170'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoAPagarVAnalitico
        DataSetName = 'FrdsRelacaoAPagarVAnalitico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<ValorAPagar>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 748.346940000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVAnalitico."VALORPAG">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 846.614720000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVAnalitico."VALORPAGTOT">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 370.393940000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 453.543600000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [IIF(<FrdsRelacaoAPagarVAnalitico."COMPRA_DATA">=0,'#39#39',FormatDat' +
              'eTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."COMPRA_DATA">)' +
              ')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 536.693260000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."NFE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."LANCAMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 83.149660000000000000
          Width = 37.795236540000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FrdsRelacaoAPagarVAnalitico."PARCELA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 120.944960000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTE' +
              'MISS">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 204.094620000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTV' +
              'ENC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 287.244280000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [IIF(<FrdsRelacaoAPagarVAnalitico."DTPAG">=0,'#39#39',FormatDateTime(' +
              #39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTPAG">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 619.842920000000000000
          Width = 128.503956540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCompetencia: TfrxGroupFooter
        Height = 22.677165350000000000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 846.614720000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 748.346940000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 370.393940000000000000
          Width = 377.952936540000000000
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
            '[FrdsRelacaoAPagarVAnalitico."COMPETENCIA_VENCIMENTO_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 94.488250000000000000
        Top = 529.134200000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' * Despesa(s) Cancelada(s).')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORPAG' +
              '">-<FrdsRelacaoAPagarVAnalitico."VALORPAG_CANCEL">),BndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 793.701300000000000000
          Top = 18.897650000000000000
          Width = 79.370066540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Bruto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 793.701300000000000000
          Width = 253.228446540000000000
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
            'Juros/Multa: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 793.701300000000000000
          Top = 56.692950000000000000
          Width = 79.370066540000000000
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
            'Pago: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 37.795300000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORMUL' +
              'TA">-<FrdsRelacaoAPagarVAnalitico."VALORMULTA_CANCEL">),BndMaste' +
              'rData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 56.692950000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORPAG' +
              'TOT">-<FrdsRelacaoAPagarVAnalitico."VALORPAGTOT_CANCEL">),BndMas' +
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
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 75.590600000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Top = 18.897650000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' * O TOTAL GERAL do relat'#195#179'rio leva em considera'#195#167#195#163'o apenas as ' +
              'despesas n'#195#163'o canceladas.')
          ParentFont = False
        end
      end
      object BndGrpHeaderFornecedor: TfrxGroupHeader
        Height = 56.692950000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoAPagarVAnalitico."FORNECEDOR_CODIGO"'
        ReprintOnNewPage = True
        object Memo8: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897637800000000000
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
            ' Fornecedor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 619.842920000000000000
          Top = 18.897650000000000000
          Width = 427.086890000000000000
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
            'Valores da Despesa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 748.346940000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 846.614720000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
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
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 944.882500000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 83.149660000000000000
          Width = 763.465060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."FORNECEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 370.393940000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' No. Compra')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 453.543600000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Data')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 536.693260000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' NF-e')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 370.393940000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
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
            'Dados da Compra')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' No. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 18.897650000000000000
          Width = 370.393940000000000000
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
            'Dados do Lan'#195#167'amento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 83.149660000000000000
          Top = 37.795300000000000000
          Width = 37.795236540000000000
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
            ' Parc.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 120.944960000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Emiss'#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 204.094620000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Vencimento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 287.244280000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Quitado em')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 619.842920000000000000
          Top = 37.795300000000000000
          Width = 128.503956540000000000
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
            ' Forma de Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 846.614720000000000000
          Width = 200.315090000000000000
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
            
              '  [IIF(<FrdsRelacaoAPagarVAnalitico."FORNECEDOR_PF">=1,FormatMas' +
              'kText('#39'###.###.###-##;0;'#39',<FrdsRelacaoAPagarVAnalitico."FORNECED' +
              'OR_CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoAP' +
              'agarVAnalitico."FORNECEDOR_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterFornecedor: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 846.614720000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo12: TfrxSysMemoView
          Left = 748.346940000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 370.393940000000000000
          Width = 377.952936540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
            '[FrdsRelacaoAPagarVAnalitico."FORNECEDOR_NOME"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object QryTipoDespesa: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    t.cod'
      '  , t.tipodesp'
      'from TBTPDESPESA t'
      'order by'
      '    t.tipodesp')
    Left = 424
    Top = 8
  end
  object DspTipoDespesa: TDataSetProvider
    DataSet = QryTipoDespesa
    Left = 456
    Top = 8
  end
  object CdsTipoDespesa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTipoDespesa'
    Left = 488
    Top = 8
  end
  object QryFornecedor: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    f.codforn'
      '  , f.nomeforn'
      '  , f.pessoa_fisica'
      '  , f.cnpj'
      'from TBFORNECEDOR f'
      ''
      'order by'
      '    f.nomeforn')
    Left = 424
    Top = 40
  end
  object DspFornecedor: TDataSetProvider
    DataSet = QryFornecedor
    Left = 456
    Top = 40
  end
  object CdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFornecedor'
    Left = 488
    Top = 40
  end
  object frRelacaoAPagarESintetico: TfrxReport
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
    Top = 104
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoAPagarESintetico
        DataSetName = 'FrdsRelacaoAPagarESintetico'
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
        Name = 'ValorAPagar'
        Value = 
          '(<FrdsRelacaoAPagarESintetico."VALORSALDO">-<FrdsRelacaoAPagarES' +
          'intetico."VALORSALDO_CANCEL">)'
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
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
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
          Width = 604.724409448818900000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
            'Site / E-mail: [frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 257.008040000000000000
          Top = 120.944960000000000000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Situa'#195#167#195#163'o das despesas:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 589.606680000000000000
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
      object BndGrpHeaderCompetencia: TfrxGroupHeader
        Height = 56.692950000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoAPagarESintetico."COMPETENCIA_EMISSAO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 634.961040000000000000
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
            ' [FrdsRelacaoAPagarESintetico."COMPETENCIA_EMISSAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 83.149660000000000000
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
            ' Compet'#195#170'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
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
            'Emiss'#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 257.008040000000000000
          Top = 18.897650000000000000
          Width = 461.102660000000000000
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
            'Valores das Despesas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 309.921460000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 514.016080000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
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
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 616.063390000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 83.149660000000000000
          Top = 18.897650000000000000
          Width = 173.858316540000000000
          Height = 37.795300000000000000
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
            ' Forma de Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
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
            'Juros/Multa (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 257.008040000000000000
          Top = 37.795300000000000000
          Width = 52.913346770000000000
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
            'Quant. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoAPagarESintetico
        DataSetName = 'FrdsRelacaoAPagarESintetico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarESintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<ValorAPagar>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarESintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarESintetico."DTE' +
              'MISS">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 309.921460000000000000
          Width = 102.047246540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarESintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarESintetico."VALORPAG">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 411.968770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarESintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarESintetico."VALORMULTA">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 514.016080000000000000
          Width = 102.047246540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarESintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarESintetico."VALORPAGTOT">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 83.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarESintetico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarESintetico."FORMA_PAGTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 257.008040000000000000
          Width = 52.913356540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarESintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0'#39',<FrdsRelacaoAPagarESintetico."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCompetencia: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 514.016080000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarESintetico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 411.968770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarESintetico."VALORMULT' +
              'A">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 309.921460000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarESintetico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 257.008040000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0'#39',SUM(<FrdsRelacaoAPagarESintetico."QUANTIDADE">' +
              ',BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 124.724490000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' * Os valores totais apresentados est'#195#163'o de acordo com o per'#195#173'od' +
              'o e a situa'#195#167#195#163'o das despesas informadas')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 45.354360000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarESintetico."VALORPAG' +
              '">-<FrdsRelacaoAPagarESintetico."VALORPAG_CANCEL">),BndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 464.882190000000000000
          Top = 45.354360000000000000
          Width = 79.370066540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
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
            'Juros/Multa:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 464.882190000000000000
          Top = 83.149660000000000000
          Width = 79.370066540000000000
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
            'Pago: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 64.252010000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarESintetico."VALORMUL' +
              'TA">-<FrdsRelacaoAPagarESintetico."VALORMULTA_CANCEL">),BndMaste' +
              'rData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 83.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarESintetico."VALORPAG' +
              'TOT">-<FrdsRelacaoAPagarESintetico."VALORPAGTOT_CANCEL">),BndMas' +
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
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 102.047310000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Top = 18.897650000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' ** Valores de despesas canceladas')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
  object QryRelacaoAPagarESintetico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      
        '    extract(year from cp.dtemiss) || right('#39'00'#39' || extract(month' +
        ' from cp.dtemiss), 2) as competencia_emissao'
      '  , ce.cmp_desc as competencia_emissao_desc'
      '  , cp.dtemiss'
      '  , cp.codtpdesp'
      '  , d.tipodesp'
      '  , cp.situacao'
      '  , fp.descri as forma_pagto'
      ''
      '  --, cp.codforn       as fornecedor_codigo'
      '  --, fn.nomeforn      as fornecedor_nome'
      '  --, fn.cnpj          as fornecedor_cnpj'
      '  --, fn.pessoa_fisica as fornecedor_pf'
      ''
      '  , count( cp.anolanc ) as quantidade'
      '  , sum( coalesce(cp.valorpag, 0)    ) as valorpag'
      '  , sum( coalesce(cp.valormulta, 0)  ) as valormulta'
      '  , sum( coalesce(cp.valorpagtot, 0) ) as valorpagtot'
      '  , sum( coalesce(cp.valorsaldo, 0)  ) as valorsaldo'
      ''
      '  /* Totais Cancelados */'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valorpag, 0)'
      '      else 0'
      '    end ) as valorpag_cancel'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valormulta, 0)'
      '      else 0'
      '    end ) as valormulta_cancel'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valorpagtot, 0)'
      '      else 0'
      '    end ) as valorpagtot_cancel'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valorsaldo, 0)'
      '      else 0'
      '    end ) as valorsaldo_cancel'
      ''
      '  , sum( coalesce(cm.totalnf, 0) )               as nfe_valor'
      
        '  , sum( coalesce(cm.totalnf + cm.desconto, 0) ) as totalcompra_' +
        'bruta'
      '  , sum( coalesce(cm.totalnf, 0) )               as totalcompra'
      'from TBCONTPAG cp'
      '  left join TBFORNECEDOR fn on (fn.codforn = cp.codforn)'
      
        '  left join TBCOMPRAS cm on (cm.ano = cp.anocompra and cm.codcon' +
        'trol = cp.numcompra)'
      '  left join TBFORMPAGTO fp on (fp.cod = cp.forma_pagto)'
      '  left join TBTPDESPESA d on (d.cod = cp.codtpdesp)'
      
        '  left join TBCOMPETENCIA ce on (ce.cmp_num = extract(year from ' +
        'cp.dtemiss)  || right('#39'00'#39' || extract(month from cp.dtemiss),  2' +
        '))'
      ''
      '/*'
      'where (cp.empresa = '#39'17429064000105'#39')'
      ''
      'group by'
      
        '    extract(year from cp.dtemiss)  || right('#39'00'#39' || extract(mont' +
        'h from cp.dtemiss),  2)'
      '  , ce.cmp_desc'
      '  , cp.dtemiss'
      '  , cp.codtpdesp'
      '  , d.tipodesp'
      '  , cp.situacao'
      '  , fp.descri'
      ''
      '  --, cp.codforn'
      '  --, fn.nomeforn'
      '  --, fn.cnpj'
      '  --, fn.pessoa_fisica'
      ''
      'order by'
      
        '    extract(year from cp.dtemiss)  || right('#39'00'#39' || extract(mont' +
        'h from cp.dtemiss),  2)'
      '  , cp.dtemiss'
      '  , d.tipodesp'
      '  --, fn.nomeforn'
      '  --, fn.cnpj'
      '*/')
    Left = 40
    Top = 104
  end
  object DspRelacaoAPagarESintetico: TDataSetProvider
    DataSet = QryRelacaoAPagarESintetico
    Left = 72
    Top = 104
  end
  object CdsRelacaoAPagarESintetico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoAPagarESintetico'
    Left = 104
    Top = 104
  end
  object FrdsRelacaoAPagarESintetico: TfrxDBDataset
    UserName = 'FrdsRelacaoAPagarESintetico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COMPETENCIA_EMISSAO=COMPETENCIA_EMISSAO'
      'COMPETENCIA_EMISSAO_DESC=COMPETENCIA_EMISSAO_DESC'
      'DTEMISS=DTEMISS'
      'CODTPDESP=CODTPDESP'
      'TIPODESP=TIPODESP'
      'SITUACAO=SITUACAO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'QUANTIDADE=QUANTIDADE'
      'VALORPAG=VALORPAG'
      'VALORMULTA=VALORMULTA'
      'VALORPAGTOT=VALORPAGTOT'
      'VALORSALDO=VALORSALDO'
      'VALORPAG_CANCEL=VALORPAG_CANCEL'
      'VALORMULTA_CANCEL=VALORMULTA_CANCEL'
      'VALORPAGTOT_CANCEL=VALORPAGTOT_CANCEL'
      'VALORSALDO_CANCEL=VALORSALDO_CANCEL'
      'NFE_VALOR=NFE_VALOR'
      'TOTALCOMPRA_BRUTA=TOTALCOMPRA_BRUTA'
      'TOTALCOMPRA=TOTALCOMPRA')
    DataSet = CdsRelacaoAPagarESintetico
    BCDToCurrency = True
    Left = 136
    Top = 104
  end
  object frRelacaoAPagarEAnalitico: TfrxReport
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
    Top = 152
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoAPagarVAnalitico
        DataSetName = 'FrdsRelacaoAPagarVAnalitico'
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
        Name = 'ValorAPagar'
        Value = 
          '(<FrdsRelacaoAPagarVAnalitico."VALORSALDO">-<FrdsRelacaoAPagarVA' +
          'nalitico."VALORSALDO_CANCEL">)'
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
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 933.543910000000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 1046.929810000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 604.724409450000000000
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
            'Site / E-mail: [frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 253.228510000000000000
          Top = 120.944960000000000000
          Width = 793.701300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Situa'#195#167#195#163'o das despesas:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 646.299630000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Width = 910.866730000000000000
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
          Width = 910.866730000000000000
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
          Left = 910.866730000000000000
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
      object BndGrpHeaderCompetencia: TfrxGroupHeader
        Height = 22.677165350000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoAPagarVAnalitico."COMPETENCIA_EMISSAO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 963.780150000000000000
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
            ' [FrdsRelacaoAPagarVAnalitico."COMPETENCIA_EMISSAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 83.149660000000000000
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
            ' Compet'#195#170'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoAPagarVAnalitico
        DataSetName = 'FrdsRelacaoAPagarVAnalitico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<ValorAPagar>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 748.346940000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVAnalitico."VALORPAG">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 846.614720000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVAnalitico."VALORPAGTOT">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 370.393940000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 453.543600000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [IIF(<FrdsRelacaoAPagarVAnalitico."COMPRA_DATA">=0,'#39#39',FormatDat' +
              'eTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."COMPRA_DATA">)' +
              ')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 536.693260000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."NFE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."LANCAMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 83.149660000000000000
          Width = 37.795236540000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FrdsRelacaoAPagarVAnalitico."PARCELA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 120.944960000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTE' +
              'MISS">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 204.094620000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTV' +
              'ENC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 287.244280000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [IIF(<FrdsRelacaoAPagarVAnalitico."DTPAG">=0,'#39#39',FormatDateTime(' +
              #39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTPAG">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 619.842920000000000000
          Width = 128.503956540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCompetencia: TfrxGroupFooter
        Height = 22.677165350000000000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 846.614720000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 748.346940000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 370.393940000000000000
          Width = 377.952936540000000000
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
            '[FrdsRelacaoAPagarVAnalitico."COMPETENCIA_EMISSAO_DESC"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 94.488250000000000000
        Top = 529.134200000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' * Despesa(s) Cancelada(s).')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORPAG' +
              '">-<FrdsRelacaoAPagarVAnalitico."VALORPAG_CANCEL">),BndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 793.701300000000000000
          Top = 18.897650000000000000
          Width = 79.370066540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Bruto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 793.701300000000000000
          Width = 253.228446540000000000
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
            'Juros/Multa: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 793.701300000000000000
          Top = 56.692950000000000000
          Width = 79.370066540000000000
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
            'Pago: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 37.795300000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORMUL' +
              'TA">-<FrdsRelacaoAPagarVAnalitico."VALORMULTA_CANCEL">),BndMaste' +
              'rData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 56.692950000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORPAG' +
              'TOT">-<FrdsRelacaoAPagarVAnalitico."VALORPAGTOT_CANCEL">),BndMas' +
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
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 75.590600000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Top = 18.897650000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' * O TOTAL GERAL do relat'#195#179'rio leva em considera'#195#167#195#163'o apenas as ' +
              'despesas n'#195#163'o canceladas.')
          ParentFont = False
        end
      end
      object BndGrpHeaderFornecedor: TfrxGroupHeader
        Height = 56.692950000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoAPagarVAnalitico."FORNECEDOR_CODIGO"'
        ReprintOnNewPage = True
        object Memo8: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897637800000000000
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
            ' Fornecedor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 619.842920000000000000
          Top = 18.897650000000000000
          Width = 427.086890000000000000
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
            'Valores da Despesa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 748.346940000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 846.614720000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
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
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 944.882500000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 83.149660000000000000
          Width = 763.465060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."FORNECEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 370.393940000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' No. Compra')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 453.543600000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Data')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 536.693260000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' NF-e')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 370.393940000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
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
            'Dados da Compra')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' No. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 18.897650000000000000
          Width = 370.393940000000000000
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
            'Dados do Lan'#195#167'amento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 83.149660000000000000
          Top = 37.795300000000000000
          Width = 37.795236540000000000
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
            ' Parc.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 120.944960000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Emiss'#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 204.094620000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Vencimento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 287.244280000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Quitado em')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 619.842920000000000000
          Top = 37.795300000000000000
          Width = 128.503956540000000000
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
            ' Forma de Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 846.614720000000000000
          Width = 200.315090000000000000
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
            
              '  [IIF(<FrdsRelacaoAPagarVAnalitico."FORNECEDOR_PF">=1,FormatMas' +
              'kText('#39'###.###.###-##;0;'#39',<FrdsRelacaoAPagarVAnalitico."FORNECED' +
              'OR_CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoAP' +
              'agarVAnalitico."FORNECEDOR_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterFornecedor: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 846.614720000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo12: TfrxSysMemoView
          Left = 748.346940000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 370.393940000000000000
          Width = 377.952936540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
            '[FrdsRelacaoAPagarVAnalitico."FORNECEDOR_NOME"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frRelacaoAPagarBSintetico: TfrxReport
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
    Top = 200
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoAPagarBSintetico
        DataSetName = 'FrdsRelacaoAPagarBSintetico'
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
        Name = 'ValorAPagar'
        Value = 
          '(<FrdsRelacaoAPagarBSintetico."VALORSALDO">-<FrdsRelacaoAPagarBS' +
          'intetico."VALORSALDO_CANCEL">)'
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
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
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
          Width = 604.724409448818900000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
            'Site / E-mail: [frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 257.008040000000000000
          Top = 120.944960000000000000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Situa'#195#167#195#163'o das despesas:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 589.606680000000000000
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
      object BndGrpHeaderCompetencia: TfrxGroupHeader
        Height = 56.692950000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoAPagarBSintetico."COMPETENCIA_PAGAMENTO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 634.961040000000000000
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
            ' [FrdsRelacaoAPagarBSintetico."COMPETENCIA_PAGAMENTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 83.149660000000000000
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
            ' Compet'#195#170'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
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
            'Baixas em')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 257.008040000000000000
          Top = 18.897650000000000000
          Width = 461.102660000000000000
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
            'Valores das Despesas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 309.921460000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 514.016080000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
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
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 616.063390000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 83.149660000000000000
          Top = 18.897650000000000000
          Width = 173.858316540000000000
          Height = 37.795300000000000000
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
            ' Forma de Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
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
            'Juros/Multa (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 257.008040000000000000
          Top = 37.795300000000000000
          Width = 52.913346770000000000
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
            'Quant. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoAPagarBSintetico
        DataSetName = 'FrdsRelacaoAPagarBSintetico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarBSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<ValorAPagar>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarBSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [IIF(<FrdsRelacaoAPagarBSintetico."DTPAG">=0,'#39#39',FormatDateTime(' +
              #39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarBSintetico."DTPAG">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 309.921460000000000000
          Width = 102.047246540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarBSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarBSintetico."VALORPAG">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 411.968770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarBSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarBSintetico."VALORMULTA">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 514.016080000000000000
          Width = 102.047246540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarBSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarBSintetico."VALORPAGTOT">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 83.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarBSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarBSintetico."FORMA_PAGTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 257.008040000000000000
          Width = 52.913356540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarBSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0'#39',<FrdsRelacaoAPagarBSintetico."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCompetencia: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 514.016080000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarBSintetico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 411.968770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarBSintetico."VALORMULT' +
              'A">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 309.921460000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarBSintetico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 257.008040000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0'#39',SUM(<FrdsRelacaoAPagarBSintetico."QUANTIDADE">' +
              ',BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 124.724490000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' * Os valores totais apresentados est'#195#163'o de acordo com o per'#195#173'od' +
              'o e a situa'#195#167#195#163'o das despesas informadas')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 45.354360000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarBSintetico."VALORPAG' +
              '">-<FrdsRelacaoAPagarBSintetico."VALORPAG_CANCEL">),BndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 464.882190000000000000
          Top = 45.354360000000000000
          Width = 79.370066540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
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
            'Juros/Multa:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 464.882190000000000000
          Top = 83.149660000000000000
          Width = 79.370066540000000000
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
            'Pago: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 64.252010000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarBSintetico."VALORMUL' +
              'TA">-<FrdsRelacaoAPagarBSintetico."VALORMULTA_CANCEL">),BndMaste' +
              'rData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 83.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarBSintetico."VALORPAG' +
              'TOT">-<FrdsRelacaoAPagarBSintetico."VALORPAGTOT_CANCEL">),BndMas' +
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
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 102.047310000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Top = 18.897650000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' ** Valores de despesas canceladas')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
  object QryRelacaoAPagarBSintetico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      
        '    extract(year from cp.dtpag)  || right('#39'00'#39' || extract(month ' +
        'from cp.dtpag),  2) as competencia_pagamento'
      '  , mp.cmp_desc as competencia_pagamento_desc'
      '  , cp.dtpag'
      '  , cp.codtpdesp'
      '  , d.tipodesp'
      '  , cp.situacao'
      '  , fp.descri as forma_pagto'
      ''
      '  --, cp.codforn       as fornecedor_codigo'
      '  --, fn.nomeforn      as fornecedor_nome'
      '  --, fn.cnpj          as fornecedor_cnpj'
      '  --, fn.pessoa_fisica as fornecedor_pf'
      ''
      '  , count( cp.anolanc ) as quantidade'
      '  , sum( coalesce(cp.valorpag, 0)    ) as valorpag'
      '  , sum( coalesce(cp.valormulta, 0)  ) as valormulta'
      '  , sum( coalesce(cp.valorpagtot, 0) ) as valorpagtot'
      '  , sum( coalesce(cp.valorsaldo, 0)  ) as valorsaldo'
      ''
      '  /* Totais Cancelados */'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valorpag, 0)'
      '      else 0'
      '    end ) as valorpag_cancel'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valormulta, 0)'
      '      else 0'
      '    end ) as valormulta_cancel'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valorpagtot, 0)'
      '      else 0'
      '    end ) as valorpagtot_cancel'
      ''
      '  , sum( Case when cp.situacao = 0'
      '      then coalesce(cp.valorsaldo, 0)'
      '      else 0'
      '    end ) as valorsaldo_cancel'
      ''
      '  , sum( coalesce(cm.totalnf, 0) )               as nfe_valor'
      
        '  , sum( coalesce(cm.totalnf + cm.desconto, 0) ) as totalcompra_' +
        'bruta'
      '  , sum( coalesce(cm.totalnf, 0) )               as totalcompra'
      'from TBCONTPAG cp'
      '  left join TBFORNECEDOR fn on (fn.codforn = cp.codforn)'
      
        '  left join TBCOMPRAS cm on (cm.ano = cp.anocompra and cm.codcon' +
        'trol = cp.numcompra)'
      '  left join TBFORMPAGTO fp on (fp.cod = cp.forma_pagto)'
      '  left join TBTPDESPESA d on (d.cod = cp.codtpdesp)'
      
        '  left join TBCOMPETENCIA mp on (mp.cmp_num = extract(year from ' +
        'cp.dtpag)  || right('#39'00'#39' || extract(month from cp.dtpag),  2))'
      ''
      '/*'
      'where (cp.empresa = '#39'17429064000105'#39')'
      ''
      'group by'
      
        '    extract(year from cp.dtpag)  || right('#39'00'#39' || extract(month ' +
        'from cp.dtpag),  2)'
      '  , mp.cmp_desc'
      '  , cp.dtpag'
      '  , cp.codtpdesp'
      '  , d.tipodesp'
      '  , cp.situacao'
      '  , fp.descri'
      ''
      '  --, cp.codforn'
      '  --, fn.nomeforn'
      '  --, fn.cnpj'
      '  --, fn.pessoa_fisica'
      ''
      'order by'
      
        '    extract(year from cp.dtpag)  || right('#39'00'#39' || extract(month ' +
        'from cp.dtpag),  2)'
      '  , cp.dtpag'
      '  , d.tipodesp'
      '  --, fn.nomeforn'
      '  --, fn.cnpj'
      '*/')
    Left = 40
    Top = 200
  end
  object DspRelacaoAPagarBSintetico: TDataSetProvider
    DataSet = QryRelacaoAPagarBSintetico
    Left = 72
    Top = 200
  end
  object CdsRelacaoAPagarBSintetico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoAPagarBSintetico'
    Left = 104
    Top = 200
  end
  object FrdsRelacaoAPagarBSintetico: TfrxDBDataset
    UserName = 'FrdsRelacaoAPagarBSintetico'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COMPETENCIA_PAGAMENTO=COMPETENCIA_PAGAMENTO'
      'COMPETENCIA_PAGAMENTO_DESC=COMPETENCIA_PAGAMENTO_DESC'
      'DTPAG=DTPAG'
      'CODTPDESP=CODTPDESP'
      'TIPODESP=TIPODESP'
      'SITUACAO=SITUACAO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'QUANTIDADE=QUANTIDADE'
      'VALORPAG=VALORPAG'
      'VALORMULTA=VALORMULTA'
      'VALORPAGTOT=VALORPAGTOT'
      'VALORSALDO=VALORSALDO'
      'VALORPAG_CANCEL=VALORPAG_CANCEL'
      'VALORMULTA_CANCEL=VALORMULTA_CANCEL'
      'VALORPAGTOT_CANCEL=VALORPAGTOT_CANCEL'
      'VALORSALDO_CANCEL=VALORSALDO_CANCEL'
      'NFE_VALOR=NFE_VALOR'
      'TOTALCOMPRA_BRUTA=TOTALCOMPRA_BRUTA'
      'TOTALCOMPRA=TOTALCOMPRA')
    DataSet = CdsRelacaoAPagarBSintetico
    BCDToCurrency = True
    Left = 136
    Top = 200
  end
  object frRelacaoAPagarBAnalitico: TfrxReport
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
    Top = 248
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoAPagarVAnalitico
        DataSetName = 'FrdsRelacaoAPagarVAnalitico'
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
        Name = 'ValorAPagar'
        Value = 
          '(<FrdsRelacaoAPagarVAnalitico."VALORSALDO">-<FrdsRelacaoAPagarVA' +
          'nalitico."VALORSALDO_CANCEL">)'
      end
      item
        Name = 'StatusCompraCancelada'
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
      object BndPageHeader: TfrxPageHeader
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 933.543910000000000000
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
          Width = 604.724409448818900000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 1046.929810000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 604.724409450000000000
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
            'Site / E-mail: [frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 253.228510000000000000
          Top = 120.944960000000000000
          Width = 793.701300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Situa'#195#167#195#163'o das despesas:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 646.299630000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Width = 910.866730000000000000
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
          Width = 910.866730000000000000
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
          Left = 910.866730000000000000
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
      object BndGrpHeaderCompetencia: TfrxGroupHeader
        Height = 22.677165350000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoAPagarVAnalitico."COMPETENCIA_PAGAMENTO"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 963.780150000000000000
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
            ' [FrdsRelacaoAPagarVAnalitico."COMPETENCIA_PAGAMENTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 83.149660000000000000
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
            ' Compet'#195#170'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoAPagarVAnalitico
        DataSetName = 'FrdsRelacaoAPagarVAnalitico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<ValorAPagar>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 748.346940000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVAnalitico."VALORPAG">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 846.614720000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVAnalitico."VALORPAGTOT">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 370.393940000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 453.543600000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [IIF(<FrdsRelacaoAPagarVAnalitico."COMPRA_DATA">=0,'#39#39',FormatDat' +
              'eTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."COMPRA_DATA">)' +
              ')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 536.693260000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."NFE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."LANCAMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 83.149660000000000000
          Width = 37.795236540000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FrdsRelacaoAPagarVAnalitico."PARCELA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 120.944960000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTE' +
              'MISS">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 204.094620000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTV' +
              'ENC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 287.244280000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [IIF(<FrdsRelacaoAPagarVAnalitico."DTPAG">=0,'#39#39',FormatDateTime(' +
              #39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTPAG">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 619.842920000000000000
          Width = 128.503956540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterCompetencia: TfrxGroupFooter
        Height = 22.677165350000000000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 846.614720000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 748.346940000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 370.393940000000000000
          Width = 377.952936540000000000
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
            '[FrdsRelacaoAPagarVAnalitico."COMPETENCIA_PAGAMENTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 94.488250000000000000
        Top = 529.134200000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' * Despesa(s) Cancelada(s).')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORPAG' +
              '">-<FrdsRelacaoAPagarVAnalitico."VALORPAG_CANCEL">),BndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 793.701300000000000000
          Top = 18.897650000000000000
          Width = 79.370066540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Bruto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 793.701300000000000000
          Width = 253.228446540000000000
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
            'Juros/Multa: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 793.701300000000000000
          Top = 56.692950000000000000
          Width = 79.370066540000000000
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
            'Pago: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 37.795300000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORMUL' +
              'TA">-<FrdsRelacaoAPagarVAnalitico."VALORMULTA_CANCEL">),BndMaste' +
              'rData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 56.692950000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORPAG' +
              'TOT">-<FrdsRelacaoAPagarVAnalitico."VALORPAGTOT_CANCEL">),BndMas' +
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
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 75.590600000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Top = 18.897650000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' * O TOTAL GERAL do relat'#195#179'rio leva em considera'#195#167#195#163'o apenas as ' +
              'despesas n'#195#163'o canceladas.')
          ParentFont = False
        end
      end
      object BndGrpHeaderFornecedor: TfrxGroupHeader
        Height = 56.692950000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoAPagarVAnalitico."FORNECEDOR_CODIGO"'
        ReprintOnNewPage = True
        object Memo8: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897637800000000000
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
            ' Fornecedor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 619.842920000000000000
          Top = 18.897650000000000000
          Width = 427.086890000000000000
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
            'Valores da Despesas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 748.346940000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 846.614720000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
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
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 944.882500000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 83.149660000000000000
          Width = 763.465060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."FORNECEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 370.393940000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' No. Compra')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 453.543600000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Data')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 536.693260000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' NF-e')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 370.393940000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
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
            'Dados da Compra')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' No. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 18.897650000000000000
          Width = 370.393940000000000000
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
            'Dados do Lan'#195#167'amento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 83.149660000000000000
          Top = 37.795300000000000000
          Width = 37.795236540000000000
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
            ' Parc.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 120.944960000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Emiss'#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 204.094620000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Vencimento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 287.244280000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Quitado em')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 619.842920000000000000
          Top = 37.795300000000000000
          Width = 128.503956540000000000
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
            ' Forma de Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 846.614720000000000000
          Width = 200.315090000000000000
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
            
              '  [IIF(<FrdsRelacaoAPagarVAnalitico."FORNECEDOR_PF">=1,FormatMas' +
              'kText('#39'###.###.###-##;0;'#39',<FrdsRelacaoAPagarVAnalitico."FORNECED' +
              'OR_CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoAP' +
              'agarVAnalitico."FORNECEDOR_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterFornecedor: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 846.614720000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo12: TfrxSysMemoView
          Left = 748.346940000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 370.393940000000000000
          Width = 377.952936540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
            '[FrdsRelacaoAPagarVAnalitico."FORNECEDOR_NOME"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frRelacaoAPagarTPDespesaSintetico: TfrxReport
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
    Left = 168
    Top = 8
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoAPagarVSintetico
        DataSetName = 'FrdsRelacaoAPagarVSintetico'
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
        Name = 'ValorAPagar'
        Value = 
          '(<FrdsRelacaoAPagarVSintetico."VALORSALDO">-<FrdsRelacaoAPagarVS' +
          'intetico."VALORSALDO_CANCEL">)'
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
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
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
          Width = 604.724800000000000000
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
          Width = 604.724409448818900000
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
          Width = 604.724409448818900000
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
          Width = 604.724409448818900000
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
          Width = 604.724409448818900000
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
            'Site / E-mail: [frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Situa'#195#167#195#163'o das despesas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 257.008040000000000000
          Top = 120.944960000000000000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 589.606680000000000000
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
      object BndGrpHeaderTPDespesa: TfrxGroupHeader
        Height = 56.692950000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoAPagarVSintetico."CODTPDESP"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 634.961040000000000000
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
            ' [FrdsRelacaoAPagarVSintetico."TIPODESP"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 83.149660000000000000
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
            ' Tipo Despesa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
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
            'Vencimentos')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 257.008040000000000000
          Top = 18.897650000000000000
          Width = 461.102660000000000000
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
            'Valores das Despesas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 309.921460000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 514.016080000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
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
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 616.063390000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 83.149660000000000000
          Top = 18.897650000000000000
          Width = 173.858316540000000000
          Height = 37.795300000000000000
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
            ' Forma de Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Top = 37.795300000000000000
          Width = 102.047236770000000000
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
            'Juros/Multa (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 257.008040000000000000
          Top = 37.795300000000000000
          Width = 52.913346770000000000
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
            'Quant. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoAPagarVSintetico
        DataSetName = 'FrdsRelacaoAPagarVSintetico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<ValorAPagar>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVSintetico."DTV' +
              'ENC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 309.921460000000000000
          Width = 102.047246540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVSintetico."VALORPAG">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 411.968770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVSintetico."VALORMULTA">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 514.016080000000000000
          Width = 102.047246540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVSintetico."VALORPAGTOT">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 83.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVSintetico."FORMA_PAGTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 257.008040000000000000
          Width = 52.913356540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVSintetico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0'#39',<FrdsRelacaoAPagarVSintetico."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTPDespesa: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 514.016080000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVSintetico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 411.968770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVSintetico."VALORMULT' +
              'A">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 309.921460000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVSintetico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 257.008040000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0'#39',SUM(<FrdsRelacaoAPagarVSintetico."QUANTIDADE">' +
              ',BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 124.724490000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' * Os valores totais apresentados est'#195#163'o de acordo com o per'#195#173'od' +
              'o e a situa'#195#167#195#163'o das despesas informadas')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 45.354360000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVSintetico."VALORPAG' +
              '">-<FrdsRelacaoAPagarVSintetico."VALORPAG_CANCEL">),BndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 464.882190000000000000
          Top = 45.354360000000000000
          Width = 79.370066540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
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
            'Juros/Multa:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 464.882190000000000000
          Top = 83.149660000000000000
          Width = 79.370066540000000000
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
            'Pago: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 64.252010000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVSintetico."VALORMUL' +
              'TA">-<FrdsRelacaoAPagarVSintetico."VALORMULTA_CANCEL">),BndMaste' +
              'rData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 83.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVSintetico."VALORPAG' +
              'TOT">-<FrdsRelacaoAPagarVSintetico."VALORPAGTOT_CANCEL">),BndMas' +
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
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 544.252320000000000000
          Top = 102.047310000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Top = 18.897650000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' ** Valores de despesas canceladas')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
  object frRelacaoAPagarTPDespesaAnalitico: TfrxReport
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
    Left = 168
    Top = 56
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoAPagarVAnalitico
        DataSetName = 'FrdsRelacaoAPagarVAnalitico'
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
        Name = 'ValorAPagar'
        Value = 
          '(<FrdsRelacaoAPagarVAnalitico."VALORSALDO">-<FrdsRelacaoAPagarVA' +
          'nalitico."VALORSALDO_CANCEL">)'
      end
      item
        Name = 'StatusCompraCancelada'
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
      object BndPageHeader: TfrxPageHeader
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 933.543910000000000000
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
          Width = 604.724409448818900000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 604.724409450000000000
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
          Width = 1046.929810000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 604.724409450000000000
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
            'Site / E-mail: [frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Periodo] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 253.228510000000000000
          Top = 120.944960000000000000
          Width = 793.701300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SubTitulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Situa'#195#167#195#163'o das despesas:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 646.299630000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Width = 910.866730000000000000
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
          Width = 910.866730000000000000
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
          Left = 910.866730000000000000
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
      object BndGrpHeaderTPDespesa: TfrxGroupHeader
        Height = 22.677165350000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoAPagarVAnalitico."CODTPDESP"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 83.149660000000000000
          Width = 963.780150000000000000
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
            ' [FrdsRelacaoAPagarVAnalitico."TIPODESP"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 83.149660000000000000
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
            ' Tipo Despesa')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsRelacaoAPagarVAnalitico
        DataSetName = 'FrdsRelacaoAPagarVAnalitico'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<ValorAPagar>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 748.346940000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVAnalitico."VALORPAG">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 846.614720000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',<FrdsRelacaoAPagarVAnalitico."VALORPAGTOT">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 370.393940000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 453.543600000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [IIF(<FrdsRelacaoAPagarVAnalitico."COMPRA_DATA">=0,'#39#39',FormatDat' +
              'eTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."COMPRA_DATA">)' +
              ')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 536.693260000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."NFE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."LANCAMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 83.149660000000000000
          Width = 37.795236540000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            '[FrdsRelacaoAPagarVAnalitico."PARCELA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 120.944960000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTE' +
              'MISS">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 204.094620000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTV' +
              'ENC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 287.244280000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            
              ' [IIF(<FrdsRelacaoAPagarVAnalitico."DTPAG">=0,'#39#39',FormatDateTime(' +
              #39'dd/mm/yyyy'#39', <FrdsRelacaoAPagarVAnalitico."DTPAG">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 619.842920000000000000
          Width = 128.503956540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Highlight.Condition = '<FrdsRelacaoAPagarVAnalitico."SITUACAO">=0'
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterTPDespesa: TfrxGroupFooter
        Height = 22.677165350000000000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 846.614720000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 748.346940000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 370.393940000000000000
          Width = 377.952936540000000000
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
            '[FrdsRelacaoAPagarVAnalitico."TIPODESP"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 94.488250000000000000
        Top = 529.134200000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' * Despesa(s) Cancelada(s).')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORPAG' +
              '">-<FrdsRelacaoAPagarVAnalitico."VALORPAG_CANCEL">),BndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 793.701300000000000000
          Top = 18.897650000000000000
          Width = 79.370066540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Bruto: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 793.701300000000000000
          Width = 253.228446540000000000
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
            'Juros/Multa: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 793.701300000000000000
          Top = 56.692950000000000000
          Width = 79.370066540000000000
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
            'Pago: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 37.795300000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORMUL' +
              'TA">-<FrdsRelacaoAPagarVAnalitico."VALORMULTA_CANCEL">),BndMaste' +
              'rData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 56.692950000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM((<FrdsRelacaoAPagarVAnalitico."VALORPAG' +
              'TOT">-<FrdsRelacaoAPagarVAnalitico."VALORPAGTOT_CANCEL">),BndMas' +
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
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 873.071430000000000000
          Top = 75.590600000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Top = 18.897650000000000000
          Width = 793.701300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' * O TOTAL GERAL do relat'#195#179'rio leva em considera'#195#167#195#163'o apenas as ' +
              'despesas n'#195#163'o canceladas.')
          ParentFont = False
        end
      end
      object BndGrpHeaderFornecedor: TfrxGroupHeader
        Height = 56.692950000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsRelacaoAPagarVAnalitico."FORNECEDOR_CODIGO"'
        ReprintOnNewPage = True
        object Memo8: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897637800000000000
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
            ' Fornecedor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 619.842920000000000000
          Top = 18.897650000000000000
          Width = 427.086890000000000000
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
            'Valores da Despesa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 748.346940000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 846.614720000000000000
          Top = 37.795300000000000000
          Width = 98.267716540000000000
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
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 944.882500000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 83.149660000000000000
          Width = 763.465060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsRelacaoAPagarVAnalitico."FORNECEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 370.393940000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' No. Despesa')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 453.543600000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Data')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 536.693260000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' NF-e')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 370.393940000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
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
            'Dados da Compra')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' No. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 18.897650000000000000
          Width = 370.393940000000000000
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
            'Dados do Lan'#195#167'amento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 83.149660000000000000
          Top = 37.795300000000000000
          Width = 37.795236540000000000
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
            ' Parc.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 120.944960000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Emiss'#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 204.094620000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Vencimento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 287.244280000000000000
          Top = 37.795300000000000000
          Width = 83.149596540000000000
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
            ' Quitado em')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 619.842920000000000000
          Top = 37.795300000000000000
          Width = 128.503956540000000000
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
            ' Forma de Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 846.614720000000000000
          Width = 200.315090000000000000
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
            
              '  [IIF(<FrdsRelacaoAPagarVAnalitico."FORNECEDOR_PF">=1,FormatMas' +
              'kText('#39'###.###.###-##;0;'#39',<FrdsRelacaoAPagarVAnalitico."FORNECED' +
              'OR_CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoAP' +
              'agarVAnalitico."FORNECEDOR_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterFornecedor: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',SUM(<ValorAPagar>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 846.614720000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAGT' +
              'OT">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo12: TfrxSysMemoView
          Left = 748.346940000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<FrdsRelacaoAPagarVAnalitico."VALORPAG"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 370.393940000000000000
          Width = 377.952936540000000000
          Height = 18.897650000000000000
          ShowHint = False
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
            '[FrdsRelacaoAPagarVAnalitico."FORNECEDOR_NOME"] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
end
