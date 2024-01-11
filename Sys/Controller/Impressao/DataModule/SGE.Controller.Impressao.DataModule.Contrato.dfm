object DataModuleContrato: TDataModuleContrato
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 475
  Width = 635
  object FrChequeA4: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Visualizar Recibo (Contas A Pagar)'
    ReportOptions.LastChange = 42215.926201203700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure BndPageHeaderOnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      
        '  BndPageHeader.Visible      := (<Imprimir_Cabecalho> = 1);     ' +
        '      '
      
        '  frdEmpresaLogo.Visible     := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaRZSOC.Visible    := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaCNPJ.Visible     := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaFone.Visible     := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaEndereco.Visible := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaEmail.Visible    := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      '  frdEmpresaLinha.Visible    := (<Imprimir_Cabecalho> = 1);'
      ''
      
        '  frdReciboNumeroRotulo.Visible := (<Imprimir_Cabecalho> = 1);  ' +
        '      '
      
        '  frdReciboNumero.Visible       := (<Imprimir_Cabecalho> = 1);  ' +
        '      '
      '  '
      '  if (<Imprimir_Cabecalho> = 0) then'
      '    BndPageHeader.Height := 1;  '
      ''
      '  BndPageFooter.Visible := (<Imprimir_Cabecalho> = 1);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 96
    Top = 128
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdCheque
        DataSetName = 'FrdCheque'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'RECIBO'#39
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
        Name = 'Cidade'
        Value = 
          'Copy(Trim(Uppercase(<frdEmpresa."CID_NOME">)), 1, 1) + Copy(Trim' +
          '(Lowercase(<frdEmpresa."CID_NOME">)), 2, 50)'
      end
      item
        Name = 'UF'
        Value = 'Trim(Uppercase(<frdEmpresa."EST_SIGLA">))'
      end
      item
        Name = 'Imprimir_Cabecalho'
        Value = '1'
      end
      item
        Name = 'sComplementoValor'
        Value = 
          #39' . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ' +
          '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ' +
          '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ' +
          '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . .'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object PgRecibo: TfrxReportPage
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
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnAfterCalcHeight = 'BndPageHeaderOnAfterCalcHeight'
        object frdEmpresaLogo: TfrxPictureView
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
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaCNPJ: TfrxMemoView
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
        object frdEmpresaFone: TfrxMemoView
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
        object frdEmpresaEndereco: TfrxMemoView
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
        object frdEmpresaLinha: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frdEmpresaEmail: TfrxMemoView
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
        object frdReciboNumeroRotulo: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 7.559059999999999000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'N'#250'mero Controle ')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdReciboNumero: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 26.456710000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39'###0000000'#39', <FrdCheque."CONTROLE">)]')
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
        Top = 510.236550000000000000
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
          Top = 15.118119999999920000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 272.126160000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        DataSet = FrdCheque
        DataSetName = 'FrdCheque'
        RowCount = 0
        Stretched = True
        object FrdChequeSTATUS: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 702.992580000000000000
          Height = 268.346630000000000000
          CharSpacing = 4.000000000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14211288
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[FrdCheque."STATUS_DESCRICAO"]')
          ParentFont = False
          Rotation = 45
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Comp.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 41.574830000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Banco')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Ag'#234'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 3.779529999999994000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' C1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 3.779529999999994000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' N'#250'mero da Conta')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 3.779529999999994000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' C2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 3.779529999999994000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' N'#250'mero do Cheque')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559370000000000000
          Top = 3.779529999999994000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' C3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 3.779529999999994000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' R$')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 22.677179999999990000
          Width = 34.015770000000000000
          Height = 22.677150710000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object FrdChequeBANCO: TfrxMemoView
          AllowVectorExport = True
          Left = 41.574830000000000000
          Top = 22.677179999999990000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdCheque."BANCO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object FrdChequeAGENCIA: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 22.677179999999990000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdCheque."AGENCIA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 22.677179999999990000
          Width = 26.456710000000000000
          Height = 22.677150710000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object FrdChequeCONTA: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 22.677179999999990000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdCheque."CONTA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 22.677179999999990000
          Width = 26.456710000000000000
          Height = 22.677150710000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object FrdChequeNUMERO: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 22.677179999999990000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdCheque."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559370000000000000
          Top = 22.677179999999990000
          Width = 26.456710000000000000
          Height = 22.677150710000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object FrdChequeVALOR: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 22.677179999999990000
          Width = 196.535560000000000000
          Height = 22.677180000000000000
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39'"# R$ " ,0.00 "#"'#39', <FrdCheque."VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 253.228510000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[IIF(<FrdCheque."EMISSOR_PF">=1,'#39'CPF: '#39', '#39'CNPJ: '#39')] [IIF(<FrdChe' +
              'que."EMISSOR_PF">=1,FormatMaskText('#39'###.###.###-##;0;'#39',<FrdChequ' +
              'e."EMISSOR_CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdCh' +
              'eque."EMISSOR_CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 230.551330000000000000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[FrdCheque."EMISSOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 71.811070000000000000
          Width = 702.992580000000000000
          Height = 136.063080000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E32323632317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313338305C716A5C75
            6C5C66305C66733230205B4672644368657175652E2256414C4F525F45585445
            4E534F225D205B436F7079283C73436F6D706C656D656E746F56616C6F723E2C
            20312C2028313530202D204C656E677468283C4672644368657175652E225641
            4C4F525F455854454E534F223E2929295D5C756C6E6F6E655C66733136202061
            63696D615C7061720D0A0D0A5C706172645C716A5C7061720D0A61205C756C5C
            66733230205B4672644368657175652E224E4F4D494E414C5F41225D5C756C6E
            6F6E655C6673313620206F75205C27653020737561206F7264656D2E5C706172
            0D0A5C7061720D0A0D0A5C706172645C71725C66733230205B4369646164655D
            2F5B55465D2C205B466F726D61744461746554696D6528276464202220646520
            22206D6D6D6D202220646520222079797979272C203C4672644368657175652E
            22444154415F454D495353414F223E295D2E5C7061720D0A0D0A5C706172645C
            716A5C7061720D0A7D0D0A00}
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 64.252010000000010000
          Width = 90.708720000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            'Pague por este'
            'cheque a quantia de ')
          ParentFont = False
          VAlign = vaCenter
        end
        object imgLogoBanco: TfrxPictureView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 170.078850000000000000
          Width = 149.000000000000000000
          Height = 38.000000000000000000
          DataField = 'BANCO_LOGO'
          DataSet = FrdCheque
          DataSetName = 'FrdCheque'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
    end
  end
  object FrChequeA5: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Visualizar Recibo (Contas A Pagar)'
    ReportOptions.LastChange = 42215.926201203710000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure BndPageHeaderOnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      
        '  BndPageHeader.Visible      := (<Imprimir_Cabecalho> = 1);     ' +
        '      '
      
        '  frdEmpresaLogo.Visible     := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaRZSOC.Visible    := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaCNPJ.Visible     := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaFone.Visible     := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaEndereco.Visible := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaEmail.Visible    := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      '  frdEmpresaLinha.Visible    := (<Imprimir_Cabecalho> = 1);'
      ''
      
        '  frdReciboNumeroRotulo.Visible := (<Imprimir_Cabecalho> = 1);  ' +
        '      '
      
        '  frdReciboNumero.Visible       := (<Imprimir_Cabecalho> = 1);  ' +
        '      '
      '  '
      '  if (<Imprimir_Cabecalho> = 0) then'
      '    BndPageHeader.Height := 1;  '
      ''
      '  BndPageFooter.Visible := (<Imprimir_Cabecalho> = 1);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 96
    Top = 160
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdCheque
        DataSetName = 'FrdCheque'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'RECIBO'#39
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
        Name = 'Cidade'
        Value = 
          'Copy(Trim(Uppercase(<frdEmpresa."CID_NOME">)), 1, 1) + Copy(Trim' +
          '(Lowercase(<frdEmpresa."CID_NOME">)), 2, 50)'
      end
      item
        Name = 'UF'
        Value = 'Trim(Uppercase(<frdEmpresa."EST_SIGLA">))'
      end
      item
        Name = 'Imprimir_Cabecalho'
        Value = '1'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object PgRecibo: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 256
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
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnAfterCalcHeight = 'BndPageHeaderOnAfterCalcHeight'
        object frdEmpresaLogo: TfrxPictureView
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
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaCNPJ: TfrxMemoView
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
        object frdEmpresaFone: TfrxMemoView
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
        object frdEmpresaEndereco: TfrxMemoView
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
        object frdEmpresaLinha: TfrxLineView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frdEmpresaEmail: TfrxMemoView
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
        object frdReciboNumeroRotulo: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 7.559059999999999000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Documento Baixa ')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdReciboNumero: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 26.456710000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FrdRecibo."ANOLANC"]/[FormatFloat('#39'00000'#39',<FrdRecibo."NUMLANC">' +
              ')].B[FormatFloat('#39'00'#39',<FrdRecibo."SEQ">)] ')
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
        Top = 529.134200000000000000
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
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 162.519790000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Child = FrChequeA5.BndChildAssinatura
        DataSet = FrdCheque
        DataSetName = 'FrdCheque'
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 60.472480000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E32323632317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C716A5C66305C66733230205265636562656D6F732064652F6461205C6220
            5B46726452656369626F2E224E4F4D455F434C49454E5445225D5C6230202061
            20696D706F72745C2765326E636961206465205C62205B46726452656369626F
            2E2256414C4F525F42414958415F455854454E534F225D5C6230202072656665
            72656E7465205C276530205C62205B46726452656369626F2E22484953544F52
            49434F225D202D20284C616E5C276537616D656E746F205B4672645265636962
            6F2E22414E4F4C414E43225D2F5B466F726D6174466C6F617428273030303030
            272C3C46726452656369626F2E224E554D4C414E43223E295D2E505B466F726D
            6174466C6F617428273030272C3C46726452656369626F2E2250415243454C41
            223E295D295C6230202E5C7061720D0A7D0D0A00}
        end
        object Rich2: TfrxRichView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 102.047310000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E32323632317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C71635C625C66305C66733332205B546974756C6F5D5C7061720D0A0D0A5C
            706172645C6669313030305C6C693134305C72693138305C73623132305C7361
            3132305C736C3336305C736C6D756C74315C71725C62305C667332342056616C
            6F723A205C756C5C62205224205B466F726D6174466C6F617428272C302E3030
            272C3C46726452656369626F2E2256414C4F525F4241495841223E295D5C756C
            6E6F6E655C62305C7061720D0A7D0D0A00}
        end
      end
      object BndChildAssinatura: TfrxChild
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 105.826840000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 86.929190000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdRecibo."EMPR' +
              'ESA_CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 64.252010000000000000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdRecibo."EMPRESA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Rich3: TfrxRichView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E32323632317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C716A5C66305C66733230205B4369646164655D2F5B55465D2C205B466F72
            6D61744461746554696D652827646420222064652022206D6D6D6D2022206465
            20222079797979272C203C46726452656369626F2E22444154415F504147544F
            223E295D2E5C7061720D0A7D0D0A00}
        end
      end
    end
  end
  object FrdCheque: TfrxDBDataset
    UserName = 'FrdCheque'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CONTROLE=CONTROLE'
      'EMPRESA=EMPRESA'
      'TIPO=TIPO'
      'BANCO=BANCO'
      'BANCO_LOGO=BANCO_LOGO'
      'AGENCIA=AGENCIA'
      'CONTA=CONTA'
      'NUMERO=NUMERO'
      'FORNECEDOR=FORNECEDOR'
      'CLIENTE=CLIENTE'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_APRESENTACAO=DATA_APRESENTACAO'
      'DATA_COMPENSACAO=DATA_COMPENSACAO'
      'VALOR=VALOR'
      'VALOR_EXTENSO=VALOR_EXTENSO'
      'NOMINAL_A=NOMINAL_A'
      'DATA_CADASTRO=DATA_CADASTRO'
      'USUARIO_CADASTRO=USUARIO_CADASTRO'
      'STATUS=STATUS'
      'OBS=OBS'
      'STATUS_DESCRICAO=STATUS_DESCRICAO'
      'BANCO_NOME=BANCO_NOME'
      'EMISSOR_NOME=EMISSOR_NOME'
      'EMISSOR_CNPJ=EMISSOR_CNPJ'
      'EMISSOR_PF=EMISSOR_PF')
    DataSet = CdsCheque
    BCDToCurrency = True
    DataSetOptions = []
    Left = 124
    Top = 161
  end
  object CdsCheque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CHEQUE'
        ParamType = ptInput
      end>
    ProviderName = 'DspCheque'
    Left = 160
    Top = 208
    object CdsChequeCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Required = True
    end
    object CdsChequeEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 18
    end
    object CdsChequeTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object CdsChequeBANCO: TStringField
      FieldName = 'BANCO'
      Required = True
      Size = 10
    end
    object CdsChequeBANCO_LOGO: TBlobField
      FieldName = 'BANCO_LOGO'
      ProviderFlags = []
    end
    object CdsChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Required = True
    end
    object CdsChequeCONTA: TStringField
      FieldName = 'CONTA'
      Required = True
    end
    object CdsChequeNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 30
    end
    object CdsChequeFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
    object CdsChequeCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object CdsChequeDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CdsChequeDATA_APRESENTACAO: TDateField
      FieldName = 'DATA_APRESENTACAO'
    end
    object CdsChequeDATA_COMPENSACAO: TDateField
      FieldName = 'DATA_COMPENSACAO'
    end
    object CdsChequeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object CdsChequeVALOR_EXTENSO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_EXTENSO'
      Size = 250
    end
    object CdsChequeNOMINAL_A: TStringField
      FieldName = 'NOMINAL_A'
      ReadOnly = True
      Size = 140
    end
    object CdsChequeDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object CdsChequeUSUARIO_CADASTRO: TStringField
      FieldName = 'USUARIO_CADASTRO'
      Size = 12
    end
    object CdsChequeSTATUS: TSmallintField
      FieldName = 'STATUS'
      Required = True
    end
    object CdsChequeOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object CdsChequeSTATUS_DESCRICAO: TStringField
      FieldName = 'STATUS_DESCRICAO'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object CdsChequeBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      ReadOnly = True
      Size = 100
    end
    object CdsChequeEMISSOR_NOME: TStringField
      FieldName = 'EMISSOR_NOME'
      ReadOnly = True
      Size = 100
    end
    object CdsChequeEMISSOR_CNPJ: TStringField
      FieldName = 'EMISSOR_CNPJ'
      ReadOnly = True
      Size = 18
    end
    object CdsChequeEMISSOR_PF: TSmallintField
      FieldName = 'EMISSOR_PF'
      ReadOnly = True
    end
  end
  object DspCheque: TDataSetProvider
    DataSet = QryCheque
    Left = 128
    Top = 208
  end
  object QryCheque: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.controle'
      '  , c.empresa'
      '  , c.tipo'
      '  , c.banco'
      '  , e.logo as banco_logo'
      '  , c.agencia'
      '  , c.conta'
      '  , c.numero'
      '  , c.fornecedor'
      '  , c.cliente'
      '  , c.data_emissao'
      '  , c.data_apresentacao'
      '  , c.data_compensacao'
      '  , c.valor'
      '  , rpad(coalesce(c.nominal_a, '#39#39'), 140, '#39' '#39') as nominal_a'
      '  , c.data_cadastro'
      '  , c.usuario_cadastro'
      '  , c.status'
      '  , c.obs'
      ''
      '  , sc.descricao as status_descricao'
      '  , bc.nome      as banco_nome'
      ''
      '  , coalesce(cc.nome, fc.nomeforn)               as emissor_nome'
      '  , coalesce(cc.cnpj, fc.cnpj)                   as emissor_cnpj'
      '  , coalesce(cc.pessoa_fisica, fc.pessoa_fisica) as emissor_pf'
      'from TBCHEQUE c'
      '  left join TBEMPRESA e on (e.cnpj = c.empresa)'
      '  left join VW_STATUS_CHEQUE sc on (sc.codigo = c.status)'
      '  left join TBCLIENTE cc on (cc.codigo = c.cliente)'
      '  left join TBFORNECEDOR fc on (fc.codforn = c.fornecedor)'
      '  left join TBBANCO bc on (bc.cod = c.banco)'
      ''
      'where c.controle = :cheque')
    Left = 96
    Top = 208
    ParamData = <
      item
        Position = 1
        Name = 'CHEQUE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryChequeCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryChequeEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Size = 18
    end
    object QryChequeTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object QryChequeBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BANCO'
      Required = True
      Size = 10
    end
    object QryChequeBANCO_LOGO: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'BANCO_LOGO'
      Origin = 'LOGO'
      ProviderFlags = []
    end
    object QryChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      Required = True
    end
    object QryChequeCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Required = True
    end
    object QryChequeNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 30
    end
    object QryChequeFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
    end
    object QryChequeCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
    end
    object QryChequeDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object QryChequeDATA_APRESENTACAO: TDateField
      FieldName = 'DATA_APRESENTACAO'
      Origin = 'DATA_APRESENTACAO'
    end
    object QryChequeDATA_COMPENSACAO: TDateField
      FieldName = 'DATA_COMPENSACAO'
      Origin = 'DATA_COMPENSACAO'
    end
    object QryChequeNOMINAL_A: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMINAL_A'
      Origin = 'NOMINAL_A'
      ProviderFlags = []
      ReadOnly = True
      Size = 140
    end
    object QryChequeDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object QryChequeUSUARIO_CADASTRO: TStringField
      FieldName = 'USUARIO_CADASTRO'
      Origin = 'USUARIO_CADASTRO'
      Size = 12
    end
    object QryChequeSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object QryChequeOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object QryChequeSTATUS_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS_DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object QryChequeBANCO_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BANCO_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QryChequeEMISSOR_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSOR_NOME'
      Origin = 'EMISSOR_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QryChequeEMISSOR_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSOR_CNPJ'
      Origin = 'EMISSOR_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object QryChequeEMISSOR_PF: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSOR_PF'
      Origin = 'EMISSOR_PF'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryChequeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object QryRelacaoContratos: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    cnt.controle'
      '  , cnt.empresa'
      '  , emp.rzsoc  as empresa_'
      '  , emp.nmfant as empresa_fantasia'
      '  , emp.cnpj   as empresa_cnpj'
      '  , cnt.numero'
      '  , cnt.data_emissao'
      '  , cnt.data_validade'
      '  , cnt.destino'
      '  , cast('
      '      Case cnt.destino'
      '        when 0 then '#39'Contrato c/ Cliente'#39
      '        when 1 then '#39'Contrato c/ Fornecedor'#39
      '      end'
      '    as DMN_VCHAR_30) as destino_'
      '  , cnt.cliente'
      '  , cnt.fornecedor'
      '  , coalesce(cnt.cliente, cnt.fornecedor) as pessoa_contrato'
      
        '  , coalesce(cli.pessoa_fisica, frn.pessoa_fisica) as pessoa_fis' +
        'ica'
      '  , coalesce(cli.nome, frn.nomeforn) as pessoa_nome'
      '  , coalesce(cli.cnpj, frn.cnpj)     as pessoa_cpf_cnpj'
      '  , cnt.situacao'
      '  , cast('
      '      Case cnt.destino'
      '        when 0 then '#39'Editando'#39
      '        when 1 then '#39'Disponivel'#39
      '        when 2 then '#39'Finalizado/Encerrado'#39
      '        when 9 then '#39'Cancelado'#39
      '      end'
      '    as DMN_VCHAR_30) as situacao_'
      '  , cnt.observacoes'
      '  , cnt.itens'
      '  , cnt.quantidades'
      '  , cnt.valor_total'
      '  , itm.saldo_qtde'
      '  , itm.saldo_total'
      '  , cnt.usuario'
      '  , usr.nomecompleto as usuario_'
      '  , cnt.data_cadastro'
      '  , cnt.data_atualizacao'
      'from TBCONTRATO cnt'
      '  left join TBEMPRESA emp on (emp.cnpj = cnt.empresa)'
      '  left join TBCLIENTE cli on (cli.codigo = cnt.cliente)'
      '  left join TBFORNECEDOR frn on (frn.codforn = cnt.fornecedor)'
      '  left join TBUSERS usr on (usr.nome = cnt.usuario)'
      '  left join ('
      '    Select   '
      '        ci.contrato'
      '      , sum(ci.saldo_qtde)  as saldo_qtde '
      '      , sum(ci.saldo_total) as saldo_total'
      '    from TBCONTRATO_ITEM ci'
      '    group by'
      '        ci.contrato'
      '  ) itm on (itm.contrato = cnt.controle)'
      ''
      'where (cnt.controle > 0)'
      '  and ((cnt.empresa = :empresa) or (:empresa = '#39#39'))'
      ''
      'order by'
      '    pessoa_nome'
      '  , pessoa_cpf_cnpj')
    Left = 96
    Top = 264
    ParamData = <
      item
        Position = 1
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end>
  end
  object DspRelacaoContratos: TDataSetProvider
    DataSet = QryRelacaoContratos
    Left = 128
    Top = 264
  end
  object CdsRelacaoContratos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 18
      end>
    ProviderName = 'DspRelacaoContratos'
    Left = 160
    Top = 264
  end
  object frdsRelacaoContratos: TfrxDBDataset
    UserName = 'frdsRelacaoContratos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CONTROLE=CONTROLE'
      'EMPRESA=EMPRESA'
      'EMPRESA_=EMPRESA_'
      'EMPRESA_FANTASIA=EMPRESA_FANTASIA'
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'NUMERO=NUMERO'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_VALIDADE=DATA_VALIDADE'
      'DESTINO=DESTINO'
      'DESTINO_=DESTINO_'
      'CLIENTE=CLIENTE'
      'FORNECEDOR=FORNECEDOR'
      'PESSOA_CONTRATO=PESSOA_CONTRATO'
      'PESSOA_FISICA=PESSOA_FISICA'
      'PESSOA_NOME=PESSOA_NOME'
      'PESSOA_CPF_CNPJ=PESSOA_CPF_CNPJ'
      'SITUACAO=SITUACAO'
      'SITUACAO_=SITUACAO_'
      'OBSERVACOES=OBSERVACOES'
      'ITENS=ITENS'
      'QUANTIDADES=QUANTIDADES'
      'VALOR_TOTAL=VALOR_TOTAL'
      'SALDO_QTDE=SALDO_QTDE'
      'SALDO_TOTAL=SALDO_TOTAL'
      'USUARIO=USUARIO'
      'USUARIO_=USUARIO_'
      'DATA_CADASTRO=DATA_CADASTRO'
      'DATA_ATUALIZACAO=DATA_ATUALIZACAO')
    DataSet = CdsRelacaoContratos
    BCDToCurrency = True
    DataSetOptions = []
    Left = 192
    Top = 264
  end
  object frRelacaoContratos: TfrxReport
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
    ReportOptions.LastChange = 45301.965179317130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 224
    Top = 264
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdsRelacaoContratos
        DataSetName = 'frdsRelacaoContratos'
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
        Name = ' Valores'
        Value = Null
      end
      item
        Name = 'ValorApresentado'
        Value = 
          'IIF(<frdsRelacaoCheque."STATUS">=1,<frdsRelacaoCheque."VALOR">,0' +
          '.0)'
      end
      item
        Name = 'ValorDevolvido'
        Value = 
          'IIF(<frdsRelacaoCheque."STATUS">=2,<frdsRelacaoCheque."VALOR">,0' +
          '.0)'
      end
      item
        Name = 'ValorCompensado'
        Value = 
          'IIF(<frdsRelacaoCheque."STATUS">=8,<frdsRelacaoCheque."VALOR">,0' +
          '.0)'
      end
      item
        Name = 'ValorCancelado'
        Value = 
          'IIF(<frdsRelacaoCheque."STATUS">=9,<frdsRelacaoCheque."VALOR">,0' +
          '.0)'
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
        Height = 139.842610000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
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
          Width = 665.197280000000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 665.196850393700800000
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
          Width = 665.196850393700800000
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
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 933.543910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Periodo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 665.196850393700800000
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
        Top = 514.016080000000000000
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
          Top = 15.118119999999980000
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
      object BndGrpHeaderStatus: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        Condition = 'frdsRelacaoContratos."EMPRESA"'
        ReprintOnNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 918.425790000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
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
            ' [frdsRelacaoContratos."EMPRESA_"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          CharSpacing = 2.000000000000000000
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
            ' Empresa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 18.897650000000000000
          Width = 744.567410000000000000
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
            'Dados do Cheque')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 944.882500000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
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
            'Saldo (R$) ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 18.897650000000000000
          Width = 257.007976540000000000
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
            'Cliente / Fornecedor')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 37.795300000000000000
          Width = 83.149586770000000000
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
            ' N'#250'mero')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 37.795300000000000000
          Width = 83.149586770000000000
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
            ' Emiss'#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 778.583180000000000000
          Top = 37.795299999999940000
          Width = 83.149586770000000000
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
            ' Devolu'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 861.732840000000000000
          Top = 37.795300000000000000
          Width = 83.149586770000000000
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
            ' Compensa'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 45.354360000000000000
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
            '#')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 37.795300000000000000
          Width = 83.149586770000000000
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
            ' Validade')
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
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        DataSet = frdsRelacaoContratos
        DataSetName = 'frdsRelacaoContratos'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 944.882500000000000000
          Width = 102.047310000000000000
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
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoContratos."SITUACAO"> = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdsRelacaoContratos."SALDO_TOTAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
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
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoContratos."SITUACAO"> = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdsRelacaoContratos."PESSOA_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Width = 83.149596540000000000
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
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoContratos."SITUACAO"> = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdsRelacaoContratos."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Width = 83.149660000000000000
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
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoContratos."SITUACAO"> = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <frdsRelacaoContratos."DATA_EMISS' +
              'AO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 778.583180000000000000
          Width = 83.149660000000000000
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
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdsRelacaoCheque."DATA_DEVOLUCAO">=0,'#39#39',FormatDateTime('#39 +
              'dd/mm/yyyy'#39', <frdsRelacaoCheque."DATA_DEVOLUCAO">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 861.732840000000000000
          Width = 83.149660000000000000
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
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoCheque."STATUS">=2'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdsRelacaoCheque."DATA_COMPENSACAO">=0,'#39#39',FormatDateTime' +
              '('#39'dd/mm/yyyy'#39', <frdsRelacaoCheque."DATA_COMPENSACAO">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354360000000000000
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
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoContratos."SITUACAO"> = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39'###00000'#39',<frdsRelacaoContratos."CONTROLE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 83.149660000000000000
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
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdsRelacaoContratos."SITUACAO"> = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39', <frdsRelacaoContratos."DATA_VALID' +
              'ADE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterStatus: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 340.157700000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 944.882500000000000000
          Width = 102.047310000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdsRelacaoContratos."SALDO_TOTAL">,Bn' +
              'dMasterData))] ')
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
        Height = 64.252010000000000000
        Top = 427.086890000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 782.362710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' * Os valores totais apresentados est'#227'o de acordo com o per'#237'odo ' +
              'e a situa'#231#227'o dos cheques informados')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Top = 18.897650000000000000
          Width = 162.519790000000000000
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
            
              '[FormatFloat('#39',0.00'#39',SUM((<frdsRelacaoCheque."VALOR">),BndMaster' +
              'Data,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Top = 18.897650000000000000
          Width = 102.047246540000000000
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
            'Cadastrados : ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Width = 264.567036540000000000
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
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' ** Registros de contrato em edi'#231#227'o')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 884.410020000000000000
          Top = 37.795300000000000000
          Width = 162.519790000000000000
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
            '[FormatFloat('#39',0.00'#39',SUM((<ValorCompensado>),BndMasterData,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362710000000000000
          Top = 37.795300000000000000
          Width = 102.047244090000000000
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
            'Saldos : ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object ACBrExtenso: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 52
    Top = 41
  end
end
