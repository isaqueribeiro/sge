inherited frmGeContasAPagarAReceberImpressao: TfrmGeContasAPagarAReceberImpressao
  Caption = 'Contas A Pagar x Contas A Receber'
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
          'Relat'#243'rio de Contas A Pagar x A Receber (Por Vencimentos)')
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
      object lblData: TLabel
        Left = 28
        Top = 54
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vencimento:'
        FocusControl = e1Data
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
        Top = 51
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
        TabOrder = 1
      end
      object e2Data: TJvDateEdit
        Left = 208
        Top = 51
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
  object frCRxCP_PorVencimento: TfrxReport
    Version = '6.0.7'
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
    Top = 8
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsCRxCP_PorVencimento
        DataSetName = 'FrdsCRxCP_PorVencimento'
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
        Name = ' Resultado'
        Value = Null
      end
      item
        Name = 'ResultadoDia'
        Value = 
          '(<FrdsCRxCP_PorVencimento."VALORSALDO_REC"> - <FrdsCRxCP_PorVenc' +
          'imento."VALORSALDO_PAG">)'
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
      Frame.Typ = []
      object GrpFooterComp: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 1046.929810000000000000
        object Memo76: TfrxMemoView
          Left = 922.205320000000000000
          Width = 124.724431420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
            '[FormatFloat('#39',0.00'#39', SUM(<ResultadoDia>,0,0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 823.937540000000000000
          Width = 98.267721420000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORSALDO_R' +
              'EC">,0,0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 733.228820000000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORTOT_REC' +
              '">,0,0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 642.520100000000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORMULTA_R' +
              'EC">,0,0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 551.811380000000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALOR_REC">,' +
              '0,0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 506.457020000000000000
          Width = 45.354301420000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0'#39', SUM(<FrdsCRxCP_PorVencimento."TITULOS">,0,0))' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 408.189240000000000000
          Width = 98.267721420000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORSALDO_P' +
              'AG">,0,0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 317.480520000000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORTOT_PAG' +
              '">,0,0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 226.771800000000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORMULTA_P' +
              'AG">,0,0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 136.063080000000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALOR_PAG">,' +
              '0,0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 90.708720000000000000
          Width = 45.354301420000000000
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
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0'#39', SUM(<FrdsCRxCP_PorVencimento."DUPLICATAS">,0,' +
              '0))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
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
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Total ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 139.842610000000000000
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
          Top = 7.559060000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
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
          Width = 680.315009450000000000
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
          Width = 680.315009450000000000
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
          Width = 680.315009450000000000
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
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
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
        Top = 551.811380000000000000
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
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        DataSet = FrdsCRxCP_PorVencimento
        DataSetName = 'FrdsCRxCP_PorVencimento'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 90.708720000000000000
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
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <FrdsCRxCP_PorVencimento."VENCIME' +
              'NTO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 922.205320000000000000
          Width = 124.724431420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39', <ResultadoDia>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 90.708720000000000000
          Width = 45.354301420000000000
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
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FormatFloat('#39',0'#39', <FrdsCRxCP_PorVencimento."DUPLICATAS">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 136.063080000000000000
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
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39', <FrdsCRxCP_PorVencimento."VALOR_PAG">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 226.771800000000000000
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
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsCRxCP_PorVencimento."VALORMULTA_PAG">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 317.480520000000000000
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
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsCRxCP_PorVencimento."VALORTOT_PAG">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 408.189240000000000000
          Width = 98.267721420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsCRxCP_PorVencimento."VALORSALDO_PAG">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 506.457020000000000000
          Width = 45.354301420000000000
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
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FormatFloat('#39',0'#39', <FrdsCRxCP_PorVencimento."TITULOS">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 551.811380000000000000
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
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39', <FrdsCRxCP_PorVencimento."VALOR_REC">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 642.520100000000000000
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
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsCRxCP_PorVencimento."VALORMULTA_REC">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 733.228820000000000000
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
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsCRxCP_PorVencimento."VALORTOT_REC">)]' +
              ' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 823.937540000000000000
          Width = 98.267721420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.ApplyFont = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 13172219
          Highlight.Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', <FrdsCRxCP_PorVencimento."VALORSALDO_REC">' +
              ')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object GrpHeaderComp: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        Condition = 'FrdsCRxCP_PorVencimento."COMPETENCIA"'
        ReprintOnNewPage = True
        object Memo9: TfrxMemoView
          Left = 90.708720000000000000
          Top = 18.897650000000000000
          Width = 45.354301420000000000
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
            'Qtde. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 136.063080000000000000
          Top = 18.897650000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 922.205320000000000000
          Top = 18.897650000000000000
          Width = 124.724431420000000000
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
            '(CR - CP)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 90.708720000000000000
          Width = 415.748182830000000000
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
            'TOTAL A PAGAR (CP)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Width = 90.708720000000000000
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
            ' Vencimentos')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Top = 18.897650000000000000
          Width = 90.708661420000000000
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
          Memo.UTF8W = (
            ' [FrdsCRxCP_PorVencimento."COMPETENCIA_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 226.771800000000000000
          Top = 18.897650000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'J/M (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 317.480520000000000000
          Top = 18.897650000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 408.189240000000000000
          Top = 18.897650000000000000
          Width = 98.267721420000000000
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
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 506.457020000000000000
          Width = 415.748182830000000000
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
            'TOTAL A RECEBER (CR)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 506.457020000000000000
          Top = 18.897650000000000000
          Width = 45.354301420000000000
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
            'Qtde. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 551.811380000000000000
          Top = 18.897650000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Valor (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 642.520100000000000000
          Top = 18.897650000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'J/M (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 733.228820000000000000
          Top = 18.897650000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            'Recebido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 823.937540000000000000
          Top = 18.897650000000000000
          Width = 98.267721420000000000
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
            'A Receber (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 922.205320000000000000
          Width = 124.724372830000000000
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
            'RESULTADO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object RpttSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 404.409710000000000000
        Width = 1046.929810000000000000
        object Memo60: TfrxMemoView
          Left = 90.708720000000000000
          Top = 56.692950000000000000
          Width = 956.221090000000000000
          Height = 18.897650000000000000
          CharSpacing = 1.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            
              ' Os totais aqui apresentados n'#227'o levam em considera'#231#227'o os regist' +
              'ros de Contas A Pagar e Contas A Receber cancelados.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 922.205320000000000000
          Top = 37.795300000000000000
          Width = 124.724431420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39', SUM(<ResultadoDia>,0,2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 823.937540000000000000
          Top = 37.795300000000000000
          Width = 98.267721420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORSALDO_R' +
              'EC">,0,2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 733.228820000000000000
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
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORTOT_REC' +
              '">,0,2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 642.520100000000000000
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
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORMULTA_R' +
              'EC">,0,2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 551.811380000000000000
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
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALOR_REC">,' +
              '0,2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 506.457020000000000000
          Top = 37.795300000000000000
          Width = 45.354301420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0'#39', SUM(<FrdsCRxCP_PorVencimento."TITULOS">,0,2))' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 408.189240000000000000
          Top = 37.795300000000000000
          Width = 98.267721420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORSALDO_P' +
              'AG">,0,2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 317.480520000000000000
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
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORTOT_PAG' +
              '">,0,2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 226.771800000000000000
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
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALORMULTA_P' +
              'AG">,0,2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 136.063080000000000000
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
          Frame.Color = clWhite
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<FrdsCRxCP_PorVencimento."VALOR_PAG">,' +
              '0,2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 90.708720000000000000
          Top = 37.795300000000000000
          Width = 45.354301420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0'#39', SUM(<FrdsCRxCP_PorVencimento."DUPLICATAS">,0,' +
              '2))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 90.708720000000000000
          Top = 18.897650000000000000
          Width = 45.354301420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 136.063080000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
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
        object Memo89: TfrxMemoView
          Left = 922.205320000000000000
          Top = 18.897650000000000000
          Width = 124.724431420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            '(CR - CP)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 90.708720000000000000
          Width = 415.748182830000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL GERAL A PAGAR (CP)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 226.771800000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'J/M (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 317.480520000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Pago (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 408.189240000000000000
          Top = 18.897650000000000000
          Width = 98.267721420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'A Pagar (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 506.457020000000000000
          Width = 415.748182830000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL GERAL A RECEBER (CR)')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 506.457020000000000000
          Top = 18.897650000000000000
          Width = 45.354301420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 551.811380000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
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
        object Memo97: TfrxMemoView
          Left = 642.520100000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'J/M (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 733.228820000000000000
          Top = 18.897650000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Recebido (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 823.937540000000000000
          Top = 18.897650000000000000
          Width = 98.267721420000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'A Receber (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 922.205320000000000000
          Width = 124.724372830000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'RESULTADO GERAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object QryCRxCP_PorVencimento: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      '/*'
      ''
      'WITH MOVIMENTO AS ('
      '    Select'
      '        '#39'CP'#39' as tipo'
      '      , cp.dtvenc as vencimento'
      ''
      '      , count( cp.anolanc ) as quantidade'
      '      , sum( coalesce(cp.valorpag, 0)    ) as valor'
      '      , sum( coalesce(cp.valormulta, 0)  ) as valor_multa'
      '      , sum( coalesce(cp.valorpagtot, 0) ) as valor_pagto'
      '      , sum( coalesce(cp.valorsaldo, 0)  ) as valor_saldo'
      '    '
      
        '      , sum( coalesce(cm.totalnf, 0) )               as nfe_valo' +
        'r'
      
        '      , sum( coalesce(cm.totalnf + cm.desconto, 0) ) as nfe_valo' +
        'r_bruto'
      '    from TBCONTPAG cp'
      
        '      left join TBCOMPRAS cm on (cm.ano = cp.anocompra and cm.co' +
        'dcontrol = cp.numcompra)'
      ''
      '    where (cp.empresa  = '#39'26352874000100'#39')'
      '      and (cp.situacao = 1)'
      '    '
      '    group by'
      '        cp.dtvenc'
      ''
      '    UNION'
      '    '
      '    Select'
      '        '#39'CR'#39' as tipo'
      '      , cr.dtvenc as vencimento'
      ''
      '      , count( cr.anolanc ) as quantidade'
      '      , sum( coalesce(cr.valorrec, 0)    ) as valor'
      '      , sum( coalesce(cr.valormulta, 0)  ) as valor_multa'
      '      , sum( coalesce(cr.valorrectot, 0) ) as valor_pagto'
      '      , sum( coalesce(cr.valorsaldo, 0)  ) as valor_saldo'
      '    '
      '      , sum( coalesce(vn.totalvenda, 0) ) as nfe_valor'
      
        '      , sum( coalesce(vn.totalvenda_bruta + vn.desconto + vn.des' +
        'conto_cupom, 0) ) as nfe_valor_bruto'
      '    from TBCONTREC cr'
      
        '      left join TBVENDAS vn on (vn.ano = cr.anovenda and vn.codc' +
        'ontrol = cr.numvenda)'
      
        '      left join TBCOMPETENCIA cv on (cv.cmp_num = extract(year f' +
        'rom cr.dtvenc)  || right('#39'00'#39' || extract(month from cr.dtvenc), ' +
        '2))'
      '    '
      '    where (cr.empresa  = '#39'26352874000100'#39')'
      '      and (cr.situacao = 1)'
      '    '
      '    group by'
      '        cr.dtvenc'
      ')'
      'SELECT'
      '    a.vencimento'
      
        '  , extract(year from a.vencimento) || right('#39'00'#39' || extract(mon' +
        'th from a.vencimento), 2) as competencia'
      '  , cv.cmp_desc as competencia_desc'
      '  -- A PAGAR'
      '  , c.quantidade  as duplicatas'
      '  , c.valor       as valor_pag'
      '  , c.valor_multa as valormulta_pag'
      '  , c.valor_pagto as valortot_pag'
      '  , c.valor_saldo as valorsaldo_pag'
      '  , c.nfe_valor       as nfe_valor_pag'
      '  , c.nfe_valor_bruto as nfe_valor_bruto_pag'
      '  -- A RECEBER'
      '  , r.quantidade  as titulos'
      '  , r.valor       as valor_rec'
      '  , r.valor_multa as valormulta_rec'
      '  , r.valor_pagto as valortot_rec'
      '  , r.valor_saldo as valorsaldo_rec'
      '  , r.nfe_valor       as nfe_valor_rec'
      '  , r.nfe_valor_bruto as nfe_valor_bruto_rec'
      'FROM ('
      '    Select'
      '        cp.dtvenc as vencimento'
      '    from TBCONTPAG cp'
      
        '      left join TBCOMPRAS cm on (cm.ano = cp.anocompra and cm.co' +
        'dcontrol = cp.numcompra)'
      '    where (cp.empresa  = '#39'26352874000100'#39')'
      '      and (cp.situacao = 1)'
      '    group by'
      '        cp.dtvenc'
      '    '
      '    UNION'
      '    '
      '    Select'
      '        cr.dtvenc as vencimento'
      '    from TBCONTREC cr'
      
        '      left join TBVENDAS vn on (vn.ano = cr.anovenda and vn.codc' +
        'ontrol = cr.numvenda)'
      '    where (cr.empresa = '#39'26352874000100'#39')'
      '      and (cr.situacao = 1)'
      '    group by'
      '        cr.dtvenc'
      ') a'
      '  left join'
      
        '    TBCOMPETENCIA cv on (cv.cmp_num = extract(year from a.vencim' +
        'ento)  || right('#39'00'#39' || extract(month from a.vencimento),  2))'
      '  left join'
      
        '    MOVIMENTO c ON (c.tipo = '#39'CP'#39' and c.vencimento = a.venciment' +
        'o)'
      '  left join'
      
        '    MOVIMENTO r ON (r.tipo = '#39'CR'#39' and r.vencimento = a.venciment' +
        'o)'
      ''
      'order by'
      '    2'
      '  , 1'
      ''
      '*/'
      ''
      'Select'
      '    v.vencimento'
      
        '  , extract(year from v.vencimento) || right('#39'00'#39' || extract(mon' +
        'th from v.vencimento), 2) as competencia'
      '  , cv.cmp_desc as competencia_desc'
      '  -- A PAGAR'
      '  , c.duplicatas'
      '  , c.valor_pag'
      '  , c.valormulta_pag'
      '  , c.valortot_pag'
      '  , c.valorsaldo_pag'
      '  , c.nfe_valor_pag'
      '  , c.nfe_valor_bruto_pag'
      '  -- A RECEBER'
      '  , r.titulos'
      '  , r.valor_rec'
      '  , r.valormulta_rec'
      '  , r.valortot_rec'
      '  , r.valorsaldo_rec'
      '  , r.nfe_valor_rec'
      '  , r.nfe_valor_bruto_rec'
      'from ('
      '    Select'
      '        cp.dtvenc as vencimento'
      '    from TBCONTPAG cp'
      
        '      left join TBCOMPRAS cm on (cm.ano = cp.anocompra and cm.co' +
        'dcontrol = cp.numcompra)'
      '    where (cp.empresa  = :empresa)'
      '      and (cp.situacao = 1)'
      '      and (cp.dtvenc between :data_inicial and :data_final)'
      '    group by'
      '        cp.dtvenc'
      '    '
      '    UNION'
      '    '
      '    Select'
      '        cr.dtvenc as vencimento'
      '    from TBCONTREC cr'
      
        '      left join TBVENDAS vn on (vn.ano = cr.anovenda and vn.codc' +
        'ontrol = cr.numvenda)'
      '    where (cr.empresa = :empresa)'
      '      and (cr.situacao = 1)'
      '      and (cr.dtvenc between :data_inicial and :data_final)'
      '    group by'
      '        cr.dtvenc'
      '  ) v'
      
        '  left join TBCOMPETENCIA cv on (cv.cmp_num = extract(year from ' +
        'v.vencimento)  || right('#39'00'#39' || extract(month from v.vencimento)' +
        ',  2))'
      '  left join ('
      '    Select'
      '        '#39'CP'#39' as tipo'
      '      , cp.dtvenc as vencimento'
      '      , count( cp.anolanc ) as duplicatas'
      '      , sum( coalesce(cp.valorpag, 0)    ) as valor_pag'
      '      , sum( coalesce(cp.valormulta, 0)  ) as valormulta_pag'
      '      , sum( coalesce(cp.valorpagtot, 0) ) as valortot_pag'
      '      , sum( coalesce(cp.valorsaldo, 0)  ) as valorsaldo_pag'
      
        '      , sum( coalesce(cm.totalnf, 0) )               as nfe_valo' +
        'r_pag'
      
        '      , sum( coalesce(cm.totalnf + cm.desconto, 0) ) as nfe_valo' +
        'r_bruto_pag'
      '    from TBCONTPAG cp'
      
        '      left join TBCOMPRAS cm on (cm.ano = cp.anocompra and cm.co' +
        'dcontrol = cp.numcompra)'
      ''
      '    where (cp.empresa  = :empresa)'
      '      and (cp.situacao = 1)'
      '    '
      '    group by'
      '        cp.dtvenc'
      '  ) c on (c.vencimento = v.vencimento)'
      '  left join ('
      '    Select'
      '        '#39'CR'#39' as tipo'
      '      , cr.dtvenc as vencimento'
      '      , count( cr.anolanc ) as titulos'
      '      , sum( coalesce(cr.valorrec, 0)    ) as valor_rec'
      '      , sum( coalesce(cr.valormulta, 0)  ) as valormulta_rec'
      '      , sum( coalesce(cr.valorrectot, 0) ) as valortot_rec'
      '      , sum( coalesce(cr.valorsaldo, 0)  ) as valorsaldo_rec'
      '      , sum( coalesce(vn.totalvenda, 0) )  as nfe_valor_rec'
      
        '      , sum( coalesce(vn.totalvenda_bruta + vn.desconto + vn.des' +
        'conto_cupom, 0) ) as nfe_valor_bruto_rec'
      '    from TBCONTREC cr'
      
        '      left join TBVENDAS vn on (vn.ano = cr.anovenda and vn.codc' +
        'ontrol = cr.numvenda)'
      ''
      '    where (cr.empresa  = :empresa)'
      '      and (cr.situacao = 1)'
      '    '
      '    group by'
      '        cr.dtvenc'
      '  ) r on (r.vencimento = v.vencimento)'
      'order by'
      '    2'
      '  , 1')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
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
  object DspCRxCP_PorVencimento: TDataSetProvider
    DataSet = QryCRxCP_PorVencimento
    Left = 72
    Top = 8
  end
  object CdsCRxCP_PorVencimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 18
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
    ProviderName = 'DspCRxCP_PorVencimento'
    Left = 104
    Top = 8
  end
  object FrdsCRxCP_PorVencimento: TfrxDBDataset
    UserName = 'FrdsCRxCP_PorVencimento'
    CloseDataSource = True
    FieldAliases.Strings = (
      'VENCIMENTO=VENCIMENTO'
      'COMPETENCIA=COMPETENCIA'
      'COMPETENCIA_DESC=COMPETENCIA_DESC'
      'DUPLICATAS=DUPLICATAS'
      'VALOR_PAG=VALOR_PAG'
      'VALORMULTA_PAG=VALORMULTA_PAG'
      'VALORTOT_PAG=VALORTOT_PAG'
      'VALORSALDO_PAG=VALORSALDO_PAG'
      'NFE_VALOR_PAG=NFE_VALOR_PAG'
      'NFE_VALOR_BRUTO_PAG=NFE_VALOR_BRUTO_PAG'
      'TITULOS=TITULOS'
      'VALOR_REC=VALOR_REC'
      'VALORMULTA_REC=VALORMULTA_REC'
      'VALORTOT_REC=VALORTOT_REC'
      'VALORSALDO_REC=VALORSALDO_REC'
      'NFE_VALOR_REC=NFE_VALOR_REC'
      'NFE_VALOR_BRUTO_REC=NFE_VALOR_BRUTO_REC')
    DataSet = CdsCRxCP_PorVencimento
    BCDToCurrency = True
    Left = 136
    Top = 8
  end
end
