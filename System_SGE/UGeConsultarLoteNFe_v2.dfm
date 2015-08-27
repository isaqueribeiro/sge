inherited frmGeConsultarLoteNFe_v2: TfrmGeConsultarLoteNFe_v2
  Left = 411
  Top = 229
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Consultar Recibo/Lote NF-e'
  ClientHeight = 512
  ClientWidth = 593
  ExplicitWidth = 607
  ExplicitHeight = 549
  DesignSize = (
    593
    512)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 121
    Width = 593
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 473
    Width = 593
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object lblInforme: TLabel
    Left = 0
    Top = 484
    Width = 216
    Height = 18
    Anchors = [akLeft, akBottom]
    Caption = 'Andamento do processo . . . . '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 593
    Height = 121
    Align = alTop
    Caption = 'Dados Emitente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblCNPJ: TLabel
      Left = 16
      Top = 24
      Width = 30
      Height = 13
      Caption = 'CNPJ:'
      FocusControl = dbCNPJ
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRazaoSocial: TLabel
      Left = 184
      Top = 24
      Width = 74
      Height = 13
      Caption = 'Raz'#227'o Social:'
      FocusControl = dbRazaoSocial
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSerie: TLabel
      Left = 96
      Top = 64
      Width = 32
      Height = 13
      Caption = 'S'#233'rie:'
      FocusControl = dbSerie
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNFe: TLabel
      Left = 136
      Top = 64
      Width = 114
      Height = 13
      Caption = #218'ltima NF-e emitida:'
      FocusControl = dbNFe
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHoraEmissao: TLabel
      Left = 264
      Top = 64
      Width = 119
      Height = 13
      Caption = #218'ltimo Lote de envio:'
      FocusControl = dbHoraEmissao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblModelo: TLabel
      Left = 16
      Top = 64
      Width = 72
      Height = 13
      Caption = 'Modelo NF-e:'
      FocusControl = dbModelo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbCNPJ: TDBEdit
      Left = 16
      Top = 40
      Width = 161
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'CNPJ'
      DataSource = dtsEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbRazaoSocial: TDBEdit
      Left = 184
      Top = 40
      Width = 393
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'RZSOC'
      DataSource = dtsEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbSerie: TDBEdit
      Left = 96
      Top = 80
      Width = 33
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'SERIE_NFE'
      DataSource = dtsEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbNFe: TDBEdit
      Left = 136
      Top = 80
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NUMERO_NFE'
      DataSource = dtsEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object dbHoraEmissao: TDBEdit
      Left = 264
      Top = 80
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'LOTE_NUM_NFE'
      DataSource = dtsEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object dbModelo: TDBEdit
      Left = 16
      Top = 80
      Width = 73
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'MODELO_NFE'
      DataSource = dtsEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object GrpBxDadosLote: TGroupBox
    Left = 0
    Top = 125
    Width = 593
    Height = 348
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Dados para Consulta do Lote / Recibo NF-e'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      593
      348)
    object lblUsuario: TLabel
      Left = 16
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Usu'#225'rio:'
      FocusControl = dbUsuario
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataHora: TLabel
      Left = 408
      Top = 24
      Width = 63
      Height = 13
      Caption = 'Data/Hora:'
      FocusControl = dbDataHora
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblJustificativa: TLabel
      Left = 16
      Top = 144
      Width = 72
      Height = 13
      Caption = 'Justificativa:'
      FocusControl = edJustificativa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAno: TLabel
      Left = 16
      Top = 64
      Width = 25
      Height = 13
      Caption = 'Ano:'
      Enabled = False
      FocusControl = edAno
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNumeroLote: TLabel
      Left = 80
      Top = 64
      Width = 92
      Height = 13
      Caption = 'N'#250'mero do Lote:'
      Enabled = False
      FocusControl = edNumeroLote
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object lblNumeroRecibo: TLabel
      Left = 184
      Top = 64
      Width = 105
      Height = 13
      Caption = 'N'#250'mero do Recibo:'
      FocusControl = edNumeroRecibo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblChaveNFe: TLabel
      Left = 16
      Top = 104
      Width = 66
      Height = 13
      Caption = 'Chave NF-e:'
      Enabled = False
      FocusControl = edChaveNFe
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProtocoloTMP: TLabel
      Left = 408
      Top = 64
      Width = 126
      Height = 13
      Caption = 'Protocolo da Consulta:'
      Enabled = False
      FocusControl = edProtocoloTMP
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object edJustificativa: TMemo
      Left = 16
      Top = 160
      Width = 561
      Height = 172
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 250
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object dbUsuario: TEdit
      Left = 16
      Top = 40
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'DBUSUARIO'
    end
    object dbDataHora: TEdit
      Left = 408
      Top = 40
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'DBCANCELDATAHORA'
    end
    object edAno: TEdit
      Left = 16
      Top = 80
      Width = 57
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object edNumeroLote: TEdit
      Left = 80
      Top = 80
      Width = 97
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edNumeroRecibo: TEdit
      Left = 184
      Top = 80
      Width = 217
      Height = 21
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object edChaveNFe: TEdit
      Left = 16
      Top = 120
      Width = 561
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object edProtocoloTMP: TEdit
      Left = 408
      Top = 80
      Width = 169
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object btnConfirmar: TcxButton
    Left = 405
    Top = 479
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Consultar'
    OptionsImage.ImageIndex = 38
    OptionsImage.Images = DMRecursos.ImgPrincipal16x16
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btFechar: TcxButton
    Left = 501
    Top = 479
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    OptionsImage.ImageIndex = 15
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    TabOrder = 3
    OnClick = btFecharClick
  end
  object dtsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 552
    Top = 16
  end
  object qryEmpresa: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    e.cnpj'
      '  , e.rzsoc'
      '  , e.serie_nfe'
      '  , e.numero_nfe'
      '  , e.lote_ano_nfe'
      '  , e.lote_num_nfe'
      '  , 55 as modelo_nfe'
      'from TBEMPRESA e'
      'where e.cnpj = :cnpj')
    Left = 520
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'cnpj'
        ParamType = ptInput
        Value = ''
      end>
    object qryEmpresaCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"TBEMPRESA"."CNPJ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnGetText = qryEmpresaCNPJGetText
      Size = 18
    end
    object qryEmpresaRZSOC: TIBStringField
      FieldName = 'RZSOC'
      Origin = '"TBEMPRESA"."RZSOC"'
      Size = 60
    end
    object qryEmpresaSERIE_NFE: TSmallintField
      FieldName = 'SERIE_NFE'
      Origin = '"TBEMPRESA"."SERIE_NFE"'
      DisplayFormat = '00'
    end
    object qryEmpresaNUMERO_NFE: TIntegerField
      FieldName = 'NUMERO_NFE'
      Origin = '"TBEMPRESA"."NUMERO_NFE"'
      DisplayFormat = '0000000'
    end
    object qryEmpresaLOTE_ANO_NFE: TSmallintField
      FieldName = 'LOTE_ANO_NFE'
      Origin = '"TBEMPRESA"."LOTE_ANO_NFE"'
    end
    object qryEmpresaLOTE_NUM_NFE: TIntegerField
      FieldName = 'LOTE_NUM_NFE'
      Origin = '"TBEMPRESA"."LOTE_NUM_NFE"'
      DisplayFormat = '0000000'
    end
    object qryEmpresaMODELO_NFE: TIntegerField
      FieldName = 'MODELO_NFE'
      ProviderFlags = []
    end
  end
  object cdsLOG: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    t.usuario'
      '  , t.data_hora'
      '  , t.tipo'
      '  , t.descricao'
      '  , t.especificacao'
      'from TBLOG_TRANSACAO t'
      'where 1=0')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'CODCONTROL'
    UpdateObject = updLOG
    Left = 424
    Top = 312
    object cdsLOGUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBLOG_TRANSACAO"."USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsLOGDATA_HORA: TDateTimeField
      FieldName = 'DATA_HORA'
      Origin = '"TBLOG_TRANSACAO"."DATA_HORA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLOGTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = '"TBLOG_TRANSACAO"."TIPO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLOGDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"TBLOG_TRANSACAO"."DESCRICAO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsLOGESPECIFICACAO: TMemoField
      FieldName = 'ESPECIFICACAO'
      Origin = '"TBLOG_TRANSACAO"."ESPECIFICACAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object updLOG: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  USUARIO,'
      '  DATA_HORA,'
      '  TIPO,'
      '  DESCRICAO,'
      '  ESPECIFICACAO'
      'from TBLOG_TRANSACAO '
      'where'
      '  DATA_HORA = :DATA_HORA and'
      '  USUARIO = :USUARIO')
    ModifySQL.Strings = (
      'update TBLOG_TRANSACAO'
      'set'
      '  DATA_HORA = :DATA_HORA,'
      '  DESCRICAO = :DESCRICAO,'
      '  ESPECIFICACAO = :ESPECIFICACAO,'
      '  TIPO = :TIPO,'
      '  USUARIO = :USUARIO'
      'where'
      '  DATA_HORA = :OLD_DATA_HORA and'
      '  USUARIO = :OLD_USUARIO')
    InsertSQL.Strings = (
      'insert into TBLOG_TRANSACAO'
      '  (DATA_HORA, DESCRICAO, ESPECIFICACAO, TIPO, USUARIO)'
      'values'
      '  (:DATA_HORA, :DESCRICAO, :ESPECIFICACAO, :TIPO, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBLOG_TRANSACAO'
      'where'
      '  DATA_HORA = :OLD_DATA_HORA and'
      '  USUARIO = :OLD_USUARIO')
    Left = 456
    Top = 312
  end
  object qryLotesPendentesNFe: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    v.ano        as Ano'
      '  , v.codcontrol as Numero'
      '  , 1            as TipoNFE'
      '  , '#39'Sa'#237'da/Venda'#39'     as Tipo'
      '  , v.lote_nfe_numero as Lote'
      '  , v.lote_nfe_recibo as Recibo'
      'from TBVENDAS v'
      'where v.codemp = :empresa_vnd'
      '  and v.lote_nfe_numero is not null'
      '  and v.nfe is null'
      '  and v.nfe_enviada = 0'
      ''
      'union'
      ''
      'Select'
      '    c.ano        as Ano'
      '  , c.codcontrol as Numero'
      '  , 0            as TipoNFE'
      '  , '#39'Entrada/Compra'#39'  as Tipo'
      '  , c.lote_nfe_numero as Lote'
      '  , c.lote_nfe_recibo as Recibo'
      'from TBCOMPRAS c'
      'where c.codemp = :empresa_cmp'
      '  and c.lote_nfe_numero is not null'
      '  and c.nf is null'
      '  and C.nfe_enviada = 0'
      ''
      'order by 5')
    Left = 424
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'empresa_vnd'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'empresa_cmp'
        ParamType = ptInput
        Value = ''
      end>
    object qryLotesPendentesNFeANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBVENDAS"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLotesPendentesNFeNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"TBVENDAS"."CODCONTROL"'
      Required = True
    end
    object qryLotesPendentesNFeTIPONFE: TIntegerField
      FieldName = 'TIPONFE'
      ProviderFlags = []
    end
    object qryLotesPendentesNFeTIPO: TIBStringField
      FieldName = 'TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 14
    end
    object qryLotesPendentesNFeLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = '"TBVENDAS"."LOTE_NFE_NUMERO"'
    end
    object qryLotesPendentesNFeRECIBO: TIBStringField
      FieldName = 'RECIBO'
      Origin = '"TBVENDAS"."LOTE_NFE_RECIBO"'
      Size = 250
    end
  end
  object qryNFE: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'Select'
      '    n.EMPRESA'
      '  , n.ANOVENDA'
      '  , n.NUMVENDA'
      '  , n.ANOCOMPRA'
      '  , n.NUMCOMPRA'
      '  , n.DATAEMISSAO'
      '  , n.HORAEMISSAO'
      '  , n.SERIE'
      '  , n.NUMERO'
      '  , n.CHAVE'
      '  , n.PROTOCOLO'
      '  , n.RECIBO'
      '  , n.XML_FILENAME'
      '  , n.XML_FILE'
      '  , n.LOTE_ANO'
      '  , n.LOTE_NUM'
      'from TBNFE_ENVIADA n'
      'where n.empresa = :empresa'
      '  and ('
      
        '    ((:tipo_compra = 0) and (n.anocompra = :anocompra and n.numc' +
        'ompra = :numcompra))'
      '    or'
      
        '    ((:tipo_venda  = 1) and (n.anovenda  = :anovenda  and n.numv' +
        'enda  = :numvenda))'
      '  )')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updNFE
    Left = 424
    Top = 280
    object qryNFEEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBNFE_ENVIADA"."EMPRESA"'
      Size = 18
    end
    object qryNFEANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = 'TBNFE_ENVIADA.ANOVENDA'
      Required = True
    end
    object qryNFENUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = 'TBNFE_ENVIADA.NUMVENDA'
    end
    object qryNFEANOCOMPRA: TSmallintField
      FieldName = 'ANOCOMPRA'
      Origin = '"TBNFE_ENVIADA"."ANOCOMPRA"'
    end
    object qryNFENUMCOMPRA: TIntegerField
      FieldName = 'NUMCOMPRA'
      Origin = '"TBNFE_ENVIADA"."NUMCOMPRA"'
    end
    object qryNFEDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'TBNFE_ENVIADA.DATAEMISSAO'
    end
    object qryNFEHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'TBNFE_ENVIADA.HORAEMISSAO'
    end
    object qryNFESERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'TBNFE_ENVIADA.SERIE'
      Required = True
      Size = 4
    end
    object qryNFENUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TBNFE_ENVIADA.NUMERO'
      Required = True
    end
    object qryNFECHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'TBNFE_ENVIADA.CHAVE'
      Size = 250
    end
    object qryNFEPROTOCOLO: TIBStringField
      FieldName = 'PROTOCOLO'
      Origin = 'TBNFE_ENVIADA.PROTOCOLO'
      Size = 250
    end
    object qryNFERECIBO: TIBStringField
      FieldName = 'RECIBO'
      Origin = 'TBNFE_ENVIADA.RECIBO'
      Size = 250
    end
    object qryNFEXML_FILENAME: TIBStringField
      FieldName = 'XML_FILENAME'
      Origin = 'TBNFE_ENVIADA.XML_FILENAME'
      Size = 250
    end
    object qryNFEXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = 'TBNFE_ENVIADA.XML_FILE'
      BlobType = ftMemo
      Size = 8
    end
    object qryNFELOTE_ANO: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = 'TBNFE_ENVIADA.LOTE_ANO'
    end
    object qryNFELOTE_NUM: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = 'TBNFE_ENVIADA.LOTE_NUM'
      Required = True
    end
  end
  object updNFE: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  EMPRESA,'
      '  SERIE,'
      '  NUMERO,'
      '  ANOVENDA,'
      '  NUMVENDA,'
      '  ANOCOMPRA,'
      '  NUMCOMPRA,'
      '  DATAEMISSAO,'
      '  HORAEMISSAO,'
      '  CHAVE,'
      '  PROTOCOLO,'
      '  RECIBO,'
      '  XML_FILENAME,'
      '  XML_FILE,'
      '  LOTE_ANO,'
      '  LOTE_NUM'
      'from TBNFE_ENVIADA '
      'where'
      '  EMPRESA = :EMPRESA and'
      '  NUMERO = :NUMERO and'
      '  SERIE = :SERIE')
    ModifySQL.Strings = (
      'update TBNFE_ENVIADA'
      'set'
      '  ANOCOMPRA = :ANOCOMPRA,'
      '  ANOVENDA = :ANOVENDA,'
      '  CHAVE = :CHAVE,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  EMPRESA = :EMPRESA,'
      '  HORAEMISSAO = :HORAEMISSAO,'
      '  LOTE_ANO = :LOTE_ANO,'
      '  LOTE_NUM = :LOTE_NUM,'
      '  NUMCOMPRA = :NUMCOMPRA,'
      '  NUMERO = :NUMERO,'
      '  NUMVENDA = :NUMVENDA,'
      '  PROTOCOLO = :PROTOCOLO,'
      '  RECIBO = :RECIBO,'
      '  SERIE = :SERIE,'
      '  XML_FILE = :XML_FILE,'
      '  XML_FILENAME = :XML_FILENAME'
      'where'
      '  EMPRESA = :OLD_EMPRESA and'
      '  NUMERO = :OLD_NUMERO and'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TBNFE_ENVIADA'
      
        '  (ANOCOMPRA, ANOVENDA, CHAVE, DATAEMISSAO, EMPRESA, HORAEMISSAO' +
        ', LOTE_ANO, '
      
        '   LOTE_NUM, NUMCOMPRA, NUMERO, NUMVENDA, PROTOCOLO, RECIBO, SER' +
        'IE, XML_FILE, '
      '   XML_FILENAME)'
      'values'
      
        '  (:ANOCOMPRA, :ANOVENDA, :CHAVE, :DATAEMISSAO, :EMPRESA, :HORAE' +
        'MISSAO, '
      
        '   :LOTE_ANO, :LOTE_NUM, :NUMCOMPRA, :NUMERO, :NUMVENDA, :PROTOC' +
        'OLO, :RECIBO, '
      '   :SERIE, :XML_FILE, :XML_FILENAME)')
    DeleteSQL.Strings = (
      'delete from TBNFE_ENVIADA'
      'where'
      '  EMPRESA = :OLD_EMPRESA and'
      '  NUMERO = :OLD_NUMERO and'
      '  SERIE = :OLD_SERIE')
    Left = 456
    Top = 280
  end
end
