object frmEntradaEstoq: TfrmEntradaEstoq
  Left = 347
  Top = 210
  Width = 582
  Height = 467
  BorderIcons = []
  Caption = 'Inclus'#227'o de Nota Fiscal de Entrada - Estoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 41
    Width = 566
    Height = 353
    Align = alClient
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Empresa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 416
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Controle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object DBEdit4: TDBEdit
      Left = 472
      Top = 9
      Width = 41
      Height = 21
      Color = clBtnFace
      DataField = 'CODCONTROL'
      DataSource = frmGrEntradaEstoq.dtsrcCompras
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 64
      Top = 8
      Width = 257
      Height = 21
      DataField = 'LookEmp'
      DataSource = frmGrEntradaEstoq.dtsrcCompras
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 566
    Height = 353
    ActivePage = TabSheetItens
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheetNota: TTabSheet
      Caption = 'Nota'
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 273
        Height = 121
        Align = alCustom
        Caption = 'NF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 24
          Width = 69
          Height = 13
          Caption = 'N'#250'mero/S'#233'rie:'
          FocusControl = DBEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 72
          Width = 83
          Height = 13
          Caption = 'Data de Emiss'#227'o:'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 144
          Top = 72
          Width = 81
          Height = 13
          Caption = 'Data de Entrada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 98
          Top = 44
          Width = 5
          Height = 13
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 40
          Width = 89
          Height = 21
          DataField = 'NF'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = DBEdit1Exit
        end
        object DBEdit2: TDBEdit
          Left = 104
          Top = 40
          Width = 18
          Height = 21
          DataField = 'NFSERIE'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 88
          Width = 89
          Height = 21
          DataField = 'DTEMISS'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit16: TDBEdit
          Left = 144
          Top = 88
          Width = 119
          Height = 21
          DataField = 'DTENT'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 128
        Width = 273
        Height = 137
        Caption = 'Fornecedor / Natureza / Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 24
          Width = 57
          Height = 13
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 72
          Width = 46
          Height = 13
          Caption = 'Natureza:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 88
          Top = 72
          Width = 27
          Height = 13
          Caption = 'Frete:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object RxDBComboEdit1: TRxDBComboEdit
          Left = 8
          Top = 40
          Width = 73
          Height = 21
          DataField = 'CODFORN'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333FF3333333333333003333
            3333333333773FF3333333333309003333333333337F773FF333333333099900
            33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
            99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
            33333333337F3F77333333333309003333333333337F77333333333333003333
            3333333333773333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          MaxLength = 14
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnButtonClick = RxDBComboEdit1ButtonClick
        end
        object DBEdit7: TDBEdit
          Left = 8
          Top = 88
          Width = 57
          Height = 21
          DataField = 'NATUREZA'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 88
          Top = 88
          Width = 97
          Height = 21
          DataField = 'FRETE'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit9: TDBEdit
          Left = 192
          Top = 88
          Width = 57
          Height = 21
          Hint = 'STATUS'
          DataField = 'STATUS'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Visible = False
        end
        object Edit1: TEdit
          Left = 88
          Top = 40
          Width = 177
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
      object GroupBox5: TGroupBox
        Left = 275
        Top = 0
        Width = 283
        Height = 263
        Align = alRight
        Caption = 'Valores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label9: TLabel
          Left = 8
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Base ICMS:'
          FocusControl = DBEdit10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 152
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Valor ICMS:'
          FocusControl = DBEdit11
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 8
          Top = 72
          Width = 94
          Height = 13
          Caption = 'Base ICMS Substit.:'
          FocusControl = DBEdit12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 152
          Top = 72
          Width = 94
          Height = 13
          Caption = 'Valor ICMS Substit.:'
          FocusControl = DBEdit13
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 120
          Width = 88
          Height = 13
          Caption = 'Total Produtos:'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 152
          Top = 120
          Width = 16
          Height = 13
          Caption = 'IPI:'
          FocusControl = DBEdit15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 8
          Top = 168
          Width = 34
          Height = 13
          Caption = 'Outros:'
          FocusControl = DBEdit17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 152
          Top = 168
          Width = 49
          Height = 13
          Caption = 'Desconto:'
          FocusControl = DBEdit18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 152
          Top = 216
          Width = 102
          Height = 13
          Caption = 'Total Nota Fiscal:'
          FocusControl = DBEdit19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit10: TDBEdit
          Left = 8
          Top = 40
          Width = 121
          Height = 21
          DataField = 'ICMSBASE'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit11: TDBEdit
          Left = 152
          Top = 40
          Width = 121
          Height = 21
          DataField = 'ICMSVALOR'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit12: TDBEdit
          Left = 8
          Top = 88
          Width = 121
          Height = 21
          DataField = 'ICMSSUBSTBASE'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit13: TDBEdit
          Left = 152
          Top = 88
          Width = 121
          Height = 21
          DataField = 'ICMSSUBSTVALOR'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit14: TDBEdit
          Left = 8
          Top = 136
          Width = 121
          Height = 21
          DataField = 'TOTALPROD'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit15: TDBEdit
          Left = 152
          Top = 136
          Width = 121
          Height = 21
          DataField = 'IPI'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit17: TDBEdit
          Left = 8
          Top = 184
          Width = 121
          Height = 21
          DataField = 'OUTROSCUSTOS'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit18: TDBEdit
          Left = 152
          Top = 184
          Width = 121
          Height = 21
          DataField = 'DESCONTO'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit19: TDBEdit
          Left = 152
          Top = 232
          Width = 121
          Height = 21
          DataField = 'TOTALNF'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 263
        Width = 558
        Height = 62
        Align = alBottom
        Caption = 'OBS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object DBMemo1: TDBMemo
          Left = 8
          Top = 16
          Width = 545
          Height = 33
          DataField = 'OBS'
          DataSource = frmGrEntradaEstoq.dtsrcCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object TabSheetItens: TTabSheet
      Caption = 'Itens'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 558
        Height = 57
        Align = alTop
        TabOrder = 0
        object Label19: TLabel
          Left = 8
          Top = 8
          Width = 36
          Height = 13
          Caption = 'C'#243'digo:'
          FocusControl = DBEdit20
        end
        object Label20: TLabel
          Left = 144
          Top = 8
          Width = 26
          Height = 13
          Caption = 'Qtde:'
          FocusControl = DBEdit21
        end
        object Label21: TLabel
          Left = 208
          Top = 8
          Width = 70
          Height = 13
          Caption = 'Pre'#231'o Unit'#225'rio:'
          FocusControl = DBEdit22
        end
        object Label22: TLabel
          Left = 320
          Top = 8
          Width = 40
          Height = 13
          Caption = 'Produto:'
        end
        object SpeedButton1: TSpeedButton
          Left = 488
          Top = 24
          Width = 19
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337F33333333333333033333333333333373F333333333333090333
            33333333337F7F33333333333309033333333333337373F33333333330999033
            3333333337F337F33333333330999033333333333733373F3333333309999903
            333333337F33337F33333333099999033333333373333373F333333099999990
            33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333300033333333333337773333333}
          NumGlyphs = 2
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 520
          Top = 24
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
            03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
            33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
            0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
            3333333337FFF7F3333333333000003333333333377777333333}
          NumGlyphs = 2
        end
        object DBEdit20: TDBEdit
          Left = 8
          Top = 24
          Width = 119
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODPROD'
          DataSource = frmGrEntradaEstoq.dtsrcComprasItens
          TabOrder = 0
          OnExit = DBEdit20Exit
        end
        object DBEdit21: TDBEdit
          Left = 144
          Top = 24
          Width = 49
          Height = 21
          CharCase = ecUpperCase
          DataField = 'QTDE'
          DataSource = frmGrEntradaEstoq.dtsrcComprasItens
          TabOrder = 1
          OnExit = DBEdit21Exit
        end
        object DBEdit22: TDBEdit
          Left = 208
          Top = 24
          Width = 93
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PRECOUNIT'
          DataSource = frmGrEntradaEstoq.dtsrcComprasItens
          TabOrder = 2
        end
        object DBEdit23: TDBEdit
          Left = 320
          Top = 24
          Width = 161
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          DataField = 'LookProduto'
          DataSource = frmGrEntradaEstoq.dtsrcComprasItens
          Enabled = False
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 57
        Width = 558
        Height = 268
        Align = alClient
        Caption = 'Itens Lan'#231'ados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label23: TLabel
          Left = 120
          Top = 80
          Width = 69
          Height = 13
          Caption = 'LookProdQtde'
          FocusControl = DBLookupComboBox2
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 554
          Height = 251
          Align = alClient
          DataSource = frmGrEntradaEstoq.dtsrcComprasItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clRed
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnKeyDown = DBGrid1KeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'CODPROD'
              Title.Caption = 'C'#243'digo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Caption = 'Qtde'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECOUNIT'
              Title.Caption = 'Pre'#231'o Unit'#225'rio'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTENT'
              Title.Caption = 'Data Entrada'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODCONTROL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODEMP'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODFORN'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CUSTOMEDIO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LookEmp'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LookProduto'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end>
        end
        object DBEdit5: TDBEdit
          Left = 112
          Top = 120
          Width = 121
          Height = 21
          DataField = 'QTDEANTES'
          DataSource = frmGrEntradaEstoq.dtsrcComprasItens
          TabOrder = 1
          Visible = False
        end
        object DBEdit6: TDBEdit
          Left = 272
          Top = 120
          Width = 121
          Height = 21
          DataField = 'QTDEFINAL'
          DataSource = frmGrEntradaEstoq.dtsrcComprasItens
          TabOrder = 2
          Visible = False
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 104
          Top = 80
          Width = 144
          Height = 21
          DataField = 'LookProdQtde'
          DataSource = frmGrEntradaEstoq.dtsrcComprasItens
          TabOrder = 3
          Visible = False
        end
      end
    end
    object TabSheetFatura: TTabSheet
      Caption = 'Faturamento'
      ImageIndex = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 394
    Width = 566
    Height = 35
    Align = alBottom
    TabOrder = 2
    object tlbarForn: TToolBar
      Left = 2
      Top = -2
      Width = 562
      Height = 35
      Align = alBottom
      ButtonHeight = 30
      Caption = 'tlbarForn'
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object btnGravar: TBitBtn
        Left = 8
        Top = 2
        Width = 75
        Height = 30
        Caption = 'Gravar'
        TabOrder = 0
        OnClick = btnGravarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        NumGlyphs = 2
      end
      object ToolButton1: TToolButton
        Left = 83
        Top = 2
        Width = 8
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 91
        Top = 2
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 99
        Top = 2
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 107
        Top = 2
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 115
        Top = 2
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object btbtnCancel: TBitBtn
        Left = 123
        Top = 2
        Width = 71
        Height = 30
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btbtnCancelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
      end
    end
  end
end
