inherited frmGeResultadoExercicioImpressao: TfrmGeResultadoExercicioImpressao
  Caption = 'Resultado Exerc'#237'cio'
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
          'Movimenta'#231#227'o Financeira Mensal (Previsto x Realizado)'
          'Demonstrativo dos Resultados Operacionais')
      end
    end
    inherited GrpBxFiltro: TGroupBox
      object lblEmpresa: TLabel
        Left = 46
        Top = 28
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Empresa:'
        FocusControl = edEmpresa
      end
      object lblContaCorrente: TLabel
        Left = 9
        Top = 54
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'Conta Corrente:'
        FocusControl = edContaCorrente
      end
      object lblData: TLabel
        Left = 52
        Top = 81
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo:'
        FocusControl = e1Data
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
      object edContaCorrente: TComboBox
        Left = 104
        Top = 51
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = '(Todas)'
        Items.Strings = (
          '(Todas)')
      end
      object e1Data: TJvDateEdit
        Left = 104
        Top = 78
        Width = 98
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
      object e2Data: TJvDateEdit
        Left = 208
        Top = 78
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
        TabOrder = 3
      end
    end
  end
  object DspEmpresas: TDataSetProvider
    DataSet = fdQryEmpresas
    Left = 464
    Top = 8
  end
  object CdsEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpresas'
    Left = 496
    Top = 8
  end
  object DspContaCorrente: TDataSetProvider
    DataSet = fdQryContaCorrente
    Left = 464
    Top = 40
  end
  object CdsContaCorrente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end>
    ProviderName = 'DspContaCorrente'
    Left = 496
    Top = 40
  end
  object frDemonstResultOper: TfrxReport
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
      
        '// Declara'#231#227'o de vari'#225'veis geriais                              ' +
        '                                                     '
      'var'
      '  cValorSaldoAnterior,                                   '
      '  cValorEntradas     ,'
      '  cValorSaidas       ,'
      '  cValorSaldoGeral   : Currency;'
      '    '
      
        'procedure BndGrpFooterCompetenciaOnAfterCalcHeight(Sender: TfrxC' +
        'omponent);'
      'begin'
      
        '//  cValorEntradas   := (cValorEntradas + SUM(<FrdsRelacaoSaldoC' +
        'onsolidadoDia."VALOR_ENTRADAS">,BndMasterData));                ' +
        '                      '
      
        '//  cValorSaidas     := (cValorSaidas   + SUM(<FrdsRelacaoSaldoC' +
        'onsolidadoDia."VALOR_SAIDAS">,BndMasterData));        '
      
        '//  cValorSaldoGeral := (cValorSaldoGeral + <FrdsRelacaoSaldoCon' +
        'solidadoDia."VALOR_SALDO">);                              '
      'end;'
      ''
      
        'procedure bndReportSummaryOnAfterCalcHeight(Sender: TfrxComponen' +
        't);'
      'begin'
      
        '//  cValorSaldoAnterior   := (cValorSaldoGeral + cValorSaidas) -' +
        ' cValorEntradas;'
      
        '//  memSaldoAnterior.Text := FormatFloat('#39',0.00" "'#39', cValorSaldo' +
        'Anterior);        '
      
        '//  memTotalSaldo.Text    := FormatFloat('#39',0.00" "'#39', cValorSaldo' +
        'Geral);                                  '
      'end;'
      ''
      'begin'
      
        '  // Inicia'#231#227'o das vari'#225'veis                                    ' +
        '                           '
      
        '  cValorSaldoAnterior := 0.0;                                   ' +
        '   '
      '  cValorEntradas      := 0.0;        '
      '  cValorSaidas        := 0.0;          '
      '  cValorSaldoGeral    := 0.0;               '
      'end.')
    Left = 8
    Top = 72
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsDemonstResultOper
        DataSetName = 'FrdsDemonstResultOper'
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
        Name = 'Tipo'
        Value = 
          'IIF(<FrdsDemonstResultOper."ID_TIPO">=0,'#39#39',FormatFloat('#39'000" - "' +
          #39',<FrdsDemonstResultOper."ID_TIPO">))'
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
      Columns = 1
      ColumnWidth = 190.000000000000000000
      ColumnPositions.Strings = (
        '0')
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
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
          Top = 7.559059999999999000
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
          Top = 7.559059999999999000
          Width = 604.724800000000000000
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
          Width = 604.724409448818900000
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
          Width = 604.724409448818900000
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
          Top = 56.692949999999990000
          Width = 604.724409448818900000
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
          Width = 604.724409450000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
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
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Contas de Movimenta'#231#227'o no Sistema:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
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
          Left = 325.039580000000000000
          Top = 120.944960000000000000
          Width = 393.071120000000000000
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
        Top = 381.732530000000000000
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
          Top = 15.118119999999980000
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
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        DataSet = FrdsDemonstResultOper
        DataSetName = 'FrdsDemonstResultOper'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Lucida Sans Typewriter'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '(<FrdsDemonstResultOper."DESTACAR"> = 1)'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Frame.Typ = [ftLeft, ftTop, ftBottom]
          Highlight.Frame.LeftLine.Width = 0.100000000000000000
          Highlight.Frame.TopLine.Width = 0.100000000000000000
          Highlight.Frame.BottomLine.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FrdsDemonstResultOper."MARCADOR"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 26.456710000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Lucida Sans Typewriter'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '(<FrdsDemonstResultOper."DESTACAR"> = 1)'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Frame.Typ = [ftRight, ftTop, ftBottom]
          Highlight.Frame.TopLine.Width = 0.100000000000000000
          Highlight.Frame.RightLine.Width = 0.100000000000000000
          Highlight.Frame.BottomLine.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[Tipo][FrdsDemonstResultOper."DESCRICAO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 283.464750000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Lucida Sans Typewriter'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '(<FrdsDemonstResultOper."DESTACAR"> = 1)'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.LeftLine.Width = 0.100000000000000000
          Highlight.Frame.TopLine.Width = 0.100000000000000000
          Highlight.Frame.RightLine.Width = 0.100000000000000000
          Highlight.Frame.BottomLine.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdsDemonstResultOper."ESPECIFIC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 521.575140000000100000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Lucida Sans Typewriter'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '(<FrdsDemonstResultOper."DESTACAR"> = 1)'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.LeftLine.Width = 0.100000000000000000
          Highlight.Frame.TopLine.Width = 0.100000000000000000
          Highlight.Frame.RightLine.Width = 0.100000000000000000
          Highlight.Frame.BottomLine.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39', <FrdsDemonstResultOper."VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Lucida Sans Typewriter'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '(<FrdsDemonstResultOper."DESTACAR"> = 1)'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13434879
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.LeftLine.Width = 0.100000000000000000
          Highlight.Frame.TopLine.Width = 0.100000000000000000
          Highlight.Frame.RightLine.Width = 0.100000000000000000
          Highlight.Frame.BottomLine.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39', <FrdsDemonstResultOper."PERCENTUAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeader: TfrxHeader
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo8: TfrxMemoView
          Top = 7.559060000000000000
          Width = 283.464750000000000000
          Height = 37.795300000000000000
          CharSpacing = 2.000000000000000000
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
            'DESCRI'#199#195'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 521.575140000000100000
          Top = 7.559059999999988000
          Width = 196.535486770000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
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
            'Total no Per'#237'odo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 521.575140000000100000
          Top = 26.456710000000020000
          Width = 120.944886770000000000
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
            'R$')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 283.464750000000000000
          Top = 7.559060000000000000
          Width = 238.110390000000000000
          Height = 37.795300000000000000
          CharSpacing = 2.000000000000000000
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
            'Especifica'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 642.520100000000000000
          Top = 26.456710000000020000
          Width = 75.590526770000000000
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
            '%')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object DspDemonstResultOper: TDataSetProvider
    DataSet = fdQryDemonstResultOper
    Left = 72
    Top = 72
  end
  object CdsDemonstResultOper: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA_CORRENTE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_FINAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspDemonstResultOper'
    Left = 104
    Top = 72
  end
  object FrdsDemonstResultOper: TfrxDBDataset
    UserName = 'FrdsDemonstResultOper'
    CloseDataSource = True
    FieldAliases.Strings = (
      'GRUPO=GRUPO'
      'MARCADOR=MARCADOR'
      'DESTACAR=DESTACAR'
      'DESCRICAO=DESCRICAO'
      'ESPECIFIC=ESPECIFIC'
      'TIPO=TIPO'
      'ID_TIPO=ID_TIPO'
      'VALOR=VALOR'
      'PERCENTUAL=PERCENTUAL')
    DataSet = CdsDemonstResultOper
    BCDToCurrency = True
    Left = 136
    Top = 72
  end
  object fdQryDemonstResultOper: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    d.grupo'
      '  , d.marcador'
      '  , d.destacar'
      '  , d.descricao'
      '  , d.especific'
      '  , d.tipo'
      '  , d.id_tipo'
      '  , d.valor'
      '  , d.percentual'
      
        'from GET_DEMONST_RESULT_OPERACIONAL(:empresa, :conta_corrente, :' +
        'data_inicial, :data_final) d')
    Left = 40
    Top = 72
    ParamData = <
      item
        Position = 1
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'CONTA_CORRENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
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
    Left = 432
    Top = 8
  end
  object fdQryContaCorrente: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.codigo'
      '  , c.descricao'
      '  , c.tipo'
      '  , Case c.tipo'
      '      when 1 then '#39'Caixa Diario'#39
      '      when 2 then '#39'Banco'#39
      '    end as tipo_desc'
      '  , c.empresa'
      '  , b.bco_nome'
      '  , b.bco_agencia'
      '  , b.bco_cc'
      'from TBCONTA_CORRENTE c'
      '  left join TBBANCO_BOLETO b on (b.bco_codigo = c.bco_codigo_cc)'
      ''
      'where c.empresa = :empresa'
      ''
      'order by'
      '    c.tipo'
      '  , c.descricao')
    Left = 432
    Top = 40
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object frMovFinanceiroMensal: TfrxReport
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
      
        '// Declara'#231#227'o de vari'#225'veis geriais                              ' +
        '                                                     '
      'var'
      '  cValorSaldoAnterior,                                   '
      '  cValorEntradas     ,'
      '  cValorSaidas       ,'
      '  cValorSaldoGeral   : Currency;'
      '    '
      
        'procedure BndGrpFooterCompetenciaOnAfterCalcHeight(Sender: TfrxC' +
        'omponent);'
      'begin'
      
        '//  cValorEntradas   := (cValorEntradas + SUM(<FrdsRelacaoSaldoC' +
        'onsolidadoDia."VALOR_ENTRADAS">,BndMasterData));                ' +
        '                      '
      
        '//  cValorSaidas     := (cValorSaidas   + SUM(<FrdsRelacaoSaldoC' +
        'onsolidadoDia."VALOR_SAIDAS">,BndMasterData));        '
      
        '//  cValorSaldoGeral := (cValorSaldoGeral + <FrdsRelacaoSaldoCon' +
        'solidadoDia."VALOR_SALDO">);                              '
      'end;'
      ''
      
        'procedure bndReportSummaryOnAfterCalcHeight(Sender: TfrxComponen' +
        't);'
      'begin'
      
        '//  cValorSaldoAnterior   := (cValorSaldoGeral + cValorSaidas) -' +
        ' cValorEntradas;'
      
        '//  memSaldoAnterior.Text := FormatFloat('#39',0.00" "'#39', cValorSaldo' +
        'Anterior);        '
      
        '//  memTotalSaldo.Text    := FormatFloat('#39',0.00" "'#39', cValorSaldo' +
        'Geral);                                  '
      'end;'
      ''
      'begin'
      
        '  // Inicia'#231#227'o das vari'#225'veis                                    ' +
        '                           '
      
        '  cValorSaldoAnterior := 0.0;                                   ' +
        '   '
      '  cValorEntradas      := 0.0;        '
      '  cValorSaidas        := 0.0;          '
      '  cValorSaldoGeral    := 0.0;               '
      'end.')
    Left = 8
    Top = 32
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsMovFinanceiroMensal
        DataSetName = 'FrdsMovFinanceiroMensal'
      end
      item
        DataSet = FrdsSaldoFinanceiroMensal
        DataSetName = 'FrdsSaldoFinanceiroMensal'
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
        Name = 'Tipo'
        Value = 
          'IIF(<FrdsDemonstResultOper."ID_TIPO">=0,'#39#39',FormatFloat('#39'000" - "' +
          #39',<FrdsDemonstResultOper."ID_TIPO">))'
      end
      item
        Name = ' Saldo'
        Value = Null
      end
      item
        Name = 'vlso_total_previsto_1'
        Value = '(<vle_total_previsto_1> - <vls_total_previsto_1>)'
      end
      item
        Name = 'vlso_total_realizado_1'
        Value = '(<vle_total_realizado_1> - <vls_total_realizado_1>)'
      end
      item
        Name = 'vlso_total_previsto_2'
        Value = '(<vle_total_previsto_2> - <vls_total_previsto_2>)'
      end
      item
        Name = 'vlso_total_realizado_2'
        Value = '(<vle_total_realizado_2> - <vls_total_realizado_2>)'
      end
      item
        Name = 'vlso_total_previsto_3'
        Value = '(<vle_total_previsto_3> - <vls_total_previsto_3>)'
      end
      item
        Name = 'vlso_total_previsto_4'
        Value = '(<vle_total_previsto_4> - <vls_total_previsto_4>)'
      end
      item
        Name = 'vlso_total_realizado_3'
        Value = '(<vle_total_realizado_3> - <vls_total_realizado_3>)'
      end
      item
        Name = 'vlso_total_realizado_4'
        Value = '(<vle_total_realizado_4> - <vls_total_realizado_4>)'
      end
      item
        Name = 'vlso_total_previsto'
        Value = '(<vle_total_previsto> - <vls_total_previsto>)'
      end
      item
        Name = 'vlso_total_realizado'
        Value = '(<vle_total_realizado> - <vls_total_realizado>)'
      end
      item
        Name = 'vlsi_total_previsto_1'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL">+<vlso_total_previsto_1' +
          '>)'
      end
      item
        Name = 'vlsi_total_realizado_1'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL">+<vlso_total_realizado_' +
          '1>)'
      end
      item
        Name = 'vlsi_total_previsto_2'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL">+<vlso_total_previsto_1' +
          '>+<vlso_total_previsto_2>)'
      end
      item
        Name = 'vlsi_total_realizado_2'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL">+<vlso_total_realizado_' +
          '1>+<vlso_total_realizado_2>)'
      end
      item
        Name = 'vlsi_total_previsto_3'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL">+<vlso_total_previsto_1' +
          '>+<vlso_total_previsto_2>+<vlso_total_previsto_3>)'
      end
      item
        Name = 'vlsi_total_realizado_3'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL">+<vlso_total_realizado_' +
          '1>+<vlso_total_realizado_2>+<vlso_total_realizado_3>)'
      end
      item
        Name = 'vlsi_total_previsto_4'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL">+<vlso_total_previsto_1' +
          '>+<vlso_total_previsto_2>+<vlso_total_previsto_3>+<vlso_total_pr' +
          'evisto_4>)'
      end
      item
        Name = 'vlsi_total_realizado_4'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL">+<vlso_total_realizado_' +
          '1>+<vlso_total_realizado_2>+<vlso_total_realizado_3>+<vlso_total' +
          '_realizado_4>)'
      end
      item
        Name = 'vlsi_total_previsto'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL"> + (<vle_total_previsto' +
          '> - <vls_total_previsto>))'
      end
      item
        Name = 'vlsi_total_realizado'
        Value = 
          '(<FrdsSaldoFinanceiroMensal."VL_INICIAL"> + (<vle_total_realizad' +
          'o> - <vls_total_realizado>))'
      end
      item
        Name = ' Entradas'
        Value = Null
      end
      item
        Name = 'vle_total_previsto_1'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO_1">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vle_total_realizado_1'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO_1">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vle_total_previsto_2'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO_2">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vle_total_realizado_2'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO_2">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vle_total_previsto_3'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO_3">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vle_total_realizado_3'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO_3">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vle_total_previsto_4'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO_4">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vle_total_realizado_4'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO_4">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vle_total_previsto'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vle_total_realizado'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'C'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO">,0.00),BndMasterData,1)'
      end
      item
        Name = ' Saidas'
        Value = Null
      end
      item
        Name = 'vls_total_previsto_1'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO_1">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vls_total_realizado_1'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO_1">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vls_total_previsto_2'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO_2">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vls_total_realizado_2'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO_2">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vls_total_previsto_3'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO_3">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vls_total_realizado_3'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO_3">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vls_total_previsto_4'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO_4">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vls_total_realizado_4'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO_4">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vls_total_previsto'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_PREVISTO">,0.00),BndMasterData,1)'
      end
      item
        Name = 'vls_total_realizado'
        Value = 
          'SUM(IIF(<FrdsMovFinanceiroMensal."CD_GRUPO">='#39'D'#39',<FrdsMovFinance' +
          'iroMensal."VL_REALIZADO">,0.00),BndMasterData,1)'
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
      Columns = 1
      ColumnWidth = 190.000000000000000000
      ColumnPositions.Strings = (
        '0')
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
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
          Top = 7.559059999999999000
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
          Top = 7.559059999999999000
          Width = 680.315400000000000000
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
          Width = 680.315009450000000000
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
          Width = 680.315009450000000000
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
          Top = 56.692949999999990000
          Width = 680.315009450000000000
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
          Width = 680.315009450000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
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
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Contas de Movimenta'#231#227'o no Sistema:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 136.063080000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
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
          Left = 325.039580000000000000
          Top = 120.944960000000000000
          Width = 721.890230000000000000
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
        Top = 619.842920000000000000
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
          Top = 15.118119999999980000
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
        Height = 18.897650000000000000
        Top = 351.496290000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsMovFinanceiroMensal
        DataSetName = 'FrdsMovFinanceiroMensal'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdsMovFinanceiroMensal."DS_CLASSIFICACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 865.512370000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_PREVISTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 956.221090000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_REALIZADO">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 684.094930000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_PREVISTO_4">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 774.803650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_REALIZADO_4">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 502.677490000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_PREVISTO_3">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 593.386210000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_REALIZADO_3">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 321.260050000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_PREVISTO_2">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 411.968770000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_REALIZADO_2">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 139.842610000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_PREVISTO_1">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 230.551330000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsMovFinanceiroMensal."VL_REALIZADO_1">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object GrpHeader: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsMovFinanceiroMensal."CD_GRUPO"'
        object Memo29: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          CharSpacing = 1.000000000000000000
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
            ' [FrdsMovFinanceiroMensal."DS_GRUPO"]')
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
      object GrpFooter: TfrxGroupFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 393.071120000000000000
        Width = 1046.929810000000000000
        object Memo38: TfrxMemoView
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          CharSpacing = 1.000000000000000000
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
            ' Total [Lowercase(<FrdsMovFinanceiroMensal."DS_GRUPO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          Left = 321.260050000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_PREVISTO_' +
              '2">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 411.968770000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_REALIZADO' +
              '_2">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 139.842610000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_PREVISTO_' +
              '1">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 230.551330000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_REALIZADO' +
              '_1">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 502.677490000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_PREVISTO_' +
              '3">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 593.386210000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_REALIZADO' +
              '_3">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 684.094930000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_PREVISTO_' +
              '4">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 774.803650000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_REALIZADO' +
              '_4">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo9: TfrxSysMemoView
          Left = 865.512370000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_PREVISTO"' +
              '>,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 956.221090000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsMovFinanceiroMensal."VL_REALIZADO' +
              '">,BndMasterData))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
      end
      object BndHeader: TfrxHeader
        FillType = ftBrush
        Height = 52.913420000000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        object Memo9: TfrxMemoView
          Left = 139.842610000000000000
          Top = 26.456709999999960000
          Width = 90.708661420000000000
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
            'Previsto')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 230.551330000000000000
          Top = 26.456709999999960000
          Width = 90.708661420000000000
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
            'Realizado')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 865.512370000000000000
          Top = 7.559059999999988000
          Width = 181.417322830000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL NO PER'#205'ODO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 865.512370000000000000
          Top = 26.456710000000070000
          Width = 90.708661420000000000
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
            'Previsto')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 956.221090000000000000
          Top = 26.456710000000070000
          Width = 90.708661420000000000
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
            'Realizado')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 684.094930000000000000
          Top = 7.559059999999988000
          Width = 181.417322830000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatDateTime('#39'dd/mm/yyyy'#39',<FrdsMovFinanceiroMensal."DT_INICIA' +
              'L_4">)] a [FormatDateTime('#39'dd/mm/yyyy'#39',<FrdsMovFinanceiroMensal.' +
              '"DT_FINAL_4">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 684.094930000000000000
          Top = 26.456710000000070000
          Width = 90.708661420000000000
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
            'Previsto')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 774.803650000000000000
          Top = 26.456710000000070000
          Width = 90.708661420000000000
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
            'Realizado')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 502.677490000000000000
          Top = 7.559059999999988000
          Width = 181.417322830000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatDateTime('#39'dd/mm/yyyy'#39',<FrdsMovFinanceiroMensal."DT_INICIA' +
              'L_3">)] a [FormatDateTime('#39'dd/mm/yyyy'#39',<FrdsMovFinanceiroMensal.' +
              '"DT_FINAL_3">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo27: TfrxMemoView
          Left = 502.677490000000000000
          Top = 26.456710000000070000
          Width = 90.708661420000000000
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
            'Previsto')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 593.386210000000000000
          Top = 26.456710000000070000
          Width = 90.708661420000000000
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
            'Realizado')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 321.260050000000000000
          Top = 7.559059999999988000
          Width = 181.417322830000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatDateTime('#39'dd/mm/yyyy'#39',<FrdsMovFinanceiroMensal."DT_INICIA' +
              'L_2">)] a [FormatDateTime('#39'dd/mm/yyyy'#39',<FrdsMovFinanceiroMensal.' +
              '"DT_FINAL_2">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo31: TfrxMemoView
          Left = 321.260050000000000000
          Top = 26.456710000000070000
          Width = 90.708661420000000000
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
            'Previsto')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 411.968770000000000000
          Top = 26.456710000000070000
          Width = 90.708661420000000000
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
            'Realizado')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 139.842610000000000000
          Top = 7.559059999999988000
          Width = 181.417322830000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatDateTime('#39'dd/mm/yyyy'#39',<FrdsMovFinanceiroMensal."DT_INICIA' +
              'L_1">)] a [FormatDateTime('#39'dd/mm/yyyy'#39',<FrdsMovFinanceiroMensal.' +
              '"DT_FINAL_1">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo39: TfrxMemoView
          Top = 7.559060000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          CharSpacing = 1.000000000000000000
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
            ' Saldo Inicial')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 26.456710000000000000
          Width = 139.842551420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsSaldoFinanceiroMensal."VL_INICIAL">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndColumnFooter: TfrxColumnFooter
        FillType = ftBrush
        Height = 117.165430000000000000
        Top = 480.000310000000000000
        Width = 1046.929810000000000000
        object Memo63: TfrxMemoView
          Left = 956.221090000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_realizado>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 865.512370000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_previsto>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 774.803650000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_realizado_4>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 684.094930000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_previsto_4>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 593.386210000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_realizado_3>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 502.677490000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_previsto_3>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 411.968770000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_realizado_2>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 321.260050000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_previsto_2>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 230.551330000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_realizado_1>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 139.842610000000000000
          Top = 37.795300000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlsi_total_previsto_1>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 956.221090000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_realizado>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 865.512370000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_previsto>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 774.803650000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_realizado_4>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 684.094930000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_previsto_4>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 593.386210000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_realizado_3>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 502.677490000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_previsto_3>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 411.968770000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_realizado_2>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 321.260050000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_previsto_2>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 230.551330000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_realizado_1>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 139.842610000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<vlso_total_previsto_1>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Top = 18.897650000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Saldo Operacional ('#185')')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          CharSpacing = 1.000000000000000000
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
            ' SALDOS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Top = 37.795300000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Saldo Resultante ('#178')')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Top = 60.472480000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          CharSpacing = 1.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' ('#185') Saldo Operacional = Total de Entradas - Total de Sa'#237'das')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Top = 79.370130000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          CharSpacing = 1.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            
              ' ('#178') Saldo Resultante '#233' acumulativo partido do saldo inicial e a' +
              'gregando-se a ele o saldo operacional semanalmente')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object QryMovFinanceiroMensal: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'WITH MOVIMENTO AS ('
      '    Select'
      '        g.cd_grupo'
      '      , g.ds_grupo'
      '      , g.cd_classificacao'
      '      , g.ds_classificacao'
      '      , g.nr_semana'
      '      , g.dt_inicial'
      '      , g.dt_final'
      '      , g.vl_inicial'
      '      , g.vl_previsto'
      '      , g.vl_realizado'
      
        '    from GET_MOV_MENSAL(:data_base, :empresa, :conta) g -- 03041' +
        '377000187'
      ')'
      'SELECT'
      '    a.*'
      '  , m1.dt_inicial   as dt_inicial_1'
      '  , m1.dt_final     as dt_final_1'
      '  , m2.dt_inicial   as dt_inicial_2'
      '  , m2.dt_final     as dt_final_2'
      '  , m3.dt_inicial   as dt_inicial_3'
      '  , m3.dt_final     as dt_final_3'
      '  , m4.dt_inicial   as dt_inicial_4'
      '  , m4.dt_final     as dt_final_4'
      ''
      '  , m1.nr_semana    as nr_semana_1'
      '  , m2.nr_semana    as nr_semana_2'
      '  , m3.nr_semana    as nr_semana_3'
      '  , m4.nr_semana    as nr_semana_4'
      ''
      '  , m1.vl_previsto  as vl_previsto_1'
      '  , m2.vl_previsto  as vl_previsto_2'
      '  , m3.vl_previsto  as vl_previsto_3'
      '  , m4.vl_previsto  as vl_previsto_4'
      '  , coalesce(m1.vl_previsto, 0.00) +'
      '    coalesce(m2.vl_previsto, 0.00) +'
      '    coalesce(m3.vl_previsto, 0.00) +'
      '    coalesce(m4.vl_previsto, 0.00) as vl_previsto'
      ''
      '  , m1.vl_realizado as vl_realizado_1'
      '  , m2.vl_realizado as vl_realizado_2'
      '  , m3.vl_realizado as vl_realizado_3'
      '  , m4.vl_realizado as vl_realizado_4'
      '  , coalesce(m1.vl_realizado, 0.00) +'
      '    coalesce(m2.vl_realizado, 0.00) +'
      '    coalesce(m3.vl_realizado, 0.00) +'
      '    coalesce(m4.vl_realizado, 0.00) as vl_realizado'
      'FROM ('
      '  Select'
      '      '#39'C'#39'              as cd_grupo'
      '    , '#39'ENTRADAS'#39'       as ds_grupo'
      '    , cr.tpe_codigo    as cd_classificacao'
      '    , cr.tpe_descricao as ds_classificacao'
      '    , cr.tpe_ordem     as nr_ordem'
      '  from VW_CLASSIFICAO_RECEITA cr'
      '  union'
      '  Select'
      '      '#39'D'#39'              as cd_grupo'
      '    , '#39'SAIDAS'#39'         as ds_grupo'
      '    , cd.tpe_codigo    as cd_classificacao'
      '    , cd.tpe_descricao as ds_classificacao'
      '    , cd.tpe_ordem     as nr_ordem'
      '  from VW_CLASSIFICAO_DESPESA cd'
      ') a'
      '  inner join'
      
        '    MOVIMENTO m1 ON (m1.cd_grupo = a.cd_grupo and m1.cd_classifi' +
        'cacao = a.cd_classificacao and m1.nr_semana = :nr_semana_1)'
      '  inner join'
      
        '    MOVIMENTO m2 ON (m2.cd_grupo = a.cd_grupo and m2.cd_classifi' +
        'cacao = a.cd_classificacao and m2.nr_semana = :nr_semana_2)'
      '  inner join'
      
        '    MOVIMENTO m3 ON (m3.cd_grupo = a.cd_grupo and m3.cd_classifi' +
        'cacao = a.cd_classificacao and m3.nr_semana = :nr_semana_3)'
      '  inner join'
      
        '    MOVIMENTO m4 ON (m4.cd_grupo = a.cd_grupo and m4.cd_classifi' +
        'cacao = a.cd_classificacao and m4.nr_semana = :nr_semana_4)'
      ''
      'order by'
      '    a.cd_grupo'
      '  , a.cd_classificacao'
      '')
    Left = 40
    Top = 32
    ParamData = <
      item
        Position = 1
        Name = 'DATA_BASE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'CONTA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'NR_SEMANA_1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'NR_SEMANA_2'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'NR_SEMANA_3'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'NR_SEMANA_4'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DspMovFinanceiroMensal: TDataSetProvider
    DataSet = QryMovFinanceiroMensal
    Left = 72
    Top = 32
  end
  object CdsMovFinanceiroMensal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATA_BASE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_SEMANA_1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_SEMANA_2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_SEMANA_3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_SEMANA_4'
        ParamType = ptInput
      end>
    ProviderName = 'DspMovFinanceiroMensal'
    Left = 104
    Top = 32
  end
  object FrdsMovFinanceiroMensal: TfrxDBDataset
    UserName = 'FrdsMovFinanceiroMensal'
    CloseDataSource = True
    FieldAliases.Strings = (
      'CD_GRUPO=CD_GRUPO'
      'DS_GRUPO=DS_GRUPO'
      'CD_CLASSIFICACAO=CD_CLASSIFICACAO'
      'DS_CLASSIFICACAO=DS_CLASSIFICACAO'
      'NR_ORDEM=NR_ORDEM'
      'DT_INICIAL_1=DT_INICIAL_1'
      'DT_FINAL_1=DT_FINAL_1'
      'DT_INICIAL_2=DT_INICIAL_2'
      'DT_FINAL_2=DT_FINAL_2'
      'DT_INICIAL_3=DT_INICIAL_3'
      'DT_FINAL_3=DT_FINAL_3'
      'DT_INICIAL_4=DT_INICIAL_4'
      'DT_FINAL_4=DT_FINAL_4'
      'NR_SEMANA_1=NR_SEMANA_1'
      'NR_SEMANA_2=NR_SEMANA_2'
      'NR_SEMANA_3=NR_SEMANA_3'
      'NR_SEMANA_4=NR_SEMANA_4'
      'VL_PREVISTO_1=VL_PREVISTO_1'
      'VL_PREVISTO_2=VL_PREVISTO_2'
      'VL_PREVISTO_3=VL_PREVISTO_3'
      'VL_PREVISTO_4=VL_PREVISTO_4'
      'VL_PREVISTO=VL_PREVISTO'
      'VL_REALIZADO_1=VL_REALIZADO_1'
      'VL_REALIZADO_2=VL_REALIZADO_2'
      'VL_REALIZADO_3=VL_REALIZADO_3'
      'VL_REALIZADO_4=VL_REALIZADO_4'
      'VL_REALIZADO=VL_REALIZADO')
    DataSet = CdsMovFinanceiroMensal
    BCDToCurrency = True
    Left = 136
    Top = 32
  end
  object QrySaldoFinanceiroMensal: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    cs.cd_grupo'
      '  , cs.ds_grupo'
      '  , cs.cd_classificacao'
      '  , cs.ds_classificacao'
      '  , cs.nr_semana'
      '  , min(cs.dt_dia) as dt_inicial'
      '  , max(cs.dt_dia) as dt_final'
      '  , sum(cs.vl_inicial) as vl_inicial'
      '  , null as vl_previsto'
      '  , null as vl_realizado'
      
        'from GET_MOV_MENSAL_PREVISTO(:data_base, :empresa, :conta, '#39'S'#39') ' +
        'cs'
      'group by'
      '    cs.cd_grupo'
      '  , cs.ds_grupo'
      '  , cs.cd_classificacao'
      '  , cs.ds_classificacao'
      '  , cs.nr_semana')
    Left = 40
    ParamData = <
      item
        Position = 1
        Name = 'DATA_BASE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'CONTA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DspSaldoFinanceiroMensal: TDataSetProvider
    DataSet = QrySaldoFinanceiroMensal
    Left = 72
  end
  object CdsSaldoFinanceiroMensal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATA_BASE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA'
        ParamType = ptInput
      end>
    ProviderName = 'DspSaldoFinanceiroMensal'
    Left = 104
  end
  object FrdsSaldoFinanceiroMensal: TfrxDBDataset
    UserName = 'FrdsSaldoFinanceiroMensal'
    CloseDataSource = True
    FieldAliases.Strings = (
      'CD_GRUPO=CD_GRUPO'
      'DS_GRUPO=DS_GRUPO'
      'CD_CLASSIFICACAO=CD_CLASSIFICACAO'
      'DS_CLASSIFICACAO=DS_CLASSIFICACAO'
      'NR_SEMANA=NR_SEMANA'
      'DT_INICIAL=DT_INICIAL'
      'DT_FINAL=DT_FINAL'
      'VL_INICIAL=VL_INICIAL'
      'VL_PREVISTO=VL_PREVISTO'
      'VL_REALIZADO=VL_REALIZADO')
    DataSet = CdsSaldoFinanceiroMensal
    BCDToCurrency = True
    Left = 136
  end
end
