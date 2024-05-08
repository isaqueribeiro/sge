inherited frmGeVendaGerarNFe: TfrmGeVendaGerarNFe
  Left = 396
  Top = 224
  ActiveControl = dbBaseICMS
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Gerar NF-e de Sa'#237'da'
  ClientHeight = 410
  ClientWidth = 596
  ExplicitWidth = 616
  ExplicitHeight = 456
  DesignSize = (
    596
    410)
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
    ExplicitWidth = 592
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
      Left = 407
      Top = 24
      Width = 107
      Height = 13
      Caption = 'Data/Hora de Sa'#237'a:'
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
    object edDataSaida: TcxDateEdit
      Left = 407
      Top = 40
      TabOrder = 6
      Width = 107
    end
    object edHoraSaida: TcxTimeEdit
      Left = 520
      Top = 40
      Properties.TimeFormat = tfHourMin
      TabOrder = 7
      Width = 57
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
    ExplicitWidth = 592
    ExplicitHeight = 294
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
    object btnCalcular: TcxButton
      Left = 216
      Top = 232
      Width = 169
      Height = 33
      Hint = 'Calcular Valor Total da Nota Fiscal'
      Caption = 'Calcular o Valor Total da NF'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
        00FF000000FF000000FF000000FF000000FF000000FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
        00FF000000FF000000FF000000FF000000FF000000FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF0000807060FF807060FF807060FF807060FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF0000707070FF707070FF707070FF707070FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF0000807060FF807060FF807060FF807060FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF0000707070FF707070FF707070FF707070FF00FF000000FF000000FF
        0000508050FF407040FF305030FF203820FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        0000686868FF585858FF404040FF2C2C2CFF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        0000509050FF60A860FF508850FF305030FF00FF000000FF000000FF00000000
        00FF000000FF000000FF000000FF000000FF000000FF00FF000000FF000000FF
        0000707070FF848484FF6C6C6CFF404040FF00FF000000FF000000FF00000000
        00FF000000FF000000FF000000FF000000FF000000FF00FF000070A880FF60A0
        70FF609860FF70B070FF509850FF407040FF305030FF203820FF00FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF00008C8C8CFF8080
        80FF7C7C7CFF909090FF747474FF585858FF404040FF2C2C2CFF00FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000080B090FFA0D8
        A0FF70C080FF70B870FF60A060FF509050FF408840FF305030FF00FF000000FF
        000000FF0000807060FF807060FF807060FF807060FF00FF0000989898FFBCBC
        BCFF989898FF949494FF808080FF707070FF646464FF404040FF00FF000000FF
        000000FF0000707070FF707070FF707070FF707070FF00FF000090B8A0FFB0D8
        B0FFA0D8A0FF90D0A0FF70B870FF60A860FF509850FF407040FF00FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF0000A4A4A4FFC4C4
        C4FFBCBCBCFFB0B0B0FF949494FF848484FF747474FF585858FF00FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000090C0A0FF90B8
        A0FF80B090FFA0D8A0FF70C080FF609860FF509050FF508050FF00FF000000FF
        000000FF0000807060FF807060FF807060FF807060FF00FF0000A8A8A8FFA4A4
        A4FF989898FFBCBCBCFF989898FF7C7C7CFF707070FF686868FF00FF000000FF
        000000FF0000707070FF707070FF707070FF707070FF00FF000000FF000000FF
        000090B8A0FFB0D8B0FFA0D8A0FF60A070FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        0000A4A4A4FFC4C4C4FFBCBCBCFF808080FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000090C0A0FF90B8A0FF80B090FF70A880FF00FF000000FF000000FF00000000
        00FF000000FF000000FF000000FF000000FF000000FF00FF000000FF000000FF
        0000A8A8A8FFA4A4A4FF989898FF8C8C8CFF00FF000000FF000000FF00000000
        00FF000000FF000000FF000000FF000000FF000000FF00FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF0000}
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCalcularClick
    end
    object chkNaoInformarVencimento: TCheckBox
      Left = 216
      Top = 270
      Width = 345
      Height = 17
      Caption = 'N'#227'o informar vencimentos na NF-e'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
  end
  object btnConfirmar: TcxButton
    Left = 407
    Top = 377
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Gerar NF-e'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      424D360800000000000036000000280000002000000010000000010020000000
      000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000C0A8A0FF6048
      30FF604830FF604830FF604830FF604830FF604830FF00FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000A8A8A8FF4343
      43FF434343FF434343FF434343FF434343FF434343FF00FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000C0A8A0FFFFF0
      F0FFF0D8D0FFE0D0C0FFE0C8B0FFE0C0B0FF604830FF00FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000A8A8A8FFF1F1
      F1FFD8D8D8FFCCCCCCFFC3C3C3FFBEBEBEFF434343FF00FF000000FF000000FF
      0000A6A3CCFF1048E0FF1048E0FF1048E0FF00FF000000FF0000C0B0A0FFFFF8
      F0FF707070FFF0E8E0FF707070FFE0C8B0FF604830FF00FF000000FF000000FF
      0000AFAFAFFF707070FF707070FF707070FF00FF000000FF0000ACACACFFF6F6
      F6FF707070FFE6E6E6FF707070FFC3C3C3FF434343FF00FF000000FF000000FF
      00004070F0FF9E9FD3FF00FF000000FF000000FF000000FF0000D0B0A0FFFFFF
      FFFFFFF8F0FFFFF0F0FFF0E8E0FFE0D0C0FF604830FF00FF000000FF000000FF
      0000919191FFAEAEAEFF00FF000000FF000000FF000000FF0000AEAEAEFFFFFF
      FFFFF6F6F6FFF1F1F1FFE6E6E6FFCCCCCCFF434343FF00FF000000FF000000FF
      00001048F0FF00FF000000FF000000FF000000FF000000FF0000D0B8A0FFFFFF
      FFFF808880FFFFF8F0FF707070FFF0D8D0FF604830FF00FF000000FF000000FF
      0000747474FF00FF000000FF000000FF000000FF000000FF0000B3B3B3FFFFFF
      FFFF848484FFF6F6F6FF707070FFD8D8D8FF434343FF00FF000000FF00006080
      F0FF3058F0FF1048E0FF00FF000000FF000000FF000000FF0000D0B0A0FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF8F0FFFFF0F0FF604830FF00FF000000FF00009E9E
      9EFF818181FF707070FF00FF000000FF000000FF000000FF0000AEAEAEFFFFFF
      FFFFFFFFFFFFFFFFFFFFF6F6F6FFF1F1F1FF434343FF00FF000000FF0000D0CE
      E0FF80A0FFFFD0CADCFF00FF000000FF000000FF000000FF0000C0B0A0FFC0B0
      A0FFC0B0A0FFC0B0A0FFC0B0A0FFC0A8A0FFC0A8A0FF00FF000000FF0000D3D3
      D3FFB9B9B9FFD0D0D0FF00FF000000FF000000FF000000FF0000ACACACFFACAC
      ACFFACACACFFACACACFFACACACFFA8A8A8FFA8A8A8FF00FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF0000C0A8A0FF604830FF6048
      30FF604830FF604830FF604830FF604830FF00FF000000FF000000FF000000FF
      0000D5D1E3FF1048E0FFD1CFE1FF00FF000000FF0000A8A8A8FF434343FF4343
      43FF434343FF434343FF434343FF434343FF00FF000000FF000000FF000000FF
      0000D6D6D6FF707070FFD4D4D4FF00FF000000FF0000C0A8A0FFFFF0F0FFF0D8
      D0FFE0D0C0FFE0C8B0FFE0C0B0FF604830FF00FF000000FF000000FF000000FF
      000080A0FFFF3060F0FF1048E0FF00FF000000FF0000A8A8A8FFF1F1F1FFD8D8
      D8FFCCCCCCFFC3C3C3FFBEBEBEFF434343FF00FF000000FF000000FF000000FF
      0000B9B9B9FF868686FF707070FF00FF000000FF0000C0B0A0FFFFF8F0FF7070
      70FFF0E8E0FF707070FFE0C8B0FF604830FF00FF000000FF000000FF000000FF
      000000FF00004070F0FF00FF000000FF000000FF0000ACACACFFF6F6F6FF7070
      70FFE6E6E6FF707070FFC3C3C3FF434343FF00FF000000FF000000FF000000FF
      000000FF0000919191FF00FF000000FF000000FF0000D0B0A0FFFFFFFFFFFFF8
      F0FFFFF0F0FFF0E8E0FFE0D0C0FF604830FF00FF000000FF000000FF000000FF
      0000AEB7EAFF1048F0FF00FF000000FF000000FF0000AEAEAEFFFFFFFFFFF6F6
      F6FFF1F1F1FFE6E6E6FFCCCCCCFF434343FF00FF000000FF000000FF000000FF
      0000C5C5C5FF747474FF00FF000000FF000000FF0000D0B8A0FFFFFFFFFF8088
      80FFFFF8F0FF707070FFF0D8D0FF604830FF00FF000000FF00006088F0FF7090
      F0FF7090F0FFA8B6EBFF00FF000000FF000000FF0000B3B3B3FFFFFFFFFF8484
      84FFF6F6F6FF707070FFD8D8D8FF434343FF00FF000000FF0000A3A3A3FFA9A9
      A9FFA9A9A9FFC4C4C4FF00FF000000FF000000FF0000D0B0A0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF8F0FFFFF0F0FF604830FF00FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF0000AEAEAEFFFFFFFFFFFFFF
      FFFFFFFFFFFFF6F6F6FFF1F1F1FF434343FF00FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF0000C0B0A0FFC0B0A0FFC0B0
      A0FFC0B0A0FFC0B0A0FFC0A8A0FFC0A8A0FF00FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF0000ACACACFFACACACFFACAC
      ACFFACACACFFACACACFFA8A8A8FFA8A8A8FF00FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF0000}
    OptionsImage.NumGlyphs = 2
    TabOrder = 2
    OnClick = btnConfirmarClick
    ExplicitLeft = 403
    ExplicitTop = 376
  end
  object btnCancelar: TcxButton
    Left = 504
    Top = 377
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancelar'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      424D360800000000000036000000280000002000000010000000010020000000
      000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000707070FF505850FF000000FFD0C0AEFF00FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000707070FF545454FF000000FFBCBCBCFF00FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000B0A090FF7C644DFFAD957FFFA0A0A0FFFFFFFFFF5090B0FF101010FF988A
      76FF7B6149FF604830FF604830FF00FF000000FF000000FF000000FF000000FF
      00009C9C9CFF5F5F5FFF909090FFA0A0A0FFFFFFFFFF939393FF101010FF8585
      85FF5C5C5CFF434343FF434343FF00FF000000FF000000FF000000FF000000FF
      0000D6BAA8FFFFFFFFFFF0E8E0FFA0A0A0FF90B8C0FF70D0E0FF5098B0FF1010
      10FFA09890FFB0A090FF604830FF00FF000000FF000000FF000000FF000000FF
      0000B7B7B7FFFFFFFFFFE6E6E6FFA0A0A0FFB6B6B6FFCBCBCBFF989898FF1010
      10FF969696FF9C9C9CFF434343FF00FF000000FF000000FF0000B7B3DAFF0E2B
      DFFFB8ABBDFFFFFFFFFFFFFFFFFFE0E0E0FF50A0B0FF60A8E0FF60C0D0FF5098
      B0FF101010FF909090FF7A5F46FF00FF000000FF000000FF0000BFBFBFFF5E5E
      5EFFB1B1B1FFFFFFFFFFFFFFFFFFE0E0E0FF9C9C9CFFB1B1B1FFBBBBBBFF9898
      98FF101010FF909090FF5A5A5AFF00FF000000FF000000FF00000028FFFF0020
      F0FF4050D0FFFFFFFFFFFFFFFFFFFFFFFFFF4050E0FF0010B0FF90E0F0FF60C0
      D0FF5098B0FF101010FF8B7D72FF00FF000000FF000000FF0000646464FF5B5B
      5BFF747474FFFFFFFFFFFFFFFFFFFFFFFFFF797979FF3E3E3EFFDCDCDCFFBBBB
      BBFF989898FF101010FF7B7B7BFF00FF000000FF000000FF00002D51FCFF1038
      FFFF0028FFFFF0F8FFFFFFFFFFFF9098F0FF0018C0FF6078E0FF60A8B0FF90E0
      F0FF60C0D0FF5098B0FF101010FFCBAF98FF00FF000000FF0000808080FF6F6F
      6FFF646464FFF9F9F9FFFFFFFFFFB1B1B1FF484848FF949494FFA3A3A3FFDCDC
      DCFFBBBBBBFF989898FF101010FFAAAAAAFF00FF000000FF0000E7D7DBFF3050
      FFFF2040FFFF90A0F0FFC0C8F0FF0028F0FF4058F0FFFFF8F0FFD0D8E0FF70B0
      C0FF90E0F0FF70C8E0FF808880FF303890FFB19595FF00FF0000D9D9D9FF8181
      81FF767676FFB6B6B6FFD3D3D3FF606060FF838383FFF6F6F6FFD9D9D9FFAEAE
      AEFFDCDCDCFFC6C6C6FF848484FF515151FF979797FF00FF000000FF0000DCD0
      DCFF4060FFFF3050FFFF2040FFFF3050FFFFFFF8FFFFFFFFFFFFFFF8F0FFD0D8
      E0FF80B0C0FFD0B8B0FF7088D0FF6070B0FF303890FF00FF000000FF0000D4D4
      D4FF8C8C8CFF818181FF767676FF818181FFFAFAFAFFFFFFFFFFF6F6F6FFD9D9
      D9FFB0B0B0FFB8B8B8FF9B9B9BFF818181FF515151FF00FF000000FF000000FF
      0000B8B5D1FF4068FFFF4060FFFFD0D8FFFFFFFFFFFFFFFFFFFFFFF8FFFFF0F0
      F0FFD0D8D0FF6070B0FF7090E0FF6078D0FF6070B0FF00FF000000FF000000FF
      0000BDBDBDFF919191FF8C8C8CFFE2E2E2FFFFFFFFFFFFFFFFFFFAFAFAFFF0F0
      F0FFD4D4D4FF818181FFA4A4A4FF909090FF818181FF00FF000000FF0000C6C4
      E2FF6078FFFF6078FFFF6080FFFF5070FFFFF0F0FFFFFFFFFFFFFFFFFFFFFFF8
      F0FFF0F0F0FFB0A0A0FF6070B0FF6070B0FFD1B2A5FF00FF000000FF0000CDCD
      CDFF9E9E9EFF9E9E9EFFA2A2A2FF979797FFF4F4F4FFFFFFFFFFFFFFFFFFF6F6
      F6FFF0F0F0FFA1A1A1FF818181FF818181FFB1B1B1FF00FF0000B1B6E9FF5078
      FFFF5078FFFFC0D0FFFFFFFFFFFF7088FFFF6078FFFFD0E0FFFFFFFFFFFFFFFF
      FFFFB0A090FFB0A090FF96785EFF00FF000000FF000000FF0000C4C4C4FF9C9C
      9CFF9C9C9CFFDCDCDCFFFFFFFFFFA9A9A9FF9E9E9EFFE7E7E7FFFFFFFFFFFFFF
      FFFF9C9C9CFF9C9C9CFF737373FF00FF000000FF0000859BF3FF5078FFFF5078
      FFFFC8BED1FFFFFFFFFFFFFFFFFFFFFFFFFFB0C8FFFF8098FFFFFFFFFFFFB0A0
      90FF806850FF806050FF604830FF00FF000000FF0000B3B3B3FF9C9C9CFF9C9C
      9CFFC4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D6FFB4B4B4FFFFFFFFFF9C9C
      9CFF636363FF5E5E5EFF434343FF00FF000000FF0000859BF3FF6585FAFFDCD2
      DCFFD8C7B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8
      90FFD0C8C0FF806850FFDEBAA5FF00FF000000FF0000B3B3B3FFA4A4A4FFD6D6
      D6FFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3
      A3FFC6C6C6FF636363FFB7B7B7FF00FF000000FF000000FF000000FF000000FF
      0000D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8
      A0FF807060FFDFBDA7FF00FF000000FF000000FF000000FF000000FF000000FF
      0000BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8
      A8FF6C6C6CFFB9B9B9FF00FF000000FF000000FF000000FF000000FF000000FF
      0000E0C0B0FFE0C0B0FFE0C0B0FFE0C0B0FFE0C0B0FFD0C0B0FFD0B8B0FFD0B0
      A0FFE0BEAAFF00FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000BEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBCBCBCFFB8B8B8FFAEAE
      AEFFBBBBBBFF00FF000000FF000000FF000000FF0000}
    OptionsImage.NumGlyphs = 2
    TabOrder = 3
    OnClick = btnCancelarClick
    ExplicitLeft = 500
    ExplicitTop = 376
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
  object cdsVenda: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updVenda
    SQL.Strings = (
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
      '  , v.Cfop'
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
      
        '  , sum( coalesce(i.Qtde, 0) * coalesce(i.Valor_ipi, 0) ) as val' +
        'or_total_IPI'
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
      '  , v.Cfop'
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
    Left = 136
    Top = 295
    ParamData = <
      item
        Name = 'ANOVENDA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUMVENDA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object cdsVendaANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaCODEMP: TStringField
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      Size = 18
    end
    object cdsVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
    end
    object cdsVendaCODCLI: TStringField
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      Size = 18
    end
    object cdsVendaDTVENDA: TSQLTimeStampField
      FieldName = 'DTVENDA'
      Origin = 'DTVENDA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendaDTFINALIZACAO_VENDA: TDateField
      FieldName = 'DTFINALIZACAO_VENDA'
      Origin = 'DTFINALIZACAO_VENDA'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object cdsVendaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendaHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'HORAEMISSAO'
      DisplayFormat = 'hh:mm:ss'
    end
    object cdsVendaSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 4
    end
    object cdsVendaNFE: TLargeintField
      FieldName = 'NFE'
      Origin = 'NFE'
    end
    object cdsVendaCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'CFOP'
    end
    object cdsVendaNFE_DENEGADA: TSmallintField
      FieldName = 'NFE_DENEGADA'
      Origin = 'NFE_DENEGADA'
    end
    object cdsVendaNFE_DENEGADA_MOTIVO: TStringField
      FieldName = 'NFE_DENEGADA_MOTIVO'
      Origin = 'NFE_DENEGADA_MOTIVO'
      Size = 100
    end
    object cdsVendaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsVendaTOTALVENDA_BRUTA: TFMTBCDField
      FieldName = 'TOTALVENDA_BRUTA'
      Origin = 'TOTALVENDA_BRUTA'
      Precision = 18
      Size = 2
    end
    object cdsVendaDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
    end
    object cdsVendaTOTALVENDA: TFMTBCDField
      FieldName = 'TOTALVENDA'
      Origin = 'TOTALVENDA'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_BASE_ICMS: TFMTBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS'
      Origin = 'NFE_VALOR_BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_ICMS: TFMTBCDField
      FieldName = 'NFE_VALOR_ICMS'
      Origin = 'NFE_VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_BASE_ICMS_SUBST: TFMTBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS_SUBST'
      Origin = 'NFE_VALOR_BASE_ICMS_SUBST'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_ICMS_SUBST: TFMTBCDField
      FieldName = 'NFE_VALOR_ICMS_SUBST'
      Origin = 'NFE_VALOR_ICMS_SUBST'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_TOTAL_PRODUTO: TFMTBCDField
      FieldName = 'NFE_VALOR_TOTAL_PRODUTO'
      Origin = 'NFE_VALOR_TOTAL_PRODUTO'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_FRETE: TFMTBCDField
      FieldName = 'NFE_VALOR_FRETE'
      Origin = 'NFE_VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_SEGURO: TFMTBCDField
      FieldName = 'NFE_VALOR_SEGURO'
      Origin = 'NFE_VALOR_SEGURO'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_DESCONTO: TFMTBCDField
      FieldName = 'NFE_VALOR_DESCONTO'
      Origin = 'NFE_VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_TOTAL_II: TFMTBCDField
      FieldName = 'NFE_VALOR_TOTAL_II'
      Origin = 'NFE_VALOR_TOTAL_II'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_TOTAL_IPI: TFMTBCDField
      FieldName = 'NFE_VALOR_TOTAL_IPI'
      Origin = 'NFE_VALOR_TOTAL_IPI'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_PIS: TFMTBCDField
      FieldName = 'NFE_VALOR_PIS'
      Origin = 'NFE_VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_COFINS: TFMTBCDField
      FieldName = 'NFE_VALOR_COFINS'
      Origin = 'NFE_VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_OUTROS: TFMTBCDField
      FieldName = 'NFE_VALOR_OUTROS'
      Origin = 'NFE_VALOR_OUTROS'
      Precision = 18
      Size = 2
    end
    object cdsVendaNFE_VALOR_TOTAL_NOTA: TFMTBCDField
      FieldName = 'NFE_VALOR_TOTAL_NOTA'
      Origin = 'NFE_VALOR_TOTAL_NOTA'
      Precision = 18
      Size = 2
    end
    object cdsVendaVALOR_TOTAL_IPI: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_IPI'
      Origin = 'VALOR_TOTAL_IPI'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 5
    end
    object cdsVendaVALOR_TOTAL_BRUTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_BRUTO'
      Origin = 'VALOR_TOTAL_BRUTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsVendaVALOR_TOTAL_DESCONTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_DESCONTO'
      Origin = 'VALOR_TOTAL_DESCONTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsVendaVALOR_TOTAL_LIQUIDO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_LIQUIDO'
      Origin = 'VALOR_TOTAL_LIQUIDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsVendaVALOR_BASE_ICMS_NORMAL_ENTRADA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_BASE_ICMS_NORMAL_ENTRADA'
      Origin = 'VALOR_BASE_ICMS_NORMAL_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 5
    end
    object cdsVendaVALOR_TOTAL_ICMS_NORMAL_ENTRADA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_ICMS_NORMAL_ENTRADA'
      Origin = 'VALOR_TOTAL_ICMS_NORMAL_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 7
    end
    object cdsVendaVALOR_BASE_ICMS_NORMAL_SAIDA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_BASE_ICMS_NORMAL_SAIDA'
      Origin = 'VALOR_BASE_ICMS_NORMAL_SAIDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsVendaVALOR_TOTAL_ICMS_NORMAL_SAIDA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_ICMS_NORMAL_SAIDA'
      Origin = 'VALOR_TOTAL_ICMS_NORMAL_SAIDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object cdsVendaVALOR_TOTAL_ICMS_NORMAL_DEVIDO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_ICMS_NORMAL_DEVIDO'
      Origin = 'VALOR_TOTAL_ICMS_NORMAL_DEVIDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 7
    end
    object cdsVendaVALOR_TOTAL_PIS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_PIS'
      Origin = 'VALOR_TOTAL_PIS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsVendaVALOR_TOTAL_COFINS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_COFINS'
      Origin = 'VALOR_TOTAL_COFINS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
  end
  object updVenda: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBVENDAS'
      '(ANO, CODCONTROL, CODEMP, CODCLIENTE, CODCLI, '
      '  DTVENDA, STATUS, TOTALVENDA_BRUTA, DESCONTO, '
      '  TOTALVENDA, DTFINALIZACAO_VENDA, SERIE, NFE, '
      '  DATAEMISSAO, HORAEMISSAO, CFOP, NFE_DENEGADA, '
      '  NFE_DENEGADA_MOTIVO, NFE_VALOR_BASE_ICMS, NFE_VALOR_ICMS, '
      '  NFE_VALOR_BASE_ICMS_SUBST, NFE_VALOR_ICMS_SUBST, '
      '  NFE_VALOR_TOTAL_PRODUTO, NFE_VALOR_FRETE, NFE_VALOR_SEGURO, '
      '  NFE_VALOR_DESCONTO, NFE_VALOR_TOTAL_II, NFE_VALOR_TOTAL_IPI, '
      '  NFE_VALOR_PIS, NFE_VALOR_COFINS, NFE_VALOR_OUTROS, '
      '  NFE_VALOR_TOTAL_NOTA)'
      
        'VALUES (:NEW_ANO, :NEW_CODCONTROL, :NEW_CODEMP, :NEW_CODCLIENTE,' +
        ' :NEW_CODCLI, '
      
        '  :NEW_DTVENDA, :NEW_STATUS, :NEW_TOTALVENDA_BRUTA, :NEW_DESCONT' +
        'O, '
      
        '  :NEW_TOTALVENDA, :NEW_DTFINALIZACAO_VENDA, :NEW_SERIE, :NEW_NF' +
        'E, '
      
        '  :NEW_DATAEMISSAO, :NEW_HORAEMISSAO, :NEW_CFOP, :NEW_NFE_DENEGA' +
        'DA, '
      
        '  :NEW_NFE_DENEGADA_MOTIVO, :NEW_NFE_VALOR_BASE_ICMS, :NEW_NFE_V' +
        'ALOR_ICMS, '
      '  :NEW_NFE_VALOR_BASE_ICMS_SUBST, :NEW_NFE_VALOR_ICMS_SUBST, '
      
        '  :NEW_NFE_VALOR_TOTAL_PRODUTO, :NEW_NFE_VALOR_FRETE, :NEW_NFE_V' +
        'ALOR_SEGURO, '
      
        '  :NEW_NFE_VALOR_DESCONTO, :NEW_NFE_VALOR_TOTAL_II, :NEW_NFE_VAL' +
        'OR_TOTAL_IPI, '
      
        '  :NEW_NFE_VALOR_PIS, :NEW_NFE_VALOR_COFINS, :NEW_NFE_VALOR_OUTR' +
        'OS, '
      '  :NEW_NFE_VALOR_TOTAL_NOTA)')
    ModifySQL.Strings = (
      'UPDATE TBVENDAS'
      
        'SET ANO = :NEW_ANO, CODCONTROL = :NEW_CODCONTROL, CODEMP = :NEW_' +
        'CODEMP, '
      
        '  CODCLIENTE = :NEW_CODCLIENTE, CODCLI = :NEW_CODCLI, DTVENDA = ' +
        ':NEW_DTVENDA, '
      
        '  STATUS = :NEW_STATUS, TOTALVENDA_BRUTA = :NEW_TOTALVENDA_BRUTA' +
        ', '
      '  DESCONTO = :NEW_DESCONTO, TOTALVENDA = :NEW_TOTALVENDA, '
      
        '  DTFINALIZACAO_VENDA = :NEW_DTFINALIZACAO_VENDA, SERIE = :NEW_S' +
        'ERIE, '
      
        '  NFE = :NEW_NFE, DATAEMISSAO = :NEW_DATAEMISSAO, HORAEMISSAO = ' +
        ':NEW_HORAEMISSAO, '
      
        '  CFOP = :NEW_CFOP, NFE_DENEGADA = :NEW_NFE_DENEGADA, NFE_DENEGA' +
        'DA_MOTIVO = :NEW_NFE_DENEGADA_MOTIVO, '
      
        '  NFE_VALOR_BASE_ICMS = :NEW_NFE_VALOR_BASE_ICMS, NFE_VALOR_ICMS' +
        ' = :NEW_NFE_VALOR_ICMS, '
      '  NFE_VALOR_BASE_ICMS_SUBST = :NEW_NFE_VALOR_BASE_ICMS_SUBST, '
      
        '  NFE_VALOR_ICMS_SUBST = :NEW_NFE_VALOR_ICMS_SUBST, NFE_VALOR_TO' +
        'TAL_PRODUTO = :NEW_NFE_VALOR_TOTAL_PRODUTO, '
      
        '  NFE_VALOR_FRETE = :NEW_NFE_VALOR_FRETE, NFE_VALOR_SEGURO = :NE' +
        'W_NFE_VALOR_SEGURO, '
      
        '  NFE_VALOR_DESCONTO = :NEW_NFE_VALOR_DESCONTO, NFE_VALOR_TOTAL_' +
        'II = :NEW_NFE_VALOR_TOTAL_II, '
      
        '  NFE_VALOR_TOTAL_IPI = :NEW_NFE_VALOR_TOTAL_IPI, NFE_VALOR_PIS ' +
        '= :NEW_NFE_VALOR_PIS, '
      
        '  NFE_VALOR_COFINS = :NEW_NFE_VALOR_COFINS, NFE_VALOR_OUTROS = :' +
        'NEW_NFE_VALOR_OUTROS, '
      '  NFE_VALOR_TOTAL_NOTA = :NEW_NFE_VALOR_TOTAL_NOTA'
      'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL')
    DeleteSQL.Strings = (
      'DELETE FROM TBVENDAS'
      'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL')
    FetchRowSQL.Strings = (
      
        'SELECT ANO, CODCONTROL, CODEMP, CODCLIENTE, CODCLI, DTVENDA, COM' +
        'PETENCIA, '
      
        '  STATUS, TOTALVENDA_BRUTA, DESCONTO, DESCONTO_CUPOM, TOTALVENDA' +
        ', '
      
        '  TOTALCUSTO, INDEX_VALOR, DTFINALIZACAO_VENDA, OBS, DADOS_ENTRE' +
        'GA, '
      
        '  FORMAPAG, FATDIAS, SERIE, NFE, MODELO_NF, DATAEMISSAO, HORAEMI' +
        'SSAO, '
      
        '  CFOP, VERIFICADOR_NFE, XML_NFE, XML_NFE_FILENAME, VENDEDOR_COD' +
        ', '
      '  USUARIO, FORMAPAGTO_COD, CONDICAOPAGTO_COD, VENDA_PRAZO, '
      '  PRAZO_01, PRAZO_02, PRAZO_03, PRAZO_04, PRAZO_05, PRAZO_06, '
      '  PRAZO_07, PRAZO_08, PRAZO_09, PRAZO_10, PRAZO_11, PRAZO_12, '
      '  LOTE_NFE_ANO, LOTE_NFE_NUMERO, LOTE_NFE_RECIBO, NFE_ENVIADA, '
      
        '  NFE_DENEGADA, NFE_DENEGADA_MOTIVO, CANCEL_USUARIO, CANCEL_DATA' +
        'HORA, '
      '  CANCEL_MOTIVO, NFE_MODALIDADE_FRETE, NFE_TRANSPORTADORA, '
      
        '  NFE_PLACA_VEICULO, NFE_PLACA_UF, NFE_PLACA_RNTC, NFE_VALOR_BAS' +
        'E_ICMS, '
      
        '  NFE_VALOR_ICMS, NFE_VALOR_BASE_ICMS_SUBST, NFE_VALOR_ICMS_SUBS' +
        'T, '
      '  NFE_VALOR_TOTAL_PRODUTO, NFE_VALOR_FRETE, NFE_VALOR_SEGURO, '
      '  NFE_VALOR_DESCONTO, NFE_VALOR_TOTAL_II, NFE_VALOR_TOTAL_IPI, '
      
        '  NFE_VALOR_PIS, NFE_VALOR_COFINS, NFE_VALOR_OUTROS, NFE_VALOR_T' +
        'OTAL_NOTA, '
      '  CUSTO_OPER_PERCENTUAL, CUSTO_OPER_FRETE, CUSTO_OPER_OUTROS, '
      '  GERAR_ESTOQUE_CLIENTE, CAIXA_ANO, CAIXA_NUM, CAIXA_PDV, '
      
        '  DNFE_COMPRA_ANO, DNFE_COMPRA_COD, DNFE_FORMA, DNFE_UF, DNFE_CN' +
        'PJ_CPF, '
      
        '  DNFE_IE, DNFE_COMPETENCIA, DNFE_SERIE, DNFE_NUMERO, DNFE_MODEL' +
        'O, '
      '  DNFE_CHAVE, DECF_MODELO, DECF_NUMERO, DECF_COO'
      'FROM TBVENDAS'
      'WHERE ANO = :ANO AND CODCONTROL = :CODCONTROL')
    Left = 168
    Top = 295
  end
end
