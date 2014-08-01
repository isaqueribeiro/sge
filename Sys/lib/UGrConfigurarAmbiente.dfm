inherited frmGrConfigurarAmbiente: TfrmGrConfigurarAmbiente
  Left = 676
  Top = 269
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Configurar Ambiente (Esta'#231#227'o)'
  ClientHeight = 534
  ClientWidth = 430
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  object PnlBotoes: TPanel
    Left = 0
    Top = 488
    Width = 430
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    DesignSize = (
      430
      46)
    object Bevel3: TBevel
      Left = 4
      Top = 4
      Width = 422
      Height = 4
      Align = alTop
      Shape = bsTopLine
    end
    object btnSalvar: TBitBtn
      Left = 243
      Top = 8
      Width = 92
      Height = 33
      Anchors = [akRight, akBottom]
      Caption = '&Salvar'
      TabOrder = 0
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
    object btnCancelar: TBitBtn
      Left = 338
      Top = 8
      Width = 92
      Height = 33
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
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
  end
  object PgcConfiguracao: TPageControl
    Left = 0
    Top = 0
    Width = 430
    Height = 488
    ActivePage = TbsPDV
    Align = alClient
    TabOrder = 0
    object TbsGeral: TTabSheet
      BorderWidth = 4
      Caption = 'Configura'#231#245'es Geral'
      object GrpBxPadrao: TGroupBox
        Left = 0
        Top = 0
        Width = 414
        Height = 452
        Align = alClient
        Caption = ' Dados Padr'#245'es '
        TabOrder = 0
        object lblPais: TLabel
          Left = 41
          Top = 52
          Width = 23
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pa'#237's:'
          Enabled = False
          FocusControl = edPais
          Transparent = True
        end
        object lblEstado: TLabel
          Left = 27
          Top = 76
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Estado:'
          FocusControl = edEstado
          Transparent = True
        end
        object lblCidade: TLabel
          Left = 27
          Top = 100
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cidade:'
          FocusControl = edCidade
          Transparent = True
        end
        object lblFormaPagto: TLabel
          Left = 30
          Top = 156
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Forma:'
          FocusControl = edFormaPagto
          Transparent = True
        end
        object Label2: TLabel
          Left = 72
          Top = 24
          Width = 55
          Height = 13
          Caption = 'Endere'#231'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 72
          Top = 128
          Width = 134
          Height = 13
          Caption = 'Vendedor/Pagamentos:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblCondicaoPagto: TLabel
          Left = 16
          Top = 180
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Condi'#231#227'o:'
          FocusControl = edCondicaoPagto
          Transparent = True
        end
        object lblVendedor: TLabel
          Left = 14
          Top = 204
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vendedor:'
          FocusControl = edVendedor
          Transparent = True
        end
        object Label1: TLabel
          Left = 71
          Top = 232
          Width = 40
          Height = 13
          Caption = 'CFOP'#39's:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblCFOPEntrada: TLabel
          Left = 22
          Top = 260
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Entrada:'
          FocusControl = edCFOPEntrada
          Transparent = True
        end
        object lblCFOPSaida: TLabel
          Left = 34
          Top = 284
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sa'#237'da:'
          FocusControl = edCFOPSaida
          Transparent = True
        end
        object Label6: TLabel
          Left = 71
          Top = 312
          Width = 41
          Height = 13
          Caption = 'Outros:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object edPais: TEdit
          Left = 72
          Top = 48
          Width = 65
          Height = 21
          Enabled = False
          TabOrder = 0
          OnKeyPress = ApenasNumerosKeyPress
        end
        object edPaisNome: TEdit
          Left = 140
          Top = 48
          Width = 249
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object edEstado: TEdit
          Left = 72
          Top = 72
          Width = 65
          Height = 21
          TabOrder = 2
          OnKeyPress = ApenasNumerosKeyPress
        end
        object edEstadoNome: TEdit
          Left = 140
          Top = 72
          Width = 249
          Height = 21
          ReadOnly = True
          TabOrder = 3
        end
        object edCidade: TEdit
          Left = 72
          Top = 96
          Width = 65
          Height = 21
          TabOrder = 4
          OnKeyPress = ApenasNumerosKeyPress
        end
        object edCidadeNome: TEdit
          Left = 140
          Top = 96
          Width = 249
          Height = 21
          ReadOnly = True
          TabOrder = 5
        end
        object edFormaPagto: TEdit
          Left = 72
          Top = 152
          Width = 65
          Height = 21
          TabOrder = 6
          OnKeyPress = ApenasNumerosKeyPress
        end
        object edFormaPagtoNome: TEdit
          Left = 140
          Top = 152
          Width = 249
          Height = 21
          ReadOnly = True
          TabOrder = 7
        end
        object edCondicaoPagto: TEdit
          Left = 72
          Top = 176
          Width = 65
          Height = 21
          TabOrder = 8
          OnKeyPress = ApenasNumerosKeyPress
        end
        object edCondicaoPagtoNome: TEdit
          Left = 140
          Top = 176
          Width = 249
          Height = 21
          ReadOnly = True
          TabOrder = 9
        end
        object edVendedor: TEdit
          Left = 72
          Top = 200
          Width = 65
          Height = 21
          TabOrder = 10
          OnKeyPress = ApenasNumerosKeyPress
        end
        object edVendedorNome: TEdit
          Left = 140
          Top = 200
          Width = 249
          Height = 21
          ReadOnly = True
          TabOrder = 11
        end
        object edCFOPEntrada: TEdit
          Left = 72
          Top = 256
          Width = 65
          Height = 21
          TabOrder = 12
          OnKeyPress = ApenasNumerosKeyPress
        end
        object edCFOPEntradaNome: TEdit
          Left = 140
          Top = 256
          Width = 249
          Height = 21
          ReadOnly = True
          TabOrder = 13
        end
        object edCFOPSaida: TEdit
          Left = 72
          Top = 280
          Width = 65
          Height = 21
          TabOrder = 14
          OnKeyPress = ApenasNumerosKeyPress
        end
        object edCFOPSaidaNome: TEdit
          Left = 140
          Top = 280
          Width = 249
          Height = 21
          ReadOnly = True
          TabOrder = 15
        end
        object chkCarregarPeloEAN: TCheckBox
          Left = 72
          Top = 336
          Width = 321
          Height = 17
          Caption = 'Or'#231'amento/Venda - Carregar pelo C'#243'digo EAN do Produto'
          TabOrder = 16
        end
      end
    end
    object TbsPDV: TTabSheet
      Caption = 'PDV'
      ImageIndex = 1
      object GrpBxImpressaoCupomNFiscal: TGroupBox
        Left = 0
        Top = 65
        Width = 422
        Height = 112
        Align = alTop
        Caption = ' Impress'#227'o Cupons N'#227'o-Fiscais '
        TabOrder = 1
        object lblCupomNaoFiscalPorta: TLabel
          Left = 50
          Top = 53
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Porta:'
          Enabled = False
          FocusControl = edCupomNaoFiscalPorta
          Transparent = True
        end
        object lblCupomNaoFiscalImpressora: TLabel
          Left = 22
          Top = 77
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Impressora:'
          Enabled = False
          FocusControl = edCupomNaoFiscalImpressora
          Transparent = True
        end
        object chkCupomNaoFiscal: TCheckBox
          Left = 88
          Top = 24
          Width = 209
          Height = 17
          Caption = 'Esta'#231#227'o emite CUPOM N'#195'O FISCAL'
          Enabled = False
          TabOrder = 0
          OnClick = chkCupomNaoFiscalClick
        end
        object edCupomNaoFiscalPorta: TComboBox
          Left = 88
          Top = 49
          Width = 313
          Height = 21
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = 'Impressora padr'#227'o do Windows'
          OnChange = edCupomNaoFiscalPortaChange
          Items.Strings = (
            'Impressora padr'#227'o do Windows'
            'LPT1'
            'LPT2'
            'LPT3'
            'LPT4'
            'LPT5'
            'C:\CUPOM.TXT')
        end
        object edCupomNaoFiscalImpressora: TComboBox
          Left = 88
          Top = 73
          Width = 313
          Height = 21
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = 'Impressora padr'#227'o do Windows'
          Items.Strings = (
            'Impressora padr'#227'o do Windows'
            'LPT1'
            'LPT2'
            'LPT3'
            'LPT4'
            'LPT5'
            'C:\CUPOM.TXT')
        end
      end
      object PnlCupom: TPanel
        Left = 0
        Top = 0
        Width = 422
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object chkCupomAutomatico: TCheckBox
          Left = 88
          Top = 34
          Width = 329
          Height = 17
          Caption = 'Emitir cupom automaticamente ap'#243's a finaliza'#231#227'o da venda'
          Enabled = False
          TabOrder = 1
        end
        object chkCupomEmitir: TCheckBox
          Left = 88
          Top = 10
          Width = 145
          Height = 17
          Caption = 'Emitir Cupom (Geral)'
          TabOrder = 0
          OnClick = chkCupomEmitirClick
        end
      end
    end
  end
end
