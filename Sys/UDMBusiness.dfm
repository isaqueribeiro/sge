object DMBusiness: TDMBusiness
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 648
  Width = 1043
  object ibdtbsBusiness: TIBDatabase
    DatabaseName = 'localhost:AGIL_COMERCIO'
    Params.Strings = (
      'user_name=SYSDBA'
      'Password=masterkey'
      'lc_ctype=ISO8859_2')
    LoginPrompt = False
    DefaultTransaction = ibtrnsctnBusiness
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 40
    Top = 8
  end
  object ibtrnsctnBusiness: TIBTransaction
    DefaultDatabase = ibdtbsBusiness
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 40
    Top = 64
  end
  object dtsrcAjustEstoq: TDataSource
    DataSet = ibdtstAjustEstoq
    Left = 144
    Top = 64
  end
  object ibdtstAjustEstoq: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TBAJUSTESTOQ'
      'where'
      '  CODPROD = :OLD_CODPROD')
    InsertSQL.Strings = (
      'insert into TBAJUSTESTOQ'
      
        '  (CODPROD, CODFORN, QTDEATUAL, QTDENOVA, QTDEFINAL, MOTIVO, DOC' +
        ', DTAJUST)'
      'values'
      
        '  (:CODPROD, :CODFORN, :QTDEATUAL, :QTDENOVA, :QTDEFINAL, :MOTIV' +
        'O, :DOC, '
      '   :DTAJUST)')
    RefreshSQL.Strings = (
      'Select '
      '  CODPROD,'
      '  CODFORN,'
      '  QTDEATUAL,'
      '  QTDENOVA,'
      '  QTDEFINAL,'
      '  MOTIVO,'
      '  DOC,'
      '  DTAJUST'
      'from TBAJUSTESTOQ '
      'where'
      '  CODPROD = :CODPROD')
    SelectSQL.Strings = (
      'select * from TBAJUSTESTOQ')
    ModifySQL.Strings = (
      'update TBAJUSTESTOQ'
      'set'
      '  CODPROD = :CODPROD,'
      '  CODFORN = :CODFORN,'
      '  QTDEATUAL = :QTDEATUAL,'
      '  QTDENOVA = :QTDENOVA,'
      '  QTDEFINAL = :QTDEFINAL,'
      '  MOTIVO = :MOTIVO,'
      '  DOC = :DOC,'
      '  DTAJUST = :DTAJUST'
      'where'
      '  CODPROD = :OLD_CODPROD')
    ParamCheck = True
    UniDirectional = False
    Left = 144
    Top = 8
    object ibdtstAjustEstoqCODPROD: TIBStringField
      FieldName = 'CODPROD'
      Origin = 'TBAJUSTESTOQ.CODPROD'
      Required = True
      Size = 10
    end
    object ibdtstAjustEstoqCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = 'TBAJUSTESTOQ.CODFORN'
    end
    object ibdtstAjustEstoqMOTIVO: TIBStringField
      FieldName = 'MOTIVO'
      Origin = 'TBAJUSTESTOQ.MOTIVO'
      Size = 40
    end
    object ibdtstAjustEstoqDOC: TIBStringField
      FieldName = 'DOC'
      Origin = 'TBAJUSTESTOQ.DOC'
      Size = 10
    end
    object ibdtstAjustEstoqDTAJUST: TDateTimeField
      FieldName = 'DTAJUST'
      Origin = 'TBAJUSTESTOQ.DTAJUST'
    end
    object ibdtstAjustEstoqLookProdNome: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProdNome'
      LookupDataSet = ibdtstProduto
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCRI'
      KeyFields = 'CODPROD'
      Lookup = True
    end
    object ibdtstAjustEstoqLookProdQtde: TIntegerField
      FieldKind = fkLookup
      FieldName = 'LookProdQtde'
      LookupDataSet = ibdtstProduto
      LookupKeyFields = 'COD'
      LookupResultField = 'QTDE'
      KeyFields = 'CODPROD'
      Lookup = True
    end
    object ibdtstAjustEstoqLookFornec: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFornec'
      LookupDataSet = ibdtstFornec
      LookupKeyFields = 'CODFORN'
      LookupResultField = 'NOMEFORN'
      KeyFields = 'CODFORN'
      Lookup = True
    end
    object ibdtstAjustEstoqCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBAJUSTESTOQ"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibdtstAjustEstoqCODEMPRESA: TIBStringField
      FieldName = 'CODEMPRESA'
      Origin = '"TBAJUSTESTOQ"."CODEMPRESA"'
      Size = 18
    end
    object ibdtstAjustEstoqQTDEATUAL: TIBBCDField
      FieldName = 'QTDEATUAL'
      Origin = '"TBAJUSTESTOQ"."QTDEATUAL"'
      Precision = 18
      Size = 3
    end
    object ibdtstAjustEstoqQTDENOVA: TIBBCDField
      FieldName = 'QTDENOVA'
      Origin = '"TBAJUSTESTOQ"."QTDENOVA"'
      Precision = 18
      Size = 3
    end
    object ibdtstAjustEstoqQTDEFINAL: TIBBCDField
      FieldName = 'QTDEFINAL'
      Origin = '"TBAJUSTESTOQ"."QTDEFINAL"'
      Precision = 18
      Size = 3
    end
    object ibdtstAjustEstoqUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBAJUSTESTOQ"."USUARIO"'
      Size = 50
    end
  end
  object ibdtstProduto: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = True
    SelectSQL.Strings = (
      'select COD, DESCRI, QTDE from TBPRODUTO'
      'order by cod')
    ParamCheck = True
    UniDirectional = False
    Left = 232
    Top = 8
  end
  object ibdtstFornec: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select CODFORN, NOMEFORN from TBFORNECEDOR'
      'order by NOMEFORN')
    ParamCheck = True
    UniDirectional = False
    Left = 312
    Top = 8
  end
  object dtsrcUsers: TDataSource
    DataSet = fdQryUsers
    Left = 896
    Top = 208
  end
  object IdIPWatch: TIdIPWatch
    Active = True
    HistoryFilename = 'NetWorkActiveDGE.dat'
    Left = 112
    Top = 504
  end
  object stpCaixaMovimentoREC: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_REC'
    Left = 144
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ANOLANC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMLANC'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'SEQ'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_BAIXA'
        ParamType = ptInput
      end>
  end
  object stpCaixaMovimentoPAG: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_PAG'
    Left = 144
    Top = 264
  end
  object stpContaCorrenteSaldo: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CONTA_CORRENTE_SALDO'
    Left = 144
    Top = 312
  end
  object stpCaixaMovimentoREC_ESTORNO: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_REC_ESTORNO'
    Left = 320
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ANOLANC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMLANC'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'SEQ'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_BAIXA'
        ParamType = ptInput
      end>
  end
  object stpCaixaMovimentoPAG_ESTORNO: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_PAG_ESTORNO'
    Left = 320
    Top = 264
  end
  object cdsLicenca: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from SYS_LICENCA'
      'where'
      '  LINHA_CONTROLE = :OLD_LINHA_CONTROLE')
    InsertSQL.Strings = (
      'insert into SYS_LICENCA'
      '  (LINHA_CONTROLE)'
      'values'
      '  (:LINHA_CONTROLE)')
    RefreshSQL.Strings = (
      'Select '
      '  LINHA_CONTROLE'
      'from SYS_LICENCA '
      'where'
      '  LINHA_CONTROLE = :LINHA_CONTROLE')
    SelectSQL.Strings = (
      'Select * from SYS_LICENCA')
    ModifySQL.Strings = (
      'update SYS_LICENCA'
      'set'
      '  LINHA_CONTROLE = :LINHA_CONTROLE'
      'where'
      '  LINHA_CONTROLE = :OLD_LINHA_CONTROLE')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.ApplyEvent = gamOnServer
    Left = 416
    Top = 32
    object cdsLicencaLINHA_CONTROLE: TIBStringField
      FieldName = 'LINHA_CONTROLE'
      Origin = '"SYS_LICENCA"."LINHA_CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 250
    end
  end
  object opdLicenca: TOpenDialog
    Filter = 'Arquivo Licen'#231'a (*.lnc)|*.lnc'
    Title = 'Carregar arquivo Licen'#231'a'
    Left = 448
    Top = 32
  end
  object frxPDF: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 40
    Top = 168
  end
  object frxXLS: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 40
    Top = 216
  end
  object frxRTF: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 40
    Top = 264
  end
  object frxJPEG: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Left = 40
    Top = 312
  end
  object frxMailExport: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Lines.Strings = (
      'Teste')
    ShowExportDialog = True
    SmtpPort = 587
    UseIniFile = False
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = SMTP
    Left = 40
    Top = 360
  end
  object frxRichObject: TfrxRichObject
    Left = 40
    Top = 408
  end
  object frxCrossObject: TfrxCrossObject
    Left = 40
    Top = 456
  end
  object frxChartObject: TfrxChartObject
    Left = 40
    Top = 504
  end
  object fastReport: TfrxReport
    Version = '5.1.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42158.403894398150000000
    ReportOptions.LastChange = 42158.403894398150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 40
    Top = 120
    Datasets = <>
    Variables = <>
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
    end
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 112
    Top = 408
  end
  object ACBrMail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Priority = MP_high
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 112
    Top = 456
  end
  object spAtualizarCustoApEntrada: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SP_UPD_CUSTO_APROP_ENTRADA'
    Left = 580
    Top = 240
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'ANO'
        ParamType = ptInput
      end>
  end
  object spAtualizarCustoApAutorizacao: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SP_UPD_CUSTO_APROP_AUTORIZ'
    Left = 580
    Top = 288
  end
  object spAtualizarCustoEstoqueAlmoxarifado: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SP_UPD_CUSTO_ESTOQUE_APROP'
    Left = 580
    Top = 336
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'ANO'
        ParamType = ptInput
      end>
  end
  object spAtualizarCustoEstoqueRequisicao: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SP_UPD_CUSTO_ESTOQUE_REQUI'
    Left = 580
    Top = 384
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'ANO_MOVIMENTO'
        ParamType = ptInput
      end>
  end
  object spAtualizarCustoEstoqueInventario: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SP_UPD_CUSTO_INVENTARIO_ALMOX'
    Left = 580
    Top = 432
  end
  object fdConexao: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=AGIL_COMERCIO'
      'Protocol=TCPIP'
      'CharacterSet=ISO8859_2'
      'Port=3050'
      'Server=localhost'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    Left = 800
    Top = 160
  end
  object fdIBDriverLink: TFDPhysIBDriverLink
    Left = 832
    Top = 160
  end
  object fdFBDriverLink: TFDPhysFBDriverLink
    Left = 864
    Top = 160
  end
  object fdTransacao: TFDTransaction
    Connection = fdConexao
    Left = 800
    Top = 208
  end
  object fdQryUsers: TFDQuery
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    SQL.Strings = (
      'Select'
      '    u.nome'
      '  , u.senha'
      '  , u.nomecompleto'
      '  , u.codfuncao'
      '  , u.limidesc'
      '  , u.ativo'
      '  , u.alterar_senha'
      '  , u.perm_alterar_valor_venda'
      '  , u.tipo_alterar_valor_venda'
      '  , u.vendedor'
      '  , u.almox_manifesto_automatico'
      'from TBUSERS u'
      ''
      'where coalesce(u.ativo, 1) = 1'
      ''
      'order by'
      '    u.nome')
    Left = 864
    Top = 208
  end
  object fdQryEmpresa: TFDQuery
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    SQL.Strings = (
      'Select '
      '    cnpj'
      '  , nmfant'
      'from TBEMPRESA')
    Left = 864
    Top = 256
  end
  object fdWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 896
    Top = 160
  end
  object fdSetSistema: TFDStoredProc
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SET_SISTEMA'
    Left = 896
    Top = 256
    ParamData = <
      item
        Position = 1
        Name = 'CODIGO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 3
        Name = 'VERSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object fdSetRotina: TFDStoredProc
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SET_ROTINA'
    Left = 928
    Top = 256
    ParamData = <
      item
        Position = 1
        Name = 'SISTEMA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 3
        Name = 'TIPO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end
      item
        Position = 5
        Name = 'ROTINA_PAI'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object fdQryConfiguracoes: TFDQuery
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    SQL.Strings = (
      'Select'
      '    c.empresa as empresa_cnpj'
      '  , e.rzsoc   as empresa_razao'
      '  , e.nmfant  as empresa_fantasia'
      '  , e.ender   as empresa_end'
      '  , e.numero_end  as empresa_end_nro'
      '  , e.complemento as empresa_end_compl'
      '  , e.bairro      as empresa_end_bairro'
      '  , e.cep         as empresa_end_cep'
      '  , e.cidade      as empresa_end_cidade'
      '  , e.uf          as empresa_end_uf'
      
        '  , '#39'+55 ('#39' || substring(e.fone  from 1 for 2) || '#39')'#39' || substri' +
        'ng(e.fone  from 3 for 4) || '#39'.'#39' || substring(e.fone  from 7 for ' +
        '4) as empresa_fone_1'
      
        '  , '#39'+55 ('#39' || substring(e.fone2 from 1 for 2) || '#39')'#39' || substri' +
        'ng(e.fone2 from 3 for 4) || '#39'.'#39' || substring(e.fone2 from 7 for ' +
        '4) as empresa_fone_2'
      '  , e.email       as empresa_email'
      '  , e.home_page   as empresa_homepage'
      '  , c.email_conta'
      '  , c.email_senha'
      '  , c.email_pop'
      '  , c.email_smtp'
      '  , c.email_smtp_porta'
      '  , c.email_requer_autenticacao'
      '  , c.email_conexao_ssl'
      '  , c.email_assunto_padrao'
      '  , c.email_mensagem_padrao'
      'from TBCONFIGURACAO c'
      '  inner join TBEMPRESA e on (e.cnpj = c.empresa)'
      'where c.empresa = :empresa')
    Left = 864
    Top = 304
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
  end
  object frxBarCodeObject: TfrxBarCodeObject
    Left = 40
    Top = 552
  end
  object fdQryBusca: TFDQuery
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    SQL.Strings = (
      'Select'
      '    c.empresa as empresa_cnpj'
      '  , e.rzsoc   as empresa_razao'
      '  , e.nmfant  as empresa_fantasia'
      '  , e.ender   as empresa_end'
      '  , e.numero_end  as empresa_end_nro'
      '  , e.complemento as empresa_end_compl'
      '  , e.bairro      as empresa_end_bairro'
      '  , e.cep         as empresa_end_cep'
      '  , e.cidade      as empresa_end_cidade'
      '  , e.uf          as empresa_end_uf'
      
        '  , '#39'+55 ('#39' || substring(e.fone  from 1 for 2) || '#39')'#39' || substri' +
        'ng(e.fone  from 3 for 4) || '#39'.'#39' || substring(e.fone  from 7 for ' +
        '4) as empresa_fone_1'
      
        '  , '#39'+55 ('#39' || substring(e.fone2 from 1 for 2) || '#39')'#39' || substri' +
        'ng(e.fone2 from 3 for 4) || '#39'.'#39' || substring(e.fone2 from 7 for ' +
        '4) as empresa_fone_2'
      '  , e.email       as empresa_email'
      '  , e.home_page   as empresa_homepage'
      '  , c.email_conta'
      '  , c.email_senha'
      '  , c.email_pop'
      '  , c.email_smtp'
      '  , c.email_smtp_porta'
      '  , c.email_requer_autenticacao'
      '  , c.email_conexao_ssl'
      '  , c.email_assunto_padrao'
      '  , c.email_mensagem_padrao'
      'from TBCONFIGURACAO c'
      '  inner join TBEMPRESA e on (e.cnpj = c.empresa)'
      'where c.empresa = :empresa')
    Left = 864
    Top = 352
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
  end
  object fdQryCaixaAberto: TFDQuery
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    SQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Usuario'
      '  , c.Data_abertura'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      
        'from GET_CAIXA_ABERTO_DETALHE(:Empresa, :Usuario, :Data, :FormaP' +
        'agto) c')
    Left = 864
    Top = 400
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'FORMAPAGTO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdScript: TFDScript
    SQLScripts = <>
    Connection = fdConexao
    Transaction = fdTransacao
    Params = <>
    Macros = <>
    OnError = fdScriptError
    BeforeExecute = fdScriptBeforeExecute
    Left = 800
    Top = 256
  end
end
