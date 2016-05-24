inherited frmGeImportarNFE: TfrmGeImportarNFE
  ActiveControl = edChaveNFe
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Importar NF-e'
  ClientHeight = 626
  ClientWidth = 593
  ExplicitWidth = 607
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 593
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 121
  end
  object Bevel2: TBevel
    Left = 0
    Top = 153
    Width = 593
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 473
  end
  object lblInforme: TLabel
    Left = 0
    Top = 598
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
    ExplicitTop = 484
  end
  object Bevel3: TBevel
    Left = 0
    Top = 587
    Width = 593
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 161
  end
  object GrpBxEmpresa: TGroupBox
    Left = 0
    Top = 0
    Width = 593
    Height = 73
    Align = alTop
    Caption = 'Dados do Destinat'#225'rio da NF-e'
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
  end
  object GrpBxManifesto: TGroupBox
    Left = 0
    Top = 77
    Width = 593
    Height = 76
    Align = alTop
    Caption = 'Dados para Manifesto da NF-e'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      593
      76)
    object lblChaveNFe: TLabel
      Left = 16
      Top = 24
      Width = 66
      Height = 13
      Caption = 'Chave NF-e:'
      FocusControl = edChaveNFe
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edChaveNFe: TEdit
      Left = 16
      Top = 40
      Width = 463
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btnManifesto: TcxButton
      Left = 485
      Top = 33
      Width = 92
      Height = 35
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Manifesto'
      OptionsImage.ImageIndex = 39
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      TabOrder = 1
    end
  end
  object btnConfirmar: TcxButton
    Left = 403
    Top = 593
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Consultar'
    OptionsImage.ImageIndex = 39
    OptionsImage.Images = DMRecursos.ImgPrincipal16x16
    TabOrder = 2
  end
  object btFechar: TcxButton
    Left = 501
    Top = 593
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    OptionsImage.ImageIndex = 15
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    TabOrder = 3
  end
  object GrpBxDadosNFe: TGroupBox
    Left = 0
    Top = 157
    Width = 593
    Height = 430
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Dados NF-e'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      593
      430)
    object lblArquivoXML: TLabel
      Left = 16
      Top = 24
      Width = 63
      Height = 13
      Caption = 'Arquivo XML:'
      FocusControl = edArquivoXML
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edArquivoXML: TcxButtonEdit
      Left = 16
      Top = 40
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 26
          Hint = 'Selecionar arquivo XML'
          Kind = bkGlyph
        end>
      Properties.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 0
      Width = 463
    end
    object cxButton1: TcxButton
      Left = 485
      Top = 34
      Width = 92
      Height = 33
      Anchors = [akRight, akBottom]
      Caption = 'Carregar'
      OptionsImage.ImageIndex = 35
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 1
    end
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
      'from TBEMPRESA e'
      'where e.cnpj = :cnpj')
    Left = 480
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
      Size = 18
    end
    object qryEmpresaRZSOC: TIBStringField
      FieldName = 'RZSOC'
      Origin = '"TBEMPRESA"."RZSOC"'
      Size = 60
    end
  end
  object dtsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 512
    Top = 16
  end
end
