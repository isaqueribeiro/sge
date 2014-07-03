inherited frmGeCotacaoCompra: TfrmGeCotacaoCompra
  Left = 388
  Top = 210
  Width = 1132
  Height = 724
  ActiveControl = dbCodigo
  Caption = 'Controle de Cota'#231#245'es de Compra/Servi'#231'o'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 682
    Width = 1116
  end
  inherited Bevel3: TBevel
    Top = 643
    Width = 1116
  end
  inherited tlbBotoes: TToolBar
    Top = 647
    Width = 1116
    inherited btbtnLista: TBitBtn
      Visible = True
    end
    object btnFinalizarCotacao: TBitBtn
      Tag = 11
      Left = 726
      Top = 2
      Width = 120
      Height = 31
      Hint = 'Finalizar Cota'#231#227'o'
      Caption = 'Finalizar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = btnFinalizarCotacaoClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        180000000000000600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A090604830
        60483060483060483060483060483060483060483060483060483060483000FF
        0000FF0000FF0000FF009E9E9E43434343434343434343434343434343434343
        434343434343434343434343434300FF0000FF0000FF0000FF00C0A890FFF8F0
        FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A89060483000FF
        0000FF0000FF0000FF00A3A3A3F6F6F6ECECECE6E6E6DCDCDCCECECEC4C4C4B9
        B9B9B4B4B4ABABABA6A6A643434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
        C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B09060483000FF
        0000FF0000FF0000FF00A8A8A8FAFAFAA8A8A8A1A1A1E6E6E69C9C9C98989898
        9898989898989898ABABAB43434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
        FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A060483000FF
        0000FF0000FF0000FF00A8A8A8FAFAFAFAFAFAF6F6F6ECECECE6E6E6DCDCDCCE
        CECEC4C4C4B9B9B9B4B4B443434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
        B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A060483000FF
        0000FF0000FF0000FF00A8A8A8FAFAFAA6A6A6A1A1A1F6F6F69C9C9C98989898
        9898989898989898B9B9B943434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
        FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B060483000FF
        0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6ECECECE6
        E6E6DCDCDCCECECEC4C4C443434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
        FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C060483000FF
        0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6C4
        C4C4616161DCDCDCCECECE43434300FF0000FF0000FF0000FF00C0B0A0FFFFFF
        E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A060483000FF
        0000FF00A0B39A408050ACACACFFFFFFE9E9E9787878E0E0E0FAFAFAC9C9C963
        6363A8A8A8383838A1A1A143434300FF0000FF00A9A9A96B6B6BD0B0A0FFFFFF
        90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
        3070747D40784050A860AEAEAEFFFFFFA8A8A8CCCCCC636363B9B9B9636363C0
        C0C0636363BBBBBB282828313131282828767676616161898989D0B8A0FFFFFF
        E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
        B020507050886050B060B3B3B3FFFFFFE9E9E9A8A8A8DBDBDB636363CCCCCC63
        6363CECECE616161B1B1B19C9C9C8989895454547676768E8E8ED0B8A0D0B8A0
        D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
        E020A0D060987050B870B3B3B3B3B3B3B3B3B3ACACACA8A8A8DBDBDB636363DB
        DBDB5C5C5CCECECEC8C8C8C1C1C1B0B0B0A1A1A186868698989800FF0000FF00
        00FF0000FF0000FF0090A8B080E0F040587080E0F070D8F060D0F050C8F040C0
        F030B8F070A88060C08000FF0000FF0000FF0000FF0000FF00A8A8A8DBDBDB5C
        5C5CDBDBDBD4D4D4CECECEC8C8C8C1C1C1BBBBBB969696A3A3A300FF0000FF00
        00FF0000FF0000FF0000FF0090A8B080E0F080E0F080E0F070D8F060D0F060B0
        D0808890B0C0A090D0A000FF0000FF0000FF0000FF0000FF0000FF00A8A8A8DB
        DBDBDBDBDBDBDBDBD4D4D4CECECEB1B1B1898989B4B4B4BBBBBB00FF0000FF00
        00FF0000FF0000FF0000FF0000FF0090A8B090A0B090A0A08098A08090A08088
        90B9B9BDA0B8A0B0C0A000FF0000FF0000FF0000FF0000FF0000FF0000FF00A8
        A8A8A3A3A39E9E9E989898939393898989BABABAAEAEAEB4B4B400FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
    end
    object btnAutorizarCotacao: TBitBtn
      Tag = 12
      Left = 846
      Top = 2
      Width = 120
      Height = 31
      Hint = 'Autorizar/Encerrar Cota'#231#227'o'
      Caption = 'Autorizar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnAutorizarCotacaoClick
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
    object btnCancelarCotacao: TBitBtn
      Tag = 13
      Left = 966
      Top = 2
      Width = 120
      Height = 31
      Hint = 'Cancelar Cota'#231#227'o Selecionada'
      Caption = 'Cancelar Cot.'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnCancelarCotacaoClick
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
    object Bevel12: TBevel
      Left = 1086
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
  end
  inherited pgcGuias: TPageControl
    Width = 1116
    Height = 643
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 540
        Width = 1108
      end
      inherited dbgDados: TDBGrid
        Width = 1108
        Height = 540
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMISSAO_DATA'
            Title.Caption = 'Emiss'#227'o'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALIDADE'
            Title.Caption = 'Validade'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Situa'#231#227'o'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_RESUMO'
            Width = 330
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITENS'
            Title.Caption = 'Itens'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_REF_TOTAL'
            Title.Caption = 'Total Ref. (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMISSAO_USUARIO'
            Title.Caption = 'Emissor / Solicitante'
            Width = 130
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 544
        Width = 1108
        Height = 70
        object lblCotacaoAberta: TLabel [0]
          Left = 2
          Top = 4
          Width = 110
          Height = 13
          Caption = '* Cota'#231#245'es Abertas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCotacaoCancelada: TLabel [1]
          Left = 2
          Top = 24
          Width = 129
          Height = 13
          Caption = '* Cota'#231#245'es Canceladas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCotacaoEmEdicao: TLabel [2]
          Left = 2
          Top = 44
          Width = 121
          Height = 13
          Caption = '* Cota'#231#245'es Em Edi'#231#227'o'
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        inherited grpBxFiltro: TGroupBox
          Left = 424
          Width = 680
          Height = 62
          TabOrder = 1
          DesignSize = (
            680
            62)
          inherited lbltFiltrar: TLabel
            Left = 294
            Width = 49
            Caption = 'Cota'#231#227'o:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 635
            Height = 35
          end
          object lblData: TLabel [2]
            Left = 14
            Top = 27
            Width = 49
            Height = 13
            Caption = 'Emiss'#227'o:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 352
            Width = 279
            TabOrder = 2
          end
          object e1Data: TDateEdit
            Left = 72
            Top = 23
            Width = 101
            Height = 21
            GlyphKind = gkCustom
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
            NumGlyphs = 2
            TabOrder = 0
            Text = '01/01/2012'
          end
          object e2Data: TDateEdit
            Left = 184
            Top = 23
            Width = 104
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
            Text = '01/01/2012'
          end
        end
        object RdgStatusCotacao: TRadioGroup
          Left = 198
          Top = 4
          Width = 226
          Height = 62
          Align = alRight
          Caption = '&Status Cota'#231#227'o'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            '(Todas)'
            'Em Edi'#231#227'o'
            'Aberta'
            'Em Cota'#231#227'o'
            'Aut. / Encerrada'
            'Cancelada')
          TabOrder = 0
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 309
        Width = 1108
      end
      object Bevel6: TBevel [1]
        Left = 0
        Top = 444
        Width = 1108
        Height = 4
        Align = alBottom
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1108
        Height = 193
        inherited lblCodigo: TLabel
          Width = 71
          Caption = 'No. Controle:'
        end
        object lblDataHora: TLabel [1]
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
        object lblEmpresa: TLabel [2]
          Left = 240
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblSituacao: TLabel [3]
          Left = 640
          Top = 64
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbSituacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDataEmissao: TLabel [4]
          Left = 384
          Top = 64
          Width = 68
          Height = 13
          Caption = 'Data Emiss'#227'o:'
          FocusControl = dbDataEmissao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUsuario: TLabel [5]
          Left = 792
          Top = 64
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
        object lblAutorizador: TLabel [6]
          Left = 944
          Top = 64
          Width = 70
          Height = 13
          Caption = 'Autorizador:'
          FocusControl = dbAutorizador
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNumero: TLabel [7]
          Left = 240
          Top = 64
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = dbNumero
        end
        object lblTipo: TLabel [8]
          Left = 16
          Top = 64
          Width = 24
          Height = 13
          Caption = 'Tipo:'
          FocusControl = dbTipo
        end
        object lblDataValidade: TLabel [9]
          Left = 512
          Top = 64
          Width = 70
          Height = 13
          Caption = 'Data Validade:'
          FocusControl = dbDataValidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNomeContato: TLabel [10]
          Left = 16
          Top = 104
          Width = 120
          Height = 13
          Caption = 'Nome Contato (Interno):'
          FocusControl = dbNomeContato
        end
        object lblDescricao: TLabel [11]
          Left = 640
          Top = 24
          Width = 91
          Height = 13
          Caption = 'Descri'#231#227'o Resumo:'
          FocusControl = dbDescricao
        end
        inherited dbCodigo: TDBEdit
          Width = 89
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbDataHora: TDBEdit
          Left = 112
          Top = 40
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'INSERCAO_DATA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 240
          Top = 40
          Width = 393
          Height = 21
          DataField = 'EMPRESA'
          DataSource = DtSrcTabela
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
          TabOrder = 2
        end
        object dbSituacao: TDBEdit
          Left = 640
          Top = 80
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'STATUS'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbDataEmissao: TDBDateEdit
          Left = 384
          Top = 80
          Width = 121
          Height = 21
          DataField = 'EMISSAO_DATA'
          DataSource = DtSrcTabela
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 6
          OnExit = ControlEditExit
        end
        object dbUsuario: TDBEdit
          Left = 792
          Top = 80
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'EMISSAO_USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbAutorizador: TDBEdit
          Left = 944
          Top = 80
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'AUTORIZADA_USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbNumero: TDBEdit
          Left = 240
          Top = 80
          Width = 137
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbTipo: TDBLookupComboBox
          Left = 16
          Top = 80
          Width = 217
          Height = 21
          DataField = 'TIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsTipoCotacao
          ParentFont = False
          TabOrder = 4
        end
        object dbDataValidade: TDBDateEdit
          Left = 512
          Top = 80
          Width = 121
          Height = 21
          DataField = 'VALIDADE'
          DataSource = DtSrcTabela
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 10
        end
        object dbNomeContato: TDBEdit
          Left = 16
          Top = 120
          Width = 361
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME_CONTATO_INT'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object PgcTextoCotacao: TPageControl
          Left = 384
          Top = 104
          Width = 705
          Height = 81
          ActivePage = TbsCotacaoCancelado
          Style = tsFlatButtons
          TabOrder = 12
          object TbsCotacaoMotivo: TTabSheet
            Caption = 'Motivo do pedido de cota'#231#227'o'
            object dbMotivo: TDBMemo
              Left = 0
              Top = 0
              Width = 697
              Height = 50
              Align = alClient
              DataField = 'MOVITO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object TbsCotacaoObservacao: TTabSheet
            Caption = 'Observa'#231#245'es Gerais'
            ImageIndex = 1
            object dbObservacao: TDBMemo
              Left = 0
              Top = 0
              Width = 697
              Height = 50
              Align = alClient
              DataField = 'OBSERVACAO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object TbsCotacaoCancelado: TTabSheet
            Caption = 'Motivo do Cancelamento'
            ImageIndex = 2
            object dbMovitoCancelamento: TDBMemo
              Left = 0
              Top = 0
              Width = 697
              Height = 50
              TabStop = False
              Align = alClient
              DataField = 'CANCELADO_MOTIVO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object dbDescricao: TDBEdit
          Left = 640
          Top = 40
          Width = 449
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO_RESUMO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 448
        Width = 1108
        Height = 166
        ActivePage = tbsFornecedor
        Align = alBottom
        TabOrder = 3
        object tbsFormaPagto: TTabSheet
          Caption = 'Dados Consolidados'
          ImageIndex = 1
          object GrpBxPagamento: TGroupBox
            Left = 0
            Top = 0
            Width = 1100
            Height = 73
            Align = alTop
            Caption = 'Resultado do Processamento'
            TabOrder = 0
            object lblNumeroFornecedor: TLabel
              Left = 16
              Top = 24
              Width = 94
              Height = 13
              Caption = 'Nro. Fornecedores:'
              FocusControl = dbNumeroFornecedor
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTotalReferencia: TLabel
              Left = 128
              Top = 24
              Width = 107
              Height = 13
              Caption = 'Total Refer'#234'ncia (R$):'
              FocusControl = dbTotalReferencia
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTotalLiquidoMax: TLabel
              Left = 264
              Top = 24
              Width = 91
              Height = 13
              Caption = 'Total M'#225'ximo (R$):'
              FocusControl = dbTotalLiquidoMax
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTotalLiquidoMin: TLabel
              Left = 400
              Top = 24
              Width = 104
              Height = 13
              Caption = 'Total M'#237'nimo (R$):'
              FocusControl = dbTotalLiquidoMin
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblTotalLiquidoMedio: TLabel
              Left = 536
              Top = 24
              Width = 83
              Height = 13
              Caption = 'Total M'#233'dio (R$):'
              FocusControl = dbTotalLiquidoMedio
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbNumeroFornecedor: TDBEdit
              Left = 16
              Top = 40
              Width = 105
              Height = 21
              Color = clWhite
              DataField = 'NUMERO_MINIMO_FORNECEDOR'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbTotalReferencia: TDBEdit
              Left = 128
              Top = 40
              Width = 129
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'VALOR_REF_TOTAL'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnExit = ControlEditExit
            end
            object dbTotalLiquidoMax: TDBEdit
              Left = 264
              Top = 40
              Width = 129
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'VALOR_MAX_TOTAL'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              OnExit = ControlEditExit
            end
            object dbTotalLiquidoMin: TDBEdit
              Left = 400
              Top = 40
              Width = 129
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'VALOR_MIN_TOTAL'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              OnExit = ControlEditExit
            end
            object dbTotalLiquidoMedio: TDBEdit
              Left = 536
              Top = 40
              Width = 129
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'VALOR_MEDIA_TOTAL'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              OnExit = ControlEditExit
            end
          end
          object pnlRetiradaEntrega: TPanel
            Left = 0
            Top = 73
            Width = 1100
            Height = 65
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblEnderecoEntrega: TLabel
              Left = 0
              Top = 4
              Width = 160
              Height = 13
              Align = alTop
              Caption = 'Endere'#231'o de Entrega/Realiza'#231#227'o:'
              FocusControl = dbEnderecoEntrega
              Visible = False
            end
            object Bevel5: TBevel
              Left = 0
              Top = 0
              Width = 1100
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object Bevel9: TBevel
              Left = 0
              Top = 17
              Width = 1100
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object dbEnderecoEntrega: TDBMemo
              Left = 0
              Top = 21
              Width = 1100
              Height = 44
              Align = alClient
              DataSource = DtSrcTabela
              ScrollBars = ssVertical
              TabOrder = 0
              Visible = False
            end
          end
        end
        object tbsFornecedor: TTabSheet
          Caption = 'Fornecedores'
          ImageIndex = 2
          object Bevel11: TBevel
            Left = 0
            Top = 0
            Width = 4
            Height = 138
            Align = alLeft
            Shape = bsSpacer
          end
          object Bevel13: TBevel
            Left = 74
            Top = 0
            Width = 4
            Height = 138
            Align = alLeft
            Shape = bsSpacer
          end
          object PnlFornecedor: TPanel
            Tag = 14
            Left = 4
            Top = 0
            Width = 70
            Height = 138
            Hint = 'Manter / Processar Dados  de Fornecedores'
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              70
              138)
            object BtnFornecedorInserir: TBitBtn
              Left = 0
              Top = 1
              Width = 70
              Height = 25
              Hint = 'Inserir Fornecedor'
              Caption = 'Inserir'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = BtnFornecedorInserirClick
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000000000000000000000000000000000000000FF0000FF
                0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                B0A0906048306048306048306048306048306048306048306048306048306048
                300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
                43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
                B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
                300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
                9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
                300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
                E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
                300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
                F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
                300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
                F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
                300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
                F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
                300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
                C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
                300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
                300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
                D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
                300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
                D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
                C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
                E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
                FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
                E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
                FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
                0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
              NumGlyphs = 2
            end
            object BtnFornecedorEditar: TBitBtn
              Left = 0
              Top = 25
              Width = 70
              Height = 25
              Hint = 'Editar Fornecedor'
              Caption = 'Editar'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BtnFornecedorEditarClick
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                180000000000000600000000000000000000000000000000000000FF0000FF00
                00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
                60483060483060483060483060483060483060483060483060483070504000FF
                0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
                43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
                E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
                0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
                C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
                E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
                0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
                AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
                0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
                5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
                0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
                FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
                0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
                B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
                B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
                9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
                10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
                D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
                F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
                B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
                8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
                FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
                E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
                A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
                F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
                B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
                8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
                00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
                B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
                00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
                CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
              NumGlyphs = 2
            end
            object BtnFornecedorExcluir: TBitBtn
              Left = 0
              Top = 49
              Width = 70
              Height = 25
              Hint = 'Excluir Fornecedor'
              Caption = 'Excluir'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFC1C52030902030902030802028
                70C6A797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFC3C3C34B4B4B4B4B4B4646463C3C3CA5A5A5FF00FFFF00FFFF00FFFF00FF
                B0A0906048306048306048307058406050601038C02050D01038C01030B01030
                A0102070C5A392FF00FFFF00FFFF00FF9C9C9C43434343434343434353535356
                56565C5C5C7171715C5C5C5353534E4E4E363636A1A1A1FF00FFFF00FFFF00FF
                B0A090FFFFFFD0C8C0D0C8C0D0C8C01040E04068E03058E00038E00038D01030
                C01030A0202870FF00FFFF00FFFF00FF9C9C9CFFFFFFC6C6C6C6C6C6C6C6C66B
                6B6B8888887C7C7C6464646060605858584E4E4E3C3C3CFF00FFFF00FFFF00FF
                B0A090FFFFFFFFFFFFFFF8FFFFF0F03068F0F0F8FFFFF8FFFFF8FFFFF8FFFFF8
                FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFAFAFAF1F1F18B
                8B8BF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                B0A090FFFFFFFFFFFFFFFFFFFFF8F03068F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8
                FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F68B
                8B8BFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                B0A090FFFFFFFFFFFFFFFFFFFFFFFF3060FF80A0F06080F04060E02058E00038
                D01038C02038A0FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF8A
                8A8AB4B4B49E9E9E8383837B7B7B6060605C5C5C545454FF00FFFF00FFFF00FF
                C0A890FFFFFFFFFFFFFFFFFFFFFFFFD0D8F03068F090A8F06080F05078E02048
                D02038B0C8ACAAFF00FFFF00FFFF00FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDE
                DEDE8B8B8BBBBBBB9E9E9E9393936C6C6C595959AEAEAEFF00FFFF00FFFF00FF
                C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D8F03060F03060F03060E02048
                C0C9B0AFFF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFDEDEDE868686868686818181686868B2B2B2FF00FFFF00FFFF00FFFF00FF
                C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0F0F0D0C8C08068
                50FF00FFFF00FFFF00FFFF00FFFF00FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFAFAFAF0F0F0F0F0F0C6C6C6636363FF00FFFF00FFFF00FFFF00FFFF00FF
                D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0D0C8C06048
                30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF6F6F6F0F0F0C6C6C6434343FF00FFFF00FFFF00FFFF00FFFF00FF
                D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0C0A8A06048
                30FF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFA8A8A8A8A8A8434343FF00FFFF00FFFF00FFFF00FFFF00FF
                D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF9C9C9C434343434343434343FF00FFFF00FFFF00FFFF00FFFF00FF
                D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DFBD
                A7FF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFA3A3A3C6C6C6434343B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FF
                E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0BEAAFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFA8A8A8434343BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C0ADFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                BCBCB8B8B8AEAEAEBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
            end
            object BtnFornecedorOpcoes: TBitBtn
              Left = 0
              Top = 113
              Width = 70
              Height = 25
              Hint = 'Gerar Arquivo XLS (Planilha em Excel)'
              Anchors = [akLeft, akBottom]
              Caption = 'Mais...'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = BtnFornecedorOpcoesClick
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A090604830
                604830604830604830604830604830604830604830604830604830604830FFFF
                FFFFFFFFFFFFFFFFFFFF8F9EAD33435733435733435733435733435733435733
                4357334357334357334357334357FFFFFFFFFFFFFFFFFFFFFFFFC0A890FFF8F0
                FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A890604830FFFF
                FFFFFFFFFFFFFFFFFFFF95A3B2F4F6F7E8ECEFE1E6EAD6DDE3C5CED6BBC5CFAE
                BAC6A9B5C19DABB999A7B5334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
                C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B090604830FFFF
                FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFA9AA8B692A1B0E1E6EA8E9DAC8998A889
                98A88998A88998A89DABB9334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
                FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0604830FFFF
                FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFAF9FAFAF4F6F7E8ECEFE1E6EAD6DDE3C5
                CED6BBC5CFAEBAC6A9B5C1334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
                B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A0604830FFFF
                FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFA98A6B492A1B0F4F6F78E9DAC8998A889
                98A88998A88998A8AEBAC6334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
                FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0604830FFFF
                FFFFFFFFFFFFFFFFFFFFA0ADBAF9FAFAF9FAFAF9FAFAF9FAFAF4F6F7E8ECEFE1
                E6EAD6DDE3C5CED6BBC5CF334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
                FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C0604830FFFF
                FFFFFFFFFFFFFFFFFFFFA0ADBAF9FAFAF9FAFAF9FAFAF9FAFAF9FAFAF4F6F7B9
                C4CE4F6175D6DDE3C5CED6334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFFF
                E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A0604830FFFF
                FFFFFFFFA0B39A408050A0ADBAFFFFFFE4E9ED66778ADAE0E5F9FAFABFC9D250
                627698A6B428374A92A1B0334357FFFFFFFFFFFF9BA9B7586A7ED0B0A0FFFFFF
                90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
                3070747D40784050A860A1AEBBFFFFFF99A7B5C1CBD4506276ADB9C5506276B3
                BEC9506276ADB9C51A27382331441A27386576894E607477889AD0B8A0FFFFFF
                E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
                B020507050886050B060A6B3C0FFFFFFE4E9ED99A7B5D2D9E0506276C1CBD450
                6276C3CCD54F6175A2AFBC8C9BAB77889A4354686475887D8D9ED0B8A0D0B8A0
                D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
                E020A0D060987050B870A6B3C0A6B3C0A6B3C0A0ADBA99A7B5D2D9E0506276D2
                D9E04B5C70C3CCD5BCC6D0B4BFCAA0ADBA909FAE7485978696A6FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF90A8B080E0F040587080E0F070D8F060D0F050C8F040C0
                F030B8F070A88060C080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5D2D9E04B
                5C70D2D9E0CBD3DBC3CCD5BCC6D0B4BFCAADB9C58595A592A1B0FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF90A8B080E0F080E0F080E0F070D8F060D0F060B0
                D0808890B0C0A090D0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5D2
                D9E0D2D9E0D2D9E0CBD3DBC3CCD5A3B0BD78899BA7B4C0AEBAC6FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B090A0B090A0A08098A08090A08088
                90B9B9BDA0B8A0B0C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
                A7B593A2B18F9EAD8797A78292A378899BAEBAC6A1AEBBA7B4C0FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              NumGlyphs = 2
            end
          end
          object dbgFornecedor: TDBGrid
            Left = 78
            Top = 0
            Width = 1022
            Height = 138
            TabStop = False
            Align = alClient
            DataSource = dtsFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgDadosDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'FORNECEDOR'
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEFORN'
                Title.Caption = 'Nome'
                Width = 280
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNPJ'
                Title.Caption = 'CPF/CNPJ'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FORMA_PAGTO_DESC'
                Title.Caption = 'Forma de Pagamento'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONDICAP_PAGTO_DESC'
                Title.Caption = 'Condi'#231#227'o de Pagamento'
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITENS'
                Title.Caption = 'Itens'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL_LIQUIDO'
                Title.Caption = 'Valor (R$)'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VENCEDOR'
                Title.Alignment = taCenter
                Title.Caption = 'V'
                Width = 30
                Visible = True
              end>
          end
        end
        object tbsEventoLOG: TTabSheet
          Caption = 'LOG de Eventos'
          ImageIndex = 1
          object dbEventoLOG: TDBMemo
            Left = 0
            Top = 0
            Width = 1100
            Height = 138
            TabStop = False
            Align = alClient
            DataField = 'LOG_EVENTO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Lucida Console'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object GrpBxDadosProduto: TGroupBox
        Left = 0
        Top = 193
        Width = 1108
        Height = 116
        Align = alTop
        Caption = 'Dados do produto/servi'#231'o'
        TabOrder = 1
        object lblProduto: TLabel
          Left = 88
          Top = 24
          Width = 81
          Height = 13
          Caption = 'Produto/Servi'#231'o:'
          FocusControl = dbProduto
        end
        object lblQuantidade: TLabel
          Left = 88
          Top = 64
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
          FocusControl = dbQuantidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUnidade: TLabel
          Left = 656
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Und.:'
          FocusControl = dbUnidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Bevel7: TBevel
          Left = 2
          Top = 15
          Width = 4
          Height = 99
          Align = alLeft
          Shape = bsSpacer
        end
        object lblValorTotal: TLabel
          Left = 312
          Top = 64
          Width = 103
          Height = 13
          Caption = 'Valor Total Ref. (R$):'
          FocusControl = dbValorTotal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorUn: TLabel
          Left = 184
          Top = 64
          Width = 96
          Height = 13
          Caption = 'Valor Un. Ref. (R$):'
          FocusControl = dbValorUn
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbProduto: TRxDBComboEdit
          Left = 88
          Top = 40
          Width = 89
          Height = 21
          ButtonHint = 'Pesquisar Produto (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataField = 'PRODUTO'
          DataSource = DtSrcTabelaItens
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
          ShowHint = True
          TabOrder = 1
          OnButtonClick = dbProdutoButtonClick
          OnExit = ControlEditExit
        end
        object dbProdutoNome: TDBEdit
          Left = 184
          Top = 40
          Width = 465
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DESCRI_APRESENTACAO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbQuantidade: TDBEdit
          Left = 88
          Top = 80
          Width = 89
          Height = 21
          Color = clWhite
          DataField = 'QUANTIDADE'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbUnidade: TDBEdit
          Left = 656
          Top = 40
          Width = 57
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'UNP_SIGLA'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object pnlBotoesProduto: TPanel
          Left = 6
          Top = 15
          Width = 70
          Height = 99
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnProdutoInserir: TBitBtn
            Left = 0
            Top = 1
            Width = 70
            Height = 25
            Hint = 'Inserir Produto'
            Caption = 'Inserir'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnProdutoInserirClick
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000000000000000000000000000000000000000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              B0A0906048306048306048306048306048306048306048306048306048306048
              300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
              43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
              E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
              F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
              F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
              C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
              300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
              F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
              C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
              300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
              C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
              300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
              D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
              300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
              D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
              300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
              D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
              300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
              D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
              C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
              E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
              FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
              E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
              FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
              BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
            NumGlyphs = 2
          end
          object btnProdutoEditar: TBitBtn
            Left = 0
            Top = 25
            Width = 70
            Height = 25
            Hint = 'Editar Produto'
            Caption = 'Editar'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnProdutoEditarClick
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              180000000000000600000000000000000000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
              60483060483060483060483060483060483060483060483060483070504000FF
              0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
              43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
              E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
              0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
              C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
              E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
              0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
              AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
              5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
              FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
              B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
              B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
              9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
              10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
              D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
              F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
              B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
              8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
              FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
              E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
              A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
              F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
              B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
              8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
              B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
              CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
            NumGlyphs = 2
          end
          object btnProdutoExcluir: TBitBtn
            Left = 0
            Top = 49
            Width = 70
            Height = 25
            Hint = 'Excluir Produto'
            Caption = 'Excluir'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnProdutoExcluirClick
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFC1C52030902030902030802028
              70C6A797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFC3C3C34B4B4B4B4B4B4646463C3C3CA5A5A5FF00FFFF00FFFF00FFFF00FF
              B0A0906048306048306048307058406050601038C02050D01038C01030B01030
              A0102070C5A392FF00FFFF00FFFF00FF9C9C9C43434343434343434353535356
              56565C5C5C7171715C5C5C5353534E4E4E363636A1A1A1FF00FFFF00FFFF00FF
              B0A090FFFFFFD0C8C0D0C8C0D0C8C01040E04068E03058E00038E00038D01030
              C01030A0202870FF00FFFF00FFFF00FF9C9C9CFFFFFFC6C6C6C6C6C6C6C6C66B
              6B6B8888887C7C7C6464646060605858584E4E4E3C3C3CFF00FFFF00FFFF00FF
              B0A090FFFFFFFFFFFFFFF8FFFFF0F03068F0F0F8FFFFF8FFFFF8FFFFF8FFFFF8
              FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFAFAFAF1F1F18B
              8B8BF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
              B0A090FFFFFFFFFFFFFFFFFFFFF8F03068F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8
              FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F68B
              8B8BFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
              B0A090FFFFFFFFFFFFFFFFFFFFFFFF3060FF80A0F06080F04060E02058E00038
              D01038C02038A0FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF8A
              8A8AB4B4B49E9E9E8383837B7B7B6060605C5C5C545454FF00FFFF00FFFF00FF
              C0A890FFFFFFFFFFFFFFFFFFFFFFFFD0D8F03068F090A8F06080F05078E02048
              D02038B0C8ACAAFF00FFFF00FFFF00FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDE
              DEDE8B8B8BBBBBBB9E9E9E9393936C6C6C595959AEAEAEFF00FFFF00FFFF00FF
              C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D8F03060F03060F03060E02048
              C0C9B0AFFF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFDEDEDE868686868686818181686868B2B2B2FF00FFFF00FFFF00FFFF00FF
              C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0F0F0D0C8C08068
              50FF00FFFF00FFFF00FFFF00FFFF00FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFAFAFAF0F0F0F0F0F0C6C6C6636363FF00FFFF00FFFF00FFFF00FFFF00FF
              D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0D0C8C06048
              30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF6F6F6F0F0F0C6C6C6434343FF00FFFF00FFFF00FFFF00FFFF00FF
              D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0C0A8A06048
              30FF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFA8A8A8A8A8A8434343FF00FFFF00FFFF00FFFF00FFFF00FF
              D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
              30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF9C9C9C434343434343434343FF00FFFF00FFFF00FFFF00FFFF00FF
              D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DFBD
              A7FF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA3A3A3C6C6C6434343B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FF
              E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0BEAAFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA8A8A8434343BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C0ADFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
              BCBCB8B8B8AEAEAEBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
          end
          object btnProdutoSalvar: TBitBtn
            Left = 0
            Top = 73
            Width = 70
            Height = 25
            Hint = 'Salvar Produto'
            Caption = 'Salvar'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btnProdutoSalvarClick
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
        end
        object dbValorTotal: TDBEdit
          Left = 312
          Top = 80
          Width = 121
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALOR_TOTAL_REF'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          OnExit = ControlEditExit
        end
        object dbValorUn: TDBEdit
          Left = 184
          Top = 80
          Width = 121
          Height = 21
          Color = clWhite
          DataField = 'VALOR_UNITARIO_REF'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object PnlDadosProdutoConsolidado: TPanel
          Left = 720
          Top = 15
          Width = 386
          Height = 99
          Align = alRight
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 7
          object Bevel10: TBevel
            Left = 4
            Top = 4
            Width = 4
            Height = 91
            Align = alLeft
            Shape = bsLeftLine
          end
          object lblValorUnMax: TLabel
            Left = 16
            Top = 8
            Width = 99
            Height = 13
            Caption = 'Valor Un. Max. (R$):'
            FocusControl = dbValorUnMax
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblValorTotalMax: TLabel
            Left = 144
            Top = 8
            Width = 106
            Height = 13
            Caption = 'Valor Total Max. (R$):'
            FocusControl = dbValorTotalMax
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblValorUnMin: TLabel
            Left = 16
            Top = 48
            Width = 107
            Height = 13
            Caption = 'Valor Un. Min. (R$):'
            FocusControl = dbValorUnMin
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblValorTotalMin: TLabel
            Left = 144
            Top = 48
            Width = 118
            Height = 13
            Caption = 'Valor Total Min. (R$):'
            FocusControl = dbValorTotalMin
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbValorUnMax: TDBEdit
            Left = 16
            Top = 24
            Width = 121
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'VALOR_UNITARIO_MAX'
            DataSource = DtSrcTabelaItens
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnExit = ControlEditExit
          end
          object dbValorTotalMax: TDBEdit
            Left = 144
            Top = 24
            Width = 121
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'VALOR_TOTAL_MAX'
            DataSource = DtSrcTabelaItens
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnExit = ControlEditExit
          end
          object dbValorUnMin: TDBEdit
            Left = 16
            Top = 64
            Width = 121
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'VALOR_UNITARIO_MIN'
            DataSource = DtSrcTabelaItens
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            OnExit = ControlEditExit
          end
          object dbValorTotalMin: TDBEdit
            Left = 144
            Top = 64
            Width = 121
            Height = 21
            TabStop = False
            Color = clMoneyGreen
            DataField = 'VALOR_TOTAL_MIN'
            DataSource = DtSrcTabelaItens
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            OnExit = ControlEditExit
          end
        end
      end
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 313
        Width = 1108
        Height = 131
        TabStop = False
        Align = alClient
        DataSource = DtSrcTabelaItens
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgDadosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'SEQ'
            Title.Alignment = taCenter
            Title.Caption = '#'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTO'
            Title.Caption = 'Codigo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            Title.Caption = 'Descri'#231#227'o + Apresenta'#231#227'o'
            Width = 450
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Quantidade'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Title.Caption = 'Und.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_UNITARIO_REF'
            Title.Caption = 'Valor Un. (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL_REF'
            Title.Caption = 'Valor Total (R$)'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    AfterCancel = IbDtstTabelaAfterCancel
    AfterScroll = IbDtstTabelaAfterScroll
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codigo'
      '  , c.empresa'
      '  , c.numero'
      '  , c.tipo'
      '  , c.descricao_resumo'
      '  , c.nome_contato_int'
      '  , c.insercao_data'
      '  , c.emissao_data'
      '  , c.emissao_usuario'
      '  , c.validade'
      '  , c.competencia'
      '  , c.movito'
      '  , c.observacao'
      '  , c.log_evento'
      '  , c.status'
      '  , c.numero_minimo_fornecedor'
      '  , c.autorizada_data'
      '  , c.autorizada_usuario'
      '  , c.encerrada_data'
      '  , c.encerrada_usuario'
      '  , c.cancelado_data'
      '  , c.cancelado_usuario'
      '  , c.cancelado_motivo'
      '  , c.valor_ref_total'
      '  , c.valor_max_bruto'
      '  , c.valor_max_desconto'
      '  , c.valor_max_total'
      '  , c.valor_min_bruto'
      '  , c.valor_min_desconto'
      '  , c.valor_min_total'
      '  , c.valor_media_bruto'
      '  , c.valor_media_desconto'
      '  , c.valor_media_total'
      
        '  , (Select count(x.seq) from TBCOTACAO_COMPRAITEM x WHERE x.ano' +
        ' = c.ano and x.codigo = c.codigo and x.empresa = c.empresa) as i' +
        'tens'
      'from TBCOTACAO_COMPRA c')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_COTACAO_COMPRA_2014'
    Left = 680
    Top = 368
    object IbDtstTabelaANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBCOTACAO_COMPRA"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IbDtstTabelaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TBCOTACAO_COMPRA"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = '"TBCOTACAO_COMPRA"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object IbDtstTabelaNUMERO: TIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = '"TBCOTACAO_COMPRA"."NUMERO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"TBCOTACAO_COMPRA"."TIPO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnGetText = IbDtstTabelaTIPOGetText
    end
    object IbDtstTabelaDESCRICAO_RESUMO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o resumo'
      FieldName = 'DESCRICAO_RESUMO'
      Origin = '"TBCOTACAO_COMPRA"."DESCRICAO_RESUMO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object IbDtstTabelaNOME_CONTATO_INT: TIBStringField
      FieldName = 'NOME_CONTATO_INT'
      Origin = '"TBCOTACAO_COMPRA"."NOME_CONTATO_INT"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaINSERCAO_DATA: TDateTimeField
      FieldName = 'INSERCAO_DATA'
      Origin = '"TBCOTACAO_COMPRA"."INSERCAO_DATA"'
      ProviderFlags = [pfInUpdate]
      OnGetText = IbDtstTabelaINSERCAO_DATAGetText
    end
    object IbDtstTabelaEMISSAO_DATA: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'EMISSAO_DATA'
      Origin = '"TBCOTACAO_COMPRA"."EMISSAO_DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaEMISSAO_USUARIO: TIBStringField
      FieldName = 'EMISSAO_USUARIO'
      Origin = '"TBCOTACAO_COMPRA"."EMISSAO_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object IbDtstTabelaVALIDADE: TDateField
      DisplayLabel = 'Data Validade'
      FieldName = 'VALIDADE'
      Origin = '"TBCOTACAO_COMPRA"."VALIDADE"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaCOMPETENCIA: TIntegerField
      FieldName = 'COMPETENCIA'
      Origin = '"TBCOTACAO_COMPRA"."COMPETENCIA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaMOVITO: TMemoField
      FieldName = 'MOVITO'
      Origin = '"TBCOTACAO_COMPRA"."MOVITO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = '"TBCOTACAO_COMPRA"."OBSERVACAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaLOG_EVENTO: TMemoField
      FieldName = 'LOG_EVENTO'
      Origin = '"TBCOTACAO_COMPRA"."LOG_EVENTO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'STATUS'
      Origin = '"TBCOTACAO_COMPRA"."STATUS"'
      ProviderFlags = [pfInUpdate]
      OnGetText = IbDtstTabelaSTATUSGetText
    end
    object IbDtstTabelaNUMERO_MINIMO_FORNECEDOR: TSmallintField
      DisplayLabel = 'N'#250'mero de Fornecedores (M'#237'nimo)'
      FieldName = 'NUMERO_MINIMO_FORNECEDOR'
      Origin = '"TBCOTACAO_COMPRA"."NUMERO_MINIMO_FORNECEDOR"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '###00'
    end
    object IbDtstTabelaAUTORIZADA_DATA: TDateField
      FieldName = 'AUTORIZADA_DATA'
      Origin = '"TBCOTACAO_COMPRA"."AUTORIZADA_DATA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaAUTORIZADA_USUARIO: TIBStringField
      FieldName = 'AUTORIZADA_USUARIO'
      Origin = '"TBCOTACAO_COMPRA"."AUTORIZADA_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object IbDtstTabelaENCERRADA_DATA: TDateField
      FieldName = 'ENCERRADA_DATA'
      Origin = '"TBCOTACAO_COMPRA"."ENCERRADA_DATA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaENCERRADA_USUARIO: TIBStringField
      FieldName = 'ENCERRADA_USUARIO'
      Origin = '"TBCOTACAO_COMPRA"."ENCERRADA_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object IbDtstTabelaCANCELADO_DATA: TDateField
      FieldName = 'CANCELADO_DATA'
      Origin = '"TBCOTACAO_COMPRA"."CANCELADO_DATA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCANCELADO_USUARIO: TIBStringField
      FieldName = 'CANCELADO_USUARIO'
      Origin = '"TBCOTACAO_COMPRA"."CANCELADO_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object IbDtstTabelaCANCELADO_MOTIVO: TMemoField
      FieldName = 'CANCELADO_MOTIVO'
      Origin = '"TBCOTACAO_COMPRA"."CANCELADO_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaVALOR_REF_TOTAL: TIBBCDField
      FieldName = 'VALOR_REF_TOTAL'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_REF_TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_MAX_BRUTO: TIBBCDField
      FieldName = 'VALOR_MAX_BRUTO'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_MAX_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_MAX_DESCONTO: TIBBCDField
      FieldName = 'VALOR_MAX_DESCONTO'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_MAX_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_MAX_TOTAL: TIBBCDField
      FieldName = 'VALOR_MAX_TOTAL'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_MAX_TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_MIN_BRUTO: TIBBCDField
      FieldName = 'VALOR_MIN_BRUTO'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_MIN_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_MIN_DESCONTO: TIBBCDField
      FieldName = 'VALOR_MIN_DESCONTO'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_MIN_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_MIN_TOTAL: TIBBCDField
      FieldName = 'VALOR_MIN_TOTAL'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_MIN_TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_MEDIA_BRUTO: TIBBCDField
      FieldName = 'VALOR_MEDIA_BRUTO'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_MEDIA_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_MEDIA_DESCONTO: TIBBCDField
      FieldName = 'VALOR_MEDIA_DESCONTO'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_MEDIA_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_MEDIA_TOTAL: TIBBCDField
      FieldName = 'VALOR_MEDIA_TOTAL'
      Origin = '"TBCOTACAO_COMPRA"."VALOR_MEDIA_TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaITENS: TIntegerField
      FieldName = 'ITENS'
      ProviderFlags = []
      DisplayFormat = ',0'
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 744
    Top = 368
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODIGO,'
      '  EMPRESA,'
      '  NUMERO,'
      '  TIPO,'
      '  DESCRICAO_RESUMO,'
      '  NOME_CONTATO_INT,'
      '  INSERCAO_DATA,'
      '  EMISSAO_DATA,'
      '  EMISSAO_USUARIO,'
      '  VALIDADE,'
      '  COMPETENCIA,'
      '  MOVITO,'
      '  OBSERVACAO,'
      '  LOG_EVENTO,'
      '  STATUS,'
      '  NUMERO_MINIMO_FORNECEDOR,'
      '  AUTORIZADA_DATA,'
      '  AUTORIZADA_USUARIO,'
      '  ENCERRADA_DATA,'
      '  ENCERRADA_USUARIO,'
      '  CANCELADO_DATA,'
      '  CANCELADO_USUARIO,'
      '  CANCELADO_MOTIVO,'
      '  VALOR_REF_TOTAL,'
      '  VALOR_MAX_BRUTO,'
      '  VALOR_MAX_DESCONTO,'
      '  VALOR_MAX_TOTAL,'
      '  VALOR_MIN_BRUTO,'
      '  VALOR_MIN_DESCONTO,'
      '  VALOR_MIN_TOTAL,'
      '  VALOR_MEDIA_BRUTO,'
      '  VALOR_MEDIA_DESCONTO,'
      '  VALOR_MEDIA_TOTAL'
      'from TBCOTACAO_COMPRA '
      'where'
      '  ANO = :ANO and'
      '  CODIGO = :CODIGO and'
      '  EMPRESA = :EMPRESA')
    ModifySQL.Strings = (
      'update TBCOTACAO_COMPRA'
      'set'
      '  ANO = :ANO,'
      '  AUTORIZADA_DATA = :AUTORIZADA_DATA,'
      '  AUTORIZADA_USUARIO = :AUTORIZADA_USUARIO,'
      '  CANCELADO_DATA = :CANCELADO_DATA,'
      '  CANCELADO_MOTIVO = :CANCELADO_MOTIVO,'
      '  CANCELADO_USUARIO = :CANCELADO_USUARIO,'
      '  CODIGO = :CODIGO,'
      '  COMPETENCIA = :COMPETENCIA,'
      '  DESCRICAO_RESUMO = :DESCRICAO_RESUMO,'
      '  EMISSAO_DATA = :EMISSAO_DATA,'
      '  EMISSAO_USUARIO = :EMISSAO_USUARIO,'
      '  EMPRESA = :EMPRESA,'
      '  ENCERRADA_DATA = :ENCERRADA_DATA,'
      '  ENCERRADA_USUARIO = :ENCERRADA_USUARIO,'
      '  INSERCAO_DATA = :INSERCAO_DATA,'
      '  LOG_EVENTO = :LOG_EVENTO,'
      '  MOVITO = :MOVITO,'
      '  NOME_CONTATO_INT = :NOME_CONTATO_INT,'
      '  NUMERO = :NUMERO,'
      '  NUMERO_MINIMO_FORNECEDOR = :NUMERO_MINIMO_FORNECEDOR,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  STATUS = :STATUS,'
      '  TIPO = :TIPO,'
      '  VALIDADE = :VALIDADE,'
      '  VALOR_MAX_BRUTO = :VALOR_MAX_BRUTO,'
      '  VALOR_MAX_DESCONTO = :VALOR_MAX_DESCONTO,'
      '  VALOR_MAX_TOTAL = :VALOR_MAX_TOTAL,'
      '  VALOR_MEDIA_BRUTO = :VALOR_MEDIA_BRUTO,'
      '  VALOR_MEDIA_DESCONTO = :VALOR_MEDIA_DESCONTO,'
      '  VALOR_MEDIA_TOTAL = :VALOR_MEDIA_TOTAL,'
      '  VALOR_MIN_BRUTO = :VALOR_MIN_BRUTO,'
      '  VALOR_MIN_DESCONTO = :VALOR_MIN_DESCONTO,'
      '  VALOR_MIN_TOTAL = :VALOR_MIN_TOTAL,'
      '  VALOR_REF_TOTAL = :VALOR_REF_TOTAL'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TBCOTACAO_COMPRA'
      
        '  (ANO, AUTORIZADA_DATA, AUTORIZADA_USUARIO, CANCELADO_DATA, CAN' +
        'CELADO_MOTIVO, '
      
        '   CANCELADO_USUARIO, CODIGO, COMPETENCIA, DESCRICAO_RESUMO, EMI' +
        'SSAO_DATA, '
      
        '   EMISSAO_USUARIO, EMPRESA, ENCERRADA_DATA, ENCERRADA_USUARIO, ' +
        'INSERCAO_DATA, '
      
        '   LOG_EVENTO, MOVITO, NOME_CONTATO_INT, NUMERO, NUMERO_MINIMO_F' +
        'ORNECEDOR, '
      
        '   OBSERVACAO, STATUS, TIPO, VALIDADE, VALOR_MAX_BRUTO, VALOR_MA' +
        'X_DESCONTO, '
      
        '   VALOR_MAX_TOTAL, VALOR_MEDIA_BRUTO, VALOR_MEDIA_DESCONTO, VAL' +
        'OR_MEDIA_TOTAL, '
      
        '   VALOR_MIN_BRUTO, VALOR_MIN_DESCONTO, VALOR_MIN_TOTAL, VALOR_R' +
        'EF_TOTAL)'
      'values'
      
        '  (:ANO, :AUTORIZADA_DATA, :AUTORIZADA_USUARIO, :CANCELADO_DATA,' +
        ' :CANCELADO_MOTIVO, '
      
        '   :CANCELADO_USUARIO, :CODIGO, :COMPETENCIA, :DESCRICAO_RESUMO,' +
        ' :EMISSAO_DATA, '
      
        '   :EMISSAO_USUARIO, :EMPRESA, :ENCERRADA_DATA, :ENCERRADA_USUAR' +
        'IO, :INSERCAO_DATA, '
      
        '   :LOG_EVENTO, :MOVITO, :NOME_CONTATO_INT, :NUMERO, :NUMERO_MIN' +
        'IMO_FORNECEDOR, '
      
        '   :OBSERVACAO, :STATUS, :TIPO, :VALIDADE, :VALOR_MAX_BRUTO, :VA' +
        'LOR_MAX_DESCONTO, '
      
        '   :VALOR_MAX_TOTAL, :VALOR_MEDIA_BRUTO, :VALOR_MEDIA_DESCONTO, ' +
        ':VALOR_MEDIA_TOTAL, '
      
        '   :VALOR_MIN_BRUTO, :VALOR_MIN_DESCONTO, :VALOR_MIN_TOTAL, :VAL' +
        'OR_REF_TOTAL)')
    DeleteSQL.Strings = (
      'delete from TBCOTACAO_COMPRA'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA')
    Left = 712
    Top = 368
  end
  inherited ImgList: TImageList
    Left = 896
    Top = 352
    Bitmap = {
      494C01012F003100040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A5B
      6F004A5B6F004A5B6F004354680043546800435468003A4B5F003A4B5F003A4B
      5F003242560032425600324256002C3C50000000000000000000000000006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500634935006349350063493500634935000000000000000000000000003545
      5900354559003545590035455900354559003545590035455900354559003545
      5900354559003545590035455900354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008292A3007D8D9E007D8D
      9E00768799007687990071829400718294006A7B8E006A7B8E006A7B8E006273
      8600627386005D6F83005D6F83002C3C5000000000000000000000000000B7A2
      9300FAE2D200DFB89E00E0B69900E2B49500E2B19100E4AF8C00E5AD8800E6AB
      8400E7A77F00E8A57A00EBA3770063493500000000000000000000000000909F
      AE00D9DFE500A7B4C000A5B2BF00A2AFBC00A0ADBA009CAAB8009AA8B60098A6
      B40093A2B100909FAE008F9EAD00354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000057697D008292A300EBEFF200E9ED
      F000E7EBEE00E6EAEE00E4E9ED00E1E6EA00E0E5E900DEE4E900DDE3E800DBE1
      E600DAE0E500DAE0E5005D6F83002C3C5000000000000000000000000000B9A4
      9500FBE6DA00FBE7DA00FBE6D900FAE5D800FBE4D600FBE2D300F9E0D000F8DD
      CC00F9DBC900F8DAC700E9A47B006349350000000000000000000000000092A1
      B000DEE4E900E0E5E900DEE4E900DDE3E800DCE2E700DAE0E500D7DEE400D3DA
      E000D2D9E000CFD7DE00909FAE00354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000057697D008797A700EEF1F300EBEF
      F200E9EDF000E7EBEE00E6EAEE00E4E9ED00E1E6EA00E0E5E900DDE3E800DDE3
      E800DCE2E700DAE0E5006273860032425600000000000000000000000000BBA6
      9600FBECE200D6AE9000D6AE9000D6AE9000D6AE9000FAE7DA00D6AE9000D6AE
      9000D6AE9000F8DBCA00E7A780006349350000000000000000000000000095A3
      B200E6EAEE009BA9B7009BA9B7009BA9B7009BA9B700E0E5E9009BA9B7009BA9
      B7009BA9B700D2D9E00093A2B100354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005D6F83008C9BAB00F0F3F500EEF1
      F300EBEFF200EAEEF100E9EDF000E6EAEE008D9CAC0033435700334357003343
      570033435700DCE2E7006273860032425600000000000000000000000000BEA8
      9900FDF0E800FDF0E900FDF0E800FCEFE700FCEDE500FBEBE100D6AE9000FAE5
      D700D6AE9000F9DECE00E6AC85006349350000000000000000000000000098A6
      B400EBEFF200EBEFF200EBEFF200EAEEF100E8ECEF00E4E9ED009BA9B700DDE3
      E8009BA9B700D5DCE20098A6B400354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006475880092A1B000F3F5F6007384
      960033435700334357003343570033435700415266008B9AAA006A7B8E006677
      8A003A4B5F00DDE3E8006A7B8E003A4B5F00187639000C6F32000D6C33000E68
      320011633300125D33001457330016523300184C330019483400FCECE200FBE8
      DD00D6AE9000FAE1D200E4AE8A006349350048596D00405165003F5064003C4D
      61003A4B5F0036475B0034445800314155002E3E52002C3C5000E6EAEE00E1E6
      EA009BA9B700D9DFE5009BA9B700354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A7B8E009AA8B600F4F6F700F1F4
      F600738496008797A700738496004152660099A7B5006A7B8E0066778A003A4B
      5F008D9CAC00DEE4E9006A7B8E003A4B5F00207C3E0000000000000000000000
      00000000000000000000000000000000000000000000174C3400FCEFE800FCEC
      E200FBE8DC00FAE4D600E3B18F00634935004C5E720000000000000000000000
      000000000000000000000000000000000000000000002E3E5200EAEEF100E6EA
      EE00E1E6EA00DCE2E7009EACBA00354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007182940099A7B500F6F8F900F5F7
      F800F3F5F60073849600526478009AA8B6006A7B8E0066778A003A4B5F007182
      940071829400E1E6EA006A7B8E003A4B5F002B84450000000000000000000000
      00000000000085A987001D6F3800195D34005B7D5F0016513300D6AE9000D6AE
      9000D6AE9000FBE6DA00E2B395006349350055677B0000000000000000000000
      0000000000008B9AAA004455690037485C005F708400314155009BA9B7009BA9
      B7009BA9B700DEE4E900A2AFBC00354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000076879900A7B4C000F9FAFA00F6F8
      F900F5F7F80052647800A7B4C0007C8C9D00738496004A5B6F002F3F5300E7EB
      EE00E4E9ED00E3E8EC007182940043546800388E4E008BBD90001E763B001D6E
      39001A6235008BBD90003E9247001D673A009FB3A10014573300FDF4EF00FDF1
      EA00D6AE9000FBE9DD00E0B6990063493500607184009BA9B700495A6E004354
      68003B4C60009BA9B70060718400405165009DABB90034445800F0F3F500EDF0
      F2009BA9B700E2E7EB00A5B2BF00354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007D8D9E00A7B4C000FBFCFC00F9FA
      FA0061728500B2BDC8008B9AAA007C8C9D005A6C800073849600526478002F3F
      5300E7EBEE00E6EAEE00718294004354680046985700000000008BBD9000519E
      570091C4960057A25A0021703A006C9B6F00DFE9DF00135D3300D6AE9000D6AE
      9000D6AE9000FBEADF00DEB89D00634935006A7B8E00000000009BA9B7006E7F
      9100A3B0BD007283950045566A0077889A00DEE4E90037485C009BA9B7009BA9
      B7009BA9B700E3E8EC00A7B4C000354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008292A300B2BDC800FBFCFC006677
      8A00BCC6D000909FAE00909FAE006A7B8E00607184008494A500738496005264
      78002F3F5300E7EBEE00768799004A5B6F0053A2600000000000CFDDCF0096C6
      9A0057A25A00267C390027673100C0D1C0000000000010623300FEF8F300FDF4
      EF00D6AE9000FCECE100DDBAA100634935007485970000000000CFD7DE00A6B3
      C000728395004C5E72003E4F6300BFC9D20000000000394A5E00F5F7F800F0F3
      F5009BA9B700E6EAEE00AAB6C200354559000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008797A700B2BDC800FDFEFE008494
      A5007F8FA0007F8FA0006F809200F5F7F800F3F5F60060718400607184006071
      840060718400EAEEF100768799004A5B6F005EAA6600E5ECE5008DC4930064AC
      6900348941006FA5730057A060003A884600D6E2D6000E683200D6AE9000D6AE
      9000D6AE9000DCBCA500DDBBA400644A36007D8D9E00E4E9ED00A2AFBC007F8F
      A00057697D007F8FA00073849600596B7F00D6DDE3003C4D61009BA9B7009BA9
      B7009BA9B700ACB8C400ABB7C30036465A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C9BAB00BCC6D000FDFEFE00FCFD
      FD00FCFDFD00FBFCFC00F9FAFA00F7F9FA00F5F7F800F4F6F700F1F4F600F0F3
      F500EEF1F300EBEFF2007D8D9E000000000066B06C008EC293005FA863004797
      510000000000CBDACC0054985D0054985D009BB09C000D6C3200FDF8F400FDF5
      EF00B7A29300644A3600644A3600644A36008393A400A1AEBB007B8B9C006778
      8B0000000000CCD4DB006D7E91006D7E910099A7B5003E4F6300F5F7F800F1F4
      F600909FAE0036465A0036465A0036465A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092A1B000BCC6D000FFFFFF00FFFF
      FF00FDFEFE00FCFDFD00FBFCFC00F9FAFA00F7F9FA00F6F8F900F4F6F700F1F4
      F600F0F3F500EEF1F3007D8D9E000000000066B06C0000000000000000000000
      000000000000000000000000000000000000000000000C6F3200FEF7F400FDF4
      EF00B9A49500D4C5BA00644A3600000000008393A40000000000000000000000
      0000000000000000000000000000000000000000000040516500F4F6F700F0F3
      F50092A1B000B8C3CD0036465A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092A1B000BCC6D000BCC6D000B2BD
      C800B2BDC800A7B4C000A7B4C000A7B4C00099A7B5009AA8B60092A1B0008C9B
      AB008797A7008797A7008292A3000000000066B06C0061AD68005AA7640052A1
      5E00489A59003F935200358C4C002C854600247F41001D7A3D00FEF7F300FDF4
      ED00C0AB9C00644A360000000000000000008393A4007F8FA0007A8A9C007283
      95006C7D9000647588005C6E820056687C00506276004C5D7100F4F6F700EFF2
      F4009AA8B60036465A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009AA8B60092A1B0008C9BAB008797
      A7008292A3007D8D9E0076879900718294006A7B8E0064758800647588005D6F
      830057697D0057697D000000000000000000000000000000000000000000D8C2
      B200D7C1B100D6C0B000D4BEAE00D2BDAD00D1BAAB00CFB9AA00CDB6A800CBB6
      A600CAB4A500000000000000000000000000000000000000000000000000B4BF
      CA00B3BEC900B2BDC800AFBBC600AEBAC600ACB8C400ABB7C300A7B4C000A6B3
      C000A5B2BF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000336D
      4700336D4700336D47002C6642002C6642002C664200265D3800265D3800265D
      38001E5331001E5331001E5331001A4D2A000000000000000000D6D9D8008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000A6A6A9000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E0000000000000000006CA67C0066A0770066A0
      77005F9B72005F9B720058966B0058966B0049935F0049935F0049935F003D8C
      57003D8C5700358C4F00358C4F001A4D2A000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F5F5F500F9F9F900F8F8F800F5F5F500F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E0000000000417B57006CA67C00EBF3EB00E8F1
      E800E6F0E600E4EFE400E2EEE300DFECDF00DEEBDE00DCEADD00DCEADB00D9E8
      D900D8E7D800D8E7D800358C4F001A4D2A000000000000000000808080000000
      0000000000000000000080808000808080000000000000000000000000000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400CCCBCA00D5D4D400DCDBDB00E1E1E000E7E7E600EBEBEA00ECECEB00ECEB
      EB00EAE9E900F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CCCBCA00DBDADA00E9E2DF00BA998C00BD9D9000F6F3F200EDEDEC00ECEB
      EB00EAE9E900F4F4F4008F8F8E0000000000417B570071AA8100EDF5ED00EBF3
      EB00EAF1E900E6F0E600E4EFE400E2EEE300DFECDF00DEEBDE00DCEADB00DCEA
      DB00DAE9DA00D8E7D8003D8C57001E5331000000000000000000808080000000
      0000000000008080800080808000808080008080800000000000000000000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400C6C4C200E9E9E900EDEDED00F0F0F000F4F4F400F6F6F600F6F6F600F6F6
      F600E6E6E600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CAC8C600F0ECEA00BB998B00975F4A0098614C00D1B9B000F9F9F900F6F6
      F600E6E6E600F4F4F4008F8F8E000000000047815D0076AF8500EFF6EF00EDF5
      ED00EBF3EB00E9F2E900E8F1E800E4EFE40081AA8D002C5230002C5230002C52
      30002C523000DAE9DA003D8C57001E5331000000000000000000808080000000
      00008080800080808000FFFFFF00FFFFFF008080800080808000D0C0C0000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400C2BFBC00E5E4E300E9E9E900EDEDED00F2F2F200F4F4F400F5F5F500F4F4
      F400E2E2E100F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400D1CFCD00E9E1DE00955D4800965F490097604B00A4736100FAF9F800F4F4
      F400E2E2E100F4F4F4008F8F8E00000000004D8762007CB58A00F3F8F30055A4
      5A002C5230002C5230002C5230002C5230001D781E006DB6750049935F004B96
      4D00265D3800DCEADB0049935F00265D38000000000000000000808080000000
      000080808000FFFFFF00FFFFFF0000000000FFFFFF0080808000808080000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400BFBBB800E1DFDD00E5E5E400EAEAEA00EFEFEF00F2F2F200F2F2F200F2F2
      F200DEDDDC00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400E1E0DE00AA7F6E00945C4700E2D4CF00A778670097604B00D5BFB700F6F6
      F600DEDDDC00F4F4F4008F8F8E0000000000558E670081BC9000F4F9F400F1F7
      F10055A45A0063B2760055A45A001D781E007CC1850049935F004B964D00265D
      380081AA8D00DCEADD0049935F00265D38000000000000000000808080000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00808080008080
      80000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400BCB7B200DCD8D500DFDCDA00E3E1E000E8E8E800ECECEC00EDEDED00EDED
      ED00D6D5D400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CDC9C500DDCFC900C8AEA300EEEEED00D5C1BA00965E4900A5766400F8F8
      F800D6D5D500F4F4F4008F8F8E000000000058966B008AB79500F6FAF600F5F9
      F500F3F8F30055A45A003287350081BC900049935F004B964D00265D38006199
      640061996400DFECDF0049935F00265D38000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      80008080800000000000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D7D1CD00D9D4D000DBD7D400DFDDDB00E3E2E100E6E6E500E8E8
      E800CDCDCC00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00DDD9D500E5E2DF00DCD8D500F4F3F200A1715E00945C4700D6C3
      BC00DCDCDB00F4F4F4008F8F8E00000000005F9B720094C79C00F9FBFA00F6FA
      F600F5F9F5003287350094C79C005CAA650055A45A00336D470004690400E6F0
      E600E2EEE300E1EDE10058966B002C6642000000000000000000808080000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008080800080808000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D6D1CD00DAD5D200DEDBD800E1DFDD00E4E3
      E200C8C7C600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D6D1CD00E6E2E000CFB8AF00925A4500A577
      6500E8E7E700F4F4F4008F8F8E000000000066A0770094C79C00FCFDFB00F9FB
      FA00409347009DD0A7006DB675005CAA65004287490055A45A00328735000469
      0400E6F0E600E4EFE40058966B002C6642000000000000000000808080000000
      0000000000008080800080808000808080008080800080808000808080008080
      8000FFFFFF0080808000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D5CFCB00D5CFCB00D8D3D000DCD8D500DFDD
      DB00C5C3C100F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D5CFCB00D6D0CC00F1EEED009D6A5700925A
      4400D0BFB900F6F6F6008F8F8E00000000006CA67C009DD0A700FCFDFC004B96
      4D00AAD6B20073BB7C0073BB7C0049935F0057825A0068B06F0055A45A003287
      350004690400E6F0E6005F9B7200336D47000000000000000000808080000000
      0000000000008080800000000000000000000000000000000000808080008080
      80000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00BAB4AF00BDB9
      B400C1BEBB00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00D0CCC900C0A79D00AB86
      7700E4DFDC00F5F5F5008F8F8E000000000071AA81009DD0A700FEFEFE0068B0
      6F0064AC690064AC6900579A5E00F6F9F600F3F8F30057825A0057825A005782
      5A0057825A00E9F2E9005F9B7200336D47000000000000000000808080000000
      0000000000000000000080808000808080008080800000000000808080000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F8F8F800F9F9
      F900F6F6F600F4F4F4008F8F8E000000000076AF8500AAD6B200FEFEFE00FDFE
      FD00FDFEFD00FCFDFB00F9FBFA00F8FAF800F6F9F600F4F9F400F1F7F100EFF6
      EF00EDF5ED00EBF3EB0066A07700000000000000000000000000E2E5E1008080
      8000808080008080800080808000000000000000000000000000808080008080
      80008080800080808000D6DAD6000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E00000000007CB58A00AAD6B200FFFFFF00FFFF
      FF00FEFFFE00FDFEFD00FCFDFB00F9FBFA00F8FAF800F6FAF600F4F9F400F1F7
      F100EFF6EF00EDF5ED0066A07700000000000000000000000000000000000000
      00000000000000000000DCE3E100808080008080800080808000D8DDD9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007CB58A00AAD6B200AAD6B2009DD0
      A7009DD0A70094C79C0094C79C0094C79C008AB7950081BC90007CB58A0076AF
      850071AA810071AA81006CA67C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000081BC90007CB58A0076AF850071AA
      81006CA67C0066A077005F9B720058966B00558E67004D8762004D8762004781
      5D00417B5700417B570000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006666
      6600666666006666660066666600666666006666660066666600666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000000000000000000006666
      6600DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00808080000000
      0000000000000000000000000000000000000000000000000000D6D9D8006851
      3A00605040006048300070504000706050007050400060483000604830006048
      30006048300060483000A6A6A900000000000000000062626200808080000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800062626200000000000000000000000000000000006666
      6600DFFBFD0083838300838383008383830083838300DFFBFD00666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000DBDBDB0083838300838383008383830083838300DBDBDB00808080000000
      0000000000000000000000000000000000000000000000000000C0A8A000F0F0
      F000E0D8D000E0D0C000E0C8C0009090B000D0C0B000E0B8A000D0B0A000D0B0
      A000D0A89000D0A0900060483000000000000000000062626200808080000000
      0000000000008080800000000000000000008080800000000000808080000000
      0000808080008080800062626200000000000000000000000000000000006666
      66000000F7000000F7000000F7000000F7000000F7000000F700666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000C0A8A000FFF0
      F000F0F0F000F0E8E0003050C0001038B0007078C000E0D0D000F0D0C000E0D0
      C000E0C8B000D0A8900060483000000000000000000062626200808080000000
      0000000000000000000000000000808080000000000080808000000000008080
      8000000000008080800062626200000000000000000000000000000000006666
      66000000F700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000F700666666000000
      0000666666006666660066666600666666000000000000000000000000008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080000000
      0000808080008080800080808000808080000000000000000000C0A8A000FFF0
      F000D0D0E0003050C0003058F0002048E0001038B000A098C000F0D0C000F0D0
      C000E0C8B000D0A8900060483000000000000000000062626200808080000000
      0000000000000000000000000000000000008080800000000000808080000000
      0000808080008080800062626200000000000000000000000000000000006666
      66000000F7000000F7000000F7000000F7000000F7000000F700666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000C0B0A000FFF8
      F0002040C0003058F0006080FF005078F0004060F0002040B000D0C0C000F0D8
      D000E0C8C000D0B0A00060483000000000000000000062626200000000008080
      8000808080008080800080808000808080000000000000000000000000008080
      8000000000008080800062626200000000000000000000000000000000006666
      6600DFFBFD008383830083838300DFFBFD00DFFBFD00DFFBFD00666666000000
      0000000000004D4D4D004D4D4D00000000000000000000000000000000008080
      8000DBDBDB008383830083838300DBDBDB00DBDBDB00DBDBDB00808080000000
      0000000000008080800080808000000000000000000000000000C0B0A000FFF8
      F00080A0FF008098FF008090F000D0D0E0008098F0004060E0004058B000F0D8
      D000F0D8D000D0B8A00060504000000000000000000062626200000000008080
      8000808080000000000000000000808080008080800080808000000000000000
      0000000000000000000062626200000000000000000000000000000000006666
      6600DFFBFD00DFFBFD00DFFBFD00DFFBFD006666660066666600666666000000
      00004D4D4D004D4D4D004D4D4D004D4D4D000000000000000000000000008080
      8000DBDBDB00DBDBDB00DBDBDB00DBDBDB008080800080808000808080000000
      0000808080008080800080808000808080000000000000000000D0B0A000FFF8
      FF00E0E8FF00C0C8F000F0F0F000F0F0E000E0D8E0008090F0003058E0005068
      B000F0E0D000E0C8B00070584000000000000000000062626200000000008080
      8000000000000000000000000000000000008080800080808000808080008080
      8000808080000000000062626200000000000000000000000000000000006666
      6600DFFBFD00DFFBFD00DFFBFD00DFFBFD006666660066666600000000000000
      0000000000004D4D4D004D4D4D00000000000000000000000000000000008080
      8000DBDBDB00DBDBDB00DBDBDB00DBDBDB008080800080808000000000000000
      0000000000008080800080808000000000000000000000000000D0B8A000FFFF
      FF00FFF8FF00FFF8F000FFF8F000FFF0F000F0F0E000F0E0E0007088F0002050
      D0009090C000E0D0C00080706000000000000000000062626200000000008080
      8000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800062626200000000000000000000000000000000006666
      6600666666006666660066666600666666006666660000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000000000000000000008080
      8000808080008080800080808000808080008080800000000000000000000000
      0000000000008080800080808000000000000000000000000000D0B8B000FFFF
      FF00FFFFFF00FFF8FF00FFF8F000FFF8F000F0F0F000F0E0E000F0E8E0008090
      F0002048D000A098C000A0908000000000000000000062626200000000008080
      8000808080000000000000000000808080008080800080808000808080008080
      8000808080008080800062626200000000000000000083000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000D0C0B000FFFF
      FF00FFFFFF0080A0B000608890006088900060789000607880007080900090A0
      B00090A0F0003050D000B0989000000000000000000062626200000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800062626200000000000000000083000000830000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0C0B000FFFF
      FF00FFFFFF0080A8B00090D8E00090E8F00080D8F00060C8E0005098B0007080
      9000F0E8E000E0D8D000A0989000000000000000000062626200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000062626200000000000000000083000000830000008300
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000D1C2B300FFFF
      FF00FFFFFF00F0F8FF0080A8B000A0A8A0009586770080C8D00050708000F0F0
      F000F0E0E000F0E0E000807060000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000083000000830000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E5E100D1C2
      B300D0C0B000D0C0B00070A8B000A0E8F000A0E8F00090D0E00040687000C0A8
      A000C0A8A000C0A89000D6DAD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000000000000000
      00000000000000000000DCE3E10080B0C00080A0B0007090A000D8DDD9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002D2D2D002D2D2D002D2D
      2D002D2D2D002D2D2D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080685000203040002030400020304000203040002030
      4000203040002030400020304000203040000000000000000000000000000000
      0000000000000000000000000000000000002D2D2D00DDDDDD00DDDDDD00CEC3
      B200BCA87B00BCA87B002D2D2D00000000000000000000000000000000000000
      0000000000000000000000000000000000002D2D2D00DDDDDD00DDDDDD008080
      80008080800080808000808080000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000060809000506070004050
      6000304050002030400090706000F0E0D000B0A09000B0A09000B0A09000B0A0
      9000B0A09000B0A09000B0A0900020304000000000007F5B00007F5B00000000
      00000000000000000000000000002D2D2D00E9DDB700FFFDF300FFFFFF00FBF0
      D700E1CE9B00B0995A00756923002D2D2D000000000080808000808080000000
      0000000000000000000000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C0014BB180014BB180014BB180014BB180014BB180014BB180014BB180014BB
      180014BB180014BB180062626200000000007080900020B8F0000090D0000090
      D0000090D0000090D00090786000F0E8E000F0D8D000E0D0C000E0C8C000D0C0
      B000D0B8B000D0B8B000B0A09000203040007F5B0000EFAD0000EFAD00007F5B
      00000000000000000000000000002D2D2D00E9DDB400F9F4E800FFFFFF00F0E4
      CC00D5C19300A5905400756923002D2D2D008080800080808000808080008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C00BB350C0014BB180020D7240020D7240019C21D0020D7240019C21D0020D7
      240019C21D0014BB180062626200000000007088900070C8F00010B8F00010B0
      F00000A8E0000098D000A0807000F0F0F000C0B0A000C0B0A000C0A8A000B0A0
      9000D0C0B000B0A09000B0A09000203040007F5B0000FFFF0000EFAD0000EFAD
      00007F5B000000000000000000002D2D2D00E8DAB200F7F1E200FFFFFF00F1E5
      D000D7C393009F8B4F00726622002D2D2D008080800000000000808080008080
      8000808080000000000000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C00BB350C00BB350C00BB350C0014BB180020D7240019C21D0020D7240019C2
      1D0020D7240014BB180062626200000000008088900070D0F00030C0F00010B8
      F00000A8F00000A0E000A0888000FFF8FF00F0F0F000F0E8E000F0D8D000E0D0
      C00070585000605040005048400040404000000000007F5B0000FFFF0000EFAD
      0000EFAD00007F5B0000000000002D2D2D00E6DAB100F9F4E600FFFFFF00F0E5
      CE00D6C49300A68F5400726521002D2D2D000000000080808000000000008080
      8000808080008080800000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C00BB350C00BB350C00BB350C00BB350C0014BB180020D7240019C21D0020D7
      240019C21D0014BB180062626200000000008090A00080D8F00040C8F00030C0
      F00010B8F00000A0E000B0908000FFFFFF00C0B0A000C0B0A000C0A8A000F0E0
      D00080605000D0C8C000605040000000000000000000000000007F5B0000FFFF
      0000F6CF6D007F5B0000000000002D2D2D00F5EACA00FCF8EE00FFFFFF00EEE2
      CC00D5C19300A88F5600796C25002D2D2D000000000000000000808080000000
      0000000000008080800000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200F1CF7C00EEAA
      0400EEAA0400EEAA0400EEAA0400EEAA0400BF8A0800BF8A080020D7240019C2
      1D0020D7240014BB180062626200000000008098A00090E0F00060D8F00050C8
      F00030C0F00010B0F000B0989000FFFFFF00FFFFFF00FFF8FF00F0F0F000F0E8
      E000806850008060500000000000000000000000000000000000000000007F5B
      00007F5B0000F6CF6D00D9A77D007F5B00007F5B00007F5B00007F5B00002D2D
      2D002D2D2D002D2D2D00796C25002D2D2D000000000000000000000000008080
      80008080800000000000808080007F5B00008080800080808000808080008080
      8000808080008080800080808000808080000000000062626200F1CF7C00EEAA
      0400EEAA0400A9FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400BF8A0800BF8A
      0800BF8A080020D7240062626200000000008098A000A0E8F00080E0F00070D8
      F00050D0F00010B0F000B0A09000B0989000B0908000A0888000A08070009078
      6000907060000000000000000000000000000000000000000000000000000000
      000000000000D9A77D007F5B0000679A9A00ABAB6E00A8D7CE00ECE79D007F5B
      0000BDA16600574507002D2D2D002D2D2D000000000000000000000000000000
      0000000000008080800080808000679A9A000000000000000000000000008080
      8000000000008080800080808000808080000000000062626200F1CF7C00EEAA
      0400A9FFFF0000FFFF0000FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400BF8A0800626262000000000090A0A000B0F0FF00A0E8FF0090E0
      F00070D0F00010A0D00010A0D00010A0D0001098D0000090D0000090D0000090
      D000303840000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000AAFFFF00AAFFFF0078ABAB00C0F0EC00CCFFFC00FFFF
      BF007F5B0000B1975D002D2D2D00000000000000000000000000000000000000
      00000000000080808000000000000000000078ABAB0000000000000000000000
      0000000000000000000080808000000000000000000062626200F1CF7C00EEAA
      0400A9FFFF0000FFFF0000FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400EEAA0400626262000000000090A0B000B0F0FF00A0F0FF006080
      9000607080005070800050687000506870005060700040587000207090000090
      D000404860000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000FFFF9900AAFEFE00AAFFFF0078ABAB0078ABAB0078AB
      AB007F5B00002D2D2D0000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000078ABAB0078ABAB0078AB
      AB00808080008080800000000000000000000000000062626200F1CF7C00EEAA
      0400EEAA0400A9FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400EEAA0400626262000000000090A8B000B0F0FF00B0F0FF006088
      900090C8D00090E8F00080D8E00060C8E0005098B000405860002080A0000090
      D000505870000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00FFFF
      99007F5B00000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000062626200F1CF7C00EEAA
      0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400EEAA0400626262000000000090A8B000B0F0F000B0F0FF00A0F0
      F0007098A000A0F0F0006D7F850080C8D000507080003060800060C0F00020B8
      F000506070000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000FFFF9900AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFF
      FF007F5B00000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000062626200F1CF7C00F1CF
      7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF
      7C00F1CF7C00F1CF7C0062626200000000000000000090A8B00090A8B00090A8
      B0006090A000A0E8F000A0E8F00090D8E0004068700070889000808890007088
      9000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F5B0000FFFF9900AAFFFF00FFFF9900AAFFFF007F5B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000007F5B
      00000000000000000000000000000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000000000000000000000000
      00000000000080B0C00080B0C00080A0B0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F5B00007F5B00007F5B00007F5B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099939D0020304000938B9300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000096969600333333008E8E8E00000000000000000000000000000000000000
      000000000000B0A0900060483000604830006048300060483000604830006048
      3000604830006048300060483000705040000000000000000000000000000000
      0000000000009C9C9C0043434300434343004343430043434300434343004343
      43004343430043434300434343004E4E4E0000000000B0A09000604830006048
      3000604830006048300060483000604830006048300060483000604830005048
      4000305060004078C000304860009C989D00000000009C9C9C00434343004343
      4300434343004343430043434300434343004343430043434300434343004646
      460051515100888888004C4C4C00999999000000000000000000000000000000
      000000000000C0A8A000FFF0F000E0E0E000E0E0D00090584000F0F0E000E0C8
      C000E0C8B000E0C0B000E0B8A000705040000000000000000000000000000000
      000000000000A8A8A800F1F1F100E0E0E000DBDBDB0056565600EBEBEB00C8C8
      C800C3C3C300BEBEBE00B4B4B4004E4E4E0000000000B0A09000FFFFFF00B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000908880003050
      70003080D0004098E00050B0F00050687000000000009C9C9C00FFFFFF009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00868686005656
      560090909000A4A4A400B9B9B900686868007088900060809000607880006088
      90006090A000C0B0A000FFFFFF00FFF8F000E0D8D000A0604000FFF0F000FFE8
      E000FFE8D000F0E0D000D0B8A000705040008888880081818100787878008686
      860090909000ACACAC00FFFFFF00F6F6F600D6D6D6005C5C5C00F1F1F100E7E7
      E700E3E3E300DCDCDC00B3B3B3004E4E4E0000000000B0A09000FFFFFF00FFFF
      FF00FFF8FF00F0F0F000D0D8D000909890007068600060686000505860004070
      900040A0E00060C8FF007090A000B7B3B500000000009C9C9C00FFFFFF00FFFF
      FF00FAFAFA00F0F0F000D4D4D400949494006666660064646400595959007474
      7400A9A9A900CECECE0091919100B4B4B4007088900090A0B00070B0D0000090
      D00030B0E000D0B8A000FFFFFF00B0887000E0E0E000A0705000FFF8F000C090
      8000C0887000B0786000D0B8A0007050400088888800A3A3A300B3B3B3009494
      9400B1B1B100B3B3B300FFFFFF0084848400E0E0E0006B6B6B00F6F6F6009090
      90008686860076767600B3B3B3004E4E4E0000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00E0E0E00090909000B0A8A000D0C0B000D0B0A000807870005058
      50006090B0007098B000A6AAAE0000000000000000009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00E0E0E00090909000A6A6A600BCBCBC00AEAEAE00767676005454
      5400949494009B9B9B00AAAAAA00000000008088900080C0D00090A8B00080E0
      FF0050B8E000D0B8A000FFFFFF00FFFFFF00E0E0E000A0786000FFF8F000FFF0
      F000FFF0E000FFE8E000D0B8A0007050400089898900BEBEBE00A8A8A800DFDF
      DF00B9B9B900B3B3B300FFFFFF00FFFFFF00E0E0E00074747400F6F6F600F1F1
      F100ECECEC00E7E7E700B3B3B3004E4E4E0000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00B0B0B000C0B8B000FFF0E000FFE8E000F0D8C000F0D0B0008078
      7000988D9200A8ADB1000000000000000000000000009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00B0B0B000B6B6B600ECECEC00E7E7E700D3D3D300C9C9C9007676
      76008F8F8F00ADADAD0000000000000000008090A00080D0F00090A8B00090C0
      D00060C0E000D0B8A000FFFFFF00B0989000E0E0E000B0806000FFF8FF00C0A0
      9000C0988000C0887000D0B8B0007050400093939300D1D1D100A8A8A800C0C0
      C000C0C0C000B3B3B300FFFFFF0098989800E0E0E0007B7B7B00FAFAFA009E9E
      9E009494940086868600B8B8B8004E4E4E0000000000C0A89000FFFFFF00FFFF
      FF00FFFFFF00A0989000F0E8E000FFF8F000FFF0F000FFE8E000F0D8D000D0B0
      A0006267600000000000000000000000000000000000A3A3A300FFFFFF00FFFF
      FF00FFFFFF0096969600E6E6E600F6F6F600F1F1F100E7E7E700D8D8D800AEAE
      AE00646464000000000000000000000000008090A00080D8F00080C8E00090A8
      B00060C0E000D0B8A000FFFFFF00FFFFFF00FFFFFF00B0806000FFFFFF00FFF8
      FF00FFF8F000FFF8F000FFF0F0007050400093939300D6D6D600C8C8C800A8A8
      A800C0C0C000B3B3B300FFFFFF00FFFFFF00FFFFFF007B7B7B00FFFFFF00FAFA
      FA00F6F6F600F6F6F600F1F1F1004E4E4E0000000000C0A8A000FFFFFF00FFFF
      FF00FFFFFF00A0A09000F0E8E000FFFFFF00FFF8F000FFF0F000FFE8E000E0C0
      B000716F6F0000000000000000000000000000000000A8A8A800FFFFFF00FFFF
      FF00FFFFFF009B9B9B00E6E6E600FFFFFF00F6F6F600F1F1F100E7E7E700BEBE
      BE006F6F6F000000000000000000000000008098A00090E0F00090E0FF0090A8
      B00090C0D000E0A08000F0A89000F0A08000F0987000E0906000E0885000E078
      4000E0784000E0704000E0704000D060300098989800DCDCDC00E1E1E100A8A8
      A800C0C0C0009C9C9C00A8A8A8009E9E9E009494940089898900808080007171
      7100717171006C6C6C006C6C6C005C5C5C0000000000C0B0A000FFFFFF00FFFF
      FF00FFFFFF00C0C8C000C0C0C000FFFFFF00FFFFFF00FFF8F000FFF0E000B0A0
      9000A5A0A00000000000000000000000000000000000ACACAC00FFFFFF00FFFF
      FF00FFFFFF00C4C4C400C0C0C000FFFFFF00FFFFFF00F6F6F600ECECEC009C9C
      9C00A0A0A0000000000000000000000000008098A00090E0F000A0E8FF0080C8
      E00080C0D000D0987000FFC0A000FFB8A000FFB89000FFB09000FFA88000FFA8
      8000F0A07000F0987000F0987000D070400098989800DCDCDC00E7E7E700C8C8
      C800BEBEBE0091919100BCBCBC00B7B7B700B3B3B300AEAEAE00A4A4A400A4A4
      A4009999990094949400949494006B6B6B0000000000D0B0A000FFFFFF00FFFF
      FF00FFFFFF00F0F8FF00C0B8B000C0C0C000F0E8E000F0E8E000B0B0A0007070
      60000000000000000000000000000000000000000000AEAEAE00FFFFFF00FFFF
      FF00FFFFFF00F9F9F900B6B6B600C0C0C000E6E6E600E6E6E600ABABAB006B6B
      6B000000000000000000000000000000000090A0A000A0E8F000A0E8FF00A0E8
      FF0090C8D000C0907000D0907000D0907000E0987000D0907000E0987000E090
      6000E0885000E0805000E0784000E07040009E9E9E00E3E3E300E7E7E700E7E7
      E700C4C4C4008B8B8B008C8C8C008C8C8C00939393008C8C8C00939393008989
      8900808080007B7B7B00717171006C6C6C0000000000D0B8A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0F8FF00C0C8C000A0A0900090908000909090006050
      40000000000000000000000000000000000000000000B3B3B300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F900C4C4C4009B9B9B008B8B8B00909090004C4C
      4C000000000000000000000000000000000090A0B000A0E8F000A0F0FF00A0E8
      FF00A0E8FF0080D0F00070C8F00070C8F00070C8F00070C8F00070C8F00070C8
      F00090B0C000000000000000000000000000A3A3A300E3E3E300ECECEC00E7E7
      E700E7E7E700D1D1D100CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00B1B1B10000000000000000000000000000000000D0B8B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A0900060483000604830006048
      30000000000000000000000000000000000000000000B8B8B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C0043434300434343004343
      43000000000000000000000000000000000090A0B000A0F0F000B0F0F000A0F0
      FF00A0E8FF00A0E8FF0070D8FF0090A0A0008098A0008098A0008090A0008090
      900070889000000000000000000000000000A3A3A300E8E8E800E9E9E900ECEC
      EC00E7E7E700E7E7E700D9D9D9009E9E9E009898980098989800939393008E8E
      8E008888880000000000000000000000000000000000D0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C000604830000000
      00000000000000000000000000000000000000000000BCBCBC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6C600434343000000
      00000000000000000000000000000000000090A8B000A0D0E000B0F0F000B0F0
      F000A0F0FF00A0E8FF0090A0B000B1C3C7000000000000000000000000000000
      000000000000906850009068500090685000A8A8A800D0D0D000E9E9E900E9E9
      E900ECECEC00E7E7E700A3A3A300C2C2C2000000000000000000000000000000
      00000000000064646400646464006464640000000000E0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000000000000000
      00000000000000000000000000000000000000000000BEBEBE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A80043434300000000000000
      000000000000000000000000000000000000C8CDD00090A8B00090A8B00090A8
      B00090A8B00090A8B000B4BFC400000000000000000000000000000000000000
      000000000000CDBEBC009068500090685000CDCDCD00A8A8A800A8A8A800A8A8
      A800A8A8A800A8A8A800BFBFBF00000000000000000000000000000000000000
      000000000000BEBEBE00646464006464640000000000E0C0B000E0C0B000E0C0
      B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A00000000000000000000000
      00000000000000000000000000000000000000000000BEBEBE00BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000090786000C3B2A9000000
      0000DED8D800A0908000CDC3BC00907860000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300B1B1B1000000
      0000D8D8D8008C8C8C00C1C1C100737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2CDC700A0908000A088
      8000B0988000C1B7AF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBCB008C8C8C008888
      880093939300B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000005080
      5000407040003050300020382000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006868
      680058585800404040002C2C2C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005090
      500060A860005088500030503000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007070
      7000848484006C6C6C0040404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000070A8800060A070006098
      600070B070005098500040704000305030002038200000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00808080007C7C
      7C00909090007474740058585800404040002C2C2C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080B09000A0D8A00070C0
      800070B8700060A0600050905000408840003050300000000000000000000000
      0000807060008070600080706000807060000000000098989800BCBCBC009898
      9800949494008080800070707000646464004040400000000000000000000000
      000070707000707070007070700070707000000000006078D0001038B0001038
      B0001030B0001028A0001028A000002090000020900000000000000000000000
      0000807060008070600080706000807060000000000098989800606060006060
      6000606060005858580058585800484848004848480000000000000000000000
      0000707070007070700070707000707070000000000090B8A000B0D8B000A0D8
      A00090D0A00070B8700060A86000509850004070400000000000000000000000
      00000000000000000000000000000000000000000000A4A4A400C4C4C400BCBC
      BC00B0B0B0009494940084848400747474005858580000000000000000000000
      000000000000000000000000000000000000000000006080D0009098FF005060
      FF005060FF003048F0003048E0002040D0001028A00000000000000000000000
      0000000000000000000000000000000000000000000098989800C7C7C700A7A7
      A700A7A7A7009090900088888800787878005858580000000000000000000000
      0000000000000000000000000000000000000000000090C0A00090B8A00080B0
      9000A0D8A00070C0800060986000509050005080500000000000000000000000
      00008070600080706000807060008070600000000000A8A8A800A4A4A4009898
      9800BCBCBC00989898007C7C7C00707070006868680000000000000000000000
      000070707000707070007070700070707000000000007088E000A0A8FF009090
      FF007080FF005068FF003058F0002048F0001038B00000000000000000000000
      00008070600080706000807060008070600000000000A8A8A800CFCFCF00C7C7
      C700B7B7B700A7A7A70090909000888888006060600000000000000000000000
      00007070700070707000707070007070700000000000000000000000000090B8
      A000B0D8B000A0D8A00060A07000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A4
      A400C4C4C400BCBCBC0080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007088E0007088E0006080
      D0006078D0005070C0005060C0004058B0004058B00000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800A8A8A8009898
      9800989898008888880088888800787878007878780000000000000000000000
      00000000000000000000000000000000000000000000000000000000000090C0
      A00090B8A00080B0900070A88000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A8A8
      A800A4A4A400989898008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0A0900060483000604830006048
      3000604830006048300060483000604830006048300060483000604830006048
      3000000000000000000000000000000000009E9E9E0043434300434343004343
      4300434343004343430043434300434343004343430043434300434343004343
      430000000000000000000000000000000000FFFFFF0085B6D8000F6DAE001672
      B1001A74B1001A74B0001876B3001777B300137AB6000D7CBA000A7CBA00077A
      B8000279BA00006EAF007FAFCE00FFFFFF00FFFFFF00BBBBBB00777777007B7B
      7B007D7D7D007D7D7D007E7E7E007F7F7F008181810083838300838383008181
      81008080800076767600B3B3B300FFFFFF00C0A89000FFF8F000FFF0E000F0E8
      E000F0E0D000F0D0C000F0C8B000E0C0A000E0B8A000E0B09000E0A890006048
      300000000000000000000000000000000000A3A3A300F6F6F600ECECEC00E6E6
      E600DCDCDC00CECECE00C4C4C400B9B9B900B4B4B400ABABAB00A6A6A6004343
      430000000000000000000000000000000000FFFFFF001180CB00D4E8F600FFFF
      FF00FFFFFF0085BFE50048A2DA00389FD800249DD7001CA1DA0015A2DA000DA1
      D900059BD900018ED000006CAE00FFFFFF00FFFFFF008B8B8B00EAEAEA00FFFF
      FF00FFFFFF00C4C4C400A9A9A900A5A5A500A2A2A200A4A4A400A4A4A400A3A3
      A3009E9E9E009393930075757500FFFFFF00C0A8A000FFFFF000C0A8A000B0A0
      A000F0E8E000B0A09000B0989000B0989000B0989000B0989000E0B090006048
      300000000000000000000000000000000000A8A8A800FAFAFA00A8A8A800A1A1
      A100E6E6E6009C9C9C0098989800989898009898980098989800ABABAB004343
      430000000000000000000000000000000000FFFFFF00198AD500FFFFFF006BB3
      E40091C8EB00FFFFFF00FFFFFF00DFF1FA004CB5E40024ADE2001CB0E30013B0
      E3000AACE200049BD9000276B800FFFFFF00FFFFFF0095959500FFFFFF00BABA
      BA00CDCDCD00FFFFFF00FFFFFF00F1F1F100B8B8B800AFAFAF00B0B0B000AFAF
      AF00ACACAC009E9E9E007E7E7E00FFFFFF00C0A8A000FFFFF000FFFFF000FFF8
      F000FFF0E000F0E8E000F0E0D000F0D0C000F0C8B000E0C0A000E0B8A0006048
      300000000000000000000000000000000000A8A8A800FAFAFA00FAFAFA00F6F6
      F600ECECEC00E6E6E600DCDCDC00CECECE00C4C4C400B9B9B900B4B4B4004343
      430000000000000000000000000000000000FFFFFF00228ED700FFFFFF00A3D0
      EE0048A2DE008EC6EB00B8DDF300FFFFFF00C5E7F7002BB1E40021B3E40018B4
      E5000EB0E30008A0DA00057BBA00FFFFFF00FFFFFF0099999900FFFFFF00D4D4
      D400ABABAB00CBCBCB00DFDFDF00FFFFFF00E8E8E800B2B2B200B3B3B300B3B3
      B300AFAFAF00A2A2A20082828200FFFFFF00C0A8A000FFFFF000B0A8A000B0A0
      A000FFF8F000B0A09000B0989000B0989000B0989000B0989000E0C0A0006048
      300000000000000000000000000000000000A8A8A800FAFAFA00A6A6A600A1A1
      A100F6F6F6009C9C9C0098989800989898009898980098989800B9B9B9004343
      430000000000000000000000000000000000FFFFFF002C94D90074B8E600FFFF
      FF00B4D9F1004CA5DF0046A5DF00FFFFFF00CEEAF80064C5EA0052C2EA001BB1
      E40014ADE2000FA1DA000B7DBB00FFFFFF00FFFFFF009E9E9E00BFBFBF00FFFF
      FF00DCDCDC00ADADAD00ACACAC00FFFFFF00EBEBEB00C6C6C600C2C2C200B1B1
      B100ADADAD00A3A3A30084848400FFFFFF00C0B0A000FFFFF000FFFFF000FFFF
      F000FFFFF000FFF8F000FFF0E000F0E8E000F0E0D000F0D0C000F0C8B0006048
      300000000000000000000000000000000000ACACAC00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00F6F6F600ECECEC00E6E6E600DCDCDC00CECECE00C4C4C4004343
      430000000000000000000000000000000000FFFFFF003598DA004BA3DE0083BF
      E900FFFFFF00B0D7F10049A5DF008BC9EB00F8FCFE00FFFFFF00FFFFFF00CAEC
      F80043BAE70018A0D900127FBB00FFFFFF00FFFFFF00A1A1A100ABABAB00C5C5
      C500FFFFFF00DADADA00ADADAD00CDCDCD00FCFCFC00FFFFFF00FFFFFF00ECEC
      EC00BBBBBB00A3A3A30086868600FFFFFF00C0B0A000FFFFF000FFFFF000FFFF
      F000FFFFF000FFFFF000FFF8F000C0C8C00040607000F0E0D000F0D0C0006048
      300000000000000000000000000000000000ACACAC00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00F6F6F600C4C4C40061616100DCDCDC00CECECE004343
      430000000000000000000000000000000000FFFFFF003F9DDC0053A7E00056A9
      E00086C1E900FFFFFF00AAD4F00041A3DE005BB4E50041AEE20055B9E600FFFF
      FF00E3F3FB0039A8DD00187EB900FFFFFF00FFFFFF00A6A6A600AFAFAF00B1B1
      B100C7C7C700FFFFFF00D8D8D800AAAAAA00B9B9B900B2B2B200BCBCBC00FFFF
      FF00F3F3F300ACACAC0085858500FFFFFF00C0B0A000FFFFFF00E0E8F0006078
      8000E0E0E000FFFFF000C0C8D0005060700030A8D00020384000B0A0A0006048
      30000000000000000000A0B39A0040805000ACACAC00FFFFFF00E9E9E9007878
      7800E0E0E000FAFAFA00C9C9C90063636300A8A8A80038383800A1A1A1004343
      43000000000000000000A9A9A9006B6B6B00FFFFFF0045A0DE005AAAE1005CAA
      E10057A8E10094C8EB00FFFFFF005EAFE200369FDD002C9EDD00249DDD002EA3
      DE00FFFFFF008CC9E9001D7DB800FFFFFF00FFFFFF00A9A9A900B2B2B200B2B2
      B200B1B1B100CDCDCD00FFFFFF00B6B6B600A7A7A700A5A5A500A4A4A400A9A9
      A900FFFFFF00CCCCCC0085858500FFFFFF00D0B0A000FFFFFF0090A8B00080D0
      E00050607000B0B8C0005060700060C0E0005060700030B8F000102830001030
      40001028300070747D004078400050A86000AEAEAE00FFFFFF00A8A8A800CCCC
      CC0063636300B9B9B90063636300C0C0C00063636300BBBBBB00282828003131
      310028282800767676006161610089898900FFFFFF004FA5DF0063AFE30061AD
      E20059A9E1007AB9E700FFFFFF004EA4DF00369ADB0046A5E00062B3E4002496
      DA00A1D2EF00BFDFF200217CB700FFFFFF00FFFFFF00ADADAD00B7B7B700B5B5
      B500B1B1B100C0C0C000FFFFFF00ADADAD00A3A3A300ADADAD00B9B9B9009F9F
      9F00D5D5D500E1E1E10084848400FFFFFF00D0B8A000FFFFFF00E0E8F00090A8
      B00080E0F0005060700080D0E0005060700060D0F0004060700030B0E0002098
      D0002088B000205070005088600050B06000B3B3B300FFFFFF00E9E9E900A8A8
      A800DBDBDB0063636300CCCCCC0063636300CECECE0061616100B1B1B1009C9C
      9C008989890054545400767676008E8E8E00FFFFFF0053A7E0006CB4E50068B2
      E4005EABE10080BDE800FFFFFF005AAAE1003A9ADB009ECEEE00F8FCFE003B9E
      DC00B2D9F200B7DAF000237CB700FFFFFF00FFFFFF00AFAFAF00BBBBBB00B9B9
      B900B3B3B300C3C3C300FFFFFF00B2B2B200A3A3A300D2D2D200FCFCFC00A6A6
      A600DCDCDC00DDDDDD0084848400FFFFFF00D0B8A000D0B8A000D0B8A000C0B0
      A00090A8B00080E0F0005060700080E0F0004058700060D0F00050C8F00040C0
      F00020B0E00020A0D0006098700050B87000B3B3B300B3B3B300B3B3B300ACAC
      AC00A8A8A800DBDBDB0063636300DBDBDB005C5C5C00CECECE00C8C8C800C1C1
      C100B0B0B000A1A1A1008686860098989800FFFFFF005EACE2007ABCE70070B6
      E50063AEE30066AFE300E4F1FA00C1DFF300459EDD003E9BDC0051A6DF0067B2
      E400FDFEFF0075B7E300237BB600FFFFFF00FFFFFF00B4B4B400C2C2C200BDBD
      BD00B6B6B600B7B7B700F2F2F200E2E2E200A8A8A800A5A5A500AEAEAE00B9B9
      B900FEFEFE00BDBDBD0083838300FFFFFF000000000000000000000000000000
      00000000000090A8B00080E0F0004058700080E0F00070D8F00060D0F00050C8
      F00040C0F00030B8F00070A8800060C080000000000000000000000000000000
      000000000000A8A8A800DBDBDB005C5C5C00DBDBDB00D4D4D400CECECE00C8C8
      C800C1C1C100BBBBBB0096969600A3A3A300FFFFFF006BB4E5008DC5EA0080BF
      E8006FB6E50067B1E30091C6EB00F9FCFE00DDEDF90096C9EC00AED5F000FFFF
      FF00B1D7F1003596D5001E78B500FFFFFF00FFFFFF00BBBBBB00CACACA00C5C5
      C500BDBDBD00B8B8B800CBCBCB00FCFCFC00EFEFEF00CECECE00D9D9D900FFFF
      FF00DBDBDB009F9F9F0081818100FFFFFF000000000000000000000000000000
      0000000000000000000090A8B00080E0F00080E0F00080E0F00070D8F00060D0
      F00060B0D00080889000B0C0A00090D0A0000000000000000000000000000000
      00000000000000000000A8A8A800DBDBDB00DBDBDB00DBDBDB00D4D4D400CECE
      CE00B1B1B10089898900B4B4B400BBBBBB00FFFFFF0077BAE7009DCDEE008CC5
      EA0079BBE70070B6E5006AB2E40087C1E900C3E0F400EBF5FB00D4E9F70093C8
      EC0045A0DE002F92D3001975B300FFFFFF00FFFFFF00C0C0C000D2D2D200CACA
      CA00C1C1C100BDBDBD00B9B9B900C7C7C700E3E3E300F5F5F500EBEBEB00CDCD
      CD00A9A9A9009B9B9B007E7E7E00FFFFFF000000000000000000000000000000
      000000000000000000000000000090A8B00090A0B00090A0A0008098A0008090
      A00080889000B9B9BD00A0B8A000B0C0A0000000000000000000000000000000
      0000000000000000000000000000A8A8A800A3A3A3009E9E9E00989898009393
      930089898900BABABA00AEAEAE00B4B4B400FFFFFF00B2D7F10076B9E60067B1
      E4005BAAE10054A7E0004FA5DF004AA2DE004BA3DE0046A1DE003F9DDC003B9B
      DC003196D900238ACF008ABADA00FFFFFF00FFFFFF00DBDBDB00BFBFBF00B8B8
      B800B2B2B200AFAFAF00ADADAD00ABABAB00ABABAB00AAAAAA00A6A6A600A4A4
      A400A0A0A00094949400BEBEBE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0A8A000604830006048
      3000604830006048300060483000604830000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800434343004343
      43004343430043434300434343004343430000000000C7C6C200806850008060
      5000806050007060500070584000705840007050400070504000604830006048
      300060483000A19A9100000000000000000000000000C4C4C400636363005E5E
      5E005E5E5E005C5C5C0053535300535353004E4E4E004E4E4E00434343004343
      4300434343009898980000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0A8A000FFF0F000F0D8
      D000E0D0C000E0C8B000E0C0B000604830000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800F1F1F100D8D8
      D800CCCCCC00C3C3C300BEBEBE0043434300C1C4C300A38D8500E0D0C000B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A0
      9000B0A0900060483000C8CBC90000000000C3C3C3008C8C8C00CCCCCC009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C0043434300CACACA0000000000000000000000000000000000A6A3
      CC001048E0001048E0001048E0000000000000000000C0B0A000FFF8F0007070
      7000F0E8E00070707000E0C8B00060483000000000000000000000000000AFAF
      AF007070700070707000707070000000000000000000ACACAC00F6F6F6007070
      7000E6E6E60070707000C3C3C30043434300BCB7B000B29C9400FFE8E000FFF8
      F000FFF0E000FFE8E000F0D8D000F0D0B000F0C0A00000A0000000A0000000A0
      000070584000604830008577670000000000B5B5B5009B9B9B00E7E7E700F6F6
      F600ECECEC00E7E7E700D8D8D800C9C9C900BBBBBB0060606000606060006060
      6000535353004343430073737300000000000000000000000000000000004070
      F0009E9FD30000000000000000000000000000000000D0B0A000FFFFFF00FFF8
      F000FFF0F000F0E8E000E0D0C000604830000000000000000000000000009191
      9100AEAEAE0000000000000000000000000000000000AEAEAE00FFFFFF00F6F6
      F600F1F1F100E6E6E600CCCCCC0043434300B2948500E0D8D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000F0E0E000F0D8C00000FF100000FFB00000A0
      00008068500070504000604830000000000092929200D6D6D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F100E1E1E100D3D3D3009D9D9D00CDCDCD006060
      6000636363004E4E4E0043434300000000000000000000000000000000001048
      F0000000000000000000000000000000000000000000D0B8A000FFFFFF008088
      8000FFF8F00070707000F0D8D000604830000000000000000000000000007474
      74000000000000000000000000000000000000000000B3B3B300FFFFFF008484
      8400F6F6F60070707000D8D8D80043434300B0908000F0E8E000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8E00000FF100000FF100000A0
      0000907060007060500060483000000000008E8E8E00E6E6E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E6E6E6009D9D9D009D9D9D006060
      60006E6E6E005C5C5C00434343000000000000000000000000006080F0003058
      F0001048E00000000000000000000000000000000000D0B0A000FFFFFF00FFFF
      FF00FFFFFF00FFF8F000FFF0F0006048300000000000000000009E9E9E008181
      81007070700000000000000000000000000000000000AEAEAE00FFFFFF00FFFF
      FF00FFFFFF00F6F6F600F1F1F10043434300B0988000D0C0B000D0B8B000C0B0
      A000B0A09000B0988000A0888000908070009070600080686000806050007058
      50009080700080686000705840000000000093939300BCBCBC00B8B8B800ACAC
      AC009C9C9C0093939300888888007C7C7C006E6E6E00686868005E5E5E005858
      58007C7C7C006868680053535300000000000000000000000000D0CEE00080A0
      FF00D0CADC0000000000000000000000000000000000C0B0A000C0B0A000C0B0
      A000C0B0A000C0B0A000C0A8A000C0A8A0000000000000000000D3D3D300B9B9
      B900D0D0D00000000000000000000000000000000000ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00A8A8A800A8A8A800C0A09000FFF8F000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000FFF0F000F0F0F000F0E8
      E000A08880009078600080605000000000009E9E9E00F6F6F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F1F1F100F0F0F000E6E6
      E60088888800737373005E5E5E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEC9C300B6A18C00D0B0A000C0A8
      A000D0B0A000C0A09000B0908000A08070009070600080605000706050008070
      6000B0A09000A08870008060500000000000C7C7C7009C9C9C00AEAEAE00A8A8
      A800AEAEAE009E9E9E008E8E8E007E7E7E006E6E6E005E5E5E005C5C5C006C6C
      6C009C9C9C00838383005E5E5E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBC7C200C0B0A000E0C8
      C000FFFFFF00FFF8FF00FFF8FF00FFF0F000F0F0E000F0E0E000C0A8A0008060
      5000A0908000C0B0A000806050000000000000000000C5C5C500ACACAC00C8C8
      C800FFFFFF00FAFAFA00FAFAFA00F1F1F100EBEBEB00E1E1E100A8A8A8005E5E
      5E008C8C8C00ACACAC005E5E5E0000000000C0A8A00060483000604830006048
      300060483000604830006048300000000000000000000000000000000000D5D1
      E3001048E000D1CFE1000000000000000000A8A8A80043434300434343004343
      430043434300434343004343430000000000000000000000000000000000D6D6
      D60070707000D4D4D40000000000000000000000000000000000DEDFDD00C0B0
      A000FFFFFF00F0E8E000D0C8C000D0C8C000D0B8B000D0C0B000E0D0D0008068
      600080605000B0989000B0A09000000000000000000000000000DEDEDE00ACAC
      AC00FFFFFF00E6E6E600C6C6C600C6C6C600B8B8B800BCBCBC00D1D1D1006868
      68005E5E5E00989898009C9C9C0000000000C0A8A000FFF0F000F0D8D000E0D0
      C000E0C8B000E0C0B000604830000000000000000000000000000000000080A0
      FF003060F0001048E0000000000000000000A8A8A800F1F1F100D8D8D800CCCC
      CC00C3C3C300BEBEBE004343430000000000000000000000000000000000B9B9
      B90086868600707070000000000000000000000000000000000000000000D8CB
      BC00F0E8E000FFFFFF00FFFFFF00FFFFFF00FFF8FF00FFF0F000F0E0D000D0B8
      B00080605000BAADA8000000000000000000000000000000000000000000C7C7
      C700E6E6E600FFFFFF00FFFFFF00FFFFFF00FAFAFA00F1F1F100DCDCDC00B8B8
      B8005E5E5E00ACACAC000000000000000000C0B0A000FFF8F00070707000F0E8
      E00070707000E0C8B00060483000000000000000000000000000000000000000
      00004070F000000000000000000000000000ACACAC00F6F6F60070707000E6E6
      E60070707000C3C3C30043434300000000000000000000000000000000000000
      000091919100000000000000000000000000000000000000000000000000E5E5
      E600D0B8B000FFFFFF00F0F0F000D0C8C000D0C8C000D0B8B000C0B0B000E0D8
      D00080706000866859000000000000000000000000000000000000000000E5E5
      E500B8B8B800FFFFFF00F0F0F000C6C6C600C6C6C600B8B8B800B1B1B100D6D6
      D6006C6C6C00666666000000000000000000D0B0A000FFFFFF00FFF8F000FFF0
      F000F0E8E000E0D0C0006048300000000000000000000000000000000000AEB7
      EA001048F000000000000000000000000000AEAEAE00FFFFFF00F6F6F600F1F1
      F100E6E6E600CCCCCC004343430000000000000000000000000000000000C5C5
      C500747474000000000000000000000000000000000000000000000000000000
      0000DED5D300E0D1D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F0E8
      E000D0B8B00080605000DCDBDB00000000000000000000000000000000000000
      0000D5D5D500D2D2D200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00E6E6
      E600B8B8B8005E5E5E00DBDBDB0000000000D0B8A000FFFFFF0080888000FFF8
      F00070707000F0D8D0006048300000000000000000006088F0007090F0007090
      F000A8B6EB00000000000000000000000000B3B3B300FFFFFF0084848400F6F6
      F60070707000D8D8D800434343000000000000000000A3A3A300A9A9A900A9A9
      A900C4C4C4000000000000000000000000000000000000000000000000000000
      000000000000DFD6D300D0C0B000D0C0B000D0C0B000D0C0B000D0C0B000D0C0
      B000D0C0B000D0C0B00000000000000000000000000000000000000000000000
      000000000000D6D6D600BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBC
      BC00BCBCBC00BCBCBC000000000000000000D0B0A000FFFFFF00FFFFFF00FFFF
      FF00FFF8F000FFF0F00060483000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAE00FFFFFF00FFFFFF00FFFF
      FF00F6F6F600F1F1F10043434300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0B0A000C0B0A000C0B0A000C0B0
      A000C0B0A000C0A8A000C0A8A000000000000000000000000000000000000000
      000000000000000000000000000000000000ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00A8A8A800A8A8A800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009A8F8C00203040005F686900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F8F8F003333330067676700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8800405060002098C000303840005F6D72000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008A8A8A005353530098989800393939006D6D6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1C0A700D1AC
      9300D5B8A1007F8285005060700020A0D00030B8F00060A0B000506870008068
      5000705840006048300060483000000000000000000000000000BBBBBB00A8A8
      A800B4B4B4008282820063636300A1A1A100BBBBBB009E9E9E00686868006363
      6300535353004343430043434300000000000000000000000000000000000000
      000000000000CDA18700E5BC9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D9D9D00B7B7B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000706860006050
      400060504000606860004088A00040C0F00060B0D00070889000A0989000C0B0
      A000B0A09000B0A0900060483000000000000000000000000000666666004C4C
      4C004C4C4C006464640088888800C1C1C100B1B1B1008888880096969600ACAC
      AC009C9C9C009C9C9C0043434300000000000000000000000000000000000000
      0000AA74570090482000B4765700F0CEB3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070004343430072727200C9C9C9000000000000000000000000000000
      00000000000000000000000000000000000000000000776E6500C0A08000F0E0
      A000F0D8A000B0A89000607070006098B000708890009098A000D0F0E000B0E8
      D000B0E8C000B0A090006048300000000000000000006C6C6C0099999900CECE
      CE00C9C9C900A1A1A1006E6E6E00999999008888880099999900E8E8E800DBDB
      DB00D6D6D6009C9C9C004343430000000000000000000000000000000000A558
      3900D0785000D0704000B0603000CB9173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005656
      5600747474006B6B6B00595959008D8D8D000000000000000000000000000000
      00000000000000000000000000000000000096837200B0988000FFFFC000FFF8
      C000FFF0C000FFF0D000B0A890007070700090A0A000F0F8F000E0F8F000C0F0
      D000C0E8D000C0A8900060483000000000007F7F7F0093939300ECECEC00E7E7
      E700E3E3E300E7E7E700A1A1A100707070009E9E9E00F4F4F400F3F3F300E1E1
      E100DCDCDC00A3A3A30043434300000000000000000000000000A0503000D078
      5000F0906000E19C7500D0886000B96F4200D3A4860000000000000000000000
      00000000000000000000000000000000000000000000000000004E4E4E007474
      74008B8B8B009797970083838300686868009F9F9F0000000000000000000000
      00000000000000000000000000000000000096857500E0D0B000FFFFE000FFFF
      E000FFFFD000FFF0C000F0D8B00060504000E0D8C000E0C8B000D0B0A000D0A8
      9000C0E8D000C0A89000604830000000000081818100C8C8C800F5F5F500F5F5
      F500F0F0F000E3E3E300CECECE004C4C4C00D1D1D100C3C3C300AEAEAE00A4A4
      A400DCDCDC00A3A3A300434343000000000000000000A5603900E0805000F090
      6000F3AF8E0000000000F2AA8600D0886000B4673900EBC9AF00000000000000
      000000000000000000000000000000000000000000005B5B5B007B7B7B008B8B
      8B00ABABAB0000000000A6A6A6008383830060606000C4C4C400000000000000
      000000000000000000000000000000000000BCA99700E0D0B000FFFFF000FFFF
      F000FFFFE000FFF8C000F0D8A00070585000FFFFFF00FFFFFF00FFFFFF00E0F8
      F000D0F0E000C0A8A0006048300000000000A5A5A500C8C8C800FAFAFA00FAFA
      FA00F5F5F500E7E7E700C9C9C90058585800FFFFFF00FFFFFF00FFFFFF00F3F3
      F300E8E8E800A8A8A800434343000000000000000000F1B69800F0A89000F2AC
      8200000000000000000000000000E6AA8600D0886000AA684100F2C7B4000000
      00000000000000000000000000000000000000000000B2B2B200A8A8A800A6A6
      A600000000000000000000000000A5A5A5008383830062626200C5C5C5000000
      000000000000000000000000000000000000D5C0AD00C0A8A000FFFFFF00FFFF
      FF00FFFFE000FFFFD000C0B0800090807000F0E0D000E0C8B000D0B0A000D0A8
      9000E0F8F000C0A8A0006048300000000000BCBCBC00A8A8A800FFFFFF00FFFF
      FF00F5F5F500F0F0F000A3A3A3007C7C7C00DCDCDC00C3C3C300AEAEAE00A4A4
      A400F3F3F300A8A8A800434343000000000000000000FDE0CD00F7CEB6000000
      000000000000000000000000000000000000E19C7500D0785000B47D5600F2CC
      B3000000000000000000000000000000000000000000DDDDDD00CACACA000000
      000000000000000000000000000000000000979797007474740076767600C8C8
      C8000000000000000000000000000000000000000000B4ABA200C0B0B000F0E8
      D000F0E8C000C0B0900080786000D0D0D000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0F8F000C0B0A000604830000000000000000000A9A9A900B1B1B100E1E1
      E100DCDCDC00A8A8A80071717100D0D0D000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4F4F400ACACAC0043434300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E19C7400C0704000C38C
      7400F1CAB0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096969600696969008A8A
      8A00C6C6C6000000000000000000000000000000000000000000C0B0A000B0A0
      9000A0908000B0A0A000B0A8A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0B0A00060483000000000000000000000000000ACACAC009C9C
      9C008C8C8C00A1A1A100A6A6A600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ACACAC0043434300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E29F7900C070
      4000D29B8200EBC3A80000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A9A9A006969
      690099999900BEBEBE0000000000000000000000000000000000F0A89000F0A8
      9000F0A89000F0A88000F0A08000E0987000E0906000E0885000E0805000E070
      4000E0704000E0704000D0603000000000000000000000000000A8A8A800A8A8
      A800A8A8A800A3A3A3009E9E9E009393930089898900808080007B7B7B006C6C
      6C006C6C6C006C6C6C005C5C5C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1AF
      9100C0705000E4B99B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ACAC
      AC006E6E6E00B4B4B40000000000000000000000000000000000F0A89000FFC0
      A000FFC0A000FFC0A000FFB89000FFB89000FFB09000FFA88000FFA88000F0A0
      7000F0987000F0986000D0683000000000000000000000000000A8A8A800BCBC
      BC00BCBCBC00BCBCBC00B3B3B300B3B3B300AEAEAE00A4A4A400A4A4A4009999
      9900949494009090900061616100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1C1A700D291720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BEBEBE008E8E8E0000000000000000000000000000000000F0A89000F0A8
      9000F0A89000F0A89000F0A88000F0A08000F0987000E0987000E0906000E080
      5000E0784000E0784000E0704000000000000000000000000000A8A8A800A8A8
      A800A8A8A800A8A8A800A3A3A3009E9E9E009494940093939300898989007B7B
      7B0071717100717171006C6C6C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D5C5C400958DAF00565B93002C3275002C2B66004948780083738600C9AB
      A100000000000000000000000000000000000000000000000000000000000000
      0000C7C7C700989898006B6B6B00454545003D3D3D00565656007A7A7A00ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AFAA
      BF004853A5001038A0001030B0000030C0000030C0000028B000102080002B27
      5C0097838700000000000000000000000000000000000000000000000000B1B1
      B1006A6A6A00535353005353530056565600565656004D4D4D003B3B3B003737
      3700868686000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5AEC7003C51
      B2001038C0000030D0000030D0000030D0000030D0000030D0000030D0000028
      A0000E1B64009680830000000000000000000000000000000000B6B6B6006C6C
      6C005D5D5D005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B004848
      48002F2F2F00838383000000000000000000B0A0900060483000604830006048
      3000604830006048300060483000604830006048300060483000604830007050
      4000000000000000000000000000000000009C9C9C0043434300434343004343
      4300434343004343430043434300434343004343430043434300434343004E4E
      4E000000000000000000000000000000000000000000D9CCD3004862B4001040
      D0000038E0000038E0000038E0000038E0000038D0000030D0000030D0000030
      D0000028A0002B265B00C5A092000000000000000000D0D0D000787878006666
      660065656500656565006565650065656500606060005B5B5B005B5B5B005B5B
      5B004848480036363600A0A0A00000000000C0A8A000FFFFFF00E0E8E000E0E0
      E000E0E0D000E0D8D000E0D0C000E0C8C000E0C8B000E0C0B000C0A8A0007050
      400000000000000000000000000000000000A8A8A800FFFFFF00E4E4E400E0E0
      E000DBDBDB00D6D6D600CCCCCC00C8C8C800C3C3C300BEBEBE00A8A8A8004E4E
      4E0000000000000000000000000000000000000000009EA3CB002050C0000038
      F0000040F000FFFFFF00FFFFFF004070F0004068F000FFFFFF00FFFFFF000030
      D0000030D000102080007F697A000000000000000000AFAFAF006D6D6D006A6A
      6A006E6E6E00FFFFFF00FFFFFF00929292008D8D8D00FFFFFF00FFFFFF005B5B
      5B005B5B5B003B3B3B007070700000000000C0B0A000FFFFFF00E0C8C000D0C0
      B000D0C0B000FFF0E000D0B0A000D0B0A000D0B0A000F0D8D000C0A8A0007050
      400000000000000000000000000000000000ACACAC00FFFFFF00C8C8C800BCBC
      BC00BCBCBC00ECECEC00AEAEAE00AEAEAE00AEAEAE00D8D8D800A8A8A8004E4E
      4E0000000000000000000000000000000000000000006E81C5002048E0000040
      FF001048FF007098FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006080F0000038
      D0000030D0000028B00047427100000000000000000094949400727272007373
      730079797900B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9F006060
      60005B5B5B004D4D4D005050500000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFF8F000FFF8F000707070005058500000000000D0C0B000D0B0A0007050
      400000000000000000000000000000000000B3B3B300FFFFFF00FFFFFF00FFFF
      FF00F6F6F600F6F6F600707070005454540000000000BCBCBC00AEAEAE004E4E
      4E0000000000000000000000000000000000000000004B68C1005070FF005078
      FF003060FF003060FF00B0C8FF00FFFFFF00FFFFFF00A0B8FF000038F0000038
      E0000030D0000030C0002C296400000000000000000080808000989898009D9D
      9D008B8B8B008B8B8B00D6D6D600FFFFFF00FFFFFF00CBCBCB006A6A6A006565
      65005B5B5B00565656003B3B3B0000000000D0B8A000FFFFFF00E0C8C000E0C8
      C000E0C8C000FFF8F000A0A0A000FFFFFF005090B00010101000C0B0B0008060
      500000000000000000000000000000000000B3B3B300FFFFFF00C8C8C800C8C8
      C800C8C8C800F6F6F600A0A0A000FFFFFF009393930010101000B1B1B1005E5E
      5E0000000000000000000000000000000000000000004B68C1005078FF005080
      FF005078FF004070FF00B0C8FF00FFFFFF00FFFFFF00A0B8FF000040FF000038
      E0000038D0000030C0002C3173000000000000000000808080009D9D9D00A1A1
      A1009D9D9D0096969600D6D6D600FFFFFF00FFFFFF00CBCBCB00737373006565
      650060606000565656004444440000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0A0A00090B8C00070D0E0005098B000101010008070
      600000000000000000000000000000000000B3B3B300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0A0A000B6B6B600CBCBCB0098989800101010006C6C
      6C0000000000000000000000000000000000000000006E87D1005078F0006090
      FF007090FF0090B0FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007098FF000038
      F0000038E0001030B0005354890000000000000000009B9B9B0098989800ADAD
      AD00AEAEAE00C5C5C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3B3B3006A6A
      6A0065656500535353006464640000000000D0B8A000FFFFFF00E0C8C000E0C8
      C000E0C8C000FFFFFF00C0B8B00050A0B00090E0F00060C0D0005098B0001010
      1000C8C0B400000000000000000000000000B3B3B300FFFFFF00C8C8C800C8C8
      C800C8C8C800FFFFFF00B6B6B6009C9C9C00DCDCDC00BBBBBB00989898001010
      1000BDBDBD00000000000000000000000000000000009EA7D3004068E0007098
      FF0080A0FF00FFFFFF00FFFFFF0080A0FF008098FF00FFFFFF00FFFFFF000040
      F0000038E0002038A0008F7D9A000000000000000000B4B4B40088888800B3B3
      B300BABABA00FFFFFF00FFFFFF00BABABA00B5B5B500FFFFFF00FFFFFF006E6E
      6E0065656500555555008888880000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF8F000D0D0D00050A0B00090E0F00060C0D0005098
      B00010101000C8C1B4000000000000000000B3B3B300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F6F6F600D0D0D0009C9C9C00DCDCDC00BBBBBB009898
      980010101000BDBDBD00000000000000000000000000DCCFD6005677D0006080
      F00080A8FF0090B0FF0080A0FF006080FF004070FF003060FF001048FF000040
      F0001040C0004750A100CBABA1000000000000000000D3D3D3008E8E8E009F9F
      9F00BEBEBE00C5C5C500BABABA00A3A3A300969696008B8B8B00797979006E6E
      6E006161610067676700ABABAB0000000000F0B09000F0A89000F0A89000F0A0
      8000F0987000E0906000E0886000E0906000D0A8900060A8B00090E0F00060C0
      D0005098B00010101000D5C8B90000000000ACACAC00A8A8A800A8A8A8009E9E
      9E0094949400898989008484840089898900A4A4A400A3A3A300DCDCDC00BBBB
      BB009898980010101000C4C4C400000000000000000000000000BBB7D3005A76
      D0006080F00080A0FF0080A8FF008098FF006088FF003060FF001048FF001048
      D0003B4FB000A898A70000000000000000000000000000000000C0C0C0008E8E
      8E009F9F9F00BABABA00BEBEBE00B5B5B500A8A8A8008B8B8B00797979006B6B
      6B006A6A6A009E9E9E000000000000000000F0B09000FFC0A000FFC0A000FFB8
      A000FFB89000FFB09000FFA88000FFA88000F0A88000D0B0A00070B0C00090E0
      F00070C8E0008088800030389000BCAEB600ACACAC00BCBCBC00BCBCBC00B7B7
      B700B3B3B300AEAEAE00A4A4A400A4A4A400A3A3A300AEAEAE00AEAEAE00DCDC
      DC00C6C6C6008484840051515100B1B1B100000000000000000000000000BBB6
      D1006477D0005070E0005078F0005080FF005078FF003060E0003050D000475F
      B000AF9EB100000000000000000000000000000000000000000000000000BFBF
      BF00909090008E8E8E0098989800A1A1A1009D9D9D0082828200737373007575
      7500A6A6A600000000000000000000000000F0B09000F0A89000F0A89000F0A8
      9000F0A08000F0A07000E0987000E0906000E0885000E0906000D098800080B0
      C000D0B8B0007088D0006070B00030389000ACACAC00A8A8A800A8A8A800A8A8
      A8009E9E9E00999999009393930089898900808080008989890096969600B0B0
      B000B8B8B8009B9B9B0081818100515151000000000000000000000000000000
      0000DBCCD0009DA5CF006E86CF004B67C0004B67C0006D7EC0009B9BBF00D2BB
      B900000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00B1B1B1009A9A9A007F7F7F007F7F7F0090909000A6A6A600BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DDD4
      CA006070B0007090E0006078D0006070B0000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D1D1
      D10081818100A4A4A40090909000818181000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0C6CE006070B0006070B000DFD2D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9C9C9008181810081818100D3D3D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CFC1C50020309000203090002030
      800020287000C6A7970000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3C3C3004B4B4B004B4B4B004646
      46003C3C3C00A5A5A50000000000000000000000000000000000000000000000
      00000000000000000000707070005058500000000000D0C0AE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000707070005454540000000000BCBCBC00000000000000
      0000000000000000000000000000000000000000000000000000B0A090006048
      3000604830006048300070584000605060001038C0002050D0001038C0001030
      B0001030A00010207000C5A392000000000000000000000000009C9C9C004343
      4300434343004343430053535300565656005C5C5C00717171005C5C5C005353
      53004E4E4E0036363600A1A1A10000000000000000000000000000000000B0A0
      90007C644D00AD957F00A0A0A000FFFFFF005090B00010101000988A76007B61
      4900604830006048300000000000000000000000000000000000000000009C9C
      9C005F5F5F0090909000A0A0A000FFFFFF009393930010101000858585005C5C
      5C00434343004343430000000000000000000000000000000000B0A09000FFFF
      FF00D0C8C000D0C8C000D0C8C0001040E0004068E0003058E0000038E0000038
      D0001030C0001030A000202870000000000000000000000000009C9C9C00FFFF
      FF00C6C6C600C6C6C600C6C6C6006B6B6B00888888007C7C7C00646464006060
      6000585858004E4E4E003C3C3C0000000000000000000000000000000000D6BA
      A800FFFFFF00F0E8E000A0A0A00090B8C00070D0E0005098B00010101000A098
      9000B0A09000604830000000000000000000000000000000000000000000B7B7
      B700FFFFFF00E6E6E600A0A0A000B6B6B600CBCBCB0098989800101010009696
      96009C9C9C004343430000000000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFF8FF00FFF0F0003068F000F0F8FF00FFF8FF00FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00203090000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FAFAFA00F1F1F1008B8B8B00F9F9F900FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA004B4B4B000000000000000000B7B3DA000E2BDF00B8AB
      BD00FFFFFF00FFFFFF00E0E0E00050A0B00060A8E00060C0D0005098B0001010
      1000909090007A5F4600000000000000000000000000BFBFBF005E5E5E00B1B1
      B100FFFFFF00FFFFFF00E0E0E0009C9C9C00B1B1B100BBBBBB00989898001010
      1000909090005A5A5A0000000000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFF8F0003068F000FFF8FF00FFF8FF00FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00203090000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00F6F6F6008B8B8B00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA004B4B4B0000000000000000000028FF000020F0004050
      D000FFFFFF00FFFFFF00FFFFFF004050E0000010B00090E0F00060C0D0005098
      B000101010008B7D7200000000000000000000000000646464005B5B5B007474
      7400FFFFFF00FFFFFF00FFFFFF00797979003E3E3E00DCDCDC00BBBBBB009898
      9800101010007B7B7B0000000000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF003060FF0080A0F0006080F0004060E0002058
      E0000038D0001038C0002038A0000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008A8A8A00B4B4B4009E9E9E00838383007B7B
      7B00606060005C5C5C005454540000000000000000002D51FC001038FF000028
      FF00F0F8FF00FFFFFF009098F0000018C0006078E00060A8B00090E0F00060C0
      D0005098B00010101000CBAF98000000000000000000808080006F6F6F006464
      6400F9F9F900FFFFFF00B1B1B1004848480094949400A3A3A300DCDCDC00BBBB
      BB009898980010101000AAAAAA00000000000000000000000000C0A89000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D0D8F0003068F00090A8F0006080F0005078
      E0002048D0002038B000C8ACAA00000000000000000000000000A3A3A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEDEDE008B8B8B00BBBBBB009E9E9E009393
      93006C6C6C0059595900AEAEAE000000000000000000E7D7DB003050FF002040
      FF0090A0F000C0C8F0000028F0004058F000FFF8F000D0D8E00070B0C00090E0
      F00070C8E0008088800030389000B195950000000000D9D9D900818181007676
      7600B6B6B600D3D3D3006060600083838300F6F6F600D9D9D900AEAEAE00DCDC
      DC00C6C6C6008484840051515100979797000000000000000000C0A8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D8F0003060F0003060F0003060
      E0002048C000C9B0AF0000000000000000000000000000000000A8A8A800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE0086868600868686008181
      810068686800B2B2B20000000000000000000000000000000000DCD0DC004060
      FF003050FF002040FF003050FF00FFF8FF00FFFFFF00FFF8F000D0D8E00080B0
      C000D0B8B0007088D0006070B000303890000000000000000000D4D4D4008C8C
      8C00818181007676760081818100FAFAFA00FFFFFF00F6F6F600D9D9D900B0B0
      B000B8B8B8009B9B9B0081818100515151000000000000000000C0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F0F0F000F0F0F000D0C8
      C000806850000000000000000000000000000000000000000000ACACAC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00F0F0F000F0F0F000C6C6
      C60063636300000000000000000000000000000000000000000000000000B8B5
      D1004068FF004060FF00D0D8FF00FFFFFF00FFFFFF00FFF8FF00F0F0F000D0D8
      D0006070B0007090E0006078D0006070B000000000000000000000000000BDBD
      BD00919191008C8C8C00E2E2E200FFFFFF00FFFFFF00FAFAFA00F0F0F000D4D4
      D40081818100A4A4A40090909000818181000000000000000000D0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000D0C8
      C000604830000000000000000000000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000C6C6
      C600434343000000000000000000000000000000000000000000C6C4E2006078
      FF006078FF006080FF005070FF00F0F0FF00FFFFFF00FFFFFF00FFF8F000F0F0
      F000B0A0A0006070B0006070B000D1B2A5000000000000000000CDCDCD009E9E
      9E009E9E9E00A2A2A20097979700F4F4F400FFFFFF00FFFFFF00F6F6F600F0F0
      F000A1A1A1008181810081818100B1B1B1000000000000000000D0B8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A000C0A8
      A000604830000000000000000000000000000000000000000000B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A800A8A8
      A8004343430000000000000000000000000000000000B1B6E9005078FF005078
      FF00C0D0FF00FFFFFF007088FF006078FF00D0E0FF00FFFFFF00FFFFFF00B0A0
      9000B0A0900096785E00000000000000000000000000C4C4C4009C9C9C009C9C
      9C00DCDCDC00FFFFFF00A9A9A9009E9E9E00E7E7E700FFFFFF00FFFFFF009C9C
      9C009C9C9C007373730000000000000000000000000000000000D0B8B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A09000604830006048
      3000604830000000000000000000000000000000000000000000B8B8B800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00434343004343
      430043434300000000000000000000000000859BF3005078FF005078FF00C8BE
      D100FFFFFF00FFFFFF00FFFFFF00B0C8FF008098FF00FFFFFF00B0A090008068
      500080605000604830000000000000000000B3B3B3009C9C9C009C9C9C00C4C4
      C400FFFFFF00FFFFFF00FFFFFF00D6D6D600B4B4B400FFFFFF009C9C9C006363
      63005E5E5E004343430000000000000000000000000000000000D0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C0006048
      3000DFBDA7000000000000000000000000000000000000000000BCBCBC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6C6004343
      4300B9B9B900000000000000000000000000859BF3006585FA00DCD2DC00D8C7
      B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8
      C00080685000DEBAA5000000000000000000B3B3B300A4A4A400D6D6D600C3C3
      C300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6
      C60063636300B7B7B70000000000000000000000000000000000E0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000E0BE
      AA00000000000000000000000000000000000000000000000000BEBEBE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A80043434300BBBB
      BB0000000000000000000000000000000000000000000000000000000000D0C0
      B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A0008070
      6000DFBDA700000000000000000000000000000000000000000000000000BCBC
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A8006C6C
      6C00B9B9B9000000000000000000000000000000000000000000E0C0B000E0C0
      B000E0C0B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000E0C0AD000000
      0000000000000000000000000000000000000000000000000000BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE00BDBDBD000000
      000000000000000000000000000000000000000000000000000000000000E0C0
      B000E0C0B000E0C0B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000E0BE
      AA0000000000000000000000000000000000000000000000000000000000BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE00BBBB
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0A090006048
      3000604830006048300060483000604830006048300060483000604830006048
      30006048300000000000000000000000000000000000000000009C9C9C004343
      4300434343004343430043434300434343004343430043434300434343004343
      4300434343000000000000000000000000000000000000000000C0686000B058
      5000A0505000A0505000A0505000904850009048400090484000804040008038
      40008038400070384000703830000000000000000000000000006E6E6E005E5E
      5E00585858005858580058585800515151004C4C4C004C4C4C00464646004141
      410041414100404040003B3B3B00000000000000000000000000B0A09000FFFF
      FF00B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C004343430000000000000000000000000000000000D0687000F0909000E080
      8000B048200040302000C0B8B000C0B8B000D0C0C000D0C8C00050505000A040
      3000A0403000A038300070384000000000000000000074747400999999008989
      8900464646002C2C2C00B6B6B600B6B6B600C1C1C100C6C6C600505050004444
      4400444444004040400040404000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFF8FF00F0F0F000F0E8E000F0E0D000E0D0D000E0C8C000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FAFAFA00F0F0F000E6E6E600DCDCDC00D1D1D100C8C8C8009C9C
      9C004343430000000000000000000000000000000000D0707000FF98A000F088
      8000E0808000705850004040300090787000F0E0E000F0E8E00090807000A040
      3000A0404000A040300080384000000000000000000079797900A4A4A4009090
      900089898900585858003B3B3B0078787800E1E1E100E6E6E6007C7C7C004444
      4400494949004444440041414100000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E0E000F0D8D000E0D0C000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00F6F6F600F0F0F000E1E1E100D8D8D800CCCCCC009C9C
      9C004343430000000000000000000000000000000000D0787000FFA0A000F090
      9000F0888000705850000000000040403000F0D8D000F0E0D00080786000B048
      4000B0484000A04040008040400000000000000000007E7E7E00A9A9A9009999
      99009090900058585800000000003B3B3B00D8D8D800DCDCDC00717171005050
      5000505050004949490046464600000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF0F000F0E8E000F0E0E000E0D8D000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1F1F100E6E6E600E1E1E100D6D6D6009C9C
      9C004343430000000000000000000000000000000000D0788000FFA8B000FFA0
      A000F0909000705850007058500070585000705850007060500080686000C058
      5000B0505000B048400080404000000000000000000083838300B3B3B300A9A9
      A90099999900585858005858580058585800585858005C5C5C00686868006060
      6000595959005050500046464600000000000000000000000000C0A89000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000B0A0
      9000604830000000000000000000000000000000000000000000A3A3A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8D8009C9C
      9C004343430000000000000000000000000000000000E0808000FFB0B000FFB0
      B000FFA0A000F0909000F0888000E0808000E0788000D0707000D0687000C060
      6000C0585000B050500090484000000000000000000089898900B7B7B700B7B7
      B700A9A9A9009999990090909000898989008484840079797900747474006969
      690060606000595959004C4C4C00000000000000000000000000C0A8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8E000F0E0E000B0A0
      9000604830000000000000000000000000000000000000000000A8A8A800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E6E6E600E1E1E1009C9C
      9C004343430000000000000000000000000000000000E0889000FFB8C000FFB8
      B000D0606000C0605000C0585000C0504000B0503000B0483000A0402000A038
      1000C0606000C058500090484000000000000000000093939300C1C1C100BCBC
      BC006B6B6B00646464006060600056565600505050004B4B4B00404040003636
      360069696900606060004C4C4C00000000000000000000000000C0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F0F0F000F0E8E000B0A0
      9000604830000000000000000000000000000000000000000000ACACAC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00F0F0F000E6E6E6009C9C
      9C004343430000000000000000000000000000000000E0909000FFC0C000D068
      6000FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0C000E0C8
      C000A0381000C060600090485000000000000000000098989800C6C6C6007070
      7000FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8D800CCCCCC00C8C8
      C800363636006969690051515100000000000000000000000000D0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000B0A0
      9000604830000000000000000000000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F0009C9C
      9C004343430000000000000000000000000000000000E098A000FFC0C000D070
      7000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0
      C000A0402000D0686000A05050000000000000000000A1A1A100C6C6C6007979
      7900FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8D800CCCC
      CC00404040007070700058585800000000000000000000000000D0B8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A09000B0A0
      9000604830000000000000000000000000000000000000000000B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C009C9C
      9C004343430000000000000000000000000000000000F0A0A000FFC0C000E078
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8
      D000B0483000D0707000A05050000000000000000000A8A8A800C6C6C6008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8
      D8004B4B4B007979790058585800000000000000000000000000D0B8B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A09000604830006048
      3000604830000000000000000000000000000000000000000000B8B8B800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00434343004343
      43004343430000000000000000000000000000000000F0A8A000FFC0C000E080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8
      E000B0503000E0788000A05050000000000000000000ACACAC00C6C6C6008989
      8900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6
      E600505050008484840058585800000000000000000000000000D0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C0006048
      3000DACAC1000000000000000000000000000000000000000000BCBCBC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6C6004343
      4300C8C8C80000000000000000000000000000000000F0B0B000FFC0C000F088
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0
      F000C050400060303000B05850000000000000000000B6B6B600C6C6C6009494
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0
      F00056565600343434005E5E5E00000000000000000000000000E0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000DBCA
      C200000000000000000000000000000000000000000000000000BEBEBE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A80043434300C9C9
      C9000000000000000000000000000000000000000000F0B0B000FFC0C000FF90
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8
      F000C0585000B0586000B05860000000000000000000B6B6B600C6C6C6009B9B
      9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6
      F600606060006363630063636300000000000000000000000000E0C0B000E0C0
      B000E0C0B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000DCCAC2000000
      0000000000000000000000000000000000000000000000000000BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE00C9C9C9000000
      00000000000000000000000000000000000000000000F0B8B000F0B8B000F0B0
      B000F0B0B000F0A8B000F0A0A000E098A000E0909000E0909000E0889000E080
      8000D0788000D0787000D07070000000000000000000BBBBBB00BBBBBB00B6B6
      B600B6B6B600B1B1B100A8A8A800A1A1A1009898980098989800939393008989
      8900838383007E7E7E0079797900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E000E000E00000008000E000E0000000
      0000E000E00000000000E000E00000000000E000E00000000000000000000000
      00007F807F800000000078007800000000000000000000000000400040000000
      00004080408000000000000000000000000108000800000000017F817F810000
      00010003000300000003E007E0070000FFFFFFFFFFFFE000C001C001C0018000
      DFFDC001C0010000DCFDC001C0010000D87DC001C0010000D01DC001C0010000
      D11DC001C0010000DB8DC001C0010000DFC5C001C0010000DFE1C001C0010000
      D801C001C0010000DBCDC001C0010000DC5DC001C0010001C1C1C001C0010001
      FC1FFFFFFFFF0001FFFFFFFFFFFF0003FFFFE01FE01FFFFF8001E01FE01FC001
      9001E01FE01FC0019B51E01FE01FC0019EA9E010E010C0019F51E01FE01FC001
      A0E9E019E019C001A63DE010E010C001AF05E039E039C001AF01E079E079C001
      A601BFF9BFF9C001A0019FFF9FFFC001BFFD8FF98FF9C00180019FFF9FFFC001
      FFFFBFF9BFF9FC1FFFFFFFFFFFFFFFFFFFFFFF83FF83FFFFFC00FF01FF018001
      80009E009EE0800100000E000EE080010000060046E0800100008200A2E08001
      0001C200DAE080010003E000E40080010007F800F8E880010007F801FB7D8001
      0007F803FB8380010007F807FBF780010007F807FBF78001800FFC0FFDEF8001
      F8FFFE1FFE1FFFFFFFFFFFFFFFFFFFFFFFF1FFF1F800F80080008000F800F800
      8000800000000000800080000000000080018001000000008003800300000000
      800780070000000080078007000000008007800700000000800F800F00000000
      800F800F00070007800F800F00070007801F801F00F800F8803F803F01F801F8
      807F807FFF90FF90FFFFFFFFFF83FF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFC0FFC0FFC0FFC0FFFFFFFFFFFFFFFFFFF0FFF0FFF0FFF0FFFFFFFFFFFFFFFF
      FFF0FFF0FFF0FFF0E1FFE1FFFFFFFFFFE1C0E1C0FFC0FFC0807F807FFFFFFFFF
      8070807080708070807F807F807F807F8070807080708070E1FFE1FF807F807F
      E1C0E1C0FFC0FFC0FFFFFFFFFFFFFFFFFFFFFFFF80018001000F000F00000000
      000F000F00000000000F000F00000000000F000F00000000000F000F00000000
      000F000F00000000000F000F00000000000C000C000000000000000000000000
      00000000000000000000000000000000F800F80000000000FC00FC0000000000
      FE00FE0000000000FFFFFFFF80018001FFFFFFFFFF80FF8080038003FF80FF80
      00010001E180E18000010001E780E78000010001EF80EF8000010001C780C780
      00010001C780C78000010001FFFFFFFF00010001FFFFFFFF8001800101E301E3
      C001C00101E301E3E003E00301F701F7E003E00301E701E7F001F00101870187
      F803F80301FF01FFFFFFFFFF01FF01FFFFFFFFFFFFFFFFFFFE3FFE3FFFFFFFFF
      FC1FFC1FFFFFFFFFC001C001F9FFF9FFC001C001F0FFF0FF80018001E0FFE0FF
      00010001C07FC07F00010001843F843F000100018E1F8E1F000100019F0F9F0F
      80018001FF87FF87C001C001FFC3FFC3C001C001FFE3FFE3C001C001FFF3FFF3
      C001C001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00FFFFFFFFF
      E007E007FFFFFFFFC003C003000F000F80018001000F000F80018001000F000F
      80018001000F000F80018001000F000F80018001000F000F8001800100070007
      80018001000300038001800100010001C003C00300000000E007E00700000000
      F00FF00FFFE0FFE0FFFFFFFFFFF0FFF0FFFFFFFFFF03FF03FC3FFC3FC001C001
      E003E003C001C001E003E003C001C00180038003C001C00180038003C001C001
      80018001C001C00180008000C003C003C000C000C007C007E000E000C007C007
      C000C000C007C00780038003C007C00700030003C007C00700030003C00FC00F
      E007E007C01FC01FE00FE00FFFFFFFFFFFFFFFFFFFFFFFFFC007C007C001C001
      C007C00780018001C007C00780018001C007C00780018001C007C00780018001
      C007C00780018001C007C00780018001C007C00780018001C007C00780018001
      C007C00780018001C007C00780018001C007C00780018001C00FC00F80018001
      C01FC01F80018001FFFFFFFFFFFFFFFF}
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBEMPRESA'
    Left = 928
    Top = 352
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 960
    Top = 352
  end
  object cdsTabelaItens: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnNewRecord = cdsTabelaItensNewRecord
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    i.ano'
      '  , i.codigo'
      '  , i.empresa'
      '  , i.seq'
      '  , i.produto'
      '  , i.quantidade'
      '  , i.unidade'
      '  , i.valor_unitario_ref'
      '  , i.valor_total_ref'
      '  , i.valor_unitario_min'
      '  , i.valor_total_min'
      '  , i.valor_unitario_max'
      '  , i.valor_total_max'
      '  , i.valor_unitario_media'
      '  , i.valor_total_media'
      '  , i.usuario'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      'from TBCOTACAO_COMPRAITEM i'
      '  left join TBPRODUTO p on (p.cod = i.produto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)')
    ModifySQL.Strings = (
      '')
    UpdateObject = IbUpdTabelaItens
    Left = 680
    Top = 400
    object cdsTabelaItensANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBCOTACAO_COMPRAITEM"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTabelaItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TBCOTACAO_COMPRAITEM"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabelaItensEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBCOTACAO_COMPRAITEM"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object cdsTabelaItensSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = '"TBCOTACAO_COMPRAITEM"."SEQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTabelaItensPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = '"TBCOTACAO_COMPRAITEM"."PRODUTO"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsTabelaItensQUANTIDADE: TIBBCDField
      FieldName = 'QUANTIDADE'
      Origin = '"TBCOTACAO_COMPRAITEM"."QUANTIDADE"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensUNIDADE: TSmallintField
      FieldName = 'UNIDADE'
      Origin = '"TBCOTACAO_COMPRAITEM"."UNIDADE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTabelaItensVALOR_UNITARIO_REF: TIBBCDField
      FieldName = 'VALOR_UNITARIO_REF'
      Origin = '"TBCOTACAO_COMPRAITEM"."VALOR_UNITARIO_REF"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_TOTAL_REF: TIBBCDField
      FieldName = 'VALOR_TOTAL_REF'
      Origin = '"TBCOTACAO_COMPRAITEM"."VALOR_TOTAL_REF"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_UNITARIO_MIN: TIBBCDField
      FieldName = 'VALOR_UNITARIO_MIN'
      Origin = '"TBCOTACAO_COMPRAITEM"."VALOR_UNITARIO_MIN"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_TOTAL_MIN: TIBBCDField
      FieldName = 'VALOR_TOTAL_MIN'
      Origin = '"TBCOTACAO_COMPRAITEM"."VALOR_TOTAL_MIN"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_UNITARIO_MAX: TIBBCDField
      FieldName = 'VALOR_UNITARIO_MAX'
      Origin = '"TBCOTACAO_COMPRAITEM"."VALOR_UNITARIO_MAX"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_TOTAL_MAX: TIBBCDField
      FieldName = 'VALOR_TOTAL_MAX'
      Origin = '"TBCOTACAO_COMPRAITEM"."VALOR_TOTAL_MAX"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_UNITARIO_MEDIA: TIBBCDField
      FieldName = 'VALOR_UNITARIO_MEDIA'
      Origin = '"TBCOTACAO_COMPRAITEM"."VALOR_UNITARIO_MEDIA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_TOTAL_MEDIA: TIBBCDField
      FieldName = 'VALOR_TOTAL_MEDIA'
      Origin = '"TBCOTACAO_COMPRAITEM"."VALOR_TOTAL_MEDIA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBCOTACAO_COMPRAITEM"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = '"TBPRODUTO"."DESCRI_APRESENTACAO"'
      ProviderFlags = []
      Size = 100
    end
    object cdsTabelaItensUNP_DESCRICAO: TIBStringField
      FieldName = 'UNP_DESCRICAO'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensUNP_SIGLA: TIBStringField
      FieldName = 'UNP_SIGLA'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      ProviderFlags = []
      Size = 5
    end
  end
  object IbUpdTabelaItens: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODIGO,'
      '  EMPRESA,'
      '  SEQ,'
      '  PRODUTO,'
      '  QUANTIDADE,'
      '  UNIDADE,'
      '  VALOR_UNITARIO_REF,'
      '  VALOR_TOTAL_REF,'
      '  VALOR_UNITARIO_MIN,'
      '  VALOR_TOTAL_MIN,'
      '  VALOR_UNITARIO_MAX,'
      '  VALOR_TOTAL_MAX,'
      '  VALOR_UNITARIO_MEDIA,'
      '  VALOR_TOTAL_MEDIA,'
      '  USUARIO'
      'from TBCOTACAO_COMPRAITEM '
      'where'
      '  ANO = :ANO and'
      '  CODIGO = :CODIGO and'
      '  EMPRESA = :EMPRESA and'
      '  SEQ = :SEQ')
    ModifySQL.Strings = (
      'update TBCOTACAO_COMPRAITEM'
      'set'
      '  ANO = :ANO,'
      '  CODIGO = :CODIGO,'
      '  EMPRESA = :EMPRESA,'
      '  PRODUTO = :PRODUTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  SEQ = :SEQ,'
      '  UNIDADE = :UNIDADE,'
      '  USUARIO = :USUARIO,'
      '  VALOR_TOTAL_MAX = :VALOR_TOTAL_MAX,'
      '  VALOR_TOTAL_MEDIA = :VALOR_TOTAL_MEDIA,'
      '  VALOR_TOTAL_MIN = :VALOR_TOTAL_MIN,'
      '  VALOR_TOTAL_REF = :VALOR_TOTAL_REF,'
      '  VALOR_UNITARIO_MAX = :VALOR_UNITARIO_MAX,'
      '  VALOR_UNITARIO_MEDIA = :VALOR_UNITARIO_MEDIA,'
      '  VALOR_UNITARIO_MIN = :VALOR_UNITARIO_MIN,'
      '  VALOR_UNITARIO_REF = :VALOR_UNITARIO_REF'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  SEQ = :OLD_SEQ')
    InsertSQL.Strings = (
      'insert into TBCOTACAO_COMPRAITEM'
      
        '  (ANO, CODIGO, EMPRESA, PRODUTO, QUANTIDADE, SEQ, UNIDADE, USUA' +
        'RIO, VALOR_TOTAL_MAX, '
      
        '   VALOR_TOTAL_MEDIA, VALOR_TOTAL_MIN, VALOR_TOTAL_REF, VALOR_UN' +
        'ITARIO_MAX, '
      '   VALOR_UNITARIO_MEDIA, VALOR_UNITARIO_MIN, VALOR_UNITARIO_REF)'
      'values'
      
        '  (:ANO, :CODIGO, :EMPRESA, :PRODUTO, :QUANTIDADE, :SEQ, :UNIDAD' +
        'E, :USUARIO, '
      
        '   :VALOR_TOTAL_MAX, :VALOR_TOTAL_MEDIA, :VALOR_TOTAL_MIN, :VALO' +
        'R_TOTAL_REF, '
      
        '   :VALOR_UNITARIO_MAX, :VALOR_UNITARIO_MEDIA, :VALOR_UNITARIO_M' +
        'IN, :VALOR_UNITARIO_REF)')
    DeleteSQL.Strings = (
      'delete from TBCOTACAO_COMPRAITEM'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  SEQ = :OLD_SEQ')
    Left = 712
    Top = 400
  end
  object DtSrcTabelaItens: TDataSource
    AutoEdit = False
    DataSet = cdsTabelaItens
    OnStateChange = DtSrcTabelaItensStateChange
    OnDataChange = DtSrcTabelaItensDataChange
    Left = 744
    Top = 400
  end
  object ppImprimir: TPopupMenu
    Images = ImgList
    Left = 352
    Top = 376
    object nmImprimirCotacao: TMenuItem
      Caption = 'Cota'#231#227'o de Compra/Servi'#231'o'
      ImageIndex = 16
      OnClick = nmImprimirCotacaoClick
    end
    object nmImprimirCotacaoMapa: TMenuItem
      Caption = 'Cota'#231#227'o de Compra/Servi'#231'o (Mapa de Pre'#231'os)'
    end
  end
  object qryProduto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    p.cod'
      '  , p.descri'
      '  , p.descri_apresentacao'
      '  , p.codunidade'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      'from TBPRODUTO p'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)'
      'where p.codigo = :produto')
    ModifySQL.Strings = (
      '')
    Left = 1040
    Top = 264
  end
  object tblTipoCotacao: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'VW_TIPO_COTACAO'
    TableTypes = [ttView]
    Left = 928
    Top = 384
  end
  object dtsTipoCotacao: TDataSource
    DataSet = tblTipoCotacao
    Left = 960
    Top = 384
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
      end
      item
        Name = 'FORMAPAGTO_NFCE'
        DataType = ftString
        Size = 2
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
    Left = 928
    Top = 416
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 960
    Top = 416
  end
  object tblCondicaoPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'VW_CONDICAOPAGTO'
    TableTypes = [ttView]
    Left = 928
    Top = 448
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = tblCondicaoPagto
    Left = 960
    Top = 448
  end
  object cdsTransportador: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    f.codforn'
      '  , f.nomeforn'
      '  , f.cnpj'
      'from TBFORNECEDOR f'
      'where f.transportadora = 1'
      'order by'
      '    f.nomeforn')
    ModifySQL.Strings = (
      '')
    Left = 928
    Top = 480
  end
  object dtsTransportador: TDataSource
    DataSet = cdsTransportador
    Left = 960
    Top = 480
  end
  object qryFornecedor: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
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
      
        '  , (Select count(x.item) from TBCOTACAO_COMPRAFORN_ITEM x where' +
        ' x.ano = c.ano and x.codigo = c.codigo and x.empresa = c.empresa' +
        ' and x.fornecedor = c.fornecedor) as Itens'
      'from TBCOTACAO_COMPRAFORN c'
      '  left join TBFORNECEDOR f on (f.codforn = c.fornecedor)'
      '  left join TBFORMPAGTO fp on (fp.cod = c.forma_pagto)'
      
        '  left join VW_CONDICAOPAGTO cp on (cp.cond_cod = c.condicao_pag' +
        'to)')
    ModifySQL.Strings = (
      '')
    UpdateObject = updFornecedor
    Left = 680
    Top = 432
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
    object qryFornecedorVALOR_TOTAL_BRUTO: TIBBCDField
      FieldName = 'VALOR_TOTAL_BRUTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."VALOR_TOTAL_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object qryFornecedorVALOR_TOTAL_DESCONTO: TIBBCDField
      FieldName = 'VALOR_TOTAL_DESCONTO'
      Origin = '"TBCOTACAO_COMPRAFORN"."VALOR_TOTAL_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object qryFornecedorVALOR_TOTAL_LIQUIDO: TIBBCDField
      FieldName = 'VALOR_TOTAL_LIQUIDO'
      Origin = '"TBCOTACAO_COMPRAFORN"."VALOR_TOTAL_LIQUIDO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 2
    end
    object qryFornecedorVENCEDOR: TSmallintField
      Alignment = taCenter
      FieldName = 'VENCEDOR'
      Origin = '"TBCOTACAO_COMPRAFORN"."VENCEDOR"'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnGetText = qryFornecedorVENCEDORGetText
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
    object qryFornecedorITENS: TIntegerField
      FieldName = 'ITENS'
      ProviderFlags = []
      DisplayFormat = ',0'
    end
  end
  object dtsFornecedor: TDataSource
    AutoEdit = False
    DataSet = qryFornecedor
    OnStateChange = dtsFornecedorStateChange
    Left = 744
    Top = 432
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
      '  EMAIL_ENVIO = :EMAIL_ENVIO,'
      '  EMPRESA = :EMPRESA,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  NOME_CONTATO = :NOME_CONTATO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  PRAZO_ENTREDA_DIA = :PRAZO_ENTREDA_DIA,'
      '  PRAZO_ENTREGA_DATA = :PRAZO_ENTREGA_DATA,'
      '  USUARIO = :USUARIO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  FORNECEDOR = :OLD_FORNECEDOR')
    InsertSQL.Strings = (
      'insert into TBCOTACAO_COMPRAFORN'
      
        '  (ANO, ATIVO, CODIGO, CONDICAO_PAGTO, EMAIL_ENVIO, EMPRESA, FOR' +
        'MA_PAGTO, '
      
        '   FORNECEDOR, NOME_CONTATO, OBSERVACAO, PRAZO_ENTREDA_DIA, PRAZ' +
        'O_ENTREGA_DATA, '
      '   USUARIO)'
      'values'
      
        '  (:ANO, :ATIVO, :CODIGO, :CONDICAO_PAGTO, :EMAIL_ENVIO, :EMPRES' +
        'A, :FORMA_PAGTO, '
      
        '   :FORNECEDOR, :NOME_CONTATO, :OBSERVACAO, :PRAZO_ENTREDA_DIA, ' +
        ':PRAZO_ENTREGA_DATA, '
      '   :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBCOTACAO_COMPRAFORN'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODIGO = :OLD_CODIGO and'
      '  EMPRESA = :OLD_EMPRESA and'
      '  FORNECEDOR = :OLD_FORNECEDOR')
    Left = 712
    Top = 432
  end
  object ppCotacaoFornecedor: TPopupMenu
    Images = ImgList
    Left = 240
    Top = 552
    object nmGerarArquivoXLS: TMenuItem
      Caption = '1. Gerar Arquivo XLS (Planilha em Excel)'
      Hint = 'Gerar Arquivo XLS (Planilha em Excel)'
      ImageIndex = 45
      OnClick = nmGerarArquivoXLSClick
    end
    object nmProcessarArquivoXLS: TMenuItem
      Caption = '2. Processar Retorno XLS (Planilha em Excel)'
    end
  end
end
