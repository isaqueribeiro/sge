inherited frmGeEntradaEstoqueCancelar: TfrmGeEntradaEstoqueCancelar
  ActiveControl = dbMotivo
  BorderIcons = [biSystemMenu]
  BorderWidth = 4
  Caption = 'Cancelar Entrada no Estoque'
  ClientHeight = 427
  ClientWidth = 593
  OldCreateOrder = True
  ExplicitWidth = 617
  ExplicitHeight = 474
  DesignSize = (
    593
    427)
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
    Anchors = [akTop, akBottom]
    Caption = 'Andamento do processo . . . . '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 593
    Height = 121
    Align = alTop
    Caption = 'Controle da Entrada'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -2
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
    object lblFornecedor: TLabel
      Left = 112
      Top = 24
      Width = 67
      Height = 13
      Caption = 'Fornecedor:'
      FocusControl = dbFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSerie: TLabel
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
    object lblNFe: TLabel
      Left = 56
      Top = 64
      Width = 63
      Height = 13
      Caption = 'Nota Fiscal:'
      FocusControl = dbNFe
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataEntrada: TLabel
      Left = 184
      Top = 64
      Width = 77
      Height = 13
      Caption = 'Data Entrada:'
      FocusControl = dbDataEntrada
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalNota: TLabel
      Left = 287
      Top = 64
      Width = 95
      Height = 13
      Caption = 'Total Nota Fiscal:'
      FocusControl = dbTotalNota
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'CODCONTROL'
      DataSource = dtsEntrada
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbFornecedor: TDBEdit
      Left = 112
      Top = 40
      Width = 465
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NOMEFORN'
      DataSource = dtsEntrada
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
      DataField = 'NFSERIE'
      DataSource = dtsEntrada
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbNFe: TDBEdit
      Left = 56
      Top = 80
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NF'
      DataSource = dtsEntrada
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbDataEntrada: TDBEdit
      Left = 184
      Top = 80
      Width = 97
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'DTENT'
      DataSource = dtsEntrada
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object dbTotalNota: TDBEdit
      Left = 287
      Top = 80
      Width = 114
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'TOTALNF'
      DataSource = dtsEntrada
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object GrpBxImposto: TGroupBox
    Left = 0
    Top = 125
    Width = 593
    Height = 264
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Dados do Cancelamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      593
      264)
    object lblCancelUsuario: TLabel
      Left = 16
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Usu'#225'rio:'
      FocusControl = dbCancelUsuario
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCancelDataHora: TLabel
      Left = 408
      Top = 24
      Width = 63
      Height = 13
      Caption = 'Data/Hora:'
      FocusControl = dbCancelDataHora
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMotivo: TLabel
      Left = 16
      Top = 64
      Width = 42
      Height = 13
      Caption = 'Motivo:'
      FocusControl = dbMotivo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbMotivo: TMemo
      Left = 16
      Top = 80
      Width = 561
      Height = 168
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
      TabOrder = 2
    end
    object dbCancelUsuario: TEdit
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
    object dbCancelDataHora: TEdit
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
  end
  object btnCancelar: TcxButton
    Left = 405
    Top = 394
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      424D360800000000000036000000280000002000000010000000010020000000
      000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000707070FF505850FF000000FFD0C0AEFF00FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000707070FF545454FF000000FFBCBCBCFF00FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000B0A090FF7C644DFFAD957FFFA0A0A0FFFFFFFFFF5090B0FF101010FF988A
      76FF7B6149FF604830FF604830FF00FF000000FF000000FF000000FF000000FF
      00009C9C9CFF5F5F5FFF909090FFA0A0A0FFFFFFFFFF939393FF101010FF8585
      85FF5C5C5CFF434343FF434343FF00FF000000FF000000FF000000FF000000FF
      0000D6BAA8FFFFFFFFFFF0E8E0FFA0A0A0FF90B8C0FF70D0E0FF5098B0FF1010
      10FFA09890FFB0A090FF604830FF00FF000000FF000000FF000000FF000000FF
      0000B7B7B7FFFFFFFFFFE6E6E6FFA0A0A0FFB6B6B6FFCBCBCBFF989898FF1010
      10FF969696FF9C9C9CFF434343FF00FF000000FF000000FF0000B7B3DAFF0E2B
      DFFFB8ABBDFFFFFFFFFFFFFFFFFFE0E0E0FF50A0B0FF60A8E0FF60C0D0FF5098
      B0FF101010FF909090FF7A5F46FF00FF000000FF000000FF0000BFBFBFFF5E5E
      5EFFB1B1B1FFFFFFFFFFFFFFFFFFE0E0E0FF9C9C9CFFB1B1B1FFBBBBBBFF9898
      98FF101010FF909090FF5A5A5AFF00FF000000FF000000FF00000028FFFF0020
      F0FF4050D0FFFFFFFFFFFFFFFFFFFFFFFFFF4050E0FF0010B0FF90E0F0FF60C0
      D0FF5098B0FF101010FF8B7D72FF00FF000000FF000000FF0000646464FF5B5B
      5BFF747474FFFFFFFFFFFFFFFFFFFFFFFFFF797979FF3E3E3EFFDCDCDCFFBBBB
      BBFF989898FF101010FF7B7B7BFF00FF000000FF000000FF00002D51FCFF1038
      FFFF0028FFFFF0F8FFFFFFFFFFFF9098F0FF0018C0FF6078E0FF60A8B0FF90E0
      F0FF60C0D0FF5098B0FF101010FFCBAF98FF00FF000000FF0000808080FF6F6F
      6FFF646464FFF9F9F9FFFFFFFFFFB1B1B1FF484848FF949494FFA3A3A3FFDCDC
      DCFFBBBBBBFF989898FF101010FFAAAAAAFF00FF000000FF0000E7D7DBFF3050
      FFFF2040FFFF90A0F0FFC0C8F0FF0028F0FF4058F0FFFFF8F0FFD0D8E0FF70B0
      C0FF90E0F0FF70C8E0FF808880FF303890FFB19595FF00FF0000D9D9D9FF8181
      81FF767676FFB6B6B6FFD3D3D3FF606060FF838383FFF6F6F6FFD9D9D9FFAEAE
      AEFFDCDCDCFFC6C6C6FF848484FF515151FF979797FF00FF000000FF0000DCD0
      DCFF4060FFFF3050FFFF2040FFFF3050FFFFFFF8FFFFFFFFFFFFFFF8F0FFD0D8
      E0FF80B0C0FFD0B8B0FF7088D0FF6070B0FF303890FF00FF000000FF0000D4D4
      D4FF8C8C8CFF818181FF767676FF818181FFFAFAFAFFFFFFFFFFF6F6F6FFD9D9
      D9FFB0B0B0FFB8B8B8FF9B9B9BFF818181FF515151FF00FF000000FF000000FF
      0000B8B5D1FF4068FFFF4060FFFFD0D8FFFFFFFFFFFFFFFFFFFFFFF8FFFFF0F0
      F0FFD0D8D0FF6070B0FF7090E0FF6078D0FF6070B0FF00FF000000FF000000FF
      0000BDBDBDFF919191FF8C8C8CFFE2E2E2FFFFFFFFFFFFFFFFFFFAFAFAFFF0F0
      F0FFD4D4D4FF818181FFA4A4A4FF909090FF818181FF00FF000000FF0000C6C4
      E2FF6078FFFF6078FFFF6080FFFF5070FFFFF0F0FFFFFFFFFFFFFFFFFFFFFFF8
      F0FFF0F0F0FFB0A0A0FF6070B0FF6070B0FFD1B2A5FF00FF000000FF0000CDCD
      CDFF9E9E9EFF9E9E9EFFA2A2A2FF979797FFF4F4F4FFFFFFFFFFFFFFFFFFF6F6
      F6FFF0F0F0FFA1A1A1FF818181FF818181FFB1B1B1FF00FF0000B1B6E9FF5078
      FFFF5078FFFFC0D0FFFFFFFFFFFF7088FFFF6078FFFFD0E0FFFFFFFFFFFFFFFF
      FFFFB0A090FFB0A090FF96785EFF00FF000000FF000000FF0000C4C4C4FF9C9C
      9CFF9C9C9CFFDCDCDCFFFFFFFFFFA9A9A9FF9E9E9EFFE7E7E7FFFFFFFFFFFFFF
      FFFF9C9C9CFF9C9C9CFF737373FF00FF000000FF0000859BF3FF5078FFFF5078
      FFFFC8BED1FFFFFFFFFFFFFFFFFFFFFFFFFFB0C8FFFF8098FFFFFFFFFFFFB0A0
      90FF806850FF806050FF604830FF00FF000000FF0000B3B3B3FF9C9C9CFF9C9C
      9CFFC4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D6FFB4B4B4FFFFFFFFFF9C9C
      9CFF636363FF5E5E5EFF434343FF00FF000000FF0000859BF3FF6585FAFFDCD2
      DCFFD8C7B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8
      90FFD0C8C0FF806850FFDEBAA5FF00FF000000FF0000B3B3B3FFA4A4A4FFD6D6
      D6FFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3
      A3FFC6C6C6FF636363FFB7B7B7FF00FF000000FF000000FF000000FF000000FF
      0000D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8
      A0FF807060FFDFBDA7FF00FF000000FF000000FF000000FF000000FF000000FF
      0000BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8
      A8FF6C6C6CFFB9B9B9FF00FF000000FF000000FF000000FF000000FF000000FF
      0000E0C0B0FFE0C0B0FFE0C0B0FFE0C0B0FFE0C0B0FFD0C0B0FFD0B8B0FFD0B0
      A0FFE0BEAAFF00FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000BEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBCBCBCFFB8B8B8FFAEAE
      AEFFBBBBBBFF00FF000000FF000000FF000000FF0000}
    OptionsImage.NumGlyphs = 2
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object btFechar: TcxButton
    Left = 500
    Top = 394
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
  object dtsEntrada: TDataSource
    AutoEdit = False
    DataSet = cdsEntrada
    Left = 176
    Top = 312
  end
  object cdsEntrada: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updEntrada
    SQL.Strings = (
      'Select'
      '    c.ANO'
      '  , c.CODCONTROL'
      '  , c.CODEMP'
      '  , c.CODFORN'
      '  , c.NF'
      '  , c.NFSERIE'
      '  , c.DTLANCAMENTO'
      '  , c.DTEMISS'
      '  , c.DTENT'
      '  , c.DTFINALIZACAO_COMPRA'
      '  , c.NFCFOP'
      '  , c.NATUREZA'
      '  , c.STATUS'
      '  , c.IPI'
      '  , c.ICMSBASE'
      '  , c.ICMSVALOR'
      '  , c.ICMSSUBSTBASE'
      '  , c.ICMSSUBSTVALOR'
      '  , c.FRETE'
      '  , c.OUTROSCUSTOS'
      '  , c.DESCONTO'
      '  , c.TOTALNF'
      '  , c.TOTALPROD'
      '  , c.OBS'
      '  , c.USUARIO'
      '  , c.FORMAPAGTO_COD'
      '  , c.CONDICAOPAGTO_COD'
      '  , c.COMPRA_PRAZO'
      '  , c.PRAZO_01'
      '  , c.PRAZO_02'
      '  , c.PRAZO_03'
      '  , c.PRAZO_04'
      '  , c.PRAZO_05'
      '  , c.PRAZO_06'
      '  , c.PRAZO_07'
      '  , c.PRAZO_08'
      '  , c.PRAZO_09'
      '  , c.PRAZO_10'
      '  , c.PRAZO_11'
      '  , c.PRAZO_12'
      '  , c.Cancel_usuario'
      '  , c.Cancel_datahora'
      '  , c.Cancel_motivo'
      '  , f.Nomeforn'
      '  , f.Cnpj'
      'from TBCOMPRAS c'
      '  inner join TBFORNECEDOR f on (f.Codforn = c.Codforn)'
      'where c.Ano = :anocompra'
      '  and c.Codcontrol = :numcompra'
      '')
    Left = 176
    Top = 216
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
    object cdsEntradaANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEntradaCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '###0000000'
    end
    object cdsEntradaCODEMP: TStringField
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object cdsEntradaCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = 'CODFORN'
    end
    object cdsEntradaNF: TIntegerField
      FieldName = 'NF'
      Origin = 'NF'
      Required = True
    end
    object cdsEntradaNFSERIE: TStringField
      FieldName = 'NFSERIE'
      Origin = 'NFSERIE'
      Size = 4
    end
    object cdsEntradaDTLANCAMENTO: TSQLTimeStampField
      FieldName = 'DTLANCAMENTO'
      Origin = 'DTLANCAMENTO'
    end
    object cdsEntradaDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEntradaDTENT: TDateField
      FieldName = 'DTENT'
      Origin = 'DTENT'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEntradaDTFINALIZACAO_COMPRA: TSQLTimeStampField
      FieldName = 'DTFINALIZACAO_COMPRA'
      Origin = 'DTFINALIZACAO_COMPRA'
    end
    object cdsEntradaNFCFOP: TIntegerField
      FieldName = 'NFCFOP'
      Origin = 'NFCFOP'
    end
    object cdsEntradaNATUREZA: TStringField
      FieldName = 'NATUREZA'
      Origin = 'NATUREZA'
      Size = 4
    end
    object cdsEntradaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsEntradaOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object cdsEntradaTOTALNF: TFMTBCDField
      FieldName = 'TOTALNF'
      Origin = 'TOTALNF'
      Precision = 18
      Size = 2
    end
    object cdsEntradaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object cdsEntradaFORMAPAGTO_COD: TSmallintField
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'FORMAPAGTO_COD'
    end
    object cdsEntradaCONDICAOPAGTO_COD: TSmallintField
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'CONDICAOPAGTO_COD'
    end
    object cdsEntradaCOMPRA_PRAZO: TSmallintField
      FieldName = 'COMPRA_PRAZO'
      Origin = 'COMPRA_PRAZO'
      Required = True
    end
    object cdsEntradaPRAZO_01: TSmallintField
      FieldName = 'PRAZO_01'
      Origin = 'PRAZO_01'
    end
    object cdsEntradaPRAZO_02: TSmallintField
      FieldName = 'PRAZO_02'
      Origin = 'PRAZO_02'
    end
    object cdsEntradaPRAZO_03: TSmallintField
      FieldName = 'PRAZO_03'
      Origin = 'PRAZO_03'
    end
    object cdsEntradaPRAZO_04: TSmallintField
      FieldName = 'PRAZO_04'
      Origin = 'PRAZO_04'
    end
    object cdsEntradaPRAZO_05: TSmallintField
      FieldName = 'PRAZO_05'
      Origin = 'PRAZO_05'
    end
    object cdsEntradaPRAZO_06: TSmallintField
      FieldName = 'PRAZO_06'
      Origin = 'PRAZO_06'
    end
    object cdsEntradaPRAZO_07: TSmallintField
      FieldName = 'PRAZO_07'
      Origin = 'PRAZO_07'
    end
    object cdsEntradaPRAZO_08: TSmallintField
      FieldName = 'PRAZO_08'
      Origin = 'PRAZO_08'
    end
    object cdsEntradaPRAZO_09: TSmallintField
      FieldName = 'PRAZO_09'
      Origin = 'PRAZO_09'
    end
    object cdsEntradaPRAZO_10: TSmallintField
      FieldName = 'PRAZO_10'
      Origin = 'PRAZO_10'
    end
    object cdsEntradaPRAZO_11: TSmallintField
      FieldName = 'PRAZO_11'
      Origin = 'PRAZO_11'
    end
    object cdsEntradaPRAZO_12: TSmallintField
      FieldName = 'PRAZO_12'
      Origin = 'PRAZO_12'
    end
    object cdsEntradaCANCEL_USUARIO: TStringField
      FieldName = 'CANCEL_USUARIO'
      Origin = 'CANCEL_USUARIO'
      Size = 50
    end
    object cdsEntradaCANCEL_DATAHORA: TSQLTimeStampField
      FieldName = 'CANCEL_DATAHORA'
      Origin = 'CANCEL_DATAHORA'
    end
    object cdsEntradaCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = 'CANCEL_MOTIVO'
      BlobType = ftMemo
    end
    object cdsEntradaNOMEFORN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEFORN'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsEntradaCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
  end
  object updEntrada: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCOMPRAS'
      '(ANO, CODCONTROL, CODEMP, CODFORN, NF, '
      '  NFSERIE, DTLANCAMENTO, DTEMISS, DTENT, '
      '  NFCFOP, NATUREZA, STATUS, IPI, ICMSBASE, '
      '  ICMSVALOR, ICMSSUBSTBASE, ICMSSUBSTVALOR, '
      '  FRETE, OUTROSCUSTOS, DESCONTO, TOTALPROD, '
      '  TOTALNF, OBS, USUARIO, FORMAPAGTO_COD, '
      '  CONDICAOPAGTO_COD, COMPRA_PRAZO, PRAZO_01, '
      '  PRAZO_02, PRAZO_03, PRAZO_04, PRAZO_05, '
      '  PRAZO_06, PRAZO_07, PRAZO_08, PRAZO_09, '
      '  PRAZO_10, PRAZO_11, PRAZO_12, DTFINALIZACAO_COMPRA, '
      '  CANCEL_USUARIO, CANCEL_DATAHORA, CANCEL_MOTIVO)'
      
        'VALUES (:NEW_ANO, :NEW_CODCONTROL, :NEW_CODEMP, :NEW_CODFORN, :N' +
        'EW_NF, '
      '  :NEW_NFSERIE, :NEW_DTLANCAMENTO, :NEW_DTEMISS, :NEW_DTENT, '
      
        '  :NEW_NFCFOP, :NEW_NATUREZA, :NEW_STATUS, :NEW_IPI, :NEW_ICMSBA' +
        'SE, '
      '  :NEW_ICMSVALOR, :NEW_ICMSSUBSTBASE, :NEW_ICMSSUBSTVALOR, '
      '  :NEW_FRETE, :NEW_OUTROSCUSTOS, :NEW_DESCONTO, :NEW_TOTALPROD, '
      '  :NEW_TOTALNF, :NEW_OBS, :NEW_USUARIO, :NEW_FORMAPAGTO_COD, '
      '  :NEW_CONDICAOPAGTO_COD, :NEW_COMPRA_PRAZO, :NEW_PRAZO_01, '
      '  :NEW_PRAZO_02, :NEW_PRAZO_03, :NEW_PRAZO_04, :NEW_PRAZO_05, '
      '  :NEW_PRAZO_06, :NEW_PRAZO_07, :NEW_PRAZO_08, :NEW_PRAZO_09, '
      
        '  :NEW_PRAZO_10, :NEW_PRAZO_11, :NEW_PRAZO_12, :NEW_DTFINALIZACA' +
        'O_COMPRA, '
      '  :NEW_CANCEL_USUARIO, :NEW_CANCEL_DATAHORA, :NEW_CANCEL_MOTIVO)')
    ModifySQL.Strings = (
      'UPDATE TBCOMPRAS'
      
        'SET ANO = :NEW_ANO, CODCONTROL = :NEW_CODCONTROL, CODEMP = :NEW_' +
        'CODEMP, '
      '  CODFORN = :NEW_CODFORN, NF = :NEW_NF, NFSERIE = :NEW_NFSERIE, '
      '  DTLANCAMENTO = :NEW_DTLANCAMENTO, DTEMISS = :NEW_DTEMISS, '
      
        '  DTENT = :NEW_DTENT, NFCFOP = :NEW_NFCFOP, NATUREZA = :NEW_NATU' +
        'REZA, '
      
        '  STATUS = :NEW_STATUS, IPI = :NEW_IPI, ICMSBASE = :NEW_ICMSBASE' +
        ', '
      
        '  ICMSVALOR = :NEW_ICMSVALOR, ICMSSUBSTBASE = :NEW_ICMSSUBSTBASE' +
        ', '
      '  ICMSSUBSTVALOR = :NEW_ICMSSUBSTVALOR, FRETE = :NEW_FRETE, '
      '  OUTROSCUSTOS = :NEW_OUTROSCUSTOS, DESCONTO = :NEW_DESCONTO, '
      
        '  TOTALPROD = :NEW_TOTALPROD, TOTALNF = :NEW_TOTALNF, OBS = :NEW' +
        '_OBS, '
      '  USUARIO = :NEW_USUARIO, FORMAPAGTO_COD = :NEW_FORMAPAGTO_COD, '
      
        '  CONDICAOPAGTO_COD = :NEW_CONDICAOPAGTO_COD, COMPRA_PRAZO = :NE' +
        'W_COMPRA_PRAZO, '
      
        '  PRAZO_01 = :NEW_PRAZO_01, PRAZO_02 = :NEW_PRAZO_02, PRAZO_03 =' +
        ' :NEW_PRAZO_03, '
      
        '  PRAZO_04 = :NEW_PRAZO_04, PRAZO_05 = :NEW_PRAZO_05, PRAZO_06 =' +
        ' :NEW_PRAZO_06, '
      
        '  PRAZO_07 = :NEW_PRAZO_07, PRAZO_08 = :NEW_PRAZO_08, PRAZO_09 =' +
        ' :NEW_PRAZO_09, '
      
        '  PRAZO_10 = :NEW_PRAZO_10, PRAZO_11 = :NEW_PRAZO_11, PRAZO_12 =' +
        ' :NEW_PRAZO_12, '
      
        '  DTFINALIZACAO_COMPRA = :NEW_DTFINALIZACAO_COMPRA, CANCEL_USUAR' +
        'IO = :NEW_CANCEL_USUARIO, '
      
        '  CANCEL_DATAHORA = :NEW_CANCEL_DATAHORA, CANCEL_MOTIVO = :NEW_C' +
        'ANCEL_MOTIVO'
      
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
    Left = 176
    Top = 264
  end
end
