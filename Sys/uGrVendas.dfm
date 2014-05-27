object frmGrVendas: TfrmGrVendas
  Left = 437
  Top = 260
  Width = 608
  Height = 500
  Caption = 'Vendas'
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
  object tlbrGridFornec: TToolBar
    Left = 0
    Top = 427
    Width = 592
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    Caption = #39
    TabOrder = 0
    object btbtnIncluir: TBitBtn
      Left = 0
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btbtnIncluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 75
      Top = 2
      Width = 75
      Height = 31
      Hint = 'Imprimir Venda'
      Caption = 'Venda'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object btbtnCancel: TBitBtn
      Left = 150
      Top = 2
      Width = 75
      Height = 31
      Hint = 'Cancela Nota Fiscal'
      Caption = 'Cancelar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object ToolButton1: TToolButton
      Left = 225
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btbtnFechar: TBitBtn
      Left = 233
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = btbtnFecharClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
    end
    object ToolButton2: TToolButton
      Left = 308
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 316
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 324
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object spdbtnSoma: TSpeedButton
      Left = 332
      Top = 2
      Width = 34
      Height = 31
      Hint = 'Total Cadastrados'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = spdbtnSomaClick
    end
  end
  object pnlBotaoGrid: TPanel
    Left = 0
    Top = 376
    Width = 592
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 354
      Top = 0
      Width = 238
      Height = 51
      Align = alRight
      Caption = 'Pesquisar ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label13: TLabel
        Left = 19
        Top = 20
        Width = 41
        Height = 13
        Caption = 'Venda:'
      end
      object SpeedButton1: TSpeedButton
        Left = 188
        Top = 16
        Width = 29
        Height = 27
        Hint = 'Clique aqui para executar a pesquisa ...'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object edt: TEdit
        Left = 64
        Top = 21
        Width = 121
        Height = 21
        Hint = 'Digite aqui a palavra-chave da pesquisa'
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 592
    Height = 376
    ActivePage = TabSheetLista
    Align = alClient
    DockSite = True
    HotTrack = True
    TabOrder = 2
    object TabSheetLista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 584
        Height = 348
        Align = alClient
        Color = clWhite
        DataSource = dtsrcVendas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'CODCONTROL'
            Title.Caption = 'Venda'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Lookemp'
            Title.Caption = 'Empresa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookClient'
            Title.Caption = 'Cliente'
            Width = 189
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODEMP'
            Title.Caption = 'Empresa'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODCLI'
            Title.Caption = 'CNPJ CLi'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DTVENDA'
            Title.Caption = 'Dt.Venda'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Title.Caption = '% Desc.'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TOTALVENDA'
            Title.Caption = 'Total Venda'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Visible = False
          end>
      end
    end
    object TabSheetDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 2
      object Bevel1: TBevel
        Left = 0
        Top = 33
        Width = 584
        Height = 315
        Align = alClient
      end
      object Bevel2: TBevel
        Left = 0
        Top = 33
        Width = 584
        Height = 315
        Align = alClient
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 584
        Height = 33
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 6
          Top = 8
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
        object Label2: TLabel
          Left = 267
          Top = 8
          Width = 44
          Height = 13
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 62
          Top = 8
          Width = 195
          Height = 14
          BorderStyle = bsNone
          Color = clBtnFace
          DataField = 'Lookemp'
          DataSource = dtsrcVendas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 314
          Top = 8
          Width = 263
          Height = 14
          BorderStyle = bsNone
          Color = clBtnFace
          DataField = 'LookClient'
          DataSource = dtsrcVendas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 33
        Width = 584
        Height = 315
        Align = alClient
        Caption = 'Itens Lan'#231'ados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label7: TLabel
          Left = 576
          Top = 56
          Width = 30
          Height = 13
          Caption = 'QTDE'
        end
        object Label8: TLabel
          Left = 576
          Top = 128
          Width = 60
          Height = 13
          Caption = 'QTDEFINAL'
        end
        object Label9: TLabel
          Left = 576
          Top = 200
          Width = 47
          Height = 13
          Caption = 'qtdeantes'
        end
        object RxDBGrid1: TRxDBGrid
          Left = 2
          Top = 15
          Width = 580
          Height = 245
          Align = alClient
          Color = clSilver
          DataSource = dtsrcVendasItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clRed
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          FixedCols = 1
          Columns = <
            item
              Expanded = False
              FieldName = 'CODPROD'
              Title.Caption = 'C'#243'digo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LookProd'
              Title.Caption = 'Produto'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 152
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODCONTROL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODEMP'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODCLI'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Caption = 'Qtde.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUNIT'
              Title.Caption = 'Pre'#231'o Unit.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO'
              Title.Caption = '% Desc.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PFINAL'
              Title.Caption = 'Pre'#231'o L'#237'quido'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DTVENDA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end>
        end
        object Panel3: TPanel
          Left = 2
          Top = 260
          Width = 580
          Height = 53
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 1
          object Label5: TLabel
            Left = 4
            Top = 5
            Width = 25
            Height = 13
            Caption = 'OBS:'
          end
          object Label3: TLabel
            Left = 460
            Top = 5
            Width = 27
            Height = 13
            Caption = 'Total:'
          end
          object Label4: TLabel
            Left = 332
            Top = 5
            Width = 104
            Height = 13
            Caption = 'Forma de Pagamento:'
          end
          object DBMemo1: TDBMemo
            Left = 32
            Top = 6
            Width = 289
            Height = 43
            BorderStyle = bsNone
            Color = clSilver
            DataField = 'OBS'
            DataSource = dtsrcVendas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit3: TDBEdit
            Left = 472
            Top = 21
            Width = 105
            Height = 16
            BorderStyle = bsNone
            Color = clSilver
            DataField = 'TOTALVENDA'
            DataSource = dtsrcVendas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 339
            Top = 21
            Width = 105
            Height = 16
            BorderStyle = bsNone
            Color = clSilver
            DataField = 'FORMAPAG'
            DataSource = dtsrcVendas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
      end
    end
  end
  object ibdtstVendas: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    DeleteSQL.Strings = (
      'delete from TBVENDAS'
      'where'
      '  CODCONTROL = :OLD_CODCONTROL')
    InsertSQL.Strings = (
      'insert into TBVENDAS'
      
        '  (CODCONTROL, CODEMP, CODCLI, DTVENDA, STATUS, DESCONTO, TOTALV' +
        'ENDA, OBS, '
      '   FORMAPAG, FATDIAS)'
      'values'
      
        '  (:CODCONTROL, :CODEMP, :CODCLI, :DTVENDA, :STATUS, :DESCONTO, ' +
        ':TOTALVENDA, '
      '   :OBS, :FORMAPAG, :FATDIAS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODCLI,'
      '  DTVENDA,'
      '  STATUS,'
      '  DESCONTO,'
      '  TOTALVENDA,'
      '  OBS,'
      '  FORMAPAG,'
      '  FATDIAS'
      'from TBVENDAS '
      'where'
      '  CODCONTROL = :CODCONTROL')
    SelectSQL.Strings = (
      'select * from TBVENDAS'
      'order by CODCONTROL')
    ModifySQL.Strings = (
      'update TBVENDAS'
      'set'
      '  CODCONTROL = :CODCONTROL,'
      '  CODEMP = :CODEMP,'
      '  CODCLI = :CODCLI,'
      '  DTVENDA = :DTVENDA,'
      '  STATUS = :STATUS,'
      '  DESCONTO = :DESCONTO,'
      '  TOTALVENDA = :TOTALVENDA,'
      '  OBS = :OBS,'
      '  FORMAPAG = :FORMAPAG,'
      '  FATDIAS = :FATDIAS'
      'where'
      '  CODCONTROL = :OLD_CODCONTROL')
    GeneratorField.Field = 'CODCONTROL'
    GeneratorField.Generator = 'GEN_TBVENDAS_ID'
    Left = 40
    Top = 272
    object ibdtstVendasCODCONTROL: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CODCONTROL'
      Origin = 'TBVENDAS.CODCONTROL'
      Required = True
    end
    object ibdtstVendasCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = 'TBVENDAS.CODEMP'
      Size = 18
    end
    object ibdtstVendasCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = 'TBVENDAS.CODCLI'
      Size = 18
    end
    object ibdtstVendasDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = 'TBVENDAS.DTVENDA'
    end
    object ibdtstVendasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TBVENDAS.STATUS'
      Size = 10
    end
    object ibdtstVendasDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'TBVENDAS.DESCONTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstVendasLookemp: TStringField
      FieldKind = fkLookup
      FieldName = 'Lookemp'
      LookupDataSet = ibdtstEmp
      LookupKeyFields = 'CNPJ'
      LookupResultField = 'RZSOC'
      KeyFields = 'CODEMP'
      Lookup = True
    end
    object ibdtstVendasOBS: TMemoField
      DisplayWidth = 400
      FieldName = 'OBS'
      Origin = 'TBVENDAS.OBS'
      BlobType = ftMemo
      Size = 8
    end
    object ibdtstVendasLookClient: TStringField
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'LookClient'
      LookupDataSet = ibdtstClient
      LookupKeyFields = 'CNPJ'
      LookupResultField = 'NOME'
      KeyFields = 'CODCLI'
      Size = 40
      Lookup = True
    end
    object ibdtstVendasFORMAPAG: TIBStringField
      Alignment = taRightJustify
      FieldName = 'FORMAPAG'
      Origin = 'TBVENDAS.FORMAPAG'
      Size = 35
    end
    object ibdtstVendasTOTALVENDA: TIBBCDField
      FieldName = 'TOTALVENDA'
      Origin = 'TBVENDAS.TOTALVENDA'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstVendasFATDIAS: TSmallintField
      DisplayWidth = 3
      FieldName = 'FATDIAS'
      Origin = 'TBVENDAS.FATDIAS'
    end
  end
  object dtsrcVendas: TDataSource
    DataSet = ibdtstVendas
    Left = 40
    Top = 224
  end
  object ibqryTotal: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'select count(*) from TBVENDAS')
    Left = 264
    Top = 288
    object ibqryTotalCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object ibdtstEmp: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SelectSQL.Strings = (
      'select CNPJ, RZSOC from TBEMPRESA')
    Left = 304
    Top = 240
  end
  object ibdtstVendasItens: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    DeleteSQL.Strings = (
      'delete from TVENDASITENS'
      'where'
      '  CODCONTROL = :OLD_CODCONTROL and'
      '  CODPROD = :OLD_CODPROD')
    InsertSQL.Strings = (
      'insert into TVENDASITENS'
      
        '  (CODCONTROL, CODEMP, CODCLI, DTVENDA, CODPROD, QTDE, PUNIT, DE' +
        'SCONTO, '
      '   PFINAL, QTDEFINAL)'
      'values'
      
        '  (:CODCONTROL, :CODEMP, :CODCLI, :DTVENDA, :CODPROD, :QTDE, :PU' +
        'NIT, :DESCONTO, '
      '   :PFINAL, :QTDEFINAL)')
    RefreshSQL.Strings = (
      'Select '
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODCLI,'
      '  DTVENDA,'
      '  CODPROD,'
      '  QTDE,'
      '  PUNIT,'
      '  DESCONTO,'
      '  PFINAL,'
      '  QTDEFINAL'
      'from TVENDASITENS '
      'where'
      '  CODCONTROL = :CODCONTROL and'
      '  CODPROD = :CODPROD')
    SelectSQL.Strings = (
      'select * from TVENDASITENS'
      'where codcontrol = :codcontrol')
    ModifySQL.Strings = (
      'update TVENDASITENS'
      'set'
      '  CODCONTROL = :CODCONTROL,'
      '  CODEMP = :CODEMP,'
      '  CODCLI = :CODCLI,'
      '  DTVENDA = :DTVENDA,'
      '  CODPROD = :CODPROD,'
      '  QTDE = :QTDE,'
      '  PUNIT = :PUNIT,'
      '  DESCONTO = :DESCONTO,'
      '  PFINAL = :PFINAL,'
      '  QTDEFINAL = :QTDEFINAL'
      'where'
      '  CODCONTROL = :OLD_CODCONTROL and'
      '  CODPROD = :OLD_CODPROD')
    DataSource = dtsrcVendas
    Left = 184
    Top = 280
    object ibdtstVendasItensCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'TVENDASITENS.CODCONTROL'
      Required = True
    end
    object ibdtstVendasItensCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = 'TVENDASITENS.CODEMP'
      Size = 18
    end
    object ibdtstVendasItensCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = 'TVENDASITENS.CODCLI'
      Size = 18
    end
    object ibdtstVendasItensDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = 'TVENDASITENS.DTVENDA'
    end
    object ibdtstVendasItensCODPROD: TIBStringField
      FieldName = 'CODPROD'
      Origin = 'TVENDASITENS.CODPROD'
      Required = True
      Size = 10
    end
    object ibdtstVendasItensQTDE: TIntegerField
      FieldName = 'QTDE'
      Origin = 'TVENDASITENS.QTDE'
    end
    object ibdtstVendasItensPUNIT: TIBBCDField
      FieldName = 'PUNIT'
      Origin = 'TVENDASITENS.PUNIT'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstVendasItensDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'TVENDASITENS.DESCONTO'
      Precision = 18
      Size = 2
    end
    object ibdtstVendasItensPFINAL: TIBBCDField
      FieldName = 'PFINAL'
      Origin = 'TVENDASITENS.PFINAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstVendasItensLookProd: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProd'
      LookupDataSet = ibdtstProduto
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCRI'
      KeyFields = 'CODPROD'
      Lookup = True
    end
    object ibdtstVendasItensLookProdPreco: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'LookProdPreco'
      LookupDataSet = ibdtstProduto
      LookupKeyFields = 'COD'
      LookupResultField = 'PRECO'
      KeyFields = 'CODPROD'
      Lookup = True
    end
    object ibdtstVendasItensQTDEFINAL: TIntegerField
      FieldName = 'QTDEFINAL'
      Origin = 'TVENDASITENS.QTDEFINAL'
    end
    object ibdtstVendasItensLookProdQtde: TIntegerField
      FieldKind = fkLookup
      FieldName = 'LookProdQtde'
      LookupDataSet = ibdtstProduto
      LookupKeyFields = 'COD'
      LookupResultField = 'QTDE'
      KeyFields = 'CODPROD'
      Lookup = True
    end
  end
  object ibdtstClient: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    DeleteSQL.Strings = (
      'delete from TBCLIENTE'
      'where'
      '  CNPJ = :OLD_CNPJ')
    InsertSQL.Strings = (
      'insert into TBCLIENTE'
      '  (CNPJ, NOME)'
      'values'
      '  (:CNPJ, :NOME)')
    RefreshSQL.Strings = (
      'Select '
      '  CNPJ,'
      '  NOME,'
      '  INSCEST,'
      '  FONE,'
      '  ENDER,'
      '  CEP,'
      '  BAIRRO,'
      '  CIDADE,'
      '  UF,'
      '  SITE,'
      '  EMAIL'
      'from TBCLIENTE '
      'where'
      '  CNPJ = :CNPJ')
    SelectSQL.Strings = (
      'select CNPJ, NOME from TBCLIENTE'
      'order by NOME')
    ModifySQL.Strings = (
      'update TBCLIENTE'
      'set'
      '  CNPJ = :CNPJ,'
      '  NOME = :NOME'
      'where'
      '  CNPJ = :OLD_CNPJ')
    Left = 440
    Top = 256
  end
  object ibdtstProduto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    DeleteSQL.Strings = (
      'delete from TBPRODUTO'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBPRODUTO'
      '  (COD, DESCRI, QTDE, MODELO, REFERENCIA, PRECO)'
      'values'
      '  (:COD, :DESCRI, :QTDE, :MODELO, :REFERENCIA, :PRECO)')
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  DESCRI,'
      '  MODELO,'
      '  PRECO,'
      '  REFERENCIA,'
      '  SECAO,'
      '  QTDE,'
      '  UNIDADE,'
      '  ESTOQMIN,'
      '  CODGRUPO,'
      '  CUSTOMEDIO,'
      '  CODEMP'
      'from TBPRODUTO '
      'where'
      '  COD = :COD')
    SelectSQL.Strings = (
      'select COD, DESCRI, QTDE, MODELO, REFERENCIA, PRECO'
      'from TBPRODUTO'
      'order by COD')
    ModifySQL.Strings = (
      'update TBPRODUTO'
      'set'
      '  COD = :COD,'
      '  DESCRI = :DESCRI,'
      '  QTDE = :QTDE,'
      '  MODELO = :MODELO,'
      '  REFERENCIA = :REFERENCIA,'
      '  PRECO = :PRECO'
      'where'
      '  COD = :OLD_COD')
    Left = 512
    Top = 256
    object ibdtstProdutoCOD: TIBStringField
      FieldName = 'COD'
      Origin = 'TBPRODUTO.COD'
      Required = True
      Size = 10
    end
    object ibdtstProdutoQTDE: TSmallintField
      FieldName = 'QTDE'
      Origin = 'TBPRODUTO.QTDE'
    end
    object ibdtstProdutoDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = 'TBPRODUTO.DESCRI'
      Size = 50
    end
    object ibdtstProdutoMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'TBPRODUTO.MODELO'
      Size = 40
    end
    object ibdtstProdutoREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'TBPRODUTO.REFERENCIA'
      Size = 15
    end
    object ibdtstProdutoPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = 'TBPRODUTO.PRECO'
      Precision = 18
      Size = 2
    end
  end
  object dtsrcVendasItens: TDataSource
    DataSet = ibdtstVendasItens
    Left = 184
    Top = 224
  end
end
