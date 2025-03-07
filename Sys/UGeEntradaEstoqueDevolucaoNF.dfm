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
      Width = 114
      Height = 13
      Caption = 'Mov. Entrada/Sa'#237'da:'
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
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      424D360800000000000036000000280000002000000010000000010020000000
      000000000000C40E0000C40E000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00CDA187FFE5BC9EFF0000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF009D9D9DFFB7B7B7FF0000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00AA7457FF904820FFB47657FFF0CEB3FF0000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00707070FF434343FF727272FFC9C9C9FF0000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00A55839FFD07850FFD07040FFB06030FFCB9173FF0000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00565656FF747474FF6B6B6BFF595959FF8D8D8DFF0000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00A050
      30FFD07850FFF09060FFE19C75FFD08860FFB96F42FFD3A486FF0000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF004E4E
      4EFF747474FF8B8B8BFF979797FF838383FF686868FF9F9F9FFF0000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00A56039FFE080
      50FFF09060FFF3AF8EFF0000FF00F2AA86FFD08860FFB46739FFEBC9AFFF0000
      FF000000FF000000FF000000FF000000FF000000FF000000FF005B5B5BFF7B7B
      7BFF8B8B8BFFABABABFF0000FF00A6A6A6FF838383FF606060FFC4C4C4FF0000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00F1B698FFF0A8
      90FFF2AC82FF0000FF000000FF000000FF00E6AA86FFD08860FFAA6841FFF2C7
      B4FF0000FF000000FF000000FF000000FF000000FF000000FF00B2B2B2FFA8A8
      A8FFA6A6A6FF0000FF000000FF000000FF00A5A5A5FF838383FF626262FFC5C5
      C5FF0000FF000000FF000000FF000000FF000000FF000000FF00FDE0CDFFF7CE
      B6FF0000FF000000FF000000FF000000FF000000FF00E19C75FFD07850FFB47D
      56FFF2CCB3FF0000FF000000FF000000FF000000FF000000FF00DDDDDDFFCACA
      CAFF0000FF000000FF000000FF000000FF000000FF00979797FF747474FF7676
      76FFC8C8C8FF0000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00E19C74FFC070
      40FFC38C74FFF1CAB0FF0000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00969696FF6969
      69FF8A8A8AFFC6C6C6FF0000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00E29F
      79FFC07040FFD29B82FFEBC3A8FF0000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF009A9A
      9AFF696969FF999999FFBEBEBEFF0000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00F1AF91FFC07050FFE4B99BFF0000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00ACACACFF6E6E6EFFB4B4B4FF0000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00F1C1A7FFD29172FF0000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00BEBEBEFF8E8E8EFF0000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF00}
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
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      424D360800000000000036000000280000002000000010000000010020000000
      000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000D5C5C4FF958DAFFF565B93FF2C3275FF2C2B66FF494878FF8373
      86FFC9ABA1FF00FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000C7C7C7FF989898FF6B6B6BFF454545FF3D3D3DFF565656FF7A7A
      7AFFABABABFF00FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000AFAABFFF4853A5FF1038A0FF1030B0FF0030C0FF0030C0FF0028B0FF1020
      80FF2B275CFF978387FF00FF000000FF000000FF000000FF000000FF000000FF
      0000B1B1B1FF6A6A6AFF535353FF535353FF565656FF565656FF4D4D4DFF3B3B
      3BFF373737FF868686FF00FF000000FF000000FF000000FF000000FF0000B5AE
      C7FF3C51B2FF1038C0FF0030D0FF0030D0FF0030D0FF0030D0FF0030D0FF0030
      D0FF0028A0FF0E1B64FF968083FF00FF000000FF000000FF000000FF0000B6B6
      B6FF6C6C6CFF5D5D5DFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF484848FF2F2F2FFF838383FF00FF000000FF000000FF0000D9CCD3FF4862
      B4FF1040D0FF0038E0FF0038E0FF0038E0FF0038E0FF0038D0FF0030D0FF0030
      D0FF0030D0FF0028A0FF2B265BFFC5A092FF00FF000000FF0000D0D0D0FF7878
      78FF666666FF656565FF656565FF656565FF656565FF606060FF5B5B5BFF5B5B
      5BFF5B5B5BFF484848FF363636FFA0A0A0FF00FF000000FF00009EA3CBFF2050
      C0FF0038F0FF0040F0FFFFFFFFFFFFFFFFFF4070F0FF4068F0FFFFFFFFFFFFFF
      FFFF0030D0FF0030D0FF102080FF7F697AFF00FF000000FF0000AFAFAFFF6D6D
      6DFF6A6A6AFF6E6E6EFFFFFFFFFFFFFFFFFF929292FF8D8D8DFFFFFFFFFFFFFF
      FFFF5B5B5BFF5B5B5BFF3B3B3BFF707070FF00FF000000FF00006E81C5FF2048
      E0FF0040FFFF1048FFFF7098FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6080
      F0FF0038D0FF0030D0FF0028B0FF474271FF00FF000000FF0000949494FF7272
      72FF737373FF797979FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F
      9FFF606060FF5B5B5BFF4D4D4DFF505050FF00FF000000FF00004B68C1FF5070
      FFFF5078FFFF3060FFFF3060FFFFB0C8FFFFFFFFFFFFFFFFFFFFA0B8FFFF0038
      F0FF0038E0FF0030D0FF0030C0FF2C2964FF00FF000000FF0000808080FF9898
      98FF9D9D9DFF8B8B8BFF8B8B8BFFD6D6D6FFFFFFFFFFFFFFFFFFCBCBCBFF6A6A
      6AFF656565FF5B5B5BFF565656FF3B3B3BFF00FF000000FF00004B68C1FF5078
      FFFF5080FFFF5078FFFF4070FFFFB0C8FFFFFFFFFFFFFFFFFFFFA0B8FFFF0040
      FFFF0038E0FF0038D0FF0030C0FF2C3173FF00FF000000FF0000808080FF9D9D
      9DFFA1A1A1FF9D9D9DFF969696FFD6D6D6FFFFFFFFFFFFFFFFFFCBCBCBFF7373
      73FF656565FF606060FF565656FF444444FF00FF000000FF00006E87D1FF5078
      F0FF6090FFFF7090FFFF90B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7098
      FFFF0038F0FF0038E0FF1030B0FF535489FF00FF000000FF00009B9B9BFF9898
      98FFADADADFFAEAEAEFFC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3
      B3FF6A6A6AFF656565FF535353FF646464FF00FF000000FF00009EA7D3FF4068
      E0FF7098FFFF80A0FFFFFFFFFFFFFFFFFFFF80A0FFFF8098FFFFFFFFFFFFFFFF
      FFFF0040F0FF0038E0FF2038A0FF8F7D9AFF00FF000000FF0000B4B4B4FF8888
      88FFB3B3B3FFBABABAFFFFFFFFFFFFFFFFFFBABABAFFB5B5B5FFFFFFFFFFFFFF
      FFFF6E6E6EFF656565FF555555FF888888FF00FF000000FF0000DCCFD6FF5677
      D0FF6080F0FF80A8FFFF90B0FFFF80A0FFFF6080FFFF4070FFFF3060FFFF1048
      FFFF0040F0FF1040C0FF4750A1FFCBABA1FF00FF000000FF0000D3D3D3FF8E8E
      8EFF9F9F9FFFBEBEBEFFC5C5C5FFBABABAFFA3A3A3FF969696FF8B8B8BFF7979
      79FF6E6E6EFF616161FF676767FFABABABFF00FF000000FF000000FF0000BBB7
      D3FF5A76D0FF6080F0FF80A0FFFF80A8FFFF8098FFFF6088FFFF3060FFFF1048
      FFFF1048D0FF3B4FB0FFA898A7FF00FF000000FF000000FF000000FF0000C0C0
      C0FF8E8E8EFF9F9F9FFFBABABAFFBEBEBEFFB5B5B5FFA8A8A8FF8B8B8BFF7979
      79FF6B6B6BFF6A6A6AFF9E9E9EFF00FF000000FF000000FF000000FF000000FF
      0000BBB6D1FF6477D0FF5070E0FF5078F0FF5080FFFF5078FFFF3060E0FF3050
      D0FF475FB0FFAF9EB1FF00FF000000FF000000FF000000FF000000FF000000FF
      0000BFBFBFFF909090FF8E8E8EFF989898FFA1A1A1FF9D9D9DFF828282FF7373
      73FF757575FFA6A6A6FF00FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000DBCCD0FF9DA5CFFF6E86CFFF4B67C0FF4B67C0FF6D7EC0FF9B9B
      BFFFD2BBB9FF00FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000CFCFCFFFB1B1B1FF9A9A9AFF7F7F7FFF7F7F7FFF909090FFA6A6
      A6FFBDBDBDFF00FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF0000}
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
  object dtsCompra: TDataSource
    AutoEdit = False
    DataSet = cdsCompra
    OnDataChange = dtsCompraDataChange
    Left = 352
  end
  object dtsFormaDevolucao: TDataSource
    DataSet = fdQryFormaDevolucao
    Left = 349
    Top = 32
  end
  object dtsUF: TDataSource
    DataSet = fdQryUF
    Left = 349
    Top = 64
  end
  object dtsCompetencia: TDataSource
    DataSet = fdQryCompetencia
    Left = 349
    Top = 96
  end
  object dtsModeloCupom: TDataSource
    DataSet = fdQryModeloCupom
    Left = 349
    Top = 128
  end
  object fdQryFormaDevolucao: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from VW_FORMA_DEVOLUCAO')
    Left = 320
    Top = 32
  end
  object fdQryUF: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from TBESTADO')
    Left = 320
    Top = 64
  end
  object fdQryCompetencia: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
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
    Left = 320
    Top = 96
  end
  object fdQryModeloCupom: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from VW_MODELO_CUPOM_FISCAL')
    Left = 320
    Top = 128
  end
  object cdsCompra: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updCompra
    SQL.Strings = (
      'Select'
      '    c.ano'
      '  , c.codcontrol'
      '  , c.codemp'
      '  , c.dnfe_entrada_ano'
      '  , c.dnfe_entrada_cod'
      '  , c.dnfe_saida_ano'
      '  , c.dnfe_saida_cod'
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
    Left = 288
    ParamData = <
      item
        Name = 'ANOCOMPRA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUMCOMPRA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object cdsCompraANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCompraCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCompraCODEMP: TStringField
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object cdsCompraDNFE_ENTRADA_ANO: TSmallintField
      FieldName = 'DNFE_ENTRADA_ANO'
      Origin = 'DNFE_ENTRADA_ANO'
    end
    object cdsCompraDNFE_ENTRADA_COD: TIntegerField
      FieldName = 'DNFE_ENTRADA_COD'
      Origin = 'DNFE_ENTRADA_COD'
      OnGetText = cdsCompraDNFE_ENTRADA_CODGetText
    end
    object cdsCompraDNFE_SAIDA_ANO: TSmallintField
      FieldName = 'DNFE_SAIDA_ANO'
      Origin = 'DNFE_SAIDA_ANO'
    end
    object cdsCompraDNFE_SAIDA_COD: TIntegerField
      FieldName = 'DNFE_SAIDA_COD'
      Origin = 'DNFE_SAIDA_COD'
      OnGetText = cdsCompraDNFE_SAIDA_CODGetText
    end
    object cdsCompraDNFE_FORMA: TSmallintField
      FieldName = 'DNFE_FORMA'
      Origin = 'DNFE_FORMA'
    end
    object cdsCompraDNFE_CHAVE: TStringField
      FieldName = 'DNFE_CHAVE'
      Origin = 'DNFE_CHAVE'
      Size = 250
    end
    object cdsCompraDNFE_UF: TStringField
      FieldName = 'DNFE_UF'
      Origin = 'DNFE_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCompraDNFE_CNPJ_CPF: TStringField
      FieldName = 'DNFE_CNPJ_CPF'
      Origin = 'DNFE_CNPJ_CPF'
      Size = 18
    end
    object cdsCompraDNFE_IE: TStringField
      FieldName = 'DNFE_IE'
      Origin = 'DNFE_IE'
    end
    object cdsCompraDNFE_COMPETENCIA: TStringField
      FieldName = 'DNFE_COMPETENCIA'
      Origin = 'DNFE_COMPETENCIA'
      Size = 4
    end
    object cdsCompraDNFE_SERIE: TStringField
      FieldName = 'DNFE_SERIE'
      Origin = 'DNFE_SERIE'
      Size = 4
    end
    object cdsCompraDNFE_NUMERO: TIntegerField
      FieldName = 'DNFE_NUMERO'
      Origin = 'DNFE_NUMERO'
    end
    object cdsCompraDNFE_MODELO: TSmallintField
      FieldName = 'DNFE_MODELO'
      Origin = 'DNFE_MODELO'
    end
    object cdsCompraDECF_MODELO: TSmallintField
      FieldName = 'DECF_MODELO'
      Origin = 'DECF_MODELO'
    end
    object cdsCompraDECF_NUMERO: TIntegerField
      FieldName = 'DECF_NUMERO'
      Origin = 'DECF_NUMERO'
    end
    object cdsCompraDECF_COO: TIntegerField
      FieldName = 'DECF_COO'
      Origin = 'DECF_COO'
    end
  end
  object updCompra: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCOMPRAS'
      '(ANO, CODCONTROL, CODEMP, DNFE_ENTRADA_ANO, '
      '  DNFE_ENTRADA_COD, DNFE_SAIDA_ANO, DNFE_SAIDA_COD, '
      '  DNFE_FORMA, DNFE_UF, DNFE_CNPJ_CPF, DNFE_IE, '
      '  DNFE_COMPETENCIA, DNFE_SERIE, DNFE_NUMERO, '
      '  DNFE_MODELO, DNFE_CHAVE, DECF_MODELO, DECF_NUMERO, '
      '  DECF_COO)'
      
        'VALUES (:NEW_ANO, :NEW_CODCONTROL, :NEW_CODEMP, :NEW_DNFE_ENTRAD' +
        'A_ANO, '
      
        '  :NEW_DNFE_ENTRADA_COD, :NEW_DNFE_SAIDA_ANO, :NEW_DNFE_SAIDA_CO' +
        'D, '
      
        '  :NEW_DNFE_FORMA, :NEW_DNFE_UF, :NEW_DNFE_CNPJ_CPF, :NEW_DNFE_I' +
        'E, '
      '  :NEW_DNFE_COMPETENCIA, :NEW_DNFE_SERIE, :NEW_DNFE_NUMERO, '
      
        '  :NEW_DNFE_MODELO, :NEW_DNFE_CHAVE, :NEW_DECF_MODELO, :NEW_DECF' +
        '_NUMERO, '
      '  :NEW_DECF_COO)')
    ModifySQL.Strings = (
      'UPDATE TBCOMPRAS'
      
        'SET ANO = :NEW_ANO, CODCONTROL = :NEW_CODCONTROL, CODEMP = :NEW_' +
        'CODEMP, '
      
        '  DNFE_ENTRADA_ANO = :NEW_DNFE_ENTRADA_ANO, DNFE_ENTRADA_COD = :' +
        'NEW_DNFE_ENTRADA_COD, '
      
        '  DNFE_SAIDA_ANO = :NEW_DNFE_SAIDA_ANO, DNFE_SAIDA_COD = :NEW_DN' +
        'FE_SAIDA_COD, '
      
        '  DNFE_FORMA = :NEW_DNFE_FORMA, DNFE_UF = :NEW_DNFE_UF, DNFE_CNP' +
        'J_CPF = :NEW_DNFE_CNPJ_CPF, '
      
        '  DNFE_IE = :NEW_DNFE_IE, DNFE_COMPETENCIA = :NEW_DNFE_COMPETENC' +
        'IA, '
      '  DNFE_SERIE = :NEW_DNFE_SERIE, DNFE_NUMERO = :NEW_DNFE_NUMERO, '
      '  DNFE_MODELO = :NEW_DNFE_MODELO, DNFE_CHAVE = :NEW_DNFE_CHAVE, '
      
        '  DECF_MODELO = :NEW_DECF_MODELO, DECF_NUMERO = :NEW_DECF_NUMERO' +
        ', '
      '  DECF_COO = :NEW_DECF_COO'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP')
    DeleteSQL.Strings = (
      'DELETE FROM TBCOMPRAS'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP')
    FetchRowSQL.Strings = (
      
        'SELECT ANO, CODCONTROL, CODEMP, CODFORN, TIPO_ENTRADA, TIPO_DOCU' +
        'MENTO, '
      
        '  TIPO_MOVIMENTO, NF, NFSERIE, MODELO_NF, LOTE_NFE_ANO, LOTE_NFE' +
        '_NUMERO, '
      
        '  LOTE_NFE_RECIBO, NFE_ENVIADA, NFE_DENEGADA, NFE_DENEGADA_MOTIV' +
        'O, '
      '  VERIFICADOR_NFE, XML_NFE, XML_NFE_FILENAME, DTLANCAMENTO, '
      
        '  DTEMISS, HREMISS, DTENT, NFCFOP, NATUREZA, STATUS, CALCULAR_TO' +
        'TAIS, '
      '  IPI, ICMSBASE, ICMSVALOR, ICMSSUBSTBASE, ICMSSUBSTVALOR, '
      '  FRETE, OUTROSCUSTOS, DESCONTO, VALORSEGURO, VALORTOTAL_II, '
      '  VALORTOTAL_IPI, VALORPIS, VALORCOFINS, TOTALPROD, TOTALNF, '
      '  INDEX_VALOR, OBS, USUARIO, FORMAPAGTO_COD, CONDICAOPAGTO_COD, '
      
        '  COMPRA_PRAZO, PRAZO_01, PRAZO_02, PRAZO_03, PRAZO_04, PRAZO_05' +
        ', '
      '  PRAZO_06, PRAZO_07, PRAZO_08, PRAZO_09, PRAZO_10, PRAZO_11, '
      '  PRAZO_12, DTFINALIZACAO_COMPRA, TIPO_DESPESA, CANCEL_USUARIO, '
      
        '  CANCEL_DATAHORA, CANCEL_MOTIVO, AUTORIZACAO_ANO, AUTORIZACAO_C' +
        'ODIGO, '
      '  AUTORIZACAO_EMPRESA, DNFE_ENTRADA_ANO, DNFE_ENTRADA_COD, '
      
        '  DNFE_SAIDA_ANO, DNFE_SAIDA_COD, DNFE_FORMA, DNFE_UF, DNFE_CNPJ' +
        '_CPF, '
      
        '  DNFE_IE, DNFE_COMPETENCIA, DNFE_SERIE, DNFE_NUMERO, DNFE_MODEL' +
        'O, '
      '  DNFE_CHAVE, DECF_MODELO, DECF_NUMERO, DECF_COO'
      'FROM TBCOMPRAS'
      
        'WHERE ANO = :ANO AND CODCONTROL = :CODCONTROL AND CODEMP = :CODE' +
        'MP')
    Left = 320
  end
end
