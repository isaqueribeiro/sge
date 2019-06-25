inherited frmGeEfetuarPagtoPAG: TfrmGeEfetuarPagtoPAG
  Left = 416
  Top = 220
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Contas A Pagar - Efetuar Pagamento'
  ClientHeight = 359
  ClientWidth = 551
  OldCreateOrder = True
  ExplicitWidth = 565
  ExplicitHeight = 396
  DesignSize = (
    551
    359)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 81
    Width = 551
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 313
    Width = 551
    Height = 4
    Align = alTop
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsSpacer
  end
  object lblInforme: TLabel
    Left = 16
    Top = 320
    Width = 320
    Height = 32
    Caption = 
      'Favor verificar os dados do lan'#231'amento antes de confirmar o paga' +
      'mento.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object GrpBxPagamento: TGroupBox
    Left = 0
    Top = 85
    Width = 551
    Height = 228
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Dados do Pagamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      551
      228)
    object lblDataPagto: TLabel
      Left = 16
      Top = 24
      Width = 69
      Height = 13
      Caption = 'Data Pagto.:'
      FocusControl = dbDataPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorPago: TLabel
      Left = 136
      Top = 24
      Width = 91
      Height = 13
      Caption = 'Valor Pago (R$):'
      FocusControl = dbValorPago
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFormaPagto: TLabel
      Left = 256
      Top = 24
      Width = 124
      Height = 13
      Caption = '&Forma de Pagamento:'
      FocusControl = dbFormaPagto
    end
    object lblDocBaixa: TLabel
      Left = 424
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Doc. Baixa:'
      FocusControl = dbDocBaixa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblBanco: TLabel
      Left = 255
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Banco:'
      FocusControl = dbBanco
    end
    object lblHistorico: TLabel
      Left = 16
      Top = 104
      Width = 133
      Height = 13
      Caption = 'Hist'#243'rico (Referente '#224'):'
      FocusControl = dbHistorico
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNumeroCheque: TLabel
      Left = 16
      Top = 64
      Width = 109
      Height = 13
      Caption = 'N'#250'mero do Cheque:'
      FocusControl = dbNumeroCheque
    end
    object dbValorPago: TDBEdit
      Left = 136
      Top = 40
      Width = 113
      Height = 21
      DataField = 'VALOR_BAIXA'
      DataSource = dtsPagamentos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbFormaPagto: TDBLookupComboBox
      Left = 256
      Top = 40
      Width = 161
      Height = 21
      DataField = 'FORMA_PAGTO'
      DataSource = dtsPagamentos
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
      TabOrder = 2
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbDocBaixa: TDBEdit
      Left = 424
      Top = 40
      Width = 113
      Height = 21
      DataField = 'DOCUMENTO_BAIXA'
      DataSource = dtsPagamentos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbBanco: TDBLookupComboBox
      Left = 256
      Top = 80
      Width = 281
      Height = 21
      DataField = 'BANCO_FEBRABAN'
      DataSource = dtsPagamentos
      DropDownRows = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'COD'
      ListField = 'BANCO_NOME'
      ListSource = dtsBancoFebraban
      ParentFont = False
      TabOrder = 5
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbHistorico: TDBMemo
      Left = 16
      Top = 120
      Width = 521
      Height = 89
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'HISTORICO'
      DataSource = dtsPagamentos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbDataPagto: TJvDBDateEdit
      Left = 16
      Top = 40
      Width = 113
      Height = 21
      DataField = 'DATA_PAGTO'
      DataSource = dtsPagamentos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
      ImageKind = ikCustom
      NumGlyphs = 2
      ParentFont = False
      PopupColor = clBtnFace
      ShowNullDate = False
      TabOrder = 0
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbNumeroCheque: TJvDBComboEdit
      Left = 16
      Top = 80
      Width = 233
      Height = 21
      ButtonHint = 'Pesquisar Cheques (Ctrl+P)'
      CharCase = ecUpperCase
      ClickKey = 16464
      Color = clMoneyGreen
      DataField = 'NUMERO_CHEQUE'
      DataSource = dtsPagamentos
      Enabled = False
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
      OnButtonClick = dbNumeroChequeButtonClick
    end
  end
  object GrpBxLancamento: TGroupBox
    Left = 0
    Top = 0
    Width = 551
    Height = 81
    Align = alTop
    Caption = 'Dados do lan'#231'amento (Contas A Pagar)'
    TabOrder = 0
    object lblAnoLanc: TLabel
      Left = 16
      Top = 24
      Width = 107
      Height = 13
      Caption = 'Ano / Lan'#231'amento:'
      FocusControl = edAnoLanc
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 58
      Top = 44
      Width = 12
      Height = 13
      Caption = ' / '
      FocusControl = edAnoLanc
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFornecedor: TLabel
      Left = 160
      Top = 24
      Width = 67
      Height = 13
      Caption = 'Fornecedor:'
      FocusControl = edFornecedor
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edAnoLanc: TEdit
      Left = 16
      Top = 40
      Width = 41
      Height = 21
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'daLancamento'
    end
    object edNumLanc: TEdit
      Left = 72
      Top = 40
      Width = 81
      Height = 21
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'dnLancamento'
    end
    object edFornecedor: TEdit
      Left = 160
      Top = 40
      Width = 377
      Height = 21
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'dbCodigo'
    end
  end
  object btnConfirmar: TcxButton
    Left = 380
    Top = 321
    Width = 83
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Confirmar'
    OptionsImage.Glyph.Data = {
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
    OptionsImage.NumGlyphs = 2
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TcxButton
    Left = 468
    Top = 321
    Width = 83
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancelar'
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
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object dtsPagamentos: TDataSource
    AutoEdit = False
    DataSet = cdsPagamentos
    OnStateChange = dtsPagamentosStateChange
    OnDataChange = dtsPagamentosDataChange
    Left = 344
    Top = 216
  end
  object dtsBanco: TDataSource
    DataSet = fdQryBanco
    Left = 432
    Top = 16
  end
  object dtsFormaPagto: TDataSource
    DataSet = fdQryFormaPagto
    Left = 432
    Top = 48
  end
  object tmrAlerta: TTimer
    Interval = 500
    OnTimer = tmrAlertaTimer
    Left = 72
    Top = 245
  end
  object dtsBancoFebraban: TDataSource
    DataSet = fdQryBancoFebraban
    Left = 496
    Top = 16
  end
  object fdQryBanco: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    b.bco_codigo'
      '  , b.bco_cod'
      '  , b.empresa'
      '  , b.bco_nome'
      '  , b.bco_agencia'
      '  , b.bco_cc'
      '  , b.bco_nome ||'
      
        '    coalesce('#39' - AG. '#39'  || nullif(trim(b.bco_agencia), '#39#39'), '#39#39') ' +
        '||'
      
        '    coalesce('#39' - C/C. '#39' || nullif(trim(b.bco_cc), '#39#39'), '#39#39')  as b' +
        'co_nome_agencia_conta'
      'from TBBANCO_BOLETO b'
      'order by'
      '  2, 7')
    Left = 403
    Top = 16
  end
  object fdQryFormaPagto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '      f.cod'
      '    , f.descri'
      'from TBFORMPAGTO f'
      'order by'
      '      f.descri')
    Left = 403
    Top = 48
  end
  object fdQryBancoFebraban: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    b.cod'
      '  , b.nome'
      '  , b.nome_resumido'
      
        '  , b.cod || '#39' - '#39' || coalesce(nullif(trim(b.nome_resumido), '#39#39')' +
        ', b.nome) as banco_nome'
      'from TBBANCO b'
      'order by'
      '    b.cod')
    Left = 467
    Top = 16
  end
  object cdsPagamentos: TFDQuery
    OnNewRecord = cdsPagamentosNewRecord
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updPagamentos
    SQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.Seq'
      '  , p.Historico'
      '  , p.Data_pagto'
      '  , p.Forma_pagto'
      '  , f.Descri as Forma_pagto_desc'
      '  , p.Valor_baixa'
      '  , p.Controle_cheque'
      '  , p.Numero_cheque'
      '  , p.Banco'
      '  , p.Banco_febraban'
      '  , b.Bco_nome'
      '  , p.Documento_baixa'
      '  , p.Usuario'
      '  , c.empresa'
      'from TBCONTPAG_BAIXA p'
      
        '  left join TBCONTPAG c on (c.anolanc = p.anolanc and c.numlanc ' +
        '= p.numlanc)'
      '  left join TBFORMPAGTO f on (f.Cod = p.Forma_pagto)'
      
        '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco and b.empre' +
        'sa = p.empresa)')
    Left = 283
    Top = 216
    object cdsPagamentosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'ANOLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPagamentosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'NUMLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPagamentosSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsPagamentosHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      BlobType = ftMemo
    end
    object cdsPagamentosDATA_PAGTO: TDateField
      DisplayLabel = 'Data Pagto.'
      FieldName = 'DATA_PAGTO'
      Origin = 'DATA_PAGTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPagamentosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
    end
    object cdsPagamentosFORMA_PAGTO_DESC: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'DESCRI'
      ProviderFlags = []
      Size = 30
    end
    object cdsPagamentosVALOR_BAIXA: TBCDField
      DisplayLabel = 'Valor Pago (R$)'
      FieldName = 'VALOR_BAIXA'
      Origin = 'VALOR_BAIXA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsPagamentosCONTROLE_CHEQUE: TIntegerField
      FieldName = 'CONTROLE_CHEQUE'
      Origin = 'CONTROLE_CHEQUE'
    end
    object cdsPagamentosNUMERO_CHEQUE: TStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUMERO_CHEQUE'
      Origin = 'NUMERO_CHEQUE'
      Size = 30
    end
    object cdsPagamentosBANCO: TSmallintField
      FieldName = 'BANCO'
      Origin = 'BANCO'
    end
    object cdsPagamentosBANCO_FEBRABAN: TStringField
      FieldName = 'BANCO_FEBRABAN'
      Origin = 'BANCO_FEBRABAN'
      Size = 10
    end
    object cdsPagamentosBCO_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Banco'
      FieldName = 'BCO_NOME'
      Origin = 'BCO_NOME'
      ProviderFlags = []
      Size = 50
    end
    object cdsPagamentosDOCUMENTO_BAIXA: TStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCUMENTO_BAIXA'
      Origin = 'DOCUMENTO_BAIXA'
      Size = 10
    end
    object cdsPagamentosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 12
    end
    object cdsPagamentosEMPRESA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = []
      Size = 18
    end
  end
  object updPagamentos: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCONTPAG_BAIXA'
      '(ANOLANC, NUMLANC, SEQ, HISTORICO, DATA_PAGTO, '
      '  FORMA_PAGTO, VALOR_BAIXA, CONTROLE_CHEQUE, '
      '  NUMERO_CHEQUE, EMPRESA, BANCO, BANCO_FEBRABAN, '
      '  DOCUMENTO_BAIXA, USUARIO)'
      
        'VALUES (:NEW_ANOLANC, :NEW_NUMLANC, :NEW_SEQ, :NEW_HISTORICO, :N' +
        'EW_DATA_PAGTO, '
      '  :NEW_FORMA_PAGTO, :NEW_VALOR_BAIXA, :NEW_CONTROLE_CHEQUE, '
      
        '  :NEW_NUMERO_CHEQUE, :NEW_EMPRESA, :NEW_BANCO, :NEW_BANCO_FEBRA' +
        'BAN, '
      '  :NEW_DOCUMENTO_BAIXA, :NEW_USUARIO)'
      'RETURNING EMPRESA')
    ModifySQL.Strings = (
      'UPDATE TBCONTPAG_BAIXA'
      
        'SET ANOLANC = :NEW_ANOLANC, NUMLANC = :NEW_NUMLANC, SEQ = :NEW_S' +
        'EQ, '
      '  HISTORICO = :NEW_HISTORICO, DATA_PAGTO = :NEW_DATA_PAGTO, '
      
        '  FORMA_PAGTO = :NEW_FORMA_PAGTO, VALOR_BAIXA = :NEW_VALOR_BAIXA' +
        ', '
      
        '  CONTROLE_CHEQUE = :NEW_CONTROLE_CHEQUE, NUMERO_CHEQUE = :NEW_N' +
        'UMERO_CHEQUE, '
      
        '  EMPRESA = :NEW_EMPRESA, BANCO = :NEW_BANCO, BANCO_FEBRABAN = :' +
        'NEW_BANCO_FEBRABAN, '
      '  DOCUMENTO_BAIXA = :NEW_DOCUMENTO_BAIXA, USUARIO = :NEW_USUARIO'
      
        'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC AND SEQ ' +
        '= :OLD_SEQ'
      'RETURNING EMPRESA')
    DeleteSQL.Strings = (
      'DELETE FROM TBCONTPAG_BAIXA'
      
        'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC AND SEQ ' +
        '= :OLD_SEQ')
    FetchRowSQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.Seq'
      '  , p.Historico'
      '  , p.Data_pagto'
      '  , p.Forma_pagto'
      '  , f.Descri as Forma_pagto_desc'
      '  , p.Valor_baixa'
      '  , p.Controle_cheque'
      '  , p.Numero_cheque'
      '  , p.Banco'
      '  , p.Banco_febraban'
      '  , b.Bco_nome'
      '  , p.Documento_baixa'
      '  , p.Usuario'
      '  , c.empresa'
      'from TBCONTPAG_BAIXA p'
      
        '  left join TBCONTPAG c on (c.anolanc = p.anolanc and c.numlanc ' +
        '= p.numlanc)'
      '  left join TBFORMPAGTO f on (f.Cod = p.Forma_pagto)'
      
        '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco and b.empre' +
        'sa = p.empresa)'
      
        'WHERE p.ANOLANC = :ANOLANC AND p.NUMLANC = :NUMLANC AND p.SEQ = ' +
        ':SEQ')
    Left = 315
    Top = 216
  end
end
