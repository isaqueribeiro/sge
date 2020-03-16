inherited frmGeAutorizacaoCompraCancelar: TfrmGeAutorizacaoCompraCancelar
  Left = 385
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderWidth = 4
  Caption = 'Cancelar Autoriza'#231#227'o de Compra/Servi'#231'o'
  ClientHeight = 410
  ClientWidth = 589
  ExplicitWidth = 613
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 121
    Width = 589
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 593
  end
  object Bevel2: TBevel
    Left = 0
    Top = 373
    Width = 589
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitLeft = -13
    ExplicitTop = 390
    ExplicitWidth = 590
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 589
    Height = 121
    Align = alTop
    Caption = 'Controle da Autoriza'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 539
    object lblCodigo: TLabel
      Left = 16
      Top = 24
      Width = 91
      Height = 13
      Caption = 'No. Autoriza'#231#227'o:'
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
    object lblEmissao: TLabel
      Left = 15
      Top = 64
      Width = 49
      Height = 13
      Caption = 'Emiss'#227'o:'
      FocusControl = dbEmissao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValidade: TLabel
      Left = 112
      Top = 64
      Width = 51
      Height = 13
      Caption = 'Validade:'
      FocusControl = dbValidade
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
      DataSource = dtsAutorizacao
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
      DataSource = dtsAutorizacao
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbEmissao: TDBEdit
      Left = 16
      Top = 80
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'EMISSAO_DATA'
      DataSource = dtsAutorizacao
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbValidade: TDBEdit
      Left = 112
      Top = 80
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'VALIDADE'
      DataSource = dtsAutorizacao
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object GrpBxTexto: TGroupBox
    Left = 0
    Top = 125
    Width = 589
    Height = 248
    Align = alClient
    Caption = 'Dados do Cancelamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 590
    ExplicitHeight = 238
    DesignSize = (
      589
      248)
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
      Top = 83
      Width = 560
      Height = 151
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
      ExplicitHeight = 142
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
  object pnlBotoes: TPanel
    Left = 0
    Top = 377
    Width = 589
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object lblInforme: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 395
      Height = 27
      Align = alClient
      AutoSize = False
      Caption = 'Andamento do processo . . . . '
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ExplicitTop = 368
      ExplicitWidth = 583
      ExplicitHeight = 39
    end
    object Bevel3: TBevel
      Left = 493
      Top = 0
      Width = 4
      Height = 33
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 0
      ExplicitTop = 29
      ExplicitHeight = 589
    end
    object btnCancelar: TcxButton
      Left = 401
      Top = 0
      Width = 92
      Height = 33
      Align = alRight
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
      TabOrder = 0
      OnClick = btnCancelarClick
      ExplicitLeft = 303
      ExplicitTop = 6
    end
    object btFechar: TcxButton
      Left = 497
      Top = 0
      Width = 92
      Height = 33
      Align = alRight
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
      TabOrder = 1
      OnClick = btFecharClick
      ExplicitTop = 33
    end
  end
  object dtsAutorizacao: TDataSource
    AutoEdit = False
    DataSet = cdsAutorizacao
    Left = 432
    Top = 256
  end
  object cdsAutorizacao: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_REQUISICAO_2019'
    UpdateOptions.KeyFields = 'ANO;CODIGO'
    UpdateOptions.AutoIncFields = 'CODIGO'
    UpdateObject = updAutorizacao
    SQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.codigo'
      '  , a.empresa'
      '  , a.numero'
      '  , a.fornecedor'
      '  , a.nome_contato'
      '  , a.tipo'
      '  , a.insercao_data'
      '  , a.emissao_data'
      '  , a.emissao_usuario'
      '  , a.validade'
      '  , a.competencia'
      '  , a.movito'
      '  , a.observacao'
      '  , a.endereco_entrega'
      '  , a.status'
      '  , a.recebedor_nome'
      '  , a.recebedor_cpf'
      '  , a.recebedor_funcao'
      '  , a.forma_pagto'
      '  , a.condicao_pagto'
      '  , a.transportador'
      '  , a.valor_bruto'
      '  , a.valor_desconto'
      '  , a.valor_total_frete'
      '  , a.valor_total_ipi'
      '  , a.valor_total'
      '  , a.autorizado_data'
      '  , a.data_fatura'
      '  , a.autorizado_usuario'
      '  , a.cancelado_data'
      '  , a.cancelado_usuario'
      '  , a.cancelado_motivo'
      '  , f.nomeforn'
      '  , f.cnpj'
      '  , f.pessoa_fisica'
      '  , t.nomeforn as transportador_nome'
      '  , t.cnpj     as transportador_cpf_cnpj'
      'from TBAUTORIZA_COMPRA a'
      '  inner join TBFORNECEDOR f on (f.codforn = a.fornecedor)'
      '  left join TBFORNECEDOR t on (t.codforn = a.transportador)'
      'where a.ano = :ano'
      '  and a.codigo = :cod')
    Left = 369
    Top = 256
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object cdsAutorizacaoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAutorizacaoCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object cdsAutorizacaoEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
      Size = 18
    end
    object cdsAutorizacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object cdsAutorizacaoFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
    end
    object cdsAutorizacaoNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Origin = 'NOME_CONTATO'
      Size = 100
    end
    object cdsAutorizacaoTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object cdsAutorizacaoINSERCAO_DATA: TSQLTimeStampField
      FieldName = 'INSERCAO_DATA'
      Origin = 'INSERCAO_DATA'
    end
    object cdsAutorizacaoEMISSAO_DATA: TDateField
      FieldName = 'EMISSAO_DATA'
      Origin = 'EMISSAO_DATA'
      Required = True
    end
    object cdsAutorizacaoEMISSAO_USUARIO: TStringField
      FieldName = 'EMISSAO_USUARIO'
      Origin = 'EMISSAO_USUARIO'
      Size = 12
    end
    object cdsAutorizacaoVALIDADE: TDateField
      FieldName = 'VALIDADE'
      Origin = 'VALIDADE'
    end
    object cdsAutorizacaoCOMPETENCIA: TIntegerField
      FieldName = 'COMPETENCIA'
      Origin = 'COMPETENCIA'
    end
    object cdsAutorizacaoMOVITO: TMemoField
      FieldName = 'MOVITO'
      Origin = 'MOVITO'
      BlobType = ftMemo
    end
    object cdsAutorizacaoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsAutorizacaoENDERECO_ENTREGA: TMemoField
      FieldName = 'ENDERECO_ENTREGA'
      Origin = 'ENDERECO_ENTREGA'
      BlobType = ftMemo
    end
    object cdsAutorizacaoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object cdsAutorizacaoRECEBEDOR_NOME: TStringField
      FieldName = 'RECEBEDOR_NOME'
      Origin = 'RECEBEDOR_NOME'
      Size = 100
    end
    object cdsAutorizacaoRECEBEDOR_CPF: TStringField
      FieldName = 'RECEBEDOR_CPF'
      Origin = 'RECEBEDOR_CPF'
      Size = 18
    end
    object cdsAutorizacaoRECEBEDOR_FUNCAO: TStringField
      FieldName = 'RECEBEDOR_FUNCAO'
      Origin = 'RECEBEDOR_FUNCAO'
      Size = 50
    end
    object cdsAutorizacaoFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object cdsAutorizacaoCONDICAO_PAGTO: TSmallintField
      FieldName = 'CONDICAO_PAGTO'
      Origin = 'CONDICAO_PAGTO'
    end
    object cdsAutorizacaoTRANSPORTADOR: TIntegerField
      FieldName = 'TRANSPORTADOR'
      Origin = 'TRANSPORTADOR'
    end
    object cdsAutorizacaoVALOR_BRUTO: TBCDField
      FieldName = 'VALOR_BRUTO'
      Origin = 'VALOR_BRUTO'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoVALOR_TOTAL_FRETE: TBCDField
      FieldName = 'VALOR_TOTAL_FRETE'
      Origin = 'VALOR_TOTAL_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoVALOR_TOTAL_IPI: TBCDField
      FieldName = 'VALOR_TOTAL_IPI'
      Origin = 'VALOR_TOTAL_IPI'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsAutorizacaoAUTORIZADO_DATA: TDateField
      FieldName = 'AUTORIZADO_DATA'
      Origin = 'AUTORIZADO_DATA'
    end
    object cdsAutorizacaoDATA_FATURA: TDateField
      FieldName = 'DATA_FATURA'
      Origin = 'DATA_FATURA'
    end
    object cdsAutorizacaoAUTORIZADO_USUARIO: TStringField
      FieldName = 'AUTORIZADO_USUARIO'
      Origin = 'AUTORIZADO_USUARIO'
      Size = 12
    end
    object cdsAutorizacaoCANCELADO_DATA: TDateField
      FieldName = 'CANCELADO_DATA'
      Origin = 'CANCELADO_DATA'
    end
    object cdsAutorizacaoCANCELADO_USUARIO: TStringField
      FieldName = 'CANCELADO_USUARIO'
      Origin = 'CANCELADO_USUARIO'
      Size = 12
    end
    object cdsAutorizacaoCANCELADO_MOTIVO: TMemoField
      FieldName = 'CANCELADO_MOTIVO'
      Origin = 'CANCELADO_MOTIVO'
      BlobType = ftMemo
    end
    object cdsAutorizacaoNOMEFORN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEFORN'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsAutorizacaoCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object cdsAutorizacaoPESSOA_FISICA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_FISICA'
      Origin = 'PESSOA_FISICA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsAutorizacaoTRANSPORTADOR_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSPORTADOR_NOME'
      Origin = 'NOMEFORN'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsAutorizacaoTRANSPORTADOR_CPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSPORTADOR_CPF_CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
  end
  object updAutorizacao: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    ModifySQL.Strings = (
      'UPDATE TBAUTORIZA_COMPRA'
      
        'SET ANO = :NEW_ANO, CODIGO = :NEW_CODIGO, EMPRESA = :NEW_EMPRESA' +
        ', '
      
        '  NUMERO = :NEW_NUMERO, FORNECEDOR = :NEW_FORNECEDOR, NOME_CONTA' +
        'TO = :NEW_NOME_CONTATO, '
      
        '  TIPO = :NEW_TIPO, INSERCAO_DATA = :NEW_INSERCAO_DATA, EMISSAO_' +
        'DATA = :NEW_EMISSAO_DATA, '
      
        '  EMISSAO_USUARIO = :NEW_EMISSAO_USUARIO, VALIDADE = :NEW_VALIDA' +
        'DE, '
      
        '  COMPETENCIA = :NEW_COMPETENCIA, DATA_FATURA = :NEW_DATA_FATURA' +
        ', '
      
        '  MOVITO = :NEW_MOVITO, OBSERVACAO = :NEW_OBSERVACAO, ENDERECO_E' +
        'NTREGA = :NEW_ENDERECO_ENTREGA, '
      '  STATUS = :NEW_STATUS, AUTORIZADO_DATA = :NEW_AUTORIZADO_DATA, '
      
        '  AUTORIZADO_USUARIO = :NEW_AUTORIZADO_USUARIO, CANCELADO_DATA =' +
        ' :NEW_CANCELADO_DATA, '
      
        '  CANCELADO_USUARIO = :NEW_CANCELADO_USUARIO, CANCELADO_MOTIVO =' +
        ' :NEW_CANCELADO_MOTIVO, '
      
        '  RECEBEDOR_NOME = :NEW_RECEBEDOR_NOME, RECEBEDOR_CPF = :NEW_REC' +
        'EBEDOR_CPF, '
      
        '  RECEBEDOR_FUNCAO = :NEW_RECEBEDOR_FUNCAO, FORMA_PAGTO = :NEW_F' +
        'ORMA_PAGTO, '
      
        '  CONDICAO_PAGTO = :NEW_CONDICAO_PAGTO, TRANSPORTADOR = :NEW_TRA' +
        'NSPORTADOR, '
      
        '  VALOR_BRUTO = :NEW_VALOR_BRUTO, VALOR_DESCONTO = :NEW_VALOR_DE' +
        'SCONTO, '
      
        '  VALOR_TOTAL_FRETE = :NEW_VALOR_TOTAL_FRETE, VALOR_TOTAL_IPI = ' +
        ':NEW_VALOR_TOTAL_IPI, '
      '  VALOR_TOTAL = :NEW_VALOR_TOTAL'
      'WHERE ANO = :OLD_ANO AND CODIGO = :OLD_CODIGO'
      'RETURNING CODIGO')
    FetchRowSQL.Strings = (
      'Select'
      '    a.ano'
      '  , a.codigo'
      '  , a.empresa'
      '  , a.numero'
      '  , a.fornecedor'
      '  , a.nome_contato'
      '  , a.tipo'
      '  , a.insercao_data'
      '  , a.emissao_data'
      '  , a.emissao_usuario'
      '  , a.validade'
      '  , a.competencia'
      '  , a.movito'
      '  , a.observacao'
      '  , a.endereco_entrega'
      '  , a.status'
      '  , a.recebedor_nome'
      '  , a.recebedor_cpf'
      '  , a.recebedor_funcao'
      '  , a.forma_pagto'
      '  , a.condicao_pagto'
      '  , a.transportador'
      '  , a.valor_bruto'
      '  , a.valor_desconto'
      '  , a.valor_total_frete'
      '  , a.valor_total_ipi'
      '  , a.valor_total'
      '  , a.autorizado_data'
      '  , a.data_fatura'
      '  , a.autorizado_usuario'
      '  , a.cancelado_data'
      '  , a.cancelado_usuario'
      '  , a.cancelado_motivo'
      '  , f.nomeforn'
      '  , f.cnpj'
      '  , f.pessoa_fisica'
      '  , t.nomeforn as transportador_nome'
      '  , t.cnpj     as transportador_cpf_cnpj'
      'from TBAUTORIZA_COMPRA a'
      '  inner join TBFORNECEDOR f on (f.codforn = a.fornecedor)'
      '  left join TBFORNECEDOR t on (t.codforn = a.transportador)'
      'WHERE a.ANO = :ANO AND a.CODIGO = :CODIGO')
    Left = 401
    Top = 256
  end
end
