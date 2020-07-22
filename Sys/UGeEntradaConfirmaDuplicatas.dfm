inherited frmGeEntradaConfirmaDuplicatas: TfrmGeEntradaConfirmaDuplicatas
  Left = 394
  Top = 216
  ActiveControl = dbCodigo
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Confirma'#231#227'o de Duplicadas'
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
    Top = 73
    Width = 534
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 534
    Height = 73
    Align = alTop
    Caption = ' Dados da Duplicata Selecionada '
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
      Left = 264
      Top = 24
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
      Left = 375
      Top = 24
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
    object dbCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'Lancamento'
      DataSource = dtsDuplicatas
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbParcela: TDBEdit
      Left = 112
      Top = 40
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'PARCELA'
      DataSource = dtsDuplicatas
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
      Left = 375
      Top = 40
      Width = 105
      Height = 21
      Color = clWhite
      DataField = 'VALORPAG'
      DataSource = dtsDuplicatas
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
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
      DataSource = dtsDuplicatas
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbDataVencimento: TJvDBDateEdit
      Left = 264
      Top = 40
      Width = 105
      Height = 21
      DataField = 'DTVENC'
      DataSource = dtsDuplicatas
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
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
      TabOrder = 3
      OnEnter = ControlEditEnter
    end
  end
  object dbgTitulos: TDBGrid
    Left = 0
    Top = 77
    Width = 534
    Height = 288
    TabStop = False
    Align = alClient
    DataSource = dtsDuplicatas
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
        FieldName = 'VALORPAG'
        Title.Caption = 'Valor A Pagar (R$) '
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
    DataSource = dtsDuplicatas
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
    DataSource = dtsDuplicatas
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
      Caption = 'Total Entrada (R$)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalEntrada: TLabel
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
    TabOrder = 5
    OnClick = btFecharClick
  end
  object dtsDuplicatas: TDataSource
    AutoEdit = False
    DataSet = cdsDuplicatas
    OnDataChange = dtsDuplicatasDataChange
    OnUpdateData = dtsDuplicatasUpdateData
    Left = 96
    Top = 248
  end
  object dspDuplicatas: TDataSetProvider
    DataSet = qryDuplicatas
    UpdateMode = upWhereChanged
    Left = 96
    Top = 184
  end
  object cdsDuplicatas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspDuplicatas'
    BeforePost = cdsDuplicatasBeforePost
    AfterScroll = cdsDuplicatasAfterScroll
    OnCalcFields = cdsDuplicatasCalcFields
    Left = 96
    Top = 216
    object cdsDuplicatasANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Required = True
    end
    object cdsDuplicatasNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Required = True
    end
    object cdsDuplicatasPARCELA: TSmallintField
      Alignment = taCenter
      FieldName = 'PARCELA'
      DisplayFormat = '00'
    end
    object cdsDuplicatasCODFORN: TSmallintField
      FieldName = 'CODFORN'
    end
    object cdsDuplicatasNOTFISC: TStringField
      FieldName = 'NOTFISC'
      Size = 15
    end
    object cdsDuplicatasTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Size = 35
    end
    object cdsDuplicatasDTEMISS: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDuplicatasDTVENC: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDuplicatasVALORPAG: TFMTBCDField
      FieldName = 'VALORPAG'
      Precision = 18
      Size = 2
    end
    object cdsDuplicatasDTPAG: TDateField
      FieldName = 'DTPAG'
    end
    object cdsDuplicatasTotalEntrada: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'TotalEntrada'
      ProviderFlags = []
      DisplayFormat = ',0.00'
    end
    object cdsDuplicatasDiaSemana: TSmallintField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'DiaSemana'
      ProviderFlags = []
      OnGetText = cdsDuplicatasDiaSemanaGetText
    end
    object cdsDuplicatasLancamento: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'Lancamento'
    end
    object cdsDuplicatasTotalParcelas: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TotalParcelas'
      ProviderFlags = []
      Active = True
      currency = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(VALORPAG)'
    end
  end
  object qryDuplicatas: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    d.Anolanc'
      '  , d.Numlanc'
      '  , d.parcela'
      '  , d.Codforn'
      '  , d.Notfisc'
      '  , d.Tippag'
      '  , d.Dtemiss'
      '  , d.Dtvenc'
      '  , d.Dtpag'
      '  , d.Valorpag'
      '  , c.TotalNF'
      'from TBCONTPAG d'
      
        '  inner join TBCOMPRAS c on (c.ano = anocompra and c.codcontrol ' +
        '= d.NumCompra)')
    Left = 98
    Top = 151
  end
  object qryParcela: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = updParcela
    SQL.Strings = (
      'Select'
      '    Anolanc   '
      '  , Numlanc   '
      '  , AnoCompra '
      '  , NumCompra '
      '  , Dtvenc'
      '  , Valorpag'
      'from TBCONTPAG '
      'where AnoCompra = :AnoCompra'
      '  and NumCompra = :NumCompra'
      '  and Anolanc   = :Anolanc'
      '  and Numlanc   = :Numlanc')
    Left = 314
    Top = 167
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
      end
      item
        Name = 'ANOLANC'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'NUMLANC'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryParcelaANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'ANOLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryParcelaNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'NUMLANC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryParcelaANOCOMPRA: TSmallintField
      FieldName = 'ANOCOMPRA'
      Origin = 'ANOCOMPRA'
    end
    object qryParcelaNUMCOMPRA: TIntegerField
      FieldName = 'NUMCOMPRA'
      Origin = 'NUMCOMPRA'
    end
    object qryParcelaDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = 'DTVENC'
    end
    object qryParcelaVALORPAG: TFMTBCDField
      FieldName = 'VALORPAG'
      Origin = 'VALORPAG'
      Precision = 18
      Size = 2
    end
  end
  object updParcela: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    ModifySQL.Strings = (
      'UPDATE TBCONTPAG'
      'SET DTVENC = :NEW_DTVENC, VALORPAG = :NEW_VALORPAG'
      'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC')
    Left = 346
    Top = 167
  end
end
