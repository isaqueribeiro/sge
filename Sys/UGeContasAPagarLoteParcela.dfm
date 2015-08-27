inherited frmGeContasAPagarLoteParcela: TfrmGeContasAPagarLoteParcela
  ActiveControl = dbEmpresa
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Contas A Pagar - Incluir Lote (Parcelas)'
  ClientHeight = 481
  ClientWidth = 702
  ExplicitWidth = 716
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  object lblInforme: TLabel
    Left = 16
    Top = 442
    Width = 320
    Height = 32
    Caption = 
      'Favor verificar os dados do lan'#231'amento antes de confirmar o lote' +
      ' de parcelas.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 115
    Width = 702
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 81
    ExplicitWidth = 551
  end
  object Bevel2: TBevel
    Left = 0
    Top = 436
    Width = 702
    Height = 4
    Align = alTop
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsSpacer
    ExplicitTop = 313
    ExplicitWidth = 551
  end
  object btnConfirmar: TcxButton
    Left = 531
    Top = 443
    Width = 83
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Confirmar'
    Enabled = False
    OptionsImage.Glyph.Data = {
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
    OptionsImage.NumGlyphs = 2
    TabOrder = 0
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TcxButton
    Left = 619
    Top = 443
    Width = 83
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancelar'
    OptionsImage.Glyph.Data = {
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
    OptionsImage.NumGlyphs = 2
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object GrpBxLancamento: TGroupBox
    Left = 0
    Top = 0
    Width = 702
    Height = 115
    Align = alTop
    Caption = 'Dados nominais'
    TabOrder = 2
    object lblEmpresa: TLabel
      Left = 16
      Top = 24
      Width = 45
      Height = 13
      Caption = 'Empresa:'
      FocusControl = dbEmpresa
    end
    object lblFornecedor: TLabel
      Left = 279
      Top = 24
      Width = 59
      Height = 13
      Caption = 'Fornecedor:'
      FocusControl = dbFornecedor
    end
    object lblEmissao: TLabel
      Left = 489
      Top = 64
      Width = 42
      Height = 13
      Caption = 'Emiss'#227'o:'
      FocusControl = dbEmissao
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblFormaPagto: TLabel
      Left = 16
      Top = 64
      Width = 106
      Height = 13
      Caption = '&Forma de Pagamento:'
      FocusControl = dbFormaPagto
    end
    object lblCondicaoPagto: TLabel
      Left = 168
      Top = 64
      Width = 120
      Height = 13
      Caption = 'Condi'#231#227'o de Pagamento:'
      Enabled = False
      FocusControl = dbCondicaoPagto
      Visible = False
    end
    object lblTipoDespesa: TLabel
      Left = 167
      Top = 64
      Width = 83
      Height = 13
      Caption = 'Tipo de Despesa:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNotaFiscal: TLabel
      Left = 600
      Top = 64
      Width = 56
      Height = 13
      Caption = 'Nota Fiscal:'
      FocusControl = dbNotaFiscal
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbEmpresa: TDBLookupComboBox
      Left = 16
      Top = 40
      Width = 257
      Height = 21
      DataField = 'Empresa'
      DataSource = dtsDadosNominais
      DropDownRows = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'CNPJ'
      ListField = 'RZSOC'
      ListSource = dtsEmpresa
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbFornecedor: TJvDBComboEdit
      Left = 279
      Top = 40
      Width = 410
      Height = 21
      ButtonHint = 'Pesquisar Fornecedor (Ctrl+P)'
      CharCase = ecUpperCase
      ClickKey = 16464
      Color = clMoneyGreen
      DataField = 'FornecedorNome'
      DataSource = dtsDadosNominais
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
      OnButtonClick = dbFornecedorButtonClick
    end
    object dbEmissao: TJvDBDateEdit
      Left = 489
      Top = 80
      Width = 105
      Height = 21
      DataField = 'Emissao'
      DataSource = dtsDadosNominais
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
        0000800000008000000000000000800000000000000000000000800000008080
        8000FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
        0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
        80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
        C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      ImageKind = ikCustom
      NumGlyphs = 2
      ParentFont = False
      PopupColor = clBtnFace
      ShowNullDate = False
      TabOrder = 5
    end
    object dbFormaPagto: TDBLookupComboBox
      Left = 16
      Top = 80
      Width = 145
      Height = 21
      DataField = 'FormaPagto'
      DataSource = dtsDadosNominais
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
      TabOrder = 2
    end
    object dbCondicaoPagto: TDBLookupComboBox
      Left = 168
      Top = 80
      Width = 170
      Height = 21
      DataField = 'CondicaoPagto'
      DataSource = dtsDadosNominais
      DropDownRows = 10
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'COND_COD'
      ListField = 'COND_DESCRICAO_FULL'
      ListSource = dtsCondicaoPagto
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object dbTipoDespesa: TDBLookupComboBox
      Left = 167
      Top = 80
      Width = 316
      Height = 21
      DataField = 'TipoDespesa'
      DataSource = dtsDadosNominais
      DropDownRows = 10
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'COD'
      ListField = 'TIPODESP'
      ListSource = dtsTpDespesa
      ParentFont = False
      TabOrder = 4
    end
    object dbNotaFiscal: TDBEdit
      Left = 600
      Top = 80
      Width = 89
      Height = 21
      DataField = 'NotaFiscal'
      DataSource = dtsDadosNominais
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object pnlParcelas: TPanel
    Left = 0
    Top = 119
    Width = 702
    Height = 317
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Bevel3: TBevel
      Left = 305
      Top = 0
      Width = 4
      Height = 317
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = 0
      ExplicitHeight = 702
    end
    object GrpBxParametros: TGroupBox
      Left = 0
      Top = 0
      Width = 305
      Height = 317
      Align = alLeft
      Caption = 'Dados para gerar o lote de parcelas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        305
        317)
      object lblNumeroParcelasX: TLabel
        Left = 16
        Top = 31
        Width = 161
        Height = 11
        Caption = 'N'#250'mero de parcelas....:'
        FocusControl = dbNumeroParcelas
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
      end
      object lblValorTotalX: TLabel
        Left = 16
        Top = 56
        Width = 161
        Height = 11
        Caption = 'Valor Total (R$)......:'
        FocusControl = dbValorTotal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
      end
      object lblDiaVencimentoX: TLabel
        Left = 16
        Top = 108
        Width = 161
        Height = 11
        Caption = 'Dia de vencimento.....:'
        FocusControl = dbDiaVencimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
      end
      object lblNumeroDiasX: TLabel
        Left = 16
        Top = 133
        Width = 161
        Height = 11
        Caption = 'Gerar vencimento a cada'
        FocusControl = dbNumeroDias
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 232
        Top = 133
        Width = 42
        Height = 11
        Caption = 'dia(s)'
        FocusControl = dbNumeroDias
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
      end
      object lblPrimeiroVencimentoX: TLabel
        Left = 16
        Top = 82
        Width = 161
        Height = 11
        Caption = 'Primeiro vencimento...:'
        FocusControl = dbPrimeiroVencimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
      end
      object dbNumeroParcelas: TDBEdit
        Left = 183
        Top = 28
        Width = 43
        Height = 19
        DataField = 'NumeroParcelas'
        DataSource = dtsDadosNominais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dbValorTotal: TDBEdit
        Left = 183
        Top = 53
        Width = 111
        Height = 19
        DataField = 'ValorTotal'
        DataSource = dtsDadosNominais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dbDiaVencimento: TDBEdit
        Left = 183
        Top = 105
        Width = 43
        Height = 19
        DataField = 'DiaVencimento'
        DataSource = dtsDadosNominais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object dbNumeroDias: TDBEdit
        Left = 183
        Top = 130
        Width = 43
        Height = 19
        DataField = 'NumeroDias'
        DataSource = dtsDadosNominais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object BtnGerar: TcxButton
        Left = 16
        Top = 250
        Width = 278
        Height = 33
        Hint = 'Gerar Parcelas'
        Anchors = [akRight, akBottom]
        Caption = 'Gerar Parcelas'
        OptionsImage.ImageIndex = 10
        OptionsImage.Images = DMRecursos.ImgBotoes16x16
        TabOrder = 6
        OnClick = BtnGerarClick
      end
      object RdGrpVencimentoFimSemana: TRadioGroup
        Left = 16
        Top = 154
        Width = 278
        Height = 90
        Caption = 'Vencimentos nos finais de Semana'
        ItemIndex = 2
        Items.Strings = (
          'Permanecer inalterado'
          'Antecipar data de vencimento'
          'Prorrogar data de vencimento')
        TabOrder = 5
      end
      object dbPrimeiroVencimento: TJvDBDateEdit
        Left = 183
        Top = 78
        Width = 111
        Height = 21
        DataField = 'PrimeiroVencimento'
        DataSource = dtsDadosNominais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76050000424D760500000000000036000000280000001C0000000C0000000100
          2000000000004005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
          0000800000008000000000000000800000000000000000000000800000008080
          8000FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
          0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
          80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
          C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00}
        ImageKind = ikCustom
        NumGlyphs = 2
        ParentFont = False
        PopupColor = clBtnFace
        ShowNullDate = False
        TabOrder = 2
      end
    end
    object GrpBxParcelas: TGroupBox
      Left = 309
      Top = 0
      Width = 393
      Height = 317
      Align = alClient
      Caption = 'LOTE DE PARCELAS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object dbgParcelas: TcxGrid
        Left = 2
        Top = 15
        Width = 389
        Height = 300
        Align = alClient
        TabOrder = 0
        OnEnter = dbgParcelasEnter
        OnExit = dbgParcelasExit
        object dbgParcelasTbl: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dtsParcelas
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00#'
              Kind = skSum
              FieldName = 'ValorParcela'
              Column = dbgParcelasTblValorParcela
            end>
          DataController.Summary.SummaryGroups = <>
          Images = DMRecursos.ImgBotoes16x16
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.CellEndEllipsis = True
          OptionsView.NoDataToDisplayInfoText = '<Sem lote de parcelas gerado>'
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object dbgParcelasTblParcela: TcxGridDBColumn
            Caption = '#'
            DataBinding.FieldName = 'Parcela'
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 30
          end
          object dbgParcelasTblVencimento: TcxGridDBColumn
            DataBinding.FieldName = 'Vencimento'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            MinWidth = 95
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 95
          end
          object dbgParcelasTblDiaSemana: TcxGridDBColumn
            Caption = 'Dia'
            DataBinding.FieldName = 'DiaSemana'
            HeaderAlignmentHorz = taCenter
            MinWidth = 40
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 40
          end
          object dbgParcelasTblValorParcela: TcxGridDBColumn
            Caption = 'Valor (R$)'
            DataBinding.FieldName = 'ValorParcela'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            MinWidth = 80
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 80
          end
          object dbgParcelasTblObservacao: TcxGridDBColumn
            Caption = 'Observa'#231#245'es'
            DataBinding.FieldName = 'Observacao'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
          end
        end
        object dbgParcelasLv: TcxGridLevel
          GridView = dbgParcelasTbl
        end
      end
    end
  end
  object tmrAlerta: TTimer
    Interval = 500
    OnTimer = tmrAlertaTimer
    Left = 344
    Top = 447
  end
  object cdsDadosNominais: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Empresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Fornecedor'
        DataType = ftInteger
      end
      item
        Name = 'FornecedorNome'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'FormaPagto'
        DataType = ftSmallint
      end
      item
        Name = 'CondicaoPagto'
        DataType = ftSmallint
      end
      item
        Name = 'TipoDespesa'
        DataType = ftInteger
      end
      item
        Name = 'Emissao'
        DataType = ftDateTime
      end
      item
        Name = 'NotaFiscal'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NumeroParcelas'
        DataType = ftInteger
      end
      item
        Name = 'ValorTotal'
        DataType = ftCurrency
      end
      item
        Name = 'PrimeiroVencimento'
        DataType = ftDateTime
      end
      item
        Name = 'DiaVencimento'
        DataType = ftSmallint
      end
      item
        Name = 'NumeroDias'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnNewRecord = cdsDadosNominaisNewRecord
    Left = 96
    Top = 16
    object cdsDadosNominaisEmpresa: TStringField
      FieldName = 'Empresa'
    end
    object cdsDadosNominaisFornecedor: TIntegerField
      FieldName = 'Fornecedor'
      Required = True
    end
    object cdsDadosNominaisFornecedorNome: TStringField
      FieldName = 'FornecedorNome'
      Size = 150
    end
    object cdsDadosNominaisFormaPagto: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FormaPagto'
      Required = True
    end
    object cdsDadosNominaisCondicaoPagto: TSmallintField
      FieldName = 'CondicaoPagto'
    end
    object cdsDadosNominaisTipoDespesa: TIntegerField
      DisplayLabel = 'Tipo de Despesa'
      FieldName = 'TipoDespesa'
      Required = True
    end
    object cdsDadosNominaisEmissao: TDateTimeField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'Emissao'
      Required = True
    end
    object cdsDadosNominaisNotaFiscal: TStringField
      FieldName = 'NotaFiscal'
      Size = 15
    end
    object cdsDadosNominaisNumeroParcelas: TIntegerField
      DisplayLabel = 'N'#250'mero de Parcelas'
      FieldName = 'NumeroParcelas'
      Required = True
    end
    object cdsDadosNominaisPrimeiroVencimento: TDateTimeField
      FieldName = 'PrimeiroVencimento'
    end
    object cdsDadosNominaisValorTotal: TCurrencyField
      DisplayLabel = 'Valor Total (R$)'
      FieldName = 'ValorTotal'
      DisplayFormat = ',0.00#'
    end
    object cdsDadosNominaisDiaVencimento: TSmallintField
      DisplayLabel = 'Dia de vencimento'
      FieldName = 'DiaVencimento'
      Required = True
      DisplayFormat = '00'
    end
    object cdsDadosNominaisNumeroDias: TIntegerField
      DisplayLabel = 'Gerar vencimento a cada ? dia(s)'
      FieldName = 'NumeroDias'
      Required = True
      DisplayFormat = '00'
    end
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBEMPRESA'
    UniDirectional = False
    Left = 336
    Top = 256
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 368
    Top = 256
  end
  object dtsDadosNominais: TDataSource
    DataSet = cdsDadosNominais
    Left = 128
    Top = 16
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBFORMPAGTO'
    UniDirectional = False
    Left = 336
    Top = 288
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 368
    Top = 288
  end
  object tblCondicaoPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COND_COD'
        DataType = ftSmallint
      end
      item
        Name = 'COND_DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'COND_PRAZO'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_01'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_02'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_03'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_04'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_05'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_06'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_07'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_08'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_09'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_10'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_11'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_12'
        DataType = ftSmallint
      end
      item
        Name = 'COND_DESCRICAO_FULL'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 177
      end>
    StoreDefs = True
    TableName = 'VW_CONDICAOPAGTO'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 336
    Top = 320
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = tblCondicaoPagto
    Left = 368
    Top = 320
  end
  object qryTipoDespesa: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select *'
      'from TBTPDESPESA t'
      'where (t.ativo = :ativo) or (:todos = 1)'
      'order by t.tipodesp')
    Left = 336
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ativo'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'todos'
        ParamType = ptInput
        Value = 0
      end>
  end
  object dtsTpDespesa: TDataSource
    DataSet = qryTipoDespesa
    Left = 368
    Top = 352
  end
  object cdsParcelas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Parcela'
        DataType = ftSmallint
      end
      item
        Name = 'Vencimento'
        DataType = ftDateTime
      end
      item
        Name = 'DiaSemana'
        DataType = ftSmallint
      end
      item
        Name = 'ValorParcela'
        DataType = ftCurrency
      end
      item
        Name = 'Observacao'
        DataType = ftString
        Size = 250
      end>
    IndexDefs = <>
    IndexFieldNames = 'Parcela'
    Params = <>
    StoreDefs = True
    Left = 437
    Top = 223
    object cdsParcelasParcela: TSmallintField
      Alignment = taCenter
      FieldName = 'Parcela'
      DisplayFormat = '00'
    end
    object cdsParcelasVencimento: TDateTimeField
      FieldName = 'Vencimento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsParcelasDiaSemana: TSmallintField
      Alignment = taCenter
      FieldName = 'DiaSemana'
      OnGetText = cdsParcelasDiaSemanaGetText
    end
    object cdsParcelasValorParcela: TCurrencyField
      FieldName = 'ValorParcela'
      DisplayFormat = ',0.00#'
    end
    object cdsParcelasObservacao: TStringField
      FieldName = 'Observacao'
      Size = 250
    end
  end
  object dtsParcelas: TDataSource
    DataSet = cdsParcelas
    OnStateChange = dtsParcelasStateChange
    OnDataChange = dtsParcelasDataChange
    Left = 469
    Top = 223
  end
  object cdsContaAPagar: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    p.anolanc'
      '  , p.numlanc'
      '  , p.empresa'
      '  , p.codforn'
      '  , p.parcela'
      '  , p.tippag'
      '  , p.historic'
      '  , p.notfisc'
      '  , p.dtemiss'
      '  , p.dtvenc'
      '  , p.valorpag'
      '  , p.valorpagtot'
      '  , p.valorsaldo'
      '  , p.nomeemp'
      '  , p.tipocateg'
      '  , p.forma_pagto'
      '  , p.condicao_pagto'
      '  , p.quitado'
      '  , p.codtpdesp'
      '  , p.situacao'
      '  , p.lote'
      'from TBCONTPAG p'
      'where 1 = 0')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'NUMLANC'
    GeneratorField.Generator = 'GEN_CONTAPAG_NUM_2013'
    UpdateObject = IbUpdTabela
    Left = 600
    Top = 288
    object cdsContaAPagarANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = '"TBCONTPAG"."ANOLANC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContaAPagarNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = '"TBCONTPAG"."NUMLANC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContaAPagarEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBCONTPAG"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsContaAPagarCODFORN: TSmallintField
      FieldName = 'CODFORN'
      Origin = '"TBCONTPAG"."CODFORN"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarPARCELA: TSmallintField
      FieldName = 'PARCELA'
      Origin = '"TBCONTPAG"."PARCELA"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarTIPPAG: TIBStringField
      FieldName = 'TIPPAG'
      Origin = '"TBCONTPAG"."TIPPAG"'
      ProviderFlags = [pfInUpdate]
      Size = 35
    end
    object cdsContaAPagarHISTORIC: TWideMemoField
      FieldName = 'HISTORIC'
      Origin = '"TBCONTPAG"."HISTORIC"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
    object cdsContaAPagarNOTFISC: TIBStringField
      FieldName = 'NOTFISC'
      Origin = '"TBCONTPAG"."NOTFISC"'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsContaAPagarDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = '"TBCONTPAG"."DTEMISS"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = '"TBCONTPAG"."DTVENC"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarVALORPAG: TIBBCDField
      FieldName = 'VALORPAG'
      Origin = '"TBCONTPAG"."VALORPAG"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsContaAPagarVALORPAGTOT: TIBBCDField
      FieldName = 'VALORPAGTOT'
      Origin = '"TBCONTPAG"."VALORPAGTOT"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsContaAPagarVALORSALDO: TIBBCDField
      FieldName = 'VALORSALDO'
      Origin = '"TBCONTPAG"."VALORSALDO"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsContaAPagarNOMEEMP: TIBStringField
      FieldName = 'NOMEEMP'
      Origin = '"TBCONTPAG"."NOMEEMP"'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsContaAPagarTIPOCATEG: TSmallintField
      FieldName = 'TIPOCATEG'
      Origin = '"TBCONTPAG"."TIPOCATEG"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = '"TBCONTPAG"."FORMA_PAGTO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarCONDICAO_PAGTO: TSmallintField
      FieldName = 'CONDICAO_PAGTO'
      Origin = '"TBCONTPAG"."CONDICAO_PAGTO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarQUITADO: TSmallintField
      FieldName = 'QUITADO'
      Origin = '"TBCONTPAG"."QUITADO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarCODTPDESP: TSmallintField
      FieldName = 'CODTPDESP'
      Origin = '"TBCONTPAG"."CODTPDESP"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = '"TBCONTPAG"."SITUACAO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaAPagarLOTE: TIBStringField
      FieldName = 'LOTE'
      Origin = '"TBCONTPAG"."LOTE"'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
  end
  object IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANOLANC,'
      '  NUMLANC,'
      '  EMPRESA,'
      '  CODFORN,'
      '  PARCELA,'
      '  TIPPAG,'
      '  HISTORIC,'
      '  NOTFISC,'
      '  DTEMISS,'
      '  DTVENC,'
      '  DTPAG,'
      '  DOCBAIX,'
      '  VALORPAG,'
      '  VALORMULTA,'
      '  VALORPAGTOT,'
      '  VALORSALDO,'
      '  NOMEEMP,'
      '  TIPOCATEG,'
      '  BANCO,'
      '  NUMCHQ,'
      '  ANOCOMPRA,'
      '  NUMCOMPRA,'
      '  FORMA_PAGTO,'
      '  CONDICAO_PAGTO,'
      '  QUITADO,'
      '  CODTPDESP,'
      '  SITUACAO,'
      '  LOTE'
      'from TBCONTPAG '
      'where'
      '  ANOLANC = :ANOLANC and'
      '  NUMLANC = :NUMLANC')
    ModifySQL.Strings = (
      'update TBCONTPAG'
      'set'
      '  ANOLANC = :ANOLANC,'
      '  CODFORN = :CODFORN,'
      '  CODTPDESP = :CODTPDESP,'
      '  CONDICAO_PAGTO = :CONDICAO_PAGTO,'
      '  DTEMISS = :DTEMISS,'
      '  DTVENC = :DTVENC,'
      '  EMPRESA = :EMPRESA,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  HISTORIC = :HISTORIC,'
      '  LOTE = :LOTE,'
      '  NOMEEMP = :NOMEEMP,'
      '  NOTFISC = :NOTFISC,'
      '  NUMLANC = :NUMLANC,'
      '  PARCELA = :PARCELA,'
      '  QUITADO = :QUITADO,'
      '  SITUACAO = :SITUACAO,'
      '  TIPOCATEG = :TIPOCATEG,'
      '  TIPPAG = :TIPPAG,'
      '  VALORPAG = :VALORPAG,'
      '  VALORPAGTOT = :VALORPAGTOT,'
      '  VALORSALDO = :VALORSALDO'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      'insert into TBCONTPAG'
      
        '  (ANOLANC, CODFORN, CODTPDESP, CONDICAO_PAGTO, DTEMISS, DTVENC,' +
        ' EMPRESA, '
      
        '   FORMA_PAGTO, HISTORIC, LOTE, NOMEEMP, NOTFISC, NUMLANC, PARCE' +
        'LA, QUITADO, '
      
        '   SITUACAO, TIPOCATEG, TIPPAG, VALORPAG, VALORPAGTOT, VALORSALD' +
        'O)'
      'values'
      
        '  (:ANOLANC, :CODFORN, :CODTPDESP, :CONDICAO_PAGTO, :DTEMISS, :D' +
        'TVENC, '
      
        '   :EMPRESA, :FORMA_PAGTO, :HISTORIC, :LOTE, :NOMEEMP, :NOTFISC,' +
        ' :NUMLANC, '
      
        '   :PARCELA, :QUITADO, :SITUACAO, :TIPOCATEG, :TIPPAG, :VALORPAG' +
        ', :VALORPAGTOT, '
      '   :VALORSALDO)')
    DeleteSQL.Strings = (
      'delete from TBCONTPAG'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC')
    Left = 632
    Top = 288
  end
end
