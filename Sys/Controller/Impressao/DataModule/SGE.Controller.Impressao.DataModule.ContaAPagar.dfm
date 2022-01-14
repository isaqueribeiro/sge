object DataModuleContaAPagar: TDataModuleContaAPagar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 574
  Width = 517
  object FrReciboPagamentoA4: TfrxReport
    Version = '6.3.7'
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
    OnGetValue = ReciboGetValue
    Left = 104
    Top = 104
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdReciboPagamento
        DataSetName = 'FrdRecibo'
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
        Frame.Typ = []
        Height = 162.519790000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Child = FrReciboPagamentoA4.BndChildAssinatura
        DataSet = FrdReciboPagamento
        DataSetName = 'FrdRecibo'
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
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C716A5C66305C66733230205265636562656D6F73206461205C62205B6672
            64456D70726573612E22525A534F43225D5C623020206120696D706F72745C27
            65326E636961206465205C62205B46726452656369626F2E2256414C4F525F42
            414958415F455854454E534F225D5C623020207265666572656E7465205C2765
            30205C62205B46726452656369626F2E22484953544F5249434F225D202D2028
            4C616E5C276537616D656E746F205B46726452656369626F2E22414E4F4C414E
            43225D2F5B466F726D6174466C6F617428273030303030272C3C467264526563
            69626F2E224E554D4C414E43223E295D2E505B466F726D6174466C6F61742827
            3030272C3C46726452656369626F2E2250415243454C41223E295D295C623020
            2E5C7061720D0A7D0D0A00}
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
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
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
            
              ' [IIF(<FrdRecibo."PESSOA_FISICA">=1,'#39'CPF'#39','#39'CNPJ'#39')]: [IIF(<FrdRec' +
              'ibo."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###-##;0;'#39',<FrdRe' +
              'cibo."CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdRecibo.' +
              '"CNPJ">))]')
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
            ' [FrdRecibo."NOMEFORN"]')
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
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
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
  object FrReciboPagamentoA5: TfrxReport
    Version = '6.3.7'
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
    OnGetValue = ReciboGetValue
    Left = 104
    Top = 152
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdReciboPagamento
        DataSetName = 'FrdRecibo'
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
        Frame.Typ = []
        Height = 162.519790000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Child = FrReciboPagamentoA5.BndChildAssinatura
        DataSet = FrdReciboPagamento
        DataSetName = 'FrdRecibo'
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
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
            6965776B696E64345C756331200D0A5C706172645C6669313030305C6C693134
            305C72693138305C73623132305C73613132305C736C3336305C736C6D756C74
            315C716A5C66305C66733230205265636562656D6F73206461205C62205B6672
            64456D70726573612E22525A534F43225D5C623020206120696D706F72745C27
            65326E636961206465205C62205B46726452656369626F2E2256414C4F525F42
            414958415F455854454E534F225D5C623020207265666572656E7465205C2765
            30205C62205B46726452656369626F2E22484953544F5249434F225D202D2028
            4C616E5C276537616D656E746F205B46726452656369626F2E22414E4F4C414E
            43225D2F5B466F726D6174466C6F617428273030303030272C3C467264526563
            69626F2E224E554D4C414E43223E295D2E505B466F726D6174466C6F61742827
            3030272C3C46726452656369626F2E2250415243454C41223E295D295C623020
            2E5C7061720D0A7D0D0A00}
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
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
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
            
              ' [IIF(<FrdRecibo."PESSOA_FISICA">=1,'#39'CPF'#39','#39'CNPJ'#39')]: [IIF(<FrdRec' +
              'ibo."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###-##;0;'#39',<FrdRe' +
              'cibo."CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdRecibo.' +
              '"CNPJ">))]')
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
            ' [FrdRecibo."NOMEFORN"]')
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
            67656E657261746F722052696368656432302031302E302E31393034317D5C76
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
  object FrdReciboPagamento: TfrxDBDataset
    UserName = 'FrdRecibo'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ANOLANC=ANOLANC'
      'NUMLANC=NUMLANC'
      'PARCELA=PARCELA'
      'CODFORN=CODFORN'
      'NOMEEMP=NOMEEMP'
      'NOMEFORN=NOMEFORN'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'NOTFISC=NOTFISC'
      'TIPPAG=TIPPAG'
      'DTEMISS=DTEMISS'
      'DTVENC=DTVENC'
      'DTPAG=DTPAG'
      'VALORPAG=VALORPAG'
      'BANCO=BANCO'
      'BCO_NOME=BCO_NOME'
      'NUMCHQ=NUMCHQ'
      'PAGO_=PAGO_'
      'DOCBAIX=DOCBAIX'
      'QUITADO=QUITADO'
      'CODTPDESP=CODTPDESP'
      'SEQ=SEQ'
      'DATA_PAGTO=DATA_PAGTO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'HISTORICO=HISTORICO'
      'VALOR_BAIXA=VALOR_BAIXA'
      'VALOR_BAIXA_EXTENSO=VALOR_BAIXA_EXTENSO')
    DataSet = cdsReciboPagamento
    BCDToCurrency = True
    Left = 104
    Top = 344
  end
  object ACBrExtenso: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 32
    Top = 24
  end
  object cdsReciboPagamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'baixa'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspReciboPagamento'
    OnCalcFields = cdsReciboPagamentoCalcFields
    Left = 104
    Top = 296
    object cdsReciboPagamentoANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Required = True
    end
    object cdsReciboPagamentoNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Required = True
    end
    object cdsReciboPagamentoPARCELA: TSmallintField
      FieldName = 'PARCELA'
    end
    object cdsReciboPagamentoCODFORN: TSmallintField
      FieldName = 'CODFORN'
    end
    object cdsReciboPagamentoNOMEEMP: TStringField
      FieldName = 'NOMEEMP'
      Size = 60
    end
    object cdsReciboPagamentoNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      ReadOnly = True
      Size = 100
    end
    object cdsReciboPagamentoPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      ReadOnly = True
    end
    object cdsReciboPagamentoCNPJ: TStringField
      FieldName = 'CNPJ'
      ReadOnly = True
      Size = 18
    end
    object cdsReciboPagamentoNOTFISC: TStringField
      FieldName = 'NOTFISC'
      Size = 15
    end
    object cdsReciboPagamentoTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Size = 35
    end
    object cdsReciboPagamentoDTEMISS: TDateField
      FieldName = 'DTEMISS'
    end
    object cdsReciboPagamentoDTVENC: TDateField
      FieldName = 'DTVENC'
    end
    object cdsReciboPagamentoDTPAG: TDateField
      FieldName = 'DTPAG'
    end
    object cdsReciboPagamentoBANCO: TSmallintField
      FieldName = 'BANCO'
    end
    object cdsReciboPagamentoBCO_NOME: TStringField
      FieldName = 'BCO_NOME'
      ReadOnly = True
      Size = 50
    end
    object cdsReciboPagamentoNUMCHQ: TStringField
      FieldName = 'NUMCHQ'
      Size = 10
    end
    object cdsReciboPagamentoPAGO_: TStringField
      FieldName = 'PAGO_'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsReciboPagamentoDOCBAIX: TStringField
      FieldName = 'DOCBAIX'
      Size = 15
    end
    object cdsReciboPagamentoQUITADO: TSmallintField
      FieldName = 'QUITADO'
      Required = True
    end
    object cdsReciboPagamentoCODTPDESP: TSmallintField
      FieldName = 'CODTPDESP'
    end
    object cdsReciboPagamentoSEQ: TSmallintField
      FieldName = 'SEQ'
      ReadOnly = True
    end
    object cdsReciboPagamentoDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      ReadOnly = True
    end
    object cdsReciboPagamentoFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      ReadOnly = True
    end
    object cdsReciboPagamentoFORMA_PAGTO_DESC: TStringField
      FieldName = 'FORMA_PAGTO_DESC'
      ReadOnly = True
      Size = 30
    end
    object cdsReciboPagamentoHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      ReadOnly = True
      BlobType = ftMemo
    end
    object cdsReciboPagamentoVALORPAG: TFMTBCDField
      FieldName = 'VALORPAG'
      Precision = 18
      Size = 2
    end
    object cdsReciboPagamentoVALOR_BAIXA: TFMTBCDField
      FieldName = 'VALOR_BAIXA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsReciboPagamentoVALOR_BAIXA_EXTENSO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_BAIXA_EXTENSO'
      Size = 250
    end
  end
  object dspReciboPagamento: TDataSetProvider
    DataSet = qryReciboPagamento
    Left = 104
    Top = 248
  end
  object qryReciboPagamento: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.Parcela'
      '  , p.Codforn'
      '  , p.Nomeemp'
      '  , f.Nomeforn'
      '  , f.pessoa_fisica'
      '  , f.Cnpj'
      '  , p.Notfisc'
      '  , p.Tippag'
      '  , p.Dtemiss'
      '  , p.Dtvenc'
      '  , p.Dtpag'
      '  , p.Valorpag'
      '  , p.Banco'
      '  , b.Bco_nome'
      '  , p.Numchq'
      '  , Case when p.Quitado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , p.Docbaix'
      '  , p.Quitado'
      '  , p.Codtpdesp'
      ''
      '  , bx.seq'
      '  , bx.data_pagto'
      '  , bx.forma_pagto'
      '  , fp.descri as forma_pagto_desc'
      '  , bx.historico'
      '  , bx.valor_baixa'
      'from TBCONTPAG p'
      '  inner join TBFORNECEDOR f on (f.Codforn = p.Codforn)'
      
        '  inner join TBCONTPAG_BAIXA bx on (bx.anolanc = p.anolanc and b' +
        'x.numlanc = p.numlanc)'
      
        '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco and b.empre' +
        'sa = p.empresa)'
      '  left join TBFORMPAGTO fp on (fp.cod = bx.forma_pagto)'
      ''
      'where p.anolanc = :ano'
      '  and p.numlanc = :numero'
      '  and bx.seq    = :baixa')
    Left = 104
    Top = 200
    ParamData = <
      item
        Position = 1
        Name = 'ano'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Position = 2
        Name = 'numero'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Position = 3
        Name = 'baixa'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
end
