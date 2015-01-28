inherited frmGeApropriacaoEstoquePesquisa: TfrmGeApropriacaoEstoquePesquisa
  Left = 400
  Top = 213
  Width = 1132
  Height = 724
  Caption = 'Consultar Apropria'#231#227'o de Estoque Atual'
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 682
    Width = 1116
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object Bevel3: TBevel
    Left = 0
    Top = 643
    Width = 1116
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object pnlPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 1116
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object GrpBxPesquisar: TGroupBox
      Left = 4
      Top = 4
      Width = 1108
      Height = 73
      Align = alClient
      Caption = 'Filtrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        1108
        73)
      object BtnPesquisar: TSpeedButton
        Left = 1071
        Top = 40
        Width = 23
        Height = 22
        Hint = 'Executar Pesquisa'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
          9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
          E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
          FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
          B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
          FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
          DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
          B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
          BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
          D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
          6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnPesquisarClick
      end
      object lblPesquisar: TLabel
        Left = 560
        Top = 24
        Width = 55
        Height = 13
        Caption = '&Pesquisar'
        FocusControl = edPesquisar
      end
      object lblTipoFiltro: TLabel
        Left = 16
        Top = 24
        Width = 67
        Height = 13
        Caption = '&Definir filtro'
        FocusControl = edTipoFiltro
      end
      object lblCentroCusto: TLabel
        Left = 216
        Top = 24
        Width = 90
        Height = 13
        Caption = '&Centro de Custo'
        FocusControl = edCentroCusto
      end
      object edPesquisar: TEdit
        Left = 560
        Top = 40
        Width = 504
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edTipoFiltro: TComboBox
        Left = 16
        Top = 40
        Width = 193
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = edTipoFiltroChange
        Items.Strings = (
          'Por Grupo'
          'Por Fabricante'
          'Por Produto')
      end
      object edCentroCusto: TComboEdit
        Left = 216
        Top = 40
        Width = 337
        Height = 21
        ButtonHint = 'Pesquisar Centro de Custo (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
        ClickKey = 16464
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
        TabOrder = 1
        Text = '(Todos)'
        OnButtonClick = edCentroCustoButtonClick
        OnKeyPress = edCentroCustoKeyPress
      end
    end
  end
  object tlbBotoes: TToolBar
    Left = 0
    Top = 647
    Width = 1116
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    ButtonWidth = 96
    Caption = #39
    TabOrder = 2
    object Bevel2: TBevel
      Left = 0
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object btBtnExportar: TcxButton
      Left = 4
      Top = 2
      Width = 75
      Height = 31
      Hint = 'Exportar dados para planilha'
      Caption = 'Exportar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = btBtnExportarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C20E0000C20E00000000000000000000FFFFFFFFFFFF
        FFFFFF6349356349356349356349356349356349356349356349356349356349
        35634935634935634935FFFFFFFFFFFFFFFFFFB7A293FAE2D2DFB89EE0B699E2
        B495E2B191E4AF8CE5AD88E6AB84E7A77FE8A57AEBA377634935FFFFFFFFFFFF
        FFFFFFB9A495FBE6DAFBE7DAFBE6D9FAE5D8FBE4D6FBE2D3F9E0D0F8DDCCF9DB
        C9F8DAC7E9A47B634935FFFFFFFFFFFFFFFFFFBBA696FBECE2D6AE90D6AE90D6
        AE90D6AE90FAE7DAD6AE90D6AE90D6AE90F8DBCAE7A780634935FFFFFFFFFFFF
        FFFFFFBEA899FDF0E8FDF0E9FDF0E8FCEFE7FCEDE5FBEBE1D6AE90FAE5D7D6AE
        90F9DECEE6AC856349351876390C6F320D6C330E6832116333125D3314573316
        5233184C33194834FCECE2FBE8DDD6AE90FAE1D2E4AE8A634935207C3EFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF174C34FCEFE8FCECE2FBE8
        DCFAE4D6E3B18F6349352B8445FFFFFFFFFFFFFFFFFFFFFFFF85A9871D6F3819
        5D345B7D5F165133D6AE90D6AE90D6AE90FBE6DAE2B395634935388E4E8BBD90
        1E763B1D6E391A62358BBD903E92471D673A9FB3A1145733FDF4EFFDF1EAD6AE
        90FBE9DDE0B699634935469857FFFFFF8BBD90519E5791C49657A25A21703A6C
        9B6FDFE9DF135D33D6AE90D6AE90D6AE90FBEADFDEB89D63493553A260FFFFFF
        CFDDCF96C69A57A25A267C39276731C0D1C0FFFFFF106233FEF8F3FDF4EFD6AE
        90FCECE1DDBAA16349355EAA66E5ECE58DC49364AC693489416FA57357A0603A
        8846D6E2D60E6832D6AE90D6AE90D6AE90DCBCA5DDBBA4644A3666B06C8EC293
        5FA863479751FFFFFFCBDACC54985D54985D9BB09C0D6C32FDF8F4FDF5EFB7A2
        93644A36644A36644A3666B06CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0C6F32FEF7F4FDF4EFB9A495D4C5BA644A36FAFAFA66B06C61AD68
        5AA76452A15E489A593F9352358C4C2C8546247F411D7A3DFEF7F3FDF4EDC0AB
        9C644A36FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFD8C2B2D7C1B1D6C0B0D4BEAED2
        BDADD1BAABCFB9AACDB6A8CBB6A6CAB4A5FBFAFAFFFFFFFFFFFF}
    end
    object btBtnEnviarEmail: TcxButton
      Left = 79
      Top = 2
      Width = 75
      Height = 31
      Hint = 'Enviar e-mail'
      Caption = 'E-mail'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = btBtnEnviarEmailClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300000000000000000000000000000000000000FF00B29B96
        604830604830605040A7908700FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00B09A93705040B6A09BCEB9BAC2ACAA705040B0989300
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00705840C0ACA7
        B39C97605040BDAAA7C0AAA760483000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0070584000FF00705040AA9086604840AA978E604830AA
        978E60483060483060483060483060483060483060483060483080605000FF00
        705840D2BFBC705040E4D1CE604830DED1CEE0D0C0E0C8C0E0C0B0E0B8B0D0B0
        A0D0A890D0A89060483080685000FF00706050D5C6C0705840ECE4E4605040EC
        E1DEFFF0F0F0E8E0F0E0E0F0D8D0F0D0C0E0D0C0D0A89060483080706000FF00
        806850D8CAC4705850D8CAC4705040D8C7BEB0A090B09890F0E8E0F0E0E0F0D8
        D0F0D0C0D0B0A060483090786000FF00807060DBCFC8806050DBCFC8705840DB
        CCC8C0A890B0A090B0A090F0E8E0F0E0E0F0D8D0E0B8B060483090807000FF00
        907860DBCFC8806850F3ECEC806050F3ECECFFFFFFFFF8FFFFF8F0FFF0F02048
        D02040A0E0C0B0604830A0807000FF00907870DCCFC9907060F3EDEC806850F3
        EDECFFFFFFFFFFFFFFF8FFFFF8F04060F02048D0E0C8C060483000FF0000FF00
        908070DCD1CAF4EEEEF4EEEE807060F4EEEEFFFFFFFFFFFFFFFFFFFFF8FFFFF8
        F0FFF0F0F0E8E060483000FF0000FF00A08870C7B5A6F0E0DDD1BFB0908070F0
        E0DDE0D8D0E0D0C0E0C8C0E0C0B0E0B8A0D0B0A0D0A890B0989000FF0000FF00
        D2C3BAA08870A08870908070D2C9C4F6EEEAFFF0F0F0E8E0F0E8E0F0E0D0F0D8
        D0F0D8D0B09890DCCECB00FF0000FF0000FF0000FF00EEE6E4E5D7D3F1ECEBFA
        F7F6FFF8FFFFF8F0F0F0F0F0E8E0F0D8D0B0A090DDD0CD00FF0000FF0000FF00
        00FF0000FF0000FF00EDE3E1D0B8B0F0F0F0FFFFFFFFFFFFFFF8F0F0F0F0B0A0
        90DED0CE00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00EEE5E3C0
        B0A0C0B0A0C0B0A0C0B0A0C0B0A0E8DDDB00FF0000FF0000FF00}
    end
    object Bevel4: TBevel
      Left = 154
      Top = 2
      Width = 840
      Height = 31
      Shape = bsSpacer
    end
    object btbtnSelecionar: TcxButton
      Tag = 5
      Left = 994
      Top = 2
      Width = 120
      Height = 31
      Hint = 'Selecionar registro'
      Caption = 'Selecionar (F2)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = btbtnSelecionarClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        180000000000000600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF002D2D2D2D2D2D2D2D2D2D2D
        2D2D2D2D00FF0000FF00D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4808080808080808080808080808080D4D4D4D4D4D400FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF002D2D2DDDDDDDDDDDDDCEC3B2BCA8
        7BBCA87B2D2D2D00FF00D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D42D2D2DDDDDDDDDDDDD808080808080808080808080D4D4D400FF007F5B00
        7F5B0000FF0000FF0000FF0000FF002D2D2DE9DDB7FFFDF3FFFFFFFBF0D7E1CE
        9BB0995A7569232D2D2DD4D4D4808080808080D4D4D4D4D4D4D4D4D4D4D4D480
        8080D4D4D4D4D4D4D4D4D48080808080808080808080808080807F5B00EFAD00
        EFAD007F5B0000FF0000FF0000FF002D2D2DE9DDB4F9F4E8FFFFFFF0E4CCD5C1
        93A590547569232D2D2D808080808080808080808080D4D4D4D4D4D4D4D4D480
        8080D4D4D4D4D4D4D4D4D48080808080808080808080808080807F5B00FFFF00
        EFAD00EFAD007F5B0000FF0000FF002D2D2DE8DAB2F7F1E2FFFFFFF1E5D0D7C3
        939F8B4F7266222D2D2D808080D4D4D4808080808080808080D4D4D4D4D4D480
        8080D4D4D4D4D4D4D4D4D480808080808080808080808080808000FF007F5B00
        FFFF00EFAD00EFAD007F5B0000FF002D2D2DE6DAB1F9F4E6FFFFFFF0E5CED6C4
        93A68F547265212D2D2DD4D4D4808080D4D4D4808080808080808080D4D4D480
        8080D4D4D4D4D4D4D4D4D480808080808080808080808080808000FF0000FF00
        7F5B00FFFF00F6CF6D7F5B0000FF002D2D2DF5EACAFCF8EEFFFFFFEEE2CCD5C1
        93A88F56796C252D2D2DD4D4D4D4D4D4808080D4D4D4D4D4D4808080D4D4D480
        8080D4D4D4D4D4D4D4D4D480808080808080808080808080808000FF0000FF00
        00FF007F5B007F5B00F6CF6DD9A77D7F5B007F5B007F5B007F5B002D2D2D2D2D
        2D2D2D2D796C252D2D2DD4D4D4D4D4D4D4D4D4808080808080D4D4D48080807F
        5B0080808080808080808080808080808080808080808080808000FF0000FF00
        00FF0000FF0000FF00D9A77D7F5B00679A9AABAB6EA8D7CEECE79D7F5B00BDA1
        665745072D2D2D2D2D2DD4D4D4D4D4D4D4D4D4D4D4D4D4D4D480808080808067
        9A9AD4D4D4D4D4D4D4D4D4808080D4D4D480808080808080808000FF0000FF00
        00FF0000FF0000FF007F5B00AAFFFFAAFFFF78ABABC0F0ECCCFFFCFFFFBF7F5B
        00B1975D2D2D2D00FF00D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4808080D4D4D4D4
        D4D478ABABD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4808080D4D4D400FF0000FF00
        00FF0000FF0000FF007F5B00FFFF99AAFEFEAAFFFF78ABAB78ABAB78ABAB7F5B
        002D2D2D00FF0000FF00D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4808080D4D4D4D4
        D4D4D4D4D478ABAB78ABAB78ABAB808080808080D4D4D4D4D4D400FF0000FF00
        00FF0000FF0000FF007F5B00AAFFFFAAFFFFAAFFFFAAFFFFAAFFFFFFFF997F5B
        0000FF0000FF0000FF00D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4808080D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4808080D4D4D4D4D4D4D4D4D400FF0000FF00
        00FF0000FF0000FF007F5B00FFFF99AAFFFFAAFFFFAAFFFFAAFFFFAAFFFF7F5B
        0000FF0000FF0000FF00D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4808080D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4808080D4D4D4D4D4D4D4D4D400FF0000FF00
        00FF0000FF0000FF0000FF007F5B00FFFF99AAFFFFFFFF99AAFFFF7F5B0000FF
        0000FF0000FF0000FF00D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4808080D4
        D4D4D4D4D4D4D4D4D4D4D47F5B00D4D4D4D4D4D4D4D4D4D4D4D400FF0000FF00
        00FF0000FF0000FF0000FF0000FF007F5B007F5B007F5B007F5B0000FF0000FF
        0000FF0000FF0000FF00D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D480
        8080808080808080808080D4D4D4D4D4D4D4D4D4D4D4D4D4D4D400FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4}
      NumGlyphs = 2
    end
  end
  object PgcTabelas: TPageControl
    Left = 0
    Top = 81
    Width = 1116
    Height = 562
    ActivePage = TbsProduto
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TbsGrupo: TTabSheet
      Caption = 'TbsGrupo'
      ImageIndex = 1
      object dbgGrupo: TcxGrid
        Left = 0
        Top = 0
        Width = 1108
        Height = 534
        Hint = 
          'Para carregar os produtos do grupo, basta'#13#10'executar "dois clique' +
          's" no registro.'
        Align = alClient
        TabOrder = 0
        object dbgGrupoTbl: TcxGridDBBandedTableView
          OnDblClick = dbgGrupoTblDblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsGrupo
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0'
              Kind = skSum
              FieldName = 'ITENS'
              Column = dbgGrupoTblITENS
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_TOTAL'
              Column = dbgGrupoTblCUSTO_TOTAL
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_DISPONIVEL'
              Column = dbgGrupoTblCUSTO_DISPONIVEL
            end
            item
              Format = ',0.##'
              Kind = skSum
              FieldName = 'PERCENTUAL'
              Column = dbgGrupoTblPERCENTUAL
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.NoDataToDisplayInfoText = '<Sem dados para visualiza'#231#227'o>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Content = StyleContent
          Styles.ContentEven = StyleContentEven
          Styles.Inactive = StyleSelecao
          Styles.Selection = StyleSelecao
          Bands = <
            item
              Caption = 'Grupo'
              Options.Moving = False
              Width = 450
            end
            item
              Caption = 'Estoque'
              Options.Moving = False
              Width = 200
            end
            item
              Caption = 'Custo (R$)'
              Options.Moving = False
              Width = 250
            end>
          object dbgGrupoTblGRUPO_COD: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'GRUPO_COD'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = '###00000'
            MinWidth = 70
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgGrupoTblGRUPO_DESC: TcxGridDBBandedColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'GRUPO_DES'
            Options.Filtering = False
            Options.Moving = False
            Width = 178
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgGrupoTblITENS: TcxGridDBBandedColumn
            Caption = 'Lotes'
            DataBinding.FieldName = 'ITENS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            MinWidth = 50
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgGrupoTblESTOQUE: TcxGridDBBandedColumn
            Caption = 'Quantidade'
            DataBinding.FieldName = 'ESTOQUE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            MinWidth = 100
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgGrupoTblDISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            MinWidth = 100
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgGrupoTblCUSTO_TOTAL: TcxGridDBBandedColumn
            Caption = 'Total'
            DataBinding.FieldName = 'CUSTO_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 100
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgGrupoTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'CUSTO_DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 100
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgGrupoTblPERCENTUAL: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'PERCENTUAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Options.Filtering = False
            Options.HorzSizing = False
            Width = 50
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
        object dbgGrupoLvl: TcxGridLevel
          GridView = dbgGrupoTbl
        end
      end
    end
    object TbsFabricante: TTabSheet
      Caption = 'TbsFabricante'
      ImageIndex = 2
      object dbgFab: TcxGrid
        Left = 0
        Top = 0
        Width = 1108
        Height = 534
        Hint = 
          'Para carregar os produtos do grupo, basta'#13#10'executar "dois clique' +
          's" no registro.'
        Align = alClient
        TabOrder = 0
        object dbgFabTbl: TcxGridDBBandedTableView
          OnDblClick = dbgFabTblDblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsFabricante
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0'
              Kind = skSum
              FieldName = 'ITENS'
              Column = dbgFabTblITENS
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_TOTAL'
              Column = dbgFabTblCUSTO_TOTAL
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_DISPONIVEL'
              Column = dbgFabTblCUSTO_DISPONIVEL
            end
            item
              Format = ',0.##'
              Kind = skSum
              FieldName = 'PERCENTUAL'
              Column = dbgFabTblPERCENTUAL
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.NoDataToDisplayInfoText = '<Sem dados para visualiza'#231#227'o>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Content = StyleContent
          Styles.ContentEven = StyleContentEven
          Styles.Inactive = StyleSelecao
          Styles.Selection = StyleSelecao
          Bands = <
            item
              Caption = 'Fabricante'
              Options.Moving = False
              Width = 450
            end
            item
              Caption = 'Estoque'
              Options.Moving = False
              Width = 160
            end
            item
              Caption = 'Custos (R$)'
              Options.Moving = False
              Width = 200
            end>
          object dbgFabTblFABRICANTE_COD: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'FABRICANTE_COD'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = '###00000'
            MinWidth = 70
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgFabTblFABRICANTE_NOME: TcxGridDBBandedColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'FABRICANTE_NOME'
            Options.Filtering = False
            Options.Moving = False
            Width = 178
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgFabTblITENS: TcxGridDBBandedColumn
            Caption = 'Lotes'
            DataBinding.FieldName = 'ITENS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.###'
            MinWidth = 50
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgFabTblESTOQUE: TcxGridDBBandedColumn
            Caption = 'Quantidade'
            DataBinding.FieldName = 'ESTOQUE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            MinWidth = 80
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 80
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgFabTblDISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            MinWidth = 80
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 80
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgFabTblCUSTO_TOTAL: TcxGridDBBandedColumn
            Caption = 'Total'
            DataBinding.FieldName = 'CUSTO_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 100
            Options.Editing = False
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgFabTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'CUSTO_DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 100
            Options.Editing = False
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgFabTblPERCENTUAL: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'PERCENTUAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Options.Editing = False
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 50
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
        object dbgFabLvl: TcxGridLevel
          GridView = dbgFabTbl
        end
      end
    end
    object TbsProduto: TTabSheet
      Caption = 'TbsProduto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object dbgProduto: TcxGrid
        Left = 0
        Top = 0
        Width = 1108
        Height = 534
        Align = alClient
        TabOrder = 0
        object dbgProdutoTbl: TcxGridDBBandedTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsProduto
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0'
              Kind = skCount
              FieldName = 'LOTE_ID'
              Column = dbgProdutoTblPRODUTO
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_TOTAL'
              Column = dbgProdutoTblCUSTO_TOTAL
            end
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'CUSTO_DISPONIVEL'
              Column = dbgProdutoTblCUSTO_DISPONIVEL
            end
            item
              Format = ',0.##'
              Kind = skSum
              FieldName = 'PERCENTUAL'
              Column = dbgProdutoTblPERCENTUAL
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.NoDataToDisplayInfoText = '<Sem dados para visualiza'#231#227'o>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Content = StyleContent
          Styles.ContentEven = StyleContentEven
          Styles.Inactive = StyleSelecao
          Styles.Selection = StyleSelecao
          Bands = <
            item
              Caption = 'Produto'
              Options.Moving = False
              Width = 700
            end
            item
              Caption = 'Estoque'
              Options.Moving = False
              Width = 180
            end
            item
              Caption = 'Custos (R$)'
              Options.Moving = False
              Width = 220
            end>
          object dbgProdutoTblPRODUTO: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'PRODUTO'
            Options.Filtering = False
            Options.Moving = False
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblDESCRI_APRESENTACAO: TcxGridDBBandedColumn
            Caption = 'Descri'#231#227'o + Apresenta'#231#227'o'
            DataBinding.FieldName = 'DESCRI_APRESENTACAO'
            Options.Filtering = False
            Options.Moving = False
            Width = 247
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblGRUPO_DES: TcxGridDBBandedColumn
            Caption = 'Grupo'
            DataBinding.FieldName = 'GRUPO_DES'
            MinWidth = 150
            Options.HorzSizing = False
            Options.Moving = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgProdutoTblFABRICANTE_NOME: TcxGridDBBandedColumn
            Caption = 'Fabricante'
            DataBinding.FieldName = 'FABRICANTE_NOME'
            MinWidth = 150
            Options.HorzSizing = False
            Options.Moving = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object dbgProdutoTblESTOQUE: TcxGridDBBandedColumn
            Caption = 'Quantidade'
            DataBinding.FieldName = 'ESTOQUE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.###'
            MinWidth = 70
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblDISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.###'
            MinWidth = 70
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Styles.Content = StyleContentEven
            Styles.Header = StyleSelecao
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblUND: TcxGridDBBandedColumn
            Caption = 'Und.'
            DataBinding.FieldName = 'UND'
            HeaderAlignmentHorz = taCenter
            MinWidth = 40
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 40
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object dbgProdutoTblCUSTO_TOTAL: TcxGridDBBandedColumn
            Caption = 'Total'
            DataBinding.FieldName = 'CUSTO_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 90
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object dbgProdutoTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn
            Caption = 'Dispon'#237'vel'
            DataBinding.FieldName = 'CUSTO_DISPONIVEL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00#'
            HeaderAlignmentHorz = taCenter
            MinWidth = 90
            Options.Filtering = False
            Options.Moving = False
            Options.Sorting = False
            Styles.Content = StyleContentEven
            Styles.Header = StyleSelecao
            Width = 100
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object dbgProdutoTblPERCENTUAL: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'PERCENTUAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##'
            HeaderAlignmentHorz = taCenter
            MinWidth = 40
            Options.Filtering = False
            Options.Moving = False
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
        object dbgProdutoLvl: TcxGridLevel
          GridView = dbgProdutoTbl
        end
      end
    end
  end
  object svdArquivo: TSaveDialog
    DefaultExt = '.xls'
    Filter = 'Planilha Excel (*.xls)|*.xls'
    Title = 'Salvar arquivo'
    Left = 280
    Top = 200
  end
  object smtpEmail: TIdSMTP
    MaxLineAction = maException
    Port = 25
    AuthenticationType = atNone
    Left = 312
    Top = 200
  end
  object msgEmail: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    DeleteTempFiles = False
    Encoding = meMIME
    Priority = mpHigh
    Recipients = <>
    ReplyTo = <>
    Left = 344
    Top = 200
  end
  object IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv2
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 376
    Top = 200
  end
  object StyleRepository: TcxStyleRepository
    Left = 408
    Top = 200
    PixelsPerInch = 96
    object StyleSelecao: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object StyleContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMenuBar
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object StyleContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10930928
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
  end
  object QryGrupo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    p.codgrupo as grupo_cod'
      '  , coalesce(g.descri, '#39'* A Definir'#39') as grupo_des'
      ''
      '  , count(e.lote_id) as itens'
      '  , sum(r.compra_qtde_01) as compra_qtde_01'
      '  , sum(r.compra_valor_01) as compra_valor_01'
      '  , sum(r.venda_qtde_01) as venda_qtde_01'
      '  , sum(r.venda_valor_01) as venda_valor_01'
      '  , max(r.data_ultima_compra) as data_ultima_compra'
      '  , max(r.data_ultima_venda) as data_ultima_venda'
      ''
      '  , sum(e.estoque) as estoque'
      '  , sum(e.reserva) as reserva'
      '  , sum(e.disponivel) as disponivel'
      '  , sum(e.custo_total) as custo_total'
      '  , sum(e.custo_reserva) as custo_reserva'
      '  , sum(e.custo_disponivel) as custo_disponivel'
      ''
      '  , cast(0.0 as numeric(18,4)) as percentual'
      ''
      
        'from GET_ESTOQUE_ALMOX_DISPONIVEL('#39'e=e'#39', c=c, null, null, null, ' +
        'null, null) e'
      '  inner join TBPRODUTO p on (p.cod = e.produto)'
      ''
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      
        '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = e.produ' +
        'to)'
      ''
      'where (1=1)'
      ''
      'group by'
      '    1'
      '  , 2')
    Left = 56
    Top = 288
  end
  object QryFabricante: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    p.codfabricante as fabricante_cod'
      '  , coalesce(f.nome, '#39'* A Definir'#39') as fabricante_nome'
      ''
      '  , count(e.lote_id) as itens'
      '  , sum(r.compra_qtde_01) as compra_qtde_01'
      '  , sum(r.compra_valor_01) as compra_valor_01'
      '  , sum(r.venda_qtde_01) as venda_qtde_01'
      '  , sum(r.venda_valor_01) as venda_valor_01'
      '  , max(r.data_ultima_compra) as data_ultima_compra'
      '  , max(r.data_ultima_venda) as data_ultima_venda'
      ''
      '  , sum(e.estoque) as estoque'
      '  , sum(e.reserva) as reserva'
      '  , sum(e.disponivel) as disponivel'
      '  , sum(e.custo_total) as custo_total'
      '  , sum(e.custo_reserva) as custo_reserva'
      '  , sum(e.custo_disponivel) as custo_disponivel'
      ''
      '  , cast(0.0 as numeric(18,4)) as percentual'
      ''
      
        'from GET_ESTOQUE_ALMOX_DISPONIVEL('#39'e=e'#39', c=c, null, null, null, ' +
        'null, null) e'
      '  inner join TBPRODUTO p on (p.cod = e.produto)'
      ''
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      
        '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = e.produ' +
        'to)'
      ''
      'where (1=1)'
      ''
      'group by'
      '    1'
      '  , 2')
    Left = 56
    Top = 320
  end
  object QryProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    e.produto'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.codgrupo as grupo_cod'
      '  , g.descri   as grupo_des'
      '  , p.codfabricante as fabricante_cod'
      '  , f.nome          as fabricante_nome'
      ''
      '  , coalesce(e.unidade, p.codunidade_fracionada) as und_cod'
      '  , u.unp_descricao as und_desc'
      '  , u.unp_sigla     as und_sigla'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3) as und'
      ''
      '  , sum(r.compra_qtde_01) as compra_qtde_01'
      '  , sum(r.compra_valor_01) as compra_valor_01'
      '  , sum(r.venda_qtde_01) as venda_qtde_01'
      '  , sum(r.venda_valor_01) as venda_valor_01'
      '  , max(r.data_ultima_compra) as data_ultima_compra'
      '  , max(r.data_ultima_venda) as data_ultima_venda'
      ''
      '  , e.fracionador'
      '  , sum(e.estoque) as estoque'
      '  , sum(e.reserva) as reserva'
      '  , sum(e.disponivel) as disponivel'
      '  , sum(e.custo_total) as custo_total'
      '  , sum(e.custo_reserva) as custo_reserva'
      '  , sum(e.custo_disponivel) as custo_disponivel'
      
        '  , '#39'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'#39' as lote_id--e.lot' +
        'e_id'
      ''
      '  , cast(0.0 as numeric(18,4)) as percentual'
      ''
      
        'from GET_ESTOQUE_ALMOX_DISPONIVEL('#39'e=e'#39', c=c, null, null, null, ' +
        'null, null) e'
      '  inner join TBPRODUTO p on (p.cod = e.produto)'
      ''
      
        '  left join TBUNIDADEPROD u on (u.unp_cod = coalesce(e.unidade, ' +
        'p.codunidade_fracionada))'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      
        '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = e.produ' +
        'to)'
      ''
      'where (1=1)'
      ''
      'group by'
      '    e.produto'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.codgrupo'
      '  , g.descri'
      '  , p.codfabricante'
      '  , f.nome'
      '  , coalesce(e.unidade, p.codunidade_fracionada)'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3)'
      '  , e.fracionador'
      '  , '#39'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'#39'--e.lote_id')
    Left = 56
    Top = 352
  end
  object QryTotal: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    count(e.lote_id) as lotes'
      '  , sum(e.estoque) as estoque'
      '  , sum(e.reserva) as reserva'
      '  , sum(e.disponivel) as disponivel'
      '  , sum(e.custo_total) as custo_total'
      '  , sum(e.custo_reserva) as custo_reserva'
      '  , sum(e.custo_disponivel) as custo_disponivel'
      
        'from GET_ESTOQUE_ALMOX_DISPONIVEL('#39'e=e'#39', c=c, null, null, null, ' +
        'null, null) e'
      ''
      'where (1=1)'
      '')
    Left = 56
    Top = 400
  end
  object DspTotal: TDataSetProvider
    DataSet = QryTotal
    Left = 88
    Top = 400
  end
  object DspProduto: TDataSetProvider
    DataSet = QryProduto
    Left = 88
    Top = 352
  end
  object DspFabricante: TDataSetProvider
    DataSet = QryFabricante
    Left = 88
    Top = 320
  end
  object DspGrupo: TDataSetProvider
    DataSet = QryGrupo
    Left = 88
    Top = 288
  end
  object CdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGrupo'
    Left = 120
    Top = 288
  end
  object CdsFabricante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFabricante'
    Left = 120
    Top = 320
  end
  object CdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProduto'
    Left = 120
    Top = 352
  end
  object CdsTotal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTotal'
    Left = 120
    Top = 400
  end
  object dsTotal: TDataSource
    DataSet = CdsTotal
    Left = 152
    Top = 400
  end
  object dsProduto: TDataSource
    DataSet = CdsProduto
    Left = 152
    Top = 352
  end
  object dsFabricante: TDataSource
    DataSet = CdsFabricante
    Left = 152
    Top = 320
  end
  object dsGrupo: TDataSource
    DataSet = CdsGrupo
    Left = 152
    Top = 288
  end
end
