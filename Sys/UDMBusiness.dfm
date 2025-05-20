object DMBusiness: TDMBusiness
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 597
  Width = 973
  object dtsrcUsers: TDataSource
    DataSet = fdQryUsers
    Left = 280
    Top = 88
  end
  object IdIPWatch: TIdIPWatch
    Active = False
    HistoryEnabled = False
    HistoryFilename = 'iphist.dat'
    Left = 112
    Top = 504
  end
  object opdLicenca: TOpenDialog
    Filter = 'Arquivo Licen'#231'a (*.lnc)|*.lnc'
    Title = 'Carregar arquivo Licen'#231'a'
    Left = 568
    Top = 40
  end
  object frxPDF: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 40
    Top = 168
  end
  object frxRTF: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    OpenAfterExport = False
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 40
    Top = 224
  end
  object frxJPEG: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Left = 40
    Top = 328
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
    MAPISendFlag = 0
    Left = 40
    Top = 280
  end
  object frxRichObject: TfrxRichObject
    Left = 40
    Top = 408
  end
  object frxCrossObject: TfrxCrossObject
    Left = 40
    Top = 456
  end
  object fastReport: TfrxReport
    Version = '2022.3'
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
      Frame.Typ = []
      MirrorMode = []
    end
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 112
    Top = 408
  end
  object fdConexao: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=AGIL_COMERCIO'
      'Protocol=TCPIP'
      'CharacterSet=ISO8859_2'
      'Port=3030'
      'Server=localhost'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    Left = 184
    Top = 40
  end
  object fdIBDriverLink: TFDPhysIBDriverLink
    Left = 216
    Top = 40
  end
  object fdFBDriverLink: TFDPhysFBDriverLink
    Left = 248
    Top = 40
  end
  object fdTransacao: TFDTransaction
    Connection = fdConexao
    Left = 184
    Top = 88
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
    Left = 248
    Top = 88
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
    Left = 248
    Top = 136
  end
  object fdWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 280
    Top = 40
  end
  object fdSetSistema: TFDStoredProc
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SET_SISTEMA'
    Left = 280
    Top = 136
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
    Left = 312
    Top = 136
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
    Left = 248
    Top = 184
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
    Top = 512
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
    Left = 248
    Top = 232
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
    Left = 248
    Top = 280
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
    BeforeExecute = fdScriptBeforeExecute
    Left = 184
    Top = 136
  end
  object fdQryUpgrade: TFDQuery
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    UpdateObject = fdUpdUpgrade
    SQL.Strings = (
      'Select'
      '    u.sis_cod'
      '  , u.sis_version'
      '  , u.upgrade_sql'
      '  , u.upgrade_data'
      '  , u.upgrade_error'
      '  , u.upgrade_ok'
      'from SYS_UPGRADE u'
      'where u.sis_cod = :sistema'
      '  and u.sis_version = :versao')
    Left = 248
    Top = 328
    ParamData = <
      item
        Name = 'SISTEMA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VERSAO'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object fdUpdUpgrade: TFDUpdateSQL
    Connection = fdConexao
    InsertSQL.Strings = (
      'INSERT INTO SYS_UPGRADE'
      '(SIS_COD, SIS_VERSION, UPGRADE_SQL, UPGRADE_DATA, '
      '  UPGRADE_ERROR, UPGRADE_OK)'
      
        'VALUES (:NEW_SIS_COD, :NEW_SIS_VERSION, :NEW_UPGRADE_SQL, :NEW_U' +
        'PGRADE_DATA, '
      '  :NEW_UPGRADE_ERROR, :NEW_UPGRADE_OK)')
    ModifySQL.Strings = (
      'UPDATE SYS_UPGRADE'
      
        'SET SIS_COD = :NEW_SIS_COD, SIS_VERSION = :NEW_SIS_VERSION, UPGR' +
        'ADE_SQL = :NEW_UPGRADE_SQL, '
      
        '  UPGRADE_DATA = :NEW_UPGRADE_DATA, UPGRADE_ERROR = :NEW_UPGRADE' +
        '_ERROR, '
      '  UPGRADE_OK = :NEW_UPGRADE_OK'
      'WHERE SIS_COD = :OLD_SIS_COD AND SIS_VERSION = :OLD_SIS_VERSION')
    DeleteSQL.Strings = (
      'DELETE FROM SYS_UPGRADE'
      'WHERE SIS_COD = :OLD_SIS_COD AND SIS_VERSION = :OLD_SIS_VERSION')
    FetchRowSQL.Strings = (
      
        'SELECT SIS_COD, SIS_VERSION, UPGRADE_SQL, UPGRADE_DATA, UPGRADE_' +
        'ERROR, '
      '  UPGRADE_OK'
      'FROM SYS_UPGRADE'
      'WHERE SIS_COD = :SIS_COD AND SIS_VERSION = :SIS_VERSION')
    Left = 280
    Top = 328
  end
  object cdsLicencaXXX: TFDTable
    CachedUpdates = True
    IndexFieldNames = 'LINHA_CONTROLE'
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    UpdateOptions.UpdateTableName = 'SYS_LICENCA'
    TableName = 'SYS_LICENCA'
    Left = 536
    Top = 40
    object cdsLicencaXXXLINHA_CONTROLE: TStringField
      FieldName = 'LINHA_CONTROLE'
      Origin = 'LINHA_CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 250
    end
  end
  object stpCaixaMovimentoREC: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SET_CAIXA_MOVIMENTO_REC'
    Left = 536
    Top = 88
    ParamData = <
      item
        Position = 1
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Position = 2
        Name = 'DATA_PAGTO'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'FORMA_PAGTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'ANOLANC'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'NUMLANC'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'SEQ'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'VALOR_BAIXA'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object stpCaixaMovimentoPAG: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SET_CAIXA_MOVIMENTO_PAG'
    Left = 536
    Top = 136
    ParamData = <
      item
        Position = 1
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Position = 2
        Name = 'DATA_PAGTO'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'FORMA_PAGTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'ANOLANC'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'NUMLANC'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'SEQ'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'VALOR_BAIXA'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object stpContaCorrenteSaldo: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SET_CONTA_CORRENTE_SALDO'
    Left = 536
    Top = 184
    ParamData = <
      item
        Position = 1
        Name = 'CONTA_CORRENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'DATA_MOVIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object stpCaixaMovimentoREC_ESTORNO: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SET_CAIXA_MOVIMENTO_REC_ESTORNO'
    Left = 536
    Top = 280
    ParamData = <
      item
        Position = 1
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Position = 2
        Name = 'DATA_PAGTO'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'FORMA_PAGTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'ANOLANC'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'NUMLANC'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'SEQ'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'VALOR_BAIXA'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object stpCaixaMovimentoPAG_ESTORNO: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SET_CAIXA_MOVIMENTO_PAG_ESTORNO'
    Left = 536
    Top = 328
    ParamData = <
      item
        Position = 1
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Position = 2
        Name = 'DATA_PAGTO'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'FORMA_PAGTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'ANOLANC'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'NUMLANC'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'SEQ'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'VALOR_BAIXA'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object spAtualizarCustoApEntrada: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SP_UPD_CUSTO_APROP_ENTRADA'
    Left = 728
    Top = 40
    ParamData = <
      item
        Position = 1
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object spAtualizarCustoApAutorizacao: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SP_UPD_CUSTO_APROP_AUTORIZ'
    Left = 728
    Top = 88
    ParamData = <
      item
        Position = 1
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object spAtualizarCustoEstoqueAlmoxarifado: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SP_UPD_CUSTO_ESTOQUE_APROP'
    Left = 728
    Top = 136
    ParamData = <
      item
        Position = 1
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object spAtualizarCustoEstoqueRequisicao: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SP_UPD_CUSTO_ESTOQUE_REQUI'
    Left = 728
    Top = 184
    ParamData = <
      item
        Position = 1
        Name = 'ANO_MOVIMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object spAtualizarCustoEstoqueInventario: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SP_UPD_CUSTO_INVENTARIO_ALMOX'
    Left = 728
    Top = 232
    ParamData = <
      item
        Position = 1
        Name = 'ANO_MOVIMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object frxXLSX: TfrxXLSXExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 80
    Top = 224
  end
  object frxDOCX: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    ExportType = dxTable
    Left = 120
    Top = 328
  end
  object frxODS: TfrxODSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 0.000000000000000000
    DataOnly = False
    PictureType = gpPNG
    OpenAfterExport = False
    Background = True
    Creator = 'FastReport'
    SingleSheet = False
    Language = 'en'
    SuppressPageHeadersFooters = False
    Left = 80
    Top = 328
  end
  object frxODT: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 0.000000000000000000
    DataOnly = False
    PictureType = gpPNG
    OpenAfterExport = False
    Background = True
    Creator = 'FastReport'
    SingleSheet = False
    Language = 'en'
    SuppressPageHeadersFooters = False
    Left = 120
    Top = 224
  end
  object frxXML: TfrxXMLExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 120
    Top = 280
  end
  object stpContaCorrenteSaldo_v2: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SET_CONTA_CORRENTE_SALDO_V2'
    Left = 536
    Top = 232
    ParamData = <
      item
        Position = 1
        Name = 'CONTA_CORRENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object frxXLS: TfrxXLSExport
    ShowDialog = False
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
    Left = 80
    Top = 280
  end
  object cdsRegistro: TFDQuery
    CachedUpdates = True
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    UpdateObject = updRegistro
    SQL.Strings = (
      'Select'
      '    e.EST_LOCAL'
      '  , e.EST_NOME'
      '  , e.EST_IP'
      '  , e.EST_REGISTRO'
      '  , e.EST_ULTIMO_ACESSO'
      'from SYS_ESTACAO e'
      ''
      'order by'
      '    e.EST_LOCAL'
      '  , e.EST_NOME')
    Left = 593
    Top = 488
    object cdsRegistroEST_LOCAL: TStringField
      FieldName = 'EST_LOCAL'
      Origin = 'EST_LOCAL'
      Size = 100
    end
    object cdsRegistroEST_NOME: TStringField
      FieldName = 'EST_NOME'
      Origin = 'EST_NOME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 60
    end
    object cdsRegistroEST_IP: TStringField
      FieldName = 'EST_IP'
      Origin = 'EST_IP'
      Size = 30
    end
    object cdsRegistroEST_REGISTRO: TStringField
      FieldName = 'EST_REGISTRO'
      Origin = 'EST_REGISTRO'
      Size = 250
    end
    object cdsRegistroEST_ULTIMO_ACESSO: TSQLTimeStampField
      FieldName = 'EST_ULTIMO_ACESSO'
      Origin = 'EST_ULTIMO_ACESSO'
    end
  end
  object updRegistro: TFDUpdateSQL
    Connection = fdConexao
    InsertSQL.Strings = (
      'INSERT INTO SYS_ESTACAO'
      '(EST_NOME, EST_IP, EST_LOCAL, EST_REGISTRO, '
      '  EST_ULTIMO_ACESSO)'
      
        'VALUES (:NEW_EST_NOME, :NEW_EST_IP, :NEW_EST_LOCAL, :NEW_EST_REG' +
        'ISTRO, '
      '  :NEW_EST_ULTIMO_ACESSO)')
    ModifySQL.Strings = (
      'UPDATE SYS_ESTACAO'
      
        'SET EST_NOME = :NEW_EST_NOME, EST_IP = :NEW_EST_IP, EST_LOCAL = ' +
        ':NEW_EST_LOCAL, '
      
        '  EST_REGISTRO = :NEW_EST_REGISTRO, EST_ULTIMO_ACESSO = :NEW_EST' +
        '_ULTIMO_ACESSO'
      'WHERE EST_NOME = :OLD_EST_NOME')
    DeleteSQL.Strings = (
      'DELETE FROM SYS_ESTACAO'
      'WHERE EST_NOME = :OLD_EST_NOME')
    FetchRowSQL.Strings = (
      
        'SELECT EST_NOME, EST_IP, EST_LOCAL, EST_REGISTRO, EST_ULTIMO_ACE' +
        'SSO'
      'FROM SYS_ESTACAO'
      'WHERE EST_NOME = :EST_NOME')
    Left = 625
    Top = 488
  end
  object dtsRegistro: TDataSource
    AutoEdit = False
    DataSet = cdsRegistro
    Left = 656
    Top = 488
  end
  object ACBrMail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 112
    Top = 456
  end
  object spAtualizarCustoEstoqueGeral: TFDStoredProc
    Connection = fdConexao
    Transaction = fdTransacao
    UpdateTransaction = fdTransacao
    StoredProcName = 'SP_UPD_CUSTO_GERAL_ESTOQUE'
    Left = 728
    Top = 280
  end
end
