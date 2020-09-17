inherited frmGeImportarNFE: TfrmGeImportarNFE
  ActiveControl = edChaveNFe
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Importar NF-e'
  ClientHeight = 626
  ClientWidth = 920
  ExplicitWidth = 934
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 920
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 121
    ExplicitWidth = 593
  end
  object Bevel2: TBevel
    Left = 0
    Top = 153
    Width = 920
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
    Width = 920
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 161
    ExplicitWidth = 593
  end
  object GrpBxEmpresa: TGroupBox
    Left = 0
    Top = 0
    Width = 920
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
      920
      73)
    object lblCNPJEmpresa: TLabel
      Left = 16
      Top = 24
      Width = 30
      Height = 13
      Caption = 'CNPJ:'
      FocusControl = dbCNPJEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRazaoSocialEmpresa: TLabel
      Left = 184
      Top = 24
      Width = 74
      Height = 13
      Caption = 'Raz'#227'o Social:'
      FocusControl = dbRazaoSocialEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbCNPJEmpresa: TDBEdit
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
    object dbRazaoSocialEmpresa: TDBEdit
      Left = 184
      Top = 40
      Width = 720
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clMoneyGreen
      DataField = 'RAZAO'
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
    Width = 920
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
      920
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
      Width = 789
      Height = 21
      Hint = 'Pressione F5 para recuperar a Chave da '#225'rea de transfer'#234'ncia.'
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 45
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btnManifesto: TcxButton
      Left = 811
      Top = 40
      Width = 93
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Buscar'
      OptionsImage.ImageIndex = 39
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      TabOrder = 1
      OnClick = btnManifestoClick
    end
  end
  object btnConfirmar: TcxButton
    Left = 730
    Top = 593
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Confirmar'
    OptionsImage.ImageIndex = 20
    OptionsImage.Images = DMRecursos.ImgPrincipal16x16
    TabOrder = 2
  end
  object btFechar: TcxButton
    Left = 828
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
    Width = 920
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
      920
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
      Top = 39
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
      Width = 888
    end
    object btnCarregarXML: TcxButton
      Left = 811
      Top = 40
      Width = 93
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Carregar'
      OptionsImage.ImageIndex = 35
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 1
      Visible = False
      OnClick = btnCarregarXMLClick
    end
    object pgcNFe: TPageControl
      Left = 16
      Top = 67
      Width = 888
      Height = 350
      ActivePage = tbsTotais
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object tbsNFe: TTabSheet
        Caption = 'NFe'
        DesignSize = (
          880
          322)
        object lblId: TLabel
          Left = 16
          Top = 16
          Width = 14
          Height = 13
          Caption = 'Id:'
          FocusControl = dbId
        end
        object lblChave: TLabel
          Left = 525
          Top = 16
          Width = 35
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Chave:'
          FocusControl = dbChave
          ExplicitLeft = 431
        end
        object lblcUF: TLabel
          Left = 747
          Top = 16
          Width = 17
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'UF:'
          FocusControl = dbcUF
          ExplicitLeft = 567
        end
        object lblcNF: TLabel
          Left = 779
          Top = 16
          Width = 67
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Controle XML:'
          FocusControl = dbcNF
          ExplicitLeft = 599
        end
        object lblNatOp: TLabel
          Left = 16
          Top = 56
          Width = 113
          Height = 13
          Caption = 'Natureza da Opera'#231#227'o:'
          FocusControl = dbNatOp
        end
        object lblMod_: TLabel
          Left = 525
          Top = 56
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Mod.:'
          FocusControl = dbMod_
          ExplicitLeft = 431
        end
        object lblSerie: TLabel
          Left = 559
          Top = 56
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'S'#233'rie:'
          FocusControl = dbSerie
          ExplicitLeft = 465
        end
        object lblNNF: TLabel
          Left = 593
          Top = 56
          Width = 67
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'N'#250'mero NF-e:'
          FocusControl = dbNNF
          ExplicitLeft = 499
        end
        object lblDEmi: TLabel
          Left = 747
          Top = 56
          Width = 83
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Data de Emiss'#227'o:'
          FocusControl = dbDEmi
          ExplicitLeft = 567
        end
        object lblMensagemFiscal: TLabel
          Left = 16
          Top = 99
          Width = 97
          Height = 13
          Caption = 'Mensagem do Fisco:'
          FocusControl = dbMensagemFiscal
        end
        object dbId: TDBEdit
          Left = 16
          Top = 32
          Width = 503
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbChave: TDBEdit
          Left = 525
          Top = 32
          Width = 216
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbcUF: TDBEdit
          Left = 747
          Top = 32
          Width = 26
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbcNF: TDBEdit
          Left = 779
          Top = 32
          Width = 82
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbNatOp: TDBEdit
          Left = 16
          Top = 72
          Width = 503
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbMod_: TDBEdit
          Left = 525
          Top = 72
          Width = 28
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbSerie: TDBEdit
          Left = 559
          Top = 72
          Width = 28
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbNNF: TDBEdit
          Left = 593
          Top = 72
          Width = 148
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbDEmi: TDBEdit
          Left = 747
          Top = 72
          Width = 114
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbMensagemFiscal: TDBMemo
          Left = 16
          Top = 118
          Width = 845
          Height = 107
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsIdentificacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
      end
      object tbsEmitente: TTabSheet
        Caption = 'Emitente'
        ImageIndex = 1
        DesignSize = (
          880
          322)
        object lblCNPJ: TLabel
          Left = 119
          Top = 16
          Width = 25
          Height = 13
          Caption = 'CNPJ'
          FocusControl = dbCNPJ
        end
        object lblFornecedorCadastro: TLabel
          Left = 16
          Top = 16
          Width = 48
          Height = 13
          Caption = 'Cadastro:'
          FocusControl = edFornecedorCadastro
        end
        object lblXNome: TLabel
          Left = 286
          Top = 16
          Width = 64
          Height = 13
          Caption = 'Raz'#227'o Social:'
          FocusControl = dbXNome
        end
        object lblXFant: TLabel
          Left = 16
          Top = 56
          Width = 45
          Height = 13
          Caption = 'Fantasia:'
          FocusControl = dbXFant
        end
        object lblIE: TLabel
          Left = 466
          Top = 56
          Width = 91
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Inscri'#231#227'o Estadual:'
          FocusControl = dbIE
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 286
        end
        object lblIM: TLabel
          Left = 587
          Top = 56
          Width = 93
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Inscri'#231#227'o Municipal:'
          FocusControl = dbIM
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 407
        end
        object lblCRT: TLabel
          Left = 708
          Top = 56
          Width = 24
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'CRT:'
          FocusControl = dbCRT
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 528
        end
        object lblXLgr: TLabel
          Left = 16
          Top = 96
          Width = 59
          Height = 13
          Caption = 'Logradouro:'
          FocusControl = dbXLgr
        end
        object lblNro: TLabel
          Left = 587
          Top = 96
          Width = 21
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'No.:'
          FocusControl = dbNro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 407
        end
        object lblXCpl: TLabel
          Left = 659
          Top = 96
          Width = 69
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Complemento:'
          FocusControl = dbXCpl
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 479
        end
        object lblXBairro: TLabel
          Left = 16
          Top = 136
          Width = 32
          Height = 13
          Caption = 'Bairro:'
          FocusControl = dbXBairro
        end
        object lblCMun: TLabel
          Left = 587
          Top = 136
          Width = 47
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Munic'#237'pio:'
          FocusControl = dbCMun
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 407
        end
        object lblUF: TLabel
          Left = 828
          Top = 136
          Width = 17
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'UF:'
          FocusControl = dbUF
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 648
        end
        object lblCEP: TLabel
          Left = 466
          Top = 136
          Width = 23
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'CEP:'
          FocusControl = dbCEP
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 286
        end
        object lblFone: TLabel
          Left = 16
          Top = 176
          Width = 41
          Height = 13
          Caption = 'Fone(s):'
          FocusControl = dbFone
        end
        object dbCNPJ: TDBEdit
          Left = 119
          Top = 32
          Width = 161
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbXNome: TDBEdit
          Left = 286
          Top = 32
          Width = 575
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbXFant: TDBEdit
          Left = 16
          Top = 72
          Width = 444
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbIE: TDBEdit
          Left = 466
          Top = 72
          Width = 115
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbIM: TDBEdit
          Left = 587
          Top = 72
          Width = 115
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbCRT: TDBEdit
          Left = 708
          Top = 72
          Width = 41
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbDESCR_CST: TDBEdit
          Left = 755
          Top = 72
          Width = 106
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbXLgr: TDBEdit
          Left = 16
          Top = 112
          Width = 565
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbNro: TDBEdit
          Left = 587
          Top = 112
          Width = 66
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbXCpl: TDBEdit
          Left = 659
          Top = 112
          Width = 202
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbXBairro: TDBEdit
          Left = 16
          Top = 152
          Width = 444
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbCMun: TDBEdit
          Left = 587
          Top = 152
          Width = 66
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object dbXMun: TDBEdit
          Left = 659
          Top = 152
          Width = 163
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object dbUF: TDBEdit
          Left = 828
          Top = 152
          Width = 33
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object dbCEP: TDBEdit
          Left = 466
          Top = 152
          Width = 115
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbFone: TDBEdit
          Left = 16
          Top = 192
          Width = 444
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsEmitente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object edFornecedorCadastro: TJvComboEdit
          Left = 16
          Top = 32
          Width = 97
          Height = 21
          ButtonFlat = True
          ButtonHint = 'Pesquisar Cadastro de Fornecedor (Ctrl + P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Enabled = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            180000000000000600000000000000000000000000000000000000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF009993
            9D203040938B9300FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF009696963333338E8E8E00FF0000FF00B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C03048609C989D00FF009C9C9C43434343434343434343434343434343
            43434343434343434343434646465151518888884C4C4C99999900FF00B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F050687000FF009C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C9C9C9C
            9C9C9C9C9C9C9C9C868686565656909090A4A4A4B9B9B968686800FF00B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0B7B3B500FF009C9C9CFFFFFFFFFFFFFAFAFAF0F0F0D4D4D494
            9494666666646464595959747474A9A9A9CECECE919191B4B4B400FF00B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0A6AAAE00FF0000FF009C9C9CFFFFFFFFFFFFFFFFFFE0E0E0909090A6
            A6A6BCBCBCAEAEAE7676765454549494949B9B9BAAAAAA00FF0000FF00B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B0807870988D
            92A8ADB100FF0000FF0000FF009C9C9CFFFFFFFFFFFFFFFFFFB0B0B0B6B6B6EC
            ECECE7E7E7D3D3D3C9C9C97676768F8F8FADADAD00FF0000FF0000FF00C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06267
            6000FF0000FF0000FF0000FF00A3A3A3FFFFFFFFFFFFFFFFFF969696E6E6E6F6
            F6F6F1F1F1E7E7E7D8D8D8AEAEAE64646400FF0000FF0000FF0000FF00C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716F
            6F00FF0000FF0000FF0000FF00A8A8A8FFFFFFFFFFFFFFFFFF9B9B9BE6E6E6FF
            FFFFF6F6F6F1F1F1E7E7E7BEBEBE6F6F6F00FF0000FF0000FF0000FF00C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A5A0
            A000FF0000FF0000FF0000FF00ACACACFFFFFFFFFFFFFFFFFFC4C4C4C0C0C0FF
            FFFFFFFFFFF6F6F6ECECEC9C9C9CA0A0A000FF0000FF0000FF0000FF00D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A070706000FF
            0000FF0000FF0000FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF9F9F9B6B6B6C0
            C0C0E6E6E6E6E6E6ABABAB6B6B6B00FF0000FF0000FF0000FF0000FF00D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A09090908090909060504000FF
            0000FF0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9C4
            C4C49B9B9B8B8B8B9090904C4C4C00FF0000FF0000FF0000FF0000FF00D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A09060483060483060483000FF
            0000FF0000FF0000FF0000FF00B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF9C9C9C43434343434343434300FF0000FF0000FF0000FF0000FF00D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C060483000FF0000FF
            0000FF0000FF0000FF0000FF00BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFA3A3A3C6C6C643434300FF0000FF0000FF0000FF0000FF0000FF00E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A060483000FF0000FF0000FF
            0000FF0000FF0000FF0000FF00BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFA8A8A843434300FF0000FF0000FF0000FF0000FF0000FF0000FF00E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF00BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBCBCBCB8
            B8B8AEAEAE00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
          NumGlyphs = 2
          TabOrder = 0
          Text = ''
          OnButtonClick = edFornecedorCadastroButtonClick
        end
      end
      object tbsDestinatario: TTabSheet
        Caption = 'Destinat'#225'rio'
        ImageIndex = 8
        DesignSize = (
          880
          322)
        object lblCNPJCPF_Dest: TLabel
          Left = 16
          Top = 16
          Width = 58
          Height = 13
          Caption = 'CPF / CNPJ:'
          FocusControl = dbCNPJCPF_Dest
        end
        object lblXNome_Dest: TLabel
          Left = 183
          Top = 16
          Width = 101
          Height = 13
          Caption = 'Nome / Raz'#227'o Social:'
          FocusControl = dbXNome_Dest
        end
        object lblXFant_Dest: TLabel
          Left = 16
          Top = 56
          Width = 45
          Height = 13
          Caption = 'Fantasia:'
          FocusControl = dbXFant_Dest
        end
        object lblIE_Dest: TLabel
          Left = 466
          Top = 56
          Width = 91
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Inscri'#231#227'o Estadual:'
          FocusControl = dbIE_Dest
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 372
        end
        object dbCNPJCPF_Dest: TDBEdit
          Left = 16
          Top = 32
          Width = 161
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = dtsDestinatario
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbXNome_Dest: TDBEdit
          Left = 183
          Top = 32
          Width = 678
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsDestinatario
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbXFant_Dest: TDBEdit
          Left = 16
          Top = 72
          Width = 444
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsDestinatario
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbIE_Dest: TDBEdit
          Left = 466
          Top = 72
          Width = 115
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsDestinatario
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object tbsProdutos: TTabSheet
        Caption = 'Produtos e Servi'#231'os'
        ImageIndex = 3
        object GrdProdutos: TcxGrid
          Left = 0
          Top = 0
          Width = 880
          Height = 322
          Align = alClient
          TabOrder = 0
          OnEnter = GrdProdutosEnter
          OnExit = GrdProdutosExit
          object GrdProdutosDBTableView: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dtsDadosProdutos
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.CellEndEllipsis = True
            OptionsView.NoDataToDisplayInfoText = '<Sem produtos para exibi'#231#227'o>'
            OptionsView.GroupByBox = False
            Styles.Content = StyleContent
            Styles.ContentEven = StyleContentEven
            Styles.Selection = StyleSelecao
            object GrdProdutosDBTableViewCadastro: TcxGridDBColumn
              Caption = 'Cadastro '
              DataBinding.FieldName = 'ID'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  ImageIndex = 1
                  Hint = 'Buscar Cadastro do Produto/Servi'#231'o'
                  Kind = bkGlyph
                end>
              Properties.ClickKey = 16464
              Properties.Images = DMRecursos.ImgBotoes16x16
              Properties.OnButtonClick = GrdProdutosDBTableViewCadastroPropertiesButtonClick
              Options.Filtering = False
              Options.Moving = False
              Styles.Header = cxStyleHeader
              Width = 100
            end
            object GrdProdutosDBTableViewCodigo: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'CProd'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.Moving = False
              Width = 120
            end
            object GrdProdutosDBTableViewDescricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'XProd'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.Moving = False
              Width = 340
            end
            object GrdProdutosDBTableViewQtde: TcxGridDBColumn
              Caption = 'Qtde.'
              DataBinding.FieldName = 'QCom'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.###'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 50
            end
            object GrdProdutosDBTableViewUND: TcxGridDBColumn
              Caption = 'UN'
              DataBinding.FieldName = 'UCom'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 35
            end
            object GrdProdutosDBTableViewValor: TcxGridDBColumn
              Caption = 'Valor (R$)'
              DataBinding.FieldName = 'VUnCom'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
            end
            object GrdProdutosDBTableViewNCM: TcxGridDBColumn
              Caption = 'NCM '
              DataBinding.FieldName = 'NCM'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
            end
            object GrdProdutosDBTableViewCFOP: TcxGridDBColumn
              Caption = 'CFOP '
              DataBinding.FieldName = 'CFOP'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 50
            end
          end
          object GrdProdutosLevel: TcxGridLevel
            GridView = GrdProdutosDBTableView
          end
        end
      end
      object tbsTotais: TTabSheet
        Caption = 'Totais'
        ImageIndex = 4
        DesignSize = (
          880
          322)
        object lblVBC: TLabel
          Left = 16
          Top = 16
          Width = 82
          Height = 13
          Caption = 'Valor Base ICMS:'
          FocusControl = dbVBC
        end
        object lblVICMS: TLabel
          Left = 163
          Top = 16
          Width = 56
          Height = 13
          Caption = 'Valor ICMS:'
          FocusControl = dbVICMS
        end
        object lblVBCST: TLabel
          Left = 310
          Top = 16
          Width = 113
          Height = 13
          Caption = 'Valor Base Subst. Trib.:'
          FocusControl = dbVBCST
        end
        object lblVST: TLabel
          Left = 457
          Top = 16
          Width = 87
          Height = 13
          Caption = 'Valor Subst. Trib.:'
          FocusControl = dbVST
        end
        object lblVProd: TLabel
          Left = 604
          Top = 16
          Width = 118
          Height = 13
          Caption = 'Valor Total Produtos:'
          FocusControl = dbVProd
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVFrete: TLabel
          Left = 16
          Top = 56
          Width = 30
          Height = 13
          Caption = 'Frete:'
          FocusControl = dbVFrete
        end
        object lblVSeg: TLabel
          Left = 163
          Top = 56
          Width = 38
          Height = 13
          Caption = 'Seguro:'
          FocusControl = dbVSeg
        end
        object lblVDesc: TLabel
          Left = 310
          Top = 56
          Width = 54
          Height = 13
          Caption = 'Descontos:'
          FocusControl = dbVDesc
        end
        object lblVII: TLabel
          Left = 457
          Top = 56
          Width = 39
          Height = 13
          Caption = 'Valor II:'
          FocusControl = dbVII
        end
        object lblVIPI: TLabel
          Left = 604
          Top = 56
          Width = 45
          Height = 13
          Caption = 'Valor IPI:'
          FocusControl = dbVIPI
        end
        object lblVPIS: TLabel
          Left = 16
          Top = 96
          Width = 47
          Height = 13
          Caption = 'Valor PIS:'
          FocusControl = dbVPIS
        end
        object lblVCOFINS: TLabel
          Left = 163
          Top = 96
          Width = 76
          Height = 13
          Caption = 'Valor CONFINS:'
          FocusControl = dbVCOFINS
        end
        object lblVOutro: TLabel
          Left = 310
          Top = 96
          Width = 84
          Height = 13
          Caption = 'Outros Impostos:'
          FocusControl = dbVOutro
        end
        object lblVTotTrib: TLabel
          Left = 457
          Top = 96
          Width = 70
          Height = 13
          Caption = 'Total Tributos:'
          FocusControl = dbVTotTrib
        end
        object lblVNF: TLabel
          Left = 604
          Top = 96
          Width = 95
          Height = 13
          Caption = 'Valor nota Fiscal:'
          FocusControl = dbVNF
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbVBC: TDBEdit
          Left = 16
          Top = 32
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbVICMS: TDBEdit
          Left = 163
          Top = 32
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbVBCST: TDBEdit
          Left = 310
          Top = 32
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbVST: TDBEdit
          Left = 457
          Top = 32
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbVProd: TDBEdit
          Left = 604
          Top = 32
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbVFrete: TDBEdit
          Left = 16
          Top = 72
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbVSeg: TDBEdit
          Left = 163
          Top = 72
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbVDesc: TDBEdit
          Left = 310
          Top = 72
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbVII: TDBEdit
          Left = 457
          Top = 72
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbVIPI: TDBEdit
          Left = 604
          Top = 72
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbVPIS: TDBEdit
          Left = 16
          Top = 112
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbVCOFINS: TDBEdit
          Left = 163
          Top = 112
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbVOutro: TDBEdit
          Left = 310
          Top = 112
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbVTotTrib: TDBEdit
          Left = 457
          Top = 112
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object dbVNF: TDBEdit
          Left = 604
          Top = 112
          Width = 141
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMoneyGreen
          DataSource = dtsCalculoImposto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
      end
      object tbsTransporte: TTabSheet
        Caption = 'Transporte'
        ImageIndex = 5
      end
      object tbsCobranca: TTabSheet
        Caption = 'Cobran'#231'a'
        ImageIndex = 6
      end
      object tbsInformacaoAdcional: TTabSheet
        Caption = 'Informa'#231#245'es Adicionais'
        ImageIndex = 7
      end
    end
  end
  object dtsEmpresa: TDataSource
    DataSet = fdQryEmpresa
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
  object fdQryEmpresa: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    e.cnpj'
      '  , e.razao'
      '  , e.fantasia'
      'from VW_EMPRESA e'
      'where e.cnpj = :cnpj')
    Left = 300
    ParamData = <
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object StyleRepository: TcxStyleRepository
    Left = 424
    Top = 448
    PixelsPerInch = 96
    object StyleSelecao: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object StyleContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMenuBar
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object StyleContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10930928
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyleHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object fdQryFornecedor: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_FORNECEDOR_ID'
    UpdateOptions.KeyFields = 'CODFORN'
    UpdateOptions.AutoIncFields = 'CODFORN'
    UpdateObject = fdUpdFornecedor
    SQL.Strings = (
      'Select'
      '    f.Codforn'
      '  , f.Pessoa_fisica'
      '  , f.Cnpj'
      '  , f.Nomeforn'
      '  , f.Nomefant'
      '  , f.Inscest'
      '  , f.Inscmun'
      '  , f.Ender'
      '  , f.Complemento'
      '  , f.Numero_end'
      '  , f.Cep'
      '  , f.Cidade'
      '  , f.Uf'
      '  , f.Fone'
      '  , f.FoneCel'
      '  , f.FoneFax'
      '  , f.Tlg_tipo'
      '  , f.Log_cod'
      '  , f.Bai_cod'
      '  , f.Cid_cod'
      '  , f.Est_cod'
      '  , f.Email'
      '  , f.Site'
      '  , f.Contato'
      '  , f.Pais_id'
      '  , f.Grf_cod'
      '  , f.Transportadora'
      '  , f.banco'
      '  , f.agencia'
      '  , f.cc'
      '  , f.praca'
      '  , f.banco_2'
      '  , f.agencia_2'
      '  , f.cc_2'
      '  , f.praca_2'
      '  , f.banco_3'
      '  , f.agencia_3'
      '  , f.cc_3'
      '  , f.praca_3'
      '  , f.observacao'
      '  , f.DtCad'
      '  , f.Faturamento_minimo'
      '  , f.ativo'
      
        '  , coalesce( cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descrica' +
        'o) || '#39' '#39', '#39#39') || l.Log_nome as varchar(250)), f.Ender ) as Logr' +
        'adouro'
      '  , b.Bai_nome'
      '  , coalesce(c.Cid_nome, f.Cidade) as Cid_nome'
      '  , coalesce(u.Est_nome, f.Uf) as Est_nome'
      '  , p.Pais_nome'
      'from TBFORNECEDOR f'
      '  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = f.Tlg_tipo)'
      '  left join TBLOGRADOURO l on (l.Log_cod = f.Log_cod)'
      '  left join TBBAIRRO b on (b.Bai_cod = f.Bai_cod)'
      '  left join TBCIDADE c on (c.Cid_cod = f.Cid_cod)'
      '  left join TBESTADO u on (u.Est_cod = f.Est_cod)'
      '  left join TBPAIS p on (p.Pais_id = f.Pais_id)'
      'where (f.Cnpj = :cnpj)')
    Left = 96
    Top = 472
    ParamData = <
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end>
  end
  object fdUpdFornecedor: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBFORNECEDOR'
      '(CODFORN, PESSOA_FISICA, NOMEFORN, NOMEFANT, '
      '  CNPJ, INSCEST, INSCMUN, ENDER, COMPLEMENTO, '
      '  NUMERO_END, CEP, CIDADE, UF, CONTATO, '
      '  FONE, FONECEL, FONEFAX, EMAIL, SITE, '
      '  TLG_TIPO, LOG_COD, BAI_COD, CID_COD, '
      '  EST_COD, PAIS_ID, GRF_COD, TRANSPORTADORA, '
      '  BANCO, AGENCIA, CC, PRACA, BANCO_2, '
      '  AGENCIA_2, CC_2, PRACA_2, BANCO_3, AGENCIA_3, '
      '  CC_3, PRACA_3, OBSERVACAO, DTCAD, ATIVO, '
      '  FATURAMENTO_MINIMO)'
      
        'VALUES (:NEW_CODFORN, :NEW_PESSOA_FISICA, :NEW_NOMEFORN, :NEW_NO' +
        'MEFANT, '
      
        '  :NEW_CNPJ, :NEW_INSCEST, :NEW_INSCMUN, :NEW_ENDER, :NEW_COMPLE' +
        'MENTO, '
      
        '  :NEW_NUMERO_END, :NEW_CEP, :NEW_CIDADE, :NEW_UF, :NEW_CONTATO,' +
        ' '
      '  :NEW_FONE, :NEW_FONECEL, :NEW_FONEFAX, :NEW_EMAIL, :NEW_SITE, '
      '  :NEW_TLG_TIPO, :NEW_LOG_COD, :NEW_BAI_COD, :NEW_CID_COD, '
      
        '  :NEW_EST_COD, :NEW_PAIS_ID, :NEW_GRF_COD, :NEW_TRANSPORTADORA,' +
        ' '
      '  :NEW_BANCO, :NEW_AGENCIA, :NEW_CC, :NEW_PRACA, :NEW_BANCO_2, '
      
        '  :NEW_AGENCIA_2, :NEW_CC_2, :NEW_PRACA_2, :NEW_BANCO_3, :NEW_AG' +
        'ENCIA_3, '
      
        '  :NEW_CC_3, :NEW_PRACA_3, :NEW_OBSERVACAO, :NEW_DTCAD, :NEW_ATI' +
        'VO, '
      '  :NEW_FATURAMENTO_MINIMO)'
      'RETURNING CODFORN')
    ModifySQL.Strings = (
      'UPDATE TBFORNECEDOR'
      'SET CODFORN = :NEW_CODFORN, PESSOA_FISICA = :NEW_PESSOA_FISICA, '
      
        '  NOMEFORN = :NEW_NOMEFORN, NOMEFANT = :NEW_NOMEFANT, CNPJ = :NE' +
        'W_CNPJ, '
      
        '  INSCEST = :NEW_INSCEST, INSCMUN = :NEW_INSCMUN, ENDER = :NEW_E' +
        'NDER, '
      '  COMPLEMENTO = :NEW_COMPLEMENTO, NUMERO_END = :NEW_NUMERO_END, '
      
        '  CEP = :NEW_CEP, CIDADE = :NEW_CIDADE, UF = :NEW_UF, CONTATO = ' +
        ':NEW_CONTATO, '
      
        '  FONE = :NEW_FONE, FONECEL = :NEW_FONECEL, FONEFAX = :NEW_FONEF' +
        'AX, '
      
        '  EMAIL = :NEW_EMAIL, SITE = :NEW_SITE, TLG_TIPO = :NEW_TLG_TIPO' +
        ', '
      
        '  LOG_COD = :NEW_LOG_COD, BAI_COD = :NEW_BAI_COD, CID_COD = :NEW' +
        '_CID_COD, '
      
        '  EST_COD = :NEW_EST_COD, PAIS_ID = :NEW_PAIS_ID, GRF_COD = :NEW' +
        '_GRF_COD, '
      '  TRANSPORTADORA = :NEW_TRANSPORTADORA, BANCO = :NEW_BANCO, '
      '  AGENCIA = :NEW_AGENCIA, CC = :NEW_CC, PRACA = :NEW_PRACA, '
      
        '  BANCO_2 = :NEW_BANCO_2, AGENCIA_2 = :NEW_AGENCIA_2, CC_2 = :NE' +
        'W_CC_2, '
      
        '  PRACA_2 = :NEW_PRACA_2, BANCO_3 = :NEW_BANCO_3, AGENCIA_3 = :N' +
        'EW_AGENCIA_3, '
      
        '  CC_3 = :NEW_CC_3, PRACA_3 = :NEW_PRACA_3, OBSERVACAO = :NEW_OB' +
        'SERVACAO, '
      
        '  DTCAD = :NEW_DTCAD, ATIVO = :NEW_ATIVO, FATURAMENTO_MINIMO = :' +
        'NEW_FATURAMENTO_MINIMO'
      'WHERE CODFORN = :OLD_CODFORN'
      'RETURNING CODFORN')
    DeleteSQL.Strings = (
      'DELETE FROM TBFORNECEDOR'
      'WHERE CODFORN = :OLD_CODFORN')
    FetchRowSQL.Strings = (
      
        'SELECT CODFORN, TIPO, PESSOA_FISICA, NOMEFORN, NOMEFANT, CNPJ, I' +
        'NSCEST, '
      '  INSCMUN, ENDER, COMPLEMENTO, NUMERO_END, CEP, CIDADE, UF, '
      '  CONTATO, FONE, FONECEL, FONEFAX, EMAIL, SITE, TLG_TIPO, '
      
        '  LOG_COD, BAI_COD, CID_COD, EST_COD, PAIS_ID, GRF_COD, TRANSPOR' +
        'TADORA, '
      '  BANCO, AGENCIA, CC, PRACA, BANCO_2, AGENCIA_2, CC_2, PRACA_2, '
      '  BANCO_3, AGENCIA_3, CC_3, PRACA_3, OBSERVACAO, DTCAD, ATIVO, '
      '  CLIENTE_ORIGEM, CLIENTE_ORIGEM_COD, FATURAMENTO_MINIMO, '
      '  FORNECEDOR_FUNCIONARIO'
      'FROM TBFORNECEDOR'
      'WHERE CODFORN = :OLD_CODFORN')
    Left = 112
    Top = 488
  end
end
