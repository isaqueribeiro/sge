object DataModuleCotacaoCompra: TDataModuleCotacaoCompra
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object qryCotacaoCompra: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codigo'
      '  , c.numero'
      '  , c.tipo'
      '  , case c.tipo'
      '      when 1 then '#39'Compra'#39
      '      when 2 then '#39'Servi'#231'o'#39
      '      when 3 then '#39'Compra/Servi'#231'o'#39
      '    end as tipo_desc'
      '  , c.status'
      '  , case c.status'
      '      when 0 then '#39'Em Edi'#231#227'o'#39
      '      when 1 then '#39'Aberta'#39
      '      when 2 then '#39'Em Cota'#231#227'o'#39
      '      when 3 then '#39'Autorizada/Encerrada'#39
      '      when 4 then '#39'Cancelada'#39
      '    end as status_desc'
      '  , c.empresa'
      '  , c.emissao_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = c.emissao_usuario)    as usuario_emissor'
      '  , c.autorizada_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = c.autorizada_usuario) as usuario_autorizador'
      '  , c.descricao_resumo'
      '  , c.nome_contato_int'
      '  , c.movito'
      '  , c.observacao'
      '  , c.log_evento'
      '  , c.valor_ref_total'
      '  , c.valor_max_bruto'
      '  , c.valor_max_desconto'
      '  , c.valor_max_total'
      '  , c.valor_min_bruto'
      '  , c.valor_min_desconto'
      '  , c.valor_min_total'
      '  , c.valor_media_bruto'
      '  , c.valor_media_desconto'
      '  , c.valor_media_total'
      ''
      '  , i.seq'
      '  , i.produto'
      '  , p.descri'
      '  , p.descri_apresentacao'
      '  , p.referencia'
      '  , i.quantidade'
      
        '  , coalesce(nullif(Trim(u.unp_sigla), '#39#39'), u.unp_descricao) as ' +
        'unidade'
      '  , i.valor_unitario_ref'
      '  , i.valor_total_ref'
      '  , i.valor_unitario_max'
      '  , i.valor_total_max'
      '  , i.valor_unitario_min'
      '  , i.valor_total_min'
      '  , i.valor_unitario_media'
      '  , i.valor_total_media'
      'from TBCOTACAO_COMPRA c'
      
        '  inner join TBCOTACAO_COMPRAITEM i on (i.ano = c.ano and i.codi' +
        'go = c.codigo and i.empresa = c.empresa)'
      '  inner join TBPRODUTO p on (p.cod = i.produto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)'
      ''
      'where c.ano    = :ano'
      '  and c.codigo = :cod'
      '  and c.empresa    = :emp')
    Left = 176
    Top = 144
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EMP'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end>
  end
  object frdCotacaoCompra: TfrxDBDataset
    UserName = 'frdCotacaoCompra'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODIGO=CODIGO'
      'NUMERO=NUMERO'
      'TIPO=TIPO'
      'TIPO_DESC=TIPO_DESC'
      'STATUS=STATUS'
      'STATUS_DESC=STATUS_DESC'
      'EMPRESA=EMPRESA'
      'EMISSAO_DATA=EMISSAO_DATA'
      'USUARIO_EMISSOR=USUARIO_EMISSOR'
      'AUTORIZADA_DATA=AUTORIZADA_DATA'
      'USUARIO_AUTORIZADOR=USUARIO_AUTORIZADOR'
      'DESCRICAO_RESUMO=DESCRICAO_RESUMO'
      'NOME_CONTATO_INT=NOME_CONTATO_INT'
      'MOVITO=MOVITO'
      'OBSERVACAO=OBSERVACAO'
      'LOG_EVENTO=LOG_EVENTO'
      'VALOR_REF_TOTAL=VALOR_REF_TOTAL'
      'VALOR_MAX_BRUTO=VALOR_MAX_BRUTO'
      'VALOR_MAX_DESCONTO=VALOR_MAX_DESCONTO'
      'VALOR_MAX_TOTAL=VALOR_MAX_TOTAL'
      'VALOR_MIN_BRUTO=VALOR_MIN_BRUTO'
      'VALOR_MIN_DESCONTO=VALOR_MIN_DESCONTO'
      'VALOR_MIN_TOTAL=VALOR_MIN_TOTAL'
      'VALOR_MEDIA_BRUTO=VALOR_MEDIA_BRUTO'
      'VALOR_MEDIA_DESCONTO=VALOR_MEDIA_DESCONTO'
      'VALOR_MEDIA_TOTAL=VALOR_MEDIA_TOTAL'
      'SEQ=SEQ'
      'PRODUTO=PRODUTO'
      'DESCRI=DESCRI'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'REFERENCIA=REFERENCIA'
      'QUANTIDADE=QUANTIDADE'
      'UNIDADE=UNIDADE'
      'VALOR_UNITARIO_REF=VALOR_UNITARIO_REF'
      'VALOR_TOTAL_REF=VALOR_TOTAL_REF'
      'VALOR_UNITARIO_MAX=VALOR_UNITARIO_MAX'
      'VALOR_TOTAL_MAX=VALOR_TOTAL_MAX'
      'VALOR_UNITARIO_MIN=VALOR_UNITARIO_MIN'
      'VALOR_TOTAL_MIN=VALOR_TOTAL_MIN'
      'VALOR_UNITARIO_MEDIA=VALOR_UNITARIO_MEDIA'
      'VALOR_TOTAL_MEDIA=VALOR_TOTAL_MEDIA')
    DataSet = qryCotacaoCompra
    BCDToCurrency = False
    DataSetOptions = []
    Left = 208
    Top = 144
  end
  object frrCotacaoCompra: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 45820.569583668980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportsGetValue
    Left = 240
    Top = 144
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdCotacaoCompra
        DataSetName = 'frdCotacaoCompra'
      end
      item
        DataSet = frdCotacaoCompraFornecedor
        DataSetName = 'frdCotacaoCompraFornecedor'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object bndReportTitle: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 116.858380000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdVendaCODCONTROL: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdCotacaoCompra."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'N '#250' m e r o   C o n t r o l e :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Trim(<frdCotacaoCompra."STATUS_DESC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frdEmpresa."NMFANT"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
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
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[frdEmpresa."HOME_PAGE"][IIF(Trim(<frdEmpresa."HOME_PAGE">)='#39#39',<' +
              'frdEmpresa."EMAIL">,IIF(Trim(<frdEmpresa."EMAIL">)='#39#39','#39#39','#39' / '#39'+<' +
              'frdEmpresa."EMAIL">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Top = 90.708720000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          CharSpacing = 4.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[Trim('#39'COTA'#199#195'O DE '#39' + Uppercase(<frdCotacaoCompra."TIPO_DESC">))' +
              ']')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        DataSet = frdCotacaoCompra
        DataSetName = 'frdCotacaoCompra'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompra."PRODUTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensSEQ: TfrxMemoView
          AllowVectorExport = True
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 419.527659130000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompra."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.###'#39',<frdCotacaoCompra."QUANTIDADE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompra."UNIDADE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 710.551640000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 589.606680000000000000
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
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 589.606680000000000000
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
      end
      object bndHeader: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 143.622140000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          AllowVectorExport = True
          Top = 79.370130000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompraFornecedor."NOMEFORN"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 68.031540000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Fornecedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 68.031540000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' CPF/CNPJ.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 79.370130000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [IIF(<frdCotacaoCompraFornecedor."CNPJ">='#39#39','#39#39',IIF(<frdCotacaoC' +
              'ompraFornecedor."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###-#' +
              '#;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">),FormatMaskText('#39'##.##' +
              '#.###/####-##;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">)))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 68.031540000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Data: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 79.370130000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdCotacaoCompra."EMISSAO_DATA">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 128.504020000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'T O T A L ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 128.504020000000000000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 143.622140000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Top = 128.504020000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 128.504020000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' C'#243'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 128.504020000000000000
          Width = 419.527659130000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' Descri'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Top = 98.267780000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Endere'#231'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Top = 128.504020000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' Und.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 128.504020000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'V. Un. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompraFornecedor."NOME_CONTATO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Att.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompra."DESCRICAO_RESUMO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            ' Descri'#231#227'o resumo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 245.669450000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        Stretched = True
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 480.000310000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 139.842610000000000000
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<frdCotacaoCompraFornecedor."NOMEFORN">='#39#39','#39'Fornecedor'#39',<fr' +
              'dCotacaoCompraFornecedor."NOMEFORN">)]'
            
              '[IIF(<frdCotacaoCompraFornecedor."CNPJ">='#39#39','#39'CPF/CNPJ:'#39',IIF(<frd' +
              'CotacaoCompraFornecedor."PESSOA_FISICA">=1,FormatMaskText('#39'###.#' +
              '##.###-##;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">),FormatMaskTex' +
              't('#39'##.###.###/####-##;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">)))' +
              ']')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Top = 68.031540000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompra."USUARIO_AUTORIZADOR"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Autorizador:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompraFornecedor."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Forma de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 37.795300000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompraFornecedor."CONDICAP_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 26.456710000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Condi'#231#227'o de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 68.031540000000000000
          Width = 102.047248980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 56.692950000000000000
          Width = 102.047248980000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            ' Total Bruto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Top = 68.031540000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            ' Desconto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 68.031540000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 56.692950000000000000
          Width = 117.165430000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            ' Total L'#237'quido: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 192.756030000000000000
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<frdCotacaoCompraFornecedor."OBSERVACAO">='#39#39',<frdCotacaoCom' +
              'pra."OBSERVACAO">,<frdCotacaoCompraFornecedor."OBSERVACAO">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 177.637910000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Observa'#231#245'es Gerais:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frrCotacaoCompraMapaPreco: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 45820.570322847220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportsGetValue
    Left = 272
    Top = 144
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdCotacaoCompra
        DataSetName = 'frdCotacaoCompra'
      end
      item
        DataSet = frdCotacaoCompraFornecedor
        DataSetName = 'frdCotacaoCompraFornecedor'
      end
      item
        DataSet = frdCotacaoCompraFornecedorItem
        DataSetName = 'frdCotacaoCompraFornecedorItem'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
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
      object bndReportTitle: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 116.858380000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object frdVendaCODCONTROL: TfrxMemoView
          AllowVectorExport = True
          Left = 888.189550000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdCotacaoCompra."NUMERO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 888.189550000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'N '#250' m e r o   C o n t r o l e :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 888.189550000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Trim(<frdCotacaoCompra."STATUS_DESC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frdEmpresa."NMFANT"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
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
          Top = 83.149660000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              '[frdEmpresa."HOME_PAGE"][IIF(Trim(<frdEmpresa."HOME_PAGE">)='#39#39',<' +
              'frdEmpresa."EMAIL">,IIF(Trim(<frdEmpresa."EMAIL">)='#39#39','#39#39','#39' / '#39'+<' +
              'frdEmpresa."EMAIL">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Top = 90.708720000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          CharSpacing = 4.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[Trim('#39'COTA'#199#195'O DE '#39' + Uppercase(<frdCotacaoCompra."TIPO_DESC">))' +
              ']')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 268.346630000000000000
        Width = 1046.929810000000000000
        DataSet = frdCotacaoCompraFornecedor
        DataSetName = 'frdCotacaoCompraFornecedor'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          AllowVectorExport = True
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [FormatFloat('#39'00000'#39', <frdCotacaoCompraFornecedor."FORNECEDOR">' +
              ')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Width = 321.259879130000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCotacaoCompraFornecedor."NOMEFORN"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 963.780150000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdCotacaoCompraFornecedor."VALOR_TOTAL_LI' +
              'QUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdCotacaoCompraFornecedor."CNPJ">='#39#39','#39#39',IIF(<frdCotacaoC' +
              'ompraFornecedor."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###-#' +
              '#;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">),FormatMaskText('#39'##.##' +
              '#.###/####-##;0;'#39',<frdCotacaoCompraFornecedor."CNPJ">)))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 808.819420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdCotacaoCompraFornecedor."VALOR_TOTAL_BR' +
              'UTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 888.189550000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdCotacaoCompraFornecedor."VALOR_TOTAL_DE' +
              'SCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCotacaoCompraFornecedor."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 653.858690000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = 10485760
          Highlight.Font.Height = -11
          Highlight.Font.Name = 'Calibri'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdCotacaoCompraFornecedor."VENCEDOR">=1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdCotacaoCompraFornecedor."CONDICAP_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 532.913730000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 918.425790000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 918.425790000000000000
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
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 918.425790000000000000
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
      end
      object bndHeader: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 49.133890000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 1046.929810000000000000
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 963.780150000000000000
          Top = 34.015770000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'T. L'#237'quido ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Top = 34.015770000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' C'#243'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 34.015770000000000000
          Width = 321.259879130000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' Nome / Raz'#227'o Social')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Top = 11.338590000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [frdCotacaoCompra."DESCRICAO_RESUMO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            ' Descri'#231#227'o resumo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 34.015770000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' CPF/CNPJ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 888.189550000000000000
          Top = 34.015770000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 808.819420000000000000
          Top = 34.015770000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'T. Bruto ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 34.015770000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' Forma de Pagamento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 653.858690000000000000
          Top = 34.015770000000000000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' Condi'#231#227'o de Pagamento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterDataMapa: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        Height = 129.000000000000000000
        ParentFont = False
        Top = 343.937230000000000000
        Width = 1046.929810000000000000
        RowCount = 0
        object dbCrossMapa: TfrxDBCrossView
          AllowVectorExport = True
          Width = 724.000000000000000000
          Height = 85.000000000000000000
          CellLevels = 2
          DownThenAcross = False
          PlainCells = True
          RowLevels = 6
          ShowColumnTotal = False
          ShowRowTotal = False
          CellFields.Strings = (
            'VALOR_UNITARIO'
            'VALOR_TOTAL')
          ColumnFields.Strings = (
            'FORNECEDOR')
          DataSet = frdCotacaoCompraFornecedorItem
          DataSetName = 'frdCotacaoCompraFornecedorItem'
          RowFields.Strings = (
            'ITEM'
            'DESCRI_APRESENTACAO'
            'QUANTIDADE'
            'UNP_SIGLA'
            'VALOR_UNITARIO_MIN'
            'VALOR_UNITARIO_MAX')
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
            6C6C6D656D6F733E3C546672784D656D6F5669657720416C6C6F77566563746F
            724578706F72743D225472756522204C6566743D223532342220546F703D2234
            31302C3933373233222057696474683D22353822204865696768743D22313822
            205265737472696374696F6E733D2232342220416C6C6F774578707265737369
            6F6E733D2246616C73652220446973706C6179466F726D61742E466F726D6174
            5374723D2225322E326E2220446973706C6179466F726D61742E4B696E643D22
            666B4E756D657269632220466F6E742E436861727365743D22312220466F6E74
            2E436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E
            742E4E616D653D2243616C696272692220466F6E742E5374796C653D22302220
            4672616D652E5479703D22313522204672616D652E57696474683D22302C3122
            20476170583D22332220476170593D2233222048416C69676E3D226861526967
            68742220506172656E74466F6E743D2246616C7365222056416C69676E3D2276
            6143656E7465722220546578743D22302C3030222F3E3C546672784D656D6F56
            69657720416C6C6F77566563746F724578706F72743D225472756522204C6566
            743D223538322220546F703D223431302C3933373233222057696474683D2231
            343222204865696768743D22313822205265737472696374696F6E733D223234
            2220416C6C6F7745787072657373696F6E733D2246616C73652220446973706C
            6179466F726D61742E466F726D61745374723D2225322E326E2220446973706C
            6179466F726D61742E4B696E643D22666B4E756D657269632220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48
            65696768743D222D31312220466F6E742E4E616D653D2243616C696272692220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204672
            616D652E57696474683D22302C312220476170583D22332220476170593D2233
            222048416C69676E3D22686152696768742220506172656E74466F6E743D2246
            616C7365222056416C69676E3D22766143656E7465722220546578743D22302C
            3030222F3E3C546672784D656D6F5669657720416C6C6F77566563746F724578
            706F72743D225472756522204C6566743D223632302220546F703D2237392220
            57696474683D22383522204865696768743D2232322220526573747269637469
            6F6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C7365
            22204672616D652E5479703D2231352220476170583D22332220476170593D22
            33222048416C69676E3D2268615269676874222056416C69676E3D2276614365
            6E7465722220546578743D22222F3E3C546672784D656D6F5669657720416C6C
            6F77566563746F724578706F72743D225472756522204C6566743D2237303522
            20546F703D223739222057696474683D22373022204865696768743D22323222
            205265737472696374696F6E733D2232342220416C6C6F774578707265737369
            6F6E733D2246616C736522204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D226861526967687422205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D65
            6D6F5669657720416C6C6F77566563746F724578706F72743D22547275652220
            4C6566743D223334382220546F703D223838222057696474683D223130382220
            4865696768743D22323222205265737472696374696F6E733D2232342220416C
            6C6F7745787072657373696F6E733D2246616C736522204672616D652E547970
            3D2231352220476170583D22332220476170593D2233222048416C69676E3D22
            68615269676874222056416C69676E3D22766143656E7465722220546578743D
            22222F3E3C546672784D656D6F5669657720416C6C6F77566563746F72457870
            6F72743D225472756522204C6566743D223334382220546F703D223131302220
            57696474683D2231303822204865696768743D22323222205265737472696374
            696F6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C73
            6522204672616D652E5479703D2231352220476170583D22332220476170593D
            2233222048416C69676E3D2268615269676874222056416C69676E3D22766143
            656E7465722220546578743D22222F3E3C546672784D656D6F5669657720416C
            6C6F77566563746F724578706F72743D225472756522204C6566743D22343439
            2220546F703D223838222057696474683D2231303822204865696768743D2232
            3222205265737472696374696F6E733D2232342220416C6C6F77457870726573
            73696F6E733D2246616C736522204672616D652E5479703D2231352220476170
            583D22332220476170593D2233222048416C69676E3D22686152696768742220
            56416C69676E3D22766143656E7465722220546578743D22222F3E3C54667278
            4D656D6F5669657720416C6C6F77566563746F724578706F72743D2254727565
            22204C6566743D223434392220546F703D22313130222057696474683D223130
            3822204865696768743D22323222205265737472696374696F6E733D22323422
            20416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E
            5479703D2231352220476170583D22332220476170593D2233222048416C6967
            6E3D2268615269676874222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C546672784D656D6F5669657720416C6C6F77566563746F72
            4578706F72743D225472756522204C6566743D223239332220546F703D223736
            222057696474683D22363722204865696768743D223139222052657374726963
            74696F6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C
            73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D
            22302220466F6E742E4865696768743D222D31312220466F6E742E4E616D653D
            2243616C696272692220466F6E742E5374796C653D223022204672616D652E54
            79703D2231352220476170583D22332220476170593D2233222048416C69676E
            3D22686152696768742220506172656E74466F6E743D2246616C736522205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D65
            6D6F5669657720416C6C6F77566563746F724578706F72743D22547275652220
            4C6566743D223336302220546F703D223736222057696474683D223734222048
            65696768743D22313922205265737472696374696F6E733D2232342220416C6C
            6F7745787072657373696F6E733D2246616C73652220466F6E742E4368617273
            65743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768
            743D222D31312220466F6E742E4E616D653D2243616C696272692220466F6E74
            2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222048416C69676E3D22686152696768742220506172
            656E74466F6E743D2246616C7365222056416C69676E3D22766143656E746572
            2220546578743D22222F3E3C546672784D656D6F5669657720416C6C6F775665
            63746F724578706F72743D225472756522204C6566743D223433342220546F70
            3D223537222057696474683D22383522204865696768743D2231392220526573
            7472696374696F6E733D2232342220416C6C6F7745787072657373696F6E733D
            2246616C73652220466F6E742E436861727365743D22312220466F6E742E436F
            6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E742E4E
            616D653D2243616C696272692220466F6E742E5374796C653D22302220467261
            6D652E5479703D2231352220476170583D22332220476170593D223322204841
            6C69676E3D22686152696768742220506172656E74466F6E743D2246616C7365
            222056416C69676E3D22766143656E7465722220546578743D22222F3E3C5466
            72784D656D6F5669657720416C6C6F77566563746F724578706F72743D225472
            756522204C6566743D223531392220546F703D223537222057696474683D2237
            3022204865696768743D22313922205265737472696374696F6E733D22323422
            20416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48
            65696768743D222D31312220466F6E742E4E616D653D2243616C696272692220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204761
            70583D22332220476170593D2233222048416C69676E3D226861526967687422
            20506172656E74466F6E743D2246616C7365222056416C69676E3D2276614365
            6E7465722220546578743D22222F3E3C546672784D656D6F5669657720416C6C
            6F77566563746F724578706F72743D225472756522204C6566743D2236343522
            20546F703D223838222057696474683D22383122204865696768743D22323222
            205265737472696374696F6E733D2232342220416C6C6F774578707265737369
            6F6E733D2246616C736522204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D226861526967687422205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D65
            6D6F5669657720416C6C6F77566563746F724578706F72743D22547275652220
            4C6566743D223634352220546F703D22313130222057696474683D2238312220
            4865696768743D22323222205265737472696374696F6E733D2232342220416C
            6C6F7745787072657373696F6E733D2246616C736522204672616D652E547970
            3D2231352220476170583D22332220476170593D2233222048416C69676E3D22
            68615269676874222056416C69676E3D22766143656E7465722220546578743D
            22222F3E3C546672784D656D6F5669657720416C6C6F77566563746F72457870
            6F72743D225472756522204C6566743D223535372220546F703D223838222057
            696474683D22383122204865696768743D22323222205265737472696374696F
            6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C736522
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            222048416C69676E3D2268615269676874222056416C69676E3D22766143656E
            7465722220546578743D22222F3E3C546672784D656D6F5669657720416C6C6F
            77566563746F724578706F72743D225472756522204C6566743D223535372220
            546F703D22313130222057696474683D22383122204865696768743D22323222
            205265737472696374696F6E733D2232342220416C6C6F774578707265737369
            6F6E733D2246616C736522204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D226861526967687422205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D65
            6D6F5669657720416C6C6F77566563746F724578706F72743D22547275652220
            4C6566743D22302220546F703D2230222057696474683D223022204865696768
            743D223022205265737472696374696F6E733D22382220416C6C6F7745787072
            657373696F6E733D2246616C736522204672616D652E5479703D223135222047
            6170583D22332220476170593D2233222048416C69676E3D2268615269676874
            222056416C69676E3D22766143656E7465722220546578743D22222F3E3C5466
            72784D656D6F5669657720416C6C6F77566563746F724578706F72743D225472
            756522204C6566743D22302220546F703D2230222057696474683D2230222048
            65696768743D223022205265737472696374696F6E733D22382220416C6C6F77
            45787072657373696F6E733D2246616C736522204672616D652E5479703D2231
            352220476170583D22332220476170593D2233222048416C69676E3D22686152
            69676874222056416C69676E3D22766143656E7465722220546578743D22222F
            3E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F7274
            3D225472756522204C6566743D223433342220546F703D223736222057696474
            683D22383522204865696768743D22313922205265737472696374696F6E733D
            2232342220416C6C6F7745787072657373696F6E733D2246616C73652220466F
            6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F
            6E742E4865696768743D222D31312220466F6E742E4E616D653D2243616C6962
            72692220466F6E742E5374796C653D223022204672616D652E5479703D223135
            2220476170583D22332220476170593D2233222048416C69676E3D2268615269
            6768742220506172656E74466F6E743D2246616C7365222056416C69676E3D22
            766143656E7465722220546578743D22222F3E3C546672784D656D6F56696577
            20416C6C6F77566563746F724578706F72743D225472756522204C6566743D22
            3531392220546F703D223736222057696474683D22373022204865696768743D
            22313922205265737472696374696F6E733D2232342220416C6C6F7745787072
            657373696F6E733D2246616C73652220466F6E742E436861727365743D223122
            20466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D3131
            2220466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C65
            3D223022204672616D652E5479703D2231352220476170583D22332220476170
            593D2233222048416C69676E3D22686152696768742220506172656E74466F6E
            743D2246616C7365222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C546672784D656D6F5669657720416C6C6F77566563746F724578
            706F72743D225472756522204C6566743D22302220546F703D22302220576964
            74683D223022204865696768743D223022205265737472696374696F6E733D22
            382220416C6C6F7745787072657373696F6E733D2246616C736522204672616D
            652E5479703D2231352220476170583D22332220476170593D2233222048416C
            69676E3D2268615269676874222056416C69676E3D22766143656E7465722220
            546578743D22222F3E3C546672784D656D6F5669657720416C6C6F7756656374
            6F724578706F72743D225472756522204C6566743D22302220546F703D223022
            2057696474683D223022204865696768743D223022205265737472696374696F
            6E733D22382220416C6C6F7745787072657373696F6E733D2246616C73652220
            4672616D652E5479703D2231352220476170583D22332220476170593D223322
            2048416C69676E3D2268615269676874222056416C69676E3D22766143656E74
            65722220546578743D22222F3E3C546672784D656D6F5669657720416C6C6F77
            566563746F724578706F72743D225472756522204C6566743D22302220546F70
            3D2230222057696474683D223022204865696768743D22302220526573747269
            6374696F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C
            736522204672616D652E5479703D2231352220476170583D2233222047617059
            3D2233222048416C69676E3D2268615269676874222056416C69676E3D227661
            43656E7465722220546578743D22222F3E3C546672784D656D6F566965772041
            6C6C6F77566563746F724578706F72743D225472756522204C6566743D223022
            20546F703D2230222057696474683D223022204865696768743D223022205265
            737472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D
            2246616C736522204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D2268615269676874222056416C69676E
            3D22766143656E7465722220546578743D22222F3E3C546672784D656D6F5669
            657720416C6C6F77566563746F724578706F72743D225472756522204C656674
            3D22302220546F703D2230222057696474683D223022204865696768743D2230
            22205265737472696374696F6E733D22382220416C6C6F774578707265737369
            6F6E733D2246616C736522204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D226861526967687422205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D65
            6D6F5669657720416C6C6F77566563746F724578706F72743D22547275652220
            4C6566743D22302220546F703D2230222057696474683D223022204865696768
            743D223022205265737472696374696F6E733D22382220416C6C6F7745787072
            657373696F6E733D2246616C736522204672616D652E5479703D223135222047
            6170583D22332220476170593D2233222048416C69676E3D2268615269676874
            222056416C69676E3D22766143656E7465722220546578743D22222F3E3C5466
            72784D656D6F5669657720416C6C6F77566563746F724578706F72743D225472
            756522204C6566743D22302220546F703D2230222057696474683D2230222048
            65696768743D223022205265737472696374696F6E733D22382220416C6C6F77
            45787072657373696F6E733D2246616C736522204672616D652E5479703D2231
            352220476170583D22332220476170593D2233222048416C69676E3D22686152
            69676874222056416C69676E3D22766143656E7465722220546578743D22222F
            3E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F7274
            3D225472756522204C6566743D22302220546F703D2230222057696474683D22
            3022204865696768743D223022205265737472696374696F6E733D2238222041
            6C6C6F7745787072657373696F6E733D2246616C736522204672616D652E5479
            703D2231352220476170583D22332220476170593D2233222048416C69676E3D
            2268615269676874222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C2F63656C6C6D656D6F733E3C63656C6C6865616465726D656D6F
            733E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F72
            743D225472756522204C6566743D223532342220546F703D223339322C393337
            3233222057696474683D22353822204865696768743D22313822205265737472
            696374696F6E733D22382220416C6C6F7745787072657373696F6E733D224661
            6C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F72
            3D22302220466F6E742E4865696768743D222D31312220466F6E742E4E616D65
            3D2243616C696272692220466F6E742E5374796C653D223122204672616D652E
            5479703D22313522204672616D652E57696474683D22302C31222046696C6C2E
            4261636B436F6C6F723D222D31363737373230312220476170583D2233222047
            6170593D2233222048416C69676E3D22686152696768742220506172656E7446
            6F6E743D2246616C7365222056416C69676E3D22766143656E74657222205465
            78743D2220562E20556E2E202852242920222F3E3C546672784D656D6F566965
            7720416C6C6F77566563746F724578706F72743D225472756522204C6566743D
            223538322220546F703D223339322C3933373233222057696474683D22313432
            22204865696768743D22313822205265737472696374696F6E733D2238222041
            6C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E436861
            727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E486569
            6768743D222D31312220466F6E742E4E616D653D2243616C696272692220466F
            6E742E5374796C653D223122204672616D652E5479703D22313522204672616D
            652E57696474683D22302C31222046696C6C2E4261636B436F6C6F723D222D31
            363737373230312220476170583D22332220476170593D2233222048416C6967
            6E3D22686152696768742220506172656E74466F6E743D2246616C7365222056
            416C69676E3D22766143656E7465722220546578743D2220562E20546F74616C
            202852242920222F3E3C546672784D656D6F5669657720416C6C6F7756656374
            6F724578706F72743D225472756522204C6566743D223433342220546F703D22
            3338222057696474683D22383522204865696768743D22313922205265737472
            696374696F6E733D22382220416C6C6F7745787072657373696F6E733D224661
            6C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F72
            3D22302220466F6E742E4865696768743D222D31312220466F6E742E4E616D65
            3D2243616C696272692220466F6E742E5374796C653D223022204672616D652E
            5479703D223135222046696C6C2E4261636B436F6C6F723D222D313637373732
            30312220476170583D22332220476170593D22332220506172656E74466F6E74
            3D2246616C7365222056416C69676E3D22766143656E7465722220546578743D
            2256414C4F525F554E49544152494F222F3E3C546672784D656D6F5669657720
            416C6C6F77566563746F724578706F72743D225472756522204C6566743D2235
            31392220546F703D223338222057696474683D22373022204865696768743D22
            313922205265737472696374696F6E733D22382220416C6C6F77457870726573
            73696F6E733D2246616C73652220466F6E742E436861727365743D2231222046
            6F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D31312220
            466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D22
            3022204672616D652E5479703D223135222046696C6C2E4261636B436F6C6F72
            3D222D31363737373230312220476170583D22332220476170593D2233222050
            6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
            65722220546578743D2256414C4F525F544F54414C222F3E3C546672784D656D
            6F5669657720416C6C6F77566563746F724578706F72743D225472756522204C
            6566743D223232362220546F703D223838222057696474683D22313232222048
            65696768743D22323222205265737472696374696F6E733D22382220416C6C6F
            7745787072657373696F6E733D2246616C736522204672616D652E5479703D22
            31352220476170583D22332220476170593D2233222056416C69676E3D227661
            43656E7465722220546578743D2256414C4F525F554E49544152494F222F3E3C
            546672784D656D6F5669657720416C6C6F77566563746F724578706F72743D22
            5472756522204C6566743D223232362220546F703D2231313022205769647468
            3D2231323222204865696768743D22323222205265737472696374696F6E733D
            22382220416C6C6F7745787072657373696F6E733D2246616C73652220467261
            6D652E5479703D2231352220476170583D22332220476170593D223322205641
            6C69676E3D22766143656E7465722220546578743D2256414C4F525F544F5441
            4C222F3E3C546672784D656D6F5669657720416C6C6F77566563746F72457870
            6F72743D225472756522204C6566743D223332372220546F703D223838222057
            696474683D2231323222204865696768743D2232322220526573747269637469
            6F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C736522
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            222056416C69676E3D22766143656E7465722220546578743D2256414C4F525F
            554E49544152494F222F3E3C546672784D656D6F5669657720416C6C6F775665
            63746F724578706F72743D225472756522204C6566743D223332372220546F70
            3D22313130222057696474683D2231323222204865696768743D223232222052
            65737472696374696F6E733D22382220416C6C6F7745787072657373696F6E73
            3D2246616C736522204672616D652E5479703D2231352220476170583D223322
            20476170593D2233222056416C69676E3D22766143656E746572222054657874
            3D2256414C4F525F544F54414C222F3E3C546672784D656D6F5669657720416C
            6C6F77566563746F724578706F72743D225472756522204C6566743D22323932
            2220546F703D223736222057696474683D22383522204865696768743D223139
            22205265737472696374696F6E733D22382220416C6C6F774578707265737369
            6F6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E
            742E436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F
            6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D223022
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            2220506172656E74466F6E743D2246616C7365222056416C69676E3D22766143
            656E7465722220546578743D2256414C4F525F554E49544152494F222F3E3C54
            6672784D656D6F5669657720416C6C6F77566563746F724578706F72743D2254
            72756522204C6566743D223239322220546F703D223935222057696474683D22
            383522204865696768743D22313922205265737472696374696F6E733D223822
            20416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48
            65696768743D222D31312220466F6E742E4E616D653D2243616C696272692220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204761
            70583D22332220476170593D22332220506172656E74466F6E743D2246616C73
            65222056416C69676E3D22766143656E7465722220546578743D2256414C4F52
            5F544F54414C222F3E3C546672784D656D6F5669657720416C6C6F7756656374
            6F724578706F72743D225472756522204C6566743D22302220546F703D223022
            2057696474683D223022204865696768743D223022205265737472696374696F
            6E733D22382220416C6C6F7745787072657373696F6E733D2246616C73652220
            4672616D652E5479703D2231352220476170583D22332220476170593D223322
            2056416C69676E3D22766143656E7465722220546578743D2256414C4F525F55
            4E49544152494F222F3E3C546672784D656D6F5669657720416C6C6F77566563
            746F724578706F72743D225472756522204C6566743D22302220546F703D2230
            222057696474683D223022204865696768743D22302220526573747269637469
            6F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C736522
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            222056416C69676E3D22766143656E7465722220546578743D2256414C4F525F
            544F54414C222F3E3C546672784D656D6F5669657720416C6C6F77566563746F
            724578706F72743D225472756522204C6566743D22302220546F703D22302220
            57696474683D223022204865696768743D223022205265737472696374696F6E
            733D22382220416C6C6F7745787072657373696F6E733D2246616C7365222046
            72616D652E5479703D2231352220476170583D22332220476170593D22332220
            56416C69676E3D22766143656E7465722220546578743D2256414C4F525F554E
            49544152494F222F3E3C546672784D656D6F5669657720416C6C6F7756656374
            6F724578706F72743D225472756522204C6566743D22302220546F703D223022
            2057696474683D223022204865696768743D223022205265737472696374696F
            6E733D22382220416C6C6F7745787072657373696F6E733D2246616C73652220
            4672616D652E5479703D2231352220476170583D22332220476170593D223322
            2056416C69676E3D22766143656E7465722220546578743D2256414C4F525F54
            4F54414C222F3E3C2F63656C6C6865616465726D656D6F733E3C636F6C756D6E
            6D656D6F733E3C546672784D656D6F5669657720416C6C6F77566563746F7245
            78706F72743D225472756522204C6566743D223532342220546F703D22333734
            2C3933373233222057696474683D2232303022204865696768743D2231382220
            5265737472696374696F6E733D2232342220416C6C6F7745787072657373696F
            6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E74
            2E436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E
            742E4E616D653D2243616C696272692220466F6E742E5374796C653D22312220
            4672616D652E5479703D22313522204672616D652E57696474683D22302C3122
            2046696C6C2E4261636B436F6C6F723D222D3136373737323031222047617058
            3D22332220476170593D2233222048416C69676E3D22686143656E7465722220
            506172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E
            7465722220546578743D22222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C
            756D6E746F74616C6D656D6F733E3C546672784D656D6F5669657720416C6C6F
            77566563746F724578706F72743D225472756522204C6566743D223433342220
            546F703D223139222057696474683D2231353522204865696768743D22313922
            205265737472696374696F6E733D2238222056697369626C653D2246616C7365
            2220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E
            436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E
            4865696768743D222D31312220466F6E742E4E616D653D2243616C6962726922
            20466F6E742E5374796C653D223122204672616D652E5479703D223135222046
            696C6C2E4261636B436F6C6F723D222D31363737373230312220476170583D22
            332220476170593D2233222048416C69676E3D22686143656E74657222205061
            72656E74466F6E743D2246616C7365222056416C69676E3D22766143656E7465
            722220546578743D22436F6E736F6C696461646F222F3E3C2F636F6C756D6E74
            6F74616C6D656D6F733E3C636F726E65726D656D6F733E3C546672784D656D6F
            5669657720416C6C6F77566563746F724578706F72743D225472756522204C65
            66743D22302220546F703D223334332C3933373233222057696474683D223532
            3422204865696768743D22333122205265737472696374696F6E733D22382220
            416C6C6F7745787072657373696F6E733D2246616C7365222043686172537061
            63696E673D22322220466F6E742E436861727365743D22312220466F6E742E43
            6F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E742E
            4E616D653D2243616C696272692220466F6E742E5374796C653D223122204672
            616D652E5479703D22313522204672616D652E57696474683D22302C31222046
            696C6C2E4261636B436F6C6F723D2231343231313238382220476170583D2233
            2220476170593D2233222048416C69676E3D22686143656E7465722220506172
            656E74466F6E743D2246616C7365222056416C69676E3D22766143656E746572
            2220546578743D2250726F6475746F202F205365727669C3A76F222F3E3C5466
            72784D656D6F5669657720416C6C6F77566563746F724578706F72743D225472
            756522204C6566743D223532342220546F703D223334332C3933373233222057
            696474683D2232303022204865696768743D2233312220526573747269637469
            6F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C736522
            204368617253706163696E673D22322220466F6E742E436861727365743D2231
            2220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D31
            312220466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C
            653D223122204672616D652E5479703D22313522204672616D652E5769647468
            3D22302C31222046696C6C2E4261636B436F6C6F723D22313432313132383822
            20476170583D22332220476170593D2233222048416C69676E3D22686143656E
            7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D22
            766143656E7465722220546578743D224D61706120646520507265C3A76F7320
            656E74726520466F726E656365646F726573222F3E3C546672784D656D6F5669
            657720416C6C6F77566563746F724578706F72743D225472756522204C656674
            3D223239322220546F703D223139222057696474683D22383522204865696768
            743D22313922205265737472696374696F6E733D2238222056697369626C653D
            2246616C73652220416C6C6F7745787072657373696F6E733D2246616C736522
            20466F6E742E436861727365743D22312220466F6E742E436F6C6F723D223022
            20466F6E742E4865696768743D222D31312220466F6E742E4E616D653D224361
            6C696272692220466F6E742E5374796C653D223022204672616D652E5479703D
            2231352220476170583D22332220476170593D2233222048416C69676E3D2268
            6143656E7465722220506172656E74466F6E743D2246616C7365222056416C69
            676E3D22766143656E7465722220546578743D22222F3E3C546672784D656D6F
            5669657720416C6C6F77566563746F724578706F72743D225472756522204C65
            66743D22302220546F703D223337342C3933373233222057696474683D223335
            22204865696768743D22333622205265737472696374696F6E733D2238222041
            6C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E436861
            727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E486569
            6768743D222D31312220466F6E742E4E616D653D2243616C696272692220466F
            6E742E5374796C653D223122204672616D652E5479703D22313522204672616D
            652E57696474683D22302C31222046696C6C2E4261636B436F6C6F723D222D31
            363737373230312220476170583D22332220476170593D2233222048416C6967
            6E3D22686143656E7465722220506172656E74466F6E743D2246616C73652220
            56416C69676E3D22766143656E7465722220546578743D22204974656D20222F
            3E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F7274
            3D225472756522204C6566743D2233352220546F703D223337342C3933373233
            222057696474683D2231323322204865696768743D2233362220526573747269
            6374696F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C
            73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D
            22302220466F6E742E4865696768743D222D31312220466F6E742E4E616D653D
            2243616C696272692220466F6E742E5374796C653D223122204672616D652E54
            79703D22313522204672616D652E57696474683D22302C31222046696C6C2E42
            61636B436F6C6F723D222D31363737373230312220476170583D223322204761
            70593D22332220506172656E74466F6E743D2246616C7365222056416C69676E
            3D22766143656E7465722220546578743D2220446573637269C3A7C3A36F202B
            204170726573656E7461C3A7C3A36F222F3E3C546672784D656D6F5669657720
            416C6C6F77566563746F724578706F72743D225472756522204C6566743D2231
            35382220546F703D223337342C3933373233222057696474683D223732222048
            65696768743D22333622205265737472696374696F6E733D22382220416C6C6F
            7745787072657373696F6E733D2246616C73652220466F6E742E436861727365
            743D22312220466F6E742E436F6C6F723D22302220466F6E742E486569676874
            3D222D31312220466F6E742E4E616D653D2243616C696272692220466F6E742E
            5374796C653D223122204672616D652E5479703D22313522204672616D652E57
            696474683D22302C31222046696C6C2E4261636B436F6C6F723D222D31363737
            373230312220476170583D22332220476170593D2233222048416C69676E3D22
            686143656E7465722220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D2220517464652E20222F3E3C
            546672784D656D6F5669657720416C6C6F77566563746F724578706F72743D22
            5472756522204C6566743D223233302220546F703D223337342C393337323322
            2057696474683D22363222204865696768743D22333622205265737472696374
            696F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C7365
            2220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D2230
            2220466F6E742E4865696768743D222D31312220466F6E742E4E616D653D2243
            616C696272692220466F6E742E5374796C653D223122204672616D652E547970
            3D22313522204672616D652E57696474683D22302C31222046696C6C2E426163
            6B436F6C6F723D222D31363737373230312220476170583D2233222047617059
            3D2233222048416C69676E3D22686143656E7465722220506172656E74466F6E
            743D2246616C7365222056416C69676E3D22766143656E746572222054657874
            3D2220556E642E20222F3E3C546672784D656D6F5669657720416C6C6F775665
            63746F724578706F72743D225472756522204C6566743D223239322220546F70
            3D223337342C3933373233222057696474683D2231313522204865696768743D
            22333622205265737472696374696F6E733D22382220416C6C6F774578707265
            7373696F6E733D2246616C73652220466F6E742E436861727365743D22312220
            466F6E742E436F6C6F723D2231363731313638302220466F6E742E4865696768
            743D222D31312220466F6E742E4E616D653D2243616C696272692220466F6E74
            2E5374796C653D223122204672616D652E5479703D22313522204672616D652E
            57696474683D22302C31222046696C6C2E4261636B436F6C6F723D222D313637
            37373230312220476170583D22332220476170593D2233222048416C69676E3D
            22686152696768742220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D224DC3AD6E2E202852242922
            2F3E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F72
            743D225472756522204C6566743D223430372220546F703D223337342C393337
            3233222057696474683D2231313722204865696768743D223336222052657374
            72696374696F6E733D22382220416C6C6F7745787072657373696F6E733D2246
            616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D223235352220466F6E742E4865696768743D222D31312220466F6E742E4E
            616D653D2243616C696272692220466F6E742E5374796C653D22312220467261
            6D652E5479703D22313522204672616D652E57696474683D22302C3122204669
            6C6C2E4261636B436F6C6F723D222D31363737373230312220476170583D2233
            2220476170593D2233222048416C69676E3D2268615269676874222050617265
            6E74466F6E743D2246616C7365222056416C69676E3D22766143656E74657222
            20546578743D224DC3A1782E2028522429222F3E3C2F636F726E65726D656D6F
            733E3C726F776D656D6F733E3C546672784D656D6F5669657720416C6C6F7756
            6563746F724578706F72743D225472756522204C6566743D22302220546F703D
            223431302C3933373233222057696474683D22333522204865696768743D2231
            3822205265737472696374696F6E733D2232342220416C6C6F77457870726573
            73696F6E733D2246616C73652220466F6E742E436861727365743D2231222046
            6F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D31312220
            466F6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D22
            3022204672616D652E5479703D22313522204672616D652E57696474683D2230
            2C312220476170583D22332220476170593D2233222048416C69676E3D226861
            43656E7465722220506172656E74466F6E743D2246616C7365222056416C6967
            6E3D22766143656E7465722220546578743D22222F3E3C546672784D656D6F56
            69657720416C6C6F77566563746F724578706F72743D225472756522204C6566
            743D2233352220546F703D223431302C3933373233222057696474683D223132
            3322204865696768743D22313822205265737472696374696F6E733D22323422
            20416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48
            65696768743D222D31312220466F6E742E4E616D653D2243616C696272692220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204672
            616D652E57696474683D22302C312220476170583D22332220476170593D2233
            2220506172656E74466F6E743D2246616C7365222056416C69676E3D22766143
            656E7465722220546578743D22222F3E3C546672784D656D6F5669657720416C
            6C6F77566563746F724578706F72743D225472756522204C6566743D22313538
            2220546F703D223431302C3933373233222057696474683D2237322220486569
            6768743D22313822205265737472696374696F6E733D2232342220416C6C6F77
            45787072657373696F6E733D2246616C73652220466F6E742E43686172736574
            3D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D
            222D31312220466F6E742E4E616D653D2243616C696272692220466F6E742E53
            74796C653D223022204672616D652E5479703D22313522204672616D652E5769
            6474683D22302C312220476170583D22332220476170593D2233222048416C69
            676E3D22686143656E7465722220506172656E74466F6E743D2246616C736522
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C546672
            784D656D6F5669657720416C6C6F77566563746F724578706F72743D22547275
            6522204C6566743D223233302220546F703D223431302C393337323322205769
            6474683D22363222204865696768743D22313822205265737472696374696F6E
            733D2232342220416C6C6F7745787072657373696F6E733D2246616C73652220
            466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220
            466F6E742E4865696768743D222D31312220466F6E742E4E616D653D2243616C
            696272692220466F6E742E5374796C653D223022204672616D652E5479703D22
            313522204672616D652E57696474683D22302C312220476170583D2233222047
            6170593D2233222048416C69676E3D22686143656E7465722220506172656E74
            466F6E743D2246616C7365222056416C69676E3D22766143656E746572222054
            6578743D22222F3E3C546672784D656D6F5669657720416C6C6F77566563746F
            724578706F72743D225472756522204C6566743D223239322220546F703D2234
            31302C3933373233222057696474683D2231313522204865696768743D223138
            22205265737472696374696F6E733D2232342220416C6C6F7745787072657373
            696F6E733D2246616C73652220446973706C6179466F726D61742E466F726D61
            745374723D2225322E326E2220446973706C6179466F726D61742E4B696E643D
            22666B4E756D657269632220466F6E742E436861727365743D22312220466F6E
            742E436F6C6F723D2231363731313638302220466F6E742E4865696768743D22
            2D31312220466F6E742E4E616D653D2243616C696272692220466F6E742E5374
            796C653D223022204672616D652E5479703D22313522204672616D652E576964
            74683D22302C312220476170583D22332220476170593D2233222048416C6967
            6E3D22686152696768742220506172656E74466F6E743D2246616C7365222056
            416C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D
            656D6F5669657720416C6C6F77566563746F724578706F72743D225472756522
            204C6566743D223430372220546F703D223431302C3933373233222057696474
            683D2231313722204865696768743D22313822205265737472696374696F6E73
            3D2232342220416C6C6F7745787072657373696F6E733D2246616C7365222044
            6973706C6179466F726D61742E466F726D61745374723D2225322E326E222044
            6973706C6179466F726D61742E4B696E643D22666B4E756D657269632220466F
            6E742E436861727365743D22312220466F6E742E436F6C6F723D223235352220
            466F6E742E4865696768743D222D31312220466F6E742E4E616D653D2243616C
            696272692220466F6E742E5374796C653D223022204672616D652E5479703D22
            313522204672616D652E57696474683D22302C312220476170583D2233222047
            6170593D2233222048416C69676E3D22686152696768742220506172656E7446
            6F6E743D2246616C7365222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C2F726F776D656D6F733E3C726F77746F74616C6D656D6F73
            3E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F7274
            3D225472756522204C6566743D22302220546F703D223736222057696474683D
            2232393322204865696768743D22313922205265737472696374696F6E733D22
            38222056697369626C653D2246616C73652220416C6C6F774578707265737369
            6F6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E
            742E436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F
            6E742E4E616D653D2243616C696272692220466F6E742E5374796C653D223122
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            222048416C69676E3D22686143656E7465722220506172656E74466F6E743D22
            46616C7365222056416C69676E3D22766143656E7465722220546578743D2247
            72616E6420546F74616C222F3E3C546672784D656D6F5669657720416C6C6F77
            566563746F724578706F72743D225472756522204C6566743D2234362220546F
            703D223838222057696474683D2231383022204865696768743D223434222052
            65737472696374696F6E733D2238222056697369626C653D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E4368
            61727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865
            696768743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E
            742E5374796C653D223122204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D22686143656E746572222050
            6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
            65722220546578743D22546F74616C222F3E3C546672784D656D6F5669657720
            416C6C6F77566563746F724578706F72743D225472756522204C6566743D2232
            32362220546F703D223838222057696474683D2231303122204865696768743D
            22343422205265737472696374696F6E733D2238222056697369626C653D2246
            616C73652220416C6C6F7745787072657373696F6E733D2246616C7365222046
            6F6E742E436861727365743D22312220466F6E742E436F6C6F723D2230222046
            6F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241726961
            6C2220466F6E742E5374796C653D223122204672616D652E5479703D22313522
            20476170583D22332220476170593D2233222048416C69676E3D22686143656E
            7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D22
            766143656E7465722220546578743D22546F74616C222F3E3C546672784D656D
            6F5669657720416C6C6F77566563746F724578706F72743D225472756522204C
            6566743D223332372220546F703D223838222057696474683D22383822204865
            696768743D22343422205265737472696374696F6E733D223822205669736962
            6C653D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C
            73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D
            22302220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D
            22417269616C2220466F6E742E5374796C653D223122204672616D652E547970
            3D2231352220476170583D22332220476170593D2233222048416C69676E3D22
            686143656E7465722220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D22546F74616C222F3E3C5466
            72784D656D6F5669657720416C6C6F77566563746F724578706F72743D225472
            756522204C6566743D223239322220546F703D223739222057696474683D2231
            363222204865696768743D22323222205265737472696374696F6E733D223822
            2056697369626C653D2246616C73652220416C6C6F7745787072657373696F6E
            733D2246616C73652220466F6E742E436861727365743D22312220466F6E742E
            436F6C6F723D22302220466F6E742E4865696768743D222D31332220466F6E74
            2E4E616D653D22417269616C2220466F6E742E5374796C653D22312220467261
            6D652E5479703D2231352220476170583D22332220476170593D223322204841
            6C69676E3D22686143656E7465722220506172656E74466F6E743D2246616C73
            65222056416C69676E3D22766143656E7465722220546578743D22546F74616C
            222F3E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F
            72743D225472756522204C6566743D223435342220546F703D22373922205769
            6474683D2231363622204865696768743D22323222205265737472696374696F
            6E733D2238222056697369626C653D2246616C73652220416C6C6F7745787072
            657373696F6E733D2246616C73652220466F6E742E436861727365743D223122
            20466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D3133
            2220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D22
            3122204672616D652E5479703D2231352220476170583D22332220476170593D
            2233222048416C69676E3D22686143656E7465722220506172656E74466F6E74
            3D2246616C7365222056416C69676E3D22766143656E7465722220546578743D
            22546F74616C222F3E3C2F726F77746F74616C6D656D6F733E3C63656C6C6675
            6E6374696F6E733E3C6974656D20302F3E3C6974656D20302F3E3C2F63656C6C
            66756E6374696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E3C
            2F636F6C756D6E736F72743E3C726F77736F72743E3C6974656D20302F3E3C69
            74656D20302F3E3C6974656D20302F3E3C6974656D20302F3E3C6974656D2030
            2F3E3C6974656D20302F3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
      object bndFooter: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 11.338590000000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  object qryCotacaoCompraFornecedor: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codigo'
      '  , c.empresa'
      '  , c.fornecedor'
      '  , c.nome_contato'
      '  , c.email_envio'
      '  , c.forma_pagto'
      '  , c.condicao_pagto'
      '  , c.prazo_entrega_data'
      '  , c.prazo_entreda_dia'
      '  , c.observacao'
      '  , c.ativo'
      '  , c.usuario'
      '  , c.valor_total_bruto'
      '  , c.valor_total_desconto'
      '  , c.valor_total_liquido'
      '  , c.vencedor'
      '  , f.nomeforn'
      '  , f.cnpj'
      '  , f.pessoa_fisica'
      '  , f.email'
      '  , fp.descri as forma_pagto_desc'
      '  , cp.cond_descricao as condicap_pagto_desc'
      
        '  , (Select count(x.item) from TBCOTACAO_COMPRAFORN_ITEM x where' +
        ' x.ano = c.ano and x.codigo = c.codigo and x.empresa = c.empresa' +
        ' and x.fornecedor = c.fornecedor) as Itens'
      'from TBCOTACAO_COMPRAFORN c'
      '  left join TBFORNECEDOR f on (f.codforn = c.fornecedor)'
      '  left join TBFORMPAGTO fp on (fp.cod = c.forma_pagto)'
      
        '  left join VW_CONDICAOPAGTO cp on (cp.cond_cod = c.condicao_pag' +
        'to)'
      ''
      'where c.ano        = :ano'
      '  and c.codigo     = :cod'
      '  and c.empresa    = :emp'
      '  and ((c.fornecedor = :frn) or (:todos = 1))'
      ''
      'order by'
      '    c.ano'
      '  , c.codigo'
      '  , c.empresa'
      '  , c.fornecedor')
    Left = 176
    Top = 192
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EMP'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'FRN'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'TODOS'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object frdCotacaoCompraFornecedor: TfrxDBDataset
    UserName = 'frdCotacaoCompraFornecedor'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODIGO=CODIGO'
      'EMPRESA=EMPRESA'
      'FORNECEDOR=FORNECEDOR'
      'NOME_CONTATO=NOME_CONTATO'
      'EMAIL_ENVIO=EMAIL_ENVIO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'CONDICAO_PAGTO=CONDICAO_PAGTO'
      'PRAZO_ENTREGA_DATA=PRAZO_ENTREGA_DATA'
      'PRAZO_ENTREDA_DIA=PRAZO_ENTREDA_DIA'
      'OBSERVACAO=OBSERVACAO'
      'ATIVO=ATIVO'
      'USUARIO=USUARIO'
      'VALOR_TOTAL_BRUTO=VALOR_TOTAL_BRUTO'
      'VALOR_TOTAL_DESCONTO=VALOR_TOTAL_DESCONTO'
      'VALOR_TOTAL_LIQUIDO=VALOR_TOTAL_LIQUIDO'
      'VENCEDOR=VENCEDOR'
      'NOMEFORN=NOMEFORN'
      'CNPJ=CNPJ'
      'PESSOA_FISICA=PESSOA_FISICA'
      'EMAIL=EMAIL'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'CONDICAP_PAGTO_DESC=CONDICAP_PAGTO_DESC'
      'ITENS=ITENS')
    DataSet = qryCotacaoCompraFornecedor
    BCDToCurrency = False
    DataSetOptions = []
    Left = 208
    Top = 192
  end
  object qryCotacaoCompraFornecedorItem: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    right('#39'00000'#39' || fi.fornecedor, 5) as fornecedor'
      '  , fi.item'
      '  , ci.produto'
      '  , pr.descri_apresentacao'
      '  , ci.quantidade'
      '  , ci.unidade'
      '  , un.unp_descricao'
      '  , un.unp_sigla'
      ''
      '  , ci.valor_unitario_ref'
      '  , ci.valor_total_ref'
      '  , ci.valor_unitario_max'
      '  , ci.valor_total_max'
      '  , ci.valor_unitario_min'
      '  , ci.valor_total_min'
      '  , ci.valor_unitario_media'
      '  , ci.valor_total_media'
      ''
      '  , fi.valor_unitario'
      '  , fi.valor_total'
      'from TBCOTACAO_COMPRAFORN_ITEM fi'
      
        '  left join TBCOTACAO_COMPRAITEM ci on (ci.ano = fi.ano and ci.c' +
        'odigo = fi.codigo and ci.empresa = fi.empresa and ci.seq = fi.it' +
        'em)'
      '  left join TBPRODUTO pr on (pr.cod = ci.produto)'
      '  left join TBUNIDADEPROD un on (un.unp_cod = ci.unidade)'
      ''
      'where fi.ano        = :ano'
      '  and fi.codigo     = :cod'
      '  and fi.empresa    = :emp'
      '  and ((fi.fornecedor = :frn) or (:todos = 1))'
      ''
      'order by'
      '    fi.fornecedor'
      '  , pr.descri_apresentacao')
    Left = 176
    Top = 240
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EMP'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'FRN'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'TODOS'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object frdCotacaoCompraFornecedorItem: TfrxDBDataset
    UserName = 'frdCotacaoCompraFornecedorItem'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FORNECEDOR=FORNECEDOR'
      'ITEM=ITEM'
      'PRODUTO=PRODUTO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'QUANTIDADE=QUANTIDADE'
      'UNIDADE=UNIDADE'
      'UNP_DESCRICAO=UNP_DESCRICAO'
      'UNP_SIGLA=UNP_SIGLA'
      'VALOR_UNITARIO_REF=VALOR_UNITARIO_REF'
      'VALOR_TOTAL_REF=VALOR_TOTAL_REF'
      'VALOR_UNITARIO_MAX=VALOR_UNITARIO_MAX'
      'VALOR_TOTAL_MAX=VALOR_TOTAL_MAX'
      'VALOR_UNITARIO_MIN=VALOR_UNITARIO_MIN'
      'VALOR_TOTAL_MIN=VALOR_TOTAL_MIN'
      'VALOR_UNITARIO_MEDIA=VALOR_UNITARIO_MEDIA'
      'VALOR_TOTAL_MEDIA=VALOR_TOTAL_MEDIA'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'VALOR_TOTAL=VALOR_TOTAL')
    DataSet = qryCotacaoCompraFornecedorItem
    BCDToCurrency = False
    DataSetOptions = []
    Left = 208
    Top = 240
  end
end
