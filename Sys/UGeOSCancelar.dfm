inherited frmGeOSCancelar: TfrmGeOSCancelar
  Left = 387
  Top = 193
  ActiveControl = dbMotivo
  BorderIcons = [biSystemMenu]
  BorderWidth = 4
  Caption = 'Cancelar Ordem de Servi'#231'o'
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
    Caption = 'Controle da Ordem de Servi'#231'o'
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
      Width = 38
      Height = 13
      Caption = 'No. OS:'
      FocusControl = dbCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCliente: TLabel
      Left = 112
      Top = 24
      Width = 42
      Height = 13
      Caption = 'Cliente:'
      FocusControl = dbCliente
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNFSe: TLabel
      Left = 16
      Top = 64
      Width = 35
      Height = 13
      Caption = 'NFS-e:'
      FocusControl = dbNFSe
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataEmissao: TLabel
      Left = 144
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
    object lblHoraEmissao: TLabel
      Left = 232
      Top = 64
      Width = 79
      Height = 13
      Caption = 'Hora Emiss'#227'o:'
      FocusControl = dbHoraEmissao
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
      DataField = 'NUMERO'
      DataSource = dtsOS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbCliente: TDBEdit
      Left = 112
      Top = 40
      Width = 465
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'TOMADOR_RAZAO'
      DataSource = dtsOS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbNFSe: TDBEdit
      Left = 16
      Top = 80
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NFS'
      DataSource = dtsOS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbDataEmissao: TDBEdit
      Left = 144
      Top = 80
      Width = 81
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NFS_DATAEMISSAO'
      DataSource = dtsOS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbHoraEmissao: TDBEdit
      Left = 232
      Top = 80
      Width = 81
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NFS_HORAEMISSAO'
      DataSource = dtsOS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
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
      OnKeyPress = dbMotivoKeyPress
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
    OptionsImage.Glyph.Data = {
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
    OptionsImage.NumGlyphs = 2
    TabOrder = 3
    OnClick = btFecharClick
  end
  object cdsOS: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    o.*'
      '  , o.ano || '#39'/'#39' || right('#39'0000000'#39' || o.controle, 7) as numero'
      
        '  , right('#39'0000000'#39' || o.nfs_numero, 7) || '#39'-'#39' || o.nfs_serie as' +
        ' nfs'
      '  , st.descricao as status_descricao'
      ''
      '  , cl.pessoa_fisica as tomador_pf'
      '  , cl.cnpj     as tomador_cnpj'
      '  , cl.nome     as tomador_razao'
      
        '  , coalesce(nullif(trim(cl.nomefant), '#39#39'), cl.nome) as tomador_' +
        'fantasia'
      'from TBOS o'
      '  left join VW_STATUS_OS st on (st.codigo = o.status)'
      '  left join TBCLIENTE cl on (cl.codigo = o.cliente)'
      ''
      'where o.ano      = :ano'
      '  and o.controle = :num'
      '')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'CODCONTROL'
    UpdateObject = updOS
    Left = 480
    Top = 96
    object cdsOSANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBOS"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBOS"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOSEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBOS"."EMPRESA"'
      Required = True
      Size = 18
    end
    object cdsOSCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = '"TBOS"."CLIENTE"'
      Required = True
    end
    object cdsOSDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = '"TBOS"."DATA_CADASTRO"'
    end
    object cdsOSDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = '"TBOS"."DATA_EMISSAO"'
      Required = True
    end
    object cdsOSDATA_PREVISAO_CONCLUSAO: TDateField
      FieldName = 'DATA_PREVISAO_CONCLUSAO'
      Origin = '"TBOS"."DATA_PREVISAO_CONCLUSAO"'
    end
    object cdsOSUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBOS"."USUARIO"'
      Size = 12
    end
    object cdsOSVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      Origin = '"TBOS"."VENDEDOR"'
    end
    object cdsOSSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = '"TBOS"."STATUS"'
    end
    object cdsOSOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = '"TBOS"."OBSERVACOES"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOSRELATO_SOLICITACAO: TMemoField
      FieldName = 'RELATO_SOLICITACAO'
      Origin = '"TBOS"."RELATO_SOLICITACAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOSDADOS_ENTREGA: TMemoField
      FieldName = 'DADOS_ENTREGA'
      Origin = '"TBOS"."DADOS_ENTREGA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOSTOTAL_SERVICO: TIBBCDField
      FieldName = 'TOTAL_SERVICO'
      Origin = '"TBOS"."TOTAL_SERVICO"'
      Precision = 18
      Size = 2
    end
    object cdsOSTOTAL_PRODUTO: TIBBCDField
      FieldName = 'TOTAL_PRODUTO'
      Origin = '"TBOS"."TOTAL_PRODUTO"'
      Precision = 18
      Size = 2
    end
    object cdsOSTOTAL_DESCONTOS_SERVICOS: TIBBCDField
      FieldName = 'TOTAL_DESCONTOS_SERVICOS'
      Origin = '"TBOS"."TOTAL_DESCONTOS_SERVICOS"'
      Precision = 18
      Size = 3
    end
    object cdsOSTOTAL_DESCONTOS_PRODUTOS: TIBBCDField
      FieldName = 'TOTAL_DESCONTOS_PRODUTOS'
      Origin = '"TBOS"."TOTAL_DESCONTOS_PRODUTOS"'
      Precision = 18
      Size = 3
    end
    object cdsOSTOTAL_DESCONTOS: TIBBCDField
      FieldName = 'TOTAL_DESCONTOS'
      Origin = '"TBOS"."TOTAL_DESCONTOS"'
      Precision = 18
      Size = 3
    end
    object cdsOSTOTAL_OS: TIBBCDField
      FieldName = 'TOTAL_OS'
      Origin = '"TBOS"."TOTAL_OS"'
      Precision = 18
      Size = 2
    end
    object cdsOSTOTAL_BRUTO: TIBBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = '"TBOS"."TOTAL_BRUTO"'
      Precision = 18
      Size = 2
    end
    object cdsOSTOTAL_LIQUIDO: TIBBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Origin = '"TBOS"."TOTAL_LIQUIDO"'
      Precision = 18
      Size = 2
    end
    object cdsOSTOTAL_APROVADO_SERVICO: TIBBCDField
      FieldName = 'TOTAL_APROVADO_SERVICO'
      Origin = '"TBOS"."TOTAL_APROVADO_SERVICO"'
      Precision = 18
      Size = 2
    end
    object cdsOSTOTAL_APROVADO_PRODUTO: TIBBCDField
      FieldName = 'TOTAL_APROVADO_PRODUTO'
      Origin = '"TBOS"."TOTAL_APROVADO_PRODUTO"'
      Precision = 18
      Size = 2
    end
    object cdsOSDATA_APROVACAO: TDateField
      FieldName = 'DATA_APROVACAO'
      Origin = '"TBOS"."DATA_APROVACAO"'
    end
    object cdsOSDATA_FINALIZACAO: TDateField
      FieldName = 'DATA_FINALIZACAO'
      Origin = '"TBOS"."DATA_FINALIZACAO"'
    end
    object cdsOSDATA_FATURA: TDateField
      FieldName = 'DATA_FATURA'
      Origin = '"TBOS"."DATA_FATURA"'
    end
    object cdsOSCOMPETENCIA: TIntegerField
      FieldName = 'COMPETENCIA'
      Origin = '"TBOS"."COMPETENCIA"'
    end
    object cdsOSNFS_LOTE: TIBStringField
      FieldName = 'NFS_LOTE'
      Origin = '"TBOS"."NFS_LOTE"'
      Size = 15
    end
    object cdsOSNFS_SERIE: TIBStringField
      FieldName = 'NFS_SERIE'
      Origin = '"TBOS"."NFS_SERIE"'
      Size = 4
    end
    object cdsOSNFS_NUMERO: TIntegerField
      FieldName = 'NFS_NUMERO'
      Origin = '"TBOS"."NFS_NUMERO"'
    end
    object cdsOSNFS_DATAEMISSAO: TDateField
      FieldName = 'NFS_DATAEMISSAO'
      Origin = '"TBOS"."NFS_DATAEMISSAO"'
    end
    object cdsOSNFS_HORAEMISSAO: TTimeField
      FieldName = 'NFS_HORAEMISSAO'
      Origin = '"TBOS"."NFS_HORAEMISSAO"'
    end
    object cdsOSNFS_CNAE: TIBStringField
      FieldName = 'NFS_CNAE'
      Origin = '"TBOS"."NFS_CNAE"'
      Size = 10
    end
    object cdsOSNFS_NCM: TIBStringField
      FieldName = 'NFS_NCM'
      Origin = '"TBOS"."NFS_NCM"'
      Size = 10
    end
    object cdsOSNFS_DESCRICAO_SERVICO: TMemoField
      FieldName = 'NFS_DESCRICAO_SERVICO'
      Origin = '"TBOS"."NFS_DESCRICAO_SERVICO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOSNFS_ENVIADA: TSmallintField
      FieldName = 'NFS_ENVIADA'
      Origin = '"TBOS"."NFS_ENVIADA"'
    end
    object cdsOSCAIXA_ANO: TSmallintField
      FieldName = 'CAIXA_ANO'
      Origin = '"TBOS"."CAIXA_ANO"'
    end
    object cdsOSCAIXA_NUM: TIntegerField
      FieldName = 'CAIXA_NUM'
      Origin = '"TBOS"."CAIXA_NUM"'
    end
    object cdsOSNUMERO: TIBStringField
      FieldName = 'NUMERO'
      ProviderFlags = []
      Size = 25
    end
    object cdsOSNFS: TIBStringField
      FieldName = 'NFS'
      ProviderFlags = []
      Size = 23
    end
    object cdsOSSTATUS_DESCRICAO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STATUS_DESCRICAO'
      Origin = '"VW_STATUS_OS"."DESCRICAO"'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object cdsOSTOMADOR_PF: TSmallintField
      FieldName = 'TOMADOR_PF'
      Origin = '"TBCLIENTE"."PESSOA_FISICA"'
    end
    object cdsOSTOMADOR_CNPJ: TIBStringField
      FieldName = 'TOMADOR_CNPJ'
      Origin = '"TBCLIENTE"."CNPJ"'
      Size = 18
    end
    object cdsOSTOMADOR_RAZAO: TIBStringField
      FieldName = 'TOMADOR_RAZAO'
      Origin = '"TBCLIENTE"."NOME"'
      Size = 100
    end
    object cdsOSTOMADOR_FANTASIA: TIBStringField
      FieldName = 'TOMADOR_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object cdsOSCANCEL_DATAHORA: TDateTimeField
      FieldName = 'CANCEL_DATAHORA'
      Origin = '"TBOS"."CANCEL_DATAHORA"'
    end
    object cdsOSCANCEL_USUARIO: TIBStringField
      FieldName = 'CANCEL_USUARIO'
      Origin = '"TBOS"."CANCEL_USUARIO"'
      Size = 12
    end
    object cdsOSCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = '"TBOS"."CANCEL_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object updOS: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  EMPRESA,'
      '  CLIENTE,'
      '  DATA_CADASTRO,'
      '  DATA_EMISSAO,'
      '  DATA_PREVISAO_CONCLUSAO,'
      '  USUARIO,'
      '  VENDEDOR,'
      '  STATUS,'
      '  OBSERVACOES,'
      '  RELATO_SOLICITACAO,'
      '  DADOS_ENTREGA,'
      '  TOTAL_SERVICO,'
      '  TOTAL_PRODUTO,'
      '  TOTAL_DESCONTOS_SERVICOS,'
      '  TOTAL_DESCONTOS_PRODUTOS,'
      '  TOTAL_DESCONTOS,'
      '  TOTAL_OS,'
      '  TOTAL_BRUTO,'
      '  TOTAL_LIQUIDO,'
      '  TOTAL_APROVADO_SERVICO,'
      '  TOTAL_APROVADO_PRODUTO,'
      '  DATA_APROVACAO,'
      '  DATA_FINALIZACAO,'
      '  DATA_FATURA,'
      '  COMPETENCIA,'
      '  NFS_LOTE,'
      '  NFS_SERIE,'
      '  NFS_NUMERO,'
      '  NFS_DATAEMISSAO,'
      '  NFS_HORAEMISSAO,'
      '  NFS_CNAE,'
      '  NFS_NCM,'
      '  NFS_DESCRICAO_SERVICO,'
      '  NFS_ENVIADA,'
      '  CAIXA_ANO,'
      '  CAIXA_NUM,'
      '  CANCEL_DATAHORA,'
      '  CANCEL_USUARIO,'
      '  CANCEL_MOTIVO'
      'from TBOS '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE')
    ModifySQL.Strings = (
      'update TBOS'
      'set'
      '  CANCEL_DATAHORA = :CANCEL_DATAHORA,'
      '  CANCEL_MOTIVO = :CANCEL_MOTIVO,'
      '  CANCEL_USUARIO = :CANCEL_USUARIO,'
      '  STATUS = :STATUS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE')
    InsertSQL.Strings = (
      '')
    Left = 512
    Top = 96
  end
  object dtsOS: TDataSource
    AutoEdit = False
    DataSet = cdsOS
    Left = 544
    Top = 96
  end
end
