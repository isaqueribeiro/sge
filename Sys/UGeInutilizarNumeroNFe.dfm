inherited frmGeInutilizarNumeroNFe: TfrmGeInutilizarNumeroNFe
  Left = 434
  Top = 224
  ActiveControl = edAno
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Inutilizar Numera'#231#227'o NF-e'
  ClientHeight = 428
  ClientWidth = 593
  ExplicitWidth = 607
  ExplicitHeight = 465
  DesignSize = (
    593
    428)
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
    Top = 389
    Width = 593
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object lblInforme: TLabel
    Left = 0
    Top = 400
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
  object GrpBxDadosInutilizacao: TGroupBox
    Left = 0
    Top = 125
    Width = 593
    Height = 264
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Dados para Inutiliza'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      593
      264)
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
      Top = 104
      Width = 72
      Height = 13
      Caption = 'Justificativa:'
      FocusControl = dbJustificativa
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
      FocusControl = edAno
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNumeroInicial: TLabel
      Left = 80
      Top = 64
      Width = 84
      Height = 13
      Caption = 'N'#250'mero Inicial:'
      FocusControl = edNumeroInicial
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object lblNumeroFinal: TLabel
      Left = 176
      Top = 64
      Width = 76
      Height = 13
      Caption = 'N'#250'mero Final:'
      FocusControl = edNumeroFinal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbJustificativa: TMemo
      Left = 16
      Top = 120
      Width = 561
      Height = 128
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
      TabOrder = 5
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
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
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object edNumeroInicial: TEdit
      Left = 80
      Top = 80
      Width = 89
      Height = 21
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object edNumeroFinal: TEdit
      Left = 176
      Top = 80
      Width = 89
      Height = 21
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
  end
  object btnConfirmar: TcxButton
    Left = 405
    Top = 395
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Inutilizar'
    OptionsImage.ImageIndex = 41
    OptionsImage.Images = DMRecursos.ImgPrincipal16x16
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btFechar: TcxButton
    Left = 501
    Top = 395
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
    Top = 280
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
    Top = 280
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
      OnGetText = qryEmpresaMODELO_NFEGetText
    end
  end
  object dtsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 552
    Top = 16
  end
  object qryNFeEmitida: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    v.serie'
      '  , v.nfe'
      '  , v.dataemissao'
      '  , '#39'Sa'#237'da  '#39' as Tipo'
      'from TBVENDAS v'
      'where v.codemp = :empresa1'
      '  and cast(v.serie as Smallint) = :serie1'
      '  and v.nfe between :inicio1 and :final1'
      ''
      'union'
      ''
      'Select'
      '    c.nfserie as serie'
      '  , c.nf      as nfe'
      '  , c.dtemiss as dataemissao'
      '  , '#39'Entrada'#39' as Tipo'
      'from TBCOMPRAS c'
      'where c.codemp = :empresa2'
      '  and cast(c.nfserie as Smallint) = :serie2'
      '  and c.nf between :inicio2 and :final2'
      '  and c.nfe_enviada = 1'
      ''
      'order by 1, 2')
    Left = 424
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'empresa1'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'serie1'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'inicio1'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'final1'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'empresa2'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'serie2'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'inicio2'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'final2'
        ParamType = ptInput
        Value = 0
      end>
  end
end
