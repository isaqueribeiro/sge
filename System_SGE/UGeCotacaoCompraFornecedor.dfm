inherited frmGeCotacaoCompraFornecedor: TfrmGeCotacaoCompraFornecedor
  Width = 780
  Height = 508
  BorderIcons = [biSystemMenu]
  BorderWidth = 4
  Caption = 'Cota'#231#227'o de Compra/Servi'#231'o'
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  DesignSize = (
    756
    462)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 121
    Width = 756
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 423
    Width = 756
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 756
    Height = 121
    Align = alTop
    Caption = 'Controle da Cota'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      756
      121)
    object lblCodigo: TLabel
      Left = 16
      Top = 24
      Width = 69
      Height = 13
      Caption = 'No. Cota'#231#227'o:'
      FocusControl = dbCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricaoResumo: TLabel
      Left = 112
      Top = 24
      Width = 104
      Height = 13
      Caption = 'Descri'#231#227'o resumo:'
      FocusControl = dbDescricaoResumo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEmissao: TLabel
      Left = 15
      Top = 64
      Width = 49
      Height = 13
      Caption = 'Emiss'#227'o:'
      FocusControl = dbEmissao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValidade: TLabel
      Left = 112
      Top = 64
      Width = 51
      Height = 13
      Caption = 'Validade:'
      FocusControl = dbValidade
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataResposta: TLabel
      Left = 208
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Data Resp.:'
      FocusControl = dbDataResposta
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NUMERO'
      DataSource = dtsFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbDescricaoResumo: TDBEdit
      Left = 112
      Top = 40
      Width = 628
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clMoneyGreen
      DataField = 'DESCRICAO_RESUMO'
      DataSource = dtsFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbEmissao: TDBEdit
      Left = 16
      Top = 80
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'EMISSAO_DATA'
      DataSource = dtsFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbValidade: TDBEdit
      Left = 112
      Top = 80
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'VALIDADE'
      DataSource = dtsFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbDataResposta: TDBDateEdit
      Left = 208
      Top = 80
      Width = 121
      Height = 21
      DataField = 'DATA_RESPOSTA'
      DataSource = dtsFornecedor
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
    end
  end
  object btnSalvar: TBitBtn
    Left = 568
    Top = 429
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000000000000000000000000000000000000000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      C06860B05850A05050A05050A050509048509048409048408040408038408038
      407038407038300000FF0000FF0000FF6E6E6E5E5E5E58585858585858585851
      51514C4C4C4C4C4C4646464141414141414040403B3B3B0000FF0000FFD06870
      F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
      30A038307038400000FF0000FF7474749999998989894646462C2C2CB6B6B6B6
      B6B6C1C1C1C6C6C65050504444444444444040404040400000FF0000FFD07070
      FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
      40A040308038400000FF0000FF797979A4A4A49090908989895858583B3B3B78
      7878E1E1E1E6E6E67C7C7C4444444949494444444141410000FF0000FFD07870
      FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
      40A040408040400000FF0000FF7E7E7EA9A9A99999999090905858580000003B
      3B3BD8D8D8DCDCDC7171715050505050504949494646460000FF0000FFD07880
      FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
      50B048408040400000FF0000FF838383B3B3B3A9A9A999999958585858585858
      58585858585C5C5C6868686060605959595050504646460000FF0000FFE08080
      FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
      50B050509048400000FF0000FF898989B7B7B7B7B7B7A9A9A999999990909089
      89898484847979797474746969696060605959594C4C4C0000FF0000FFE08890
      FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
      60C058509048400000FF0000FF939393C1C1C1BCBCBC6B6B6B64646460606056
      56565050504B4B4B4040403636366969696060604C4C4C0000FF0000FFE09090
      FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
      10C060609048500000FF0000FF989898C6C6C6707070FFFFFFFFFFFFF6F6F6F0
      F0F0E6E6E6D8D8D8CCCCCCC8C8C83636366969695151510000FF0000FFE098A0
      FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
      20D06860A050500000FF0000FFA1A1A1C6C6C6797979FFFFFFFFFFFFFFFFFFF6
      F6F6F0F0F0E6E6E6D8D8D8CCCCCC4040407070705858580000FF0000FFF0A0A0
      FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
      30D07070A050500000FF0000FFA8A8A8C6C6C6808080FFFFFFFFFFFFFFFFFFFF
      FFFFF6F6F6F0F0F0E6E6E6D8D8D84B4B4B7979795858580000FF0000FFF0A8A0
      FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
      30E07880A050500000FF0000FFACACACC6C6C6898989FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFF6F6F6F0F0F0E6E6E65050508484845858580000FF0000FFF0B0B0
      FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
      40603030B058500000FF0000FFB6B6B6C6C6C6949494FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF6F6F6F0F0F05656563434345E5E5E0000FF0000FFF0B0B0
      FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
      50B05860B058600000FF0000FFB6B6B6C6C6C69B9B9BFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF6F6F66060606363636363630000FF0000FFF0B8B0
      F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
      80D07870D070700000FF0000FFBBBBBBBBBBBBB6B6B6B6B6B6B1B1B1A8A8A8A1
      A1A19898989898989393938989898383837E7E7E7979790000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
    NumGlyphs = 2
  end
  object btFechar: TBitBtn
    Left = 664
    Top = 429
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    TabOrder = 2
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
  object PgcResposta: TPageControl
    Left = 0
    Top = 125
    Width = 756
    Height = 298
    ActivePage = TbsFornecedor
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object TbsFornecedor: TTabSheet
      Caption = '&Fornecedor'
      DesignSize = (
        748
        270)
      object lblFornecedor: TLabel
        Left = 16
        Top = 8
        Width = 59
        Height = 13
        Caption = 'Fornecedor:'
        FocusControl = dbFornecedor
      end
      object lblNomeContato: TLabel
        Left = 16
        Top = 48
        Width = 130
        Height = 13
        Caption = 'Nome Contato (Vendedor):'
        FocusControl = dbNomeContato
      end
      object lblEmail: TLabel
        Left = 296
        Top = 48
        Width = 32
        Height = 13
        Caption = 'E-mail:'
        FocusControl = dbEmail
      end
      object lblFormaPagto: TLabel
        Left = 16
        Top = 91
        Width = 106
        Height = 13
        Caption = 'Forma de Pagamento:'
        FocusControl = dbFormaPagto
      end
      object lblCondicaoPagto: TLabel
        Left = 192
        Top = 91
        Width = 120
        Height = 13
        Caption = 'Condi'#231#227'o de Pagamento:'
        FocusControl = dbCondicaoPagto
      end
      object lblObservacoes: TLabel
        Left = 16
        Top = 136
        Width = 67
        Height = 13
        Caption = 'Observa'#231#245'es:'
        FocusControl = dbObservacoes
      end
      object dbFornecedor: TRxDBComboEdit
        Left = 16
        Top = 24
        Width = 718
        Height = 21
        ButtonHint = 'Pesquisar Fornecedor (Ctrl+P)'
        CharCase = ecUpperCase
        ClickKey = 16464
        Color = clMoneyGreen
        DataField = 'NOMEFORN'
        DataSource = dtsFornecedor
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
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        OnButtonClick = dbFornecedorButtonClick
      end
      object dbNomeContato: TDBEdit
        Left = 16
        Top = 64
        Width = 273
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_CONTATO'
        DataSource = dtsFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dbEmail: TDBEdit
        Left = 296
        Top = 64
        Width = 438
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecLowerCase
        DataField = 'EMAIL_ENVIO'
        DataSource = dtsFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object dbFormaPagto: TDBLookupComboBox
        Left = 16
        Top = 107
        Width = 169
        Height = 21
        DataField = 'FORMA_PAGTO'
        DataSource = dtsFornecedor
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'COD'
        ListField = 'DESCRI'
        ListSource = dtsFormaPagto
        ParentFont = False
        TabOrder = 3
      end
      object dbCondicaoPagto: TDBLookupComboBox
        Left = 192
        Top = 107
        Width = 369
        Height = 21
        DataField = 'CONDICAO_PAGTO'
        DataSource = dtsFornecedor
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'COND_COD'
        ListField = 'COND_DESCRICAO'
        ListSource = dtsCondicaoPagto
        ParentFont = False
        TabOrder = 4
      end
      object dbObservacoes: TDBMemo
        Left = 16
        Top = 152
        Width = 718
        Height = 101
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataField = 'OBSERVACAO'
        DataSource = dtsFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 5
      end
    end
    object TbsFornecedorItem: TTabSheet
      Caption = '&Itens'
      ImageIndex = 1
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 0
        Width = 748
        Height = 270
        Align = alClient
        DataSource = dtsItem
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgProdutosDrawColumnCell
        OnEnter = dbgProdutosEnter
        OnExit = dbgProdutosExit
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEM'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = '#'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTO'
            ReadOnly = True
            Title.Caption = 'Codigo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o + Apresenta'#231#227'o'
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            ReadOnly = True
            Title.Caption = 'Quantidade'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            ReadOnly = True
            Title.Caption = 'Und.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_UNITARIO'
            Title.Caption = 'Valor Un. (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Valor Total (R$)'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object BtnCarregarXLS: TBitBtn
    Left = 0
    Top = 429
    Width = 92
    Height = 33
    Hint = 'Carregar/Processar Retorno XLS (Planilha em Excel)'
    Anchors = [akLeft, akBottom]
    Caption = '&Carregar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFF6349356349356349356349356349356349356349356349356349356349
      35634935634935634935FFFFFFFFFFFFFFFFFF35455935455935455935455935
      4559354559354559354559354559354559354559354559354559FFFFFFFFFFFF
      FFFFFFB7A293FAE2D2DFB89EE0B699E2B495E2B191E4AF8CE5AD88E6AB84E7A7
      7FE8A57AEBA377634935FFFFFFFFFFFFFFFFFF909FAED9DFE5A7B4C0A5B2BFA2
      AFBCA0ADBA9CAAB89AA8B698A6B493A2B1909FAE8F9EAD354559FFFFFFFFFFFF
      FFFFFFB9A495FBE6DAFBE7DAFBE6D9FAE5D8FBE4D6FBE2D3F9E0D0F8DDCCF9DB
      C9F8DAC7E9A47B634935FFFFFFFFFFFFFFFFFF92A1B0DEE4E9E0E5E9DEE4E9DD
      E3E8DCE2E7DAE0E5D7DEE4D3DAE0D2D9E0CFD7DE909FAE354559FFFFFFFFFFFF
      FFFFFFBBA696FBECE2D6AE90D6AE90D6AE90D6AE90FAE7DAD6AE90D6AE90D6AE
      90F8DBCAE7A780634935FFFFFFFFFFFFFFFFFF95A3B2E6EAEE9BA9B79BA9B79B
      A9B79BA9B7E0E5E99BA9B79BA9B79BA9B7D2D9E093A2B1354559FFFFFFFFFFFF
      FFFFFFBEA899FDF0E8FDF0E9FDF0E8FCEFE7FCEDE5FBEBE1D6AE90FAE5D7D6AE
      90F9DECEE6AC85634935FFFFFFFFFFFFFFFFFF98A6B4EBEFF2EBEFF2EBEFF2EA
      EEF1E8ECEFE4E9ED9BA9B7DDE3E89BA9B7D5DCE298A6B43545591876390C6F32
      0D6C330E6832116333125D33145733165233184C33194834FCECE2FBE8DDD6AE
      90FAE1D2E4AE8A63493548596D4051653F50643C4D613A4B5F36475B34445831
      41552E3E522C3C50E6EAEEE1E6EA9BA9B7D9DFE59BA9B7354559207C3EFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF174C34FCEFE8FCECE2FBE8
      DCFAE4D6E3B18F6349354C5E72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF2E3E52EAEEF1E6EAEEE1E6EADCE2E79EACBA3545592B8445FFFFFF
      FFFFFFFFFFFFFFFFFF85A9871D6F38195D345B7D5F165133D6AE90D6AE90D6AE
      90FBE6DAE2B39563493555677BFFFFFFFFFFFFFFFFFFFFFFFF8B9AAA44556937
      485C5F70843141559BA9B79BA9B79BA9B7DEE4E9A2AFBC354559388E4E8BBD90
      1E763B1D6E391A62358BBD903E92471D673A9FB3A1145733FDF4EFFDF1EAD6AE
      90FBE9DDE0B6996349356071849BA9B7495A6E4354683B4C609BA9B760718440
      51659DABB9344458F0F3F5EDF0F29BA9B7E2E7EBA5B2BF354559469857FFFFFF
      8BBD90519E5791C49657A25A21703A6C9B6FDFE9DF135D33D6AE90D6AE90D6AE
      90FBEADFDEB89D6349356A7B8EFFFFFF9BA9B76E7F91A3B0BD72839545566A77
      889ADEE4E937485C9BA9B79BA9B79BA9B7E3E8ECA7B4C035455953A260FFFFFF
      CFDDCF96C69A57A25A267C39276731C0D1C0FFFFFF106233FEF8F3FDF4EFD6AE
      90FCECE1DDBAA1634935748597FFFFFFCFD7DEA6B3C07283954C5E723E4F63BF
      C9D2FFFFFF394A5EF5F7F8F0F3F59BA9B7E6EAEEAAB6C23545595EAA66E5ECE5
      8DC49364AC693489416FA57357A0603A8846D6E2D60E6832D6AE90D6AE90D6AE
      90DCBCA5DDBBA4644A367D8D9EE4E9EDA2AFBC7F8FA057697D7F8FA073849659
      6B7FD6DDE33C4D619BA9B79BA9B79BA9B7ACB8C4ABB7C336465A66B06C8EC293
      5FA863479751FFFFFFCBDACC54985D54985D9BB09C0D6C32FDF8F4FDF5EFB7A2
      93644A36644A36644A368393A4A1AEBB7B8B9C67788BFFFFFFCCD4DB6D7E916D
      7E9199A7B53E4F63F5F7F8F1F4F6909FAE36465A36465A36465A66B06CFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C6F32FEF7F4FDF4EFB9A4
      95D4C5BA644A36FFFFFF8393A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF405165F4F6F7F0F3F592A1B0B8C3CD36465AFFFFFF66B06C61AD68
      5AA76452A15E489A593F9352358C4C2C8546247F411D7A3DFEF7F3FDF4EDC0AB
      9C644A36FFFFFFFFFFFF8393A47F8FA07A8A9C7283956C7D906475885C6E8256
      687C5062764C5D71F4F6F7EFF2F49AA8B636465AFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFD8C2B2D7C1B1D6C0B0D4BEAED2BDADD1BAABCFB9AACDB6A8CBB6A6CAB4
      A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4BFCAB3BEC9B2BDC8AFBBC6AE
      BAC6ACB8C4ABB7C3A7B4C0A6B3C0A5B2BFFFFFFFFFFFFFFFFFFF}
    NumGlyphs = 2
  end
  object qryFornecedor: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BeforePost = qryFornecedorBeforePost
    OnNewRecord = qryFornecedorNewRecord
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codigo'
      '  , c.empresa'
      '  , c.fornecedor'
      '  , c.nome_contato'
      '  , c.email_envio'
      '  , c.data_resposta'
      '  , c.forma_pagto'
      '  , c.condicao_pagto'
      '  , c.prazo_entrega_data'
      '  , c.prazo_entreda_dia'
      '  , c.observacao'
      '  , c.ativo'
      '  , c.usuario'
      '  , c.valor_total_bruto'
      '  , c.valor_total_desconto'
      '  , c.valor_total_liquido'
      '  , c.vencedor'
      '  , f.nomeforn'
      '  , f.cnpj'
      '  , f.email'
      '  , fp.descri as forma_pagto_desc'
      '  , cp.cond_descricao as condicap_pagto_desc'
      '  , x.numero'
      '  , x.descricao_resumo'
      '  , x.emissao_data'
      '  , x.validade'
      'from TBCOTACAO_COMPRAFORN c'
      
        '  inner join TBCOTACAO_COMPRA x on (x.ano = c.ano and x.codigo =' +
        ' c.codigo and x.empresa = c.empresa)'
      ''
      '  left join TBFORNECEDOR f on (f.codforn = c.fornecedor)'
      '  left join TBFORMPAGTO fp on (fp.cod = c.forma_pagto)'
      
        '  left join VW_CONDICAOPAGTO cp on (cp.cond_cod = c.condicao_pag' +
        'to)'
      ''
      'where c.ano        = :ano'
      '  and c.codigo     = :cod'
      '  and c.fornecedor = :for')
    ModifySQL.Strings = (
      '')
    UpdateObject = updFornecedor
    Left = 256
    Top = 16
    object qryFornecedorANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBCOTACAO_COMPRAFORN"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFornecedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TBCOTACAO_COMPRAFORN"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFornecedorEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBCOTACAO_COMPRAFORN"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryFornecedorFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = '"TBCOTACAO_COMPRAFORN"."FORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFornecedorNOME_CONTATO: TIBStringField
      FieldName = 'NOME_CONTATO'
      Origin = '"TBCOTACAO_COMPRAFORN"."NOME_CONTATO"'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qryFornecedorEMAIL_ENVIO: TIBStringField
      FieldName = 'EMAIL_ENVIO'
      Origin = '"TBCOTACAO_COMPRAFORN"."EMAIL_ENVIO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryFornecedorDATA_RESPOSTA: TDateField
      FieldName = 'DATA_RESPOSTA'
      Origin = '"TBCOTACAO_COMPRAFORN"."DATA_RESPOSTA"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."FORMA_PAGTO"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorCONDICAO_PAGTO: TSmallintField
      FieldName = 'CONDICAO_PAGTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."CONDICAO_PAGTO"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorVALOR_TOTAL_BRUTO: TIBBCDField
      FieldName = 'VALOR_TOTAL_BRUTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."VALOR_TOTAL_BRUTO"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryFornecedorVALOR_TOTAL_DESCONTO: TIBBCDField
      FieldName = 'VALOR_TOTAL_DESCONTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."VALOR_TOTAL_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryFornecedorVALOR_TOTAL_LIQUIDO: TIBBCDField
      FieldName = 'VALOR_TOTAL_LIQUIDO'
      Origin = '"TBCOTACAO_COMPRAFORN"."VALOR_TOTAL_LIQUIDO"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryFornecedorVENCEDOR: TSmallintField
      FieldName = 'VENCEDOR'
      Origin = '"TBCOTACAO_COMPRAFORN"."VENCEDOR"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryFornecedorPRAZO_ENTREGA_DATA: TDateField
      FieldName = 'PRAZO_ENTREGA_DATA'
      Origin = '"TBCOTACAO_COMPRAFORN"."PRAZO_ENTREGA_DATA"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorPRAZO_ENTREDA_DIA: TSmallintField
      FieldName = 'PRAZO_ENTREDA_DIA'
      Origin = '"TBCOTACAO_COMPRAFORN"."PRAZO_ENTREDA_DIA"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = '"TBCOTACAO_COMPRAFORN"."OBSERVACAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryFornecedorATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = '"TBCOTACAO_COMPRAFORN"."ATIVO"'
      ProviderFlags = [pfInUpdate]
    end
    object qryFornecedorUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBCOTACAO_COMPRAFORN"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object qryFornecedorNOMEFORN: TIBStringField
      FieldName = 'NOMEFORN'
      Origin = '"TBFORNECEDOR"."NOMEFORN"'
      ProviderFlags = []
      Size = 100
    end
    object qryFornecedorCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"TBFORNECEDOR"."CNPJ"'
      ProviderFlags = []
      Size = 18
    end
    object qryFornecedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"TBFORNECEDOR"."EMAIL"'
      ProviderFlags = []
      Size = 40
    end
    object qryFornecedorFORMA_PAGTO_DESC: TIBStringField
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = '"TBFORMPAGTO"."DESCRI"'
      ProviderFlags = []
      Size = 30
    end
    object qryFornecedorCONDICAP_PAGTO_DESC: TIBStringField
      FieldName = 'CONDICAP_PAGTO_DESC'
      Origin = '"VW_CONDICAOPAGTO"."COND_DESCRICAO"'
      ProviderFlags = []
      Size = 80
    end
    object qryFornecedorNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"TBCOTACAO_COMPRA"."NUMERO"'
      ProviderFlags = []
      Required = True
    end
    object qryFornecedorDESCRICAO_RESUMO: TIBStringField
      FieldName = 'DESCRICAO_RESUMO'
      Origin = '"TBCOTACAO_COMPRA"."DESCRICAO_RESUMO"'
      ProviderFlags = []
      Size = 100
    end
    object qryFornecedorEMISSAO_DATA: TDateField
      FieldName = 'EMISSAO_DATA'
      Origin = '"TBCOTACAO_COMPRA"."EMISSAO_DATA"'
      ProviderFlags = []
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryFornecedorVALIDADE: TDateField
      FieldName = 'VALIDADE'
      Origin = '"TBCOTACAO_COMPRA"."VALIDADE"'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object updFornecedor: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODIGO,'
      '  EMPRESA,'
      '  FORNECEDOR,'
      '  NOME_CONTATO,'
      '  EMAIL_ENVIO,'
      '  FORMA_PAGTO,'
      '  CONDICAO_PAGTO,'
      '  VALOR_TOTAL_BRUTO,'
      '  VALOR_TOTAL_DESCONTO,'
      '  VALOR_TOTAL_LIQUIDO,'
      '  VENCEDOR,'
      '  DATA_RESPOSTA,'
      '  PRAZO_ENTREGA_DATA,'
      '  PRAZO_ENTREDA_DIA,'
      '  OBSERVACAO,'
      '  ATIVO,'
      '  USUARIO'
      'from TBCOTACAO_COMPRAFORN '
      'where'
      '  ANO = :ANO and'
      '  CODIGO = :CODIGO and'
      '  EMPRESA = :EMPRESA and'
      '  FORNECEDOR = :FORNECEDOR')
    ModifySQL.Strings = (
      'update TBCOTACAO_COMPRAFORN'
      'set'
      '  ANO = :ANO,'
      '  ATIVO = :ATIVO,'
      '  CODIGO = :CODIGO,'
      '  CONDICAO_PAGTO = :CONDICAO_PAGTO,'
      '  DATA_RESPOSTA = :DATA_RESPOSTA,'
      '  EMAIL_ENVIO = :EMAIL_ENVIO,'
      '  EMPRESA = :EMPRESA,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  NOME_CONTATO = :NOME_CONTATO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  PRAZO_ENTREDA_DIA = :PRAZO_ENTREDA_DIA,'
      '  PRAZO_ENTREGA_DATA = :PRAZO_ENTREGA_DATA,'
      '  USUARIO = :USUARIO,'
      '  VALOR_TOTAL_BRUTO = :VALOR_TOTAL_BRUTO,'
      '  VALOR_TOTAL_DESCONTO = :VALOR_TOTAL_DESCONTO,'
      '  VALOR_TOTAL_LIQUIDO = :VALOR_TOTAL_LIQUIDO,'
      '  VENCEDOR = :VENCEDOR'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  FORNECEDOR = :OLD_FORNECEDOR')
    InsertSQL.Strings = (
      'insert into TBCOTACAO_COMPRAFORN'
      
        '  (ANO, ATIVO, CODIGO, CONDICAO_PAGTO, DATA_RESPOSTA, EMAIL_ENVI' +
        'O, EMPRESA, '
      
        '   FORMA_PAGTO, FORNECEDOR, NOME_CONTATO, OBSERVACAO, PRAZO_ENTR' +
        'EDA_DIA, '
      
        '   PRAZO_ENTREGA_DATA, USUARIO, VALOR_TOTAL_BRUTO, VALOR_TOTAL_D' +
        'ESCONTO, '
      '   VALOR_TOTAL_LIQUIDO, VENCEDOR)'
      'values'
      
        '  (:ANO, :ATIVO, :CODIGO, :CONDICAO_PAGTO, :DATA_RESPOSTA, :EMAI' +
        'L_ENVIO, '
      
        '   :EMPRESA, :FORMA_PAGTO, :FORNECEDOR, :NOME_CONTATO, :OBSERVAC' +
        'AO, :PRAZO_ENTREDA_DIA, '
      
        '   :PRAZO_ENTREGA_DATA, :USUARIO, :VALOR_TOTAL_BRUTO, :VALOR_TOT' +
        'AL_DESCONTO, '
      '   :VALOR_TOTAL_LIQUIDO, :VENCEDOR)')
    DeleteSQL.Strings = (
      'delete from TBCOTACAO_COMPRAFORN'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  FORNECEDOR = :OLD_FORNECEDOR')
    Left = 288
    Top = 16
  end
  object dtsFornecedor: TDataSource
    AutoEdit = False
    DataSet = qryFornecedor
    OnStateChange = dtsFornecedorStateChange
    Left = 320
    Top = 16
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'COD'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCRI'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ACRESCIMO'
        DataType = ftFloat
      end
      item
        Name = 'CONTA_CORRENTE'
        DataType = ftInteger
      end
      item
        Name = 'DEBITAR_LIMITE_CLIENTE'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_TBFORMPAGTO'
        Fields = 'COD'
        Options = [ixUnique]
      end
      item
        Name = 'FK_TBFORMPAGTO_CCORRENTE'
        Fields = 'CONTA_CORRENTE'
      end>
    StoreDefs = True
    TableName = 'TBFORMPAGTO'
    Left = 432
    Top = 32
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 464
    Top = 32
  end
  object tblCondicaoPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'VW_CONDICAOPAGTO'
    TableTypes = [ttView]
    Left = 432
    Top = 64
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = tblCondicaoPagto
    Left = 464
    Top = 64
  end
  object XLApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 616
    Top = 69
  end
  object XLBook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 648
    Top = 69
  end
  object qryItem: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BeforePost = qryItemBeforePost
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select'
      '    ci.ano'
      '  , ci.codigo'
      '  , ci.empresa'
      '  , ci.seq'
      '  , ci.produto'
      '  , ci.quantidade'
      '  , ci.unidade'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      '  , i.fornecedor'
      '  , i.item'
      '  , i.valor_unitario'
      '  , i.valor_total'
      'from TBCOTACAO_COMPRAITEM ci'
      '  left join TBPRODUTO p on (p.cod = ci.produto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = ci.unidade)'
      
        '  left join TBCOTACAO_COMPRAFORN_ITEM i on (i.ano = ci.ano and i' +
        '.codigo = ci.codigo and i.empresa = ci.empresa and i.item = ci.s' +
        'eq and i.fornecedor = :for)'
      ''
      'where ci.ano        = :ano'
      '  and ci.codigo     = :cod')
    ModifySQL.Strings = (
      '')
    UpdateObject = updItem
    Left = 256
    Top = 48
    object qryItemANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBCOTACAO_COMPRAITEM"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TBCOTACAO_COMPRAITEM"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBCOTACAO_COMPRAITEM"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object qryItemSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = '"TBCOTACAO_COMPRAITEM"."SEQ"'
      ProviderFlags = []
    end
    object qryItemPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = '"TBCOTACAO_COMPRAITEM"."PRODUTO"'
      ProviderFlags = []
      Size = 10
    end
    object qryItemQUANTIDADE: TIBBCDField
      FieldName = 'QUANTIDADE'
      Origin = '"TBCOTACAO_COMPRAITEM"."QUANTIDADE"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qryItemUNIDADE: TSmallintField
      FieldName = 'UNIDADE'
      Origin = '"TBCOTACAO_COMPRAITEM"."UNIDADE"'
      ProviderFlags = []
    end
    object qryItemDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = '"TBPRODUTO"."DESCRI_APRESENTACAO"'
      ProviderFlags = []
      Size = 100
    end
    object qryItemUNP_DESCRICAO: TIBStringField
      FieldName = 'UNP_DESCRICAO'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
    object qryItemUNP_SIGLA: TIBStringField
      FieldName = 'UNP_SIGLA'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      ProviderFlags = []
      Size = 5
    end
    object qryItemFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = '"TBCOTACAO_COMPRAFORN_ITEM"."FORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItemITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = '"TBCOTACAO_COMPRAFORN_ITEM"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItemVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"TBCOTACAO_COMPRAFORN_ITEM"."VALOR_UNITARIO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"TBCOTACAO_COMPRAFORN_ITEM"."VALOR_TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object updItem: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODIGO,'
      '  EMPRESA,'
      '  FORNECEDOR,'
      '  ITEM,'
      '  VALOR_UNITARIO,'
      '  VALOR_TOTAL'
      'from TBCOTACAO_COMPRAFORN_ITEM '
      'where'
      '  ANO = :ANO and'
      '  CODIGO = :CODIGO and'
      '  EMPRESA = :EMPRESA and'
      '  FORNECEDOR = :FORNECEDOR and'
      '  ITEM = :ITEM')
    ModifySQL.Strings = (
      'update TBCOTACAO_COMPRAFORN_ITEM'
      'set'
      '  ANO = :ANO,'
      '  CODIGO = :CODIGO,'
      '  EMPRESA = :EMPRESA,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  ITEM = :ITEM,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  FORNECEDOR = :OLD_FORNECEDOR and'
      '  ITEM = :OLD_ITEM')
    Left = 288
    Top = 48
  end
  object dtsItem: TDataSource
    AutoEdit = False
    DataSet = qryItem
    OnStateChange = dtsFornecedorStateChange
    Left = 320
    Top = 48
  end
  object stpSetCotacaoFornecedorItem: TIBStoredProc
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    StoredProcName = 'SET_COTACAO_COMPRAFORN_ITEM'
    Left = 240
    Top = 320
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FORNECEDOR'
        ParamType = ptInput
      end>
  end
end
