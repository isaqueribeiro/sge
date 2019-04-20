inherited frmGeVendaConfirmaTitulos: TfrmGeVendaConfirmaTitulos
  Left = 535
  Top = 258
  ActiveControl = dbCodigo
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Edi'#231#227'o / Confirma'#231#227'o de T'#237'tulos'
  ClientHeight = 403
  ClientWidth = 534
  OldCreateOrder = True
  ExplicitWidth = 548
  ExplicitHeight = 440
  DesignSize = (
    534
    403)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 365
    Width = 534
    Height = 38
    Align = alBottom
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 0
    Top = 109
    Width = 534
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 73
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 534
    Height = 109
    Align = alTop
    Caption = ' Dados do T'#237'tulo Selecionadao'
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
      Width = 73
      Height = 13
      Caption = 'Lan'#231'amento:'
      FocusControl = dbCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataVencimento: TLabel
      Left = 263
      Top = 66
      Width = 85
      Height = 13
      Caption = 'Data Vencimento:'
      FocusControl = dbDataVencimento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblParcela: TLabel
      Left = 112
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Parc.:'
      FocusControl = dbParcela
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 367
      Top = 66
      Width = 90
      Height = 13
      Caption = 'Valor Parcela (R$):'
      FocusControl = dbValor
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblEmissao: TLabel
      Left = 160
      Top = 24
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
    object lblFormaPagto: TLabel
      Left = 263
      Top = 24
      Width = 124
      Height = 13
      Caption = '&Forma de Pagamento:'
      FocusControl = dbFormaPagto
    end
    object dbCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'Lancamento'
      DataSource = dtsTitulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbDataVencimento: TDBEdit
      Left = 263
      Top = 82
      Width = 97
      Height = 21
      Color = clWhite
      DataField = 'DTVENC'
      DataSource = dtsTitulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = ControlEditEnter
    end
    object dbParcela: TDBEdit
      Left = 112
      Top = 40
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PARCELA'
      DataSource = dtsTitulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbValor: TDBEdit
      Left = 367
      Top = 82
      Width = 105
      Height = 21
      Color = clWhite
      DataField = 'VALORREC'
      DataSource = dtsTitulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbEmissao: TDBEdit
      Left = 160
      Top = 40
      Width = 97
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'DTEMISS'
      DataSource = dtsTitulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbFormaPagto: TDBLookupComboBox
      Left = 263
      Top = 40
      Width = 258
      Height = 21
      DataField = 'FORMA_PAGTO'
      DataSource = dtsTitulos
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
      TabOrder = 3
      OnEnter = ControlEditEnter
    end
  end
  object dbgTitulos: TDBGrid
    Left = 0
    Top = 113
    Width = 534
    Height = 252
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
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgTitulosDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Lancamento'
        Title.Caption = 'Lan'#231'amento '
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARCELA'
        Title.Alignment = taCenter
        Title.Caption = 'Parc. '
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEMISS'
        Title.Alignment = taCenter
        Title.Caption = 'Emiss'#227'o '
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTVENC'
        Title.Alignment = taCenter
        Title.Caption = 'Vencimento '
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DiaSemana'
        Title.Alignment = taCenter
        Title.Caption = 'DS '
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORREC'
        Title.Caption = 'Valor A Rec. (R$) '
        Width = 110
        Visible = True
      end>
  end
  object dbTotalEntrada: TDBEdit
    Left = 0
    Top = 370
    Width = 113
    Height = 31
    TabStop = False
    Anchors = [akLeft, akBottom]
    Color = clMoneyGreen
    Ctl3D = True
    DataField = 'TotalEntrada'
    DataSource = dtsTitulos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object dbTotalParcelas: TDBEdit
    Left = 120
    Top = 370
    Width = 113
    Height = 31
    TabStop = False
    Anchors = [akLeft, akBottom]
    Color = clMoneyGreen
    DataField = 'TotalParcelas'
    DataSource = dtsTitulos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object pnlTotais: TPanel
    Left = 0
    Top = 366
    Width = 345
    Height = 37
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object Label1: TLabel
      Left = 5
      Top = 4
      Width = 105
      Height = 10
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Total A Prazo Venda (R$)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalVenda: TLabel
      Left = 5
      Top = 16
      Width = 105
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = '1.999.999,99'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 117
      Top = 4
      Width = 105
      Height = 10
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Total Parcelas (R$)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalParcelas: TLabel
      Left = 117
      Top = 16
      Width = 105
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = '1.999.999,99'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 229
      Top = 4
      Width = 105
      Height = 10
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Diferen'#231'a (R$)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalDiferenca: TLabel
      Left = 229
      Top = 16
      Width = 105
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = '1.999.999,99'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btnConfirmar: TcxButton
    Left = 346
    Top = 368
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Confirmar'
    OptionsImage.Glyph.Data = {
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
    OptionsImage.NumGlyphs = 2
    TabOrder = 4
    OnClick = btnConfirmarClick
  end
  object btFechar: TcxButton
    Left = 442
    Top = 368
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
    TabOrder = 5
    OnClick = btFecharClick
  end
  object dtsTitulos: TDataSource
    AutoEdit = False
    DataSet = cdsTitulos
    OnDataChange = dtsTitulosDataChange
    OnUpdateData = dtsTitulosUpdateData
    Left = 40
    Top = 264
  end
  object dspTitulos: TDataSetProvider
    DataSet = qryTitulos
    UpdateMode = upWhereChanged
    Left = 40
    Top = 200
  end
  object cdsTitulos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspTitulos'
    BeforePost = cdsTitulosBeforePost
    AfterScroll = cdsTitulosAfterScroll
    OnCalcFields = cdsTitulosCalcFields
    Left = 40
    Top = 232
    object cdsTitulosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'ANOLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTitulosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'NUMLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTitulosPARCELA: TSmallintField
      Alignment = taCenter
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      DisplayFormat = '00'
    end
    object cdsTitulosCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
    object cdsTitulosTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Origin = 'TIPPAG'
      Size = 35
    end
    object cdsTitulosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object cdsTitulosDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsTitulosDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = 'DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsTitulosVALORREC: TBCDField
      FieldName = 'VALORREC'
      Origin = 'VALORREC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTitulosVALORRECTOT: TBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'VALORRECTOT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTitulosVALORSALDO: TBCDField
      FieldName = 'VALORSALDO'
      Origin = 'VALORSALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsTitulosBAIXADO: TSmallintField
      FieldName = 'BAIXADO'
      Origin = 'BAIXADO'
      Required = True
    end
    object cdsTitulosLancamento: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'Lancamento'
    end
    object cdsTitulosDiaSemana: TSmallintField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'DiaSemana'
      ProviderFlags = []
      OnGetText = cdsTitulosDiaSemanaGetText
    end
    object cdsTitulosTotalEntrada: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'TotalEntrada'
      ProviderFlags = []
      DisplayFormat = ',0.00'
    end
    object cdsTitulosTotalParcelas: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TotalParcelas'
      ProviderFlags = []
      Active = True
      currency = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(VALORREC)'
    end
  end
  object dtsFormaPagto: TDataSource
    DataSet = fdQryFormaPagto
    Left = 322
    Top = 216
  end
  object fdQryFormaPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select *'
      'from TBFORMPAGTO')
    Left = 288
    Top = 216
  end
  object qryTitulos: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    Anolanc'
      '  , Numlanc'
      '  , parcela'
      '  , Cnpj'
      '  , Tippag'
      '  , Forma_Pagto'
      '  , Dtemiss'
      '  , Dtvenc'
      '  , Valorrec'
      '  , ValorrecTot'
      '  , ValorSaldo'
      '  , Baixado'
      'from TBCONTREC')
    Left = 40
    Top = 168
    object qryTitulosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'ANOLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTitulosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'NUMLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTitulosPARCELA: TSmallintField
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
    end
    object qryTitulosCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
    object qryTitulosTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Origin = 'TIPPAG'
      Size = 35
    end
    object qryTitulosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object qryTitulosDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'DTEMISS'
    end
    object qryTitulosDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = 'DTVENC'
    end
    object qryTitulosVALORREC: TBCDField
      FieldName = 'VALORREC'
      Origin = 'VALORREC'
      Precision = 18
      Size = 2
    end
    object qryTitulosVALORRECTOT: TBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'VALORRECTOT'
      Precision = 18
      Size = 2
    end
    object qryTitulosVALORSALDO: TBCDField
      FieldName = 'VALORSALDO'
      Origin = 'VALORSALDO'
      Precision = 18
      Size = 2
    end
    object qryTitulosBAIXADO: TSmallintField
      FieldName = 'BAIXADO'
      Origin = 'BAIXADO'
      Required = True
    end
  end
  object qryContaAReceber: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updContaAReceber
    SQL.Strings = (
      'Select'
      '    Anolanc'
      '  , Numlanc'
      '  , parcela'
      '  , Cnpj'
      '  , Tippag'
      '  , Forma_Pagto'
      '  , Dtemiss'
      '  , Dtvenc'
      '  , Valorrec'
      '  , ValorrecTot'
      '  , ValorSaldo'
      '  , Baixado'
      'from TBCONTREC'
      'where Anolanc = :Anolanc'
      '  and Numlanc = :Numlanc')
    Left = 128
    Top = 167
    ParamData = <
      item
        Name = 'ANOLANC'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUMLANC'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object updContaAReceber: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCONTREC'
      '(ANOLANC, NUMLANC, CNPJ, FORMA_PAGTO, TIPPAG, '
      '  DTEMISS, DTVENC, VALORREC, VALORRECTOT, '
      '  VALORSALDO, PARCELA, BAIXADO)'
      
        'VALUES (:NEW_ANOLANC, :NEW_NUMLANC, :NEW_CNPJ, :NEW_FORMA_PAGTO,' +
        ' :NEW_TIPPAG, '
      '  :NEW_DTEMISS, :NEW_DTVENC, :NEW_VALORREC, :NEW_VALORRECTOT, '
      '  :NEW_VALORSALDO, :NEW_PARCELA, :NEW_BAIXADO)')
    ModifySQL.Strings = (
      'UPDATE TBCONTREC'
      
        'SET ANOLANC = :NEW_ANOLANC, NUMLANC = :NEW_NUMLANC, CNPJ = :NEW_' +
        'CNPJ, '
      
        '  FORMA_PAGTO = :NEW_FORMA_PAGTO, TIPPAG = :NEW_TIPPAG, DTEMISS ' +
        '= :NEW_DTEMISS, '
      
        '  DTVENC = :NEW_DTVENC, VALORREC = :NEW_VALORREC, VALORRECTOT = ' +
        ':NEW_VALORRECTOT, '
      
        '  VALORSALDO = :NEW_VALORSALDO, PARCELA = :NEW_PARCELA, BAIXADO ' +
        '= :NEW_BAIXADO'
      'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC')
    DeleteSQL.Strings = (
      'DELETE FROM TBCONTREC'
      'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC')
    FetchRowSQL.Strings = (
      
        'SELECT ANOLANC, NUMLANC, EMPRESA, CLIENTE, CNPJ, FORMA_PAGTO, TI' +
        'PPAG, '
      '  HISTORIC, NUMREC, DTEMISS, DTVENC, DTREC, DOCBAIX, VALORREC, '
      '  VALORMULTA, VALORRECTOT, VALORSALDO, NUMCONTRATO, PARCELA, '
      
        '  STATUS, CODBANCO, BANCO_FEBRABAN, NOSSONUMERO, ESPECIE_BOLETO,' +
        ' '
      
        '  REMESSA, PERCENTJUROS, PERCENTMULTA, PERCENTDESCONTO, DATAPROC' +
        'ESSOBOLETO, '
      '  BAIXADO, ENVIADO, ANOVENDA, NUMVENDA, ANOOS, NUMOS, CODTPREC, '
      '  SITUACAO, LOTE, COMPETENCIA_APURACAO'
      'FROM TBCONTREC'
      'WHERE ANOLANC = :ANOLANC AND NUMLANC = :NUMLANC')
    Left = 160
    Top = 167
  end
end
