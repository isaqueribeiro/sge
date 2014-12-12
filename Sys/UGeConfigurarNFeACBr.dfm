inherited frmGeConfigurarNFeACBr: TfrmGeConfigurarNFeACBr
  Top = 190
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Configurar NF-e / NFC-e (ACBr)'
  ClientHeight = 586
  ClientWidth = 284
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 545
    Width = 284
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object btnSalvar: TBitBtn
    Left = 113
    Top = 550
    Width = 83
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Salvar'
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
    Left = 201
    Top = 550
    Width = 83
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
  object grpBxConfigurar: TGroupBox
    Left = 0
    Top = 0
    Width = 284
    Height = 545
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Configura'#231#245'es'
    TabOrder = 2
    object pgcGuias: TPageControl
      Left = 2
      Top = 15
      Width = 280
      Height = 528
      ActivePage = TabSheet2
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Certificado'
        DesignSize = (
          272
          500)
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 272
          Height = 144
          Align = alTop
          Caption = 'Certificado'
          TabOrder = 0
          object lbltCaminho: TLabel
            Left = 8
            Top = 16
            Width = 41
            Height = 13
            Caption = 'Caminho'
          end
          object lbltSenha: TLabel
            Left = 8
            Top = 56
            Width = 30
            Height = 13
            Caption = 'Senha'
          end
          object sbtnCaminhoCert: TSpeedButton
            Left = 235
            Top = 32
            Width = 23
            Height = 24
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = sbtnCaminhoCertClick
          end
          object lbltNumSerie: TLabel
            Left = 8
            Top = 96
            Width = 79
            Height = 13
            Caption = 'N'#250'mero de S'#233'rie'
          end
          object sbtnGetCert: TSpeedButton
            Left = 235
            Top = 110
            Width = 23
            Height = 24
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
          end
          object edtCaminho: TEdit
            Left = 8
            Top = 32
            Width = 225
            Height = 21
            TabOrder = 0
          end
          object edtSenha: TEdit
            Left = 8
            Top = 72
            Width = 249
            Height = 21
            PasswordChar = '*'
            TabOrder = 1
          end
          object edtNumSerie: TEdit
            Left = 8
            Top = 112
            Width = 225
            Height = 21
            TabOrder = 2
            OnChange = edtNumSerieChange
          end
        end
        object btnValidadeCertificado: TBitBtn
          Left = 0
          Top = 459
          Width = 83
          Height = 33
          Hint = 'Verificar validade do Certificado'
          Anchors = [akLeft, akBottom]
          Caption = 'Validade'
          TabOrder = 1
          OnClick = btnValidadeCertificadoClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            180000000000000600000000000000000000000000000000000000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF009A8F8C2030405F686900FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008F
            8F8F33333367676700FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF008C8C884050602098C03038405F6D7200FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008A8A8A53
            53539898983939396D6D6D00FF0000FF0000FF0000FF0000FF0000FF0000FF00
            E1C0A7D1AC93D5B8A17F828550607020A0D030B8F060A0B05068708068507058
            4060483060483000FF0000FF0000FF00BBBBBBA8A8A8B4B4B4828282636363A1
            A1A1BBBBBB9E9E9E68686863636353535343434343434300FF0000FF0000FF00
            7068606050406050406068604088A040C0F060B0D0708890A09890C0B0A0B0A0
            90B0A09060483000FF0000FF0000FF006666664C4C4C4C4C4C646464888888C1
            C1C1B1B1B1888888969696ACACAC9C9C9C9C9C9C43434300FF0000FF00776E65
            C0A080F0E0A0F0D8A0B0A8906070706098B07088909098A0D0F0E0B0E8D0B0E8
            C0B0A09060483000FF0000FF006C6C6C999999CECECEC9C9C9A1A1A16E6E6E99
            9999888888999999E8E8E8DBDBDBD6D6D69C9C9C43434300FF00968372B09880
            FFFFC0FFF8C0FFF0C0FFF0D0B0A89070707090A0A0F0F8F0E0F8F0C0F0D0C0E8
            D0C0A89060483000FF007F7F7F939393ECECECE7E7E7E3E3E3E7E7E7A1A1A170
            70709E9E9EF4F4F4F3F3F3E1E1E1DCDCDCA3A3A343434300FF00968575E0D0B0
            FFFFE0FFFFE0FFFFD0FFF0C0F0D8B0605040E0D8C0E0C8B0D0B0A0D0A890C0E8
            D0C0A89060483000FF00818181C8C8C8F5F5F5F5F5F5F0F0F0E3E3E3CECECE4C
            4C4CD1D1D1C3C3C3AEAEAEA4A4A4DCDCDCA3A3A343434300FF00BCA997E0D0B0
            FFFFF0FFFFF0FFFFE0FFF8C0F0D8A0705850FFFFFFFFFFFFFFFFFFE0F8F0D0F0
            E0C0A8A060483000FF00A5A5A5C8C8C8FAFAFAFAFAFAF5F5F5E7E7E7C9C9C958
            5858FFFFFFFFFFFFFFFFFFF3F3F3E8E8E8A8A8A843434300FF00D5C0ADC0A8A0
            FFFFFFFFFFFFFFFFE0FFFFD0C0B080908070F0E0D0E0C8B0D0B0A0D0A890E0F8
            F0C0A8A060483000FF00BCBCBCA8A8A8FFFFFFFFFFFFF5F5F5F0F0F0A3A3A37C
            7C7CDCDCDCC3C3C3AEAEAEA4A4A4F3F3F3A8A8A843434300FF0000FF00B4ABA2
            C0B0B0F0E8D0F0E8C0C0B090807860D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFF0F8
            F0C0B0A060483000FF0000FF00A9A9A9B1B1B1E1E1E1DCDCDCA8A8A8717171D0
            D0D0FFFFFFFFFFFFFFFFFFFFFFFFF4F4F4ACACAC43434300FF0000FF0000FF00
            C0B0A0B0A090A09080B0A0A0B0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFC0B0A060483000FF0000FF0000FF00ACACAC9C9C9C8C8C8CA1A1A1A6A6A6FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACAC43434300FF0000FF0000FF00
            F0A890F0A890F0A890F0A880F0A080E09870E09060E08850E08050E07040E070
            40E07040D0603000FF0000FF0000FF00A8A8A8A8A8A8A8A8A8A3A3A39E9E9E93
            93938989898080807B7B7B6C6C6C6C6C6C6C6C6C5C5C5C00FF0000FF0000FF00
            F0A890FFC0A0FFC0A0FFC0A0FFB890FFB890FFB090FFA880FFA880F0A070F098
            70F09860D0683000FF0000FF0000FF00A8A8A8BCBCBCBCBCBCBCBCBCB3B3B3B3
            B3B3AEAEAEA4A4A4A4A4A499999994949490909061616100FF0000FF0000FF00
            F0A890F0A890F0A890F0A890F0A880F0A080F09870E09870E09060E08050E078
            40E07840E0704000FF0000FF0000FF00A8A8A8A8A8A8A8A8A8A8A8A8A3A3A39E
            9E9E9494949393938989897B7B7B7171717171716C6C6C00FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
          NumGlyphs = 2
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Geral'
        ImageIndex = 1
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 272
          Height = 449
          Align = alTop
          Caption = 'Geral'
          TabOrder = 0
          DesignSize = (
            272
            449)
          object lbltLogoMarca: TLabel
            Left = 8
            Top = 296
            Width = 55
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Logo Marca'
          end
          object sbtnLogoMarca: TSpeedButton
            Left = 241
            Top = 308
            Width = 23
            Height = 24
            Anchors = [akLeft, akBottom]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = sbtnLogoMarcaClick
          end
          object sbtnPathSalvar: TSpeedButton
            Left = 241
            Top = 372
            Width = 23
            Height = 24
            Anchors = [akLeft, akBottom]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = sbtnPathSalvarClick
          end
          object lblPathSchemas: TLabel
            Left = 8
            Top = 399
            Width = 198
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Diret'#243'rios com os arquivos XSD(Schemas)'
            FocusControl = edPathSchemas
          end
          object spPathSchemas: TSpeedButton
            Left = 241
            Top = 412
            Width = 23
            Height = 24
            Anchors = [akLeft, akBottom]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = spPathSchemasClick
          end
          object lblFormaEmissao: TLabel
            Left = 8
            Top = 72
            Width = 86
            Height = 13
            Caption = 'Forma de Emiss'#227'o'
            FocusControl = cbFormaEmissao
          end
          object lblVersaoDF: TLabel
            Left = 8
            Top = 117
            Width = 119
            Height = 13
            Caption = 'Vers'#227'o Documento Fiscal'
            FocusControl = cbVersaoDF
          end
          object lblIdToken: TLabel
            Left = 8
            Top = 163
            Width = 85
            Height = 13
            Caption = 'Id Token / Id CSC'
            Enabled = False
            FocusControl = edIdToken
          end
          object lblToken: TLabel
            Left = 8
            Top = 201
            Width = 249
            Height = 13
            Caption = 'Token / CSC (C'#243'digo de Seguran'#231'a do Contribuinte)'
            Enabled = False
            FocusControl = edToken
          end
          object edtLogoMarca: TEdit
            Left = 8
            Top = 312
            Width = 232
            Height = 21
            Anchors = [akLeft, akBottom]
            TabOrder = 6
          end
          object edPathLogs: TEdit
            Left = 8
            Top = 376
            Width = 232
            Height = 21
            Anchors = [akLeft, akBottom]
            TabOrder = 9
          end
          object ckSalvar: TCheckBox
            Left = 8
            Top = 360
            Width = 249
            Height = 15
            Anchors = [akLeft, akBottom]
            Caption = 'Salvar Arquivos de Envio e Resposta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object rgTipoDanfe: TRadioGroup
            Left = 7
            Top = 19
            Width = 256
            Height = 49
            Caption = 'DANFE'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Retrato'
              'Paisagem')
            TabOrder = 0
          end
          object edPathSchemas: TEdit
            Left = 8
            Top = 415
            Width = 232
            Height = 21
            Anchors = [akLeft, akBottom]
            TabOrder = 10
          end
          object cbFormaEmissao: TComboBox
            Left = 8
            Top = 88
            Width = 256
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
          end
          object cbVersaoDF: TComboBox
            Left = 8
            Top = 133
            Width = 256
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
          end
          object ckRetirarAcentos: TCheckBox
            Left = 8
            Top = 336
            Width = 193
            Height = 17
            Anchors = [akLeft, akBottom]
            Caption = 'Retirar Acentos dos XMLs enviados'
            Enabled = False
            TabOrder = 7
          end
          object edIdToken: TEdit
            Left = 8
            Top = 179
            Width = 256
            Height = 21
            Enabled = False
            TabOrder = 3
          end
          object edToken: TEdit
            Left = 8
            Top = 217
            Width = 256
            Height = 21
            Enabled = False
            TabOrder = 4
          end
          object ckEmitirNFCe: TCheckBox
            Left = 8
            Top = 240
            Width = 233
            Height = 17
            Anchors = [akLeft, akBottom]
            Caption = 'Esta esta'#231#227'o emite e imprime NFC-e '
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
        end
        object rgModoGerarNFe: TRadioGroup
          Left = 0
          Top = 449
          Width = 272
          Height = 49
          Align = alTop
          Caption = 'Modo de Gerar a NF-e'
          Columns = 2
          Enabled = False
          ItemIndex = 1
          Items.Strings = (
            'Off Line'
            'On Line')
          TabOrder = 1
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'WebService'
        ImageIndex = 2
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 272
          Height = 153
          Align = alTop
          Caption = 'WebService'
          TabOrder = 0
          DesignSize = (
            272
            153)
          object lblUF: TLabel
            Left = 8
            Top = 16
            Width = 121
            Height = 13
            Caption = 'Selecione UF de Destino:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object ckVisualizar: TCheckBox
            Left = 8
            Top = 126
            Width = 153
            Height = 17
            Anchors = [akLeft, akBottom]
            Caption = 'Visualizar Mensagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbUF: TComboBox
            Left = 8
            Top = 32
            Width = 249
            Height = 24
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 16
            ItemIndex = 24
            ParentFont = False
            TabOrder = 1
            Text = 'SP'
            Items.Strings = (
              'AC'
              'AL'
              'AP'
              'AM'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MT'
              'MS'
              'MG'
              'PA'
              'PB'
              'PR'
              'PE'
              'PI'
              'RJ'
              'RN'
              'RS'
              'RO'
              'RR'
              'SC'
              'SP'
              'SE'
              'TO')
          end
          object rgTipoAmb: TRadioGroup
            Left = 8
            Top = 61
            Width = 249
            Height = 52
            Caption = 'Selecione o Ambiente de Destino'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Produ'#231#227'o'
              'Homologa'#231#227'o')
            TabOrder = 2
          end
        end
        object gbProxy: TGroupBox
          Left = 0
          Top = 153
          Width = 272
          Height = 105
          Align = alTop
          Caption = 'Proxy'
          TabOrder = 1
          object lbltProxyHost: TLabel
            Left = 8
            Top = 16
            Width = 22
            Height = 13
            Caption = 'Host'
          end
          object lbltProxyPorta: TLabel
            Left = 208
            Top = 16
            Width = 26
            Height = 13
            Caption = 'Porta'
          end
          object lbltProxyUser: TLabel
            Left = 8
            Top = 56
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
          end
          object lbltProxySenha: TLabel
            Left = 138
            Top = 56
            Width = 30
            Height = 13
            Caption = 'Senha'
          end
          object edtProxyHost: TEdit
            Left = 8
            Top = 32
            Width = 193
            Height = 21
            TabOrder = 0
          end
          object edtProxyPorta: TEdit
            Left = 208
            Top = 32
            Width = 50
            Height = 21
            TabOrder = 1
          end
          object edtProxyUser: TEdit
            Left = 8
            Top = 72
            Width = 123
            Height = 21
            TabOrder = 2
          end
          object edtProxySenha: TEdit
            Left = 135
            Top = 72
            Width = 123
            Height = 21
            PasswordChar = '*'
            TabOrder = 3
          end
        end
        object WBResposta: TWebBrowser
          Left = 0
          Top = 465
          Width = 272
          Height = 35
          Align = alBottom
          TabOrder = 2
          ControlData = {
            4C0000001D1C00009E0300000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Emitente'
        ImageIndex = 3
        object lbltEmitCNPJ: TLabel
          Left = 8
          Top = 4
          Width = 25
          Height = 13
          Caption = 'CNPJ'
        end
        object lbltEmitIE: TLabel
          Left = 136
          Top = 4
          Width = 43
          Height = 13
          Caption = 'Insc.Est.'
        end
        object lbltEmitRazao: TLabel
          Left = 8
          Top = 44
          Width = 60
          Height = 13
          Caption = 'Raz'#227'o Social'
        end
        object lbltEmitFantasia: TLabel
          Left = 8
          Top = 84
          Width = 41
          Height = 13
          Caption = 'Fantasia'
        end
        object lbltEmitLogradouro: TLabel
          Left = 8
          Top = 164
          Width = 55
          Height = 13
          Caption = 'Logradouro'
        end
        object lbltEmitNumero: TLabel
          Left = 208
          Top = 164
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object lbltEmitComp: TLabel
          Left = 8
          Top = 204
          Width = 65
          Height = 13
          Caption = 'Complemento'
        end
        object lbltEmitBairro: TLabel
          Left = 136
          Top = 204
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object lbltEmitCodCidade: TLabel
          Left = 8
          Top = 244
          Width = 62
          Height = 13
          Caption = 'C'#243'd. Cidade '
        end
        object lbltEmitCidade: TLabel
          Left = 76
          Top = 244
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object lbltEmitUF: TLabel
          Left = 225
          Top = 244
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object lbltEmitCEP: TLabel
          Left = 136
          Top = 124
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object lbltEmitFone: TLabel
          Left = 8
          Top = 124
          Width = 24
          Height = 13
          Caption = 'Fone'
        end
        object lblInfoFisco: TLabel
          Left = 8
          Top = 284
          Width = 101
          Height = 13
          Caption = 'Informa'#231#227'o ao Fisco:'
        end
        object edtEmitCNPJ: TEdit
          Left = 8
          Top = 20
          Width = 123
          Height = 21
          TabOrder = 0
        end
        object edtEmitIE: TEdit
          Left = 137
          Top = 20
          Width = 123
          Height = 21
          TabOrder = 1
        end
        object edtEmitRazao: TEdit
          Left = 8
          Top = 60
          Width = 252
          Height = 21
          TabOrder = 2
        end
        object edtEmitFantasia: TEdit
          Left = 8
          Top = 100
          Width = 252
          Height = 21
          TabOrder = 3
        end
        object edtEmitFone: TEdit
          Left = 8
          Top = 140
          Width = 125
          Height = 21
          TabOrder = 4
        end
        object edtEmitCEP: TEdit
          Left = 137
          Top = 140
          Width = 123
          Height = 21
          TabOrder = 5
        end
        object edtEmitLogradouro: TEdit
          Left = 8
          Top = 180
          Width = 196
          Height = 21
          TabOrder = 6
        end
        object edtEmitNumero: TEdit
          Left = 210
          Top = 180
          Width = 50
          Height = 21
          TabOrder = 7
        end
        object edtEmitComp: TEdit
          Left = 8
          Top = 220
          Width = 123
          Height = 21
          TabOrder = 8
        end
        object edtEmitBairro: TEdit
          Left = 137
          Top = 220
          Width = 123
          Height = 21
          TabOrder = 9
        end
        object edtEmitCodCidade: TEdit
          Left = 8
          Top = 260
          Width = 61
          Height = 21
          TabOrder = 10
        end
        object edtEmitCidade: TEdit
          Left = 76
          Top = 260
          Width = 142
          Height = 21
          TabOrder = 11
        end
        object edtEmitUF: TEdit
          Left = 225
          Top = 260
          Width = 35
          Height = 21
          TabOrder = 12
        end
        object edInfoFisco: TEdit
          Left = 8
          Top = 300
          Width = 249
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 13
          Text = 
            'EMPRESA OPTANTE PELO SIMPLES DE ACORDO COM A LEI COMPLEMENTAR 12' +
            '3, DE DEZEMBRO DE 2006'
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Email'
        ImageIndex = 4
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 272
          Height = 489
          Align = alTop
          Caption = 'Email'
          TabOrder = 0
          DesignSize = (
            272
            489)
          object lbltSmtpHost: TLabel
            Left = 8
            Top = 16
            Width = 69
            Height = 13
            Caption = 'Servidor SMTP'
          end
          object lbltSmtpPort: TLabel
            Left = 206
            Top = 16
            Width = 26
            Height = 13
            Caption = 'Porta'
          end
          object lbltSmtpUser: TLabel
            Left = 8
            Top = 56
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
          end
          object lbltSmtpPass: TLabel
            Left = 137
            Top = 56
            Width = 30
            Height = 13
            Caption = 'Senha'
          end
          object lbltEmailAssunto: TLabel
            Left = 8
            Top = 96
            Width = 122
            Height = 13
            Caption = 'Assunto do email enviado'
          end
          object lblEmailMsg: TLabel
            Left = 8
            Top = 168
            Width = 93
            Height = 13
            Caption = 'Mensagem do Email'
          end
          object edtSmtpHost: TEdit
            Left = 8
            Top = 32
            Width = 193
            Height = 21
            TabOrder = 0
          end
          object edtSmtpPort: TEdit
            Left = 206
            Top = 32
            Width = 51
            Height = 21
            TabOrder = 1
          end
          object edtSmtpUser: TEdit
            Left = 8
            Top = 72
            Width = 120
            Height = 21
            TabOrder = 2
          end
          object edtSmtpPass: TEdit
            Left = 137
            Top = 72
            Width = 120
            Height = 21
            PasswordChar = '*'
            TabOrder = 3
          end
          object edtEmailAssunto: TEdit
            Left = 8
            Top = 112
            Width = 249
            Height = 21
            TabOrder = 4
          end
          object cbEmailSSL: TCheckBox
            Left = 10
            Top = 144
            Width = 167
            Height = 17
            Caption = 'SMTP exige conex'#227'o segura'
            TabOrder = 5
          end
          object mmEmailMsg: TMemo
            Left = 8
            Top = 184
            Width = 249
            Height = 295
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 6
          end
        end
      end
    end
  end
  object btnServico: TBitBtn
    Left = 1
    Top = 550
    Width = 83
    Height = 33
    Hint = 'Verificar Status do Servi'#231'o'
    Anchors = [akLeft, akBottom]
    Caption = 'Servi'#231'o'
    TabOrder = 3
    Glyph.Data = {
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
    NumGlyphs = 2
  end
  object opnDialog: TOpenDialog
    DefaultExt = '*-nfe.XML'
    Filter = 
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|To' +
      'dos os Arquivos (*.*)|*.*'
    Title = 'Selecione a NFe'
    Left = 232
    Top = 472
  end
end
