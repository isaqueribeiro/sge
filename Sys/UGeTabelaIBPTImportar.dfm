inherited frmGeTabelaIBPTImportar: TfrmGeTabelaIBPTImportar
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Tabela de Tributa'#231#245'es IBPT, Importar!'
  ClientHeight = 433
  ClientWidth = 541
  ExplicitHeight = 470
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel8: TBevel
    Left = 0
    Top = 113
    Width = 541
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 12
    ExplicitTop = 236
  end
  object Bevel1: TBevel
    Left = 0
    Top = 230
    Width = 541
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 121
  end
  object Bevel2: TBevel
    Left = 0
    Top = 396
    Width = 541
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 238
  end
  object pnlConfirmacao: TPanel
    Left = 0
    Top = 400
    Width = 541
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object bvlConfirmacao: TBevel
      Left = 454
      Top = 0
      Width = 4
      Height = 33
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 329
    end
    object btnConfirmar: TcxButton
      Left = 371
      Top = 0
      Width = 83
      Height = 33
      Align = alRight
      Caption = '&Confirmar'
      Enabled = False
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TcxButton
      Left = 458
      Top = 0
      Width = 83
      Height = 33
      Align = alRight
      Cancel = True
      Caption = 'Cancelar'
      OptionsImage.ImageIndex = 16
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object GrpBxDownload: TGroupBox
    Left = 0
    Top = 0
    Width = 541
    Height = 113
    Align = alTop
    Caption = 'Download'
    TabOrder = 0
    object lblURL: TLabel
      Left = 12
      Top = 24
      Width = 173
      Height = 13
      Caption = 'URL do arquivo .csv no padr'#227'o IBPT'
      Color = clBtnFace
      FocusControl = edURL
      ParentColor = False
    end
    object lblInformacaoDownload: TLabel
      Left = 12
      Top = 70
      Width = 426
      Height = 33
      AutoSize = False
      Caption = 'Download em execu'#231#227'o.... Aguarde!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      WordWrap = True
    end
    object btnDownload: TcxButton
      Left = 444
      Top = 70
      Width = 83
      Height = 33
      Caption = '&Download'
      OptionsImage.ImageIndex = 26
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 1
      OnClick = btnDownloadClick
    end
    object edURL: TComboBox
      Left = 12
      Top = 43
      Width = 515
      Height = 21
      TabOrder = 0
      Text = 'edURL'
    end
  end
  object GrpBxImportacao: TGroupBox
    Left = 0
    Top = 117
    Width = 541
    Height = 113
    Align = alTop
    Caption = 'Importa'#231#227'o'
    TabOrder = 1
    DesignSize = (
      541
      113)
    object lblArquivo: TLabel
      Left = 12
      Top = 24
      Width = 122
      Height = 13
      Caption = 'Arquivo para importa'#231#227'o:'
      Color = clBtnFace
      FocusControl = edArquivo
      ParentColor = False
    end
    object lblInformacaoImportacao: TLabel
      Left = 12
      Top = 70
      Width = 426
      Height = 33
      AutoSize = False
      Caption = 'Download em execu'#231#227'o.... Aguarde!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      WordWrap = True
    end
    object edArquivo: TEdit
      Left = 12
      Top = 43
      Width = 515
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object btnImportar: TcxButton
      Left = 444
      Top = 70
      Width = 83
      Height = 33
      Caption = '&Importar...'
      OptionsImage.ImageIndex = 28
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 1
      OnClick = btnImportarClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 234
    Width = 541
    Height = 162
    Align = alClient
    Caption = 'Dados da tabela'
    TabOrder = 3
    object lblVigencia: TLabel
      Left = 122
      Top = 68
      Width = 53
      Height = 13
      Caption = 'Vig'#234'ncia: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblFonte: TLabel
      Left = 122
      Top = 106
      Width = 35
      Height = 13
      Caption = 'Fonte:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblChave: TLabel
      Left = 122
      Top = 87
      Width = 41
      Height = 13
      Caption = 'Chave: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblQtdeItem: TLabel
      Left = 122
      Top = 49
      Width = 119
      Height = 13
      Caption = 'Quantidade de itens: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblVersao: TLabel
      Left = 122
      Top = 30
      Width = 42
      Height = 13
      Caption = 'Vers'#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label1: TLabel
      Left = 12
      Top = 30
      Width = 37
      Height = 13
      Caption = 'Vers'#227'o:'
    end
    object Label2: TLabel
      Left = 12
      Top = 49
      Width = 104
      Height = 13
      Caption = 'Quantidade de itens: '
    end
    object Label3: TLabel
      Left = 12
      Top = 68
      Width = 46
      Height = 13
      Caption = 'Vig'#234'ncia: '
    end
    object Label5: TLabel
      Left = 12
      Top = 87
      Width = 38
      Height = 13
      Caption = 'Chave: '
    end
    object Label6: TLabel
      Left = 12
      Top = 106
      Width = 32
      Height = 13
      Caption = 'Fonte:'
    end
    object WebBrowser: TWebBrowser
      Left = 512
      Top = 128
      Width = 15
      Height = 15
      TabOrder = 1
      ControlData = {
        4C0000008D0100008D0100000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object prgImportacao: TProgressBar
      Left = 122
      Top = 125
      Width = 405
      Height = 20
      TabOrder = 0
      Visible = False
    end
  end
  object ACBrIBPT: TACBrIBPTax
    ProxyPort = '8080'
    OnErroImportacao = ACBrIBPTErroImportacao
    Left = 416
  end
  object tmpCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 24
    object tmpCadastroNCM: TStringField
      DisplayWidth = 10
      FieldName = 'NCM'
      Size = 8
    end
    object tmpCadastroEx: TIntegerField
      DisplayWidth = 3
      FieldName = 'Ex'
    end
    object tmpCadastroTabela: TIntegerField
      DisplayWidth = 8
      FieldName = 'Tabela'
    end
    object tmpCadastroDescricao: TStringField
      DisplayWidth = 50
      FieldName = 'Descricao'
      Size = 250
    end
    object tmpCadastroAliqFedNacional: TFloatField
      DisplayLabel = 'Nacional'
      DisplayWidth = 12
      FieldName = 'AliqFedNacional'
      DisplayFormat = ',#0.00 %'
    end
    object tmpCadastroAliqFedImportado: TFloatField
      DisplayLabel = 'Importado'
      DisplayWidth = 12
      FieldName = 'AliqFedImportado'
      DisplayFormat = ',#0.00 %'
    end
    object tmpCadastroAliqEstadual: TFloatField
      DisplayLabel = 'Estadual'
      DisplayWidth = 12
      FieldName = 'AliqEstadual'
      DisplayFormat = ',#0.00 %'
    end
    object tmpCadastroAliqMunicipal: TFloatField
      DisplayLabel = 'Municipal'
      DisplayWidth = 12
      FieldName = 'AliqMunicipal'
      DisplayFormat = ',#0.00 %'
    end
  end
  object dtsCadastro: TDataSource
    DataSet = tmpCadastro
    Left = 304
    Top = 24
  end
  object ACBrNcms: TACBrNCMs
    ProxyPort = '8080'
    UrlConsulta = 'http://www4.receita.fazenda.gov.br/simulador/PesquisarNCM.jsp?'
    Left = 384
  end
  object opdImportar: TOpenDialog
    DefaultExt = '.csv'
    Filter = 'Tabela IBPT|*.csv'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = 'Abrir arquivo'
    Left = 448
  end
  object qryTabelaIBPT: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_IBPT_ID'
    UpdateOptions.KeyFields = 'ID_IBPT'
    UpdateOptions.AutoIncFields = 'ID_IBPT'
    UpdateObject = updTabelaIBPT
    SQL.Strings = (
      'Select'
      '    t.id_ibpt'
      '  , t.ncm_ibpt'
      '  , t.ex_ibpt'
      '  , t.tabela_ibpt'
      '  , t.descricao_ibpt'
      '  , t.aliqnacional_ibpt'
      '  , t.aliqinternacional_ibpt'
      '  , t.aliqestadual_ibpt'
      '  , t.aliqmunicipal_ibpt'
      '  , t.ativo'
      'from SYS_IBPT t'
      'where t.ncm_ibpt = :ncm_ibpt'
      '  and t.ex_ibpt = :ex_ibpt')
    Left = 273
    Top = 256
    ParamData = <
      item
        Name = 'NCM_IBPT'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end
      item
        Name = 'EX_IBPT'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end>
    object qryTabelaIBPTID_IBPT: TFDAutoIncField
      FieldName = 'ID_IBPT'
      Origin = 'ID_IBPT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryTabelaIBPTNCM_IBPT: TStringField
      FieldName = 'NCM_IBPT'
      Origin = 'NCM_IBPT'
      Required = True
      Size = 10
    end
    object qryTabelaIBPTEX_IBPT: TStringField
      FieldName = 'EX_IBPT'
      Origin = 'EX_IBPT'
      Required = True
      Size = 3
    end
    object qryTabelaIBPTTABELA_IBPT: TStringField
      FieldName = 'TABELA_IBPT'
      Origin = 'TABELA_IBPT'
      Required = True
      Size = 3
    end
    object qryTabelaIBPTDESCRICAO_IBPT: TMemoField
      FieldName = 'DESCRICAO_IBPT'
      Origin = 'DESCRICAO_IBPT'
      BlobType = ftMemo
    end
    object qryTabelaIBPTALIQNACIONAL_IBPT: TBCDField
      FieldName = 'ALIQNACIONAL_IBPT'
      Origin = 'ALIQNACIONAL_IBPT'
      Precision = 18
      Size = 2
    end
    object qryTabelaIBPTALIQINTERNACIONAL_IBPT: TBCDField
      FieldName = 'ALIQINTERNACIONAL_IBPT'
      Origin = 'ALIQINTERNACIONAL_IBPT'
      Precision = 18
      Size = 2
    end
    object qryTabelaIBPTALIQESTADUAL_IBPT: TBCDField
      FieldName = 'ALIQESTADUAL_IBPT'
      Origin = 'ALIQESTADUAL_IBPT'
      Precision = 18
      Size = 2
    end
    object qryTabelaIBPTALIQMUNICIPAL_IBPT: TBCDField
      FieldName = 'ALIQMUNICIPAL_IBPT'
      Origin = 'ALIQMUNICIPAL_IBPT'
      Precision = 18
      Size = 2
    end
    object qryTabelaIBPTATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
  end
  object updTabelaIBPT: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO SYS_IBPT'
      '(ID_IBPT, NCM_IBPT, EX_IBPT, TABELA_IBPT, '
      '  DESCRICAO_IBPT, ALIQNACIONAL_IBPT, ALIQINTERNACIONAL_IBPT, '
      '  ALIQESTADUAL_IBPT, ALIQMUNICIPAL_IBPT, ATIVO)'
      
        'VALUES (:NEW_ID_IBPT, :NEW_NCM_IBPT, :NEW_EX_IBPT, :NEW_TABELA_I' +
        'BPT, '
      
        '  :NEW_DESCRICAO_IBPT, :NEW_ALIQNACIONAL_IBPT, :NEW_ALIQINTERNAC' +
        'IONAL_IBPT, '
      '  :NEW_ALIQESTADUAL_IBPT, :NEW_ALIQMUNICIPAL_IBPT, :NEW_ATIVO)')
    ModifySQL.Strings = (
      'UPDATE SYS_IBPT'
      
        'SET ID_IBPT = :NEW_ID_IBPT, NCM_IBPT = :NEW_NCM_IBPT, EX_IBPT = ' +
        ':NEW_EX_IBPT, '
      
        '  TABELA_IBPT = :NEW_TABELA_IBPT, DESCRICAO_IBPT = :NEW_DESCRICA' +
        'O_IBPT, '
      
        '  ALIQNACIONAL_IBPT = :NEW_ALIQNACIONAL_IBPT, ALIQINTERNACIONAL_' +
        'IBPT = :NEW_ALIQINTERNACIONAL_IBPT, '
      
        '  ALIQESTADUAL_IBPT = :NEW_ALIQESTADUAL_IBPT, ALIQMUNICIPAL_IBPT' +
        ' = :NEW_ALIQMUNICIPAL_IBPT, '
      '  ATIVO = :NEW_ATIVO'
      'WHERE ID_IBPT = :OLD_ID_IBPT')
    DeleteSQL.Strings = (
      'DELETE FROM SYS_IBPT'
      'WHERE ID_IBPT = :OLD_ID_IBPT')
    FetchRowSQL.Strings = (
      
        'SELECT ID_IBPT, NCM_IBPT, EX_IBPT, TABELA_IBPT, DESCRICAO_IBPT, ' +
        'ALIQNACIONAL_IBPT, '
      
        '  ALIQINTERNACIONAL_IBPT, ALIQESTADUAL_IBPT, ALIQMUNICIPAL_IBPT,' +
        ' '
      '  ATIVO'
      'FROM SYS_IBPT'
      'WHERE ID_IBPT = :ID_IBPT')
    Left = 305
    Top = 256
  end
end
