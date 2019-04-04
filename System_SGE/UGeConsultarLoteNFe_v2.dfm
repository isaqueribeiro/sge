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
      Top = 163
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
    Left = 403
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
    DataSet = fdQryEmpresa
    Left = 552
    Top = 16
  end
  object fdQryLotesPendentesNFe: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
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
      '  and ((v.lote_nfe_recibo = :recibo_vnd) or (:todos = 1))'
      '  and v.lote_nfe_numero is not null'
      '  and v.lote_nfe_recibo is not null'
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
      '  and ((c.lote_nfe_recibo = :recibo_cmp) or (:todos = 1))'
      '  and c.lote_nfe_numero is not null'
      '  and c.lote_nfe_recibo is not null'
      '  and c.nf is null'
      '  and C.nfe_enviada = 0'
      ''
      'order by 1 desc, 2 desc, 5 asc')
    Left = 248
    Top = 349
    ParamData = <
      item
        Name = 'EMPRESA_VND'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'RECIBO_VND'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end
      item
        Name = 'TODOS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA_CMP'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'RECIBO_CMP'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end>
  end
  object fdQryEmpresa: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    e.cnpj'
      '  , e.rzsoc'
      '  , c.nfe_serie  as serie_nfe'
      '  , c.nfe_numero as numero_nfe'
      '  , extract(year from current_date) as lote_ano_nfe'
      '  , c.nfe_lote   as lote_num_nfe'
      '  , 55 as modelo_nfe'
      'from TBEMPRESA e'
      '  left join TBCONFIGURACAO c on (c.empresa = e.cnpj)'
      'where e.cnpj = :cnpj')
    Left = 520
    Top = 16
    ParamData = <
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end>
  end
  object cdsLOG: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updLOG
    SQL.Strings = (
      'Select'
      '    t.usuario'
      '  , t.data_hora'
      '  , t.empresa'
      '  , t.tipo'
      '  , t.descricao'
      '  , t.especificacao'
      'from TBLOG_TRANSACAO t'
      'where 1=0')
    Left = 424
    Top = 376
    object cdsLOGUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsLOGDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLOGEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Size = 18
    end
    object cdsLOGTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object cdsLOGDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object cdsLOGESPECIFICACAO: TMemoField
      FieldName = 'ESPECIFICACAO'
      Origin = 'ESPECIFICACAO'
      BlobType = ftMemo
    end
  end
  object updLOG: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBLOG_TRANSACAO'
      '(USUARIO, DATA_HORA, EMPRESA, TIPO, DESCRICAO, '
      '  ESPECIFICACAO)'
      
        'VALUES (:NEW_USUARIO, :NEW_DATA_HORA, :NEW_EMPRESA, :NEW_TIPO, :' +
        'NEW_DESCRICAO, '
      '  :NEW_ESPECIFICACAO)')
    ModifySQL.Strings = (
      'UPDATE TBLOG_TRANSACAO'
      
        'SET USUARIO = :NEW_USUARIO, DATA_HORA = :NEW_DATA_HORA, EMPRESA ' +
        '= :NEW_EMPRESA, '
      
        '  TIPO = :NEW_TIPO, DESCRICAO = :NEW_DESCRICAO, ESPECIFICACAO = ' +
        ':NEW_ESPECIFICACAO'
      'WHERE USUARIO = :OLD_USUARIO AND DATA_HORA = :OLD_DATA_HORA')
    DeleteSQL.Strings = (
      'DELETE FROM TBLOG_TRANSACAO'
      'WHERE USUARIO = :OLD_USUARIO AND DATA_HORA = :OLD_DATA_HORA')
    FetchRowSQL.Strings = (
      
        'SELECT USUARIO, DATA_HORA, EMPRESA, TIPO, DESCRICAO, ESPECIFICAC' +
        'AO'
      'FROM TBLOG_TRANSACAO'
      'WHERE USUARIO = :USUARIO AND DATA_HORA = :DATA_HORA')
    Left = 456
    Top = 376
  end
  object qryNFE: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updNFE
    SQL.Strings = (
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
    Left = 424
    Top = 336
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'TIPO_COMPRA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ANOCOMPRA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'NUMCOMPRA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'TIPO_VENDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ANOVENDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'NUMVENDA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryNFEEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryNFEANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = 'ANOVENDA'
    end
    object qryNFENUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = 'NUMVENDA'
    end
    object qryNFEANOCOMPRA: TSmallintField
      FieldName = 'ANOCOMPRA'
      Origin = 'ANOCOMPRA'
    end
    object qryNFENUMCOMPRA: TIntegerField
      FieldName = 'NUMCOMPRA'
      Origin = 'NUMCOMPRA'
    end
    object qryNFEDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
    end
    object qryNFEHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'HORAEMISSAO'
    end
    object qryNFESERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qryNFENUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFECHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 250
    end
    object qryNFEPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
      Size = 250
    end
    object qryNFERECIBO: TStringField
      FieldName = 'RECIBO'
      Origin = 'RECIBO'
      Size = 250
    end
    object qryNFEXML_FILENAME: TStringField
      FieldName = 'XML_FILENAME'
      Origin = 'XML_FILENAME'
      Size = 250
    end
    object qryNFEXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = 'XML_FILE'
      BlobType = ftMemo
    end
    object qryNFELOTE_ANO: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = 'LOTE_ANO'
    end
    object qryNFELOTE_NUM: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = 'LOTE_NUM'
      Required = True
    end
  end
  object updNFE: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBNFE_ENVIADA'
      '(EMPRESA, SERIE, NUMERO, ANOVENDA, NUMVENDA, '
      '  ANOCOMPRA, NUMCOMPRA, DATAEMISSAO, HORAEMISSAO, '
      '  CHAVE, PROTOCOLO, RECIBO, XML_FILENAME, '
      '  XML_FILE, LOTE_ANO, LOTE_NUM)'
      
        'VALUES (:NEW_EMPRESA, :NEW_SERIE, :NEW_NUMERO, :NEW_ANOVENDA, :N' +
        'EW_NUMVENDA, '
      
        '  :NEW_ANOCOMPRA, :NEW_NUMCOMPRA, :NEW_DATAEMISSAO, :NEW_HORAEMI' +
        'SSAO, '
      '  :NEW_CHAVE, :NEW_PROTOCOLO, :NEW_RECIBO, :NEW_XML_FILENAME, '
      '  :NEW_XML_FILE, :NEW_LOTE_ANO, :NEW_LOTE_NUM)'
      'RETURNING VERSAO, NFC_NUMERO, CANCELADA')
    ModifySQL.Strings = (
      'UPDATE TBNFE_ENVIADA'
      
        'SET EMPRESA = :NEW_EMPRESA, SERIE = :NEW_SERIE, NUMERO = :NEW_NU' +
        'MERO, '
      
        '  ANOVENDA = :NEW_ANOVENDA, NUMVENDA = :NEW_NUMVENDA, ANOCOMPRA ' +
        '= :NEW_ANOCOMPRA, '
      '  NUMCOMPRA = :NEW_NUMCOMPRA, DATAEMISSAO = :NEW_DATAEMISSAO, '
      
        '  HORAEMISSAO = :NEW_HORAEMISSAO, CHAVE = :NEW_CHAVE, PROTOCOLO ' +
        '= :NEW_PROTOCOLO, '
      '  RECIBO = :NEW_RECIBO, XML_FILENAME = :NEW_XML_FILENAME, '
      
        '  XML_FILE = :NEW_XML_FILE, LOTE_ANO = :NEW_LOTE_ANO, LOTE_NUM =' +
        ' :NEW_LOTE_NUM'
      
        'WHERE EMPRESA = :OLD_EMPRESA AND SERIE = :OLD_SERIE AND NUMERO =' +
        ' :OLD_NUMERO AND '
      '  MODELO = :OLD_MODELO'
      'RETURNING VERSAO, NFC_NUMERO, CANCELADA')
    DeleteSQL.Strings = (
      'DELETE FROM TBNFE_ENVIADA'
      
        'WHERE EMPRESA = :OLD_EMPRESA AND SERIE = :OLD_SERIE AND NUMERO =' +
        ' :OLD_NUMERO AND '
      '  MODELO = :OLD_MODELO')
    FetchRowSQL.Strings = (
      
        'SELECT EMPRESA, SERIE, NUMERO, MODELO, VERSAO, ANOVENDA, NUMVEND' +
        'A, '
      '  ANOCOMPRA, NUMCOMPRA, NFC_NUMERO, DATAEMISSAO, HORAEMISSAO, '
      '  CHAVE, PROTOCOLO, RECIBO, XML_FILENAME, XML_FILE, LOTE_ANO, '
      '  LOTE_NUM, CANCELADA'
      'FROM TBNFE_ENVIADA'
      
        'WHERE EMPRESA = :EMPRESA AND SERIE = :SERIE AND NUMERO = :NUMERO' +
        ' AND '
      '  MODELO = :MODELO')
    Left = 456
    Top = 336
  end
end
