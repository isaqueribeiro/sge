inherited frmGeImportarNFE: TfrmGeImportarNFE
  ActiveControl = edChaveNFe
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Importar NF-e'
  ClientHeight = 626
  ClientWidth = 740
  ExplicitWidth = 754
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 740
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 121
    ExplicitWidth = 593
  end
  object Bevel2: TBevel
    Left = 0
    Top = 153
    Width = 740
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 473
    ExplicitWidth = 593
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
    Width = 740
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 161
    ExplicitWidth = 593
  end
  object GrpBxEmpresa: TGroupBox
    Left = 0
    Top = 0
    Width = 740
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
    DesignSize = (
      740
      73)
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
      Width = 540
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
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
    Width = 740
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
      740
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
      Width = 609
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
      Left = 631
      Top = 40
      Width = 93
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Manifesto'
      OptionsImage.ImageIndex = 39
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      TabOrder = 1
    end
  end
  object btnConfirmar: TcxButton
    Left = 550
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
    Left = 648
    Top = 593
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    ModalResult = 2
    OptionsImage.ImageIndex = 15
    OptionsImage.Images = DMRecursos.ImgBotoes16x16
    TabOrder = 3
  end
  object GrpBxDadosNFe: TGroupBox
    Left = 0
    Top = 157
    Width = 740
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
      740
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
      Anchors = [akLeft, akTop, akRight]
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 26
          Hint = 'Selecionar arquivo XML'
          Kind = bkGlyph
        end>
      Properties.Images = DMRecursos.ImgBotoes16x16
      Properties.OnButtonClick = edArquivoXMLPropertiesButtonClick
      TabOrder = 0
      Width = 609
    end
    object btnCarregarXML: TcxButton
      Left = 631
      Top = 40
      Width = 93
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Carregar'
      OptionsImage.ImageIndex = 35
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 1
      OnClick = btnCarregarXMLClick
    end
    object pgcNFe: TPageControl
      Left = 16
      Top = 67
      Width = 708
      Height = 342
      ActivePage = tbsEmitente
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object tbsNFe: TTabSheet
        Caption = 'NFe'
      end
      object tbsEmitente: TTabSheet
        Caption = 'Emitente'
        ImageIndex = 1
      end
      object TabSheet3: TTabSheet
        Caption = 'Destinat'#225'rio'
        ImageIndex = 2
      end
      object TabSheet4: TTabSheet
        Caption = 'Produtos e Servi'#231'os'
        ImageIndex = 3
      end
      object TabSheet5: TTabSheet
        Caption = 'Totais'
        ImageIndex = 4
      end
      object TabSheet6: TTabSheet
        Caption = 'Transporte'
        ImageIndex = 5
      end
      object TabSheet7: TTabSheet
        Caption = 'Cobran'#231'a'
        ImageIndex = 6
      end
      object TabSheet8: TTabSheet
        Caption = 'Informa'#231#245'es Adicionais'
        ImageIndex = 7
      end
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
    Left = 304
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
  end
  object dtsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 312
    Top = 8
  end
  object cdsIdentificacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 65533
  end
  object cdsEmitente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 45
  end
  object cdsDadosProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 65533
  end
  object cdsDestinatario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 93
  end
  object cdsDuplicatas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 93
  end
  object cdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 45
  end
  object cdsCalculoImposto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 65533
  end
  object cdsTransportador: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 45
  end
  object cdsVeiculo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 93
  end
  object cdsVolumes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 65533
  end
  object cdsEventos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 45
  end
  object cdsISSQN: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 93
  end
  object cdsFatura: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 65533
  end
  object cdsLocalRetirada: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 45
  end
  object cdsLocalEntrega: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 93
  end
  object cdsInformacoesAdicionais: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 65533
  end
  object cdsPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 45
  end
  object cdsInutilizacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 93
  end
  object dtsEmitente: TDataSource
    Left = 396
    Top = 48
  end
  object dtsIdentificacao: TDataSource
    Left = 396
    Top = 8
  end
  object dtsDestinatario: TDataSource
    Left = 396
    Top = 104
  end
  object dtsDadosProdutos: TDataSource
    Left = 436
    Top = 8
  end
  object dtsParametros: TDataSource
    Left = 436
    Top = 48
  end
  object dtsDuplicatas: TDataSource
    Left = 436
    Top = 104
  end
  object dtsCalculoImposto: TDataSource
    Left = 476
    Top = 8
  end
  object dtsTransportador: TDataSource
    Left = 476
    Top = 48
  end
  object dtsVeiculo: TDataSource
    Left = 476
    Top = 104
  end
  object dtsVolumes: TDataSource
    Left = 516
    Top = 8
  end
  object dtsEventos: TDataSource
    Left = 516
    Top = 48
  end
  object dtsISSQN: TDataSource
    Left = 516
    Top = 104
  end
  object dtsFatura: TDataSource
    Left = 556
    Top = 8
  end
  object dtsLocalRetirada: TDataSource
    Left = 556
    Top = 48
  end
  object dtsLocalEntrega: TDataSource
    Left = 556
    Top = 104
  end
  object dtsInformacoesAdicionais: TDataSource
    Left = 596
    Top = 8
  end
  object dtsPagamento: TDataSource
    Left = 596
    Top = 48
  end
  object dtsInutilizacao: TDataSource
    Left = 596
    Top = 104
  end
end
