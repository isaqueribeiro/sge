inherited frmGeEntradaEstoqueDevolucaoNF: TfrmGeEntradaEstoqueDevolucaoNF
  ActiveControl = dbEntrada
  BorderIcons = [biSystemMenu]
  BorderWidth = 4
  Caption = 'Devolu'#231#227'o - Dados de Documentos Referenciados'
  ClientHeight = 378
  ClientWidth = 465
  ExplicitWidth = 489
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 465
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 121
    ExplicitWidth = 593
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 465
    Height = 73
    Align = alTop
    Caption = 'Controle da Entrada/Devolu'#231#227'o'
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
      Caption = 'No. Entrada:'
      FocusControl = dbCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEntrada: TLabel
      Left = 135
      Top = 24
      Width = 118
      Height = 13
      Caption = 'Mov. Entrada/Venda:'
      FocusControl = dbEntrada
    end
    object lblFormaDevolucao: TLabel
      Left = 287
      Top = 21
      Width = 143
      Height = 13
      Caption = 'Documento referenciado:'
      FocusControl = dbFormaDevolucao
    end
    object dbCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 113
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
    object dbEntrada: TJvDBComboEdit
      Left = 135
      Top = 40
      Width = 146
      Height = 21
      ButtonHint = 'Pesquisar Entrada (Ctrl+P)'#13#10#13#10'Limpar Campo (Ctrl + Delete)'
      CharCase = ecUpperCase
      ClickKey = 16464
      Color = clMoneyGreen
      DataField = 'DNFE_ENTRADA_COD'
      DataSource = dtsCompra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000000000000000000000000000000000001DE6B51DE6B5
        1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
        AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
        6048306048306048306048306048306048306048306048306048305048403050
        604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
        FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
        D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
        FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
        E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
        7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
        FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
        B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
        7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
        FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
        8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
        F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
        FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
        5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
        F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
        FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
        6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
        FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
        FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
        951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
        FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
        FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
        B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
        7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
        FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
        B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
        7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
        B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
        B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
        B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
        E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
        B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
        1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
        B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      OnButtonClick = dbEntradaButtonClick
    end
    object dbFormaDevolucao: TDBLookupComboBox
      Left = 287
      Top = 40
      Width = 162
      Height = 21
      DataField = 'DNFE_FORMA'
      DataSource = dtsCompra
      DropDownRows = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dtsFormaDevolucao
      ParentFont = False
      TabOrder = 2
    end
  end
  object btnConfirmar: TcxButton
    Left = 277
    Top = 345
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Confirmar'
    OptionsImage.Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000000000000000000000000000000000000000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FFCDA187E5BC9E0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF9D9D9DB7B7B700
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FFAA7457904820B47657F0CEB30000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF707070434343727272C9
      C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FFA55839D07850D07040B06030CB91730000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF5656567474746B6B6B5959598D
      8D8D0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      A05030D07850F09060E19C75D08860B96F42D3A4860000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF4E4E4E7474748B8B8B97979783838368
      68689F9F9F0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFA56039
      E08050F09060F3AF8E0000FFF2AA86D08860B46739EBC9AF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF5B5B5B7B7B7B8B8B8BABABAB0000FFA6A6A683
      8383606060C4C4C40000FF0000FF0000FF0000FF0000FF0000FF0000FFF1B698
      F0A890F2AC820000FF0000FF0000FFE6AA86D08860AA6841F2C7B40000FF0000
      FF0000FF0000FF0000FF0000FFB2B2B2A8A8A8A6A6A60000FF0000FF0000FFA5
      A5A5838383626262C5C5C50000FF0000FF0000FF0000FF0000FF0000FFFDE0CD
      F7CEB60000FF0000FF0000FF0000FF0000FFE19C75D07850B47D56F2CCB30000
      FF0000FF0000FF0000FF0000FFDDDDDDCACACA0000FF0000FF0000FF0000FF00
      00FF979797747474767676C8C8C80000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FFE19C74C07040C38C74F1CA
      B00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF9696966969698A8A8AC6C6C60000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFE29F79C07040D29B
      82EBC3A80000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF9A9A9A696969999999BEBEBE0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1AF91C070
      50E4B99B0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FFACACAC6E6E6EB4B4B40000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1C1
      A7D291720000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FFBEBEBE8E8E8E0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
    OptionsImage.NumGlyphs = 2
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btFechar: TcxButton
    Left = 372
    Top = 345
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    OptionsImage.Glyph.Data = {
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
    OptionsImage.NumGlyphs = 2
    TabOrder = 3
    OnClick = btFecharClick
  end
  object GrpBxDados: TGroupBox
    Left = 0
    Top = 77
    Width = 465
    Height = 262
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Dados do Documento Referenciado'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lblNFeChave: TLabel
      Left = 16
      Top = 40
      Width = 86
      Height = 13
      Caption = 'Chave de acesso:'
      FocusControl = dbNFeChave
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNFSerie: TLabel
      Left = 16
      Top = 102
      Width = 28
      Height = 13
      Caption = 'S'#233'rie:'
      Enabled = False
      FocusControl = dbNFSerie
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNF: TLabel
      Left = 16
      Top = 83
      Width = 138
      Height = 13
      Caption = 'Nota Fiscal Modelo 1/1A:'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNFNumero: TLabel
      Left = 79
      Top = 102
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
      Enabled = False
      FocusControl = dbNFNumero
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNFModelo: TLabel
      Left = 222
      Top = 102
      Width = 38
      Height = 13
      Caption = 'Modelo:'
      Enabled = False
      FocusControl = dbNFModelo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNFe: TLabel
      Left = 16
      Top = 21
      Width = 122
      Height = 13
      Caption = 'Nota Fiscal Eletr'#244'nica:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNFUF: TLabel
      Left = 285
      Top = 102
      Width = 17
      Height = 13
      Caption = 'UF:'
      Enabled = False
      FocusControl = dbNFUF
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNFCompetencia: TLabel
      Left = 351
      Top = 102
      Width = 66
      Height = 13
      Caption = 'Compet'#234'ncia:'
      Enabled = False
      FocusControl = dbNFCompetencia
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNFCnpjCpf: TLabel
      Left = 16
      Top = 145
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ:'
      Enabled = False
      FocusControl = dbNFCnpjCpf
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCupomFiscal: TLabel
      Left = 16
      Top = 191
      Width = 76
      Height = 13
      Caption = 'Cupom Fiscal:'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCPModelo: TLabel
      Left = 16
      Top = 212
      Width = 38
      Height = 13
      Caption = 'Modelo:'
      Enabled = False
      FocusControl = dbCPModelo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCPNumeroECF: TLabel
      Left = 222
      Top = 212
      Width = 23
      Height = 13
      Caption = 'ECF:'
      Enabled = False
      FocusControl = dbCPNumeroECF
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCPNumeroCOO: TLabel
      Left = 285
      Top = 212
      Width = 27
      Height = 13
      Caption = 'COO:'
      Enabled = False
      FocusControl = dbCPNumeroCOO
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNFIE: TLabel
      Left = 222
      Top = 145
      Width = 91
      Height = 13
      Caption = 'Inscri'#231#227'o Estadual:'
      Enabled = False
      FocusControl = dbNFIE
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbNFeChave: TDBEdit
      Left = 16
      Top = 56
      Width = 433
      Height = 21
      Color = clWhite
      DataField = 'DNFE_CHAVE'
      DataSource = dtsCompra
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbNFSerie: TDBEdit
      Left = 16
      Top = 118
      Width = 57
      Height = 21
      Color = clWhite
      DataField = 'DNFE_SERIE'
      DataSource = dtsCompra
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbNFNumero: TDBEdit
      Left = 79
      Top = 118
      Width = 137
      Height = 21
      Color = clWhite
      DataField = 'DNFE_NUMERO'
      DataSource = dtsCompra
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbNFModelo: TDBEdit
      Left = 222
      Top = 118
      Width = 57
      Height = 21
      Color = clWhite
      DataField = 'DNFE_MODELO'
      DataSource = dtsCompra
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object dbNFUF: TDBLookupComboBox
      Left = 285
      Top = 118
      Width = 60
      Height = 21
      DataField = 'DNFE_UF'
      DataSource = dtsCompra
      DropDownRows = 10
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'EST_SIGLA'
      ListField = 'EST_SIGLA'
      ListSource = dtsUF
      ParentFont = False
      TabOrder = 4
    end
    object dbNFCompetencia: TDBLookupComboBox
      Left = 351
      Top = 118
      Width = 98
      Height = 21
      DataField = 'DNFE_COMPETENCIA'
      DataSource = dtsCompra
      DropDownRows = 10
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dtsCompetencia
      ParentFont = False
      TabOrder = 5
    end
    object dbNFCnpjCpf: TDBEdit
      Left = 16
      Top = 164
      Width = 200
      Height = 21
      Color = clWhite
      DataField = 'DNFE_CNPJ_CPF'
      DataSource = dtsCompra
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object dbCPModelo: TDBLookupComboBox
      Left = 16
      Top = 228
      Width = 200
      Height = 21
      DataField = 'DECF_MODELO'
      DataSource = dtsCompra
      DropDownRows = 10
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dtsModeloCupom
      ParentFont = False
      TabOrder = 8
    end
    object dbCPNumeroECF: TDBEdit
      Left = 222
      Top = 228
      Width = 57
      Height = 21
      Color = clWhite
      DataField = 'DECF_NUMERO'
      DataSource = dtsCompra
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object dbCPNumeroCOO: TDBEdit
      Left = 285
      Top = 228
      Width = 60
      Height = 21
      Color = clWhite
      DataField = 'DECF_COO'
      DataSource = dtsCompra
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object dbNFIE: TDBEdit
      Left = 222
      Top = 164
      Width = 123
      Height = 21
      Color = clWhite
      DataField = 'DNFE_IE'
      DataSource = dtsCompra
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object cdsCompra: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codcontrol'
      '  , c.codemp'
      '  , c.dnfe_entrada_ano'
      '  , c.dnfe_entrada_cod'
      '  , c.dnfe_forma'
      '  , c.dnfe_chave'
      '  , c.dnfe_uf'
      '  , c.dnfe_cnpj_cpf'
      '  , c.dnfe_ie'
      '  , c.dnfe_competencia'
      '  , c.dnfe_serie'
      '  , c.dnfe_numero'
      '  , c.dnfe_modelo'
      '  , c.decf_modelo'
      '  , c.decf_numero'
      '  , c.decf_coo'
      'from TBCOMPRAS c'
      'where c.ano        = :anocompra'
      '  and c.codcontrol = :numcompra')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'CODCONTROL'
    UpdateObject = updCompra
    Left = 288
    object cdsCompraANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBCOMPRAS"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCompraCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = '"TBCOMPRAS"."CODCONTROL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCompraCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = '"TBCOMPRAS"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object cdsCompraDNFE_ENTRADA_ANO: TSmallintField
      FieldName = 'DNFE_ENTRADA_ANO'
      Origin = '"TBCOMPRAS"."DNFE_ENTRADA_ANO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompraDNFE_ENTRADA_COD: TIntegerField
      FieldName = 'DNFE_ENTRADA_COD'
      Origin = '"TBCOMPRAS"."DNFE_ENTRADA_COD"'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsCompraDNFE_ENTRADA_CODGetText
    end
    object cdsCompraDNFE_FORMA: TSmallintField
      FieldName = 'DNFE_FORMA'
      Origin = '"TBCOMPRAS"."DNFE_FORMA"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompraDNFE_CHAVE: TIBStringField
      FieldName = 'DNFE_CHAVE'
      Origin = '"TBCOMPRAS"."DNFE_CHAVE"'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsCompraDNFE_UF: TIBStringField
      FieldName = 'DNFE_UF'
      Origin = '"TBCOMPRAS"."DNFE_UF"'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsCompraDNFE_CNPJ_CPF: TIBStringField
      FieldName = 'DNFE_CNPJ_CPF'
      Origin = '"TBCOMPRAS"."DNFE_CNPJ_CPF"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsCompraDNFE_IE: TIBStringField
      FieldName = 'DNFE_IE'
      Origin = '"TBCOMPRAS"."DNFE_IE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompraDNFE_COMPETENCIA: TIBStringField
      FieldName = 'DNFE_COMPETENCIA'
      Origin = '"TBCOMPRAS"."DNFE_COMPETENCIA"'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cdsCompraDNFE_SERIE: TIBStringField
      FieldName = 'DNFE_SERIE'
      Origin = '"TBCOMPRAS"."DNFE_SERIE"'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cdsCompraDNFE_NUMERO: TIntegerField
      FieldName = 'DNFE_NUMERO'
      Origin = '"TBCOMPRAS"."DNFE_NUMERO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompraDNFE_MODELO: TSmallintField
      FieldName = 'DNFE_MODELO'
      Origin = '"TBCOMPRAS"."DNFE_MODELO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompraDECF_MODELO: TSmallintField
      FieldName = 'DECF_MODELO'
      Origin = '"TBCOMPRAS"."DECF_MODELO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompraDECF_NUMERO: TIntegerField
      FieldName = 'DECF_NUMERO'
      Origin = '"TBCOMPRAS"."DECF_NUMERO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompraDECF_COO: TIntegerField
      FieldName = 'DECF_COO'
      Origin = '"TBCOMPRAS"."DECF_COO"'
      ProviderFlags = [pfInUpdate]
    end
  end
  object updCompra: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODFORN,'
      '  TIPO_ENTRADA,'
      '  TIPO_DOCUMENTO,'
      '  TIPO_MOVIMENTO,'
      '  NF,'
      '  NFSERIE,'
      '  LOTE_NFE_ANO,'
      '  LOTE_NFE_NUMERO,'
      '  LOTE_NFE_RECIBO,'
      '  NFE_ENVIADA,'
      '  NFE_DENEGADA,'
      '  NFE_DENEGADA_MOTIVO,'
      '  VERIFICADOR_NFE,'
      '  XML_NFE,'
      '  XML_NFE_FILENAME,'
      '  DTLANCAMENTO,'
      '  DTEMISS,'
      '  HREMISS,'
      '  DTENT,'
      '  NFCFOP,'
      '  NATUREZA,'
      '  STATUS,'
      '  IPI,'
      '  ICMSBASE,'
      '  ICMSVALOR,'
      '  ICMSSUBSTBASE,'
      '  ICMSSUBSTVALOR,'
      '  FRETE,'
      '  OUTROSCUSTOS,'
      '  DESCONTO,'
      '  VALORSEGURO,'
      '  VALORTOTAL_II,'
      '  VALORTOTAL_IPI,'
      '  VALORPIS,'
      '  VALORCOFINS,'
      '  TOTALPROD,'
      '  TOTALNF,'
      '  OBS,'
      '  USUARIO,'
      '  FORMAPAGTO_COD,'
      '  CONDICAOPAGTO_COD,'
      '  COMPRA_PRAZO,'
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
      '  DTFINALIZACAO_COMPRA,'
      '  TIPO_DESPESA,'
      '  CANCEL_USUARIO,'
      '  CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO,'
      '  AUTORIZACAO_ANO,'
      '  AUTORIZACAO_CODIGO,'
      '  AUTORIZACAO_EMPRESA,'
      '  DNFE_ENTRADA_ANO,'
      '  DNFE_ENTRADA_COD,'
      '  DNFE_FORMA,'
      '  DNFE_UF,'
      '  DNFE_CNPJ_CPF,'
      '  DNFE_IE,'
      '  DNFE_COMPETENCIA,'
      '  DNFE_SERIE,'
      '  DNFE_NUMERO,'
      '  DNFE_MODELO,'
      '  DNFE_CHAVE,'
      '  DECF_MODELO,'
      '  DECF_NUMERO,'
      '  DECF_COO'
      'from TBCOMPRAS '
      'where'
      '  ANO = :ANO and'
      '  CODCONTROL = :CODCONTROL and'
      '  CODEMP = :CODEMP')
    ModifySQL.Strings = (
      'update TBCOMPRAS'
      'set'
      '  DNFE_CHAVE = :DNFE_CHAVE,'
      '  DNFE_CNPJ_CPF = :DNFE_CNPJ_CPF,'
      '  DNFE_COMPETENCIA = :DNFE_COMPETENCIA,'
      '  DNFE_ENTRADA_ANO = :DNFE_ENTRADA_ANO,'
      '  DNFE_ENTRADA_COD = :DNFE_ENTRADA_COD,'
      '  DNFE_FORMA = :DNFE_FORMA,'
      '  DNFE_IE = :DNFE_IE,'
      '  DNFE_MODELO = :DNFE_MODELO,'
      '  DNFE_NUMERO = :DNFE_NUMERO,'
      '  DNFE_SERIE = :DNFE_SERIE,'
      '  DNFE_UF = :DNFE_UF'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL and'
      '  CODEMP = :OLD_CODEMP')
    Left = 320
  end
  object dtsCompra: TDataSource
    AutoEdit = False
    DataSet = cdsCompra
    OnDataChange = dtsCompraDataChange
    Left = 352
  end
  object tblFormaDevolucao: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VW_FORMA_DEVOLUCAO'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 317
    Top = 32
  end
  object dtsFormaDevolucao: TDataSource
    DataSet = tblFormaDevolucao
    Left = 349
    Top = 32
  end
  object tblUF: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBESTADO'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 317
    Top = 64
  end
  object dtsUF: TDataSource
    DataSet = tblUF
    Left = 349
    Top = 64
  end
  object qryCompetencia: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    right(c.cmp_num, 4) as codigo'
      
        '  , substring(c.cmp_num from 5 for 2) || '#39'/'#39' || substring(c.cmp_' +
        'num from 1 for 4) as descricao'
      
        '  , coalesce(c.cmp_desc, substring(c.cmp_num from 5 for 2) || '#39'/' +
        #39' || substring(c.cmp_num from 1 for 4)) as cmp_desc'
      'from TBCOMPETENCIA c'
      ''
      'order by'
      '    1')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    Left = 317
    Top = 98
  end
  object dtsCompetencia: TDataSource
    DataSet = qryCompetencia
    Left = 349
    Top = 96
  end
  object tblModeloCupom: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VW_MODELO_CUPOM_FISCAL'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 317
    Top = 128
  end
  object dtsModeloCupom: TDataSource
    DataSet = tblModeloCupom
    Left = 349
    Top = 128
  end
end
