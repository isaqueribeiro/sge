inherited ViewEntradaEstoqueGerarNFE: TViewEntradaEstoqueGerarNFE
  Left = 391
  Top = 207
  ActiveControl = dbBaseICMS
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Gerar NF-e de Entrada'
  ClientHeight = 410
  ClientWidth = 596
  OldCreateOrder = True
  ExplicitWidth = 610
  ExplicitHeight = 447
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
    Top = 371
    Width = 596
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 372
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 596
    Height = 73
    Align = alTop
    Caption = 'Controle da Compra'
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
      Width = 67
      Height = 13
      Caption = 'No. Compra:'
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
    object dbCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'CODCONTROL'
      DataSource = dtsCompra
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
      DataField = 'DTFINALIZACAO_COMPRA'
      DataSource = dtsCompra
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
      DataField = 'NFSERIE'
      DataSource = dtsCompra
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
      DataField = 'NF'
      DataSource = dtsCompra
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
      DataField = 'DTEMISS'
      DataSource = dtsCompra
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
      DataField = 'HREMISS'
      DataSource = dtsCompra
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object GrpBxImposto: TGroupBox
    Left = 0
    Top = 77
    Width = 596
    Height = 294
    Align = alClient
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
      DataField = 'ICMSBASE'
      DataSource = dtsCompra
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
      DataField = 'ICMSVALOR'
      DataSource = dtsCompra
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
      DataField = 'ICMSSUBSTBASE'
      DataSource = dtsCompra
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
      DataField = 'ICMSSUBSTVALOR'
      DataSource = dtsCompra
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
      DataField = 'VALORPIS'
      DataSource = dtsCompra
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
      DataField = 'TOTALPROD'
      DataSource = dtsCompra
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
      DataField = 'FRETE'
      DataSource = dtsCompra
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
      DataField = 'VALORSEGURO'
      DataSource = dtsCompra
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
      DataField = 'DESCONTO'
      DataSource = dtsCompra
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
      DataField = 'OUTROSCUSTOS'
      DataSource = dtsCompra
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
      DataField = 'VALORTOTAL_IPI'
      DataSource = dtsCompra
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
      DataField = 'VALORCOFINS'
      DataSource = dtsCompra
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
      Color = clWhite
      DataField = 'TOTALNF'
      DataSource = dtsCompra
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
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
      Visible = False
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
  object btnBotoes: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 375
    Width = 596
    Height = 32
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object lblInforme: TLabel
      Left = 0
      Top = 0
      Width = 406
      Height = 32
      Align = alClient
      AutoSize = False
      Caption = ' Gerando NF-e junto a SEFA. Aguarde . . . '
      Color = clYellow
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ExplicitLeft = -3
      ExplicitTop = 2
      ExplicitWidth = 409
    end
    object btnCancelar: TcxButton
      Left = 504
      Top = 0
      Width = 92
      Height = 32
      Align = alRight
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
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnConfirmar: TcxButton
      AlignWithMargins = True
      Left = 409
      Top = 0
      Width = 92
      Height = 32
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alRight
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
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
  end
  object dtsCompra: TDataSource
    AutoEdit = False
    Left = 384
  end
  object TmrAlerta: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TmrAlertaTimer
    Left = 40
    Top = 317
  end
end
