inherited frmGeEntradaEstoqueCancelar: TfrmGeEntradaEstoqueCancelar
  Left = 400
  Top = 166
  Width = 617
  Height = 474
  ActiveControl = dbMotivo
  BorderIcons = [biSystemMenu]
  BorderWidth = 4
  Caption = 'Cancelar Entrada no Estoque'
  OldCreateOrder = True
  DesignSize = (
    593
    428)
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
      Left = 272
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
      Width = 81
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
      Left = 272
      Top = 80
      Width = 97
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
  object btnCancelar: TBitBtn
    Left = 405
    Top = 395
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    TabOrder = 2
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
  object btFechar: TBitBtn
    Left = 501
    Top = 395
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    TabOrder = 3
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
  object cdsEntrada: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
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
    ModifySQL.Strings = (
      '')
    GeneratorField.Field = 'CODCONTROL'
    UpdateObject = updEntrada
    Left = 480
    Top = 96
    object cdsEntradaANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBCOMPRAS.ANO'
      Required = True
    end
    object cdsEntradaCODCONTROL: TIntegerField
      Alignment = taCenter
      FieldName = 'CODCONTROL'
      Origin = 'TBCOMPRAS.CODCONTROL'
      Required = True
      DisplayFormat = '###0000000'
    end
    object cdsEntradaCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = 'TBCOMPRAS.CODEMP'
      Required = True
      Size = 18
    end
    object cdsEntradaCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = 'TBCOMPRAS.CODFORN'
    end
    object cdsEntradaNF: TIntegerField
      FieldName = 'NF'
      Origin = 'TBCOMPRAS.NF'
      Required = True
    end
    object cdsEntradaNFSERIE: TIBStringField
      FieldName = 'NFSERIE'
      Origin = 'TBCOMPRAS.NFSERIE'
      Size = 4
    end
    object cdsEntradaDTLANCAMENTO: TDateTimeField
      FieldName = 'DTLANCAMENTO'
      Origin = 'TBCOMPRAS.DTLANCAMENTO'
    end
    object cdsEntradaDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'TBCOMPRAS.DTEMISS'
    end
    object cdsEntradaDTENT: TDateField
      FieldName = 'DTENT'
      Origin = 'TBCOMPRAS.DTENT'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEntradaDTFINALIZACAO_COMPRA: TDateTimeField
      FieldName = 'DTFINALIZACAO_COMPRA'
      Origin = 'TBCOMPRAS.DTFINALIZACAO_COMPRA'
    end
    object cdsEntradaNFCFOP: TIntegerField
      FieldName = 'NFCFOP'
      Origin = 'TBCOMPRAS.NFCFOP'
    end
    object cdsEntradaNATUREZA: TIBStringField
      FieldName = 'NATUREZA'
      Origin = 'TBCOMPRAS.NATUREZA'
      Size = 4
    end
    object cdsEntradaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'TBCOMPRAS.STATUS'
      Required = True
    end
    object cdsEntradaIPI: TIBBCDField
      FieldName = 'IPI'
      Origin = 'TBCOMPRAS.IPI'
      Precision = 18
      Size = 2
    end
    object cdsEntradaICMSBASE: TIBBCDField
      FieldName = 'ICMSBASE'
      Origin = 'TBCOMPRAS.ICMSBASE'
      Precision = 18
      Size = 2
    end
    object cdsEntradaICMSVALOR: TIBBCDField
      FieldName = 'ICMSVALOR'
      Origin = 'TBCOMPRAS.ICMSVALOR'
      Precision = 18
      Size = 2
    end
    object cdsEntradaICMSSUBSTBASE: TIBBCDField
      FieldName = 'ICMSSUBSTBASE'
      Origin = 'TBCOMPRAS.ICMSSUBSTBASE'
      Precision = 18
      Size = 2
    end
    object cdsEntradaICMSSUBSTVALOR: TIBBCDField
      FieldName = 'ICMSSUBSTVALOR'
      Origin = 'TBCOMPRAS.ICMSSUBSTVALOR'
      Precision = 18
      Size = 2
    end
    object cdsEntradaFRETE: TIBBCDField
      FieldName = 'FRETE'
      Origin = 'TBCOMPRAS.FRETE'
      Precision = 18
      Size = 2
    end
    object cdsEntradaOUTROSCUSTOS: TIBBCDField
      FieldName = 'OUTROSCUSTOS'
      Origin = 'TBCOMPRAS.OUTROSCUSTOS'
      Precision = 18
      Size = 2
    end
    object cdsEntradaDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'TBCOMPRAS.DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsEntradaTOTALNF: TIBBCDField
      FieldName = 'TOTALNF'
      Origin = 'TBCOMPRAS.TOTALNF'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsEntradaTOTALPROD: TIBBCDField
      FieldName = 'TOTALPROD'
      Origin = 'TBCOMPRAS.TOTALPROD'
      Precision = 18
      Size = 2
    end
    object cdsEntradaOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'TBCOMPRAS.OBS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEntradaUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = 'TBCOMPRAS.USUARIO'
      Size = 50
    end
    object cdsEntradaFORMAPAGTO_COD: TSmallintField
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'TBCOMPRAS.FORMAPAGTO_COD'
    end
    object cdsEntradaCONDICAOPAGTO_COD: TSmallintField
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'TBCOMPRAS.CONDICAOPAGTO_COD'
    end
    object cdsEntradaCOMPRA_PRAZO: TSmallintField
      FieldName = 'COMPRA_PRAZO'
      Origin = 'TBCOMPRAS.COMPRA_PRAZO'
      Required = True
    end
    object cdsEntradaPRAZO_01: TSmallintField
      FieldName = 'PRAZO_01'
      Origin = 'TBCOMPRAS.PRAZO_01'
    end
    object cdsEntradaPRAZO_02: TSmallintField
      FieldName = 'PRAZO_02'
      Origin = 'TBCOMPRAS.PRAZO_02'
    end
    object cdsEntradaPRAZO_03: TSmallintField
      FieldName = 'PRAZO_03'
      Origin = 'TBCOMPRAS.PRAZO_03'
    end
    object cdsEntradaPRAZO_04: TSmallintField
      FieldName = 'PRAZO_04'
      Origin = 'TBCOMPRAS.PRAZO_04'
    end
    object cdsEntradaPRAZO_05: TSmallintField
      FieldName = 'PRAZO_05'
      Origin = 'TBCOMPRAS.PRAZO_05'
    end
    object cdsEntradaPRAZO_06: TSmallintField
      FieldName = 'PRAZO_06'
      Origin = 'TBCOMPRAS.PRAZO_06'
    end
    object cdsEntradaPRAZO_07: TSmallintField
      FieldName = 'PRAZO_07'
      Origin = 'TBCOMPRAS.PRAZO_07'
    end
    object cdsEntradaPRAZO_08: TSmallintField
      FieldName = 'PRAZO_08'
      Origin = 'TBCOMPRAS.PRAZO_08'
    end
    object cdsEntradaPRAZO_09: TSmallintField
      FieldName = 'PRAZO_09'
      Origin = 'TBCOMPRAS.PRAZO_09'
    end
    object cdsEntradaPRAZO_10: TSmallintField
      FieldName = 'PRAZO_10'
      Origin = 'TBCOMPRAS.PRAZO_10'
    end
    object cdsEntradaPRAZO_11: TSmallintField
      FieldName = 'PRAZO_11'
      Origin = 'TBCOMPRAS.PRAZO_11'
    end
    object cdsEntradaPRAZO_12: TSmallintField
      FieldName = 'PRAZO_12'
      Origin = 'TBCOMPRAS.PRAZO_12'
    end
    object cdsEntradaCANCEL_USUARIO: TIBStringField
      FieldName = 'CANCEL_USUARIO'
      Origin = 'TBCOMPRAS.CANCEL_USUARIO'
      Size = 50
    end
    object cdsEntradaCANCEL_DATAHORA: TDateTimeField
      FieldName = 'CANCEL_DATAHORA'
      Origin = 'TBCOMPRAS.CANCEL_DATAHORA'
    end
    object cdsEntradaCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = 'TBCOMPRAS.CANCEL_MOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEntradaNOMEFORN: TIBStringField
      FieldName = 'NOMEFORN'
      Origin = 'TBFORNECEDOR.NOMEFORN'
      Size = 60
    end
    object cdsEntradaCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBFORNECEDOR.CNPJ'
      Size = 18
    end
  end
  object updEntrada: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODFORN,'
      '  NF,'
      '  NFSERIE,'
      '  DTLANCAMENTO,'
      '  DTEMISS,'
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
      '  TOTALNF,'
      '  TOTALPROD,'
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
      '  CANCEL_USUARIO,'
      '  CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO'
      'from TBCOMPRAS '
      'where'
      '  ANO = :ANO and'
      '  CODCONTROL = :CODCONTROL')
    ModifySQL.Strings = (
      'update TBCOMPRAS'
      'set'
      '  STATUS = :STATUS,'
      '  CANCEL_USUARIO = :CANCEL_USUARIO,'
      '  CANCEL_DATAHORA = :CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO = :CANCEL_MOTIVO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    DeleteSQL.Strings = (
      '')
    Left = 512
    Top = 96
  end
  object dtsEntrada: TDataSource
    AutoEdit = False
    DataSet = cdsEntrada
    Left = 544
    Top = 96
  end
end
