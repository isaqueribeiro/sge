inherited frmGeContasAPagar: TfrmGeContasAPagar
  Left = 396
  Top = 216
  Caption = 'Controle de Contas A Pagar'
  ClientHeight = 561
  ClientWidth = 934
  OldCreateOrder = True
  ExplicitWidth = 950
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 557
    Width = 934
    ExplicitTop = 558
    ExplicitWidth = 934
  end
  inherited Bevel3: TBevel
    Top = 518
    Width = 934
    ExplicitTop = 519
    ExplicitWidth = 934
  end
  inherited pgcGuias: TPageControl
    Width = 934
    Height = 518
    OnChange = pgcGuiasChange
    ExplicitWidth = 934
    ExplicitHeight = 518
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 926
      ExplicitHeight = 489
      inherited Bevel4: TBevel
        Top = 423
        Width = 926
        ExplicitTop = 424
        ExplicitWidth = 926
      end
      inherited dbgDados: TDBGrid
        Width = 926
        Height = 423
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMLANC'
            Title.Caption = 'No. Lan'#231'.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PARCELA'
            Title.Alignment = taCenter
            Title.Caption = 'Parc.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEFORN'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORPAG'
            Title.Caption = 'A Pagar (R$)'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORSALDO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Saldo (R$)'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTEMISS'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVENC'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUITADO'
            Title.Caption = 'Situa'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPAG'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 427
        Width = 926
        ExplicitTop = 427
        ExplicitWidth = 926
        object lblLancamentoAberto: TLabel [0]
          Left = 2
          Top = 4
          Width = 194
          Height = 13
          Caption = '* Lan'#231'amentos a pagar em aberto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblLancamentoVencido: TLabel [1]
          Left = 2
          Top = 24
          Width = 185
          Height = 13
          Caption = '* Lan'#231'amentos a pagar vencidos'
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object Label1: TLabel [2]
          Left = 2
          Top = 44
          Width = 16
          Height = 13
          Caption = '* ?'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        inherited grpBxFiltro: TGroupBox
          Left = 328
          Width = 594
          ExplicitLeft = 328
          ExplicitWidth = 594
          DesignSize = (
            594
            54)
          inherited lbltFiltrar: TLabel
            Left = 310
            Width = 73
            Caption = 'Lan'#231'amento:'
            ExplicitLeft = 310
            ExplicitWidth = 73
          end
          object lblData: TLabel [1]
            Left = 14
            Top = 25
            Width = 70
            Height = 13
            Caption = 'Vencimento:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 392
            Width = 153
            TabOrder = 2
            ExplicitLeft = 392
            ExplicitWidth = 153
          end
          inherited btnFiltrar: TcxButton
            Left = 549
            TabOrder = 3
            ExplicitLeft = 549
          end
          object e1Data: TJvDateEdit
            Left = 88
            Top = 21
            Width = 102
            Height = 21
            Date = 40909.000000000000000000
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
            PopupColor = clBtnFace
            ShowNullDate = False
            TabOrder = 0
          end
          object e2Data: TJvDateEdit
            Left = 200
            Top = 21
            Width = 103
            Height = 21
            Date = 40909.000000000000000000
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
            PopupColor = clBtnFace
            ShowNullDate = False
            TabOrder = 1
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 926
      ExplicitHeight = 489
      inherited Bevel8: TBevel
        Top = 201
        Width = 926
        ExplicitTop = 201
        ExplicitWidth = 926
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 81
        Width = 926
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel6: TBevel [2]
        Left = 0
        Top = 339
        Width = 926
        Height = 4
        Align = alBottom
        Shape = bsSpacer
        ExplicitTop = 340
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 926
        Height = 81
        ExplicitWidth = 926
        ExplicitHeight = 81
        object lblEmpresa: TLabel [1]
          Left = 88
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblFornecedor: TLabel [2]
          Left = 423
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Fornecedor:'
          FocusControl = dbFornecedor
        end
        object lblQuitado: TLabel [3]
          Left = 775
          Top = 24
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbQuitado
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'NUMLANC'
        end
        object dbEmpresa: TDBEdit
          Left = 88
          Top = 40
          Width = 329
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clMoneyGreen
          DataField = 'NOMEEMP'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbQuitado: TDBEdit
          Left = 776
          Top = 40
          Width = 129
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'QUITADO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbFornecedor: TJvDBComboEdit
          Left = 423
          Top = 40
          Width = 348
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOMEFORN'
          DataSource = DtSrcTabela
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
          TabOrder = 2
          OnButtonClick = dbFornecedorButtonClick
        end
      end
      object GrpBxDadosValores: TGroupBox
        Left = 0
        Top = 85
        Width = 926
        Height = 116
        Align = alTop
        Caption = 'A Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblNotaFiscal: TLabel
          Left = 16
          Top = 24
          Width = 63
          Height = 13
          Caption = 'Nota Fiscal:'
          FocusControl = dbNotaFiscal
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblParcela: TLabel
          Left = 112
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Parcela:'
          FocusControl = dbParcela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEmissao: TLabel
          Left = 168
          Top = 24
          Width = 49
          Height = 13
          Caption = 'Emiss'#227'o:'
          FocusControl = dbEmissao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVencimento: TLabel
          Left = 280
          Top = 24
          Width = 70
          Height = 13
          Caption = 'Vencimento:'
          FocusControl = dbVencimento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValorAPagar: TLabel
          Left = 392
          Top = 24
          Width = 107
          Height = 13
          Caption = 'Valor A Pagar (R$):'
          FocusControl = dbValorAPagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFormaPagto: TLabel
          Left = 16
          Top = 64
          Width = 124
          Height = 13
          Caption = '&Forma de Pagamento:'
          FocusControl = dbFormaPagto
        end
        object lblCondicaoPagto: TLabel
          Left = 168
          Top = 64
          Width = 139
          Height = 13
          Caption = 'Condi'#231#227'o de Pagamento:'
          FocusControl = dbCondicaoPagto
        end
        object lblTipoDespesa: TLabel
          Left = 512
          Top = 24
          Width = 95
          Height = 13
          Caption = 'Tipo de Despesa:'
          FocusControl = dbNotaFiscal
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblSaldoAPagar: TLabel
          Left = 512
          Top = 64
          Width = 109
          Height = 13
          Caption = 'Saldo A Pagar (R$):'
          FocusControl = dbSaldoAPagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbNotaFiscal: TDBEdit
          Left = 16
          Top = 40
          Width = 89
          Height = 21
          DataField = 'NOTFISC'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbParcela: TDBEdit
          Left = 112
          Top = 40
          Width = 49
          Height = 21
          DataField = 'PARCELA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object dbValorAPagar: TDBEdit
          Left = 392
          Top = 40
          Width = 113
          Height = 21
          DataField = 'VALORPAG'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object dbFormaPagto: TDBLookupComboBox
          Left = 16
          Top = 80
          Width = 145
          Height = 21
          DataField = 'FORMA_PAGTO'
          DataSource = DtSrcTabela
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
          TabOrder = 6
        end
        object dbCondicaoPagto: TDBLookupComboBox
          Left = 168
          Top = 80
          Width = 337
          Height = 21
          DataField = 'CONDICAO_PAGTO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COND_COD'
          ListField = 'COND_DESCRICAO_FULL'
          ListSource = dtsCondicaoPagto
          ParentFont = False
          TabOrder = 7
        end
        object dbTipoDespesa: TDBLookupComboBox
          Left = 512
          Top = 40
          Width = 393
          Height = 21
          DataField = 'CODTPDESP'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'TIPODESP'
          ListSource = dtsTpDespesa
          ParentFont = False
          TabOrder = 5
        end
        object dbSaldoAPagar: TDBEdit
          Left = 512
          Top = 80
          Width = 113
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'VALORSALDO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbEmissao: TJvDBDateEdit
          Left = 168
          Top = 40
          Width = 105
          Height = 21
          DataField = 'DTEMISS'
          DataSource = DtSrcTabela
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
          TabOrder = 2
        end
        object dbVencimento: TJvDBDateEdit
          Left = 280
          Top = 40
          Width = 105
          Height = 21
          DataField = 'DTVENC'
          DataSource = DtSrcTabela
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
          TabOrder = 3
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 343
        Width = 926
        Height = 146
        ActivePage = tbsHistorico
        Align = alBottom
        TabOrder = 3
        object tbsHistorico: TTabSheet
          Caption = 'Hist'#243'rico'
          object dbObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 918
            Height = 118
            Align = alClient
            DataField = 'HISTORIC'
            DataSource = DtSrcTabela
            TabOrder = 0
          end
        end
      end
      object dbgPagamentos: TDBGrid
        Tag = 12
        Left = 0
        Top = 205
        Width = 926
        Height = 134
        TabStop = False
        Align = alClient
        DataSource = dtsPagamentos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgDadosDrawColumnCell
        OnKeyDown = dbgDadosKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SEQ'
            Title.Alignment = taCenter
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_PAGTO'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORMA_PAGTO_DESC'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_BAIXA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_CHEQUE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCO_NOME'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOCUMENTO_BAIXA'
            Width = 120
            Visible = True
          end>
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 522
    Width = 934
    ExplicitTop = 522
    ExplicitWidth = 934
    inherited Bevel2: TBevel
      Left = 84
      ExplicitLeft = 84
    end
    inherited bvlTool1: TBevel
      Left = 313
      ExplicitLeft = 313
    end
    inherited bvlTool2: TBevel
      Left = 467
      ExplicitLeft = 467
    end
    inherited bvlTool3: TBevel
      Left = 851
      ExplicitLeft = 851
    end
    inherited bvlTool4: TBevel
      Left = 930
      ExplicitLeft = 930
    end
    object Bevel7: TBevel [5]
      Left = 846
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object Bevel9: TBevel [6]
      Left = 0
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
      ExplicitTop = 2
    end
    inherited btbtnIncluir: TcxButton
      Left = 88
      TabOrder = 1
      ExplicitLeft = 88
    end
    inherited btbtnAlterar: TcxButton
      Left = 163
      TabOrder = 2
      ExplicitLeft = 163
    end
    inherited btbtnExcluir: TcxButton
      Left = 238
      TabOrder = 3
      ExplicitLeft = 238
    end
    inherited btbtnCancelar: TcxButton
      Left = 317
      TabOrder = 5
      ExplicitLeft = 317
    end
    inherited btbtnSalvar: TcxButton
      Left = 392
      TabOrder = 4
      ExplicitLeft = 392
    end
    inherited btbtnLista: TcxButton
      Left = 471
      TabOrder = 6
      Visible = True
      ExplicitLeft = 471
    end
    inherited btbtnFechar: TcxButton
      Left = 855
      TabOrder = 9
      ExplicitLeft = 855
    end
    inherited btbtnSelecionar: TcxButton
      Left = 731
      TabOrder = 8
      ExplicitLeft = 731
    end
    object btbtnEfetuarPagto: TcxButton
      Tag = 11
      Left = 611
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Efetuar Pagamento'
      Align = alRight
      Caption = 'E&fetuar Pagto.'
      Enabled = False
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btbtnEfetuarPagtoClick
    end
    object btbtnIncluirLote: TcxButton
      Tag = 1
      Left = 4
      Top = 0
      Width = 80
      Height = 35
      Hint = 'Incluir Lote de Parcelas'
      Align = alLeft
      Caption = 'Incluir &Lote'
      OptionsImage.ImageIndex = 8
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btbtnIncluirLoteClick
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.Empresa'
      '  , p.Parcela'
      '  , p.Codforn'
      '  , p.Nomeemp'
      '  , f.Nomeforn'
      '  , f.Cnpj'
      '  , p.Notfisc'
      '  , p.Tippag'
      '  , p.Dtemiss'
      '  , p.Dtvenc'
      '  , p.Dtpag'
      '  , p.Valorpag'
      '  , p.ValorSaldo'
      '  , p.Banco'
      '  , b.Bco_nome'
      '  , p.Numchq'
      '  , p.Historic'
      '  , p.Forma_pagto'
      '  , p.Condicao_pagto'
      '  , Case when p.Quitado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , p.Docbaix'
      '  , p.Quitado'
      '  , p.Codtpdesp'
      '  , p.Lote'
      'from TBCONTPAG p'
      '  left join TBFORNECEDOR f on (f.Codforn = p.Codforn)'
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)')
    GeneratorField.Field = 'NUMLANC'
    GeneratorField.Generator = 'GEN_CONTAPAG_NUM_2013'
    Top = 72
    object IbDtstTabelaANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTPAG.ANOLANC'
      Required = True
    end
    object IbDtstTabelaNUMLANC: TIntegerField
      DisplayLabel = 'No. Lan'#231'amento'
      FieldName = 'NUMLANC'
      Origin = 'TBCONTPAG.NUMLANC'
    end
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = '"TBCONTPAG"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 18
    end
    object IbDtstTabelaNOMEEMP: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NOMEEMP'
      Origin = '"TBCONTPAG"."NOMEEMP"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object IbDtstTabelaPARCELA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      Origin = 'TBCONTPAG.PARCELA'
      DisplayFormat = '00'
    end
    object IbDtstTabelaCODFORN: TSmallintField
      DisplayLabel = 'Fornecedor'
      FieldName = 'CODFORN'
      Origin = 'TBCONTPAG.CODFORN'
      Required = True
    end
    object IbDtstTabelaNOMEFORN: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEFORN'
      Origin = 'TBFORNECEDOR.NOMEFORN'
      Size = 60
    end
    object IbDtstTabelaCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBFORNECEDOR.CNPJ'
      Size = 18
    end
    object IbDtstTabelaNOTFISC: TIBStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NOTFISC'
      Origin = 'TBCONTPAG.NOTFISC'
      Size = 15
    end
    object IbDtstTabelaTIPPAG: TIBStringField
      DisplayLabel = 'Tipo de Pagamento'
      FieldName = 'TIPPAG'
      Origin = 'TBCONTPAG.TIPPAG'
      Size = 35
    end
    object IbDtstTabelaDTEMISS: TDateField
      Alignment = taCenter
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DTEMISS'
      Origin = 'TBCONTPAG.DTEMISS'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1; '
    end
    object IbDtstTabelaDTVENC: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'DTVENC'
      Origin = 'TBCONTPAG.DTVENC'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1; '
    end
    object IbDtstTabelaDTPAG: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Pagto.'
      FieldName = 'DTPAG'
      Origin = 'TBCONTPAG.DTPAG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaVALORPAG: TIBBCDField
      DisplayLabel = 'Valor A Pagar (R$)'
      FieldName = 'VALORPAG'
      Origin = 'TBCONTPAG.VALORPAG'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALORSALDO: TIBBCDField
      DisplayLabel = 'Saldo A Pagar (R$)'
      FieldName = 'VALORSALDO'
      Origin = '"TBCONTPAG"."VALORSALDO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaCODTPDESP: TSmallintField
      DisplayLabel = 'Tipo de Despesa'
      FieldName = 'CODTPDESP'
      Origin = 'TBCONTPAG.CODTPDESP'
      Required = True
    end
    object IbDtstTabelaBANCO: TSmallintField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Origin = 'TBCONTPAG.BANCO'
    end
    object IbDtstTabelaBCO_NOME: TIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'BCO_NOME'
      Origin = 'TBBANCO_BOLETO.BCO_NOME'
      Size = 50
    end
    object IbDtstTabelaNUMCHQ: TIBStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUMCHQ'
      Origin = 'TBCONTPAG.NUMCHQ'
      Size = 10
    end
    object IbDtstTabelaPAGO_: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Pago?'
      FieldName = 'PAGO_'
      FixedChar = True
      Size = 1
    end
    object IbDtstTabelaDOCBAIX: TIBStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCBAIX'
      Origin = 'TBCONTPAG.DOCBAIX'
      Size = 15
    end
    object IbDtstTabelaHISTORIC: TMemoField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORIC'
      Origin = 'TBCONTPAG.HISTORIC'
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaFORMA_PAGTO: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCONTPAG.FORMA_PAGTO'
    end
    object IbDtstTabelaCONDICAO_PAGTO: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAO_PAGTO'
      Origin = 'TBCONTPAG.CONDICAO_PAGTO'
    end
    object IbDtstTabelaQUITADO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'QUITADO'
      Origin = 'TBCONTPAG.QUITADO'
      Required = True
      OnGetText = IbDtstTabelaQUITADOGetText
    end
    object IbDtstTabelaLOTE: TIBStringField
      FieldName = 'LOTE'
      Origin = '"TBCONTPAG"."LOTE"'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
  end
  inherited DtSrcTabela: TDataSource
    Top = 72
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANOLANC,'
      '  NUMLANC,'
      '  EMPRESA,'
      '  CODFORN,'
      '  PARCELA,'
      '  TIPPAG,'
      '  HISTORIC,'
      '  NOTFISC,'
      '  DTEMISS,'
      '  DTVENC,'
      '  DTPAG,'
      '  DOCBAIX,'
      '  VALORPAG,'
      '  VALORMULTA,'
      '  VALORPAGTOT,'
      '  VALORSALDO,'
      '  NOMEEMP,'
      '  TIPOCATEG,'
      '  BANCO,'
      '  NUMCHQ,'
      '  ANOCOMPRA,'
      '  NUMCOMPRA,'
      '  FORMA_PAGTO,'
      '  CONDICAO_PAGTO,'
      '  QUITADO,'
      '  CODTPDESP,'
      '  SITUACAO,'
      '  LOTE'
      'from TBCONTPAG '
      'where'
      '  ANOLANC = :ANOLANC and'
      '  NUMLANC = :NUMLANC')
    ModifySQL.Strings = (
      'update TBCONTPAG'
      'set'
      '  ANOLANC = :ANOLANC,'
      '  BANCO = :BANCO,'
      '  CODFORN = :CODFORN,'
      '  CODTPDESP = :CODTPDESP,'
      '  CONDICAO_PAGTO = :CONDICAO_PAGTO,'
      '  DOCBAIX = :DOCBAIX,'
      '  DTEMISS = :DTEMISS,'
      '  DTPAG = :DTPAG,'
      '  DTVENC = :DTVENC,'
      '  EMPRESA = :EMPRESA,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  HISTORIC = :HISTORIC,'
      '  LOTE = :LOTE,'
      '  NOMEEMP = :NOMEEMP,'
      '  NOTFISC = :NOTFISC,'
      '  NUMCHQ = :NUMCHQ,'
      '  NUMLANC = :NUMLANC,'
      '  PARCELA = :PARCELA,'
      '  QUITADO = :QUITADO,'
      '  TIPPAG = :TIPPAG,'
      '  VALORPAG = :VALORPAG,'
      '  VALORSALDO = :VALORSALDO'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      'insert into TBCONTPAG'
      
        '  (ANOLANC, BANCO, CODFORN, CODTPDESP, CONDICAO_PAGTO, DOCBAIX, ' +
        'DTEMISS, '
      
        '   DTPAG, DTVENC, EMPRESA, FORMA_PAGTO, HISTORIC, LOTE, NOMEEMP,' +
        ' NOTFISC, '
      
        '   NUMCHQ, NUMLANC, PARCELA, QUITADO, TIPPAG, VALORPAG, VALORSAL' +
        'DO)'
      'values'
      
        '  (:ANOLANC, :BANCO, :CODFORN, :CODTPDESP, :CONDICAO_PAGTO, :DOC' +
        'BAIX, :DTEMISS, '
      
        '   :DTPAG, :DTVENC, :EMPRESA, :FORMA_PAGTO, :HISTORIC, :LOTE, :N' +
        'OMEEMP, '
      
        '   :NOTFISC, :NUMCHQ, :NUMLANC, :PARCELA, :QUITADO, :TIPPAG, :VA' +
        'LORPAG, '
      '   :VALORSALDO)')
    DeleteSQL.Strings = (
      'delete from TBCONTPAG'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC')
    Top = 72
  end
  inherited ImgList: TImageList
    Top = 72
    Bitmap = {
      494C01012B002C00480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D9D8008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000A6A6A9000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F5F5F500F9F9F900F8F8F800F5F5F500F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000080808000808080000000000000000000000000000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400CCCBCA00D5D4D400DCDBDB00E1E1E000E7E7E600EBEBEA00ECECEB00ECEB
      EB00EAE9E900F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CCCBCA00DBDADA00E9E2DF00BA998C00BD9D9000F6F3F200EDEDEC00ECEB
      EB00EAE9E900F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000008080800080808000808080008080800000000000000000000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400C6C4C200E9E9E900EDEDED00F0F0F000F4F4F400F6F6F600F6F6F600F6F6
      F600E6E6E600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CAC8C600F0ECEA00BB998B00975F4A0098614C00D1B9B000F9F9F900F6F6
      F600E6E6E600F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      00008080800080808000FFFFFF00FFFFFF008080800080808000D0C0C0000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400C2BFBC00E5E4E300E9E9E900EDEDED00F2F2F200F4F4F400F5F5F500F4F4
      F400E2E2E100F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400D1CFCD00E9E1DE00955D4800965F490097604B00A4736100FAF9F800F4F4
      F400E2E2E100F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000080808000FFFFFF00FFFFFF0000000000FFFFFF0080808000808080000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400BFBBB800E1DFDD00E5E5E400EAEAEA00EFEFEF00F2F2F200F2F2F200F2F2
      F200DEDDDC00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400E1E0DE00AA7F6E00945C4700E2D4CF00A778670097604B00D5BFB700F6F6
      F600DEDDDC00F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00808080008080
      80000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400BCB7B200DCD8D500DFDCDA00E3E1E000E8E8E800ECECEC00EDEDED00EDED
      ED00D6D5D400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CDC9C500DDCFC900C8AEA300EEEEED00D5C1BA00965E4900A5766400F8F8
      F800D6D5D500F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      80008080800000000000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D7D1CD00D9D4D000DBD7D400DFDDDB00E3E2E100E6E6E500E8E8
      E800CDCDCC00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00DDD9D500E5E2DF00DCD8D500F4F3F200A1715E00945C4700D6C3
      BC00DCDCDB00F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008080800080808000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D6D1CD00DAD5D200DEDBD800E1DFDD00E4E3
      E200C8C7C600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D6D1CD00E6E2E000CFB8AF00925A4500A577
      6500E8E7E700F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000008080800080808000808080008080800080808000808080008080
      8000FFFFFF0080808000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D5CFCB00D5CFCB00D8D3D000DCD8D500DFDD
      DB00C5C3C100F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D5CFCB00D6D0CC00F1EEED009D6A5700925A
      4400D0BFB900F6F6F6008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000008080800000000000000000000000000000000000808080008080
      80000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00BAB4AF00BDB9
      B400C1BEBB00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00D0CCC900C0A79D00AB86
      7700E4DFDC00F5F5F5008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000080808000808080008080800000000000808080000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F8F8F800F9F9
      F900F6F6F600F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E5E1008080
      8000808080008080800080808000000000000000000000000000808080008080
      80008080800080808000D6DAD6000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCE3E100808080008080800080808000D8DDD9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006666
      6600666666006666660066666600666666006666660066666600666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000000000000000000006666
      6600DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00808080000000
      0000000000000000000000000000000000000000000000000000D6D9D8006851
      3A00605040006048300070504000706050007050400060483000604830006048
      30006048300060483000A6A6A900000000000000000062626200808080000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800062626200000000000000000000000000000000006666
      6600DFFBFD0083838300838383008383830083838300DFFBFD00666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000DBDBDB0083838300838383008383830083838300DBDBDB00808080000000
      0000000000000000000000000000000000000000000000000000C0A8A000F0F0
      F000E0D8D000E0D0C000E0C8C0009090B000D0C0B000E0B8A000D0B0A000D0B0
      A000D0A89000D0A0900060483000000000000000000062626200808080000000
      0000000000008080800000000000000000008080800000000000808080000000
      0000808080008080800062626200000000000000000000000000000000006666
      66000000F7000000F7000000F7000000F7000000F7000000F700666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000C0A8A000FFF0
      F000F0F0F000F0E8E0003050C0001038B0007078C000E0D0D000F0D0C000E0D0
      C000E0C8B000D0A8900060483000000000000000000062626200808080000000
      0000000000000000000000000000808080000000000080808000000000008080
      8000000000008080800062626200000000000000000000000000000000006666
      66000000F700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000F700666666000000
      0000666666006666660066666600666666000000000000000000000000008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080000000
      0000808080008080800080808000808080000000000000000000C0A8A000FFF0
      F000D0D0E0003050C0003058F0002048E0001038B000A098C000F0D0C000F0D0
      C000E0C8B000D0A8900060483000000000000000000062626200808080000000
      0000000000000000000000000000000000008080800000000000808080000000
      0000808080008080800062626200000000000000000000000000000000006666
      66000000F7000000F7000000F7000000F7000000F7000000F700666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000C0B0A000FFF8
      F0002040C0003058F0006080FF005078F0004060F0002040B000D0C0C000F0D8
      D000E0C8C000D0B0A00060483000000000000000000062626200000000008080
      8000808080008080800080808000808080000000000000000000000000008080
      8000000000008080800062626200000000000000000000000000000000006666
      6600DFFBFD008383830083838300DFFBFD00DFFBFD00DFFBFD00666666000000
      0000000000004D4D4D004D4D4D00000000000000000000000000000000008080
      8000DBDBDB008383830083838300DBDBDB00DBDBDB00DBDBDB00808080000000
      0000000000008080800080808000000000000000000000000000C0B0A000FFF8
      F00080A0FF008098FF008090F000D0D0E0008098F0004060E0004058B000F0D8
      D000F0D8D000D0B8A00060504000000000000000000062626200000000008080
      8000808080000000000000000000808080008080800080808000000000000000
      0000000000000000000062626200000000000000000000000000000000006666
      6600DFFBFD00DFFBFD00DFFBFD00DFFBFD006666660066666600666666000000
      00004D4D4D004D4D4D004D4D4D004D4D4D000000000000000000000000008080
      8000DBDBDB00DBDBDB00DBDBDB00DBDBDB008080800080808000808080000000
      0000808080008080800080808000808080000000000000000000D0B0A000FFF8
      FF00E0E8FF00C0C8F000F0F0F000F0F0E000E0D8E0008090F0003058E0005068
      B000F0E0D000E0C8B00070584000000000000000000062626200000000008080
      8000000000000000000000000000000000008080800080808000808080008080
      8000808080000000000062626200000000000000000000000000000000006666
      6600DFFBFD00DFFBFD00DFFBFD00DFFBFD006666660066666600000000000000
      0000000000004D4D4D004D4D4D00000000000000000000000000000000008080
      8000DBDBDB00DBDBDB00DBDBDB00DBDBDB008080800080808000000000000000
      0000000000008080800080808000000000000000000000000000D0B8A000FFFF
      FF00FFF8FF00FFF8F000FFF8F000FFF0F000F0F0E000F0E0E0007088F0002050
      D0009090C000E0D0C00080706000000000000000000062626200000000008080
      8000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800062626200000000000000000000000000000000006666
      6600666666006666660066666600666666006666660000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000000000000000000008080
      8000808080008080800080808000808080008080800000000000000000000000
      0000000000008080800080808000000000000000000000000000D0B8B000FFFF
      FF00FFFFFF00FFF8FF00FFF8F000FFF8F000F0F0F000F0E0E000F0E8E0008090
      F0002048D000A098C000A0908000000000000000000062626200000000008080
      8000808080000000000000000000808080008080800080808000808080008080
      8000808080008080800062626200000000000000000083000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000D0C0B000FFFF
      FF00FFFFFF0080A0B000608890006088900060789000607880007080900090A0
      B00090A0F0003050D000B0989000000000000000000062626200000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800062626200000000000000000083000000830000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0C0B000FFFF
      FF00FFFFFF0080A8B00090D8E00090E8F00080D8F00060C8E0005098B0007080
      9000F0E8E000E0D8D000A0989000000000000000000062626200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000062626200000000000000000083000000830000008300
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000D1C2B300FFFF
      FF00FFFFFF00F0F8FF0080A8B000A0A8A0009586770080C8D00050708000F0F0
      F000F0E0E000F0E0E000807060000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000083000000830000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E5E100D1C2
      B300D0C0B000D0C0B00070A8B000A0E8F000A0E8F00090D0E00040687000C0A8
      A000C0A8A000C0A89000D6DAD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000000000000000
      00000000000000000000DCE3E10080B0C00080A0B0007090A000D8DDD9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002D2D2D002D2D2D002D2D
      2D002D2D2D002D2D2D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080685000203040002030400020304000203040002030
      4000203040002030400020304000203040000000000000000000000000000000
      0000000000000000000000000000000000002D2D2D00DDDDDD00DDDDDD00CEC3
      B200BCA87B00BCA87B002D2D2D00000000000000000000000000000000000000
      0000000000000000000000000000000000002D2D2D00DDDDDD00DDDDDD008080
      80008080800080808000808080000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000060809000506070004050
      6000304050002030400090706000F0E0D000B0A09000B0A09000B0A09000B0A0
      9000B0A09000B0A09000B0A0900020304000000000007F5B00007F5B00000000
      00000000000000000000000000002D2D2D00E9DDB700FFFDF300FFFFFF00FBF0
      D700E1CE9B00B0995A00756923002D2D2D000000000080808000808080000000
      0000000000000000000000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C0014BB180014BB180014BB180014BB180014BB180014BB180014BB180014BB
      180014BB180014BB180062626200000000007080900020B8F0000090D0000090
      D0000090D0000090D00090786000F0E8E000F0D8D000E0D0C000E0C8C000D0C0
      B000D0B8B000D0B8B000B0A09000203040007F5B0000EFAD0000EFAD00007F5B
      00000000000000000000000000002D2D2D00E9DDB400F9F4E800FFFFFF00F0E4
      CC00D5C19300A5905400756923002D2D2D008080800080808000808080008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C00BB350C0014BB180020D7240020D7240019C21D0020D7240019C21D0020D7
      240019C21D0014BB180062626200000000007088900070C8F00010B8F00010B0
      F00000A8E0000098D000A0807000F0F0F000C0B0A000C0B0A000C0A8A000B0A0
      9000D0C0B000B0A09000B0A09000203040007F5B0000FFFF0000EFAD0000EFAD
      00007F5B000000000000000000002D2D2D00E8DAB200F7F1E200FFFFFF00F1E5
      D000D7C393009F8B4F00726622002D2D2D008080800000000000808080008080
      8000808080000000000000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C00BB350C00BB350C00BB350C0014BB180020D7240019C21D0020D7240019C2
      1D0020D7240014BB180062626200000000008088900070D0F00030C0F00010B8
      F00000A8F00000A0E000A0888000FFF8FF00F0F0F000F0E8E000F0D8D000E0D0
      C00070585000605040005048400040404000000000007F5B0000FFFF0000EFAD
      0000EFAD00007F5B0000000000002D2D2D00E6DAB100F9F4E600FFFFFF00F0E5
      CE00D6C49300A68F5400726521002D2D2D000000000080808000000000008080
      8000808080008080800000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C00BB350C00BB350C00BB350C00BB350C0014BB180020D7240019C21D0020D7
      240019C21D0014BB180062626200000000008090A00080D8F00040C8F00030C0
      F00010B8F00000A0E000B0908000FFFFFF00C0B0A000C0B0A000C0A8A000F0E0
      D00080605000D0C8C000605040000000000000000000000000007F5B0000FFFF
      0000F6CF6D007F5B0000000000002D2D2D00F5EACA00FCF8EE00FFFFFF00EEE2
      CC00D5C19300A88F5600796C25002D2D2D000000000000000000808080000000
      0000000000008080800000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200F1CF7C00EEAA
      0400EEAA0400EEAA0400EEAA0400EEAA0400BF8A0800BF8A080020D7240019C2
      1D0020D7240014BB180062626200000000008098A00090E0F00060D8F00050C8
      F00030C0F00010B0F000B0989000FFFFFF00FFFFFF00FFF8FF00F0F0F000F0E8
      E000806850008060500000000000000000000000000000000000000000007F5B
      00007F5B0000F6CF6D00D9A77D007F5B00007F5B00007F5B00007F5B00002D2D
      2D002D2D2D002D2D2D00796C25002D2D2D000000000000000000000000008080
      80008080800000000000808080007F5B00008080800080808000808080008080
      8000808080008080800080808000808080000000000062626200F1CF7C00EEAA
      0400EEAA0400A9FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400BF8A0800BF8A
      0800BF8A080020D7240062626200000000008098A000A0E8F00080E0F00070D8
      F00050D0F00010B0F000B0A09000B0989000B0908000A0888000A08070009078
      6000907060000000000000000000000000000000000000000000000000000000
      000000000000D9A77D007F5B0000679A9A00ABAB6E00A8D7CE00ECE79D007F5B
      0000BDA16600574507002D2D2D002D2D2D000000000000000000000000000000
      0000000000008080800080808000679A9A000000000000000000000000008080
      8000000000008080800080808000808080000000000062626200F1CF7C00EEAA
      0400A9FFFF0000FFFF0000FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400BF8A0800626262000000000090A0A000B0F0FF00A0E8FF0090E0
      F00070D0F00010A0D00010A0D00010A0D0001098D0000090D0000090D0000090
      D000303840000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000AAFFFF00AAFFFF0078ABAB00C0F0EC00CCFFFC00FFFF
      BF007F5B0000B1975D002D2D2D00000000000000000000000000000000000000
      00000000000080808000000000000000000078ABAB0000000000000000000000
      0000000000000000000080808000000000000000000062626200F1CF7C00EEAA
      0400A9FFFF0000FFFF0000FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400EEAA0400626262000000000090A0B000B0F0FF00A0F0FF006080
      9000607080005070800050687000506870005060700040587000207090000090
      D000404860000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000FFFF9900AAFEFE00AAFFFF0078ABAB0078ABAB0078AB
      AB007F5B00002D2D2D0000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000078ABAB0078ABAB0078AB
      AB00808080008080800000000000000000000000000062626200F1CF7C00EEAA
      0400EEAA0400A9FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400EEAA0400626262000000000090A8B000B0F0FF00B0F0FF006088
      900090C8D00090E8F00080D8E00060C8E0005098B000405860002080A0000090
      D000505870000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00FFFF
      99007F5B00000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000062626200F1CF7C00EEAA
      0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400EEAA0400626262000000000090A8B000B0F0F000B0F0FF00A0F0
      F0007098A000A0F0F0006D7F850080C8D000507080003060800060C0F00020B8
      F000506070000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000FFFF9900AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFF
      FF007F5B00000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000062626200F1CF7C00F1CF
      7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF
      7C00F1CF7C00F1CF7C0062626200000000000000000090A8B00090A8B00090A8
      B0006090A000A0E8F000A0E8F00090D8E0004068700070889000808890007088
      9000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F5B0000FFFF9900AAFFFF00FFFF9900AAFFFF007F5B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000007F5B
      00000000000000000000000000000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000000000000000000000000
      00000000000080B0C00080B0C00080A0B0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F5B00007F5B00007F5B00007F5B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099939D0020304000938B9300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000096969600333333008E8E8E00000000000000000000000000000000000000
      000000000000B0A0900060483000604830006048300060483000604830006048
      3000604830006048300060483000705040000000000000000000000000000000
      0000000000009C9C9C0043434300434343004343430043434300434343004343
      43004343430043434300434343004E4E4E0000000000B0A09000604830006048
      3000604830006048300060483000604830006048300060483000604830005048
      4000305060004078C000304860009C989D00000000009C9C9C00434343004343
      4300434343004343430043434300434343004343430043434300434343004646
      460051515100888888004C4C4C00999999000000000000000000000000000000
      000000000000C0A8A000FFF0F000E0E0E000E0E0D00090584000F0F0E000E0C8
      C000E0C8B000E0C0B000E0B8A000705040000000000000000000000000000000
      000000000000A8A8A800F1F1F100E0E0E000DBDBDB0056565600EBEBEB00C8C8
      C800C3C3C300BEBEBE00B4B4B4004E4E4E0000000000B0A09000FFFFFF00B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000908880003050
      70003080D0004098E00050B0F00050687000000000009C9C9C00FFFFFF009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00868686005656
      560090909000A4A4A400B9B9B900686868007088900060809000607880006088
      90006090A000C0B0A000FFFFFF00FFF8F000E0D8D000A0604000FFF0F000FFE8
      E000FFE8D000F0E0D000D0B8A000705040008888880081818100787878008686
      860090909000ACACAC00FFFFFF00F6F6F600D6D6D6005C5C5C00F1F1F100E7E7
      E700E3E3E300DCDCDC00B3B3B3004E4E4E0000000000B0A09000FFFFFF00FFFF
      FF00FFF8FF00F0F0F000D0D8D000909890007068600060686000505860004070
      900040A0E00060C8FF007090A000B7B3B500000000009C9C9C00FFFFFF00FFFF
      FF00FAFAFA00F0F0F000D4D4D400949494006666660064646400595959007474
      7400A9A9A900CECECE0091919100B4B4B4007088900090A0B00070B0D0000090
      D00030B0E000D0B8A000FFFFFF00B0887000E0E0E000A0705000FFF8F000C090
      8000C0887000B0786000D0B8A0007050400088888800A3A3A300B3B3B3009494
      9400B1B1B100B3B3B300FFFFFF0084848400E0E0E0006B6B6B00F6F6F6009090
      90008686860076767600B3B3B3004E4E4E0000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00E0E0E00090909000B0A8A000D0C0B000D0B0A000807870005058
      50006090B0007098B000A6AAAE0000000000000000009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00E0E0E00090909000A6A6A600BCBCBC00AEAEAE00767676005454
      5400949494009B9B9B00AAAAAA00000000008088900080C0D00090A8B00080E0
      FF0050B8E000D0B8A000FFFFFF00FFFFFF00E0E0E000A0786000FFF8F000FFF0
      F000FFF0E000FFE8E000D0B8A0007050400089898900BEBEBE00A8A8A800DFDF
      DF00B9B9B900B3B3B300FFFFFF00FFFFFF00E0E0E00074747400F6F6F600F1F1
      F100ECECEC00E7E7E700B3B3B3004E4E4E0000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00B0B0B000C0B8B000FFF0E000FFE8E000F0D8C000F0D0B0008078
      7000988D9200A8ADB1000000000000000000000000009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00B0B0B000B6B6B600ECECEC00E7E7E700D3D3D300C9C9C9007676
      76008F8F8F00ADADAD0000000000000000008090A00080D0F00090A8B00090C0
      D00060C0E000D0B8A000FFFFFF00B0989000E0E0E000B0806000FFF8FF00C0A0
      9000C0988000C0887000D0B8B0007050400093939300D1D1D100A8A8A800C0C0
      C000C0C0C000B3B3B300FFFFFF0098989800E0E0E0007B7B7B00FAFAFA009E9E
      9E009494940086868600B8B8B8004E4E4E0000000000C0A89000FFFFFF00FFFF
      FF00FFFFFF00A0989000F0E8E000FFF8F000FFF0F000FFE8E000F0D8D000D0B0
      A0006267600000000000000000000000000000000000A3A3A300FFFFFF00FFFF
      FF00FFFFFF0096969600E6E6E600F6F6F600F1F1F100E7E7E700D8D8D800AEAE
      AE00646464000000000000000000000000008090A00080D8F00080C8E00090A8
      B00060C0E000D0B8A000FFFFFF00FFFFFF00FFFFFF00B0806000FFFFFF00FFF8
      FF00FFF8F000FFF8F000FFF0F0007050400093939300D6D6D600C8C8C800A8A8
      A800C0C0C000B3B3B300FFFFFF00FFFFFF00FFFFFF007B7B7B00FFFFFF00FAFA
      FA00F6F6F600F6F6F600F1F1F1004E4E4E0000000000C0A8A000FFFFFF00FFFF
      FF00FFFFFF00A0A09000F0E8E000FFFFFF00FFF8F000FFF0F000FFE8E000E0C0
      B000716F6F0000000000000000000000000000000000A8A8A800FFFFFF00FFFF
      FF00FFFFFF009B9B9B00E6E6E600FFFFFF00F6F6F600F1F1F100E7E7E700BEBE
      BE006F6F6F000000000000000000000000008098A00090E0F00090E0FF0090A8
      B00090C0D000E0A08000F0A89000F0A08000F0987000E0906000E0885000E078
      4000E0784000E0704000E0704000D060300098989800DCDCDC00E1E1E100A8A8
      A800C0C0C0009C9C9C00A8A8A8009E9E9E009494940089898900808080007171
      7100717171006C6C6C006C6C6C005C5C5C0000000000C0B0A000FFFFFF00FFFF
      FF00FFFFFF00C0C8C000C0C0C000FFFFFF00FFFFFF00FFF8F000FFF0E000B0A0
      9000A5A0A00000000000000000000000000000000000ACACAC00FFFFFF00FFFF
      FF00FFFFFF00C4C4C400C0C0C000FFFFFF00FFFFFF00F6F6F600ECECEC009C9C
      9C00A0A0A0000000000000000000000000008098A00090E0F000A0E8FF0080C8
      E00080C0D000D0987000FFC0A000FFB8A000FFB89000FFB09000FFA88000FFA8
      8000F0A07000F0987000F0987000D070400098989800DCDCDC00E7E7E700C8C8
      C800BEBEBE0091919100BCBCBC00B7B7B700B3B3B300AEAEAE00A4A4A400A4A4
      A4009999990094949400949494006B6B6B0000000000D0B0A000FFFFFF00FFFF
      FF00FFFFFF00F0F8FF00C0B8B000C0C0C000F0E8E000F0E8E000B0B0A0007070
      60000000000000000000000000000000000000000000AEAEAE00FFFFFF00FFFF
      FF00FFFFFF00F9F9F900B6B6B600C0C0C000E6E6E600E6E6E600ABABAB006B6B
      6B000000000000000000000000000000000090A0A000A0E8F000A0E8FF00A0E8
      FF0090C8D000C0907000D0907000D0907000E0987000D0907000E0987000E090
      6000E0885000E0805000E0784000E07040009E9E9E00E3E3E300E7E7E700E7E7
      E700C4C4C4008B8B8B008C8C8C008C8C8C00939393008C8C8C00939393008989
      8900808080007B7B7B00717171006C6C6C0000000000D0B8A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0F8FF00C0C8C000A0A0900090908000909090006050
      40000000000000000000000000000000000000000000B3B3B300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F900C4C4C4009B9B9B008B8B8B00909090004C4C
      4C000000000000000000000000000000000090A0B000A0E8F000A0F0FF00A0E8
      FF00A0E8FF0080D0F00070C8F00070C8F00070C8F00070C8F00070C8F00070C8
      F00090B0C000000000000000000000000000A3A3A300E3E3E300ECECEC00E7E7
      E700E7E7E700D1D1D100CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00B1B1B10000000000000000000000000000000000D0B8B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A0900060483000604830006048
      30000000000000000000000000000000000000000000B8B8B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C0043434300434343004343
      43000000000000000000000000000000000090A0B000A0F0F000B0F0F000A0F0
      FF00A0E8FF00A0E8FF0070D8FF0090A0A0008098A0008098A0008090A0008090
      900070889000000000000000000000000000A3A3A300E8E8E800E9E9E900ECEC
      EC00E7E7E700E7E7E700D9D9D9009E9E9E009898980098989800939393008E8E
      8E008888880000000000000000000000000000000000D0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C000604830000000
      00000000000000000000000000000000000000000000BCBCBC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6C600434343000000
      00000000000000000000000000000000000090A8B000A0D0E000B0F0F000B0F0
      F000A0F0FF00A0E8FF0090A0B000B1C3C7000000000000000000000000000000
      000000000000906850009068500090685000A8A8A800D0D0D000E9E9E900E9E9
      E900ECECEC00E7E7E700A3A3A300C2C2C2000000000000000000000000000000
      00000000000064646400646464006464640000000000E0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000000000000000
      00000000000000000000000000000000000000000000BEBEBE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A80043434300000000000000
      000000000000000000000000000000000000C8CDD00090A8B00090A8B00090A8
      B00090A8B00090A8B000B4BFC400000000000000000000000000000000000000
      000000000000CDBEBC009068500090685000CDCDCD00A8A8A800A8A8A800A8A8
      A800A8A8A800A8A8A800BFBFBF00000000000000000000000000000000000000
      000000000000BEBEBE00646464006464640000000000E0C0B000E0C0B000E0C0
      B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A00000000000000000000000
      00000000000000000000000000000000000000000000BEBEBE00BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000090786000C3B2A9000000
      0000DED8D800A0908000CDC3BC00907860000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300B1B1B1000000
      0000D8D8D8008C8C8C00C1C1C100737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2CDC700A0908000A088
      8000B0988000C1B7AF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBCB008C8C8C008888
      880093939300B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000005080
      5000407040003050300020382000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006868
      680058585800404040002C2C2C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005090
      500060A860005088500030503000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007070
      7000848484006C6C6C0040404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000070A8800060A070006098
      600070B070005098500040704000305030002038200000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00808080007C7C
      7C00909090007474740058585800404040002C2C2C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080B09000A0D8A00070C0
      800070B8700060A0600050905000408840003050300000000000000000000000
      0000807060008070600080706000807060000000000098989800BCBCBC009898
      9800949494008080800070707000646464004040400000000000000000000000
      000070707000707070007070700070707000000000006078D0001038B0001038
      B0001030B0001028A0001028A000002090000020900000000000000000000000
      0000807060008070600080706000807060000000000098989800606060006060
      6000606060005858580058585800484848004848480000000000000000000000
      0000707070007070700070707000707070000000000090B8A000B0D8B000A0D8
      A00090D0A00070B8700060A86000509850004070400000000000000000000000
      00000000000000000000000000000000000000000000A4A4A400C4C4C400BCBC
      BC00B0B0B0009494940084848400747474005858580000000000000000000000
      000000000000000000000000000000000000000000006080D0009098FF005060
      FF005060FF003048F0003048E0002040D0001028A00000000000000000000000
      0000000000000000000000000000000000000000000098989800C7C7C700A7A7
      A700A7A7A7009090900088888800787878005858580000000000000000000000
      0000000000000000000000000000000000000000000090C0A00090B8A00080B0
      9000A0D8A00070C0800060986000509050005080500000000000000000000000
      00008070600080706000807060008070600000000000A8A8A800A4A4A4009898
      9800BCBCBC00989898007C7C7C00707070006868680000000000000000000000
      000070707000707070007070700070707000000000007088E000A0A8FF009090
      FF007080FF005068FF003058F0002048F0001038B00000000000000000000000
      00008070600080706000807060008070600000000000A8A8A800CFCFCF00C7C7
      C700B7B7B700A7A7A70090909000888888006060600000000000000000000000
      00007070700070707000707070007070700000000000000000000000000090B8
      A000B0D8B000A0D8A00060A07000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A4
      A400C4C4C400BCBCBC0080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007088E0007088E0006080
      D0006078D0005070C0005060C0004058B0004058B00000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800A8A8A8009898
      9800989898008888880088888800787878007878780000000000000000000000
      00000000000000000000000000000000000000000000000000000000000090C0
      A00090B8A00080B0900070A88000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A8A8
      A800A4A4A400989898008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0A0900060483000604830006048
      3000604830006048300060483000604830006048300060483000604830006048
      3000000000000000000000000000000000009E9E9E0043434300434343004343
      4300434343004343430043434300434343004343430043434300434343004343
      430000000000000000000000000000000000FFFFFF0085B6D8000F6DAE001672
      B1001A74B1001A74B0001876B3001777B300137AB6000D7CBA000A7CBA00077A
      B8000279BA00006EAF007FAFCE00FFFFFF00FFFFFF00BBBBBB00777777007B7B
      7B007D7D7D007D7D7D007E7E7E007F7F7F008181810083838300838383008181
      81008080800076767600B3B3B300FFFFFF00C0A89000FFF8F000FFF0E000F0E8
      E000F0E0D000F0D0C000F0C8B000E0C0A000E0B8A000E0B09000E0A890006048
      300000000000000000000000000000000000A3A3A300F6F6F600ECECEC00E6E6
      E600DCDCDC00CECECE00C4C4C400B9B9B900B4B4B400ABABAB00A6A6A6004343
      430000000000000000000000000000000000FFFFFF001180CB00D4E8F600FFFF
      FF00FFFFFF0085BFE50048A2DA00389FD800249DD7001CA1DA0015A2DA000DA1
      D900059BD900018ED000006CAE00FFFFFF00FFFFFF008B8B8B00EAEAEA00FFFF
      FF00FFFFFF00C4C4C400A9A9A900A5A5A500A2A2A200A4A4A400A4A4A400A3A3
      A3009E9E9E009393930075757500FFFFFF00C0A8A000FFFFF000C0A8A000B0A0
      A000F0E8E000B0A09000B0989000B0989000B0989000B0989000E0B090006048
      300000000000000000000000000000000000A8A8A800FAFAFA00A8A8A800A1A1
      A100E6E6E6009C9C9C0098989800989898009898980098989800ABABAB004343
      430000000000000000000000000000000000FFFFFF00198AD500FFFFFF006BB3
      E40091C8EB00FFFFFF00FFFFFF00DFF1FA004CB5E40024ADE2001CB0E30013B0
      E3000AACE200049BD9000276B800FFFFFF00FFFFFF0095959500FFFFFF00BABA
      BA00CDCDCD00FFFFFF00FFFFFF00F1F1F100B8B8B800AFAFAF00B0B0B000AFAF
      AF00ACACAC009E9E9E007E7E7E00FFFFFF00C0A8A000FFFFF000FFFFF000FFF8
      F000FFF0E000F0E8E000F0E0D000F0D0C000F0C8B000E0C0A000E0B8A0006048
      300000000000000000000000000000000000A8A8A800FAFAFA00FAFAFA00F6F6
      F600ECECEC00E6E6E600DCDCDC00CECECE00C4C4C400B9B9B900B4B4B4004343
      430000000000000000000000000000000000FFFFFF00228ED700FFFFFF00A3D0
      EE0048A2DE008EC6EB00B8DDF300FFFFFF00C5E7F7002BB1E40021B3E40018B4
      E5000EB0E30008A0DA00057BBA00FFFFFF00FFFFFF0099999900FFFFFF00D4D4
      D400ABABAB00CBCBCB00DFDFDF00FFFFFF00E8E8E800B2B2B200B3B3B300B3B3
      B300AFAFAF00A2A2A20082828200FFFFFF00C0A8A000FFFFF000B0A8A000B0A0
      A000FFF8F000B0A09000B0989000B0989000B0989000B0989000E0C0A0006048
      300000000000000000000000000000000000A8A8A800FAFAFA00A6A6A600A1A1
      A100F6F6F6009C9C9C0098989800989898009898980098989800B9B9B9004343
      430000000000000000000000000000000000FFFFFF002C94D90074B8E600FFFF
      FF00B4D9F1004CA5DF0046A5DF00FFFFFF00CEEAF80064C5EA0052C2EA001BB1
      E40014ADE2000FA1DA000B7DBB00FFFFFF00FFFFFF009E9E9E00BFBFBF00FFFF
      FF00DCDCDC00ADADAD00ACACAC00FFFFFF00EBEBEB00C6C6C600C2C2C200B1B1
      B100ADADAD00A3A3A30084848400FFFFFF00C0B0A000FFFFF000FFFFF000FFFF
      F000FFFFF000FFF8F000FFF0E000F0E8E000F0E0D000F0D0C000F0C8B0006048
      300000000000000000000000000000000000ACACAC00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00F6F6F600ECECEC00E6E6E600DCDCDC00CECECE00C4C4C4004343
      430000000000000000000000000000000000FFFFFF003598DA004BA3DE0083BF
      E900FFFFFF00B0D7F10049A5DF008BC9EB00F8FCFE00FFFFFF00FFFFFF00CAEC
      F80043BAE70018A0D900127FBB00FFFFFF00FFFFFF00A1A1A100ABABAB00C5C5
      C500FFFFFF00DADADA00ADADAD00CDCDCD00FCFCFC00FFFFFF00FFFFFF00ECEC
      EC00BBBBBB00A3A3A30086868600FFFFFF00C0B0A000FFFFF000FFFFF000FFFF
      F000FFFFF000FFFFF000FFF8F000C0C8C00040607000F0E0D000F0D0C0006048
      300000000000000000000000000000000000ACACAC00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00F6F6F600C4C4C40061616100DCDCDC00CECECE004343
      430000000000000000000000000000000000FFFFFF003F9DDC0053A7E00056A9
      E00086C1E900FFFFFF00AAD4F00041A3DE005BB4E50041AEE20055B9E600FFFF
      FF00E3F3FB0039A8DD00187EB900FFFFFF00FFFFFF00A6A6A600AFAFAF00B1B1
      B100C7C7C700FFFFFF00D8D8D800AAAAAA00B9B9B900B2B2B200BCBCBC00FFFF
      FF00F3F3F300ACACAC0085858500FFFFFF00C0B0A000FFFFFF00E0E8F0006078
      8000E0E0E000FFFFF000C0C8D0005060700030A8D00020384000B0A0A0006048
      30000000000000000000A0B39A0040805000ACACAC00FFFFFF00E9E9E9007878
      7800E0E0E000FAFAFA00C9C9C90063636300A8A8A80038383800A1A1A1004343
      43000000000000000000A9A9A9006B6B6B00FFFFFF0045A0DE005AAAE1005CAA
      E10057A8E10094C8EB00FFFFFF005EAFE200369FDD002C9EDD00249DDD002EA3
      DE00FFFFFF008CC9E9001D7DB800FFFFFF00FFFFFF00A9A9A900B2B2B200B2B2
      B200B1B1B100CDCDCD00FFFFFF00B6B6B600A7A7A700A5A5A500A4A4A400A9A9
      A900FFFFFF00CCCCCC0085858500FFFFFF00D0B0A000FFFFFF0090A8B00080D0
      E00050607000B0B8C0005060700060C0E0005060700030B8F000102830001030
      40001028300070747D004078400050A86000AEAEAE00FFFFFF00A8A8A800CCCC
      CC0063636300B9B9B90063636300C0C0C00063636300BBBBBB00282828003131
      310028282800767676006161610089898900FFFFFF004FA5DF0063AFE30061AD
      E20059A9E1007AB9E700FFFFFF004EA4DF00369ADB0046A5E00062B3E4002496
      DA00A1D2EF00BFDFF200217CB700FFFFFF00FFFFFF00ADADAD00B7B7B700B5B5
      B500B1B1B100C0C0C000FFFFFF00ADADAD00A3A3A300ADADAD00B9B9B9009F9F
      9F00D5D5D500E1E1E10084848400FFFFFF00D0B8A000FFFFFF00E0E8F00090A8
      B00080E0F0005060700080D0E0005060700060D0F0004060700030B0E0002098
      D0002088B000205070005088600050B06000B3B3B300FFFFFF00E9E9E900A8A8
      A800DBDBDB0063636300CCCCCC0063636300CECECE0061616100B1B1B1009C9C
      9C008989890054545400767676008E8E8E00FFFFFF0053A7E0006CB4E50068B2
      E4005EABE10080BDE800FFFFFF005AAAE1003A9ADB009ECEEE00F8FCFE003B9E
      DC00B2D9F200B7DAF000237CB700FFFFFF00FFFFFF00AFAFAF00BBBBBB00B9B9
      B900B3B3B300C3C3C300FFFFFF00B2B2B200A3A3A300D2D2D200FCFCFC00A6A6
      A600DCDCDC00DDDDDD0084848400FFFFFF00D0B8A000D0B8A000D0B8A000C0B0
      A00090A8B00080E0F0005060700080E0F0004058700060D0F00050C8F00040C0
      F00020B0E00020A0D0006098700050B87000B3B3B300B3B3B300B3B3B300ACAC
      AC00A8A8A800DBDBDB0063636300DBDBDB005C5C5C00CECECE00C8C8C800C1C1
      C100B0B0B000A1A1A1008686860098989800FFFFFF005EACE2007ABCE70070B6
      E50063AEE30066AFE300E4F1FA00C1DFF300459EDD003E9BDC0051A6DF0067B2
      E400FDFEFF0075B7E300237BB600FFFFFF00FFFFFF00B4B4B400C2C2C200BDBD
      BD00B6B6B600B7B7B700F2F2F200E2E2E200A8A8A800A5A5A500AEAEAE00B9B9
      B900FEFEFE00BDBDBD0083838300FFFFFF000000000000000000000000000000
      00000000000090A8B00080E0F0004058700080E0F00070D8F00060D0F00050C8
      F00040C0F00030B8F00070A8800060C080000000000000000000000000000000
      000000000000A8A8A800DBDBDB005C5C5C00DBDBDB00D4D4D400CECECE00C8C8
      C800C1C1C100BBBBBB0096969600A3A3A300FFFFFF006BB4E5008DC5EA0080BF
      E8006FB6E50067B1E30091C6EB00F9FCFE00DDEDF90096C9EC00AED5F000FFFF
      FF00B1D7F1003596D5001E78B500FFFFFF00FFFFFF00BBBBBB00CACACA00C5C5
      C500BDBDBD00B8B8B800CBCBCB00FCFCFC00EFEFEF00CECECE00D9D9D900FFFF
      FF00DBDBDB009F9F9F0081818100FFFFFF000000000000000000000000000000
      0000000000000000000090A8B00080E0F00080E0F00080E0F00070D8F00060D0
      F00060B0D00080889000B0C0A00090D0A0000000000000000000000000000000
      00000000000000000000A8A8A800DBDBDB00DBDBDB00DBDBDB00D4D4D400CECE
      CE00B1B1B10089898900B4B4B400BBBBBB00FFFFFF0077BAE7009DCDEE008CC5
      EA0079BBE70070B6E5006AB2E40087C1E900C3E0F400EBF5FB00D4E9F70093C8
      EC0045A0DE002F92D3001975B300FFFFFF00FFFFFF00C0C0C000D2D2D200CACA
      CA00C1C1C100BDBDBD00B9B9B900C7C7C700E3E3E300F5F5F500EBEBEB00CDCD
      CD00A9A9A9009B9B9B007E7E7E00FFFFFF000000000000000000000000000000
      000000000000000000000000000090A8B00090A0B00090A0A0008098A0008090
      A00080889000B9B9BD00A0B8A000B0C0A0000000000000000000000000000000
      0000000000000000000000000000A8A8A800A3A3A3009E9E9E00989898009393
      930089898900BABABA00AEAEAE00B4B4B400FFFFFF00B2D7F10076B9E60067B1
      E4005BAAE10054A7E0004FA5DF004AA2DE004BA3DE0046A1DE003F9DDC003B9B
      DC003196D900238ACF008ABADA00FFFFFF00FFFFFF00DBDBDB00BFBFBF00B8B8
      B800B2B2B200AFAFAF00ADADAD00ABABAB00ABABAB00AAAAAA00A6A6A600A4A4
      A400A0A0A00094949400BEBEBE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0A8A000604830006048
      3000604830006048300060483000604830000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800434343004343
      43004343430043434300434343004343430000000000C7C6C200806850008060
      5000806050007060500070584000705840007050400070504000604830006048
      300060483000A19A9100000000000000000000000000C4C4C400636363005E5E
      5E005E5E5E005C5C5C0053535300535353004E4E4E004E4E4E00434343004343
      4300434343009898980000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0A8A000FFF0F000F0D8
      D000E0D0C000E0C8B000E0C0B000604830000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800F1F1F100D8D8
      D800CCCCCC00C3C3C300BEBEBE0043434300C1C4C300A38D8500E0D0C000B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A0
      9000B0A0900060483000C8CBC90000000000C3C3C3008C8C8C00CCCCCC009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C0043434300CACACA0000000000000000000000000000000000A6A3
      CC001048E0001048E0001048E0000000000000000000C0B0A000FFF8F0007070
      7000F0E8E00070707000E0C8B00060483000000000000000000000000000AFAF
      AF007070700070707000707070000000000000000000ACACAC00F6F6F6007070
      7000E6E6E60070707000C3C3C30043434300BCB7B000B29C9400FFE8E000FFF8
      F000FFF0E000FFE8E000F0D8D000F0D0B000F0C0A00000A0000000A0000000A0
      000070584000604830008577670000000000B5B5B5009B9B9B00E7E7E700F6F6
      F600ECECEC00E7E7E700D8D8D800C9C9C900BBBBBB0060606000606060006060
      6000535353004343430073737300000000000000000000000000000000004070
      F0009E9FD30000000000000000000000000000000000D0B0A000FFFFFF00FFF8
      F000FFF0F000F0E8E000E0D0C000604830000000000000000000000000009191
      9100AEAEAE0000000000000000000000000000000000AEAEAE00FFFFFF00F6F6
      F600F1F1F100E6E6E600CCCCCC0043434300B2948500E0D8D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000F0E0E000F0D8C00000FF100000FFB00000A0
      00008068500070504000604830000000000092929200D6D6D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F100E1E1E100D3D3D3009D9D9D00CDCDCD006060
      6000636363004E4E4E0043434300000000000000000000000000000000001048
      F0000000000000000000000000000000000000000000D0B8A000FFFFFF008088
      8000FFF8F00070707000F0D8D000604830000000000000000000000000007474
      74000000000000000000000000000000000000000000B3B3B300FFFFFF008484
      8400F6F6F60070707000D8D8D80043434300B0908000F0E8E000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8E00000FF100000FF100000A0
      0000907060007060500060483000000000008E8E8E00E6E6E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E6E6E6009D9D9D009D9D9D006060
      60006E6E6E005C5C5C00434343000000000000000000000000006080F0003058
      F0001048E00000000000000000000000000000000000D0B0A000FFFFFF00FFFF
      FF00FFFFFF00FFF8F000FFF0F0006048300000000000000000009E9E9E008181
      81007070700000000000000000000000000000000000AEAEAE00FFFFFF00FFFF
      FF00FFFFFF00F6F6F600F1F1F10043434300B0988000D0C0B000D0B8B000C0B0
      A000B0A09000B0988000A0888000908070009070600080686000806050007058
      50009080700080686000705840000000000093939300BCBCBC00B8B8B800ACAC
      AC009C9C9C0093939300888888007C7C7C006E6E6E00686868005E5E5E005858
      58007C7C7C006868680053535300000000000000000000000000D0CEE00080A0
      FF00D0CADC0000000000000000000000000000000000C0B0A000C0B0A000C0B0
      A000C0B0A000C0B0A000C0A8A000C0A8A0000000000000000000D3D3D300B9B9
      B900D0D0D00000000000000000000000000000000000ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00A8A8A800A8A8A800C0A09000FFF8F000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000FFF0F000F0F0F000F0E8
      E000A08880009078600080605000000000009E9E9E00F6F6F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F1F1F100F0F0F000E6E6
      E60088888800737373005E5E5E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEC9C300B6A18C00D0B0A000C0A8
      A000D0B0A000C0A09000B0908000A08070009070600080605000706050008070
      6000B0A09000A08870008060500000000000C7C7C7009C9C9C00AEAEAE00A8A8
      A800AEAEAE009E9E9E008E8E8E007E7E7E006E6E6E005E5E5E005C5C5C006C6C
      6C009C9C9C00838383005E5E5E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBC7C200C0B0A000E0C8
      C000FFFFFF00FFF8FF00FFF8FF00FFF0F000F0F0E000F0E0E000C0A8A0008060
      5000A0908000C0B0A000806050000000000000000000C5C5C500ACACAC00C8C8
      C800FFFFFF00FAFAFA00FAFAFA00F1F1F100EBEBEB00E1E1E100A8A8A8005E5E
      5E008C8C8C00ACACAC005E5E5E0000000000C0A8A00060483000604830006048
      300060483000604830006048300000000000000000000000000000000000D5D1
      E3001048E000D1CFE1000000000000000000A8A8A80043434300434343004343
      430043434300434343004343430000000000000000000000000000000000D6D6
      D60070707000D4D4D40000000000000000000000000000000000DEDFDD00C0B0
      A000FFFFFF00F0E8E000D0C8C000D0C8C000D0B8B000D0C0B000E0D0D0008068
      600080605000B0989000B0A09000000000000000000000000000DEDEDE00ACAC
      AC00FFFFFF00E6E6E600C6C6C600C6C6C600B8B8B800BCBCBC00D1D1D1006868
      68005E5E5E00989898009C9C9C0000000000C0A8A000FFF0F000F0D8D000E0D0
      C000E0C8B000E0C0B000604830000000000000000000000000000000000080A0
      FF003060F0001048E0000000000000000000A8A8A800F1F1F100D8D8D800CCCC
      CC00C3C3C300BEBEBE004343430000000000000000000000000000000000B9B9
      B90086868600707070000000000000000000000000000000000000000000D8CB
      BC00F0E8E000FFFFFF00FFFFFF00FFFFFF00FFF8FF00FFF0F000F0E0D000D0B8
      B00080605000BAADA8000000000000000000000000000000000000000000C7C7
      C700E6E6E600FFFFFF00FFFFFF00FFFFFF00FAFAFA00F1F1F100DCDCDC00B8B8
      B8005E5E5E00ACACAC000000000000000000C0B0A000FFF8F00070707000F0E8
      E00070707000E0C8B00060483000000000000000000000000000000000000000
      00004070F000000000000000000000000000ACACAC00F6F6F60070707000E6E6
      E60070707000C3C3C30043434300000000000000000000000000000000000000
      000091919100000000000000000000000000000000000000000000000000E5E5
      E600D0B8B000FFFFFF00F0F0F000D0C8C000D0C8C000D0B8B000C0B0B000E0D8
      D00080706000866859000000000000000000000000000000000000000000E5E5
      E500B8B8B800FFFFFF00F0F0F000C6C6C600C6C6C600B8B8B800B1B1B100D6D6
      D6006C6C6C00666666000000000000000000D0B0A000FFFFFF00FFF8F000FFF0
      F000F0E8E000E0D0C0006048300000000000000000000000000000000000AEB7
      EA001048F000000000000000000000000000AEAEAE00FFFFFF00F6F6F600F1F1
      F100E6E6E600CCCCCC004343430000000000000000000000000000000000C5C5
      C500747474000000000000000000000000000000000000000000000000000000
      0000DED5D300E0D1D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F0E8
      E000D0B8B00080605000DCDBDB00000000000000000000000000000000000000
      0000D5D5D500D2D2D200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00E6E6
      E600B8B8B8005E5E5E00DBDBDB0000000000D0B8A000FFFFFF0080888000FFF8
      F00070707000F0D8D0006048300000000000000000006088F0007090F0007090
      F000A8B6EB00000000000000000000000000B3B3B300FFFFFF0084848400F6F6
      F60070707000D8D8D800434343000000000000000000A3A3A300A9A9A900A9A9
      A900C4C4C4000000000000000000000000000000000000000000000000000000
      000000000000DFD6D300D0C0B000D0C0B000D0C0B000D0C0B000D0C0B000D0C0
      B000D0C0B000D0C0B00000000000000000000000000000000000000000000000
      000000000000D6D6D600BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBC
      BC00BCBCBC00BCBCBC000000000000000000D0B0A000FFFFFF00FFFFFF00FFFF
      FF00FFF8F000FFF0F00060483000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAE00FFFFFF00FFFFFF00FFFF
      FF00F6F6F600F1F1F10043434300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0B0A000C0B0A000C0B0A000C0B0
      A000C0B0A000C0A8A000C0A8A000000000000000000000000000000000000000
      000000000000000000000000000000000000ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00A8A8A800A8A8A800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009A8F8C00203040005F686900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F8F8F003333330067676700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8800405060002098C000303840005F6D72000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008A8A8A005353530098989800393939006D6D6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1C0A700D1AC
      9300D5B8A1007F8285005060700020A0D00030B8F00060A0B000506870008068
      5000705840006048300060483000000000000000000000000000BBBBBB00A8A8
      A800B4B4B4008282820063636300A1A1A100BBBBBB009E9E9E00686868006363
      6300535353004343430043434300000000000000000000000000000000000000
      000000000000CDA18700E5BC9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D9D9D00B7B7B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000706860006050
      400060504000606860004088A00040C0F00060B0D00070889000A0989000C0B0
      A000B0A09000B0A0900060483000000000000000000000000000666666004C4C
      4C004C4C4C006464640088888800C1C1C100B1B1B1008888880096969600ACAC
      AC009C9C9C009C9C9C0043434300000000000000000000000000000000000000
      0000AA74570090482000B4765700F0CEB3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070004343430072727200C9C9C9000000000000000000000000000000
      00000000000000000000000000000000000000000000776E6500C0A08000F0E0
      A000F0D8A000B0A89000607070006098B000708890009098A000D0F0E000B0E8
      D000B0E8C000B0A090006048300000000000000000006C6C6C0099999900CECE
      CE00C9C9C900A1A1A1006E6E6E00999999008888880099999900E8E8E800DBDB
      DB00D6D6D6009C9C9C004343430000000000000000000000000000000000A558
      3900D0785000D0704000B0603000CB9173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005656
      5600747474006B6B6B00595959008D8D8D000000000000000000000000000000
      00000000000000000000000000000000000096837200B0988000FFFFC000FFF8
      C000FFF0C000FFF0D000B0A890007070700090A0A000F0F8F000E0F8F000C0F0
      D000C0E8D000C0A8900060483000000000007F7F7F0093939300ECECEC00E7E7
      E700E3E3E300E7E7E700A1A1A100707070009E9E9E00F4F4F400F3F3F300E1E1
      E100DCDCDC00A3A3A30043434300000000000000000000000000A0503000D078
      5000F0906000E19C7500D0886000B96F4200D3A4860000000000000000000000
      00000000000000000000000000000000000000000000000000004E4E4E007474
      74008B8B8B009797970083838300686868009F9F9F0000000000000000000000
      00000000000000000000000000000000000096857500E0D0B000FFFFE000FFFF
      E000FFFFD000FFF0C000F0D8B00060504000E0D8C000E0C8B000D0B0A000D0A8
      9000C0E8D000C0A89000604830000000000081818100C8C8C800F5F5F500F5F5
      F500F0F0F000E3E3E300CECECE004C4C4C00D1D1D100C3C3C300AEAEAE00A4A4
      A400DCDCDC00A3A3A300434343000000000000000000A5603900E0805000F090
      6000F3AF8E0000000000F2AA8600D0886000B4673900EBC9AF00000000000000
      000000000000000000000000000000000000000000005B5B5B007B7B7B008B8B
      8B00ABABAB0000000000A6A6A6008383830060606000C4C4C400000000000000
      000000000000000000000000000000000000BCA99700E0D0B000FFFFF000FFFF
      F000FFFFE000FFF8C000F0D8A00070585000FFFFFF00FFFFFF00FFFFFF00E0F8
      F000D0F0E000C0A8A0006048300000000000A5A5A500C8C8C800FAFAFA00FAFA
      FA00F5F5F500E7E7E700C9C9C90058585800FFFFFF00FFFFFF00FFFFFF00F3F3
      F300E8E8E800A8A8A800434343000000000000000000F1B69800F0A89000F2AC
      8200000000000000000000000000E6AA8600D0886000AA684100F2C7B4000000
      00000000000000000000000000000000000000000000B2B2B200A8A8A800A6A6
      A600000000000000000000000000A5A5A5008383830062626200C5C5C5000000
      000000000000000000000000000000000000D5C0AD00C0A8A000FFFFFF00FFFF
      FF00FFFFE000FFFFD000C0B0800090807000F0E0D000E0C8B000D0B0A000D0A8
      9000E0F8F000C0A8A0006048300000000000BCBCBC00A8A8A800FFFFFF00FFFF
      FF00F5F5F500F0F0F000A3A3A3007C7C7C00DCDCDC00C3C3C300AEAEAE00A4A4
      A400F3F3F300A8A8A800434343000000000000000000FDE0CD00F7CEB6000000
      000000000000000000000000000000000000E19C7500D0785000B47D5600F2CC
      B3000000000000000000000000000000000000000000DDDDDD00CACACA000000
      000000000000000000000000000000000000979797007474740076767600C8C8
      C8000000000000000000000000000000000000000000B4ABA200C0B0B000F0E8
      D000F0E8C000C0B0900080786000D0D0D000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0F8F000C0B0A000604830000000000000000000A9A9A900B1B1B100E1E1
      E100DCDCDC00A8A8A80071717100D0D0D000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4F4F400ACACAC0043434300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E19C7400C0704000C38C
      7400F1CAB0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096969600696969008A8A
      8A00C6C6C6000000000000000000000000000000000000000000C0B0A000B0A0
      9000A0908000B0A0A000B0A8A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0B0A00060483000000000000000000000000000ACACAC009C9C
      9C008C8C8C00A1A1A100A6A6A600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ACACAC0043434300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E29F7900C070
      4000D29B8200EBC3A80000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A9A9A006969
      690099999900BEBEBE0000000000000000000000000000000000F0A89000F0A8
      9000F0A89000F0A88000F0A08000E0987000E0906000E0885000E0805000E070
      4000E0704000E0704000D0603000000000000000000000000000A8A8A800A8A8
      A800A8A8A800A3A3A3009E9E9E009393930089898900808080007B7B7B006C6C
      6C006C6C6C006C6C6C005C5C5C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1AF
      9100C0705000E4B99B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ACAC
      AC006E6E6E00B4B4B40000000000000000000000000000000000F0A89000FFC0
      A000FFC0A000FFC0A000FFB89000FFB89000FFB09000FFA88000FFA88000F0A0
      7000F0987000F0986000D0683000000000000000000000000000A8A8A800BCBC
      BC00BCBCBC00BCBCBC00B3B3B300B3B3B300AEAEAE00A4A4A400A4A4A4009999
      9900949494009090900061616100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1C1A700D291720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BEBEBE008E8E8E0000000000000000000000000000000000F0A89000F0A8
      9000F0A89000F0A89000F0A88000F0A08000F0987000E0987000E0906000E080
      5000E0784000E0784000E0704000000000000000000000000000A8A8A800A8A8
      A800A8A8A800A8A8A800A3A3A3009E9E9E009494940093939300898989007B7B
      7B0071717100717171006C6C6C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D5C5C400958DAF00565B93002C3275002C2B66004948780083738600C9AB
      A100000000000000000000000000000000000000000000000000000000000000
      0000C7C7C700989898006B6B6B00454545003D3D3D00565656007A7A7A00ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AFAA
      BF004853A5001038A0001030B0000030C0000030C0000028B000102080002B27
      5C0097838700000000000000000000000000000000000000000000000000B1B1
      B1006A6A6A00535353005353530056565600565656004D4D4D003B3B3B003737
      3700868686000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5AEC7003C51
      B2001038C0000030D0000030D0000030D0000030D0000030D0000030D0000028
      A0000E1B64009680830000000000000000000000000000000000B6B6B6006C6C
      6C005D5D5D005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B004848
      48002F2F2F00838383000000000000000000B0A0900060483000604830006048
      3000604830006048300060483000604830006048300060483000604830007050
      4000000000000000000000000000000000009C9C9C0043434300434343004343
      4300434343004343430043434300434343004343430043434300434343004E4E
      4E000000000000000000000000000000000000000000D9CCD3004862B4001040
      D0000038E0000038E0000038E0000038E0000038D0000030D0000030D0000030
      D0000028A0002B265B00C5A092000000000000000000D0D0D000787878006666
      660065656500656565006565650065656500606060005B5B5B005B5B5B005B5B
      5B004848480036363600A0A0A00000000000C0A8A000FFFFFF00E0E8E000E0E0
      E000E0E0D000E0D8D000E0D0C000E0C8C000E0C8B000E0C0B000C0A8A0007050
      400000000000000000000000000000000000A8A8A800FFFFFF00E4E4E400E0E0
      E000DBDBDB00D6D6D600CCCCCC00C8C8C800C3C3C300BEBEBE00A8A8A8004E4E
      4E0000000000000000000000000000000000000000009EA3CB002050C0000038
      F0000040F000FFFFFF00FFFFFF004070F0004068F000FFFFFF00FFFFFF000030
      D0000030D000102080007F697A000000000000000000AFAFAF006D6D6D006A6A
      6A006E6E6E00FFFFFF00FFFFFF00929292008D8D8D00FFFFFF00FFFFFF005B5B
      5B005B5B5B003B3B3B007070700000000000C0B0A000FFFFFF00E0C8C000D0C0
      B000D0C0B000FFF0E000D0B0A000D0B0A000D0B0A000F0D8D000C0A8A0007050
      400000000000000000000000000000000000ACACAC00FFFFFF00C8C8C800BCBC
      BC00BCBCBC00ECECEC00AEAEAE00AEAEAE00AEAEAE00D8D8D800A8A8A8004E4E
      4E0000000000000000000000000000000000000000006E81C5002048E0000040
      FF001048FF007098FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006080F0000038
      D0000030D0000028B00047427100000000000000000094949400727272007373
      730079797900B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9F006060
      60005B5B5B004D4D4D005050500000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFF8F000FFF8F000707070005058500000000000D0C0B000D0B0A0007050
      400000000000000000000000000000000000B3B3B300FFFFFF00FFFFFF00FFFF
      FF00F6F6F600F6F6F600707070005454540000000000BCBCBC00AEAEAE004E4E
      4E0000000000000000000000000000000000000000004B68C1005070FF005078
      FF003060FF003060FF00B0C8FF00FFFFFF00FFFFFF00A0B8FF000038F0000038
      E0000030D0000030C0002C296400000000000000000080808000989898009D9D
      9D008B8B8B008B8B8B00D6D6D600FFFFFF00FFFFFF00CBCBCB006A6A6A006565
      65005B5B5B00565656003B3B3B0000000000D0B8A000FFFFFF00E0C8C000E0C8
      C000E0C8C000FFF8F000A0A0A000FFFFFF005090B00010101000C0B0B0008060
      500000000000000000000000000000000000B3B3B300FFFFFF00C8C8C800C8C8
      C800C8C8C800F6F6F600A0A0A000FFFFFF009393930010101000B1B1B1005E5E
      5E0000000000000000000000000000000000000000004B68C1005078FF005080
      FF005078FF004070FF00B0C8FF00FFFFFF00FFFFFF00A0B8FF000040FF000038
      E0000038D0000030C0002C3173000000000000000000808080009D9D9D00A1A1
      A1009D9D9D0096969600D6D6D600FFFFFF00FFFFFF00CBCBCB00737373006565
      650060606000565656004444440000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0A0A00090B8C00070D0E0005098B000101010008070
      600000000000000000000000000000000000B3B3B300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0A0A000B6B6B600CBCBCB0098989800101010006C6C
      6C0000000000000000000000000000000000000000006E87D1005078F0006090
      FF007090FF0090B0FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007098FF000038
      F0000038E0001030B0005354890000000000000000009B9B9B0098989800ADAD
      AD00AEAEAE00C5C5C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3B3B3006A6A
      6A0065656500535353006464640000000000D0B8A000FFFFFF00E0C8C000E0C8
      C000E0C8C000FFFFFF00C0B8B00050A0B00090E0F00060C0D0005098B0001010
      1000C8C0B400000000000000000000000000B3B3B300FFFFFF00C8C8C800C8C8
      C800C8C8C800FFFFFF00B6B6B6009C9C9C00DCDCDC00BBBBBB00989898001010
      1000BDBDBD00000000000000000000000000000000009EA7D3004068E0007098
      FF0080A0FF00FFFFFF00FFFFFF0080A0FF008098FF00FFFFFF00FFFFFF000040
      F0000038E0002038A0008F7D9A000000000000000000B4B4B40088888800B3B3
      B300BABABA00FFFFFF00FFFFFF00BABABA00B5B5B500FFFFFF00FFFFFF006E6E
      6E0065656500555555008888880000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF8F000D0D0D00050A0B00090E0F00060C0D0005098
      B00010101000C8C1B4000000000000000000B3B3B300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F6F6F600D0D0D0009C9C9C00DCDCDC00BBBBBB009898
      980010101000BDBDBD00000000000000000000000000DCCFD6005677D0006080
      F00080A8FF0090B0FF0080A0FF006080FF004070FF003060FF001048FF000040
      F0001040C0004750A100CBABA1000000000000000000D3D3D3008E8E8E009F9F
      9F00BEBEBE00C5C5C500BABABA00A3A3A300969696008B8B8B00797979006E6E
      6E006161610067676700ABABAB0000000000F0B09000F0A89000F0A89000F0A0
      8000F0987000E0906000E0886000E0906000D0A8900060A8B00090E0F00060C0
      D0005098B00010101000D5C8B90000000000ACACAC00A8A8A800A8A8A8009E9E
      9E0094949400898989008484840089898900A4A4A400A3A3A300DCDCDC00BBBB
      BB009898980010101000C4C4C400000000000000000000000000BBB7D3005A76
      D0006080F00080A0FF0080A8FF008098FF006088FF003060FF001048FF001048
      D0003B4FB000A898A70000000000000000000000000000000000C0C0C0008E8E
      8E009F9F9F00BABABA00BEBEBE00B5B5B500A8A8A8008B8B8B00797979006B6B
      6B006A6A6A009E9E9E000000000000000000F0B09000FFC0A000FFC0A000FFB8
      A000FFB89000FFB09000FFA88000FFA88000F0A88000D0B0A00070B0C00090E0
      F00070C8E0008088800030389000BCAEB600ACACAC00BCBCBC00BCBCBC00B7B7
      B700B3B3B300AEAEAE00A4A4A400A4A4A400A3A3A300AEAEAE00AEAEAE00DCDC
      DC00C6C6C6008484840051515100B1B1B100000000000000000000000000BBB6
      D1006477D0005070E0005078F0005080FF005078FF003060E0003050D000475F
      B000AF9EB100000000000000000000000000000000000000000000000000BFBF
      BF00909090008E8E8E0098989800A1A1A1009D9D9D0082828200737373007575
      7500A6A6A600000000000000000000000000F0B09000F0A89000F0A89000F0A8
      9000F0A08000F0A07000E0987000E0906000E0885000E0906000D098800080B0
      C000D0B8B0007088D0006070B00030389000ACACAC00A8A8A800A8A8A800A8A8
      A8009E9E9E00999999009393930089898900808080008989890096969600B0B0
      B000B8B8B8009B9B9B0081818100515151000000000000000000000000000000
      0000DBCCD0009DA5CF006E86CF004B67C0004B67C0006D7EC0009B9BBF00D2BB
      B900000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00B1B1B1009A9A9A007F7F7F007F7F7F0090909000A6A6A600BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DDD4
      CA006070B0007090E0006078D0006070B0000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D1D1
      D10081818100A4A4A40090909000818181000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0C6CE006070B0006070B000DFD2D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9C9C9008181810081818100D3D3D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CFC1C50020309000203090002030
      800020287000C6A7970000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3C3C3004B4B4B004B4B4B004646
      46003C3C3C00A5A5A50000000000000000000000000000000000000000000000
      00000000000000000000707070005058500000000000D0C0AE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000707070005454540000000000BCBCBC00000000000000
      0000000000000000000000000000000000000000000000000000B0A090006048
      3000604830006048300070584000605060001038C0002050D0001038C0001030
      B0001030A00010207000C5A392000000000000000000000000009C9C9C004343
      4300434343004343430053535300565656005C5C5C00717171005C5C5C005353
      53004E4E4E0036363600A1A1A10000000000000000000000000000000000B0A0
      90007C644D00AD957F00A0A0A000FFFFFF005090B00010101000988A76007B61
      4900604830006048300000000000000000000000000000000000000000009C9C
      9C005F5F5F0090909000A0A0A000FFFFFF009393930010101000858585005C5C
      5C00434343004343430000000000000000000000000000000000B0A09000FFFF
      FF00D0C8C000D0C8C000D0C8C0001040E0004068E0003058E0000038E0000038
      D0001030C0001030A000202870000000000000000000000000009C9C9C00FFFF
      FF00C6C6C600C6C6C600C6C6C6006B6B6B00888888007C7C7C00646464006060
      6000585858004E4E4E003C3C3C0000000000000000000000000000000000D6BA
      A800FFFFFF00F0E8E000A0A0A00090B8C00070D0E0005098B00010101000A098
      9000B0A09000604830000000000000000000000000000000000000000000B7B7
      B700FFFFFF00E6E6E600A0A0A000B6B6B600CBCBCB0098989800101010009696
      96009C9C9C004343430000000000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFF8FF00FFF0F0003068F000F0F8FF00FFF8FF00FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00203090000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FAFAFA00F1F1F1008B8B8B00F9F9F900FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA004B4B4B000000000000000000B7B3DA000E2BDF00B8AB
      BD00FFFFFF00FFFFFF00E0E0E00050A0B00060A8E00060C0D0005098B0001010
      1000909090007A5F4600000000000000000000000000BFBFBF005E5E5E00B1B1
      B100FFFFFF00FFFFFF00E0E0E0009C9C9C00B1B1B100BBBBBB00989898001010
      1000909090005A5A5A0000000000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFF8F0003068F000FFF8FF00FFF8FF00FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00203090000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00F6F6F6008B8B8B00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA004B4B4B0000000000000000000028FF000020F0004050
      D000FFFFFF00FFFFFF00FFFFFF004050E0000010B00090E0F00060C0D0005098
      B000101010008B7D7200000000000000000000000000646464005B5B5B007474
      7400FFFFFF00FFFFFF00FFFFFF00797979003E3E3E00DCDCDC00BBBBBB009898
      9800101010007B7B7B0000000000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF003060FF0080A0F0006080F0004060E0002058
      E0000038D0001038C0002038A0000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008A8A8A00B4B4B4009E9E9E00838383007B7B
      7B00606060005C5C5C005454540000000000000000002D51FC001038FF000028
      FF00F0F8FF00FFFFFF009098F0000018C0006078E00060A8B00090E0F00060C0
      D0005098B00010101000CBAF98000000000000000000808080006F6F6F006464
      6400F9F9F900FFFFFF00B1B1B1004848480094949400A3A3A300DCDCDC00BBBB
      BB009898980010101000AAAAAA00000000000000000000000000C0A89000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D0D8F0003068F00090A8F0006080F0005078
      E0002048D0002038B000C8ACAA00000000000000000000000000A3A3A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEDEDE008B8B8B00BBBBBB009E9E9E009393
      93006C6C6C0059595900AEAEAE000000000000000000E7D7DB003050FF002040
      FF0090A0F000C0C8F0000028F0004058F000FFF8F000D0D8E00070B0C00090E0
      F00070C8E0008088800030389000B195950000000000D9D9D900818181007676
      7600B6B6B600D3D3D3006060600083838300F6F6F600D9D9D900AEAEAE00DCDC
      DC00C6C6C6008484840051515100979797000000000000000000C0A8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D8F0003060F0003060F0003060
      E0002048C000C9B0AF0000000000000000000000000000000000A8A8A800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE0086868600868686008181
      810068686800B2B2B20000000000000000000000000000000000DCD0DC004060
      FF003050FF002040FF003050FF00FFF8FF00FFFFFF00FFF8F000D0D8E00080B0
      C000D0B8B0007088D0006070B000303890000000000000000000D4D4D4008C8C
      8C00818181007676760081818100FAFAFA00FFFFFF00F6F6F600D9D9D900B0B0
      B000B8B8B8009B9B9B0081818100515151000000000000000000C0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F0F0F000F0F0F000D0C8
      C000806850000000000000000000000000000000000000000000ACACAC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00F0F0F000F0F0F000C6C6
      C60063636300000000000000000000000000000000000000000000000000B8B5
      D1004068FF004060FF00D0D8FF00FFFFFF00FFFFFF00FFF8FF00F0F0F000D0D8
      D0006070B0007090E0006078D0006070B000000000000000000000000000BDBD
      BD00919191008C8C8C00E2E2E200FFFFFF00FFFFFF00FAFAFA00F0F0F000D4D4
      D40081818100A4A4A40090909000818181000000000000000000D0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000D0C8
      C000604830000000000000000000000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000C6C6
      C600434343000000000000000000000000000000000000000000C6C4E2006078
      FF006078FF006080FF005070FF00F0F0FF00FFFFFF00FFFFFF00FFF8F000F0F0
      F000B0A0A0006070B0006070B000D1B2A5000000000000000000CDCDCD009E9E
      9E009E9E9E00A2A2A20097979700F4F4F400FFFFFF00FFFFFF00F6F6F600F0F0
      F000A1A1A1008181810081818100B1B1B1000000000000000000D0B8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A000C0A8
      A000604830000000000000000000000000000000000000000000B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A800A8A8
      A8004343430000000000000000000000000000000000B1B6E9005078FF005078
      FF00C0D0FF00FFFFFF007088FF006078FF00D0E0FF00FFFFFF00FFFFFF00B0A0
      9000B0A0900096785E00000000000000000000000000C4C4C4009C9C9C009C9C
      9C00DCDCDC00FFFFFF00A9A9A9009E9E9E00E7E7E700FFFFFF00FFFFFF009C9C
      9C009C9C9C007373730000000000000000000000000000000000D0B8B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A09000604830006048
      3000604830000000000000000000000000000000000000000000B8B8B800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00434343004343
      430043434300000000000000000000000000859BF3005078FF005078FF00C8BE
      D100FFFFFF00FFFFFF00FFFFFF00B0C8FF008098FF00FFFFFF00B0A090008068
      500080605000604830000000000000000000B3B3B3009C9C9C009C9C9C00C4C4
      C400FFFFFF00FFFFFF00FFFFFF00D6D6D600B4B4B400FFFFFF009C9C9C006363
      63005E5E5E004343430000000000000000000000000000000000D0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C0006048
      3000DFBDA7000000000000000000000000000000000000000000BCBCBC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6C6004343
      4300B9B9B900000000000000000000000000859BF3006585FA00DCD2DC00D8C7
      B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8
      C00080685000DEBAA5000000000000000000B3B3B300A4A4A400D6D6D600C3C3
      C300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6
      C60063636300B7B7B70000000000000000000000000000000000E0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000E0BE
      AA00000000000000000000000000000000000000000000000000BEBEBE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A80043434300BBBB
      BB0000000000000000000000000000000000000000000000000000000000D0C0
      B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A0008070
      6000DFBDA700000000000000000000000000000000000000000000000000BCBC
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A8006C6C
      6C00B9B9B9000000000000000000000000000000000000000000E0C0B000E0C0
      B000E0C0B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000E0C0AD000000
      0000000000000000000000000000000000000000000000000000BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE00BDBDBD000000
      000000000000000000000000000000000000000000000000000000000000E0C0
      B000E0C0B000E0C0B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000E0BE
      AA0000000000000000000000000000000000000000000000000000000000BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE00BBBB
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0A090006048
      3000604830006048300060483000604830006048300060483000604830006048
      30006048300000000000000000000000000000000000000000009C9C9C004343
      4300434343004343430043434300434343004343430043434300434343004343
      4300434343000000000000000000000000000000000000000000C0686000B058
      5000A0505000A0505000A0505000904850009048400090484000804040008038
      40008038400070384000703830000000000000000000000000006E6E6E005E5E
      5E00585858005858580058585800515151004C4C4C004C4C4C00464646004141
      410041414100404040003B3B3B00000000000000000000000000B0A09000FFFF
      FF00B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C004343430000000000000000000000000000000000D0687000F0909000E080
      8000B048200040302000C0B8B000C0B8B000D0C0C000D0C8C00050505000A040
      3000A0403000A038300070384000000000000000000074747400999999008989
      8900464646002C2C2C00B6B6B600B6B6B600C1C1C100C6C6C600505050004444
      4400444444004040400040404000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFF8FF00F0F0F000F0E8E000F0E0D000E0D0D000E0C8C000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FAFAFA00F0F0F000E6E6E600DCDCDC00D1D1D100C8C8C8009C9C
      9C004343430000000000000000000000000000000000D0707000FF98A000F088
      8000E0808000705850004040300090787000F0E0E000F0E8E00090807000A040
      3000A0404000A040300080384000000000000000000079797900A4A4A4009090
      900089898900585858003B3B3B0078787800E1E1E100E6E6E6007C7C7C004444
      4400494949004444440041414100000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E0E000F0D8D000E0D0C000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00F6F6F600F0F0F000E1E1E100D8D8D800CCCCCC009C9C
      9C004343430000000000000000000000000000000000D0787000FFA0A000F090
      9000F0888000705850000000000040403000F0D8D000F0E0D00080786000B048
      4000B0484000A04040008040400000000000000000007E7E7E00A9A9A9009999
      99009090900058585800000000003B3B3B00D8D8D800DCDCDC00717171005050
      5000505050004949490046464600000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF0F000F0E8E000F0E0E000E0D8D000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1F1F100E6E6E600E1E1E100D6D6D6009C9C
      9C004343430000000000000000000000000000000000D0788000FFA8B000FFA0
      A000F0909000705850007058500070585000705850007060500080686000C058
      5000B0505000B048400080404000000000000000000083838300B3B3B300A9A9
      A90099999900585858005858580058585800585858005C5C5C00686868006060
      6000595959005050500046464600000000000000000000000000C0A89000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000B0A0
      9000604830000000000000000000000000000000000000000000A3A3A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8D8009C9C
      9C004343430000000000000000000000000000000000E0808000FFB0B000FFB0
      B000FFA0A000F0909000F0888000E0808000E0788000D0707000D0687000C060
      6000C0585000B050500090484000000000000000000089898900B7B7B700B7B7
      B700A9A9A9009999990090909000898989008484840079797900747474006969
      690060606000595959004C4C4C00000000000000000000000000C0A8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8E000F0E0E000B0A0
      9000604830000000000000000000000000000000000000000000A8A8A800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E6E6E600E1E1E1009C9C
      9C004343430000000000000000000000000000000000E0889000FFB8C000FFB8
      B000D0606000C0605000C0585000C0504000B0503000B0483000A0402000A038
      1000C0606000C058500090484000000000000000000093939300C1C1C100BCBC
      BC006B6B6B00646464006060600056565600505050004B4B4B00404040003636
      360069696900606060004C4C4C00000000000000000000000000C0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F0F0F000F0E8E000B0A0
      9000604830000000000000000000000000000000000000000000ACACAC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00F0F0F000E6E6E6009C9C
      9C004343430000000000000000000000000000000000E0909000FFC0C000D068
      6000FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0C000E0C8
      C000A0381000C060600090485000000000000000000098989800C6C6C6007070
      7000FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8D800CCCCCC00C8C8
      C800363636006969690051515100000000000000000000000000D0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000B0A0
      9000604830000000000000000000000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F0009C9C
      9C004343430000000000000000000000000000000000E098A000FFC0C000D070
      7000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0
      C000A0402000D0686000A05050000000000000000000A1A1A100C6C6C6007979
      7900FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8D800CCCC
      CC00404040007070700058585800000000000000000000000000D0B8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A09000B0A0
      9000604830000000000000000000000000000000000000000000B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C009C9C
      9C004343430000000000000000000000000000000000F0A0A000FFC0C000E078
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8
      D000B0483000D0707000A05050000000000000000000A8A8A800C6C6C6008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8
      D8004B4B4B007979790058585800000000000000000000000000D0B8B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A09000604830006048
      3000604830000000000000000000000000000000000000000000B8B8B800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00434343004343
      43004343430000000000000000000000000000000000F0A8A000FFC0C000E080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8
      E000B0503000E0788000A05050000000000000000000ACACAC00C6C6C6008989
      8900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6
      E600505050008484840058585800000000000000000000000000D0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C0006048
      3000DACAC1000000000000000000000000000000000000000000BCBCBC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6C6004343
      4300C8C8C80000000000000000000000000000000000F0B0B000FFC0C000F088
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0
      F000C050400060303000B05850000000000000000000B6B6B600C6C6C6009494
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0
      F00056565600343434005E5E5E00000000000000000000000000E0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000DBCA
      C200000000000000000000000000000000000000000000000000BEBEBE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A80043434300C9C9
      C9000000000000000000000000000000000000000000F0B0B000FFC0C000FF90
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8
      F000C0585000B0586000B05860000000000000000000B6B6B600C6C6C6009B9B
      9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6
      F600606060006363630063636300000000000000000000000000E0C0B000E0C0
      B000E0C0B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000DCCAC2000000
      0000000000000000000000000000000000000000000000000000BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE00C9C9C9000000
      00000000000000000000000000000000000000000000F0B8B000F0B8B000F0B0
      B000F0B0B000F0A8B000F0A0A000E098A000E0909000E0909000E0889000E080
      8000D0788000D0787000D07070000000000000000000BBBBBB00BBBBBB00B6B6
      B600B6B6B600B1B1B100A8A8A800A1A1A1009898980098989800939393008989
      8900838383007E7E7E0079797900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000C001C001C0010000
      DFFDC001C0010000DCFDC001C0010000D87DC001C0010000D01DC001C0010000
      D11DC001C0010000DB8DC001C0010000DFC5C001C0010000DFE1C001C0010000
      D801C001C0010000DBCDC001C0010000DC5DC001C0010000C1C1C001C0010000
      FC1FFFFFFFFF0000FFFFFFFFFFFF0000FFFFE01FE01FFFFF8001E01FE01FC001
      9001E01FE01FC0019B51E01FE01FC0019EA9E010E010C0019F51E01FE01FC001
      A0E9E019E019C001A63DE010E010C001AF05E039E039C001AF01E079E079C001
      A601BFF9BFF9C001A0019FFF9FFFC001BFFD8FF98FF9C00180019FFF9FFFC001
      FFFFBFF9BFF9FC1FFFFFFFFFFFFFFFFFFFFFFF83FF83FFFFFC00FF01FF018001
      80009E009EE0800100000E000EE080010000060046E0800100008200A2E08001
      0001C200DAE080010003E000E40080010007F800F8E880010007F801FB7D8001
      0007F803FB8380010007F807FBF780010007F807FBF78001800FFC0FFDEF8001
      F8FFFE1FFE1FFFFFFFFFFFFFFFFFFFFFFFF1FFF1F800F80080008000F800F800
      8000800000000000800080000000000080018001000000008003800300000000
      800780070000000080078007000000008007800700000000800F800F00000000
      800F800F00070007800F800F00070007801F801F00F800F8803F803F01F801F8
      807F807FFF90FF90FFFFFFFFFF83FF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFC0FFC0FFC0FFC0FFFFFFFFFFFFFFFFFFF0FFF0FFF0FFF0FFFFFFFFFFFFFFFF
      FFF0FFF0FFF0FFF0E1FFE1FFFFFFFFFFE1C0E1C0FFC0FFC0807F807FFFFFFFFF
      8070807080708070807F807F807F807F8070807080708070E1FFE1FF807F807F
      E1C0E1C0FFC0FFC0FFFFFFFFFFFFFFFFFFFFFFFF80018001000F000F00000000
      000F000F00000000000F000F00000000000F000F00000000000F000F00000000
      000F000F00000000000F000F00000000000C000C000000000000000000000000
      00000000000000000000000000000000F800F80000000000FC00FC0000000000
      FE00FE0000000000FFFFFFFF80018001FFFFFFFFFF80FF8080038003FF80FF80
      00010001E180E18000010001E780E78000010001EF80EF8000010001C780C780
      00010001C780C78000010001FFFFFFFF00010001FFFFFFFF8001800101E301E3
      C001C00101E301E3E003E00301F701F7E003E00301E701E7F001F00101870187
      F803F80301FF01FFFFFFFFFF01FF01FFFFFFFFFFFFFFFFFFFE3FFE3FFFFFFFFF
      FC1FFC1FFFFFFFFFC001C001F9FFF9FFC001C001F0FFF0FF80018001E0FFE0FF
      00010001C07FC07F00010001843F843F000100018E1F8E1F000100019F0F9F0F
      80018001FF87FF87C001C001FFC3FFC3C001C001FFE3FFE3C001C001FFF3FFF3
      C001C001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00FFFFFFFFF
      E007E007FFFFFFFFC003C003000F000F80018001000F000F80018001000F000F
      80018001000F000F80018001000F000F80018001000F000F8001800100070007
      80018001000300038001800100010001C003C00300000000E007E00700000000
      F00FF00FFFE0FFE0FFFFFFFFFFF0FFF0FFFFFFFFFF03FF03FC3FFC3FC001C001
      E003E003C001C001E003E003C001C00180038003C001C00180038003C001C001
      80018001C001C00180008000C003C003C000C000C007C007E000E000C007C007
      C000C000C007C00780038003C007C00700030003C007C00700030003C00FC00F
      E007E007C01FC01FE00FE00FFFFFFFFFFFFFFFFFFFFFFFFFC007C007C001C001
      C007C00780018001C007C00780018001C007C00780018001C007C00780018001
      C007C00780018001C007C00780018001C007C00780018001C007C00780018001
      C007C00780018001C007C00780018001C007C00780018001C00FC00F80018001
      C01FC01F80018001FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBEMPRESA'
    UniDirectional = False
    Left = 848
    Top = 128
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 880
    Top = 128
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBFORMPAGTO'
    UniDirectional = False
    Left = 848
    Top = 160
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 880
    Top = 160
  end
  object tblCondicaoPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COND_COD'
        DataType = ftSmallint
      end
      item
        Name = 'COND_DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'COND_PRAZO'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_01'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_02'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_03'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_04'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_05'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_06'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_07'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_08'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_09'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_10'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_11'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_12'
        DataType = ftSmallint
      end
      item
        Name = 'COND_DESCRICAO_FULL'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 177
      end>
    StoreDefs = True
    TableName = 'VW_CONDICAOPAGTO'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 848
    Top = 192
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = tblCondicaoPagto
    Left = 880
    Top = 192
  end
  object cdsPagamentos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.Seq'
      '  , p.Historico'
      '  , p.Data_pagto'
      '  , p.Forma_pagto'
      '  , f.Descri as Forma_pagto_desc'
      '  , p.Valor_baixa'
      '  , p.Numero_cheque'
      '  , p.Banco'
      '  , b.Bco_nome'
      '  , p.Documento_baixa'
      'from TBCONTPAG_BAIXA p'
      '  left join TBFORMPAGTO f on (f.Cod = p.Forma_pagto)'
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    Left = 624
    Top = 104
    object cdsPagamentosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTPAG_BAIXA.ANOLANC'
      Required = True
    end
    object cdsPagamentosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTPAG_BAIXA.NUMLANC'
      Required = True
    end
    object cdsPagamentosSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'TBCONTPAG_BAIXA.SEQ'
      Required = True
      DisplayFormat = '00'
    end
    object cdsPagamentosHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      Origin = 'TBCONTPAG_BAIXA.HISTORICO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPagamentosDATA_PAGTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Pagto.'
      FieldName = 'DATA_PAGTO'
      Origin = 'TBCONTPAG_BAIXA.DATA_PAGTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPagamentosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCONTPAG_BAIXA.FORMA_PAGTO'
    end
    object cdsPagamentosFORMA_PAGTO_DESC: TIBStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'TBFORMPAGTO.DESCRI'
      Size = 30
    end
    object cdsPagamentosVALOR_BAIXA: TIBBCDField
      DisplayLabel = 'Valor Pago (R$)'
      FieldName = 'VALOR_BAIXA'
      Origin = 'TBCONTPAG_BAIXA.VALOR_BAIXA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsPagamentosNUMERO_CHEQUE: TIBStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUMERO_CHEQUE'
      Origin = 'TBCONTPAG_BAIXA.NUMERO_CHEQUE'
      Size = 10
    end
    object cdsPagamentosBANCO: TSmallintField
      FieldName = 'BANCO'
      Origin = 'TBCONTPAG_BAIXA.BANCO'
    end
    object cdsPagamentosBCO_NOME: TIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'BCO_NOME'
      Origin = 'TBBANCO_BOLETO.BCO_NOME'
      Size = 50
    end
    object cdsPagamentosDOCUMENTO_BAIXA: TIBStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCUMENTO_BAIXA'
      Origin = 'TBCONTPAG_BAIXA.DOCUMENTO_BAIXA'
      Size = 10
    end
  end
  object dtsPagamentos: TDataSource
    AutoEdit = False
    DataSet = cdsPagamentos
    Left = 688
    Top = 104
  end
  object dtsTpDespesa: TDataSource
    DataSet = qryTipoDespesa
    Left = 880
    Top = 224
  end
  object FrdRecibo: TfrxDBDataset
    UserName = 'FrdRecibo'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ANOLANC=ANOLANC'
      'NUMLANC=NUMLANC'
      'PARCELA=PARCELA'
      'CODFORN=CODFORN'
      'NOMEEMP=NOMEEMP'
      'NOMEFORN=NOMEFORN'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'NOTFISC=NOTFISC'
      'TIPPAG=TIPPAG'
      'DTEMISS=DTEMISS'
      'DTVENC=DTVENC'
      'DTPAG=DTPAG'
      'VALORPAG=VALORPAG'
      'BANCO=BANCO'
      'BCO_NOME=BCO_NOME'
      'NUMCHQ=NUMCHQ'
      'PAGO_=PAGO_'
      'DOCBAIX=DOCBAIX'
      'QUITADO=QUITADO'
      'CODTPDESP=CODTPDESP'
      'SEQ=SEQ'
      'DATA_PAGTO=DATA_PAGTO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'HISTORICO=HISTORICO'
      'VALOR_BAIXA=VALOR_BAIXA'
      'VALOR_BAIXA_EXTENSO=VALOR_BAIXA_EXTENSO')
    DataSet = CdsRecibo
    BCDToCurrency = True
    Left = 588
    Top = 289
  end
  object FrRecibo: TfrxReport
    Version = '5.1.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Visualizar Recibo (Contas A Pagar)'
    ReportOptions.LastChange = 42215.926201203710000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure BndPageHeaderOnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      
        '  BndPageHeader.Visible      := (<Imprimir_Cabecalho> = 1);     ' +
        '      '
      
        '  frdEmpresaLogo.Visible     := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaRZSOC.Visible    := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaCNPJ.Visible     := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaFone.Visible     := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaEndereco.Visible := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      
        '  frdEmpresaEmail.Visible    := (<Imprimir_Cabecalho> = 1);     ' +
        '                                       '
      '  frdEmpresaLinha.Visible    := (<Imprimir_Cabecalho> = 1);'
      ''
      
        '  frdReciboNumeroRotulo.Visible := (<Imprimir_Cabecalho> = 1);  ' +
        '      '
      
        '  frdReciboNumero.Visible       := (<Imprimir_Cabecalho> = 1);  ' +
        '      '
      '  '
      '  if (<Imprimir_Cabecalho> = 0) then'
      '    BndPageHeader.Height := 1;  '
      ''
      '  BndPageFooter.Visible := (<Imprimir_Cabecalho> = 1);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = FrReciboGetValue
    Left = 560
    Top = 288
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdRecibo
        DataSetName = 'FrdRecibo'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'RECIBO'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end
      item
        Name = 'Cidade'
        Value = 
          'Copy(Trim(Uppercase(<frdEmpresa."CID_NOME">)), 1, 1) + Copy(Trim' +
          '(Lowercase(<frdEmpresa."CID_NOME">)), 2, 50)'
      end
      item
        Name = 'UF'
        Value = 'Trim(Uppercase(<frdEmpresa."EST_SIGLA">))'
      end
      item
        Name = 'Imprimir_Cabecalho'
        Value = '1'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object PgRecibo: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object BndPageHeader: TfrxPageHeader
        FillType = ftBrush
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnAfterCalcHeight = 'BndPageHeaderOnAfterCalcHeight'
        object frdEmpresaLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 7.559059999999999000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559059999999999000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaCNPJ: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8W = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaFone: TfrxMemoView
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8W = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaEndereco: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692949999999990000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8W = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdEmpresaLinha: TfrxLineView
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frdEmpresaEmail: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8W = (
            
              '[frdEmpresa."HOME_PAGE"][IIF(Trim(<frdEmpresa."HOME_PAGE">)='#39#39',<' +
              'frdEmpresa."EMAIL">,IIF(Trim(<frdEmpresa."EMAIL">)='#39#39','#39#39','#39' / '#39'+<' +
              'frdEmpresa."EMAIL">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object frdReciboNumeroRotulo: TfrxMemoView
          Left = 578.268090000000000000
          Top = 7.559059999999999000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Documento Baixa ')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdReciboNumero: TfrxMemoView
          Left = 578.268090000000000000
          Top = 26.456710000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[FrdRecibo."ANOLANC"]/[FormatFloat('#39'00000'#39',<FrdRecibo."NUMLANC">' +
              ')].B[FormatFloat('#39'00'#39',<FrdRecibo."SEQ">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 529.134199999999900000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 15.118119999999980000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' Impresso em [Date] '#224's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        FillType = ftBrush
        Height = 162.519790000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Child = FrRecibo.BndChildAssinatura
        DataSet = FrdRecibo
        DataSetName = 'FrdRecibo'
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 60.472480000000000000
          StretchMode = smMaxHeight
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F7220526963686564323020362E332E393630307D5C766965
            776B696E64345C756331200D0A5C706172645C6669313030305C6C693134305C
            72693138305C73623132305C73613132305C736C3336305C736C6D756C74315C
            716A5C66305C66733230205265636562656D6F73206461205C62205B66726445
            6D70726573612E22525A534F43225D5C623020206120696D706F72745C276532
            6E636961206465205C62205B46726452656369626F2E2256414C4F525F424149
            58415F455854454E534F225D5C623020207265666572656E7465205C27653020
            5C62205B46726452656369626F2E22484953544F5249434F225D202D20284C61
            6E5C276537616D656E746F205B46726452656369626F2E22414E4F4C414E4322
            5D2F5B466F726D6174466C6F617428273030303030272C3C4672645265636962
            6F2E224E554D4C414E43223E295D2E505B466F726D6174466C6F617428273030
            272C3C46726452656369626F2E2250415243454C41223E295D295C6230202E5C
            7061720D0A7D0D0A00}
        end
        object Rich2: TfrxRichView
          Width = 718.110700000000000000
          Height = 102.047310000000000000
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F7220526963686564323020362E332E393630307D5C766965
            776B696E64345C756331200D0A5C706172645C6669313030305C6C693134305C
            72693138305C73623132305C73613132305C736C3336305C736C6D756C74315C
            71635C625C66305C66733332205B546974756C6F5D5C7061720D0A0D0A5C7061
            72645C6669313030305C6C693134305C72693138305C73623132305C73613132
            305C736C3336305C736C6D756C74315C71725C62305C667332342056616C6F72
            3A205C756C5C62205224205B466F726D6174466C6F617428272C302E3030272C
            3C46726452656369626F2E2256414C4F525F4241495841223E295D5C756C6E6F
            6E655C62305C7061720D0A7D0D0A00}
        end
      end
      object BndChildAssinatura: TfrxChild
        FillType = ftBrush
        Height = 105.826840000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Left = 79.370130000000000000
          Top = 86.929190000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            
              ' [IIF(<FrdRecibo."PESSOA_FISICA">=1,'#39'CPF'#39','#39'CNPJ'#39')]: [IIF(<FrdRec' +
              'ibo."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###-##;0;'#39',<FrdRe' +
              'cibo."CNPJ">),FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdRecibo.' +
              '"CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 79.370130000000000000
          Top = 64.252009999999990000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            ' [FrdRecibo."NOMEFORN"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Rich3: TfrxRichView
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F7220526963686564323020362E332E393630307D5C766965
            776B696E64345C756331200D0A5C706172645C6669313030305C6C693134305C
            72693138305C73623132305C73613132305C736C3336305C736C6D756C74315C
            716A5C66305C66733230205B4369646164655D2F5B55465D2C205B466F726D61
            744461746554696D652827646420222064652022206D6D6D6D20222064652022
            2079797979272C203C46726452656369626F2E22444154415F504147544F223E
            295D2E5C7061720D0A7D0D0A00}
        end
      end
    end
  end
  object QryRecibo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.Parcela'
      '  , p.Codforn'
      '  , p.Nomeemp'
      '  , f.Nomeforn'
      '  , f.pessoa_fisica'
      '  , f.Cnpj'
      '  , p.Notfisc'
      '  , p.Tippag'
      '  , p.Dtemiss'
      '  , p.Dtvenc'
      '  , p.Dtpag'
      '  , p.Valorpag'
      '  , p.Banco'
      '  , b.Bco_nome'
      '  , p.Numchq'
      '  , Case when p.Quitado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , p.Docbaix'
      '  , p.Quitado'
      '  , p.Codtpdesp'
      ''
      '  , bx.seq'
      '  , bx.data_pagto'
      '  , bx.forma_pagto'
      '  , fp.descri as forma_pagto_desc'
      '  , bx.historico'
      '  , bx.valor_baixa'
      'from TBCONTPAG p'
      '  inner join TBFORNECEDOR f on (f.Codforn = p.Codforn)'
      
        '  inner join TBCONTPAG_BAIXA bx on (bx.anolanc = p.anolanc and b' +
        'x.numlanc = p.numlanc)'
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)'
      '  left join TBFORMPAGTO fp on (fp.cod = bx.forma_pagto)'
      ''
      'where p.anolanc = :ano'
      '  and p.numlanc = :numero'
      '  and bx.seq    = :baixa')
    Left = 556
    Top = 337
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'baixa'
        ParamType = ptInput
        Value = 0
      end>
  end
  object DspRecibo: TDataSetProvider
    DataSet = QryRecibo
    Left = 588
    Top = 337
  end
  object CdsRecibo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'baixa'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'DspRecibo'
    OnCalcFields = CdsReciboCalcFields
    Left = 620
    Top = 337
    object CdsReciboANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Required = True
    end
    object CdsReciboNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Required = True
    end
    object CdsReciboPARCELA: TSmallintField
      FieldName = 'PARCELA'
    end
    object CdsReciboCODFORN: TSmallintField
      FieldName = 'CODFORN'
    end
    object CdsReciboNOMEEMP: TWideStringField
      FieldName = 'NOMEEMP'
      Size = 40
    end
    object CdsReciboNOMEFORN: TWideStringField
      FieldName = 'NOMEFORN'
      Size = 100
    end
    object CdsReciboPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
    end
    object CdsReciboCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object CdsReciboNOTFISC: TWideStringField
      FieldName = 'NOTFISC'
      Size = 15
    end
    object CdsReciboTIPPAG: TWideStringField
      FieldName = 'TIPPAG'
      Size = 35
    end
    object CdsReciboDTEMISS: TDateField
      FieldName = 'DTEMISS'
    end
    object CdsReciboDTVENC: TDateField
      FieldName = 'DTVENC'
    end
    object CdsReciboDTPAG: TDateField
      FieldName = 'DTPAG'
    end
    object CdsReciboVALORPAG: TBCDField
      FieldName = 'VALORPAG'
      Precision = 18
      Size = 2
    end
    object CdsReciboBANCO: TSmallintField
      FieldName = 'BANCO'
    end
    object CdsReciboBCO_NOME: TWideStringField
      FieldName = 'BCO_NOME'
      Size = 50
    end
    object CdsReciboNUMCHQ: TWideStringField
      FieldName = 'NUMCHQ'
      Size = 10
    end
    object CdsReciboPAGO_: TWideStringField
      FieldName = 'PAGO_'
      FixedChar = True
      Size = 1
    end
    object CdsReciboDOCBAIX: TWideStringField
      FieldName = 'DOCBAIX'
      Size = 15
    end
    object CdsReciboQUITADO: TSmallintField
      FieldName = 'QUITADO'
    end
    object CdsReciboCODTPDESP: TSmallintField
      FieldName = 'CODTPDESP'
    end
    object CdsReciboSEQ: TSmallintField
      FieldName = 'SEQ'
      Required = True
    end
    object CdsReciboDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
    end
    object CdsReciboFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
    end
    object CdsReciboFORMA_PAGTO_DESC: TWideStringField
      FieldName = 'FORMA_PAGTO_DESC'
      Size = 30
    end
    object CdsReciboHISTORICO: TWideMemoField
      FieldName = 'HISTORICO'
      BlobType = ftWideMemo
      Size = 8
    end
    object CdsReciboVALOR_BAIXA: TBCDField
      FieldName = 'VALOR_BAIXA'
      Precision = 18
      Size = 2
    end
    object CdsReciboVALOR_BAIXA_EXTENSO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_BAIXA_EXTENSO'
      Size = 250
    end
  end
  object popImprimir: TPopupMenu
    Images = ImgList
    Left = 696
    Top = 446
    object popGerarRecibo: TMenuItem
      Bitmap.Data = {
        16050000424D160500000000000036040000280000000E0000000E0000000100
        080000000000E000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E0000}
      Caption = 'Gerar Recibo'
      OnClick = popGerarReciboClick
    end
  end
  object ACBrExtenso: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 620
    Top = 289
  end
  object qryTipoDespesa: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select *'
      'from TBTPDESPESA t'
      'where (t.ativo = :ativo) or (:todos = 1)'
      'order by t.tipodesp')
    Left = 848
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ativo'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'todos'
        ParamType = ptInput
        Value = 0
      end>
  end
end
