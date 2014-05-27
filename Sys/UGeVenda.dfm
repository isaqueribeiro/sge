inherited frmGeVenda: TfrmGeVenda
  Left = 302
  Top = 122
  Width = 1132
  Height = 724
  ActiveControl = nil
  Caption = 'Controle de Vendas'
  OldCreateOrder = True
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
      Caption = 'Im&primir'
      Visible = True
    end
    inherited bvlToolExpandir: TBevel
      Width = 12
    end
    inherited btbtnSelecionar: TBitBtn
      Left = 553
      Width = 32
    end
    inherited bvlTool4: TBevel
      Left = 585
    end
    object btnConsultarProduto: TBitBtn
      Left = 589
      Top = 2
      Width = 75
      Height = 31
      Hint = 'Consulta Produtos'
      Caption = 'P&rodutos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      TabStop = False
      OnClick = btnConsultarProdutoClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA05027954B25
        944A24944A24944A24944A24944A24944A24944A24944A24944A24944A24944A
        24964C25A15127FF00FFAB4E21FEF4E9FEF0E0FEECD7FEE8CFFEE4C7FEE1C1FE
        DEBBFEDDB8FEDDB8FEDDB8FEDDB8FEDDB8FEDDB8914923FF00FFAB4E21FEF8F2
        4571FA4571FA4571FAFEE9D2A23F08A23F08A23F08FEDDB8059ACD059ACD059A
        CDFEDDB88F4823FF00FFAB4E21FEFCF94571FA4571FA4571FAFEEEDCA23F08A2
        3F08A23F08FEE0BE059ACD059ACD059ACDFEDDB88F4823FF00FFAB4E21FEFEFE
        4571FA4571FA4571FAFEF3E7A23F08A23F08A23F08FEE3C6059ACD059ACD059A
        CDFEDDB88F4823FF00FFAB4E21FEFEFEFEFEFEFEFDFCFEFBF7FEF7F0FEF4E8FE
        F0E1FEECD7FEE8D0FEE4C8FEE1C0FEDEBBFEDDB88F4823FF00FFAB4E21FEFEFE
        CC9A99CC9A99CC9A99FEFCF9E27E03E27E03E27E03FEEDDA029A03029A03029A
        03FEDFBD8F4823FF00FFAB4E21FEFEFECC9A99CC9A99CC9A99FEFEFEE27E03E2
        7E03E27E03FEF2E5029A03029A03029A03FEE2C48F4823FF00FFAB4E21FEFEFE
        CC9A99CC9A99CC9A99FEFEFEE27E03E27E03E27E03FEF7EE029A03029A03029A
        03FEE7CD8E4722FF00FFAB4E21E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4
        E4E4E4E4E4E4E4E4E4E2E1E4E0DCE4DED6E4DACF944D29FF00FFAE5C27AE6122
        AD5F20AD5F20AD5F20AD5F20AD5F20AD5F20AD5F21AF6225AE6122AF6225AC60
        24AA61288F4823FF00FFAE5C27EE9733EE9733EE9733EE9733EE9733EE9733EE
        9733EE9733EE9733EE9733EE9733EE9733EE9733B95D19FF00FFFF00FFCB731A
        CC731ACC731ACC731ACC731ACC731ACC731ACC741ACD751BCC7318CD751BCA72
        1AC8721EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object Bevel13: TBevel
      Left = 664
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object Bevel11: TBevel
      Left = 668
      Top = 2
      Width = 28
      Height = 31
      Shape = bsSpacer
      Visible = False
    end
    object btbtnFinalizar: TBitBtn
      Left = 696
      Top = 2
      Width = 120
      Height = 31
      Caption = '&Finalizar Venda'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btbtnFinalizarClick
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
    object btbtnGerarNFe: TBitBtn
      Left = 816
      Top = 2
      Width = 120
      Height = 31
      Caption = '&Gerar NF-e'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btbtnGerarNFeClick
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
    object btbtnCancelarVND: TBitBtn
      Left = 936
      Top = 2
      Width = 120
      Height = 31
      Hint = 'Cancelar Venda Selecionada'
      Caption = 'Cancelar Venda'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = btbtnCancelarVNDClick
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
      Left = 1056
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
            FieldName = 'CODCONTROL'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVENDA'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 279
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALVENDA_BRUTA'
            Title.Caption = 'Total Venda (R$)'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALVENDA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Total L'#237'quido (R$)'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LUCRO_CALCULADO'
            Title.Caption = 'Margem (%)'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 544
        Width = 1108
        Height = 70
        object lblVendaCancelada: TLabel [0]
          Left = 2
          Top = 24
          Width = 118
          Height = 13
          Caption = '* Vendas Canceladas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVendaAberta: TLabel [1]
          Left = 2
          Top = 4
          Width = 99
          Height = 13
          Caption = '* Vendas Abertas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ShpLucroZerado: TShape [2]
          Left = 2
          Top = 49
          Width = 15
          Height = 15
          Brush.Color = clYellow
        end
        object lblLucroZerado: TLabel [3]
          Left = 22
          Top = 50
          Width = 73
          Height = 13
          Caption = 'Lucro zerado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object ShpLucroNegativo: TShape [4]
          Left = 99
          Top = 49
          Width = 15
          Height = 15
          Brush.Color = 7434751
        end
        object lblLucroNegativo: TLabel [5]
          Left = 119
          Top = 50
          Width = 46
          Height = 13
          Caption = 'Preju'#237'zo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 489
          Width = 615
          Height = 62
          TabOrder = 1
          DesignSize = (
            615
            62)
          inherited lbltFiltrar: TLabel
            Left = 294
            Top = 27
            Width = 89
            Caption = 'Venda / Cliente:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 570
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
            Left = 392
            Top = 23
            Width = 174
            TabOrder = 2
          end
          object e1Data: TDateEdit
            Left = 72
            Top = 23
            Width = 102
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
        object RdgStatusVenda: TRadioGroup
          Left = 233
          Top = 4
          Width = 256
          Height = 62
          Align = alRight
          Caption = '&Status venda'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            '(Todas)'
            'Atendimento/Aberta'
            '--'
            'Finalizada'
            'NF-e emitida'
            'Cancelada')
          TabOrder = 0
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 233
        Width = 1108
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 113
        Width = 1108
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel6: TBevel [2]
        Left = 0
        Top = 420
        Width = 1108
        Height = 4
        Align = alBottom
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1108
        Height = 113
        Caption = 'Dados da venda'
        inherited lblCodigo: TLabel
          Width = 58
          Caption = 'No. Venda:'
        end
        object lblEmpresa: TLabel [1]
          Left = 240
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblCliente: TLabel [2]
          Left = 672
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Cliente:'
          FocusControl = dbCliente
        end
        object lblDataHora: TLabel [3]
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
        object lblSerie: TLabel [4]
          Left = 16
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
        object lblNFe: TLabel [5]
          Left = 56
          Top = 64
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
        object lblDataEmissao: TLabel [6]
          Left = 160
          Top = 64
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
        object lblSituacao: TLabel [7]
          Left = 328
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
        object lblVendedor: TLabel [8]
          Left = 856
          Top = 64
          Width = 50
          Height = 13
          Caption = 'Vendedor:'
          FocusControl = dbVendedor
        end
        object lblValorTotal: TLabel [9]
          Left = 720
          Top = 64
          Width = 103
          Height = 13
          Caption = 'Total L'#237'quido (R$):'
          FocusControl = dbValorTotal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValorDesconto: TLabel [10]
          Left = 616
          Top = 64
          Width = 84
          Height = 13
          Caption = 'Desconto (R$):'
          FocusControl = dbValorDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCFOPVenda: TLabel [11]
          Left = 248
          Top = 64
          Width = 31
          Height = 13
          Caption = 'CFOP:'
          FocusControl = dbCFOPVenda
        end
        object lblValorTotalBruto: TLabel [12]
          Left = 480
          Top = 64
          Width = 98
          Height = 13
          Caption = 'Total Venda (R$):'
          FocusControl = dbValorTotal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Width = 89
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CODCONTROL'
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 240
          Top = 40
          Width = 425
          Height = 21
          DataField = 'CODEMP'
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
        object dbCliente: TRxDBComboEdit
          Left = 672
          Top = 40
          Width = 401
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOME'
          DataSource = DtSrcTabela
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
          TabOrder = 3
          OnButtonClick = dbClienteButtonClick
        end
        object dbDataHora: TDBEdit
          Left = 112
          Top = 40
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DTVENDA'
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
        object dbSerie: TDBEdit
          Left = 16
          Top = 80
          Width = 33
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'SERIE'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbNFe: TDBEdit
          Left = 56
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NFE'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbDataEmissao: TDBEdit
          Left = 160
          Top = 80
          Width = 81
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DATAEMISSAO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbSituacao: TDBEdit
          Left = 328
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
          TabOrder = 8
        end
        object dbVendedor: TDBLookupComboBox
          Left = 856
          Top = 80
          Width = 217
          Height = 21
          DataField = 'VENDEDOR_COD'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'NOME'
          ListSource = dtsVendedor
          ParentFont = False
          TabOrder = 12
        end
        object dbValorTotal: TDBEdit
          Left = 720
          Top = 80
          Width = 129
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'TOTALVENDA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbValorDesconto: TDBEdit
          Left = 616
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DESCONTO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbCFOPVenda: TRxDBComboEdit
          Left = 248
          Top = 80
          Width = 73
          Height = 21
          ButtonHint = 'Pesquisar CFOP (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataField = 'CFOP'
          DataSource = DtSrcTabela
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
          TabOrder = 7
          OnButtonClick = dbCFOPVendaButtonClick
          OnExit = ControlEditExit
        end
        object dbValorTotalBruto: TDBEdit
          Left = 480
          Top = 80
          Width = 129
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'TOTALVENDA_BRUTA'
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
      end
      object GrpBxDadosProduto: TGroupBox
        Left = 0
        Top = 117
        Width = 1108
        Height = 116
        Align = alTop
        Caption = 'Dados do produto'
        TabOrder = 1
        DesignSize = (
          1108
          116)
        object lblProduto: TLabel
          Left = 88
          Top = 24
          Width = 42
          Height = 13
          Caption = 'Produto:'
          FocusControl = dbProduto
        end
        object lblQuantidade: TLabel
          Left = 312
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
        object lblValorUnit: TLabel
          Left = 392
          Top = 64
          Width = 92
          Height = 13
          Caption = 'Valor Unit'#225'rio (R$):'
          FocusControl = dbValorUnit
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDesconto: TLabel
          Left = 512
          Top = 64
          Width = 45
          Height = 13
          Caption = '% Desc.:'
          FocusControl = dbDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorLiq: TLabel
          Left = 720
          Top = 64
          Width = 88
          Height = 13
          Caption = 'Total L'#237'quido (R$):'
          FocusControl = dbValorLiq
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUnidade: TLabel
          Left = 592
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
        object lblCFOP: TLabel
          Left = 640
          Top = 24
          Width = 31
          Height = 13
          Caption = 'CFOP:'
          FocusControl = dbCFOP
        end
        object lblAliquota: TLabel
          Left = 88
          Top = 64
          Width = 57
          Height = 13
          Caption = '% Al'#237'quota:'
          FocusControl = dbAliquota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCST: TLabel
          Left = 272
          Top = 64
          Width = 23
          Height = 13
          Caption = 'CST:'
          FocusControl = dbCST
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorIPI: TLabel
          Left = 848
          Top = 64
          Width = 69
          Height = 13
          Caption = 'Valor IPI (R$):'
          FocusControl = dbValorIPI
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Bevel7: TBevel
          Left = 2
          Top = 15
          Width = 4
          Height = 99
          Align = alLeft
          Shape = bsSpacer
        end
        object lblTotalDesconto: TLabel
          Left = 584
          Top = 64
          Width = 82
          Height = 13
          Caption = 'Total Desc. (R$):'
          FocusControl = dbTotalDesconto
        end
        object lblProdutoPromocao: TLabel
          Left = 961
          Top = 98
          Width = 142
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = '* Produtos em Promo'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPercRedBC: TLabel
          Left = 168
          Top = 64
          Width = 76
          Height = 13
          Caption = '% Redu'#231#227'o BC:'
          FocusControl = dbPercRedBC
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
          DataField = 'CODPROD'
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
          Width = 401
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DESCRI'
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
          Left = 312
          Top = 80
          Width = 73
          Height = 21
          Color = clWhite
          DataField = 'QTDE'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnExit = ControlEditExit
        end
        object dbValorUnit: TDBEdit
          Left = 392
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'PUNIT'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          OnExit = ControlEditExit
        end
        object dbDesconto: TDBEdit
          Left = 512
          Top = 80
          Width = 65
          Height = 21
          Color = clWhite
          DataField = 'DESCONTO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnExit = ControlEditExit
        end
        object dbValorLiq: TDBEdit
          Left = 720
          Top = 80
          Width = 121
          Height = 21
          Color = clMoneyGreen
          DataField = 'TOTAL_LIQUIDO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
          OnExit = ControlEditExit
        end
        object dbUnidade: TDBEdit
          Left = 592
          Top = 40
          Width = 41
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
        object dbCFOP: TRxDBComboEdit
          Left = 640
          Top = 40
          Width = 73
          Height = 21
          ButtonHint = 'Pesquisar CFOP (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataField = 'CFOP_COD'
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
          ReadOnly = True
          ShowHint = True
          TabOrder = 4
          OnButtonClick = dbCFOPButtonClick
          OnExit = ControlEditExit
        end
        object dbAliquota: TDBEdit
          Left = 88
          Top = 80
          Width = 73
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'ALIQUOTA'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbCST: TDBEdit
          Left = 272
          Top = 80
          Width = 33
          Height = 21
          Color = clWhite
          DataField = 'CST'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dbValorIPI: TDBEdit
          Left = 848
          Top = 80
          Width = 97
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALOR_IPI'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          Visible = False
        end
        object dbCFOPDescricao: TDBEdit
          Left = 720
          Top = 40
          Width = 352
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CFOP_DESCRICAO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
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
        object dbTotalDesconto: TRxDBComboEdit
          Left = 584
          Top = 80
          Width = 129
          Height = 21
          ButtonHint = 'Lan'#231'ar Valor Total do Desconto (Ctrl+D)'
          CharCase = ecUpperCase
          ClickKey = 16452
          Color = clMoneyGreen
          DataField = 'TOTAL_DESCONTO'
          DataSource = DtSrcTabelaItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 12
          OnButtonClick = dbTotalDescontoButtonClick
          OnExit = ControlEditExit
        end
        object dbPercRedBC: TDBEdit
          Left = 168
          Top = 80
          Width = 97
          Height = 21
          Color = clMoneyGreen
          DataField = 'PERCENTUAL_REDUCAO_BC'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 424
        Width = 1108
        Height = 190
        ActivePage = tbsRecebimento
        Align = alBottom
        TabOrder = 3
        object tbsRecebimento: TTabSheet
          BorderWidth = 4
          Caption = 'Recebimento'
          object pnlObservacao: TPanel
            Left = 0
            Top = 0
            Width = 520
            Height = 154
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblObservacao: TLabel
              Left = 0
              Top = 0
              Width = 520
              Height = 13
              Align = alTop
              Caption = '&Observa'#231#245'es:'
            end
            object Bevel14: TBevel
              Left = 516
              Top = 17
              Width = 4
              Height = 137
              Align = alRight
              Shape = bsSpacer
            end
            object Bevel15: TBevel
              Left = 0
              Top = 13
              Width = 520
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object dbObservacao: TDBMemo
              Left = 0
              Top = 17
              Width = 516
              Height = 137
              Align = alClient
              DataField = 'OBS'
              DataSource = DtSrcTabela
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
          object pnlFormaPagto: TPanel
            Left = 520
            Top = 0
            Width = 572
            Height = 154
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object lblFormaPagto: TLabel
              Left = 0
              Top = 1
              Width = 124
              Height = 13
              Caption = 'Forma de Pagamento:'
              FocusControl = dbgFormaPagto
            end
            object lblCondicaoPagto: TLabel
              Left = 187
              Top = 1
              Width = 139
              Height = 13
              Caption = 'Condi'#231#227'o de Pagamento:'
              FocusControl = dbCondicaoPagto
            end
            object Label2: TLabel
              Left = 470
              Top = 1
              Width = 60
              Height = 13
              Caption = 'Valor (R$):'
              FocusControl = dbValorFormaPagto
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbFormaPagto: TDBLookupComboBox
              Left = 0
              Top = 17
              Width = 185
              Height = 21
              DataField = 'FORMAPAGTO_COD'
              DataSource = dtsVendaFormaPagto
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
              TabOrder = 0
              Visible = False
              OnClick = dbFormaPagtoClick
            end
            object dbCondicaoPagto: TDBLookupComboBox
              Left = 187
              Top = 17
              Width = 281
              Height = 21
              DataField = 'CONDICAOPAGTO_COD'
              DataSource = dtsVendaFormaPagto
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
              TabOrder = 1
              Visible = False
              OnClick = dbCondicaoPagtoClick
            end
            object dbValorFormaPagto: TDBEdit
              Left = 470
              Top = 17
              Width = 102
              Height = 21
              DataField = 'VALOR_FPAGTO'
              DataSource = dtsVendaFormaPagto
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              Visible = False
            end
            object btnFormaPagtoSalvar: TBitBtn
              Left = 210
              Top = 40
              Width = 70
              Height = 25
              Hint = 'Salvar Forma/Condi'#231#227'o de Pagamento'
              Caption = 'Salvar'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              Visible = False
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
            object btnFormaPagtoExcluir: TBitBtn
              Left = 140
              Top = 40
              Width = 70
              Height = 25
              Hint = 'Excluir Forma/Condi'#231#227'o de Pagamento'
              Caption = 'Excluir'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              TabStop = False
              Visible = False
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
            object btnFormaPagtoInserir: TBitBtn
              Left = 0
              Top = 40
              Width = 70
              Height = 25
              Hint = 'Inserir Forma/Condi'#231#227'o de Pagamento'
              Caption = 'Inserir'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              Visible = False
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
            object btnFormaPagtoEditar: TBitBtn
              Left = 70
              Top = 40
              Width = 70
              Height = 25
              Hint = 'Editar Forma/Condi'#231#227'o de Pagamento'
              Caption = 'Editar'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              Visible = False
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
            object dbgFormaPagto: TDBGrid
              Left = 0
              Top = 16
              Width = 572
              Height = 138
              Hint = 
                'Para inserir nova Forma/Condi'#231#227'o de Pagamento CTRL + INSERT'#13#10#13#10'P' +
                'ara editar Forma/Condi'#231#227'o de Pagamento selecionada CTRL + ENTER'#13 +
                #10#13#10'Para a exclus'#227'o das Formas/Condi'#231#245'es de Pagamentos CTRL + DEL' +
                'ETE'#13#10#13#10'Observa'#231#227'o:'#13#10'======================='#13#10'Todas as formas/con' +
                'di'#231#245'es de pagamentos ser'#227'o exclu'#237'das, zerando o processo'#13#10'de enc' +
                'erramento da venda com uma forma/condi'#231#227'o de pagamento definida ' +
                'como'#13#10'padr'#227'o.'
              Align = alBottom
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataSource = dtsVendaFormaPagto
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 7
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlue
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
              OnDrawColumnCell = dbgDadosDrawColumnCell
              OnEnter = dbgFormaPagtoEnter
              OnKeyDown = dbgFormaPagtoKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FormaPagto'
                  Width = 170
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CondicaoPagto'
                  Width = 285
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_FPAGTO'
                  Title.Caption = 'A Pagar (R$)'
                  Width = 80
                  Visible = True
                end>
            end
          end
        end
        object tbsITitulos: TTabSheet
          Caption = 'T'#237'tulo(s) Gerado(s)'
          ImageIndex = 1
          object Bevel9: TBevel
            Left = 74
            Top = 0
            Width = 4
            Height = 162
            Align = alLeft
            Shape = bsSpacer
          end
          object Bevel10: TBevel
            Left = 0
            Top = 0
            Width = 4
            Height = 162
            Align = alLeft
            Shape = bsSpacer
          end
          object pnlBotoesTitulo: TPanel
            Left = 4
            Top = 0
            Width = 70
            Height = 162
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
            object btnRegerarTitulo: TBitBtn
              Left = 0
              Top = 1
              Width = 70
              Height = 25
              Hint = 'Regerar T'#237'tulo(s)'
              Caption = 'T'#237'tulo(s)'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnRegerarTituloClick
              NumGlyphs = 2
            end
            object btnGerarBoleto: TBitBtn
              Left = 0
              Top = 25
              Width = 70
              Height = 25
              Hint = 'Gerar Boleto(s)'
              Caption = 'Boleto(s)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TabStop = False
              OnClick = btnGerarBoletoClick
              NumGlyphs = 2
            end
            object btnTituloEditar: TBitBtn
              Left = 0
              Top = 49
              Width = 70
              Height = 25
              Hint = 'Editar T'#237'tulo'
              Caption = 'Editar'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              TabStop = False
              NumGlyphs = 2
            end
            object btnTituloExcluir: TBitBtn
              Left = 0
              Top = 73
              Width = 70
              Height = 25
              Hint = 'Excluir T'#237'tulo'
              Caption = 'Excluir'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              NumGlyphs = 2
            end
            object btnTituloQuitar: TBitBtn
              Left = 0
              Top = 97
              Width = 70
              Height = 25
              Hint = 'Baixar T'#237'tulo'
              Caption = 'Baixar'
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              NumGlyphs = 2
            end
          end
          object dbgTitulos: TDBGrid
            Left = 78
            Top = 0
            Width = 1022
            Height = 162
            Hint = 
              'Para a exclus'#227'o de baixas basta pressionar CTRL + DELETE'#13#10#13#10'Obse' +
              'rva'#231#227'o:'#13#10'======================='#13#10'Apenas usu'#225'rios nas fun'#231#245'es Di' +
              'retoria, Gerente Financeiro, Gerente ADM'#13#10'e/ou Masterdados podem' +
              ' excluir registros de pagamentos.'
            TabStop = False
            Align = alClient
            DataSource = dtsTitulos
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
            OnKeyDown = dbgTitulosKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'Lancamento'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PARCELA'
                Title.Alignment = taCenter
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTEMISS'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTVENC'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORREC'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS'
                Title.Caption = 'Status'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODBANCO'
                Title.Alignment = taCenter
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOSSONUMERO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BAIXADO_'
                Title.Alignment = taCenter
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTREC'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end>
          end
        end
        object tbsTransporte: TTabSheet
          Caption = 'Dados Transporte'
          ImageIndex = 2
          DesignSize = (
            1100
            162)
          object Bevel16: TBevel
            Left = 0
            Top = 0
            Width = 4
            Height = 162
            Align = alLeft
            Shape = bsSpacer
          end
          object Bevel17: TBevel
            Left = 74
            Top = 0
            Width = 4
            Height = 162
            Align = alLeft
            Shape = bsSpacer
          end
          object pnlBotoesTransp: TPanel
            Left = 4
            Top = 0
            Width = 70
            Height = 162
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
            object BtnTransporteInforme: TBitBtn
              Left = 0
              Top = 1
              Width = 70
              Height = 25
              Hint = 
                'Informar dados de transporte:'#13#10'- Modalidade Frete'#13#10'- Dados Ve'#237'cu' +
                'lo'
              Caption = 'Info&rme'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = BtnTransporteInformeClick
              NumGlyphs = 2
            end
          end
          object GrpBxTransportadora: TGroupBox
            Left = 78
            Top = 0
            Width = 505
            Height = 162
            Align = alLeft
            Caption = 'Transportadora'
            TabOrder = 1
            object lblTranspNome: TLabel
              Left = 8
              Top = 64
              Width = 31
              Height = 13
              Caption = 'Nome:'
              FocusControl = dbTranspNome
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTranspCnpj: TLabel
              Left = 336
              Top = 64
              Width = 33
              Height = 13
              Caption = 'CNPJ.:'
              FocusControl = dbTranspCnpj
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTranspEndereco: TLabel
              Left = 8
              Top = 104
              Width = 49
              Height = 13
              Caption = 'Endere'#231'o:'
              FocusControl = dbTranspEndereco
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object lblModalidadeFrete: TLabel
              Left = 8
              Top = 24
              Width = 87
              Height = 13
              Caption = 'Modalidade Frete:'
              FocusControl = dbModalidadeFrete
            end
            object dbTranspNome: TDBEdit
              Left = 8
              Top = 80
              Width = 321
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'TRANSP_NOME'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbTranspCnpj: TDBEdit
              Left = 336
              Top = 80
              Width = 153
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'TRANSP_CNPJ'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbTranspEndereco: TDBEdit
              Left = 8
              Top = 120
              Width = 481
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'TRANSP_ENDERECO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Visible = False
            end
            object dbModalidadeFrete: TDBLookupComboBox
              Left = 8
              Top = 40
              Width = 481
              Height = 21
              DataField = 'NFE_MODALIDADE_FRETE'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              ListSource = dtsModalidadeFrete
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object dbgVolumes: TDBGrid
            Left = 583
            Top = 5
            Width = 517
            Height = 157
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dtsVendaVolume
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
                FieldName = 'NUMERO'
                Title.Caption = 'Nro. Volume'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Caption = 'Quantidade'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PESO_BRUTO'
                Title.Caption = 'P. Bruto (Kg)'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PESO_LIQUIDO'
                Title.Caption = 'P. L'#237'quido (Kg)'
                Width = 100
                Visible = True
              end>
          end
        end
      end
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 237
        Width = 1108
        Height = 183
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
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODPROD'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CST'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CSOSN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP_COD'
            Title.Alignment = taCenter
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA'
            Title.Caption = '% Al'#237'q.'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Caption = 'Qtde.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PUNIT'
            Title.Caption = 'Valor Un.'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Title.Caption = '% Desc.'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PFINAL'
            Title.Caption = 'Valor L'#237'q.'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_BRUTO'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_DESCONTO'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_LIQUIDO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Width = 85
            Visible = True
          end>
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    AfterCancel = IbDtstTabelaAfterCancel
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcliente'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Status'
      '  , v.Totalvenda_bruta'
      '  , v.Desconto'
      '  , v.Totalvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Obs'
      '  , v.Formapag'
      '  , v.Fatdias'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Lote_nfe_ano'
      '  , v.Lote_nfe_numero'
      '  , v.Lote_nfe_Recibo'
      '  , v.Nfe_enviada'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Cancel_datahora'
      '  , v.Cancel_motivo'
      '  , v.Cfop'
      '  , v.Verificador_nfe'
      '  , v.Xml_nfe_filename'
      '  , v.Xml_nfe'
      '  , v.Vendedor_cod'
      '  , v.Usuario'
      '  , v.Formapagto_cod'
      '  , v.Condicaopagto_cod'
      '  , v.Venda_prazo'
      '  , v.Prazo_01'
      '  , v.Prazo_02'
      '  , v.Prazo_03'
      '  , v.Prazo_04'
      '  , v.Prazo_05'
      '  , v.Prazo_06'
      '  , v.Prazo_07'
      '  , v.Prazo_08'
      '  , v.Prazo_09'
      '  , v.Prazo_10'
      '  , v.Prazo_11'
      '  , v.Prazo_12'
      '  , v.nfe_modalidade_frete'
      '  , v.nfe_transportadora'
      '  , v.nfe_placa_veiculo'
      '  , v.nfe_placa_uf'
      '  , v.nfe_placa_rntc'
      '  , v.gerar_estoque_cliente'
      '  , t.nomeforn as transp_nome'
      '  , t.cnpj     as transp_cnpj'
      '  , t.inscest  as transp_iest'
      
        '  , t.ender || coalesce('#39' - '#39' || t.cidade, '#39#39') as transp_enderec' +
        'o'
      '  , c.Nome'
      '  , c.Bloqueado'
      '  , c.Bloqueado_motivo'
      '  , Case when coalesce(v.totalcusto, 0) > 0'
      
        '      then ((v.totalvenda / coalesce(v.totalcusto, 0)) - 1) * 10' +
        '0'
      '      else 0.0'
      '    end Lucro_Calculado'
      'from TBVENDAS v'
      '  inner join TBCLIENTE c on (c.Codigo = v.Codcliente)'
      '  left join TBFORNECEDOR t on (t.codforn = v.nfe_transportadora)')
    GeneratorField.ApplyEvent = gamOnNewRecord
    Left = 992
    Top = 80
    object IbDtstTabelaANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBVENDAS.ANO'
      Required = True
    end
    object IbDtstTabelaCODCONTROL: TIntegerField
      DisplayLabel = 'No. Venda'
      FieldName = 'CODCONTROL'
      Origin = 'TBVENDAS.CODCONTROL'
      Required = True
    end
    object IbDtstTabelaCODEMP: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'CODEMP'
      Origin = 'TBVENDAS.CODEMP'
      Size = 18
    end
    object IbDtstTabelaCODCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CODCLIENTE'
      Origin = '"TBVENDAS"."CODCLIENTE"'
      Required = True
    end
    object IbDtstTabelaCODCLI: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CODCLI'
      Origin = 'TBVENDAS.CODCLI'
      Size = 18
    end
    object IbDtstTabelaDTVENDA: TDateTimeField
      DisplayLabel = 'D. Venda'
      FieldName = 'DTVENDA'
      Origin = 'TBVENDAS.DTVENDA'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object IbDtstTabelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'TBVENDAS.STATUS'
      Required = True
      OnGetText = IbDtstTabelaSTATUSGetText
    end
    object IbDtstTabelaTOTALVENDA_BRUTA: TIBBCDField
      DisplayLabel = 'Total Bruto (R$)'
      FieldName = 'TOTALVENDA_BRUTA'
      Origin = '"TBVENDAS"."TOTALVENDA_BRUTA"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaDESCONTO: TIBBCDField
      DisplayLabel = 'Desconto (R$)'
      FieldName = 'DESCONTO'
      Origin = '"TBVENDAS"."DESCONTO"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object IbDtstTabelaTOTALVENDA: TIBBCDField
      DisplayLabel = 'Valor Total (R$)'
      FieldName = 'TOTALVENDA'
      Origin = 'TBVENDAS.TOTALVENDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaDTFINALIZACAO_VENDA: TDateField
      FieldName = 'DTFINALIZACAO_VENDA'
      Origin = 'TBVENDAS.DTFINALIZACAO_VENDA'
    end
    object IbDtstTabelaOBS: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      Origin = 'TBVENDAS.OBS'
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaFORMAPAG: TIBStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAG'
      Origin = 'TBVENDAS.FORMAPAG'
      Size = 35
    end
    object IbDtstTabelaFATDIAS: TSmallintField
      DisplayLabel = 'Fatura Dias'
      FieldName = 'FATDIAS'
      Origin = 'TBVENDAS.FATDIAS'
    end
    object IbDtstTabelaSERIE: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Origin = 'TBVENDAS.SERIE'
      Size = 4
    end
    object IbDtstTabelaNFE: TLargeintField
      DisplayLabel = 'NF-e'
      FieldName = 'NFE'
      Origin = 'TBVENDAS.NFE'
      DisplayFormat = '###0000000'
    end
    object IbDtstTabelaLOTE_NFE_ANO: TSmallintField
      FieldName = 'LOTE_NFE_ANO'
      Origin = 'TBVENDAS.LOTE_NFE_ANO'
    end
    object IbDtstTabelaLOTE_NFE_NUMERO: TIntegerField
      FieldName = 'LOTE_NFE_NUMERO'
      Origin = 'TBVENDAS.LOTE_NFE_NUMERO'
    end
    object IbDtstTabelaLOTE_NFE_RECIBO: TIBStringField
      FieldName = 'LOTE_NFE_RECIBO'
      Origin = '"TBVENDAS"."LOTE_NFE_RECIBO"'
      ProviderFlags = []
      Size = 250
    end
    object IbDtstTabelaNFE_ENVIADA: TSmallintField
      FieldName = 'NFE_ENVIADA'
      Origin = 'TBVENDAS.NFE_ENVIADA'
      Required = True
    end
    object IbDtstTabelaDATAEMISSAO: TDateField
      DisplayLabel = 'D. Emiss'#227'o'
      FieldName = 'DATAEMISSAO'
      Origin = 'TBVENDAS.DATAEMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaHORAEMISSAO: TTimeField
      DisplayLabel = 'Hora Emiss'#227'o'
      FieldName = 'HORAEMISSAO'
      Origin = 'TBVENDAS.HORAEMISSAO'
      DisplayFormat = 'hh:mm'
    end
    object IbDtstTabelaCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'TBVENDAS.CFOP'
    end
    object IbDtstTabelaCANCEL_DATAHORA: TDateTimeField
      FieldName = 'CANCEL_DATAHORA'
      Origin = 'TBVENDAS.CANCEL_DATAHORA'
    end
    object IbDtstTabelaCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = 'TBVENDAS.CANCEL_MOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaVERIFICADOR_NFE: TIBStringField
      DisplayLabel = 'Verificador'
      FieldName = 'VERIFICADOR_NFE'
      Origin = 'TBVENDAS.VERIFICADOR_NFE'
      Size = 250
    end
    object IbDtstTabelaXML_NFE_FILENAME: TIBStringField
      FieldName = 'XML_NFE_FILENAME'
      Origin = 'TBVENDAS.XML_NFE_FILENAME'
      Size = 250
    end
    object IbDtstTabelaXML_NFE: TMemoField
      DisplayLabel = 'XML NF-e'
      FieldName = 'XML_NFE'
      Origin = 'TBVENDAS.XML_NFE'
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaVENDEDOR_COD: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR_COD'
      Origin = 'TBVENDAS.VENDEDOR_COD'
    end
    object IbDtstTabelaUSUARIO: TIBStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Origin = 'TBVENDAS.USUARIO'
      Size = 50
    end
    object IbDtstTabelaFORMAPAGTO_COD: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'TBVENDAS.FORMAPAGTO_COD'
    end
    object IbDtstTabelaCONDICAOPAGTO_COD: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'TBVENDAS.CONDICAOPAGTO_COD'
    end
    object IbDtstTabelaVENDA_PRAZO: TSmallintField
      DisplayLabel = 'A Prazo?'
      FieldName = 'VENDA_PRAZO'
      Origin = 'TBVENDAS.VENDA_PRAZO'
      Required = True
    end
    object IbDtstTabelaPRAZO_01: TSmallintField
      DisplayLabel = 'Prazo 01'
      FieldName = 'PRAZO_01'
      Origin = 'TBVENDAS.PRAZO_01'
    end
    object IbDtstTabelaPRAZO_02: TSmallintField
      DisplayLabel = 'Prazo 02'
      FieldName = 'PRAZO_02'
      Origin = 'TBVENDAS.PRAZO_02'
    end
    object IbDtstTabelaPRAZO_03: TSmallintField
      DisplayLabel = 'Prazo 03'
      FieldName = 'PRAZO_03'
      Origin = 'TBVENDAS.PRAZO_03'
    end
    object IbDtstTabelaPRAZO_04: TSmallintField
      DisplayLabel = 'Prazo 04'
      FieldName = 'PRAZO_04'
      Origin = 'TBVENDAS.PRAZO_04'
    end
    object IbDtstTabelaPRAZO_05: TSmallintField
      DisplayLabel = 'Prazo 05'
      FieldName = 'PRAZO_05'
      Origin = 'TBVENDAS.PRAZO_05'
    end
    object IbDtstTabelaPRAZO_06: TSmallintField
      DisplayLabel = 'Prazo 06'
      FieldName = 'PRAZO_06'
      Origin = 'TBVENDAS.PRAZO_06'
    end
    object IbDtstTabelaPRAZO_07: TSmallintField
      DisplayLabel = 'Prazo 07'
      FieldName = 'PRAZO_07'
      Origin = 'TBVENDAS.PRAZO_07'
    end
    object IbDtstTabelaPRAZO_08: TSmallintField
      DisplayLabel = 'Prazo 08'
      FieldName = 'PRAZO_08'
      Origin = 'TBVENDAS.PRAZO_08'
    end
    object IbDtstTabelaPRAZO_09: TSmallintField
      DisplayLabel = 'Prazo 09'
      FieldName = 'PRAZO_09'
      Origin = 'TBVENDAS.PRAZO_09'
    end
    object IbDtstTabelaPRAZO_10: TSmallintField
      DisplayLabel = 'Prazo 10'
      FieldName = 'PRAZO_10'
      Origin = 'TBVENDAS.PRAZO_10'
    end
    object IbDtstTabelaPRAZO_11: TSmallintField
      DisplayLabel = 'Prazo 11'
      FieldName = 'PRAZO_11'
      Origin = 'TBVENDAS.PRAZO_11'
    end
    object IbDtstTabelaPRAZO_12: TSmallintField
      DisplayLabel = 'Prazo 12'
      FieldName = 'PRAZO_12'
      Origin = 'TBVENDAS.PRAZO_12'
    end
    object IbDtstTabelaNFE_MODALIDADE_FRETE: TSmallintField
      DisplayLabel = 'Modalidade do Frete'
      FieldName = 'NFE_MODALIDADE_FRETE'
      Origin = '"TBVENDAS"."NFE_MODALIDADE_FRETE"'
    end
    object IbDtstTabelaNFE_TRANSPORTADORA: TIntegerField
      DisplayLabel = 'Transportadora'
      FieldName = 'NFE_TRANSPORTADORA'
      Origin = '"TBVENDAS"."NFE_TRANSPORTADORA"'
    end
    object IbDtstTabelaNFE_PLACA_VEICULO: TIBStringField
      DisplayLabel = 'Placa do Ve'#237'culo'
      FieldName = 'NFE_PLACA_VEICULO'
      Origin = '"TBVENDAS"."NFE_PLACA_VEICULO"'
      Size = 10
    end
    object IbDtstTabelaNFE_PLACA_UF: TIBStringField
      DisplayLabel = 'UF da Placa'
      FieldName = 'NFE_PLACA_UF'
      Origin = '"TBVENDAS"."NFE_PLACA_UF"'
      Size = 2
    end
    object IbDtstTabelaNFE_PLACA_RNTC: TIBStringField
      DisplayLabel = 'RNTC (Registro Nacional de Transporte de Carga)'
      FieldName = 'NFE_PLACA_RNTC'
      Origin = '"TBVENDAS"."NFE_PLACA_RNTC"'
      Size = 10
    end
    object IbDtstTabelaGERAR_ESTOQUE_CLIENTE: TSmallintField
      FieldName = 'GERAR_ESTOQUE_CLIENTE'
      Origin = '"TBVENDAS"."GERAR_ESTOQUE_CLIENTE"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaTRANSP_NOME: TIBStringField
      FieldName = 'TRANSP_NOME'
      Origin = '"TBFORNECEDOR"."NOMEFORN"'
      Size = 60
    end
    object IbDtstTabelaTRANSP_CNPJ: TIBStringField
      FieldName = 'TRANSP_CNPJ'
      Origin = '"TBFORNECEDOR"."CNPJ"'
      Size = 18
    end
    object IbDtstTabelaTRANSP_IEST: TIBStringField
      FieldName = 'TRANSP_IEST'
      Origin = '"TBFORNECEDOR"."INSCEST"'
    end
    object IbDtstTabelaTRANSP_ENDERECO: TIBStringField
      FieldName = 'TRANSP_ENDERECO'
      ProviderFlags = []
      Size = 283
    end
    object IbDtstTabelaNOME: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
    object IbDtstTabelaBLOQUEADO: TSmallintField
      FieldName = 'BLOQUEADO'
      Origin = 'TBCLIENTE.BLOQUEADO'
    end
    object IbDtstTabelaBLOQUEADO_MOTIVO: TMemoField
      FieldName = 'BLOQUEADO_MOTIVO'
      Origin = 'TBCLIENTE.BLOQUEADO_MOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaLUCRO_CALCULADO: TIBBCDField
      DisplayLabel = '% Lucro'
      FieldName = 'LUCRO_CALCULADO'
      ProviderFlags = []
      DisplayFormat = ',0.00##'
      Precision = 18
      Size = 4
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 1056
    Top = 80
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODCLIENTE,'
      '  CODCLI,'
      '  DTVENDA,'
      '  STATUS,'
      '  TOTALVENDA_BRUTA,'
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
      '  LOTE_NFE_ANO,'
      '  LOTE_NFE_NUMERO,'
      '  NFE_ENVIADA,'
      '  CANCEL_USUARIO,'
      '  CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO,'
      '  XML_NFE_FILENAME,'
      '  NFE_MODALIDADE_FRETE,'
      '  NFE_TRANSPORTADORA,'
      '  NFE_PLACA_VEICULO,'
      '  NFE_PLACA_UF,'
      '  NFE_PLACA_RNTC,'
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
      '  CANCEL_DATAHORA = :CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO = :CANCEL_MOTIVO,'
      '  CFOP = :CFOP,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODCLI = :CODCLI,'
      '  CODCONTROL = :CODCONTROL,'
      '  CODEMP = :CODEMP,'
      '  CONDICAOPAGTO_COD = :CONDICAOPAGTO_COD,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DESCONTO = :DESCONTO,'
      '  DTFINALIZACAO_VENDA = :DTFINALIZACAO_VENDA,'
      '  DTVENDA = :DTVENDA,'
      '  FATDIAS = :FATDIAS,'
      '  FORMAPAG = :FORMAPAG,'
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD,'
      '  HORAEMISSAO = :HORAEMISSAO,'
      '  LOTE_NFE_ANO = :LOTE_NFE_ANO,'
      '  LOTE_NFE_NUMERO = :LOTE_NFE_NUMERO,'
      '  NFE = :NFE,'
      '  NFE_ENVIADA = :NFE_ENVIADA,'
      '  NFE_MODALIDADE_FRETE = :NFE_MODALIDADE_FRETE,'
      '  NFE_PLACA_RNTC = :NFE_PLACA_RNTC,'
      '  NFE_PLACA_UF = :NFE_PLACA_UF,'
      '  NFE_PLACA_VEICULO = :NFE_PLACA_VEICULO,'
      '  NFE_TRANSPORTADORA = :NFE_TRANSPORTADORA,'
      '  OBS = :OBS,'
      '  PRAZO_01 = :PRAZO_01,'
      '  PRAZO_02 = :PRAZO_02,'
      '  PRAZO_03 = :PRAZO_03,'
      '  PRAZO_04 = :PRAZO_04,'
      '  PRAZO_05 = :PRAZO_05,'
      '  PRAZO_06 = :PRAZO_06,'
      '  PRAZO_07 = :PRAZO_07,'
      '  PRAZO_08 = :PRAZO_08,'
      '  PRAZO_09 = :PRAZO_09,'
      '  PRAZO_10 = :PRAZO_10,'
      '  PRAZO_11 = :PRAZO_11,'
      '  PRAZO_12 = :PRAZO_12,'
      '  SERIE = :SERIE,'
      '  STATUS = :STATUS,'
      '  TOTALVENDA = :TOTALVENDA,'
      '  TOTALVENDA_BRUTA = :TOTALVENDA_BRUTA,'
      '  USUARIO = :USUARIO,'
      '  VENDA_PRAZO = :VENDA_PRAZO,'
      '  VENDEDOR_COD = :VENDEDOR_COD,'
      '  VERIFICADOR_NFE = :VERIFICADOR_NFE,'
      '  XML_NFE = :XML_NFE,'
      '  XML_NFE_FILENAME = :XML_NFE_FILENAME,'
      '  GERAR_ESTOQUE_CLIENTE =:GERAR_ESTOQUE_CLIENTE'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    InsertSQL.Strings = (
      'insert into TBVENDAS'
      
        '  (ANO, CANCEL_DATAHORA, CANCEL_MOTIVO, CFOP, CODCLIENTE, CODCLI' +
        ', CODCONTROL, CODEMP, '
      
        '   CONDICAOPAGTO_COD, DATAEMISSAO, DESCONTO, DTFINALIZACAO_VENDA' +
        ', DTVENDA, '
      
        '   FATDIAS, FORMAPAG, FORMAPAGTO_COD, HORAEMISSAO, LOTE_NFE_ANO,' +
        ' LOTE_NFE_NUMERO, '
      
        '   NFE, NFE_ENVIADA, NFE_MODALIDADE_FRETE, NFE_PLACA_RNTC, NFE_P' +
        'LACA_UF, '
      
        '   NFE_PLACA_VEICULO, NFE_TRANSPORTADORA, OBS, GERAR_ESTOQUE_CLI' +
        'ENTE, PRAZO_01, PRAZO_02, PRAZO_03, '
      
        '   PRAZO_04, PRAZO_05, PRAZO_06, PRAZO_07, PRAZO_08, PRAZO_09, P' +
        'RAZO_10, '
      
        '   PRAZO_11, PRAZO_12, SERIE, STATUS, TOTALVENDA, TOTALVENDA_BRU' +
        'TA, USUARIO, '
      
        '   VENDA_PRAZO, VENDEDOR_COD, VERIFICADOR_NFE, XML_NFE, XML_NFE_' +
        'FILENAME)'
      'values'
      
        '  (:ANO, :CANCEL_DATAHORA, :CANCEL_MOTIVO, :CFOP, :CODCLIENTE, :' +
        'CODCLI, :CODCONTROL, '
      
        '   :CODEMP, :CONDICAOPAGTO_COD, :DATAEMISSAO, :DESCONTO, :DTFINA' +
        'LIZACAO_VENDA, '
      
        '   :DTVENDA, :FATDIAS, :FORMAPAG, :FORMAPAGTO_COD, :HORAEMISSAO,' +
        ' :LOTE_NFE_ANO, '
      
        '   :LOTE_NFE_NUMERO, :NFE, :NFE_ENVIADA, :NFE_MODALIDADE_FRETE, ' +
        ':NFE_PLACA_RNTC, '
      
        '   :NFE_PLACA_UF, :NFE_PLACA_VEICULO, :NFE_TRANSPORTADORA, :OBS,' +
        ' :GERAR_ESTOQUE_CLIENTE, :PRAZO_01, '
      
        '   :PRAZO_02, :PRAZO_03, :PRAZO_04, :PRAZO_05, :PRAZO_06, :PRAZO' +
        '_07, :PRAZO_08, '
      
        '   :PRAZO_09, :PRAZO_10, :PRAZO_11, :PRAZO_12, :SERIE, :STATUS, ' +
        ':TOTALVENDA, '
      
        '   :TOTALVENDA_BRUTA, :USUARIO, :VENDA_PRAZO, :VENDEDOR_COD, :VE' +
        'RIFICADOR_NFE, '
      '   :XML_NFE, :XML_NFE_FILENAME)')
    DeleteSQL.Strings = (
      'delete from TBVENDAS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    Left = 1024
    Top = 80
  end
  inherited ImgList: TImageList
    Left = 1192
    Top = 376
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
  object tblVendedor: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBVENDEDOR'
    Left = 928
    Top = 384
  end
  object dtsVendedor: TDataSource
    DataSet = tblVendedor
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
  object cdsTabelaItens: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnNewRecord = cdsTabelaItensNewRecord
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq'
      '  , i.Codprod'
      '  , i.Codemp'
      '  , i.Codcli'
      '  , i.Codcliente'
      '  , i.Dtvenda'
      '  , i.Qtde'
      '  , i.Punit'
      '  , i.Punit_Promocao'
      '  , i.Desconto'
      '  , i.Desconto_valor'
      '  , i.Pfinal'
      '  , i.Qtdefinal'
      '  , i.Unid_cod'
      '  , i.Cfop_cod'
      '  , coalesce(i.Cst, p.Cst) as Cst'
      '  , i.Aliquota'
      '  , i.Aliquota_csosn'
      '  , i.Aliquota_pis'
      '  , i.Aliquota_cofins'
      '  , i.Valor_ipi'
      '  , i.Percentual_reducao_BC'
      '  , i.Total_bruto'
      '  , i.Total_desconto'
      '  , i.Total_liquido'
      '  , p.Descri'
      '  , p.Qtde as Estoque'
      '  , p.Reserva'
      '  , u.Unp_sigla'
      '  , o.Cfop_descricao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Movimenta_Estoque'
      'from TVENDASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP o on (o.Cfop_cod = i.Cfop_cod)')
    ModifySQL.Strings = (
      '')
    UpdateObject = IbUpdTabelaItens
    Left = 992
    Top = 112
    object cdsTabelaItensANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TVENDASITENS.ANO'
      Required = True
    end
    object cdsTabelaItensCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'TVENDASITENS.CODCONTROL'
      Required = True
    end
    object cdsTabelaItensSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'TVENDASITENS.SEQ'
      Required = True
      OnGetText = cdsTabelaItensSEQGetText
      DisplayFormat = '00'
    end
    object cdsTabelaItensCODPROD: TIBStringField
      DisplayLabel = 'Produto'
      FieldName = 'CODPROD'
      Origin = 'TVENDASITENS.CODPROD'
      Required = True
      Size = 10
    end
    object cdsTabelaItensCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = 'TVENDASITENS.CODEMP'
      Size = 18
    end
    object cdsTabelaItensCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = 'TVENDASITENS.CODCLI'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsTabelaItensCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = '"TVENDASITENS"."CODCLIENTE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTabelaItensDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = 'TVENDASITENS.DTVENDA'
    end
    object cdsTabelaItensQTDE: TIBBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Origin = '"TVENDASITENS"."QTDE"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensPUNIT: TIBBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'PUNIT'
      Origin = 'TVENDASITENS.PUNIT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensPUNIT_PROMOCAO: TIBBCDField
      FieldName = 'PUNIT_PROMOCAO'
      Origin = 'TVENDASITENS.PUNIT_PROMOCAO'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensDESCONTO: TIBBCDField
      DisplayLabel = '% Desconto'
      FieldName = 'DESCONTO'
      Origin = '"TVENDASITENS"."DESCONTO"'
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensDESCONTO_VALOR: TIBBCDField
      DisplayLabel = 'Valor Desconto (R$)'
      FieldName = 'DESCONTO_VALOR'
      Origin = '"TVENDASITENS"."DESCONTO_VALOR"'
      DisplayFormat = ',0.00##'
      Precision = 18
      Size = 4
    end
    object cdsTabelaItensPFINAL: TIBBCDField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'PFINAL'
      Origin = '"TVENDASITENS"."PFINAL"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensQTDEFINAL: TIBBCDField
      FieldName = 'QTDEFINAL'
      Origin = '"TVENDASITENS"."QTDEFINAL"'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensUNID_COD: TSmallintField
      FieldName = 'UNID_COD'
      Origin = 'TVENDASITENS.UNID_COD'
    end
    object cdsTabelaItensCFOP_COD: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'CFOP'
      FieldName = 'CFOP_COD'
      Origin = 'TVENDASITENS.CFOP_COD'
    end
    object cdsTabelaItensCST: TIBStringField
      Alignment = taCenter
      FieldName = 'CST'
      Origin = 'TVENDASITENS.CST'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsTabelaItensALIQUOTA: TIBBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'TVENDASITENS.ALIQUOTA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensALIQUOTA_CSOSN: TIBBCDField
      FieldName = 'ALIQUOTA_CSOSN'
      Origin = 'TVENDASITENS.ALIQUOTA_CSOSN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensALIQUOTA_PIS: TIBBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'TVENDASITENS.ALIQUOTA_PIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensALIQUOTA_COFINS: TIBBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'TVENDASITENS.ALIQUOTA_COFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensVALOR_IPI: TIBBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'TVENDASITENS.VALOR_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensPERCENTUAL_REDUCAO_BC: TIBBCDField
      FieldName = 'PERCENTUAL_REDUCAO_BC'
      Origin = 'TVENDASITENS.PERCENTUAL_REDUCAO_BC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensTOTAL_BRUTO: TIBBCDField
      DisplayLabel = 'Total Bruto'
      FieldName = 'TOTAL_BRUTO'
      Origin = '"TVENDASITENS"."TOTAL_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensTOTAL_DESCONTO: TIBBCDField
      DisplayLabel = 'Total Desc.'
      FieldName = 'TOTAL_DESCONTO'
      Origin = '"TVENDASITENS"."TOTAL_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensTOTAL_LIQUIDO: TIBBCDField
      DisplayLabel = 'Total L'#237'quido'
      FieldName = 'TOTAL_LIQUIDO'
      Origin = '"TVENDASITENS"."TOTAL_LIQUIDO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensDESCRI: TIBStringField
      DisplayLabel = 'Nome do produto'
      FieldName = 'DESCRI'
      Origin = 'TBPRODUTO.DESCRI'
      Size = 50
    end
    object cdsTabelaItensUNP_SIGLA: TIBStringField
      DisplayLabel = 'Und.'
      FieldName = 'UNP_SIGLA'
      Origin = 'TBUNIDADEPROD.UNP_SIGLA'
      Size = 5
    end
    object cdsTabelaItensCFOP_DESCRICAO: TIBStringField
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'TBCFOP.CFOP_DESCRICAO'
      Size = 250
    end
    object cdsTabelaItensCSOSN: TIBStringField
      Alignment = taCenter
      FieldName = 'CSOSN'
      Origin = 'TBPRODUTO.CSOSN'
      Size = 3
    end
    object cdsTabelaItensESTOQUE: TIBBCDField
      FieldName = 'ESTOQUE'
      Origin = '"TBPRODUTO"."QTDE"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensRESERVA: TIBBCDField
      FieldName = 'RESERVA'
      Origin = '"TBPRODUTO"."RESERVA"'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensMOVIMENTA_ESTOQUE: TSmallintField
      FieldName = 'MOVIMENTA_ESTOQUE'
      Origin = '"TBPRODUTO"."MOVIMENTA_ESTOQUE"'
      ProviderFlags = []
    end
  end
  object IbUpdTabelaItens: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  SEQ,'
      '  CODPROD,'
      '  CODEMP,'
      '  CODCLIENTE,'
      '  CODCLI,'
      '  DTVENDA,'
      '  QTDE,'
      '  PUNIT,'
      '  PUNIT_PROMOCAO,'
      '  DESCONTO,'
      '  DESCONTO_VALOR,'
      '  PFINAL,'
      '  QTDEFINAL,'
      '  UNID_COD,'
      '  CFOP_COD,'
      '  CST,'
      '  CSOSN,'
      '  ALIQUOTA,'
      '  ALIQUOTA_CSOSN,'
      '  ALIQUOTA_PIS,'
      '  ALIQUOTA_COFINS,'
      '  VALOR_IPI,'
      '  PERCENTUAL_REDUCAO_BC,'
      '  TOTAL_BRUTO,'
      '  TOTAL_DESCONTO,'
      '  TOTAL_LIQUIDO'
      'from TVENDASITENS '
      'where'
      '  ANO = :ANO and'
      '  CODCONTROL = :CODCONTROL and'
      '  CODPROD = :CODPROD and'
      '  SEQ = :SEQ')
    ModifySQL.Strings = (
      'update TVENDASITENS'
      'set'
      '  ALIQUOTA = :ALIQUOTA,'
      '  ALIQUOTA_COFINS = :ALIQUOTA_COFINS,'
      '  ALIQUOTA_CSOSN = :ALIQUOTA_CSOSN,'
      '  ALIQUOTA_PIS = :ALIQUOTA_PIS,'
      '  ANO = :ANO,'
      '  CFOP_COD = :CFOP_COD,'
      '  CODCLI = :CODCLI,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODCONTROL = :CODCONTROL,'
      '  CODEMP = :CODEMP,'
      '  CODPROD = :CODPROD,'
      '  CST = :CST,'
      '  DESCONTO = :DESCONTO,'
      '  DESCONTO_VALOR = :DESCONTO_VALOR,'
      '  DTVENDA = :DTVENDA,'
      '  PERCENTUAL_REDUCAO_BC = :PERCENTUAL_REDUCAO_BC,'
      '  PFINAL = :PFINAL,'
      '  PUNIT = :PUNIT,'
      '  PUNIT_PROMOCAO = :PUNIT_PROMOCAO,'
      '  QTDE = :QTDE,'
      '  QTDEFINAL = :QTDEFINAL,'
      '  SEQ = :SEQ,'
      '  TOTAL_BRUTO = :TOTAL_BRUTO,'
      '  TOTAL_DESCONTO = :TOTAL_DESCONTO,'
      '  TOTAL_LIQUIDO = :TOTAL_LIQUIDO,'
      '  UNID_COD = :UNID_COD,'
      '  VALOR_IPI = :VALOR_IPI'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL and'
      '  CODPROD = :OLD_CODPROD and'
      '  SEQ = :OLD_SEQ')
    InsertSQL.Strings = (
      'insert into TVENDASITENS'
      
        '  (ALIQUOTA, ALIQUOTA_COFINS, ALIQUOTA_CSOSN, ALIQUOTA_PIS, ANO,' +
        ' CFOP_COD, '
      
        '   CODCLI, CODCLIENTE, CODCONTROL, CODEMP, CODPROD, CST, DESCONT' +
        'O, DESCONTO_VALOR, '
      
        '   DTVENDA, PERCENTUAL_REDUCAO_BC, PFINAL, PUNIT, PUNIT_PROMOCAO' +
        ', QTDE, '
      
        '   QTDEFINAL, SEQ, TOTAL_BRUTO, TOTAL_DESCONTO, TOTAL_LIQUIDO, U' +
        'NID_COD, '
      '   VALOR_IPI)'
      'values'
      
        '  (:ALIQUOTA, :ALIQUOTA_COFINS, :ALIQUOTA_CSOSN, :ALIQUOTA_PIS, ' +
        ':ANO, :CFOP_COD, '
      
        '   :CODCLI, :CODCLIENTE, :CODCONTROL, :CODEMP, :CODPROD, :CST, :' +
        'DESCONTO, '
      
        '   :DESCONTO_VALOR, :DTVENDA, :PERCENTUAL_REDUCAO_BC, :PFINAL, :' +
        'PUNIT, '
      
        '   :PUNIT_PROMOCAO, :QTDE, :QTDEFINAL, :SEQ, :TOTAL_BRUTO, :TOTA' +
        'L_DESCONTO, '
      '   :TOTAL_LIQUIDO, :UNID_COD, :VALOR_IPI)')
    DeleteSQL.Strings = (
      'delete from TVENDASITENS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL and'
      '  CODPROD = :OLD_CODPROD and'
      '  SEQ = :OLD_SEQ')
    Left = 1024
    Top = 112
  end
  object DtSrcTabelaItens: TDataSource
    AutoEdit = False
    DataSet = cdsTabelaItens
    OnStateChange = DtSrcTabelaItensStateChange
    Left = 1056
    Top = 112
  end
  object qryTitulos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnCalcFields = qryTitulosCalcFields
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.numlanc'
      '  , r.parcela'
      '  , r.codbanco'
      '  , r.nossonumero'
      '  , r.cnpj'
      '  , r.tippag'
      '  , r.dtemiss'
      '  , r.dtvenc'
      '  , r.valorrec'
      '  , r.percentjuros'
      '  , r.percentmulta'
      '  , r.percentdesconto'
      '  , r.valorrectot'
      '  , r.valorsaldo'
      '  , r.dataprocessoboleto'
      '  , r.Baixado'
      '  , Case when r.Baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Baixado_'
      '  , r.Dtrec'
      '  , r.forma_pagto'
      '  , r.status'
      'from TBCONTREC r')
    ModifySQL.Strings = (
      '')
    Left = 992
    Top = 144
    object qryTitulosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTREC.ANOLANC'
      Required = True
    end
    object qryTitulosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTREC.NUMLANC'
      Required = True
    end
    object qryTitulosPARCELA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Parc.'
      FieldName = 'PARCELA'
      Origin = 'TBCONTREC.PARCELA'
      DisplayFormat = '00'
    end
    object qryTitulosCODBANCO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Banco'
      FieldName = 'CODBANCO'
      Origin = 'TBCONTREC.CODBANCO'
      DisplayFormat = '0000'
    end
    object qryTitulosNOSSONUMERO: TIBStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NOSSONUMERO'
      Origin = 'TBCONTREC.NOSSONUMERO'
    end
    object qryTitulosCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBCONTREC.CNPJ'
      Size = 18
    end
    object qryTitulosTIPPAG: TIBStringField
      FieldName = 'TIPPAG'
      Origin = 'TBCONTREC.TIPPAG'
      Size = 35
    end
    object qryTitulosDTEMISS: TDateField
      Alignment = taCenter
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosDTVENC: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosVALORREC: TIBBCDField
      DisplayLabel = 'Valor Doc. (R$)'
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosPERCENTJUROS: TIBBCDField
      DisplayLabel = '% Juros'
      FieldName = 'PERCENTJUROS'
      Origin = 'TBCONTREC.PERCENTJUROS'
      DisplayFormat = ',0.00'
      Precision = 9
      Size = 2
    end
    object qryTitulosPERCENTMULTA: TIBBCDField
      DisplayLabel = '% Multa'
      FieldName = 'PERCENTMULTA'
      Origin = 'TBCONTREC.PERCENTMULTA'
      DisplayFormat = ',0.00'
      Precision = 9
      Size = 2
    end
    object qryTitulosPERCENTDESCONTO: TIBBCDField
      DisplayLabel = '% Desc.'
      FieldName = 'PERCENTDESCONTO'
      Origin = 'TBCONTREC.PERCENTDESCONTO'
      DisplayFormat = ',0.00'
      Precision = 9
      Size = 2
    end
    object qryTitulosVALORRECTOT: TIBBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'TBCONTREC.VALORRECTOT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosVALORSALDO: TIBBCDField
      FieldName = 'VALORSALDO'
      Origin = 'TBCONTREC.VALORSALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosDATAPROCESSOBOLETO: TDateField
      FieldName = 'DATAPROCESSOBOLETO'
      Origin = 'TBCONTREC.DATAPROCESSOBOLETO'
    end
    object qryTitulosBAIXADO: TSmallintField
      FieldName = 'BAIXADO'
      Origin = 'TBCONTREC.BAIXADO'
      Required = True
    end
    object qryTitulosBAIXADO_: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Baixado'
      FieldName = 'BAIXADO_'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryTitulosDTREC: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Baixa'
      FieldName = 'DTREC'
      Origin = 'TBCONTREC.DTREC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = '"TBCONTREC"."FORMA_PAGTO"'
      ProviderFlags = []
    end
    object qryTitulosLancamento: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'Lancamento'
      Size = 10
      Calculated = True
    end
    object qryTitulosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TBCONTREC.STATUS'
      Size = 12
    end
  end
  object dtsTitulos: TDataSource
    AutoEdit = False
    DataSet = qryTitulos
    OnStateChange = DtSrcTabelaItensStateChange
    Left = 1056
    Top = 144
  end
  object IbStrPrcGerarTitulos: TIBStoredProc
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    StoredProcName = 'SET_GERAR_TITULOS'
    Left = 1024
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'CLIENTE'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'PARCELAS'
        ParamType = ptOutput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_TOTAL'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'PARCELA'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'EMISSAO'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_DOCUMENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGTO'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'DATA_FINALIZ_VENDA'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'ANO_LANC'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUM_LANC'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'ANOVENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMVENDA'
        ParamType = ptInput
      end>
  end
  object ppImprimir: TPopupMenu
    Left = 24
    Top = 312
    object nmImprimirVenda: TMenuItem
      Caption = '&Or'#231'amento / Venda'
      OnClick = ImprimirOrcamentoClick
    end
    object nmGerarImprimirBoletos: TMenuItem
      Caption = 'Gerar / Imprimir &Boletos'
      OnClick = nmGerarImprimirBoletosClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object nmImprimirDANFE: TMenuItem
      Caption = 'Imprimir &DANFE'
      Enabled = False
      OnClick = nmImprimirDANFEClick
    end
    object nmGerarDANFEXML: TMenuItem
      Caption = '&Gerar/Salvar XML da NF-e'
      Enabled = False
      OnClick = nmImprimirDANFEClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object nmEnviarEmailCliente: TMenuItem
      Caption = '&Enviar E-mail para o Cliente'
      Enabled = False
      OnClick = nmEnviarEmailClienteClick
    end
  end
  object qryNFE: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    CachedUpdates = True
    SelectSQL.Strings = (
      'Select'
      '    n.EMPRESA'
      '  , n.ANOVENDA'
      '  , n.NUMVENDA'
      '  , n.DATAEMISSAO'
      '  , n.HORAEMISSAO'
      '  , n.SERIE'
      '  , n.NUMERO'
      '  , n.CHAVE'
      '  , n.PROTOCOLO'
      '  , n.RECIBO'
      '  , n.XML_FILENAME'
      '  , n.XML_FILE'
      '  , n.LOTE_ANO'
      '  , n.LOTE_NUM'
      'from TBNFE_ENVIADA n'
      'where n.EMPRESA = :empresa'
      '  and n.ANOVENDA = :anovenda'
      '  and n.NUMVENDA = :numvenda')
    UpdateObject = updNFE
    Left = 992
    Top = 176
    object qryNFEEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBNFE_ENVIADA"."EMPRESA"'
      Size = 18
    end
    object qryNFEANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = 'TBNFE_ENVIADA.ANOVENDA'
      Required = True
    end
    object qryNFENUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = 'TBNFE_ENVIADA.NUMVENDA'
    end
    object qryNFEDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'TBNFE_ENVIADA.DATAEMISSAO'
    end
    object qryNFEHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'TBNFE_ENVIADA.HORAEMISSAO'
    end
    object qryNFESERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'TBNFE_ENVIADA.SERIE'
      Required = True
      Size = 4
    end
    object qryNFENUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TBNFE_ENVIADA.NUMERO'
      Required = True
    end
    object qryNFECHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'TBNFE_ENVIADA.CHAVE'
      Size = 250
    end
    object qryNFEPROTOCOLO: TIBStringField
      FieldName = 'PROTOCOLO'
      Origin = 'TBNFE_ENVIADA.PROTOCOLO'
      Size = 250
    end
    object qryNFERECIBO: TIBStringField
      FieldName = 'RECIBO'
      Origin = 'TBNFE_ENVIADA.RECIBO'
      Size = 250
    end
    object qryNFEXML_FILENAME: TIBStringField
      FieldName = 'XML_FILENAME'
      Origin = 'TBNFE_ENVIADA.XML_FILENAME'
      Size = 250
    end
    object qryNFEXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = 'TBNFE_ENVIADA.XML_FILE'
      BlobType = ftMemo
      Size = 8
    end
    object qryNFELOTE_ANO: TSmallintField
      FieldName = 'LOTE_ANO'
      Origin = 'TBNFE_ENVIADA.LOTE_ANO'
    end
    object qryNFELOTE_NUM: TIntegerField
      FieldName = 'LOTE_NUM'
      Origin = 'TBNFE_ENVIADA.LOTE_NUM'
      Required = True
    end
  end
  object updNFE: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  EMPRESA,'
      '  SERIE,'
      '  NUMERO,'
      '  ANOVENDA,'
      '  NUMVENDA,'
      '  ANOCOMPRA,'
      '  NUMCOMPRA,'
      '  DATAEMISSAO,'
      '  HORAEMISSAO,'
      '  CHAVE,'
      '  PROTOCOLO,'
      '  RECIBO,'
      '  XML_FILENAME,'
      '  XML_FILE,'
      '  LOTE_ANO,'
      '  LOTE_NUM'
      'from TBNFE_ENVIADA '
      'where'
      '  EMPRESA = :EMPRESA and'
      '  NUMERO = :NUMERO and'
      '  SERIE = :SERIE')
    ModifySQL.Strings = (
      'update TBNFE_ENVIADA'
      'set'
      '  ANOVENDA = :ANOVENDA,'
      '  CHAVE = :CHAVE,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  EMPRESA = :EMPRESA,'
      '  HORAEMISSAO = :HORAEMISSAO,'
      '  LOTE_ANO = :LOTE_ANO,'
      '  LOTE_NUM = :LOTE_NUM,'
      '  NUMERO = :NUMERO,'
      '  NUMVENDA = :NUMVENDA,'
      '  PROTOCOLO = :PROTOCOLO,'
      '  RECIBO = :RECIBO,'
      '  SERIE = :SERIE,'
      '  XML_FILE = :XML_FILE,'
      '  XML_FILENAME = :XML_FILENAME'
      'where'
      '  EMPRESA = :OLD_EMPRESA and'
      '  NUMERO = :OLD_NUMERO and'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TBNFE_ENVIADA'
      
        '  (ANOVENDA, CHAVE, DATAEMISSAO, EMPRESA, HORAEMISSAO, LOTE_ANO,' +
        ' LOTE_NUM, '
      
        '   NUMERO, NUMVENDA, PROTOCOLO, RECIBO, SERIE, XML_FILE, XML_FIL' +
        'ENAME)'
      'values'
      
        '  (:ANOVENDA, :CHAVE, :DATAEMISSAO, :EMPRESA, :HORAEMISSAO, :LOT' +
        'E_ANO, '
      
        '   :LOTE_NUM, :NUMERO, :NUMVENDA, :PROTOCOLO, :RECIBO, :SERIE, :' +
        'XML_FILE, '
      '   :XML_FILENAME)')
    DeleteSQL.Strings = (
      'delete from TBNFE_ENVIADA'
      'where'
      '  EMPRESA = :OLD_EMPRESA and'
      '  NUMERO = :OLD_NUMERO and'
      '  SERIE = :OLD_SERIE')
    Left = 1024
    Top = 176
  end
  object qryTotalComprasAbertas: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    g.Valor_limite'
      '  , g.Valor_compras_abertas'
      '  , g.Valor_limite_disponivel'
      'from GET_LIMITE_DISPONIVEL_CLIENTE(:CODIGO) g')
    Left = 1024
    Top = 209
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Value = 0
      end>
    object qryTotalComprasAbertasVALOR_LIMITE: TIBBCDField
      FieldName = 'VALOR_LIMITE'
      Origin = 'GET_LIMITE_DISPONIVEL_CLIENTE.VALOR_LIMITE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTotalComprasAbertasVALOR_COMPRAS_ABERTAS: TIBBCDField
      FieldName = 'VALOR_COMPRAS_ABERTAS'
      Origin = 'GET_LIMITE_DISPONIVEL_CLIENTE.VALOR_COMPRAS_ABERTAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTotalComprasAbertasVALOR_LIMITE_DISPONIVEL: TIBBCDField
      FieldName = 'VALOR_LIMITE_DISPONIVEL'
      Origin = 'GET_LIMITE_DISPONIVEL_CLIENTE.VALOR_LIMITE_DISPONIVEL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object cdsTotalComprasAbertas: TDataSource
    DataSet = qryTotalComprasAbertas
    Left = 1056
    Top = 209
  end
  object cdsVendaFormaPagto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BeforePost = cdsVendaFormaPagtoBeforePost
    OnNewRecord = cdsVendaFormaPagtoNewRecord
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    f.ano_venda'
      '  , f.controle_venda'
      '  , f.formapagto_cod'
      '  , f.condicaopagto_cod'
      '  , f.venda_prazo'
      '  , f.valor_fpagto'
      '  , f.prazo_01'
      '  , f.prazo_02'
      '  , f.prazo_03'
      '  , f.prazo_04'
      '  , f.prazo_05'
      '  , f.prazo_06'
      '  , f.prazo_07'
      '  , f.prazo_08'
      '  , f.prazo_09'
      '  , f.prazo_10'
      '  , f.prazo_11'
      '  , f.prazo_12'
      'from TBVENDAS_FORMAPAGTO f')
    ModifySQL.Strings = (
      '')
    UpdateObject = updVendaFormaPagto
    Left = 992
    Top = 240
    object cdsVendaFormaPagtoANO_VENDA: TSmallintField
      FieldName = 'ANO_VENDA'
      Origin = '"TBVENDAS_FORMAPAGTO"."ANO_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaFormaPagtoCONTROLE_VENDA: TIntegerField
      FieldName = 'CONTROLE_VENDA'
      Origin = '"TBVENDAS_FORMAPAGTO"."CONTROLE_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaFormaPagtoFORMAPAGTO_COD: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGTO_COD'
      Origin = '"TBVENDAS_FORMAPAGTO"."FORMAPAGTO_COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaFormaPagtoCONDICAOPAGTO_COD: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = '"TBVENDAS_FORMAPAGTO"."CONDICAOPAGTO_COD"'
      Required = True
    end
    object cdsVendaFormaPagtoVENDA_PRAZO: TSmallintField
      FieldName = 'VENDA_PRAZO'
      Origin = '"TBVENDAS_FORMAPAGTO"."VENDA_PRAZO"'
    end
    object cdsVendaFormaPagtoVALOR_FPAGTO: TIBBCDField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR_FPAGTO'
      Origin = '"TBVENDAS_FORMAPAGTO"."VALOR_FPAGTO"'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaFormaPagtoPRAZO_01: TSmallintField
      FieldName = 'PRAZO_01'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_01"'
    end
    object cdsVendaFormaPagtoPRAZO_02: TSmallintField
      FieldName = 'PRAZO_02'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_02"'
    end
    object cdsVendaFormaPagtoPRAZO_03: TSmallintField
      FieldName = 'PRAZO_03'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_03"'
    end
    object cdsVendaFormaPagtoPRAZO_04: TSmallintField
      FieldName = 'PRAZO_04'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_04"'
    end
    object cdsVendaFormaPagtoPRAZO_05: TSmallintField
      FieldName = 'PRAZO_05'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_05"'
    end
    object cdsVendaFormaPagtoPRAZO_06: TSmallintField
      FieldName = 'PRAZO_06'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_06"'
    end
    object cdsVendaFormaPagtoPRAZO_07: TSmallintField
      FieldName = 'PRAZO_07'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_07"'
    end
    object cdsVendaFormaPagtoPRAZO_08: TSmallintField
      FieldName = 'PRAZO_08'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_08"'
    end
    object cdsVendaFormaPagtoPRAZO_09: TSmallintField
      FieldName = 'PRAZO_09'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_09"'
    end
    object cdsVendaFormaPagtoPRAZO_10: TSmallintField
      FieldName = 'PRAZO_10'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_10"'
    end
    object cdsVendaFormaPagtoPRAZO_11: TSmallintField
      FieldName = 'PRAZO_11'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_11"'
    end
    object cdsVendaFormaPagtoPRAZO_12: TSmallintField
      FieldName = 'PRAZO_12'
      Origin = '"TBVENDAS_FORMAPAGTO"."PRAZO_12"'
    end
    object cdsVendaFormaPagtoFormaPagto: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldKind = fkLookup
      FieldName = 'FormaPagto'
      LookupDataSet = tblFormaPagto
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCRI'
      KeyFields = 'FORMAPAGTO_COD'
      ProviderFlags = []
      Size = 50
      Lookup = True
    end
    object cdsVendaFormaPagtoCondicaoPagto: TStringField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldKind = fkLookup
      FieldName = 'CondicaoPagto'
      LookupDataSet = tblCondicaoPagto
      LookupKeyFields = 'COND_COD'
      LookupResultField = 'COND_DESCRICAO_FULL'
      KeyFields = 'CONDICAOPAGTO_COD'
      ProviderFlags = []
      Size = 250
      Lookup = True
    end
  end
  object updVendaFormaPagto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO_VENDA,'
      '  CONTROLE_VENDA,'
      '  FORMAPAGTO_COD,'
      '  CONDICAOPAGTO_COD,'
      '  VENDA_PRAZO,'
      '  VALOR_FPAGTO,'
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
      '  PRAZO_12'
      'from TBVENDAS_FORMAPAGTO '
      'where'
      '  ANO_VENDA = :ANO_VENDA and'
      '  CONTROLE_VENDA = :CONTROLE_VENDA and'
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD')
    ModifySQL.Strings = (
      'update TBVENDAS_FORMAPAGTO'
      'set'
      '  ANO_VENDA = :ANO_VENDA,'
      '  CONDICAOPAGTO_COD = :CONDICAOPAGTO_COD,'
      '  CONTROLE_VENDA = :CONTROLE_VENDA,'
      '  FORMAPAGTO_COD = :FORMAPAGTO_COD,'
      '  PRAZO_01 = :PRAZO_01,'
      '  PRAZO_02 = :PRAZO_02,'
      '  PRAZO_03 = :PRAZO_03,'
      '  PRAZO_04 = :PRAZO_04,'
      '  PRAZO_05 = :PRAZO_05,'
      '  PRAZO_06 = :PRAZO_06,'
      '  PRAZO_07 = :PRAZO_07,'
      '  PRAZO_08 = :PRAZO_08,'
      '  PRAZO_09 = :PRAZO_09,'
      '  PRAZO_10 = :PRAZO_10,'
      '  PRAZO_11 = :PRAZO_11,'
      '  PRAZO_12 = :PRAZO_12,'
      '  VALOR_FPAGTO = :VALOR_FPAGTO,'
      '  VENDA_PRAZO = :VENDA_PRAZO'
      'where'
      '  ANO_VENDA = :OLD_ANO_VENDA and'
      '  CONTROLE_VENDA = :OLD_CONTROLE_VENDA and'
      '  FORMAPAGTO_COD = :OLD_FORMAPAGTO_COD')
    InsertSQL.Strings = (
      'insert into TBVENDAS_FORMAPAGTO'
      
        '  (ANO_VENDA, CONDICAOPAGTO_COD, CONTROLE_VENDA, FORMAPAGTO_COD,' +
        ' PRAZO_01, '
      
        '   PRAZO_02, PRAZO_03, PRAZO_04, PRAZO_05, PRAZO_06, PRAZO_07, P' +
        'RAZO_08, '
      
        '   PRAZO_09, PRAZO_10, PRAZO_11, PRAZO_12, VALOR_FPAGTO, VENDA_P' +
        'RAZO)'
      'values'
      
        '  (:ANO_VENDA, :CONDICAOPAGTO_COD, :CONTROLE_VENDA, :FORMAPAGTO_' +
        'COD, :PRAZO_01, '
      
        '   :PRAZO_02, :PRAZO_03, :PRAZO_04, :PRAZO_05, :PRAZO_06, :PRAZO' +
        '_07, :PRAZO_08, '
      
        '   :PRAZO_09, :PRAZO_10, :PRAZO_11, :PRAZO_12, :VALOR_FPAGTO, :V' +
        'ENDA_PRAZO)')
    DeleteSQL.Strings = (
      'delete from TBVENDAS_FORMAPAGTO'
      'where'
      '  ANO_VENDA = :OLD_ANO_VENDA and'
      '  CONTROLE_VENDA = :OLD_CONTROLE_VENDA and'
      '  FORMAPAGTO_COD = :OLD_FORMAPAGTO_COD')
    Left = 1024
    Top = 240
  end
  object dtsVendaFormaPagto: TDataSource
    AutoEdit = False
    DataSet = cdsVendaFormaPagto
    Left = 1056
    Top = 240
  end
  object tblModalidadeFrete: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'VW_MODALIDADE_FRETE'
    TableTypes = [ttView]
    Left = 928
    Top = 480
  end
  object dtsModalidadeFrete: TDataSource
    DataSet = tblModalidadeFrete
    Left = 960
    Top = 480
  end
  object cdsVendaVolume: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnNewRecord = cdsVendaVolumeNewRecord
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    v.ano_venda'
      '  , v.controle_venda'
      '  , v.sequencial'
      '  , v.numero'
      '  , v.quantidade'
      '  , v.especie'
      '  , v.marca'
      '  , v.peso_bruto'
      '  , v.peso_liquido'
      'from TBVENDAS_VOLUME v')
    ModifySQL.Strings = (
      '')
    UpdateObject = updVendaVolume
    Left = 992
    Top = 272
    object cdsVendaVolumeANO_VENDA: TSmallintField
      FieldName = 'ANO_VENDA'
      Origin = '"TBVENDAS_VOLUME"."ANO_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaVolumeCONTROLE_VENDA: TIntegerField
      FieldName = 'CONTROLE_VENDA'
      Origin = '"TBVENDAS_VOLUME"."CONTROLE_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaVolumeSEQUENCIAL: TSmallintField
      FieldName = 'SEQUENCIAL'
      Origin = '"TBVENDAS_VOLUME"."SEQUENCIAL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendaVolumeNUMERO: TIBStringField
      DisplayLabel = 'N'#250'mero do Volume'
      FieldName = 'NUMERO'
      Origin = '"TBVENDAS_VOLUME"."NUMERO"'
      Size = 50
    end
    object cdsVendaVolumeQUANTIDADE: TSmallintField
      DisplayLabel = 'Quantidade de Volumes'
      FieldName = 'QUANTIDADE'
      Origin = '"TBVENDAS_VOLUME"."QUANTIDADE"'
    end
    object cdsVendaVolumeESPECIE: TIBStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      Origin = '"TBVENDAS_VOLUME"."ESPECIE"'
      Size = 50
    end
    object cdsVendaVolumeMARCA: TIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Origin = '"TBVENDAS_VOLUME"."MARCA"'
      Size = 50
    end
    object cdsVendaVolumePESO_BRUTO: TIBBCDField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUTO'
      Origin = '"TBVENDAS_VOLUME"."PESO_BRUTO"'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 3
    end
    object cdsVendaVolumePESO_LIQUIDO: TIBBCDField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESO_LIQUIDO'
      Origin = '"TBVENDAS_VOLUME"."PESO_LIQUIDO"'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 3
    end
  end
  object updVendaVolume: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO_VENDA,'
      '  CONTROLE_VENDA,'
      '  SEQUENCIAL,'
      '  NUMERO,'
      '  QUANTIDADE,'
      '  ESPECIE,'
      '  MARCA,'
      '  PESO_BRUTO,'
      '  PESO_LIQUIDO'
      'from TBVENDAS_VOLUME '
      'where'
      '  ANO_VENDA = :ANO_VENDA and'
      '  CONTROLE_VENDA = :CONTROLE_VENDA and'
      '  SEQUENCIAL = :SEQUENCIAL')
    ModifySQL.Strings = (
      'update TBVENDAS_VOLUME'
      'set'
      '  ANO_VENDA = :ANO_VENDA,'
      '  CONTROLE_VENDA = :CONTROLE_VENDA,'
      '  ESPECIE = :ESPECIE,'
      '  MARCA = :MARCA,'
      '  NUMERO = :NUMERO,'
      '  PESO_BRUTO = :PESO_BRUTO,'
      '  PESO_LIQUIDO = :PESO_LIQUIDO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  SEQUENCIAL = :SEQUENCIAL'
      'where'
      '  ANO_VENDA = :OLD_ANO_VENDA and'
      '  CONTROLE_VENDA = :OLD_CONTROLE_VENDA and'
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    InsertSQL.Strings = (
      'insert into TBVENDAS_VOLUME'
      
        '  (ANO_VENDA, CONTROLE_VENDA, ESPECIE, MARCA, NUMERO, PESO_BRUTO' +
        ', PESO_LIQUIDO, '
      '   QUANTIDADE, SEQUENCIAL)'
      'values'
      
        '  (:ANO_VENDA, :CONTROLE_VENDA, :ESPECIE, :MARCA, :NUMERO, :PESO' +
        '_BRUTO, '
      '   :PESO_LIQUIDO, :QUANTIDADE, :SEQUENCIAL)')
    DeleteSQL.Strings = (
      'delete from TBVENDAS_VOLUME'
      'where'
      '  ANO_VENDA = :OLD_ANO_VENDA and'
      '  CONTROLE_VENDA = :OLD_CONTROLE_VENDA and'
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    Left = 1024
    Top = 272
  end
  object dtsVendaVolume: TDataSource
    AutoEdit = False
    DataSet = cdsVendaVolume
    Left = 1056
    Top = 272
  end
  object popupAuditoria: TPopupMenu
    Left = 60
    Top = 313
    object nmPpLimparDadosNFe: TMenuItem
      Caption = 'Limpar LOG de Envio de NF-e'
      Enabled = False
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object nmPpReciboNFe: TMenuItem
      Caption = '&1. Visualizar Recibo da NF-e'
      OnClick = nmPpReciboNFeClick
    end
    object nmPpChaveNFe: TMenuItem
      Caption = '&2. Visualizar Chave da NF-e'
      OnClick = nmPpChaveNFeClick
    end
    object nmPpArquivoNFe: TMenuItem
      Caption = '&3. Visualizar Nome do Arquivo NF-e'
      OnClick = nmPpArquivoNFeClick
    end
  end
  object qryProduto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    p.Codigo'
      '  , p.Cod'
      '  , p.Descri'
      '  , p.Modelo'
      '  , p.Preco'
      '  , p.Preco_Promocao'
      '  , p.Referencia'
      '  , p.Secao'
      '  , p.Qtde'
      '  , p.Unidade'
      '  , p.Estoqmin'
      '  , p.Codgrupo'
      '  , p.Customedio'
      '  , p.Codemp'
      '  , p.Codsecao'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Codcfop'
      '  , p.Codbarra_ean'
      '  , p.Codunidade'
      '  , p.Aliquota_tipo'
      '  , p.Aliquota'
      '  , p.Aliquota_csosn'
      '  , p.Aliquota_pis'
      '  , p.Aliquota_cofins'
      '  , p.Percentual_reducao_BC'
      '  , p.Valor_ipi'
      '  , p.Reserva'
      '  , p.Movimenta_Estoque'
      '  , case when coalesce(p.Reserva, 0) > 0'
      '      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)'
      '      else coalesce(p.Qtde, 0)'
      '    end as Disponivel'
      '  , g.Descri as Descricao_Grupo'
      '  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao'
      '  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade'
      '  , u.Unp_sigla'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)'
      '  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)'
      'where p.Codigo = :Codigo')
    ModifySQL.Strings = (
      '')
    Left = 928
    Top = 512
  end
  object qryCFOP: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    c.Cfop_cod'
      '  , c.Cfop_descricao'
      '  , c.Cfop_cst_padrao_entrada'
      '  , c.Cfop_cst_padrao_saida'
      'from TBCFOP c'
      'where c.Cfop_cod = :Cfop_cod')
    ModifySQL.Strings = (
      '')
    Left = 960
    Top = 512
  end
end
