object DMBusiness: TDMBusiness
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 445
  Top = 247
  Height = 617
  Width = 812
  object ibdtbsBusiness: TIBDatabase
    DatabaseName = 'localhost:AGIL_COMERCIO'
    Params.Strings = (
      'user_name=SYSDBA'
      'Password=masterkey'
      'lc_ctype=ISO8859_2')
    LoginPrompt = False
    DefaultTransaction = ibtrnsctnBusiness
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
    CachedUpdates = True
    SelectSQL.Strings = (
      'select COD, DESCRI, QTDE from TBPRODUTO'
      'order by cod')
    Left = 232
    Top = 8
  end
  object ibdtstFornec: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    SelectSQL.Strings = (
      'select CODFORN, NOMEFORN from TBFORNECEDOR'
      'order by NOMEFORN')
    Left = 312
    Top = 8
  end
  object qryBusca: TIBQuery
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    CachedUpdates = True
    Left = 232
    Top = 56
  end
  object ibdtstUsers: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      '  (NOME, SENHA, NOMECOMPLETO, CODFUNCAO, LIMIDESC)'
      'values'
      '  (:NOME, :SENHA, :NOMECOMPLETO, :CODFUNCAO, :LIMIDESC)')
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  SENHA,'
      '  NOMECOMPLETO,'
      '  CODFUNCAO,'
      '  LIMIDESC'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    SelectSQL.Strings = (
      'Select'
      '    u.nome'
      '  , u.senha'
      '  , u.nomecompleto'
      '  , u.codfuncao'
      '  , u.limidesc'
      '  , u.ativo'
      '  , u.alterar_senha'
      '  , u.perm_alterar_valor_venda'
      '  , u.vendedor'
      'from TBUSERS u'
      ''
      'where coalesce(u.ativo, 1) = 1'
      ''
      'order by'
      '    u.nome')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  NOMECOMPLETO = :NOMECOMPLETO,'
      '  CODFUNCAO = :CODFUNCAO,'
      '  LIMIDESC = :LIMIDESC'
      'where'
      '  NOME = :OLD_NOME')
    Left = 144
    Top = 120
    object ibdtstUsersNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"TBUSERS"."NOME"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 12
    end
    object ibdtstUsersSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"TBUSERS"."SENHA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 16
    end
    object ibdtstUsersNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Origin = '"TBUSERS"."NOMECOMPLETO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object ibdtstUsersCODFUNCAO: TSmallintField
      FieldName = 'CODFUNCAO'
      Origin = '"TBUSERS"."CODFUNCAO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ibdtstUsersLIMIDESC: TIBBCDField
      FieldName = 'LIMIDESC'
      Origin = '"TBUSERS"."LIMIDESC"'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object ibdtstUsersATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = '"TBUSERS"."ATIVO"'
      ProviderFlags = [pfInUpdate]
    end
    object ibdtstUsersALTERAR_SENHA: TSmallintField
      FieldName = 'ALTERAR_SENHA'
      Origin = '"TBUSERS"."ALTERAR_SENHA"'
      Required = True
    end
    object ibdtstUsersPERM_ALTERAR_VALOR_VENDA: TSmallintField
      FieldName = 'PERM_ALTERAR_VALOR_VENDA'
      Origin = '"TBUSERS"."PERM_ALTERAR_VALOR_VENDA"'
      ProviderFlags = [pfInUpdate]
    end
    object ibdtstUsersVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      Origin = '"TBUSERS"."VENDEDOR"'
    end
  end
  object EvMsgDialog: TEvMsgDlg
    ButtonFont.Charset = ANSI_CHARSET
    ButtonFont.Color = clWindowText
    ButtonFont.Height = -11
    ButtonFont.Name = 'Tahoma'
    ButtonFont.Style = []
    MessageFont.Charset = DEFAULT_CHARSET
    MessageFont.Color = clWindowText
    MessageFont.Height = -11
    MessageFont.Name = 'MS Sans Serif'
    MessageFont.Style = []
    Left = 312
    Top = 56
  end
  object dtsrcUsers: TDataSource
    DataSet = ibdtstUsers
    Left = 208
    Top = 120
  end
  object raveReport: TRvProject
    Left = 40
    Top = 120
  end
  object IdIPWatch: TIdIPWatch
    Active = True
    HistoryFilename = 'NetWorkActiveDGE.dat'
    Left = 312
    Top = 104
  end
  object qryCaixaAberto: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      '  (NOME, SENHA, NOMECOMPLETO, CODFUNCAO, LIMIDESC)'
      'values'
      '  (:NOME, :SENHA, :NOMECOMPLETO, :CODFUNCAO, :LIMIDESC)')
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  SENHA,'
      '  NOMECOMPLETO,'
      '  CODFUNCAO,'
      '  LIMIDESC'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    SelectSQL.Strings = (
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
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  NOMECOMPLETO = :NOMECOMPLETO,'
      '  CODFUNCAO = :CODFUNCAO,'
      '  LIMIDESC = :LIMIDESC'
      'where'
      '  NOME = :OLD_NOME')
    Left = 144
    Top = 168
    object qryCaixaAbertoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBCAIXA.ANO'
      Required = True
    end
    object qryCaixaAbertoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TBCAIXA.NUMERO'
      Required = True
    end
    object qryCaixaAbertoUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = 'TBCAIXA.USUARIO'
      Size = 12
    end
    object qryCaixaAbertoDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'TBCAIXA.DATA_ABERTURA'
    end
    object qryCaixaAbertoCONTA_CORRENTE: TIntegerField
      FieldName = 'CONTA_CORRENTE'
      Origin = 'TBCAIXA.CONTA_CORRENTE'
    end
    object qryCaixaAbertoVALOR_TOTAL_CREDITO: TIBBCDField
      FieldName = 'VALOR_TOTAL_CREDITO'
      Precision = 18
      Size = 2
    end
    object qryCaixaAbertoVALOR_TOTAL_DEBITO: TIBBCDField
      FieldName = 'VALOR_TOTAL_DEBITO'
      Precision = 18
      Size = 2
    end
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
    Left = 176
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
    Left = 176
    Top = 264
  end
  object qryEvAcessUser: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    ev.form_name'
      '  , ev.object_name'
      '  , ev.consents_string'
      'from TBUSERALLOW ev'
      'where ev.form_name   = :formulario'
      '  and ev.object_name = :objeto')
    ModifySQL.Strings = (
      '')
    UpdateObject = updEvAcessUser
    Left = 376
    Top = 216
    object qryEvAcessUserFORM_NAME: TIBStringField
      FieldName = 'FORM_NAME'
      Origin = '"TBUSERALLOW"."FORM_NAME"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 250
    end
    object qryEvAcessUserOBJECT_NAME: TIBStringField
      FieldName = 'OBJECT_NAME'
      Origin = '"TBUSERALLOW"."OBJECT_NAME"'
      Size = 50
    end
    object qryEvAcessUserCONSENTS_STRING: TMemoField
      FieldName = 'CONSENTS_STRING'
      Origin = '"TBUSERALLOW"."CONSENTS_STRING"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object updEvAcessUser: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  FORM_NAME,'
      '  OBJECT_NAME,'
      '  CONSENTS_STRING'
      'from TBUSERALLOW '
      'where'
      '  FORM_NAME = :FORM_NAME')
    ModifySQL.Strings = (
      'update TBUSERALLOW'
      'set'
      '  CONSENTS_STRING = :CONSENTS_STRING,'
      '  FORM_NAME = :FORM_NAME,'
      '  OBJECT_NAME = :OBJECT_NAME'
      'where'
      '  FORM_NAME = :OLD_FORM_NAME')
    InsertSQL.Strings = (
      'insert into TBUSERALLOW'
      '  (CONSENTS_STRING, FORM_NAME, OBJECT_NAME)'
      'values'
      '  (:CONSENTS_STRING, :FORM_NAME, :OBJECT_NAME)')
    DeleteSQL.Strings = (
      'delete from TBUSERALLOW'
      'where'
      '  FORM_NAME = :OLD_FORM_NAME')
    Left = 408
    Top = 216
  end
  object ibqryEmpresa: TIBQuery
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    SQL.Strings = (
      'select CNPJ, NMFANT from TBEMPRESA')
    Left = 312
    Top = 160
    object ibqryEmpresaCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBEMPRESA.CNPJ'
      Required = True
      Size = 18
    end
    object ibqryEmpresaNMFANT: TIBStringField
      FieldName = 'NMFANT'
      Origin = 'TBEMPRESA.NMFANT'
      Size = 25
    end
  end
  object qryConfiguracoes: TIBQuery
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
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
    Left = 504
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
  end
  object setSistema: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_SISTEMA'
    Left = 376
    Top = 264
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VERSAO'
        ParamType = ptInput
      end>
  end
  object setRotina: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_ROTINA'
    Left = 376
    Top = 312
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'SISTEMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ROTINA_PAI'
        ParamType = ptInput
      end>
  end
  object cdsLicenca: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
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
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
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
    ExportEMF = True
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
    Left = 40
    Top = 312
  end
  object frxMailExport: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Lines.Strings = (
      'Teste')
    ShowExportDialog = True
    SmtpPort = 587
    UseIniFile = False
    TimeOut = 60
    ConfurmReading = False
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
    Version = '4.9.72'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 41908.370771388900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure DadosProdutosFooterOnBeforePrint(Sender: TfrxComponent' +
        ');'
      'begin'
      'if Engine.FinalPass then'
      'begin              '
      '    '
      '  while Engine.FreeSpace >= 10 do'
      '    Engine.ShowBand(Child1);'
      '  Engine.ShowBand(Child2);'
      'end;            '
      'end;'
      ''
      
        'procedure DadosProdutosHeaderOnBeforePrint(Sender: TfrxComponent' +
        ');'
      'begin'
      'if Engine.FinalPass then'
      'begin    '
      '    set('#39'LinhasImpressas'#39',0);'
      'end;              '
      'end;'
      ''
      'procedure DadosProdutosOnAfterPrint(Sender: TfrxComponent);'
      'begin'
      'if Engine.FinalPass then'
      'begin    '
      '  set('#39'LinhasImpressas'#39',StrToInt(get('#39'LinhasImpressas'#39'))+1);'
      
        '  if (StrToInt(VarToStr(<Parametros."LinhasPorPagina">)) > 0) th' +
        'en'
      '  begin              '
      
        '    if (StrToInt(get('#39'LinhasImpressas'#39')) = StrToInt(VarToStr(<Pa' +
        'rametros."LinhasPorPagina">))) then    '
      '      Engine.ShowBand(DadosProdutosFooter);              '
      '  end;'
      'end;            '
      'end;'
      ''
      'procedure EmitenteOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if Engine.FinalPass then'
      'begin              '
      '  if Trim(VarToStr(<Parametros."Imagem">)) <> '#39#39' then'
      '  begin              '
      '    if Trim(VarToStr(<Parametros."LogoExpandido">)) = '#39'1'#39' then'
      '    begin'
      '      MemEmitente.Font.Color := clWhite;'
      '      MemDadosEmitente.Visible := False;'
      '      imgLogo.Top := 5;'
      
        '      imgLogo.Height := memDadosEmitente.Height + (memDadosEmite' +
        'nte.Top - imgLogo.Top);                                         ' +
        '                              '
      
        '      imgLogo.Width := memDadosEmitente.Width + (memDadosEmitent' +
        'e.Left - imgLogo.Left);                                         ' +
        '     '
      '    end;'
      '  end '
      '  else'
      '  begin'
      '    MemDadosEmitente.Left := MemEmitente.Left;'
      '    MemDadosEmitente.Width := MemEmitente.Width;        '
      
        '    imgLogo.Visible := False;                                   ' +
        '                                   '
      '  end;'
      ''
      '  if (Trim(VarToStr(<Parametros."Contingencia_ID">)) = '#39#39') then'
      '    BarCodeContigencia.Visible := False;'
      'end;              '
      'end;'
      ''
      'procedure PageFooterOnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin              '
      '  //Fabio'
      '    PageFooter.Height := 0;      '
      '    PageFooter.Visible := False;'
      '  end;                     '
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin              '
      
        '    if ((Trim(VarToStr(<ISSQN."vISS">))='#39#39') or (Trim(VarToStr(<I' +
        'SSQN."vISS">))='#39'0'#39')) then'
      '    begin'
      '      ColumnFooter1.Visible := False;'
      '      ColumnFooter1.Height := 0;'
      '    end;                  '
      '  '
      '    if (trim(VarToStr(<Parametros."Mask_qCom">)) <> '#39#39') then'
      
        '      memqCom.DisplayFormat.FormatStr := VarToStr(<Parametros."M' +
        'ask_qCom">)  '
      '    else'
      
        '      memqCom.DisplayFormat.FormatStr := '#39'%2.'#39'+VarToStr(<Paramet' +
        'ros."Casas_qCom">)+'#39'f'#39';'
      ''
      '    if (trim(VarToStr(<Parametros."Mask_vUnCom">)) <> '#39#39') then'
      
        '      memvUnCom.DisplayFormat.FormatStr := VarToStr(<Parametros.' +
        '"Mask_vUnCom">)  '
      '    else'
      
        '      memvUnCom.DisplayFormat.FormatStr := '#39'%2.'#39'+VarToStr(<Param' +
        'etros."Casas_vUnCom">)+'#39'f'#39';'
      '  end;                       '
      'end;'
      ''
      'procedure ImpostoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin              '
      
        '    if (StrToFloat(VarToStr(<CalculoImposto."VTotTrib">)) = 0) t' +
        'hen        '
      '    begin              '
      '     QuadroVTOTTRIB.Visible:=False;'
      '     memVTOTTRIB.Visible:=False;'
      ''
      '     QuadroVST.Left := QuadroVST.Left+QuadroVTOTTRIB.Width;'
      '     memVST.Left := QuadroVST.Left;                       '
      ''
      '     QuadroVBCST.Left := QuadroVBCST.Left+QuadroVTOTTRIB.Width;'
      '     memVBCST.Left := QuadroVBCST.Left;                       '
      ''
      
        '     QuadroVBC.Width := QuadroVBC.Width+(QuadroVTOTTRIB.Width/2)' +
        ';'
      
        '     memVBC.Width := QuadroVBC.Width;                           ' +
        '                     '
      '     QuadroVICMS.Left := QuadroVBC.Width;'
      ''
      '     memVICMS.Left := QuadroVICMS.Left;'
      
        '     QuadroVICMS.Width := QuadroVICMS.Width+(QuadroVTOTTRIB.Widt' +
        'h/2);'
      
        '     memVICMS.Width := QuadroVICMS.Width;                       ' +
        '          '
      '   end;                                            '
      '  end;                   '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 72
    Top = 120
    Datasets = <
      item
        DataSet = dmACBrNFeFR.frxCalculoImposto
        DataSetName = 'CalculoImposto'
      end
      item
        DataSet = dmACBrNFeFR.frxDadosProdutos
        DataSetName = 'DadosProdutos'
      end
      item
        DataSet = dmACBrNFeFR.frxDestinatario
        DataSetName = 'Destinatario'
      end
      item
        DataSet = dmACBrNFeFR.frxDuplicatas
        DataSetName = 'Duplicatas'
      end
      item
        DataSet = dmACBrNFeFR.frxEmitente
        DataSetName = 'Emitente'
      end
      item
        DataSet = dmACBrNFeFR.frxFatura
        DataSetName = 'Fatura'
      end
      item
        DataSet = dmACBrNFeFR.frxIdentificacao
        DataSetName = 'Identificacao'
      end
      item
        DataSet = dmACBrNFeFR.frxInformacoesAdicionais
        DataSetName = 'InformacoesAdicionais'
      end
      item
        DataSet = dmACBrNFeFR.frxISSQN
        DataSetName = 'ISSQN'
      end
      item
        DataSet = dmACBrNFeFR.frxLocalEntrega
        DataSetName = 'LocalEntrega'
      end
      item
        DataSet = dmACBrNFeFR.frxLocalRetirada
        DataSetName = 'LocalRetirada'
      end
      item
        DataSet = dmACBrNFeFR.frxParametros
        DataSetName = 'Parametros'
      end
      item
        DataSet = dmACBrNFeFR.frxTransportador
        DataSetName = 'Transportador'
      end
      item
        DataSet = dmACBrNFeFR.frxVeiculo
        DataSetName = 'Veiculo'
      end
      item
        DataSet = dmACBrNFeFR.frxVolumes
        DataSetName = 'Volumes'
      end>
    Variables = <
      item
        Name = ' User'
        Value = Null
      end
      item
        Name = 'LinhasImpressas'
        Value = Null
      end
      item
        Name = 'NumeroPagina'
        Value = Null
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
      LeftMargin = 6.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 7.000000000000000000
      BottomMargin = 7.000000000000000000
      BackPictureVisible = False
      LargeDesignHeight = True
      OnBeforePrint = 'Page1OnBeforePrint'
      object DadosProdutos: TfrxMasterData
        Height = 11.338582680000000000
        Top = 1058.268400000000000000
        Width = 744.567410000000000000
        OnAfterPrint = 'DadosProdutosOnAfterPrint'
        DataSet = dmACBrNFeFR.frxDadosProdutos
        DataSetName = 'DadosProdutos'
        RowCount = 0
        Stretched = True
        object Memo131: TfrxMemoView
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DadosProdutos."CProd"]')
          ParentFont = False
        end
        object Memo132: TfrxMemoView
          Left = 60.472480000000000000
          Width = 215.433070866142000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haBlock
          Memo.UTF8 = (
            '[DadosProdutos."DescricaoProduto"]')
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 275.905511811024000000
          Width = 37.795300000000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DadosProdutos."NCM"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo134: TfrxMemoView
          Left = 313.700787401575000000
          Width = 26.456695350000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DadosProdutos."ORIGEM"][DadosProdutos."CST"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo135: TfrxMemoView
          Left = 340.157480314961000000
          Width = 24.566929130000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DadosProdutos."CFOP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo136: TfrxMemoView
          Left = 364.724409448819000000
          Width = 30.236220472440900000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DadosProdutos."Unidade"]')
          ParentFont = False
          WordWrap = False
        end
        object memqCom: TfrxMemoView
          Left = 394.960659210000000000
          Width = 43.464574250000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[DadosProdutos."Quantidade"]')
          ParentFont = False
          WordWrap = False
        end
        object memvUnCom: TfrxMemoView
          Left = 438.425480000000000000
          Width = 45.354360000000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[DadosProdutos."ValorUnitario"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo139: TfrxMemoView
          Left = 483.779840000000000000
          Width = 45.354360000000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[DadosProdutos."vDesc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo140: TfrxMemoView
          Left = 529.134200000000000000
          Width = 45.354360000000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[DadosProdutos."VProd"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo141: TfrxMemoView
          Left = 574.488560000000000000
          Width = 45.354360000000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[DadosProdutos."VBC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo142: TfrxMemoView
          Left = 619.842920000000000000
          Width = 41.574803149606300000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[DadosProdutos."VICMS"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo143: TfrxMemoView
          Left = 661.417322834646000000
          Width = 41.574830000000000000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[DadosProdutos."VIPI"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo144: TfrxMemoView
          Left = 702.992125980000000000
          Width = 20.787401574803100000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DadosProdutos."PICMS"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo145: TfrxMemoView
          Left = 723.779527559055000000
          Width = 20.787401574803100000
          Height = 11.338582680000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DadosProdutos."PIPI"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Canhoto: TfrxReportTitle
        Height = 79.370078740000000000
        Top = 18.897650000000000000
        Width = 744.567410000000000000
        object Memo2: TfrxMemoView
          Width = 642.520100000000000000
          Height = 37.795275590000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            
              'Recebemos de [Emitente."XNome"] os produtos e/ou servi'#195#167'os const' +
              'antes da Nota Fiscal Eletr'#195#180'nica indicada ao lado. '
            '[Parametros."ResumoCanhoto"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 143.622140000000000000
          Top = 37.795275590000000000
          Width = 498.897960000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'IDENTIFICA'#195#8225#195#402'O E ASSINATURA DO RECEBEDOR')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 37.795275590000000000
          Width = 143.622140000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'DATA DO RECEBIMENTO')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 73.811070000000000000
          Width = 744.567410000000000000
          ShowHint = False
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Width = 102.047212360000000000
          Height = 68.031496060000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NF-e'
            'N'#194#186' [Identificacao."NNF"]'
            'S'#195#169'rie [Identificacao."Serie" #n#000]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Emitente: TfrxPageHeader
        Height = 173.858362910000000000
        Top = 120.944960000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'EmitenteOnBeforePrint'
        object BarCodeContigencia: TfrxBarCodeView
          ShiftMode = smWhenOverlapped
          Left = 469.764070000000000000
          Top = 84.370130000000000000
          Width = 233.000000000000000000
          Height = 34.015745590000000000
          ShowHint = False
          BarType = bcCode128C
          DataField = 'Contingencia_ID'
          DataSet = dmACBrNFeFR.frxParametros
          DataSetName = 'Parametros'
          Rotation = 0
          ShowText = False
          Text = '123456789012345678901234567890123456'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object memConsultaAutenticidade: TfrxMemoView
          Left = 423.307360000000000000
          Top = 79.370130000000000000
          Width = 321.260050000000000000
          Height = 41.574805590000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Parametros."ConsultaAutenticidade"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 423.307360000000000000
          Width = 321.259842520000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object BarCodeChave: TfrxBarCodeView
          Left = 445.677177560000000000
          Top = 5.559060000000000000
          Width = 277.000000000000000000
          Height = 37.795275590000000000
          ShowHint = False
          BarType = bcCode128C
          DataField = 'Id'
          DataSet = dmACBrNFeFR.frxIdentificacao
          DataSetName = 'Identificacao'
          Rotation = 0
          ShowText = False
          Text = '12345678901234567890123456789012345678901234'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Memo6: TfrxMemoView
          Left = 423.307360000000000000
          Top = 49.133890000000000000
          Width = 321.260050000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'CHAVE DE ACESSO')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 423.307360000000000000
          Top = 56.692913390000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Identificacao."Chave"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          Left = 309.921460000000000000
          Width = 113.385826770000000000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DANFE')
          ParentFont = False
        end
        object memEmitente: TfrxMemoView
          Width = 309.921460000000000000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 1.000000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Emitente."XNome"]')
          ParentFont = False
        end
        object memDadosEmitente: TfrxMemoView
          Left = 100.826840000000000000
          Top = 37.795275590000000000
          Width = 207.874020630000000000
          Height = 81.259842520000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Emitente."DADOS_ENDERECO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 313.157700000000000000
          Top = 16.897650000000000000
          Width = 105.826840000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Documento Auxiliar da '
            'Nota Fiscal Eletr'#195#180'nica')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 321.716760000000000000
          Top = 70.811070000000000000
          Width = 98.267780000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'N'#194#186' [Identificacao."NNF"]'
            '   S'#195#8240'RIE [Identificacao."Serie" #n#000]'
            '   FOLHA [Page]/[TotalPages#]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 313.716760000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '0 - ENTRADA'
            '1 - SA'#195#141'DA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 389.748300000000000000
          Top = 45.354330710000000000
          Width = 22.677165350000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Identificacao."TpNF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 120.944960000000000000
          Width = 423.307360000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'NATUREZA DA OPERA'#195#8225#195#402'O')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Top = 129.259842520000000000
          Width = 423.307360000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Identificacao."NatOp"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo21: TfrxMemoView
          Left = 423.307360000000000000
          Top = 120.944960000000000000
          Width = 321.260050000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            '[Parametros."Contingencia_Descricao"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 423.307360000000000000
          Top = 129.259842520000000000
          Width = 321.260050000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Parametros."Contingencia_Valor"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo23: TfrxMemoView
          Top = 147.401670000000000000
          Width = 253.228510000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'INSCRI'#195#8225#195#402'O ESTADUAL')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 156.850410790000000000
          Width = 253.228510000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Emitente."IE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo25: TfrxMemoView
          Left = 253.228510000000000000
          Top = 147.401670000000000000
          Width = 253.228510000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'INSCRI'#195#8225#195#402'O ESTADUAL DO SUBSTITUTO TRIBUT'#195#129'RIO')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 253.228510000000000000
          Top = 156.850410790000000000
          Width = 253.228510000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Emitente."IEST"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo27: TfrxMemoView
          Left = 506.457020000000000000
          Top = 147.401670000000000000
          Width = 238.110390000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'CNPJ')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 506.457020000000000000
          Top = 156.850410790000000000
          Width = 238.110390000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Emitente."CNPJ"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object imgLogo: TfrxPictureView
          Left = 1.889763780000000000
          Top = 37.795275590000000000
          Width = 98.267711650000000000
          Height = 81.259842520000000000
          ShowHint = False
          Center = True
          DataField = 'LogoCarregado'
          DataSet = dmACBrNFeFR.frxParametros
          DataSetName = 'Parametros'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter: TfrxPageFooter
        Height = 162.519653310000000000
        Top = 2415.119670000000000000
        Width = 744.567410000000000000
        OnAfterPrint = 'PageFooterOnAfterPrint'
        object memDataHora: TfrxMemoView
          Align = baLeft
          Top = 144.511781730000000000
          Width = 461.102660000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            
              'DATA E HORA DA IMPRESS'#195#402'O: [Date #ddd/mm/yyyy] [Time #dhh:mm:ss]' +
              ' [Parametros."Usuario"]')
          ParentFont = False
        end
        object memFisco: TfrxMemoView
          Left = 487.559055120000000000
          Top = 16.677180000000000000
          Width = 257.007852050000000000
          Height = 124.724409450000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'RESERVADO AO FISCO')
          ParentFont = False
        end
        object memInformacoesComplementares: TfrxMemoView
          Top = 16.677180000000000000
          Width = 487.559055120000000000
          Height = 124.724402130000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'INFORMA'#195#8225#195#8226'ES COMPLEMENTARES')
          ParentFont = False
        end
        object memOBS: TfrxMemoView
          Top = 23.881862910000000000
          Width = 485.669288900000000000
          Height = 117.165354330000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            '[InformacoesAdicionais."OBS"]')
          ParentFont = False
        end
        object memSistema: TfrxMemoView
          Align = baRight
          Left = 453.543600000000000000
          Top = 144.511781730000000000
          Width = 291.023810000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Parametros."Sistema"]')
          ParentFont = False
        end
        object memDadosAdicionais: TfrxMemoView
          Top = 1.889763780000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'DADOS ADICIONAIS')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Destinatario: TfrxMasterData
        Height = 96.267762910000000000
        Top = 355.275820000000000000
        Width = 744.567410000000000000
        DataSet = dmACBrNFeFR.frxIdentificacao
        DataSetName = 'Identificacao'
        RowCount = 1
        object Memo29: TfrxMemoView
          Top = 16.897650000000000000
          Width = 468.661720000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'NOME / RAZ'#195#402'O SOCIAL')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Top = 26.346390790000000000
          Width = 464.882190000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Destinatario."XNome"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo31: TfrxMemoView
          Left = 631.181510000000000000
          Top = 16.897650000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'DATA DA EMISS'#195#402'O')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 631.181510000000000000
          Top = 26.346390790000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Identificacao."DEmi"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo33: TfrxMemoView
          Left = 631.181510000000000000
          Top = 43.354360000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'DATA DA SA'#195#141'DA')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 631.181510000000000000
          Top = 52.803100790000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Identificacao."DSaiEnt"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo35: TfrxMemoView
          Left = 631.181510000000000000
          Top = 69.811070000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'HORA DA SA'#195#141'DA')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 631.181510000000000000
          Top = 79.259810790000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Identificacao."HoraSaida"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo37: TfrxMemoView
          Left = 468.661720000000000000
          Top = 16.897650000000000000
          Width = 162.519790000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 468.661720000000000000
          Top = 26.346390790000000000
          Width = 162.519790000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Destinatario."CNPJCPF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo39: TfrxMemoView
          Left = 555.590910000000000000
          Top = 43.354360000000000000
          Width = 75.590600000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'CEP')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 555.590910000000000000
          Top = 52.803100790000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Destinatario."CEP"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo41: TfrxMemoView
          Left = 385.512060000000000000
          Top = 43.354360000000000000
          Width = 170.078850000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'BAIRRO / DISTRITO')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 385.512060000000000000
          Top = 52.803100790000000000
          Width = 170.078850000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Destinatario."XBairro"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          Top = 43.354360000000000000
          Width = 385.512060000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'ENDERE'#195#8225'O')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Top = 52.803100790000000000
          Width = 381.732530000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            
              '[Destinatario."XLgr"], [Destinatario."Nro"]  [Destinatario."XCpl' +
              '"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo45: TfrxMemoView
          Top = 69.811070000000000000
          Width = 355.275820000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'MUNIC'#195#141'PIO')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Top = 79.259810790000000000
          Width = 351.496290000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Destinatario."XMun"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo47: TfrxMemoView
          Left = 355.275820000000000000
          Top = 69.811070000000000000
          Width = 30.236240000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'UF')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 355.275820000000000000
          Top = 79.259810790000000000
          Width = 30.236240000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Destinatario."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo49: TfrxMemoView
          Left = 385.512060000000000000
          Top = 69.811070000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'TELEFONE / FAX')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 385.512060000000000000
          Top = 79.259810790000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Destinatario."Fone"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo51: TfrxMemoView
          Left = 498.897960000000000000
          Top = 69.811070000000000000
          Width = 132.283550000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'INSCRI'#195#8225#195#402'O ESTADUAL')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 498.897960000000000000
          Top = 79.259810790000000000
          Width = 132.283550000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Destinatario."IE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo53: TfrxMemoView
          Top = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'DESTINAT'#195#129'RIO / REMETENTE')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Fatura: TfrxMasterData
        Height = 40.440944880000000000
        Top = 612.283860000000000000
        Width = 744.567410000000000000
        DataSet = dmACBrNFeFR.frxFatura
        DataSetName = 'Fatura'
        RowCount = 0
        object Memo190: TfrxMemoView
          Top = 3.779527560000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'FATURA')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo191: TfrxMemoView
          Top = 17.897650000000000000
          Width = 744.566921810000000000
          Height = 20.787404020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8 = (
            
              '[Fatura."Pagamento"]   -   N'#195#186'mero:   [Fatura."nFat"]     -   Va' +
              'lor Original: R$ [Fatura."vOrig" #n%2,2n]    -   Valor Desconto:' +
              '  R$ [Fatura."vDesc" #n%2,2n]    -   ValorL'#195#173'quido: R$ [Fatura."' +
              'vLiq" #n%2,2n]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object Duplicatas: TfrxMasterData
        Height = 37.795300000000000000
        Top = 718.110700000000000000
        Width = 744.567410000000000000
        Columns = 5
        ColumnWidth = 151.181102362205000000
        DataSet = dmACBrNFeFR.frxDuplicatas
        DataSetName = 'Duplicatas'
        RowCount = 0
        object Shape2: TfrxShapeView
          Align = baClient
          Width = 744.567410000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Frame.Width = 0.500000000000000000
        end
        object Memo200: TfrxMemoView
          Width = 151.181200000000000000
          Height = 37.795275590000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8 = (
            'N'#195#186'mero'
            'Vencimento'
            'Valor')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo201: TfrxMemoView
          Left = 56.692950000000000000
          Width = 3.779530000000000000
          Height = 37.795275590000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          LineSpacing = 3.000000000000000000
          Memo.UTF8 = (
            ':'
            ':'
            ':')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo202: TfrxMemoView
          Left = 60.472480000000000000
          Width = 86.929190000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8 = (
            '[Duplicatas."NDup"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo203: TfrxMemoView
          Left = 60.472480000000000000
          Top = 12.472440940000000000
          Width = 86.929190000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8 = (
            '[Duplicatas."DVenc"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo204: TfrxMemoView
          Left = 60.472480000000000000
          Top = 24.944881890000000000
          Width = 86.929190000000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8 = (
            '[Duplicatas."VDup"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object DuplicatasHeader: TfrxGroupHeader
        Height = 17.007874020000000000
        Top = 676.535870000000000000
        Width = 744.567410000000000000
        Condition = 'Duplicatas."ChaveNFe"'
        ReprintOnNewPage = True
        object Memo205: TfrxMemoView
          Top = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'DUPLICATAS')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object DadosProdutosHeader: TfrxGroupHeader
        Height = 41.196850390000000000
        Top = 994.016390000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'DadosProdutosHeaderOnBeforePrint'
        Condition = 'DadosProdutos."ChaveNFe"'
        ReprintOnNewPage = True
        object Memo115: TfrxMemoView
          Top = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'DADOS DOS PRODUTOS / SERVI'#195#8225'OS')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo116: TfrxMemoView
          Top = 18.338592440000000000
          Width = 60.472480000000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'C'#195#8220'DIGO'
            'PRODUTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 60.472480000000000000
          Top = 18.338592440000000000
          Width = 215.433070866142000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O DO PRODUTO / SERVI'#195#8225'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 275.905511811024000000
          Top = 18.338592440000000000
          Width = 37.795300000000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'NCM/SH')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 313.700787401575000000
          Top = 18.338592440000000000
          Width = 26.456695350000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Emitente."DESCR_CST"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 340.157480314961000000
          Top = 18.338592440000000000
          Width = 24.566929130000000000
          Height = 22.677167800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CFOP')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 364.724409450000000000
          Top = 18.338592440000000000
          Width = 30.236220470000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'UNID.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 394.960659210000000000
          Top = 18.338592440000000000
          Width = 43.464574250000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'QTDE.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 438.425480000000000000
          Top = 18.338592440000000000
          Width = 45.354360000000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR'
            'UNIT'#195#129'RIO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Left = 483.779840000000000000
          Top = 18.338592440000000000
          Width = 45.354360000000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Parametros."Desconto"]'
            'DESCONTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 529.134200000000000000
          Top = 18.338592440000000000
          Width = 45.354360000000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR'
            '[Parametros."TotalLiquido"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 574.488560000000000000
          Top = 18.338592440000000000
          Width = 45.354360000000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'BASE DE '
            'C'#195#129'LC. ICMS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Left = 619.842920000000000000
          Top = 18.338592440000000000
          Width = 41.574803150000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR'
            'ICMS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 661.417322834646000000
          Top = 18.338592440000000000
          Width = 41.574803150000000000
          Height = 22.677162910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR'
            'IPI')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 702.992125980000000000
          Top = 29.677182440000000000
          Width = 20.787401574803100000
          Height = 11.338572910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'ICMS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo130: TfrxMemoView
          Left = 723.779527559055000000
          Top = 29.677182440000000000
          Width = 20.787401574803100000
          Height = 11.338572910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'IPI')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Left = 702.992123540000000000
          Top = 18.338592440000000000
          Width = 41.574830000000000000
          Height = 11.338572910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'AL'#195#141'Q. %')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object Imposto: TfrxMasterData
        Height = 70.031525350000000000
        Top = 778.583180000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ImpostoOnBeforePrint'
        DataSet = dmACBrNFeFR.frxCalculoImposto
        DataSetName = 'CalculoImposto'
        RowCount = 1
        object Memo58: TfrxMemoView
          Top = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'C'#195#129'LCULO DO IMPOSTO')
          ParentFont = False
          VAlign = vaBottom
        end
        object QuadroVBC: TfrxMemoView
          Top = 17.118122440000000000
          Width = 114.897637800000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'BASE DE C'#195#129'LCULO DO ICMS')
          ParentFont = False
        end
        object memVBC: TfrxMemoView
          Top = 26.566863230000000000
          Width = 114.897637800000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VBC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object QuadroVICMS: TfrxMemoView
          Left = 114.897637800000000000
          Top = 17.118122440000000000
          Width = 114.897637800000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'VALOR DO ICMS')
          ParentFont = False
        end
        object memVICMS: TfrxMemoView
          Left = 114.897637800000000000
          Top = 26.566863230000000000
          Width = 114.897637800000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VICMS"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object QuadroVBCST: TfrxMemoView
          Left = 229.795275590000000000
          Top = 17.118122440000000000
          Width = 128.504020000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'BASE DE C'#195#129'LCULO DO ICMS SUBST.')
          ParentFont = False
        end
        object memVBCST: TfrxMemoView
          Left = 229.795275590000000000
          Top = 26.566863230000000000
          Width = 128.504020000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VBCST"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object QuadrovST: TfrxMemoView
          Left = 358.299212600000000000
          Top = 17.118122440000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'VALOR DO ICMS SUBST.')
          ParentFont = False
        end
        object memVST: TfrxMemoView
          Left = 358.299212600000000000
          Top = 26.566863230000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VST"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo67: TfrxMemoView
          Left = 597.165740000000000000
          Top = 17.118122440000000000
          Width = 147.401670000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'VALOR TOTAL DOS PRODUTOS')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 597.165740000000000000
          Top = 25.566863230000000000
          Width = 147.401670000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VProd"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo69: TfrxMemoView
          Left = 459.590848000000000000
          Top = 43.574832440000000000
          Width = 137.574892000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'VALOR DO IPI')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 459.590848000000000000
          Top = 53.023573230000000000
          Width = 137.574892000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VIPI"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo71: TfrxMemoView
          Left = 329.575016000000000000
          Top = 43.574832440000000000
          Width = 130.015832000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'OUTRAS DESPESAS ACESS'#195#8220'RIAS')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 329.575016000000000000
          Top = 53.023573230000000000
          Width = 130.015832000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VOutro"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo73: TfrxMemoView
          Left = 229.795424000000000000
          Top = 43.574832440000000000
          Width = 99.779592000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'DESCONTO')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 229.795424000000000000
          Top = 53.023573230000000000
          Width = 99.779592000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VDesc"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo75: TfrxMemoView
          Left = 114.897712000000000000
          Top = 43.574832440000000000
          Width = 114.897712000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'VALOR DO SEGURO')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 114.897712000000000000
          Top = 53.023573230000000000
          Width = 114.897712000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VSeg"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo77: TfrxMemoView
          Top = 43.574832440000000000
          Width = 114.897712000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'VALOR DO FRETE')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Top = 53.023573230000000000
          Width = 114.897712000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VFrete"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo79: TfrxMemoView
          Left = 597.165740000000000000
          Top = 43.574832440000000000
          Width = 147.401670000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'VALOR TOTAL DA NOTA')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 597.165740000000000000
          Top = 52.023573230000000000
          Width = 147.401670000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VNF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object QuadroVTOTTRIB: TfrxMemoView
          Left = 471.685029610000000000
          Top = 17.196850390000000000
          Width = 125.480339370000000000
          Height = 26.267716540000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'V.APROX. TRIBUTOS [CalculoImposto."VTribFonte"]')
          ParentFont = False
        end
        object memVTOTTRIB: TfrxMemoView
          Left = 472.441250000000000000
          Top = 26.645669290000000000
          Width = 124.724490000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[CalculoImposto."VTotTrib"] ([CalculoImposto."VTribPerc"] %)')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
      end
      object TransportadorVolumes: TfrxMasterData
        Height = 96.378045510000000000
        Top = 873.071430000000000000
        Width = 744.567410000000000000
        DataSet = dmACBrNFeFR.frxTransportador
        DataSetName = 'Transportador'
        RowCount = 1
        object Memo82: TfrxMemoView
          Top = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'TRANSPORTADOR / VOLUMES TRANSPORTADOS')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 636.094512600000000000
          Top = 17.007932600000000000
          Width = 108.472433620000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 636.094512600000000000
          Top = 26.456673390000000000
          Width = 108.472433620000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Transportador."CNPJCPF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo85: TfrxMemoView
          Left = 608.504330000000000000
          Top = 17.007932600000000000
          Width = 27.590548740000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'UF')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 608.504330000000000000
          Top = 26.456673390000000000
          Width = 27.590548740000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Veiculo."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo87: TfrxMemoView
          Left = 521.575140000000000000
          Top = 17.007932600000000000
          Width = 86.929190000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'PLACA DO VE'#195#141'CULO')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 521.575140000000000000
          Top = 26.456673390000000000
          Width = 86.929190000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Veiculo."PLACA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo89: TfrxMemoView
          Left = 438.425480000000000000
          Top = 17.007932600000000000
          Width = 83.149660000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'C'#195#8220'DIGO ANTT')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 438.425480000000000000
          Top = 26.456673390000000000
          Width = 79.370130000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Veiculo."RNTC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo91: TfrxMemoView
          Left = 355.275820000000000000
          Top = 17.007932600000000000
          Width = 83.149660000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'FRETE POR CONTA')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 355.275820000000000000
          Top = 26.456673390000000000
          Width = 83.149660000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Transportador."ModFrete"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo93: TfrxMemoView
          Top = 17.007932600000000000
          Width = 355.275820000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'NOME / RAZ'#195#402'O SOCIAL')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Top = 26.456673390000000000
          Width = 355.275820000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Transportador."XNome"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo95: TfrxMemoView
          Left = 608.504330000000000000
          Top = 43.464642600000000000
          Width = 27.590548740000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'UF')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 608.504330000000000000
          Top = 52.913383390000000000
          Width = 27.590548740000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Transportador."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo97: TfrxMemoView
          Left = 636.094512600000000000
          Top = 43.464642600000000000
          Width = 108.472433620000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'INSCRI'#195#8225#195#402'O ESTADUAL')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 636.094512600000000000
          Top = 52.913383390000000000
          Width = 108.472433620000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Transportador."IE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo99: TfrxMemoView
          Left = 355.275820000000000000
          Top = 43.464642600000000000
          Width = 253.228510000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'MUNIC'#195#141'PIO')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 355.275820000000000000
          Top = 52.913383390000000000
          Width = 253.228510000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Transportador."XMun"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo101: TfrxMemoView
          Top = 43.464642600000000000
          Width = 355.275820000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'ENDERE'#195#8225'O')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Top = 52.913383390000000000
          Width = 355.275820000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Transportador."XEnder"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo103: TfrxMemoView
          Top = 69.921352600000000000
          Width = 59.212636670000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HideZeros = True
          Memo.UTF8 = (
            'QUANTIDADE')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Top = 79.370093390000000000
          Width = 59.212636670000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[Volumes."QVol"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo105: TfrxMemoView
          Left = 59.212636670000000000
          Top = 69.921352600000000000
          Width = 153.700886670000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'ESP'#195#8240'CIE')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 59.212636670000000000
          Top = 79.370093390000000000
          Width = 153.700886670000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Volumes."Esp"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo107: TfrxMemoView
          Left = 212.913523330000000000
          Top = 69.921352600000000000
          Width = 142.362296670000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'MARCA')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 212.913523330000000000
          Top = 79.370093390000000000
          Width = 142.362296670000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Volumes."Marca"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo109: TfrxMemoView
          Left = 355.275820000000000000
          Top = 69.921352600000000000
          Width = 161.259946670000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'NUMERA'#195#8225#195#402'O')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 355.275820000000000000
          Top = 79.370093390000000000
          Width = 161.259946670000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Volumes."NVol"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo111: TfrxMemoView
          Left = 516.535766670000000000
          Top = 69.921352600000000000
          Width = 119.685116670000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'PESO BRUTO')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 516.535766670000000000
          Top = 79.370093390000000000
          Width = 119.685116670000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[Volumes."PesoB"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo113: TfrxMemoView
          Left = 636.220883330000000000
          Top = 69.921352600000000000
          Width = 108.346526670000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'PESO L'#195#141'QUIDO')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 636.220883330000000000
          Top = 79.370093390000000000
          Width = 108.346526670000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[Volumes."PesoL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
      end
      object MarcaDagua: TfrxOverlay
        Height = 1122.519685040000000000
        Top = 1164.095240000000000000
        Width = 744.567410000000000000
        object memWatermark: TfrxMemoView
          Align = baClient
          Width = 744.567410000000000000
          Height = 1122.519685040000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14211288
          Font.Height = -67
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Parametros."Mensagem0"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Child1: TfrxChild
        Height = 3.779527560000000000
        Top = 1114.961350000000000000
        Width = 744.567410000000000000
        object Memo161: TfrxMemoView
          Width = 60.472480000000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 60.472480000000000000
          Width = 215.433070866142000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Left = 275.905511811024000000
          Width = 37.795300000000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 313.700787401575000000
          Width = 26.456695350000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 340.157480314961000000
          Width = 24.566929130000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 364.724409448819000000
          Width = 30.236220472440900000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 394.960659210000000000
          Width = 43.464574250000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 438.425480000000000000
          Width = 45.354360000000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          Left = 483.779840000000000000
          Width = 45.354360000000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
        end
        object Memo170: TfrxMemoView
          Left = 529.134200000000000000
          Width = 45.354360000000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo171: TfrxMemoView
          Left = 574.488560000000000000
          Width = 45.354360000000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo172: TfrxMemoView
          Left = 619.842920000000000000
          Width = 41.574803149606300000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo173: TfrxMemoView
          Left = 661.417322834646000000
          Width = 41.574803150000000000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Left = 702.992125980000000000
          Width = 20.787401574803100000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Left = 723.779527559055000000
          Width = 20.787401574803100000
          Height = 3.779527560000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
      end
      object DadosProdutosFooter: TfrxGroupFooter
        Top = 1092.284170000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'DadosProdutosFooterOnBeforePrint'
      end
      object Child2: TfrxChild
        Top = 1141.418060000000000000
        Width = 744.567410000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Width = 744.567410000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
      end
      object LocalRetirada: TfrxMasterData
        Height = 43.354342910000000000
        Top = 476.220780000000000000
        Width = 744.567410000000000000
        DataSet = dmACBrNFeFR.frxLocalRetirada
        DataSetName = 'LocalRetirada'
        RowCount = 0
        object Memo10: TfrxMemoView
          Top = 16.897650000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 26.346390790000000000
          Width = 113.385826770000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[LocalRetirada."CNPJ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 16.897650000000000000
          Width = 631.181510000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'ENDERE'#195#8225'O')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.346390790000000000
          Width = 631.181510000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            
              '[LocalRetirada."XLgr"] [LocalRetirada."Nro"] [LocalRetirada."XCp' +
              'l"] - [LocalRetirada."XBairro"] - [LocalRetirada."XMun"] - [Loca' +
              'lRetirada."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo185: TfrxMemoView
          Top = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'LOCAL RETIRADA')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object LocalEntrega: TfrxMasterData
        Height = 43.354342910000000000
        Top = 544.252320000000000000
        Width = 744.567410000000000000
        DataSet = dmACBrNFeFR.frxLocalEntrega
        DataSetName = 'LocalEntrega'
        RowCount = 0
        object Memo54: TfrxMemoView
          Top = 16.897650000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Top = 26.346390790000000000
          Width = 113.385826770000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[LocalEntrega."CNPJ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo56: TfrxMemoView
          Left = 113.385900000000000000
          Top = 16.897650000000000000
          Width = 631.181510000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'ENDERE'#195#8225'O')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.346390790000000000
          Width = 631.181510000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            
              '[LocalEntrega."XLgr"] [LocalEntrega."Nro"] [LocalEntrega."XCpl"]' +
              ' - [LocalEntrega."XBairro"] - [LocalEntrega."XMun"] - [LocalEntr' +
              'ega."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo81: TfrxMemoView
          Top = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'LOCAL ENTREGA')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        Height = 43.464566930000000000
        Top = 2347.088130000000000000
        Width = 744.567410000000000000
        object ISSQN: TfrxSubreport
          Width = 744.567410000000000000
          Height = 43.464566930000000000
          ShowHint = False
          Page = fastReport.PageISSQN
          PrintOnParent = True
        end
      end
    end
    object PageISSQN: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object subISSQN: TfrxMasterData
        Height = 43.354342910000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = dmACBrNFeFR.frxISSQN
        DataSetName = 'ISSQN'
        RowCount = 0
        object Memo5: TfrxMemoView
          Top = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            'C'#195#129'LCULO DO ISSQN')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo7: TfrxMemoView
          Top = 16.897650000000000000
          Width = 217.322859060000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'INSCRI'#195#8225#195#402'O MUNICIPAL')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Top = 26.346390790000000000
          Width = 217.322859060000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[Emitente."IM"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo60: TfrxMemoView
          Left = 217.322859060000000000
          Top = 16.897650000000000000
          Width = 179.527559060000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'VALOR TOTAL DOS SERVI'#195#8225'OS')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 217.322859060000000000
          Top = 26.346390790000000000
          Width = 179.527559060000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[ISSQN."VServ"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo62: TfrxMemoView
          Left = 396.850418110000000000
          Top = 16.897650000000000000
          Width = 179.527559060000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'BASE DE C'#195#129'LCULO DO ISSQN')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 396.850418110000000000
          Top = 26.346390790000000000
          Width = 179.527559060000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[ISSQN."VBC"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo64: TfrxMemoView
          Left = 576.377977170000000000
          Top = 16.897650000000000000
          Width = 179.527559060000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8 = (
            'VALOR TOTAL DO ISSQN')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 576.377977170000000000
          Top = 26.346390790000000000
          Width = 179.527559060000000000
          Height = 17.007874020000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[ISSQN."VISS"]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
    end
  end
end
