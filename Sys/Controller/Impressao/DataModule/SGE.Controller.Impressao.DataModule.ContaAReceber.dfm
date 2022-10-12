object DataModuleContaAReceber: TDataModuleContaAReceber
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 698
  Width = 608
  object FrReciboA4: TfrxReport
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
    Left = 152
    Top = 88
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdRecibo
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
        Child = FrReciboA4.BndChildAssinatura
        DataSet = FrdRecibo
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
            315C716A5C66305C66733230205265636562656D6F7320646F20636C69656E74
            65205C62205B46726452656369626F2E224E4F4D455F434C49454E5445225D5C
            623020206120696D706F72745C2765326E636961206465205C62205B46726452
            656369626F2E2256414C4F525F42414958415F455854454E534F225D5C623020
            207265666572656E7465205C276530205C62205B46726452656369626F2E2248
            4953544F5249434F225D2E205C6230205B494946283C46726452656369626F2E
            224241495841444F223E3D302C2027272C2027506F7220657374652064616D6F
            732071756974615C2765375C2765336F20746F74616C20646F206C616E5C2765
            37616D65746F2027202B20466F726D6174466C6F6174282730303030272C203C
            46726452656369626F2E22414E4F4C414E43223E29202B20272F27202B20466F
            726D6174466C6F6174282723232330303030303030272C203C46726452656369
            626F2E224E554D4C414E43223E29202B20272E27295D5C7061720D0A7D0D0A00}
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
  object FrReciboA5: TfrxReport
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
    Left = 152
    Top = 136
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdRecibo
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
        Child = FrReciboA5.BndChildAssinatura
        DataSet = FrdRecibo
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
            315C716A5C66305C66733230205265636562656D6F7320646F20636C69656E74
            65205C62205B46726452656369626F2E224E4F4D455F434C49454E5445225D5C
            623020206120696D706F72745C2765326E636961206465205C62205B46726452
            656369626F2E2256414C4F525F42414958415F455854454E534F225D5C623020
            207265666572656E7465205C276530205C62205B46726452656369626F2E2248
            4953544F5249434F225D2E5C623020205B494946283C46726452656369626F2E
            224241495841444F223E3D302C2027272C2027506F7220657374652064616D6F
            732071756974615C2765375C2765336F20746F74616C20646F206C616E5C2765
            37616D65746F2027202B20466F726D6174466C6F6174282730303030272C203C
            46726452656369626F2E22414E4F4C414E43223E29202B20272F27202B20466F
            726D6174466C6F6174282723232330303030303030272C203C46726452656369
            626F2E224E554D4C414E43223E29202B20272E27295D5C7061720D0A7D0D0A00}
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
  object FrdRecibo: TfrxDBDataset
    UserName = 'FrdRecibo'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ANOLANC=ANOLANC'
      'NUMLANC=NUMLANC'
      'PARCELA=PARCELA'
      'CLIENTE=CLIENTE'
      'RZSOC=EMPRESA'
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'NOME=NOME_CLIENTE'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'TIPPAG=TIPPAG'
      'DTEMISS=DTEMISS'
      'DTVENC=DTVENC'
      'DTREC=DTREC'
      'VALORREC=VALORREC'
      'BANCO=BANCO'
      'BCO_NOME=BCO_NOME'
      'NUMERO_CHEQUE=NUMERO_CHEQUE'
      'PAGO_=PAGO_'
      'DOCBAIX=DOCBAIX'
      'BAIXADO=BAIXADO'
      'SEQ=SEQ'
      'DATA_PAGTO=DATA_PAGTO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'HISTORICO=HISTORICO'
      'VALOR_BAIXA=VALOR_BAIXA'
      'VALOR_BAIXA_EXTENSO=VALOR_BAIXA_EXTENSO')
    DataSet = CdsRecibo
    BCDToCurrency = True
    Left = 152
    Top = 329
  end
  object ACBrExtenso: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 32
    Top = 25
  end
  object CdsRecibo: TClientDataSet
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
    ProviderName = 'DspRecibo'
    OnCalcFields = CdsReciboCalcFields
    Left = 152
    Top = 281
    object CdsReciboANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Required = True
    end
    object CdsReciboNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Required = True
    end
    object CdsReciboPARCELA: TSmallintField
      FieldName = 'PARCELA'
    end
    object CdsReciboCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object CdsReciboRZSOC: TStringField
      FieldName = 'RZSOC'
      ReadOnly = True
      Size = 60
    end
    object CdsReciboEMPRESA_CNPJ: TStringField
      FieldName = 'EMPRESA_CNPJ'
      ReadOnly = True
      Size = 18
    end
    object CdsReciboNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 100
    end
    object CdsReciboPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      ReadOnly = True
    end
    object CdsReciboCNPJ: TStringField
      FieldName = 'CNPJ'
      ReadOnly = True
      Size = 18
    end
    object CdsReciboTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Size = 35
    end
    object CdsReciboDTEMISS: TDateField
      FieldName = 'DTEMISS'
    end
    object CdsReciboDTVENC: TDateField
      FieldName = 'DTVENC'
    end
    object CdsReciboDTREC: TDateField
      FieldName = 'DTREC'
    end
    object CdsReciboBANCO: TSmallintField
      FieldName = 'BANCO'
      ReadOnly = True
    end
    object CdsReciboBCO_NOME: TStringField
      FieldName = 'BCO_NOME'
      ReadOnly = True
      Size = 50
    end
    object CdsReciboNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      ReadOnly = True
      Size = 30
    end
    object CdsReciboPAGO_: TStringField
      FieldName = 'PAGO_'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object CdsReciboDOCBAIX: TStringField
      FieldName = 'DOCBAIX'
      Size = 15
    end
    object CdsReciboBAIXADO: TSmallintField
      FieldName = 'BAIXADO'
      Required = True
    end
    object CdsReciboSEQ: TSmallintField
      FieldName = 'SEQ'
      ReadOnly = True
    end
    object CdsReciboDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      ReadOnly = True
    end
    object CdsReciboFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      ReadOnly = True
    end
    object CdsReciboFORMA_PAGTO_DESC: TStringField
      FieldName = 'FORMA_PAGTO_DESC'
      ReadOnly = True
      Size = 30
    end
    object CdsReciboHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      ReadOnly = True
      BlobType = ftMemo
    end
    object CdsReciboVALORREC: TFMTBCDField
      FieldName = 'VALORREC'
      Precision = 18
      Size = 2
    end
    object CdsReciboVALOR_BAIXA: TFMTBCDField
      FieldName = 'VALOR_BAIXA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object CdsReciboVALOR_BAIXA_EXTENSO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_BAIXA_EXTENSO'
      Size = 250
    end
  end
  object DspRecibo: TDataSetProvider
    DataSet = fdQryRecibo
    Left = 152
    Top = 233
  end
  object fdQryRecibo: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.Numlanc'
      '  , r.Parcela'
      '  , r.cliente'
      '  , e.rzsoc'
      '  , e.cnpj as empresa_cnpj'
      '  , c.nome'
      '  , c.pessoa_fisica'
      '  , c.cnpj'
      '  , r.Tippag'
      '  , r.Dtemiss'
      '  , r.Dtvenc'
      '  , r.dtrec'
      '  , r.Valorrec'
      '  , bx.banco'
      '  , b.Bco_nome'
      '  , bx.numero_cheque'
      '  , Case when r.baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , r.Docbaix'
      '  , r.baixado'
      ''
      '  , bx.seq'
      '  , bx.data_pagto'
      '  , bx.forma_pagto'
      '  , fp.descri as forma_pagto_desc'
      '  , bx.historico'
      '  , bx.valor_baixa'
      'from TBCONTREC r'
      '  inner join TBEMPRESA e on (e.cnpj = r.empresa)'
      '  inner join TBCLIENTE c on (c.codigo = r.cliente)'
      
        '  inner join TBCONTREC_BAIXA bx on (bx.anolanc = r.anolanc and b' +
        'x.numlanc = r.numlanc)'
      
        '  left join TBBANCO_BOLETO b on (b.Bco_cod = bx.banco and b.empr' +
        'esa = r.empresa)'
      '  left join TBFORMPAGTO fp on (fp.cod = bx.forma_pagto)'
      ''
      'where r.anolanc = :ano'
      '  and r.numlanc = :numero'
      '  and bx.seq    = :baixa')
    Left = 152
    Top = 184
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
