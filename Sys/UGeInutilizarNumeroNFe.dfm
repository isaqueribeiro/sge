inherited frmGeInutilizarNumeroNFe: TfrmGeInutilizarNumeroNFe
  Left = 580
  Top = 296
  ActiveControl = edAno
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Inutilizar Numera'#231#227'o NF-e'
  ClientHeight = 428
  ClientWidth = 593
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
  object btnConfirmar: TBitBtn
    Left = 405
    Top = 395
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Inutilizar'
    TabOrder = 2
    OnClick = btnConfirmarClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      1800000000000006000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFB0A0906048306048306048306048306048306048306048
      30604830604830705040FF00FFFF00FFFF00FFFF00FFFF00FF9C9C9C43434343
      43434343434343434343434343434343434343434343434E4E4EFF00FFFF00FF
      FF00FFFF00FFFF00FFC0A8A0FFF0F0E0E0E0E0E0D0905840F0F0E0E0C8C0E0C8
      B0E0C0B0E0B8A0705040FF00FFFF00FFFF00FFFF00FFFF00FFA8A8A8F1F1F1E0
      E0E0DBDBDB565656EBEBEBC8C8C8C3C3C3BEBEBEB4B4B44E4E4E708890608090
      6078806088906090A0C0B0A0FFFFFFFFF8F0E0D8D0A06040FFF0F0FFE8E0FFE8
      D0F0E0D0D0B8A0705040888888818181787878868686909090ACACACFFFFFFF6
      F6F6D6D6D65C5C5CF1F1F1E7E7E7E3E3E3DCDCDCB3B3B34E4E4E70889090A0B0
      70B0D00090D030B0E0D0B8A0FFFFFFB08870E0E0E0A07050FFF8F0C09080C088
      70B07860D0B8A0705040888888A3A3A3B3B3B3949494B1B1B1B3B3B3FFFFFF84
      8484E0E0E06B6B6BF6F6F6909090868686767676B3B3B34E4E4E80889080C0D0
      90A8B080E0FF50B8E0D0B8A0FFFFFFFFFFFFE0E0E0A07860FFF8F0FFF0F0FFF0
      E0FFE8E0D0B8A0705040898989BEBEBEA8A8A8DFDFDFB9B9B9B3B3B3FFFFFFFF
      FFFFE0E0E0747474F6F6F6F1F1F1ECECECE7E7E7B3B3B34E4E4E8090A080D0F0
      90A8B090C0D060C0E0D0B8A0FFFFFFB09890E0E0E0B08060FFF8FFC0A090C098
      80C08870D0B8B0705040939393D1D1D1A8A8A8C0C0C0C0C0C0B3B3B3FFFFFF98
      9898E0E0E07B7B7BFAFAFA9E9E9E949494868686B8B8B84E4E4E8090A080D8F0
      80C8E090A8B060C0E0D0B8A0FFFFFFFFFFFFFFFFFFB08060FFFFFFFFF8FFFFF8
      F0FFF8F0FFF0F0705040939393D6D6D6C8C8C8A8A8A8C0C0C0B3B3B3FFFFFFFF
      FFFFFFFFFF7B7B7BFFFFFFFAFAFAF6F6F6F6F6F6F1F1F14E4E4E8098A090E0F0
      90E0FF90A8B090C0D0E0A080F0A890F0A080F09870E09060E08850E07840E078
      40E07040E07040D06030989898DCDCDCE1E1E1A8A8A8C0C0C09C9C9CA8A8A89E
      9E9E9494948989898080807171717171716C6C6C6C6C6C5C5C5C8098A090E0F0
      A0E8FF80C8E080C0D0D09870FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A0
      70F09870F09870D07040989898DCDCDCE7E7E7C8C8C8BEBEBE919191BCBCBCB7
      B7B7B3B3B3AEAEAEA4A4A4A4A4A49999999494949494946B6B6B90A0A0A0E8F0
      A0E8FFA0E8FF90C8D0C09070D09070D09070E09870D09070E09870E09060E088
      50E08050E07840E070409E9E9EE3E3E3E7E7E7E7E7E7C4C4C48B8B8B8C8C8C8C
      8C8C9393938C8C8C9393938989898080807B7B7B7171716C6C6C90A0B0A0E8F0
      A0F0FFA0E8FFA0E8FF80D0F070C8F070C8F070C8F070C8F070C8F070C8F090B0
      C0FF00FFFF00FFFF00FFA3A3A3E3E3E3ECECECE7E7E7E7E7E7D1D1D1CBCBCBCB
      CBCBCBCBCBCBCBCBCBCBCBCBCBCBB1B1B1FF00FFFF00FFFF00FF90A0B0A0F0F0
      B0F0F0A0F0FFA0E8FFA0E8FF70D8FF90A0A08098A08098A08090A08090907088
      90FF00FFFF00FFFF00FFA3A3A3E8E8E8E9E9E9ECECECE7E7E7E7E7E7D9D9D99E
      9E9E9898989898989393938E8E8E888888FF00FFFF00FFFF00FF90A8B0A0D0E0
      B0F0F0B0F0F0A0F0FFA0E8FF90A0B0B1C3C7FF00FFFF00FFFF00FFFF00FFFF00
      FF906850906850906850A8A8A8D0D0D0E9E9E9E9E9E9ECECECE7E7E7A3A3A3C2
      C2C2FF00FFFF00FFFF00FFFF00FFFF00FF646464646464646464C8CDD090A8B0
      90A8B090A8B090A8B090A8B0B4BFC4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFCDBEBC906850906850CDCDCDA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8BFBFBFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBE646464646464FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF907860C3B2A9FF00FFDED8
      D8A09080CDC3BC907860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF737373B1B1B1FF00FFD8D8D88C8C8CC1C1C1737373FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD2CDC7A09080A08880B098
      80C1B7AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFCBCBCB8C8C8C888888939393B5B5B5FF00FFFF00FF}
    NumGlyphs = 2
  end
  object btFechar: TBitBtn
    Left = 501
    Top = 395
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btFecharClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      180000000000000600000000000000000000000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF00D5C5C4958DAF565B932C32752C2B66494878837386C9ABA100FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C7C7C79898986B6B6B45
      45453D3D3D5656567A7A7AABABAB00FF0000FF0000FF0000FF0000FF0000FF00
      00FF00AFAABF4853A51038A01030B00030C00030C00028B01020802B275C9783
      8700FF0000FF0000FF0000FF0000FF0000FF00B1B1B16A6A6A53535353535356
      56565656564D4D4D3B3B3B37373786868600FF0000FF0000FF0000FF0000FF00
      B5AEC73C51B21038C00030D00030D00030D00030D00030D00030D00028A00E1B
      6496808300FF0000FF0000FF0000FF00B6B6B66C6C6C5D5D5D5B5B5B5B5B5B5B
      5B5B5B5B5B5B5B5B5B5B5B4848482F2F2F83838300FF0000FF0000FF00D9CCD3
      4862B41040D00038E00038E00038E00038E00038D00030D00030D00030D00028
      A02B265BC5A09200FF0000FF00D0D0D078787866666665656565656565656565
      65656060605B5B5B5B5B5B5B5B5B484848363636A0A0A000FF0000FF009EA3CB
      2050C00038F00040F0FFFFFFFFFFFF4070F04068F0FFFFFFFFFFFF0030D00030
      D01020807F697A00FF0000FF00AFAFAF6D6D6D6A6A6A6E6E6EFFFFFFFFFFFF92
      92928D8D8DFFFFFFFFFFFF5B5B5B5B5B5B3B3B3B70707000FF0000FF006E81C5
      2048E00040FF1048FF7098FFFFFFFFFFFFFFFFFFFFFFFFFF6080F00038D00030
      D00028B047427100FF0000FF00949494727272737373797979B3B3B3FFFFFFFF
      FFFFFFFFFFFFFFFF9F9F9F6060605B5B5B4D4D4D50505000FF0000FF004B68C1
      5070FF5078FF3060FF3060FFB0C8FFFFFFFFFFFFFFA0B8FF0038F00038E00030
      D00030C02C296400FF0000FF008080809898989D9D9D8B8B8B8B8B8BD6D6D6FF
      FFFFFFFFFFCBCBCB6A6A6A6565655B5B5B5656563B3B3B00FF0000FF004B68C1
      5078FF5080FF5078FF4070FFB0C8FFFFFFFFFFFFFFA0B8FF0040FF0038E00038
      D00030C02C317300FF0000FF008080809D9D9DA1A1A19D9D9D969696D6D6D6FF
      FFFFFFFFFFCBCBCB73737365656560606056565644444400FF0000FF006E87D1
      5078F06090FF7090FF90B0FFFFFFFFFFFFFFFFFFFFFFFFFF7098FF0038F00038
      E01030B053548900FF0000FF009B9B9B989898ADADADAEAEAEC5C5C5FFFFFFFF
      FFFFFFFFFFFFFFFFB3B3B36A6A6A65656553535364646400FF0000FF009EA7D3
      4068E07098FF80A0FFFFFFFFFFFFFF80A0FF8098FFFFFFFFFFFFFF0040F00038
      E02038A08F7D9A00FF0000FF00B4B4B4888888B3B3B3BABABAFFFFFFFFFFFFBA
      BABAB5B5B5FFFFFFFFFFFF6E6E6E65656555555588888800FF0000FF00DCCFD6
      5677D06080F080A8FF90B0FF80A0FF6080FF4070FF3060FF1048FF0040F01040
      C04750A1CBABA100FF0000FF00D3D3D38E8E8E9F9F9FBEBEBEC5C5C5BABABAA3
      A3A39696968B8B8B7979796E6E6E616161676767ABABAB00FF0000FF0000FF00
      BBB7D35A76D06080F080A0FF80A8FF8098FF6088FF3060FF1048FF1048D03B4F
      B0A898A700FF0000FF0000FF0000FF00C0C0C08E8E8E9F9F9FBABABABEBEBEB5
      B5B5A8A8A88B8B8B7979796B6B6B6A6A6A9E9E9E00FF0000FF0000FF0000FF00
      00FF00BBB6D16477D05070E05078F05080FF5078FF3060E03050D0475FB0AF9E
      B100FF0000FF0000FF0000FF0000FF0000FF00BFBFBF9090908E8E8E989898A1
      A1A19D9D9D828282737373757575A6A6A600FF0000FF0000FF0000FF0000FF00
      00FF0000FF00DBCCD09DA5CF6E86CF4B67C04B67C06D7EC09B9BBFD2BBB900FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF00CFCFCFB1B1B19A9A9A7F
      7F7F7F7F7F909090A6A6A6BDBDBD00FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
    NumGlyphs = 2
  end
  object cdsLOG: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
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
