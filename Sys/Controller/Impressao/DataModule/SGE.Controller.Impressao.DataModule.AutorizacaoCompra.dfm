object DataModuleAutorizacaoCompra: TDataModuleAutorizacaoCompra
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 347
  Width = 528
  object qryFornecedorDestinatario: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    f.codforn as Codigo'
      '  , f.pessoa_fisica'
      '  , f.cnpj'
      '  , f.nomeforn as Nome'
      '  , f.inscest'
      '  , f.inscmun'
      ''
      '  , f.fone'
      '  , f.email'
      '  , f.site'
      ''
      '  , f.tlg_tipo'
      '  , tl.Tlg_descricao'
      '  , tl.Tlg_sigla'
      '  , f.log_cod'
      '  , lg.Log_nome'
      '  , f.complemento'
      '  , f.numero_end'
      '  , f.cep'
      ''
      '  , f.bai_cod'
      '  , br.Bai_nome'
      ''
      '  , f.cid_cod'
      '  , cd.Cid_nome'
      '  , cd.Cid_siafi'
      '  , cd.Cid_ibge'
      '  , cd.Cid_ddd'
      ''
      '  , f.est_cod'
      '  , uf.Est_nome'
      '  , uf.Est_sigla'
      '  , uf.Est_siafi'
      ''
      '  , f.pais_id'
      '  , pa.Pais_nome'
      'from TBFORNECEDOR f'
      '  left join TBESTADO uf on (uf.Est_cod = f.Est_cod)'
      '  left join TBCIDADE cd on (cd.Cid_cod = f.Cid_cod)'
      '  left join TBBAIRRO br on (br.Bai_cod = f.Bai_cod)'
      '  left join TBLOGRADOURO lg on (lg.Log_cod = f.Log_cod)'
      '  left join TBTIPO_LoGRADOURO tl on (tl.Tlg_cod = f.Tlg_tipo)'
      '  left Join TBPAIS pa on (pa.Pais_id = f.Pais_id)'
      'where f.Codforn = :Codigo')
    Left = 96
    Top = 48
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object frdFornecedor: TfrxDBDataset
    UserName = 'frdFornecedor'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'NOME=NOME'
      'INSCEST=INSCEST'
      'INSCMUN=INSCMUN'
      'FONE=FONE'
      'EMAIL=EMAIL'
      'SITE=SITE'
      'TLG_TIPO=TLG_TIPO'
      'TLG_DESCRICAO=TLG_DESCRICAO'
      'TLG_SIGLA=TLG_SIGLA'
      'LOG_COD=LOG_COD'
      'LOG_NOME=LOG_NOME'
      'COMPLEMENTO=COMPLEMENTO'
      'NUMERO_END=NUMERO_END'
      'CEP=CEP'
      'BAI_COD=BAI_COD'
      'BAI_NOME=BAI_NOME'
      'CID_COD=CID_COD'
      'CID_NOME=CID_NOME'
      'CID_SIAFI=CID_SIAFI'
      'CID_IBGE=CID_IBGE'
      'CID_DDD=CID_DDD'
      'EST_COD=EST_COD'
      'EST_NOME=EST_NOME'
      'EST_SIGLA=EST_SIGLA'
      'EST_SIAFI=EST_SIAFI'
      'PAIS_ID=PAIS_ID'
      'PAIS_NOME=PAIS_NOME')
    DataSet = qryFornecedorDestinatario
    BCDToCurrency = False
    Left = 136
    Top = 48
  end
  object qryAutorizacaoCompra: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.codigo'
      '  , a.numero'
      '  , a.tipo'
      '  , case a.tipo'
      '      when 1 then '#39'Compra'#39
      '      when 2 then '#39'Servi'#231'o'#39
      '      when 3 then '#39'Compra/Servi'#231'o'#39
      '    end as tipo_desc'
      '  , a.status'
      '  , case a.status'
      '      when 0 then '#39'Em Edi'#231#227'o'#39
      '      when 1 then '#39'Aberta'#39
      '      when 2 then '#39'Autorizada'#39
      '      when 3 then '#39'Faturada'#39
      '      when 4 then '#39'Cancelada'#39
      '    end as status_desc'
      '  , a.empresa'
      '  , a.fornecedor'
      '  , a.emissao_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = a.emissao_usuario)    as usuario_emissor'
      '  , a.autorizado_data'
      
        '  , (Select first 1 us.nomecompleto from TBUSERS us where us.nom' +
        'e = a.autorizado_usuario) as usuario_autorizador'
      '  , a.transportador'
      '  , t.nomeforn as transportador_nome'
      '  , t.cnpj     as transportador_cnpj'
      '  , a.nome_contato'
      '  , a.recebedor_nome'
      '  , a.recebedor_funcao'
      '  , a.recebedor_cpf'
      '  , a.movito'
      '  , a.cliente  as cliente_codigo'
      '  , ci.nome     as cliente_nome'
      '  , ci.cnpj     as cliente_cnpf'
      '  , a.observacao'
      '  , a.endereco_entrega'
      '  , a.forma_pagto'
      '  , f.descri as forma_pagto_desc'
      '  , a.condicao_pagto'
      '  , c.cond_descricao      as condicao_pagto_desc'
      '  , c.cond_descricao_full as condicao_pagto_desc2'
      '  , a.valor_bruto    as valor_total_bruto'
      '  , a.valor_total_frete'
      '  , a.valor_total_ipi'
      '  , a.valor_desconto as valor_total_desconto'
      '  , a.valor_total    as valor_total_liquido'
      '  , i.seq'
      '  , i.produto'
      '  , p.descri'
      '  , p.descri_apresentacao'
      '  , p.referencia'
      '  , i.quantidade'
      
        '  , coalesce(nullif(Trim(u.unp_sigla), '#39#39'), u.unp_descricao) as ' +
        'unidade'
      '  , i.valor_unitario'
      '  , i.ipi_percentual  as percentual_ipi'
      '  , i.ipi_valor_total as valor_ipi'
      '  , i.valor_total'
      'from TBAUTORIZA_COMPRA a'
      
        '  inner join TBAUTORIZA_COMPRAITEM i on (i.ano = a.ano and i.cod' +
        'igo = a.codigo and i.empresa = a.empresa)'
      '  inner join TBPRODUTO p on (p.cod = i.produto)'
      '  left join TBFORNECEDOR t on (t.codforn = a.transportador)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)'
      '  left join TBFORMPAGTO f on (f.cod = a.forma_pagto)'
      
        '  left join VW_CONDICAOPAGTO c on (c.cond_cod = a.condicao_pagto' +
        ')'
      '  left join TBCLIENTE ci on (ci.codigo = a.cliente)'
      ''
      'where a.ano    = :ano'
      '  and a.codigo = :cod'
      ''
      '')
    Left = 96
    Top = 80
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
      end>
  end
  object frdAutorizacaoCompra: TfrxDBDataset
    UserName = 'frdAutorizacaoCompra'
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
      'FORNECEDOR=FORNECEDOR'
      'EMISSAO_DATA=EMISSAO_DATA'
      'USUARIO_EMISSOR=USUARIO_EMISSOR'
      'AUTORIZADO_DATA=AUTORIZADO_DATA'
      'USUARIO_AUTORIZADOR=USUARIO_AUTORIZADOR'
      'TRANSPORTADOR=TRANSPORTADOR'
      'TRANSPORTADOR_NOME=TRANSPORTADOR_NOME'
      'TRANSPORTADOR_CNPJ=TRANSPORTADOR_CNPJ'
      'NOME_CONTATO=NOME_CONTATO'
      'RECEBEDOR_NOME=RECEBEDOR_NOME'
      'RECEBEDOR_FUNCAO=RECEBEDOR_FUNCAO'
      'RECEBEDOR_CPF=RECEBEDOR_CPF'
      'MOVITO=MOVITO'
      'CLIENTE_CODIGO=CLIENTE_CODIGO'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_CNPF=CLIENTE_CNPF'
      'OBSERVACAO=OBSERVACAO'
      'ENDERECO_ENTREGA=ENDERECO_ENTREGA'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'CONDICAO_PAGTO=CONDICAO_PAGTO'
      'CONDICAO_PAGTO_DESC=CONDICAO_PAGTO_DESC'
      'CONDICAO_PAGTO_DESC2=CONDICAO_PAGTO_DESC2'
      'VALOR_TOTAL_BRUTO=VALOR_TOTAL_BRUTO'
      'VALOR_TOTAL_FRETE=VALOR_TOTAL_FRETE'
      'VALOR_TOTAL_IPI=VALOR_TOTAL_IPI'
      'VALOR_TOTAL_DESCONTO=VALOR_TOTAL_DESCONTO'
      'VALOR_TOTAL_LIQUIDO=VALOR_TOTAL_LIQUIDO'
      'SEQ=SEQ'
      'PRODUTO=PRODUTO'
      'DESCRI=DESCRI'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'REFERENCIA=REFERENCIA'
      'QUANTIDADE=QUANTIDADE'
      'UNIDADE=UNIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'PERCENTUAL_IPI=PERCENTUAL_IPI'
      'VALOR_IPI=VALOR_IPI'
      'VALOR_TOTAL=VALOR_TOTAL')
    DataSet = qryAutorizacaoCompra
    BCDToCurrency = False
    Left = 128
    Top = 80
  end
  object frrAutorizacaoCompra: TfrxReport
    Version = '6.3.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41863.913688182870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frrAutorizacaoCompraGetValue
    Left = 160
    Top = 80
    Datasets = <
      item
        DataSet = frdAutorizacaoCompra
        DataSetName = 'frdAutorizacaoCompra'
      end
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdFornecedor
        DataSetName = 'frdFornecedor'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Sistema'
        Value = ''
      end
      item
        Name = 'Usuario'
        Value = ''
      end>
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
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdAutorizacaoCompra."NUMERO"]')
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
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdAutorizacaoCompra."STATUS_DESC"]')
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
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Frame.Typ = []
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
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[Trim('#39'AUTORIZA'#199#195'O DE '#39' + Uppercase(<frdAutorizacaoCompra."TIPO_' +
              'DESC">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        DataSet = frdAutorizacaoCompra
        DataSetName = 'frdAutorizacaoCompra'
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
          Frame.Typ = []
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line#> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = clBtnFace
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdAutorizacaoCompra."PRODUTO"]')
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
          Frame.Typ = []
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line#> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = clBtnFace
          Highlight.Frame.Typ = []
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
          Frame.Typ = []
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line#> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = clBtnFace
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            
              ' [frdAutorizacaoCompra."DESCRI_APRESENTACAO"] [IIF(Trim(<frdAuto' +
              'rizacaoCompra."REFERENCIA">)='#39#39','#39#39',<frdAutorizacaoCompra."REFERE' +
              'NCIA">)]')
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
          Frame.Typ = []
          HAlign = haRight
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line#> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = clBtnFace
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.###'#39',<frdAutorizacaoCompra."QUANTIDADE">)] ')
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
          Frame.Typ = []
          HAlign = haRight
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line#> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = clBtnFace
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL">)] ')
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
          Frame.Typ = []
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line#> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = clBtnFace
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' [frdAutorizacaoCompra."UNIDADE"]')
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
          Frame.Typ = []
          HAlign = haRight
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line#> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = clBtnFace
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_UNITARIO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 805.039890000000000000
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
        object mmSystem: TfrxMemoView
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
          Top = 15.118119999999980000
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
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 113.385900000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          AllowVectorExport = True
          Top = 41.574829999999990000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdFornecedor."NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000010000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Fornecedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 30.236240000000010000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' CPF/CNPJ.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 41.574829999999990000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [IIF(<frdFornecedor."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.' +
              '###-##;0;'#39',<frdFornecedor."CNPJ">),FormatMaskText('#39'##.###.###/##' +
              '##-##;0;'#39',<frdFornecedor."CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 30.236240000000010000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
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
          Top = 41.574829999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdAutorizacaoCompra."EMISSAO_DAT' +
              'A">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Top = 94.488250000000030000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
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
          Top = 94.488250000000030000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
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
          Top = 94.488250000000030000
          Width = 419.527659130000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 14211288
          Memo.UTF8W = (
            ' Descri'#231#227'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Top = 71.811070000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              ' [Trim(<frdFornecedor."TLG_SIGLA"> + '#39' '#39' + <frdFornecedor."LOG_N' +
              'OME"> + '#39', '#39' + <frdFornecedor."NUMERO_END"> + '#39', '#39' + <frdFornece' +
              'dor."BAI_NOME"> + '#39' - '#39' + <frdFornecedor."CID_NOME"> + '#39'/'#39' + <fr' +
              'dFornecedor."EST_SIGLA">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Top = 60.472479999999990000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Endere'#231'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Top = 94.488250000000030000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
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
          Top = 94.488250000000030000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
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
          Top = 11.338590000000010000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdAutorizacaoCompra."NOME_CONTATO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Att.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 94.488250000000030000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
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
          Top = 94.488250000000030000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 14211288
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 370.393940000000000000
        Top = 411.968770000000000000
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
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdAutorizacaoCompra."VALOR_TOTAL">,bn' +
              'dMasterData,2))] ')
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
          HAlign = haRight
          Memo.UTF8W = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 249.448980000000000000
          Width = 340.157700000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]'
            '[FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Top = 68.031540000000010000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frdAutorizacaoCompra."USUARIO_AUTORIZADOR"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Top = 56.692949999999990000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Autorizador:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 22.677180000000020000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
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
          Memo.UTF8W = (
            ' [frdAutorizacaoCompra."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Top = 26.456709999999990000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
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
          Memo.UTF8W = (
            ' [frdAutorizacaoCompra."CONDICAO_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 26.456709999999990000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Condi'#231#227'o de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 68.031540000000010000
          Width = 102.047248980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL_BRUTO">)' +
              '] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 56.692949999999990000
          Width = 102.047248980000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            ' Total Bruto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Top = 68.031540000000010000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL_DESCONTO' +
              '">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Top = 56.692949999999990000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            ' Desconto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 68.031540000000010000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL_LIQUIDO"' +
              '>)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 56.692949999999990000
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
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Top = 105.826840000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frdAutorizacaoCompra."ENDERECO_ENTREGA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Top = 90.708720000000030000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            ' Local de Entrega/Realiza'#231#227'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 162.519790000000000000
          Width = 623.622450000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              '                 Autorizamos a [frdFornecedor."NOME"] executar a' +
              ' presente Autoriza'#231#227'o de [Trim(<frdAutorizacaoCompra."TIPO_DESC"' +
              '>)], na sua totalidade, e na forma/condi'#231#227'o de pagamentos estabe' +
              'lecida.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 317.480520000000000000
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              'Material a ser retirado por: [frdAutorizacaoCompra."RECEBEDOR_NO' +
              'ME"] [IIF(Trim(<frdAutorizacaoCompra."RECEBEDOR_FUNCAO">)='#39#39','#39#39',' +
              #39'('#39'+<frdAutorizacaoCompra."RECEBEDOR_FUNCAO">+'#39')'#39')]'
            '[frdAutorizacaoCompra."OBSERVACAO"]'
            
              '[IIF(<frdAutorizacaoCompra."CLIENTE_CODIGO">=0,'#39#39','#39'* * * Cliente' +
              ' : '#39' + FormatFloat('#39'00000'#39', <frdAutorizacaoCompra."CLIENTE_CODIG' +
              'O">)) ]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 302.362400000000100000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            ' Observa'#231#245'es Gerais:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409710000000000000
          Top = 68.031540000000010000
          Width = 98.267718980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39',0.00'#39',<frdAutorizacaoCompra."VALOR_TOTAL_IPI">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409710000000000000
          Top = 56.692949999999990000
          Width = 98.267718980000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            ' Total IPI: ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end
