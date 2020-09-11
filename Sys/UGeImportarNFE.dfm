inherited frmGeImportarNFE: TfrmGeImportarNFE
  ActiveControl = edChaveNFe
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Importar NF-e'
  ClientHeight = 626
  ClientWidth = 826
  ExplicitWidth = 840
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 826
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 121
    ExplicitWidth = 593
  end
  object Bevel2: TBevel
    Left = 0
    Top = 153
    Width = 826
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
    Width = 826
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 161
    ExplicitWidth = 593
  end
  object GrpBxEmpresa: TGroupBox
    Left = 0
    Top = 0
    Width = 826
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
    ExplicitWidth = 740
    DesignSize = (
      826
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
      Width = 626
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
      ExplicitWidth = 540
    end
  end
  object GrpBxManifesto: TGroupBox
    Left = 0
    Top = 77
    Width = 826
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
    ExplicitWidth = 740
    DesignSize = (
      826
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
      Width = 695
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
      ExplicitWidth = 609
    end
    object btnManifesto: TcxButton
      Left = 717
      Top = 40
      Width = 93
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Buscar'
      OptionsImage.ImageIndex = 39
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      TabOrder = 1
      OnClick = btnManifestoClick
      ExplicitLeft = 631
    end
  end
  object btnConfirmar: TcxButton
    Left = 636
    Top = 593
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Confirmar'
    OptionsImage.ImageIndex = 20
    OptionsImage.Images = DMRecursos.ImgPrincipal16x16
    TabOrder = 2
    ExplicitLeft = 550
  end
  object btFechar: TcxButton
    Left = 734
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
    ExplicitLeft = 648
  end
  object GrpBxDadosNFe: TGroupBox
    Left = 0
    Top = 157
    Width = 826
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
    ExplicitWidth = 740
    DesignSize = (
      826
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
      ExplicitWidth = 609
      Width = 695
    end
    object btnCarregarXML: TcxButton
      Left = 717
      Top = 40
      Width = 93
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Carregar'
      OptionsImage.ImageIndex = 35
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 1
      OnClick = btnCarregarXMLClick
      ExplicitLeft = 631
    end
    object pgcNFe: TPageControl
      Left = 16
      Top = 67
      Width = 794
      Height = 350
      ActivePage = tbsEmitente
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      ExplicitWidth = 708
      object tbsNFe: TTabSheet
        Caption = 'NFe'
        ExplicitWidth = 700
        DesignSize = (
          786
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
          Left = 431
          Top = 16
          Width = 35
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Chave:'
          FocusControl = dbChave
        end
        object lblcUF: TLabel
          Left = 653
          Top = 16
          Width = 17
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'UF:'
          FocusControl = dbcUF
          ExplicitLeft = 567
        end
        object lblcNF: TLabel
          Left = 685
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
          Left = 431
          Top = 56
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Mod.:'
          FocusControl = dbMod_
        end
        object lblSerie: TLabel
          Left = 465
          Top = 56
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'S'#233'rie:'
          FocusControl = dbSerie
        end
        object lblNNF: TLabel
          Left = 499
          Top = 56
          Width = 67
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'N'#250'mero NF-e:'
          FocusControl = dbNNF
        end
        object lblDEmi: TLabel
          Left = 653
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
          Width = 409
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
          Left = 431
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
          Left = 653
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
          ExplicitLeft = 567
        end
        object dbcNF: TDBEdit
          Left = 685
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
          ExplicitLeft = 599
        end
        object dbNatOp: TDBEdit
          Left = 16
          Top = 72
          Width = 409
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
          Left = 431
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
          Left = 465
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
          Left = 499
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
          Left = 653
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
          ExplicitLeft = 567
        end
        object dbMensagemFiscal: TDBMemo
          Left = 16
          Top = 118
          Width = 751
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
        ExplicitWidth = 700
        DesignSize = (
          786
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
          Left = 372
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
          Left = 493
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
          Left = 614
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
          Left = 493
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
          Left = 565
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
          Left = 493
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
          Left = 734
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
          Left = 372
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
          Width = 481
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
          ExplicitWidth = 395
        end
        object dbXFant: TDBEdit
          Left = 16
          Top = 72
          Width = 350
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
          ExplicitWidth = 264
        end
        object dbIE: TDBEdit
          Left = 372
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
          ExplicitLeft = 286
        end
        object dbIM: TDBEdit
          Left = 493
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
          ExplicitLeft = 407
        end
        object dbCRT: TDBEdit
          Left = 614
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
          ExplicitLeft = 528
        end
        object dbDESCR_CST: TDBEdit
          Left = 661
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
          ExplicitLeft = 575
        end
        object dbXLgr: TDBEdit
          Left = 16
          Top = 112
          Width = 471
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
          ExplicitWidth = 385
        end
        object dbNro: TDBEdit
          Left = 493
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
          ExplicitLeft = 407
        end
        object dbXCpl: TDBEdit
          Left = 565
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
          ExplicitLeft = 479
        end
        object dbXBairro: TDBEdit
          Left = 16
          Top = 152
          Width = 350
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
          ExplicitWidth = 264
        end
        object dbCMun: TDBEdit
          Left = 493
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
          ExplicitLeft = 407
        end
        object dbXMun: TDBEdit
          Left = 565
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
          ExplicitLeft = 479
        end
        object dbUF: TDBEdit
          Left = 734
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
          ExplicitLeft = 648
        end
        object dbCEP: TDBEdit
          Left = 372
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
          ExplicitLeft = 286
        end
        object dbFone: TDBEdit
          Left = 16
          Top = 192
          Width = 350
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
          ExplicitWidth = 264
        end
        object edFornecedorCadastro: TJvComboEdit
          Left = 16
          Top = 32
          Width = 97
          Height = 21
          ButtonHint = 'Pesquisar Cadastro de Fornecedor (Ctrl + P)'
          CharCase = ecUpperCase
          ClickKey = 16464
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
        ExplicitWidth = 700
        DesignSize = (
          786
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
          Left = 372
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
          Width = 584
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
          ExplicitWidth = 498
        end
        object dbXFant_Dest: TDBEdit
          Left = 16
          Top = 72
          Width = 350
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
          Left = 372
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
        ExplicitWidth = 700
        object GrdProdutos: TcxGrid
          Left = 0
          Top = 0
          Width = 786
          Height = 322
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 216
          ExplicitTop = 72
          ExplicitWidth = 250
          ExplicitHeight = 200
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
                  Kind = bkGlyph
                end>
              Properties.ClickKey = 16464
              Properties.Images = DMRecursos.ImgBotoes16x16
              Options.Filtering = False
              Options.Moving = False
              Styles.Header = cxStyleHeader
              Width = 80
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
        ExplicitWidth = 700
      end
      object tbsTransporte: TTabSheet
        Caption = 'Transporte'
        ImageIndex = 5
        ExplicitWidth = 700
      end
      object tbsCobranca: TTabSheet
        Caption = 'Cobran'#231'a'
        ImageIndex = 6
        ExplicitWidth = 700
      end
      object tbsInformacaoAdcional: TTabSheet
        Caption = 'Informa'#231#245'es Adicionais'
        ImageIndex = 7
        ExplicitWidth = 700
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
end
