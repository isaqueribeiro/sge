inherited frmGeVendaGerarNFe: TfrmGeVendaGerarNFe
  Left = 397
  Top = 144
  ActiveControl = dbBaseICMS
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Gerar NF-e de Sa'#237'da'
  ClientHeight = 410
  ClientWidth = 596
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  DesignSize = (
    596
    410)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 596
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 372
    Width = 596
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object lblInforme: TLabel
    Left = 0
    Top = 384
    Width = 401
    Height = 25
    Anchors = [akTop, akBottom]
    AutoSize = False
    Caption = 'Gerando NF-e junto a SEFA. Aguarde . . . '
    Color = clYellow
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 596
    Height = 73
    Align = alTop
    Caption = 'Controle da Venda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblCodigo: TLabel
      Left = 16
      Top = 24
      Width = 58
      Height = 13
      Caption = 'No. Venda:'
      FocusControl = dbCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataHora: TLabel
      Left = 112
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
    object lblSerie: TLabel
      Left = 240
      Top = 24
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
      Left = 280
      Top = 24
      Width = 28
      Height = 13
      Caption = 'NF-e:'
      FocusControl = dbNFe
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataEmissao: TLabel
      Left = 408
      Top = 24
      Width = 79
      Height = 13
      Caption = 'Data Emiss'#227'o:'
      FocusControl = dbDataEmissao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHoraEmissao: TLabel
      Left = 496
      Top = 24
      Width = 79
      Height = 13
      Caption = 'Hora Emiss'#227'o:'
      FocusControl = dbHoraEmissao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataHoraSaida: TLabel
      Left = 408
      Top = 24
      Width = 107
      Height = 13
      Caption = 'Data/Hora de Sa'#237'a:'
      FocusControl = edDataHoraSaida
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object dbCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'CODCONTROL'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbDataHora: TDBEdit
      Left = 112
      Top = 40
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'DTFINALIZACAO_VENDA'
      DataSource = dtsVenda
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
      Left = 240
      Top = 40
      Width = 33
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'SERIE'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbNFe: TDBEdit
      Left = 280
      Top = 40
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NFE'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbDataEmissao: TDBEdit
      Left = 408
      Top = 40
      Width = 81
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'DATAEMISSAO'
      DataSource = dtsVenda
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
      Left = 496
      Top = 40
      Width = 81
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'HORAEMISSAO'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edDataHoraSaida: TMaskEdit
      Left = 408
      Top = 40
      Width = 167
      Height = 21
      EditMask = '!00/00/0000 00:00:00;1; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 19
      ParentFont = False
      TabOrder = 6
      Text = '  /  /       :  :  '
      Visible = False
    end
  end
  object GrpBxImposto: TGroupBox
    Left = 0
    Top = 77
    Width = 596
    Height = 295
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'C'#225'lculo do Imposto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lblBaseICMS: TLabel
      Left = 40
      Top = 32
      Width = 121
      Height = 16
      Caption = 'Base C'#225'lculo ICMS:'
      FocusControl = dbBaseICMS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorICMS: TLabel
      Left = 216
      Top = 32
      Width = 75
      Height = 16
      Caption = 'Valor ICMS:'
      FocusControl = dbValorICMS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblBaseICMSSubs: TLabel
      Left = 392
      Top = 32
      Width = 160
      Height = 16
      Caption = 'Base C'#225'lculo ICMS Subs.:'
      FocusControl = dbBaseICMSSubs
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorICMSSubs: TLabel
      Left = 40
      Top = 80
      Width = 114
      Height = 16
      Caption = 'Valor ICMS Subs.:'
      FocusControl = dbValorICMSSubs
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorPIS: TLabel
      Left = 216
      Top = 80
      Width = 84
      Height = 16
      Caption = 'Valor do PIS:'
      FocusControl = dbValorPIS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalProduto: TLabel
      Left = 392
      Top = 80
      Width = 165
      Height = 16
      Caption = 'Valor Total dos Produtos:'
      FocusControl = dbTotalProduto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFrete: TLabel
      Left = 40
      Top = 128
      Width = 97
      Height = 16
      Caption = 'Valor do Frete:'
      FocusControl = dbFrete
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSeguro: TLabel
      Left = 216
      Top = 128
      Width = 109
      Height = 16
      Caption = 'Valor do Seguro:'
      FocusControl = dbSeguro
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDesconto: TLabel
      Left = 392
      Top = 128
      Width = 66
      Height = 16
      Caption = 'Desconto:'
      FocusControl = dbDesconto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOutrasDespesas: TLabel
      Left = 40
      Top = 176
      Width = 115
      Height = 16
      Caption = 'Outras Despesas:'
      FocusControl = dbOutrasDespesas
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorIPI: TLabel
      Left = 216
      Top = 176
      Width = 117
      Height = 16
      Caption = 'Valor Total do IPI:'
      FocusControl = dbValorIPI
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorCOFINS: TLabel
      Left = 392
      Top = 176
      Width = 107
      Height = 16
      Caption = 'Valor do COFINS:'
      FocusControl = dbValorCOFINS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalNota: TLabel
      Left = 392
      Top = 224
      Width = 129
      Height = 16
      Caption = 'Valor Total da Nota:'
      FocusControl = dbTotalNota
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbBaseICMS: TDBEdit
      Left = 40
      Top = 48
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_BASE_ICMS'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object dbValorICMS: TDBEdit
      Left = 216
      Top = 48
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_ICMS'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object dbBaseICMSSubs: TDBEdit
      Left = 392
      Top = 48
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_BASE_ICMS_SUBST'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object dbValorICMSSubs: TDBEdit
      Left = 40
      Top = 96
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_ICMS_SUBST'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object dbValorPIS: TDBEdit
      Left = 216
      Top = 96
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_PIS'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object dbTotalProduto: TDBEdit
      Left = 392
      Top = 96
      Width = 169
      Height = 24
      Color = clMoneyGreen
      DataField = 'NFE_VALOR_TOTAL_PRODUTO'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object dbFrete: TDBEdit
      Left = 40
      Top = 144
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_FRETE'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object dbSeguro: TDBEdit
      Left = 216
      Top = 144
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_SEGURO'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object dbDesconto: TDBEdit
      Left = 392
      Top = 144
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_DESCONTO'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object dbOutrasDespesas: TDBEdit
      Left = 40
      Top = 192
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_OUTROS'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object dbValorIPI: TDBEdit
      Left = 216
      Top = 192
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_TOTAL_IPI'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object dbValorCOFINS: TDBEdit
      Left = 392
      Top = 192
      Width = 169
      Height = 24
      Color = clWhite
      DataField = 'NFE_VALOR_COFINS'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
    end
    object dbTotalNota: TDBEdit
      Left = 392
      Top = 240
      Width = 169
      Height = 24
      Color = clMoneyGreen
      DataField = 'NFE_VALOR_TOTAL_NOTA'
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object btnCalcular: TBitBtn
      Left = 216
      Top = 232
      Width = 169
      Height = 33
      Hint = 'Calcular Valor Total da Nota Fiscal'
      Caption = 'Calcular o Valor Total da NF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = btnCalcularClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        180000000000000600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000000000
        0000000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008070
        6080706080706080706000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0070707070707070707070707000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008070
        6080706080706080706000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0070707070707070707070707000FF0000FF00
        00FF0050805040704030503020382000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF006868685858584040402C2C2C00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0050905060A86050885030503000FF0000FF0000FF000000000000000000
        0000000000000000000000FF0000FF0000FF007070708484846C6C6C40404000
        FF0000FF0000FF0000000000000000000000000000000000000000FF0070A880
        60A07060986070B07050985040704030503020382000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF008C8C8C8080807C7C7C90909074747458585840
        40402C2C2C00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0080B090
        A0D8A070C08070B87060A06050905040884030503000FF0000FF0000FF008070
        6080706080706080706000FF00989898BCBCBC98989894949480808070707064
        646440404000FF0000FF0000FF0070707070707070707070707000FF0090B8A0
        B0D8B0A0D8A090D0A070B87060A86050985040704000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF00A4A4A4C4C4C4BCBCBCB0B0B094949484848474
        747458585800FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0090C0A0
        90B8A080B090A0D8A070C08060986050905050805000FF0000FF0000FF008070
        6080706080706080706000FF00A8A8A8A4A4A4989898BCBCBC9898987C7C7C70
        707068686800FF0000FF0000FF0070707070707070707070707000FF0000FF00
        00FF0090B8A0B0D8B0A0D8A060A07000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF00A4A4A4C4C4C4BCBCBC80808000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0090C0A090B8A080B09070A88000FF0000FF0000FF000000000000000000
        0000000000000000000000FF0000FF0000FF00A8A8A8A4A4A49898988C8C8C00
        FF0000FF0000FF0000000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
    end
  end
  object btnConfirmar: TBitBtn
    Left = 408
    Top = 377
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Gerar NF-e'
    TabOrder = 2
    OnClick = btnConfirmarClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      180000000000000600000000000000000000000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A06048306048306048
      3060483060483060483000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF00A8A8A843434343434343434343434343434343434300FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A0FFF0F0F0D8D0E0D0
      C0E0C8B0E0C0B060483000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF00A8A8A8F1F1F1D8D8D8CCCCCCC3C3C3BEBEBE43434300FF0000FF00
      00FF00A6A3CC1048E01048E01048E000FF0000FF00C0B0A0FFF8F0707070F0E8
      E0707070E0C8B060483000FF0000FF0000FF00AFAFAF70707070707070707000
      FF0000FF00ACACACF6F6F6707070E6E6E6707070C3C3C343434300FF0000FF00
      00FF004070F09E9FD300FF0000FF0000FF0000FF00D0B0A0FFFFFFFFF8F0FFF0
      F0F0E8E0E0D0C060483000FF0000FF0000FF00919191AEAEAE00FF0000FF0000
      FF0000FF00AEAEAEFFFFFFF6F6F6F1F1F1E6E6E6CCCCCC43434300FF0000FF00
      00FF001048F000FF0000FF0000FF0000FF0000FF00D0B8A0FFFFFF808880FFF8
      F0707070F0D8D060483000FF0000FF0000FF0074747400FF0000FF0000FF0000
      FF0000FF00B3B3B3FFFFFF848484F6F6F6707070D8D8D843434300FF0000FF00
      6080F03058F01048E000FF0000FF0000FF0000FF00D0B0A0FFFFFFFFFFFFFFFF
      FFFFF8F0FFF0F060483000FF0000FF009E9E9E81818170707000FF0000FF0000
      FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF6F6F6F1F1F143434300FF0000FF00
      D0CEE080A0FFD0CADC00FF0000FF0000FF0000FF00C0B0A0C0B0A0C0B0A0C0B0
      A0C0B0A0C0A8A0C0A8A000FF0000FF00D3D3D3B9B9B9D0D0D000FF0000FF0000
      FF0000FF00ACACACACACACACACACACACACACACACA8A8A8A8A8A800FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A0604830
      60483060483060483060483060483000FF0000FF0000FF0000FF00D5D1E31048
      E0D1CFE100FF0000FF00A8A8A843434343434343434343434343434343434300
      FF0000FF0000FF0000FF00D6D6D6707070D4D4D400FF0000FF00C0A8A0FFF0F0
      F0D8D0E0D0C0E0C8B0E0C0B060483000FF0000FF0000FF0000FF0080A0FF3060
      F01048E000FF0000FF00A8A8A8F1F1F1D8D8D8CCCCCCC3C3C3BEBEBE43434300
      FF0000FF0000FF0000FF00B9B9B986868670707000FF0000FF00C0B0A0FFF8F0
      707070F0E8E0707070E0C8B060483000FF0000FF0000FF0000FF0000FF004070
      F000FF0000FF0000FF00ACACACF6F6F6707070E6E6E6707070C3C3C343434300
      FF0000FF0000FF0000FF0000FF0091919100FF0000FF0000FF00D0B0A0FFFFFF
      FFF8F0FFF0F0F0E8E0E0D0C060483000FF0000FF0000FF0000FF00AEB7EA1048
      F000FF0000FF0000FF00AEAEAEFFFFFFF6F6F6F1F1F1E6E6E6CCCCCC43434300
      FF0000FF0000FF0000FF00C5C5C574747400FF0000FF0000FF00D0B8A0FFFFFF
      808880FFF8F0707070F0D8D060483000FF0000FF006088F07090F07090F0A8B6
      EB00FF0000FF0000FF00B3B3B3FFFFFF848484F6F6F6707070D8D8D843434300
      FF0000FF00A3A3A3A9A9A9A9A9A9C4C4C400FF0000FF0000FF00D0B0A0FFFFFF
      FFFFFFFFFFFFFFF8F0FFF0F060483000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF6F6F6F1F1F143434300
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0B0A0C0B0A0
      C0B0A0C0B0A0C0B0A0C0A8A0C0A8A000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF00ACACACACACACACACACACACACACACACA8A8A8A8A8A800
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
    NumGlyphs = 2
  end
  object btnCancelar: TBitBtn
    Left = 504
    Top = 377
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      180000000000000600000000000000000000000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF00707070505850000000D0C0AE00FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0070707054
      5454000000BCBCBC00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF00B0A0907C644DAD957FA0A0A0FFFFFF5090B0101010988A767B61496048
      3060483000FF0000FF0000FF0000FF0000FF009C9C9C5F5F5F909090A0A0A0FF
      FFFF9393931010108585855C5C5C43434343434300FF0000FF0000FF0000FF00
      00FF00D6BAA8FFFFFFF0E8E0A0A0A090B8C070D0E05098B0101010A09890B0A0
      9060483000FF0000FF0000FF0000FF0000FF00B7B7B7FFFFFFE6E6E6A0A0A0B6
      B6B6CBCBCB9898981010109696969C9C9C43434300FF0000FF0000FF00B7B3DA
      0E2BDFB8ABBDFFFFFFFFFFFFE0E0E050A0B060A8E060C0D05098B01010109090
      907A5F4600FF0000FF0000FF00BFBFBF5E5E5EB1B1B1FFFFFFFFFFFFE0E0E09C
      9C9CB1B1B1BBBBBB9898981010109090905A5A5A00FF0000FF0000FF000028FF
      0020F04050D0FFFFFFFFFFFFFFFFFF4050E00010B090E0F060C0D05098B01010
      108B7D7200FF0000FF0000FF006464645B5B5B747474FFFFFFFFFFFFFFFFFF79
      79793E3E3EDCDCDCBBBBBB9898981010107B7B7B00FF0000FF0000FF002D51FC
      1038FF0028FFF0F8FFFFFFFF9098F00018C06078E060A8B090E0F060C0D05098
      B0101010CBAF9800FF0000FF008080806F6F6F646464F9F9F9FFFFFFB1B1B148
      4848949494A3A3A3DCDCDCBBBBBB989898101010AAAAAA00FF0000FF00E7D7DB
      3050FF2040FF90A0F0C0C8F00028F04058F0FFF8F0D0D8E070B0C090E0F070C8
      E0808880303890B1959500FF00D9D9D9818181767676B6B6B6D3D3D360606083
      8383F6F6F6D9D9D9AEAEAEDCDCDCC6C6C684848451515197979700FF0000FF00
      DCD0DC4060FF3050FF2040FF3050FFFFF8FFFFFFFFFFF8F0D0D8E080B0C0D0B8
      B07088D06070B030389000FF0000FF00D4D4D48C8C8C818181767676818181FA
      FAFAFFFFFFF6F6F6D9D9D9B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
      00FF00B8B5D14068FF4060FFD0D8FFFFFFFFFFFFFFFFF8FFF0F0F0D0D8D06070
      B07090E06078D06070B000FF0000FF0000FF00BDBDBD9191918C8C8CE2E2E2FF
      FFFFFFFFFFFAFAFAF0F0F0D4D4D4818181A4A4A490909081818100FF0000FF00
      C6C4E26078FF6078FF6080FF5070FFF0F0FFFFFFFFFFFFFFFFF8F0F0F0F0B0A0
      A06070B06070B0D1B2A500FF0000FF00CDCDCD9E9E9E9E9E9EA2A2A2979797F4
      F4F4FFFFFFFFFFFFF6F6F6F0F0F0A1A1A1818181818181B1B1B100FF00B1B6E9
      5078FF5078FFC0D0FFFFFFFF7088FF6078FFD0E0FFFFFFFFFFFFFFB0A090B0A0
      9096785E00FF0000FF0000FF00C4C4C49C9C9C9C9C9CDCDCDCFFFFFFA9A9A99E
      9E9EE7E7E7FFFFFFFFFFFF9C9C9C9C9C9C73737300FF0000FF00859BF35078FF
      5078FFC8BED1FFFFFFFFFFFFFFFFFFB0C8FF8098FFFFFFFFB0A0908068508060
      5060483000FF0000FF00B3B3B39C9C9C9C9C9CC4C4C4FFFFFFFFFFFFFFFFFFD6
      D6D6B4B4B4FFFFFF9C9C9C6363635E5E5E43434300FF0000FF00859BF36585FA
      DCD2DCD8C7B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C08068
      50DEBAA500FF0000FF00B3B3B3A4A4A4D6D6D6C3C3C3FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFA3A3A3C6C6C6636363B7B7B700FF0000FF0000FF0000FF00
      00FF00D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0807060DFBD
      A700FF0000FF0000FF0000FF0000FF0000FF00BCBCBCFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFA8A8A86C6C6CB9B9B900FF0000FF0000FF0000FF0000FF00
      00FF00E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0BEAA00FF
      0000FF0000FF0000FF0000FF0000FF0000FF00BEBEBEBEBEBEBEBEBEBEBEBEBE
      BEBEBCBCBCB8B8B8AEAEAEBBBBBB00FF0000FF0000FF0000FF00}
    NumGlyphs = 2
  end
  object cdsVenda: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcliente'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Totalvenda_Bruta'
      '  , v.Desconto'
      '  , v.Totalvenda'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Nfe_denegada'
      '  , v.Nfe_denegada_motivo'
      '  , v.Status'
      '  , v.Nfe_valor_base_icms'
      '  , v.Nfe_valor_icms'
      '  , v.Nfe_valor_base_icms_subst'
      '  , v.Nfe_valor_icms_subst'
      '  , v.Nfe_valor_total_produto'
      '  , v.Nfe_valor_frete'
      '  , v.Nfe_valor_seguro'
      '  , v.Nfe_valor_desconto'
      '  , v.Nfe_valor_total_ii'
      '  , v.Nfe_valor_total_ipi'
      '  , v.Nfe_valor_pis'
      '  , v.Nfe_valor_cofins'
      '  , v.Nfe_valor_outros'
      '  , v.Nfe_valor_total_nota'
      '  , sum( coalesce(i.Valor_ipi, 0) )         as valor_total_IPI'
      '  , sum( coalesce(i.total_bruto, 0) )       as valor_total_bruto'
      
        '  , sum( coalesce(i.total_desconto, 0) )    as valor_total_desco' +
        'nto'
      
        '  , sum( coalesce(i.total_liquido, 0) )     as valor_total_liqui' +
        'do'
      ''
      
        '  , sum( case when coalesce(p.Aliquota, 0) = 0 then 0 else coale' +
        'sce(i.Qtde, 0) * p.Customedio end ) as valor_base_icms_normal_en' +
        'trada'
      
        '  , sum( coalesce(i.Qtde, 0) * p.Customedio * coalesce(p.Aliquot' +
        'a, 0) / 100 )                       as valor_total_icms_normal_e' +
        'ntrada'
      ''
      
        '  , sum( (case when coalesce(i.Aliquota, 0) = 0 then 0 else (cas' +
        'e when coalesce(i.Percentual_reducao_bc, 0) = 0 then i.total_liq' +
        'uido else (i.total_liquido * i.Percentual_reducao_bc / 100) end)' +
        ' end) ) as valor_base_icms_normal_saida'
      
        '  , sum( (case when coalesce(i.Percentual_reducao_bc, 0) = 0 the' +
        'n i.total_liquido else (i.total_liquido * i.Percentual_reducao_b' +
        'c / 100) end) * coalesce(i.Aliquota, 0) / 100 )                 ' +
        '        as valor_total_icms_normal_saida'
      ''
      
        '  , sum( (case when coalesce(i.Percentual_reducao_bc, 0) = 0 the' +
        'n i.total_liquido else (i.total_liquido * i.Percentual_reducao_b' +
        'c / 100) end) * coalesce(i.Aliquota, 0) / 100 ) -'
      
        '    sum( (coalesce(i.Qtde, 0) * p.Customedio * coalesce(p.Aliquo' +
        'ta, 0) / 100) ) as valor_total_icms_normal_devido'
      ''
      
        '  , sum( (coalesce(i.total_liquido, 0) * coalesce(i.Aliquota_pis' +
        ', 0) / 100) )    as valor_total_PIS'
      
        '  , sum( (coalesce(i.total_liquido, 0) * coalesce(i.Aliquota_cof' +
        'ins, 0) / 100) ) as valor_total_COFINS'
      'from TBVENDAS v'
      
        '  inner join TVENDASITENS i on (i.Ano = v.Ano and i.Codcontrol =' +
        ' v.Codcontrol)'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      ''
      'where v.Ano = :anovenda'
      '  and v.Codcontrol = :numvenda'
      ''
      'Group by'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcliente'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Totalvenda_Bruta'
      '  , v.Desconto'
      '  , v.Totalvenda'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Nfe_denegada'
      '  , v.Nfe_denegada_motivo'
      '  , v.Status'
      '  , v.Nfe_valor_base_icms'
      '  , v.Nfe_valor_icms'
      '  , v.Nfe_valor_base_icms_subst'
      '  , v.Nfe_valor_icms_subst'
      '  , v.Nfe_valor_total_produto'
      '  , v.Nfe_valor_frete'
      '  , v.Nfe_valor_seguro'
      '  , v.Nfe_valor_desconto'
      '  , v.Nfe_valor_total_ii'
      '  , v.Nfe_valor_total_ipi'
      '  , v.Nfe_valor_pis'
      '  , v.Nfe_valor_cofins'
      '  , v.Nfe_valor_outros'
      '  , v.Nfe_valor_total_nota')
    ModifySQL.Strings = (
      '')
    GeneratorField.Field = 'CODCONTROL'
    UpdateObject = updVenda
    Left = 40
    Top = 296
    object cdsVendaANO: TSmallintField
      Alignment = taCenter
      FieldName = 'ANO'
      Origin = 'TBVENDAS.ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000'
    end
    object cdsVendaCODCONTROL: TIntegerField
      Alignment = taCenter
      FieldName = 'CODCONTROL'
      Origin = 'TBVENDAS.CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '###0000000'
    end
    object cdsVendaCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = 'TBVENDAS.CODEMP'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = '"TBVENDAS"."CODCLIENTE"'
    end
    object cdsVendaCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = 'TBVENDAS.CODCLI'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsVendaDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = 'TBVENDAS.DTVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendaDTFINALIZACAO_VENDA: TDateField
      Alignment = taCenter
      FieldName = 'DTFINALIZACAO_VENDA'
      Origin = 'TBVENDAS.DTFINALIZACAO_VENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object cdsVendaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'TBVENDAS.DATAEMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendaHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'TBVENDAS.HORAEMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'hh:mm:ss'
    end
    object cdsVendaTOTALVENDA_BRUTA: TIBBCDField
      FieldName = 'TOTALVENDA_BRUTA'
      Origin = '"TBVENDAS"."TOTALVENDA_BRUTA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"TBVENDAS"."DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object cdsVendaTOTALVENDA: TIBBCDField
      FieldName = 'TOTALVENDA'
      Origin = 'TBVENDAS.TOTALVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'TBVENDAS.SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cdsVendaNFE: TLargeintField
      FieldName = 'NFE'
      Origin = 'TBVENDAS.NFE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaNFE_DENEGADA: TSmallintField
      FieldName = 'NFE_DENEGADA'
      Origin = '"TBVENDAS"."NFE_DENEGADA"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaNFE_DENEGADA_MOTIVO: TIBStringField
      FieldName = 'NFE_DENEGADA_MOTIVO'
      Origin = '"TBVENDAS"."NFE_DENEGADA_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsVendaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'TBVENDAS.STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendaNFE_VALOR_BASE_ICMS: TIBBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS'
      Origin = '"TBVENDAS"."NFE_VALOR_BASE_ICMS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_ICMS: TIBBCDField
      FieldName = 'NFE_VALOR_ICMS'
      Origin = '"TBVENDAS"."NFE_VALOR_ICMS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_BASE_ICMS_SUBST: TIBBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS_SUBST'
      Origin = '"TBVENDAS"."NFE_VALOR_BASE_ICMS_SUBST"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_ICMS_SUBST: TIBBCDField
      FieldName = 'NFE_VALOR_ICMS_SUBST'
      Origin = '"TBVENDAS"."NFE_VALOR_ICMS_SUBST"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_TOTAL_PRODUTO: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_PRODUTO'
      Origin = '"TBVENDAS"."NFE_VALOR_TOTAL_PRODUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_FRETE: TIBBCDField
      FieldName = 'NFE_VALOR_FRETE'
      Origin = '"TBVENDAS"."NFE_VALOR_FRETE"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_SEGURO: TIBBCDField
      FieldName = 'NFE_VALOR_SEGURO'
      Origin = '"TBVENDAS"."NFE_VALOR_SEGURO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_DESCONTO: TIBBCDField
      FieldName = 'NFE_VALOR_DESCONTO'
      Origin = '"TBVENDAS"."NFE_VALOR_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_TOTAL_II: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_II'
      Origin = '"TBVENDAS"."NFE_VALOR_TOTAL_II"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_TOTAL_IPI: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_IPI'
      Origin = '"TBVENDAS"."NFE_VALOR_TOTAL_IPI"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_PIS: TIBBCDField
      FieldName = 'NFE_VALOR_PIS'
      Origin = '"TBVENDAS"."NFE_VALOR_PIS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_COFINS: TIBBCDField
      FieldName = 'NFE_VALOR_COFINS'
      Origin = '"TBVENDAS"."NFE_VALOR_COFINS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_OUTROS: TIBBCDField
      FieldName = 'NFE_VALOR_OUTROS'
      Origin = '"TBVENDAS"."NFE_VALOR_OUTROS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_TOTAL_NOTA: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_NOTA'
      Origin = '"TBVENDAS"."NFE_VALOR_TOTAL_NOTA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaVALOR_TOTAL_IPI: TIBBCDField
      FieldName = 'VALOR_TOTAL_IPI'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaVALOR_TOTAL_BRUTO: TIBBCDField
      FieldName = 'VALOR_TOTAL_BRUTO'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaVALOR_TOTAL_DESCONTO: TIBBCDField
      FieldName = 'VALOR_TOTAL_DESCONTO'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaVALOR_TOTAL_LIQUIDO: TIBBCDField
      FieldName = 'VALOR_TOTAL_LIQUIDO'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaVALOR_BASE_ICMS_NORMAL_ENTRADA: TFMTBCDField
      FieldName = 'VALOR_BASE_ICMS_NORMAL_ENTRADA'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 5
    end
    object cdsVendaVALOR_TOTAL_ICMS_NORMAL_ENTRADA: TFMTBCDField
      FieldName = 'VALOR_TOTAL_ICMS_NORMAL_ENTRADA'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 7
    end
    object cdsVendaVALOR_BASE_ICMS_NORMAL_SAIDA: TIBBCDField
      FieldName = 'VALOR_BASE_ICMS_NORMAL_SAIDA'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object cdsVendaVALOR_TOTAL_ICMS_NORMAL_SAIDA: TFMTBCDField
      FieldName = 'VALOR_TOTAL_ICMS_NORMAL_SAIDA'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object cdsVendaVALOR_TOTAL_ICMS_NORMAL_DEVIDO: TFMTBCDField
      FieldName = 'VALOR_TOTAL_ICMS_NORMAL_DEVIDO'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 7
    end
    object cdsVendaVALOR_TOTAL_PIS: TIBBCDField
      FieldName = 'VALOR_TOTAL_PIS'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object cdsVendaVALOR_TOTAL_COFINS: TIBBCDField
      FieldName = 'VALOR_TOTAL_COFINS'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
  end
  object updVenda: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODCLI,'
      '  DTVENDA,'
      '  STATUS,'
      '  DESCONTO,'
      '  TOTALVENDA,'
      '  DTFINALIZACAO_VENDA,'
      '  OBS,'
      '  FORMAPAG,'
      '  FATDIAS,'
      '  SERIE,'
      '  NFE,'
      '  DATAEMISSAO,'
      '  HORAEMISSAO,'
      '  CFOP,'
      '  VERIFICADOR_NFE,'
      '  XML_NFE,'
      '  VENDEDOR_COD,'
      '  USUARIO,'
      '  FORMAPAGTO_COD,'
      '  CONDICAOPAGTO_COD,'
      '  VENDA_PRAZO,'
      '  PRAZO_01,'
      '  PRAZO_02,'
      '  PRAZO_03,'
      '  PRAZO_04,'
      '  PRAZO_05,'
      '  PRAZO_06,'
      '  PRAZO_07,'
      '  PRAZO_08,'
      '  PRAZO_09,'
      '  PRAZO_10,'
      '  PRAZO_11,'
      '  PRAZO_12,'
      '  NFE_VALOR_BASE_ICMS,'
      '  NFE_VALOR_ICMS,'
      '  NFE_VALOR_BASE_ICMS_SUBST,'
      '  NFE_VALOR_ICMS_SUBST,'
      '  NFE_VALOR_TOTAL_PRODUTO,'
      '  NFE_VALOR_FRETE,'
      '  NFE_VALOR_SEGURO,'
      '  NFE_VALOR_DESCONTO,'
      '  NFE_VALOR_TOTAL_II,'
      '  NFE_VALOR_TOTAL_IPI,'
      '  NFE_VALOR_PIS,'
      '  NFE_VALOR_COFINS,'
      '  NFE_VALOR_OUTROS,'
      '  NFE_VALOR_TOTAL_NOTA'
      'from TBVENDAS '
      'where'
      '  ANO = :ANO and'
      '  CODCONTROL = :CODCONTROL')
    ModifySQL.Strings = (
      'update TBVENDAS'
      'set'
      '  ANO = :ANO,'
      '  CODCONTROL = :CODCONTROL,'
      '  DTVENDA = :DTVENDA,'
      '  STATUS = :STATUS,'
      '  DESCONTO = :DESCONTO,'
      '  TOTALVENDA = :TOTALVENDA,'
      '  DTFINALIZACAO_VENDA = :DTFINALIZACAO_VENDA,'
      '  SERIE = :SERIE,'
      '  NFE = :NFE,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  HORAEMISSAO = :HORAEMISSAO,'
      '  NFE_VALOR_BASE_ICMS = :NFE_VALOR_BASE_ICMS,'
      '  NFE_VALOR_ICMS = :NFE_VALOR_ICMS,'
      '  NFE_VALOR_BASE_ICMS_SUBST = :NFE_VALOR_BASE_ICMS_SUBST,'
      '  NFE_VALOR_ICMS_SUBST = :NFE_VALOR_ICMS_SUBST,'
      '  NFE_VALOR_TOTAL_PRODUTO = :NFE_VALOR_TOTAL_PRODUTO,'
      '  NFE_VALOR_FRETE = :NFE_VALOR_FRETE,'
      '  NFE_VALOR_SEGURO = :NFE_VALOR_SEGURO,'
      '  NFE_VALOR_DESCONTO = :NFE_VALOR_DESCONTO,'
      '  NFE_VALOR_TOTAL_II = :NFE_VALOR_TOTAL_II,'
      '  NFE_VALOR_TOTAL_IPI = :NFE_VALOR_TOTAL_IPI,'
      '  NFE_VALOR_PIS = :NFE_VALOR_PIS,'
      '  NFE_VALOR_COFINS = :NFE_VALOR_COFINS,'
      '  NFE_VALOR_OUTROS = :NFE_VALOR_OUTROS,'
      '  NFE_VALOR_TOTAL_NOTA = :NFE_VALOR_TOTAL_NOTA'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    InsertSQL.Strings = (
      'insert into TBVENDAS'
      
        '  (ANO, CODCONTROL, DTVENDA, STATUS, DESCONTO, TOTALVENDA, DTFIN' +
        'ALIZACAO_VENDA, '
      
        '   SERIE, NFE, DATAEMISSAO, HORAEMISSAO, NFE_VALOR_BASE_ICMS, NF' +
        'E_VALOR_ICMS, '
      
        '   NFE_VALOR_BASE_ICMS_SUBST, NFE_VALOR_ICMS_SUBST, NFE_VALOR_TO' +
        'TAL_PRODUTO, '
      
        '   NFE_VALOR_FRETE, NFE_VALOR_SEGURO, NFE_VALOR_DESCONTO, NFE_VA' +
        'LOR_TOTAL_II, '
      
        '   NFE_VALOR_TOTAL_IPI, NFE_VALOR_PIS, NFE_VALOR_COFINS, NFE_VAL' +
        'OR_OUTROS, '
      '   NFE_VALOR_TOTAL_NOTA)'
      'values'
      
        '  (:ANO, :CODCONTROL, :DTVENDA, :STATUS, :DESCONTO, :TOTALVENDA,' +
        ' :DTFINALIZACAO_VENDA, '
      
        '   :SERIE, :NFE, :DATAEMISSAO, :HORAEMISSAO, :NFE_VALOR_BASE_ICM' +
        'S, :NFE_VALOR_ICMS, '
      
        '   :NFE_VALOR_BASE_ICMS_SUBST, :NFE_VALOR_ICMS_SUBST, :NFE_VALOR' +
        '_TOTAL_PRODUTO, '
      
        '   :NFE_VALOR_FRETE, :NFE_VALOR_SEGURO, :NFE_VALOR_DESCONTO, :NF' +
        'E_VALOR_TOTAL_II, '
      
        '   :NFE_VALOR_TOTAL_IPI, :NFE_VALOR_PIS, :NFE_VALOR_COFINS, :NFE' +
        '_VALOR_OUTROS, '
      '   :NFE_VALOR_TOTAL_NOTA)')
    DeleteSQL.Strings = (
      'delete from TBVENDAS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    Left = 72
    Top = 296
  end
  object dtsVenda: TDataSource
    AutoEdit = False
    DataSet = cdsVenda
    Left = 104
    Top = 296
  end
  object TmrAlerta: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TmrAlertaTimer
    Left = 40
    Top = 325
  end
end
