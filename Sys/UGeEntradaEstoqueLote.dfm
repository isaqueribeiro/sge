inherited frmGeEntradaEstoqueLote: TfrmGeEntradaEstoqueLote
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Confirma'#231#227'o de Lotes de Entrada no Estoque'
  ClientHeight = 394
  ClientWidth = 712
  Position = poOwnerFormCenter
  ExplicitWidth = 726
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 113
    Width = 712
    Height = 4
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 73
    ExplicitWidth = 534
  end
  object Bevel1: TBevel
    Left = 0
    Top = 356
    Width = 712
    Height = 38
    Align = alBottom
    Shape = bsTopLine
    ExplicitTop = 302
    ExplicitWidth = 534
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 712
    Height = 113
    Align = alTop
    Caption = ' Dados do(s) Lote(s)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      712
      113)
    object lblCodigo: TLabel
      Left = 16
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Entrada:'
      FocusControl = dbCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 17
      Top = 64
      Width = 89
      Height = 13
      Caption = 'Descri'#231#227'o do Lote:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSequencial: TLabel
      Left = 112
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Seq.:'
      FocusControl = dbSequencial
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProduto: TLabel
      Left = 160
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Produto:'
      FocusControl = dbProduto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataFabricacao: TLabel
      Left = 485
      Top = 64
      Width = 82
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Data Fabrica'#231#227'o:'
      FocusControl = dbDataFabricacao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 369
    end
    object lblDataValidade: TLabel
      Left = 596
      Top = 64
      Width = 70
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Data Validade:'
      FocusControl = dbDataValidade
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 480
    end
    object lblQTDE: TLabel
      Left = 596
      Top = 24
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Quant.'
      FocusControl = dbQTDE
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 567
    end
    object dbCodigo: TDBEdit
      Left = 17
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'CODCONTROL'
      DataSource = dtsCompraItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbSequencial: TDBEdit
      Left = 112
      Top = 40
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'SEQ'
      DataSource = dtsCompraItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbProduto: TDBEdit
      Left = 160
      Top = 40
      Width = 430
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clMoneyGreen
      DataField = 'DESCRI_APRESENTACAO'
      DataSource = dtsCompraItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbDataFabricacao: TJvDBDateEdit
      Left = 485
      Top = 80
      Width = 105
      Height = 21
      DataField = 'LOTE_DATA_FAB'
      DataSource = dtsCompraItens
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
      Anchors = [akTop, akRight]
      ParentFont = False
      PopupColor = clBtnFace
      ShowNullDate = False
      TabOrder = 5
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbDataValidade: TJvDBDateEdit
      Left = 596
      Top = 80
      Width = 105
      Height = 21
      DataField = 'LOTE_DATA_VAL'
      DataSource = dtsCompraItens
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
      Anchors = [akTop, akRight]
      ParentFont = False
      PopupColor = clBtnFace
      ShowNullDate = False
      TabOrder = 6
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbDescricao: TDBComboBox
      Left = 17
      Top = 80
      Width = 462
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'LOTE_DESCRICAO'
      DataSource = dtsCompraItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = ControlEditEnter
      OnExit = ControlEditExit
    end
    object dbQTDE: TDBEdit
      Left = 596
      Top = 40
      Width = 105
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clMoneyGreen
      DataField = 'QTDE'
      DataSource = dtsCompraItens
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
  object dbgTitulos: TDBGrid
    Left = 0
    Top = 117
    Width = 712
    Height = 239
    TabStop = False
    Align = alClient
    DataSource = dtsCompraItens
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
        FieldName = 'SEQ'
        Title.Alignment = taCenter
        Title.Caption = '#'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRI_APRESENTACAO'
        Title.Caption = 'Produto'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE'
        Title.Caption = 'Quant.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOTE_DESCRICAO'
        Title.Caption = 'Lote'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOTE_DATA_FAB'
        Title.Caption = 'Fabrica'#231#227'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOTE_DATA_VAL'
        Title.Caption = 'Validade'
        Width = 80
        Visible = True
      end>
  end
  object btnConfirmar: TcxButton
    Left = 522
    Top = 361
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
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnFechar: TcxButton
    Left = 620
    Top = 361
    Width = 92
    Height = 33
    Anchors = [akRight, akBottom]
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
    OnClick = btnFecharClick
  end
  object pnlDicaFormaPagto: TPanel
    Left = 4
    Top = 361
    Width = 512
    Height = 32
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 4
    object lblDicaFormaPagto: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 506
      Height = 26
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'Esta lista '#233' composta apenas por produtos que est'#227'o marcados par' +
        'a movimenta'#231#227'o de estoque em seu cadastro e quando associados a ' +
        'CFOP que permitam esse movimento.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      ExplicitLeft = 0
      ExplicitTop = 1
      ExplicitWidth = 545
    end
  end
  object fdQryCompraItens: TFDQuery
    BeforePost = fdQryCompraItensBeforePost
    AfterScroll = fdQryCompraItensAfterScroll
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = fdUpdCompraItens
    SQL.Strings = (
      'Select'
      '     ci.ano'
      '   , ci.codcontrol'
      '   , ci.codemp'
      '   , ci.seq'
      '   , ci.codprod'
      '   , pr.descri'
      '   , pr.apresentacao'
      '   , pr.descri_apresentacao'
      '   , ci.qtde'
      '   , pr.fracionador'
      '   , ci.lote_id'
      '   , ci.lote_descricao'
      '   , ci.lote_data_fab'
      '   , ci.lote_data_val'
      'from TBCOMPRASITENS ci'
      
        '  inner join TBCOMPRAS cp on (cp.ano = ci.ano and cp.codcontrol ' +
        '= ci.codcontrol and cp.codemp = ci.codemp)'
      
        '  inner join TBPRODUTO pr on (pr.cod = ci.codprod and pr.estoque' +
        '_aprop_lote = 1 and pr.movimenta_estoque = 1)'
      '  left join TBCFOP cf on (cf.cfop_cod = cp.nfcfop)'
      'where ci.ano        = :ano'
      '  and ci.codcontrol = :compra'
      '  and (coalesce(cf.cfop_altera_estoque_produto, 1) = 1)'
      'order by'
      '     ci.seq')
    Left = 112
    Top = 160
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COMPRA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object fdQryCompraItensANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryCompraItensCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'CODCONTROL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '###00000'
    end
    object fdQryCompraItensCODEMP: TStringField
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object fdQryCompraItensSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object fdQryCompraItensCODPROD: TStringField
      FieldName = 'CODPROD'
      Origin = 'CODPROD'
      Size = 10
    end
    object fdQryCompraItensDESCRI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRI'
      Origin = 'DESCRI'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object fdQryCompraItensAPRESENTACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'APRESENTACAO'
      Origin = 'APRESENTACAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object fdQryCompraItensDESCRI_APRESENTACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = 'DESCRI_APRESENTACAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object fdQryCompraItensQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      DisplayFormat = ',0'
      Precision = 18
      Size = 3
    end
    object fdQryCompraItensFRACIONADOR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FRACIONADOR'
      Origin = 'FRACIONADOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object fdQryCompraItensLOTE_ID: TStringField
      FieldName = 'LOTE_ID'
      Origin = 'LOTE_ID'
      Size = 38
    end
    object fdQryCompraItensLOTE_DESCRICAO: TStringField
      FieldName = 'LOTE_DESCRICAO'
      Origin = 'LOTE_DESCRICAO'
      Size = 30
    end
    object fdQryCompraItensLOTE_DATA_FAB: TDateField
      FieldName = 'LOTE_DATA_FAB'
      Origin = 'LOTE_DATA_FAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdQryCompraItensLOTE_DATA_VAL: TDateField
      FieldName = 'LOTE_DATA_VAL'
      Origin = 'LOTE_DATA_VAL'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object fdUpdCompraItens: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    ModifySQL.Strings = (
      'UPDATE TBCOMPRASITENS'
      
        'SET LOTE_ID = :NEW_LOTE_ID, LOTE_DESCRICAO = :NEW_LOTE_DESCRICAO' +
        ', '
      
        '  LOTE_DATA_FAB = :NEW_LOTE_DATA_FAB, LOTE_DATA_VAL = :NEW_LOTE_' +
        'DATA_VAL'
      
        'WHERE ANO = :OLD_ANO AND CODCONTROL = :OLD_CODCONTROL AND CODEMP' +
        ' = :OLD_CODEMP AND '
      '  SEQ = :OLD_SEQ')
    FetchRowSQL.Strings = (
      
        'SELECT ANO, CODCONTROL, CODEMP, SEQ, CODFORN, CODPROD, QTDE, PRE' +
        'COUNIT, '
      
        '  CUSTOMEDIO, DTENT, NF, QTDEANTES, QTDEFINAL, PERC_PARTICIPACAO' +
        ', '
      
        '  VALOR_FRETE, VALOR_DESCONTO, VALOR_OUTROS, VALOR_IPI, UNID_COD' +
        ', '
      
        '  NCM_SH, CST, CSOSN, CFOP, ALIQUOTA, ALIQUOTA_CSOSN, ALIQUOTA_P' +
        'IS, '
      
        '  ALIQUOTA_COFINS, PERCENTUAL_REDUCAO_BC, TOTAL_BRUTO, TOTAL_LIQ' +
        'UIDO, '
      '  LOTE_ID, LOTE_DESCRICAO, LOTE_DATA_FAB, LOTE_DATA_VAL'
      'FROM TBCOMPRASITENS'
      
        'WHERE ANO = :ANO AND CODCONTROL = :CODCONTROL AND CODEMP = :CODE' +
        'MP AND '
      '  SEQ = :SEQ')
    Left = 112
    Top = 208
  end
  object dtsCompraItens: TDataSource
    DataSet = fdQryCompraItens
    Left = 112
    Top = 256
  end
  object fdQryLotes: TFDQuery
    Connection = DMBusiness.fdConexao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    e.id'
      '  , e.descricao'
      '  , e.data_fabricacao'
      '  , e.data_validade'
      'from TBESTOQUE_ALMOX e'
      'where e.empresa = :empresa'
      '  and e.centro_custo = :centro_custo'
      '  and e.produto = :produto'
      'order by'
      '  e.descricao')
    Left = 392
    Top = 192
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
        Value = Null
      end
      item
        Name = 'CENTRO_CUSTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object dtsLotes: TDataSource
    DataSet = fdQryLotes
    Left = 392
    Top = 240
  end
  object fdSetLoteProduto: TFDStoredProc
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    StoredProcName = 'SET_LOTE_PRODUTO'
    Left = 256
    Top = 208
    ParamData = <
      item
        Position = 1
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Position = 2
        Name = 'CENTRO_CUSTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 4
        Name = 'LOTE_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 5
        Name = 'LOTE_FAB'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'LOTE_VAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'LOTE_QTDE'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'LOTE_ID'
        DataType = ftString
        ParamType = ptOutput
        Size = 38
      end>
  end
end
