inherited frmGeVendaFormaPagto: TfrmGeVendaFormaPagto
  Left = 535
  Top = 240
  ActiveControl = dbFormaPagto
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Controle de Vendas - Formas/Condi'#231#245'es de Pagamentos'
  ClientHeight = 255
  ClientWidth = 603
  ExplicitWidth = 617
  ExplicitHeight = 292
  DesignSize = (
    603
    255)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 603
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 217
    Width = 603
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 603
    Height = 73
    Align = alTop
    Caption = 'Controle da Venda'
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
      Width = 58
      Height = 13
      Caption = 'No. Venda:'
      FocusControl = dbCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataHora: TLabel
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
    object lblSerie: TLabel
      Left = 240
      Top = 24
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
      Left = 280
      Top = 24
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
    object lblDataEmissao: TLabel
      Left = 408
      Top = 24
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
      Left = 496
      Top = 24
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
      DataField = 'CODCONTROL'
      DataSource = frmGeVenda.DtSrcTabela
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbDataHora: TDBEdit
      Left = 112
      Top = 40
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'DTFINALIZACAO_VENDA'
      DataSource = frmGeVenda.DtSrcTabela
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
      Left = 240
      Top = 40
      Width = 33
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'SERIE'
      DataSource = frmGeVenda.DtSrcTabela
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
      Left = 280
      Top = 40
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'NFE'
      DataSource = frmGeVenda.DtSrcTabela
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbDataEmissao: TDBEdit
      Left = 408
      Top = 40
      Width = 81
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'DATAEMISSAO'
      DataSource = frmGeVenda.DtSrcTabela
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object dbHoraEmissao: TDBEdit
      Left = 496
      Top = 40
      Width = 91
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'HORAEMISSAO'
      DataSource = frmGeVenda.DtSrcTabela
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
  object GrpBxFormaPagto: TGroupBox
    Left = 0
    Top = 77
    Width = 603
    Height = 140
    Align = alTop
    TabOrder = 1
    object lblPrazo01: TLabel
      Left = 16
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P01:'
      FocusControl = dbPrazo01
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo02: TLabel
      Left = 64
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P02:'
      FocusControl = dbPrazo02
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo03: TLabel
      Left = 112
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P03:'
      FocusControl = dbPrazo03
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo04: TLabel
      Left = 160
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P04:'
      FocusControl = dbPrazo04
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo05: TLabel
      Left = 208
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P05:'
      FocusControl = dbPrazo05
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo06: TLabel
      Left = 256
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P06:'
      FocusControl = dbPrazo06
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo07: TLabel
      Left = 304
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P07:'
      FocusControl = dbPrazo07
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo08: TLabel
      Left = 352
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P08:'
      FocusControl = dbPrazo08
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo09: TLabel
      Left = 400
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P09:'
      FocusControl = dbPrazo09
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo10: TLabel
      Left = 448
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P10:'
      FocusControl = dbPrazo10
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo11: TLabel
      Left = 496
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P11:'
      FocusControl = dbPrazo11
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrazo12: TLabel
      Left = 544
      Top = 65
      Width = 24
      Height = 13
      Caption = 'P12:'
      FocusControl = dbPrazo12
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFormaPagto: TLabel
      Left = 16
      Top = 25
      Width = 106
      Height = 13
      Caption = '&Forma de Pagamento:'
      FocusControl = dbFormaPagto
    end
    object lblCondicaoPagto: TLabel
      Left = 203
      Top = 25
      Width = 120
      Height = 13
      Caption = 'Condi'#231#227'o de Pagamento:'
      FocusControl = dbCondicaoPagto
    end
    object Label2: TLabel
      Left = 486
      Top = 25
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
    object dbPrazo01: TDBEdit
      Left = 16
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_01'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbPrazo02: TDBEdit
      Left = 64
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_02'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object dbPrazo03: TDBEdit
      Left = 112
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_03'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object dbPrazo04: TDBEdit
      Left = 160
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_04'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object dbPrazo05: TDBEdit
      Left = 208
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_05'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object dbPrazo06: TDBEdit
      Left = 256
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_06'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object dbPrazo07: TDBEdit
      Left = 304
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_07'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object dbPrazo08: TDBEdit
      Left = 352
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_08'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object dbPrazo09: TDBEdit
      Left = 400
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_09'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object dbPrazo10: TDBEdit
      Left = 448
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_10'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object dbPrazo11: TDBEdit
      Left = 496
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_11'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object dbPrazo12: TDBEdit
      Left = 544
      Top = 81
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PRAZO_12'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object dbFormaPagto: TDBLookupComboBox
      Left = 16
      Top = 41
      Width = 185
      Height = 21
      DataField = 'FORMAPAGTO_COD'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      DropDownRows = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'COD'
      ListField = 'DESCRI'
      ListSource = frmGeVenda.dtsFormaPagto
      ParentFont = False
      TabOrder = 0
      OnClick = dbFormaPagtoClick
    end
    object dbCondicaoPagto: TDBLookupComboBox
      Left = 203
      Top = 41
      Width = 281
      Height = 21
      DataField = 'CONDICAOPAGTO_COD'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      DropDownRows = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'COND_COD'
      ListField = 'COND_DESCRICAO'
      ListSource = frmGeVenda.dtsCondicaoPagto
      ParentFont = False
      TabOrder = 1
      OnClick = dbCondicaoPagtoClick
    end
    object dbValorFormaPagto: TDBEdit
      Left = 486
      Top = 41
      Width = 102
      Height = 21
      DataField = 'VALOR_FPAGTO'
      DataSource = frmGeVenda.dtsVendaFormaPagto
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object btnConfirmar: TcxButton
    Left = 415
    Top = 222
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
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00C068
      60FFB05850FFA05050FFA05050FFA05050FF904850FF904840FF904840FF8040
      40FF803840FF803840FF703840FF703830FF0000FF000000FF000000FF006E6E
      6EFF5E5E5EFF585858FF585858FF585858FF515151FF4C4C4CFF4C4C4CFF4646
      46FF414141FF414141FF404040FF3B3B3BFF0000FF000000FF00D06870FFF090
      90FFE08080FFB04820FF403020FFC0B8B0FFC0B8B0FFD0C0C0FFD0C8C0FF5050
      50FFA04030FFA04030FFA03830FF703840FF0000FF000000FF00747474FF9999
      99FF898989FF464646FF2C2C2CFFB6B6B6FFB6B6B6FFC1C1C1FFC6C6C6FF5050
      50FF444444FF444444FF404040FF404040FF0000FF000000FF00D07070FFFF98
      A0FFF08880FFE08080FF705850FF404030FF907870FFF0E0E0FFF0E8E0FF9080
      70FFA04030FFA04040FFA04030FF803840FF0000FF000000FF00797979FFA4A4
      A4FF909090FF898989FF585858FF3B3B3BFF787878FFE1E1E1FFE6E6E6FF7C7C
      7CFF444444FF494949FF444444FF414141FF0000FF000000FF00D07870FFFFA0
      A0FFF09090FFF08880FF705850FF000000FF404030FFF0D8D0FFF0E0D0FF8078
      60FFB04840FFB04840FFA04040FF804040FF0000FF000000FF007E7E7EFFA9A9
      A9FF999999FF909090FF585858FF000000FF3B3B3BFFD8D8D8FFDCDCDCFF7171
      71FF505050FF505050FF494949FF464646FF0000FF000000FF00D07880FFFFA8
      B0FFFFA0A0FFF09090FF705850FF705850FF705850FF705850FF706050FF8068
      60FFC05850FFB05050FFB04840FF804040FF0000FF000000FF00838383FFB3B3
      B3FFA9A9A9FF999999FF585858FF585858FF585858FF585858FF5C5C5CFF6868
      68FF606060FF595959FF505050FF464646FF0000FF000000FF00E08080FFFFB0
      B0FFFFB0B0FFFFA0A0FFF09090FFF08880FFE08080FFE07880FFD07070FFD068
      70FFC06060FFC05850FFB05050FF904840FF0000FF000000FF00898989FFB7B7
      B7FFB7B7B7FFA9A9A9FF999999FF909090FF898989FF848484FF797979FF7474
      74FF696969FF606060FF595959FF4C4C4CFF0000FF000000FF00E08890FFFFB8
      C0FFFFB8B0FFD06060FFC06050FFC05850FFC05040FFB05030FFB04830FFA040
      20FFA03810FFC06060FFC05850FF904840FF0000FF000000FF00939393FFC1C1
      C1FFBCBCBCFF6B6B6BFF646464FF606060FF565656FF505050FF4B4B4BFF4040
      40FF363636FF696969FF606060FF4C4C4CFF0000FF000000FF00E09090FFFFC0
      C0FFD06860FFFFFFFFFFFFFFFFFFFFF8F0FFF0F0F0FFF0E8E0FFF0D8D0FFE0D0
      C0FFE0C8C0FFA03810FFC06060FF904850FF0000FF000000FF00989898FFC6C6
      C6FF707070FFFFFFFFFFFFFFFFFFF6F6F6FFF0F0F0FFE6E6E6FFD8D8D8FFCCCC
      CCFFC8C8C8FF363636FF696969FF515151FF0000FF000000FF00E098A0FFFFC0
      C0FFD07070FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF0F0F0FFF0E8E0FFF0D8
      D0FFE0D0C0FFA04020FFD06860FFA05050FF0000FF000000FF00A1A1A1FFC6C6
      C6FF797979FFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FFF0F0F0FFE6E6E6FFD8D8
      D8FFCCCCCCFF404040FF707070FF585858FF0000FF000000FF00F0A0A0FFFFC0
      C0FFE07870FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF0F0F0FFF0E8
      E0FFF0D8D0FFB04830FFD07070FFA05050FF0000FF000000FF00A8A8A8FFC6C6
      C6FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FFF0F0F0FFE6E6
      E6FFD8D8D8FF4B4B4BFF797979FF585858FF0000FF000000FF00F0A8A0FFFFC0
      C0FFE08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF0F0
      F0FFF0E8E0FFB05030FFE07880FFA05050FF0000FF000000FF00ACACACFFC6C6
      C6FF898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FFF0F0
      F0FFE6E6E6FF505050FF848484FF585858FF0000FF000000FF00F0B0B0FFFFC0
      C0FFF08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
      F0FFF0F0F0FFC05040FF603030FFB05850FF0000FF000000FF00B6B6B6FFC6C6
      C6FF949494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
      F6FFF0F0F0FF565656FF343434FF5E5E5EFF0000FF000000FF00F0B0B0FFFFC0
      C0FFFF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF8F0FFC05850FFB05860FFB05860FF0000FF000000FF00B6B6B6FFC6C6
      C6FF9B9B9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF6F6F6FF606060FF636363FF636363FF0000FF000000FF00F0B8B0FFF0B8
      B0FFF0B0B0FFF0B0B0FFF0A8B0FFF0A0A0FFE098A0FFE09090FFE09090FFE088
      90FFE08080FFD07880FFD07870FFD07070FF0000FF000000FF00BBBBBBFFBBBB
      BBFFB6B6B6FFB6B6B6FFB1B1B1FFA8A8A8FFA1A1A1FF989898FF989898FF9393
      93FF898989FF838383FF7E7E7EFF797979FF0000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF00}
    OptionsImage.NumGlyphs = 2
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TcxButton
    Left = 511
    Top = 222
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancelar'
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
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object dtsVenda: TDataSource
    DataSet = frmGeVenda.fdQryTabela
    Left = 24
    Top = 181
  end
end
